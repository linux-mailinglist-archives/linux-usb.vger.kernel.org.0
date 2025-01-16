Return-Path: <linux-usb+bounces-19465-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF0AA146AE
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 00:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC03C188D7A7
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 23:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040A4242244;
	Thu, 16 Jan 2025 23:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EiRDZQEG";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZorI+YWb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RD5TcZ6N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CED71547FE;
	Thu, 16 Jan 2025 23:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737070796; cv=fail; b=hJzg44j+Alv2sYiQ2nDa+VT1Yni465ok8hM1GueWyeRzb3FxEmgpZSnAMP2Y/LxW+o9wPrU4Eg/Pu6x5r7+uqovCHgZqCb06Sarko6A56m0fdydmg38cHYGxwwQQYsSNSIDXc0fznnajyTt+Ld1X1UMND91m/GXkcleZRPmCUr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737070796; c=relaxed/simple;
	bh=zmwFKSQE/2lW2TSpZik8JzYCH5uFKvPvHKO/btv1GzI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qkWWhYmlFitUi2BTGiRs9dty+SUVmZYqCCgSa61A2SD+CTiDFseYxxKMO0CIh1C9sL7WfwP1M87/+pDX8cJCbeHIIILdQrTw8lEo2bcBSVKzpkzgS6vZTj/qPWFPQyVH8nc+mrQ4ie/T7LLbZ8Z15ErF1mOETnhKDQXfZHihLNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EiRDZQEG; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZorI+YWb; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RD5TcZ6N reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GKsrQd014357;
	Thu, 16 Jan 2025 15:39:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=zmwFKSQE/2lW2TSpZik8JzYCH5uFKvPvHKO/btv1GzI=; b=
	EiRDZQEG9ZqGlf58BGUAMKmjV00DyoNfm4na9yZOspBmpYS9Hm1U7WJ3vz7oiFzi
	RfvN4B6iTx1q/1v01ehXSZMH6Dnibbxtk4xzAId56sm+LbmkmMDpasqaL24T+vZA
	k+4FfjAcaiSoI6a8NoNlLjEkSO6OdSDImq5zs1a+t3nrxfSb1ZaZYp8Tneia02q0
	Yl92S4F1m5dc/TPPhT1mzbcpa6gi/r9OKaHDz9Ljf88GGD6l6ETCTOzmMd5JaDR3
	zxe4n0PxbjRcAPieDU5+CsGCetAu7dDuj3eV4udUiseo4p6qEIpALsyPaP9huJQI
	la00Zl3VrYw+UhA6bDOs/g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 446y3evbtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 15:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1737070787; bh=zmwFKSQE/2lW2TSpZik8JzYCH5uFKvPvHKO/btv1GzI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ZorI+YWbVXAODIHToOdRNmYqqYdRM5S8jjM6fa3i0SQRIpZ2YNwk9ABDuyZU89OXL
	 /Roxt8CY7vy2Prncp4ml8HLi6b4pXQ9c2yLXgaij3FxVXOTw7k5ZGk/yMkSMJXtpEP
	 I07rZsSZaZvUDKuvoOwDTbl9QhdS/70RffqYsENjxzIXS8L+hwlKd8xyGiHBmu5z0M
	 ToSE8OEPDfshqgPb7wFV5JQtXcAZYmPvkmvNyrAKmY0k+7IZcpnOUo+FNTm9BkHFLg
	 63TjCPMq7o/6ZEICcLhn6D0IfP5SgEOG6pY4oFy914R+TwrxGN4S98Qw0MQ8MHvUXS
	 urMQoCB3vkYXA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A3E9840515;
	Thu, 16 Jan 2025 23:39:47 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 292B1A0073;
	Thu, 16 Jan 2025 23:39:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=RD5TcZ6N;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2048.outbound.protection.outlook.com [104.47.58.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 244BA40218;
	Thu, 16 Jan 2025 23:39:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMPOJYu6WzfEMHUEP+T8M6taQRGbI/msib7KfLnQFUV3KhN5oCZVBLaRwIPtv5w4moRASaT72MT+iFX42y86FY4RhwTB7blN1mg+4unq2KgyeUKBf4RK6TD6dy6YEPEvDuM9IF798UcAK49f+XFzJ9zGMzQU6cxGNwNXBtRgFCvhXuTZK0GVTgL955B7JrjyoL9X+OAzn9sZce1RozERFeDzrP0eTeqIODCJvDwa4s66R/LXWG4sVkoP3rfrB/xArsH6W8q9bZmHxzGeoVdnV5W53o1Prnb/tJ/gmFCBNRI2/SOGo/QMnC4wG750neNlTWOmU0pCNk3UyOLBoaSuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmwFKSQE/2lW2TSpZik8JzYCH5uFKvPvHKO/btv1GzI=;
 b=Ia9P/eqqhACweyC4ZRSiAyD98ypuaGqoQ0BC1e2ZKbzYffQy+vCm3cFYlgfqcreonXocw1PvXASgunEAwLVMJj+Zi1lnKRXnanSOpFHHfSU9nfoygZAfJhNcTdNca/HxLad8b3zUiAvOQL46VCvdtLRh+XW76hNjVG2JmMc/TbGZkYrkArVO+5RzFQuEf3pCsUPrlmfTOcnKJHF6KL8h3etyhTotJ5ISZ6sMaBW8Qt1whjIwWlyeVOM84TdnOOIWg5vAnLtoemygS/SHDL9qxgCssBFzIHrBlQNUxgyvtCNbJCRMyGhJzsIKLRO/xSM3jESxbxSO08GNsgQoI3yy2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zmwFKSQE/2lW2TSpZik8JzYCH5uFKvPvHKO/btv1GzI=;
 b=RD5TcZ6N7PDsZS0zy+ZU4vjgMfCvOnlDL66du980ISbe2xXTN3Wnm9x8M+GZVdwmumfKum8jBnvii1qC7kwOXjA3nzwhQnh7xmRhqMiTn/rP7U3wDdJT4eRobdCEPtdGs8qiieeRoLFTs9v4bGSaT/RNHfVQgggMjhbF1qdcLL4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7513.namprd12.prod.outlook.com (2603:10b6:930:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 23:39:43 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8335.017; Thu, 16 Jan 2025
 23:39:42 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
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
Thread-Index: AQHbaC0e4vvQDZrPEUCV4IbmsnNVa7MaD3SA
Date: Thu, 16 Jan 2025 23:39:42 +0000
Message-ID: <20250116233937.s7mv5mu4tfuaexy2@synopsys.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250116154117.148915-4-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7513:EE_
x-ms-office365-filtering-correlation-id: b14186b9-243c-42f3-c0fa-08dd36870ce9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SVkyUGIrakUraVdrckVYbkpPeS9YY2ROL3k0bWN6Y3FnVXg2emMvMkxmQUI1?=
 =?utf-8?B?WGNjNlV2Mkk1bXNoTXczMDRRT1hzMmJFT29oQVczRFZCempwK0dmT0RoUkEx?=
 =?utf-8?B?Q1RzVXVBMS9INmNRdjlQZFBqcmkzTG1nTWUvbzVnRUdzNEZ3NHNHcUl3OWtL?=
 =?utf-8?B?VzRMRnQwRkNaSWZxRElNTVJpRVh3ZUs1dDlzSVRFZTF2VkpLYUYwSzFBaDJz?=
 =?utf-8?B?WGNYKzlFU05YTTNNTkdSMTloaUw2T0tpNXl3QXFMK2RSM08rUHlUa3BZUVVv?=
 =?utf-8?B?SGlXSE1PNHc3MFl5cW1zNjZxZmptSGd5MFp2ZzJzNkFBYkc4Qk0yd2RJNk1R?=
 =?utf-8?B?TXVFUmZ0QlRiNXdTc2V1RFQvdGFPQmxRcXMrY3dJNWdMaXVDRXZ6c3pONlNH?=
 =?utf-8?B?ZzZObkFqZmxQbTdLaHROSmVQbkFZeUxLdEpaVnZ1d2lMQXhWZGdQV1lLaWg0?=
 =?utf-8?B?dnVBR1hXbE5USzNjUmkrV25rMm1xK3RGOFBHMElPNC83Nm9hSnFKdzdxRGNm?=
 =?utf-8?B?a09Tdi95aVBXdHJVUnNFQlFnSXpYUElJQ3cweWx6WlY0QUFLKzkvQmY1Z0ty?=
 =?utf-8?B?RlVRdDVPdG5Dem8yWGxLbkt6NnIwdEdzMHhDM3IzQmVFYzdzWTdhcWxOMnNV?=
 =?utf-8?B?bm04eU04NDdUc3pGbTRPeFRqc1E1bFc4ZUh6anlVMHFkM2RYRlJ3VVhKbEps?=
 =?utf-8?B?T0NJdTlBbFk1UGdvZEhxMVBxODRYTTRKUUZWY3YrRXkwdjdnRTQrMFhkTGhZ?=
 =?utf-8?B?TlZYVmowNkczSVJmajdaR0RxZlJNck1EeFVSbE50azJpWHk1VDBYYVJ1YWR4?=
 =?utf-8?B?YUN4bGltTjQralNpQW5RYU9zYmUzdmgyMlljcndQb0pZV0huTHg3bElMejRn?=
 =?utf-8?B?ZEhkRUUvNFNlaFFmWm9wdnZXaE5UamY4L2JERlJmbUswdGE5ZEFBcWk4Tm9l?=
 =?utf-8?B?aW80clV0OFoybWtocjRGN0lxenNJVGVBbytXQlhuUFY0RmdTU29EOXBKWXhk?=
 =?utf-8?B?RFZ3MFdUU0V4Y1oxZG5XYjBYZW4yMW5pcXNkWnZsZlMxc2xHa2NLT0Z6Yi9l?=
 =?utf-8?B?MXovSHRjc2hsTXRPc1Y2UmhTWUJFOEsvRzRVSHltczRUMG9HM1BwWURIajlC?=
 =?utf-8?B?Q1drcTB6UHJHRGRzeFRBbkh6bDlGWWFMZk85ZHRTWkQxem9aN1BBYTROdDg3?=
 =?utf-8?B?c05jRHpkeE16SjlBY3FGZFRvazh5RzZUZitFNklHV1J2SGtEUDU0V1QxM01W?=
 =?utf-8?B?eFBpdjUxMjM4YlpqK0FpVWxwekl0dStjUnJJc2RaZ0gxaDd6S2VvYUxvRThx?=
 =?utf-8?B?czRtU3Z0RnU0RWowT1BVeitqWEFJR3d3WEUzbllVOUNqdzZ4cElGVkRUYWhk?=
 =?utf-8?B?UmlQMi9YY3VwVy9pOUpWdzdnYktZeFhGcFJGaUp4VGl0aVNtNGpwaWpINDF6?=
 =?utf-8?B?a041TlZHRnF5em1UbEh2cElSZmRjTlhuMkE3VnhUUDNuZmd0M2JMUTJEOUdp?=
 =?utf-8?B?OTdzMEtOYWJmdVlBQ0duYmtjWUVtcnk1czY4aUxCT0JUVlhlTW1YcEJvNDhn?=
 =?utf-8?B?MkNvZDliWmVJRTBGSFZ4R0FKS1oxZ01PSmM1TUc5Qml1akRCazdBOHdzajlY?=
 =?utf-8?B?amRYOWU4ZGlYeVVFQXdyQXAyZWVPcXJDaDlISkp1Y3F5bzVLVWxGYi9JY3ho?=
 =?utf-8?B?aFU5TzdpVDhZZzVGNVFEeEE1WlRiSlNGRjhnMjVqU0E0WFUyOWUxakU1Q0Vr?=
 =?utf-8?B?WXhwdmxIYjhocXk1dU9tM0FGR2Yya1JBWkNOQ2JLbUJ0bkFSZmc0R2ZZdHN3?=
 =?utf-8?B?Z0tpaUR1VDYrVXhZMjRJbmhVMFR6cnhJdHdWSEZ4V3NwZStPc21MSnFGVzhD?=
 =?utf-8?B?VUYrc0RQR2pEc3diVkxxT0M0QjNOc0xJMzZZdUYzRFNqWUZneEZwSmdvd1Iw?=
 =?utf-8?Q?xWIMd+bb5qj9DCdfmUj5H+R0fD1DzdFO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MVNzTkVjM2JLbndiVlFoeVMxNjNuRXRmM2lXRVJxYzVxQVZKbmRPN1ZFMDlo?=
 =?utf-8?B?dEFXbjNZelh4TUEyNEhkZEpyT1JQUHBheXJWZ05zNFdWNGN0WWtHaVVrTTJW?=
 =?utf-8?B?MWJQRFZETUYvcTNpNTBDVWJLeXdSUU41SnVJdk9GcmQ1K3RxZUxSN2EvRjVR?=
 =?utf-8?B?SjZRYzd6aWwybEQvdHlveCswS3dNcUswTldCMVJTcHVBSnpBQ3hTOGlWSEkv?=
 =?utf-8?B?Yk5rTCtnMGxBSldqSStvcmd6SGJ1NE80T0FPbnhraXAxRzBsZHpIeHF6eE5y?=
 =?utf-8?B?aW1hVkJ2bUszdEN5dy9KYjk2aEt1M0FZRTViL3QrTEg5N1VtbzJQeTFodEVF?=
 =?utf-8?B?OHBnVFQ2Z2JJWTJhK1FnaGNUYnNrRUVQSXByVnZIQ08zaVBWTUYzamh2d1By?=
 =?utf-8?B?SHlENmJ4NzhlcEhvelU1OE91ajNCNmp6RWpPRitLTWphTURKMmRHa0FlbWVM?=
 =?utf-8?B?RWNOTGF2cmhNOE50bFhRTWN5TzNkT2xQTUpOUDgwNkluWWtEYWVXeVYvYnla?=
 =?utf-8?B?QUtKL0lUTExnamFIRjRUcGtsMDhBYWhZdGh1dmFYeHQ4V1NkK1RoS2pkRkkz?=
 =?utf-8?B?WGlIL0RKbEw5VlJpLytock45ZVJtcHo1NlkzN3gzTmVkVkt1QlNWSUREQjVF?=
 =?utf-8?B?b0N1MU56OXZWREliSVRCNzR6OTBTc3prdFhZMHRETzlGZmZEZU9VZDhjeGlC?=
 =?utf-8?B?a29EU2tMUlpPclZJZHpqVHZiOUVoUGU5TEpEc0RpMUlWdE9QNEZoT3dlTE54?=
 =?utf-8?B?RVljR2h6QSt2T3ZCd21IVEgzSzJDS1ZnMksvZ3pIbFJmbUdjTHZoaUM0TjBL?=
 =?utf-8?B?YjQ5WUxVOTdzNGxSalVCemErMEZkVGhpTThqWVJYbC8xTXlOU3V5RkpBanhZ?=
 =?utf-8?B?TUdnZitEVDhOUkpyMDZoMDV1U0htbjY2MFRpWHkvTVF6MnJWNzIyTVR2RnFU?=
 =?utf-8?B?bzcrd05iU2hNQ0xteTljaGZqdHkzb2VHNU5LQVJ1eW5YQWdQQTNwMjdUdDln?=
 =?utf-8?B?Y2xQOU51VVUxMlVlTUd3aW4wSXBGWlBIbm8rZjNLRzRqM2w5Tml5c0pDSDZy?=
 =?utf-8?B?MnhUeEhrdWFvdVRjM1kzT05mRFkvTDF2YUQ2Z2M1aTVtSkRzOGZSQXRpNWo4?=
 =?utf-8?B?ODB6Ykg4S1hkc0haa0Rqc3dHVGZCRGdFb282WU40blcvaGwwRHBkOGFXUUI5?=
 =?utf-8?B?d3V0SVY3UW5lVzcxQ0YxQ0VteGwvNDE3ZUlVempvbW5PZENZUC82M2pEbzJY?=
 =?utf-8?B?U0FOL05VZElCOTh0NHdQTXhmTzhabG1adVkwVlRZa0EwUlJFVWtzcjJLUUR0?=
 =?utf-8?B?YWxma09pUjdNL1d1RXBRdVluc3YrcEN6SUgvZ0c5VEhiNURJRFNodEFCOGxl?=
 =?utf-8?B?OU9tSzRvSXdudnlwa2NUZUFubHRVV1VYbFN6dDJkcGIxR1VwL2JMVDM0Mlp0?=
 =?utf-8?B?WjArbUw0Y001cStLb0FQRlMrOEpHUWtNM09GTU9jZEx4NWlTTU96L1lMMWdr?=
 =?utf-8?B?TlBPQ2lIL09MMlJUWGVUK3h5cXd4dm1lamlvQmRhQXZEUm9FWlpPYWxTMkJJ?=
 =?utf-8?B?SHZ1RGJTdDFQbnRLdjJtY3hGVlFKWTdhWmN2dVF6ZHJKc1czSUd1ejQ3UlNP?=
 =?utf-8?B?SGdpaHFxNW1zQXYrVktSOUVvNWxRKytrdzRMcnB5WnA0M1hsYVgrcjd4SEJi?=
 =?utf-8?B?L2ExdzJKcVlSTzk5TzM2dHNZWHhHNDZaaTV0QVgyUnU3aWcrL3lXbUh3ZzlN?=
 =?utf-8?B?T0plSGt2N3VRT3RpSmt6bWJDR0RtaGlPSUpBaXYvSFlPRmw2Ny9hZkc2VUdz?=
 =?utf-8?B?d3RIZEE2dndCdW1wSU5LeC91NXF5TFhBVmxFMWlqdytKVFpHZGQ2SjZtRS9I?=
 =?utf-8?B?ejI4V042d0lVOU45UXZ1ZUxwc3NmMjU1akp1RStRVHFmM05oNmVyMk5mbUhq?=
 =?utf-8?B?MnZaMUp5Z0g3emN5Y0YrcGZNQTNyZEwxUExkaUFqQ1IrMGYzaUtPbHlObi93?=
 =?utf-8?B?VitpL0VjSytkZWJwTXJyK3BCZGNsMHcwN2Y5bTQ5c0VGVy9iMzh4NERVWjlk?=
 =?utf-8?B?bkdkdE1VMzlLQk04K1hCb1FLeHozWnI5bThBSUNKSU16SHBvaWNBZkVhSHdr?=
 =?utf-8?Q?53Rl/uiww0h66hGTROvzCp9dE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB07A9313CC8744D9313F15A11BE2E94@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j71zox1NLAe/RF8phaLGSF4O+b/d1xcTlfPPn/Xh/1aZm0nFU9RkJwztXNBtsCIyt7AXxpYkVFW0gIdiD1V8IJbbcPT9476OXu87oWYAjXVfyFluOaIy0JARpgzvFigmRm6JGpDbK5mhTcopmbvqiNFwphWOP9azYCGasn5soAMd4ZW9T8Lf+X8o/nvVqN8nnVuYfHqYQEoV6a0is+8lmBLE6SMrGzhkFiwXW8qfhUSXSO9PZAbk3rjKyr0NC8mIN7xD8myMYsmmAcRWHpooh5rs3hsYUb9L/DMMVvPKL3SW0eVOWn93Y9DmaHsR78SFSwIXr06jDC+Zs9mLsFh+AcKUF67QHWWL9+pihwE+lE6dNVeUjtufzL43ciVEqJ9VMg9RM/Qynh93lWa8Z3LHdJbHDhHtnf37biYFh8la6vHH4U18nAuQLbfxWNwdmL1V/Hqhp3lgdTuHOUKIZ4RORI/1N+u02XEE/tS0xa/4dC920nh5jaq/B0BCrVZMOcMpvno9eKhMoPtqEU61fd3xwba/VJfIlZSlvcOytRIA2g9OyMMyu7Uvqzpx74GzaFoNfXqOR2ri4RRrcMeDmxiqqUELmTjPc9B+kCrC/kO5PNSRUAN7MKAVOMIqIbgpxOsmQTWpbQsN29YbyPM3njYFqA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b14186b9-243c-42f3-c0fa-08dd36870ce9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 23:39:42.1318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fuErW6ozYHqxdLIuw2D1XIIMEYAboBUZO35WXtcAHcRUNFl6j/X8pjAgRt/VN0ZBQWMdFmTYoK+Bnp+qhBwfDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7513
X-Proofpoint-GUID: Qgd8fs2GKYcJnL-SfxDbnsi6lYoCrU4Y
X-Authority-Analysis: v=2.4 cv=AL8pzSHq c=1 sm=1 tr=0 ts=678998c4 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=QyXUC8HyAAAA:8 a=sNu-itMjzjw8VARcfl0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Qgd8fs2GKYcJnL-SfxDbnsi6lYoCrU4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501160175

T24gVGh1LCBKYW4gMTYsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gSW50ZWwgTWVy
cmlmaWVsZCBTb0MgdXNlcyB0aGVzZSBlbmRwb2ludHMgZm9yIHRyYWNpbmcgYW5kIHRoZXkgc2hv
dWxkbid0DQo+IGJlIHVzZWQgZm9yIG5vcm1hbCB0cmFuc2ZlcnMsIHdlIG5lZWQgdG8gc2tpcCB0
aGVtLg0KPiANCj4g4oCiIDEgSGlnaCBCVyBCdWxrIElOIChJTiMxKSAoUlRJVCkNCj4g4oCiIDEg
MUtCIEJXIEJ1bGsgSU4gKElOIzgpICsgMSAxS0IgQlcgQnVsayBPVVQgKFJ1biBDb250cm9sKSAo
T1VUIzgpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2
Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMt
cGNpLmMgfCA5ICsrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1wY2kuYyBiL2RyaXZlcnMv
dXNiL2R3YzMvZHdjMy1wY2kuYw0KPiBpbmRleCAwNTI4NTJmODAxNDYuLjliNzNkZmQzNDgyMyAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXBjaS5jDQo+ICsrKyBiL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy1wY2kuYw0KPiBAQCAtMTQ4LDExICsxNDgsMjAgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBwcm9wZXJ0eV9lbnRyeSBkd2MzX3BjaV9pbnRlbF9ieXRfcHJvcGVydGllc1td
ID0gew0KPiAgCXt9DQo+ICB9Ow0KPiAgDQo+ICsvKg0KPiArICogSW50ZWwgTWVycmlmaWVsZCB1
c2VzIHRoZXNlIGVuZHBvaW50cyBmb3IgdHJhY2luZyBhbmQgdGhleSBzaG91bGRuJ3QgYmUgdXNl
ZA0KPiArICogZm9yIG5vcm1hbCB0cmFuc2ZlcnMsIHdlIG5lZWQgdG8gc2tpcCB0aGVtLg0KPiAr
ICog4oCiIDEgSGlnaCBCVyBCdWxrIElOIChJTiMxKSAoUlRJVCkNCj4gKyAqIOKAoiAxIDFLQiBC
VyBCdWxrIElOIChJTiM4KSArIDEgMUtCIEJXIEJ1bGsgT1VUIChSdW4gQ29udHJvbCkgKE9VVCM4
KQ0KDQpQbGVhc2UgdXNlIHJlZ3VsYXIgYnVsbGV0IGNoYXJhY3RlciBhbmQgbGlzdCB0aGUgZW5k
cG9pbnQgcGVyIGxpbmUuDQoNCkJSLA0KVGhpbmgNCg0KPiArICovDQo+ICtzdGF0aWMgY29uc3Qg
dTggZHdjM19wY2lfbXJmbGRfcmVzZXJ2ZWRfZW5kcG9pbnRzW10gPSB7IDMsIDE2LCAxNyB9Ow0K
PiArDQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHByb3BlcnR5X2VudHJ5IGR3YzNfcGNpX21yZmxk
X3Byb3BlcnRpZXNbXSA9IHsNCj4gIAlQUk9QRVJUWV9FTlRSWV9TVFJJTkcoImRyX21vZGUiLCAi
b3RnIiksDQo+ICAJUFJPUEVSVFlfRU5UUllfU1RSSU5HKCJsaW51eCxleHRjb24tbmFtZSIsICJt
cmZsZF9iY292ZV9wd3JzcmMiKSwNCj4gIAlQUk9QRVJUWV9FTlRSWV9CT09MKCJzbnBzLGRpc191
M19zdXNwaHlfcXVpcmsiKSwNCj4gIAlQUk9QRVJUWV9FTlRSWV9CT09MKCJzbnBzLGRpc191Ml9z
dXNwaHlfcXVpcmsiKSwNCj4gKwlQUk9QRVJUWV9FTlRSWV9VOF9BUlJBWSgic25wcyxyZXNlcnZl
ZC1lbmRwb2ludHMiLCBkd2MzX3BjaV9tcmZsZF9yZXNlcnZlZF9lbmRwb2ludHMpLA0KPiAgCVBS
T1BFUlRZX0VOVFJZX0JPT0woInNucHMsdXNiMi1nYWRnZXQtbHBtLWRpc2FibGUiKSwNCj4gIAlQ
Uk9QRVJUWV9FTlRSWV9CT09MKCJsaW51eCxzeXNkZXZfaXNfcGFyZW50IiksDQo+ICAJe30NCj4g
LS0gDQo+IDIuNDMuMC5yYzEuMTMzNi5nMzZiNTI1NWEwM2FjDQo+IA==

