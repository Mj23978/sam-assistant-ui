
enum MessageType {
  image,
  text,
  voice,
  custom
}

enum TypeWriterStatus { typing, typed }

enum MessageStatus { read, delivered, undelivered, pending }

enum ChatViewState { hasMessages, noData, loading, error }

enum ShowReceiptsIn { all, lastMessage }

extension ChatViewStateExtension on ChatViewState {
  bool get hasMessages => this == ChatViewState.hasMessages;

  bool get isLoading => this == ChatViewState.loading;

  bool get isError => this == ChatViewState.error;

  bool get noMessages => this == ChatViewState.noData;
}
