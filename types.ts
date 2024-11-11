export type currentUserType = {
  firstName: string;
  lastName: string;
  email: string | undefined;
  isUser: boolean;
  isAdmin: boolean;
};

export type ServerError = {
  message: string | undefined;
  status: string | undefined;
  code: string | undefined;
};
