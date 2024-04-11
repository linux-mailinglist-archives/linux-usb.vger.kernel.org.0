Return-Path: <linux-usb+bounces-9234-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B0F8A04C3
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 02:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CDDDB246B5
	for <lists+linux-usb@lfdr.de>; Thu, 11 Apr 2024 00:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E744D8F6E;
	Thu, 11 Apr 2024 00:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pCkf7PMe";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Tcz4OrYk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qzcqG6X3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDE88F55
	for <linux-usb@vger.kernel.org>; Thu, 11 Apr 2024 00:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712794940; cv=fail; b=jHynZwbOiSYxEzvJHUow482HUFrn0llCTeHR63gGd16/o6DfUaoZCjWLaiK5xsweTHwTrrABavi6Eey/kyMs2kF0K4Vtf3Wwla/VqvXIEQJukrxrNOd29w1f4lOzFtogq3vWTPnNjVf9R/POZvUgQiVY4Q02yEUGL2dNihqlQbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712794940; c=relaxed/simple;
	bh=hi/U880npZqVt36AEhSgpNwWSgAzxOFO3rtG0fgpm6w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OGZ59j3QouqSnWxmYarzYAeL2lhHeEfLmoWHOWHkAYKPBAl1RraEJ6IxbTXm2HOYFD7gmwAuliixCL9FsmcK1cnxFOPaeGMrwvdElm+BiMszRxYJ6e55FcLfiPnFuj0xDoYR1UL9JS6/GPnM9rk788OuVAP+YFhqg7I5VNtlT10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pCkf7PMe; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Tcz4OrYk; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qzcqG6X3 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43AMfRql005551;
	Wed, 10 Apr 2024 17:22:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=hi/U880npZqVt36AEhSgpNwWSgAzxOFO3rtG0fgpm6w=; b=
	pCkf7PMemuqDSn7zrLr371qPH7PYo+S45TA2R1BO5mDAfOHaUrfJig+A9IwyGCHT
	0negIfif0mezNnW815sl1vAUBYX49ZE4rKkdZ6Do7SAutEqk9SyX9Cu2LCWQFelR
	C+IPq0hu3c3QUcxoCx2veW10cqZSX2yDxvoiMftMCTTRuYob5d99FRU71s4Tn2/K
	j0VX/PfEmS/xV8tn+EFCj/BZLftdhTqINlyISgwprsxhlp+XANSeYR6PGjfCjdH2
	RUJfxwaG43sU8wOtSxxZ0Zvw2xxCigMscZVNnWfk8M98ABUzlaWJiowq1OYJh2BX
	e63uFkw8HVbtmVnO9tJaLA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3xb51d63n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 17:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1712794928; bh=hi/U880npZqVt36AEhSgpNwWSgAzxOFO3rtG0fgpm6w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Tcz4OrYkdgBBQxPW6/IisOm59hS48rcs7DHTyeFnp1hJrgXfs4wWhVmLPw9fqaY2x
	 oHmYjc8ae1pA62hmDKwtZsGeNC/kvPH8tpjxdznlieEZo7QLTwp0Dc1vz1+sPd76dz
	 oB14h04lxhH8Or30TBn9iFWfLVdbsXJUZpnj3L5F2WwX25kmWR1/4pvgzDw/Teh6wx
	 rOL8BuaQZKSX3oQ46/OWiu2UDONgnA4F+EDLAxxys83aWFw1rxITw9jzjfiLoRC3jH
	 0frm6xccKt8OULe2C9XQB64qOIsDksFmMIG+Z5TR5z7tuYjSZX8hA5orWm97qw1+Cz
	 C05IGjo1BgUPg==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7DA8440211;
	Thu, 11 Apr 2024 00:22:08 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DB303A007F;
	Thu, 11 Apr 2024 00:22:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qzcqG6X3;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E79644035B;
	Thu, 11 Apr 2024 00:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X81vJKwN3Ua452Rvdoz0UyWRJHgh6HtHm+ZQB1lgDBI8m/2E+urY3r3RUdWToj/cHV3JfMrrNp57XBhLgRWzauDp4zTtoZfRH5ff8AoNZ7ZnAvzJTVI3fKug2Adr9NmSha9UIKNHz17OdodJ46orUi9QyywTf4IjW26DfTtxPCx59vBOpXkWix9OU5QBWn5GSylgYNTXMpmWwxGz2ZlScakjqkUE3O+bmMPpZeukuc4Usx2cab6k4QqQpRH4jafc0D+7vOCj+f+cHKPv45YF53d8RSvYdvr6rsELUbnBbObZATE70G/RrvjGC8bEynLzcQXAkak1KT0KnkX9xs9dYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hi/U880npZqVt36AEhSgpNwWSgAzxOFO3rtG0fgpm6w=;
 b=Ur9fQNKjeqWYwLo8lQDwqt9ZM7bPeEZwn2jiHDH2mLjNngSFrdOlZ1Q11KUBmizMNrtYXdkKrD56lB74FK/q0tNKuE5dIjPWynRZRCz1YAn+mj8s4JICLq+IO9STukuRmBZMNDcQ6do0fFZCVHRUo2MRKw6Y+xJNc9sl0YwyYNmSPmkdFmzEAY5HzZKfe+HV0GMi/BTynl20qJ8vvx9FrCIU8rbAKhQpXpUD6XsCZZgfJpS2Mnteqx0z+vuc13QiLwLD/BEv5lpnJ+yJ5fIvwpbbU2UEsRTgKc49KkpmvOcNPzlbtQCm7Qcj9exoLtp98jm6sHuD2ElBpV3WzG+I/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hi/U880npZqVt36AEhSgpNwWSgAzxOFO3rtG0fgpm6w=;
 b=qzcqG6X3xo9RXhnHwlWnWgkRVIK+elvJTSgho+94vSSOidObSqaq4UYT012U30Q2Wc4UhEoAejLFN5iwTxeUd4uyXp1mvnC8iQqWcFDOh7YEvEbmWEdZFHQsAeCk1Q2Ow9OiniwuNhVZJOQamtulsL6er29zb2E12yNWpKghmjQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SN7PR12MB6690.namprd12.prod.outlook.com (2603:10b6:806:272::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 00:22:02 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c%3]) with mapi id 15.20.7409.042; Thu, 11 Apr 2024
 00:22:01 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Manan Aurora <maurora@google.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH] Revert "usb: dwc3: Support EBC feature of DWC_usb31"
