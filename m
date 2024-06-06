Return-Path: <linux-usb+bounces-10986-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBAE8FF073
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 17:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 288531C261FB
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 15:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2743E19924D;
	Thu,  6 Jun 2024 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="q/Zo0AZU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="ncEeg/P6"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2138.outbound.protection.outlook.com [40.107.8.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1DF19922E
	for <linux-usb@vger.kernel.org>; Thu,  6 Jun 2024 15:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.8.138
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717686728; cv=fail; b=dg+qv49tlVzxQz8aNjVSAiTBnXll/da02AM8KaxSeIOD6wB/gHnFNBJJeORX2bHDglDH318X8aY8SWFFe9HDR7yf728ctv1wXfEC15WQbZs8A971suSpQYoCw8d7pXyTutAz3T0DJyd7LA4Z5Wt4NzS+Y5HaniRRxH30LEHWoHc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717686728; c=relaxed/simple;
	bh=FuWILLbcJsHFffcWeUbTI7ZbAGo51Sjiqtc89BxTs5A=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bRQa3jtO7qSsV2/JP6SgYe9wkZJpwI8kypEVSafC6oIXtVquqkpt5J6LKsYd+VIJbkGef+1RCGQo++az7HJ++bxb8I2oCoLZ5wz4YhHteOxfkCF+79G+L9yt4/30C83DVrA4J6kf8TFB+kKUVhZauFwtPB+4jI7U74QY9/pwlvQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=q/Zo0AZU; dkim=fail (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=ncEeg/P6 reason="signature verification failed"; arc=fail smtp.client-ip=40.107.8.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=fail;
 b=BigXJzuwl6TzIITi69OLThK+0lUzrftQ0HAXS3+Td5oiWRnJT9MSNmylsQIBHqsrDqGP9Bk6vISpDnSbaH9HPT3d/274KvYy5AlKLs2fLKJbc1AvHuqnP0g0ELvr0eFqcIuxT1O0zl5V76LXJ4ApCNggwHZY2prT2+KFJRJSN1NvCoIwg7DVBMuHDwh3RB7jer2tcR4uDdk6Jva8YLTwTXbYnCqMHXsdQcZ1dw604WIycFf19WA2zbBiicfFzY1xBM4lX51ETDsnG8k8r30mlfGbToSw1nww9Hn3x4reLc/L3iGrlbkCaqrNuapAtsrtOjt429dXRwepgREZGh1tBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLrCTTWr7X1FRnw3wkn45O5gpdhHavUd0lA0SKuk3/w=;
 b=R4IyFxv4a66zuFR1SKKraZdDHwwrVnKJ/0Ltqx4xecIkPFpxNpejiF1J+JnnHIwItb8vuFjuoK6mF35JCqf2Z8Wb0zLZDS9nw4haC9mykD0LTIj0SEmtmnQx/b5JXhj3/iuRNlHrUS89rjOAPWzLKJu8wP3s5CzIrC6H8FfqPjs+7uCZXGh5sjYvuXFiL6re2BbsScayQ6HRt4C0+IBDE5r7tIGep6z5jzQoI1MY6GLx1rK+wRo3Q/ZNuxijEKu4pgw1RVPV1/W9OsOSch0GDoaQRBsazI20yn8vC0Ud/m7CsvW5OakM1M/VGMlBMM8G6pvJQ9xArNrBWRDPfd4gUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=synopsys.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=fail (signature did not verify) header.d=topic.nl; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLrCTTWr7X1FRnw3wkn45O5gpdhHavUd0lA0SKuk3/w=;
 b=q/Zo0AZUnAxuBW7BE/Eh0e/4dcGBA7aBvd9l4sPpwm1uYHCWu/HHyC1q1+SzYuzsHDHupRtFBB+s997un7E5ZA9zgZo3OU1T0jgZbgfn66AbJ8uLxjM0zZ9T1+hM5l2yl6mKuQqKTzmpbLUbUjSs+HkXVbzKjsWbwx5fJ7ZwLNGBBuZgOOetNa2GfgTTQciATFXtSHOrv0ttjzGAy5OcHvU1MPnm9QBgdH41sSQBrg5X5RzwGOJHIptKFDIGVuaYL9g+f2uvxpp1eW4m8s53ie0Xaoz1AC+nnO+9w4BIUZ+xY2PBkPbRQgnEnc65i/ulzMDLvkHT55Gi9Nhow8fmGA==
Received: from AS9PR05CA0075.eurprd05.prod.outlook.com (2603:10a6:20b:499::35)
 by AM7PR04MB6869.eurprd04.prod.outlook.com (2603:10a6:20b:dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 15:12:01 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:20b:499:cafe::24) by AS9PR05CA0075.outlook.office365.com
 (2603:10a6:20b:499::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.20 via Frontend
 Transport; Thu, 6 Jun 2024 15:12:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=fail (signature did not verify)
 header.d=topic.nl;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 15:11:59 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.168) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 06 Jun 2024 15:11:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3Gc8adOPG6WVzsI/EPYhwAgDSdEwZuszlDfGWhi9tW30Htf7Bh+C/LLyLmQ4IEDBgQ29V1pAYdVy5ftthx6cfOIKH6GymOqy/+PS6oM8sMZZuUZABkva+X7897KcPxpg3zxMxWOQ7M5ADpP9PBY/0TYWsthl76rZQymvLqLK1VeyqF40tJ9Bs0XzSjx7BWY9QMdbV4iHXdwV6dfadQ+cCjBd43LXC1UlxNTiHrJ4oY5uynM7Z+5A6FOX4sL/wc4cJmLwVXwaUmDHGXBOER6ONU54WtQzQvmqNDl1mgyqSiSLkmB3dGDXOtUQFNAfdANm8p4UYQyXiV2UH0DaZCHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiWFbd81zaLR3mHeWGPaONQMo993fllae0wR7AroxoQ=;
 b=TDH51D8ZhRij7HKD8c950BWqNKkITILP1p7KG2cx1mw+UECZ4zDyXt6DAPzRLp/zn5TfBmgCemmF4NVSlUwqSBQ9OiF1gMITKZ9XZVAkR9yvAsjfSVm110QRu/unR/Zbc93pHN9QmznaF7mPLQ6prViSB5bdubRQBHQB6pClhzlqJ9jcIoKP7EGRp+hDipL3VJSgem6chFHJaUZNDhAPkucNvo1onBYw+hd4JjO38pY7QGEvgYQH7GX7gsXXXTZY43w/WajqVTgj9U0g3h1WvasEEzm+jQ3mHoeB2wKPNvKJdqLB+9fBC6YB2vcZRD6hLrqzOvXrIOSQD+FEHDlB5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiWFbd81zaLR3mHeWGPaONQMo993fllae0wR7AroxoQ=;
 b=ncEeg/P6MiEuGxMtEmIg3tieVzXx3mr2fhzfTAjlhNWkGHv5Ni8sqHCCt6FB9DltP2BDT8AOH5YPKn1K7meILdGk2btxo9IaJ+RYdWYl+nd6Fi7FpdG+Uge9lIjxAdleYozM1Ju/6ec1wFaNOD+AVvZxJQnl1OBIn4g5tBLbMqsNlajBuGV6U2vCJ3NHX1/VXFzgioA3IliugXiRL7gd2KdTV1RZERGj2K0kdtWQWvdVKs9SoB114Jh0Fcihr/l4n1R/eUnYZ2DHuqKaoDHVYj/xIXjpy4j9oEy2AiYB9by0GBytNoUbwrKuWMoJRhF4LCZdrJn+81vf0hVwE5rf0A==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by PA4PR04MB9320.eurprd04.prod.outlook.com (2603:10a6:102:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Thu, 6 Jun
 2024 15:11:55 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%6]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 15:11:55 +0000
Message-ID: <d4322992-8aa4-4eb7-b7f6-63b1b706ad7a@topic.nl>
Date: Thu, 6 Jun 2024 17:11:54 +0200
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
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20240606002805.bziyz3y4bcysdysv@synopsys.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::14) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|PA4PR04MB9320:EE_|AMS0EPF00000194:EE_|AM7PR04MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: c1770ccc-9958-47f3-bbf4-08dc863b0384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|52116005|366007|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d3k3MUF3OElkMXFBaXZjK1ZIZHZ6VEp4YXdYZisxVHJ6WlBEU0hUVFh2ZGVi?=
 =?utf-8?B?MmNYOE1DRTJud2FpclE5dVdOd1NKNHB6ZzhXN0tMZ1FWQVFWQktVTXZ0NFIw?=
 =?utf-8?B?VDE5aU9qb0hBQVhVT1lTMjhHemhqQXZKU0ZXaDlxZzlDdklXcGg1ck5sRlZ5?=
 =?utf-8?B?cjdiR1N3MHZ1N280cHNSS1hKNlBaT05tSE9keE9TZWZGc1BsSy9XNXo0N3gw?=
 =?utf-8?B?MGZHdHZrVVNOcXRSYkJZVGgwUFB5eWF2M3NkMXRKNVVrVVlOMmxBMzF6WWsv?=
 =?utf-8?B?MGNqN0JUTUxicFgzSzBlSGQxV0tSME9PRCtVMVFyYlJ5RGdOU0pXTEZpazFk?=
 =?utf-8?B?L0NlcG5Mb2pJYWQ4aXJvMG1wVmxPK213OVR2NCtDdkt1S0ZsRTdyNi9QZ3JO?=
 =?utf-8?B?QUpMblY2eC96MGpNcm1qdnBIZCtRczIxY2JuaVJZT05pSXpiU2NjUDRuZVhH?=
 =?utf-8?B?K1N5QzZtb2gwS2ovSXFhaUpYVlVuOWR1aEFpVDM5TmVEN3dzUlNqdmdSTkZE?=
 =?utf-8?B?SVBIaDJBWDJtTlZHRCtwbUhqS0pVMnMvbXFGYXpJNk01dEw0ZEM2cVJCT1Z0?=
 =?utf-8?B?eUNmOXhYck5yLzJDUHg1UEQ4UmlOYmt2SnNIZmZ6WDZ0S3ZXYTFoQjZSOEtr?=
 =?utf-8?B?MC8zbThMc1V1RWNYSXdYN1krcGhlc2xxaUtLS3o2YTN3VVMyTGM0TXQwVWlp?=
 =?utf-8?B?Ukh4ODlxZ1JiM2o0TmhlUGRYK3VTSjBuZTJML0ZRV090Qkt6MmZJVDR5MzA2?=
 =?utf-8?B?VkRmSkJKRDhOVXdVZStmZXBvUU1qUmk4RXFqdld0dkl5MTcyN3VFcWNybkJt?=
 =?utf-8?B?aHZoRytqMHFaZDlYdGRBUXJVcTlqT0ZWYVUrUzNoOFEwNUlaWWx6MmJPeFly?=
 =?utf-8?B?L3NFcks3a0ZLcFBRUkQvc3ROZnRuUDRiT1RWYkZYeDlIUmNza1ZjTW11T2NJ?=
 =?utf-8?B?cW95MW5jcTBVVXVKSXhHUEVhbmlsOHVleitmbmcvV3pjNlNKakVidU9kaXhN?=
 =?utf-8?B?ZG9SOXVaMmVQOXNLUDlsa3pRVmVGbDNCQWpzUEpZVjk3SlM1MERJa3Njdlo0?=
 =?utf-8?B?ckZXM0lnWldGWHY2aktkWk1tQ0UrM3o2ZENBTkRKVlp4RXUzSWI2MFFXQlFu?=
 =?utf-8?B?dXR3UFlFZU1ZQkpsMlVmR1E3OWVVWDZOQWN0dTUycThQbXRDYjZyTEdkUnJk?=
 =?utf-8?B?eU9hYzF1OUVZUkxtWTkrUGZleEo1SnpWNzdQZ1hwU012Qy8vZW9BMGwzMEJU?=
 =?utf-8?B?bHdKWm8rWDhPQjgweVlHNC8xZ1F0a2VHSVRMa08rOTRDSFE5M0xPMHMwb2Fa?=
 =?utf-8?B?aEh2RTR0NVdkbU9XdE05Y2lkeVdEaXhMUDQwTWt1ZmxKV1NOdnJrU29JaWdr?=
 =?utf-8?B?TkJOUEhWc0Q4b3V4Z0U3YUd0YnpEd3dIbG9TOVFjRVV0S25PZHhNWGxlT0tz?=
 =?utf-8?B?ZElXcTY5ZUdVQ3daMW9YT3V6Q09SYWJuN3dVWW0xa1FISHQ5ZlNCNVlSaG1U?=
 =?utf-8?B?QXpkTFpJR3A1OHdhaHZBYTh6OUF5MnhHeTBmbFZ2M1U0WTRUNWlSbXVVZk1G?=
 =?utf-8?B?U0Z2dmVDQkU4U0JCWmdGMEtwR2dZQVBwdURoWGN3K0NSdGhaNjFVaitZWUJG?=
 =?utf-8?B?Q0tYUnp4SlhtZlBBNGZxQjF4U1U1YlpLVHhsYlVEd2QvQmlMcExGQnJTUzFi?=
 =?utf-8?B?VFZyUllxZFc5aG1rRGh5QWNyTWN3RFo2VTMyZW1HMmNtbERrbXBjK1RyQ3Vq?=
 =?utf-8?Q?BQP2jxErz9PfHmnxUNt+j6s/ywiqUNg550YbfEG?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(366007)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9320
