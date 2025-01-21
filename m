Return-Path: <linux-usb+bounces-19606-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62721A18887
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 00:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 511B23A6EEC
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 23:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205EA1F8AFB;
	Tue, 21 Jan 2025 23:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eWdrV/Fb";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fHESb9Du";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DhkPcq7g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20E71F03CC;
	Tue, 21 Jan 2025 23:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737503189; cv=fail; b=t05kSVnTi63YvTKGIeIuUgFhcY5DhzV+fZw/YO68cdzlbxkO3EqiYr2QqoPKQ82ow1oD+GRM+8/F57DkXKv6LYe4KuhMxUCgZsvcWptU90epwBa/E7Tjoe5o/syX9LK3Bnz17wTSoQ3ql4xtVsbg6P1L6MvB8ty4IEJswlUFlug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737503189; c=relaxed/simple;
	bh=EdCMlUgOvahSJ3yjJCSrwe2G2vzZ+YBMZx852/t2fNE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HmWNBRcuiRcF8iVoo1mYHBkYOYgOVOigf93/WYpM7A2tBOjIC76cwImnKfBBa++gcsFY6OjeSvkR7NU0sFCBBaDyM7u+kTdOqh3LEcyWoN3/AnzVEE8z83M7/ql3AqUgIV0aqXJJLpdNIBC4I4ahh4ph+eKStBTaoZabfBGlV/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eWdrV/Fb; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fHESb9Du; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DhkPcq7g reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LK2iOe006343;
	Tue, 21 Jan 2025 15:46:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=EdCMlUgOvahSJ3yjJCSrwe2G2vzZ+YBMZx852/t2fNE=; b=
	eWdrV/FbDqimBKlQyrf3IPsx8dQl45EWl1TDlZ7Ij9pyo12JNgAuDAAHx1srUmoe
	vqhE1UxCYjTQal5xs4gAAXuesXEklV5AuJuCyyH5nEQQP5DHH0/oBEdNHoh1OxDx
	8SwvXgKN15cUj6KtIG/SlYOd9qCrjFcS8P7R42cSpGhq0r8+6uX9Sr5tmMKAxk65
	f0U3vx2q6jsfEPEezNkFrKkp/4B7ZyQvnfRie+MrDxbixJ8v4p65K7iMPpNXI6Eg
	URz58gNnp/WrqSL2j5eOrgNZ/IpaQIfOi49picl5O3FkLnrf8pm9bA8aeRB3j3+O
	Gc+sn9kUUFXF+iukXXTAfw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44aj978vx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 15:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1737503182; bh=EdCMlUgOvahSJ3yjJCSrwe2G2vzZ+YBMZx852/t2fNE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=fHESb9Du3SHCHSZc7bFr4M6+bZj4cLeqEv7aTI4AW1a11xwQzYxLIYUqXUaET5pl2
	 aif3xnZiy8UqDgZZOh/mNRNBPN/T+fOQFTAWPKyOfMNYdA/5XjyAW17nRKrnvRRq1F
	 Sg9+lZgE7rjwnB6jF8kD0qriGLwFydFUFeR1pONB2kOQtwM5Kqb9p4O2oLgVpCedGN
	 +L0F4b69vP8Kbcrr8welY22u1TsDqUzyOdguWdaFjZB8uRTKD9fSLsg2WKnzPbdtgr
	 nJynep9Xhen3TQz0ar7z9gmm2meAGl6ExOYyuaY4v2iLqNp2BK8jGBWANHdZHenvnJ
	 UgGDdjvKF8F9w==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E36CB40521;
	Tue, 21 Jan 2025 23:46:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8EC4CA0072;
	Tue, 21 Jan 2025 23:46:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DhkPcq7g;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2A1A2405D8;
	Tue, 21 Jan 2025 23:46:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juu2AqQPtMk15AmeBxmDpd3kNwdZlKhEBv4b8eaF5nV1J/ODWMgvsYYvwJdA6m9kRrRdPu5Me11SqNhIkjIFIrzpyE+7G5wIV1//xXPyaqehOwlF4eKZDiRCCxh2hhRabXq39TYdCnMNtIZ+YHXCotWZM6pstYLbxOFFQgTXHub1TYyGzdHbtqn9n2drZWvwXT49h7nQHTeaLskh/kUmRZ+ui6Y9pIHpaRUvkiQM79eH4YP94+HpaTEVnSwEJ7o0p0U19nDsm77d+lemeks0cdTkG35GzT7yiKtDBJWfWHe9qYuqp81fv7AgfgI59nmIpu9a4Tkkpc1ztOOGWb1VIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdCMlUgOvahSJ3yjJCSrwe2G2vzZ+YBMZx852/t2fNE=;
 b=VkBkNsoc3ZJcoxNoLpP759Pjxq7crlmOb1CX36W5HwRZwv0eYe6JeEqj5FJP0mhUctJzrjiMjo+CfSOTLuXGZZsEEn8NrAgMs7toKB9Tdd9cvmurz6v94mHAwWMFd2s/lKUFzFeZsquHDE3axka9lVGUIOxopT92nzzKz7uC7L16rfOnohHPsDiso2LAM5WVkuJE1jK8Gq3UDuFiMP+trfEeoAEzG1j95So5FeBZQGsXITiKIRny/6dDKNdZqMXUIT000UvUAPGkssEesxuVTxnpNrgya1RkNa5RV/bjidWw1tIqjV4E6Yb0qbshyYtORkPT0Xng9/5+JfGeA301lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdCMlUgOvahSJ3yjJCSrwe2G2vzZ+YBMZx852/t2fNE=;
 b=DhkPcq7gfgfELN81Mkh4EZ4cfSgdj+lAgzAwGLCRDyrKZ01TfNP/9/OBgmieZpJymumLoB412rRhDwg71HwedG88XYakAxmeT+J67F/Nsk87VjvknEeKQh1PEa/+N6cRG/tdvqZgFPF+56SKXdmv25WsWmcn/kLvuoza50dJRpk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH2PR12MB4278.namprd12.prod.outlook.com (2603:10b6:610:ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 23:46:18 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8377.009; Tue, 21 Jan 2025
 23:46:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 3/3] usb: dwc3: gadget: Skip endpoints ep[18]{in,out}
 on Intel Merrifield
