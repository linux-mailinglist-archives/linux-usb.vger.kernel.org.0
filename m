Return-Path: <linux-usb+bounces-31082-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E79C99987
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 00:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A9E9345B44
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 23:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5B628727F;
	Mon,  1 Dec 2025 23:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kptRERcU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kV+tOgOV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F76nRE/x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F9E23B61B
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 23:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764631782; cv=fail; b=Rw8oTAi8xwSEyjBLro0sZiYs9BpY3FXJM7VLUGk3vpK9mZ9ZsFYGqfq2ztNJy/1JHQrFd+R/rMDEm+v5RV4fsb8Upr1cvbN62j6rYmiviTvRsGjoz3DN/XxWAnR16Pfa1vfNbPdy8iAqO4ijDv+ZYTzd76aF/geSB6oDnU1zS/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764631782; c=relaxed/simple;
	bh=Av56yuwrAhHc6ejKICkA9QTy5VmAqypCtX9oSwgUq+Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XK7OyXAEou6OKsd+Q4oE6MuCwCHXVnYkAFfSf/oR08R45DJdJE7Hn/e3qYVQZaYUkFUdgSCa3IjYW1M6B1vyqvyC/TW2NaBWpvH5zElpZk4PLyyxOM1NwnpLW4xl5pEMqwTibxyiov3fHGSbKHqMiWAaXXj2VXCkaeqLZrLrOCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kptRERcU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kV+tOgOV; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=F76nRE/x reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1M59Ub2934727;
	Mon, 1 Dec 2025 15:29:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Av56yuwrAhHc6ejKICkA9QTy5VmAqypCtX9oSwgUq+Q=; b=
	kptRERcUDp+4j+JvaWtwmWINxD1PzlOw/PDJuxSSZEo/lK+kzh+oeSne7uFg34IN
	+Jh+GI88Vtuoe0wBmq82EIvK54G9CiRT+xjZBTlfv7I9guy6po64AYG4ViN3YQ0f
	HjTxMCMDxVN8af86EmI/uOUc3+BxdP/n/11ny2+a4Ils5qOYS8Gs6trcLg8XRaLu
	0bKd0/G0K5QRmfwi1hudmEr3Azqauy06/hHCUsvxEj/8s7OdC7kdHPGJ9rtiqkFB
	RT/wKb0NI0UfkyUx7onZ9RtVCqEa6v0pw20OPhsiOYv+KtRxoW+jVuoRAGw5AxGZ
	HwMGyncrJq/82OeVW+h+kA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4asdem1ytb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 15:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1764631762; bh=Av56yuwrAhHc6ejKICkA9QTy5VmAqypCtX9oSwgUq+Q=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kV+tOgOVT8BOUBNhh0cTAEcQWq8h1+Hpw5JQHMYMwRA+Z7bGf2T5nhMmtIpqlrlHK
	 w7fdgzU9tI2iP3PUuyslNy9CFqU/ITcL57wI0aGE4nHlLa8iRQ/dol5VDyxgNBGTY/
	 71qvi+XTnPJJuCETchBo8AWyW3zLPGx038RS2jdLmlDM7pgjqFIwBkMTdPKppQyNE9
	 hPnIysVAr/3qK1ch3b2bNvxpqb+ETdZT+e4cNWQ+/ZhbbFC+YWLQC2QlSmYXwlKLt8
	 E2M0mTZiCcb7EXZvbr8FSwpkeOHltI1hy1V5sBH00yIrK9OSrCaTgT0V4JLnb3362k
	 2t8CBW8WNxUQQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4381040236;
	Mon,  1 Dec 2025 23:29:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A41ACA005D;
	Mon,  1 Dec 2025 23:29:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=F76nRE/x;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00103.outbound.protection.outlook.com [40.93.6.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D714B40356;
	Mon,  1 Dec 2025 23:29:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpih9Gwb9QXC6hsR5NBqImr2rC0rLvYxP9zYm2eLlnoW4NPolVYmba54pLYDm7dEiPMTA21ZpnFzwNaY/fwElJzGaa50QHV9UPPE92WbwJjfsjur8pINHFwhl0hFKOf+kuzCet30nw+KulOzVwCUsE+C1pXPfnFPNB6qAvoBjEFNzlXWQyhCa+iKqIXt6GyquTdJvrLJJiTpIKiWqoqSELcQNtTpVKtmgWgLeHfBJrP+TEBbVfp06vhV3Ru3wSvoXQpjkD544960sQwrC9813vQlQeHQov8riVqaJgxEcIXcnuXZBHe9S5obWZRZI6dEyth9LIgxatc/DMlzM+uKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Av56yuwrAhHc6ejKICkA9QTy5VmAqypCtX9oSwgUq+Q=;
 b=MbvawIsfvKe8ZTD6ZRyxj5s0COl9Y+5LApNmMv99uwWenNnY2FDbYCQ/JsD+HGShk89ZuI6uiNKbWRrpxkyG3vrtTROAKte6QWTByZlRoIucLfkH43GgzsVC0OnT1U29V3BTPi86vPS5c6kbU70A3UC2j4c2zpWkBExHSoTF05SBbVZb3clpuXEASCJQs/sxSHQr8KGwRnVyasr6EZjntO2GD2J3T5t4RJmGP0/ZpaF0AF9lDVqdwpWWg7T4FcaQejBU/ANal8bTsCixBndC6GVpL2aGUROKdNu9ETZtllLxAkGF5hF9tUYljUBThXEOhiiSJwAWOpCTuY6sSdXM4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Av56yuwrAhHc6ejKICkA9QTy5VmAqypCtX9oSwgUq+Q=;
 b=F76nRE/xRLZ4e4RcnKk9YmO87XBcrs3/CU0AHU9ONfTaOFycZniakYgBCMeLkmYTpPLOBMzHRA15rh1q7226udOVCAqGEr0r7cDM1hBpMaxKQZK0ZoGMVtyJh4fzWmeZirh+6eklzf9RkCgSYqWaDH/ou+LdX9NKWlg1hFSLpdE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB7591.namprd12.prod.outlook.com (2603:10b6:208:429::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:29:15 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:29:15 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Angelo Dureghello <angelo@kernel-space.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: testusb: epipe errors on test 9 and 10
Thread-Topic: testusb: epipe errors on test 9 and 10
Thread-Index: AQHcX3S6n+P1FBV5tkmmOEks6ZvKjbUHbd4AgAC3i4CAABC3gIAADd0AgAUxsYA=
Date: Mon, 1 Dec 2025 23:29:14 +0000
Message-ID: <20251201232911.s5diakt3w7ztzjv2@synopsys.com>
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
 <d8aa2f1e-fc44-4bb9-8245-d6ac76047dc3@kernel-space.org>
 <9776c9fb-8fed-4e79-b312-0b1a872911b8@rowland.harvard.edu>
 <bcc4f76a-985b-4932-a455-b4fedcafcd97@rowland.harvard.edu>
In-Reply-To: <bcc4f76a-985b-4932-a455-b4fedcafcd97@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB7591:EE_
x-ms-office365-filtering-correlation-id: f88e9f37-25d3-4dc3-9910-08de313170de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eXJjZHRPdlJueURLNmdpbzUzTzQ0NmtQaVNYSERHbU90RDh2UVM0ZlVlbGwx?=
 =?utf-8?B?U1VHSHJFZHdPZGJjZG5KMzZwbFdvb3JKL040b1ZuVE8vRWkvbWYveDNlc1Bk?=
 =?utf-8?B?V1puOXJzejhRZk44R1J4eExKZkhDTlllK1l1RnRWd1JEcGF1UzFQby9JdDBl?=
 =?utf-8?B?eGxhMHlFTWtLcGV3NzhqWnRWY0I5RXNZbmY3Y0UxRVY5VjBjSmdHaWVzTElR?=
 =?utf-8?B?QUc3ak5vWFd4eVV0aENCTVdSRWU4QTZsTXdBNytobTl3Z0U4bFlkRkNXNGpJ?=
 =?utf-8?B?UTRNaEREYitvajJOcWpPcEEra2hST2lmbkNuLzViRGdxclBTSFRYclRvT2hD?=
 =?utf-8?B?T0Z4QUhOQkNmNlRPYUdtNG40Wk50dmhMSGZhM3hHam5EWkljU3I3T3RTOStl?=
 =?utf-8?B?OWJMUTlrVng5WGx3TFBMUjZnVDRFSUxlUzU1U281MnhERkM3Nkw3c1hnMlho?=
 =?utf-8?B?RGZRd2o4Zzc3ZU85R3JGeXFkdzlWTnd5YXI4Z2JGelZYSXdFOHVWdHpFSlhJ?=
 =?utf-8?B?Y1krUGhlL0cvMmdJYVpjWTJvTjRQdnFDeEw2dm5HcUZpb0VEdGdUajhpMFZZ?=
 =?utf-8?B?eXVWTnlkaGE4UUJ1cTR4WlpnUFFZc2ZScEJIa0d4S21QQ1JyU09BdkI2NFAz?=
 =?utf-8?B?RXczamNLS0lDc0R4bllQSCt4QnUxZUoxUnIvQjF0MWRaOEU1SXpzVUZFUGtG?=
 =?utf-8?B?YUtsVHI3MEo4WnptbWRRUE8zZEpWKzFmbENvYnkxRlRWY2UrYjR1RGtmd3Y3?=
 =?utf-8?B?OW1YVzNWNVJOdXJqTnlXcGhETC9NOWUxQWdqSzZCa0oxQ1VEZkg3cnBoUGI4?=
 =?utf-8?B?R0ZKUzBlZmdPNCtNRmZGYXVSb2JNYUNuQ3dnSjNUK2xzY0g5NUdvakxtQ0NV?=
 =?utf-8?B?TGh4alBXdS9nQ1hYTUtRVko3ZGNBUUM1bFNCeXA0ZEVBWXcxUHZ3K2dERjlG?=
 =?utf-8?B?bUVjUURTcEZFY01ENHJIbWlKMXBycmptY1FLV1piMU5ZdDBHN1A2OWtlYm1t?=
 =?utf-8?B?WXZWbE9yQnZyRHpkUkJ3RDZRN1dZeGhrOVI4UXljd2g1T054U3h5ZHJpSE0w?=
 =?utf-8?B?TUduT3BVdTZmNEZ6MDVuUnpkd2tZdU9kblBvckR2K1ZFYmxaL0thZXVMa0xM?=
 =?utf-8?B?VzFKVHpic2YyRHg5R1dSRGdmNUhOa3pYZDFwOEVXSmFoMGMwMlVoMUZGRVNC?=
 =?utf-8?B?a2F4NmpyVWxFcnJiVnFyQmpDWHVlMVFPNG9zSWZyd3MvMmxqMjc1b0NaYVpW?=
 =?utf-8?B?K1lSd0NJRHRiUmU0NUx1Kzd6UmtkWkNWUDdEYTZ4aDVGS3NzTnVpWWs4R2hr?=
 =?utf-8?B?OXgrM3Q0OWExVVErdHpBS2Q3a01XUWl6cE55cENIamtlWGZXTG5hVkZ0Q3g4?=
 =?utf-8?B?OVpmbWdEVkMvRzkxVStrd2VtZ3Vxd2JuNU4yOUd0KzZVQ0hNOG9YUTFBY3E2?=
 =?utf-8?B?RENaN2pwblpUbVVlcHdoVDE3OWNLNmVXdUxYRUlnNWU5QlNOQjBiNitsQjdq?=
 =?utf-8?B?UUJVd2M2MnlaVXcyZVFVR1Y1R2RaWnBQYlBCSUNPbUV3ejYxV2J2bms2OUZr?=
 =?utf-8?B?dDdMYVk2SjcySlRNeTJTVEd3SW9JTEZtMHpSWVh4T3pDczM3OGY1TGtORnlY?=
 =?utf-8?B?VWpnV1FkYWc0dGl4emxWblpaR2M4b1VNaytwMWZ6Y0o2Mm1BbE5NMGtSR1A3?=
 =?utf-8?B?a2R0VzJJb0NTTjZSZDFrVzBPKzRDNitxVURvYi9lZlZ2aVZzYkFkOVQvNU9L?=
 =?utf-8?B?LzQ5bW5GZGoxQlpPdU0vMkZuNkJsWXhja08reU8xait1T1NVZDhRWS85L2JJ?=
 =?utf-8?B?Q25Xd3ZJenhTT1Z6UkdMMmNsbDczQzNxVnZtWGhORFZKZ0pGd3BkRXJDakVV?=
 =?utf-8?B?QXlyN3JGUUFBUlpnM0RkQkliVkhlNGdXTmI5UzJpWmJxaS93TEh6Zkpac2VD?=
 =?utf-8?B?YmNMRElXNHBHWDFpb1JEZzlQd2pHZzFzL3VodXpibTRWTmtOS1FtTk5WRkJ6?=
 =?utf-8?B?aElXQ09nVSs2ekRkYUd0ek1YNitwVzB2b3h1OHRvSHlBYVRrb3N1YWFGWjRU?=
 =?utf-8?Q?xwM7QX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K091Y2ZXbHh3NlZDcE9LRXliY0k1TTBETlkxeVEzTURPa09WM092cEpVWk1T?=
 =?utf-8?B?RisvQWJnRXRqL2tqU3dOcDZJUCsxMk1COWVTd0FUZlNmVk1mV1dvQ1hWeEky?=
 =?utf-8?B?VWdwa2t1NlpUWm0vVTJ5R3Nvakl5eFVkZlc5K2w3dnpXSG52dmhMbnhJNUdT?=
 =?utf-8?B?MUluOE9TUGlEaVU0N1I0YzZFWWdDL1hseW5TYWI1YlprYjBNMWNEdWRLam92?=
 =?utf-8?B?RGdxTlNRRHdsQytRK2xTa3AvUnJVR2RNTmdrZm5UZXRtUTRFTmV5ODd1Tlkz?=
 =?utf-8?B?UFVNTCsvbkZpUlpEcURaWStQRGc1Qko2QXpscTNQL0djS2lORnlFaTRuc0d3?=
 =?utf-8?B?RFI3cEtkd01HUWJraVFuOXhLUzBXSDRuYnA3NzJDb0p4VkRKR3NyUjFKTkRv?=
 =?utf-8?B?VjBvQk9lbTh2dXpncWhYUnU0MWZ3a3lyOTZmbHUzdzJvdEFTU0NTVDB5Qk11?=
 =?utf-8?B?SDR4NytxSWk4RitxQjNQd2pZeUJiQTRXRWhIQythZUVUdGJRdXNWSUxhcTVu?=
 =?utf-8?B?Yy9icXdvSkxLVGFxd01wTzhWdWFKOHYweU95cEZqQ3ZSa3hkam5NUzBxRlNy?=
 =?utf-8?B?NCtsUkx3THlOT0RPTEY0UnBhMEprUVZyZW8wbkdKZ0VqM0x0RDZQNnF5dDlW?=
 =?utf-8?B?Q1ZmRVYxZ1I3ZnlRU1FDeHNHcVdaQUp2NWhaZ0pBN0dxeE1ONnlnSnViRnNF?=
 =?utf-8?B?dUlyaHhYU09YNHVVL0gzZEpxM0dDdmgzWExHVngzNmlrRXQvSHgyOHpmNzg3?=
 =?utf-8?B?L08yMm1QVUIyOUpJRkh4UFVvOGNhYzlJWFFha1c1TGpNcGhleU14aXNXZnhr?=
 =?utf-8?B?a1ptZ0dFanZWd0lGYUpQVXpPMktGMG0zbHQza1VYSmpGM1lrbHFza3h1QWhW?=
 =?utf-8?B?V3dBU1BrTThYVlNvRHBWUzNsZWwrTldGNzdadTNFNWRMVGFBdDc0Rm5LOHk1?=
 =?utf-8?B?WWIyZ1VxQlF5RVQ5SU9KNHEvbERxRHhJTmoyLzFHTmpydGtmSzBYdHk1aDIv?=
 =?utf-8?B?a3F4d2JqblpFVVZrMmkxdHZja0Z0ODJJZ0pwVnl2SWJuTXZHVWVISUZMVFo2?=
 =?utf-8?B?TEt4WGFJN3ZYdWg1b2hhMnFWQUMwNEJmdm03aTdjTi9FRnJSUVBQanBqZG80?=
 =?utf-8?B?QnFkaCtPbFlkaHI5Q2Rodk0vMjdmcFRkVmEzQi9Dc1lsaWg4dkdjYkt2eHRF?=
 =?utf-8?B?R0xxTUVHdUExdkJIRithbzJCZWZmK21vU0dyNjk0WEZodjc1TlRVMGxXRWZF?=
 =?utf-8?B?ZXNPcDhIQTYzZHRpRDI5aHNTOXJWalZHdjhzb1NORVUzWkNCRGFXa1IyQTZh?=
 =?utf-8?B?ejJKQWxLSXhKY2xKcS84VHJ1YTdsMmE1dXVxVk5NcFBsaTlPc3ZxOEVDQTJi?=
 =?utf-8?B?SENZM2tCazhHWExqWGZZblpHRGxWT1J5ajR2UW11L1kzWkVoOUptVzJxSUdm?=
 =?utf-8?B?OUMzTVBsL2FVRTlCeW1TdDRpTXROc21OL3M1c1p1RmhjcHJId29yVzZEWlVE?=
 =?utf-8?B?Q3JoSm1BWEhKNG1ZZHJoY1pCZ1hNLzRhbHcvNHZYcUVQU2s5S3ljYkVUbWJH?=
 =?utf-8?B?MEM2T1VzclVhQWhwakdzMjBpUzhPOWU3UUhCbytuc09ZVjkzdnNVZGVPQWhR?=
 =?utf-8?B?REt5QURNZlpFUkUyRWM5NUV3ZVNMdTMrNm9vVTNTb2xodUt1UTlHYlFTMDEw?=
 =?utf-8?B?SWVEZGNNM1ExZTE2Q21XN3NQUzloWmc1WGhCazhmM1lQUy9CL0JDVmZITm9q?=
 =?utf-8?B?akdTS2MyazJQb1ptLzR5NlFrUkkzRkhUMEV2bHptb293RzdiS0t5NFF3NitP?=
 =?utf-8?B?a2tEMDI1K20zQ0hONXpaSTJzbnZ5SnhacDUzSmV5SjUyWjFjTk5PLzRLbFBK?=
 =?utf-8?B?OVJZaUgzOUU3QUhETEFZczFtS0FvNkVjK1MwNk1sdEMxVVZ1a01qUTkyVGxp?=
 =?utf-8?B?bEdtTWczZVM1cDZzMko2OW8xaFB6RWtnUUtwcVJmd21jdEVJVjhrQytoTjA2?=
 =?utf-8?B?K2RtWTRDY3UwaFI4OFJCYldZMWFLUFhsM1dVQkdnRmh6ZlV6UHVlSkgzL3hn?=
 =?utf-8?B?RVhheGttVUdobFFWOWJtVXR5OXUxUFhVZkJ0STdrakFIcCs0Rk9qR04zT2ZV?=
 =?utf-8?Q?ewHwvjC7kCyk4/buosqCGG14/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36312631890E8B42AB4BA93672A5DB89@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0KfGKPwWazOzk2nN8o3B1VbE7u7NsnD+ukTgezitaCndNAJW4sZ+zn8cRWBBBLFjeMNwTmofs5c2VZBdL3qJkV8iAZNoF5n+husxWFlBxfb0uRrkhMEoM0y7ADmrngThov8DgXKV8YiZsWHcENtJii6bHCCb1nFBnvQGoMEWK+faNXDNzqPzGKN2bWHCljJvZzvrZ9/wgmABFPEKkgjJQ7Ec5AtU2KW+ZcNSpGIufdFq3e4/Bkx4UR1/cWBm9K59C8GeUtccGYb+uQEA0HHqVGnd4rcyEsxJMdSRjAJU+VxCsAT7MclLZJ7t8jqb/5UbsqQ3oZH/BwLfPn0kLSrHnxnKFqBB20E2tMHnG+fdH78dGmliiVH8d8iRlaeWU5DmUjlXhjGK5VXYVYnKkuXq7ZLt2fCmnaB9qur7InUdxG+1Qttj0UAwbuBiSXQdZje7ZjtahkdyAHMuGlSmuM4nzi+HmQPjPlr3nirL/WGJuZocEOYoiGwRJsZIJ4irqZo/Gwuro1lgNeHkYUfrlTFMQITP3Dl+0qbEnja2Vm6sS5yYQgdYnNqZ57FDiVaq8XmBQrCsKZMle2PGg+UkDusVTk/v1SRuLoWXF526jIB357USJpUrg938MwJ2S/n1ZIzTFNhaGN0W8Dh6mBccVt+p0g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f88e9f37-25d3-4dc3-9910-08de313170de
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 23:29:14.9907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F1KarGGQhUQt/WrbRug4Hx/EErPKSSqaSbODM4vbdKTbE1Hx2xP6ySveM6lo0IObGEMDbQZN9Trqtp9fTjkb8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7591
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE4OCBTYWx0ZWRfX22y4krYKMNyL
 Mv/AtaIEaGdmlurfEU18BYmP5RmlDxmGG/e511dyH0MNKl+/Z2DHK08E1eZNE0GzoNQH3C87pZC
 sSK7M/jQ6BiR2sesQULp/gbjG8ivW/TTtVDGKFeNf/vnisEyP2nzhX9NTrTX6l816ntKj94lIcZ
 4U7wnciqq56Gd4koyqQn/M6abF8h67VDHm9fJmX6Rs4TO+sp6m2zxGuMqp7L4ctHK0W9LCaeVWC
 rIYwynQlYiOAhSxNrlBhOHcynbMKD0DeV85xPwFHSMDmWeO6yerjYdHvuwOOKfLBycpczzMwXUi
 XunxUiXFAyxovi4AartXnFwaSCXZDH96mV8Je9YuwTxeH42xhDyb/Doq6nbLgfyhSovH4+rReo+
 XlCuS/UIqS8b725hyvwXpCUMt601tQ==
X-Authority-Analysis: v=2.4 cv=OIAqHCaB c=1 sm=1 tr=0 ts=692e24d2 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=P-IC7800AAAA:8 a=Io5Id3C8c141Vmfi0EUA:9
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: P3GnoeaWVAAL0XMopfR0wOgEUpkKlqo-
X-Proofpoint-GUID: P3GnoeaWVAAL0XMopfR0wOgEUpkKlqo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1011 adultscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512010188

T24gRnJpLCBOb3YgMjgsIDIwMjUsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIEZyaSwgTm92IDI4
LCAyMDI1IGF0IDEwOjIwOjI1QU0gLTA1MDAsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+ID4gT24gRnJp
LCBOb3YgMjgsIDIwMjUgYXQgMDM6MjA6MzVQTSArMDEwMCwgQW5nZWxvIER1cmVnaGVsbG8gd3Jv
dGU6DQo+ID4gPiBIaSBBbGFuLA0KPiA+ID4gDQo+ID4gPiB0aGFua3MgYSBsb3QsDQo+ID4gPiAN
Cj4gPiA+IE9uIDExLzI4LzI1IDA0OjIzLCBBbGFuIFN0ZXJuIHdyb3RlOg0KPiANCj4gPiA+ID4g
SSB0aGluayB0aGlzIGlzIHRoZSBleHBlY3RlZCBiZWhhdmlvcjsgZ196ZXJvIGRvZXMgbm90IHN1
cHBvcnQNCj4gPiA+ID4gR2V0LUludGVyZmFjZS1TdGF0dXMuDQo+ID4gPiBvaywgZ29vZCB0byBr
bm93LiBCdHcsIG9uIHRoaXMgYXJ0aWNsZSBzZWVtcyBhbGwgdGVzdHMgYXJlIHBhc3NpbmcNCj4g
PiA+IA0KPiA+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vYm9vdGxpbi5j
b20vYmxvZy90ZXN0LWEtbGludXgta2VybmVsLXVzYi1kZXZpY2UtY29udHJvbGxlci1kcml2ZXIt
d2l0aC10ZXN0dXNiL19fOyEhQTRGMlI5R19wZyFZTUZjM0VySWFpWTU4TDhrZVpHWVc1MVhsYVBS
Y21HdDdIM0dFbE9FS1RjdUkydnFfZ2tvRWQzMDlTSk5yMHJPb0xzX04yWFpKc1ZUQVVTYm5maV9z
WGF0VmFOQyQgDQo+ID4gPiANCj4gPiA+IGJ1dCBub3QgcmVhbGx5IGNsZWFyIHdoYXQgd2hhdCAi
dGVzdCBtdXN0IHBhc3MiIGlzLg0KPiA+IA0KPiA+IEl0IGxvb2tzIGxpa2Ugc29tZXRoaW5nIG1h
eSBoYXZlIGNoYW5nZWQgYmV0d2VlbiB0aGUgdGltZSB3aGVuIHRoYXQgDQo+ID4gYXJ0aWNsZSB3
YXMgd3JpdHRlbiBhbmQgbm93LiAgSSB3b3VsZCBleHBlY3QgZy16ZXJvIHRvIHN1cHBvcnQgDQo+
ID4gR2V0LUludGVyZmFjZS1TdGF0dXMsIHNpbmNlIGl0IGlzIGEgc3RhbmRhcmQgcmVxdWVzdC4N
Cj4gDQo+IFRoaXMgd2FzIHdyb25nOyBJIGhhZCBmb3Jnb3R0ZW4gdGhhdCBHZXQtU3RhdHVzIHJl
cXVlc3RzIGFyZSBtb3N0bHkgDQo+IGhhbmRsZWQgYnkgdGhlIFVEQyBkcml2ZXIsIG5vdCBieSB0
aGUgZ2FkZ2V0IGRyaXZlcnMuICBJbiB5b3VyIGNhc2UsIEkgDQo+IGd1ZXNzIHRoYXQncyBkd2Mz
Pw0KPiANCj4gSW4gdGhlIGN1cnJlbnQga2VybmVsLCB0aGVzZSByZXF1ZXN0cyBhcmUgaGFuZGxl
ZCBpbiANCj4gZHJpdmVycy91c2IvZHdjMy9lcDAuYzpkd2MzX2VwMF9oYW5kbGVfc3RhdHVzKCku
ICBUaGUgcHJvYmxlbSBpcyB0aGF0IA0KPiB0aGlzIHJvdXRpbmUgZG9lc24ndCBoYW5kbGUgR2V0
LUludGVyZmFjZS1TdGF0dXMgcmVxdWVzdHMgYXQgYWxsOyANCj4gaW5zdGVhZCBpdCBwYXNzZXMg
dGhlbSB0aHJvdWdoIHRvIHRoZSBjb21wb3NpdGUgY29yZSwgd2hpY2ggZG9lc24ndCANCj4gaGFu
ZGxlIG1hbnkgb2YgdGhlbSBlaXRoZXIuICBPdGhlciBVREMgZHJpdmVycyBkbyBhIGJldHRlciBq
b2IuDQo+IA0KPiBGaXhpbmcgdGhpcyBzaG91bGQgYmUgcHJldHR5IGVhc3ksIGJ1dCBJJ20gbm90
IG5vdCBhbiBleHBlcnQgb24gZHdjMy4NCj4gVGhlIG1haW50YWluZXIsIFRoaW5oIE5ndXllbiwg
d2lsbCBrbm93IHdoYXQgdG8gZG8uDQo+IA0KDQpUaGlzIGlzIGEga25vd24gaXNzdWUuIE9mdGVu
LCBob3N0cyBkb24ndCBzZW5kIENsZWFyRmVhdHVyZShoYWx0X2VwKQ0KdW5sZXNzIHRoZXJlJ3Mg
YSBwcm9ibGVtIHdpdGggYSB0cmFuc2Zlci4gQmFjayB0aGVuLCBJIGhhZCBpbXBsZW1lbnRlZA0K
c3VjaCB0aGF0IENsZWFyRmVhdHVyZSByZXF1ZXN0IHdvdWxkIHRyaWdnZXIgYSBkZXF1ZXVlIG91
dHN0YW5kaW5nDQpyZXF1ZXN0cyBmcm9tIGR3YzMuIEl0IHdhcyB0byBpbnRlci1vcCB3aXRoIFdp
bmRvd3MgZHJpdmVycyBmb3IgdGhlaXINCmhhbmRsaW5nIG9mIHRyYW5zYWN0aW9uIGVycm9ycy4g
VGhpcyB3YXMgdGhlIHdyb25nIHdheSB0byBnbyBhYm91dCBpdC4gSQ0KcmVjYWxsIGFmdGVyIGRp
c2N1c3Npb24gd2l0aCBBbGFuIGFuZCByZXZpZXdpbmcgZnVydGhlciB0aGF0IHRoZQ0KcmVjb3Zl
cnkgbWVjaGFuaXNtIFdpbmRvd3MgVUFTUCBkcml2ZXIgdXNlcyB3YXMgZm9yY2luZyBhbiBvdmVy
bGFwcGluZw0KY29tbWFuZCBmYWlsdXJlIHRvIHRyaWdnZXIgdGhlIGZ1bmN0aW9uIGRyaXZlciB0
byBkZXF1ZXVlIHJlcXVlc3RzIChub3QNCmNvbWluZyBmcm9tIENsZWFyRmVhdHVyZSBhbmQgZHdj
MykuDQoNClRoaXMgaXMgb24gbXkgVE9ETyBsaXN0IHRvIGZpeC4gVG8gZml4IHRoaXMsIEkgd291
bGQgYWxzbyBuZWVkIHRvIGZpeA0Kb3VyIExpbnV4IFVBU1AgZHJpdmVyIHRvIGhhbmRsZSB0aGlz
IHByb3Blcmx5Lg0KDQpCUiwNClRoaW5o

