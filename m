Return-Path: <linux-usb+bounces-32092-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4E9D06B86
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 02:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 00F98300E8F6
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 01:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BC42248B0;
	Fri,  9 Jan 2026 01:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tBBLZ0PB";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bPNm9VOu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BIoz2rgq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED7418A6DB;
	Fri,  9 Jan 2026 01:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767921519; cv=fail; b=SRQLC8XQwnbT7Ks7YN8evxUldwcUpzOpY80tRL2izb4eJiiAAeY7Ajoe5GkSEwY/ra6p6stCObTghIvMKUSU1iMr4XMXlff3DAyyC4Da5Kt2GyQ78s4qEsvyAdSD0wkVchMvFZ8uUtpD42hbDoVKhHt28KMMT7QJxt8XzNRd/BE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767921519; c=relaxed/simple;
	bh=3VbYsCUbH+r4IQon7y4IgighCiUU6UqQVythgytaeH4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a8bDpk9jabiJb+T/lWMAN1Q2IVZ2m2ldZ9Mp3BvN7KoxoVJpD645tM9jJJ67XYPyMET89jQQaZdKzD+Q1ecY7DXe+POcSRmGsFRbqgcetKFALHlc3CoRwNU1kRc6Le9/2VtHZF6Y6o/HW23ee/wDbsbzraYUdS7Vrk3ifnasxLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tBBLZ0PB; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bPNm9VOu; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BIoz2rgq reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MhYnI3546763;
	Thu, 8 Jan 2026 17:18:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=3VbYsCUbH+r4IQon7y4IgighCiUU6UqQVythgytaeH4=; b=
	tBBLZ0PBh5zCkmVi+ZEzHkPt2grD+WrBzGe7WAW2nuzyLJskwv9yX4Pil6JnWF3p
	iDGl76VDLxVIeny5PO6eNcgzklui1ACXWnEMsbVq28eQgrP58AqLm/fFDTXAeP48
	EOp+OOYUW8Kow5c2kg5p1XBX5K/LJ6DnZbr9g4XJGNmGXKDqQMkCq0unlZspzRmg
	f34bmdY0sCYwop8TF13lPL+yf/0VUDNRJW2kZ67VFVYA3vpoIE9W49asB93C0hhR
	gfDWxtGCd3TYDG5ouUsaLt2e+5fbR+B0NfBSHzJes0J119K4YQw1aAmwvIO0JDj7
	hhfKQzXVnZIGZ3FuSgjtWQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bjng2gxb4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 17:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1767921510; bh=3VbYsCUbH+r4IQon7y4IgighCiUU6UqQVythgytaeH4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bPNm9VOusXtg6FMug/x7Kp3FKK2olk8Qyxzpys5nneH62RxMgsew2wjXjskRgcTjp
	 H5Qops+VgoznRoXIoIV5Q3uAwRXJtN8ChlQ/iyKTMnWM8Ktm0lKeLbbuwPrxRLzuL+
	 RvCjkSBWX5xJVCvvymrwW9jhx0/Oe62UbZeqFlAY6q0WL+GawDvBQdcPjUO84Qx6ZZ
	 edDHAmlLprHInMwAc6wk3CsBx/xWRJFDffh6sosR/y21d9fwtCd/zKNGfMRJVuj1B6
	 SQp5WlMeFFkBKzx2LB58LYBOgtdqX7Y9aqvWkAIAxjhvZFF1tIspO1a97pu7oYOH3p
	 kNDqCPufP6XOw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5AFE540769;
	Fri,  9 Jan 2026 01:18:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 867C5A0070;
	Fri,  9 Jan 2026 01:18:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=BIoz2rgq;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00103.outbound.protection.outlook.com [40.93.6.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D2CA34035E;
	Fri,  9 Jan 2026 01:18:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNc9ZTHxhRZ6dRud5KISefjdQrcu4NUNE4FHUMtlIcn8nrm2sQEBCWFhkn4PnQY8jP9VMjQeivMDOPHPzB3PHcvVOab7eaSAnxtFCqpNVIJIh9NThtQmmVbwi8Ma9SCpPKb5bsjnkKpIC8MDb8aN9QfEn8inrRnwVwPoQjME9Ud8MtM3aaoJ8Pr2nwWvOpi7HcrUH8R7cm0oGo3i1WtDYkSGLRnNvqN9UUv26j0Q6WPrKUKSD9pgVQz6OOpPZ+7Nt16zi8UW++CWsRnJNWYQyBGxOBCEtNnMYgFyDJGo5wvGoGdO27z+1peJ4+SlwvZIre2RbosuyDrxUO51LeGUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VbYsCUbH+r4IQon7y4IgighCiUU6UqQVythgytaeH4=;
 b=vzqh5tPVcgjhG+0qadck9xHaHie8uNSBYS1cuI/z+Qxjo8GdU+PFxYhpdk3vLKLTIwLaAVvyPKjOYCyZPwOcNkSr2JuB7HH0UyFeXSCH8PjCAfWfa3cOxxt2uJIXdQHLY63UyCVPInadAJBYirrFps32Bcr7aAzXcTLe0uDss4h0R/mAjy7N7g/YliOb1h7PPEIR/OBjWfODig5jDESjpIzZo0CQMSgaOT9GDPRnz7RcUQkDK7VNiUejyV90pcwQ68q+Hk+CXotAJRSoOh/G9c94rnuR3bNjv6zWgJwOX3KuGUnThwTLGbsQ3VR+CMQNK/K0iyMYSEcJmin5dUr2BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VbYsCUbH+r4IQon7y4IgighCiUU6UqQVythgytaeH4=;
 b=BIoz2rgq/h/2NR/yeAP/Nzmw+HDOU/taRkTyLelT8RyQtC1DsWxMcMmD6Kt43DC+3KnXC9vqPqeniD12kja2NbRJKg247G0wcZ9Af0UkDaWDbvhIHd/HRq1a9VxewGOPkXOZ7vHODFlC0TYYIsxAUMAxVG9d6x+4eTvwua5OBSM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB8648.namprd12.prod.outlook.com (2603:10b6:208:486::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 01:18:25 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 01:18:25 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] usb: dwc3: Log dwc3 instance name in traces
Thread-Topic: [PATCH v2 3/3] usb: dwc3: Log dwc3 instance name in traces
Thread-Index: AQHcfjoF3oQQJwiJPEG0JsI/TTOU0rVJDzKA
Date: Fri, 9 Jan 2026 01:18:24 +0000
Message-ID: <20260109011813.6uxqrqzcf54y75xo@synopsys.com>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <20260105115325.1765176-4-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20260105115325.1765176-4-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB8648:EE_
x-ms-office365-filtering-correlation-id: 8fbce49a-8e43-4d5f-a43b-08de4f1cfc9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aDJqWVNXelIxOTkzVHM5cURXdTAwdG1mcHlkZzhrOWY5ZVF0UDNUOFd2cnlP?=
 =?utf-8?B?SXpxWkZKRm5KaEpnT1VCTVlJaDhqSkh1VmFDUTJMd0c1UWRUUEpDNXg3NDZr?=
 =?utf-8?B?M2ZMWEl2K2RscnVyeExTZFVWVTBUQUZiMGtITWJwY0tRbjZlajNSRUwrNHJE?=
 =?utf-8?B?ajRuTmZqTHhpT0hRWjJwbU1ZT0xNTTZuckl5alBtSktUQm9vekdIUE01QlJQ?=
 =?utf-8?B?YnJqazRCZExPTDZKWjMzcWdzLy91N1lUb3BocXR0R0ZWK2tFcEJqTE8zZDdK?=
 =?utf-8?B?MGNwTDNKZk9ocWYwWEpHTzV6UEp2RFhFQUdRMHAwWG4zWFlGV21EQzlXd1hk?=
 =?utf-8?B?M3hFUmFxdzFISURBTGRkRHVXeFRJVzA0WEZWUnh5djVoS0NKR24wV3N6Yyts?=
 =?utf-8?B?N21oeW1tOHNSZnEyZnFRbktwMWd6VmpiWWN6QmhqMXM3L05XOUcvdG1MbG91?=
 =?utf-8?B?THFyUlF1VVk1Z2dkemY2NHEzbFZWeEFVZDFoSE4ybmNBd1psRmRVVzA0dEJS?=
 =?utf-8?B?UFNVZFBBV3pia28xY3JhZU5UMjZ4cEZsYzVMUElYMUZjVlNNNzcxZit3M21B?=
 =?utf-8?B?SnFaa3Q4V04rUEpVK1Q1alhHS09MbDVrZnkwQk1ldWppTHhubmFzOHIxSTQv?=
 =?utf-8?B?SUVzV2NqRkFldWFsS1JoNWlXdzVFakthOW1VQXRTQ3hzb2lLeWxIZ3NSRGxF?=
 =?utf-8?B?UkFlaGkyckpLYmNBYkV1aDZmTmtKYllYOFRiazRGcXl5bldTSGxIWmxkM2pu?=
 =?utf-8?B?cUZud3dRSE9QZ0o5VGd6UXZ1M0s1RHFocVJLQnRWcXFuUndxR1dqSlFNWDl6?=
 =?utf-8?B?ZTdOU04zaVZaMGZnRUNpS3dPN0U5QnlQVm5La2lEUTNnWk5wdTBUNitnTklM?=
 =?utf-8?B?WjU0enpRd1ZJZDl2cHdRZU9nazhOcklLeDk0UWwyL0J4enhscHE4TlFKK2tp?=
 =?utf-8?B?Yy9POS8vL0NkNEdvSmhVekFVWlI3eWZ2bmk5emRYSVVqK0VOUXhyQUdZb1RF?=
 =?utf-8?B?R3pNMytZbU1wQWNaRWt0cWxPdHVpR0U5SkpOczdmc01md215RDhOc0RFWTZa?=
 =?utf-8?B?ayszdHFLbDRGL1JhNzROZGhpWGNZTFpIc2pRMHhoYWJPZU55M05Pd1JkaGZL?=
 =?utf-8?B?TE9ZQlBpbmlSTG5FcWYweFo3Wi9WeGR3UTdLdkVaMjVSa3BSMEZGUWtNQ0M0?=
 =?utf-8?B?UzRaMWlzckFJeUlzQk1KVWwxdXI3YW9QZGwwVXhQOUFiWEdZQXpqRmxTd0lH?=
 =?utf-8?B?QVYvRFp6dE1FWlVXbGZXWUtaRG4xR09GSnVzMHIwWndmYWlvUmdDdUdldndn?=
 =?utf-8?B?SldKYWRqOUNkMXhKSFVhVXJZSnhHNXU0d0lwajVtMm51MGFac0RFNDVTYW5D?=
 =?utf-8?B?MUsrcDNZMURlbFZadklMQU9PZDZ4RUI5OHFPams0NDV1T09vbUhJdzZQSm5o?=
 =?utf-8?B?bzBLdURDOU9rZm0rN1RpK3dMZ0NuRW1BRW9CVTM3SFNKRnlFY3lLZ3dvbnV5?=
 =?utf-8?B?Vit1M3hBOWNXbFB3V3lqUC9pdGVJblVRSFg5azI4UEl3dU1wdVVxTVpzbldX?=
 =?utf-8?B?TjhYRjVSRlNzUHVTMFEwWEcremFTcTBHOUthbDhndmJOQkVQRkN2Sjd6eWZX?=
 =?utf-8?B?OW52WXRJZDZmRGNZR0liM3JVY21OcUpOajc4T1U2VDdmajdOZTdLZGNuV1N0?=
 =?utf-8?B?NzY4RjM4dytOWnJvOEdSU012eUQ3dzNVOCt1YUZmSWdhRFpPazBYaXFCMkVv?=
 =?utf-8?B?cG0rZkN0SWx4ZWZMY3ROUmRaemZTZXZkY2VaTXplTGpYeS83QkxYd0kwRnRI?=
 =?utf-8?B?MDlLV1hWVDFOR0xURGJCcVovNDRlVUVQOHdQYjAyaDJyd0JhMTI3aFhVRnhL?=
 =?utf-8?B?ZmY2RzhXV21tR2NBc0FzMlpnME9wVk5xRWxwUFJiZ0p5NFhzeTlaczQ2ekJy?=
 =?utf-8?B?RmYzbFZGSEJ0ZUUzYmFVSE5xWlIxM2FYTHB3TktFRjJKUzROUmJia09FOTdP?=
 =?utf-8?B?cm5LQW1icGhibTNBd3lnWElZVTdoZmdSQTJVZzZWby82WDBQYlRxYW5yWTQ4?=
 =?utf-8?Q?fyVGWy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlhkUVp2YUljUUlXS1hkQzNQNzNkZi9oT1BCbytTeE9qV0MwbG4wUENRbWJJ?=
 =?utf-8?B?QlVFRDExMGRCZERwbUY1bnhHS0xxQ2lOQUl1UHpjaEM5djFGdGw0cXl1bDBq?=
 =?utf-8?B?SndSRmcwa25pRkVlbUF3L1JTUUpNUDh2M3U1VTl6MzZxL2tNVmNTczFmT1Yz?=
 =?utf-8?B?ZCt2SWxSM1YwTHc5bHZaNTZsbzFrK3B2UU4rU2Y4K2xocVhwcmVSZ0FaL3Fy?=
 =?utf-8?B?YUpoMEdMVUNCWm92RGprbFRlai8wQi8xYnBuZU1UTDd5L1AxcldodU83L0lO?=
 =?utf-8?B?UUY1WHovbGU0Q1lFald4VkkzclFGaDNsTHVnZk9DSUdFemMxVkg2d0swckZo?=
 =?utf-8?B?YTc4Qk5kbGx6TDZkOXR0bHNXVjhjc29wTlNXbmQ2cWEyYWRBRk15NFp3N2lz?=
 =?utf-8?B?bVcrZkxRQkdWY0ZLZDdsTDN5dTd4M2U3YVNZdXdtQ0xQT0dHa2Y2dUFZc2Fy?=
 =?utf-8?B?REJmSm5vbFNheXFNc05NcjhFU2FlK2pBK3hhRkhQMU56TVh2VjBtNk9JeG1F?=
 =?utf-8?B?WWhLaG9NVUdKdC9QcXN1M2xnL1hyRWxJY1gxMjhTTm5zMkhSVXlnVkdYdEZj?=
 =?utf-8?B?MzFHaVpGeWFXbzRta1JqQzhBZGIrMDZDcGhqUzZxVWZtMXhjS3hEbHR6NzJP?=
 =?utf-8?B?RW9sekZNUWtLYjBzd0Zyb1FPbk9TWWRDMm40eEFhWFEvQThBS0lHdllxeWlL?=
 =?utf-8?B?dmJ6ZWU1SUkwOGNrVFNqbnY4R3MyZ3dvY2F4blpFenQyMHB5Z1YrUEFOSVB3?=
 =?utf-8?B?ZWRrd3ZnbmgyZDhnYWlYRUR4blp2eXMvTWMvR3ZoRWRzRnByNkNXVTgxa2J4?=
 =?utf-8?B?TmVNOXI0bWxoSXVVK0JZbWZKL3dOWk5aMUZsb0daYm1qZk9XcFNQc2o2MHlB?=
 =?utf-8?B?eXZ0a00yVTB4QUpsTWdyV1pXL3YwV25WQUJHQWRXdEZaQVNaaDVUcVJYNG5t?=
 =?utf-8?B?K3BhWjRlbDlQaHFwYU80a0s4NUd4cnRwTkowQzFYOVIwcDNSb3NWOFJ4bjd3?=
 =?utf-8?B?d0JEMFRNOUhTbWJCZ2ZiYjY3V0xPc3V2UHR0ZVdJd3JSNnVzZkRJVk5kbnpP?=
 =?utf-8?B?Ykgvb2hhUlQ2WHFMbktsNkZkeVJLQ2tXSWovdGNHNWNXUERCNy9jdzZwMGk5?=
 =?utf-8?B?REVZVzFWcTlPYk9JM0dJNXgyNlNSUC9XUVlEYzBkNms1NnJpS054ODhSczVK?=
 =?utf-8?B?ZmNhNU4yLzNFZ1JhVmFsVXJ3RmhWb2hxUFU2SjRPaEREc0hHTGxhWW16Qyt5?=
 =?utf-8?B?WXNZSmVYK3BlK2ZvT1BKZ3d5VE53aTNxYThyUFhtaE14S2UyZ3lUOG1iUlJv?=
 =?utf-8?B?d280cXM3RTcwQVRkOWQ0U0NKWVR0YjRhdXNTV0wvS3VuR2NmZER2dTdDTno0?=
 =?utf-8?B?MHhUU2ZzVFpLV3ZtMGd2bnNCMkVVSkgwU1grRzRhNGFjS1NCSjRWQUxGbXV3?=
 =?utf-8?B?OWdIVDh0NWg5ZjVabmpGUGJiVzJYeUx1Zm02U3VaV2J5ZlpUengrWUdHMWth?=
 =?utf-8?B?c2hPeFM1bExpeTdmcW55VFgzWWVEcDNTcnBoMWxCdTZ0QXNQVW1mVkc5dUYx?=
 =?utf-8?B?Z3Q0aTlkTjV2QVpaL1V4VVZvOGRSeEtuMi9MeFErcWhKSGlXK0dhSU9WYWdr?=
 =?utf-8?B?SWlDQ1dyMVk0YlBqdGs2TVlkMytXTlBXMXRuOVZpY2hPN1RNZFJ3LzQzaXpL?=
 =?utf-8?B?NWpsWDBYNVhsMHlYU0NnUHN3Y3BzM2V3R291OEZIRmNOSm1FNURNK1JwT1RH?=
 =?utf-8?B?Zk1SVjdmMGFReE1id2ZHbjNWUWh1YTZEZ0o2aW9yb2YxaWdBR3ZROHRhWkNU?=
 =?utf-8?B?c0lmNExOdmp5aGVXd041Nm00QWphbWVZVFhFR2NKLzdpeElhSEFCdi9DUTJK?=
 =?utf-8?B?Wjc0T2hLS1lZTm9UdENPMGc2Vk5VVUtyMDdSa3lMNlNockkvbjdtd0RkY2Ni?=
 =?utf-8?B?eE5KbWVtSC9Ma0tiQ1hITk13OCs5L09PbmlBSndXSGdKSlk0TmlKcWpYa09J?=
 =?utf-8?B?dHZtNCtYWkhRMUZsTnVOeE5hYUxzNzcyYmNWWUhnbHg4NVZSQmZsR2UzRHRO?=
 =?utf-8?B?Vm51dEhUblM3cmVtZ0tzZXd1UUI2dGQ5MnAwNmdab0dFWnZmdmtlVHNoUk1i?=
 =?utf-8?B?Z21leGNBY1lYaVV6Q3k5R0hSbktycnZpWGpuL0VpVzgxTXBEQ3NKZUhFOGdk?=
 =?utf-8?B?SGpWbUdHbnkxeFQxY05YQVVhTDBWZ3ZmNVdsYVdxZ2J0VUhIRWdSY2lEdTRN?=
 =?utf-8?B?ek9TLzhnZE4zK3ZQM3JvdzRkdG1Jd3ZhMmJ4ZFJzcUJuZ0p4UHYzNkdJdjVF?=
 =?utf-8?B?L3pPN0xtZWFHaHYzcGhUYit1amZEQzFnTXlwY3pFREVFeUZ0ZG9hZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <818E22EBC6CD2940A62B6AC2ED9080C1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EAx2p+QeVxSQcF83lBPQUWtLNnKYmsQ2w0UObLNb8mx0jMGp6a7Iy0hYH4xutnMRFZJYUyzlXMTwPsUZu2ez1HSzZzzmu9Po6FbCjZPTwjEXOgKw0lymusay5BWsF37bnW7p7muTdOZLKGQHZZDsKW/NifbvMHVj9TCfxvGzrcgrZeOXTAckvi2RNHMSTXQmOEAp36J4Xv+o0ZcTL7zBaLN/cyTXNQFUbHgGamXTMr+zD6JVCufnZq9YB/2C8mYtbSVZgq6EWYKQkElB56OB7xdhBqfb1c4Jocel55JFdSIL7GXqU0swC3GejYNGG1gvB77loU6SrWpBpop4f8FYAfepXZCfyzYSs4V+cb4ixbWUX1MQaaFih4E3CPuMmtq3I986d0/UwRRzsPV0MaL8AYXqjaj4QuTAh0OAH6vvAfxBxaCasExcg06ef38yCKiaRIlrNrUnZn4koQLCLr5l/xGY8jQ8E5/Ec7tK4DFf/Y1SDaN0WfwiMnDsz9lnjoIPYmNfCyNrgIgY7fIsUSPy1jKp3upDeDwdue9TE3lXRaYzE/vg+lpRa8FlW0JNwx4V1sQgrfRQSV40cuk2RD3vQpy4I2qy3MvrV+JeeCZj0RBTV3ZeCdVaYET00ylcCBj4mX7Spwr2ahRo0Mj7WEa5xw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbce49a-8e43-4d5f-a43b-08de4f1cfc9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 01:18:24.8828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GFRghM/EkijDXLPl1J8HwjINNupR5VisWA8Od+HRW39iY2CqwOecN5Ykf3tXrgmdwni34kCPFf7NQWVSciL+sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8648
X-Authority-Analysis: v=2.4 cv=Sbv6t/Ru c=1 sm=1 tr=0 ts=69605766 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=G9wRnjp-guiPLVj4gAEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ijRajD7hErkEeL2vtN3leteNOiUXdV28
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAwOCBTYWx0ZWRfX4omwLlHW0rsg
 UqnIJTBhivNPuToa03+agFMewlH2VAHlB+AVJJe6xxjlKnsm1MEeiB53nBd+lFNaeV2GwmquYak
 xITE1p+wmgrDevYH+FBfbYWyr4ZCkDS91m2HwL6ZEk8JMoC49rX85rw7MtmaOedh+AiFbApWddp
 em4NncpUeG6Wqk96Tztxv4uFreucvchm24B6GuduyCpm/Ci9V8ci99bILJsR3winhSq5XEimr7w
 y0F1d29WomSAhTbgPN10V1D1HXh1qK7FQNdjuRoz5CRFftwCky6KQBfSKtTWF1dcxveIKMJfN9o
 rZI1qouMsIBESozf7dV+EDJ5lMcc+7y8bJmR7sx4vFf0OWx5ntzsxrnz7Mx5FcZKh1dKWLbpgxT
 KbbWDjfd3zbc/p6hvtQR+CA6HiIfgx/MjLmvTP0exwuSuFTk/sW3s4HLdvnuzFkt2DuD6GKIuy8
 kvOM5u2Hdkk4Fvu/2DA==
X-Proofpoint-ORIG-GUID: ijRajD7hErkEeL2vtN3leteNOiUXdV28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601090008

T24gTW9uLCBKYW4gMDUsIDIwMjYsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBXaGVuIG11bHRpcGxl
IERXQzMgY29udHJvbGxlcnMgYXJlIGJlaW5nIHVzZWQsIHRyYWNlIGV2ZW50cyBmcm9tDQo+IGRp
ZmZlcmVudCBpbnN0YW5jZXMgZ2V0IG1peGVkIHVwIG1ha2luZyBkZWJ1Z2dpbmcgZGlmZmljdWx0
IGFzDQo+IHRoZXJlJ3Mgbm8gd2F5IHRvIGRpc3Rpbmd1aXNoIHdoaWNoIGluc3RhbmNlIGdlbmVy
YXRlZCB0aGUgdHJhY2UuDQo+IA0KPiBBcHBlbmQgdGhlIGJhc2UgYWRkcmVzcyBvZiBkd2MzIGNv
bnRyb2xsZXIgdG8gdHJhY2UgZXZlbnRzLCBzbyB0aGF0DQo+IHRoZSBzb3VyY2UgaW5zdGFuY2Ug
aXMgY2xlYXJseSBpZGVudGlmaWFibGUuDQo+IA0KPiBFeGFtcGxlIHRyYWNlIG91dHB1dCwNCj4g
YmVmb3JlIC0+ICBkd2MzX2V2ZW50OiBldmVudCAoMDAwMDAxMDEpOiBSZXNldCBbVTBdDQo+IGFm
dGVyICAtPiAgZHdjM19ldmVudDogMGE2MDAwMDA6IGV2ZW50ICgwMDAwMDEwMSk6IFJlc2V0IFtV
MF0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFByYXNoYW50aCBLIDxwcmFzaGFudGgua0Bvc3MucXVh
bGNvbW0uY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jICAgfCAgNiArKy0N
Cj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oICAgfCAgMiArDQo+ICBkcml2ZXJzL3VzYi9kd2Mz
L2VwMC5jICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCAgMiArLQ0K
PiAgZHJpdmVycy91c2IvZHdjMy9pby5oICAgICB8ICA0ICstDQo+ICBkcml2ZXJzL3VzYi9kd2Mz
L3RyYWNlLmggIHwgODggKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tDQo+
ICA2IGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdj
My9jb3JlLmMNCj4gaW5kZXggNjcwYTlkNGJmZmYyLi4zYWE4NWY1ZjFjNDcgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jDQo+IEBAIC0xNTgsNyArMTU4LDcgQEAgdm9pZCBkd2MzX3NldF9wcnRjYXAoc3RydWN0IGR3
YzMgKmR3YywgdTMyIG1vZGUsIGJvb2wgaWdub3JlX3N1c3BoeSkNCj4gIAlkd2MzX3dyaXRlbChk
d2MsIERXQzNfR0NUTCwgcmVnKTsNCj4gIA0KPiAgCWR3Yy0+Y3VycmVudF9kcl9yb2xlID0gbW9k
ZTsNCj4gLQl0cmFjZV9kd2MzX3NldF9wcnRjYXAobW9kZSk7DQo+ICsJdHJhY2VfZHdjM19zZXRf
cHJ0Y2FwKGR3YywgbW9kZSk7DQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MX0dQTChkd2MzX3NldF9w
cnRjYXApOw0KPiAgDQo+IEBAIC0yMTkzLDYgKzIxOTMsMTAgQEAgaW50IGR3YzNfY29yZV9wcm9i
ZShjb25zdCBzdHJ1Y3QgZHdjM19wcm9iZV9kYXRhICpkYXRhKQ0KPiAgCWR3Y19yZXMgPSAqcmVz
Ow0KPiAgCWR3Y19yZXMuc3RhcnQgKz0gRFdDM19HTE9CQUxTX1JFR1NfU1RBUlQ7DQo+ICANCj4g
KwkvKiBTdG9yZSB0aGUgcGh5c2ljYWwgYmFzZSBhZGRyZXNzIGZvciBsb2dnaW5nIGluIHRyYWNl
ICovDQo+ICsJc25wcmludGYoZHdjLT5iYXNlX2FkZHIsIHNpemVvZihkd2MtPmJhc2VfYWRkciks
ICIlMDhsbHgiLA0KPiArCQkgKHVuc2lnbmVkIGxvbmcgbG9uZylyZXMtPnN0YXJ0KTsNCj4gKw0K
DQpXaHkgc3RyaW5nPw0KDQo+ICAJaWYgKGRldi0+b2Zfbm9kZSkgew0KPiAgCQlzdHJ1Y3QgZGV2
aWNlX25vZGUgKnBhcmVudCA9IG9mX2dldF9wYXJlbnQoZGV2LT5vZl9ub2RlKTsNCj4gIA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2Nv
cmUuaA0KPiBpbmRleCAyMzE4OGI5MTA1MjguLmMxNmU0NzI3M2VhMCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgN
Cj4gQEAgLTExNzgsNiArMTE3OCw3IEBAIHN0cnVjdCBkd2MzX2dsdWVfb3BzIHsNCj4gICAqIEB3
YWtldXBfcGVuZGluZ19mdW5jczogSW5kaWNhdGVzIHdoZXRoZXIgYW55IGludGVyZmFjZSBoYXMg
cmVxdWVzdGVkIGZvcg0KPiAgICoJCQkgZnVuY3Rpb24gd2FrZXVwIGluIGJpdG1hcCBmb3JtYXQg
d2hlcmUgYml0IHBvc2l0aW9uDQo+ICAgKgkJCSByZXByZXNlbnRzIGludGVyZmFjZV9pZC4NCj4g
KyAqIEBiYXNlX2FkZHI6IFRoZSBIVyBiYXNlIGFkZHJlc3Mgb2YgRFdDMyBjb250cm9sbGVyLg0K
PiAgICovDQo+ICBzdHJ1Y3QgZHdjMyB7DQo+ICAJc3RydWN0IHdvcmtfc3RydWN0CWRyZF93b3Jr
Ow0KPiBAQCAtMTQxMiw2ICsxNDEzLDcgQEAgc3RydWN0IGR3YzMgew0KPiAgCXN0cnVjdCBkZW50
cnkJCSpkZWJ1Z19yb290Ow0KPiAgCXUzMgkJCWdzYnVzY2ZnMF9yZXFpbmZvOw0KPiAgCXUzMgkJ
CXdha2V1cF9wZW5kaW5nX2Z1bmNzOw0KPiArCWNoYXIJCQliYXNlX2FkZHJbOV07DQoNCkNhbiB0
aGlzIGJlIHUzMj8NCg0KQlIsDQpUaGluaA==

