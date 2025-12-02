Return-Path: <linux-usb+bounces-31116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF10C9D536
	for <lists+linux-usb@lfdr.de>; Wed, 03 Dec 2025 00:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32AB94E1284
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 23:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FCC2D29CE;
	Tue,  2 Dec 2025 23:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Brpo4nos";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aGaJyL2o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gShVH7Nq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B85200C2
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 23:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764717776; cv=fail; b=nzNj8PcxnX857cMrBIXTsZY43TaP01UlXveODyOlzo+aStmxcoqprqGL7ET8xCxX7jUVCeXQAuNFdJ0R9ZJzVmXlzbr/bG8osfxTZmaQVt8/SdcdCBgelFKYiv3bft0aKPkY9rqQbw2KLpIpv3rssHV1Vy4NDnXpdD1SxiQ3Fu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764717776; c=relaxed/simple;
	bh=afz4QNNEyD0b/9AWx3wq+g8fzJ+AIIegjkSGnqtS/3k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YCFWaIcw2jsO9o/WiqkMH3tJ3fb2awfLM+pVpVngc3/Pjvd/ZG8PVRCml+BOwgwtU9B+NnR5d6MYH5C+y0hYbMjWQyl5HLmqTffpgLpHoVYZUhqm5tsmVi1lAr3bkZ6AbfE3Wk+AShCtBLDL/ZZpEXdjWYd5UuGEm9m3CKHVMcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Brpo4nos; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aGaJyL2o; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gShVH7Nq reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2K22Yf1681746;
	Tue, 2 Dec 2025 15:22:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=afz4QNNEyD0b/9AWx3wq+g8fzJ+AIIegjkSGnqtS/3k=; b=
	Brpo4nos3+aVJmNgZbQPRPN4qnRN6tvQuwtL561XATo8hPVEPaVzZiICKYtHylxf
	egLKYP7zVPYZzRzphcyIz2Y2urvQsSNO/GZPm308B7MtmI2kDHmpupD5Cy7hX/UA
	+KLYnnbglurTSu4upnxweWci+hQJs4QKf37oQ9UB6IuC54i7g8W2iCW87xRVRp0s
	keKyNpBueAvvQMCiYUcAuFwOJQDJ+6jbMSRI1gMjmy7JOWFIhF2VrG+J4SBzMjgR
	RwYlJw5n6kmpc5EHzoj8txhrstf2LV6kX/3hPmJehXg7+LGMPLy3MbalCRmyLhBq
	3IJPHOY+2Wb50cEXRc+q0A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4at1852r51-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 15:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1764717764; bh=afz4QNNEyD0b/9AWx3wq+g8fzJ+AIIegjkSGnqtS/3k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=aGaJyL2oGXS2uiRsuDRXXaZP/2EFvZDujqPga8bhn2no8Vuox9R+doJ5lsthD3rrD
	 Lnwp7ZdaglZ+2ZmyoTkkvcodGliEzqXdlYvIcVsJljSgvVYt3QMZoEAcyuA5e45aub
	 iqc7smP0hdAHA9nJFQEem4gNMQVqu+olhksjVKtKqoD5F2aJhphPrgKUg9exNInesF
	 FN8LVgLKFZn/fa235S9Ie2DW0LfHnGOBcy+tFdRVKYb2Mw/im5uzznghknM65keicF
	 ZQzl0zq0XmjD4enlfV1GF2P21JTQYFaCB7V8FX1XfHFrRP5wcRFYlBnp2895nPdxrT
	 D/j9cCMvCZ+Gg==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1CC954054B;
	Tue,  2 Dec 2025 23:22:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id AB3AFA026F;
	Tue,  2 Dec 2025 23:22:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=gShVH7Nq;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00107.outbound.protection.outlook.com [40.93.13.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 23A7D40359;
	Tue,  2 Dec 2025 23:22:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLMK+oVEY7NLhyQnz8bjsm9z08Xg4IN+WHCRcF2PEA2R4ZJAvYsTdpBx92KuguIl9+4OtJ/yAapnn6Uq2Drr9fxnx5Xt1obFYDALhrVyaN0FhD7zCFS8j+fdvdZXN6O21oQS3BWQ/8FW5NDWU23WCkH+yy8UFKV2nWxC9tGN1Jqmz33bfGibXkNCC6mF7iI4GfVcKBCgrRw76kGknxvdzrnpj7BfsoiRPpTaYYAryBfZizF63i3lIZOUdWDB+ldEHfX2ER0yEo1v7xZa5xQrhtLE1pQBmBYDPJJ7tiBrB7iFofUt8IMTT5ZYEEOoLzXrL9uWC8lPgXLZ5hjOZeedlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afz4QNNEyD0b/9AWx3wq+g8fzJ+AIIegjkSGnqtS/3k=;
 b=ClblP0BSSCyjtTCc/V60LAk7JoZYr5R53XRpYbTyDP2sOR9AhWA9vtHUWIQ4HOjJHnpnNbaLJ34UJBerJTIeyDA2Y+9mEmy0X3I+QvIPznPfJoLAwaNO+CKyMBGoGFToDLiS1fE1+7gscc1PukrWQxIioyRLUPBgUq15xxhxQtydk1vztR10LXcWQwSG/R96kJI2XnR3n5tUsbnQYHn3Dt3shAYd3z1hKhTqXH9KWfDSkn/A1VY8w+11igUmFSOjSdlyezeHxy6b7oC0qCz1bDiE+WDUC5pDdtOjONLKImgYCTNR6nFrG2e9a2vsPyxbrc7xdhpppdJJFeSC/D0v+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afz4QNNEyD0b/9AWx3wq+g8fzJ+AIIegjkSGnqtS/3k=;
 b=gShVH7NqJbbVSoPNeWawLVXIOBhh9LRb7qFrujCm6H73vbGKu3tMv/IPyDD9chiInMIQfHZ44vlkwJ431/NsxfRlU+er5Ksyj/HCXCXdNIIVXpQekY3eup8l4Th5Sy+evuQvad0o0V9QVhrwR2PGtvsZFWgdZNeMgNaDJu0A3O0=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 SA1PR12MB6947.namprd12.prod.outlook.com (2603:10b6:806:24e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 23:22:38 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::e2e0:bc6d:711f:eeb]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::e2e0:bc6d:711f:eeb%5]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 23:22:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Angelo Dureghello <angelo@kernel-space.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: testusb: epipe errors on test 9 and 10