Thread-Topic: [PATCH] Revert "usb: dwc3: Support EBC feature of DWC_usb31"
Thread-Index: AQHaWvbI0vndRAl0XEWVNoceMCPwlLFhevoAgAEbnQA=
Date: Thu, 11 Apr 2024 00:22:01 +0000
Message-ID: <20240411002156.tlyqofiw7erfq7eo@synopsys.com>
References: 
 <3042f847ff904b4dd4e4cf66a1b9df470e63439e.1707441690.git.Thinh.Nguyen@synopsys.com>
 <CAJnM4-xYjmYUa4ePaYG3P8O3CYCWOMJwF=e7D1Pv8vvk6pBtNw@mail.gmail.com>
In-Reply-To: 
 <CAJnM4-xYjmYUa4ePaYG3P8O3CYCWOMJwF=e7D1Pv8vvk6pBtNw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SN7PR12MB6690:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 XEIHH7x6eSxp5um5n9hDxQNr/hid8/ooTzGJT5HORVcyjs7Wub/F0GOoc7uoS28h2SC3Ep62B3b8evwepNAKQLGpT1zVYT4C3x00OJEiYywlp3EJ3Lm2lm82A4yc1RrfvbLxsJBmXwPYb4/Q0yGs/K7neUgwIIcva4YUQMDuDfSBnELQJxBMIsK7s9hfsT4KY+WZqfG3eYO9u/NjefnsOoJkj7OouDUI0GGkY/n88RyB4KoaS00IKltxOhZ9SZTEuKEGFiIPLDvrDQsYiM1zZKRBEjfgO0Cvc/hr/CjU9FGVsF9jKh+MrUp4aDu1F+Px1nov7RUBDcWoZGTS0Sz+XU6PjSmKiI/RkDxWpFRxTGLwZAIAJSfUe6dcdEUgRWwtsI53F1NsKq+v4qN2Jtrpfeu+/RaZOWUyzHGnhy4gMvhuOlm3tcgucs7C3j/uFkQ/330/IF5N0SUW2ZKZM/xqE92Pa9dSCUajgYaO3vhSeFk6nkDaxDL5sEpH+3MsVTeILR3DpK7VkK9k3MJVreA8VDds3IMaAvUdQvlFew44p2UAydUhhi20lkiHY3CO76MXuO3owPA2WZbVfddAK1NfWP0PBJC5sVvCgbgBCZjwj02X2kaHodzvJUVl1rDVQPGMLIW1gUyHcd8pdnsAMKlpMqMNO5hbQ+WyK2GmkMVj8PA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eUJ4WWdhM0ZJZkRLbjhFSjZGSkhLSzgzbzhLclBpU1J0dmNtOXVsVFg2SUhD?=
 =?utf-8?B?NlQ1NHdNM0hQZTZ2a2RIU2xQUVZrakZRWXYxL0wvV3lZRUZTdjJ2TnhnaU1I?=
 =?utf-8?B?NHJjMGNON05nSERhWWIxMW0rSnUvSndiOVRrWnY1TkhCMEh5d1RYbGl3RzVI?=
 =?utf-8?B?ZzVkemZldXpqd01MS1c5bXB2RkQrSldQZWhWYnRvMERyQkg0bGlnOWlzUUxn?=
 =?utf-8?B?dFhSd0VBNjJHS1dYWmxUWFB1R1pYTjJkRGNmSFpENER4bjhaQksySVFFbVNR?=
 =?utf-8?B?d2s3QVhiRW53NTBldTFic2ZiYzBER0ZvcW50aTZBMXpHNU5BZThwelczem9B?=
 =?utf-8?B?MTQ5UXFXaHp0a3VMM01TNW1RU3BsL080cjhWbGEvRjZtTFk2dEpCV3RqK1VF?=
 =?utf-8?B?bzJOVkNiSWVqMnptdk03VDQ4cmJ2dlMwVDFXYkhMUDNGbTZ0dDVMNmlROGVu?=
 =?utf-8?B?Rmh3QjMzVGh2dHYreTJ0endpY2xEUjYvMVoxMjlBaktLWXlZREFUWEM4Snph?=
 =?utf-8?B?OGRXUFcvY2RWL2FxajVLOFlwbWFUUGs5R3lFMGt3Ymp2Vk8xYUpZYWdJcGhH?=
 =?utf-8?B?YVRRK2hXMituc0t6Z0NpK212Vko4dFhxTlJHQjZEWDNLaHNBQTJOZEdVNXN6?=
 =?utf-8?B?eEFpbC9kQi8zcndoS2tjNGtzd1VsVWM1R05NM251WUNqdlZaR0tOMlpRdW5Z?=
 =?utf-8?B?QnV0L3lzOGtXa2oxak1Zb3VDNThCWmc0MytpY1dvTjcvOEhmQkh2NS96L0Qz?=
 =?utf-8?B?VERUMkw3b3ZpV0F5NnFONWFJU1JnZFBSOGY1enYrN1NLaDQ1ZnNmbzIwbG82?=
 =?utf-8?B?QWRDQ3ZieHZKdnRHL2ViKzhWdkh2dlVUQmtHZU8rcDFQNXdyRFQ5RkNVaGF5?=
 =?utf-8?B?cGdJVkE3RkNNT1Jadm5vOU4zZXdIT0FSYVpuVGg0VGRXMWRHSEpoa2Y0N2lL?=
 =?utf-8?B?NWxnSVViUGJLOFNTREFjL1VuQWxhNnN0dm9KREZPWVdLY21sYW96cUZXUVh2?=
 =?utf-8?B?UHdyNlBaNGhodXJLcVBOWjl1YXhYZ2Y5ZnVnNDVFdXBaKzBiZVBHQ1dyV3hD?=
 =?utf-8?B?SUZmdG5YeGozbk9VOXQ1b3MzTmhneHVCVkkxY3l1dWZLUjQ3YldkS3dmMUpk?=
 =?utf-8?B?WWZlUWVISE91T0F2STA4N0pScGFGMWJPejVRMXR1eXVlVldFaUpPdmVIR2FF?=
 =?utf-8?B?L0Q5WmVqMUFac1lnMzUrbkNOZmt4YkZZQjZtakNFKzZNTERQcE04SSt5UGF3?=
 =?utf-8?B?T0d1ektod0sydVNtazZKSkhCWHYwcTFpbEV6NUZUc3VFWVhtOWc4VzZkNUNx?=
 =?utf-8?B?QzlHKzU3cGlCOHhSMWIzWXdDMEYxTVJaUlNiSWJtMGNBZlNjdEM4cytQQmVo?=
 =?utf-8?B?VmhuUno4NlZHMTV2V08zRUdlYlQ3Z2Q1SHkvWUdkZ3V1WFRTQ2Foa2xHQUVJ?=
 =?utf-8?B?NE8xUWc0eXROWEZDQ1h4c0dUOHgwenVEMnlwZjFuSVNGeTNlc2t0bUVjaXF5?=
 =?utf-8?B?cmllN3h6NW9zTlNNa2N3MFA2amdxWG9QMzFCN1FacGVtL1NmU1VjNEM0ZnNQ?=
 =?utf-8?B?cjhHZzRDN1RQd0FCZ0owVW52cTBHSm5Zb01OVi9QTHcvbXROek80c3FDMGd1?=
 =?utf-8?B?RVVIRmVKdng1QXhrVEd5WVdhSGxHaHhyL2tyRVZPSDVlZnhYUXJBa21lWjdp?=
 =?utf-8?B?bndvR0lmWnVjWWd4WVB5OGx2WDc1TStrTVV0Mm1mS2V1RHpYT2dmSG9uekJG?=
 =?utf-8?B?M0FVbnRaRk9zejB6RGxYbWE4bHRhc1RJbkdUM3hiZzhPSDFXVHo0QSs2d2du?=
 =?utf-8?B?TmdRZ20vNk9hSXdFdm9NalFrV0xVZysxQnpUZXRMVlZmbHp6YVkyZExxTzdW?=
 =?utf-8?B?bnJxUmtiVTRmdUhPbWx5V3oxWFBUMCt1NTM1T3E2elo4VW51TjUxalUzVHRX?=
 =?utf-8?B?UGc2a1NaYVNqZ0FtR3dZdUlTTnh4dnMwZ25CL0hJS3krMllsSEpXM1Mvb1Vv?=
 =?utf-8?B?N1Z4VktMRExmQ3RFWHZWcjJxN0s3OTNpdURnL0E2S0xsL0lNczVtQlVyai9E?=
 =?utf-8?B?Y2lXYlBxdlNkbEQvckVNMUppaTFIRXFWNUF6dHpzanNvdVh6Wk5tUXRKRXFN?=
 =?utf-8?Q?cDD63tR/g+DDqfiP9+r9YujqX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A655013F1FFF949B6800BB157C86135@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	k51YmPpvy2Y6t+6ZCEouKfB436mK31ajfRhGJ1QgoAEB6j/xkhuEn9sN3rHHiw+4s9nVjcwGIWbd9S7iVm9m2mTfV+PclXc61xNyyM/11P+VNCawTd6nFxwiQBE0BY95jM/vsuAtmrG09SKNIL4sjofh5JwacDqqcBuw12KgJQrYlKzwXq1yaSqWbqm7qa+bybqqy+dmvw+EAxG+HQHWmCeIksgkbmvqRmlUPxETtvJmQhiBf256XU+dCvJHAdTUQEzKU5NuhuP+AAKRik1LMrzrTWjttMiwPjRWt4z6YhGLGgXR9PU13yR9X+WCBso3PtXz64IqroYJ/4gz48wHn4hXgmVfJWRDBUtwpifB0p3sjmqD9ZETCtKqD0mHdo/x3Bvw7i467swtf1xh4GQ4eZGN7Nq1WFhK7rd0dshFTJHoVKtFkSvdg6oBBUa2k6ulMzXgNthGvmhoPn3ZpXZsdZa2irypHMbAL3yzSaMIih8ZqY14hWC5BKxCN1LC7W+QxTxpdrdFBNRcvkZumm2cv/XU6QRxUKjrN0uK+krtivO/TBJQoHljuEOXevAKPoEWL+e7zkvXof0GTVj24rsvEqO4rAmCm1sQNJFR3PHe/gAMgomMpQLl1Jd+eLns+cXGl9nwlVIQQ7NjW/hAVq8Wcg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fa4509-782d-4a7b-f8bb-08dc59bd6893
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 00:22:01.7719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9IzmLsZDsrqd4aQR4mF15hBT2Xw2k9XEGjEdzxtnbVP8h61LxkjkpE6SBuDr0U+qa2G92kCYNU2/WeJILThiAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6690
X-Proofpoint-GUID: SVJdRKSuYwjhtSRXZvlXUaOlX14541Aq
X-Proofpoint-ORIG-GUID: SVJdRKSuYwjhtSRXZvlXUaOlX14541Aq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 impostorscore=0 clxscore=1011 spamscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110001

