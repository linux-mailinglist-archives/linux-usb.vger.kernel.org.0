Return-Path: <linux-usb+bounces-23934-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52733AB6088
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 03:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82F453B5D48
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 01:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D306C1D54EF;
	Wed, 14 May 2025 01:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mqxIVqJU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iCbYandS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="MDjnFuFS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243A828EC
	for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 01:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747187251; cv=fail; b=lPwAWi5QwZCyO4pqa16hraJOoNfRTJlR3RsniwHAOtrEAJOfnw6bwboulBSb/sZ+bq8gxWtk2XtdEe73iVT4sQwKojAxoxzaVaqBJLhhn1uhPzEOPtvPcwpSf80lBsvH5Qug3VGus5S06srzq9loSGoA2Do/7xsS73KX18MZL6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747187251; c=relaxed/simple;
	bh=0UHp3+5mvpzApL8UnzvsK3IUIsHmA2U0abhs4rASBVY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BPDrg3BhYNCi/sJ+/J9y/NoXSQ8b/eSMld57D/NF8C6zu9kcX1hybfx3pQRqbEYLTV4CYYoVPlRdj7qhfOdBXatyjXalQjEctwVeX7cVxF2UzUkcU/ih3DT+uLSpVLlzUOatWNtH7tQnXwZ96/fYDmKimf8t9DE2zEGQwCrRoS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mqxIVqJU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iCbYandS; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=MDjnFuFS reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DMCkVe008187;
	Tue, 13 May 2025 17:48:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=0UHp3+5mvpzApL8UnzvsK3IUIsHmA2U0abhs4rASBVY=; b=
	mqxIVqJUjW0P0/edhhKLYUwmV//jtkxY16axMkSzVpktHtjTS9CkQjps6k2PuKcm
	HM9f/Q9P8gnKjUsABhNb3DmxOhV5kicmh1ZNFBhrgN7Mg+f+SMLk7WuAx1BINSJ7
	xoroNKZRIPjhn60unEgVfNd361990E28nkXoFUVvhqqNCBE3a+K2+3xaFhuHy+nW
	BzcQ4lfeLbszBmY5K8D1YBtADlV33Odo/oN+LQRMk2LgRwjwitbKECkoKb7T7wOE
	EoRgxCYsTZwEz62BpdQfqPKuHP4/uRIEkeAXbPb8qqptfQIK2ocTlJNkgO3fKfY7
	EasTsLzmeLJ39726BQa3NQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 46mbe49whn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 17:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1747183688; bh=0UHp3+5mvpzApL8UnzvsK3IUIsHmA2U0abhs4rASBVY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=iCbYandSHsM3HLFlpoKy6tR+pCtU4Gk2/949OIu8VvWpAbNyW1QptZ3vWkqcrc/f3
	 9dR9CJuU0OSNqfSScKrsBfLqKGXg4MpSoT4Bd0gIoFyjJHiuAQ9lDbvFal7aLJoC/d
	 TviglyCkIXqfgJlU4zpts2OLeRuuTO9yhStqzJnfrqLv1cFQcLNnCe6L+xpfwQMYU7
	 PasVwLswYyH6qWU6KPK5Yft5Q4gVisO+VwM/NgqdL5yzBOkdSxpS402NYhrEgk4UiL
	 MeH9cAr6a0aMOy2hJtbDBAf7ZWwS1nFbJgEYU6laXxIlSf4qvL1LKsUHdDQLt5PcVQ
	 WxR/mPMYzZLAQ==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C105040148;
	Wed, 14 May 2025 00:48:08 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 59B7FA0087;
	Wed, 14 May 2025 00:48:08 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MDjnFuFS;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id AE6C640148;
	Wed, 14 May 2025 00:48:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/1/D/dDSn10S2caFtzRHHpPT47VMfL6DhtksNeGPaj10h30RuvkmKtfJQTVW6xGGBG0hi5qnYgP0bkibkOjnQzmSWix56ejB1IMATUlIBpGdOTGCxLVyWs3g58UGomuvr6AbKtn1WihBKFUSrVSyWQGYn7poAF7Zx+OsI3IhM76LPga+GB6I+ASLbbbGziokVQQ0TAQnpOaQSm0x7o/rSMN/6buXAnIFqo2zghpnOaXG0Vg/i6ZNEleH3FXj4DBn8b+KRO7rVkEhCT5zJpM923ERK44iCqmxRf/pO8p8upnz5oV4KzhMm0W20LCzBkS9CGOqMUSkMWXu4eR1PnnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UHp3+5mvpzApL8UnzvsK3IUIsHmA2U0abhs4rASBVY=;
 b=UnBAl/UZj4UnKdMdwpEfmulJShWqZds790wqRVdQHs4Ctk49D92GqlP6m+BhDJ7X+ajmQtOzdxKgYqHsSKrYjh7EzNSdO0tiXPMUw6zo0XkTWIynVnPzhS3SdneYAPiQvJrThi7HDhZX3oj1Z5hqPVvq3uzCDRGffOLbWsxL0D0A2jcxL+0fqN0BpVtD16oF/7XRmG1hS1PAH8Y7JMbArx+8BDPqLnlo/J1j3g+k9YIFK3wxNsjNu6XO4EWZEXfVoZfe7rgjh1Fw8n47QM2+v7uwMH3uvZ91KGqdxigVAnjWgqKrhxvkgjNxJiQi6NT6aUowqkA4f9TunsVtGU8F1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UHp3+5mvpzApL8UnzvsK3IUIsHmA2U0abhs4rASBVY=;
 b=MDjnFuFSQ269DVPlThMrnXq5ya0rKRAKS2q3gm06WiJR4hDCRcNe1AeRSlwofo7zgXvJBD5+uqyckh6lG4EFzpkZFeXajvq42XBuPV0WMLnX1/ahzA4ydv6tmxtdO07m0cHOdf5VUfFk+1iXxjgV1vMjOBfjYY2wMGn3Oz0YWyM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 00:48:04 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 00:48:04 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Jakob Trumpower <jakob.trumpower@matrixspace.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.