Thread-Topic: testusb: epipe errors on test 9 and 10
Thread-Index:
 AQHcX3S6n+P1FBV5tkmmOEks6ZvKjbUHbd4AgAC3i4CAABC3gIAADd0AgAUxsYCAAD2OAIAAFI+AgADJ4ICAAHSCgA==
Date: Tue, 2 Dec 2025 23:22:38 +0000
Message-ID: <20251202232237.w624ilc24wad7chg@synopsys.com>
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
 <d8aa2f1e-fc44-4bb9-8245-d6ac76047dc3@kernel-space.org>
 <9776c9fb-8fed-4e79-b312-0b1a872911b8@rowland.harvard.edu>
 <bcc4f76a-985b-4932-a455-b4fedcafcd97@rowland.harvard.edu>
 <20251201232911.s5diakt3w7ztzjv2@synopsys.com>
 <82bc662b-70c6-46f8-acc7-3a666965d13e@rowland.harvard.edu>
 <20251202042305.wl2uvxoe55ay5vxw@synopsys.com>
 <5daaa7f3-7c51-4f72-b6e9-cf4f015f758b@rowland.harvard.edu>
In-Reply-To: <5daaa7f3-7c51-4f72-b6e9-cf4f015f758b@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|SA1PR12MB6947:EE_
x-ms-office365-filtering-correlation-id: 0a00b655-dda6-407a-42da-08de31f9aecc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?NEdoV0dRKzk0SFhwYzRtMVRpcGYxOUxBT3g5YUxRcGpWRXVORzBtQWRVRk1L?=
 =?utf-8?B?UG8rMkVKdHJiN3BGSDI2TS96c214NW1adDNpdGJEd2dCUkg0VTBPdGp2ZnVD?=
 =?utf-8?B?cWd0empxTE5pMVlYTGJ4dTJzOUk0WUkyL1dWbjVkMDdsNVllaHpBT2xwbjBM?=
 =?utf-8?B?ai9DUTlIVU40K0loczdBdG5YK2Z5VDlBelhlV3ExZ1JVTW53aHQvZGo1bWJr?=
 =?utf-8?B?dVlPZWhoYWFoSlBjekJreUZib0VKdXZHVXpEWXZBL254UFZCS25seFlvdkp0?=
 =?utf-8?B?V1hjRlJINWpnYldodjhBMXdEN2ZMMHU0dVk0Y2ViWHpIbUFjOElyWWVIUG85?=
 =?utf-8?B?emtIZmptWDFodWUydDNVVXcyWDYwRzBSZ2pBekpiWmJ4NWZ1Yk9ITHV4anBz?=
 =?utf-8?B?Ny9xc3czelYwUi9mUWovS1FneS81MGt1R0JJRHNCMDV1MnNTdGRLeERyS2Mw?=
 =?utf-8?B?WHRTaEJPY3MwYjJTaTJMR3d6WUxBaW5wdHc1cGRjM09RZk9STUN5S3VSMXMy?=
 =?utf-8?B?dXZ0aC8xbWExTC81bnZSTWVRbTNTcUF5ZTZaWW4zZ0JGNjVwdjJuK05GUkdy?=
 =?utf-8?B?WXBqMER0L2pCNE1pciszdTJKa0Izb1hSSTVvSTcyWmZ6S2NYWGErQlJZSTQw?=
 =?utf-8?B?bVJ2eUFzeDJFZlhFdjFkZmNOTlNQV0l0K2VTRTBVd0hEK1dPaU5aMytSYzVE?=
 =?utf-8?B?amI1c2EvL09rVU0vaWM5N20rR0JoamwxY1hMSkJrVy9hWFEyaEJUMGNaNEVG?=
 =?utf-8?B?OVlFdXZvb25DRnJ4OWVtZ2pLejEzTnU4NVVZSUZLWWhReHNUK2ZWNUlETzEx?=
 =?utf-8?B?RnJSUkI3R25md04rYWI2RmRJa3FvNjVPRktYS0thWFdDZ2RuS2FhWEsveXp1?=
 =?utf-8?B?clFCOEQzaVB1UG9UUW85K1QwekdxK0JIM2NzU09IcXdZempRSzU1ZHFDN1M4?=
 =?utf-8?B?dEZWQ3lwejczdVZyMVdDUzVLSmZXSWtkRXhJQ0JFV291TXdCQ0ZnUHcwOEE0?=
 =?utf-8?B?cGtka2hsVHJ5RE5lbW1rOGJ2TVhndlhucDYyZnVJYWRhVUtDVXFUaTRoZDdE?=
 =?utf-8?B?UzJnWFVBckV1Wmk0NUpDcTMxUjRka2x1c2VOakl6ZzNTeFFMakxZeVlNWDd4?=
 =?utf-8?B?TmFrMGZEQW5WdmEveXpxUXNuMFNqdmx3NGNtcTROQ2pCNHRnL2dzNCt5YVdh?=
 =?utf-8?B?NHZoa1QrUlV2Y1ZuWHBnMk5jdE5hY1psdnpoK1NvcHFqQXc4SXRxZ3hqUVlK?=
 =?utf-8?B?OERPdmZKK1ljUXZhdTNQbndxbHcrSkFwM08vaGJIaWNRZTRYS2xvMGptQ0Rs?=
 =?utf-8?B?bTZOQU9waWxnY1hiYUg3VkxYa09HY2JlTGVETXdCbzE4RzEyUUV1WGp2WDky?=
 =?utf-8?B?cDZsSzQ4R2ZXMmtJVnZIYVgySW5XMmVSYllnTzFySnh1eE1qU0xiVmVuTGVo?=
 =?utf-8?B?a0lmSEVJWGtlbFA3cFhBd0g2aXhKMmZkKzhSNktNM1VKWC9UT2FEYzJkQm9x?=
 =?utf-8?B?RitDTGFrL2RCTDhYV2ZDZk56UUZNWUdTa3FtNDFpT2paam9TNkNHSVFtZnJq?=
 =?utf-8?B?eHVUSGpob081OTZ4OWgxUlpCVnFBSTRmS2p1YVdqaXRkMlpMUEQ1cnUra09u?=
 =?utf-8?B?d2hKSHVWMVZuUXA0bWorS3oxVGtSR0o3K3dkbzliTFJOU2o4UzRJKzRuTmFx?=
 =?utf-8?B?L242ZiswOG1tQ1JrandnTnhISVhOdjRRb1paKzJzTnlUWXdUeGowcEt5bStw?=
 =?utf-8?B?MUdKSVBXNGJ5Sm01M3dEOHdvNmNBZjUyNllGN2xmUERCS1BacGNLN20vWTRD?=
 =?utf-8?B?ZnlGb3I0c291UlFFYnh0VUlGOSs5N2hXWlBCTnYzeTY0eThpQWhCVy9MeElR?=
 =?utf-8?B?OWJDMnVLSEJxaTAwMU51NlFMRGZNUTlqRmZaT29NUEJQSDdyWDE4QkxrSkpS?=
 =?utf-8?B?S29RYWxtdFZaa2h2VXJwOFRQbnJ5eUtqQjB6TWNHOHgwRnd2OUNERnh0RVcr?=
 =?utf-8?B?dStyZFNndWduVG5udkJjT0NhVVdHR3QwTjNyNE5Nenk2SGQ3ajgzSzZYbXpT?=
 =?utf-8?Q?4sky8G?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVA2VkJwM2VHK1FnMUxEME1acHZiOGswYWZNZmUwdzNRaHpqamlzOVF4bGNp?=
 =?utf-8?B?ckpIVEtNQ0FsTkswUUdSZUhzKy80VHpHVGZHbnA3YnlkMjIwNlcvc0U3NjFT?=
 =?utf-8?B?Rk9kSy9nclZaamQ2VlN4Znh0cmRzYlNxL1NrL25INFVHZjc5WVVFNVdIK2FY?=
 =?utf-8?B?NW5CMExsSzR2NjFyQzhvN1YyRFNXRDVGdVdnSjNROUtyMVJteUJrSDFWYVpV?=
 =?utf-8?B?YmRuM2MwcTJDWm9sZzJGc0lJcUVHKzRSSzYxZk9DTEhrR3JyanNySnp0Y2k0?=
 =?utf-8?B?RXV0SVJZYTJWTVJHckZPQVg2R2tsbFU0Y29YTjN1b1FHWEdCZ0pscHJqOUxR?=
 =?utf-8?B?SVpRdU54TTYyc1JqanJwUHgzOUllVS9QS2ZTZFpPRTJrN3ZqRmJVbmNqQ1FO?=
 =?utf-8?B?R0JNZU4rUE5ydWllbmszMHpGWkl5RmRXeVQ3bWxzcFNzZzBKSFNkcWQwanRx?=
 =?utf-8?B?dGJkWCtMdmtnSFVuWllackhoSzhFb2FFTnBESUJzU2taSEdLdENJVGpWUCtr?=
 =?utf-8?B?S3VpTVk2d05aMElBOFhsa0UzbCtHNDlNSHhLUTVlT0JVR3BsM1VNUnhENXJB?=
 =?utf-8?B?YUNrR0JocHF3Z0szZU1MVGJmNzltcE1ZbHEyaGV0OFlobnFzTTQyaFdiOEZ0?=
 =?utf-8?B?SmFXclpFMFM4RTcvUXROaFRhWHY0aDZqOG13NDdhb01Za3NXWFd1NHBBUW1W?=
 =?utf-8?B?RlVnM2VQOHA5cXBFYTg3eG1mdFNlQ1dWTURKZVdXZ2ZJYldQNUVtUWUyNldk?=
 =?utf-8?B?QkZCQjc2WkJVcVVUZmNwMmFIek5BRVQwOTVpYmpRSWlleElZNEdwcmlrZEpM?=
 =?utf-8?B?TVRwUmc1Nm1pUWJabGcweVhDajZTM2NCd25JTTA5TlE2Snl6cGVzYW5yMzlS?=
 =?utf-8?B?SGFMMVpCaVgvT1lBNFBVeXEvaHJXNVpDaDhTbGIwT2EzSVdLdi9EUFJIUGh0?=
 =?utf-8?B?alFrbWZ0VEdjd0czUndwWndYZWs0aDBybDZXY2JBN2hLTFBtUVRJL2VYanlt?=
 =?utf-8?B?SE5HNm1kZVRoWEhrVHd5OWFoT2R5dVpGNStCblBINXk1SWU1MTJHZDJqUVMy?=
 =?utf-8?B?Y3E1bzM1aFV2YlhHTDRueU1yWjNnT2pZQlUzSGdDcGk4eVR4bXF2c2kzMUE4?=
 =?utf-8?B?Zk9pY0g1a3g2NzZ0SjNkL1JMN3AxVnROTzE1a0p2d09XUzczQzFCKzUrV1cv?=
 =?utf-8?B?S29MckVvTlZWZERHbnl4cXd3TnZLS3hJbC9rK0RsY2tPWEpBSzhOeXRjM0RV?=
 =?utf-8?B?eGpwcTh5Q0ZMSlJ6eGRKczdKQ3ZkRTRmbTE1ZjhXczRNeWxRdU9sa0s0Y2c1?=
 =?utf-8?B?NUM2REd3cGxtS01tWVVUQ0Y4RlBWeC9xK2F2dUVYZnpMbERpdXBZbWhFNDcy?=
 =?utf-8?B?ZXVwVVhNajVnNGtxTkxsVHI0R0x1K1pWR3ZLMGVZbWI0UjJqNFdWdTFxbmRn?=
 =?utf-8?B?RXRTRG1DejNRODVvVG8xZEVaZ3pMWnNrQ1VaTXF4UWg3dEoxUnZYQlNMRVB1?=
 =?utf-8?B?LzI2RlYyY0ZROVRHanJzamE2ODhyZzd1VzYxejdIWVNzYUFzajUySFFpRk9O?=
 =?utf-8?B?YzVKWEp1MkNSYnZjQ2J5RFFGK0lwREdaeERldUt4NG1CQmgxZ0YwdldCQnhs?=
 =?utf-8?B?cDJRaGpxOW41UnFvc0RlSHJQUElWSmRzdlAzbVRCK2Vib25nMy81ekhLRC9x?=
 =?utf-8?B?UGovemNrV3J0Tk01alJTdG9GM2FoaTRxTU1nM0MzTkdqdUtyTEZrb1kxVFFM?=
 =?utf-8?B?ODFXVXNCK0E1OWIvNklvMyt4bW9sNUFwekZhc05CRUJkUWNMSW9TNTlFMzJm?=
 =?utf-8?B?VGp4Q1JDRlBwbzZ4NmVRWEUyU0N2ZEpPNHN0ekprb2x5bkVBNHlYa0xXSm1y?=
 =?utf-8?B?TG5LQlcyaWJYVGdLZUxMU2Yvak85eThkQURtNGVUbDVxdmN6TEdkWEsreVp0?=
 =?utf-8?B?RUFYUnBTeHh6eThOa3lpQ0VLRzZVeXd3bnpWKzFQSlZ0NHJSS3ZSOGlDZU9R?=
 =?utf-8?B?TTlLanNjRlBneFJXc1ZqbFM2R2FoOUtZTHNpaWZIRC9Gd3FpSTF1ZW9tTzJv?=
 =?utf-8?B?NFNrUE43QisxWjQyY3FZRHFnNE1Id0RvVHkweDBiTXhxc2NRdXZLcmVQa0E0?=
 =?utf-8?Q?vEtYhZcryFUa5zQ0ZAo3if+Dx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BAB7248726ABE4AA0DE911CEAEE0AF4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	70n6Za0hRCgkOyl3H6O+VeXjSTURlGTM3cp0voADc++HT9ZpW+gFniooHtb78oAiuDRjlZliVBH+8cLiR7o6onS9vM3M9umvZ9puI5jEZa30LMr2hVnxwA/1iDtnD565piwmmxorwjWQEoHlbjtD7uZHYfDqKHyExwTbrhtx1Fek2S4NBOpG1Z+hrn6CcHyYrQA3atSUp07fagUHVnAuLl/SahPApRK1/I8MdA4+vuAwYK40s9NJwgwnZpi3sIKQy1sQ47l/pYkxtrwrl19pHJempfUEVJg2LfI0o1EnT16IghQX8sWOw+ddh48o0nsJkklZavjtM/qWENN/tKutA4LvgwJ54yJT5LOcx+pQwiNOHW54yQOSqgi8kOqqUe7nmHT+zUuSqSxUR3BaurzoGTF3ZFResBkx5cDxZxKiOP0ZWZ/uH/UbIKSWZls1bqeHmS0iEhKIHs/2gGwpFZAn0AAHIHBvMOde5oL11rOVxzi1U8ZwrcIZVBwN6l9iam6MnphzeDKKPfkWAfZdJvb7zfacRXMsstMFcJbTfJ+ba0M8uet1ZJeR2mh3TbW1i04ZaL/KaucyJjxjIXgShxGwCnd39NOJ6JWI6dd5gxM/9EZ77IhUypLZss6vc8IAH2F/ugNDoxx+Xm1vm4/SGXTnIQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a00b655-dda6-407a-42da-08de31f9aecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 23:22:38.2283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8u24JHkzSGhQMIrDLOZJyQ0m35xlfcdZAWtx6/fekuc2pJl7RjrAcEoBQc6aUQIPkPSJcBAv64cGhmV/JtXCxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6947
