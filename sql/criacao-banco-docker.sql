USE [master]

DECLARE @SQL_TEXT VARCHAR(MAX) = ''

IF DB_ID('NerdStoreEnterpriseDB') IS NULL
BEGIN 
	SELECT @SQL_TEXT = 'CREATE DATABASE NerdStoreEnterpriseDB'
	EXECUTE(@SQL_TEXT)

	SELECT @SQL_TEXT = '
	USE NerdStoreEnterpriseDB
	/****** Object:  Sequence [dbo].[MinhaSequencia]    Script Date: 29-08-20 19:09:54 ******/
	CREATE SEQUENCE [dbo].[MinhaSequencia] 
	 AS [int]
	 START WITH 1000
	 INCREMENT BY 1
	 MINVALUE -2147483648
	 MAXVALUE 2147483647
	 CACHE 

	/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29-08-20 19:09:54 ******/
	SET ANSI_NULLS ON
	SET QUOTED_IDENTIFIER ON

	CREATE TABLE [dbo].[__EFMigrationsHistory](
		[MigrationId] [nvarchar](150) NOT NULL,
		[ProductVersion] [nvarchar](32) NOT NULL,
	 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
	(
		[MigrationId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]


	/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 29-08-20 19:09:54 ******/
	SET ANSI_NULLS ON

	SET QUOTED_IDENTIFIER ON

	CREATE TABLE [dbo].[AspNetRoleClaims](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[RoleId] [nvarchar](450) NOT NULL,
		[ClaimType] [nvarchar](max) NULL,
		[ClaimValue] [nvarchar](max) NULL,
	 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

	/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 29-08-20 19:09:54 ******/
	SET ANSI_NULLS ON

	SET QUOTED_IDENTIFIER ON

	CREATE TABLE [dbo].[AspNetRoles](
		[Id] [nvarchar](450) NOT NULL,
		[Name] [nvarchar](256) NULL,
		[NormalizedName] [nvarchar](256) NULL,
		[ConcurrencyStamp] [nvarchar](max) NULL,
	 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	
	/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 29-08-20 19:09:54 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[AspNetUserClaims](
		[Id] [int] IDENTITY(1,1) NOT NULL,
		[UserId] [nvarchar](450) NOT NULL,
		[ClaimType] [nvarchar](max) NULL,
		[ClaimValue] [nvarchar](max) NULL,
	 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	
	/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 29-08-20 19:09:54 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[AspNetUserLogins](
		[LoginProvider] [nvarchar](128) NOT NULL,
		[ProviderKey] [nvarchar](128) NOT NULL,
		[ProviderDisplayName] [nvarchar](max) NULL,
		[UserId] [nvarchar](450) NOT NULL,
	 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
	(
		[LoginProvider] ASC,
		[ProviderKey] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	
	/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 29-08-20 19:09:54 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[AspNetUserRoles](
		[UserId] [nvarchar](450) NOT NULL,
		[RoleId] [nvarchar](450) NOT NULL,
	 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
	(
		[UserId] ASC,
		[RoleId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 29-08-20 19:09:54 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[AspNetUsers](
		[Id] [nvarchar](450) NOT NULL,
		[UserName] [nvarchar](256) NULL,
		[NormalizedUserName] [nvarchar](256) NULL,
		[Email] [nvarchar](256) NULL,
		[NormalizedEmail] [nvarchar](256) NULL,
		[EmailConfirmed] [bit] NOT NULL,
		[PasswordHash] [nvarchar](max) NULL,
		[SecurityStamp] [nvarchar](max) NULL,
		[ConcurrencyStamp] [nvarchar](max) NULL,
		[PhoneNumber] [nvarchar](max) NULL,
		[PhoneNumberConfirmed] [bit] NOT NULL,
		[TwoFactorEnabled] [bit] NOT NULL,
		[LockoutEnd] [datetimeoffset](7) NULL,
		[LockoutEnabled] [bit] NOT NULL,
		[AccessFailedCount] [int] NOT NULL,
	 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	
	/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[AspNetUserTokens](
		[UserId] [nvarchar](450) NOT NULL,
		[LoginProvider] [nvarchar](128) NOT NULL,
		[Name] [nvarchar](128) NOT NULL,
		[Value] [nvarchar](max) NULL,
	 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
	(
		[UserId] ASC,
		[LoginProvider] ASC,
		[Name] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	
	/****** Object:  Table [dbo].[CarrinhoCliente]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[CarrinhoCliente](
		[Id] [nvarchar](450) NOT NULL,
		[ClienteId] [nvarchar](450) NOT NULL,
		[ValorTotal] [decimal](18, 2) NOT NULL,
		[Desconto] [decimal](18, 2) NOT NULL,
		[VoucherUtilizado] [bit] NOT NULL,
		[VoucherCodi] [varchar](50) NULL,
		[Percentual] [decimal](18, 2) NULL,
		[TipoDesconto] [int] NULL,
		[ValorDesconto] [decimal](18, 2) NULL,
	 CONSTRAINT [PK_CarrinhoCliente] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	/****** Object:  Table [dbo].[CarrinhoItens]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[CarrinhoItens](
		[Id] [nvarchar](450) NOT NULL,
		[ProdutoId] [nvarchar](450) NOT NULL,
		[Nome] [varchar](100) NULL,
		[Quantidade] [int] NOT NULL,
		[Valor] [decimal](18, 2) NOT NULL,
		[Imagem] [varchar](100) NULL,
		[CarrinhoId] [nvarchar](450) NOT NULL,
	 CONSTRAINT [PK_CarrinhoItens] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	/****** Object:  Table [dbo].[Clientes]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[Clientes](
		[Id] [nvarchar](450) NOT NULL,
		[Nome] [varchar](200) NOT NULL,
		[Email] [varchar](254) NULL,
		[Cpf] [varchar](11) NULL,
		[Excluido] [bit] NOT NULL,
	 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	/****** Object:  Table [dbo].[Enderecos]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[Enderecos](
		[Id] [nvarchar](450) NOT NULL,
		[Logradouro] [varchar](200) NOT NULL,
		[Numero] [varchar](50) NOT NULL,
		[Complemento] [varchar](250) NULL,
		[Bairro] [varchar](100) NOT NULL,
		[Cep] [varchar](20) NOT NULL,
		[Cidade] [varchar](100) NOT NULL,
		[Estado] [varchar](50) NOT NULL,
		[ClienteId] [nvarchar](450) NOT NULL,
	 CONSTRAINT [PK_Enderecos] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	/****** Object:  Table [dbo].[Pagamentos]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[Pagamentos](
		[Id] [nvarchar](450) NOT NULL,
		[PedidoId] [nvarchar](450) NOT NULL,
		[TipoPagamento] [int] NOT NULL,
		[Valor] [decimal](18, 2) NOT NULL,
	 CONSTRAINT [PK_Pagamentos] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	/****** Object:  Table [dbo].[PedidoItems]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[PedidoItems](
		[Id] [nvarchar](450) NOT NULL,
		[PedidoId] [nvarchar](450) NOT NULL,
		[ProdutoId] [nvarchar](450) NOT NULL,
		[ProdutoNome] [varchar](250) NOT NULL,
		[Quantidade] [int] NOT NULL,
		[ValorUnitario] [decimal](18, 2) NOT NULL,
		[ProdutoImagem] [varchar](100) NULL,
	 CONSTRAINT [PK_PedidoItems] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	/****** Object:  Table [dbo].[Pedidos]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[Pedidos](
		[Id] [nvarchar](450) NOT NULL,
		[Codi] [int] NOT NULL,
		[ClienteId] [nvarchar](450) NOT NULL,
		[VoucherId] [nvarchar](450) NULL,
		[VoucherUtilizado] [bit] NOT NULL,
		[Desconto] [decimal](18, 2) NOT NULL,
		[ValorTotal] [decimal](18, 2) NOT NULL,
		[DataCadastro] [datetime2](7) NOT NULL,
		[PedidoStatus] [int] NOT NULL,
		[Logradouro] [varchar](100) NULL,
		[Numero] [varchar](100) NULL,
		[Complemento] [varchar](100) NULL,
		[Bairro] [varchar](100) NULL,
		[Cep] [varchar](100) NULL,
		[Cidade] [varchar](100) NULL,
		[Estado] [varchar](100) NULL,
	 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	/****** Object:  Table [dbo].[Produtos]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[Produtos](
		[Id] [nvarchar](450) NOT NULL,
		[Nome] [varchar](250) NOT NULL,
		[Descricao] [varchar](500) NOT NULL,
		[Ativo] [bit] NOT NULL,
		[Valor] [decimal](18, 2) NOT NULL,
		[DataCadastro] [datetime2](7) NOT NULL,
		[Imagem] [varchar](250) NOT NULL,
		[QuantidadeEstoque] [int] NOT NULL,
	 CONSTRAINT [PK_Produtos] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[RefreshTokens](
		[Id] [nvarchar](450) NOT NULL,
		[Username] [nvarchar](max) NULL,
		[Token] [nvarchar](450) NOT NULL,
		[ExpirationDate] [datetime2](7) NOT NULL,
	 CONSTRAINT [PK_RefreshTokens] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	
	/****** Object:  Table [dbo].[SecurityKeys]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[SecurityKeys](
		[Id] [nvarchar](450) NOT NULL,
		[Parameters] [nvarchar](max) NULL,
		[KeyId] [nvarchar](max) NULL,
		[Type] [nvarchar](max) NULL,
		[Alrithm] [nvarchar](max) NULL,
		[CreationDate] [datetime2](7) NOT NULL,
	 CONSTRAINT [PK_SecurityKeys] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	
	/****** Object:  Table [dbo].[Transacoes]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[Transacoes](
		[Id] [nvarchar](450) NOT NULL,
		[CodiAutorizacao] [varchar](100) NULL,
		[BandeiraCartao] [varchar](100) NULL,
		[DataTransacao] [datetime2](7) NULL,
		[ValorTotal] [decimal](18, 2) NOT NULL,
		[CustoTransacao] [decimal](18, 2) NOT NULL,
		[Status] [int] NOT NULL,
		[TID] [varchar](100) NULL,
		[NSU] [varchar](100) NULL,
		[PagamentoId] [nvarchar](450) NOT NULL,
	 CONSTRAINT [PK_Transacoes] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	/****** Object:  Table [dbo].[Vouchers]    Script Date: 29-08-20 19:09:55 ******/
	SET ANSI_NULLS ON
	
	SET QUOTED_IDENTIFIER ON
	
	CREATE TABLE [dbo].[Vouchers](
		[Id] [nvarchar](450) NOT NULL,
		[Codigo] [varchar](100) NOT NULL,
		[Percentual] [decimal](18, 2) NULL,
		[ValorDesconto] [decimal](18, 2) NULL,
		[Quantidade] [int] NOT NULL,
		[TipoDesconto] [int] NOT NULL,
		[DataCriacao] [datetime2](7) NOT NULL,
		[DataUtilizacao] [datetime2](7) NULL,
		[DataValidade] [datetime2](7) NOT NULL,
		[Ativo] [bit] NOT NULL,
		[Utilizado] [bit] NOT NULL,
	 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
	(
		[Id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	
	INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N''20200423030546_Initial'', N''3.1.3'')
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a11c-08eb80a9060b'', N''Camiseta 4 Head'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''4head.webp'', 5)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a12c-08eb80a9060b'', N''Camiseta 4 Head Branca'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Branca 4head.webp'', 5)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a13c-08eb80a9060b'', N''Camiseta Tiltado'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''tiltado.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a14c-08eb80a9060b'', N''Camiseta Tiltado Branca'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Branco Tiltado.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a15c-08eb80a9060b'', N''Camiseta Heisenberg'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Heisenberg.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a16c-08eb80a9060b'', N''Camiseta Kappa'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Kappa.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a17c-08eb80a9060b'', N''Camiseta MacGyver'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''MacGyver.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a18c-08eb80a9060b'', N''Camiseta Maestria'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Maestria.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a19c-08eb80a9060b'', N''Camiseta Code Life Preta'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''camiseta2.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a29c-08eb80a9060b'', N''Camiseta My Yoda'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''My Yoda.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a39c-08eb80a9060b'', N''Camiseta Pato'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Pato.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a41c-08eb80a9060b'', N''Camiseta Xavier School'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Xaviers School.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a42c-08eb80a9060b'', N''Camiseta Yoda'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Yoda.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a49c-08eb80a9060b'', N''Camiseta Quack'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Quack.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a59c-08eb80a9060b'', N''Camiseta Rick And Morty 2'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Rick And Morty Captured.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a69c-08eb80a9060b'', N''Camiseta Rick And Morty'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Rick And Morty.webp'', 5)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a79c-08eb80a9060b'', N''Camiseta Say My Name'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Say My Name.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a89c-08eb80a9060b'', N''Camiseta Support'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''support.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''7d67df76-2d4e-4a47-a99c-08eb80a9060b'', N''Camiseta Try Hard'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''Tryhard.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476421e'', N''Caneca Joker Wanted'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca-joker Wanted.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476422e'', N''Caneca Joker'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca-Joker.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476423e'', N''Caneca Nightmare'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca-Nightmare.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476424e'', N''Caneca Ozob'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca-Ozob.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476425e'', N''Caneca Rick and Morty'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca-Rick and Morty.jpg'', 5)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476426e'', N''Caneca Wonder Woman'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca-Wonder Woman.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476427e'', N''Caneca No Coffee No Code'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca4.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476437e'', N''Caneca Batman'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca1--batman.jpg'', 5)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476447e'', N''Caneca Vegeta'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca1-Vegeta.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476457e'', N''Caneca Batman Preta'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca-Batman.jpg'', 8)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476467e'', N''Caneca Big Bang Theory'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca-bbt.webp'', 0)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476477e'', N''Caneca Cogumelo'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca-cogumelo.webp'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476487e'', N''Caneca Geeks'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca-Geeks.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''78162be3-61c4-4959-89d7-5ebfb476497e'', N''Caneca Ironman'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(50.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca-ironman.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''6ecaaa6b-ad9f-422c-b3bb-6013ec27b4bb'', N''Camiseta Debugar Preta'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(75.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''camiseta4.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''6ecaaa6b-ad9f-422c-b3bb-6013ec27c4bb'', N''Camiseta Code Life Cinza'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(99.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''camiseta3.jpg'', 3)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''52dd696b-0882-4a73-9525-6af55dd416a4'', N''Caneca Star Bugs Coffee'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(20.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca1.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''191ddd3e-acd4-4c3b-ae74-8e473993c5da'', N''Caneca Programmer Code'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(15.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca2.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''fc184e11-014c-4978-aa10-9eb5e1af369b'', N''Camiseta Software Developer'', N''Camiseta 100% aldão, resistente a lavagens e altas temperaturas.'', 1, CAST(100.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''camiseta1.jpg'', 10)
	INSERT [dbo].[Produtos] ([Id], [Nome], [Descricao], [Ativo], [Valor], [DataCadastro], [Imagem], [QuantidadeEstoque]) VALUES (N''20e08cd4-2402-4e76-a3c9-a026185b193d'', N''Caneca Turn Coffee in Code'', N''Caneca de porcelana com impressão térmica de alta resistência.'', 1, CAST(20.00 AS Decimal(18, 2)), CAST(N''2019-07-19T00:00:00.0000000'' AS DateTime2), N''caneca3.jpg'', 10)
	INSERT [dbo].[Vouchers] ([Id], [Codigo], [Percentual], [ValorDesconto], [Quantidade], [TipoDesconto], [DataCriacao], [DataUtilizacao], [DataValidade], [Ativo], [Utilizado]) VALUES (N''acffa74e-52a4-4567-a878-72921534d325'', N''150-OFF-GERAL'', NULL, CAST(150.00 AS Decimal(18, 2)), 48, 1, CAST(N''2020-06-12T00:00:00.0000000'' AS DateTime2), NULL, CAST(N''2022-01-01T00:00:00.0000000'' AS DateTime2), 1, 0)
	INSERT [dbo].[Vouchers] ([Id], [Codigo], [Percentual], [ValorDesconto], [Quantidade], [TipoDesconto], [DataCriacao], [DataUtilizacao], [DataValidade], [Ativo], [Utilizado]) VALUES (N''acffa74e-52a4-4567-a878-72921534d327'', N''50-OFF-GERAL'', CAST(50.00 AS Decimal(18, 2)), NULL, 40, 0, CAST(N''2020-06-12T00:00:00.0000000'' AS DateTime2), NULL, CAST(N''2022-01-01T00:00:00.0000000'' AS DateTime2), 1, 0)
	INSERT [dbo].[Vouchers] ([Id], [Codigo], [Percentual], [ValorDesconto], [Quantidade], [TipoDesconto], [DataCriacao], [DataUtilizacao], [DataValidade], [Ativo], [Utilizado]) VALUES (N''acffa74e-52a4-4567-a878-72921534d328'', N''10-OFF-GERAL'', CAST(10.00 AS Decimal(18, 2)), NULL, 42, 0, CAST(N''2020-06-12T00:00:00.0000000'' AS DateTime2), NULL, CAST(N''2022-01-01T00:00:00.0000000'' AS DateTime2), 1, 0)
	SET ANSI_PADDING ON
	
	/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 29-08-20 19:09:55 ******/
	CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
	(
		[RoleId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	SET ANSI_PADDING ON
	
	/****** Object:  Index [RoleNameIndex]    Script Date: 29-08-20 19:09:55 ******/
	CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
	(
		[NormalizedName] ASC
	)
	WHERE ([NormalizedName] IS NOT NULL)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	SET ANSI_PADDING ON
	
	/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 29-08-20 19:09:55 ******/
	CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
	(
		[UserId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	SET ANSI_PADDING ON
	
	/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 29-08-20 19:09:55 ******/
	CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
	(
		[UserId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	SET ANSI_PADDING ON
	
	/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 29-08-20 19:09:55 ******/
	CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
	(
		[RoleId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	SET ANSI_PADDING ON
	
	/****** Object:  Index [EmailIndex]    Script Date: 29-08-20 19:09:55 ******/
	CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
	(
		[NormalizedEmail] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	SET ANSI_PADDING ON
	
	/****** Object:  Index [UserNameIndex]    Script Date: 29-08-20 19:09:55 ******/
	CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
	(
		[NormalizedUserName] ASC
	)
	WHERE ([NormalizedUserName] IS NOT NULL)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	/****** Object:  Index [IDX_Cliente]    Script Date: 29-08-20 19:09:55 ******/
	CREATE NONCLUSTERED INDEX [IDX_Cliente] ON [dbo].[CarrinhoCliente]
	(
		[ClienteId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	/****** Object:  Index [IX_CarrinhoItens_CarrinhoId]    Script Date: 29-08-20 19:09:55 ******/
	CREATE NONCLUSTERED INDEX [IX_CarrinhoItens_CarrinhoId] ON [dbo].[CarrinhoItens]
	(
		[CarrinhoId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	/****** Object:  Index [IX_Enderecos_ClienteId]    Script Date: 29-08-20 19:09:55 ******/
	CREATE UNIQUE NONCLUSTERED INDEX [IX_Enderecos_ClienteId] ON [dbo].[Enderecos]
	(
		[ClienteId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	/****** Object:  Index [IX_PedidoItems_PedidoId]    Script Date: 29-08-20 19:09:55 ******/
	CREATE NONCLUSTERED INDEX [IX_PedidoItems_PedidoId] ON [dbo].[PedidoItems]
	(
		[PedidoId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	/****** Object:  Index [IX_Pedidos_VoucherId]    Script Date: 29-08-20 19:09:55 ******/
	CREATE NONCLUSTERED INDEX [IX_Pedidos_VoucherId] ON [dbo].[Pedidos]
	(
		[VoucherId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	/****** Object:  Index [IX_Transacoes_PagamentoId]    Script Date: 29-08-20 19:09:55 ******/
	CREATE NONCLUSTERED INDEX [IX_Transacoes_PagamentoId] ON [dbo].[Transacoes]
	(
		[PagamentoId] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	
	ALTER TABLE [dbo].[CarrinhoCliente] ADD  DEFAULT ((0.0)) FOR [Desconto]
	
	ALTER TABLE [dbo].[CarrinhoCliente] ADD  DEFAULT (CONVERT([bit],(0))) FOR [VoucherUtilizado]
	
	ALTER TABLE [dbo].[Pedidos] ADD  DEFAULT (NEXT VALUE FOR [MinhaSequencia]) FOR [Codi]
	
	ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
	REFERENCES [dbo].[AspNetRoles] ([Id])
	ON DELETE CASCADE
	
	ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
	
	ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
	REFERENCES [dbo].[AspNetUsers] ([Id])
	ON DELETE CASCADE
	
	ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
	
	ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
	REFERENCES [dbo].[AspNetUsers] ([Id])
	ON DELETE CASCADE
	
	ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
	
	ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
	REFERENCES [dbo].[AspNetRoles] ([Id])
	ON DELETE CASCADE
	
	ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
	
	ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
	REFERENCES [dbo].[AspNetUsers] ([Id])
	ON DELETE CASCADE
	
	ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
	
	ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
	REFERENCES [dbo].[AspNetUsers] ([Id])
	ON DELETE CASCADE
	
	ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
	
	ALTER TABLE [dbo].[CarrinhoItens]  WITH CHECK ADD  CONSTRAINT [FK_CarrinhoItens_CarrinhoCliente_CarrinhoId] FOREIGN KEY([CarrinhoId])
	REFERENCES [dbo].[CarrinhoCliente] ([Id])
	ON DELETE CASCADE
	
	ALTER TABLE [dbo].[CarrinhoItens] CHECK CONSTRAINT [FK_CarrinhoItens_CarrinhoCliente_CarrinhoId]
	
	ALTER TABLE [dbo].[Enderecos]  WITH CHECK ADD  CONSTRAINT [FK_Enderecos_Clientes_ClienteId] FOREIGN KEY([ClienteId])
	REFERENCES [dbo].[Clientes] ([Id])
	
	ALTER TABLE [dbo].[Enderecos] CHECK CONSTRAINT [FK_Enderecos_Clientes_ClienteId]
	
	ALTER TABLE [dbo].[PedidoItems]  WITH CHECK ADD  CONSTRAINT [FK_PedidoItems_Pedidos_PedidoId] FOREIGN KEY([PedidoId])
	REFERENCES [dbo].[Pedidos] ([Id])
	
	ALTER TABLE [dbo].[PedidoItems] CHECK CONSTRAINT [FK_PedidoItems_Pedidos_PedidoId]
	
	ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Vouchers_VoucherId] FOREIGN KEY([VoucherId])
	REFERENCES [dbo].[Vouchers] ([Id])
	
	ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Vouchers_VoucherId]
	
	ALTER TABLE [dbo].[Transacoes]  WITH CHECK ADD  CONSTRAINT [FK_Transacoes_Pagamentos_PagamentoId] FOREIGN KEY([PagamentoId])
	REFERENCES [dbo].[Pagamentos] ([Id])
	
	ALTER TABLE [dbo].[Transacoes] CHECK CONSTRAINT [FK_Transacoes_Pagamentos_PagamentoId]'
	
	EXECUTE(@SQL_TEXT)

	USE [master]
	
	SELECT @SQL_TEXT = 'ALTER DATABASE [NerdStoreEnterpriseDB] SET  READ_WRITE' 
	EXECUTE(@SQL_TEXT)
END