Thread-Topic: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.
Thread-Index: AQHbtgHIe40KI1iUEEu1UTaSuuJEJrO87/qAgAjQYTuAAjUAAIACgqPDgAbvq4A=
Date: Wed, 14 May 2025 00:48:04 +0000
Message-ID: <20250514004759.v4twvbma5rm3mept@synopsys.com>
References:
 <PH0PR06MB7077FFC05705A02FD5CB94C2E8842@PH0PR06MB7077.namprd06.prod.outlook.com>
 <20250501001425.ijly3g2knjghvese@synopsys.com>
 <PH0PR06MB7077C939CDCF50DADE0A70F6E889A@PH0PR06MB7077.namprd06.prod.outlook.com>
 <20250508003232.t5bqoqvbmnohpeka@synopsys.com>
 <PH0PR06MB70771B5C2F3FA38E0BC9E2F4E88AA@PH0PR06MB7077.namprd06.prod.outlook.com>
In-Reply-To:
 <PH0PR06MB70771B5C2F3FA38E0BC9E2F4E88AA@PH0PR06MB7077.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB6440:EE_
x-ms-office365-filtering-correlation-id: 6c436fc7-5ae1-4970-3232-08dd9280fc44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QWpwRG9jM0xRVHk1Y2p0eWNXWmtXSzFVVjNwRE5jdFFzUkZERzNxcG1BQUNr?=
 =?utf-8?B?dzhmTkdQVVU4RTBvSHJIN2RoM1JabE9oU2dvSTQzR2tNYzBzcnFzMFExOTNi?=
 =?utf-8?B?UnNhK3JwZHdwNnFGV2ladkZWQXc3Sk03SG9PdEV1RUJxd2FCQXAxa0JyUzh6?=
 =?utf-8?B?VkRGekRXZ2xsWlZ2cWpkR0NNUEFlZkRNcy9MV29pRGN6R2EvU1A0U3d5d1Rh?=
 =?utf-8?B?SGVodU9PSmI3aGxFb3JmMXlGOWRmeE5RWEdWNzR0WVpMcmNHZVRySDlyeTkw?=
 =?utf-8?B?VG1RR095L25CTkJaL1BVeGkyNkY1U3RNYXJzUlgwYVRLbTJ6aTF1MVFEdGow?=
 =?utf-8?B?YkJDZmMzbmx0Q2hXUERja1MrWGNTdExOVmQ1Ny9BV3Ezak1VU2xRQ0JmQnhF?=
 =?utf-8?B?cjJnaWdxSlBSUURxMDlyS2FrdXY2K2JFTEloalhaU3ByL0loNVN5VDRNNnJL?=
 =?utf-8?B?eUhMQmJra1dwakdpZUl6aVMrbjdwcUQwb3R2bmZYeG1abDlDT3BvNGtnNUk3?=
 =?utf-8?B?dE1RTFFxRHJzRjBzS3V3SDZuUTRWZWdZcmJ3dkhxUGVrazJZWDIwdDEzR25z?=
 =?utf-8?B?aGNCc2ZEbTRyS2Q2R1dkVXJJa3pyaXdxb3Z3MnkycHd6VEFJczg5VjVpdVl3?=
 =?utf-8?B?My9lUFR6cmJQZlFiTmdGTHB4bDU1ZGEzN05WcTlTUU83Mm00Yk5OZUs2QUlU?=
 =?utf-8?B?RzN0a3ptbW5NOXFaa1VmNlpCOVZKUGdySnVNdzlWbkFGSC9kV1ZlQUg4UUNE?=
 =?utf-8?B?VUpKUk1SYUQzOXhnaXcvMFoxRzQvUlVPOE5FdHRUb0xRYlQybWludTRQY1lS?=
 =?utf-8?B?a1d0dTFWTDhKR01JaE9sK2tNQzBlcHRZeUh0V2JmMTZZTjVWd3ZuU3hBMTRl?=
 =?utf-8?B?azhuUGcwU2o4a1QyUTNMRjZmS1ROTDhRdHpMQTJtZTM3WmtmS0VmaXJQN1VY?=
 =?utf-8?B?YUxkMEpaTmcyTVZvdDFoWEVJSWtXcHlsdy9DR2pINS9DTGZYZVU2cWdQbXR3?=
 =?utf-8?B?eFR2amZqODFHSzBFTDE4alFEcTRFdUtuVWwzNUdBUFZQL3NEQUF2REY2TDlW?=
 =?utf-8?B?Y2thRE9oZ0NTMmxlODh5eFNQNTFnbWdzUEhGQ2dpcjRtT0ltWjFmRTE4eGxY?=
 =?utf-8?B?U2ZxRWJOajZmTjRacXlmQmIzTS9kWFBKL1pWaXl3QlNnTXcyLzNrT3VPRzZZ?=
 =?utf-8?B?U0NHNVdFZkFWQUttU1dXaEg0Z3lneWp3WGxhQ0ZiT1pJNkdaSFF6aHArU3dV?=
 =?utf-8?B?aVdSVVRjVFlHR2tKK0lNKzhkOXFrNEFseGZrcFN0SWhibktOU2x4SnMweEhi?=
 =?utf-8?B?Q2RucGJhUVovcDJ1cVFhTUNrMzJpSk1CbTBCZk83RlVXMnFMdnFadG0vKzBU?=
 =?utf-8?B?akdYQ29DWFFVR3J6RGFNd1drM2kybmg3eWUyMkplcU80bW1IT3FKMHdBMmpa?=
 =?utf-8?B?M1lqdHBwTmU5TjhQa3V2WFQvV29VNWYyblFhMGxVQWtRNnBKZlRhbnJKUjNq?=
 =?utf-8?B?Z3krdlQ4dW5IL3FaeDQya2NGSXVFVUZaem1EQ29FbTFac0lGbG1XWmY1SlBO?=
 =?utf-8?B?VlU3cHRROFkremFOL3pRVk9EMW1iRXdlWHN1RmpQY3VCeHB6R3Z2WStVdFN0?=
 =?utf-8?B?RTJxT25GMG9ENFM2V29mbm9mY3g5RkFZaHVRTGpZQjVYY2ZRVEV4RHdxT2NO?=
 =?utf-8?B?MlpraG1OVEZrWkpJYzJDT2RHanp4Wmpja1ByZ0puNHdhamFYTSt3cE4wTE8v?=
 =?utf-8?B?aVdwVThNNkR0YVRXbTMybjdkRWY1a2pOTmpBZ2xlYmJYZDkxeDFMMzNESGtF?=
 =?utf-8?B?N0x3SFlqWlUxQUI3STNuMWdOVnJ4UjZiY0lVRndkNGNCRHNDczFWWkd6dUNE?=
 =?utf-8?B?dVpyR2JlUFNUSXA5NVlnNjZlUEQ4NTI0eXQyOWJtRjZJeTBxWE1UVG0zVklp?=
 =?utf-8?B?Zm5hdmF4QVRLelpCdkxLVy90OUVOTUZRU3pTMXNKT1pwUGNFdURqOEJQRUhw?=
 =?utf-8?Q?5W2HlUtVMX+lCs5VRCPgDqDwWbo3JA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tk1acmdFYnkwRG9GZWxiQ3ZpcDdOeExmV1BDYVhpbWFIdDIyTGZGWWszZytB?=
 =?utf-8?B?U2VWRjJwK2dYM01SeW8ySERIUjNTWlJobjhudmNLaWhvZ0tLSUZrdUVKSkc0?=
 =?utf-8?B?M0hKSVVzQVJzVkpXNHU1cGpsS2NiM2FmWmVBMkt0TnBmd0hjc090UW44Szkw?=
 =?utf-8?B?a0E0VE0vS3B0ZlBYK2xhVFFoaEZ0eTFRaTN2bjZrM2pTVTQrQVBPVm5FRm9R?=
 =?utf-8?B?T3JmdFNRc3FseDV1VkpRTjNoVFJqaWlieis4VWxOeWFHMjFpdzFEendiSTBT?=
 =?utf-8?B?ZTI4VERsUEcyUEVRSS90b2NXVDFOUkN1NlhjUjBta1JKOGNWeUtrRGZhb1hG?=
 =?utf-8?B?MmRWYk9vT2wwOGMvcTdFQTV0bnVtenFYV0FKdFZpMHRsQUwyNjQ4N05LUEdj?=
 =?utf-8?B?T0gweGo0aFVXQzhkMThGVFZpeHRoU1hJYnJiZzJoMGFPUGVmY2w2L3F2V0Js?=
 =?utf-8?B?czJVODRac0pPR0w3QjZpNkN3NEFJeWE1SldBUHNQcmpqaTg4TXBtT3FhK1BZ?=
 =?utf-8?B?MXB6RnRPRXR3ZnNXOWpEeTFIRWVQdTR3d2pYYjBXOHZLbEpIMjJnN09LQ0ls?=
 =?utf-8?B?UG90UWt4cUwyRHpwSURPTTJySGxQaCt0ZHkrbzZCNzZYQ0l5U0o0Z21USzRy?=
 =?utf-8?B?eCtZb1VGUDIwekhvUS9Ha0N0eXdrTG5ydGdiNUI2bStFYnlyMHFrcHIxL2E2?=
 =?utf-8?B?RmsxWlNtQUNrdHZtRmwxbnNKQ2J4WDJjUndyODVlTXdVZXRHVk42dklGRDhZ?=
 =?utf-8?B?cEkveGc5dHVSUXdJRFlaQmlNZ2lPS1IxbysvT0lUVzFMS1lYWmJ1NUdqRFBO?=
 =?utf-8?B?QUVPdGlZS0hEYUJPSyszNDRrb0ZuRFFBaWhOM1k0LzluQjJtZUlYbTdha1lF?=
 =?utf-8?B?dkxWbVZFSVpyaGh4Vy9uUjRyeDFtNkJOZ2xFVk55dnFMb3d0dzREWXpwb09j?=
 =?utf-8?B?aWNQKzhUM2dEeEtkcFZMYjJSN3NSN0YxNVNlR1FzUnY5ZEJDLzFhZzcxcUQv?=
 =?utf-8?B?bjBpVEpWeXc3Ylh3L040cWdCSjlhaFUrKzEzZ2RVazJHTHlCVVBjMXZQa24z?=
 =?utf-8?B?c1puVitnNEhxZkhYZ1paVEIvaitiQzl1a1JINDJNMnZVSU5vN1NGSDAzaDlZ?=
 =?utf-8?B?S0tJNC9JZ2U5T0wzM3Y3MHVpeUZZVW53Ty9yVG0vMGU2TEk0U0I0cHdwVVlF?=
 =?utf-8?B?UWprZ2IxMDhUSy8vVTBsWGdaSEswb2p5cmd0RFE0Q2NhK0FNTUx5WU5KUEYr?=
 =?utf-8?B?Qm01OE84bDJscThzMHQzM2QvSjZWMU9EUlErdTU5TmRBblVrNktaT0Z5a25z?=
 =?utf-8?B?MFFxVlNPK3JCZmN2TlRmaEhUYlBzUFRIYys4SE1ORTZJcm1IaVM1WVU1cm0x?=
 =?utf-8?B?RFhDZVR6RENTUEtHTjBoY3JzVzVXTzNTbmVtSXJoUGxEc0FmcGU3RmFvWFQx?=
 =?utf-8?B?RFNBYzNMS2srZjRPN0dQZldNOGJ2bCtiVlhFSHdZZDJjRDNhdUc2MG1obm5q?=
 =?utf-8?B?Nm0rN282OWdmUEdsb3BQd2UraU1IcTZ1WjFXdFpuVWZlL3NBN2pqY25ML3B4?=
 =?utf-8?B?YmlxTHY3RC9oL013WWoxMGZmekJxQzhXYU1HUWdYWFRDaTRQRHg2YytEUk44?=
 =?utf-8?B?SlM5SXEva2ZlTzZ5cWlMRFpldnhRRWR0RC9Za3lEL3J3Vk1Kbklzc25mWXlY?=
 =?utf-8?B?RkRadzUrWDRFWFFETE1GY2kzeHl3ZjE5NkhueWpJMW5mZXlRZ1N1R0RRaVZl?=
 =?utf-8?B?YkpMUEVQTkRHN1dBbWFjNGNPZFJLK0diUFV1L3BJU0JUM1ZLTWF3M1dGTDhk?=
 =?utf-8?B?WUhlNUc3T2xrelR3MkxhNlVKTCtFcEhRYTNWV3dkS2d2VXVMVzg0NlhKZUd5?=
 =?utf-8?B?N0FES0pkRDNkZUdwdHFaT1pRdWFnVkI3Z1d0WUswUmdCY0xMbE5iYmJ1a1lZ?=
 =?utf-8?B?UzMxS1dSMFN3dWtWejNCVzJlQjQwR3Nnb1l1eEZTbFY1QUNEZ0RIVTZkVjRh?=
 =?utf-8?B?bWw2MEJXaFhvUUZ5OEhjWmNwOE9sbXFtMG9NT3BOSGF6VmpFMy95Szd6bHF5?=
 =?utf-8?B?dnBGQ1hSREtMN2VWZHZYSmxiajZVd3Mza21VdDZzRUhyL2dVUk0zYk95cHVI?=
 =?utf-8?Q?WZVNwZIGoBoletgB/GPCSNni3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDC2259F190A804CA4610BAB34BBC683@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	milw5kQpO9Bl8PdjTX/nPJ0yvzB0tmg2uAzOqV5IvZsxP6RvGrPj+ZwpI4tWhKf+I9WhG69StVHz9SC9QlrgyweGzCFrLfAIDD82M7k3A/2bJtOfdny827Ai5WmgDUO02MpiTuO82pDbobd/qtTu4LtiFEB1KjfCopDX+Q8V+yfAqs0lvXmqIlC3UUfgOwzR3KR2c2EWlTjaWFQEXWOqQkskvoayP65p1h6d2kilptHqzUOYH5IDM234igx657QrK8TVpefkN67nYm8S9ylQWis31VKwWpveDKhiiIt4vRpZpr4V4Dwdpbn8MIzvLJd60sdzuCRnVgAdMO4XUTMJtdUBIot3Ixul7QMTqNux/FJm4L/jb3sqETF/vXzTSIsWQqVQO/xsuwDNJtc5Z9Pt6TXAvrjhHm0wM6FvHZQ6QNvvdXDk5wQU4HFjCL+OE7oZtQkoZQjQv2N3Ha/Vddvz2BbZDIJlLIpSqE7xXXm4w1aezukGLfja6CrBp0To+jFjhWY5F2/KRzWEMPWw5yPbQf3nCvFcpyW3616ZQ0E3ioB1RNrNDynqdUwg6ZFT+qpguMy69B4LfC1IaZ8cXbay6TXgVVeKLpwBIGdUpW8lPJC6zYsDqGmu+XAXm32uVYuaFkbf/oCykzIP8wHPyETIAQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c436fc7-5ae1-4970-3232-08dd9280fc44
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 00:48:04.1906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7dKrxy1AbmAWBvGIR0JiJHGZRySllXGx/kgw4Kf0GSVS05NBzx/FZa88vearEPPfhnTaLLlpC608tVIoqNB9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6440
X-Authority-Analysis: v=2.4 cv=C+XpyRP+ c=1 sm=1 tr=0 ts=6823e849 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qPHU084jO2kA:10 a=83YVuBhoVDX4EtlxSykA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Cg1qvGOosionVuomFzx08XMQF4kijXV2
X-Proofpoint-GUID: Cg1qvGOosionVuomFzx08XMQF4kijXV2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDAwNCBTYWx0ZWRfX42YD0gtJ+LbG
 uPXx9JjgXlFZpJpsDnJ7Se0RZHqV47Rh/WPQm/VKxQIwaWx5AaKCPNelyITvdTE4lPCgsYqkLWC
 A2VSQ9bLPJu8HF244Srih/RQfGfuzyjujWZMaxBZykCmyiZc/mrkYo/lAHchQrn131HAkJCyHPK
 yy4w4xcuv0z3qtbVHr0hFtMM/YtT9GegyKqHkzTO7cOB0EVURyMPzVvvKyuOjCsEzSPmz3ZcLrh
 rH9OfU137KxrDEzkDb4aXGBzb00EveVMdHsBamLk1TQtfGp7XBPdZB1QxH7+diUBcNgUbg4XBAW
 rZLLRKlsnxZq4yVUfIkECZrMZhP9fMjIZDPsKBDzDE8HdNy1YuQQY/V3lqp7yWZqkCooR6S942l
 RDWSoMF1D6lUqJ4rzw+zV81Y/jFyA0NY0DQ3j9EJL0ByLy6Lbv1bnlHMyl6f7NAWVeKsyq40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140004

