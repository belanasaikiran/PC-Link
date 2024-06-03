#include <iostream>
#include <boost/asio.hpp>

using namespace boost::asio;
using ip::tcp;

class MyAPI {
public:
    MyAPI(io_service& io_service, int port)
        : acceptor_(io_service, tcp::endpoint(tcp::v4(), port))
    {
        startAccept();
    }

private:
    void startAccept() {
        tcp::socket socket(acceptor_.get_io_service());
        acceptor_.async_accept(socket, [this](boost::system::error_code ec) {
            if (!ec) {
                handleRequest(std::move(socket));
            }
            startAccept();
        });
    }

    void handleRequest(tcp::socket socket) {
        boost::system::error_code ec;
        char data[1024];
        size_t length = socket.read_some(buffer(data), ec);
        if (!ec) {
            std::string request(data, length);
            std::string response = processRequest(request);
            boost::asio::write(socket, buffer(response));
        }
    }

    std::string processRequest(const std::string& request) {
        // Process the request and generate a response
        return "Hello from MyAPI!";
    }

    tcp::acceptor acceptor_;
};

int main() {
    try {
        boost::asio::io_service io_service;
        MyAPI api(io_service, 8080);
        io_service.run();
    }
    catch (std::exception& e) {
        std::cerr << "Exception: " << e.what() << std::endl;
    }

    return 0;
}