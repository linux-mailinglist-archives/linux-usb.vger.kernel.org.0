Return-Path: <linux-usb+bounces-37316-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOjfM+IOA2pI0AEAu9opvQ
	(envelope-from <linux-usb+bounces-37316-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 13:28:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA8351F54A
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 13:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5C003002909
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 11:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC7047ECDE;
	Tue, 12 May 2026 11:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b="HvZi84cz"
X-Original-To: linux-usb@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012062.outbound.protection.outlook.com [52.101.126.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEAF29E0F8;
	Tue, 12 May 2026 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778585309; cv=fail; b=Rf7EQPCm+2OTIzQRSIVMbhbXEphc+NMQE21J/CfQsx5a6Ez1eZXxDm/1cDFq0In0gXyNb8Isjb4Sa8UESt327v0ru3DgD8CMWNSE1ZrUw3zEwxW6Awcn+yJOoWg4GHFqntgMOz66C27NVdewZy9+SN5v4ZoBIZcSS/61mGHYk/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778585309; c=relaxed/simple;
	bh=GVN7mMhutuP23yxfELBSygF+NwMhgX5ytRNpAkdvU8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UZHpLk5q0Q3j2fraVpK5slJ7hkCSyzXuXbMk+K9KtR2PyLQxjDbKRfwqtQjAvcBCg95Caa1itQeGkvHMpiR8+eSeWKW97I3pnx2op5ZuOWoAXGBqFtahKLjabQEF0wP4JqLm96RUufifJ+XgSsW8Jp3uHZ0Xo+2f7cCVeT4YQko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com; spf=pass smtp.mailfrom=moxa.com; dkim=pass (1024-bit key) header.d=moxa.com header.i=@moxa.com header.b=HvZi84cz; arc=fail smtp.client-ip=52.101.126.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=moxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moxa.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPgFwZDfl91eQvjj2PQMOe4XVwNADUEXbBcae1PtSaBSuoQZ/VSd48Jx+P96VYoKsaBcYu3DiApXKaP40g3XMEJTl5rM7vPtyXVr8U84Nq7gvr7V3RkvOJF3HOSnVYxiR7dtQQgYdgyWrIYwPE3PhliEP91C98w/tZ4Ph4KJsC9xZJiHbMzQzE62wSF2s407ZvneC0r+RP6PoUDG3vNIB9E+duQXzvbCnY1t3JJzqO34hsQo/cEj3gko73ARGwXcsQGMvERUVYWENAv9mxH+YNyz0E7zAVbdpjSxhwDbKWhGykC6f4oaR4qs/yP6vsrt+qjRGjjd/HrgllrBmPK2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWkYA2mNtXiVmYnDFqLcIgjl3uitg9515xtu6S8f4mU=;
 b=ilHdA352HDGIcEtwFKtrcIWXlSOdKSsTFRpkTSxP6jaM5U5o7tSFpMIcGamM9R70tcU2j8iwPZ637X81MaxEwufLVw2CmdK8ehuC6DHLzCEeIVXZ9WKv3GE5Eu7pqhhakNQiE6oAq/HklyYtVM7p3VpPsANXGxP9ZoXnkwtZsLKXAjlkZKAXHHbTYj0NtU6fHGcgUjzC96MPZnnPt4NwW8lOpUHmzWkmjAA0TVgspzCe4GzlfeR6VRiEJIUpFxQ8zdnmMA78T1tbw11/SQl8DU/HlrlD8njo45nQgHjeyOJ+k78onGMOUrN2faQOzd2CG4pNTs+zdIcy4PARpVU8dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=moxa.com; dmarc=pass action=none header.from=moxa.com;
 dkim=pass header.d=moxa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moxa.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWkYA2mNtXiVmYnDFqLcIgjl3uitg9515xtu6S8f4mU=;
 b=HvZi84czr2ZqdExVWTMBBrLO2F+DiX0cyhQSBCFqWxhElHdXm1tfJuRwaGZrzQSSh6qKlZwLk2kU1XxXu0/+iItZmhdDJ0SW1blzLee19mhAuirYDYV1K8XYfzNmbRRe4X53LcbT+89praAHr4eLX3RZUBeomLo5g2wTMAf/G5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=moxa.com;
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14) by KL1PR01MB5922.apcprd01.prod.exchangelabs.com
 (2603:1096:820:11f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 11:28:22 +0000
Received: from PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717]) by PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 ([fe80::ae38:e821:cf7d:3717%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 11:28:22 +0000
Date: Tue, 12 May 2026 19:28:19 +0800
From: Crescent Hsieh <crescentcy.hsieh@moxa.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] usb: serial: mxuport: add sysfs control for UART
 FIFO
Message-ID: <agMO03V9xppAtWjf@moxa-ThinkCentre-M90t>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
 <20260324035041.352190-5-crescentcy.hsieh@moxa.com>
 <afy2yeDTHiVFkPmy@hovoldconsulting.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afy2yeDTHiVFkPmy@hovoldconsulting.com>
X-ClientProxiedBy: TP0P295CA0012.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::16) To PUZPR01MB5405.apcprd01.prod.exchangelabs.com
 (2603:1096:301:115::14)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB5405:EE_|KL1PR01MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f01d9f7-c571-417c-96ca-08deb0199312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	m4N6SZKnOS2BxC88lVVNYfJuUBa8+uHs37pUhR6yuZXAz377B45ftFc/DRbLiA1y01/WgvaQ0J7PGxDASOq+1wgNuHyjFzREBHLGyfC/jMw/Zt20jPfHqO3pseqxqb3uNyf28E84xFwVuelo6pTqMfNDcgDvizveFwUB0muNaUQQVmNAUvVPZ03sklFiNcH4iFwc7wZBGJxa0MQ2djvf5nYQg/BmCXw/zJ8WujdCWn+dRuLbvZe+mna+LG53wotiTIyB8WiA8PrxntCea+JugrgOJ2t39aHRwoEVS7IjY8cMvvXMO8vq0OSuXkkpqzUd0y+ktjMxn9hg69TUxuNr9e18iu9LmZIl2bfMbF7wdpAN5SvbwaGt+w4ia91XvT8HSo5+ozJYWexsBeHyBU76M6+RUx50UEnxKOKtR7ytdsozcVC30lAelCWguyAIWD7ZxQeqzZGRZRPLZPFMw0o1aZ4AcAgQH+aM68I/GlG5Iu+Ow/aHDjEmhvhpSrd70kthj8PtviYonEYH165GXmi4aeBLGNjLkCPEYeYSU+xIg8CSF43WP9/Idoa7BHggkAeYKLzjk5jOFhboocKOtVyOEOoeEidoKjHOFJJivi1rKqzqPpVli+4JF2rmjK3ob461rwgF8tx5G+gGLUV5Z50Pk26Ssa511mi90zGpvnfcnuGtONNja1yaYjBkTHFWnkGjnk1XGHFhPvl95T10gp9TY6wCVfhwL+nQm4uD1aB7zGPU6ha3QhycuwCfPIXDQ8sN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR01MB5405.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xm7yaIfFE4NZ78jSZDhWaU/717hBmYh+sujSyvHPN4JUUNnjP9lTAa0WtgPH?=
 =?us-ascii?Q?mQwczb4O3StALpd4dSRq2OLZGe/yZfJ6HWeXgM2xE9hVfKo2u8crE4CNn/00?=
 =?us-ascii?Q?pDgzDX/6onhTJ8QjFsW4Q4miVaxMfDAbgpAYwg8QGDBAtZgMlTppPspobPQZ?=
 =?us-ascii?Q?faLZbKcVtC0GbOkGvHAKbv4AZQ7drZCiEZ1Z3w8nKU5M5iPGeK7U30axeWhN?=
 =?us-ascii?Q?zkVaRMDWoN9X0KMYO/BJrYNijI7GAmGVO+Bv03slZH/clclhAfbbFc+YQlpt?=
 =?us-ascii?Q?G5c1Gt9yYMZv9pFqigvmomDFgTC2YRSCZED3I9DbXGRkHiq/uHr8MyAmzyL6?=
 =?us-ascii?Q?4hjVMiUNkOxL1nm17HHkKON7pYdYbn/940T37AQlys4xX+6s1GpJh8hCS+XN?=
 =?us-ascii?Q?QEbkkk391GY9McaJAp/5ae3quurSAWLSI1z3PuCWhDcPib5QgLk1yfHFrBpX?=
 =?us-ascii?Q?9ahIH4BECshmXl6DT7Lrz8GhJe3KQriYcpdsG+AEAeOa2mXl1Mk/YBJ2Cm1k?=
 =?us-ascii?Q?Vbacmtf/GHQMw3cg2ziBp0CqNmmdAR5fLc+st0SlLKOes7wQzy7TGmC8xTvi?=
 =?us-ascii?Q?9bGPRKIkIJsx5SodYSgOHebqyMyki2SI9nyw4i3Acb2GtMJQTm+4ji8jGSJe?=
 =?us-ascii?Q?tYDOHjFfqhD98vVlWFhZNYXAs9K+SmvcWAVTRq3B68eJM+lYNrFc9KOP19f7?=
 =?us-ascii?Q?sTvOLCPsyddwPIk5kSr2rVt12uzxqCDjEt8zFMJR/tlbcURdcgD7xJ2Fl0eL?=
 =?us-ascii?Q?Sv0/0G+O02c2eVivXdFQVeSN3ujaO0JubASSslfref2sA3VIG1IMeIEupH9t?=
 =?us-ascii?Q?w1aUN6qTUKaTYYVtd4Sfi89cscvO/DF+WgWMwOQHwnkbQFyOFaw7NrZBQ60n?=
 =?us-ascii?Q?sspHpLKeDyhZanimVVgBmvMimeKLARnMreMdnY91z1p2bVe73vRPsVv13ckq?=
 =?us-ascii?Q?oxhDPn240LbAdyTmYDRjDhZVkDY7YMiUgIMab+K9jABI85VXlIxSpXkifOm0?=
 =?us-ascii?Q?L3wtXa9k66pZnS37Bp+Djzysj6dKSIjOrTi7bCt5kpU2n/xPPkl++qV6Bt9/?=
 =?us-ascii?Q?DW+TrgziCvuP3/6B7w7AIIsZJ0mHCnD8oas1XAVQ7mIGs2PGjxfYzWaRxsXy?=
 =?us-ascii?Q?WVIwxsFdsF0sJao3Drjk9BET5tCM9jBnSgANMOW2EsEYEV0VsDtlcU010XDZ?=
 =?us-ascii?Q?9luppPNlZ/UeE42VguKs5CBrysuz3NmYIorRKNZOb6BkyTp37KRNVGm+BQNw?=
 =?us-ascii?Q?cg6pG5xDZ8vfBDt1txdwEaBBQnYYRdQtQCXFDmnvLRXMEHhTaG0y6xzD2IQU?=
 =?us-ascii?Q?RNzyLIZgwzShODkSOtNfzxZnq0kDH/unFzt3J/5JrNNlD0SKCa3qJCDcowNZ?=
 =?us-ascii?Q?gxxyaH1rbKGGpLg6RR9JmpJpGrCvWYODCULu/fa8033k07esl+oKoQr1fJFI?=
 =?us-ascii?Q?uV/0zOsrh2CSZ+2XE1feEe5Dxl1nNpZ2kf/u0GszBMI6+vilZwsOdwFaH/C4?=
 =?us-ascii?Q?SpaL68c6CqgJq+JViQZxRsYS9u1SbYz71E1JK4/XTqdsw0tKBKLvtRnLb2TZ?=
 =?us-ascii?Q?Mavn0Kh6rrZdfGaEdk2k5J0Js9wUkPjXfIkd+fKGwH+f+TT0cyP9gL/V/3Pc?=
 =?us-ascii?Q?xWtZkUqR25puMNgSnXl2BTSZJVZtDJUwL4OIoxoKTs/hjkt+L5lvOCoEH5f/?=
 =?us-ascii?Q?5FSil4HuWiyPVymKw4Q0HkjnA0iNt7Xc69dbqPr7/X5FXHh/gnz5AaG6Ecnt?=
 =?us-ascii?Q?3yJfFU+VaNSyNVucCI3LIvz9dSfe+LI=3D?=