X-Authority-Analysis: v=2.4 cv=EaTFgfmC c=1 sm=1 tr=0 ts=692f74c4 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=q_Rol2I6RmA0IDUpPkYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: jpPgd8RkxnSh7pD7sAHNHD6KiQn4GQVd
X-Proofpoint-GUID: jpPgd8RkxnSh7pD7sAHNHD6KiQn4GQVd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE4NCBTYWx0ZWRfX73DHCp9gTnYf
 B5A8Q3mftEjTG5ovfQQhVjzaSMi3pV7VhTi5SN+cLrjGxQKEpPE+uGclFdKWydgYZzbssctEMAf
 htgYWxMJBM1xgHR7y13JnkLp39w8xvrzhRCh+T5lHEqZEEmyIUdjHy/2QD0tza8rB/IY/ERhZiZ
 jbwrLYmSrRP8xQiVBzkiBMTeMD4TdXtw3v6pTR6k4f7Ap5gHAAFBiIM+5ktUOiTuiv7OluLjvM4
 fG/vwZ9FQUBlbq9Gf+kmZ7Q5Tq2s74vfSLo5GSiReT5/PZZYGQus9i4zSa+UpVhe6vv7B0JAGf0
 b25xFFTJLeDpnx7Jv5oqK8/ZaW20BrXJUX2aK/mbgUKwTDc62cAgxBDfZYfXM/8hGMvXCApHrOy
 fjmhpKLk1C/9w3T54Y/WgmvnEoPa5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 phishscore=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512020184

