Return-Path: <linux-usb+bounces-33805-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KNKMGY1omnR0wQAu9opvQ
	(envelope-from <linux-usb+bounces-33805-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 01:23:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 694CD1BF636
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 01:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A1F53063E11
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 00:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286F3233D9E;
	Sat, 28 Feb 2026 00:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="crOEfDF9";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bCxHc6Vg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L7l3dh99"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2DA368943;
	Sat, 28 Feb 2026 00:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772238179; cv=fail; b=RvhhyeGIcvSIzFwyltpvyPTgyTGIzl1shiACVX9R7G5EdUF6laoVX8Gu6crFXOZ+FIUGRxxiD5YEQ52MNBKGKFmWdjfPLf9abRLzs4sB2N2hRbrKz4nMaTAPyV0eg7iWRGNu8m/HT3+NHVt9WhYL9DR5Vt6UR9utPSMIEDHZfO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772238179; c=relaxed/simple;
	bh=vv36dIV6qJ9L9NbMz2sdlFC5x2Bn7eBMXLm9GEsEsp8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lPWUW9JDbAIXTWEY53DS9phDEcVvXjU+pS83aFD3VrXjeJnO8WOuSegGciGn9pwpYQ5h0euTB4NdsJtNG+2/EFy815dXI8WNEarjqb5ypDSU5wkT445x0MQuZSymfLf7nzgy8kU9ucLwWkN8GrUkHGqia+wwhJQ9STzgbRmbTRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=crOEfDF9; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bCxHc6Vg; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=L7l3dh99 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RLBFjU3097208;
	Fri, 27 Feb 2026 16:22:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=vv36dIV6qJ9L9NbMz2sdlFC5x2Bn7eBMXLm9GEsEsp8=; b=
	crOEfDF9HG3iNcGz53ihygImq3/tmdKU3IEcGEFZt7vrjE45ccx7q0OMSD/lYCFS
	i9/QVHIWqsZNY3zLO+6uLgciUB3mErQa+z9Rq36is1cRfxsOSAvPpmm9YB7TTXeV
	OVPOfWVL7wDIACMAPNGwodsmMe1co+Y/jfMO10EDelYRFlMRZdcBm/ORHU3SXYRM
	zbPx23G8Tjf3nWSaOjkZikuRkMgnzSGDZ6KYISyseWdJWwj4JamBLwXlcQNsZsbV
	DMgyUz1er65PV/4+aCnduI1cGOURdHwOWAA3+U7OWCcCIB1z/vnks1gTgPEw0WKT
	mzn60t0AhSwaCjJtvBXhHw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ckdnmk3ua-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772238158; bh=vv36dIV6qJ9L9NbMz2sdlFC5x2Bn7eBMXLm9GEsEsp8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bCxHc6Vg7f3JPGnVcKc5ZultgYMr7GUcKlt4oIfLaWKiwAcq6Hyi46i1/enbix/rE
	 8tpauNGMZ9oxzMVMGavEWxyPerh9ZSVIJUpRizkdxNrgmREgEgf4dANm2uHKTeGogW
	 5ol1JukrdcpuGsKch+iiSEKdEXu+lDPGwrmu3pWEMEvpc8KRDsycjMuKA2Ygg23+DP
	 BBBiMM/M3+AgLgbwmDQZggqorPoTAqskoN73uxTs4n6Z42l5Yh+Bpe1AWWQ5M1yGoa
	 W1u+5ihLWtladFd1yPo5tkZYQuDtfgegW6P7ruvNL/ozUcz9OdWh7CgD9yDOKLce0t
	 TzwayrZZuwBGg==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4009840359;
	Sat, 28 Feb 2026 00:22:37 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 925F7A00FB;
	Sat, 28 Feb 2026 00:22:37 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=L7l3dh99;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00101.outbound.protection.outlook.com [40.93.10.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C5B6C40543;
	Sat, 28 Feb 2026 00:22:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNORv+jbvZB5y08oileK00BB+9Eoz+AF6CMyqZcNNAw3/S+f2w1Hk8Sta2MFhdGFJGuC0EpDlcYKgp8SszqQ01gdAiGQCvWx7xmmMYOVQ1UjBe4xWM2/lM75DyrI+3YidyJF7kL9QSbqSP/dyP5dG/BbGj+Hez00Ax8y8YF7IvAZNkSX5G8J0BRBp3ac749EushVb5ek7b7M+TvAb29Q6GE5nMoKHF+JVi5v92FckSPHhpejzLFZNw3G3oKEGXp2MMrxI3ukC34Mx+tVjncs9dhfLxkPTUGnE+6q1rLzn006vFIpaRGNlBYS6tX+Ipn4a3TElb8e3iNFMkPpMxwvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv36dIV6qJ9L9NbMz2sdlFC5x2Bn7eBMXLm9GEsEsp8=;
 b=d55hZAf60HQlODVJoVuseUcZJVhUuzod3W3NvWwlCi0mx8S67FOlGrMr32gA0drOks3TZD4ngTD/6wZB/UBI38DM10H2j77F8tjEGz9iyMbAd+rBJOR5Q4CwWP2Og5g5tHDHXDqdz1zMKkfRGwH/ql9KvzA3tQ4zsq7GqZaLBLjE4t0fPWoejhcF9eAgVYBF/DV9sLeA/nsslDb7aMLgAAIJnlIKS7LBYxA4FHd7T92XXyxKTgCyqGzuL2/2nPx2gdULLo6n8QDlvii/fEYori4zFMD04Azpc8chXPWWbNYZHKjjkKtqx2or9bkLQlg4f/EpZJO8f7d8y0Awju1tYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv36dIV6qJ9L9NbMz2sdlFC5x2Bn7eBMXLm9GEsEsp8=;
 b=L7l3dh99krJIlWCF5MvK7iE7SXp3E5HuvjpgfOTmWJpr+UymvxtwtiemyrIxjW7q5Szys7H0NNWwvvnOE9+off35d62BIRuOWfD6YndknaT35pXHunfArOBhNo8g/H9+UIrqOWICiSZ6xM389nkX1rYhL6u1ikkIanTu5dcDZiU=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 DS4PR12MB9657.namprd12.prod.outlook.com (2603:10b6:8:27f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.14; Sat, 28 Feb 2026 00:22:31 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691%4]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 00:22:31 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Dayu Jiang <jiangdayu@xiaomi.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Longfang Liu <liulongfang@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        yudongbin <yudongbin@xiaomi.com>, guhuinan <guhuinan@xiaomi.com>,
        chenyu45 <chenyu45@xiaomi.com>, mahongwei3 <mahongwei3@xiaomi.com>
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Thread-Topic: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Thread-Index:
 AQHcj33Mdj9vpu0YaEml411T+NyHbbVl34MAgAFnWICAAAIXAIAtnDGAgAB6GgCAABoMgIAA3IYAgAEb2QA=
Date: Sat, 28 Feb 2026 00:22:31 +0000
Message-ID: <20260228002228.5ndgx46h62pe4sau@synopsys.com>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
 <2026012708-liability-sincere-5ed4@gregkh>
 <aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>
 <2026012857-deprive-putdown-0ee8@gregkh>
 <aaAR5VOtnMhvoCem@oa-jiangdayu.localdomain>
 <871991ab-6c8f-47d4-a5b4-b65751750e71@linux.intel.com>
 <20260226181715.ofgjiq3iq7d7dx6y@synopsys.com>
 <aaFHKC2XyqjTwbF0@oa-jiangdayu.localdomain>
In-Reply-To: <aaFHKC2XyqjTwbF0@oa-jiangdayu.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|DS4PR12MB9657:EE_
x-ms-office365-filtering-correlation-id: 34278ccd-fb80-4403-e6aa-08de765f763b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007|38070700021;
x-microsoft-antispam-message-info:
 WUh1eDUZLd4RXmHM5Y2a6sz+ftJCtanXpNCrLTVxHs2oPsZhblyJ/KwceAcGGi4h7f5JCviS1iihTFWyKy69iKwULiVzl2OOu9mvnEHdefGsfPQ7mc9Yi68/9QYkFDpy3WleDsNwYBK1zIrFeWV5gjRPlVJ02bInI4YSu1fdkp4no3sM+uxPzi0oqIVlOvy/zQ7CJuzuAehAV2cbvGgOWJCeo2BYU/Uck6wDS7j3Icmdnl5rWaooX+oTdwWU07bD1tPwzMO63cT58fYBqfhJ+92HJLYTO3QO4DikMiMt5kPilG0XH6CJIM5tsEwckAI/Yd+6SIrJ/yGS4ibr45O3B/UdylFx27d7SrBgv8YYlg1HejixGlg45aWzeeNaWjdrkSZeVRja+/D+eUuG0f6uly95HcspvMxUfZuev4AvELAvGKHwIeabwZOUhO6cGQpsjnm3LlJMoLT73Mr82NQCciUUzxeocHvmQNozJO3K4q5nsq0pOhX2aFeZBCQWITZ7KnYhCHQhoWW2upvtF0pxTaBqQlTSILcpoBU4+zDYok1KDIU8SncvLgGHuY+MI5qcdBaItQlmVixc5MST6lSYLnvG1wa7su0foO8zA92DBuChgl0ih3MFM4QUJ7LAIxlzkzy76xqXXk8Kr5qmZDZsOqMSp5iM9BlWRB02Gwisa1dxEAvTCOJVONm40JDL7mrVzGadCW2lqXUxe2+7sSCF5P9pz3vhIaBZ97UZ0q8CKRyUwE3N/9n8CwAtYQJt2AzV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTZMaVhKcWFlUlRLbGIvZlA1b2N0bHVkeTJabzVhcHVzS3MwdkgwcVlhWW1o?=
 =?utf-8?B?eHVQeVAzczNFTG1YVGRPOXk4eWhXWWJQUWdFVHhyMnRhQTRMWGZaajhBanI5?=
 =?utf-8?B?N1psTTIzNE1qUklCUmNUWFBGWTh2NVlhTlJmb0Rsb2JEbm5CLzJLV250aFNa?=
 =?utf-8?B?VHhYUUJwdXBqSGFvMWxpQ1k0MDhjbm9lemNUV2pCaHVkOW45WjlZVStvYlhV?=
 =?utf-8?B?TjNBdHBqakVxUWZ6NDFlL0NFelpIYUFiSUE3dTBpU3Q2REVvOEh6aVBxeGpl?=
 =?utf-8?B?Yy80S1hDVVdZR2Q5SFFlTklVSnVoemJDbzhPMndtOVdOZEd6eXFlNWlybG1D?=
 =?utf-8?B?Qk8vNkFEcEpGMDFWRUo3Ui8yVkJvQnhmSTBtc2VDT1FvQVo3ODBqL0gyTG4v?=
 =?utf-8?B?ZFIrSEFWR1QzMXhJcDh0bi9ydWZLYk45UVNUMHZQdzZuN2pWdHkrSG1RSWR0?=
 =?utf-8?B?bDZUdmcyUUZrcHZRTmhUNFdjQ0pzeDNYNUpKNEM1MmxJaVh0T2VvM1VxcUJz?=
 =?utf-8?B?UDFVR251akk5QUZtZGxVdDBKeUJjSWZ2d3pRWjlKYkhBN3FhQ2NSWjRWU1Zz?=
 =?utf-8?B?Y2xtZTJxdkxuTkZvWUljanBCeUhvOGc5cEZkakdheFRCSEt1N2xCR2JKRHZN?=
 =?utf-8?B?ZEUyTWwweFRtMUQvdkRLV0hyTHhVZUM4YzlFSEViZXVYSTdMd1I4TnBDa21m?=
 =?utf-8?B?bmJHRElnU0dLcEJWdWwyYjNhMFZhc3QxeHJCYVpuT0xhK1hvWDltVmZ6d0dP?=
 =?utf-8?B?Sk5PaVNZUFVZa2FneEt4cUNCditYMmc0MlUxUWRRNWkvVDR1czd6T2hBOVVC?=
 =?utf-8?B?N0Y4YWRpSE9iS3F6aXFyOU05cWRsYS9pYWI1ODRDRVpNZFdDbFpoc1lleUNu?=
 =?utf-8?B?dUlESzUrYkJsbFlnbHZaYStaRnVlTVE2L2lLTjFrTFdpRHYzNXVuVHZHVVg1?=
 =?utf-8?B?NitROFVzMnI4S0VvN21uM0s0NWZoK1o2VVpEL3V5Rm1zbGJqZkpDM3dqcTNk?=
 =?utf-8?B?aFV4bTJ3QitEMi9Qb2ZROWJ0cmFNNzlxNit4Vi9raUhkclJoYlFwbWFocGY1?=
 =?utf-8?B?d0ZNVEJKZ3h1S3ZXcHA3L1A2S0tvOUxSWGhHNWtPemsxa1JQNmtuazh4bkVX?=
 =?utf-8?B?MjJRbVQrTWFOdWtIRHRaczIzSi8rcGRRTlgwR0t3NHZlb1Q2R0lMcGxhVmJa?=
 =?utf-8?B?N09QRWRyNjZPTDB2Sk03OWg5R2E2czQ3Y0tKaWlxWkR4VTRSWC9zREFMOUpv?=
 =?utf-8?B?UnJnQmFlakZYUmpIZjFwVnpZbTk1REwzMDArN2lScS9wV3FjM0Q5OWg1V2Fj?=
 =?utf-8?B?VHpDSUdDRVpvZ1hKaEZ4MkRhNDRQT21wWkFVSTNRNWkvZy91ZzUzM0tIblBG?=
 =?utf-8?B?VDY2L2U4Uy9DbmFsb1JUYkp0N2hWYTRiSWNvaWJGOGNTd1M4Y2ZLSGxqMWM2?=
 =?utf-8?B?dlB5ZE9NMVl3S2dQcWhEd3FLTTV2ZFFOTlo0OFlXODBWenk0WEdxNVRIb1FS?=
 =?utf-8?B?OFdrVVhCVTJBaGlUd0FCcUc1bUdwbmlYamxTdE1ZMVhvUnFYNkFTN1JvWGpB?=
 =?utf-8?B?K0tzZzdVMktnWnRjZDVMd3o2dGkxMGRIUy9ZNTMyUXoxUTNQUngrTXd5dzBP?=
 =?utf-8?B?dzd4L1U2VVM4bzZnUi9oQ3ZkTXY4NUhvZDdqR2N1eEVMc3lsWExnbXJvTE9p?=
 =?utf-8?B?TmtLb2dIUTdmOXZ6R1kxRkR5V0xkNFFlczNlYTdEejFscnZXeUZpbE1SZjRo?=
 =?utf-8?B?bk5RMHBNdkJFa2Q5ZEs4REx3blp0VDlXZ0gya3pyNlFZOFl3cHo1dFNQRWdO?=
 =?utf-8?B?TmpaSmlLWE1qV1N2d1Z2RTVZQ0FuMllwQ0UvWk52OStqVUM0SGJKUW0waUR0?=
 =?utf-8?B?dDhxeHVwNEpncEUwVzdOR3lLbU43RTk3MVpHak1wM3pVOXdDQjBmd3JTbnVa?=
 =?utf-8?B?Ni95MUR2WHA4UHBqVGo2ZDIwU0svblNwa3hKMFNSMnRPODJvMWtrenloWDZ0?=
 =?utf-8?B?TS96MTBOOWp0TS9VNjJCekJ3T1ExdlNxYlNrUXRyWFcxUWh1WW1uUE1ENnNU?=
 =?utf-8?B?dEJ4REJvZG5aVy92Q3JZUlh1SmVYZ3pvdmExbXVqMUdRb0RFdTk5aDFhWkl3?=
 =?utf-8?B?ejRmdnBIT0NURHp0QWlhdldpU2oxUldZTjdLWjhzdnJZSHJYM2g5VEFBd3NG?=
 =?utf-8?B?Rmt4MXRJbk9oS3NTekxqcVN2dG93RGNPbHFUb3RRQ1REY0hCdzBudXRuUnYx?=
 =?utf-8?B?SStXdnB1WHdZaUFZT3RTdVpuaTBUVmhKbGpObUhwTW1QODRPanFRWWF0aXlu?=
 =?utf-8?B?ekV3K2xncXN0eEMrc1Z1WnUreUVJdGgzek80b1JlNW9xcUs1aG1jUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15DE0A38F21CA44C8F4E3C22E615295B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cGfrsEIxJkDuhQSWJa4ArtvUTRYMeW6HskXlW04vbCAaObpIqC7+F8CaRmNZzhkX5R6xfC05ieyi+IG+LjwyXYALvi9UGHW9OEdKHzJ+OjulyQtaq8SQ2s4/Kl9C9fHDE+AqYIcuyBvk9BXsjJfLFrDL4M6zw33mSKPzvVMaxeWXXaGgTjKmmYGnKKkBUtj7DMS0juHzapuzaj15But0CAlY7yNMzzGPEkqthaw5y7tG6rTaxyY9UgRYyg4npdvDwsL6RRD3VAsaCCzcDWPmKcczQBMUO1sPuONvQamSO/mBqloDDFZlZux3+0KPnwwRAmIXdEKS7eEIbLeE3vxXMSTOMxjnfMks58HAth802veNU1bakcEcHH/OgPXCOrDWmrZul7NZ+cHOz2KALWCSQhRP8Bj0nMXZC0LE2Tpg/Y1fXgxflq9sd7oXnI3hWYb+6s25RRdg32y+iwLao3Eq7w4EIoy399H3cXOrD/k1Gu3JR844jd9oZ9tsA/ROJO1XtXLP3V2pbNDJzEGD+RJGLscP8xTpR2YF2f6PRgCDlSvt8tKHsg8j1NwruoEeH3gJ+WpLdWTDhqMKpOZVmp/hVxrIOu5lpTNlu5keGqJo4OQ7ib8JcrkoE/cZMnjwBO4Xs28D4SgFJpcJkFaXYRCg9Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34278ccd-fb80-4403-e6aa-08de765f763b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2026 00:22:31.0398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OBl+gwHkskzD5abez5AY4W3AMzLyd646IWoWJV2tbH/H3k9BwS/KmNiqy43a83My+AaY5lclhavDkxe6oGdcjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9657
X-Proofpoint-GUID: zPp09zRGFCeJghEgBQQKwgVmd99QgkAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDAwMSBTYWx0ZWRfX4pgW2CBXvuVz
 2DaJBorjFUki34s6qVzn7ODgWHGyFdQ9tZ3S7Zj0j5EkoigrHI7EOeM2aQCMnTVOtgWDDqhQ5xR
 il7e7NAjbzoKhU0+V/MrZKcoZd2+ADF9zTl9iCa/KXcw6KpQwXLoINbL/ooQGvd53RLqhVpfA8G
 hk1bU0ZdaB0eIpdvq/E78Gw9fP0EJtTszalrQT/taAA3G9XMaUGNV29TD8l7xoBFWRLxiciGKcQ
 PdxIiqwzt9DJiLV0FEYO4DF+CJFqRhsWUVQfeR0f7swlyr9wBUGBAVDsra96PzE/6zyKebSKSsH
 lIklDjlQypNB24KcfQEpqMrUts5bgWP3FBnmYHKmuB0sXK+NAgkCSM0MD4X3gKd3Opozgbw6R15
 uKI9sm/NNDswoBD6IEis9NhALHbC/EC33q8IM6oF+5u/eBzYKt4Q5rdASBSvP0JjP+rvn4xuig1
 Z+Kpw5x5mO2TnsLM5Rw==
X-Authority-Analysis: v=2.4 cv=C4bkCAP+ c=1 sm=1 tr=0 ts=69a2354e cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=VwQbUJbxAAAA:8 a=IeNN-m2dAAAA:8 a=wzZkN0mraHUMiX4zf8sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: zPp09zRGFCeJghEgBQQKwgVmd99QgkAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602280001
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33805-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:mid,synopsys.com:dkim,urldefense.com:url];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 694CD1BF636
X-Rspamd-Action: no action

T24gRnJpLCBGZWIgMjcsIDIwMjYsIERheXUgSmlhbmcgd3JvdGU6DQo+IE9uIFRodSwgRmViIDI2
LCAyMDI2IGF0IDA2OjE3OjIzUE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBU
aHUsIEZlYiAyNiwgMjAyNiwgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gPiA+IE9uIDIvMjYvMjYg
MTE6MjcsIERheXUgSmlhbmcgd3JvdGU6DQo+ID4gPiA+IEhpIEdyZWcsDQo+ID4gPiA+IA0KPiA+
ID4gPiBJIGhhdmUgdXBkYXRlZCB0aGUgY2hhbmdlbG9nIHRleHQgYXMgcmVxdWVzdGVkIGFuZCBy
ZXN1Ym1pdHRlZCB0aGUgcGF0Y2guDQo+ID4gPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvMjAyNjAxMjgxMDA3NDYuNTYxNjI2
LTEtamlhbmdkYXl1QHhpYW9taS5jb20vX187ISFBNEYyUjlHX3BnIVpTSk5ES3lPaW5tMjZxbmdv
cExXLWF4aVF0d0RBTWVseTRiRHF0cVlER3YxRXJXQ3RTNmtaNlphbWRpS29aS3VDeUNrMEl4TVFL
NWc2MjVHRUl4WVdGektwQUVpQ1VxNyQNCj4gPiA+ID4gUGxlYXNlIGtpbmRseSByZXZpZXcgaXQg
YW5kIGxldCBtZSBrbm93IGlmIGl0IGlzIGFjY2VwdGFibGUgbm93Lg0KPiA+ID4gDQo+ID4gPiBJ
J2xsIHNlbmQgaXQgZm9yd2FyZCwgYnV0IGNoYW5nZWQgdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiA+
ID4gRG9lcyB0aGlzIG1vZGlmaWVkIHZlcnNpb24gc3RpbGwgZGVzY3JpYmUgdGhlIGNhc2UgYWNj
dXJhdGVseToNCj4gPiA+IA0KPiA+ID4gdXNiOiB4aGNpOiBQcmV2ZW50IGludGVycnVwdCBzdG9y
bSBvbiBob3N0IGNvbnRyb2xsZXIgZXJyb3IgKEhDRSkNCj4gPiA+IA0KPiA+ID4gVGhlIHhIQ0kg
Y29udHJvbGxlciByZXBvcnRzIGEgSG9zdCBDb250cm9sbGVyIEVycm9yIChIQ0UpIGluIFVBUyBT
dG9yYWdlDQo+ID4gPiBEZXZpY2UgcGx1Zy91bnBsdWcgc2NlbmFyaW9zIG9uIEFuZHJvaWQgZGV2
aWNlcywgd2hpY2ggaXMgY2hlY2tlZCBpbg0KPiA+ID4geGhjaV9pcnEoKSBmdW5jdGlvbiBhbmQg
Y2F1c2VzIGFuIGludGVycnVwdCBzdG9ybSAoc2luY2UgdGhlIGludGVycnVwdA0KPiA+ID4gaXNu
4oCZdCBjbGVhcmVkKSwgbGVhZGluZyB0byBzZXZlcmUgc3lzdGVtLWxldmVsIGZhdWx0cy4NCj4g
PiA+IA0KPiA+ID4gV2hlbiB0aGUgeEhDIGNvbnRyb2xsZXIgcmVwb3J0cyBIQ0UgaW4gdGhlIGlu
dGVycnVwdCBoYW5kbGVyLCB0aGUgZHJpdmVyDQo+ID4gPiBvbmx5IGxvZ3MgYSB3YXJuaW5nIGFu
ZCBhc3N1bWVzIHhIQyBhY3Rpdml0eSB3aWxsIHN0b3AuIFRoZSBpbnRlcnJ1cHQgc3Rvcm0NCj4g
PiA+IGRvZXMgaG93ZXZlciBjb250aW51ZSB1bnRpbCBkcml2ZXIgbWFudWFsbHkgZGlzYWJsZXMg
eEhDIGludGVycnVwdCBhbmQNCj4gPiA+IHN0b3BzIHRoZSBjb250cm9sbGVyIGJ5IGNhbGxpbmcg
eGhjaV9oYWx0KCkuDQo+ID4gPiANCj4gPiA+IFRoZSBjaGFuZ2UgaXMgbWFkZSBpbiB4aGNpX2ly
cSgpIGZ1bmN0aW9uIHdoZXJlIFNUU19IQ0Ugc3RhdHVzIGlzDQo+ID4gPiBjaGVja2VkLCBtaXJy
b3JpbmcgdGhlIGV4aXN0aW5nIGVycm9yIGhhbmRsaW5nIHBhdHRlcm4gdXNlZCBmb3INCj4gPiA+
IFNUU19GQVRBTCBlcnJvcnMuDQo+ID4gPiANCj4gPiA+IFRoaXMgb25seSBmaXhlcyB0aGUgaW50
ZXJydXB0IHN0b3JtLiBQcm9wZXIgSENFIHJlY292ZXJ5IHJlcXVpcmVzIHJlc2V0dGluZw0KPiA+
ID4gYW5kIHJlLWluaXRpYWxpemluZyB0aGUgeEhDLg0KPiA+ID4gDQo+ID4gDQo+ID4gVGhlIGNv
bnRyb2xsZXIgaXMgaGFsdGVkIGlmIHRoZXJlJ3MgYW4gZXJyb3IgbGlrZSBIQ0UuIEl0J3Mgb2Rk
IHRvIHRyeQ0KPiA+IHRvICJoYWx0IiBpdCBhZ2Fpbi4gTm90IHN1cmUgaG93IHRoaXMgd2lsbCBp
bXBhY3QgZm9yIG90aGVyIGNvbnRyb2xsZXJzLg0KPiA+IEV2ZW4gaWYgd2UgZG9uJ3QgaGF2ZSB0
aGUgZnVsbCBIQ0UgcmVjb3ZlcnkgaW1wbGVtZW50ZWQsIGRpZCB3ZSB0cnkgdG8NCj4gPiBqdXN0
IGRvIEhDUlNULCB3aGljaCBpcyB0aGUgZmlyc3Qgc3RlcCBvZiB0aGUgcmVjb3Zlcnk/DQo+IEEg
ZnVsbCByZWNvdmVyeSB3aWxsIG5vdCBiZSBpbXBsZW1lbnRlZCBoZXJlLiBQZXJmb3JtaW5nIG9u
bHkgSENSU1Qgd2l0aG91dCANCj4gYSBwcm9wZXIgcmVjb3ZlcnkgcHJvY2VkdXJlIG1heSBpbnRy
b2R1Y2UgdW5wcmVkaWN0YWJsZSByaXNrcy4NCg0KV2hhdCByaXNrcz8NCg0KPiBJbiB0aGUgeEhD
SSBkcml2ZXIgZmxvdywgdGhlIHN0YW5kYXJkIGhhbmRsaW5nIGZvciBleGNlcHRpb25zIGlzIG1h
aW5seSANCj4gZG9uZSB2aWEgeGhjaV9kaWVkKCkgb3IgeGhjaV9oYWx0KCkgKHBsZWFzZSByZWZl
ciB0byB0aGUgZXhpc3RpbmcgaGFuZGxpbmcgDQo+IGZsb3cgZm9yIEhTRSBhcyBhIHJlZmVyZW5j
ZSkuDQo+IFdoZW4gYW4gSENFIG9jY3VycywgdGhlIGNvbnRyb2xsZXIgaXMgYWxyZWFkeSBoYWx0
ZWQsIGJ1dCB0aGUgaW50ZXJydXB0cyANCj4gaGF2ZSBub3QgYmVlbiBjbGVhcmVkLiBJdCBoYXMg
YmVlbiBjb25maXJtZWQgdGhhdCBjYWxsaW5nIHhoY2lfaGFsdCgpIGF0IHRoaXMgDQo+IHBvaW50
IGNhbiBwcm9wZXJseSByZXNvbHZlIHRoZSBpbnRlcnJ1cHQgc3Rvcm0gaXNzdWUuDQoNCkFzIEkg
bm90ZWQgaW4gTWF0aGlhcydzIHJlcGx5LCBJJ20gT0sgd2l0aCB0aGlzIGNoYW5nZSB3aGlsZSB3
YWl0aW5nIGZvcg0KdGhlIHByb3BlciBoYW5kbGluZyBvZiBIQ0UgdG8gYmUgaW1wbGVtZW50ZWQu
DQoNCkJSLA0KVGhpbmg=

