Return-Path: <linux-usb+bounces-35422-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HlaIx5Bw2kFpgQAu9opvQ
	(envelope-from <linux-usb+bounces-35422-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 02:57:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B9831E866
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 02:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F0AB3118C2B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 01:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB0727280A;
	Wed, 25 Mar 2026 01:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bye1em8q";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XFLS9TWQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Kfgv9V16"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CFF13DDAA
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 01:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403580; cv=fail; b=KdKzuhgwp20fc5XiezjoMNchWCbPhT6ngRm5ILAXJmQcp0RpX/5ePjDa0f1E9S5dq1GnFmpa2QmAlH+Qlw4PSFxWzhZdoxxLVa/uSIQQWNyMrz7iF/yC5souH5hkSZwf/gZnJL3uYcPvLd2FoVoytt1p4x+w+SL2RQkANb3NiLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403580; c=relaxed/simple;
	bh=V6IkloWJXN+JNivDzIudHuB6lXwjfPu465FrBb2n1nY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AVXf4KtfI3R6IctmVCvPpiqMz0zcM7JESiEhcwOetn+hVK692Pf+/LcxhDFDYceOnb1Fw5QxK4OZo5yRlSDGFH+3GzmoLzqBYfLxV+gAAHRBA/S1H4pwru1g1CmYNpzc3JUUHpGU9SSzfSCc2Q8shWMUAhTXHYHKjBBb1kKujU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bye1em8q; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XFLS9TWQ; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Kfgv9V16 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMDQoe830810;
	Tue, 24 Mar 2026 18:52:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=V6IkloWJXN+JNivDzIudHuB6lXwjfPu465FrBb2n1nY=; b=
	bye1em8qbWqYjxiGziZwy7ihsvv+E4JGyuMB+f8qcclu/IhV8bFwgri14a1nQwZi
	qtmv0+tmGINxH+zJs1szKuc+MeoeYg6FciyCCJIk6NrxTzhaaOdapDttpFXr9ngU
	9W8pvOnUeNciHg4FUY9AuOdgDPrY4G1Kx20LfikjGCLyA6ZajaEfNPXlvNKlujP0
	6T7QF6kSV8V0hQDaYK77q3Nx6wgyH6aNl6Pb7diT6LN8D2orH1Me0p2phwkHwRgM
	kziSTkEoehF9dmbx3axvlPvot90FwtwMvr4EHC0t0/JIQycN3PfJs/dFB7EL1Hdl
	CgpFhJmw2r4zFIhoI2SGMA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4d3vwakj70-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 18:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1774403567; bh=V6IkloWJXN+JNivDzIudHuB6lXwjfPu465FrBb2n1nY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=XFLS9TWQ4zkErvjaVtKKIVtIKBG17gTJuThayQPfXfDpDVi/IXgUK5FVMXzYK4PWq
	 4nI5rIBtSP1MBjrZaiHyxCdUJGsYD6Y4bpXSmumq21yE7cP2RhpTyLz21+596pLwR3
	 TuUX52OnPLYo/3IAgySN8cCkJCuQagWi5O98MYCQUBBnJe2mLPByzWiSUyO1m6QMm6
	 PK5ePrapxS+vAES98HNS3GZGETwkPDtIIKLDGVI44QxwrV0tgvb97or+tFBEkfynSB
	 SsS95eepRe4U2soRAub0mYnoSX8kMr9UQsSrwCtFRs/g6llbKe7W4/VHWpOXo5miNR
	 S5iVo5W7eoP5A==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2FF8940087;
	Wed, 25 Mar 2026 01:52:47 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 04FBBA0138;
	Wed, 25 Mar 2026 01:52:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Kfgv9V16;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00105.outbound.protection.outlook.com [40.93.13.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 74B874034B;
	Wed, 25 Mar 2026 01:52:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmmKTwrXBDjBgWAZZLWrFd4tZ7wUZfnHeV7Z8UeQ7durClRLcVDPCNiETiOHQaVnnt7gFR7g1aOzZjz8VVdPcv7/vjmuNMapR0Q78vjr4q39YTFCbUhVJ5Hm9ITUG4VZLKwXl0E4w1Cu4loxeuImlTYvrC2zQox1MOMZIByJe0nPOtCqx32wELSH3VNdc8V3FBDCvaRH4Z7T36mfXgWQlN9XWlpmxFBLEbTeeOoDIGsM4KCDU4RpePM1UYLhIkbXysqynLpBeGZrFNcrH8R/Jm9s4m94w5NwWKWLdzHKty3MzCKEUIz6q87K/ZQW02ivLLPSC0DIFjaiYa7bD8nBbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6IkloWJXN+JNivDzIudHuB6lXwjfPu465FrBb2n1nY=;
 b=SDepuU2CmszuYU5rPrcn9lS6r7erFOO6bN+zI3JJpihuFvSB5a+qDfnWaDe4ObKrJo6oBhtz2HBf3EYOQRlUZarJTA0rLJ6ytZNVdiyLhoqF7nvOIBgSjHXpcGiZ2IdbNyLuNTa82QELRMTgr14Wn7hXz/8uo1ja3m3PRMKQ2y9+ZLhvSLAQFX4g6F1rOT0nrHEhOWRdreITfpuVpwN57zKFydhO95qlkvyudWkAZDoOKiuHrdMu/ZiyIbs5re5vC4Yi7U0s4cc1mxbZkojUrLGF2p2SXxnIkCVV6MnntV2j4fKBhF6g3NUw3DuAwJCMQ/+zQYyFzbrX6PaHup9vLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6IkloWJXN+JNivDzIudHuB6lXwjfPu465FrBb2n1nY=;
 b=Kfgv9V169jThhOuMx+8sZYl6Ube0OgD8JHTVNMBNJ/dMNS/kqzJ0/5W6qudwsHUPP4UyghDaofxHbo8VvIWgvMysHixNUmktAQn2YN6cuzL2Wta7U2GSAW56XWq8iAbU2GI5AN8cd/eeMkwsuj6ArN2LWmN4/lPc/ZJV0K4vtkc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB7455.namprd12.prod.outlook.com (2603:10b6:510:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 01:52:41 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 01:52:41 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Topic: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Index: AQHcusCFdimQniQh+kKFqQp1mqfuYbW+fjMA
Date: Wed, 25 Mar 2026 01:52:41 +0000
Message-ID: <20260325015110.v4r5smfvdd62fcua@synopsys.com>
References: <20260323122512.2019893-1-mathias.nyman@linux.intel.com>
 <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
In-Reply-To: <20260323122512.2019893-2-mathias.nyman@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB7455:EE_
x-ms-office365-filtering-correlation-id: a1f950cc-fec9-4c94-cfac-08de8a113365
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 TbYKH7SmRpPiMmjtfAHB3Wjw90NfFEU8VDM4ODwE2ZfntVTu63KfFHDFOD8ljq2XfoUD5UbQDGU3sCrCc5z7acOpNESTj0oPdCrSk9gt+OUyDAzMwbeQir2OohlNOiYOSoja5oVDVE3lH6K+VIjbFMjkXRhHaCLAzxYxBF2oOtZlsLWMkYbvp61AXW8+WkCsiKZeTsOxJvJWWiBuwvzjFpKDJxSu3BhPKNWBstNY1DNFiQgNIe0q4+Rq6Wiib/mqkLcutdF61nooEsixLQKeD0nzDMZRO0nMWWeCXmzATOM3sBm/MylmQ+DGvpkFPwGlzGr/kkVlQ/IHIHdu5pJ5TaLdLv3i0EijxOfHjWbQ0uNMahFfzKR29HmNKLPPW/XPamf7ynwYkb3Ow+uTlhX3DtgSQaOcCD/diRu2rfY1UIlkCayH8horgFpcDOC5Z8/WMwTcYULizZK0q6FxlEw8m9aKII1bh6RTWBQUGX+x+bBhXEWgSY4W2Xqk+qFwm0zVV/ewDsuj/060GXhghh2hQRABSFURGxqUSIbVGgWIHyvguAQsnCrkj8OuRMDUQEv1La2PFIN60erColHsEmC6uVWOX7q/V+9WGcMs71hoT5oQvZcLJf9c05jivH8+Yj75JIIPyQbfxLN1gZm+/pE5fQp/wgXvC6pOa3bHcmKIX4MhQkd/a1ipakyn4Kjrl/vEMpIrqsrZlRkEk0Szvhhq6DUc0YC045kHmr4XWPDu733oOEc83MQZd55VXB5pSEW5VPD0gJ358R+HgciiFRPVeWJx5E3H6X2DTgiz5DF83DI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UU5QRTZNQ0c0VFV4cEMxTC85cTFaTm5PVGVDNWVMYUFCVitBQVNjUEhBRXQr?=
 =?utf-8?B?azJoSk9JWUt2QVJKZVdEcUVQeVFCaURmNElkYmkxQVlhWEVKUTlZUW9NKys0?=
 =?utf-8?B?SEhKbG5JS045RnN3Y3A3NnBtSFQrTFhOWDYwZzA4d1VmOWpacnA0Yng5MWN1?=
 =?utf-8?B?ekdVQWJ5SDR6bEp4emNqdkR2c2NxSGtBTEFZTGFNdDc1K05oTzhHWkVPTEJr?=
 =?utf-8?B?VmRwL3RVYTE4WXFUVDB3MEREWGdOL2gzVnZPZFo4bE5UaGsxVFU0bVJCL0VF?=
 =?utf-8?B?YkwrOUhDUEltL2M5cldUR0pWRDZJS3AzTjUzZWEyYnJSdEQ4KzdwaHgxOTN1?=
 =?utf-8?B?NDhEZFpWbEk3MHdEdFp6bEpGZDRUNzJ5TGtxUmVRZERMRWJYTlNtR3pCUUlG?=
 =?utf-8?B?bEt5Z0tEZi91STVXcjVobVpZcmZWeHo2SVlQR1pCQ21kQmlPOFoxUVA0a3JD?=
 =?utf-8?B?akRDMUZOTWUwTlM5Y0ZLeVF5UzRHZVBpV016Z0J6R0tRcjUzYnpGRHJGMEtv?=
 =?utf-8?B?TW5HU2ZFKzV1N0drUFpib3M2WGJsS0IrUWlYL0hnVGlwQVFZVmtwdThtV2hH?=
 =?utf-8?B?T2k1VTFLNTNBK2dhNi9hK0Q2bEhGc3BiVDdhSG9rb1N2TWJYeU81eFFIWEFZ?=
 =?utf-8?B?WTZoaGtENnN5bmJpK01IM2tPM08wL1JwdnREYnZMaGtLTVI3RXBIekVkTnNX?=
 =?utf-8?B?b055UDBackNzVzlGWmxjUEFBT3ZCSUtIUHVFZVBaV01kT1VrcjhiRjFiWWR5?=
 =?utf-8?B?N3JyNGpSYnh0VXZBRk1EUHJGUTY5VEYxc21BMTB4TEN0OWdmY2Q5akZ3VVVp?=
 =?utf-8?B?UW1MbkdQaGwwTHdobGgvWnF2Z2NiUmpoWDZGWEl0RFVnZEtBNEprNHZpdnlr?=
 =?utf-8?B?dVBjcnhYK1FyZ2R4UXFXNHpORFMzcmpMS21oclEwYVo5OGsxWFcvMGU0REFk?=
 =?utf-8?B?U2IyVW5SK205R2IxbFdTSFlhK3p5QnhuSzA3N0RidUpVbXZ2bFJWNU82alFj?=
 =?utf-8?B?RlBUeENkQUI0Sm9YeE9qUEJibkhlbVpVbFNla0JRdS9ZNnA4M3puSnVCaUlY?=
 =?utf-8?B?WXRNZ1BOVk03UXcyU0RXUTVmVW9ZZGhWSXVZbldvR1M1eG50MG1HSTNnUEdZ?=
 =?utf-8?B?SUZWNkZjaWpEV3JsN1l2WTk4UWJzVG45aTFlcmdma2pzS2RKbWhpTEJVKzRy?=
 =?utf-8?B?WHpFM1lkNkt1Z09UREdNakpQZ0tWOUxVa2JWaEI1N21hOStvWkI4ODBuSDcz?=
 =?utf-8?B?RTV3N3pDckFuaWJmVitxdG1UbWM1cDl0cGlXYVZRMm5BOU40SEx0LzM5QU93?=
 =?utf-8?B?aFI2MGxxM2V4TGJlazlCSkc4VnVNSE1JblZIeDZnODk0bXJoYmUxTlZPZ1E3?=
 =?utf-8?B?Vk1oSEJySHY4V2lJS3BGMXVNU2IvTm1mWkpYb0pnNUFUNzZVUEZDUjhOQjB0?=
 =?utf-8?B?R2xMVEY3d1QrZHVnOEFPOWRUWkMrRCtBeFo2TnNaS2RGYUd6M1NPR1hZOEpO?=
 =?utf-8?B?ZHFjRllNMVROZEJaK00rTG5UaEwzNTZtVE83QmRVNnJNeHZNdWsyWTI5V2F5?=
 =?utf-8?B?RERsY0gxR2dDUTZSdi8yWllmWW1VUHlvckhsR1YzbFV4bTZNVUV3UVF2QnpZ?=
 =?utf-8?B?cVNvY09EVzRuMzlMTzh2bEFrMTFON296dnMrVUdPZkRmQnZHRTlLaE9YSWVk?=
 =?utf-8?B?VkxxZ0xXT2ZwT283ZXJzQUpkMFNKT1lzNVJUUXQ3QmxSTWZ5dEJwd2tsZ0lu?=
 =?utf-8?B?TENvMWhjbys3VEdkREpULzhmVEFQRXlMeW9YTnVJSE9NandmR2duMVd4ajNF?=
 =?utf-8?B?VXhEMDdDZVY1WGIxVEZmLytCU2xscVBmMTBnQzdMZ3BRTkVCbVBNNVQyeSty?=
 =?utf-8?B?QjdCK3ZKdlFjdWJwYWZEUFphQmwxaFRvRWQ5ckJEL3ZQeE11dzJaN3JCRXhZ?=
 =?utf-8?B?WEdPNUppYWovYUxEWHM3WmlaWTZ6cTJ6UEM4R1VML0RPRTd5UzA5QjF6SUVh?=
 =?utf-8?B?S0pFWS9ERHVRWDFaNTRVKzVVb0JZNGp1NDVqcEZ1UHU5LzZwRjBqeE5Zd3E1?=
 =?utf-8?B?QXh0TXJpcE90NUZLQnZpQTVhMVpCcng4TVdLU2JESUVOZXZralpyb1d6OFBa?=
 =?utf-8?B?WWVjclp0WWJVdUZVcmNHQmlQVWhkM3o0N1l1VlJFZlBrV0cvay9KVXg3RlFJ?=
 =?utf-8?B?L0JXNEpLa2thN2hWMDNHRHlnNTV2akpwL0hlTXFXNEVFYTdUQ1F2bmUxdW9m?=
 =?utf-8?B?RDJDT1JFVXhtUFJXb1RMMUdSTUI0L1JRN3M5UDVtc2kwVGtGRE00UTFGUnZt?=
 =?utf-8?B?cEZXWXNpU2ZVU0kzLzA2RVg5UGZIaEowUTBMaDZVUFFOa2VSOE1RQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E2282163093E64B9F5C522B0A463C06@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	eGoBDJH55OiZlpVLaMTJfgFfvy28hjRfUTwnMipbQsumvPT1cxWs43Kb8qQjdR2LLO/nUyTr9DumvPs7EMiwp7vYJfJMkDfMxw+geAGSgRzBq+TO13rnctaJczs/McLf0mD/t9++x9hAWL5QTrSos01q21/kezafyjePBwpo2yyY6hEwH8BPdIXegYVhOTASuZnAg00+poN4KVhLjO5bO4YqhiB+p9ux5lK2WMx4/BeQ/ddOzuXQw+VFdtp7kq+J/VcoRmEtY6MHTAE5z9NEfsz523nei9XRzTkgoulzV05HFoiKics5AR740OF6BW3rJkhPYhhYLKgUO3BS5zf8PA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dEy7l6L/J59ZI0dueLla1KG0S9CjRcoO5WilIeLmd/WWt2o5jf2plTt5oNzIAWY1jBPps938R8iYpwuW+MATEn806XwtZzGfsHML6V14DzFdJpqdkCODKnGdkulUNGLIA/+8qdgaKwNayqqTke6mwhFZE4gye578Cy95W1vfhRGtKWQjEgc8mIrGGl1qQoyxZhtshJb+9yxBkg3b35SosfpISS1HOM6u1lsfCSM3xMb0IzBuy1zm0IAqbBwY4wBbBxWV02cf7uKKGCKd7s57DcVTu6VetxiCWhT5HYl+SEjUBH4e5m21S1W17AGd1Jvd9nzN9Ha5179gT4isWjw37kycZZQBsD2K7s8kwlqv+mEMQatsgGff/18nA/dhUsqYpzSgLNxxLZWkfjKnRc1AauvYRKmw0/7MSGtPqh2UYRP9yt+6tSztvWYg0w4s0h00BTLL5GDNbn6WGFjOE8P4FVduAe0i1cdBwWUxQ0ZfmYrHNj5heUChHCpsSqHM4xbbjf4T3xjeoMwwOGUFcegn6beXjjmxyJjMxUDo2D961HGG8rux2zvqCMshQYvg8PMj0+SVKC6FXlAWl6L+x4toJLLTSYHQ7LVgZDtFB2lVkDocuH+kdizjmpVK3wafinCYwuYIHlkZK4O8a7vOIV8fPA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f950cc-fec9-4c94-cfac-08de8a113365
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 01:52:41.4200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TNiit/7fAQjhmJDOU4OD2P9vlUan0mvnZkjUM7heDJ/hWfhBfI8mIraALNocpXRu6OKS6rlhSiHFoqLNAfLtnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7455
X-Proofpoint-GUID: d2VZvyPkZK5OPIpd2RTNfbgZZWjRY1vm
X-Proofpoint-ORIG-GUID: d2VZvyPkZK5OPIpd2RTNfbgZZWjRY1vm
X-Authority-Analysis: v=2.4 cv=B960EetM c=1 sm=1 tr=0 ts=69c33ff0 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=QyXUC8HyAAAA:8 a=79v-_WMcvXznHI-CTmgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAxMSBTYWx0ZWRfX01oFVImNm4mV
 AKx8ujRWG4iKUGsuI2JAaOKAjL8dtHl6zIyZLOngjVLfFHVFd5r+CHyxPsQJmA9Si+AItbKna2w
 +Dybh6NfLl942vc0+zia0iNANgplHjMm1lPDRw2+JYhJYj4FIqALH9LP1ZlUfd4Zgpw0FozRKCd
 zjWkxtmvgGtN1kKU1SnlwYAC2CzajJi16dGoEKsuTXOA6voxbkXmpRcDpxofzVDC1MeOHpsOD6/
 F+/iJihlUAlk2h9gDZR0mzVpQpeTBHk/2ZvwY05Mr2ysipX04qu/VHdvBwHVZOrBKeHoO+OCQTC
 KNSbp3apr0uVPgfnVnI3UdsZEfgyvtukrieo8NJaq/hsBZcQJ2aq3vkbaeTTI52u9OiFvS/r+kS
 AUgKvMg+xyRy/HCLa+A2gi3WbCrBG15uOHOmQp+ufkZujPNmAksbedYz+mdJDToYI067FEfQha2
 G16OvL7V6SfVDsuUQBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603250011
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35422-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,synopsys.com:dkim,synopsys.com:mid];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,rowland.harvard.edu,synopsys.com,gmail.com,suse.com,linux.intel.com];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E1B9831E866
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBNYXIgMjMsIDIwMjYsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IEF2b2lkIGF1dG9t
YXRpY2FsbHkgcmVzdGFydGluZyBidWxrIG9yIGludGVycnVwdCB0cmFuc2ZlcnMgYWZ0ZXIgYQ0K
PiBVUkIgaXMgZ2l2ZW4gYmFjayBkdWUgdG8gc3RhbGwgb3IgZXJyb3IuDQo+IA0KPiBJbnRyb2R1
Y2UgYSAnVERfVEFJTlRFRCcgc3RhdGUgZm9yIHBlbmRpbmcgVERzIHF1ZXVlZCBvbiBhIGVuZHBv
aW50IHdoZW4NCj4gaXQgaGFsdGVkLiBUaGUgYWN0dWFsIFREIHRoZSBlbmRwb2ludCBoYWx0ZWQg
b24gaXMgbWFya2VkIFREX0hBTFRFRCwNCj4gYW5kIGl0cyBVUkIgaXMgZ2l2ZW4gYmFjayB3aXRo
IHByb3BlciBFUFJPVE8gb3IgRVBJUEUgZXJyb3IgY29kZS4NCj4gDQo+IERvbid0IGF1dG9tYXRp
Y2FsbHkgcmVzdGFydCBhbiBlbmRwb2ludCBpZiB0aGUgbmV4dCBxdWV1ZWQgVEQgYWZ0ZXINCj4g
dGhlIFREX0hBTFRFRCBvbmUgaXMgbWFya2VkIHRhaW50ZWQuDQoNClNvdW5kcyBnb29kIGZvciAt
RVBST1RPLCBidXQgd2lsbCBhIGNsZWFyLWhhbHQgcmluZyB0aGUgY29ycmVzcG9uZGluZw0KdGhl
IGVuZHBvaW50J3MgZG9vcmJlbGwgZm9yIFNUQUxMIGVuZHBvaW50Pw0KDQpCUiwNClRoaW5oDQoN
Cj4gDQo+IGNsYXNzIGRyaXZlciBpcyBleHBlY3RlZCB0byBjYW5jZWwgYWxsIHRob3NlIHBlbmRp
bmcgVVJCcyBiZWZvcmUNCj4gc3VibWl0dGluZyBtb3JlIFVSQnMsIG9yIGJlZm9yZSBjbGVhcmlu
ZyBoYWx0LCBidXQgaXMgbm90IGZvcmNlZCB0by4NCj4gQWx3YXlzIHN0YXJ0IHRoZSBlbmRwb2lu
dCB3aGVuIGEgbmV3IFVSQiBpcyBxdWV1ZWQsIGJ1dCBwcmludCBhIGRlYnVnDQo+IG1lc3NhZ2Ug
aWYgdGhlcmUgYXJlIHN0aWxsIHRhaW50ZWQgVVJCcyBsZWZ0IHVuY2FuY2VsbGVkLg0KPiANCj4g
VGhlIHNhbWUgY29kZSBpcyB1c2VkIGZvciBjbGVhcmluZyB1cCBjYWNoZWQgVERzIGZyb20geEhD
IGluIGJvdGgNCj4gdGhlIFVSQiBzdGFsbC9lcnJvciBjYXNlIGFzIHdoZW4gYSBjbGFzcyBkcml2
ZXIgY2FuY2VscyBVUkJzLg0KPiBJbiB0aGUgY2FuY2VsIGNhc2UgZW5kcG9pbnQgaXMgcmVzdGFy
dGVkIGFmdGVyIHJlbW92aW5nIHRoZSBjYW5jZWxsZWQNCj4gVVJCLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTWF0aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRlbC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLXJpbmcuYyB8IDQ4ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLQ0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLmMgICAgICB8ICA3
ICsrKysrKw0KPiAgZHJpdmVycy91c2IvaG9zdC94aGNpLmggICAgICB8ICA0ICsrLQ0KPiAgMyBm
aWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiA=