T24gVHVlLCBEZWMgMDIsIDIwMjUsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFR1ZSwgRGVjIDAy
LCAyMDI1IGF0IDA0OjIzOjEzQU0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBN
b24sIERlYyAwMSwgMjAyNSwgQWxhbiBTdGVybiB3cm90ZToNCj4gPiA+IEFyZSB3ZSB0YWxraW5n
IGFib3V0IHRoZSBzYW1lIHRoaW5nPyAgQ2xlYXItRmVhdHVyZSBpcyBkaWZmZXJlbnQgZnJvbSAN
Cj4gPiA+IEdldC1JbnRlcmZhY2UtU3RhdHVzLg0KPiA+ID4gDQo+ID4gDQo+ID4gQWguLi4gSSBq
dXN0IHNhdyB0aGUgc3ViamVjdCBsaW5lIHRlc3R1c2IgLUVQSVBFIGFuZCBhc3N1bWVkIHRoYXQg
aXQncw0KPiA+IHJlbGF0ZWQgdG8gQ2xlYXJGZWF0dXJlKGhhbHRfZXApLi4NCj4gPiANCj4gPiBU
aGUgR2V0LUludGVyZmFjZS1TdGF0dXMgc2hvdWxkIGJlIGhhbmQtb2ZmIGFuZCBoYW5kbGVkIGJ5
IGd6ZXJvIHJpZ2h0Pw0KPiA+IFRoZSBnYWRnZXQgZHJpdmVyIGtub3dzIGFib3V0IHRoZSBzdGF0
dXMgb2YgdGhlIGludGVyZmFjZSwgbm90IFVEQw0KPiA+IGRyaXZlci4NCj4gDQo+IEZvciBVU0It
MiBkZXZpY2VzLCBHZXQtSW50ZXJmYWNlLVN0YXR1cyBpcyBhbHdheXMgc3VwcG9zZWQgdG8gcmV0
dXJuIHR3byANCj4gYnl0ZXMgb2YgMC4gIEZvciBVU0ItMyBkZXZpY2VzLCBpdCByZXR1cm5zIGlu
Zm9ybWF0aW9uIGFib3V0IEZ1bmN0aW9uIA0KPiBSZW1vdGUgV2FrZXVwIGFuZCBGdW5jdGlvbiBS
ZW1vdGUgV2FrZXVwIENhcGFibGUsIHdoaWNoIGlzIGhhbmRsZWQgDQo+IGFscmVhZHkgYnkgdGhl
IGNvbXBvc2l0ZSBjb3JlLg0KPiANCj4gU28gZm9yIFN1cGVyU3BlZWQgYW5kIGFib3ZlLCB0aGUg
cmVxdWVzdCBzaG91bGQgYmUgZGVsZWdhdGVkLiAgRm9yIGhpZ2ggDQo+IHNwZWVkIGFuZCBiZWxv
dywgaXQgY291bGQgYmUgZG9uZSBlaXRoZXIgd2F5LiAgKGR1bW15LWhjZCBtYWtlcyB0aGUgDQo+
IG9wcG9zaXRlIG1pc3Rha2U7IGl0IGFsd2F5cyByZXR1cm5zIHplcm9zIGZvciBHZXQtSW50ZXJm
YWNlLVN0YXR1cyBhbmQgDQo+IG5ldmVyIGRlbGVnYXRlcy4pDQo+IA0KPiBJZiB5b3UgdGhpbmsg
aXQncyBiZXN0IGFsd2F5cyB0byBkZWxlZ2F0ZSB0aGUgcmVxdWVzdCB0aGVuIGNvbXBvc2l0ZS5j
IA0KPiBuZWVkcyB0byBiZSBjaGFuZ2VkOyBpdCBzaG91bGQgaGFuZGxlIHRoZSByZXBseSBmb3Ig
bm9uLVN1cGVyU3BlZWQgDQo+IGNvbm5lY3Rpb25zLiAgQSBzaW1wbGUgY2hhbmdlOyBJIGNhbiBk
byBpdC4gIFdoYXQgZG8geW91IHByZWZlcj8NCj4gDQoNClJpZ2h0IHRoaXMgY2hhbmdlIGlzIHNp
bXBsZS4gSSB0aGluayBpdCdzIHByb2JhYmx5IGVhc2llciB0byBkZWxlZ2F0ZQ0KYW5kIGVuZm9y
Y2UgdGhpcyBpbiB0aGUgY29tcG9zaXRlIGxpYnJhcnkgaW5zdGVhZCBvZiBhdWRpdGluZyBhbGwg
dGhlDQpVREMgZHJpdmVycy4NCg0KVGhhbmtzIQ0KVGhpbmg=