T24gRnJpLCBNYXkgMDksIDIwMjUsIEpha29iIFRydW1wb3dlciB3cm90ZToNCj4gSGkgVGhpbmgs
DQo+IA0KPiBTb3JyeSBhYm91dCB0aGUgZm9ybWF0dGluZywgSSBzd2l0Y2hlZCBvdXRsb29rIHRv
IHVzZSBwbGFpbiB0ZXh0Lg0KPiANCj4gSSByZW1vdmVkIHRoZSByZXNldCBhdCBpbml0IGxpa2Ug
eW91IG1lbnRpb25lZCB3aXRoIHRoZSBwYXRjaC4gQXMgd2VsbCBhcyBwdXQgdGhlIHF1aXJrcyBi
YWNrIGluIGZvciB1Mix1MyBkaXNhYmxlLiBJIGFsc28gaGFkIHRyaWVkIG1hbnVhbGx5IHRvZ2ds
aW5nIHRoZSAvc3lzL2J1cyBlbnRyaWVzIGluIHRoZSBwYXN0LCBhbmQgd291bGQgdXN1YWxseSBz
ZWUgdGhlIGh1YiBtZXNzYWdlcyBjb21lIGJhY2sgYnV0IHRoZSBkb3duc3RyZWFtIGRldmljZSB3
b3VsZCBzdGlsbCBub3QgZW51bWVyYXRlLiBJIHRyaWVkIGl0IGFnYWluIHdpdGggbm8gY2hhbmdl
LiBOb3RlOiB1c2IzIGlzIHRoZSAyLjAgY29udHJvbGxlciBmb3IgdGhlIHNhbWUgcG9ydC4NCj4g
DQo+IHJvb3RAbXMtcmFkYXItMDE6fiMgY2F0IC9zeXMvYnVzL3VzYi9kZXZpY2VzL3VzYjQvNC0w
OjEuMC91c2I0LXBvcnQxL2Rpc2FibGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gMCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPiBy
b290QG1zLXJhZGFyLTAxOn4jIGVjaG8gMSA+ICAvc3lzL2J1cy91c2IvZGV2aWNlcy91c2I0LzQt
MFw6MS4wL3VzYjQtcG9ydDEvZGlzYWJsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPiByb290
QG1zLXJhZGFyLTAxOn4jIGVjaG8gMCA+ICAvc3lzL2J1cy91c2IvZGV2aWNlcy91c2I0LzQtMFw6
MS4wL3VzYjQtcG9ydDEvZGlzYWJsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPiByb290QG1z
LXJhZGFyLTAxOn4jIGVjaG8gMSA+ICAvc3lzL2J1cy91c2IvZGV2aWNlcy91c2IzLzMtMFw6MS4w
L3VzYjMtcG9ydDEvZGlzYWJsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPiByb290QG1zLXJh
ZGFyLTAxOn4jIGVjaG8gMCA+ICAvc3lzL2J1cy91c2IvZGV2aWNlcy91c2IzLzMtMFw6MS4wL3Vz
YjMtcG9ydDEvZGlzYWJsZSAgDQo+IA0KPiBIZXJlIEkgYW0gdG9nZ2xpbmcgYXV0aG9yaXplZCBp
bnN0ZWFkIGFuZCBJIGRvIHNlZSBzb21lIG1lc3NhZ2VzLCBidXQgc3RpbGwgbm8gZGV2aWNlOg0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gcm9v
dEBtcy1yYWRhci0wMTp+IyAgICAgICAgIHN1ZG8gZWNobyAwID4gL3N5cy9idXMvdXNiL2Rldmlj
ZXMvdXNiNC9hdXRob3JpemVkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPiByb290QG1zLXJhZGFyLTAxOn4j
ICAgICAgICAgc3VkbyBlY2hvIDEgPiAvc3lzL2J1cy91c2IvZGV2aWNlcy91c2I0L2F1dGhvcml6
ZWQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgDQo+IFsgMjIwOC45NTA2MTVdIGh1YiA0LTA6MS4wOiBVU0IgaHVi
IGZvdW5kICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICANCj4gWyAyMjA4Ljk1NDQ0MF0gaHViIDQtMDoxLjA6IDEgcG9ydCBkZXRlY3RlZCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPiBbIDIyMDguOTYw
MTY4XSB1c2IgdXNiNDogYXV0aG9yaXplZCB0byBjb25uZWN0ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAN
Cj4gDQo+IA0KPiBUaGVuIG9uY2UgYWdhaW4sIEkgY3ljbGUgdGhlIHVzYiBDIGNvbm5lY3RvciBh
bmQgaXQgY29tZXMgdXA6DQo+IHJvb3RAbXMtcmFkYXItMDE6fiMgWyAgMzIzLjIxMDM5OF0gdXNi
IDQtMTogbmV3IFN1cGVyU3BlZWQgVVNCIGRldmljZSBudW1iZXIgMiB1c2luZyB4aGNpLWhjZCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAN
Cj4gWyAgMzIzLjUxMTU5N10gdXNiIDQtMTogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9y
PTBiOTUsIGlkUHJvZHVjdD0xNzkwLCBiY2REZXZpY2U9IDIuMDAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPiBbICAzMjMuNTE5Nzc2
XSB1c2IgNC0xOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJp
YWxOdW1iZXI9MyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgDQo+IFsgIDMyMy41MjY5MTddIHVzYiA0LTE6IFByb2R1
Y3Q6IEFYODgxNzlBICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICANCj4gWyAgMzIzLjUzMDY3Ml0gdXNiIDQtMTogTWFudWZhY3R1cmVyOiBBU0lYICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KPiBbICAz
MjMuNTM0NTA2XSB1c2IgNC0xOiBTZXJpYWxOdW1iZXI6IDAwMDAwMDAwMDAwRkYzICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+IFsgIDMyMy45MTM3OThdIGNkY19u
Y20gNC0xOjIuMDogTUFDLUFkZHJlc3M6IGEwOmNlOmM4OmJhOmE5OjQ0ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICANCj4gWyAgMzIzLjkxOTM4OV0gY2RjX25jbSA0LTE6Mi4wOiBzZXR0
aW5nIHJ4X21heCA9IDE2Mzg0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IA0KPiBbICAzMjMuOTM3MTY4XSBjZGNfbmNtIDQtMToyLjA6IHNldHRpbmcgdHhfbWF4ID0gMTYz
ODQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgDQo+IFsgIDMyMy45NTE5
ODRdIGNkY19uY20gNC0xOjIuMCBldGgwOiByZWdpc3RlciAnY2RjX25jbScgYXQgdXNiLXhoY2kt
aGNkLjIuYXV0by0xLCBDREMgTkNNIChOTyBaTFApLCBhMDpjZTpjODpiYTphOTo0NCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gWyAgMzI0LjEwMzM5Nl0gY2RjX25jbSA0LTE6
Mi4wIGVudTFjMjogcmVuYW1lZCBmcm9tIGV0aDAgDQo+IA0KPiBWZXJ5IHN0cmFuZ2UgdGhlIHBs
dWcgY3ljbGUgc2VlbXMgdG8gZml4IHRoZSBjb250cm9sbGVyIHJlbGlhYmx5LiBBbHNvIHRvIG5v
dGUgdGhhdCBpdCBoYXBwZW5zIHRvIGV2ZXJ5IDMuMCBkZXZpY2UgSSBoYXZlIHRlc3RlZC4gSSBo
YXZlIGEgY2hhbmdlIG9yZGVyIGZvciBvdXIgbmV4dCBib2FyZCByZXZpc2lvbiB0byB0b2dnbGUg
dGhlIFZCVVMgd2l0aCBhIEdQSU8sIGJ1dCBub3QgYW4gaWRlYWwgc29sdXRpb24uDQo+IA0KPiBJ
IGtub3cgVVNCIGFuZCB0aGVzZSBjb250cm9sbGVycyBhcmUgZXh0cmVtZWx5IGNvbXBsZXggc28g
SSBhcHByZWNpYXRlIHlvdXIgdGltZSBhbmQgZXhwZXJ0aXNlLg0KPiANCj4gTGV0IG1lIGtub3cg
aWYgeW91IGNhbiB0aGluayBvZiBhbnkgb3RoZXIgcmVnaXN0ZXJzL2V4cGVyaW1lbnRzIHdlIGNh
biB0cnkuDQo+IA0KDQpUaGFua3MgZm9yIHRoZSBleHBlcmltZW50cy4gDQoNCk9rLCB0aGlzIGlz
IG9kZC4gSXQncyBub3Qgd2hhdCBJIHRob3VnaHQuIElmIHRoZSB1c2IzIHBvcnQgZGV0ZWN0aW9u
DQpmYWlscyBhIGZldyB0aW1lcywgdGhlbiBpdCBzaG91bGQgZmFsbGJhY2sgdG8gdXNiMiBjb25u
ZWN0aW9uLg0KDQpMZXQncyBjaGVjayB0aGUgcG9ydHNjOg0KIyBjYXQgL3N5cy9rZXJuZWwvZGVi
dWcvdXNiL3hoY2kvPHlvdXJfY29udHJvbGxlcj4vcG9ydHMvKiovKg0KDQpBbHNvLCBjYW4geW91
IGFkZCB0aGlzIHRvIHRoZSBrZXJuZWwgY21kbGluZSB0byBjYXB0dXJlIHRoZSB4aGNpDQp0cmFj
ZXBvaW50czoNCg0KInhoY2lfaGNkLmR5bmRiZz0rcCB0cmFjZV9ldmVudD14aGNpLWhjZCB0cmFj
ZV9idWZfc2l6ZT0zME0iDQoNCiMgY2F0IC9zeXMva2VybmVsL2RlYnVnL3RyYWNpbmcvdHJhY2Ug
PiB0cmFjZXBvaW50cy5sb2cNCg0KVGhhbmtzLA0KVGhpbmg=

