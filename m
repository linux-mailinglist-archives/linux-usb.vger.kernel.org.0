Return-Path: <linux-usb+bounces-32303-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3522ED1BC13
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 00:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A4B630198FB
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 23:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B87734FF76;
	Tue, 13 Jan 2026 23:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Mpp12Uy0";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cPh1LxFw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Nt+0MxS/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A297528EA72;
	Tue, 13 Jan 2026 23:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768348463; cv=fail; b=d8kEEX2QlBxe7Mrxn62P/hIqJUhvEMWIKoPKPQnVdjPqxOFJL/4UM2T0t7iLnn1a5B9fr7MpMfK14XCzmghY9HAvjaxgsrYT1bCTj3jTNXaQuitjw81LOdBdrT6/quSYVCZHiCqhJlR15IB2CrzgcXrvg3wXEwuHplKlPa1Cf+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768348463; c=relaxed/simple;
	bh=pkefELD46/C2NP/DUGb0hTz06Y8zzWiGci4CJLBN1hA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sEKTY2OaDXhNBCgW4+/qdnQgCEr4qweEuMVqgSZZgNJSRyUTb8X5GOF/ndLeHk2+NgxyilvkzKRiNz6LBrR7NkCNMBmakILoko6fSM/QOTifDdeshyNHgsNHN2rJjiycOvD94D5jJQCwjf+FJmu23E0lBEUvRVqP3xAnC0eY31w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Mpp12Uy0; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cPh1LxFw; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Nt+0MxS/ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DLX8Eh3106099;
	Tue, 13 Jan 2026 15:54:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=pkefELD46/C2NP/DUGb0hTz06Y8zzWiGci4CJLBN1hA=; b=
	Mpp12Uy0PG4vqOKi1hv2Gb4jbT7W9PXbe6xJzYSbbNqWsQ4IQkpAQ7P/Kyb06iDB
	iUiXwD/U4/acjaf01bKybOC5+MAPYFD4MI8wM5i9V9AX/rx3SEUUm3XNzTdl+4Jm
	YJDRzhQi6uDRifmWeapbCO91r2Quaq2rOJSmXrKEJVoPYSAzlD5ZP7CGybCmBnxP
	u6O6EidXcwH7BTrH3823ESmsxKoCpjIUQHX2GV05+om8D2mKpvUwqA6LmfyylfnV
	kn+ARSS1Wwf71ETMk4BuLeD/V+FxgPbve8Oa661akFIuxZtPATCVuKN7Al9xPqBF
	OkVMvuhuLFNmc90mTP7egw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bneufnca9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 15:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1768348439; bh=pkefELD46/C2NP/DUGb0hTz06Y8zzWiGci4CJLBN1hA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cPh1LxFwmoUUYwXeUlOKZ5rO+3JsEWvQT+Jy1kvNKNpS15TSkXCK5pb3IKsFQmA0h
	 JG6lScsmadrzmylSRJLnh1CuQBWf1ugDY0w5eJerf1fvYtBafwds35BN84OUpWKyAw
	 LGc7s4fxDGXeHv+Iv1OMA+zSYuCdeU5kbkK+6ymdsSUgv8EvJCnXXCfZpqE9FPel9D
	 EdQCdZKkHqEcx1Z+ZNkwwXzyXRdh+FaiB37vOlzTioL+64P57kBmA6ExCedQ0JjzSV
	 CKXZsDAVmdxIoytQU4M5l7SfAlFlOFMXpBrI/FiiQZsVAvuDqu1QQRIkqoZgOzoJvt
	 Q/WacgSyXt8hg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B32C340140;
	Tue, 13 Jan 2026 23:53:57 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 18F46A006B;
	Tue, 13 Jan 2026 23:53:57 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Nt+0MxS/;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00103.outbound.protection.outlook.com [40.93.20.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 729DE40519;
	Tue, 13 Jan 2026 23:53:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pI4XWqqNg8yksznM1R7xbgLRsN67CVDx93a7sSkFC8gKNx6dSsUttyJAG9BhN5hHvKOaOS+cmiqCc+/O5SFtY3p1ZV7JwubXl2q2EmSvOadEjluy51gNvrtNWzY49O/2JfnLj3tUy9tjS/gyCCUhKLY9Ha1dl6CHArJWSO3EOVOKNd3eeVeY+IUQ9AhXw7k1GeYzX0fn1oUZDM91I4CHbXdD7tV5rr5bux746hw2MWFHA2L0+guczI/ok2TxmKxm7vxFLJOrMVGfRTDVIwLbhZ8IMpIOGrEdHOGS4zPz4THylyTpox9KeliptchhHGPWdbrcZpe+hcKD0J1B83G3qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkefELD46/C2NP/DUGb0hTz06Y8zzWiGci4CJLBN1hA=;
 b=DZFVcF/14eX9o9yVo0JgNmR2Hc6yDQVgHwYAxYrAAyAZ3tPun5qSbTsUPjEtjuz5NXYHYNT6hwXTCxIbqgwueN0LNw57ng2UEICIW6yT9q/jLCW/K/GkOz9MTOsOUKJRtJTMx3qLUX8TweVf1VJxtMNaF8Xbzc1eguw7aNwmD+FJQZkm10tjENQ3VBe4dGtXkipA++FzjQ7CKkgKzy8Fh8uB0ELaLfkPyoWKU87PXgwiJWMfm9hO4bP03dIxbi2dD3wWW3rlpsF6iqo6Zvqd1/e0WCbmp3wBZ4Ib8O1ruLW3cPa146wdCiyeXlSHQay2R2stuO5UvorfXLcr7CSQfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkefELD46/C2NP/DUGb0hTz06Y8zzWiGci4CJLBN1hA=;
 b=Nt+0MxS/rS6RE8zzwQ2/CdgWkVZdSIPnHwBKBNzrEPakh6MRhMsCyfW2pXkD5tc/skYq12BTk56+kQl5uxFEvAfvlI5gINTUwfABdTLLH+P8W6mDdsnln66OleD/9gWYTgT0vHZjrhw40t2zoKPB8PkIdn0Ue2xJ3nSeClaaMpA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SN7PR12MB7345.namprd12.prod.outlook.com (2603:10b6:806:298::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 23:53:51 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 23:53:51 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Sean Anderson <sean.anderson@linux.dev>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
        "open list:DESIGNWARE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
        "Frager, Neal" <neal.frager@amd.com>,
        "Simek,  Michal" <michal.simek@amd.com>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: dwc3: Always deassert xilinx resets
Thread-Topic: [PATCH] usb: dwc3: Always deassert xilinx resets
Thread-Index:
 AQHcfy9dgzbCYKtHtUStePNrj7tTSLVJBR6AgABXXoCAAKTngIAFTT6AgAD6TQCAAIhaAA==
Date: Tue, 13 Jan 2026 23:53:51 +0000
Message-ID: <20260113235334.t6cx2y2zrj436wtb@synopsys.com>
References: <20260106171018.501612-1-sean.anderson@linux.dev>
 <20260109004901.ygts6mmcxy4vs3y2@synopsys.com>
 <MN0PR12MB59538C2F8613A9C0641BEAFBB782A@MN0PR12MB5953.namprd12.prod.outlook.com>
 <8f0e04a5-49df-4fe3-9c76-9a1c0bd822a0@linux.dev>
 <20260113004941.4fhmvlkhf5pifwgt@synopsys.com>
 <d6788510-3ae2-4f13-85f6-c0438c89b9a6@linux.dev>
In-Reply-To: <d6788510-3ae2-4f13-85f6-c0438c89b9a6@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SN7PR12MB7345:EE_
x-ms-office365-filtering-correlation-id: 65796924-5314-46a9-71fc-08de52ff00a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aU1TTlB0SWJadjNSdEdoRVI1OFc2MEhzanB0WkpnSmR5QVJpSjdjOFIzWjRi?=
 =?utf-8?B?L0pEQk9PQk1pd0dnMlFLU0pFeFk1aVNEOTBMeHNZY1g5NEd5ZURJZE9kR1NT?=
 =?utf-8?B?ajdlTFpnbmd6Zm1jUFVpb1dCTFdLSTRDZ1d5OHRVL3hRczl6ZFhWd1RPa2Zq?=
 =?utf-8?B?SkIvbU9QOFh6ZGo1Vk9RRmNJSURCeVFEYncwblJXQzNqb2habHh1L2h3MUNJ?=
 =?utf-8?B?NE1SMUEvcVJ4QkV2RkRiTzl1RnQxc0htQmtNd1lzVUJja2I0aG1sVU5UTDRs?=
 =?utf-8?B?TUFHTEV3dUJPaU9JNTBqUlM0dm9WeWV1M1oyd04vM2I1d0c1L1lKRlI3dzRT?=
 =?utf-8?B?TTEzbjJqSHZ5Sjl6UjBJY09veDMvNS9waEtFZEI5aUNZQmFIamwwcWdaNWlQ?=
 =?utf-8?B?b1Z4eUZ0TmZkbjBncmdyT09BMUVOWkJWcjhBc2kraTRnenpEOFZQYnZmZHNQ?=
 =?utf-8?B?NHdmQ014K1R6aFRuQ1FJVU4wbDBFSXMyWXBvRHFTVWNaR3lBRjNtQ1NkNVA2?=
 =?utf-8?B?d2hqRHFDLzByQzd0SDhDZjBTSTRubE9NVnljUDFZUmIwWW1NeWY1YmQ5bTRv?=
 =?utf-8?B?U2N2K1F0Y0pkYzJTL1hxNzQ4QXNucDdGN3FzK0ZaclAxZEJ2eXlqM0VyQllS?=
 =?utf-8?B?eFN3dmJ6M1YwT1kybEJmbU85MjNPcEhFdlZteE03bmhDWXJaL3BDNTljM3pn?=
 =?utf-8?B?LzVsaUhKK3ozSWREVENGSGxZaldkL2JIaXhBNEFMbDMyRUlDcFVpWU5kZnI4?=
 =?utf-8?B?OG1BbUlIUFIxSHhFWjBseU54UHVFWXgybjNneUZOMVMyVTFrbG9UOEQxUEFZ?=
 =?utf-8?B?cG1VZ3p1Snp0QldmU1Vyam5uTVUvU2NZVmlBQWJyVFl3dFZVRnFPRStlWTNh?=
 =?utf-8?B?aEtwbFR6Ym5zWjNaOVlMVTdaWTg0VHlCQzVST2g3QzVteVYxVUg1a1ZJc2VF?=
 =?utf-8?B?SGJjYkJYWTBXUE1xaWgyaEc1S1B5dWd2SVZMSTh4S0hOK2xDWG9TNExscXZ5?=
 =?utf-8?B?dlVmZWVDZ1c4WHdid1BDYmtBclFqNWhrNkp4b3VoZVgyZ0FJcW82RHk5S0Zy?=
 =?utf-8?B?YXppQU9aMWl2dnRsL2hpaXJkWHNHbjIrSnZ2WC9sWTBxTGtUcGJ2ODl2d0c1?=
 =?utf-8?B?dDZ3dzNhdWdjTU5WWjdFeUNEaDYwV2o3TzdtT1JlZFdaWjJkbE1mLzU3bzIr?=
 =?utf-8?B?K2N2SXd1TzJEdWhaclZ5aE9IVjBWa0d4cjR4WExpLzdMK2g4ZmJobGc5NEtQ?=
 =?utf-8?B?UkdVVHpBZ2pack43TjdsaEVuUnB4RXZMZ1YxTlF5VE5kWTBFcmdtcHZHRGtH?=
 =?utf-8?B?Z3FlT3QxQzU4cHppZ2pNK1BRUFRsVnQ0Z2V0TzVhTXpHN2pUMlpmaTJjS1dQ?=
 =?utf-8?B?RDVZRVdaL2YwL08vNng4NmZpZHozb2NhY0MxUDl5MS9sWmsxSE5WUE4vUURh?=
 =?utf-8?B?L3ZqaEdZdHhwNG1IcW1CYmE1cWNNc1FXQVVlRU84OWJLYkJ1VlkwQStmbXl6?=
 =?utf-8?B?clVpZEo3TGYvUTF0TjNqK01la280a2hRbEJwSi92azR4dlphSnp3VzNKd0NH?=
 =?utf-8?B?d1IvQStGZFlwZ2FUUmR6NEk1RHlIU1Y0K2drUDE1c3p5bEMwK1poYk00TUVw?=
 =?utf-8?B?TEk5MWhOWFBuL0xtQTc4M2FBcmRxd3dzQzZRVUFJLzQ0MmFxVkljU2pWSi9h?=
 =?utf-8?B?QnoxRkE0bFpHQnpzZmhGU2dLM1ZERnNSSE1MMFN1TzM4VC84SE52dDV1ZldP?=
 =?utf-8?B?Y255dzNDaUxmZkZKWHVIbHM2SE0rclVzQlR3d3ZRQWw1WE93K0IyWHBtNith?=
 =?utf-8?B?N3ZxM05kaC9FT0U2NzAreXBzb2pwMW1haHRjT1dYM2FoWVd4SFBWRHN0K3U1?=
 =?utf-8?B?QVRmQ0JWS3BvNEw3MnFHSDAzN2MzVUdRYUdlenI1WTlSakNkU2l4RGFJNEVX?=
 =?utf-8?B?RjJsZExjSUp3dTdsVGVKdjk1NGE5c0IxaWJmMHdzblorU0NZMkoyT3JOYUI1?=
 =?utf-8?B?N1JWUFova2ljMEhPYU5DR25KVHBrVVpqVGNzR2Jnc0hacmpodE1lc1IzZkxq?=
 =?utf-8?Q?FbEJ9p?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1Q4RlhjT0haM2xmaG9SUDBYRVduMXYrRUpFUkdhSmMvak02aXFYLzljdjQr?=
 =?utf-8?B?bWFVdG5iUWwwUzUyNGFQR3J0RHJwR3FEdVMxbXBvTS9JdzBXQTRFZ2R0c2xQ?=
 =?utf-8?B?YzFTZHdRVTI3RkVQb0lhNVIyQ3h5SkdqU09yc0tCNDd1UEh2RFNLS3hiMDNJ?=
 =?utf-8?B?ZDFBYWxWSXZjRHZOQncyYXVUelRYVEdtQ0NpblZFcmdxNXRaV3Z1Z1AxLzBx?=
 =?utf-8?B?WEJiL1F4TzBLbkdsdmJhbDk4bzBmUVl2SElVME5PMlFJMlUwdG40d1hZbzVW?=
 =?utf-8?B?MWhxelpmZjFYRXcvUG5yNkZoY3JVejVYdVpDQmpIMTI1WjVUb0hJdzVIdVFi?=
 =?utf-8?B?RGs5QWJrbVJCTCtEWi9KRDJTWDJPSERWZHI3b294OVp6UkJjY3NBcUN4MkM1?=
 =?utf-8?B?R1hlRUExNThNL2N1aHBrM3R5WHNjVzdON21neEdjY2xzWTlaWXphbitPVDhj?=
 =?utf-8?B?WEd6bG8vcjUxNm9HMGdVeUw4NmdEN1hJWGMwSXYxbnV6RjdlOFlpNFMwTERv?=
 =?utf-8?B?emR5cG5lcVBzcHE5SWVTVVJsWmlNM29MKy9ROXV4YUQ2aXF4MWQ4M0JoRTFp?=
 =?utf-8?B?NDloZ3IrS1RtZDYvZDVzbDlZbG9IdnExeS9FRGQvM2ZxbmRzN1hVcXZubVZp?=
 =?utf-8?B?Q0NlSDVnR1VVN3lacDBPT1pjVmhQbnZBMlRZanJlZGVYNGhmYWE5NjVaSG01?=
 =?utf-8?B?M0RibHJ2UFhaMTZlZUJMSHZLaUIwb2h3VGJhd1FZbTFmaHhZV2I5Z0ZiMUkv?=
 =?utf-8?B?bThKTENkNkttYkllbVE5VTNUU01HZ1ZwTEhaMnZadzlYVzBPbTB4TkM3ZGhS?=
 =?utf-8?B?QzBJYmd4M3lXWmNLdncvWnpySEZqTkxGaitXaXpFNWI0VFA1amMveDdHWjUv?=
 =?utf-8?B?R0xqN1dEYURvZ3A2RERUR0RqMkxuYTRxRUZlbjFVR2VHMU9IUG5TUzVIZjZi?=
 =?utf-8?B?TjRYdXQvaTBKc3o3aENOejB2YllxNzFxVkNid2FRbE5IaWVMMUhSdmZXRjRi?=
 =?utf-8?B?NWFyQWlSMlBvSGZnTm4vVkpiYzBlbjl5Z09sSkpwbUkvTy82MlZyRUhoQmZO?=
 =?utf-8?B?dmMwWTM1Q2ozQ3JwTTM1YmRtS3YrNVJIUitKRlFDaXlWbkNNMEtqMnZ6MEhV?=
 =?utf-8?B?SnVDUHlOb3NPTDE0WENvMVlNYkk0eTlFVkJDZ3AwMWNwL01IYzhpbXBieFNk?=
 =?utf-8?B?cDFZNFgySkxkRzQxWTNjbVpId2xhcEF0N290dGFiVVVZZGh2dlBtRFZMc0NH?=
 =?utf-8?B?UWczc2xhL25jZzQyODhCdWlzRzhueFpFd25QR3FoejFCYkZMeWpxcHhobFNq?=
 =?utf-8?B?VG5tMGpBbmVqTlNBNWNoN0ZBNmtnRTZKTFhoMGFhdWhnVGZSbHd2bk15QjVv?=
 =?utf-8?B?RXQ4eS9RSVF3a1ZLcEFMd2lDTElWTkJDbWlmQXhuWTU4azlLRUdaeGhERjFR?=
 =?utf-8?B?RUFWMTB5ZUFGZXpoY3djNE5XbCs4cFRCM3llQnI4aDl2UHZYZERCc3NlQ0tF?=
 =?utf-8?B?QzFKSkxSVmxtRkFPWURoTno0MG9EQ0xwekRlMW9UUWZXaVdRREQ5dENtSlgy?=
 =?utf-8?B?QlB3eklMMnF5WnRManhXMmVEV09wM2VDeFVOSlU0VEYxemtrOW93ZEhMTG9G?=
 =?utf-8?B?bWJDR0dvR01hUXJ2blIzaHdqSlFJMzF1MjA2bWJyWEZxbXI2NnFMZXZoU2RL?=
 =?utf-8?B?VDN5a1ZmRDkwYVhNZnJsRDV0OTlUdGJ4RWNBeEFkN1M1aWxnUnRxWlM0b3Qz?=
 =?utf-8?B?aVpWZVV4OUJnMklKM0FoUlhiWmh1YzdZNUdzdXhITG9rNDVGMGlQV2lCVEdn?=
 =?utf-8?B?NmxabXVsOWRXWWMrU0lpcUx3UHRXQldwNW9QZEdza2Y5bm5sNlI3b2FnS1Ur?=
 =?utf-8?B?OElxTm1VYURoRnBrVTM0QjgzQ21Fck9tdWdTdmRXMGFzUUZ0MHoxUytYdWpF?=
 =?utf-8?B?TGFmMDd1dkRzR0w2djB4VHJSRk02M1ZoZUJxVnN0K01ybUNSVkxPMlNaRlgw?=
 =?utf-8?B?OEFHUW9qa204amhlS3NGaWF6dWUwcjRoRkx5MzB3QVRGOXlCSTBBQjJ3Tncv?=
 =?utf-8?B?L3Q0VkxjTEw2aVpyRVRxMCtOZ2xMMXVuYWFEaVNudzkwb0hzZVlBbE83SU9i?=
 =?utf-8?B?QkhvYXZ0VHR0Y0YvUkxVMzgydjBXNHdTMGtHN2pmMnRUZ1MwYnJJcER6OG5k?=
 =?utf-8?B?WlhSbVBEQktPU1JUdE1NS2JCaUN1OEFxcnhjWHV2cXFmUmdQRTVwRjZpMnlR?=
 =?utf-8?B?T0p3OVNEZFlLN0hvMWcvWExYQWpRSWEwL2RYQmhZMzBTalBsc09tV1hrZExO?=
 =?utf-8?B?ZWtWZXhoTEhjS0ZMWDRkRURLWDkyeEk4Z2xGS0FrdlpUUTB4Wk5HZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50CAB242352C694C9F9EDD9E320868C1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c9FS2D9zdPe/pGv0KNgyR7p7QVNwygI9mL77h3JgqP23uON0vykOyvQ7F3ZFa41ly33exTIjfZG8aP0rjCEbHmv0RDVDC7+EiqZof1DGMQ3+0yZCqJJzlj5AfREwWOCJNUMRhOjO0jLsbh8dlMRz2RrTUQhN7Ntlm69weJUEwhi5NuMsS8+obwrnGi8rg4HZ5fq4AZY3WEHfiRGx5hxtXFj24xjr+232SxaqlQEa4oM88NJaUglpxn7EDmtTbJ/LSlniuH+nfP1H+bFrWV8YSd7f7yb489fbf7RdGUnpZA5klLm/8y3qpuYUjcpMar5RmtA7P0J1uO3vg7bGX2PxW/PMA5FJTnvwKrIPeVkMAzL94pXQl9r5vo+D7JZnY0hciuAb06TrOcPwMQbL7DGuXacf2Zt5JFXXnsnOT+FpmODA+BpisKZvv8Dq8lGIRicCqmRo2iwSRqHMwSRNEufqtAsEDKy+NDEbSTJlvN7k3UgpxlKwaodEinxg2PEeHAoESGcoKDnzyAF4S3MOnoULIXtMej0kIZVnyrh3miizx0ulW96sxjokXixNoNhYDd2/Vd2/1ZQxW3U26IRymSlXVaWSGAlyNq75mYP8vJriMEc8iUMYw9YluAjfdwgeDk4DGdgEp7HMC5SDY1ksP7BHEg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65796924-5314-46a9-71fc-08de52ff00a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 23:53:51.3275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PyVKumrzFSDw5UcN/O5FrPF03xRd8OwlHU0qP0Y6ac8moN5qtN3W8YeBbTrI2vRRKp76gfmZKovDYuKr7u7DRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7345
X-Proofpoint-GUID: 07Myaq2WR99rbkAAKCaZ0zVsFoGIoL-L
X-Proofpoint-ORIG-GUID: 07Myaq2WR99rbkAAKCaZ0zVsFoGIoL-L
X-Authority-Analysis: v=2.4 cv=NNHYOk6g c=1 sm=1 tr=0 ts=6966db17 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=zd2uoN0lAAAA:8
 a=JfrnYn6hAAAA:8 a=ag1SF4gXAAAA:8 a=Tqzwjj_5G94Et6Bgb2MA:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE5NCBTYWx0ZWRfX9Ab6CfgP5fxH
 IC9fQ3UDXOBbvYBOCMxBVc17B9tFj0vRqp9G3vPtKxocOILZKBBiHPTCPcMy6x498JF9gyxv8pu
 v7cDBrcGLNJL6U7V0U9ioZL3bz1qi7x9gr0/8gibgtmojGvQbSL5BG/XU4w3SikgZhw3VSfV42l
 AA2C+zewdNygaJZ/U0YXpzd0Uo6HVzv5+Bz+PigacXVtlf4cmgAYb3T0YQp048Mbz0SHPhnLXh8
 RDZmWG/KznEJyul2iHjeVAuribX9g1KeSbtsWuBJOh8jMYyIWLeA6GSOi+bkGH+wNQGHuI0WLVZ
 w53njuBQUinXw8FXbFcgpCnqcjwDKRRaW6gdvZAh46tWycWApzAHpHX5prmqppMvQBjhh3RwDiV
 L4mj2vOxGq05jiiBfAHG11S7Jy9WNBzxVPNV3rsz2DWCI8jONddtNvG/aUb6eys9WylSXPfMEsB
 nipc+m0CjZLcqjw1MXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601130194

T24gVHVlLCBKYW4gMTMsIDIwMjYsIFNlYW4gQW5kZXJzb24gd3JvdGU6DQo+IE9uIDEvMTIvMjYg
MTk6NDksIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBGcmksIEphbiAwOSwgMjAyNiwgU2Vh
biBBbmRlcnNvbiB3cm90ZToNCj4gPj4gT24gMS85LzI2IDAxOjAxLCBQYW5kZXksIFJhZGhleSBT
aHlhbSB3cm90ZToNCj4gPj4gPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFs
IERpc3RyaWJ1dGlvbiBPbmx5XQ0KPiA+PiA+IA0KPiA+PiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiA+PiBGcm9tOiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5
cy5jb20+DQo+ID4+ID4+IFNlbnQ6IEZyaWRheSwgSmFudWFyeSA5LCAyMDI2IDY6MTkgQU0NCj4g
Pj4gPj4gVG86IFNlYW4gQW5kZXJzb24gPHNlYW4uYW5kZXJzb25AbGludXguZGV2Pg0KPiA+PiA+
PiBDYzogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPjsgb3BlbiBsaXN0
OkRFU0lHTldBUkUNCj4gPj4gPj4gVVNCMyBEUkQgSVAgRFJJVkVSIDxsaW51eC11c2JAdmdlci5r
ZXJuZWwub3JnPjsgRnJhZ2VyLCBOZWFsDQo+ID4+ID4+IDxuZWFsLmZyYWdlckBhbWQuY29tPjsg
U2ltZWssIE1pY2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBvcGVuIGxpc3QNCj4gPj4gPj4g
PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBtb2RlcmF0ZWQgbGlzdDpBUk0vWllOUSBB
UkNISVRFQ1RVUkUNCj4gPj4gPj4gPGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
Zz47IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Ow0KPiA+PiA+PiBQYW5k
ZXksIFJhZGhleSBTaHlhbSA8cmFkaGV5LnNoeWFtLnBhbmRleUBhbWQuY29tPjsgR3JlZyBLcm9h
aC1IYXJ0bWFuDQo+ID4+ID4+IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gPj4gPj4g
U3ViamVjdDogUmU6IFtQQVRDSF0gdXNiOiBkd2MzOiBBbHdheXMgZGVhc3NlcnQgeGlsaW54IHJl
c2V0cw0KPiA+PiA+Pg0KPiA+PiA+PiBPbiBUdWUsIEphbiAwNiwgMjAyNiwgU2VhbiBBbmRlcnNv
biB3cm90ZToNCj4gPj4gPj4gPiBJZiB3ZSBkb24ndCBoYXZlIGEgdXNiMyBwaHkgd2UgZG9uJ3Qg
bmVlZCB0byBhc3NlcnQgdGhlIGNvcmUgcmVzZXRzLg0KPiA+PiA+PiA+IERlYXNzZXJ0IHRoZW0g
ZXZlbiBpZiB3ZSBkaWRuJ3QgYXNzZXJ0IHRoZW0gdG8gc3VwcG9ydCBib290aW5nIHdoZW4NCj4g
Pj4gPj4gPiB0aGUgYm9vdGxvYWRlciBuZXZlciByZWxlYXNlZCB0aGUgY29yZSBmcm9tIHJlc2V0
Lg0KPiA+PiA+IElzIGl0IGEgY3VzdG9taXplZCBib290bG9hZGVyID8gaS5lIGl0IGFzc2VydCBy
ZXNldCBidXQgZG9uJ3QgZGVhc3NlcnQuDQo+ID4+IA0KPiA+PiBOby4gTW9zdCBwZXJpcGhlcmFs
IHJlc2V0cyBhcmUgYXNzZXJ0ZWQgb24gUG9SLiBTbyBpZiB0aGUgYm9vdGxvYWRlcg0KPiA+PiBk
b2Vzbid0IGRlYXNzZXJ0IHRoZW0gdGhlbiBMaW51eCBoYXMgdG8uDQo+ID4+IA0KPiA+PiBNeSBn
b2FsIGlzIHRvIG1ha2UgaW5pdF9zZXJkZXMoKSBpbiBwc3VfaW5pdF9ncGwuYyBvcHRpb25hbCBh
bmQgZG8gYWxsDQo+ID4+IHNlcmRlcyBpbml0aWFsaXphdGlvbiBpbiB0aGUgcGh5IGRyaXZlciAo
YW5kIGluIHRoZSBjb25zdW1lciBkcml2ZXJzKS4gSQ0KPiA+PiBoYXZlIHRoaXMgd29ya2luZyBm
b3IgRFAvUENJZS4gSSdtIHdvcmtpbmcgb24gU0FUQSwgYW5kIEkgZG9uJ3QgdGhpbmsNCj4gPj4g
VVNCL1NHTUlJIG5lZWQgbXVjaCBzcGVjaWFsLiBUaGlzIGdpdmVzIHRoZSBmb2xsb3dpbmcgYWR2
YW50YWdlczoNCj4gPj4gDQo+ID4+IC0gT24gc29tZSBib2FyZHMgKG1pbmUpIHRoZSByZWZlcmVu
Y2UgY2xvY2tzIG1heSBub3QgYmUgY29uZmlndXJlZCBpbg0KPiA+PiAgIFNQTC9GU0JMLiBTbyBJ
TEwgY2FsaWJyYXRpb24gd2lsbCBmYWlsIChhbmQgdGFrZSBhIGxvbmcgdGltZSB0byBkbyBzbykN
Cj4gPj4gICB1bmxlc3Mgd2UgZGVmZXIgaW5pdGlhbGl6YXRpb24gdG8gVS1Cb290L0xpbnV4IHdo
ZXJlIHRoZSBwaHkgZHJpdmVyDQo+ID4+ICAgY2FuIHJlcXVlc3QgdGhlIGNsb2Nrcy4NCj4gPj4g
LSBJZiBQQ0llL1NBVEEgYXJlIG5vdCB1c2VkIGluIFUtQm9vdCwgSUxMIGNhbGlicmF0aW9uIGNh
biBiZSBkZWZlcnJlZA0KPiA+PiAgIHVudGlsIExpbnV4IHdoZW4gaXQgY2FuIGJlIGRvbmUgaXQg
cGFyYWxsZWwgd2l0aCBvdGhlciBpbml0aWFsaXphdGlvbi4NCj4gPj4gLSBXZSB3aWxsIGhhdmUg
ZmxleGliaWxpdHkgdG8gc3dpdGNoIGJldHdlZW4gZGlmZmVyZW50IHNlcmRlcw0KPiA+PiAgIGNv
bmZpZ3VyYXRpb25zIGF0IHJ1bnRpbWUuIEZvciBleGFtcGxlLCB0aGlzIGNvdWxkIGFsbG93IHRo
ZQ0KPiA+PiAgIGJvb3Rsb2FkZXIgdG8gZml4dXAgdGhlIGRldmljZXRyZWUgdG8gc3VwcG9ydCBQ
Q0llIGFuZCBTQVRBIE0uMg0KPiA+PiAgIGRyaXZlcywgZGVwZW5kaW5nIG9uIHdoYXQgdGhlIHVz
ZXIgaGFzIHBsdWdnZWQgaW4uDQo+ID4+IA0KPiA+PiA+IEkgdGhpbmsgaWRlYWxseSBjb3JlIC9B
UEIgcmVzZXQgc2hvdWxkIGJlIGRvbmUgaW5kZXBlbmRlbnQgb24NCj4gPj4gPiBNQUMgMi4wLzMu
MCBjb25maWd1cmF0aW9uLg0KPiA+PiANCj4gPj4gSSBhZ3JlZSwgYnV0IEkgdGhpbmsgdGhlIGV4
aXN0aW5nIGNvZGUgZG9lcyB0aGlzIG9wdGltaXphdGlvbiB0byByZWR1Y2UNCj4gPj4gYm9vdCB0
aW1lIHdoZW4gdGhlIGJvb3Rsb2FkZXIgaGFzIGFscmVhZHkgaW5pdGlhbGl6ZWQgVVNCLiBJIGhh
dmUNCj4gPj4gcHJlc2VydmVkIHRoYXQgaW4gdGhpcyBwYXRjaC4NCj4gPj4gDQo+ID4gDQo+ID4g
SSB0aGluayBhbGwgdGhpcyBpbmZvIGlzIHVzZWZ1bC4gQ2FuIHdlIGluY2x1ZGUgaXQgaW4gdGhl
IGNoYW5nZSBsb2c/DQo+IA0KPiBPSywgaG93IGFib3V0Og0KPiANCj4gSSBhbSB3b3JraW5nIG9u
IG1vdmluZyBzZXJkZXMgaW5pdGlhbGl6YXRpb24gdG8gdGhlIHBoeSAoYW5kIGNvbnN1bWVyKQ0K
PiBkcml2ZXJzIHRvIGltcHJvdmUgZmxleGliaWxpdHkgYW5kIGJvb3QgdGltZXMgKGRlcGVuZGlu
ZyBvbg0KPiBjb25maWd1cmF0aW9uKS4gQ3VycmVudGx5LCBjb3JlIHJlc2V0cyBhcmUgcmVsZWFz
ZWQgaW4gdGhlIGJvb3Rsb2FkZXIgYnkNCj4gaW5pdF9zZXJkZXMoKSBpbiBwc3VfaW5pdF9ncGwu
Yy4gSW4gb3JkZXIgdG8gcmVtb3ZlIGluaXRfc2VyZGVzLCB3ZQ0KPiBuZWVkIHRvIGhhbmRsZSB0
aGUgY2FzZSB3aGVyZSB0aGUgYm9vdGxvYWRlciBuZXZlciByZWxlYXNlZCB0aGUgY29yZQ0KPiBy
ZXNldHMuIElmIHdlIGRvbid0IGhhdmUgYSB1c2IzIHBoeSB3ZSBkb24ndCBuZWVkIHRvIGFzc2Vy
dCB0aGUgY29yZQ0KPiByZXNldHMsIGJ1dCBkZWFzc2VydCB0aGVtIGFueXdheSB0byBoYW5kbGUg
dGhpcyBjYXNlLg0KPiANCj4gV2UgY291bGQgYXNzZXJ0IGFsbCByZXNldHMgZXZlcnkgYm9vdCwg
YnV0IEkgYmVsaWV2ZSB0aGUgZXhpc3RpbmcNCj4gcHJvY2VkdXJlIGlzIGFuIG9wdGltaXphdGlv
biB0byByZWR1Y2UgYm9vdCB0aW1lIHdoZW4gdGhlIGJvb3Rsb2FkZXIgaGFzDQo+IGFscmVhZHkg
aW5pdGlhbGl6ZWQgVVNCLiBTbyB0aGlzIHBhdGNoIHByZXNlcnZlcyB0aGUgc2VwYXJhdGUgY29k
ZQ0KPiBwYXRocy4NCg0KU291bmRzIGdvb2QgdG8gbWUhIFR5cGljYWxseSB3ZSB3cml0ZSBpdCBp
biBpbXBlcmF0aXZlIG1vb2QsIGJ1dCBpdCdzDQpqdXN0IG1pbm9yIG5pdC4gSSBjYXJlIG1vcmUg
YWJvdXQgdGhlIG1vdGl2YXRpb24gYmVoaW5kIHRoZXNlIGNoYW5nZXMuDQoNClJhZGhleSBjYW4g
Y29tbWVudCBpZiB0aGVyZSdzIGRvdWJ0Lg0KDQpPdGhlcndpc2UsIHlvdSBjYW4gYWRkIHRoaXMg
aW4gdjI6DQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5j
b20+DQoNClRoYW5rcywNClRoaW5o

