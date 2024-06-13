Return-Path: <linux-usb+bounces-11265-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3FE9067D3
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 10:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6233B1C2247A
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2024 08:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A6D140388;
	Thu, 13 Jun 2024 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="iCB4C8yG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="JlDS1gcm"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2123.outbound.protection.outlook.com [40.107.7.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47D03209
	for <linux-usb@vger.kernel.org>; Thu, 13 Jun 2024 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.123
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718268709; cv=fail; b=PLre6oVIwaFNvAA19eUtuFWd16LmtD6EFGWFO0n7DTvomrx66J2IDr4qewaJ5IsdAu62XCsbx6ls979gN3sS9zn95ifdRCISQNUL0AX+0exbpZSfa3Z2vF6I/I5ZQlT2qvb2em4lFvOYm6FZ5lkjGZovatzm6kf2JRWsaEAtwt8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718268709; c=relaxed/simple;
	bh=NVBxLTtl96QY734K5b+we5u3T75BVZzaNKEQcn8EgS0=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LD+dF045rQ646myPjkXiYrylyty17LPWGDm5xGdaPEqLJJLunJs+8J7HMzLQlhthJc+vyWtNp0Lr62Nl46c+u/NFvTrrWIgnL1UsfvzMXa4qnu3l+AB5JvYfxmTFK5D44M30obp81LK752pMpsQtyqhFQRuoT3oeHYErlPbpkQI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=iCB4C8yG; dkim=fail (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=JlDS1gcm reason="signature verification failed"; arc=fail smtp.client-ip=40.107.7.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=F+5vIRBOhlxcTpt7pmzjwW1zVSGBJG6Pg+KXntdDwQd2Z2B99B/7XJ5PnQp/XILxenqQ6wi9dyITGS+Yg6Icll6kOl2XVSnD2Xn+THElmCmHTix0monbVgPi9VguEbk4dtZik6HaLu0QMhvp/RL5Q8LEttoaJSAxeLLurDYkzMaZaRPV/xNC7R8JkXOSShT1n9IUnRcyyiExlvEZnLnttUNxseQhJFcTEsFrRnU8XBtH6N03mcrQUeKC+qHr/WrqbHoUR1MAtV/AExOl9+5PReipb2qaDaHaWbu3y11do3SYA2wfMZyXJa4k4mbyB72VmHLAh5y+V1oQhsX0tMZPTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3cERyEiMgqgbKOxsXBaXPt0lI5UG5LXYXvYIJzxSH4=;
 b=VRqGqyK1T8hYBxt/5ft70N3zBfbnj+lHJ2aTeAYf03SO+9P1nLMEd+OEc6NHCBsM1Bg9hAZaH+1qkgOn1juMdXYYC9OJzaPiKEPVqSgY4igd+B6D+9tEUvX5Lqg/pcisL2rTm6SmbPWYHMvt9FdNgBZqN85XsOLeZPiMV/QKECq2MQFXtPmmxL3nuXGorw2MdLG7UUFjtjLwAd7kWdgnx7cRSwwCFRmOBXHNb87ME14SbljtTZReiXyEAPkOpfIj+kMqGFDOs9u6xaVvSCKNpTNH4XSItTCI9MJ4qUMGTK0whdlmyAi57vgWZiY/d7/BY/N98DJI5mOE9N4ewewoFg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=synopsys.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (signature did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3cERyEiMgqgbKOxsXBaXPt0lI5UG5LXYXvYIJzxSH4=;
 b=iCB4C8yG9DYnqqpxxdwG7+RrW73ejE3fZm7PWEiSqDisJrCZ3n2KNAdlX19k/iV0WocL+4AdatlJYsdIJBhlQ9ntz7LEFggWfYSa0DNoeS0MBc/IGuGrOJNYDzpiMVrzwPqiLzlW9gxMtqskaD7Eg8v9GjWamZAx8CanPQPR0jmiaZXmw8yZg0gBDEecp2ZagI2DW4ZQ+No0UsXxz+2e8r03UXuqbIEuyH/QTW+clnVMxMW0sxv/rKT2HptVqXcmf5TPlcqJznCyrnY4sdiq28g1uVY6QoFWcUoih4ECjBmTusWFBszZAP3La/Nw5M3HCw4AsLwldQJ5rB+IjeNcdw==
Received: from AS9PR06CA0375.eurprd06.prod.outlook.com (2603:10a6:20b:460::19)
 by VI2PR04MB10763.eurprd04.prod.outlook.com (2603:10a6:800:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 08:51:41 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:20b:460:cafe::a9) by AS9PR06CA0375.outlook.office365.com
 (2603:10a6:20b:460::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 08:51:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 08:51:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (104.47.1.50) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 13 Jun 2024 08:51:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEicmIUZsV66KQKXNmA1YMq06dG2PiWcqmvVzDK5F2tu71Npsrrg6kIcwsKVpAegZcFZKGGeKSIUn4woL5LFDWBPVT7wYPHyoaKwQSBcYCXj9ixu/4je/wfHwFKC6zBsZNV6/vOM5ZwHW40GjqPPm8cuF/BGCHKHbiQtpaUCoZdPpOHmkQl3w/JGg+aFJRzftwuhfwizU2U0t7DyFWB9ychQ5Ss+2l94FRQOxaSt4lFbuMZVQs7O3mcqVjjM2c1uVovU5oTg5OEf/3TG0zrBr+qC3Va4hU5q1Ao3F/7Yi8E6oDZRzKszc04lCiUS4W1WiWMXFTCI6NbsmAOWrrofxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZK7p3MEso6l8lETbNZQYokQ3Gid/u5ngIx4jTrogjP0=;
 b=TlJ/lj/i47XpOL+FOUIscm3OsXYmFOcERdzGkuCLf7u8VGCAcHXW72XybUjS8aRxIqEH1mCe8BbO7/8RaKLnbXgu8LVM/6FKRQY3BNAV4FEVJ3YSWXKkX3OV7eK8xOWN2WMjwJxccdZC6yDdEfpFQZwlURru3Pw9lKCKg7hDX2Gnp7gcqdulWsyVQ/E4S+U1wwSWV2VDEgA+YN2ckg6AW0P9hct2nfgMJQpb59yCxKH4tyRVuFVddxYogyxG/gWgFmrJt1MaLzKIlRDXCAtyzCyy8CoxR8KkpWhvlB2AOHayj2do9U5DmNs0P0T+kD02Z4y08GPlSVgkNsgNc71KEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZK7p3MEso6l8lETbNZQYokQ3Gid/u5ngIx4jTrogjP0=;
 b=JlDS1gcm3GKZ+5eagIcjFbmwc6Z+O4ZgAg9blgUBjqsLbhwLBHYRUA445h+gQQQd6IXewaTPYcsjhg/bvTjzV4f+sQzzsR3d9KkWj5jHomQosCGKXrQgv0jB8pZAL4AnYkRQCIxBf6HfGIOGXs5wi2WVJqwdgQpADQ0WXbor+6B3yAecaZn1y6JbTDdjoXDFmT0sTUpjj1TW/26l9VnSTGmxvRMx6jSB3q954S5c/aedp4m0qtiNJb3++lL+jXNna2MesKvfdlXW2+v3xkvaoMUPnm40sZO+2anfu758TcPZL07weweUccGnlYh/vMFa+aCsZ7aDID0o4CKVEG3ULg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by PAXPR04MB9352.eurprd04.prod.outlook.com (2603:10a6:102:2b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 08:51:36 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%7]) with mapi id 15.20.7677.024; Thu, 13 Jun 2024
 08:51:36 +0000
Message-ID: <2e64b7a2-8d36-4bd4-8c53-2207c8a011f2@topic.nl>
Date: Thu, 13 Jun 2024 10:51:35 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20240604010256.4dxamwvcjxug6xfb@synopsys.com>
 <0fceefc4-2b3c-41a4-a6ac-d0b6dbacc1f7@topic.nl>
 <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
 <023d03d8-ef52-41e5-be9b-d75be49c615c@topic.nl>
 <20240606002805.bziyz3y4bcysdysv@synopsys.com>
 <d4322992-8aa4-4eb7-b7f6-63b1b706ad7a@topic.nl>
 <20240606202127.6gdk6v3jevrmoyzk@synopsys.com>
 <a630f365-7a7b-46e9-b5a4-9b150f31d74f@topic.nl>
 <20240607225731.2d24p4as4x7mrfaf@synopsys.com>
 <9eb64562-cbaf-4abb-95d8-5792d46bd63d@topic.nl>
 <20240613003204.beip3nbdl7h6zvsq@synopsys.com>
Content-Language: nl
Organization: TOPIC
In-Reply-To: <20240613003204.beip3nbdl7h6zvsq@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P192CA0007.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::19) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|PAXPR04MB9352:EE_|AMS0EPF000001A4:EE_|VI2PR04MB10763:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e70ecc4-02b5-491f-49eb-08dc8b860acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230034|376008|1800799018|366010;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UHV4aCtDaTh6VkdUK3RQNjV0dWRDcStzalowbnVPTTJzVTEva0lLanNQZTR3?=
 =?utf-8?B?SWYwNTArQXFtOVExVEFqYmZRNFp2N2wrRmZqbTZpc0oxVnp6d2U0MnFGUStD?=
 =?utf-8?B?a3hKbFFtZXJjdW5TeFJUTjRFazdOenJTY1Z2STJ5YWxYUXFmZ2UvdEZkSW82?=
 =?utf-8?B?eitmOUNrcFEwWm5SUkkvV3NEb0Fya0lxZjAxQ3hjdzRiZktDOURHM04zalE4?=
 =?utf-8?B?OU1acHVDaG9pdHluY0pjN002OUEwUnMyVHdVV0NUSDR3VHVHeWwwZlNNZysz?=
 =?utf-8?B?bGt0RVdiOFJTK3BWM3RqcTJISjVLNUxvM001cmVBcjdnK3hQUk5NWE4wOXpC?=
 =?utf-8?B?VTNJa25zVzIrdkYvb2pibDg2dVQzNHhnUTMwbmFyVzJ6SFViTW5qZnNNL013?=
 =?utf-8?B?cGJvNS9ENkVONVpFRWVyREl6dHhvbWx5Z0dDVWR2VmZUZm1ENE01Umpwc0w1?=
 =?utf-8?B?TFh1NEZPK1BqaWI0cjRNWnpZTEE1QzlzVThOdENMbmpLTDlFU0RDNEFwWGVR?=
 =?utf-8?B?OXowU3hnYy9BaFVCNzFERHZlVHI0d0tybU9RK3ZacjdURHd2S3dXUFZNMlhj?=
 =?utf-8?B?dkVuQVJxWkFrRkVkWVJnL2UvOWV2cmlFaHFUYkk0eGlsM1dkUzFlVEVyK2pE?=
 =?utf-8?B?MmlIV3BWeGc2aTFxSnNTcG9NMWRUa21sLzdYUmtkSS9TWjZRMFRsZkkrRitx?=
 =?utf-8?B?UDloMVZ3OWk5MWlnczJxbC82SzVWeHE0VzNnaGk2Y2xaTHRBTlFHUlJSbHAx?=
 =?utf-8?B?Si9KOXFQZXl2dm9raUhYYkVtTHV3THVScmthZ1lEa3l2bVB0TFlNZVBsZmdX?=
 =?utf-8?B?RGNtenNaRUdmNE1kWmhCNDZDcHlEanpxU1lBNFFjSzZ2RmpzeHlNb0x0WU1Q?=
 =?utf-8?B?Z2VSbnlNc0tyK0FSQTh3bnZOaXFaN2hkQ1RWcldpM0hJNGVaOHcwVDBwK2VX?=
 =?utf-8?B?aFBxMEk1VHU0Z2RQL2NDcFlhd1BEanJSS0ZHVUV5Y1hkWWdmMktGZzVRZmFY?=
 =?utf-8?B?NVRtallCc2s0Vzg1L2ZjM1ZTUkI1QzVNc3FGUStOZXhmOUllUGtZWjgvczBG?=
 =?utf-8?B?THh6S3V2RVhKbTNZNWRrRnpWdlA5YTNsL2lHdUF1andvTDF5NGNCNitxRHht?=
 =?utf-8?B?K1VYbFNzTzI1K3F4ckZTR1grV1lVYzlmcE55dCtSbnc4TjNoUDNDczVnVnZl?=
 =?utf-8?B?RjBOaHFVWGVyNEF3MGFWc3diUHZkR1RpUmFFVW1VVEpScWhYVjRMZldiL0hx?=
 =?utf-8?B?dHFYM2V6UEF1OVIvSWpsWENnTEN2TzJ2TDlIS3psVDdIdzVZMzJpVjZORk5p?=
 =?utf-8?B?Mi9RTnAwL3pLUW13bHlpZGJBU1FDd2JPVzVWM05KUC9DVkdMNnlIMXpsLzZv?=
 =?utf-8?B?ODYvVzdkcnNjWlAwbHRMRlNlUlhsZW9US0RSNlh0Q2VKcEZsb1JmTVB6L0xm?=
 =?utf-8?B?eUVnMXFJZHdUSWNndGtqYlBScTdIdjBtTzZxdTVyWHdkTlFDODBzQVcyejBi?=
 =?utf-8?B?cHFDR2dhYzBaZU5abnVUQy9Gd0FoNHlOWG1XOXJmalhXTW5vU0tSQ0ltek5t?=
 =?utf-8?B?VDd3NnQ3YUVvOVBSWkhLZ0JyQ1ZzU0NVd2ZMbzRwZCtwRnN5Y2J5VFFCa2pr?=
 =?utf-8?B?RURNTmJTMHhpR1ZFNlNDMS80VFVKd1REVjVZbzhoWC9WbVJjNE5IVFZ4Z25H?=
 =?utf-8?Q?WlOjy0K0dCguGAHZivcA?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230034)(376008)(1800799018)(366010);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9352