Thread-Topic: [PATCH v1 3/3] usb: dwc3: gadget: Skip endpoints ep[18]{in,out}
 on Intel Merrifield
Thread-Index: AQHbaC0e4vvQDZrPEUCV4IbmsnNVa7MaD3SAgADpBICABvSAAA==
Date: Tue, 21 Jan 2025 23:46:17 +0000
Message-ID: <20250121234616.eomj7r73o6ce3u2r@synopsys.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-4-andriy.shevchenko@linux.intel.com>
 <20250116233937.s7mv5mu4tfuaexy2@synopsys.com>
 <Z4pcMUDsFZ8-deW_@smile.fi.intel.com>
In-Reply-To: <Z4pcMUDsFZ8-deW_@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH2PR12MB4278:EE_
x-ms-office365-filtering-correlation-id: a28995c6-ba9b-4d95-3a6b-08dd3a75ccb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bThkY013czRFSzFrVGZYTzhGK0hlSlllem5DMHhwdEd2TTA0RlkyUHdXV2dF?=
 =?utf-8?B?UFl2MWx5TWVmTTVERmlFUjV6NzFXQmRzYmM2N1pwYzlEaVMrQzNoRFUyOWVY?=
 =?utf-8?B?eFpkQTI3elVOZnVqRlQ5WE9pb0NrbSs2OWFvSmx6K2F0MnhzaWFoV3JQekpx?=
 =?utf-8?B?NHFTdEd5Tk5JNW1TcXdtdUxMT29VRElFQ3FyRGVrblJQSEVCcENuM3JIdy9T?=
 =?utf-8?B?cngvN253Q1NOWnBmT2lkTW5adW41Y1U1TlE5c09uVUw1L2t5NC9DcUxJbHBJ?=
 =?utf-8?B?b2F5cS8zZ2p6L3lPNUUrZUg1YVdUd2d5clkwdHR3WHBocldSSWducGY4a2c1?=
 =?utf-8?B?ZmFMck03ZmhpaHRZaG00a21MUW9Kbko3OEE1VytRWGlGVG1qbUlSTngwdHBt?=
 =?utf-8?B?UUpXNW5BcGJyNldxVWVWZEdWTmJuOXRqRThLT0xBRUpsK0JyK3ZUTHpjOW91?=
 =?utf-8?B?WGNqZ3hERFovdlZEeHFSYVozTXc4Z2srVEJTL2tsNGxFQm1pMXFnRXBlOTFx?=
 =?utf-8?B?bUphdkt3QzllV1l4ZFZrVEg3dllac2xHUHFzc0Y4TjY2QjJ3M1dQbi9sRG5m?=
 =?utf-8?B?ZmVQRGJjNDA0ZHFFMGhjVVcybHYxREpGZUpxYkdwOGt1dy9aR1dKVk8yWW5n?=
 =?utf-8?B?UWw2ZnBBc2dENmllb25ySlovbEVQc3dFVHNhbkcrSXk0V1RKVVdVeHkyTHdN?=
 =?utf-8?B?eStvcFZIQ2liYWtuRWQwMXhmVUlCc3h6YlFYWWpsK0NwbWtWYlRsQnNXQlcy?=
 =?utf-8?B?RnpMbndiS2x6dU9CVTBIdWthMGRBNnZKTUtWbzVrQnhLbG9YMEFYdjBSSmlR?=
 =?utf-8?B?WDVXS0YwMVNIRlp5WG9zWDNjL1NhSVBFTHA4eW1BT3V5bzJBdVFWZHBPUytp?=
 =?utf-8?B?MEhaYWpmRDNOUzBDcmN2NVlPdkl1Y1NCWXpod3I3cHRIdTBRckJnTGpDZFM3?=
 =?utf-8?B?ZWtBVTVmUTlib3k5OUVpUytmVVNHTFBHdHZUSVYvSUJqcjhaWm9FWkhTWERx?=
 =?utf-8?B?aEJPMTdXMHZ0U213dnM3T2lIL25Nbjc3Z2l0NExUMEdTRzFsdlJTU2lTQzA0?=
 =?utf-8?B?eVBHM2xLQWxQUG5tMGdJOHMxRFF3V2tXc0lveTRLR0o4a2J6aU9yWUx5TnZC?=
 =?utf-8?B?M1NXTGpRS3VFU2VOc3VpNFIzaEFGam5nRHB2SDQ5dndUZHNWcFlFUUFRS0Jj?=
 =?utf-8?B?WEh3cHlpUlc1Y3RyQWQwUk5DdTdCZC9DRXVHSkZuR1ppclVlU0FuOEZUbklU?=
 =?utf-8?B?WDdmWHFYVUovT2pYNFZrdHVYOEFFL2lhalYwWno5UTZrNnFsRVBSdDhIa1ZO?=
 =?utf-8?B?L3p3RHpqZTh4WFhtVVB3MzJpV0VudlFPYjhSNVFBeGRQcys5OFdyTld5YjFT?=
 =?utf-8?B?Y3k0b0NHWWcrMkVvNHBHd1RKY3R4d2tOMmU5UzZtT01NTk1yMWt5VVRHTjF4?=
 =?utf-8?B?TlozcjV3NjlYSkhKTExqSzg3dnZ2WW9RbHpvM2ZGSnhXdzlObmFwRjhxSFhX?=
 =?utf-8?B?WWw4emh1SEJxYm0zV3ZueVBUNXB3V3l6eUhWWlc1SVpVTmRUMUhMUjJPcFJE?=
 =?utf-8?B?TEhBL2lEWnNXZ0xBeUV0ZUswOHpFRnI4cjVJWkNKMFFzTjM2aHVJSWZrWHps?=
 =?utf-8?B?MmhJZE1KNUFWOXd3Q3ZZcGlsNEZra1hEdVVxcmVFQWdWL2FUQkJycXdKSWdx?=
 =?utf-8?B?eGt5VVd4eTd4WVpnTjhKWW1NT3ZMVmVuVndOVURpRzU4NEhlNE9Uby9lZWg2?=
 =?utf-8?B?TUpyVlNUbkUzdGRJaXNFeXVuNHpGRTVHeC9yVGdiODBqVXlDL041ZmN4Z1dm?=
 =?utf-8?B?SFlBRVhHSW9zQk00dXFZUXFVeU1Yc0dtZGpMVFVkN04xVnNzNlBnK1EzTyt4?=
 =?utf-8?B?WEFZUzNhbHAyVEZwNHJHaEQxaHZDWTJqVUlyT2ZvQjdUczZFTXBXS3BTQkpz?=
 =?utf-8?Q?08SF096nm7ZOxraJ6VC2Rw/Q7m5RQWNp?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWR1Z3dTRzBFaU1tekx5M2Y2REE1cHJWOUlHcFJ6MmYxZ0ZFY2ZVeFJRU1Nw?=
 =?utf-8?B?TTRVL1Vid3RtblBLSjNiM3E4Y1JWTWV2ZWNJSTUrYk0vR2FBVzdoOFNCdW1u?=
 =?utf-8?B?ejhwc3V0bnFDczF4cXpCU1laUmdsQ2pOZGtCT1NwUzZOK2lZL1IwbGZhZ2RQ?=
 =?utf-8?B?YmdmN20yeHMvUjBDTXVjUVpFN05WRzFscUJZQjNGamVCSEh3SkNEL0RmdUdr?=
 =?utf-8?B?bjl4elJCK1NFVEZXam01R3h6eGo1Z1IvVzFudEFSWGhrdkFGTjBCeWFtVm12?=
 =?utf-8?B?YklhV3JVeklrNHVWUU5NSWhuUGVZaXZSMHN6VGZLZzFvZ1djb3c2YTJ0Y1NS?=
 =?utf-8?B?M0xRM0tCK1h6VnpCOFlvUEpJd1hyRktRQmNRV1Y4cE40RmxzUWcvSDMvOTkr?=
 =?utf-8?B?c0t2Zy92S2x3NDhoS244WUpWNFZXemVOREJzUTlRWkd6YjVVWGNXSTUzT2My?=
 =?utf-8?B?YjlUTUhYdVluVDllNk1LWFYvMlg3MzAwS2lzeUU0TENCS2VRdnZjRjhVNXNE?=
 =?utf-8?B?TkVBUklaaFhLMWh4a1pJVEJwRG1IOGJZQkJNbGdCR1BYTEZ1SlV1dHhLdFYr?=
 =?utf-8?B?aVpPTDZPeGZHVkZDK2JycXE3cnZUdUxXaFY1TTlUdmx6WjMyUDVXNHEvYnJx?=
 =?utf-8?B?M2NmcUNmQ09hcU5CVUI0Z3RiT0ZEWFJoQzZDZGR0Z0hmR3BWbHdBeDZmTFpz?=
 =?utf-8?B?WHdXWGkzdTdNVS9KcnU3WUJpRDdadXNEaTlvdkNRcWxZa0JPRjZRREUyd2xq?=
 =?utf-8?B?bXhLVHFoRXBKY2o3L0RVK3pDR2tOY3RJLyswWStWeUFnbzZ4VHpBMUZvWFVr?=
 =?utf-8?B?VUxWQ0F1QTcxeVJDakE5dmRMbGlaR252ZW1aTUY5eGExMTVFemdqdm1oNkVK?=
 =?utf-8?B?bnVRZnRZQ3NJL2FXVGNtU0tHSTFJZ0srT0kvTk5YeS92WWV5NzZOQ3FjR2lE?=
 =?utf-8?B?Z0oybG1BVVFhdVM3NFNyRDRmaUt1eFU3RHFwTHMxUGNSd1F2c3hiU1VYcDhO?=
 =?utf-8?B?LzhSNkVrWEhTVElDUjZCWXVYaHNLSEErb0EzQVRTcXJpWC9jL1FCVndpdGU1?=
 =?utf-8?B?MzFDdjhrb3Qra3FOdmFjQ2c1ekVyam1tQWh0WTNHeGNDWWl6a0V4ZlBYOVdz?=
 =?utf-8?B?YVFBSzhqbERxdmR4RVBnWmdCWHVPeFg4ZHlWUFFlbVNwQVBzUkZiUXd2RVd4?=
 =?utf-8?B?ZG8rSUY3b1o0aXZwOHlSV3FYTGVuekVhZ25pOTR3TlQrVXhvWWhNMzBycDNE?=
 =?utf-8?B?M0owWHhFS2UzN3h3eC9NblJNcXc3blcvaFhGc3JxQ3VTajRtSmM0UUpFU01G?=
 =?utf-8?B?RTcyOWd5SWUyN2ZOZ2hqTHRmV1NxRXpWd2R5L01oUDQzNG9Gbzd2azdvZW9O?=
 =?utf-8?B?Z3czWUk4REF5WUJEMWYzMkp6Z0Vhd2JjSlNKT2tGL3JOUjRaTWd3NmVYUzZl?=
 =?utf-8?B?anA2V0FRNHBjeFR2Q1hWSE1oNkN2TlRqS1p0Y3dBdU5rMU1SWDRQbXVaYVBW?=
 =?utf-8?B?SFVvZi9RZWNoditReEdocUo0eWVSQ3BZNGJDNC83SFFkcDFqVkFkN2dHckFW?=
 =?utf-8?B?eDJnZmtCQW9FelNZTGNndmNHbG9xNHNheTRqZHZvQ2sxNi81UG9BdE1hSEpt?=
 =?utf-8?B?ZDlRWXF0MjYyT0I5WFI3MDBXbEI1QnNadjJ5NVlaQWRpUlpUdjBPVStUZjFT?=
 =?utf-8?B?aVZjS3lDV3dqL202Y1hBYnBLUHEveFQwQzBhQk1aUmNFU1JWRjVTTXBCbG85?=
 =?utf-8?B?dktFZ3ZtM2NNcXl1cVJqYWE2Q0dBaXAzM2NPSXdVVkZtcDV1L0h3K0F4RkxW?=
 =?utf-8?B?c3A1K1lQbk40bG43R2NUTzA0UUZoWXA3N2I3bGxnbWhGbTJZZnlxaFJtc0xM?=
 =?utf-8?B?azl2ZjFVNk51dnFjRnRQOVh5OFVQT1hYMjk1VEZMTURlVXBDMWtIcXlLb0tZ?=
 =?utf-8?B?eGRYZjk4UXUra3VtK0RBS2JxUDhLK0pRR3VSamRsWkZia3o4TUhvVExYTTBi?=
 =?utf-8?B?K1pFTHlJWlpKa0hDUyt4THZzVm5DUkJJN2xHZnp1dVljVHBFT2lWNnFvSFJa?=
 =?utf-8?B?T21qK2RGL0laN2d1dUZFN3pLQUROWmJEQ002U2V6d3lzL3N4RTEycjNsMWlV?=
 =?utf-8?Q?zUaIoAp+QoIVDgIu2QcfrkjRJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5CB805FE9D14840947CC2568A66C763@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2reoRQA3EJDh0B9koAP86npdvfND5X2BX/0XxsY4yw9ZXA3501xRZKq3ICGYHNWw6chJ6v/ZJjONT2gNWkks5M85x4FX3Vj3D8Utoo4cCpswg+3WugwDbsg0ThVNn3nHCDXWqZffqX1+GdPE3Gh13/bDnQwuk+ZFxY5QqXDePf5i1PRUtm8jl1+udjo/0nfyBLazjq3A0cklcSBfW5iM9A36dRgeecO0YDWqruYhiyUWH/E18huHmXYD5pQ1NQ6p5kx/Fit/akjzkFvsvN9vLUF3prLb9zaAuJ500Ak3ETY9c48dd81d4n8/oSXX0WMKubvldzyOrxoNN8PxMmcwLW8Dtaq7qXo0eQ76KZD1tWPHEXkAb0CGucgFI3qm8pV/HKUIO5pEbHB9v3C5I3wpiaWcMYxszQQrOlVUk5AYJBP5ldGREg4oWfJpb3j53ax2iLGqt8XmUPPIdgbF+lXlQkbWdCnTFrCnh1+Qw46gGEcA3mHb0y966mYKPv+KnA3ukhwUGtI1j9VOJDlUWWB7cR2yxqqBJEDzvbx39RmSn0aBsPOeZa/2uX5CoHJupDKsOYU5DjdRLFIUOhzf8Jp+HltmQTCUV5zuxrvtxrgzXqVh2L99T8XOdGub37b0VyEHf+Dq0Vs1gKODMx/RYQMSvw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a28995c6-ba9b-4d95-3a6b-08dd3a75ccb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 23:46:17.6462
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cxRzGzj779+dgP8bwgONLQ6h/AOCeXI7OEJyXTYNBZhesxxIlfOcV/oI3d26txR06wW+WA3sz6rbLFdxtZ0luA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4278
X-Proofpoint-GUID: aZaV_swzxlDG2yxNyx11MgApxNMTGORM
X-Proofpoint-ORIG-GUID: aZaV_swzxlDG2yxNyx11MgApxNMTGORM
X-Authority-Analysis: v=2.4 cv=PewFhjhd c=1 sm=1 tr=0 ts=679031ce cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=LE8EDvVpFQNZ5sap7F4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_09,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=560 spamscore=0 priorityscore=1501 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210189

