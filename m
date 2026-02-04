Return-Path: <linux-usb+bounces-33058-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BxVDr2ugmliYAMAu9opvQ
	(envelope-from <linux-usb+bounces-33058-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 03:28:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AE262E0D75
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 03:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCA1B30CBA58
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 02:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5AB2BEFF1;
	Wed,  4 Feb 2026 02:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iRavU8eT";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="H2sP+obz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Sw48+A40"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583A82BD022;
	Wed,  4 Feb 2026 02:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770172073; cv=fail; b=TDW+VLeMhRbzGg/COa8Vwjad8RqvYF6m/ApBs8fKM5xwwsN5sdY9G8bq8I972YpCh1Ywx7mJo68dVU67r6PZGxN72YkSvQ3jCED/utsDyb+IgKYT4ZVvkDeshYP859D37b2/FaKrV1BwDmv4/+iS3n3rH+zXT91u2RUH25SEyho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770172073; c=relaxed/simple;
	bh=J+bffIHnEMc1B1wN8+hXvAniq/NN3z+CsZI0xH0w3P0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iGrdmO3fX5Y5y+EoqGdSWsWW0fETppJM5bnB/9X9mCTqyemOfLQ7BbuQRU8q3njSu6B+ALtWDKZmOplVqiKWDuE6qSnCnfdcoQLo8vjSDQbuF8m4ZPhuG+KQOpIs/YLtkJ37/ZcYXsvj9nbFNh2xu2k6hABAJZ/qDrHJsQRGtcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iRavU8eT; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=H2sP+obz; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Sw48+A40 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Kvt0C2484544;
	Tue, 3 Feb 2026 18:27:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=J+bffIHnEMc1B1wN8+hXvAniq/NN3z+CsZI0xH0w3P0=; b=
	iRavU8eT3SwRJsOi8YLvZV+Jo2U4IpwOJ/QCk4SHor4PNWK3j7iHFHdS333brs+L
	K18YS4ppslevb2fYUyGbfIK56Q0nAMxS0aP5nBZFdKOCHncIOqOvd5YWdipq7TQj
	bY6BVK6kDunZVe6EPjnkDLUTdOljGSl51cfLziyy7oNdC9AErUs99d4LOkrjF/M4
	Zd4DuBRLqwtZl+3wSE3vgDFmbmowMBUhXdr2JoPFspjZ5JsarCQ25ObWXO2EgXGS
	kj6JPqAEgUzvBH23HBExNMFfWhBpg4EHKQyEen+XLB/YuXZKk26CXlRqA1FMJN5c
	u1G/06oUeIi67+hS6s9o0A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4c377c637k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Feb 2026 18:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1770172042; bh=J+bffIHnEMc1B1wN8+hXvAniq/NN3z+CsZI0xH0w3P0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=H2sP+obzjPDVv1YzrLfx4rj0+n2UZI9qnx2ZVwHL/cHhHKV73X/1xsfGgDn5XrVLW
	 eATWgmm6uMkIbDKL5OZ+XfifuEKUuxkSY3F9l4nUxz0VOEVVHoSUQHIhmFcaZ9lhew
	 xCRTn9D9MsQbmhdq3qXWKoIlQ9pJOt8678ZgnLLNu6XxMTgtRtNWMb8hhivyjlzLzj
	 Kcq3lkHV5nCoKzIFjEn/L88RsMt4a7Mpj9Nrkvhr5BVwHpLrnQBCgjbPJM0iPLEh5U
	 rX0opP78XHmso2sfOFpIAEFPe0XnsaqpR2PmGC8Gi0BqdlejVr5PaK90yc8z+0xlLD
	 vSDRHiPA56zDA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 98B284035A;
	Wed,  4 Feb 2026 02:27:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3078EA006B;
	Wed,  4 Feb 2026 02:27:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Sw48+A40;
	dkim-atps=neutral
Received: from PH0PR07CU006.outbound.protection.outlook.com (mail-ph0pr07cu00601.outbound.protection.outlook.com [40.93.23.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B59CD40533;
	Wed,  4 Feb 2026 02:27:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsGxeyL5MytfKi2nzOzloS0+n9vo1qIjL64UWeGgWrZcyGM4p6wSAQvq+RxfRx2I7UmoHhIv4Z8NNKZfZQ+jKsmNzNTNqz6QQbbc81zKEEnZD3E2xyU49jokDDI1905yrMDwzAEnLJeJPxNjUOdRS7G82KTKsY+yiHYaYA4u2II9p9TD1IOLHsxD2yV2Af388FAY+YT2BEROwKsXeSSw2X0Zo1dWZLsHMocOmgGxZm8xrQ9mBb9E3RAkve70PUxvIyPuL/wbaIAB1/BeAfKqsTkDwMD1v+BuGHpUKiF3RcilLLHV/xlwWgjKSLAFMQUHeiELuMjF5DZbmjRRZfEYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+bffIHnEMc1B1wN8+hXvAniq/NN3z+CsZI0xH0w3P0=;
 b=xbps7vu6ZMwUEA+fZ0sLMSe4U1w4UogQzuofqswiVgZqKWpw2im+FYct+aFnCfx5AHaVPlL0xqXWkC4H9eeaMpOoPON6nsxILRFbqJx7sPabnKSXMcOJskJUbsvpZ+DvSIJBGhLs0aGtWueTy4p6CoiU1ORZy2Ob0jn1KDZQU54vVYVJf/yNgerJl/44tqVLe6DsEgsLlfjEAo/i90kkP7PgCCg0nfk73YJmrzkDZTm3YfC0LaPBgSquJ5pKGLdDXh2ZiFfu8ySYIrRgKv1+o8PDamxQ+lM+jaVF9YCx3aMFWTidS1/Xs9YABT7S8nYoxQu6c+XQ1x3BSvGKjbyCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+bffIHnEMc1B1wN8+hXvAniq/NN3z+CsZI0xH0w3P0=;
 b=Sw48+A40FKdzJdulwyVcNFLwAu6KOMij9x1UtFIQO2iE7OllZPReNkg2a+wXnvliiL0SE0bv78umIHudje+mIQ47cD0VDJ8s5Dq+4MIqDOlCBWK/ZFOjZRSrlP3eHV9zuzEOzGMcwpkz+sDjYrlO1v0yi6PJNYh5qsnmSrSneW4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS2PR12MB9822.namprd12.prod.outlook.com (2603:10b6:8:2ba::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 02:27:17 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9542.009; Wed, 4 Feb 2026
 02:27:17 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Peng Fan <peng.fan@oss.nxp.com>
CC: Xu Yang <xu.yang_2@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
        Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] usb: dwc3: introduce flatten model driver of i.MX Soc
Thread-Topic: [PATCH 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Thread-Index: AQHclC50Hm1F+24fW0iSvuy1L+8VR7VwM1kAgAGf0oA=
Date: Wed, 4 Feb 2026 02:27:16 +0000
Message-ID: <20260204022711.muav5duo3f6xijko@synopsys.com>
References:
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-3-c44a5e919380@nxp.com>
 <aYFRrguYW8Ps8Nth@shlinux89>
In-Reply-To: <aYFRrguYW8Ps8Nth@shlinux89>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS2PR12MB9822:EE_
x-ms-office365-filtering-correlation-id: 6859c40c-6f9f-45b0-f66a-08de6394ea49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q2p5WTArUno4Wll6M0dCVUNUTGp3Ui9GdkVSLzRhOFFNdnVCUTltdVVUdG41?=
 =?utf-8?B?QnZoSk9sQ1JrV05yRmVtT1Y4WGRzdGlUczJXUHJ5MTh4aFQvWjBLMFJzelo1?=
 =?utf-8?B?V2FNODE1TE16NTk3NDVMeXlLMGoxaDRvL1E3MGU3L3BmeXg3Tlk5dStiS3Z5?=
 =?utf-8?B?MGpvS2t2cmJZZDJTVTJVZWNQYWdPL2djZGtZY0xoUmYybVM4OVYvYUVyMlBj?=
 =?utf-8?B?VXJsaUlKZHdJRDBIeThzN2hpSUdxYlZ1Q3B4ZG4xQjRFdDhsMEpMLzE3MVdH?=
 =?utf-8?B?SE5XOUQ1WTdzMUlkRG1XQ05TRUpjVXNLazVRazJ0YmN0WnViYWRNaVFYb0sx?=
 =?utf-8?B?aTVrN25OU0NjbTN0OHd5RVgwNVB2eWhhRXZxeTJOeGVMVHFtWUZEL1N2YzY0?=
 =?utf-8?B?R2xMQXFoZnlTVi9JVlpHRDg5TjF5eDl0c2RSR1g4OGFaeU9VczU0d2w5Mzlw?=
 =?utf-8?B?TlVObGtOQWw1b1RHblhRUkl3YVNDNUNqMkw0TU12cGZGcUxXcmVQNzY5dlJo?=
 =?utf-8?B?cC9nN3VMWHFzdmgvL1EwT2R6WFdvUHpsNC8yNVlQVUlkeUl3UUcvdGlQTWxX?=
 =?utf-8?B?N0JqQnl3Y3lYeVZ4WUlvNk9zWmlwalZYWXVmVnNwYlBvcFk3bXM2aWNwcjBH?=
 =?utf-8?B?TS9RNWg5bkovV0kvYmExVWZlaWJGVlZzWWt2Nzl3R3dBenIxcmdwS1RIcFBT?=
 =?utf-8?B?d2doejdVYWcrSzMzcE1QRnJvbUVSSzF5NHJOWTNqMmVmMlJOclVkUzdjNzJx?=
 =?utf-8?B?MGpvMWtRWFBLWjUzNklicVo2eFBvYUwyZmFxbFNBWkZYbjRYUmFrM0pSb2V5?=
 =?utf-8?B?eTZMbzhpOUVFZjRNN0FaRm1hTmhXSC95M3dDV2pWbVl3M0FsNk5KU1hIRmZ6?=
 =?utf-8?B?TFVzbWw5OWxGbDNFRU84ZWpsUEJ4dFFaL1B5QnF2Qk8zb25CYVVqM2VyamJ2?=
 =?utf-8?B?eDZldlMrUmIvVWg3L09oVDYrU3cwdm82Q2NZZmt3TmdaYnNGS1llRi83Vm5L?=
 =?utf-8?B?MlZER0o1Um5GU0pxU2JLdUc4S1dCaDJJck5ER2t6NzZ3Qk8xa2k2Z1VOV3F6?=
 =?utf-8?B?SEhGclY3elBlckRKeThqUXdHdXYzZW0zL0t3RHNsNW5JN3FueDhCVi8wOFZ4?=
 =?utf-8?B?ZFFDVEFBV1E1aEZpcVdOQUtzRVlxVi9PV2tkRFdpSlhYVU1tL1VsdytkY1hO?=
 =?utf-8?B?QzhCUUdLWjU4NzJ6THZjSUZkOHFCaE9Kc3JwdGxrWEV4bVVPeDJIc3k0VEVo?=
 =?utf-8?B?bTZrdStRalFPNE1IVU5RTWs3RmJuRjhCK2MvLzZBeXFscHF3WkczTWdZWm5P?=
 =?utf-8?B?TnpzVktoaEtjYlUvLytIY25NZmR1aDU3V2IyR2J2c0tmam5lc2VOVTAya1ha?=
 =?utf-8?B?TU5GdXVQbzM3SkU5WFdjc0VRZEhISDkySkdTKzExQ1M4SHMyQUlpQVZKK3pR?=
 =?utf-8?B?RFg3Q3Y4OEo3WXkxV3RObW1Zek5UOHRRM3QyblY2YVNWSXpROGQveGpONVQ5?=
 =?utf-8?B?cUVrNlQvemY3cThNN1pwRk0yQnlQOXhpNFJHTHBIakdmMDFCNDZSamJVc2xJ?=
 =?utf-8?B?TGtZdUZ1aWw1STIyeGV5RFNpVmNYdE9FSk1Ma2cxVzFsRXMxcVN3c0RvZzM4?=
 =?utf-8?B?eWphekZFbVdHWmFXSklnd0dzYXYybGxZVjU0emhDYzR3Q2s4UlFTcXBuSmVq?=
 =?utf-8?B?Uy8zNTVydGFyMUtOYm96T1B3VFova1I5VS9YVDZ0UGdKVm1VcW1IQ1ZmakJ0?=
 =?utf-8?B?dnF0NzFnVWxwbGg2UXU4dysza1hXVHhCamt2S1haWHV1dHlNSEk2TENBcWxT?=
 =?utf-8?B?VXJ1MTI5THRRSWtoSDlUZUJmN2FnY3N2ZUtWRVNaOVlRUUVqWXhHWk1GOXRq?=
 =?utf-8?B?Nnh6c3hqU2xiYnJ5bFBPSTU2S3ZnTk15YTBxV3J1c3ZmamNLMXQ4ZXBUWlJW?=
 =?utf-8?B?b3M3R1l5SHlnMklURFh3WHlpa2ZTUVpsNEFtbnlnaTFMUEFtREM2ZUpsUDZS?=
 =?utf-8?B?SmFwUEdKcDdSdjBrT0ozV2xFdkVobkFaQUZENHRhbWVDeHRvMUhoRTBxMzBB?=
 =?utf-8?B?NFhlUnZpQkJIeFFzY3p3VEpldXM4RCtJVGNrWUVNdGtLTmJiZ28xMTNkelFE?=
 =?utf-8?B?enZZQVpqeXZLY2ZOZjNGL21tSFU1ZXpadDRiaFE4VEl1S1J0QXNKbkxreVNS?=
 =?utf-8?Q?DiDZ93UqA2s/nuVg3DLYfXI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q2RXQVFEaC9TemRhNlZmbkgvSGd6aUQwdmJXOFZnZUtBL0JGTFNKaXk3Y0xD?=
 =?utf-8?B?OVJySHNaY24wR21KdjhKN3RVTVdWVm1tVFRHS05QT2dYOXF4MTVXTDFOTENm?=
 =?utf-8?B?VGNub0MxMUh6WmRxcjNaZGNBRlVaNUdLRTBSMFMwRlVPL1RxNjZ6ZEEwdzRo?=
 =?utf-8?B?eG5mMWIyaEFiUWZZL1RaMXdheW1tWXZMNFpORVZmM0xnb3FLeTVwa0VGSkJZ?=
 =?utf-8?B?ZFBDZm9PN0hMS1d0YlhhK3F2UnhaM1FoOGZNbXg5cEdYNzdoK2R6a3NaOEI4?=
 =?utf-8?B?a1E1bmdLM0VvcHhXZ0FiRWlqOEd1bG8xSWNWTnpYVnI0Y3NyK2xCbWpkU3Fk?=
 =?utf-8?B?bWwxa0l4UDEyV1B5SjhyRGVudmtHTG1tMXR5Kzg1WWw3dllheGgzb1BKbVJC?=
 =?utf-8?B?SjhISHF0MWRBbFlaSHo5UCsrZkRwMjBoWWYxRmNHRlk1QjcyMzdldmx0WnJx?=
 =?utf-8?B?NDZjM2ZYOWQzYWI5NFNnejg4dW5lOUM3NHlPYVhJczh0WWNMbWZhMVVEbTM5?=
 =?utf-8?B?OTJCU1lQQzNRMjRaeCtOTklmakp4dWx4T2FObXo4dGVlZzJqeUtzSGJVTy9H?=
 =?utf-8?B?Ni9kZiswUGw0NFpZeFdLamJmVG42VnpPQzZWakFsV3JMVStGclhZR2RiaTF5?=
 =?utf-8?B?Q2FlMTdqalduWmZHQTFjdjJDaW1WK0FVakU3WlBjQk5GTTdDWHRDaTZndnNi?=
 =?utf-8?B?VDFRSjlJUmUwbWhlL01PZTlnL0RpQnhLTzg0TjkvL3pZOHo4THY3WWc4aXNo?=
 =?utf-8?B?M0JPWFgwNXJsNEo1VWQrT3cyUGxOOW5GaUcxSWZpeGZaS1B4K1BZdjY0MDRN?=
 =?utf-8?B?QkNiMGZqUGVYQ1N0UmV1Z0Z5L24wc1A3NzFuLy9HcEpJcElhaGJYc2h2bFVr?=
 =?utf-8?B?eklCcjM3aTJYT1lzY2JjRHB6bWkzY3dNa2NWNzgxVkNPS0FZMituSHcyOHdV?=
 =?utf-8?B?bFpreHowSGlnT0xmR3h0aHlDTEJYUTNRdTVDd2h0a0E3Ny82M2JOeDZxVS9S?=
 =?utf-8?B?dmVENVV3aDdMNElDTERIN0M2eGVXci9zRm41a0I5VFRHSUl5UHlvd0RsZy95?=
 =?utf-8?B?RU1IREJNRE1SZDNsV2M0ZWp5cFlYVjFVa1dmbDRWZFlwNjZiQnhaWmFZOUpV?=
 =?utf-8?B?eldIU21iNjMzaUNFRmhoVE4zc29aK3dCMkdJTWJTMFNPOW1SU3QwR3pyK3hO?=
 =?utf-8?B?enpNVEt1VWdsZmFMNm1nWEMxV21rNjZBK0dUVHY4SFNRaWdSbXI1di90a05K?=
 =?utf-8?B?TWJpeFBwS1h6VkpPTHhyTVY1OUJiT0Q0OS9CR0hZbDh5bExWdE9GRE5udFhM?=
 =?utf-8?B?ZU96Y0o5MnRGSnkwNUZiUWE4VUNGSmpqOVRuNWQ0TXRUWi9Yd1B0VWtXTG5n?=
 =?utf-8?B?NGxyc1dUakJnK2xtdXg2Zm42NTB3R09XNzRzUlMzTGdWa0NGd0RqazQzNXFL?=
 =?utf-8?B?b1d1bnk4bHZOOUdXbmFnZ2U2cTB6Q0lMZktHSjlrVjF2UlpoQTNBUU9LU0Qz?=
 =?utf-8?B?NTR6cytDUWVpaDhwL0dHZ3lmaVZKODRjVUM2eVV3ZFNDbGZVR3NmS1dWNEpG?=
 =?utf-8?B?OUM3RmRWU0FhUVE4ckhBV2tvWU0wMWgxVlRxdGxUM0ZWNmh1Z01ycWxqdU9l?=
 =?utf-8?B?WGdRa3lXaUhuZm5SS1RNZUhsSVBhZVB3ZFZ2WDROUGdwZytVb2I1aE4wRjNS?=
 =?utf-8?B?N2tEeCs4aEU1NngyNEM2aUU2UEM2dzNGS2ZsMFBBb2FOTXEvcTluNUhsNjBN?=
 =?utf-8?B?WXMyMlJtak1vM3QxY2NnVHU1ei90ZjJ6L1djNm5xMDdxK1JtcTNIOG4rVjRD?=
 =?utf-8?B?OEd5L1U0WnhSWlRucTF0cGpaVG45U083bHlqNTdXNDJLcFhsUmJBeFBrUHB2?=
 =?utf-8?B?SFUvNm9rWXIxd0dhbVFVVDVkcDFDeHU4VzUvdkFIb2hCcjlSWndrb1A3WWNw?=
 =?utf-8?B?RWtFT2RSRkdOMWd0QzNreFdSZjhxQ2ZMQktQTVNHNFdaU3piNk5SeFh3YWpM?=
 =?utf-8?B?T1FFQjNVcjB2aFp4Vyt4VVUxaTRGTkJBNkgvVys1SGc4OUswS0E1K1JYb1kz?=
 =?utf-8?B?RzEvUk9HNGR4bWZUS3ZUN0lCcVlqbWZLcmpwVk5FM1FoS0xIbFpiYlR1dnpB?=
 =?utf-8?B?OTRScFlmRUZhVTl4WWFBRmRvcnh5SGRnUk1FaDVKNFJab3E4dXloQ3Q1OXdw?=
 =?utf-8?B?NTI3RXgxY2JaYmJ5YUwwRGlEZkRPSU84S01lb2F5Rzg3RmlmQlZjOVF5aFAz?=
 =?utf-8?B?VWdZcnUvTWwrSFcrVlU0R0F6NllqSDVoWWZvb0VseDVybXpqN2xlc2hSOEZo?=
 =?utf-8?B?bUFMcldEV1hSNTdOTGUyeUEvN0tRN2IwWDRCMzh6TjNVU1V3NWNLdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0528AAB298E7E4085597DB9DB67F01A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eFwvBp7URljFKAhJFXtDugnRLmMBC+7zskXTgjMWsX7VmHoax2eusv66pFK8rlTm8n+SgnBtML8lRDLQMI/6qLTYNVl7mWU6hVImfwSlywoH8A0kJRqkq2nuSamqc1dFzu+36i1Icc73LXvKxyjyrfUnYpbICrt7SE71xgB6mbNJEkrNkVelC9t4wkNeMEw1TuZuxlo/iO0N3yGA8UcXaVhc4n3INlPqZ9DaARfyBmXakM8xj5rfZZlFRsLb6ypzvxhQu603Wo/pe/zfOvyL46VMeGQKTWwaKUq5Gxys0EWcrkdAeTpYli2GMjgWjlXnzwRZAzhJW2TaqXnZSdn/Ndt8uft+5n6ZC6DaD9yu/EnpFM7ZMZ+BGe6jS09DFK3xT8d5MMakOZrj9wAf3jv8TZs2JS868AkzDMVpNX72tlTjqKXUfgY5YsjTizEj/8m99oAsHOtaaGF7hQqjFcIkqtsXqMP0tF6JZk1OtTcrUVBPXLvTZr4NWiZ7F5AdOhNpgqQX36SySr8Gl1YzZXQkZoMMfZ3bu+3hpWJATOMMmN8WoGjNO9J1DEUEbJm/iIkuxOFPPGb9itDfPvrXtUIorCT1bczmH6exiQTHcsNxAN+Z9Cd4IjSAuJo6hv5aS07nAZ0BpM4Lg790w9ZkhYKvGw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6859c40c-6f9f-45b0-f66a-08de6394ea49
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 02:27:16.9925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVBpaREbGYzh97BQgHY/rEo6iqRHoWhfN16lDFjspBO5aqXPuUpimoLGoduLngT8nrw4uIM3UVFGl5TWcEe5vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9822
X-Proofpoint-ORIG-GUID: SFxwC62BmOxPUf3cnjzQ1IJVBV8o54Di
X-Authority-Analysis: v=2.4 cv=Kp5AGGWN c=1 sm=1 tr=0 ts=6982ae8b cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GyR70ZTCDCH5cJ2aj9UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxNSBTYWx0ZWRfX9VCnzwfdl5Hx
 mbCjJpi48LJMtAAwQYdt/6sQHRZSjaMqAAKpaMOxpEuHEZtVaAYFrPrDpcU/cU+BJl4yWL6jal1
 pAkcYaz0d20SJqNXM+CHxAxpOCJnguDxgbOg/RSl+UjqDne076p0auj1lIfJwFsov5aRsl0WujK
 ccFsCYPge+IHONK+rwufD964o1hcLXMTQ64VrgtVBbOPuCD9e3yI/ohalvg6lMgbzyH6dg2Bmfk
 o+5fyI7Nv0jFs6vbiDVGWDX5yCwQPLrJ8mYOdYrp3zBiJL8rlRbYZ6EU4W0Gg1wvyAusYfa+zHh
 IZZMFRab/0kr2cwHOFUGQd1vxAdeSm1jNJOujAuoJF22E+xlYi4cwlMD+knsB8ghigNrarBV2it
 makKb+JRIbPKF5nkGtCBJzg4rCkUTRsClZxmv28JSZqNtgiiNNYbdYdoa60P94lyxwOLOfCF0f4
 6cwFPu6iTCjWPwjDg5A==
X-Proofpoint-GUID: SFxwC62BmOxPUf3cnjzQ1IJVBV8o54Di
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602040015
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33058-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AE262E0D75
X-Rspamd-Action: no action

T24gVHVlLCBGZWIgMDMsIDIwMjYsIFBlbmcgRmFuIHdyb3RlOg0KPiBPbiBNb24sIEZlYiAwMiwg
MjAyNiBhdCAwNjoyNzo0N1BNICswODAwLCBYdSBZYW5nIHdyb3RlOg0KPiA+Kw0KPiA+KwlyZXMg
PSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAiY29y
ZSIpOw0KPiA+KwlpZiAoIXJlcykNCj4gPisJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVO
T0RFViwgIm1pc3NpbmcgY29yZSBtZW1vcnkgcmVzb3VyY2VcbiIpOw0KPiANCj4gLUVOT0VOVCBz
aG91bGQgYmUgYmV0dGVyLg0KDQpIbS4uLiB0aGF0J3MgZm9yIGZpbGUgb3IgZGlyZWN0b3J5LCBh
bmQgZG9lc24ndCBzZWVtIHRvIGZpdCBoZXJlIHdlbGwuDQoNCkJSLA0KVGhpbmg=