X-CodeTwo-MessageID: 031ee718-21e7-402e-92de-d22621c16535.20240613085139@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5a0f0e66-203a-4d40-e217-08dc8b860878
X-Microsoft-Antispam:
	BCL:0;ARA:13230034|376008|82310400020|35042699016|1800799018|36860700007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3d0bXA0eEp0V3hjS1pQR21RQkZZTmloZXJHZ3daMGhNdWI1N1dpUXZyckZh?=
 =?utf-8?B?UHJkdExKRWNPUHVyMUlmb2tBZm9xWWFHSjBDLy95NmNDdTEvKy9oTFVRMmdD?=
 =?utf-8?B?cno2N0dpclVGTVp6Vk04dkpuQzhvdGxVNzhWZEd6WU5JeUdnRG5CWG1GdTVS?=
 =?utf-8?B?REIrazdwdnB1cGpPL3lXcmZ6eTJHeDErWHdXWXF5UHluNXBkMW83Qjk0QmZV?=
 =?utf-8?B?NU9Xc1NyM0JyZ2hlVG5WcHRNQzE5NFpFd0ZSYlBxRmN2OU5GYWZKaWhNRFJB?=
 =?utf-8?B?YVpoL3NCcnBwYjBhMUVlbThWWWFSRng0ZHlMdTJwTlM4OU52RUQ4RFVZeUhJ?=
 =?utf-8?B?WGd3dXhQT2R4UjFmVWQ3VVJSTVBSTm1WMktYd042RHNQd2NMaGFQSG8yUDlZ?=
 =?utf-8?B?ZS9aNzh0UGZkRStnK2ZvTC9FTzdTcGc5cm1NbHRwOTNKVExFa2tha2JtbXNQ?=
 =?utf-8?B?cWxBTHF5MG5waTMvTE9aQUk4SWJvMUJqMDNOdGxCTEFwZzBjaDJFZ0I1TkZh?=
 =?utf-8?B?Rnc1U2RyaUFvSTgycjVOYWlUVWtnR1RhdEJqMk80T1NzejF5V29kb1owc0ND?=
 =?utf-8?B?blhvSC9MYXJRL2ZtS3NMb0FkbENPMFZqUFhUa01oNlFtUE9DUjZYNTJ4bzQw?=
 =?utf-8?B?UCszRzNwSmx6TmV0VDZWMW0xS2sxT1kyS0hRakwydk9SNEk2ZU9Fc2E2VmRX?=
 =?utf-8?B?cmtDbXZhNlVrakh0OERmdldGTGtURDJpVWVONUg2YVZKZDJPZ0pERkV4L0xS?=
 =?utf-8?B?RzZEOHJEUWphWGdLdmZhaml6cHRHaTRsc2QxdENqQi9Gejh2NWJtTlJxV2JU?=
 =?utf-8?B?UThmczArRW51TFV5WnJ4enljNVAxUWl2Y3BRUVA5bXgxWVFrSnBBeFBrcitY?=
 =?utf-8?B?bzFveGl6Mk0wK1ZtVjYzZmp5N0Y2emFoSUthOU5zN1VXcHFabkFHdUJ0NGt0?=
 =?utf-8?B?RnZrWjJ4dWJFV2JqRFBTbFZtQVlKcThSNlNFOVdHMldlUkdBNEV4V1hSWHA1?=
 =?utf-8?B?T3kvTm1SVG1IY2paYzRjblF2WUlVWnZUNnhaRlp3QS8zY3dSUnVsRk1BQ3Av?=
 =?utf-8?B?NnVaOERMM1paU25ycDNudk5QWGhmUC95ODh2Vk9HazZlaFhFSFFEaHVJT0FT?=
 =?utf-8?B?czErV3ZtZWVHaHFPRmg0dUIrRlZIREVhaDVRYWM4NUgxd2JVaWF4QmZRZUd3?=
 =?utf-8?B?ckFGdC9ybVc5a3hzS0VQVlRiZnRWVTZWVmx4NnQ3UDVuTWllVjlCRVdZYmt5?=
 =?utf-8?B?aGhaMWE0WHRQVnVxQS94dy9ocG16cjZiWURBQmx3MmlybzNGSFc5T29uc2d0?=
 =?utf-8?B?aHdabFdLTjdMZW9VNjVEMmF2K095SjlBZGMvVlZJQ28yZmpzSnM1N2NqSkZM?=
 =?utf-8?B?RTU3L3YxNStCY29hUGF2b0J1RUYyVXNrSWJiaWk1M280bUxHdUp5MmhjOHBS?=
 =?utf-8?B?U0FmOWI1L0d1Rk1KdEVGalpCM3UwRjVjMFVza2d6L09qamJvb3lTVHBuT29p?=
 =?utf-8?B?UFlBRlVDRUNvQ0I4SWUzVUZFTEZaSmVjQyt5NUQ4dFhzUmdXQXh4eEE2QXZw?=
 =?utf-8?B?a1Fxd213Snd3ZzM1M2ZudlA2Y1lsTWZiZ0E2ZFRRL1dqTG80Smx4R3IxdW9W?=
 =?utf-8?B?QnlFTzdhK2VHSVZHWkovcjNtKzJscWlvLzVreFlDbTI5dkdISVZVU0toZzVz?=
 =?utf-8?B?RlNMemVXUU9sUG5KTjVNNmVrdE5FUzZMTGlVb0I2TW54WVNIRitvc0JubUdE?=
 =?utf-8?B?TDFKakJydXFWMEVaQ3poOWNIcEljSkVCVFk4K2NyUktTMFFKeGhJcFNNWVdr?=
 =?utf-8?Q?cYJP8iPWj3VEZRmbqEdhWKYvT3RY/sy3QYAvI=3D?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230034)(376008)(82310400020)(35042699016)(1800799018)(36860700007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 08:51:40.2806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e70ecc4-02b5-491f-49eb-08dc8b860acc
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10763

On 13-06-2024 02:32, Thinh Nguyen wrote:
> On Tue, Jun 11, 2024, Mike Looijmans wrote:
>> On 08-06-2024 00:57, Thinh Nguyen wrote:
>>> On Fri, Jun 07, 2024, Mike Looijmans wrote:
>>>> On 06-06-2024 22:21, Thinh Nguyen wrote:
>>>>> On Thu, Jun 06, 2024, Mike Looijmans wrote:
>>>>>> On 06-06-2024 02:28, Thinh Nguyen wrote:
>>>>>>> On Wed, Jun 05, 2024, Mike Looijmans wrote:
>>>>>>>> On 05-06-2024 01:06, Thinh Nguyen wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On Tue, Jun 04, 2024, Mike Looijmans wrote:
>>>>>>>>>> On 04-06-2024 03:03, Thinh Nguyen wrote:
>>>>>>>>>>> Hi,
>>>>>>>>>>>
>>>>>>>>>>> On Mon, Jun 03, 2024, Mike Looijmans wrote:
>>>>>>>>>>>> When disconnecting the USB cable on an LS1028 device, nothing =
happens
>>>>>>>>>>>> in userspace, which keeps thinking everything is still up and =
running.
>>>>>>>>>>>> Turns out that the DWC3 controller only sends DWC3_DEVICE_EVEN=
T_SUSPEND
>>>>>>>>>>>> in that case, and not a DWC3_DEVICE_EVENT_DISCONNECT as one wo=
uld
>>>>>>>>>>>> expect. As a result, sysfs attribute "state" remains "configur=
ed"
>>>>>>>>>>>> until something resets it.
>>>>>>>>>>>>
>>>>>>>>>>>> Forward the "suspended" state to sysfs, so that the "state" at=
 least
>>>>>>>>>>>> changes into "suspended" when one removes the cable, and hence=
 also
>>>>>>>>>>>> matches the gadget's state when really suspended.
>>>>>>>>>>> On disconnection, did you see disconnect interrupt? If so, it s=
hould
>>>>>>>>>>> transition to USB_STATE_NOATTACHED. This change doesn't seem to=
 directly
>>>>>>>>>>> address your issue. Can you provide the driver tracepoints?
>>>>>>>>>> The device doesn't issue a disconnect event, I didn't have traci=
ng enabled
>>>>>>>>>> in the kernel but added some dev_info() calls to determine what =
was going
>>>>>>>>>> on. Added this to dwc3_process_event_entry():
>>>>>>>>>>
>>>>>>>>>> dev_info(dwc->dev, "event: 0x%x type=3D0x%x", event->raw, event-=
>type.type);
>>>>>>>>>>
>>>>>>>>>> When disconnecting the cable from the host, I see this:
>>>>>>>>>>
>>>>>>>>>> [=C2=A0=C2=A0 50.841411] dwc3 3110000.usb: event: 0x6084 type=3D=
0x42
>>>>>>>>>> [=C2=A0=C2=A0 50.841457] dwc3 3110000.usb: event: 0x4086 type=3D=
0x43
>>>>>>>>>> [=C2=A0=C2=A0 50.841494] dwc3 3110000.usb: event: 0x6084 type=3D=
0x42
>>>>>>>>>> [=C2=A0=C2=A0 50.841534] dwc3 3110000.usb: event: 0x4086 type=3D=
0x43
>>>>>>>>>> [=C2=A0=C2=A0 50.841571] dwc3 3110000.usb: event: 0x4086 type=3D=
0x43
>>>>>>>>>> [=C2=A0=C2=A0 52.650990] dwc3 3110000.usb: event: 0x30601 type=
=3D0x0
>>>>>>>>>>
>>>>>>>>>> The "0x4086" and "0x6084" messages are endpoint events that occu=
r all the
>>>>>>>>>> time while connected. The last event is the "suspend" one. After=
 that, total
>>>>>>>>>> silence.
>>>>>>>>>>
>>>>>>>>>> If you need traces, please point me to a description on how to o=
btain them.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>> Let me know if you run into issues following this instructions to
>>>>>>>>> capture the tracepoints:
>>>>>>>>> https://urldefense.com/v3/__https://docs.kernel.org/driver-api/us=
b/dwc3.html*required-information__;Iw!!A4F2R9G_pg!bahfjil5HEUq-fOHAwDfusutL=
JCLognfyLHTFLiSlVuZotpr99XBGg7nB0zRRnNF_M1pqEKcVa4KxNJwh3_F2dZWwVKTkUY$
>>>>>>>> I've attached the traces as a tarball. Hope it survives.
>>>>>>> Got them. Thanks.
>>>>>>>
>>>>>>>> At the start, the USB is up and running (and doing ethernet+mass s=
torage). I
>>>>>>>> saved the trace after pulling the USB cable.
>>>>>>>>
>>>>>>>     From the capture, we can see that there's no system suspend, so=
 there's
>>>>>>> no soft-disconnect.
>>>>>>>
>>>>>>> Base on the suspend event, you're running in usb2 speed (ignore the
>>>>>>> incorrect U3 state, should be L2):
>>>>>>>
>>>>>>> 	irq/94-dwc3-631     [000] D..1.   149.139290: dwc3_event: event (0=
0030601): Suspend [U3]
>>>>>>>
>>>>>>> The DSTS from the regdump indicated that you're still in L2 despite
>>>>>>> disconnected. Looks like the phy was unable to detect and wakeup fr=
om
>>>>>>> the disconnection to notify the controller.
>>>>>>>
>>>>>>> Can you experiment with setting "snps,dis_u2_susphy_quirk" to disab=
le
>>>>>>> usb2 phy suspend.
>>>>>> Adding snps,dis_u2_susphy_quirk doesn't make a difference, behavior =
is
>>>>>> identical.
>>>>>>
>>>>>>
>>>>>>> Does your device support SuperSpeed? If so, do you observe the same
>>>>>>> behavior while operating in SuperSpeed?
>>>>>> Just checked, still connects with superspeed. What led you to think =
it was
>>>>>> only high speed?
>>>>>>
>>>>> Bit(4) of event info (0003) from device event value (00030601) indica=
tes
>>>>> usb2 speed.
>>>>>
>>>>> Register DSTS field 2:0 indicates fullspeed. Even though this was
>>>>> captured after disconnection, the linkstate did not change, which led=
 me