DQpPbiBXZWQsIEFwciAxMCwgMjAyNCwgTWFuYW4gQXVyb3JhIHdyb3RlOg0KPiBIaSBUaGluaCwN
Cj4gDQo+IEknbSB3b3JraW5nIG9uIGEgcGF0Y2ggdG8gYnJpbmcgRUJDIHN1cHBvcnQgYmFjaywg
SSBoYWQgYSBkb3VidA0KPiByZWdhcmRpbmcgc29tZSBvZiB0aGUgcmVxdWlyZWQgY29ycmVjdGlv
bnMgdGhvdWdoIChpbmxpbmVkKQ0KPiANCj4gUGxlYXNlIHRha2UgYSBsb29rIGFuZCBhZHZpc2Us
IEknbGwgcHJvY2VlZCBhY2NvcmRpbmdseS4NCj4gDQoNCj4gDQo+IE9uIEZyaSwgRmViIDksIDIw
MjQgYXQgNjo1NeKAr0FNIFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiBUaGlzIHJldmVydHMgY29tbWl0IDM5OGFhOWE3ZTc3Y2YyM2MyYTZm
ODgyZGRkM2RjZDk2ZjIxNzcxZGMuDQo+ID4NCj4gPiBUaGUgdXBkYXRlIHRvIHRoZSBnYWRnZXQg
QVBJIHRvIHN1cHBvcnQgRUJDIGZlYXR1cmUgaXMgaW5jb21wbGV0ZS4gSXQncw0KPiA+IG1pc3Np
bmcgYXQgbGVhc3QgdGhlIGZvbGxvd2luZzoNCj4gPiAgKiBOZXcgdXNhZ2UgZG9jdW1lbnRhdGlv
bg0KPiBJIHdpbGwgYWRkcmVzcyB0aGlzDQo+ID4gICogR2FkZ2V0IGNhcGFiaWxpdHkgY2hlY2sN
Cj4gPiAgKiBDb25kaXRpb24gZm9yIHRoZSB1c2VyIHRvIGNoZWNrIGhvdyBtYW55IGFuZCB3aGlj
aCBlbmRwb2ludHMgY2FuIGJlDQo+ID4gICAgdXNlZCBhcyAiZmlmb19tb2RlIg0KDQo+IFRoZSBl
YXNpZXN0IG9wdGlvbiBzZWVtcyB0byBiZSB0byBhZGQgYSBuZXcgZnVuY3Rpb24gdGhhdCBsZXRz
IHVzZXJzDQo+IHNwZWNpZmljYWxseSByZXF1ZXN0DQo+IGZpZm9fbW9kZSBlbmRwb2ludHMgZWc6
IHVzYl9maWZvX21vZGVfZXBfYXV0b2NvbmZpZ19zcw0KPiBUaGlzIGZ1bmN0aW9uIHdpbGwgY292
ZXIgZW5zdXJpbmcgdGhhdCB0aGUgZGV2aWNlIHN1cHBvcnRzDQo+IGZpZm9fZW5kcG9pbnRzIGFu
ZCByZXR1cm5pbmcgYSBzdWl0YWJsZQ0KPiBlbmRwb2ludCAoaWYgYXZhaWxhYmxlKSBhbmQgTlVM
TCBvdGhlcndpc2UuIFRoaXMgY2FuIGJlIGluZGljYXRlZCBieQ0KPiBhZGRpbmcgYSBuZXcgYml0
IHRvDQo+IHRoZSBleGlzdGluZyBlcF9jYXBzICBzdHJ1Y3R1cmUuDQo+IERvZXMgdGhpcyBzZWVt
IGxpa2UgYW4gYWNjZXB0YWJsZSBzb2x1dGlvbj8NCg0KVGhhdCBzb3VuZHMgZmluZSB0byBtZS4g
Rm9yIHRoZSBuYW1pbmcsIHBlcmhhcHMganVzdCBuYW1lIGl0IGFzIEVCQyBmb3INCkV4dGVybmFs
IEJ1ZmZlciBDb250cm9sIGFuZCBwcm92aWRlIHByb3BlciBkZXNjcmlwdGlvbiBpbiBkb2N1bWVu
dGF0aW9uLg0KImZpZm9fbW9kZSIgbWF5IG5vdCBiZSBjbGVhci4NCg0KTWF5YmUgdXNiX2VwX2F1
dG9jb25maWdfc3Nfd2l0aF9lYmMoKT8NCg0KSG93IGFyZSB5b3UgcGxhbm5pbmcgdG8gaW1wbGVt
ZW50IHRoZSBhYm92ZSBmdW5jdGlvbj8gQXJlIHlvdSBnb2luZyB0bw0KYXBwbHkgdGhlIERXQ191
c2IzeCBzcGVjaWZpYyByZXF1aXJlbWVudHMgZGlyZWN0bHkgb3IgaW1wbGVtZW50DQpnYWRnZXRf
b3BzLT5tYXRjaF9lcCgpIHRvIHByb3Blcmx5IHJldHVybiB0aGUgcmlnaHQgZW5kcG9pbnQgYmFz
ZSBvbiB0aGUNCmVuZHBvaW50IGRlc2M/IEFzIHlvdSdyZSBhd2FyZSwgRUJDIGlzIG9ubHkgYXBw
bGljYWJsZSB0byBub24tc3RyZWFtcw0KYnVsayBvbmx5LiBBbHNvIGl0IGRvZXNuJ3QgYXBwbHkg
dG8gZnVsbC1zcGVlZC4NCg0KPiANCj4gPiAgKiBEZXNjcmlwdGlvbiBvZiBob3cgaXQgY2FuIGFm
ZmVjdCBjb21wbGV0ZWQgcmVxdWVzdCAoZS5nLiBkd2MzIHdvbid0DQo+ID4gICAgdXBkYXRlIFRS
QiBvbiBjb21wbGV0aW9uIC0tIGllLiBob3cgaXQgY2FuIGFmZmVjdCByZXF1ZXN0J3MgYWN0dWFs
DQo+ID4gICAgbGVuZ3RoIHJlcG9ydCkNCj4gSSB3aWxsIHJlbW92ZSB0aGUgTk9fV0IgYml0IGZv
ciB0aGUgRUJDIGVuZHBvaW50IGFuZCBsZWF2ZSBpdCB1cCB0bw0KPiB0aGUgdXNlciB0byBlbmFi
bGUvZGlzYWJsZSB0aGlzDQoNClRoYW5rcywNClRoaW5o

