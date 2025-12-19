Return-Path: <linux-usb+bounces-31628-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC8ACCEC65
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 08:18:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3F90304C9CF
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 07:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CD92C327D;
	Fri, 19 Dec 2025 07:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="WJTd7NoI"
X-Original-To: linux-usb@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012025.outbound.protection.outlook.com [40.107.75.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB3B2AD13;
	Fri, 19 Dec 2025 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766128698; cv=fail; b=hxiZzra4lYLe9rsSmdD1jVla7Hc2ICX18MNY3zPp1MlZR+ILEInv3w8pW8Ot45hSFWI4YdWjeoAhvFNHrkDO0FRaF4POWC8S4l7goc251+1P9NkGQ9vFZI6U7LUkCp1lzPkIOZNv3cMzfCU7srpZG8SSJxxgLskVIzHCVQecROQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766128698; c=relaxed/simple;
	bh=sJ7pYpPY32ZUDiXnUGDZcpnpwgjs0y6uY5O7NviMnt0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pCAyK2uWo/PL9nmW/2XucgB2LPOgG0RyLS344Zo9p5rS0LdWE5hfu6aV8ESLaucCZ1o9CZx3HsQW7O41/QFNVCLb/xAYuEnYukaJpMkOvS1fBtMmwkqjXs1zBlnkJFbhMCbgWxjBBw4WJFXdvp/f2qKGRwfQSO/sW3+4/Wx7pEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=WJTd7NoI; arc=fail smtp.client-ip=40.107.75.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPYBi0IPGjvsf0zPbVukfDsciki1Q0nA5OC3/MELIoZnMVNM12+cM+xxWSAYfLRiC2ayoc5IFISJbrBWl29uPZsnqHLCuZxPUdMRoSzxiqVAo/raBpgpjrix2i64H6Q8NQrPAsMcHxftpiRmySFTiIUi0aE9zXlQ1BgAVII4PBKJfRcC3XHtJ8VlEH1iYJhe3AX/aPXNjnZ43eDfkea2NrZNYAZa6F0Ymb9PQ8GcetHeuq74KDg4z8mmzHqpqF8OXwN9e4+G3mgH2IC8+G/sCsdmsVIdSCuo2GFhdRc1grtz3/pTncCNBWqh+tsZSVsLBRGgfXDTOjf/FzFQNvlVXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJ7pYpPY32ZUDiXnUGDZcpnpwgjs0y6uY5O7NviMnt0=;
 b=YcgJR01ncewXEhc8oAA+TfKNFvVe4UHKRYsQnXCZE/3shML2rtUrJmv73mgyXxHE7bFHmNvta3nwaWMIkWX/J7PfvHX4mAS22CwCgUcdjnOWouZFjIsFzQOA7PP9yBCsT3WatMph5tAqHJrKUEbzZtrBcCRMngWulDntRIY+3iLTrW0fCQGQAZod9cQnLpOakCc6WUG/jstqVYyRYoX4XHzGvGnKdWI3PrKu7IMeoz3LQpDNBqYfJPyRjI83jhH2TwxgPcg+hAX3GpZRly6pRhU6v++du+Ct7CGEYoGf6bSHLM2VolX1CfuccvBpheMVylTW0UOrLM1NRYeBj5balQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJ7pYpPY32ZUDiXnUGDZcpnpwgjs0y6uY5O7NviMnt0=;
 b=WJTd7NoIu+xWCjNafLZhxZODQwKuPhF4b7iz7s2Jat0+j2aFKJyqPB9lQUR42RadypGzXKbRtiyQQEmprBb86PTeieLaFaNuiOlYWQLvMRzpOliEDeovgCaSTW0v2gQe+CsBekOZcjlJSR05Resl7fqRxIdKxcoHFm6c8P5WjfOY2+ThrdOpIvA7iovonJ+zKNqzZEB2/AC6aECls0BjNaDqpf9sN+fxsCa0sQtuBREzNIQaWw7dckX9taoIv7DKcXbEksJNGwoOpToJItKN/vnL0xvyz0iihr6Ng9j4v77hBlv92jmi0nyvOGAx1hA5EGLHGXeGNaecfes3brStEg==
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by OSQPR06MB7111.apcprd06.prod.outlook.com (2603:1096:604:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 07:18:11 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::c18d:f7c6:7590:64fe%7]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 07:18:10 +0000
From: =?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Sarah Sharp <sarah.a.sharp@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Subject: [PATCH] usb: xhci: check Null pointer in segment alloc
Thread-Topic: [PATCH] usb: xhci: check Null pointer in segment alloc
Thread-Index: Adxwth5w6+XyiEy+T6yiUQ4BKIwQNA==
Date: Fri, 19 Dec 2025 07:18:10 +0000
Message-ID:
 <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYUPR06MB6217:EE_|OSQPR06MB7111:EE_
x-ms-office365-filtering-correlation-id: daa738f9-c787-4331-2bdc-08de3ecec3e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|376014|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?VDAyL29aZmFjRjZtd2MwMFN6Tjd1eWJrMnBTV2YwR1BuQ1lBdk1ZRkZEVWdo?=
 =?gb2312?B?UDg5Y1FoVFhzdG03VURWQ3Q4cnI5c3l0OGw4eVFza0lrU0xidG5pNFNRUlZU?=
 =?gb2312?B?NXJOYm10ckx5TjhqZUwrTmZJVHNVRW84c1RIMk1lOUpVUjJlVkVhQnNQQzd4?=
 =?gb2312?B?aFRkQlA4cXp5a1BXYlM2eGU4MHJ6TS81SW9GU3MwU1ZJUnpFNDVyZEJRQi91?=
 =?gb2312?B?WjNQTXgrY0lPWEtnWnpyaVI1YnBSVTN3SFdWRUcrdjBERmpyNjkvU0dHVUVz?=
 =?gb2312?B?UG5BWk5qWEszd3d4U1Z3OHQzbnVraEUrU0VTekFyK3lNQU5nSWlXMTdiRjcw?=
 =?gb2312?B?YXo5QnIxaVFPcGxvR0pJalp6OEVwZ1R4M3ZmbW9qUUd4SVNHb3lKWUxtRVZV?=
 =?gb2312?B?dU1rdUJQQ3pOWEVzZzBlMnk5YlFaNzhDQ2UyZmJ6aUt5VFlWaVN2NXljZkdD?=
 =?gb2312?B?anVoeWNUYmVhRXRYZkpHd0d6bXRKZEcwaE5lNUtDSXJqQlJiRnl1QUUycDVq?=
 =?gb2312?B?dThpWmhwVEdFbmdGd1h3SEMvTTBhSmhEMWIzLzlMSEdONWxyMU1sSTNLR1VP?=
 =?gb2312?B?QmZxMUtyK09kbTdMTTlwQlNlcXhFOVVOMlphdHJuODE0dlR2U3BrdVpGenBa?=
 =?gb2312?B?cU0zNmViV0JNTHVBSVZ3V1NMWjVuMXlDVThJTVpqUFFVME1LamhHZ0w1NGNh?=
 =?gb2312?B?eUhaNHFVVVFORnY4ZlF1UUtTNVd6dmEwZ21wMGJIMHl1MWNYWW9JZk9BNSti?=
 =?gb2312?B?QjNlZXBRcUlGd3FaYzBURDBvWTY3SUo2dG16VXFLRXVDdWNkWE1NNGprSGRo?=
 =?gb2312?B?bjZqaDRzbzh0Smc2bHM5T3NUYStCSWhieDlOSjRDNEgxN09CQ3p5Z0F5ZGth?=
 =?gb2312?B?VER2QXRhUnNEVllHNU4vYzJua3RNMTVwQ0tXU2pINFJYbmI5L3E0ZTkvaTlQ?=
 =?gb2312?B?NWJRdmVHME5XMEFCK0o3cmVMMWR1eTBsemhLMkp3T2w3M1Fud0VhTkcyOVVU?=
 =?gb2312?B?YkltYlZjV0pKNUd4VVU4d1MraFhiZ1BBTWlPWlR1UCt3akRoUXNwM0M4TkdH?=
 =?gb2312?B?dVNzTU9vVEh2d05GVzZKb3ZOVGc1VC9TME1aUVZBRDkwUk90MlNBR2p2MDhu?=
 =?gb2312?B?TVJQU2VGUzB2L0ZWMXFWSXpBdzE2c1daYnhSUHo2UjMyNjF2a29CcG9NeEpR?=
 =?gb2312?B?eTRCTlRJSlZNRVZXcWNVV2dsTWNQckd1c1Vja3NvY1ZERUx3WGlUclJZWDZ6?=
 =?gb2312?B?Wi9DNmo0aTBpMEJZbzNIS0orbmhYWEYxTEpLaWFKdy92L20xbE84R3luUmVQ?=
 =?gb2312?B?UFVqOVZkUG1aLzN5TlExMHk5WlRHWSsrSDRxMWE1cUxmbThGRUxXdW12N1lo?=
 =?gb2312?B?YktuaytuMzFXRmRKSmpYOHNTV0VnU2dIejNyamd5aXIxVXVlOUMwVThnbUU4?=
 =?gb2312?B?WTlrS095NFRmN3lmTUNFczZBMnV3ZnREVThpT1hQUTJtR2JEbG5aOXQzTTBR?=
 =?gb2312?B?c1Nxd1k5K1o2UUwvU1ZLNmVhSGMveWhuV2NEYnVCclh1amIwYzhmb3k1emp2?=
 =?gb2312?B?dnVIRUFBbFFacGxPSGRwTVZoYXZ2Y0pOR0dBNmk0UXl0M0t4QjRjR0U5N1RI?=
 =?gb2312?B?N1JOMzFtSldEWUFBekdUcGR5cnVmWmN6NTA2d3BuaHdSQjRtVVF4dnB3Ujhm?=
 =?gb2312?B?eW1EYVpNZmY5cTFOSERzZVdlTzdGKyticXB1OVhkdG1qK2N6OHdlZjZCSmVj?=
 =?gb2312?B?NVo0MzNqc2VRaHJIempMSlJzQzNzamZhM1VCMFQvSGpXU2hRNFc1ZStpckYw?=
 =?gb2312?B?T0dMQzZuSkxPMGdMdVRyT09sSHhFVExrVTl3WE83YTEzYTc5SlJIUmdCZHpu?=
 =?gb2312?B?L2NOVk9KRGIyTDBuWXBoaFM3Z3BHTVBBdTBNcVJnQUZZcW1XRkxJV2ZDUTJR?=
 =?gb2312?B?RnNobklINXZ4UHMvTjY4Y1RkdTN0a0lUY3JjUlExV1N3Y01yd3pTMTlHbnVi?=
 =?gb2312?B?SmhhaCt6THN4ZlYxV0I1c05WdFFsVEQzdGtPbmRYUEtyYWhUZ3U0S3Q0SUNU?=
 =?gb2312?Q?mwB5Nj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MDd3RnBuWDc4cTB0eXBkSGxHazlmUTVwOHR0dGNDSGY1VlFOU2ovMk5uczYx?=
 =?gb2312?B?QW02OWYyZ08zekJVQWVkQ3JDRnAyeFVFNTBXdHBOMkg4MUF5eDdLYmFQSlJ6?=
 =?gb2312?B?eXZPSnp4QlpucE1kTlJERW90aHllZlM2UDhBZnVSSThhQTNQQ3p5d1BBT2oz?=
 =?gb2312?B?VHR6SnpsaUs0WE9NTW00djcyY255YVpxLzBMSTc3UThvR01wem5icWVVQWs2?=
 =?gb2312?B?N0MwSHhDaGJ3N2VteE1SdU5aM2VoUHB0YkJsQkZYY2lYTVpIbmhGYVhONUJQ?=
 =?gb2312?B?SFhaWDNmbGNDZUMvK1JkZ0QxcXQ0ei96RXNQNDd2bm96Zk1SK1VuYjR3WWFv?=
 =?gb2312?B?aUN1V0RJM1c4M0RLZGp2NVBQeEpqcUVkR0lsVVQ5cXF3VVF3NXpQV09IemlJ?=
 =?gb2312?B?R2VQc1VLTkRQd09pZGZRc0Frb01GQ0w0c0FrbjVrb2R1OTlZakcraVNqa0Jp?=
 =?gb2312?B?VHZMY2I1RHhzTmpNdjFHWTdJZmVDbEJNVHg2ZTRzTWlYeXRQMU83WnUzazJY?=
 =?gb2312?B?dDJSUkdoR203NElrWWhCNkp2cmZMaXNMWDVHczNiMnZTbXFDYXo4Y0tIVk43?=
 =?gb2312?B?aDNXZWx0MEEwdDdEcEtVSG93ajQ4LzR0ODBIN0VYSVlrbVUrVU8xOVBZNmhT?=
 =?gb2312?B?UkFBNnFWMG1aOTZjU1NpUEhOdHBjeEFKZDlMY3ZUWDByejAwbWkvSTNqL3F1?=
 =?gb2312?B?bHlBZUNDQkExOXYrajNuckFOUG1RVVVpQzZxTzVrTHoyMFl6Y1QyRSt1OEtZ?=
 =?gb2312?B?b2JPQjNSd0tSbGt5dFFycDBHMi9tK21ZdzZQcVNVUDd0dnZacytUb3BoR0Ry?=
 =?gb2312?B?ZU50QldIdE5tdTRZelB4Nzk5aFpKNDY4YXc0TkUzcTRiRHllR3hUUi9SVTRh?=
 =?gb2312?B?NEc5Uk4wV04vbk4vM1MrU0I1YkdZS1ZSVncxMFlEUGdEalZ1ZmRoVGZMclJp?=
 =?gb2312?B?dWxtc3l4MlRZUW0zYXhPU2IwbDhvenkwMWRuSi9RZXNvQ2V0LzlUUjNDOG5V?=
 =?gb2312?B?c3JQQTRHUy9RbFVwWjdieWRZT01QSTEwZ1pJWVI4SVZ6R0tiWnp6cXBrUkFq?=
 =?gb2312?B?dCthMmx3MU5GM1U1UHlNaFNZQlV0OS81VzBHL0pWVFdLdEhXQ3V0ZkdZL2Fp?=
 =?gb2312?B?ZnlVRUdyZy9jNmg4OHp1WWNPNjlUa041VUx3bXh2V3U1MStyYk82eDI1Wjh3?=
 =?gb2312?B?WFJ6R0RjTXdma2lvNjcvcXlXQitCQzZZWWhEZzRyY3grZkl2clhQM2ZvSG5J?=
 =?gb2312?B?Y2o1UGdyWkI2SlhjbG1SblkxcG1ra3ZWMU96d3V4WEN2bHZzWHZydmJZTlV0?=
 =?gb2312?B?ME5LMkp0bmMya0N6UUdXM0pBM2lYT1RBa0J4MkVleTFRamF5cmdYb2VZdVIw?=
 =?gb2312?B?MEp2NXRDVkNxOWpuU3gycWJuLzNTRnNjdEtZcTU5bnNkdVltZlJKUjYrUjVK?=
 =?gb2312?B?ZzY5TG1nTmd5TWV4cFZwM3VKY2xLOFoyOW1MUXFvdWsrVnV3bUVXQXI1dk84?=
 =?gb2312?B?NnhWWEd5OXEwbHhxNllPU3VMZWE2MDNYMFBUdU5BZ1I1dkduejlVUm5nV2Jj?=
 =?gb2312?B?ZTQwNmJ0NVJMdURsd3ladUVVb3NsMVBtdXdmK3Faazh3Y1ZFczVhNVFTdENl?=
 =?gb2312?B?Sm02MnMvd2ZteGxYMThVWXVhdFdwUmxtbnpRSy9FS245UC9rZ2E1VjFJZ2lz?=
 =?gb2312?B?WmtCeDlkTktKVGRtZ2dobitETTA1RVUrV1ZXRFMrZTFYZlFmcVdLMDJSalRC?=
 =?gb2312?B?MnQrOTdoT3ovTEpBaWdmUy9pSDk1c2ZCbmRTLzQzS0pZOTFOOWoyQzV3TVNH?=
 =?gb2312?B?M0UzQkdNUDM5WUtPdXdMbXluUWpzQysyYXJPL1dBNFhCNDJQbVk5YWIzMjZ1?=
 =?gb2312?B?UllpSVNGMHZTRXR2bXlSTjRLdjlyUDl3U0F0NzJQaTBUWFA0Qk96aVBJNG1K?=
 =?gb2312?B?ZkpqRDdSdlRlSk45SmthcVg3bDdtWHJRem1Pb2svNXhDeGdWdFZyRFdyS2la?=
 =?gb2312?B?OHlWVHNWNlVuTFRBVms5OXhqcm43SUp2K3FVemsyaWdQUFVxNmt3SkFLQ1I2?=
 =?gb2312?B?clZNa1lqSzdOamVjVFl0M0Y3bGR3cmdNZlpzblJEMVNXcXF5YWVOcnJkWFNk?=
 =?gb2312?Q?6UFs=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daa738f9-c787-4331-2bdc-08de3ecec3e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 07:18:10.3902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zL+70owSDSl3jmTNIyddaR3DltR98lxfKZfMNaPekdbqglllywFxAXeeDErFiPd/3dnBY2sbezEpULwMtR4e5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7111

RnJvbTogTGlhbnFpbiBIdSA8aHVsaWFucWluQHZpdm8uY29tPg0KDQpDb25zaWRlcmluZyB0aGF0
IGluIHNvbWUgZXh0cmVtZSBjYXNlcywNCndoZW4gYSBkaWdpdGFsIGhlYWRzZXQgaXMgY29ubmVj
dGVkIGFuZCBhIHdha2UtdXANCm9wZXJhdGlvbiBpcyBwZXJmb3JtZWQsaWYgdGhlIGhlYWRzZXQg
aXMgcGx1ZyBvdXQNCm9yIHRoZSBoZWFkc2V0IGNvbm5lY3Rpb24gaXMgYWJub3JtYWxseSBkaXNj
b25uZWN0ZWQgYXQgdGhpcyB0aW1lLA0Kc2VnbWVudF9wb29sIHdpbGwgYmUgc2V0IHRvIG51bGws
IHJlc3VsdGluZyBpbiBhY2Nlc3NpbmcgYSBudWxsIHBvaW50ZXIuDQoNClNvLCBhZGQgbnVsbCBw
b2ludGVyIGNoZWNrcyB0byBmaXggdGhlIHByb2JsZW0uDQoNCkNhbGwgdHJhY2U6DQogZG1hX3Bv
b2xfYWxsb2MrMHgzYy8weDI0OA0KIHhoY2lfc2VnbWVudF9hbGxvYysweDljLzB4MTg0DQogeGhj
aV9hbGxvY19zZWdtZW50c19mb3JfcmluZysweGNjLzB4MWNjDQogeGhjaV9yaW5nX2FsbG9jKzB4
YzQvMHgxYTgNCiB4aGNpX2VuZHBvaW50X2luaXQrMHgzNmMvMHg0YWMNCiB4aGNpX2FkZF9lbmRw
b2ludCsweDE4Yy8weDJhNA0KIHVzYl9oY2RfYWxsb2NfYmFuZHdpZHRoKzB4Mzg0LzB4M2U0DQog
dXNiX3NldF9pbnRlcmZhY2UrMHgxNDQvMHg1MTANCiB1c2JfcmVzZXRfYW5kX3ZlcmlmeV9kZXZp
Y2UrMHgyNDgvMHg1ZmMNCiB1c2JfcG9ydF9yZXN1bWUrMHg1ODAvMHg3MDANCiB1c2JfZ2VuZXJp
Y19kcml2ZXJfcmVzdW1lKzB4MjQvMHg1Yw0KIHVzYl9yZXN1bWVfYm90aCsweDEwNC8weDMyYw0K
IHVzYl9ydW50aW1lX3Jlc3VtZSsweDE4LzB4MjgNCiBfX3JwbV9jYWxsYmFjaysweDk0LzB4M2Q0
DQogcnBtX3Jlc3VtZSsweDNmOC8weDVmYw0KIHJwbV9yZXN1bWUrMHgxZmMvMHg1ZmMNCg0KRml4
ZXM6IDBlYmJhYjM3NDIyMyAoIlVTQjogeGhjaTogUmluZyBhbGxvY2F0aW9uIGFuZCBpbml0aWFs
aXphdGlvbi4iKQ0KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNClNpZ25lZC1vZmYtYnk6IExp
YW5xaW4gSHUgPGh1bGlhbnFpbkB2aXZvLmNvbT4NCg0KIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1t
ZW0uYyB8IDMgKysrDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLW1lbS5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNp
LW1lbS5jDQppbmRleCBjNzA4YmRkNjlmMTYuLjJlYTVmYjgxMGE4MCAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvdXNiL2hvc3QveGhjaS1tZW0uYw0KKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLW1l
bS5jDQpAQCAtMzUsNiArMzUsOSBAQCBzdGF0aWMgc3RydWN0IHhoY2lfc2VnbWVudCAqeGhjaV9z
ZWdtZW50X2FsbG9jKHN0cnVjdCB4aGNpX2hjZCAqeGhjaSwNCiAJZG1hX2FkZHJfdAlkbWE7DQog
CXN0cnVjdCBkZXZpY2UgKmRldiA9IHhoY2lfdG9faGNkKHhoY2kpLT5zZWxmLnN5c2RldjsNCiAN
CisJaWYgKCF4aGNpLT5zZWdtZW50X3Bvb2wpDQorCQlyZXR1cm4gTlVMTDsNCisNCiAJc2VnID0g
a3phbGxvY19ub2RlKHNpemVvZigqc2VnKSwgZmxhZ3MsIGRldl90b19ub2RlKGRldikpOw0KIAlp
ZiAoIXNlZykNCiAJCXJldHVybiBOVUxMOw0KLS0gDQoyLjM5LjANCg0K

