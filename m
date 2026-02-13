Return-Path: <linux-usb+bounces-33349-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBh6K/K1j2mpSwEAu9opvQ
	(envelope-from <linux-usb+bounces-33349-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 00:38:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0B313A036
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 00:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 780D7300825A
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 23:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F11533D507;
	Fri, 13 Feb 2026 23:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Na9aa1ot";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="O/AxsDHc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tuAXXTLS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C060E330331;
	Fri, 13 Feb 2026 23:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771025903; cv=fail; b=lJgi3LZdIxW9P1xpbI8IIw4lJ5pyKrntOILQaxNRB/z/qDxN4sjjouVVa5mOKfh+w8Mx9n2Bm2CoVS49IHD3FHZV5NkM7dul+wAUhQFg0IMVPOV2HIXBts/BDSHN9rru2TIGTPdY2NHJsvNhGVHDlsdmo0vh7OdVb+FxxTWMdiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771025903; c=relaxed/simple;
	bh=nxk6b1+1C5nxQFCKz6hAX+4mRHIVeDaoWah8SSfK6ck=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DPJsIvTU55l19XGQ7kn5Jfe9PlTLlPFUq2Y+pN9/xs1Jqx58ztjhRMMD7toeDTwFs3I5ncAagZ9CAtOFE/0IvRq1NfLtnN1h4NYzas5Td+YqQyXO0RMHvESXR3auh1nqk9u1UnjXN1Df8JG43Vrm5vjR6kGTgHl8HnF5CCB6H9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Na9aa1ot; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=O/AxsDHc; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tuAXXTLS reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DLB1Bs501893;
	Fri, 13 Feb 2026 15:37:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=nxk6b1+1C5nxQFCKz6hAX+4mRHIVeDaoWah8SSfK6ck=; b=
	Na9aa1otOp8VRryAXMPBRjtK5iqWvOf00ks5KAokiMz1r9XDbNh2ktNls0MCoxRE
	u+nxOHKJKFlZhRHpbmWbxnn6SfubMYqmSbCvfofH6PrH7uIVfgC4GzDjKdyvZKHs
	s++1ka9ebffDLNQUtj/TLbLOoHEaVpnIfujULyZBeNtuV+wzVm7fY4ccCRpZkIVY
	Lo6l5tovgTAnZCkZw1+eDwxtRP9wCA8z0o4tz7iLLHKzE6ZU+JZHxdVufmUfhCIP
	GB2Qjn2Ra9VfTaPxszC7BxIi4Y2yQ1yj3YQDw4vOGAMXadxbGF8KnTAanK6DBTNT
	UhSOKsr23QojYSqNQxPJ9A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4c9tg7w9br-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 15:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1771025867; bh=nxk6b1+1C5nxQFCKz6hAX+4mRHIVeDaoWah8SSfK6ck=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=O/AxsDHc5XmwAeEbEpdmA6FOicwsjgL+SV59AhEAyAS5vmVS+ncDnuQ89P23PVG/i
	 2LA8GjM8FIgzkTswq105NyOlhz8m6XfHncuQxKFB+JTB0M129YJpi0v/uW3N3tpUhZ
	 lEHThBjVk+CXWZ2YhWZgIog849cizeO6/1HUy5I7xeMLvGSgmVuE+CZaposr2Zzy1l
	 j9NGyP8YMrLcZh7ksEWnkDigtiQW+/8kCpqReMLsVOM7DcoecuPiDC2n5iX1yhnmeJ
	 wccZXy7uEsafgx9lEH+qlaK54MX+FpDZg5M8nu3Pi6afDpl3nlXJVQAD40IfzwKW4q
	 p9iK1FalLAvRA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9C95F40237;
	Fri, 13 Feb 2026 23:37:45 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E429DA0070;
	Fri, 13 Feb 2026 23:37:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=tuAXXTLS;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00401.outbound.protection.outlook.com [40.93.13.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D400F4021B;
	Fri, 13 Feb 2026 23:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klYbU04R5IKXbgNnIGxFWY0+n8bhsHl6QP62LN97UEVXYaTlMk7FR6v4YFFEjo9zMO0gjj9TAJA0aNFfme3N14aBGHvyJ0W0C7XzUTRUAPWb3n9dp/33YWKv3CGtvjlWc19s1igMYd27eK0rojyV250P5AGD3kFUzFQFdLet/S3BxJjNuntUOm7g2KbCORfW4/kl4lldUFiR/ft3K6EwYxJAA7pkyIrwtBnSfPikgASq2kp69CuXF8Im2xPJMoqt94Iu4fjNO2zz5o7IL11kjg/Sb2FRhWc/hFPraIE3aRAu5uYauJzDbwUTpKZ9+K9urnfYLlbxSW/QaylCyjHDoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxk6b1+1C5nxQFCKz6hAX+4mRHIVeDaoWah8SSfK6ck=;
 b=sBuOqRvL7j8ZltGfyMDa6nh2pzdza4DgtEha3JS+w3lAHWnShbqwT5bAGtioHeRP3wS4yWV0EGsIOBHZRlF6nY+iqiOa85x8xae4hSGlkKtJlcadwRPlPRBh5JjX3zHHZRmfl2marO1NGMiFU3OYQ8rJf5W0b98RZPw8s2RYBtAY8JB18lW8bQvAxEs7ZEb0FYay9US1DRit2G7hNKxbcP6HZA1BSeTBWLVfDQaDnTbhruJcKXfHKjFgruB4mXqQmne5k7gg6YYEyJe/E2NsMHwxYOe943qom1ABaRiQFIqB9fY8Hza0nsQF4B3rrk3c3KC0UE/0VGWX12o06kJs7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxk6b1+1C5nxQFCKz6hAX+4mRHIVeDaoWah8SSfK6ck=;
 b=tuAXXTLSU9tORmOp37Cj/WC17hKPpsEgtegnm17Ck/ao+eDfYDV9qGaNWbpr74l4GOE+8kVqgUMavpu+Ld8pwIl28hygK+Xqt85ukdlptDupkLkadxXYLd6uCzCGkyKCONw+eeG4+7qSKhw2KJvrIus1J1JtJ/+wGfemPQOfXz0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB7701.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 23:37:38 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9542.009; Fri, 13 Feb 2026
 23:37:37 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v5 2/3] usb: dwc3: add needs_full_reinit flag
Thread-Topic: [PATCH v5 2/3] usb: dwc3: add needs_full_reinit flag
Thread-Index: AQHcnAN0fOv4NwekTUmssMF+6O8T/rWBS2QA
Date: Fri, 13 Feb 2026 23:37:37 +0000
Message-ID: <20260213233726.kzbw34ctdu3lfmxi@synopsys.com>
References:
 <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-0-ff04a75ce221@nxp.com>
 <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-2-ff04a75ce221@nxp.com>
In-Reply-To:
 <20260212-add-flatten-dts-based-dwc3-imx-driver-v5-2-ff04a75ce221@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB7701:EE_
x-ms-office365-filtering-correlation-id: 4aeeee99-ec7c-4428-7cbb-08de6b58df07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?YkJ0a1RpNWRkNFNja3laZTZFUGlqSVBNTlJFT0J6NU03N2ovQU01SER2bkNr?=
 =?utf-8?B?YXB2R1VuRWFZNHpUNk1vOW4vVzd2QkJNVGhUejh2RnRUS0RSRUdzblRvQ0lB?=
 =?utf-8?B?cjZ4SnZsRzJvdUhNQ1FDME1zTVVlbGtwRmRhTVIvaTQ5RmI5cDZZSTB3Y3JP?=
 =?utf-8?B?NSt4aVFJS2FCMDN1YzBEVitLWE1VRWF2S09nZnJJd00va0xiQVh6VEcyZ0g2?=
 =?utf-8?B?QnZHTDdOQisvYXpVSmZJbUhDeTNnSWJwQzlIQUw3eEhXZnpOL1hoZlFIRW9S?=
 =?utf-8?B?ZlBqZ1UwUXJIbVY5aTVCd1cvQ2VNWHM2bHcxZG5UV09MVC9qY1RpU3lrdm5B?=
 =?utf-8?B?eTVZd0YvMGxFdEo0YlBiNTZhaExTOEtzV09Rc2kvSEZJTE1BUUxjbjBGNVhv?=
 =?utf-8?B?dUF0NEZZWisrYUhiZy93WXlNRDg0bllnSlFja0hEZjhvWUVmU1FKR0RWN1Zt?=
 =?utf-8?B?ekh4Qy9lcXhuSlNZV09MenF0UTY1ejVjRVN4VWh2cHJTcG8wZVN1bG5KOVBT?=
 =?utf-8?B?SFJvNzZUSnViVzRxNDBwNzhlTjIvNnhMbzlBaHliYUtUN0dTeGZBQlE2WEps?=
 =?utf-8?B?L21mZFp2Uk5SMlhRYWUrSXZHNVhHa293cFo2cGZvU3hYTjlmM1NVMG9lS3lR?=
 =?utf-8?B?bU92UEQ3eHJ4TUFMVnAzWENZdnBLN2Vjd2RwVW1SRmliWERwOSsyZzM0M2t5?=
 =?utf-8?B?SlpCaTVwNmoxMGVqMXNCWVdqVHBMeEF2b21OK3Vnb2FIcXdjWVpaZ3dtaDBi?=
 =?utf-8?B?eDJHd2FlVVlMNzhPaEVybmFXYjhrYksrUGt6YjFudjVRNmdqWGNpU1dqbllR?=
 =?utf-8?B?ZjB0bktiZTYwZXE0WVVRK1hMbDAvMnNNWnNjWDNSMGp5SS9FTG9sR0xORUpk?=
 =?utf-8?B?QUEvWWZNZSt2QXl1eVBVTlJieXJ3WWVsV0ZWUUsrclpocXovTVRmeTBhTjdi?=
 =?utf-8?B?ZTE0Tk14VzVHRmZrK2ZXNmJDeVc0SGs0SzZycjVreWFKb3dXV1M2VTBMcHZ4?=
 =?utf-8?B?TzhvRlFiOWdOQmJGM3lPazVINHpJVUdyQTJKSWllZUFzNlIrcEZGTVJCRkx5?=
 =?utf-8?B?ekpsLzRaQWl4blQ5WnFhRCtvNFZGM0JtYmV0T2daODVIV0s0dnVXSm5Tb2Ni?=
 =?utf-8?B?Q1pOU0J2UzBEUkpoaWRiL212YzRZdUFMaVVhSVNDTTNFWDF3eTVIeWI3Yzlm?=
 =?utf-8?B?SGJSUXZJRTFLQjBqRG93ZExrZmt1dUhzMVpXTlJHVkVKVXUzdUhVY1F5UDNp?=
 =?utf-8?B?QkVhZ0h4WS9ydGlRcjB0WVFNYUNycWVzZ2Y3Rkc4ZHVnRUZ6VDdOZ3p6MTll?=
 =?utf-8?B?bnQ3Y2R3S0E1ZVFUUi81Yy81QkRiWTNDb251UG4zRzdKMG5zZzR6UFprUkho?=
 =?utf-8?B?L3ZWLzQyVW1UTEdyYmUrcThsdDNjdGh2VXY4Nkt0clU4UzdENFNISkRMakJx?=
 =?utf-8?B?N2g0Umx3OVYvWVVoUDlCb0F2bXVqTGdUL1VyWW9OY05MRnVCQmdrR3lpQklZ?=
 =?utf-8?B?RFQyZittK25BcjlzRTZSdks0dG0xeFVibHd0R3lPL2J1N3NEdUoyRjF0elZj?=
 =?utf-8?B?bHJhVm5DaU56citqN3pkbkU0YkJVemUwY1FuRGVLUW1IOTQyc3J0T0grWSt2?=
 =?utf-8?B?cVgxbUN0RjNRR21VekE2WU9OclBoSTdCcVJ2L1FHTHdFZ3RQTk4zRXJNMExM?=
 =?utf-8?B?b09IUFBRaE1KM0ZzNGROOVpHWXNNVEtKbUhvUVFvWXJieGtOeUhKQWcyM2Na?=
 =?utf-8?B?UnpTRzI1cm44Q2NBejFjM0o1MmNQMm5pM21YMC90ODRjaEFIMVBFZ1dKZ0x3?=
 =?utf-8?B?dXJWWk5mUWtpS0xSaG1DcHV5WFhlbVpKV3dhYVN5R1crM1E3TzY2REZSYzdH?=
 =?utf-8?B?S3dKS2Z4Z2JzWjZLcDJua2ZyRjA0OHJrNnV4OHU4bms1WUlEN3IxbEs1MFJH?=
 =?utf-8?B?OU8ybGoyK082N1pRRlpqaXNVaEsxL3RaL2RRNXRGR1E5WnM2blFUU2JQRmww?=
 =?utf-8?B?WUtIQzIwQ2MwVHlJV3lFK3hVRWFJcDQ1SzlKcmxSdW5XbXdOSkRnWjZGaGFF?=
 =?utf-8?B?NjlRaW9DNndQVzVmTWtnak9ody9ja3RTRlYyOGJ4MllLS0liRzh0ZDVseW15?=
 =?utf-8?B?UGhVZUdXSXE4SzZRaERJV1NaUzRBejJzR3Y0bzhTdFl3c2VsdUY3MFVhR09X?=
 =?utf-8?Q?rRNTYVTL4k1N+Heg+T5EZUo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aW1CRGM3WUh4VXAwanNSSm5CRUdFNWFZaWgwZFF1UnlQRUlYc0IwNjUzQmNL?=
 =?utf-8?B?eGhKRjFvT01zWjF4MEhJWVhyZm9KY0xxeU5Bbno0TUw3VmV3QjNybUM5d1Rw?=
 =?utf-8?B?ZS95YnlMWStBRmhweUxqMWJLcys3ZlMwQVZ1NHBUZzFMaFk5Wk1vK21PeEor?=
 =?utf-8?B?R3lUN05sZHZMY0drNDJORFo5cWdFRThOTE9aVFJnNWlqa2tKTXZXamxHUlFL?=
 =?utf-8?B?SjJ3MDJyTmFyV2hWTU9jdmdvZmtEdzExOVFZbUJUWUw2ZTZsY0NIQ3cxNEsv?=
 =?utf-8?B?S0hsNnZsZElwNFN0MDNCUHpxQjlWL3NIU1drNWVVUVoxZzliUHJ0REx0Q2RM?=
 =?utf-8?B?bFU1L2trYTV6VUhCVHROOGJUMkJaMkVCaUNnbVpBWVRvV0Mya1p6d0l3VU5z?=
 =?utf-8?B?dGI2a2FiWjBCQ0ZMVnBKSnE5aWVnWThkcGcvQmhkR0RBS0tPV1ZkUXNWVEQ4?=
 =?utf-8?B?YXBiY0tGMUcybE92WUlrL21HWGsrcUpwVk83d1RGeklNQ3E5MDV0RHBJd0t2?=
 =?utf-8?B?b1ZGR2VvbC9pb3paMUY2c0lPNnZKNmk4UVZKQ1kyMFc3ZXdoWWQwU2FMellt?=
 =?utf-8?B?Q29oS2hmRmg0OUVYUVNNYkhHb29oaGx2QVRQQmNLTkRWdzllN2RHRDlrdWMy?=
 =?utf-8?B?ckhyVi84Zjlma0Z2UWEwREZibUVlaktMM0NUZkxjZXIydFJ2cEYvY1hRUHND?=
 =?utf-8?B?TzFsR3A3UUx0UGJublZTaTZML1l5VXFYSWw2KzJ0THVYMkxlajdORGJKUU5i?=
 =?utf-8?B?OWRVK3c2MjdXTEFWMCtZYy9Jd0RMM0QvKzZMeSs5OVduYXlIQStNR3VWSUhn?=
 =?utf-8?B?M3R1Q3VHSFpGbE44UDVSd2ROckVVRkh1ZnlSYVZlTzJLZlRFSXJjbHhOYkdM?=
 =?utf-8?B?ZEZCek11OHVoaVBxWTczWC9TSkRXcDBWczE3Y0ZidnZscElCaEJGSlQwU09Q?=
 =?utf-8?B?ckN4SlUrSUFqeFgvQ3E3MXk0VEFqajdrNGFDLzVIbmliWGRWNllROG0xaVRG?=
 =?utf-8?B?akEyZUQyREZjQ0Fhc2xNSWRyQlJ2bEMxdnBCazJFNi80NGdaWFlrc0pQVEh2?=
 =?utf-8?B?WXlvWjhqSUNhQ21kUkhKWTg2Q2RRNnU3RnpIQ1k3UVhpcUxaWmJEd3BQbCtK?=
 =?utf-8?B?dW01Vjl4ME1NcjBOOGxSYURsQ0JOSGkwV2lRd1J3UmhYTEpYNElXYVNZb0Fp?=
 =?utf-8?B?RXlQbDVvUE9zek16a0o5T0FOVllhWVU3bUN5KzFvR3EzVndma3RYeUxrN21z?=
 =?utf-8?B?dHlWelhFeFZwRVZuajg0Zld4QnByNzVVM2w3cG5KZVY5UGpMQmQ4bEUrcU5l?=
 =?utf-8?B?K1gybFBWeUxyODc5MDdJTzdtQ1VUT0dyaHZmd3dUcEJUTStEclBJbDZCamcx?=
 =?utf-8?B?SHF1MDMwdHNuZjZqZ1pJNVNmd0FDSmF1bU9UR1JqUXA5TS93T3lpajBmbXVl?=
 =?utf-8?B?WDc1YkFtYy85dDRDY0xFV0U1NzlBVE1aVEd3SHFjYjJxRUxUUEMzSjdESHlp?=
 =?utf-8?B?NjFxeFBoUGNYbzlZWVBmQmJMSStuNCtnekhJREZHb0pPSkVNbEFoUVR3d0po?=
 =?utf-8?B?TldzVFI0dGNLTjJ2N1Z4Z2MzV1pCazh5a251NGc2NEF4VlV2K2FVV05YVXdl?=
 =?utf-8?B?bklBb04yWVh6emtKay8rc1RiRzYwYkd1MTdtWWJQZG1GSnAwa2VZM2crdFlz?=
 =?utf-8?B?RUl0Z2NVSXpBNXhMVzlsRlZHdXJpY0pabDI5bmc2eldzYUpnOG9RNkZJb0NI?=
 =?utf-8?B?SFJZaDZGTTd2TnpGMHBKdTRKY1dicXorazNGOElXeEZxbUxzS3o3REU3VEZu?=
 =?utf-8?B?RFpZL3VDY2QvcnFSQU1kUU9nS1NMZzlKeE1LTnRYaXFtak9SOUFLajdrbkI2?=
 =?utf-8?B?WnBhdXlWVmtJdjQ3MEFFNkdQbjFWTFhlclYyRzV0MEZnaTNQRG9wNVh0cGJP?=
 =?utf-8?B?U0FBUDlPMEg1SitjSHlUczkxdm5KZU1RbTRpeHlRTWUwVitmOU0vazNrdFVM?=
 =?utf-8?B?bGtiZWY0U3p3M3VaaWVVTDhnUDQvRWhTTzhCelg4UDF4MGg3WGd1YkFzd3Jn?=
 =?utf-8?B?NGwxY2lwbVZUb2ZiTjhtMk5IaWEyVjJudmdvUXFic0Nja3dsemRJdnV0RUxK?=
 =?utf-8?B?UmhYblY0Q2ZUbHhGeGg0NzRlamJoTGVhVWN4a1c4T1BMU01HNlNNeFdsT1V4?=
 =?utf-8?B?OGNKZWUxR3prYXZJUm44WkpZeHNrUGJzWGgva3FTUGQyZTdpN1VlNUlTNElt?=
 =?utf-8?B?TkJ0dVA0MmJ1VzhoVHJUOU8zVDdhZFFRQ0VUU0kvcWJncGZlN3VWdkZvTUxD?=
 =?utf-8?B?WE0xZU5nSUd3WG1OamZZY1FTbXNmWmhzY3dwSXc1dGdha0wyV1lqUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7584C6CDEBBA444FB932D3586180F7F3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dnaIBhcC82/ANP/OJz4CSFQTlFgzX+1pmqKsEwiHnJCe0d6cMufDCHqgBkBHOjBgYhl0z1jD7YBktftvCX5X/TbnwLv5xpvweS4g1bR3oTSWa79DPjY0VxgSJm4D4vWtMBwmKPiX1jpO7dqM4sHAtSbcIRGaF7sCYcMMInyZuihS6WxCr01VMOA3NXlPnAdiZesyMZN1jtVJ7ZNCZCfsRdwtXxNMwGJ3I3fXHt3ygLu5M2leZDbnxxwzyKTYsyf5cUnw+laISOOyG2OyWV9v6gQMUiL0HRoguWSZ+7TwxinWtp9S7+lSu/soYDS7J8B5Lhx3BqqoM34Q8DIR4VTa/8WGpKn5oVNpxdULQn1MZqK8LTItRsgW8a1WMU9i6lZ+hULFclbpuWr1wLWniPfTm3njYbWY1X0e2PV9qddofrrqXy27exnVAb/VolHra5347cd0FJoV38dgTjqRpLAA6kgiRtpXOiPxHhEKaket17cj2vA0z8UYdWRXxmj2naJuNUc+Qben93/1K28bosNClkB43dnGj46PJmJHpknZg2v8RInYqGKCKHG0KTwyD3GXph7mQ8QHKY/mRGYh63OZ3RgVftucYCsO4pR2MJyiYoDwXFDqdIpT6FEUluEBIzUIz2cuHdlcaV94lge32+ZFaQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aeeee99-ec7c-4428-7cbb-08de6b58df07
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 23:37:37.5869
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m7T0jRnjhh2Gq0SqeCMe6k/4E+nqgi2viTZP29tfkhbCEJeRqYGHUJzHYwRp1esPR+Xx6yfBdh65VPoE3kabiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE4MiBTYWx0ZWRfX2WZF7V/bIAGk
 v00vsdPpkT+7cYEZNCfhACOQ+FYqTC/TUvud+GtO2VhUumErIkrwX4uAwQTCsM0vVFqkrgaHzs+
 Q3l+7tvmmDR+ic7rhl7EJ9R/MbSLe6e0qUJCfgxytGQE7/S6LH1Wl0qrrjQuFaxs2DA4z9U2rfk
 lPTFbVfDZX6JQ37DAZyRymuTLcs/0rg7NigJ9jyOmd9z9TSVMo0au1mChA8Cq8WMVscKhoF6UOb
 g5q5LMEMk9hpzzzc+Z4Q3ssRF7Jymet9W1MN2YBheaoG58j0zLnYhSUG9iyFUfI2jfrNtZyT0JG
 pD/rB44yXzaXIhnVqsxi2kimzRy4fHtIJM4qWOfERVhejhmwfjYcmjMy1hEqJtno0go4bx0TOV0
 kcDKYThyztK7pe59CXAl4kv1DeA/GsKRJ0K5jlFx9YAMyadrz/N1ykjHKzFBBInqgyI7kKm8gkK
 Uyk4yUtpGjnI5o+B/rQ==
X-Proofpoint-GUID: E90LNWyJWo97pCYOkap7WIeiI1NrDoC5
X-Authority-Analysis: v=2.4 cv=GrlPO01C c=1 sm=1 tr=0 ts=698fb5cc cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=8AirrxEcAAAA:8 a=jIQo8A4GAAAA:8 a=LcaOKkFFMqj6irO2CjoA:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: E90LNWyJWo97pCYOkap7WIeiI1NrDoC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_05,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602130182
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33349-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2F0B313A036
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMTIsIDIwMjYsIFh1IFlhbmcgd3JvdGU6DQo+IFRoZSBjdXJyZW50IGRlc2ln
biBhc3N1bWVzIHRoYXQgdGhlIGNvbnRyb2xsZXIgcmVtYWlucyBwb3dlcmVkIHdoZW4gd2FrZXVw
DQo+IGlzIGVuYWJsZWQuIEhvd2V2ZXIsIHNvbWUgU29DcyBwcm92aWRlIHdha2V1cCBjYXBhYmls
aXR5IGV2ZW4gd2hlbiB0aGUNCj4gY29udHJvbGxlciBpdHNlbGYgaXMgcG93ZXJlZCBkb3duLCB1
c2luZyBzZXBhcmF0ZSBkZWRpY2F0ZWQgd2FrZXVwIGxvZ2ljLg0KPiBUaGlzIGFsbG93cyBhZGRp
dGlvbmFsIHBvd2VyIHNhdmluZ3MsIGJ1dCByZXF1aXJlcyB0aGUgY29udHJvbGxlciB0byBiZQ0K
PiBmdWxseSByZeKAkWluaXRpYWxpemVkIGFmdGVyIHN5c3RlbSByZXN1bWUuDQo+IA0KPiBUbyBz
dXBwb3J0IHRoZXNlIFNvQ3MsIGludHJvZHVjZSBhIGZsYWcgbmVlZHNfZnVsbF9yZWluaXQgZm9y
IHRoZSBwdXJwb3NlLg0KPiBBbmQgdGhlIGdsdWUgbGF5ZXIgbmVlZHMgdG8gaW5kaWNhdGUgaWYg
dGhlIGNvbnRyb2xsZXIgbmVlZHMgdGhpcyBiZWhhdmlvcg0KPiBieSBzZXR0aW5nIGEgc2FtZSBm
bGFnIG5lZWRzX2Z1bGxfcmVpbml0IGluIGR3YzNfcHJvcGVydGllcy4NCj4gDQo+IFJldmlld2Vk
LWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogWHUgWWFu
ZyA8eHUueWFuZ18yQG54cC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGluIHY1Og0KPiAgLSBubyBj
aGFuZ2VzDQo+IENoYW5nZXMgaW4gdjQ6DQo+ICAtIGFsc28gcmVuYW1lIGNvcmVfbWF5X2xvc2Vf
cG93ZXIgdG8gbmVlZHNfZnVsbF9yZWluaXQNCj4gIC0gYWRkIFItYiB0YWcNCj4gQ2hhbmdlcyBp
biB2MzoNCj4gIC0gbm8gY2hhbmdlcw0KPiBDaGFuZ2VzIGluIHYyOg0KPiAgLSBwdXQgY29yZV9t
YXlfbG9zZV9wb3dlciBpbnRvIGR3YzNfcHJvcGVydGllcyBhbmQgY2hlY2sgaXQgaW4NCj4gICAg
ZHdjM19nZXRfc29mdHdhcmVfcHJvcGVydGllcygpDQo+ICAtIHJlbmFtZSBtYXlfbG9zZV9wb3dl
ciB0byBuZWVkc19mdWxsX3JlaW5pdA0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5j
IHwgOSArKysrKysrLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5oIHwgMyArKysNCj4gIGRy
aXZlcnMvdXNiL2R3YzMvZ2x1ZS5oIHwgMyArKysNCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IGluZGV4IDE2MWE0ZDU4
YjJjZS4uY2FjYzRlYzlmN2NlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
Yw0KPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBAQCAtMTY3NSw2ICsxNjc1LDkg
QEAgc3RhdGljIHZvaWQgZHdjM19nZXRfc29mdHdhcmVfcHJvcGVydGllcyhzdHJ1Y3QgZHdjMyAq
ZHdjLA0KPiAgCXUxNiBnc2J1c2NmZzBfcmVxaW5mbzsNCj4gIAlpbnQgcmV0Ow0KPiAgDQo+ICsJ
aWYgKHByb3BlcnRpZXMtPm5lZWRzX2Z1bGxfcmVpbml0KQ0KPiArCQlkd2MtPm5lZWRzX2Z1bGxf
cmVpbml0ID0gdHJ1ZTsNCj4gKw0KPiAgCWR3Yy0+Z3NidXNjZmcwX3JlcWluZm8gPSBEV0MzX0dT
QlVTQ0ZHMF9SRVFJTkZPX1VOU1BFQ0lGSUVEOw0KPiAgDQo+ICAJaWYgKHByb3BlcnRpZXMtPmdz
YnVzY2ZnMF9yZXFpbmZvICE9DQo+IEBAIC0yNDc5LDcgKzI0ODIsOCBAQCBzdGF0aWMgaW50IGR3
YzNfc3VzcGVuZF9jb21tb24oc3RydWN0IGR3YzMgKmR3YywgcG1fbWVzc2FnZV90IG1zZykNCj4g
IAkJZHdjM19jb3JlX2V4aXQoZHdjKTsNCj4gIAkJYnJlYWs7DQo+ICAJY2FzZSBEV0MzX0dDVExf
UFJUQ0FQX0hPU1Q6DQo+IC0JCWlmICghUE1TR19JU19BVVRPKG1zZykgJiYgIWRldmljZV9tYXlf
d2FrZXVwKGR3Yy0+ZGV2KSkgew0KPiArCQlpZiAoIVBNU0dfSVNfQVVUTyhtc2cpICYmDQo+ICsJ
CSAgICAoIWRldmljZV9tYXlfd2FrZXVwKGR3Yy0+ZGV2KSB8fCBkd2MtPm5lZWRzX2Z1bGxfcmVp
bml0KSkgew0KPiAgCQkJZHdjM19jb3JlX2V4aXQoZHdjKTsNCj4gIAkJCWJyZWFrOw0KPiAgCQl9
DQo+IEBAIC0yNTQyLDcgKzI1NDYsOCBAQCBzdGF0aWMgaW50IGR3YzNfcmVzdW1lX2NvbW1vbihz
dHJ1Y3QgZHdjMyAqZHdjLCBwbV9tZXNzYWdlX3QgbXNnKQ0KPiAgCQlkd2MzX2dhZGdldF9yZXN1
bWUoZHdjKTsNCj4gIAkJYnJlYWs7DQo+ICAJY2FzZSBEV0MzX0dDVExfUFJUQ0FQX0hPU1Q6DQo+
IC0JCWlmICghUE1TR19JU19BVVRPKG1zZykgJiYgIWRldmljZV9tYXlfd2FrZXVwKGR3Yy0+ZGV2
KSkgew0KPiArCQlpZiAoIVBNU0dfSVNfQVVUTyhtc2cpICYmDQo+ICsJCSAgICAoIWRldmljZV9t
YXlfd2FrZXVwKGR3Yy0+ZGV2KSB8fCBkd2MtPm5lZWRzX2Z1bGxfcmVpbml0KSkgew0KPiAgCQkJ
cmV0ID0gZHdjM19jb3JlX2luaXRfZm9yX3Jlc3VtZShkd2MpOw0KPiAgCQkJaWYgKHJldCkNCj4g
IAkJCQlyZXR1cm4gcmV0Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgg
Yi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCBhMzViM2RiMWY5ZjMuLjY3YmNjOGRj
Y2M4OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTExMTksNiArMTExOSw4IEBAIHN0cnVjdCBkd2Mz
X2dsdWVfb3BzIHsNCj4gICAqIEB1c2IzX2xwbV9jYXBhYmxlOiBzZXQgaWYgaGFkcndhcmUgc3Vw
cG9ydHMgTGluayBQb3dlciBNYW5hZ2VtZW50DQo+ICAgKiBAdXNiMl9scG1fZGlzYWJsZTogc2V0
IHRvIGRpc2FibGUgdXNiMiBscG0gZm9yIGhvc3QNCj4gICAqIEB1c2IyX2dhZGdldF9scG1fZGlz
YWJsZTogc2V0IHRvIGRpc2FibGUgdXNiMiBscG0gZm9yIGdhZGdldA0KPiArICogQG5lZWRzX2Z1
bGxfcmVpbml0OiBzZXQgdG8gaW5kaWNhdGUgdGhlIGNvcmUgbWF5IGxvc2UgcG93ZXIgYW5kIG5l
ZWQgZnVsbA0KPiArCQkJaW5pdGlhbGl6YXRpb24gZHVyaW5nIHN5c3RlbSBwbQ0KPiAgICogQGRp
c2FibGVfc2NyYW1ibGVfcXVpcms6IHNldCBpZiB3ZSBlbmFibGUgdGhlIGRpc2FibGUgc2NyYW1i
bGUgcXVpcmsNCj4gICAqIEB1MmV4aXRfbGZwc19xdWlyazogc2V0IGlmIHdlIGVuYWJsZSB1MmV4
aXQgbGZwcyBxdWlyaw0KPiAgICogQHUyc3NfaW5wM19xdWlyazogc2V0IGlmIHdlIGVuYWJsZSBQ
MyBPSyBmb3IgVTIvU1MgSW5hY3RpdmUgcXVpcmsNCj4gQEAgLTEzNzMsNiArMTM3NSw3IEBAIHN0
cnVjdCBkd2MzIHsNCj4gIAl1bnNpZ25lZAkJdXNiM19scG1fY2FwYWJsZToxOw0KPiAgCXVuc2ln
bmVkCQl1c2IyX2xwbV9kaXNhYmxlOjE7DQo+ICAJdW5zaWduZWQJCXVzYjJfZ2FkZ2V0X2xwbV9k
aXNhYmxlOjE7DQo+ICsJdW5zaWduZWQJCW5lZWRzX2Z1bGxfcmVpbml0OjE7DQo+ICANCj4gIAl1
bnNpZ25lZAkJZGlzYWJsZV9zY3JhbWJsZV9xdWlyazoxOw0KPiAgCXVuc2lnbmVkCQl1MmV4aXRf
bGZwc19xdWlyazoxOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nbHVlLmggYi9k
cml2ZXJzL3VzYi9kd2MzL2dsdWUuaA0KPiBpbmRleCBkZjg2ZTE0Y2I3MDYuLmQ3MzhlMTczOWFl
MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nbHVlLmgNCj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy9nbHVlLmgNCj4gQEAgLTEyLDkgKzEyLDEyIEBADQo+ICAvKioNCj4gICAqIGR3
YzNfcHJvcGVydGllczogRFdDMyBjb3JlIHByb3BlcnRpZXMNCj4gICAqIEBnc2J1c2NmZzBfcmVx
aW5mbzogVmFsdWUgdG8gYmUgcHJvZ3JhbW1lZCBpbiB0aGUgR1NCVVNDRkcwLlJFUUlORk8gZmll
bGQNCj4gKyAqIEBuZWVkc19mdWxsX3JlaW5pdDogaW5kaWNhdGUgdGhlIGNvbnRyb2xsZXIgbWF5
IG5vdCByZW1haW4gcG93ZXIgZHVyaW5nIHN5c3RlbQ0KPiArICoJCQlwbSBhbmQgbmVlZCBmdWxs
IGluaXRpYWxpemF0aW9uDQo+ICAgKi8NCj4gIHN0cnVjdCBkd2MzX3Byb3BlcnRpZXMgew0KPiAg
CXUzMiBnc2J1c2NmZzBfcmVxaW5mbzsNCj4gKwl1bnNpZ25lZCBuZWVkc19mdWxsX3JlaW5pdDox
Ow0KPiAgfTsNCj4gIA0KPiAgI2RlZmluZSBEV0MzX0RFRkFVTFRfUFJPUEVSVElFUyAoKHN0cnVj
dCBkd2MzX3Byb3BlcnRpZXMpewkJXA0KPiANCj4gLS0gDQo+IDIuMzQuMQ0KPiANCg0KQWNrZWQt
Ynk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KQlIsDQpUaGlu
aA==