>>>>> to think that the connected speed did not change to Es.Disable either=
.
>>>>>
>>>>>> Do you want me to send new traces?
>>>>>>
>>>>> Can you also try to disable usb3 phy suspend with
>>>>> "snps,dis_u3_susphy_quirk" if you think it's connected in SuperSpeed?
>>>> Added this to the devicetree, but also no change in behavior.
>>>>
>>>>
>>>>> Please capture the traces again if it's operating in SuperSpeed.
>>>> I've attached new traces. Connected at superspeed (host reports "super=
speed"
>>>> in its dmesg log, and the real data transfer speed is way above highsp=
eed)
>>>>
>>>> I added register dumps before and after the disconnect.
>>>>
>>> Thanks for the trace. It's indeed operating in SuperSpeed in the
>>> connected regdump. However, the GUSB3PIPECTL.SUSPENDENABLE is still set=
.
>>> Can you double check if you properly set the "snps,dis_u3_susphy_quirk"=
?
>>>
>> I've attached a trace with both "quirks" in the devicetree:
>>  =C2=A0=C2=A0=C2=A0 snps,dis_u2_susphy_quirk;
>>  =C2=A0=C2=A0 =C2=A0snps,dis_u3_susphy_quirk;
>>
>> Interestingly, it still goes into "suspended" mode when I remove the cab=
le.
>>
>=20
> Wait, I thought the host initiated the usb suspend. Did you trigger usb
> suspend by putting the host in suspend? Or does the suspend event only
> come when you perform a disconnect?

All I do is unplug the cable. The host (PC running Ubuntu 22) doesn't eject=
 or=20
suspend or anything like that.


>=20
> Can you confirm if the suspend event was there before you disconnect the
> device?

Disconnecting the cable is what leads to the "suspend" event.

M.