X-OriginatorOrg: moxa.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f01d9f7-c571-417c-96ca-08deb0199312
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB5405.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 11:28:22.4358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5571c7d4-286b-47f6-9dd5-0aa688773c8e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XaaHM77lEyCsjTiEfAmmafamrmwxrg0xund0DK3H+SgMUhZsdwW32j7MTC4UhddncVdwivPi4gVJnh9ZmzVJXPyP45XS8lxHDUtFek3uqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB5922
X-Rspamd-Queue-Id: DBA8351F54A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[moxa.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[moxa.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[moxa.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37316-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[crescentcy.hsieh@moxa.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 05:59:05PM +0200, Johan Hovold wrote:
> On Tue, Mar 24, 2026 at 11:50:41AM +0800, Crescent Hsieh wrote:
> > Add a per-port sysfs attribute, uart_fifo, to allow userspace to enable
> > or disable the UART FIFO at runtime.
> 
> Why would you want to do that?
> 
> We should try to avoid driver specific sysfs knobs.

The motivation is to allow userspace to choose between lower latency and
higher throughput at runtime. Some latency-sensitive request/response
deployments become unreliable if the UART FIFO is enabled due to the
added buffering delay.

I understand the concern about driver-specific sysfs knobs. UART FIFO
enable/disable seems more like a common UART capability than a
device-unique behaviour.

If a driver-specific sysfs attribute is not the right approach here, do
you have a suggestion for a better interface?

---
Sincerely,
Crescent Hsieh

