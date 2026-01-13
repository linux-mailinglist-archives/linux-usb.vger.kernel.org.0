Return-Path: <linux-usb+bounces-32302-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 24655D1BBC5
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 00:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99A7530146CD
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 23:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A493436BCF1;
	Tue, 13 Jan 2026 23:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hWhr3UiO";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TwjTDwzC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="uDC/e4sT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04590350A2F;
	Tue, 13 Jan 2026 23:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768347497; cv=fail; b=OnfoT5lwVg2lTNHgHAtxINukYXHsXVjSvWuMezQvtg6Ta96QiRAmtrE02YXgV66+KKQJzZWpyBzE3mfkpLmfiH91uz0iG2mCchHbzPr9dksLiW5kGgqrYAiozdx8dmE3PRRne/LWuTE9ZyYDNP0ZW2b1qxlVwEg1eg3XAGT5gCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768347497; c=relaxed/simple;
	bh=9gLwdjgfEnw8mt8gJoDM4aBQSbXvLmCX+qiQWeY5DGs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GcKCh46aVzHoyWWgvJpEAgRnCnF+ikn/ZFbgXIr5qNqsklUI8c60WF9zXHb3wac9APTLNGMeqH3fS8HVT5MoCt3w5PXUu2I4cnHMXy95V9Cx6MiO7gLziLNxW1Le75i0KQ0xRkMcyr3yeALEZseYm4iHBSUFa4RPlhixwDWiP8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hWhr3UiO; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TwjTDwzC; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=uDC/e4sT reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DLSJx03106041;
	Tue, 13 Jan 2026 15:38:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=9gLwdjgfEnw8mt8gJoDM4aBQSbXvLmCX+qiQWeY5DGs=; b=
	hWhr3UiO0+O8DjJlzuVX1F803HPkEchSRk+nhY/dfUO4ZOQnLGMg6SWJdBLpFWM6
	h6IkrPbL5EPmDDE9leynzHb2CDgn6bKFmgrH/FhnMWJIr7qOvHR1PQM/O83XCdt3
	92XnBdlCPchn0Dd5l9y62xQe+1thMq8YT9qlMFf3Z0zW5zxK0HoigXEHl9dbcAxQ
	2D3hc2RSsxD6mz9F3VhR3FfmvGvvKfGUnKEQv54UD+UzgqiYGPbFEGt8A+ahmX/K
	WDupAH0SbO3W/Gru7H0V22YBOvvsl8gJyHyJs26Z/ckjsoAnCUw6nluz936orGW8
	F5QmEF7Xlje/h/X1t1iRQQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bneufnaq1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 15:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1768347491; bh=9gLwdjgfEnw8mt8gJoDM4aBQSbXvLmCX+qiQWeY5DGs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=TwjTDwzCjRAwfUrXXyoOFRHPknlRLxxvmxs4wheJov7Fp3BuVIso3t75jVt9yK4Wp
	 DqNHDb1Fbl2gEn5mGhreNTV4GnV4IZVBvVQa390pLLPEgZjBc+WCPF1Qqu0DVBOUwW
	 30ESHrmnKPRYYtfxZYJCb1gc87+Tp84ZAfvBqWo8x86LftUDEM7fsLs+wXEaBHRjpU
	 jpDKfCl4r6gtrswg2YH1gcfNPNPAuSVExRVjAGzq17lDddA9NQl0mx+Yonj1Cos5U9
	 bD+f+Os7N7jErDwp8VEk+bTr6qL3ibshr0EDDSs+P6Wr4tOjoT9dkEHx/pyzjVMmKn
	 UDny5+F02a9Og==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 701A240545;
	Tue, 13 Jan 2026 23:38:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 21037A006D;
	Tue, 13 Jan 2026 23:38:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=uDC/e4sT;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00107.outbound.protection.outlook.com [40.93.4.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9289340235;
	Tue, 13 Jan 2026 23:38:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5w2nziGGGr0pLBn6x8JKf8TnfSrJ83DdsAwKUZ3GqqybgkrXjEtsHjb6z1a2nhU01j7aznbS7bnCq5dC8JLHJAr6/dYPeRq/NdFkg6w4wQH3Paq8eOqv4nmzATGHjPurspwA1QUA5im5df6/MOAalfkYKtziKoCuUra2+Etzae1CJ/2Tb/O9by+jH7oe5kLc1e3zlI/JX6Wm6/7SAXroPMqc0cYbxSWzbAeImZNQfZSxaHShPsNPrfVPV/acvU3ilKWIAQJh/tcG06/ej40eRKN4jzSJTf19KiLeaPs4lmjYgg3bsdL93VuBgSpomFNDY8gM4wbULXPner+p9ISOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gLwdjgfEnw8mt8gJoDM4aBQSbXvLmCX+qiQWeY5DGs=;
 b=wDM3KMh83vns7TK9oO3A4agXSbsoPxfSfcvfCrEtFIyQQO1ZMt4Yq84Nt62w9RZecHrzrKG+hN5M6WIhVsQfrGpLY5X/7cWpmnmARZroIOglf7kkrT648wVoEVWjtiwWXlyBc8zMK8LHgarzt7HuDoFGFwjBWm10hHefQHvJTJ4gAl0ph1OEo4F2BHpmlEur4DamxOjkKksuL4UsAnJmU84vGyj1AdBXVq/2S74qkKguzUP27U6gLTnGcaGmljyQ3ZPdd6P0cwSf19W6m0jzDYzBi6BbOwCNxrKhJunFZ6wkOwRZW+vb/8TeDVi2at0dpAOBZc2NMF8BJLQLMQ5XLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gLwdjgfEnw8mt8gJoDM4aBQSbXvLmCX+qiQWeY5DGs=;
 b=uDC/e4sThcdEaDUkuYqmnDsGz11lXAXgrPwz4XcuB5m4CGyS175vdWvJanUJjsn1crRvXWXky+M+EJ6uEfc5HB/UudmMQOZhf1KYWcvdMAj3bnb8pT9Mg0Ih87T3QoooRQXl/Z8n7xFLDs8/VNCKiIagm3hTcjIKPzh/Q4uiW/I=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS5PPFEAC589ED8.namprd12.prod.outlook.com (2603:10b6:f:fc00::667) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 23:38:05 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 23:38:05 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] usb: dwc3: Log dwc3 instance name in traces