X-CodeTwo-MessageID: b3668c28-6a06-49c0-b40a-86e197243826.20240606151159@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c38a09e8-e37e-4546-5602-08dc863b00dd
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|35042699013|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWwwNFU1elIvdXRxaTJ0RGd4TE9YS2dldFEzdjBya1JDWGQ2THNyZ1dVTDNy?=
 =?utf-8?B?SjZPNGtRUUpFUWRWVCt3YitZaEFyTS9HZXBBem9ucmJ5MXl4NGgvRlRhYmJN?=
 =?utf-8?B?YVFOc2xnRGNlQlIvODVUOS9EZU1LUWY3VkZqaWh0M1I2Nkt4T3JnZUJmWVQ3?=
 =?utf-8?B?VkxvTUJtOWxnYUdnVWl3Q2pkRmg0R2doR0NEMUJyR3lCbzJSU29YcFY4NE9N?=
 =?utf-8?B?Y0R3aTQ5bXJDMjErUUNrSVpqWmxINDVNTDZLSVduVTBhTDFnaWNjejlZa01Y?=
 =?utf-8?B?TkEzL1kzOWJMQUI2MVF1RWJubFplcS9mbk95UjY1NysxZ3padEYzZ1VLc0FH?=
 =?utf-8?B?RDZmZ0w2azlwQUlHV0x3M3ZoU1d6amNVWWVFRzNuWGNVUm1ISUJYTWFxMEtw?=
 =?utf-8?B?UkdoZ1Z5S3NhdllHcjc2bFFCWWRwMXM4cE40VVI3elRKbXlsM3d2eHdZaDFN?=
 =?utf-8?B?cGEycWplTGdTTWY5bEhzWUVLL05KWmd5akNUelRrZmdudmNzeTJOL2RqL1ln?=
 =?utf-8?B?ek4ycnpQWWNNVjBVS1BkMW5KZ3J0M1F4RUJTZlZROXZWQmpicEVmSDkwV2dS?=
 =?utf-8?B?TWxrYjd5QW1MTzNTTW5nQ2oweXZ3SUgrNUtCTlFDSmYrY1pDRUkzakpsVVNW?=
 =?utf-8?B?UUo1b3V5TUZwYTh6VGJuUjhpYlJJWTUvc09XQzdsMVZIS1BzK0VOMGdMT3Ir?=
 =?utf-8?B?QzhEWi9jTm0vcENqcXdEZXUxUExjMjkvU2xQWmVGeGsrSStndmhCL3Z4YStG?=
 =?utf-8?B?WGJlSmJ3QjlYTFQ1WWt2a09uNnp4S25qSkpHRGljVFJxRFdPZlhibTBXVkxD?=
 =?utf-8?B?SHYrOHZQTE5paFFWc21uYmtkazJYWkVUc2hVbGxiUFptMEt0SkxreHhvaEhi?=
 =?utf-8?B?MXEyVktBNnBTQ0pFM1hWWHFsWWJCZU5WZHdPMnZXVzB0T2Z5QXY2T2Zac3FR?=
 =?utf-8?B?L1NUSWxZekhCQUg2OUdCcE4xb2REc0hGSlB4ZHVOdGM3RUp4OFBSMHhWdGxM?=
 =?utf-8?B?azB0T3Y2cVQxdHhKWkNyVEp3TVV2N0dxZWhDd2dZTkZuV2JHQ3pyMjVLa2ps?=
 =?utf-8?B?Nmhjand2aUdlWWhzakdQTGo2N3ZRem5PUnMrSVljZnVuUVI0ZzgwMXo2ckhW?=
 =?utf-8?B?VHJVN2hvQXo1T2RPL0liTlFHYTZ5Wkh6ZThVUWpmbTRUbVBpM0IraXdDZmRJ?=
 =?utf-8?B?RTh1Wm0wV2JWa1FCSVJwQ2xxYThXSVRNd3ZNQkpHNmZXT3lVWkJGYkl6ckNL?=
 =?utf-8?B?SlBTQlhkOE1YcTZqQnlpcTMrbUdUanpHQmhRNCs0cXB4UzdRcEQrWEFCSW1K?=
 =?utf-8?B?SWlQU2hZTVh6bXZnelJGemRvTGR3Qk12QkRQbkVXSjF0Z0lqa2o4ZmxFc2lH?=
 =?utf-8?B?blBhTjJKU3B4RkhXRll3dm1ZdWlsdXozdXZGTnprUE1rbG9NbHFTdzNyaHZj?=
 =?utf-8?B?UHd3VjJSdkcrR2lMNy92SXpIUFdpdW1hVm9GMWJXNTlBVzBFaWk3TDBTSFJE?=
 =?utf-8?B?bk90TWE4VERRNnIxbFBXbXA2R0ZWZU03ZTlOdnpvdzBIbUp4SktNNkwxUG93?=
 =?utf-8?B?bWM3eDhwcm1nZUpPb3dmNHFQbDNCSjBpWm1RSTEwYWNkYk41bFEybittVHBW?=
 =?utf-8?B?TTcyeWZBS2RoSitxTm9XZkdmY2RBckQ0N1pqTnoxQU12QXQ5VG9LZlpMSXln?=
 =?utf-8?B?WEM5UVVYUmd3RHlub0tmanlOQnBma0RiQzRvRWc2WkhNYjdrUksxRXM4dFFT?=
 =?utf-8?B?VjBRU1UwS3llY29MMnpMYUJzajJWRXM5MXFNb1VuM1ZmN3V1MFgzQURpVm1X?=
 =?utf-8?Q?qqRefdi5BEPVApBXVZMnrrWh8WgJsqyqt7uHE=3D?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(35042699013)(36860700004)(376005);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 15:11:59.9834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1770ccc-9958-47f3-bbf4-08dc863b0384
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6869

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
> Got them. Thanks.
>
>> At the start, the USB is up and running (and doing ethernet+mass storage=
). I
>> saved the trace after pulling the USB cable.
>>
>  From the capture, we can see that there's no system suspend, so there's
> no soft-disconnect.
>
> Base on the suspend event, you're running in usb2 speed (ignore the
> incorrect U3 state, should be L2):
>
> 	irq/94-dwc3-631     [000] D..1.   149.139290: dwc3_event: event (0003060=
1): Suspend [U3]
>
> The DSTS from the regdump indicated that you're still in L2 despite
> disconnected. Looks like the phy was unable to detect and wakeup from
> the disconnection to notify the controller.
>
> Can you experiment with setting "snps,dis_u2_susphy_quirk" to disable
> usb2 phy suspend.

Adding snps,dis_u2_susphy_quirk doesn't make a difference, behavior is=20
identical.


>
> Does your device support SuperSpeed? If so, do you observe the same
> behavior while operating in SuperSpeed?

Just checked, still connects with superspeed. What led you to think it=20
was only high speed?

Do you want me to send new traces?



--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




