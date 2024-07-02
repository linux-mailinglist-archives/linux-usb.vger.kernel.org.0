Return-Path: <linux-usb+bounces-11824-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B31D791EBC2
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 02:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67761284CC7
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 00:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6D93209;
	Tue,  2 Jul 2024 00:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UsdnzFI1";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ja5RXls5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZpDRUHrv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343581C3D
	for <linux-usb@vger.kernel.org>; Tue,  2 Jul 2024 00:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719879565; cv=fail; b=rXxEpZcuIY5FlwUsDSVl1QOxM9hdsiWL0KeBA3bXbJTgNrwN7M1Nm65Ry7Njhej5DDNAclC31YeaB4h14sJGuVG5o+rv/oqk0hgSNm2sHCCWxG9+77dmZTtMguWCFStnU1qEOTOAe1kWU5+Dockb4Sdo7yPIL7B6+wbewSx44hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719879565; c=relaxed/simple;
	bh=ukPs9sTgqf0cmiqB0S4+oEpjqxpGrKvBgcwi0A5R9KQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VJwKC/88Gzpx/4j+4qCeH0ze8JHsjuxZqAIvoJBfbBD9hqi8W05Af6L49x5mWN+nEW926bx/PolmSm8vBxO/Wg8kmaKE1JPaXWbfWVXoIeyMfITSapK2wpzQbCseZp7R3CPGRgRHbVYopy5wOrC93/zAxxE5K8yE3I1pPpeZ8v0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UsdnzFI1; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ja5RXls5; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZpDRUHrv reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461JDid0032758;
	Mon, 1 Jul 2024 17:19:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfptdkimsnps; bh=b8tnW5E2qYMVCl0ZAoN
	8AKmPfw4tcRMKFaO29eWltlw=; b=UsdnzFI1wy5sAq8WSNxeICxAR/2surGDDsE
	T5JUi+6tqAlAX9svQVntWhy+nnVeMuGLKPUfIBEeOaPyMZMruLy79xPXasEkqqTI
	EktKxb1N4uXwFcgAIq4QkRarrMoJEDo36LjDXOoUxpfIKT3/5wPI1UkuyZ6r90JP
	Sh2JoSd5CFutcvud3fJLTTLtiBemVtiy+YzXfa/TcpcYnDbamJAyx5209STagleQ
	uHxjRXT4Is/Jb5GKUMy56kiL2y+UtXZgwWVwGTBdsedK8BH74OywAClRsAAuVu9j
	27tyUDL/AUx0xzAWh1YN65p8/6F6J98z/h2h/i5+qkDZc6PF57A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 402hh4854g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 17:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1719879560; bh=ukPs9sTgqf0cmiqB0S4+oEpjqxpGrKvBgcwi0A5R9KQ=;
	h=From:To:CC:Subject:Date:From;
	b=Ja5RXls5usmeNmIdfZQUNSSFE3/dBomPWbo3G19GOpG0NiMJIu8YfPuMv6zznHwqf
	 JBxero+drVtaVcGy5BC38uqqGr0wCvew5cXpIGuD1KKK3JbPpIvwfP8TDesaXExpQ7
	 /sazgyUbZt7cJVCdpfdUfg//yGEIGIDjORTTzjTg/2LvFllDnjh35RJVasLkpFccBU
	 1m4SmsVBNTJNz80EJGPpKhpDYojmdwhdvElJTDGjdb8fsermpmDHSR65AjApxtiO2d
	 PPrc/qk2d5MVnMOSczPCzAcMqLpbYvD7a3lv58VYrIEzeTXFtUezVV0g+C/muj6dGS
	 g/eQ6ERjsR7WA==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 617AC40467;
	Tue,  2 Jul 2024 00:19:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id EC4BAA0263;
	Tue,  2 Jul 2024 00:19:19 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZpDRUHrv;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7B9BC4052E;
	Tue,  2 Jul 2024 00:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXVcu9BJVrntDMWrY45lGBuzk+suhJnetD4FCab0xKqu75PkkVv82bZWNqwMxeOwUe0HtzZT8S9pCBm/WVbbIU6govxlJarCWEMqqnKny1APU6fk5Czg6zQreutBtpvOqY5nUstYOXuxSeIYGqa6YfjzF1Cw15kOikuHZtj8z+9eSFyzWDIw80pUulyWShfH/6u+iBdAntLWr5R3uKOpiAZnua5SohyOVCUTbwD2KFL/F1JLrawLLcYajaX7ciWYbtxmB2udLsMnB7qWHWJygxwAbEkTuZU0B/8/eSPjdOQF9JjrNy9XQdcG8x7xxxff3+/nZvVjxQLKT13ESbLAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8tnW5E2qYMVCl0ZAoN8AKmPfw4tcRMKFaO29eWltlw=;
 b=FwI6+XJj52xE2RXZc7tZ/6k79JPyMj5InhwY8X6ANubYMkuTY0il8K3gVphxLwL0vxdX4lbEhBoUb/Vah8jd2BXu6fih+5Qo5TZSuFeH7IP5QogOdF9McEXdpBRsT8OPqwDScWOYEOV9wMAlO0KmlnVNnKcn8lPXUPtxltMxSq52+DDj21yuAV/ObcuWKtIumUIN0LyQOds9sASe0WYQZkhfktbiDJ36MOYNthIPAFDnptSIoZfpV/lXYJZIYKQSzVfPtbSezdIbW7nn9L//42shkl+kHI3jIqsCZi5f7b9zNaARGXCFxRn3fJWWTvZOKc52z6iqSoq9t+kwSTRdHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8tnW5E2qYMVCl0ZAoN8AKmPfw4tcRMKFaO29eWltlw=;
 b=ZpDRUHrvjdVk18bf81kmCugyRxHF5p6nPlltgLysg/5jCfyEr9vIaLPqu80eaZ98ms8EXJQ4maxAJhNCltie1xhEm1AgrnaOGlkM4CHxQmlEI1YWMsWyvXwgsD6+rUDM26z3tgocy/6RVct81NiJ2dPra8ddiaE7FPdBbrcr9VQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 00:19:15 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 00:19:14 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: dwc3: core: Check all ports when set phy suspend