Thread-Topic: [PATCH v3 3/3] usb: dwc3: Log dwc3 instance name in traces
Thread-Index: AQHchHgurQRzmG1QBk2m5TH7UgjoQ7VQwlYA
Date: Tue, 13 Jan 2026 23:38:05 +0000
Message-ID: <20260113233754.5p325isiaw7v674r@synopsys.com>
References: <20260113103400.2347763-1-prashanth.k@oss.qualcomm.com>
 <20260113103400.2347763-4-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20260113103400.2347763-4-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS5PPFEAC589ED8:EE_
x-ms-office365-filtering-correlation-id: fc64fbe4-4242-4989-5583-08de52fccd02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?c1pxd1REN0hrNVVMMHRBWmJxL09zY0lXeG5hZXNoNkFGRkcwVFpIOHM2WVB3?=
 =?utf-8?B?MWtZQ01hYUZGT2pxdnMyNDk2bnNkSkZCTXZpUHVieXVCUEZIWEZ3Q3lzZEk2?=
 =?utf-8?B?TmRYWCs2S1R5WVFYM0xLelNVZVlMTG9WWmI4R3FLeEx6bGRYZEMxL1JveGlM?=
 =?utf-8?B?S0NTTHdQWUV6R0R2SVNTZXV5bWtHcWhXdVQ4MG9nd1E4aEVhQW82OUJkeEY4?=
 =?utf-8?B?U3hmNjJrSzhjTnAveUJBSGVLTWdxbnRiWFIxNjFRWGh1cXQ0Y1lLMXFaK2ZU?=
 =?utf-8?B?cHh4TmR5bGgrNzgrRzV3ZmVBd2ZXOEZCakg1RW9BczJ6ZXkxcnBBdlBOdTZm?=
 =?utf-8?B?RGl1Y1hCUDFmc3owMlBxSXVPcnM1YkZIelBQbGxYaUxJeHJjeDN4M3RhYURn?=
 =?utf-8?B?S3cwbldXWmlVc2o4b3VTWkxCNnFuSi9YZ0NSTDlUcytsOWx6eVVudlhCTHNv?=
 =?utf-8?B?c3h3YU1DT0M1a0VMSC9WbHVaMGcwNFpEQXFETm9mVjIvM2hQYzhSUjE4dFZs?=
 =?utf-8?B?K3FXdEhaSUdCV3AvVWxvVmZxOEhSSUx0WUFKM3kySHltd1BBSkE0Um15NFVy?=
 =?utf-8?B?UVpuMFp5UHA1alY3eiswakdMQkQyWW1kalA4ZWo1S1MyaVlXMHJaazJIYmow?=
 =?utf-8?B?MmZnOG1xdTVGZEwyR09yT08vMGtTSTdNNkNXMTRqSkcxQkhQcXRGdisrUHpP?=
 =?utf-8?B?YkhKcnltbkJjaWlEeURiZ2NucE5rMnlLcUlBcnZwajRrSnFpQkJZb3VBVG13?=
 =?utf-8?B?WnNlYmNBMXJBTTJzeW9FWFg5NnFnRkI3L1N5OG5KZFVGZWNxWXRWVk95M0tZ?=
 =?utf-8?B?RnRQWmJpeVpBTEFRM0x2TnJkUU1pcE5tOWZxenJXRitLZDd4UWo5cVdkbDBU?=
 =?utf-8?B?TDVSSC96TUpubWJxenRSeXZDalY3VHhhMDJRRlRhUnorR1orZk9qbHNyN2V4?=
 =?utf-8?B?NzU0RWgzUno4ZGl1bEU5V05KSEw0YXZQZ3hkMkQ1cFdRWWxWdGNQOXBhdTZX?=
 =?utf-8?B?SW14SW4rOS9OVlNvbElOZk5MUy8xa2NvL20zZlY0QWxjc2thZ1NkNVVwU0FN?=
 =?utf-8?B?SmFZVkNoTWFlVlIwSzZnUUN3M2JIdDFRMzQvdGxIVlpvOTh0d21uMzEvalpi?=
 =?utf-8?B?eUpQSExtVGhiVEE5YjNMOVAzSHl1ZUJiMzBGdWdSWS9TT0JKazhlUDNuRFVE?=
 =?utf-8?B?YkR3TUJ3NlQxNGg4VzE2OHJPdXl1SEZOS3lkSmQwYXVvajVzYmJtQzJEZEs2?=
 =?utf-8?B?R3ovUTRJb3RBNmRmcmFRVkU5dUNCdTViczREU1lxcjltYmw0R2RXUUd5WmRT?=
 =?utf-8?B?QTZlRzRrL2dHSmRwQnFDdEp3MVVJMHVuclpLbmo0cTRaVllQbElHNVlxMW9Y?=
 =?utf-8?B?bXowUTJXUTZZM3lkYnRHR0ZZSFFtWXRoRzZHUzNDRDZhdDIwRUdRUTRNUXkz?=
 =?utf-8?B?MTkxK01PYjJMQmZGUUVaTkVNN095TUdYcnFtZXlhUE1ueVh3L3hUT1RQeHV0?=
 =?utf-8?B?N3VRY3NFcjJqaU5aNGlEN3ladStScDF4YTZNM3VxL2EvZWROaVg5aEthVnVX?=
 =?utf-8?B?SHRwT2QzRUVLczQ4c3FIT3FZeFFJYXBKb2wrUmdlTjBDTzFkNFpUcVk2RlFY?=
 =?utf-8?B?WFRtWnpTN29GQlhEOGlqYXRYT0ROaUc2TmV2WktWNGhTVzNzRUdHTmZiSGdw?=
 =?utf-8?B?SUNRY1dSa3c4S28rRzhjWTYrMDRDMjUwcEhGa2Y2YUUwWUlBQko2dzNwaTZj?=
 =?utf-8?B?S2ZibWFud3BZdmF4NTFqdjlWRE9qRmVmQlVDUHpYUm9hSzhxY1RBMFY0ZUlU?=
 =?utf-8?B?cThaT05PTXNqZjNieXEwbU1acExKaytPWlMrL21RcUtIV3BtM0hvMCtLYWxU?=
 =?utf-8?B?TFlZcUFwZ0llUlQxTHBpR1pUanBPNklUbkY4aXo1Wm1pb1l5akZJZHlSZkFn?=
 =?utf-8?B?a1lLcVN3bHF0QkNzRnM3VWZVOFBDMFhvQjF3dGJuaTdhOFlZMHdXOStYVHBH?=
 =?utf-8?B?ejltL2RDY25TVkJERElzRzVIQ0doZ25nZE9HTSsyWXlmbWJZVkI4eGpTazF2?=
 =?utf-8?Q?zsh7mU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UG04aE9ocDIrNGoxOGMwZWNxb3ZESFU0bUw2Z28yYmZTMDgvdk5CUk9WSFNX?=
 =?utf-8?B?YlJUd2NlZnlxdSt6VmsrblJLMUMrR2Rpci9kTkdZdEZFUUhPZzFMejZpT3Bi?=
 =?utf-8?B?em1zNzBocUc4SHV0SjIyVFJITVh6RTVTc1RjRWltSDd2SENEUFJqZTladkVj?=
 =?utf-8?B?ZmtCdFdaMG0vaWpvYUZ1RFFhWjNBOE5kWkJybk5MUVNlcW1xOHZYZ1pZeW12?=
 =?utf-8?B?dkhUclhVeFJld1c2OEhxU3dGNnhaZkdSeStvYTRzczhsdDdLU2E5S3A5dGpj?=
 =?utf-8?B?WVY3Z2x6NWNuY29kdzVsbjRkazZzT1VWRGN2aCtyMUdON3RaakdmV2thYlhP?=
 =?utf-8?B?UG5HMCtGakZWczFpWGEza0VIem9pWXFwTE1TM2c4ZW51Ri8vMURTL2dTN1l2?=
 =?utf-8?B?SUJUNDV1ZFVLOEJacXZMcy9pR2k0amtPZFdJa3Y1MjdRVy9WczIrUVhaQ1FJ?=
 =?utf-8?B?dkxZdmZpV0VaSFRqelBqaWFFNXBkemZNeVRSZldKWm8ya1laeEtBMGhXWWsx?=
 =?utf-8?B?T01ZS25QMXNZcDM2R09nejVSWk5yOXlEZzRYV1lTZGVLMDFkd0NzbWZoZW45?=
 =?utf-8?B?VXZIcWtaRUVYaW53VE15UElzaHhuMG5ZL0h5VnhHNjRDblhRWXhHSGZiYStG?=
 =?utf-8?B?OE5DVkFveWdDZllIYXMwOXdqNXhGd2JVQkRRRFZETmlQN2s2TWlxSkttZm1n?=
 =?utf-8?B?amplczN5SStXSkEwbFhoYkNTcktSSFZIVnhLeGY0L3VGU05melVyc0lGQUxL?=
 =?utf-8?B?QStCcDZWQ1FwUExRYUFCaU0va0hhSXhSWnZWV0V5QTVLdGZ1d1NCQXI2dkJ0?=
 =?utf-8?B?M20xd2VGMEluYWp2bDdidjdSdkhLSnZvMjJIL3dxVEpjUDg0MkthcnFSV3Rp?=
 =?utf-8?B?RzhNVzZsWlJYTW9xUnE4YisrTjFyREJqSXNXVWxFNzdKMkNnWkJlSkdkQUdo?=
 =?utf-8?B?MEdSdTVHajVjeGVSWHovY2x6QjZCaC9oU0RnbmhuZURKc1BsN2RlSFZubVp3?=
 =?utf-8?B?d0puU3BKMitFRldpQlpOTUV1aWYyTklvMFkxN01aWGt5OVpkYUd6THFCTVl0?=
 =?utf-8?B?K1hoU3ZjRk1HOXZKUFRxcFExZkExdUowNUNKYVo4YmxZUndWbFp1UWY4ZUpQ?=
 =?utf-8?B?RlE0b3lEMWhqTjZkY1FxK0R5QThVZWRhQ1IrcHdmRGVGbklaWnJsNVh2RFFH?=
 =?utf-8?B?MUFhKzhoYmJ6aDk2b3Z6UjZLdmhTWXdFRlRmVEJvcFZqKzhJbVNtVU13dU5P?=
 =?utf-8?B?b0l3bW93TVEwTXMvTEw5cWVsUnI0elBrTTdqSm02am1iRmVnY0dKM3c2Qzc0?=
 =?utf-8?B?MFZLYW4vb2F4NWJBd3RUVlVrUFRYczVlbUZQMDhHZU1ScStBTVFMcjkyMGdF?=
 =?utf-8?B?eit1SFNwd1BwK1RZYnJWMlBxclpMQ1ZuaUdEeVZNTlBjMmE1ZFY0VkJjNS8z?=
 =?utf-8?B?b2tUWHV5RGc1NFpYa01FSFQ0emhVVWtiN2NZM0VRdm5xRVBhdXMraXB1dyta?=
 =?utf-8?B?Z3BCbnZUV0RXbXR0RlBuZHE5ZmhweTBnVGs4VmNyL21OUlpkTnJqZGp1MUdG?=
 =?utf-8?B?UllZL1ZMTiszR1BXTVcwMnA2b0dHNEc0cGpCcHFrYXhqT0FJdkc5U3NNTkkz?=
 =?utf-8?B?S0Y5bTFta25jVld6SUc1T0ZwbXlVSVExY0dsUTZPTWJKZTZxMExicDZwSmNI?=
 =?utf-8?B?ZEU4Q2xSM3VjZC9sWitlUXl1V3k4Yy9FL1NQMGxtRGJhd2NvaFVmYnpWalJm?=
 =?utf-8?B?TFprb3B4WFc3bFJWWGJKcmFxOEpCakxVRkJUM1Juc0NzaHhLbnp0RjgzSjNh?=
 =?utf-8?B?dWRmMnUzY05JcmM5SVo1SWhRcEVoUU9NM3pPYUp0T1BicDNrU2FCME1wSWRY?=
 =?utf-8?B?Y01HTVUzT2FXN1hLczFRcmdMVHFHVnh1UEtXOGl5ZmhkaS9yZkNVeFN4NjJm?=
 =?utf-8?B?K2NkdWJUMkM0NGZOZ1hOY1VvenZhSGt3emRDMkJ1eEQ1UHRpNGF0Vm15V3ZH?=
 =?utf-8?B?cXJtMkxCL3FHak9UNmUzL0xZbXN0ZVk2RXFPM0lEY0xtcjFhKzNXREdIOHpm?=
 =?utf-8?B?eTRSbW5iU21ZMEF4bGttZjFWVHRsamdOakNmdE0wb0pHeDJMK3dvcTJYOTNz?=
 =?utf-8?B?VklnSjMwYU9mWS9vVWxJMjVnMnRJN3JSelcxMlZpdU9Kd2RBcWwyRThqTnBo?=
 =?utf-8?B?N1BzVjJOSE9Kd0JzREpoZDhBTlAxOW4vak5idlZSL1krNnZTRkZxc0ZJUUxX?=
 =?utf-8?B?d2xlRG9MTFhWa0pkcUN1cVpObjFueWNET0ZEenpreUN1R3k3aCs4NnN3L3Rh?=
 =?utf-8?B?Mll3TEZsTnRwNmQ2RUMxWFA2Y3loRys1WlNXZWZqRlpXSEJOTXlFdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6219790B80F6CE4EBCA20E9095758CCA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mW4aj5cczsWBPNfze/9S7h8x/7WEV7rnJvSWXPcfY0A8CSL0UfEN71+4gIrhRQmZv53QabhDX50l6mQ6pv21dfdfFpaRSsMLDk+36hF7HD6sGp6d7PQjovACCdSm378Pa3VH97NrP9Yv806XohFwc2XNFZ4FDsV4vFOkQuEonM9N7gsIBye/k57jVfvxm9/z6DlLfuG4IuJ1wpaaj1gHXjRU8EikefI7e8oWsmMRUwQuyfUWRhbY82xu5giEDKkbM4dFSjwXLYvKzLxRGV3eV1OuRcJ2uxxdJ3RhpOYKFSekc+5aO6ZHJU7lbcR1RUNeAVQjNswfXj9oT3TxZiB5VTzHgq/373gEmpsiubosUHl45Noe/IvyhGQOudsJjuVXNc/H+GBpv2rC6hHAzssGxOQopHbhz9VLHsS6WcsHl4dIEWbCu1g8OBqDTHqDHLFTn2b/CvB+PTDZiRQRret8AYOH3VHAPO7k9togj2KpjaRZx0ctzAjy8ZvuDTMSKWJR9eXcXZe3wseO4SpQedZX2UfKGd0gIqhxUj0P4M9usmHS9DeTmshDzSx44MH7JX8XoyMeP4n2Dl5rV5IDGJAMw90ku7Gyyz+QwOYdoI7+Jv3A9BaefOjRiVQzqprFdfsTXXQg9l+ogrdiVp0P6rNnGA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc64fbe4-4242-4989-5583-08de52fccd02
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 23:38:05.7358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ti1Cy/8zN8Vai5l4H5j4dlDSiURIYGCDacLnQMPKogKQFjMMBBkN8BqIDe8Ka8G7UIgj5GAP3ziH1/FLtQjxTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFEAC589ED8
X-Proofpoint-GUID: XNpzeubh9cCsM-0KCDMtiabs9uN_oyzf
X-Proofpoint-ORIG-GUID: XNpzeubh9cCsM-0KCDMtiabs9uN_oyzf
X-Authority-Analysis: v=2.4 cv=NNHYOk6g c=1 sm=1 tr=0 ts=6966d764 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=G9wRnjp-guiPLVj4gAEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE5MiBTYWx0ZWRfXzPXk0rzecKT2
 FXvjEABsTvZbzr+aNZpsQeauMxvdwXDW6N3L2okg1GenIQ/YEKwBmZdApaULVbuVIcJ9+BKQj10
 Xb68alNq/WEHZBWWDq5oHzoyWbTFHYibmu2WYru2cvpcBL6SXQoUpo15erPb4ImZLtaKxcGHebs
 +IJq+J2ngPjO53A2+7YmkYkM2HUVkY8yddl+yziY6yzNKkw5ajUubpiPV025/JDHKoL5iy2CosJ
 2rdNlC7UyzjnihQBhywEuQ2fw4dyW6J6P8+dc61FpoO366vsEPbnFmfUf9j04aYp4jrNo20GWDG
 TePQUeyvcY11YQT3jCbU74BE57wcx5ok9GQdH3NCRoDM7MMmC1y+/4q5GRn5z97fi78V5L7XPPa
 q1Zsone4O2PbJKZ3Xq3kvnC/noILbmQeHcbYp5Jw/jcD3mcEiLImtBXwox0QVy4ZgaJSq6X3jem
 rpgrnhnR/1mMDdv3PhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601130192

