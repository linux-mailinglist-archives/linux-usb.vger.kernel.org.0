Return-Path: <linux-usb+bounces-10946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AC28FDE5A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 07:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 564681C21C1F
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 05:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295DF39AE7;
	Thu,  6 Jun 2024 05:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="CtU/XTYz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="Cf4ccenV"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2126.outbound.protection.outlook.com [40.107.22.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED9BCA6F
	for <linux-usb@vger.kernel.org>; Thu,  6 Jun 2024 05:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.126
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717653169; cv=fail; b=jR9/ydBFCPX0WcSSeHgGEXfZVXCyFO8a70oA8bkg8yXpMrOw18iEpvrw73tMSEoJZgIxlFcDX+mjFX8pWHR3DKg9hAKoJrvYeXNXn9Zjn88ySR75oSRcDjYjSJyYsj4kOgP+fQTAOhH95YDVoJEKyF87/y5AZS266wyaow1M7Ws=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717653169; c=relaxed/simple;
	bh=bW803QEqNhUCceQ/6ehmh2Bl+XKqxdY9f6dezYG/6bI=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jjxd/j2abq09pYnA0BStvKBsx9aKhqOXqPmYJ5jydJwshJ9fIZioTvNSOJlVDDxs6OPSqP8wxtiYf515hLKcmkFUJu8HBiPfgUxMLrmARbbo4k9EQcPVr9PrL49BtStP+eSOPUqgpbH58khGUCQ7mIM/9QqJ20aM9b4ar92ao80=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=CtU/XTYz; dkim=fail (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=Cf4ccenV reason="signature verification failed"; arc=fail smtp.client-ip=40.107.22.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=gYL+7bqxRH7Y1ueV2Ee55o441XJAXLzHE8LElSo1z53TQdnNv171BTsJd0TwGHP9b78GnxiHjSfB3HUPBq2vPKkHsngxlh3yJ2HYtc7vtUkFJQUCJFO8SkXNowr7H1TWRXTbV/5LBzFLMmZviZLFIPcxj33F80yz0KduBArbqv7QfrReAkKsMddtwaW5bhTrujktHyveDpA3dKULTjaKrneo3/GLivzxf6ginBpD7Nqm+RZf1kaKj2ieXz6xq0Amt4QpQ7usx7m7d/k0aRlNn5b1jJTgFUaZrkCCI40Zo3n+6AxL7CwNAgpKLPfmZJabFmjwvaeviZMvptzI40ge6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iG21XXQTk7yxFPz/r1IKh+PLhXWSnukIaK4jGkyTxq8=;
 b=hAD9B3zZP4lYmG0LU74JwjzMAjkQhcfdQXNvhTHgZypMx/F+fCYpIn3ejOqq+eH/xMYC09lq1rwab+e1EqrTi+ITdY4TrviNivZ9wNjJ1a0Xi7CBvNxCPWGp9EOF2UNUCYnVUD85i2fWNnoa8Qn30+Dsuf5o2o3OmO+GH8i4Pll98Kgf0C2P9oGHMn5/lil/k24O5RTF5ANtRhuxjfWKX6/vneFe8yZxFZBnx8k0vnQKaokOZ/5IaxQGyDwDibPQJpg7569ooPcwMCVcpDnmv0iJ6eVfPbUtPg+ReXkFJD9CBpyAtZjD8Ef58N/MbPPf7vvpTEgxn8i90sdpyhgdIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=synopsys.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (signature did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG21XXQTk7yxFPz/r1IKh+PLhXWSnukIaK4jGkyTxq8=;
 b=CtU/XTYzzaw69oQoOE4fhN7ytfO+eMEwnDsQXkK8nM2tqnZITEQzaK1k0TqN2x2iVaWhDw+l0ozTQYFKlrgh8riBXcYER0iQi+06TkSRD5TCwdUS1ZhiZFqA1/sTkDx8BqUPcA4R+RcfBCksP5ubk3+Sz4JM/oOruKK2xadESmhpfOJZd32hITKaTjTUTgymwS+FbuzbjfEYg7h93Xf9nbPY/Y8l1tHK5i9K/BsM7aXUutpjj3tou4Rw61fm1Hj2AM7KeL55C/qBwICzmuVTiM/jRj6SJQaMKRakWag+cexPHqwGnfK+2YIXwKM/zGKjNE9vgL404M9Pv0Ex2UrMnQ==
Received: from AS4PR10CA0008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::10)
 by DU2PR04MB8821.eurprd04.prod.outlook.com (2603:10a6:10:2e0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Thu, 6 Jun
 2024 05:52:42 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::9f) by AS4PR10CA0008.outlook.office365.com
 (2603:10a6:20b:5dc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.20 via Frontend
 Transport; Thu, 6 Jun 2024 05:52:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.0 via Frontend Transport; Thu, 6 Jun 2024 05:52:41 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (104.47.11.41) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 06 Jun 2024 05:52:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=an0PbLEmNlKSaeTpXNu0AXhepENzHuuj6TiIxJVfm+Ne/49h6R3vsuCvLl7qWGa1g7hJcI+8ycvYFdwvhYNviYl+RFTZR7VeNfP4K5nvQBrU94V2m8ordZ814vNQNiAYru+stEeqvrkYJNyQwEQQUXv+2GDhl5gm+qUM3epe6yCIwT+pb48jyqBYmjMuTBxcH2SzsdFGsjmKH1R/BZnTPdKA7EiZnsgsIgjTShk7A50mh/abHI6s0AWavqaOdfjnq+1HHiKTfEdQQJqgV6zLZka5OcinO/mJSt20xOmd7AcKWnKSDScBwBbNNLQhCQfQpMK3Yd5OYQGFebFFk9Sdwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F735gsaWorSEdK2JVraVipSd/D8x3T1hSHcUQjdfIP0=;
 b=PadiWkkIqSVb+CX6lE1SNIIzX2noF5kc5oDJ5GST5af0vBj1XJrxsLTWspJZWhHJxHMjFlyE9hdeOEnFDW1LLrrLI8DCqxX7PaBT4JT+++NJHhSUFS1llIgjMimbEskXutH525GmpusNsOWBgvIg+ebNT2WOidNGnsqazTCvDKQmDTZA7+G9zZzBkgjgnZlvsrERDTqbBjCylpGH/igJLwXHiMDoCc3Xh3TlUJOXpXaEoS89oXp41ChYNSiwxcK/cpcpJNaxrJVtvunyUJyemTnrvLikxbUGG2kRXzSZ5BQOkqzi39xKCvdCcUWSnZcR+cqdNKpe9OZLp+p7GAejbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F735gsaWorSEdK2JVraVipSd/D8x3T1hSHcUQjdfIP0=;
 b=Cf4ccenVfLU74h9ekv3mxZaCmv5AxHCm0mWxn7AVGeADqfM7GowyruhSMCz+RG8QJZH7zWut2IKllrdRSqKYNWc+TKNTz7nQ4xFwc4BmT14ZTKGLhKvHyn4TEnWPMBL9l9bUxnqQOlGKc806sUQQstGPfiPzhDhH5Uk8NkNGcRJRPSmvibOJCFXnoTPkT+F6aaWAXVfeU5ZyKKNBweZGEqm1CKkitPMn14h8rL8TpDgYFz8xXa9HrWCVst4+DRx/jhlP1igGL9oadj7+KjryU+dfs0XG4Gr3d7USyzA+4vh5ZB2j3MeTJQF8hIYRU5wNT2y/TpNDlwLQA7y6zm/gUw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by PA1PR04MB10322.eurprd04.prod.outlook.com (2603:10a6:102:446::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Thu, 6 Jun
 2024 05:52:38 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%6]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 05:52:38 +0000
Message-ID: <02d2954c-728d-416b-ba17-0f604c6fe7d8@topic.nl>
Date: Thu, 6 Jun 2024 07:52:37 +0200
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
Content-Language: nl
Organization: TOPIC
In-Reply-To: <20240606002805.bziyz3y4bcysdysv@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P250CA0025.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::15) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|PA1PR04MB10322:EE_|AM4PEPF00025F97:EE_|DU2PR04MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: f492c72f-04c3-4ea7-9d1d-08dc85ece109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NWNlVUl4eHd0R0U4SzNMckVQU3QzMnJpWk4rTE9oYkwrTW5uZFE4NVNyNlhs?=
 =?utf-8?B?ZlI1L1c3QWo1U0FnVzJ6V2ExSm5QS01FTk1CazAzUkZVQy9GMGdST1Y0OXBH?=
 =?utf-8?B?MklPNVROdGJZbzVQdmVPcUIrMGsrVGplZlBRT0twSFQwSEY5cVNDRjhXK3VJ?=
 =?utf-8?B?YklQRGZLTE4wcFp5TTcvdTFjOXVDNlBZUUJTTlJRekRwOGJBVGhLT0EzOWRi?=
 =?utf-8?B?cU5vQVBjNmJldFJZSWFrMSs1QlpiRk1Rc2F5Nm1UckR3YmZXc1ROYUlNZHlp?=
 =?utf-8?B?Y0praWx4Z2cyMjVadG1IYUhvMjI5Mzk5Q2hIVGR0c3BkUEhoZFYrR3ZjVTZL?=
 =?utf-8?B?TVIxakpCZzJBczhrVzR0VGFkNmk5V2VjeUorckZPV0dKL2NMS3lNaEhoQis5?=
 =?utf-8?B?bm83YUlub2xxSnpaLzRxbCtidk84VFkwVGlPdEFLbFB0aXh2NDJkUUJ5QjU1?=
 =?utf-8?B?WTRPTFZ5bncxVzRDME13QzhwNUxDa2NscElucER0WllmUDF2L2dKRWhSMTlS?=
 =?utf-8?B?Q0hRTGtDQXIvNHZtQVd5d2hPSHBRVTNDSU1GSm9VbzhiUzdxUFozajgxdVZo?=
 =?utf-8?B?cU1acXc3eFl1SHhtMWtkNHhJWUh6R3NpMGcwcVkvWXpjdThIYjRvQjBRWEYr?=
 =?utf-8?B?ZFYxaTNFU2E3WkFEWWJIamY3TkJJS1grSU5La0lHZjZmOFdYeFJLaFUycVZ6?=
 =?utf-8?B?VkFjb0ZaVzNDY2xYTkVjeVMrVU9WNHVTR3AySk1MbitrVytIMmpXZjIwS1Jl?=
 =?utf-8?B?UENNWVh6Smt1cGNhNGo5NHFNMmY2SnR4TXVsQ244bERzaDVwMTJXODNvZFdI?=
 =?utf-8?B?anBPT2Fjc0dXSjR5Z3lUNWh3MXFNV3ZkMThFdkN2bjJKZ2pjc29XUG5VYjBi?=
 =?utf-8?B?RFRwdm1jMXBYNmttSXdaK0JadEVBR2x0eVpIRGlabnVQYjdoYk53VHdDd3B5?=
 =?utf-8?B?bERGWmptOUR5Um9wdStsMnUxdHBNWkhaQVh3Wjl3MmFqaEU4U2QzLzFvc0R3?=
 =?utf-8?B?ODV3ZFk3cG9xZDlYL3U4V2dzcVFncEJESUpDMFlYT09BRTh2VHJoZys1N294?=
 =?utf-8?B?THV1Y2dXbWY1Z3lvZUZQYnhaL09hZS8zbERTSHM1QTl3dk4wRUdqZ2srZCtw?=
 =?utf-8?B?UXQrN3hiZlNBcDJwS0FmWFNVL2dUVytaU3d5bUQxVlBRQTloSzRKMVk1Vmgy?=
 =?utf-8?B?MW1XdW9uS1lrSmpGdXBDL3QxQUVLOVU4RzdjWXBVZHducGFIdml3ZHhTNVcy?=
 =?utf-8?B?MEpzZkdScThIdmhsMnVoSlQ4KzJuUk92d3o3VE9oNXNZakR3a2NqNlBBL3hi?=
 =?utf-8?B?RHM0YzFUVENZZUtvbGRLK0VIZGpNcG9zbzlvUDdHdXBwZ3F0S21NbXAzMWVT?=
 =?utf-8?B?MjdLaHgxNG9qeTlpSjZBNEFiUHV6RHUyM3MzRWtyWWU2NUZ3b2JET3lsNFRZ?=
 =?utf-8?B?NXJLNGFGbmNML2JPczR4QlJBQk9sVm1yR09MZ2NwaVgvak85UlZUbTZtOXBP?=
 =?utf-8?B?ZUxxbVdqdjZCTm9HWkFrTmFLVjVmTGZlb01icVVSZ0lQR2FyZ0Jyemc5a1BX?=
 =?utf-8?B?bGJTRFhHN2tZeUErQkNkN0w0U1pCdFRzMU1Jc0d3MGZCUGtReHZBRkRQSVNN?=
 =?utf-8?B?MFJhb1plZE81OUtzK0dTamtXRFNkN01ZeXNpUm1PbVYwZHVMT01BTUptRjdZ?=
 =?utf-8?Q?RVr1uFnCDlyD3HZDWtNo?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10322
X-CodeTwo-MessageID: 7f653ef2-d4d1-4d58-b6e1-a0fa6b34e987.20240606055240@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4170fdf7-1e70-4641-7c48-08dc85ecdf1b
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|35042699013|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDljYWp4ZEZ2TXhGb1BaSml6ZG1MRDlwZmg4aHNYNkp4TGxpMjk2RVRxNy9X?=
 =?utf-8?B?OHFLL2xId0JORldvV2k2R3RaaFNDcXkrRUpGOEJUclp3TFhKeHZCU3Zmbnd1?=
 =?utf-8?B?QnlPVlpYaFArZVZnTVltMEUvR0FkY2pQczNoenA1YXFnelRCK0RQVVdCYTBY?=
 =?utf-8?B?L0RXbjZEMEtOVGQwRGJMYzQvb1FFcTlaRXZJNWRoc3VGc0tXUEJXMzdFblEv?=
 =?utf-8?B?dDhMTnFGdEh3Nm1FcGE0QlZhM0l5WEg4TWw3N0JsOUdYSGF3QW43UkcyUWlB?=
 =?utf-8?B?eFpDV1ZBMm8xMzBBS2s4elVGdW00bVlYNHZrVVFZbURQOCtmZW1XbnFlSWMx?=
 =?utf-8?B?KzZZYU5MMGo5VERGYlN2NmRKajc0c05JN2lhM0E3NmVGWUNzdE9zbitSVDBh?=
 =?utf-8?B?QXpDYzVzOGRSc3o2ZUM4cTk0VEVQWldwRllTYmt0RktHb2ZiaEwvTnl3NlBY?=
 =?utf-8?B?M01sMXIrNjFlenloNFFFNVZUWGV3QUdkUVJFek9Xdm4rN1ZqdlBFOU41UDg2?=
 =?utf-8?B?NnJYMlV3UkVvVHlkQXYwNXBYL2N1ek0rWW1vNXo2ZlovdFdyWURIdmw2L3NK?=
 =?utf-8?B?T0hVZWtLMnVOM1lYTnVWQXNxZGkyN0RrZjh4WkZxdlR2Z3l0cXVrdE9yVUpz?=
 =?utf-8?B?WnRnTmRQRmVOQkZjVEx4MjFVdmM4ZjFxV0ViYmZVak9wbUladkMwcmt3VlZT?=
 =?utf-8?B?RFkxU0ptZWRkRlB5UTYvUFpBUnd4bDZaTWY2Qlo2cU1uaUQxQVhGV2toeWtB?=
 =?utf-8?B?VjNENnRvMk04dnVWOC9VSVBtOU5VaXBIYUREQ1ZQeGpkQ0d0dTh0RFdxRmQ4?=
 =?utf-8?B?TXBYN2VoUG92cWZaM1RmeW1RVVFjdUNRbVRoVWlCQ1UwS0M2NnFoT1lDSDZY?=
 =?utf-8?B?VXp1aklzNjlFRFJ5a0hUQWh5bmlaUSswS1dkYjV1blZPU3B2bTZkQ3kzR3Qy?=
 =?utf-8?B?ZEpzdmVtbUtodnpJaVFic2Z2MTkreVJFKzZYVDdHbzJ4VXl2azRqRVZiMXdU?=
 =?utf-8?B?OEpWUlF2M1JJbU44TVEydnBHZW5GVHNmVld3c2xpTmxFajk1ckZxaW5acDNH?=
 =?utf-8?B?amNCT3BLK1BnTFlzbEhDRDZHNXFHSi9BRm5FS2EzeG15OTFTdlFKdnJmWDJQ?=
 =?utf-8?B?RW1lUWhSNlhvQWZLeGJzTU44cmdjQktNUURycmJMc29JNUVxNHEvZU80UTdX?=
 =?utf-8?B?VEtVYUY0cDg0RE1CbDZyUWlLZjA2R3kzSXdNSnVsRGw1TlJhcG0yZ2daL1NZ?=
 =?utf-8?B?cTJFbFkyZjBxaXYxTXJEWFZiSmtLR0YzbWhKM2NPS1hvckREdkRqejRUcDhM?=
 =?utf-8?B?dXhPOXliYXdGdkxDVnQxYXBXZTAzT0hHc2tHNnd1K1kwNmNHR0RDMnlvTWl5?=
 =?utf-8?B?YUlIOVZQMHdlVC9EdGtzekxPYUhway92d3YzKzZLU2dHNXUyakdsN1BIU1Fm?=
 =?utf-8?B?d2JOTk9hUzhRMFR1cnZkQ2NwUEgyWTl0VENwMzRjcEhVM21TLzhPNExnWG5Z?=
 =?utf-8?B?MlFTblRGcERzYzU2SXlYMk5RZHZYdCtYMk1xWlR1SFhka0tuaHdvUyt4QkUw?=
 =?utf-8?B?YmNCODdqS3pvMFovM25IbVdXVERjdVdpVnVFcFhpV2orb1RIRE8vVzhJdUNi?=
 =?utf-8?B?NUsveWZsdVRlN1JoR21UWHNIaytZVHExMXl4MGZ2MTVSakgwcHdoWGtFWk9W?=
 =?utf-8?B?M09XVDU5dDVRWE92WmNnZS91U1BEaDhEZXM5L01qc3lid2QvaGlMYlNwblVj?=
 =?utf-8?B?MitzMktxRjdFczNneFljZ2JNbmdSZkE5WG5iSjljYmdhMXFqN1huUXJVNnp3?=
 =?utf-8?Q?5c4WcKVayvaLg1WAtBM8zx+zvbwiBJy7QHzJQ=3D?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(35042699013)(36860700004);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 05:52:41.3734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f492c72f-04c3-4ea7-9d1d-08dc85ece109
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8821

On 06-06-2024 02:28, Thinh Nguyen wrote:
> On Wed, Jun 05, 2024, Mike Looijmans wrote:
>> On 05-06-2024 01:06, Thinh Nguyen wrote:
>>> Hi,
>>>
>>> On Tue, Jun 04, 2024, Mike Looijmans wrote:
>>>> On 04-06-2024 03:03, Thinh Nguyen wrote:
>>>>> Hi,
>>>>>
>>>>> On Mon, Jun 03, 2024, Mike Looijmans wrote:
>>>>>> When disconnecting the USB cable on an LS1028 device, nothing happen=
s
>>>>>> in userspace, which keeps thinking everything is still up and runnin=
g.
>>>>>> Turns out that the DWC3 controller only sends DWC3_DEVICE_EVENT_SUSP=
END
>>>>>> in that case, and not a DWC3_DEVICE_EVENT_DISCONNECT as one would
>>>>>> expect. As a result, sysfs attribute "state" remains "configured"
>>>>>> until something resets it.
>>>>>>
>>>>>> Forward the "suspended" state to sysfs, so that the "state" at least
>>>>>> changes into "suspended" when one removes the cable, and hence also
>>>>>> matches the gadget's state when really suspended.
>>>>> On disconnection, did you see disconnect interrupt? If so, it should
>>>>> transition to USB_STATE_NOATTACHED. This change doesn't seem to direc=
tly
>>>>> address your issue. Can you provide the driver tracepoints?
>>>> The device doesn't issue a disconnect event, I didn't have tracing ena=
bled
>>>> in the kernel but added some dev_info() calls to determine what was go=
ing
>>>> on. Added this to dwc3_process_event_entry():
>>>>
>>>> dev_info(dwc->dev, "event: 0x%x type=3D0x%x", event->raw, event->type.=
type);
>>>>
>>>> When disconnecting the cable from the host, I see this:
>>>>
>>>> [=C2=A0=C2=A0 50.841411] dwc3 3110000.usb: event: 0x6084 type=3D0x42
>>>> [=C2=A0=C2=A0 50.841457] dwc3 3110000.usb: event: 0x4086 type=3D0x43
>>>> [=C2=A0=C2=A0 50.841494] dwc3 3110000.usb: event: 0x6084 type=3D0x42
>>>> [=C2=A0=C2=A0 50.841534] dwc3 3110000.usb: event: 0x4086 type=3D0x43
>>>> [=C2=A0=C2=A0 50.841571] dwc3 3110000.usb: event: 0x4086 type=3D0x43
>>>> [=C2=A0=C2=A0 52.650990] dwc3 3110000.usb: event: 0x30601 type=3D0x0
>>>>
>>>> The "0x4086" and "0x6084" messages are endpoint events that occur all =
the
>>>> time while connected. The last event is the "suspend" one. After that,=
 total
>>>> silence.
>>>>
>>>> If you need traces, please point me to a description on how to obtain =
them.
>>>>
>>>>
>>> Let me know if you run into issues following this instructions to
>>> capture the tracepoints:
>>> https://urldefense.com/v3/__https://docs.kernel.org/driver-api/usb/dwc3=
.html*required-information__;Iw!!A4F2R9G_pg!bahfjil5HEUq-fOHAwDfusutLJCLogn=
fyLHTFLiSlVuZotpr99XBGg7nB0zRRnNF_M1pqEKcVa4KxNJwh3_F2dZWwVKTkUY$
>> I've attached the traces as a tarball. Hope it survives.
>=20
> Got them. Thanks.
>=20
>>
>> At the start, the USB is up and running (and doing ethernet+mass storage=
). I
>> saved the trace after pulling the USB cable.
>>
>=20
>  From the capture, we can see that there's no system suspend, so there's
> no soft-disconnect.
>=20
> Base on the suspend event, you're running in usb2 speed (ignore the
> incorrect U3 state, should be L2):
>=20
> 	irq/94-dwc3-631     [000] D..1.   149.139290: dwc3_event: event (0003060=
1): Suspend [U3]
>=20
> The DSTS from the regdump indicated that you're still in L2 despite
> disconnected. Looks like the phy was unable to detect and wakeup from
> the disconnection to notify the controller.
>=20
> Can you experiment with setting "snps,dis_u2_susphy_quirk" to disable
> usb2 phy suspend.

Will do.

>=20
> Does your device support SuperSpeed? If so, do you observe the same
> behavior while operating in SuperSpeed?

It does, and it does.

The setup is SuperSpeed capable, and usually connects at this speed, but I=
=20
didn't explicitly check if it set up a SS link for this particular trace. T=
he=20
behavior is always the same, regardless of whether it's in super or just hi=
gh=20
speed.


--=20
Mike Looijmans