Thread-Topic: [PATCH] usb: dwc3: core: Check all ports when set phy suspend
Thread-Index: AQHazBV4ZRKCdTf3IUyfwotnfJONvA==
Date: Tue, 2 Jul 2024 00:19:14 +0000
Message-ID: 
 <31e18192c607dff0a7e5ca139dd5737d2224122a.1719879346.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB7236:EE_
x-ms-office365-filtering-correlation-id: c97244f0-4b81-462e-4a9c-08dc9a2c9ad9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?hP/LsI3ZoEs1S5vuSqNOFcfdrLoe911bzaDqFuRPOMkcphudwc6QrMtGBU?=
 =?iso-8859-1?Q?DbIMu41OuRmGAUK8wH2TfmhZ2WHiqHIUzky+1La7g1E9ZrWW2Cpg5XT2U3?=
 =?iso-8859-1?Q?bISK1cjdXGViOHezLcsJxBQtGgIwlUWf6VBFxDjYlqLEpT9LdmcuTWCFD8?=
 =?iso-8859-1?Q?y9PazeA3NtmvLVm2Kb0vJGbgza+fPUYSgqU8odV55UgrQ4NJqqc302dNZt?=
 =?iso-8859-1?Q?q8yCwMaNO7VYGFXZTN2YE9X7mXgrWlJwgnRE3lhscaRDMFUZW6yUkZyr+b?=
 =?iso-8859-1?Q?wXPeUkTLwdkA3z8BIZIGCbbvnQQCsVUF4fcdLz+2ep41t+Ez+dPV5W8Su3?=
 =?iso-8859-1?Q?qX1HaZagF7fNcZyQEMK6oMwnHJ5NIpSOiwCLdkmYlv83EnooZWU0behkFA?=
 =?iso-8859-1?Q?e2A3dwRr5pBl8hwv6GprPfNzbAYBejqW5CscNg/zDWaLVpLwATH1L7b/Gc?=
 =?iso-8859-1?Q?hLyIchmcv5WtAaXW/sNEjkRCGSG9vwk/ZmI5eLqbrWeRzI4E3ylLWSrxjM?=
 =?iso-8859-1?Q?X6wiRegHwxXZWY3VCUu8zdFusrGDdegTwBMYN679vO3nNulUYrLBAg8jM4?=
 =?iso-8859-1?Q?+nCJlpC8fRdBdtm2HjSisQndlC2XHlwEA/TX5U5PU1jrXd7QtLUb7Bu+Dn?=
 =?iso-8859-1?Q?LLcc6llXtcfrOXkHgPbRSpP/Al1lFZYI/8SqlpFX4D4XF0354VSx5024lU?=
 =?iso-8859-1?Q?RBsIIjCOytqKX6jJ4FSt+4DxQ3hfuKlXQF1e4fjoqTkilL+Poa7aUy/pUe?=
 =?iso-8859-1?Q?AUetrZxoi6zC4IkRL/yLkCA4mpnwcZGsGqUe/7A1Or3XvBo5Hj38wp91KK?=
 =?iso-8859-1?Q?pRILRtRdEPBRK6o6Ub4VsctxNeZaVXKJwqQP1GkuIshRD3q6FqwdjLhYYD?=
 =?iso-8859-1?Q?IxetY5O1iHXI3N62p1JD4WMU/NwCbMFzzLinyagN47e44DMHDmSwlUqWRg?=
 =?iso-8859-1?Q?5h0MKDGFpczPwZYS/0B+P7S5ySXqedipramagDgoRsDbC/EzSbEx/MQyi0?=
 =?iso-8859-1?Q?rrk6BLSIZe3hXLgeQ/CfRBulfVyJ4bjK6WDPoyqQaEo0qhsohK9EARJelr?=
 =?iso-8859-1?Q?Uaub8abPz+idccbbw+3HhQg++BfMJKcPtbuGwIU+cjp7iqxLe6TFAbS5HF?=
 =?iso-8859-1?Q?j+JG/7SnjQMep+IQIqGBDaDmTlKyURkm1keqszNyON1GH4yq5nc959hoHQ?=
 =?iso-8859-1?Q?qgaUvHSFaMJke1vwobj+9rpvKjf/l+AS5HSRv3s+j/UBMPdEim2PLGOXqj?=
 =?iso-8859-1?Q?fDaFkOKvO3JGMvOdBiO48ovSMSbaQbBpEpROa4zmp1Y+n488upXHjBW0ql?=
 =?iso-8859-1?Q?xZwDXPVA9u3FanjuHACm9fkkLquVGnpFKLivqEVDTbyy9eW8fF7pGhSdfY?=
 =?iso-8859-1?Q?ic8dZ4viwRM6uU+IGhgVQhsEDL1rBHM3JMU9mylBIl7FlVuf5IaYG70Kkf?=
 =?iso-8859-1?Q?Ck1OPgEAUKmhXb2bIYT7kdYF4PhteEdWbefB0Q=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?1Mnn8FGOS27rL0iMsjl/s9wEXgvvpatSHPJK0qdaMX69cJYjbW90E+4cVY?=
 =?iso-8859-1?Q?ABLimwAylylErc7mg+nuA5y1ftq1h+nWXKlXZrpsWTJ/E1jsZDMcPVMxBX?=
 =?iso-8859-1?Q?UPbNuqHuYDgzKLau0OMxseSfDHJt7y4jqpHq2AOPLIA5tom7T3xrIHHZzI?=
 =?iso-8859-1?Q?3Y6n3ItF3qoWE8scgLT/zy0i+GECItRfOt9IIFMiKBReV43izFJyplv2oM?=
 =?iso-8859-1?Q?Vdn6DYb885eLmU4l+QPEUwFvgXcLJLystUxqvVzOy9JP0J54jdHDV/X303?=
 =?iso-8859-1?Q?OUdjeSu9jK/6hvCvpTydOgB6xICKkhXp6QRQYFqMYVtXoo1mY4hLoVjDUJ?=
 =?iso-8859-1?Q?/JJO+Of/nydvQoYGO4FszerCNMNadqtQBEY3rImLxFlD1NREF9SbEoETem?=
 =?iso-8859-1?Q?pvAt8PV/xGDICmAv/sHfyNfiKw4yKDLQuelGLX9p4olFB7TW6TO27VRCbH?=
 =?iso-8859-1?Q?+MwHlbVrRmCWrg+R+w1FsBrzIIQiHQEYT7ofDDMm+JB7Ecmn2T9Ib98i/e?=
 =?iso-8859-1?Q?U+NSA7sdwk+/bSei5t0aeW6Hb7WU3UJKECoMm+QOpVlNfES5l1nHoZaQPV?=
 =?iso-8859-1?Q?F8ceQdsUF+VihZ+aecNvQC0HI/wRbKulKtptgB1dRtPfQJSTlkwym/nd+F?=
 =?iso-8859-1?Q?gxB48MPf+NqRcSEIy7iTOiVjkkQwOKmJ3fcDvPHl/Uc/Mx3GOf/Xc5lVoc?=
 =?iso-8859-1?Q?vifBwZ+C0tWfKLxx9WGr8AwbOL40jFIFDIKeGNkcVsqaq+wRcMFQjkh1+F?=
 =?iso-8859-1?Q?85MooGpZjhXZBziwGzm6XT4b1ls2wZYlu7sOlF2BYPTEvfhLdZQSp5XY4a?=
 =?iso-8859-1?Q?p9QZWbjVEkkGTWHJT7FNqtAWRCBR1f73zncpg/z6qave4s7ww6gkSDEx3G?=
 =?iso-8859-1?Q?qYSTVj93yqqbFA1f8ueddYGwEJbd6+o9AGPxbQzUbQYYcrZLuXOqN/JFR8?=
 =?iso-8859-1?Q?wFlTn6YbPcAmH7wagYXciiikiqG0wykY/mcpFcbaN26vxkpDkOeDeKAd3I?=
 =?iso-8859-1?Q?khl42159K+fDNpOHI5XF2uO9wfnnH0pax9Vpvuu3IxVAADUQH14sWx0DGp?=
 =?iso-8859-1?Q?oOyhUTph7uP6zUgxGs4FyKjKNzXaxeefi2/exu5enPufBF1pL2kEucOnIK?=
 =?iso-8859-1?Q?tRyGLifXgOB4cQ8uuSuZN+nLGrYsE1G9EGWP+6vWTF4M7UmNmlHgFeZo6R?=
 =?iso-8859-1?Q?1cpcGRTTWmby6PSBOtACqK+WX/CBUTkQtx1kz7LD8Ee9qOi0hgHlEXo4U8?=
 =?iso-8859-1?Q?FxO1+wEkvWEr39Aq/ff8WhvCmhk9cg7nAwK31TzBWzoIk0oX3N1iNRxRmm?=
 =?iso-8859-1?Q?/3j+MnNBdL99IURFWQ9QNmXfo4rLo3gUtaLAouNzCJXX1E1yFULMp0OMwp?=
 =?iso-8859-1?Q?SUio2qpuJxG2LZ70HYpS4iVlYMAT4EPiqoXUgI54P54lef+mo5Yt9Xv8ok?=
 =?iso-8859-1?Q?avaeh4yr0I6TFg7xgbl2oeRD2Fa4wUgJHdi3fv2/sdWoeyKuLEx6dytV8E?=
 =?iso-8859-1?Q?nWQOGfjXtog+rtvbP1mc3cFlPLK7kKJDob0FlX4ZMvUcJ7vt7qrhK3tYyG?=
 =?iso-8859-1?Q?eRtLfx427e8zkDmaFAJQDWHg0U/cqgQqoav3ZpMNfIYZKWM95BAn5VZTUl?=
 =?iso-8859-1?Q?8lC5UWtvK7feUjvTQnzXYSEVl7BVHGX16Y?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	KVZm1Kb646/gwDZooSLT5ysk7hIIoT59i98PsMB1eiZRRDdM4iVQBA1tCa2raESc+mtdqbGerL1WFLTi3xUimtpTFHUw8okOxJNU3X3bNQesW9weiVw2pZApwZrBpvkCmvflFsQ/kQbFTgSr6Z1KmkNh54QvYPJWeRLYsMCXrtGswAWhfVZjuaYXEL/ovoKvl8t8b2uTaiz8trGt3hFHzE6LbAzOCuJGpNn5VQReIqbDyYw5gaRvvmaQrPo8YI7yQSwCpWWGeBHVm8ZDSmxeaNzsIHKVmExb0HgB02NzWC3NmeKFky0wXroKENbBfx9jTG9l/BrfWljpLO/zqCMifVVLII0fbYMSNZvAkcXLE/hCaWH2KW/cLFvnn3Vwzq0AUig2dYUsKlSj0NSOA9sKZ2B+n+pQg+QZgm2l7RI+3FrKKN5FltgOecX63AkZv+EodM8WSs2dhEDvH1i2FEr+M+N5MwvE+pfXl+hQd9sQealARKOMKzweKZY/GsVFtDo5rc/zKQV2Oyzt8UyzGRhZ4OBycwxZrL5ve75Cf0nV4AhKLtHDK9aqZJ49xgVRPQDk0aZSUyAxvb27ei8WxLzXi9R+DKm9XyVj+64PgKC11rUKI0FxL1xbzhN3XCsFKuY5lk1FAwgybaMrwZWnt4/Yjg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c97244f0-4b81-462e-4a9c-08dc9a2c9ad9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 00:19:14.6391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F+8rOh3oaXpPF6d0kdNYGvlPx6knvGbkHcakB5Mol6b2FTJoEuHV+ymlM93VuMt2owQ4Rf7ESYU4O0MM4yiBxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236