T24gVHVlLCBKYW4gMTMsIDIwMjYsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBXaGVuIG11bHRpcGxl
IERXQzMgY29udHJvbGxlcnMgYXJlIGJlaW5nIHVzZWQsIHRyYWNlIGV2ZW50cyBmcm9tDQo+IGRp
ZmZlcmVudCBpbnN0YW5jZXMgZ2V0IG1peGVkIHVwIG1ha2luZyBkZWJ1Z2dpbmcgZGlmZmljdWx0
IGFzDQo+IHRoZXJlJ3Mgbm8gd2F5IHRvIGRpc3Rpbmd1aXNoIHdoaWNoIGluc3RhbmNlIGdlbmVy
YXRlZCB0aGUgdHJhY2UuDQo+IA0KPiBVc2UgdGhlIHJlZ2lzdGVyIGJhc2UgYWRkcmVzcyBvZiBk
d2MzIGNvbnRyb2xsZXIsIHdoaWNoIGlzIG9idGFpbmVkDQo+IGZyb20gRFQvQUNQSSwgYW5kIGFw
cGVuZCBpdCB0byB0aGUgdHJhY2UgZXZlbnRzLCBzbyB0aGF0IHRoZSBzb3VyY2UNCg0KSXQncyBu
b3QgbmVjY2Vzc2FyaWx5IHRoZSBjYXNlIGlmIGl0J3MgYSBQQ0kgZGV2aWNlLiBJIGRvbid0IHRo
aW5rIHlvdQ0KbmVlZCB0byBtZW50aW9uIHdoZXRoZXIgaXQncyBjb21pbmcgZnJvbSBEVC9BQ1BJ
Lg0KDQpBbHNvLCBwbGVhc2UgZml4ICRzdWJqZWN0IGZyb20gImluc3RhbmNlIG5hbWUiIC0+ICJh
ZGRyZXNzIg0KDQo+IGluc3RhbmNlIGlzIGNsZWFybHkgaWRlbnRpZmlhYmxlLg0KPiANCj4gRXhh
bXBsZSB0cmFjZSBvdXRwdXQsDQo+IGJlZm9yZSAtPiAgZHdjM19ldmVudDogZXZlbnQgKDAwMDAw
MTAxKTogUmVzZXQgW1UwXQ0KPiBhZnRlciAgLT4gIGR3YzNfZXZlbnQ6IDBhNjAwMDAwOiBldmVu
dCAoMDAwMDAxMDEpOiBSZXNldCBbVTBdDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQcmFzaGFudGgg
SyA8cHJhc2hhbnRoLmtAb3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9k
d2MzL2NvcmUuYyAgIHwgIDUgKystDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgIHwgIDMg
KysNCj4gIGRyaXZlcnMvdXNiL2R3YzMvZXAwLmMgICAgfCAgMiArLQ0KPiAgZHJpdmVycy91c2Iv
ZHdjMy9nYWRnZXQuYyB8ICAyICstDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2lvLmggICAgIHwgIDQg
Ky0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvdHJhY2UuaCAgfCA4OCArKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0NCj4gIDYgZmlsZXMgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygr
KSwgMzggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9j
b3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRleCA2NzBhOWQ0YmZmZjIuLjEy
NTYxNjQ4OWUwNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysr
IGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTE1OCw3ICsxNTgsNyBAQCB2b2lkIGR3
YzNfc2V0X3BydGNhcChzdHJ1Y3QgZHdjMyAqZHdjLCB1MzIgbW9kZSwgYm9vbCBpZ25vcmVfc3Vz
cGh5KQ0KPiAgCWR3YzNfd3JpdGVsKGR3YywgRFdDM19HQ1RMLCByZWcpOw0KPiAgDQo+ICAJZHdj
LT5jdXJyZW50X2RyX3JvbGUgPSBtb2RlOw0KPiAtCXRyYWNlX2R3YzNfc2V0X3BydGNhcChtb2Rl
KTsNCj4gKwl0cmFjZV9kd2MzX3NldF9wcnRjYXAoZHdjLCBtb2RlKTsNCj4gIH0NCj4gIEVYUE9S
VF9TWU1CT0xfR1BMKGR3YzNfc2V0X3BydGNhcCk7DQo+ICANCj4gQEAgLTIxOTMsNiArMjE5Myw5
IEBAIGludCBkd2MzX2NvcmVfcHJvYmUoY29uc3Qgc3RydWN0IGR3YzNfcHJvYmVfZGF0YSAqZGF0
YSkNCj4gIAlkd2NfcmVzID0gKnJlczsNCj4gIAlkd2NfcmVzLnN0YXJ0ICs9IERXQzNfR0xPQkFM
U19SRUdTX1NUQVJUOw0KPiAgDQo+ICsJLyogU3RvcmUgdGhlIGJhc2UgcmVnaXN0ZXIgYWRkcmVz
cyBmb3IgdXNpbmcgaXQgaW4gdHJhY2VzIGxhdGVyICovDQo+ICsJZHdjLT5hZGRyZXNzID0gKHUz
MilyZXMtPnN0YXJ0Ow0KPiArDQo+ICAJaWYgKGRldi0+b2Zfbm9kZSkgew0KPiAgCQlzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKnBhcmVudCA9IG9mX2dldF9wYXJlbnQoZGV2LT5vZl9ub2RlKTsNCj4gIA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuaA0KPiBpbmRleCAyMzE4OGI5MTA1MjguLmE4MzA4MDg3Zjc4NiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3Jl
LmgNCj4gQEAgLTExNzgsNiArMTE3OCw4IEBAIHN0cnVjdCBkd2MzX2dsdWVfb3BzIHsNCj4gICAq
IEB3YWtldXBfcGVuZGluZ19mdW5jczogSW5kaWNhdGVzIHdoZXRoZXIgYW55IGludGVyZmFjZSBo
YXMgcmVxdWVzdGVkIGZvcg0KPiAgICoJCQkgZnVuY3Rpb24gd2FrZXVwIGluIGJpdG1hcCBmb3Jt
YXQgd2hlcmUgYml0IHBvc2l0aW9uDQo+ICAgKgkJCSByZXByZXNlbnRzIGludGVyZmFjZV9pZC4N
Cj4gKyAqIEBhZGRyZXNzOiBUaGUgcmVnaXN0ZXIgYmFzZSBhZGRyZXNzIG9mIGNvbnRyb2xsZXIg
YXMgc3BlY2lmaWVkIGluIERUL0FDUEkuDQo+ICsgKgkgICAgIFN0b3JlZCBhcyBzdHJpbmcgJiB1
c2VkIGZvciBsb2dnaW5nIHRoZSBjb250cm9sbGVyIGluc3RhbmNlIGluIHRyYWNlLg0KDQpGaXgg
dGhlIGRlc2NyaXB0aW9uIGhlcmUuIFBlcmhhcHMgc29tZXRoaW5nIGxpa2UgdGhpczogIkNhY2hl
ZCBsb3dlcg0KMzItYml0IGJhc2UgYWRkcmVzcyB0byBiZSB1c2VkIGZvciBsb2dnaW5nIg0KDQo+
ICAgKi8NCj4gIHN0cnVjdCBkd2MzIHsNCj4gIAlzdHJ1Y3Qgd29ya19zdHJ1Y3QJZHJkX3dvcms7
DQo+IEBAIC0xNDEyLDYgKzE0MTQsNyBAQCBzdHJ1Y3QgZHdjMyB7DQo+ICAJc3RydWN0IGRlbnRy
eQkJKmRlYnVnX3Jvb3Q7DQo+ICAJdTMyCQkJZ3NidXNjZmcwX3JlcWluZm87DQo+ICAJdTMyCQkJ
d2FrZXVwX3BlbmRpbmdfZnVuY3M7DQo+ICsJdTMyCQkJYWRkcmVzczsNCg0KV2hpbGUgYXQgaXQs
IGNhbiB3ZSBtb3ZlIHRoaXMgYWJvdmUgImlwIiB3aGVyZSB0aGUgb3RoZXIgZHdjMyBhdHRyaWJ1
dGVzDQppZGVudGlmeWluZyB0aGUgZHdjMyBpbnN0YW5jZSBhcmUgcGxhY2VkPw0KDQpUaGFua3Ms
DQpUaGluaA==

