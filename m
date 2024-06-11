Return-Path: <linux-usb+bounces-11121-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14462902FB8
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 06:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 873C61F23A98
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 04:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F80170835;
	Tue, 11 Jun 2024 04:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="M92PnvZ/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="SqBp09jF"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2100.outbound.protection.outlook.com [40.107.104.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B1214290
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 04:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.100
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718081960; cv=fail; b=WVGFRniOPaWJuZvelh7cs2WJkfT0mRToH0H7wcYK3gIHaQj62vV342JGoLUeV9tXIKNO8YzFrKxoD89xGvVlg0ykWvDspd8IWhLfSISbg12I+ZbCvaWg9isIqdFnRNppfdNsNDQDngel9tKVOQV4Mlz2YMtPTwXeFu6KF6EPSvg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718081960; c=relaxed/simple;
	bh=I2GB4e0+b9MuyNyUmlV8a4gVcY1ddNFmgbmDztdK31I=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K3dTpAg4cGWkuia/Q/cr5AYLlem69Qmw9E/MFLsmF0RWeBMqRXUfH0fLb1f3M2pLN2U6AqoiBQBMPRMRoeJ4nI7S0zWvuS9tJwWagn2JeZWqL60V0F7u8bVcuN/pwJUejWVKcfvq7USW1pho86th0KSeQuqUFSyI2ZwYe8whW90=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=M92PnvZ/; dkim=fail (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=SqBp09jF reason="signature verification failed"; arc=fail smtp.client-ip=40.107.104.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=PyRB3uMkmU/XCwxLpVhnu/+w+IC+5Tmo4/EJTdJAYMRwboLiwk9rGxePXZw9gkn3bV1szLF0eANZVpUOXz3n3CpWLqyVWOns1Z5bIskTVIwCoAo3V+zWJ1vwQDuDmCaCSFWL3KG4P5F2K8Br8lGcjwRd9Xa6Egtb2p8mu4MEjmCYrsPsqPSkpaWaANepTgi5pPN3v/QyGoPcdlV51FUVXzS7Fm1echP3BeVJ9SeiZhTFQ6xUZNkB4GrRBHdRPRgpPsRs+N8lnGVnEsu50aeiVQX23wTO7TMk0w6TfcV+WOsPl96ljowl/aj302ubrWRHhua9Xk8jCEv5w25MW4A9Sw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmKybxUaZso2+EbA1vno7IuTEvKcEz89WtDCB4iipos=;
 b=VHs1L94E9V4ae0vOpaQHevOQTGUExYR/ovb4AuGgLpGtjHKFQbfvRa+7dwQaB0QXRgBemEfq+aKlKeavg8BTQcCxJF0lwi1rXgk9A3F9HHAs21CEFwEhlRUTzYEBJEDuecdzmwN04s6GcJK80xJHjx30wkM3dzFa2e1fAaSEd1P1lAuoth3/cf7Cy66TbSZGGaVJYiOmZszSqd1mcnk5Za/gImS6+0JzBfOFEiywVhU8K37KBlDZM4G8XxZDZNE8f2msV6cEg04Ap3oSuRKZf0G9xEObsuAF+jlKrmtpl+4AfBVuiIVByM6TfGU+Kt8zMySz50VyL4UijKJdc99q7A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=synopsys.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (signature did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmKybxUaZso2+EbA1vno7IuTEvKcEz89WtDCB4iipos=;
 b=M92PnvZ/mLz6UhvVXJv69IyBEhNIsDsoe1Qx3wYGCH/7U0bmYWN4TQgwozvjptBerQT4zjFAlmJg2OFxDSjaVlczaFNkcq6CUAB1FNj1dNiQtjMFe0pL8f6N3UxGkgzBut8iIKcXH7lJk2VTGQq0bWXXOf4vn0vTRqAjzPMAEESSj9UdFEIHcT0PYNGky/FejwynVWzrLahdGwL8bX7P4pAg4xMvNNNcH5HnNM1BY0ipk7fxTN+DYskrmXPLwq7DOFLD+Bd8rTWCMrnVdSaN6ZSvfAeOswvScbkniBfdiPjgJMGG1oSYJf9zvsgrcKAmBFtyNDEc/zzTchEgQWOI9Q==
Received: from AM8P251CA0007.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::12)
 by VI2PR04MB11073.eurprd04.prod.outlook.com (2603:10a6:800:26e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 04:59:11 +0000
Received: from AM4PEPF00027A69.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::b4) by AM8P251CA0007.outlook.office365.com
 (2603:10a6:20b:21b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17 via Frontend
 Transport; Tue, 11 Jun 2024 04:59:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AM4PEPF00027A69.mail.protection.outlook.com (10.167.16.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Tue, 11 Jun 2024 04:59:10 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.50) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 11 Jun 2024 04:59:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQ9DSfBJ3hxCPUu2nsqHsJxVDJ1Xcnn7TpWwUaVvgjK0uovKdN0RnsUVosQVpgzqlyqWJPwMTvpfrbY6wxXLIKn8iUOAhhpLEUB2S5fjQ28JdkZf4HVZ3DnDCga05jT/55pk1t2eRSnyvipVZaZ1s9wu5j1cMwO3f+wQrRUTolxx4MEDqGD9FutJ+3lK9SUajr8pMCI6mQLK+/QI9lrne6jnR05PmLatjG2Yf2OQNveavZlocHAZmojJh6KBEyiTERnIyLPRFBeR24XRrURNudOj6s8q/zO90RDKukoSBlLAlpBITEQjyA5W752o1AWKowN0SQo+W7WIcIYjJ4SRmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSrgBEDg/x5xjiPuzu/DZbK7ExnaLlbIAqAEjazgMys=;
 b=S3GMr1bU+mJVLstZ+x/FCavxiIzXMVC7S84212jJ+zFLJC8WQHXX81j7ip7S19iDk4oSIBfN9c5e18OszbD6c041MbLJd/8P9ymT29MhwNJCoVbcglgklrZw3wJTAfafab7JQXul1FadXXsQ0UYENr70WlCNcEtrlmZoTOx/F6uCE5b6uPexJYEf9Iu355b+xdoH3qVo1BAZsQD3g6/gkijaA/8RuNh1tzXDsjctE2rMMVcjHtyQ+q0hNJvZL+ngKKRlwt16hUaIfszMvfdNa9oDUBlAqR/Hu2USxJjswNDZpOTbPPYOY7GKZBrERGGgdpsFVqfrbhFwpd8ZaXbkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSrgBEDg/x5xjiPuzu/DZbK7ExnaLlbIAqAEjazgMys=;
 b=SqBp09jFqJwlU8KV1rE0Bicb8EDFtAydv+YQLFmmZlky85Yru+0RdqiqVDcxwSE4X/gSUlNH44fz3ireGPoIUXrTbn6VDU6J0p8C/e0pe2+hOR5QpWqH1GZ6QHH8gOjKdlS5smZ71b2TjLtfQcZ+Mw2w7S2IMBuTm6ImoMn2/WqN76hBF9TT8Rlp31LRU6R3M8wy9mWGeBgdXpZwLwKLzBaZyssKedoK8iucGG59tHzIgc70CfbcKgXMuvpJ8WDp5TrbpmBI9xoJRxkDaLOw3k1C1KwgPfJLoeZX0cYsnQwPGs76r+Unov1zdy70qJGNpqxpGNYKo7cMri04CVUWNg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AM7PR04MB7175.eurprd04.prod.outlook.com (2603:10a6:20b:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 04:59:08 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%6]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 04:59:08 +0000
Message-ID: <2cd9d6ad-7154-486c-b64c-e5ea1ecd17c9@topic.nl>
Date: Tue, 11 Jun 2024 06:59:07 +0200
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
 <023d03d8-ef52-41e5-be9b-d75be49c615c@topic.nl>
 <20240606002805.bziyz3y4bcysdysv@synopsys.com>
 <d4322992-8aa4-4eb7-b7f6-63b1b706ad7a@topic.nl>
 <20240606202127.6gdk6v3jevrmoyzk@synopsys.com>
 <a630f365-7a7b-46e9-b5a4-9b150f31d74f@topic.nl>
 <20240607225731.2d24p4as4x7mrfaf@synopsys.com>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20240607225731.2d24p4as4x7mrfaf@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM9P250CA0026.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::31) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|AM7PR04MB7175:EE_|AM4PEPF00027A69:EE_|VI2PR04MB11073:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d0ffc92-4495-4254-d8d5-08dc89d33b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|52116005|1800799015|366007|38350700005;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dnNRS2NNaWRtUVFqMlNoQ3dJQUNwZDlXNC8zVmNvTStSYXRPVmRSN0Q2YjJW?=
 =?utf-8?B?VGtrbHlmalY4U3hkWFpNeVh3SCt2L1NFWFkySDRHL3o2YXVhcEg3U0h4MVFB?=
 =?utf-8?B?RTRiN1RldE4raGdBTmJqNGh1Sk9GbExGRHI3QkQ3clBhaHUzU00xb0tlbGdi?=
 =?utf-8?B?ZTFrN3p0MVhGMXYxdDdReHpzcWUvWklFVTVyeFVuTXRzSmZxTEczeHg1UDZX?=
 =?utf-8?B?THBmM3NYamRoN1NGNUx4RFc0Y3NoeDhLaFV1UmJybWlhT3hyemNMTHFYazBR?=
 =?utf-8?B?UlN6WktoK2tnSnhtak1nQWhvTkJ6dUNTYVJIQWhsREd0eWd3bXE3b0R0K0Fj?=
 =?utf-8?B?V1ErRWRacjhKQ3FESE1XOG5DQmRHMENsQ0hHSHpiak41TTBqWUFLQXppbEt5?=
 =?utf-8?B?VFI3QlF4S1hPYWIxS01ENHJNOTRtZ2Q4T2wxbWRYVjQ2cEJKOVFBOFBWRGpt?=
 =?utf-8?B?dFo3VTlTRWE1QmlaSkg1WHloRXRuWEM0UzBpUFAwckQyT3d2eVluOTJlY0lh?=
 =?utf-8?B?RXh6YVFmckd5NG1Qc0Rzc3RzSFlJc1c5WTdxWEFvL3N1RS8zQWljbGI4bnN5?=
 =?utf-8?B?emZGajZ1WnN6RUFaSVk1Zm5QSUdabnBpZUUwbktFV3NOTVBkelJWdGl3Qjlq?=
 =?utf-8?B?SDlnb00rbm4zUDlqTjJIUS9wYk00ZWhlcUJVRkJEbXV4Vndwa1NLYUNqU0Y4?=
 =?utf-8?B?TEJmUE80RlJLMU1Pa0VJZlhhN2JPOWxOMkNhODl6TVZHcHA0T1l6bFBjQkxB?=
 =?utf-8?B?YjBFbjAxS3ZCcVRLRFFRVlMxTzhyWGVZWEZ3MjdZRGIyZnluREtYQi9RcXE1?=
 =?utf-8?B?ZWtvRE9HUHRHWHNNVUxBdFAvL3kyQ2h0T2QxUFdxS0ZyNkNqRW8yRDJmdkRy?=
 =?utf-8?B?N1FRajlaZkc1Zm42ZGtRaXI1Q3hBSXFvZDFMKzZ3WTVtdGdiWUh2UkhYbndU?=
 =?utf-8?B?cFVGOUdNWHloV2dIRDhNcEVMU09oU0YxU1JiWFJHTUlidmwzSXg2b05hQmFP?=
 =?utf-8?B?Zjg0TTI5OXc2R2JaU3JrNWJYd1JTaCtXaHRzcWtTbmV4b2VHZlR5U1QzK0t1?=
 =?utf-8?B?M2lDWittSkJqbHBiVHdmTWxzQ2tKQ29aWlZIMk13RmdsWTE1OWhkQWl0Z3NC?=
 =?utf-8?B?MWhWVEpndWlKbUVQYzY4VlV5ZDFLYmw1dUhmZGhDR05kejRNOG02STlNSWRl?=
 =?utf-8?B?c1JRbGwweDd0V3Z0cEowYUtMc0I5Z3IzcTk2WkIrSmttNFNHV0VpaDN5ckRi?=
 =?utf-8?B?Nk04Znl3L1BzTnUrTDMreDByVVRtMGRtYXFkb3VYdW5udno0Q0h2a2VZZEtU?=
 =?utf-8?B?cVpvMFUvZzZoSmE1SVBUTUdoVGtrWWd1OUxkTWRIaUN6Zm1QbmFTbm52SEMx?=
 =?utf-8?B?eTJFNVovVHdxSFZjdThEaXQybCtQSjhZZnV3RmdlYXlSdXdHRmZOWEMxQ0VM?=
 =?utf-8?B?UGVadWJ3anl1OUJ1Z0Zad2tRbFZXMU1NMmwyS0l5akpOS1VVcXJuN0Z3M1hq?=
 =?utf-8?B?a1RpMXcyRkxvditLQlR2Nk4rZnE5OXdmNFpEOHVDSlhGa1VHSXkvSUhLcnM2?=
 =?utf-8?B?aFVDR2FVWXJYZjNCODhHMDZVeXFVQUYvR2RScDJBWnlHS0VENWFsUVRMNFhI?=
 =?utf-8?B?eXkraEh6UndYSFdDUkZsdVFYczg3RVRLVjU5T1cxOXFIKzRqc25sNCtLeUhS?=
 =?utf-8?B?OVZzU3ZCVHo3Q05GUjFGMkoxYUhDUjdpY2RvaThrOVM1Wk0rZER3ZHBXbE1y?=
 =?utf-8?Q?ikJDHFjqzWNhC2DoYbPRl3hwUOtxrvliqSOJdj6?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7175
X-CodeTwo-MessageID: 03a338db-d4cb-441b-b118-63325f322bb1.20240611045910@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	67f4bebf-1b26-4d8d-1139-08dc89d339ad
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|35042699013|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGJnWFo2SUkrY0ZaM3lNQXFTMkkvN292MW9jY2k3MlZZQlFmeGwwZjN5MGFH?=
 =?utf-8?B?eExHQzhpaU9HR2lzNGp1aER1UVRqc08yM0xvRCs3TXdnNWNTL3p6c0p2ZHNS?=
 =?utf-8?B?ckZWYU9xMkUvTU5DaElOMWZqMW1nSlp6MXY3aFFJdU0xN3RrYWk0UWYyTVpr?=
 =?utf-8?B?NFZsU0FqTFJScXBFUUlNOTRXanpoeEVtaEJGanlQWlpaUjF2RmhmUHNvK0lp?=
 =?utf-8?B?OTR1RWN2bC9hRXdwZTJZZjhkTGZGQWFqamFlU3FXRkJTUHppcCtZT3VaQksz?=
 =?utf-8?B?QytaU1V0cjkvemMzbjFBNUhESGVONEpHRnFrTnppVnNXSjJvVXRhKzNLQjBZ?=
 =?utf-8?B?UEdIc0ptSDRYb2tEa1JwWERTbWtXZG1vNWE4Rk50a3VCZ0liSklCSkt5YkpI?=
 =?utf-8?B?Yk81ZzgxeXpFYzdiQjdyMzQxSXQ5THBMQVNzU1FwSkV6WUVaVmRhN1lMa3VB?=
 =?utf-8?B?dGtzcmtiNkVJOURaNkEwRFlxa3B1UXI2UmtERUZna2hMM2JzQWxmWTFUNHhn?=
 =?utf-8?B?TjJHMmNQbXZPT3pRbGZCTXJHSnd5NTlYMGxLM2gvZTJEcW1MVG5wZG5SSlgr?=
 =?utf-8?B?ZkhFa3RVaGVaYWl3TTFmbWpaMjcxUzJzTWNVL0l3a0FMOWprakQxbVFCbmpC?=
 =?utf-8?B?MkN2QWJaL0pYN3B1anAxRk5vQWZXcFR6clB2MVZvZzJPV0p0emZ6YXJ0T0hn?=
 =?utf-8?B?TTZ6dGpZQk1hV0RqRFJhcngwdDFXSEVYL2R3ajFKQ25FSXJ4aEZvZmZOT3k1?=
 =?utf-8?B?dGltQzVFb1hnMXUvd2lZOGo3SUhTRFVEVXdXZkwwWEdoNXA2bmU5V0x0Q05H?=
 =?utf-8?B?MUs5ckU0Q1RwZFI5cndKMi9oeHhqcTdxT1VZZE5iYy95VlpSVklkbXNxN2ZH?=
 =?utf-8?B?QzVoQmRad0JaWDZkM3pFWDc2cGMxVXRiMjA1amxuUXR2bWM0VVFyU1c1ZXF2?=
 =?utf-8?B?NGhtSklvUCsya0c3VFV5bE50TjlXcFhYRStWZ2pzdVR6V3JLVHI4Z1E4b2FQ?=
 =?utf-8?B?UCtIanczVXI2YmhjN3dPN25kMzNjY1lUak1QWnVQNXJWUzdmdjJSL21LU3Fz?=
 =?utf-8?B?c2dQcGFzck9CNTFubFYzZzhmS2FIMlVQMG5udExHRWU2QTFsYXV3TnMwUlVt?=
 =?utf-8?B?TXdKK3o3TXRPazFsQ2hITW83Q2pDRHRLVm9vQzllTjdWMzVZUWlqNXp0Q2Nh?=
 =?utf-8?B?OW5nNDZpRDV2NmlFR2Y2S1MyWTFGODg0ckVxbWl4T2EvaGVrSHRxdEJsejM3?=
 =?utf-8?B?UHJ5aXRGVWRvNVl5ZWw1TVd3RUlkRzVlUldpbkpNRjJlOFowSzRQeVJXVTA2?=
 =?utf-8?B?WXNNSTlhNm9mTnUwOCtlUkZyNkltUUM5bEhxQWphUEZzZ0FaYllTejNTU2Iw?=
 =?utf-8?B?RTgrVzZPR0FDelQ4MHRtenlmaXZwRHN3SDNpcld0UjJkSVNaNjlEeFhjYnNO?=
 =?utf-8?B?MTlpc05XWWU3N2QzMjVzbllqSHlKMVlnLzVJdnIrT0lRU3VGTlNJeFA4UzJ3?=
 =?utf-8?B?aE80Q0RZeGI2ZkVjb0J4dkdKRXZWQU0rVEtHRkt2UmlSZ3RPb1FsazBQREpQ?=
 =?utf-8?B?aDRDSitPN2JTdklnOFBXNDBPbW5PNUU5WTVFZGd4Vi9WenlSTHplSHBmaGMw?=
 =?utf-8?B?c2V4akZuaGhaNjkvT0Z4Nk1DTDNIeEFoem43eHd0U01JTFUyU0ovRnhmcnFI?=
 =?utf-8?B?S2FzYkdWUFNUMndEYWcxeTVzallDODJyMTVrRFdWOHg2d0c1Ynp5eVZoU2Mz?=
 =?utf-8?B?V0VKSHh1NnVpRTU4MUh4TzQxemxORkRCbjRxZ3RCaVM2OXRsZDAyOEJPU0Zj?=
 =?utf-8?Q?K5FAj4GS+88oAg1vPX1wS1KoWGgiRU+NgVV+4=3D?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(82310400017)(35042699013)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 04:59:10.7508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0ffc92-4495-4254-d8d5-08dc89d33b69
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A69.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11073

On 08-06-2024 00:57, Thinh Nguyen wrote:
> On Fri, Jun 07, 2024, Mike Looijmans wrote:
>> On 06-06-2024 22:21, Thinh Nguyen wrote:
>>> On Thu, Jun 06, 2024, Mike Looijmans wrote:
>>>> On 06-06-2024 02:28, Thinh Nguyen wrote:
>>>>> On Wed, Jun 05, 2024, Mike Looijmans wrote:
>>>>>> On 05-06-2024 01:06, Thinh Nguyen wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Tue, Jun 04, 2024, Mike Looijmans wrote:
>>>>>>>> On 04-06-2024 03:03, Thinh Nguyen wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On Mon, Jun 03, 2024, Mike Looijmans wrote:
>>>>>>>>>> When disconnecting the USB cable on an LS1028 device, nothing ha=
ppens
>>>>>>>>>> in userspace, which keeps thinking everything is still up and ru=
nning.
>>>>>>>>>> Turns out that the DWC3 controller only sends DWC3_DEVICE_EVENT_=
SUSPEND
>>>>>>>>>> in that case, and not a DWC3_DEVICE_EVENT_DISCONNECT as one woul=
d
>>>>>>>>>> expect. As a result, sysfs attribute "state" remains "configured=
"
>>>>>>>>>> until something resets it.
>>>>>>>>>>
>>>>>>>>>> Forward the "suspended" state to sysfs, so that the "state" at l=
east
>>>>>>>>>> changes into "suspended" when one removes the cable, and hence a=
lso
>>>>>>>>>> matches the gadget's state when really suspended.
>>>>>>>>> On disconnection, did you see disconnect interrupt? If so, it sho=
uld
>>>>>>>>> transition to USB_STATE_NOATTACHED. This change doesn't seem to d=
irectly
>>>>>>>>> address your issue. Can you provide the driver tracepoints?
>>>>>>>> The device doesn't issue a disconnect event, I didn't have tracing=
 enabled
>>>>>>>> in the kernel but added some dev_info() calls to determine what wa=
s going
>>>>>>>> on. Added this to dwc3_process_event_entry():
>>>>>>>>
>>>>>>>> dev_info(dwc->dev, "event: 0x%x type=3D0x%x", event->raw, event->t=
ype.type);
>>>>>>>>
>>>>>>>> When disconnecting the cable from the host, I see this:
>>>>>>>>
>>>>>>>> [=C2=A0=C2=A0 50.841411] dwc3 3110000.usb: event: 0x6084 type=3D0x=
42
>>>>>>>> [=C2=A0=C2=A0 50.841457] dwc3 3110000.usb: event: 0x4086 type=3D0x=
43
>>>>>>>> [=C2=A0=C2=A0 50.841494] dwc3 3110000.usb: event: 0x6084 type=3D0x=
42
>>>>>>>> [=C2=A0=C2=A0 50.841534] dwc3 3110000.usb: event: 0x4086 type=3D0x=
43
>>>>>>>> [=C2=A0=C2=A0 50.841571] dwc3 3110000.usb: event: 0x4086 type=3D0x=
43
>>>>>>>> [=C2=A0=C2=A0 52.650990] dwc3 3110000.usb: event: 0x30601 type=3D0=
x0
>>>>>>>>
>>>>>>>> The "0x4086" and "0x6084" messages are endpoint events that occur =
all the
>>>>>>>> time while connected. The last event is the "suspend" one. After t=
hat, total
>>>>>>>> silence.
>>>>>>>>
>>>>>>>> If you need traces, please point me to a description on how to obt=
ain them.
>>>>>>>>
>>>>>>>>
>>>>>>> Let me know if you run into issues following this instructions to
>>>>>>> capture the tracepoints:
>>>>>>> https://urldefense.com/v3/__https://docs.kernel.org/driver-api/usb/=
dwc3.html*required-information__;Iw!!A4F2R9G_pg!bahfjil5HEUq-fOHAwDfusutLJC=
LognfyLHTFLiSlVuZotpr99XBGg7nB0zRRnNF_M1pqEKcVa4KxNJwh3_F2dZWwVKTkUY$
>>>>>> I've attached the traces as a tarball. Hope it survives.
>>>>> Got them. Thanks.
>>>>>
>>>>>> At the start, the USB is up and running (and doing ethernet+mass sto=
rage). I
>>>>>> saved the trace after pulling the USB cable.
>>>>>>
>>>>>    From the capture, we can see that there's no system suspend, so th=
ere's
>>>>> no soft-disconnect.
>>>>>
>>>>> Base on the suspend event, you're running in usb2 speed (ignore the
>>>>> incorrect U3 state, should be L2):
>>>>>
>>>>> 	irq/94-dwc3-631     [000] D..1.   149.139290: dwc3_event: event (000=
30601): Suspend [U3]
>>>>>
>>>>> The DSTS from the regdump indicated that you're still in L2 despite
>>>>> disconnected. Looks like the phy was unable to detect and wakeup from
>>>>> the disconnection to notify the controller.
>>>>>
>>>>> Can you experiment with setting "snps,dis_u2_susphy_quirk" to disable
>>>>> usb2 phy suspend.
>>>> Adding snps,dis_u2_susphy_quirk doesn't make a difference, behavior is
>>>> identical.
>>>>
>>>>
>>>>> Does your device support SuperSpeed? If so, do you observe the same
>>>>> behavior while operating in SuperSpeed?
>>>> Just checked, still connects with superspeed. What led you to think it=
 was
>>>> only high speed?
>>>>
>>> Bit(4) of event info (0003) from device event value (00030601) indicate=
s
>>> usb2 speed.
>>>
>>> Register DSTS field 2:0 indicates fullspeed. Even though this was
>>> captured after disconnection, the linkstate did not change, which led m=
e
>>> to think that the connected speed did not change to Es.Disable either.
>>>
>>>> Do you want me to send new traces?
>>>>
>>> Can you also try to disable usb3 phy suspend with
>>> "snps,dis_u3_susphy_quirk" if you think it's connected in SuperSpeed?
>> Added this to the devicetree, but also no change in behavior.
>>
>>
>>> Please capture the traces again if it's operating in SuperSpeed.
>> I've attached new traces. Connected at superspeed (host reports "supersp=
eed"
>> in its dmesg log, and the real data transfer speed is way above highspee=
d)
>>
>> I added register dumps before and after the disconnect.
>>
> Thanks for the trace. It's indeed operating in SuperSpeed in the
> connected regdump. However, the GUSB3PIPECTL.SUSPENDENABLE is still set.
> Can you double check if you properly set the "snps,dis_u3_susphy_quirk"?

The trace was made before I added the property. It doesn't change the=20
behavior. Should I create a new trace?


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




