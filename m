Return-Path: <linux-usb+bounces-33156-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCBRBoMRhmk1JgQAu9opvQ
	(envelope-from <linux-usb+bounces-33156-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 17:06:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E19D10005F
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 17:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE99730602D0
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 16:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61302D0C79;
	Fri,  6 Feb 2026 16:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HEuvmlOu"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78862D063A;
	Fri,  6 Feb 2026 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770393834; cv=fail; b=ksvJWnyKKEHE4dMcBYoDgUcODp87i/vuGq0Tz6k71xxlKsMEKZB8dJ9OdfZoo+t5hI7cJzAiFYT1NH5Yi1JBgnTre5WagkI7w7MLiFww8oki45jh2lp8hzW0Vh/wMu4JjrVwvwt5J0bKZxgOR584FX+B07kFYBJlEnSXeYlem0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770393834; c=relaxed/simple;
	bh=ybY0IztSJjczM6GICuGxLjyljoy86uJCcdwY8z1CyCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tORVU2GjAmeuSEIb6fZtooneh8DeEAGEZ+hC3pI+NkFFBxZhXif2/mbvekIx79EHICk4ooTWn1uiGekgvWeXEHgYNAiIRoO63MNNaXZRMK6O7ljYKmKBiBfl3M8wu91sJz+z2gm7ST+Ygfs9n1Hv2Qkkt40vafXKhgPIWkdg7t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HEuvmlOu; arc=fail smtp.client-ip=40.107.159.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b9I28ZH1EDNIdZGDNhgL3yNwE8pBHxxoBpeuAHjPdvgRi+vjqzTGy0D+r28TXuT7yPPGX8PROkdGWkfF76ssn2fJl3RILAW9g3Fl8cZrMER2egoiLjL6MzppZni8H9nFCNUbZZLydoQoHdiuYctQZ7WAh5Vz1Y2IBqp1sOXkFgo7qa7GXjWFxNfLkQEuMiCHzpnxc95EDHTKIftkFwGZULuOrCehWhQ17kjymYKxGkQgm4CPf8jHhOualcCL++e+huxiC9XyQ+NsXQlE7EtX8MB8MedFYaMnSqFyCK3r3YWhE/pabBNJgzfwG1gz4BvVf/Z7SCf7gco4d2OVa1jeQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDgkS4adnBSG7MT8P6kUbnNpehrvFDxwmlBXUb3+Gn0=;
 b=I07S+6X2Z+b0GcCwTHyZjCJBSVYikYX7TQxnp0JLC5dQ2YPHMpQuzq53wU5HMbGHdZ8+pTAVOLfljxzy0yySoyH8Bn3e3Q45jhjtVZnhnJb78OWgFxv0CYrZGwqzFyeZF0/jT8q5LU7cQu4P+22TOGxnY4Op8ZZVFlcTDzim+niTsc5w76l+Yxfr+/4squnAQX5SG//rBWs3miYRuV9v2uY0qNfj9KW35NwBe+jqrKly+T9c0iYZcBWcpKOWKhbxLHNbNYIzlFppk5KiiQ3dMWgZxreuDZwTB4CulTgeF9AkacvUhQtp5TmcJ3VRnjAmFy3Pcpi8q2GJHVr2nKXC9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDgkS4adnBSG7MT8P6kUbnNpehrvFDxwmlBXUb3+Gn0=;
 b=HEuvmlOuLubwcL/vEXBpHgl/ks12XmWfckoegFauBql3ggeVrtt9fXVcna6rOOLxd5YTVhn09ggNaTBC4v+UdbiGkCpjJRvF7C09IMdMR0c/FxEcCPhxLwVvTLTiTgJKWOIvDBEObmt9d9jt6reSFvxH8aGXIyoouCcAIcfQgM3vo95kpSYHJutaCnU8oUMyGBPwoagnxXMv1Y1fv7WwAmEZEvVfyjNVhNpTnsa4SA+M3xGWjOgZ5qJuAf0tT2GO2w7zp2lELQo5RUIzH4/odRVdopr92PdtX85oP7GFpGYEK98H0Ils32/ltVFz2uAnMDP2iDhvvGhcwkdpg0fYHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8055.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 16:03:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 16:03:50 +0000
Date: Fri, 6 Feb 2026 11:03:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Message-ID: <aYYQ3jJ8GVIz4FS0@lizhi-Precision-Tower-5810>
References: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
 <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-3-ebd9b9b77049@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-3-ebd9b9b77049@nxp.com>
X-ClientProxiedBy: SA9PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:806:24::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ef1b52-48c0-4dd9-4833-08de65995128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UsAZLSOjz2mu9YpioBmWFwcxRw9H3g0zW631vA/kWs3pB+WfhgT5A/rdQpmd?=
 =?us-ascii?Q?sAmv578r2YA10V37QZSmMVsSUNwRI+6xD++2n1SOyYX4E3Krewa3ME/qW8X4?=
 =?us-ascii?Q?W4pU9xwwXs0+naLaRYpN4MdTwLMehn4QFwEZuBbz7VgsSgxjIyYHWRkWoO+x?=
 =?us-ascii?Q?C4FsFX9KOA1RRRruG1PVDd+SXoN44WNSmHEq4A0bvTqZsarmda39V4bhy9gA?=
 =?us-ascii?Q?ZBHM1ocshfdgjrdfOJTyRML6gcXJd7ChdtoM4Wc2q0lA3WUvMX5wIMDgGZKn?=
 =?us-ascii?Q?yXnjDTZgaXjxQqklulff2LmMqXGtowOeeR/EhWgXqYlqyu1mm7QtMWnW9dYD?=
 =?us-ascii?Q?tymL9Nlz4f2U6pm/ypGjMnaTuSxiWRZnOGFGljayDREV98UQjTmsuB5F2Uhn?=
 =?us-ascii?Q?g1fQfK1t78Jl0MA2YxSLRj6VtAgPcnafKfk6zLmDgeZ1xGB+QbkuMMEyecj1?=
 =?us-ascii?Q?jnxac+cfwKajdFJMOEm0vLy4BqDb9eGSaRGI1/0hU6tTWxuEzQYYG/iW8ycv?=
 =?us-ascii?Q?cYHeplaUiIrTZnWLTeuuOvkjketuxO4/EgneUmXOBcAfIzfHrYgPASCPaWAc?=
 =?us-ascii?Q?/a6fzL8Ze9U/2MWeAGRxaqQW8iT4xxFdhvev7DaUicUlBeQg5EsIQehjVibo?=
 =?us-ascii?Q?9IBq7tUBOkhIMWW4+e8nHzttDelXipJzkfhATfzdwGfil8OUupBN7PuBwrVN?=
 =?us-ascii?Q?CapPlh23dbTNXHEgU8NqTr4CCee4CSKdH4194vI4Bpu5xtk4PQF8tUzvxy0n?=
 =?us-ascii?Q?ZcwcYeY4IlpjQwEIXcdoq5POK5UdcY1+woBbiWJ5d+3cV11hYDnLmH4hOOVn?=
 =?us-ascii?Q?JrdcFkmc4WfZ+/6cJXzRFUAzI5tspZaiKYwtBTsVin7zEfmtJXbKX3ZOnuu5?=
 =?us-ascii?Q?9G6ZkonePsesNCB6lnmzqFieFzfA9fAX84gMVcE4RIJ6MmQZWtHiZJN6Xm6u?=
 =?us-ascii?Q?C4derkQODd3ihr9rAVPNXeer0X4tYsJEYXa6G/XHUx3C/+JLEhRBLnX76v74?=
 =?us-ascii?Q?CTpvohcAgWNvwqp5+sooycwvKln3fCEAaAOF+ZZ9XnY1dkDmWrw028AsrVqF?=
 =?us-ascii?Q?jzXblN9Ir+G6M2xHV+niz/AW4H8eBg3NL0sNji1q1D/0JAH9bURWcNIovJPd?=
 =?us-ascii?Q?j0xk4mZi9Nuu2TBGIPVvRo/TPPOsLPdyOBCuvOS6VMFlue2laNbUBQSctkGF?=
 =?us-ascii?Q?SvSmp+BIl5rNI/e2kAV4W8wumL8I5e0mZBsr3VOaqsBuLAM65OYi4J8Luf6M?=
 =?us-ascii?Q?P/uXwemCjRdD6CDxUv92ZCPCEsHBxbEhtcygQiq/wScnQdz1l1WPG+s5NWp0?=
 =?us-ascii?Q?Gnov5BDI7/+Yy7Lv09hX9M3wFrrMsGDWJC+nVMR+Z3+MufHlEwWDIXzLsxrq?=
 =?us-ascii?Q?AOJbQ5f8I9oJXHQDq1NnjpTsJrexXNrUIDdQFgWkCpVjhXwP/U4HF8p0Pf2k?=
 =?us-ascii?Q?pTqFKOthAqkNdHbWNKIrcErdnadZcHSahrh0QAMbyGH1w/FALISNOUt8lImF?=
 =?us-ascii?Q?kPFUcf8eSJZ5aeSkxPvN0u8pyp3ujgAePjmzOsKgePaYkMrKuic2XCF9+TXh?=
 =?us-ascii?Q?u/N+qzjRksChScCh3zPULcvIvbjs9qTeTQWHe/KxIeqAXrpL+R6Q36s/Tmhs?=
 =?us-ascii?Q?W0RYUYEjXd3bzGqxRolNA1k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KLDW5r2GeCviC+GJPgafZK9OC6Prb1sFfLosdgIT39girb4YIODILp3BRd6Z?=
 =?us-ascii?Q?gl9i6PF8dJ3rfnVrwtgD0asnMrqW6DzYDEhHKymqv5SZIU60zLf1anJ6UbOk?=
 =?us-ascii?Q?t0MPc9JdNxHxHi722jOGDM1U/ig8WZRBdnArLeEuFZExNAqo0pHfvGBvqplo?=
 =?us-ascii?Q?Vx4HyoXvghG5SjzuUtqJd4E3r7rrgpDbSbwI3y0qVYNEvJMCvXE6QDzezdxg?=
 =?us-ascii?Q?lVfZBghNKZ3FZB8otvJTZlE3rUXaoh1MFoTHTUiJCsZhFphXITEvNcWWEqih?=
 =?us-ascii?Q?YwFt464bqB1EQkaRbwbfv+GE4rYatx9qDTPhWh56yN+jleYrzSKbba0IHRn0?=
 =?us-ascii?Q?MDpWotzejdwlXW8lGfXWI5iWUb6qJdU/MZ/SKCgvMOGHQbSBP7Ssn0SdxDB2?=
 =?us-ascii?Q?RoHnBQNmq+Z2VvM3OdBZkhWJDa1BhkiWU7iLtAZ/MlIPS67sK4rlgFCYL1kK?=
 =?us-ascii?Q?y04/9MWzF+X8sEVS0OlXMZbEOFFga6zwy67Y+1Hj60hAvYaWAvXhy5/9CoRU?=
 =?us-ascii?Q?bHDZwbRo1mD5P3Ud1FV4/XQanhUB4B4cnrXWzwSYTySr4fTrpiGR/QI7YPma?=
 =?us-ascii?Q?N24KwD4JiIF5xrOXx5ar6YeIYsdjaV6kmIP0Ud0S4pvaiLi9ODaaYSxK0tUS?=
 =?us-ascii?Q?DZqFRl0oUrog0XAQrDv43VTHewKB8316x7t+GbWUZNg5EPSKoh+GIXG7OSqj?=
 =?us-ascii?Q?Kts8G4aAa1w4ofFS4DQL5HBmWAQXGpswi+GhE7oSKDlURByosWs2MSbK1cla?=
 =?us-ascii?Q?rPB1okzQbBf3poQWrvuS+HWRxlBly5w0LJwvFcv9PFGWDea9+4r+QElUtvEN?=
 =?us-ascii?Q?2lltGcApwjwntCM27uF8x87rfAvw53Hon77d2V+N+RnJBlnFP6gCRpwmYWtt?=
 =?us-ascii?Q?b1c3EAnNGKmrubd852EMeuL1CZ84jhSfzm83bu9flv3dVe3KuJTN3LPl4Nd8?=
 =?us-ascii?Q?AP1Pg+2AuhvapZmqHz9B0PfOGJckvKzH2UgG9Qpg50Fu/DTzQdOgG5AwuwIw?=
 =?us-ascii?Q?IzsN798kJM7HIlAKU+N8H8+nJJIJurWt0lIoUmHi3oAM+ORNt7Ks7KiNQC9m?=
 =?us-ascii?Q?sMo1GXqlOUp3y4onva1U61GLlKxHOct7+07r0DqdCF41jjk3hUAK4oWd9L6u?=
 =?us-ascii?Q?slNxuZKQZJni2DYmGOMaXydgrbEqOs2fviMxBfeKpN87i2GfSAYuKCMz2UJu?=
 =?us-ascii?Q?9k3upYzdPzm6Nt+t4Dvd7+k/ZVuywVuTOkBqFW+cwGh99V/8hMH0DATxuQHl?=
 =?us-ascii?Q?gAp+fzhPaqwTy76KrAL6wa332AsAkIuK6epMTbYEqNEyMxWsfIHlB4EXm6iW?=
 =?us-ascii?Q?t5YL/UzKxQn+wTg3tRrUzpdLCL8WIu6FzumYctvMWJKaKlbmJlhrcNY3vLP3?=
 =?us-ascii?Q?FXBEWwAtv1IQKqEcgkJN08AS+SxuU5ghy+Wb/82ZEv5OzxAZ6o227h/clmTA?=
 =?us-ascii?Q?oLyAnizngG3kQJZVRtVd6KGgplroaLq9a7fYQxjXlU8Kjhz8kmcGzrSpBsVY?=
 =?us-ascii?Q?+GLe4zyW11IrUxTwTx0/LbeeeGP67UJYypONJwOzV2Cp/PLqx+kBP4c7kWR0?=
 =?us-ascii?Q?mhc0AmPFS+F8TZSsiT3BK6fwV79fUd/Pvky79W+sbSe8Sk2udGNAwSvArc5G?=
 =?us-ascii?Q?eoqh77+2WsqAhhXFH90QraP5ll02PqtT9eIeVW5GZ3vmbZETlaz9HD9wgslT?=
 =?us-ascii?Q?ICT0Mva6OWj/waf5RVbCHDm/ildtEgTt1UaBzkXUM5KEUju6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ef1b52-48c0-4dd9-4833-08de65995128
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:03:50.2532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4QQ9Nw/N0nJWHWNhposTs825jkKVwvGV5e0zt8k8MxEa0JWaZw8nV7jQph7QWQkAN8zhNUwQS1njfBELdFt5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8055
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33156-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[probe_data.properties:url,nxp.com:email,nxp.com:dkim,i.mx:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5E19D10005F
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 06:18:51PM +0800, Xu Yang wrote:
> The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> USB block in a single block will bring more benefits than a parent-
> child relation. To support the flatten model devicetree, DWC3 USB core
> driver already support to directly register and initialize the core in
> glue layer using one device. And many notification can be received in
> glue layer timely and proper actions can be executed accordingly.
>
> To align with mainstream, introduce a new driver to support flatten dwc3
> devicetree model for i.MX Soc. Besides this driver disabling wakeup irq
> when system is active, no other function change in this version compared
> to dwc3-imx8mp.c
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v3:
>  - update compatible as nxp,imx8mp-dwc3
> Changes in v2:
>  - improve commit message
>  - fix code style
>  - add IRQF_NO_AUTOEN
>  - remove pm_runtime_* in dwc3_imx_remove(), dwc3_core_remove()
>    will do that
> ---
>  drivers/usb/dwc3/Kconfig    |  12 ++
>  drivers/usb/dwc3/Makefile   |   1 +
>  drivers/usb/dwc3/dwc3-imx.c | 429 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 442 insertions(+)
>
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 240b15bc52cb..18169727a413 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -150,6 +150,18 @@ config USB_DWC3_IMX8MP
>  	  functionality.
>  	  Say 'Y' or 'M' if you have one such device.
>
> +config USB_DWC3_IMX
> +	tristate "NXP iMX Platform"
> +	depends on OF && COMMON_CLK
> +	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
> +	default USB_DWC3
> +	help
> +	  NXP iMX SoC use DesignWare Core IP for USB2/3
> +	  functionality.
> +	  This driver also handles the wakeup feature outside
> +	  of DesignWare Core.
> +	  Say 'Y' or 'M' if you have one such device.
> +
>  config USB_DWC3_XILINX
>  	tristate "Xilinx Platforms"
>  	depends on (ARCH_ZYNQMP || COMPILE_TEST) && OF
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> index 073bef5309b5..f37971197203 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -55,6 +55,7 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
>  obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
>  obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom-legacy.o
>  obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
> +obj-$(CONFIG_USB_DWC3_IMX)		+= dwc3-imx.o
>  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
>  obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
>  obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
> diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
> new file mode 100644
> index 000000000000..3b154d075bcf
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-imx.c
> @@ -0,0 +1,429 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * dwc3-imx.c - NXP i.MX Soc USB3 Specific Glue layer
> + *
> + * Copyright 2026 NXP
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "core.h"
> +#include "glue.h"
> +
> +/* USB wakeup registers */
> +#define USB_WAKEUP_CTRL			0x00
> +
> +/* Global wakeup interrupt enable, also used to clear interrupt */
> +#define USB_WAKEUP_EN			BIT(31)
> +/* Wakeup from connect or disconnect, only for superspeed */
> +#define USB_WAKEUP_SS_CONN		BIT(5)
> +/* 0 select vbus_valid, 1 select sessvld */
> +#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
> +/* Enable signal for wake up from u3 state */
> +#define USB_WAKEUP_U3_EN		BIT(3)
> +/* Enable signal for wake up from id change */
> +#define USB_WAKEUP_ID_EN		BIT(2)
> +/* Enable signal for wake up from vbus change */
> +#define	USB_WAKEUP_VBUS_EN		BIT(1)
> +/* Enable signal for wake up from dp/dm change */
> +#define USB_WAKEUP_DPDM_EN		BIT(0)
> +
> +#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
> +
> +/* USB glue registers */
> +#define USB_CTRL0		0x00
> +#define USB_CTRL1		0x04
> +
> +#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
> +#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
> +#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
> +
> +#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
> +#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
> +
> +struct dwc3_imx {
> +	struct dwc3	dwc;
> +	struct device	*dev;
> +	void __iomem	*blkctl_base;
> +	void __iomem	*glue_base;
> +	struct clk	*hsio_clk;
> +	struct clk	*suspend_clk;
> +	int		irq;
> +	bool		pm_suspended;
> +	bool		wakeup_pending;
> +};
> +
> +#define to_dwc3_imx(d) container_of((d), struct dwc3_imx, dwc)
> +
> +static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
> +{
> +	struct device	*dev = dwc_imx->dev;
> +	u32		value;
> +
> +	if (!dwc_imx->glue_base)
> +		return;
> +
> +	value = readl(dwc_imx->glue_base + USB_CTRL0);
> +
> +	if (device_property_read_bool(dev, "fsl,permanently-attached"))

can you parse it at probe and save into dwc3_imx to avoid parse dts every
resume()?

Frank
> +		value |= USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED;
> +	else
> +		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
> +
> +	if (device_property_read_bool(dev, "fsl,disable-port-power-control"))
> +		value &= ~USB_CTRL0_PORTPWR_EN;
> +	else
> +		value |= USB_CTRL0_PORTPWR_EN;
> +
> +	writel(value, dwc_imx->glue_base + USB_CTRL0);
> +
> +	value = readl(dwc_imx->glue_base + USB_CTRL1);
> +	if (device_property_read_bool(dev, "fsl,over-current-active-low"))
> +		value |= USB_CTRL1_OC_POLARITY;
> +	else
> +		value &= ~USB_CTRL1_OC_POLARITY;
> +
> +	if (device_property_read_bool(dev, "fsl,power-active-low"))
> +		value |= USB_CTRL1_PWR_POLARITY;
> +	else
> +		value &= ~USB_CTRL1_PWR_POLARITY;
> +
> +	writel(value, dwc_imx->glue_base + USB_CTRL1);
> +}
> +
> +static void dwc3_imx_wakeup_enable(struct dwc3_imx *dwc_imx, pm_message_t msg)
> +{
> +	struct dwc3	*dwc = &dwc_imx->dwc;
> +	u32		val;
> +
> +	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> +
> +	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci) {
> +		val |= USB_WAKEUP_EN | USB_WAKEUP_DPDM_EN;
> +		if (PMSG_IS_AUTO(msg))
> +			val |= USB_WAKEUP_SS_CONN | USB_WAKEUP_U3_EN;
> +	} else {
> +		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
> +		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
> +	}
> +
> +	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> +}
> +
> +static void dwc3_imx_wakeup_disable(struct dwc3_imx *dwc_imx)
> +{
> +	u32	val;
> +
> +	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> +	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
> +	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
> +}
> +
> +static irqreturn_t dwc3_imx_interrupt(int irq, void *data)
> +{
> +	struct dwc3_imx	*dwc_imx = data;
> +	struct dwc3	*dwc = &dwc_imx->dwc;
> +
> +	if (!dwc_imx->pm_suspended)
> +		return IRQ_HANDLED;
> +
> +	disable_irq_nosync(dwc_imx->irq);
> +	dwc_imx->wakeup_pending = true;
> +
> +	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci)
> +		pm_runtime_resume(&dwc->xhci->dev);
> +	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
> +		pm_runtime_get(dwc->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
> +{
> +	if (role == USB_ROLE_HOST)
> +		/*
> +		 * For xhci host, we need disable dwc core auto
> +		 * suspend, because during this auto suspend delay(5s),
> +		 * xhci host RUN_STOP is cleared and wakeup is not
> +		 * enabled, if device is inserted, xhci host can't
> +		 * response the connection.
> +		 */
> +		pm_runtime_dont_use_autosuspend(dwc->dev);
> +	else
> +		pm_runtime_use_autosuspend(dwc->dev);
> +}
> +
> +static struct dwc3_glue_ops dwc3_imx_glue_ops = {
> +	.pre_set_role = dwc3_imx_pre_set_role,
> +};
> +
> +static const struct property_entry dwc3_imx_properties[] = {
> +	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
> +	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
> +	{},
> +};
> +
> +static const struct software_node dwc3_imx_swnode = {
> +	.properties = dwc3_imx_properties,
> +};
> +
> +static int dwc3_imx_probe(struct platform_device *pdev)
> +{
> +	struct device		*dev = &pdev->dev;
> +	struct dwc3_imx		*dwc_imx;
> +	struct dwc3		*dwc;
> +	struct resource		*res;
> +	const char		*irq_name;
> +	struct dwc3_probe_data	probe_data = {};
> +	int			ret, irq;
> +
> +	dwc_imx = devm_kzalloc(dev, sizeof(*dwc_imx), GFP_KERNEL);
> +	if (!dwc_imx)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, dwc_imx);
> +	dwc_imx->dev = dev;
> +
> +	dwc_imx->blkctl_base = devm_platform_ioremap_resource_byname(pdev, "blkctl");
> +	if (IS_ERR(dwc_imx->blkctl_base))
> +		return PTR_ERR(dwc_imx->blkctl_base);
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
> +	if (!res) {
> +		dev_warn(dev, "Base address for glue layer missing\n");
> +	} else {
> +		dwc_imx->glue_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(dwc_imx->glue_base))
> +			return PTR_ERR(dwc_imx->glue_base);
> +	}
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
> +	if (!res)
> +		return dev_err_probe(dev, -ENODEV, "missing core memory resource\n");
> +
> +	dwc_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
> +	if (IS_ERR(dwc_imx->hsio_clk))
> +		return dev_err_probe(dev, PTR_ERR(dwc_imx->hsio_clk),
> +				     "Failed to get hsio clk\n");
> +
> +	dwc_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
> +	if (IS_ERR(dwc_imx->suspend_clk))
> +		return dev_err_probe(dev, PTR_ERR(dwc_imx->suspend_clk),
> +				     "Failed to get suspend clk\n");
> +
> +	irq = platform_get_irq_byname(pdev, "wakeup");
> +	if (irq < 0)
> +		return irq;
> +	dwc_imx->irq = irq;
> +
> +	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", dev_name(dev));
> +	if (!irq_name)
> +		return dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
> +
> +	ret = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx_interrupt,
> +					IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					irq_name, dwc_imx);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to request IRQ #%d\n", irq);
> +
> +	ret = device_add_software_node(dev, &dwc3_imx_swnode);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add software node\n");
> +
> +	dwc = &dwc_imx->dwc;
> +	dwc->dev = dev;
> +	dwc->glue_ops = &dwc3_imx_glue_ops;
> +
> +	probe_data.res = res;
> +	probe_data.dwc = dwc;
> +	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
> +	probe_data.properties.core_may_lose_power = true;
> +
> +	ret = dwc3_core_probe(&probe_data);
> +	if (ret) {
> +		device_remove_software_node(dev);
> +		return ret;
> +	}
> +
> +	device_set_wakeup_capable(dev, true);
> +	return 0;
> +}
> +
> +static void dwc3_imx_remove(struct platform_device *pdev)
> +{
> +	struct device	*dev = &pdev->dev;
> +	struct dwc3	*dwc = dev_get_drvdata(dev);
> +
> +	dwc3_core_remove(dwc);
> +	device_remove_software_node(dev);
> +}
> +
> +static void dwc3_imx_suspend(struct dwc3_imx *dwc_imx, pm_message_t msg)
> +{
> +	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc_imx->dev))
> +		dwc3_imx_wakeup_enable(dwc_imx, msg);
> +
> +	enable_irq(dwc_imx->irq);
> +	dwc_imx->pm_suspended = true;
> +}
> +
> +static void dwc3_imx_resume(struct dwc3_imx *dwc_imx, pm_message_t msg)
> +{
> +	struct dwc3	*dwc = &dwc_imx->dwc;
> +
> +	dwc_imx->pm_suspended = false;
> +	if (!dwc_imx->wakeup_pending)
> +		disable_irq_nosync(dwc_imx->irq);
> +
> +	dwc3_imx_wakeup_disable(dwc_imx);
> +
> +	/* Upon power loss any previous configuration is lost, restore it */
> +	dwc3_imx_configure_glue(dwc_imx);
> +
> +	if (dwc_imx->wakeup_pending) {
> +		dwc_imx->wakeup_pending = false;
> +		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
> +			pm_runtime_put_autosuspend(dwc->dev);
> +		else
> +			/*
> +			 * Add wait for xhci switch from suspend
> +			 * clock to normal clock to detect connection.
> +			 */
> +			usleep_range(9000, 10000);
> +	}
> +}
> +
> +static int dwc3_imx_runtime_suspend(struct device *dev)
> +{
> +	struct dwc3	*dwc = dev_get_drvdata(dev);
> +	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
> +	int		ret;
> +
> +	dev_dbg(dev, "at %s\n", __func__);
> +
> +	ret = dwc3_runtime_suspend(dwc);
> +	if (ret)
> +		return ret;
> +
> +	dwc3_imx_suspend(dwc_imx, PMSG_AUTO_SUSPEND);
> +	return 0;
> +}
> +
> +static int dwc3_imx_runtime_resume(struct device *dev)
> +{
> +	struct dwc3	*dwc = dev_get_drvdata(dev);
> +	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
> +
> +	dev_dbg(dev, "at %s\n", __func__);
> +
> +	dwc3_imx_resume(dwc_imx, PMSG_AUTO_RESUME);
> +	return dwc3_runtime_resume(dwc);
> +}
> +
> +static int dwc3_imx_runtime_idle(struct device *dev)
> +{
> +	return dwc3_runtime_idle(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_imx_pm_suspend(struct device *dev)
> +{
> +	struct dwc3	*dwc = dev_get_drvdata(dev);
> +	struct dwc3_imx *dwc_imx = to_dwc3_imx(dwc);
> +	int		ret;
> +
> +	dev_dbg(dev, "at %s\n", __func__);
> +
> +	ret = dwc3_pm_suspend(dwc);
> +	if (ret)
> +		return ret;
> +
> +	dwc3_imx_suspend(dwc_imx, PMSG_SUSPEND);
> +
> +	if (device_may_wakeup(dev)) {
> +		enable_irq_wake(dwc_imx->irq);
> +		device_set_out_band_wakeup(dev);
> +	} else {
> +		clk_disable_unprepare(dwc_imx->suspend_clk);
> +	}
> +
> +	clk_disable_unprepare(dwc_imx->hsio_clk);
> +
> +	return 0;
> +}
> +
> +static int dwc3_imx_pm_resume(struct device *dev)
> +{
> +	struct dwc3	*dwc = dev_get_drvdata(dev);
> +	struct dwc3_imx *dwc_imx = to_dwc3_imx(dwc);
> +	int		ret;
> +
> +	dev_dbg(dev, "at %s\n", __func__);
> +
> +	if (device_may_wakeup(dwc_imx->dev)) {
> +		disable_irq_wake(dwc_imx->irq);
> +	} else {
> +		ret = clk_prepare_enable(dwc_imx->suspend_clk);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = clk_prepare_enable(dwc_imx->hsio_clk);
> +	if (ret) {
> +		clk_disable_unprepare(dwc_imx->suspend_clk);
> +		return ret;
> +	}
> +
> +	dwc3_imx_resume(dwc_imx, PMSG_RESUME);
> +
> +	ret = dwc3_pm_resume(dwc);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void dwc3_imx_complete(struct device *dev)
> +{
> +	dwc3_pm_complete(dev_get_drvdata(dev));
> +}
> +
> +static int dwc3_imx_prepare(struct device *dev)
> +{
> +	return dwc3_pm_prepare(dev_get_drvdata(dev));
> +}
> +
> +static const struct dev_pm_ops dwc3_imx_dev_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(dwc3_imx_pm_suspend, dwc3_imx_pm_resume)
> +	RUNTIME_PM_OPS(dwc3_imx_runtime_suspend, dwc3_imx_runtime_resume,
> +		       dwc3_imx_runtime_idle)
> +	.complete = pm_sleep_ptr(dwc3_imx_complete),
> +	.prepare = pm_sleep_ptr(dwc3_imx_prepare),
> +};
> +
> +static const struct of_device_id dwc3_imx_of_match[] = {
> +	{ .compatible = "nxp,imx8mp-dwc3", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, dwc3_imx_of_match);
> +
> +static struct platform_driver dwc3_imx_driver = {
> +	.probe		= dwc3_imx_probe,
> +	.remove		= dwc3_imx_remove,
> +	.driver		= {
> +		.name	= "imx-dwc3",
> +		.pm	= pm_ptr(&dwc3_imx_dev_pm_ops),
> +		.of_match_table	= dwc3_imx_of_match,
> +	},
> +};
> +
> +module_platform_driver(dwc3_imx_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("DesignWare USB3 i.MX Glue Layer");
>
> --
> 2.34.1
>

