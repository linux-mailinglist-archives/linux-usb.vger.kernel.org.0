Return-Path: <linux-usb+bounces-10903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DDB8FD0E0
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 16:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 719B12850C0
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 14:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684EE1D6A5;
	Wed,  5 Jun 2024 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="SfWKmHCm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="rv4NcOGJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2113.outbound.protection.outlook.com [40.107.14.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33F119D8B1
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 14:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.14.113
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717597994; cv=fail; b=Ivz0nw2jn2VIYzGB4zryJ2muyCYbZC8/RH9Rfo5QAFImAOuS3mwjAs6bd/0WDNW3YzZHJtvPyBncdMWF2YZ0op3gq7EixQyzAGOuDW0Kt3kIMi7FIXGMCrDjkQedbrikdTxKMpD+XrRPVzqLJaR9R3mBZHub8lbDtfLqYuVRtJA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717597994; c=relaxed/simple;
	bh=HY9kl3QgKG+3CDqlWcfoNjjUZQJF7NAMnGKigk9L9ag=;
	h=Content-Type:Message-ID:Date:From:Subject:To:CC:References:
	 In-Reply-To:MIME-Version; b=GSrwhcPEE5mE/Hn5BqsnReurAXO81aPjP/uzMtPcMqaGirpzdo332nAtv6kf4PhoD2VzDazd2x/3t0JNYQ6wG8TloPlR89yiPkW5awPVM4i2db+O2TnUxSz+aZ2nLk3R68AiEY6rUatKN14zwDVbaLf126bT7clTmt+sVHHRNOc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=SfWKmHCm; dkim=fail (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=rv4NcOGJ reason="signature verification failed"; arc=fail smtp.client-ip=40.107.14.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=ePB1OGpAo5LvpsnKOCN2Unzuw0T19i7wbdvubyCttN2y5Swg9i2c+6luaTnuerEtWYleJ3lvPKxHRBkFzFbbyS9MVopGoNs9Z01wfzuXK7bAfvQjCYyF39ho/XPN1B9tMHDcsvXbesnkhA85bGPMNkIMGCiuJwyYgizXnDkT7gSCivOlvilknQaQBJ/GiOeQYTwJ/u50w05ZAq3S2l8RtL7dqN6+BDwRw1fSU6/MlJZ7erpQYqhXziKCb2/uIzRJun6WAzFIjs+pbdCzaK6UaWiQkXeMs1semxOoFEzOAqJMe2KyaIF4vR8VUOGlzPsCRfmwRRq9vUC/BtFX92g/Xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HY9kl3QgKG+3CDqlWcfoNjjUZQJF7NAMnGKigk9L9ag=;
 b=oJr6MPCHsUxw9dHhkR13CbBNqOMz6yZLzExhwv41ZDK6KpXHvIbMU9iHOkKVCtvP4WePGfwaNNNty6HJQSlx3XuL8vvIi7qzEJfX776rdJqprs+NkBod4E7rpKKBvokQTD1w4TwsacVS4FVd7pp2iwEMbtgfGgkRBSWzDif3dMHHqWD6rNqRSAZFrz4K5ENzSZcYYXBfSgbGZMF9rSx3+PXlrlM50CpzQ1urcH8wtGMA9kTzfB8dSbISKnMpl5dWgxVEEngQOyhY2J5kcWdXTeVfNqiETkBLZVm1/1NzlNamcgPh+3jyxBD7ro/07qkfwI+nEbLl8090RstEdbltxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=synopsys.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (body hash did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HY9kl3QgKG+3CDqlWcfoNjjUZQJF7NAMnGKigk9L9ag=;
 b=SfWKmHCmeIb4OnuvLnhVG9+YJ7mF3OAphXIRO9UCE0WYdyR7pwB/LGTc/kyW77thG/IfGbMD5jfYl6b1m4anOOLzThNWi2vnNkrnvEjaB5v8UUg6Jx7YpPj8mKL+nSSbDf7Ndy6Wu48vuMiquPOSLnC7VH+n7n3A7YBFuZxpkUnV3CW4mAFFYDiVp3Eci0BkHtsfXEztwoIe/Zlsl0Pm/y+7gD2pJX1QBlq1H3UAcMyjYYZGMwVJns/0UgbWGAdhP0EbyX0a+46tHWddZe/VcAEBFoVj++rFOIq+l6MtUAl0EUDW5ggvWgYDPE2+C0c+HqzADw2xpV5/T4aY3Pigbw==
Received: from DB9PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::32) by AS8PR04MB8021.eurprd04.prod.outlook.com
 (2603:10a6:20b:2a7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 14:33:06 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::94) by DB9PR01CA0027.outlook.office365.com
 (2603:10a6:10:1d8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.17 via Frontend
 Transport; Wed, 5 Jun 2024 14:33:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=fail (body hash did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Wed, 5 Jun 2024 14:33:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.51) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 05 Jun 2024 14:33:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9x9cx54/Fyj9phz0HmbA+4RYsvV7nlGyQIwDZZ2J4sKXmFxl5RfDocBgX79ElpJXpm1Pg6x43naVTGAQ+rm9uI5kZSFj0WoZEI40slwDdmI0T0po+9sLa8WMm89BPh+CwnfNuOKTmEhA2mCGThWIUqs7a7Qwu11Xlb6eT+ZPwo4eZrtnBvBjZrEOypIDvrtw0A4mDCubJVmMTdRDbD6tM4l/ZIziPiiS+mkp69GE0nIUVhxu0x3IKa5aOVuYyIsNy8VjxgRYeT9OtmK/AJMwYcMutMeWLQPlE1VjzV9VqbW4q4kpZcSFJQR+0AklIXmNYZx4hCZyIlFUED5pVarmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coUNG4FYjsNMyRpNRzXtXGy/urR+fnzT+NMcyNjMG24=;
 b=kXHjhKGwpO4X1rHc1g367tOmSSu6oFWi7BQHmRUzDuQju5zMCxFkaCFwXyuHvJJcifHjENcvATQt/YqnUftnqUXc/Ny/4LbptTsJy4Lv+JoVyvi2wiLniONgbKSyZ5h2S27iF6oZzo4Bc/XK4NTx7m8vqzCzN7bcT/TPn5LeZqoL54i6U+eFS5YlGZ81PMHZfOF2YAwpbLTtH2nARopXljcw5h/xp5vChGOI3pPkNbX2rY1Fo4yIlTyqUef4nWilY3+FIBrLBSBLgELdBKGem8boNvYG7SkVQfesd8KRJUX6EYz0X5S5tOn1p0PZDrFEQB4JsNIbl1Id/j71HOAfaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coUNG4FYjsNMyRpNRzXtXGy/urR+fnzT+NMcyNjMG24=;
 b=rv4NcOGJMC16x+UzzQJSANOTYGyPnTXzCLhq+eW86YjeGYhOjggaT9mSMbmq+k6yWJeFyWjKpoiYqEtUxlQmNOfy12OV1tQT0x2QAI2Z61k3Z6RERucUsFNYrMooraUWWKm+hOSzeg3WYKRhyxaTIMfvcbnCoBmFMnZLuOgXR6RRrymM5uiJN0J2hapSoI3uPsB8P+paTMRwG/ZyBvJM0Wa+T6owkkacx5wilmZkLZOVgPmqXTmn5ai/ycJZ20LvvAxYDkSLmITqjwC/htdS/mz9yCkH6ehIqpzJOwIT4tS8lbvsNmdO8eOYH+fAPEW6yMnhyIO328+CycmIeZQDMA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by PA4PR04MB7789.eurprd04.prod.outlook.com (2603:10a6:102:c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Wed, 5 Jun
 2024 14:33:02 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 14:33:01 +0000
Content-Type: multipart/mixed;
	boundary="------------CLOgbpW9fOkFE2DKg2vKMKSy"
Message-ID: <023d03d8-ef52-41e5-be9b-d75be49c615c@topic.nl>
Date: Wed, 5 Jun 2024 16:32:57 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.c5f44c79-75b2-43c1-a791-806fe8b693cd@emailsignatures365.codetwo.com>
 <20240603131304.233403-1-mike.looijmans@topic.nl>
 <20240604010256.4dxamwvcjxug6xfb@synopsys.com>
 <0fceefc4-2b3c-41a4-a6ac-d0b6dbacc1f7@topic.nl>
 <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
X-ClientProxiedBy: AM8P189CA0016.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::21) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|PA4PR04MB7789:EE_|DB1PEPF000509E9:EE_|AS8PR04MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: bf40e629-3bda-41ad-4076-08dc856c69e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|366007|376005|52116005|38350700005;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?7GIG2v0X061fpbEsgqQlrlJPi584FgoXYnmd3Whcycbg/LhlGLy/WgrQJidy?=
 =?us-ascii?Q?K1kB6KPMzCVumA40fE8fLnogaW2ADtfizx0H8grvTqZ7ehc+G3qKHQnB+S3l?=
 =?us-ascii?Q?G3ED7Rm7qoO19Y5PEaLj1M+KO1aMXkabxL0vEUbr9T3wd/bP+ED+/NP2m8hY?=
 =?us-ascii?Q?H6YUX5n5Jn6M7aXCQBtbpVSrvywBYz5aPspvOecPMiFc9HgpeSedV0MRc9d7?=
 =?us-ascii?Q?oD5U8o2pPPYqIge90gZJ3qpe7fxiw2T9/Hkv4uLC+lgGbha8ckEpSF6xFlBv?=
 =?us-ascii?Q?K0v/jo5w+8R/YIMpnrvSklz/eQ2OPXMf//ivx8//nBQ0z2gAq78rIMkz5FRI?=
 =?us-ascii?Q?mMZvGml/qUiWFe160rWWN1630KmJtzs5sPR4ppD6lOs7Bg34Rhfz9LFRRMai?=
 =?us-ascii?Q?dnBWWUDpLFWvlJrcQ64wL848r6kZ2bIaBGD6JhLrfhey1RL8oVzM2J3o5jD0?=
 =?us-ascii?Q?SUbwpRkDlis7kYk2PW9QMLwegh5UTbQnNjWG29qIGBaBX/G48fOmGwzgoGMA?=
 =?us-ascii?Q?ZOScXCtnyi9bQ6tcWssbnLrz9LhlwJ/FZLAxNK4qNKvUIbIB1GATAM5b2RDC?=
 =?us-ascii?Q?GyF8trix59QYfxHEkovthvPGXGtqGmBmwyNReyd8gDi0yVkQI1rwLZ5Sb4OF?=
 =?us-ascii?Q?Gzf+RYj7Ln9CAdIWH5U8u3naBYiQr7WCBMxchHmazCgdv5xo2rkAIqm3HePQ?=
 =?us-ascii?Q?3oy+ARsUEgCbt6p2lubtNjq+VXnZjpJkKV4Fw5kvqZUFRBpseRbrE3wu5r/R?=
 =?us-ascii?Q?VWqrm2xrFDzHgT/zQz86RW2qmNbPX2hjR7JfiR/mt8qZv0BbcnijqFtaOPcX?=
 =?us-ascii?Q?BnxLVtO9WuTb45D9xUAUMNs6sbsraf0HJlLQIaEn+8PmplzZ1hc7NiPWurDx?=
 =?us-ascii?Q?FR4JMxkaj84OG8SFWAlxxvY0vF9SR7fSb/TaKIlnHGv+HodePwZYr7RprNA7?=
 =?us-ascii?Q?mZ5h7mHtJrcBGCrGrJVZGpKHMc98rikMXcWyarFVnqyLFOKNByzYk1jdhv8X?=
 =?us-ascii?Q?qopmDG1Pg6sNwSXLO2STt0P5/rE7QN8kwskRvUdgn/aH+Gau+vyl+ea2aHXZ?=
 =?us-ascii?Q?16AsRdr/JtHGI6zdan6VTFcpGutip54OAMUH8A8DADxmZKD6xnzwmBgs2p7/?=
 =?us-ascii?Q?190nft6LjHjMvydEy8J4iyNWCRGgtUDRqSYwMOWZ/DPJ49EXHblOyMvGfjTn?=
 =?us-ascii?Q?hS0AmouBssjMkJWGzPBvvSL9zYujbePIIVBW7Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7789
X-CodeTwo-MessageID: 2b2c3ef7-2611-4ef0-984b-0d5dd38ee8c3.20240605143305@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	490851e2-fce0-4466-4f42-08dc856c6757
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|35042699013|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFZXeVdGZ25KenI0ZGJrbDR0V0ZybzQ2ZjM3Q1BGTEQxOUU3bTBKN2ttK2dh?=
 =?utf-8?B?NndCUHcyN1NGNFJVQ3RJT0RmSzl1SEh4OXBWN1Rlcml0ZG04MERWeXlObGQ0?=
 =?utf-8?B?M0tYRGR2Q1YrNG9JV1pQKzg5MnEyQlBNdlVNRndmTWxJZTBHVmt1MDRsZURD?=
 =?utf-8?B?cmJGUFgxQkk2NGhpV2h5SFoyVXo1WVJXQnJVUnZTN203RlEyNjRoQmJuZlJz?=
 =?utf-8?B?K1VsSERPbmlJVVplK2oxeDNEZXJJaVIvU0lPa3NiVDNaUTB2L1J3RFFheFV1?=
 =?utf-8?B?ZlNuN0ZvVDFJUWVrTmJ0WFFUakZDWGdLSDFDODJ1QTlLdkcveTEwOEtaMnZr?=
 =?utf-8?B?RmN2bWsxR1NicUEzeEQ3U2RlSFhiL2JWZ3M5WVE3S1BJWUVlMkJnemRHNngy?=
 =?utf-8?B?Nlg4aUZ1SEdiTHZNc0JUdUgvMWNoZk1YaWF6SkZOdmNreGkrUVI1cFJwWXZI?=
 =?utf-8?B?NUxZZjR4WlNZWjZrem9IQWp2WWFtRVZHTkFoSUt6ZXMxeWptNUl6L2M3dWF2?=
 =?utf-8?B?cGJNZXJwbGF4TGdqclJUajZ5dTFyY2o5eCtsU3FHSVhsa2hkaG5DaDVKNzhM?=
 =?utf-8?B?dHpoMEhoSmgwVktBN0kzeDhsalBTRlAxVEdNYWZQVXhtVXZPTHVCMUlCVEZt?=
 =?utf-8?B?S0NBWEdkNDhuNGpOTmw0NkxrM0RsQWZQdFgzcVVxZGlUNHI5UWlwQ3FncWVB?=
 =?utf-8?B?TE55OHk3SkR0NHMxQTcvaWxVVERpNEl6Snl5SGhxZi9HUUQrQUdCVkNITkpN?=
 =?utf-8?B?YnJxVU9NZFVJMTI3YS9UNUM5VHRHQldSZGN0QmFOVEl3Qk9YVWd6cnI0QlYx?=
 =?utf-8?B?WGpvc0djQ09TekJ5R0RXaDVhc2dIdjZYcmhqRUZlV0VrNDVrYkhnMkxuc2Js?=
 =?utf-8?B?clhyVWROTEV2ZGQ1RTUwOVFvU1dTNGdSSUFJQU4zOVhhekpLN2dHNzhxVkhl?=
 =?utf-8?B?ZWtGWnZiV3FPaW9EVVJHSUE3c29xdDZ5QVhRUXoxcU5jTC9LNFRwNDJLTWxh?=
 =?utf-8?B?L0NaSzE5blgxVEtGQ3ZlUjNCTGQ5VGdIUFhwVUV5TXhEWis1dGIrcjZvbEtW?=
 =?utf-8?B?dkFQaVJvbXVaeGNQWDAzMm5jditScHJGK0c2SmN5Vm11blpUSzZ4UmJVQkxa?=
 =?utf-8?B?NjZoWVFLcmljQXZWYkxPMTMrd1hTMFNQN2NKZFgxbEpVbVdrbk1VeGt2WTZZ?=
 =?utf-8?B?R3NXV2JLNGxBTG1WZStKYXUxdzQvcjNEdktyc0pud01iUDBrZUhGTWwwcTlZ?=
 =?utf-8?B?Z2JlN1p0TkNJR1F2eHFjdHJ5K2FtMlFZSVVXSFhLMTMwMWZmL1ZPRXljNlZi?=
 =?utf-8?B?MkVmMVltQzJiWENITUNSVWpIVExYdmtTUG9uOUR0SHdLR0V5WU54eitkbnR5?=
 =?utf-8?B?ajBnNjJCYnVHWGNQbDFjV0VXZXpVYzR5SURHS0lxVXpRZEhTOFpKL0pONkQ4?=
 =?utf-8?B?Z0QvT3hiM2VETXhQV21hMEFxVU9RZ0w1MEZ3MzhTWlk5aXBXdUJKL0V3WEVp?=
 =?utf-8?B?SGpZTmpMMmUrS0tjMUxUU3cwYWtnOTltWW05VS9qcHpsYmIyUjhxdngvVkRV?=
 =?utf-8?B?SXJ3SG4vWEZPMTVyV3RSbDk2UUtZYWZNU0pYMzhRQkRqZUxEb25uaW80TlVq?=
 =?utf-8?B?VFAzVE8xUEJCa25waURuUFFodlNGMnZwL01NWjZ1STJqamZRdDRTVmhCblJI?=
 =?utf-8?Q?TT2jiOgixqU4vFvN/Bbp?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(35042699013)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 14:33:05.8409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf40e629-3bda-41ad-4076-08dc856c69e0
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8021

--------------CLOgbpW9fOkFE2DKg2vKMKSy
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 05-06-2024 01:06, Thinh Nguyen wrote:
> Hi,
>
> On Tue, Jun 04, 2024, Mike Looijmans wrote:
>> On 04-06-2024 03:03, Thinh Nguyen wrote:
>>> Hi,
>>>
>>> On Mon, Jun 03, 2024, Mike Looijmans wrote:
>>>> When disconnecting the USB cable on an LS1028 device, nothing happens
>>>> in userspace, which keeps thinking everything is still up and running.
>>>> Turns out that the DWC3 controller only sends DWC3_DEVICE_EVENT_SUSPEN=
D
>>>> in that case, and not a DWC3_DEVICE_EVENT_DISCONNECT as one would
>>>> expect. As a result, sysfs attribute "state" remains "configured"
>>>> until something resets it.
>>>>
>>>> Forward the "suspended" state to sysfs, so that the "state" at least
>>>> changes into "suspended" when one removes the cable, and hence also
>>>> matches the gadget's state when really suspended.
>>> On disconnection, did you see disconnect interrupt? If so, it should
>>> transition to USB_STATE_NOATTACHED. This change doesn't seem to directl=
y
>>> address your issue. Can you provide the driver tracepoints?
>> The device doesn't issue a disconnect event, I didn't have tracing enabl=
ed
>> in the kernel but added some dev_info() calls to determine what was goin=
g
>> on. Added this to dwc3_process_event_entry():
>>
>> dev_info(dwc->dev, "event: 0x%x type=3D0x%x", event->raw, event->type.ty=
pe);
>>
>> When disconnecting the cable from the host, I see this:
>>
>> [=C2=A0=C2=A0 50.841411] dwc3 3110000.usb: event: 0x6084 type=3D0x42
>> [=C2=A0=C2=A0 50.841457] dwc3 3110000.usb: event: 0x4086 type=3D0x43
>> [=C2=A0=C2=A0 50.841494] dwc3 3110000.usb: event: 0x6084 type=3D0x42
>> [=C2=A0=C2=A0 50.841534] dwc3 3110000.usb: event: 0x4086 type=3D0x43
>> [=C2=A0=C2=A0 50.841571] dwc3 3110000.usb: event: 0x4086 type=3D0x43
>> [=C2=A0=C2=A0 52.650990] dwc3 3110000.usb: event: 0x30601 type=3D0x0
>>
>> The "0x4086" and "0x6084" messages are endpoint events that occur all th=
e
>> time while connected. The last event is the "suspend" one. After that, t=
otal
>> silence.
>>
>> If you need traces, please point me to a description on how to obtain th=
em.
>>
>>
> Let me know if you run into issues following this instructions to
> capture the tracepoints:
> https://docs.kernel.org/driver-api/usb/dwc3.html#required-information
I've attached the traces as a tarball. Hope it survives.

At the start, the USB is up and running (and doing ethernet+mass=20
storage). I saved the trace after pulling the USB cable.


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl



--------------CLOgbpW9fOkFE2DKg2vKMKSy
Content-Type: application/gzip; name="dwc3-trace-ls1028.tar.gz"
Content-Disposition: attachment; filename="dwc3-trace-ls1028.tar.gz"
Content-Transfer-Encoding: base64

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

--------------CLOgbpW9fOkFE2DKg2vKMKSy--

