Return-Path: <linux-usb+bounces-31519-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F430CC5740
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 00:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8A0A303B194
	for <lists+linux-usb@lfdr.de>; Tue, 16 Dec 2025 23:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA6C314D30;
	Tue, 16 Dec 2025 23:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oOj3HLjX";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FlILkPWX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oxqyhq77"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F142BEFF8;
	Tue, 16 Dec 2025 23:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765927209; cv=fail; b=NhpfVlYjFDvMwX1JN4jMGfL4oQ9afExAwnoKr+jj6g30dnl3tAhtluy2nAJPQTnxB3ivaxecc6O/7r5Fo62IGkqwa9d11FVcOLQeowfZjbjimXYgO+dVw7jo7oUZZ8I8Qua2Z3pMqzdpDVf9VV2jlS0cv83EdxR0f61GTcqeZGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765927209; c=relaxed/simple;
	bh=FDe2O33UVRRVDi/Lmq3BZoLPdXLGVr4si49nTg/MU/U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CQlyTHb9Z8i56TlCPqs6SQh3rKD5HCoNGTzIwgT/IevWDEXlpltf8K+td6EIHyoIKvygcPUMScZuiRgc2EN/uMazn5iMInCNhdBBJg7excjUv10oPfsGqMqoviwfGDi+bbL709Kc/+seFeWvYskRXSi3r7As70rXL/EeRn2R6G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=oOj3HLjX; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=FlILkPWX; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=oxqyhq77 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGLj33e2513083;
	Tue, 16 Dec 2025 15:19:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=FDe2O33UVRRVDi/Lmq3BZoLPdXLGVr4si49nTg/MU/U=; b=
	oOj3HLjXhbzcUl0GWZAjgqUgoI+gjjF+uyUqp1yWAhv5qBdeQMpcnPelDTLw9Big
	3fntYPQpkEneHEn2R6LNBMcisT4uHDH3egexjLaUHu5A3Q9HuE04AbUtrZbx5Pfv
	jjCY5FEkhbfiUNJkKJqp8/zYHzPHfv4kEDYJ4DKfSggXSIO60s9stsA3IcEkC/L1
	aBSG+aZ/aIJ8Ucf6QFTOo3v97DhM5KpqDiZzYNq/zsG2dVOCh8viIHwfE6/Unjvo
	hH8HVfTDVOBdPo/1Xbsoesg33r7uzE6I29SH7Y4K+61pgYg6yNxPo+JoSXeNRxNl
	x2lvYisrsK3pS/06irX89w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4b2v0h5fb7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 15:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1765927177; bh=FDe2O33UVRRVDi/Lmq3BZoLPdXLGVr4si49nTg/MU/U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=FlILkPWXi3t6j937N1EWWTL9UXz7VSyWjk9++6liRzf9TQzrV5pbgpDki8WmCzVxb
	 ScBWZdwA3WTozLncnfya2xV8AKs52AFpGskrDg74lNZiEDPoK0l5GpVaE05Mftbq+q
	 MRmGv4JDtUPal9r/8SZ49c+VOWkke5wDXwSHAxKJ9ei0V5sxo9T2AWJ76X85TE4YUp
	 TZwq6PVkk5qxjK9e8C76yqod+9upcKy7osLhXHtgiH2xk0JvaqmTnLwSK3x4IUXwqC
	 nF1PzLuhBv5GFD9oWCx+EtEDP4DlFDN26HNjkoP2OHkl0ZHLhAWvPNE6Higr5nOfNl
	 8eE1RkEzJJiVA==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4D7BB40298;
	Tue, 16 Dec 2025 23:19:37 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 4BA63A00A6;
	Tue, 16 Dec 2025 23:19:36 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=oxqyhq77;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00607.outbound.protection.outlook.com [40.93.23.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9951F402D4;
	Tue, 16 Dec 2025 23:19:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGDmY24TItiFmJ/UfcQ6rMXDucwDJvVzljEWYa4y6S8mvMe0HzYjo/KLmdBXgqgmW6KDblCZU+HaaBb5BhCcT8SZ1S31fE3/ULgBlWXxTre5v3nzDBSXO7TB1pcrZqlF9SFDmIjPSpD9KW9rMoIgtMFHtgUNGrri27DwFV6vbJ5j9ydVbF+UaSsCDH8mVoZziBGaBCJU5ea/kki1aEs7u5MzhpcJiNMg1je3AQKp7NiPEggcaSFCj1/Wvoadrcey3PNAqzGIKBlOVpAclrcuzNtXp7id7B54eGoVy/N/DqTgc59vk2wXFQbhaMQ8YFNPaPd3qPOewYFrlQCXkJSW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDe2O33UVRRVDi/Lmq3BZoLPdXLGVr4si49nTg/MU/U=;
 b=UMl+inU6ygCNjrIdGtrZ5Vr1GGHzXzy9yRrCT6AfoHdo1odGXhlCUrdNuoLc0TbJtENQCKGx5zWeRXx7R4l1mLj6rkDZ98d8ONap8n25keyYLcGsUfwLDGVZXs5OBa7pWWzxSUyB0ivDOR0pubuaSvw6wdqUps4eUXEnxgg1YAtlKgJ9JQX/jtP1yrdnEwrhuEa695/1a6uFKUvfTaglVlN7Jd3WUBv77d8b8tpITeP/4XlgXKMpX3ciOI78Xdel52g9BqX0mIildJoObYUxsHbuiIcRmkWT9mo3nquynBw5Lw3Nphk0gPu7LSuz9ogmYHPlXNQWbrZWRR69p81g1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDe2O33UVRRVDi/Lmq3BZoLPdXLGVr4si49nTg/MU/U=;
 b=oxqyhq77T4zUQsNU2tS9huVdv6aG6YJcmyTDqfn7prLXIFem0d4GaIbkjZv2zL1Zz1G4HCp/vDAeycwMOSop/z4Q+xwb1PdfAGp8blCaVkVbspLRg3m9Uuzs4XKLvYZ3/nLHXbdBaaw+4z8ur9eBFvzEdd/ppeQCOavSd7lWxFw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA0PR12MB4383.namprd12.prod.outlook.com (2603:10b6:806:94::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 23:19:32 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 23:19:32 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH v2 2/3] usb: dwc3: imx8mp: rename dwc3 to dwc3_pdev in
 struct dwc3_imx8mp
Thread-Topic: [PATCH v2 2/3] usb: dwc3: imx8mp: rename dwc3 to dwc3_pdev in
 struct dwc3_imx8mp
Thread-Index: AQHcZZdJ7CojB3tzC0uq5+JVP6/fc7Uk+a0A
Date: Tue, 16 Dec 2025 23:19:32 +0000
Message-ID: <20251216231930.o3d3b5lrbeb776ip@synopsys.com>
References: <20251205032942.2259671-1-xu.yang_2@nxp.com>
 <20251205032942.2259671-2-xu.yang_2@nxp.com>
In-Reply-To: <20251205032942.2259671-2-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA0PR12MB4383:EE_
x-ms-office365-filtering-correlation-id: 280c00cd-3acc-4931-2683-08de3cf991a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WjNXZC96aWZ4dFBXY1JXOGwrL0xOQlltRTl6SjBPVkJnUGdnR3hrd05tTDVt?=
 =?utf-8?B?Y0h6VjVvbktKc3JaLzlwaS9xcWMxNCtzRVRLMUdEYnBzMTdCZGdBUUU4UUg1?=
 =?utf-8?B?Zmhrc2ZWWG9yVitVN0RoR0lkSFJjUVBvQnBoVDZYRUpHVG8wSUpoRXJmOC91?=
 =?utf-8?B?bmJrbW9EbzhmWG5qRHEvclhnVTBNVmlGeXdYdTl6Tk11S1ZSSWtRWFVPMWI1?=
 =?utf-8?B?TjY2bjF3MlN3bCtoKzVtY2VxTWJ0djZ3dFgxYURNZThmN2hmdzFsZE8veldt?=
 =?utf-8?B?emRINldGeHRKeUF0emVMOE96YUI2ZXVtRWo3bkFmWUZMM0VLZGZyMVNNSS96?=
 =?utf-8?B?UGZyNHBieTFxb2ppUWU1WVR6UjhkVzFXb3d1bWZ4OUhycHlrcVRWU3pHeWxm?=
 =?utf-8?B?VE0zVVVnMHpZSjNCVU5mQ1EwRzA2ZXR3b2NRQ0JQNGJaMUZib3VyZ3FkbFFS?=
 =?utf-8?B?dVl5dmNnTkNiMXVvMkJMZ0ZjMnlkdXZzK1lRKzVISWJNYkVqR28xOFo1Z3Uy?=
 =?utf-8?B?clJGWGxGYW1LREhQTTJjQ1p2dzFsbGIzMGUzcTFIR2p6bC9qbWlCMDNibjUz?=
 =?utf-8?B?QVI4NThPZFJVWm1JczNrR0JKcDNySktmekYwbmxUWXhmVmFDVnpuSjRWTFJG?=
 =?utf-8?B?Uzd2UnpNL0FVTFJSTDdoTFlyUG14NUQrV0VieXN4YW43TFJiVkcxYitIcjVZ?=
 =?utf-8?B?djZIQThCaWpWdm12ZEJWVDNQVEsrSTlYVEcrNVVVMXpQc21NZmhGaG1RMXlS?=
 =?utf-8?B?RGJLVkozTGI5OFdsdDdabW1HaTBMWndxRFNBSGxQQTVCOGgvMDNCaTltK3Ni?=
 =?utf-8?B?N3ExaFZ6RFUwcnBReHBpV052YTBtS1JZWUQyMzBoVERIVDFaeUhsSTlFdDhu?=
 =?utf-8?B?Uk9aa3YrUVVEZ002b1hrM1FrYzdsTllMUWhCYVFUL0lsTWJJTnZpUmdPOTRl?=
 =?utf-8?B?OTV5N0Y0SmJVMkd1dXNxZ2NuT3ZFSm8zYXpHcjJHSTNUNjRQL3lMRkVzQjQv?=
 =?utf-8?B?WVBnVDJEaFEycHRMdXkxd0pmQTBoakJjUVZmYzRlTTRld2NQNUdLdG82aWlu?=
 =?utf-8?B?MTlQL2ZkbFA2MnlENVEvSXhZSDRXOWxVS1Jua3Fjb3VXY1pYeWVOZnRhaFRB?=
 =?utf-8?B?S3Q3RXhVL0JUaVltbVpTQkNBZy9ORE5GdGprVDd5aHhKRTRrOTd3T3cyMHhV?=
 =?utf-8?B?a0xGK1ByVXB2YzN3R3pla09Pdm1ZSzB5SFBUVGE4ZnBBMExuc2FxekdTOHhX?=
 =?utf-8?B?TXVFZjJoRngrb1ZyWkdrcVoybHRsV1dqZ0FnbzVOZXE5UVZYM3lqZTh0a3J1?=
 =?utf-8?B?Z0E2MXRPeVNSMjhTYjUvUDNJRTRsR0NkeUpZalV2Z3NoMi9FNk4rRlRaSTQz?=
 =?utf-8?B?ZWo5ZWk3OWtDdFJJSm5CanZ0TGFnM1htVElOUFNQaFFVOUFqRW9reU1uNnpW?=
 =?utf-8?B?VkFKV1loY0dnVXVualBXYVVBUURQSkVkcjJHQjlmL2VkdklsNVVybEZPU1R3?=
 =?utf-8?B?eUtGZUxCZVUwODR1QWpCNFo2Tis4QW1EUzMvY0xSd0ZIeEN5S2xUNmU5U0pV?=
 =?utf-8?B?clBqNTZPUkVnSjVBLzVrbGttVkRiQzF0YUpLTjVhVVZYbGFtTFNlR093Y05x?=
 =?utf-8?B?anlMQjVDUzNkQjZoNXlJaXN5M3Q2U0pmRW80a2V0d0ttSTFGdkxQUDNpcS9W?=
 =?utf-8?B?ckw2cVR4REpwQWNobklueFYvRXZkeHlMMFA1N21Ed3k2WlZ2aUxrWFZqK0Jn?=
 =?utf-8?B?eVRJZlYrUmNnVXlWSUV2TGRZYi9KUm1rRzVVMm5lT01CcFNwUEhFZnhpaDEz?=
 =?utf-8?B?UUdzdXlTek1VVEtpanJOUkQydEdZSENGUDN1WUw1QllCSmMxcXlUOFRvY0hR?=
 =?utf-8?B?K3N0dEx2VDkrU2t0MklNa1EzT3hzRzJrQ1FnWUliQmJ6SzhEYmpFNFI4bEg3?=
 =?utf-8?B?YkQ3M3lhcnRHVXRGQUIrQkJ4QU42NGZrTzczU2Z5K0x0dGlIa3M1aUM2VFR3?=
 =?utf-8?B?MlhJYVlscDF3K1ZFVXEzQ3ZXQzJJNTdlYVZneUVEdGdjRFdpNkZmOXErMUFO?=
 =?utf-8?Q?PPnhX0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0paR2dYRDZhRWFPOERhS3ljQ0YwclhEelJ0RFBSV2hTQ3NrSzIrMm5Qbkxz?=
 =?utf-8?B?NUpYSlZpWjBZeHlSQ2hXVWJReXZaU1g5bWR5NTgxMFF3N3ZxcEd6QVZYb1VP?=
 =?utf-8?B?Ync1T3FCYXAwMERhNzF2cFpDSGtha3ZwSzRFcGthYmJmRHNOazhMQ3hmYmJ4?=
 =?utf-8?B?RS8wb0dyUEtHMW5NcWlhOU0yaFRzcnA4UWJ0TWhFYk5jUTFGSGVyRllTKzAv?=
 =?utf-8?B?OWQyWE9RRnZ6a1Q4bzNEa2xoRXdFR3VnQnNILzZoNGVxamVjVkVFNGkvMHlO?=
 =?utf-8?B?WGtPTWlQZTBNQ1F6NTRCS0RlTG9hV1R2Q3J3ZjhMNHFUMDVUMGJ0N3VtWUIr?=
 =?utf-8?B?T0JVWTkrOTBNb21SR1BlcTJNa2tyWEFOZkIyVTJWLzFnSFg3S0Nrc0VmZkls?=
 =?utf-8?B?eE9HTHlWVTVlMDByOG1FaHRtUkRzVkU5bmluMm9PaEVuN29raUt1bEQvZndv?=
 =?utf-8?B?U2YwTjQ2MXE4UDBDazlXdnpWbC9LMitxTFVEYkZJcFhQZzRKVFE1S2VqVUJE?=
 =?utf-8?B?UEM4Yk5zdVVOK054Z0FRa3JGZnU1bVBNRE40NjJSUlRUN0dvTXJ5V051L3Jp?=
 =?utf-8?B?UXNoU2FRYVpxN0kzeFpTbXNQTi9MUE1yWS9CQmQyWWtEdnYyMHYvaGZpSGxo?=
 =?utf-8?B?WndDa1NKaDhzM3NPMklnK2xMNW5ZaU1Rc1BROTVCeTJCQkMzcWV1cVVML0RH?=
 =?utf-8?B?OXhuVm9XUGQxdkUwb056c3lqTWo4U2hRY3VBRWx0cE9hZ1ZCMVMwSlY5ZkpD?=
 =?utf-8?B?OFZuOFNTZ1N6MWVISzh2REIxZ0Q0S1l6MGVpaDZPQWdsaDFuMDcySERUNURz?=
 =?utf-8?B?c041NlB1cEQzZGdxZzdlRUhGcElwbTNIdW8zR1JDVWJ5ZUFGZDRWanUyRXVt?=
 =?utf-8?B?dE5rQnRxajhoUXpvaFhaWG9NR3QwOVgwNmV1MXdjZ1FPUUtkWVllaFUyZjNj?=
 =?utf-8?B?aWgvZndGM3hKVVNLZ01taHc5NWgybGxGMmYzTXNEeit6TGpHZ3J0RG9Fc0Ru?=
 =?utf-8?B?dHVXTzlOTFFPaU85cE1CenQwbk96Si9hdEtnL2dWbCtENzZ6a2h3dW1IYWM5?=
 =?utf-8?B?aGRVdjBoNlRVQ2tEUWErdVN6N1hNZlFSY3JRdnlMeGNJWGtxdkx5QTV4dVZR?=
 =?utf-8?B?ZjI1NDNaY1U0eDNrQ3dkK3ZQOVc0Ri9wUmRvVnpGdnplQmc1OWpENmxtY09U?=
 =?utf-8?B?SXlPVHArTnRwUWhJbTR0dXNNV3Q4eXduN3drN2tVNTdYVHE4OXFlMnBOdUVW?=
 =?utf-8?B?N1E5UGIyVkh2eGk2eDZvZlBDbW8vT1dCaDF3cFZOa045VVRUeldPcjBvVG1w?=
 =?utf-8?B?eFVTaUs5SnFpTGtDcFRGNHNRcEF0Q0RsZGpPTkR1S0RxckZidzVUb2RTdmhN?=
 =?utf-8?B?U0s4VW82eXMvdzNZRXRselhzbnYwZjdRV3BIMXBLQ0NuSU1PN2MyLzNJNVBw?=
 =?utf-8?B?S1AxWFBYWXhFS29DaktNYVdGRVVhdjZtL0lWbm1QbFgzOTNrYTBHU1R2RU9h?=
 =?utf-8?B?c3oyVmhFc3RLOHVOQmpSeXY1SEd2Y1dSUkhxZlg4VE8rbU9xa3ZqUnpnSCtn?=
 =?utf-8?B?ZFZSZnc1VjFDZjc3UmlocHg2Qkl4SmlCeXY0UmsyMVVWLzhnRmdReWFudm9V?=
 =?utf-8?B?UXhJclMwODE4T1ZTNXJYMmJpQnQ4akttL01LaGhXaFplMEtXSUVRbUtPNFc1?=
 =?utf-8?B?eVdmcUYyTWxLTklZdWdPZllNY3ZuR2szdUR5bVA2V056NVQyU3hTZjMzNUtl?=
 =?utf-8?B?MlhPVDcwcmdpd0k0bFZRS2VuUTJkQTVGSmhvVTNQVm9JOVRBRTkvS0dqcW5J?=
 =?utf-8?B?MnJTd3dub25CSXpaMDB4TC9pMUtHKzh6Y1ZUQzc2cmkxOS9vemlJR2gzZFVF?=
 =?utf-8?B?SWR1MDZ2b0RtMnFEdFVhVzRQb3BMYS9GSjVmUVQzUVY2M1BvVXpaUmUxWlB6?=
 =?utf-8?B?Z0lHdDlva2ZFL2Znd3hacEdXZWRSaEZsbUp4NmlNemNhOHJmeTJhNnNpUDhl?=
 =?utf-8?B?MWlzRXpId0cxYXNVOW5ya2p4a2ZvV1dmc3BWSnBEMWZpVFR5MFZBZ29HSFMz?=
 =?utf-8?B?clhDb1M0ZUxXL0p6bGx3VlVWVU1nMGxWNTNDQk9CQjN3REwvT1NEMUd4ejY3?=
 =?utf-8?B?YTZGc3E1N2M4Y08yeE9IcDk4VzJZOGxRSi92SlRzdWYrUzVpbjNsUEFpclJl?=
 =?utf-8?B?bFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2594937A723CD34A97974C348BAD98BE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6TPPhItbFNOQuqo1nmqHedNY4u9tbWVM5nHylvtbqEqJvMme/0As496hDX0GNvoXGN0CH2EIhHUnJOkngIFFQTqwhXRDSipZb92EWYFaE9GfHOKLybuhh0X7G1SunBsmHfO5pC1D5qrK3ZbMW/IpevXBDFboA6AJPT0wCord5YB95nREfFb8hgVw88ToQsBnHsdvDPcR/VoLhrsMQ6GSxSto62MF4MP0daCEldQ3rf5/qCkhT7YjOhucI7uoJocXt+v1s/jWcWamriGvFOWLVIfTC7xvSUsFrFxpZ4ucdsT+0ww5iRBUbiIOanvbXQr7wQR27SPl/dMBAXOOWyQzABSuhYLc7nBZrJmXt4Nu9xGwxMfg/MFCzGv7gLowJ20YqdzVfuqArVCtjkHpsjDUx3YmBhnQH8g46oE1tzlOJvsPO7uutPJhhY5kVSh1ZO98k88lGPkM5g1aY4qgfk4ARSWbzCQRklKox2PHyOpgXKZ7PPaieKRDWcULoMmFlWuT8jEX18RlhEBkoTNLaA+57RYCdVmtq/NQTQNbWbKgP0hMBSYQPhWh7A0kN9YzqWtjF8YhkSQUc8B8PPREB5UNGPsIPJAOKlSJ3YgnE+Lk4HkfitxsUGCjvQYK4Zy+iloSbmzfERade3AOdY01HQvFqA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280c00cd-3acc-4931-2683-08de3cf991a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 23:19:32.0346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rdXrgD7yaxzKLaOhrzYJ4Y5MMMwzgYGig2RJgpC8U/4AU4k7G5vMG5xbbStcgT8wZ0lOzL2b5qbh/x22m3uy/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4383
X-Authority-Analysis: v=2.4 cv=bp5BxUai c=1 sm=1 tr=0 ts=6941e90a cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=jIQo8A4GAAAA:8
 a=RkfwjlvCPxlVRJk5Fi0A:9 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 3qSYX4QdBK1_a8aMct29ngf95rCSGH9c
X-Proofpoint-ORIG-GUID: 3qSYX4QdBK1_a8aMct29ngf95rCSGH9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE5NyBTYWx0ZWRfX7pIxJDV30WSx
 LYbO7e8DHBwjXx82HtJRjS9iWvdvDGO0/Y3FrVleRmHZC4LjhoXehBQ1ywfjtic0uIF4JKiqwXk
 rEbC6/f+GcorSipzucQ3EIYbe+jmu7eAwXehafe7B/3dEegSWxe2QbDtZYW02o/LDFLTveMk72G
 pQi1kTx9wxRNzFDRF/9sjLrIudZDhB8x+tYm/hQJNQyJZbytqej2YZAIU7ddp66DxhICOokUyGX
 uEnVShopqvV+mNtjuOcC5u744aVHwanQ9lhSVGUNETvxa1/pfQtZCztVKYhBSS2ckAgn2Xs7sTT
 Wu+xh/I65CGp6m5+O8ZALv2MXXHLCWXBDHcnVwUVUqLTs1KLKd2Sx05vu1Dwo8aN7Or9I9nMsaT
 rG7I4HxCVvW3GlAzlYTdMWaL/JHWDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512160197

T24gRnJpLCBEZWMgMDUsIDIwMjUsIFh1IFlhbmcgd3JvdGU6DQo+IEl0J3MgY29uZnVzZSB0byBs
ZXQgImR3YzMiIHJlcHJlc2VudCBhIHBsYXRmb3JtX2RldmljZSwgYmVjYXVzZSAiZHdjMyINCj4g
bWF5IGFsc28gcmVwcmVzZW50IGEgZHdjMyBjb3JlIHN0cnVjdHVyZS4gUmVuYW1lIGl0IGZvciBi
ZXR0ZXINCj4gZGlzdGluY3Rpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBYdSBZYW5nIDx4dS55
YW5nXzJAbnhwLmNvbT4NCj4gDQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAgLSBuZXcgcGF0
Y2gNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMgfCAxNiArKysrKysr
Ky0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYyBi
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiBpbmRleCAwNTBkYTMyN2Y3ODUuLjhi
ZWNlNGJhZWNiZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWlteDhtcC5j
DQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiBAQCAtNTEsNyArNTEs
NyBAQA0KPiAgDQo+ICBzdHJ1Y3QgZHdjM19pbXg4bXAgew0KPiAgCXN0cnVjdCBkZXZpY2UJCQkq
ZGV2Ow0KPiAtCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UJCSpkd2MzOw0KPiArCXN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UJCSpkd2MzX3BkZXY7DQo+ICAJdm9pZCBfX2lvbWVtCQkJKmhzaW9fYmxrX2Jh
c2U7DQo+ICAJdm9pZCBfX2lvbWVtCQkJKmdsdWVfYmFzZTsNCj4gIAlzdHJ1Y3QgY2xrCQkJKmhz
aW9fY2xrOw0KPiBAQCAtMTAwLDcgKzEwMCw3IEBAIHN0YXRpYyB2b2lkIGlteDhtcF9jb25maWd1
cmVfZ2x1ZShzdHJ1Y3QgZHdjM19pbXg4bXAgKmR3YzNfaW14KQ0KPiAgc3RhdGljIHZvaWQgZHdj
M19pbXg4bXBfd2FrZXVwX2VuYWJsZShzdHJ1Y3QgZHdjM19pbXg4bXAgKmR3YzNfaW14LA0KPiAg
CQkJCSAgICAgIHBtX21lc3NhZ2VfdCBtc2cpDQo+ICB7DQo+IC0Jc3RydWN0IGR3YzMJKmR3YzMg
PSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkd2MzX2lteC0+ZHdjMyk7DQo+ICsJc3RydWN0IGR3YzMJ
KmR3YzMgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkd2MzX2lteC0+ZHdjM19wZGV2KTsNCj4gIAl1
MzIJCXZhbDsNCj4gIA0KPiAgCWlmICghZHdjMykNCj4gQEAgLTE0Miw3ICsxNDIsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IHNvZnR3YXJlX25vZGUgZHdjM19pbXg4bXBfc3dub2RlID0gew0KPiAg
c3RhdGljIGlycXJldHVybl90IGR3YzNfaW14OG1wX2ludGVycnVwdChpbnQgaXJxLCB2b2lkICpf
ZHdjM19pbXgpDQo+ICB7DQo+ICAJc3RydWN0IGR3YzNfaW14OG1wCSpkd2MzX2lteCA9IF9kd2Mz
X2lteDsNCj4gLQlzdHJ1Y3QgZHdjMwkJKmR3YyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKGR3YzNf
aW14LT5kd2MzKTsNCj4gKwlzdHJ1Y3QgZHdjMwkJKmR3YyA9IHBsYXRmb3JtX2dldF9kcnZkYXRh
KGR3YzNfaW14LT5kd2MzX3BkZXYpOw0KPiAgDQo+ICAJaWYgKCFkd2MzX2lteC0+cG1fc3VzcGVu
ZGVkKQ0KPiAgCQlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+IEBAIC0yMzMsOCArMjMzLDggQEAgc3Rh
dGljIGludCBkd2MzX2lteDhtcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgCQlnb3RvIHJlbW92ZV9zd25vZGU7DQo+ICAJfQ0KPiAgDQo+IC0JZHdjM19pbXgtPmR3YzMg
PSBvZl9maW5kX2RldmljZV9ieV9ub2RlKGR3YzNfbnApOw0KPiAtCWlmICghZHdjM19pbXgtPmR3
YzMpIHsNCj4gKwlkd2MzX2lteC0+ZHdjM19wZGV2ID0gb2ZfZmluZF9kZXZpY2VfYnlfbm9kZShk
d2MzX25wKTsNCj4gKwlpZiAoIWR3YzNfaW14LT5kd2MzX3BkZXYpIHsNCj4gIAkJZGV2X2Vycihk
ZXYsICJmYWlsZWQgdG8gZ2V0IGR3YzMgcGxhdGZvcm0gZGV2aWNlXG4iKTsNCj4gIAkJZXJyID0g
LUVOT0RFVjsNCj4gIAkJZ290byBkZXBvcHVsYXRlOw0KPiBAQCAtMjUzLDcgKzI1Myw3IEBAIHN0
YXRpYyBpbnQgZHdjM19pbXg4bXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gIAlyZXR1cm4gMDsNCj4gIA0KPiAgcHV0X2R3YzM6DQo+IC0JcHV0X2RldmljZSgmZHdjM19p
bXgtPmR3YzMtPmRldik7DQo+ICsJcHV0X2RldmljZSgmZHdjM19pbXgtPmR3YzNfcGRldi0+ZGV2
KTsNCj4gIGRlcG9wdWxhdGU6DQo+ICAJb2ZfcGxhdGZvcm1fZGVwb3B1bGF0ZShkZXYpOw0KPiAg
cmVtb3ZlX3N3bm9kZToNCj4gQEAgLTI3MCw3ICsyNzAsNyBAQCBzdGF0aWMgdm9pZCBkd2MzX2lt
eDhtcF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlzdHJ1Y3QgZHdj
M19pbXg4bXAgKmR3YzNfaW14ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ICAJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gIA0KPiAtCXB1dF9kZXZpY2UoJmR3YzNf
aW14LT5kd2MzLT5kZXYpOw0KPiArCXB1dF9kZXZpY2UoJmR3YzNfaW14LT5kd2MzX3BkZXYtPmRl
dik7DQo+ICANCj4gIAlwbV9ydW50aW1lX2dldF9zeW5jKGRldik7DQo+ICAJb2ZfcGxhdGZvcm1f
ZGVwb3B1bGF0ZShkZXYpOw0KPiBAQCAtMjk2LDcgKzI5Niw3IEBAIHN0YXRpYyBpbnQgZHdjM19p
bXg4bXBfc3VzcGVuZChzdHJ1Y3QgZHdjM19pbXg4bXAgKmR3YzNfaW14LCBwbV9tZXNzYWdlX3Qg
bXNnKQ0KPiAgDQo+ICBzdGF0aWMgaW50IGR3YzNfaW14OG1wX3Jlc3VtZShzdHJ1Y3QgZHdjM19p
bXg4bXAgKmR3YzNfaW14LCBwbV9tZXNzYWdlX3QgbXNnKQ0KPiAgew0KPiAtCXN0cnVjdCBkd2Mz
CSpkd2MgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkd2MzX2lteC0+ZHdjMyk7DQo+ICsJc3RydWN0
IGR3YzMJKmR3YyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKGR3YzNfaW14LT5kd2MzX3BkZXYpOw0K
PiAgCWludCByZXQgPSAwOw0KPiAgDQo+ICAJaWYgKCFkd2MzX2lteC0+cG1fc3VzcGVuZGVkKQ0K
PiAtLSANCj4gMi4zNC4xDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5
ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==

