Return-Path: <linux-usb+bounces-33326-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFcPOomrjWkK5wAAu9opvQ
	(envelope-from <linux-usb+bounces-33326-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 11:29:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1D312C7F5
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 11:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1023530D84DD
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 10:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F042E88B0;
	Thu, 12 Feb 2026 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kGUa0h3g"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172A020298D;
	Thu, 12 Feb 2026 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770892096; cv=fail; b=fMO12BhmOuDzD+Jn++0d6Ed4P/KrGQC1EWDDj/lGX0EeJVc/2A8WwlF5EglCDu8UqDI/koScP0nSEWCAQH1KxXtxvQpbCHJgk1VWzH1hhXLjsR+culIAkNjis2gW65pQ+uvFrLP6Pzez23nIOcrvTNWaMertncAaoF2BV6wSWz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770892096; c=relaxed/simple;
	bh=7LrI8WNPr5AhFbIJ1TkWBdlNbgjk9fHwqrIUXds4nYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HUdf/cFK7G06jaxEeHehYYLrbhTvZ3FkxBc7S2i06JTbvAZC5293cVBg7iMfviqjZkClXssWYZ/7N5VCbmvncTmOobLFRstNKKKJOLTf19hP3w7MpJzHHqsKl0jGnmcsOvn0PYlEQ2F23djJtm0BM2mh9PhE+ZArO6mcoubMP3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kGUa0h3g; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cr7KvnhmMbMw7e20kt7PCOXBdg9Gm17LURf1SFd1Ljdp7f56pXVqc8KDNwXSarMi1eh4FQgySrIYyznYyBBeFD6ZgD06+V7UKRjdU8AxfZawMUhBiczR1pjh+G6xn+V2c4L7OsENVPRMHnGxO5wNrwIgtmzSLJxH2+JTARJnGnNsQbKnQ1xDF8YsyzNaHrdvIBiB9NI/zUW2ZXtS/pwgPJD/cv/SAv2GHjNJy/T87um+ckGFypuWYdrDpZfe0iZvtlNNX455FNDJnklJIHEv7sNeHIbgiAWoFcMUQx/Gb0/dqECH78MXffkjS689eo44/YgazyzpY+2Jaqv5nQV6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ekn2Qoq8DRtzBcIZxTOHPgDSmsOc92hWZsrlwbS63pM=;
 b=NfjzcpZfjlhWQ/5MY0XGM+lYSJnjpgD16ZjewSr9djxXxx+P6XgAWmaBZH3MMnuD2kloK0IlTykHYR4Z6Pp7Mf2qBvWtZaBh1N6ruRQEowt38ctrH8bz6bD7YyrmMSsT+K4aEhyRyNFQuSHMDnY5q6D0CzjVLddmPtcO91MzZXJWj2207424DV/Dohps74W8cOLAD4m2W+vOu2POccGmAuFk2w+r+eTW/2xlDdHBeSC4SxICxhkDBt9Uw+5hCVK9WoQFMjuhjCKNTmNux0Llxr45JkdrxkIp5hrbczUSuzj6ZRl/Cfrf0lnFzOFo+lJk/F6tNjvHYfV6lSDLOLzcBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ekn2Qoq8DRtzBcIZxTOHPgDSmsOc92hWZsrlwbS63pM=;
 b=kGUa0h3geI/GBAtEhSFdUFHCMTuPjBMNYiQev9NlQk+aTblLJQw1YnMy2eXKgnhQw9xm02as5FGd6y34HusFz9BObLCHyFpewACu+lbVnZcZRX9LaACCAnaAC4fvIOeBdpOxxhzvk8+VmfwVz8N52JdcZkCUTwgHsc1o35pTfYaMYUYLZTPmq5uXM6MGBGZfYTtjB22LUCxKYzc1KSOvE+R9GhsYbEXWpUNWLXR1qPrCgWYruzGglTG7Dg+KEj9/++rLrTbhVwfkned11m/5p/QO3nuVnWGnd/JQbqKXhD5G3xJXGD/JUH/ioUldXgQT+Tu8TvzcqdCqAUWc8oPJTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by MRWPR04MB12257.eurprd04.prod.outlook.com (2603:10a6:501:81::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 12 Feb
 2026 10:28:12 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 10:28:12 +0000
Date: Thu, 12 Feb 2026 18:20:40 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, m.grzeschik@pengutronix.de, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	jun.li@nxp.com
Subject: Re: [PATCH] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <skn2mqgvxcc36rctjrcbmh6hp6g467ktdpjpus53stnmcatikx@5icjdgjgptku>
References: <20260211103628.3265850-1-xu.yang_2@nxp.com>
 <1be3ca8a-032d-487e-92f4-67b2070be213@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1be3ca8a-032d-487e-92f4-67b2070be213@rowland.harvard.edu>
X-ClientProxiedBy: SG2PR06CA0209.apcprd06.prod.outlook.com
 (2603:1096:4:68::17) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|MRWPR04MB12257:EE_
X-MS-Office365-Filtering-Correlation-Id: d9eb3c10-c94f-4d5c-4cc2-08de6a216c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?arrYJjkYqwyWRTlrfFsrjAWBVzUI5KxU2dPm8cb2aiOc6Fj8ObpQb5/9sOrg?=
 =?us-ascii?Q?iBE1DcEWL+lfIGfukhdKyqD2f0WAvk6T6zKmy9Fy7+hQudxaIN91GhUP97VW?=
 =?us-ascii?Q?81kIy2J5yO18h8lIw5jV0meFHCVjWk988EqsmGqUck49ofXS2fkg6jJQh/n9?=
 =?us-ascii?Q?9fyJ/cAJXLDaCAiFgoyWLoB3i1FLD/DD85ZKDkAxXhoGrCw6XqZkqnQzc8bq?=
 =?us-ascii?Q?4LYC24FDh1nMTP+TKHyjtO0SQWzu9sWztI6HgXtRIvvgoyuD8QeKe1fss8OJ?=
 =?us-ascii?Q?BCsNZCIu/AivJ3PhJlje2eghGgPxGMOoMzDNMXsWtqqq+eflZue+u95nRjJw?=
 =?us-ascii?Q?mccFE1ITZlJQjZcFZeDy/+RKloHk8v6JKjQYQiHQm1xbgQwYAyz7FMR5s6uR?=
 =?us-ascii?Q?y19ji2KXyeTE7NnGxPLnZL5HQXqtttBz5YxK3E2EPMqlC6GjhpL3oAvBDxc0?=
 =?us-ascii?Q?Zn36HjT5s8lFVLzWOpt5RD7aky0Zt8avbvBK13DrOSLB7/eQN0yIksvpok7+?=
 =?us-ascii?Q?9XpAil4IKKfJbGubsfFifLCz6BaaqjrSVxB3qXkgiZ8xuaTKhbq13eYZjCZK?=
 =?us-ascii?Q?kN/yDd0KQc1auFBdXqlg0ashKve1qUpYsWedXcH8xPU1sblcv6FhILKzIMfB?=
 =?us-ascii?Q?5Rt0UDyGw31fD3hSt/1xSjoLJPbwzsLZwCWf9r0DDZ+/8R+Q9H0VQUK95bfz?=
 =?us-ascii?Q?F3bZazmC5GN1k5Zz1w5B2gyGIwAfKgcAO4EiwTlOFSb/y+8MbGL5GMKgYEgc?=
 =?us-ascii?Q?nOybzOXTV5aWBNrLHu0oq7eIhx7pykux6jSDX8puAGTFBioctjqLg5l2OXow?=
 =?us-ascii?Q?NyuTIRuAYzTLm7UkRgw/YSzj1EzKx1C6mx6xkIBRbI//GzV5n4b9amS4W/Iz?=
 =?us-ascii?Q?lP4Csl/sV5lI+DnXrqV8RgPgRELJc4l1P9YJ/6H0AL2Gtz8BYYP9YVge02gg?=
 =?us-ascii?Q?ua7qjpyL0r2ZK6jAesTekmYmYQmdZfxi3tBcQvIcJn6BLtGLK/bCtwc99QoT?=
 =?us-ascii?Q?4u/SJFaTr52cWO7qqnwbkH92McueiBobHPo8oWwHZRp0KAU2X6vcyDTsbviB?=
 =?us-ascii?Q?PPAdNhEc1ApTVrlmJHzElm8THdho8vJ4pw2O2tvCK7tLPwrASSgUoKGbPk8r?=
 =?us-ascii?Q?55PwOQF+G6z0uHpMEg4slQQHoiI8lAHuu/uyHyZ27XcoNyJVl1AAFrTLf6vl?=
 =?us-ascii?Q?r6y+Gglt0Rr7hK4XWGG++kAD1nHjcf5l5/3Y2skQfEyRF+lQ0IOWsdMmINYA?=
 =?us-ascii?Q?1iAefPQnDl6o3otyh9Flkqv2IQfwh/k3l/VixZJ5vz3xXDcKbYIYdPA+/hlW?=
 =?us-ascii?Q?YSV2MhlcQc834JzlFfjxVplapoed49G9KiGeQw4qYF/R3WJQ+i7q0TRxpbID?=
 =?us-ascii?Q?/qKEpR5jkYWSwsKVJ/ca+WFuAamWGeDHeW9SrCPFEYGPkGclwlrB7/Lt9yzR?=
 =?us-ascii?Q?FDdMVFjBzUXqKRbAbVSn6Fe/jvKOBV/T4gqurreG+PhAaK58tX2FyJqTpwrq?=
 =?us-ascii?Q?Q5MhtMUscLLr1WgnuiyUGHvA9FXJKofqu4UEReKCSbuXNhJ4DGovyr/K8P1c?=
 =?us-ascii?Q?a0MZ/JvgXCjo5oTOq1zKJ0sYZUMKUnyH+c72UVQ97YChtP8iqBcYhbo/EGDD?=
 =?us-ascii?Q?eaYauAyTGSZ4EP4qfkHw/mI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AVcgUjn1q4PdzRjCETSTTV1FSpRyTNmRvXfPdRLWQX2auUTVDJ0JdI76DwvE?=
 =?us-ascii?Q?MrliYdo5OK1m+u4vwelVoewwcDP5pNtlwqBDbFmCYI8GSFjGgg5tXOrIMSCl?=
 =?us-ascii?Q?rkQUg6QsJz0T9pdsBUzWktjgWasv83kpzNeMrQtXjxtFf/Lve+39o6HagrdF?=
 =?us-ascii?Q?V59Rp0N0iGjr0GABvWb9CBViYsF+R/5ReV47Ra7Dw4ONeAg+brCf1YLL3Cbn?=
 =?us-ascii?Q?u8daYjy2cBVrqx0lb8M9rEUmgflTr3qBZaQFYDJKla20hdQfKAXcV2jSHz+A?=
 =?us-ascii?Q?iUcVYuoaBXF6s1VrnIwpv0FVmE2gH7xUyEm8ssptauXlPAYRKjsFV8zXITA8?=
 =?us-ascii?Q?mwFUpm/fsM9p6EXji5ED1244rg9IrMUYkqC6wCDkYxK4WDNdwiFSqlLAmFvv?=
 =?us-ascii?Q?oycQGr58R5KOpKmrzuT9mByJLJIfHTUQnMFPj/WLtHuMSdFisHh4HQnn0ZW3?=
 =?us-ascii?Q?PlLNt5SrcXtBGQzZiVZ8ZYIn5ruCs9h+aPQ1wfN4JB+z6w/WZ0d5Ol1QweW9?=
 =?us-ascii?Q?YCSik702QriM3bduUxXawCUITCOBLXW9XxZS5SLss674aiWPL/KS3MEYSF2r?=
 =?us-ascii?Q?N55IMGC04Z9dEhF7Al2qGjYm5Th8xPOOhj0072BDnB3RGi0YjKV2ahiWpBJa?=
 =?us-ascii?Q?mXkIMJBBUh/NVuECmiEJVC48Cg87HSiqou4LyV3tK90lZi1nQ5NtJ3w1wHEp?=
 =?us-ascii?Q?y60Q7cRBiB1nVPZWH4EuHb70Kw4VCOgj685h/fcSlR6C3nQm8TZFAFhugHhM?=
 =?us-ascii?Q?yspBdnbx6NiQkN0qVVEEar8xQpFtWL4VmXs6Uw/4lr6HryrUKV2BdpWjV1fZ?=
 =?us-ascii?Q?csMnuKB7ePQPzvlQI4kRIVVqGP/lakfV9ivFs/ZApbIJDQoj11m2FziFQDsf?=
 =?us-ascii?Q?isvY1R90H1tRNqun+PRxiClRnon49q1zndtHl+ruOewzrTRWpRMWsucJVr4K?=
 =?us-ascii?Q?5Mh9eRGGZ/ID3hhaWC87ctC2PisR2MjEXPWPXKWT2REetS6UDoRPqSDk7caE?=
 =?us-ascii?Q?cveERaRkXLV2Bi5GAclWQpNVFL/o/g6QL5iFWd8yDRoh5xxEVOGsCFYbLwbl?=
 =?us-ascii?Q?LIjuyc8VzS2jQZZ/2IVxH8Tn/eh6qi+YFXvVeyUFKxILmltwrhfyPvwLsF3b?=
 =?us-ascii?Q?+8oDqvxUhiM5IAJg5vHDmvmrM4EhxJ6t4FWTEqduXUU832CZKZprlF07fE79?=
 =?us-ascii?Q?KCPMqyzFN6r1KR0BsT+gbvWGmuhC/twibrUKwnl+As/nGoDq1hfZ98ovrJ1h?=
 =?us-ascii?Q?7nQeNHnA6gaYarbOfeGdf9jsqAjJN9yvqsAAVCaUIRHvHpC+qprATVnoIFMm?=
 =?us-ascii?Q?4UBQXwhKLAda06Uee6ue7gkL8xK9pILFN7Q9rN7jaydBE5VjAThewFq5debr?=
 =?us-ascii?Q?7SLjESmrwbngITlp5koOuRVfeJ5SnyVyfynt35TGYY0kMiWQCt9D9vA3P28/?=
 =?us-ascii?Q?ob4q5H7CByvGY3msSgkjxeZpBuY3twwfIzrYI+MQAKCyXjK84qjFBHe1lSaG?=
 =?us-ascii?Q?oTou7hAdWUHMJlX0Fs9La9RPZogtEuEOimE75uxhMjztWLXQKJ/shfUczMvT?=
 =?us-ascii?Q?FJa6QTrmiEn7PxOYJ/fID1JMIa5+cxcgc66WXlGrxAalqT9zY8CZV+K3PSbz?=
 =?us-ascii?Q?55dQAjqtIk+48TuZAFQx68YP7m0qz057so9w0qzCCScTT0jY91P1G9Sh5r1O?=
 =?us-ascii?Q?lxy4b0Ksg26oWW6WsrnfSZVZmjX0KlpDS5J5Q/QW8YshM2Lf1ENZwmRocre4?=
 =?us-ascii?Q?OojmeLabIQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9eb3c10-c94f-4d5c-4cc2-08de6a216c0e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:28:11.9551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8n7+1aFfWghyIjgDPbIXfQPiYu+r5OpW3FHxY5NBeaomsdeSwJDaC8gY2SQOeTeXlquRI6ackhxxGarNIqVqsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12257
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33326-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6E1D312C7F5
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 10:04:32AM -0500, Alan Stern wrote:
> On Wed, Feb 11, 2026 at 06:36:28PM +0800, Xu Yang wrote:
> > When disable the root hub port, somehow the device is disconnected and
> > re-connected again. This happens because usb_clear_port_feature() does not
> > clear a truly happened port change. That says, in fact, port change event
> > may happen after usb_clear_port_feature() is called. Then the subsequent
> > port change event will have impact on usb device suspend routine.
> 
> This is not a very good description of the problem.  Here's a better 
> one:
> 
> When a port is disabled, an attached device will be disconnected.  This 
> causes a port-status-change event, which will race with hub autosuspend 
> (if the disabled port was the only connected port on its hub), causing 
> an immediate resume and a second autosuspend.  Both of these can be 
> avoided by adding a short delay after the call to 
> usb_hub_set_port_power().

Thank you for providing a better one!

Thanks,
Xu Yang