X-Proofpoint-ORIG-GUID: mADGuyU9d3GhQVpl0OtjU5Wi0-81uNkD
X-Proofpoint-GUID: mADGuyU9d3GhQVpl0OtjU5Wi0-81uNkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_22,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxlogscore=875
 malwarescore=0 phishscore=0 suspectscore=0 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407020000

The dwc3_enable_susphy() applies to all available ports. After the
introduction of multi-port in dwc3, we now know the number of ports. Go
through the phy suspend registers of each port to enable/disable phy
suspend in dwc3_enable_susphy().

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index cb82557678dd..ea6b1613152f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -108,22 +108,27 @@ static int dwc3_get_dr_mode(struct dwc3 *dwc)
 void dwc3_enable_susphy(struct dwc3 *dwc, bool enable)
 {
 	u32 reg;
+	int i;
=20
-	reg =3D dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0));
-	if (enable && !dwc->dis_u3_susphy_quirk)
-		reg |=3D DWC3_GUSB3PIPECTL_SUSPHY;
-	else
-		reg &=3D ~DWC3_GUSB3PIPECTL_SUSPHY;
+	for (i =3D 0; i < dwc->num_usb3_ports; i++) {
+		reg =3D dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(i));
+		if (enable && !dwc->dis_u3_susphy_quirk)
+			reg |=3D DWC3_GUSB3PIPECTL_SUSPHY;
+		else
+			reg &=3D ~DWC3_GUSB3PIPECTL_SUSPHY;
=20
-	dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(0), reg);
+		dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(i), reg);
+	}
=20
-	reg =3D dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
-	if (enable && !dwc->dis_u2_susphy_quirk)
-		reg |=3D DWC3_GUSB2PHYCFG_SUSPHY;
-	else
-		reg &=3D ~DWC3_GUSB2PHYCFG_SUSPHY;
+	for (i =3D 0; i < dwc->num_usb2_ports; i++) {
+		reg =3D dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(i));
+		if (enable && !dwc->dis_u2_susphy_quirk)
+			reg |=3D DWC3_GUSB2PHYCFG_SUSPHY;
+		else
+			reg &=3D ~DWC3_GUSB2PHYCFG_SUSPHY;
=20
-	dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), reg);
+		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(i), reg);
+	}
 }
=20
 void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode)

base-commit: f7697db8b1b3e80d8cd5af071a5af42c8b445fc4
--=20
2.28.0