T24gRnJpLCBKYW4gMTcsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gVGh1LCBK
YW4gMTYsIDIwMjUgYXQgMTE6Mzk6NDJQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
IE9uIFRodSwgSmFuIDE2LCAyMDI1LCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+IA0KPiAuLi4N
Cj4gDQo+ID4gPiArICogSW50ZWwgTWVycmlmaWVsZCB1c2VzIHRoZXNlIGVuZHBvaW50cyBmb3Ig
dHJhY2luZyBhbmQgdGhleSBzaG91bGRuJ3QgYmUgdXNlZA0KPiA+ID4gKyAqIGZvciBub3JtYWwg
dHJhbnNmZXJzLCB3ZSBuZWVkIHRvIHNraXAgdGhlbS4NCj4gPiA+ICsgKiDigKIgMSBIaWdoIEJX
IEJ1bGsgSU4gKElOIzEpIChSVElUKQ0KPiA+ID4gKyAqIOKAoiAxIDFLQiBCVyBCdWxrIElOIChJ
TiM4KSArIDEgMUtCIEJXIEJ1bGsgT1VUIChSdW4gQ29udHJvbCkgKE9VVCM4KQ0KPiA+IA0KPiA+
IFBsZWFzZSB1c2UgcmVndWxhciBidWxsZXQgY2hhcmFjdGVyIGFuZCBsaXN0IHRoZSBlbmRwb2lu
dCBwZXIgbGluZS4NCj4gDQo+IFdoaWNoIGlzLi4uPw0KPiANCj4gVG8gbXkgY3VyaW9zaXR5LCB3
aGF0J3Mgd3Jvbmcgd2l0aCB0aGUgYWJvdmU/DQo+IA0KDQpQbGVhc2UgdXNlIGEgY2hhcmFjdGVy
IHRoYXQgd2UgY2FuIGZpbmQgb24gdGhlIGtleWJvYXJkICgtIG9yICogZm9yDQpleGFtcGxlKS4N
Cg0KQW5kIHdoeSB3b3VsZCB5b3Ugd2FudCB0byBsaXN0IHRoZW0gbGlrZSB0aGlzOg0KDQoJKiBF
bmRwb2ludCBBDQoJKiBFbmRwb2ludCBCICsgRW5kcG9pbnQgQw0KDQpBcyBvcHBvc2UgdG86DQoN
CgkqIEVuZHBvaW50IEENCgkqIEVuZHBvaW50IEINCgkqIEVuZHBvaW50IEMNCg0KQlIsDQpUaGlu
aA==

