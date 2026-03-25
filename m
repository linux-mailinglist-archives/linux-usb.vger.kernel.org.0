Return-Path: <linux-usb+bounces-35421-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mK3zORw+w2nspQQAu9opvQ
	(envelope-from <linux-usb+bounces-35421-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 02:45:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5D031E612
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 02:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D02CB30518F0
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2026 01:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662A7274B58;
	Wed, 25 Mar 2026 01:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="t/jNYeu2";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Doa9oO8R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bm0pVBbo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645881D5160
	for <linux-usb@vger.kernel.org>; Wed, 25 Mar 2026 01:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403097; cv=fail; b=pyveRmJflJyTTxHW1YSq0+nRdk0cmX8JdKnIh86jCF2TK9lP9iTvNqpPvMIZdhwrYrME13BTXnDu1cY+nlbi7SR+YFx3drRk2DLtFL45vXxVpl5jlFkOEAWY8HmrSowTqq7SpoYgeSeFcSpOpv/J6ZbBizvpwF7/4oOt1cbX2XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403097; c=relaxed/simple;
	bh=E9rEOuFCHHMAOr9HNzmOFRvz5BN92fVcw8NQ0mFKiuo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X1e5W07a8BP1XPVKIEmmsdIn054Zdc9SJL1IvpxbYPGjjkaT/GPs/zczzr5BL7Fp3aZCgMenb7uGuh6Yf3H9Qn3cjouFHbNmRoFtuJI7WJCDH9UXWXHiSEvM4IaYxM8rSGZ0BC1svVBCGsyYMQ6O6BuSdmjPkdmtMgzaJsDmJK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=t/jNYeu2; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Doa9oO8R; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bm0pVBbo reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P13Guw3354780;
	Tue, 24 Mar 2026 18:44:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=E9rEOuFCHHMAOr9HNzmOFRvz5BN92fVcw8NQ0mFKiuo=; b=
	t/jNYeu238BOCm0wGXZo6Y5tkxYwzAp5PZzlok0BxXd6fwsbHIzvZiiYwhQOym3u
	kV/x/b1qHZGoWNfCgzNV2SXkQzmSoQhGTI1ioGbplg7dAdidy2EDRdKtpkTeU1tX
	MZiwwj1z2vd9ueExKBJRHqbKC9aeWAmSh+uiQJMxRO+Hmuusy44sN8JrzkAQ9MeU
	kXQ7U9hodVtF0ptraWnhWNCwHqMs8TeXTQ4/zBIWKbLLL+ZNYKF0cVR3mJ7C+/WS
	COlocM8AcPBP5NbaHoo78qyRE71f8KMmaJfA+ea/ZYHgkrpjRLpJgMh+lRUM7YKw
	ODtvS0TlRGVovZFwqOILiw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4d40kp9mj2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 18:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1774403072; bh=E9rEOuFCHHMAOr9HNzmOFRvz5BN92fVcw8NQ0mFKiuo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Doa9oO8RpkU5WhpGuDGjXo1Bb8UY9QFZWAkLXOjxZb5OGQnJ59m76Y6nCKcLYEETb
	 aW+bHd2d5rePthHNRYYBtzKo6UCFY3ISlDOtoCIJdz83kJgqQPUpsbVd1n/olnVj9O
	 Rqg85Me6FThx69OUCnGkDv+E/0HXr7sZlnSI01OBufwDJSy7ouuT6l47ssJt2RgpvG
	 EeT5Go0RN3itklairfqp+kwAyjrKhxxd76V7fuCDJTUdE1QATD1hWRLufLDRMMYRdk
	 iYWEigi/AffryaJDvYl59wGzU9vpiJX3fDBNQFhXBwuVXZqdMnHKyBcghWLbbgn2ko
	 Jsekvw5UrkGOA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9600840357;
	Wed, 25 Mar 2026 01:44:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0E0C2A006D;
	Wed, 25 Mar 2026 01:44:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=bm0pVBbo;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00102.outbound.protection.outlook.com [40.93.10.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9C04140354;
	Wed, 25 Mar 2026 01:44:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bmOrGI0z5zxwMv9QpR8+T4hULqEHzX6d4SmaJ0KzgAdg1S13EIPSlrOxJGoITGroXB9Cp4vS/pPxg+64ShhJ462TwaU5Cz+sFQtQeWoSq9WikijN3pfLSIZuVkCSBKVvpB/YdMY7TzJ5gcNjPa3vUT+rLNH4PeIJ3oSrJSIykS5aAXYq0V2s24ldvavH+pPxkbtf9+NHD8vcKkref0hOOGj1DNmZT2WDc4FCRRwmVibhtAj/p0WDUIm77PGVghWTaG1p7uXQ4sRlMsFtUxV/wfkiicdo40BfmkmMJ5KnUEaiCmpVgrJg1AvfiJ51Zspsbi36Cj/guGlY5Xj4B5Q+Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9rEOuFCHHMAOr9HNzmOFRvz5BN92fVcw8NQ0mFKiuo=;
 b=CSwbAhKK82b4MInu7v1tDx+/BT8irrur1JYWUo9nvkPdIAcO4YAxKfgYiMVeZF5e+3Aw1o7gX4mP/ZF71dB2QNpOV6htHyxfSX5XwgoC234//E/Z97lgGKlrJ2V/PW/d1YDFnjtUr5ZH0VLBPYG6UTsEFjIZlmSoHZrR1r3UWH/EJw52tQo7n7p3aFENJPpBrjXsDCGcGxEWSMPfOahir5K0l8DcLq9mXzwuCF4cgHoR7R7plqXyHLX7Voy9+CchbDAKLG7lLduqaloHSqBrZCdREt7RcN6MVfuPBfzA+b70UN6alDON9ydxg5rvyX9c/13WyKqKIF0xqYVYe7v9TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9rEOuFCHHMAOr9HNzmOFRvz5BN92fVcw8NQ0mFKiuo=;
 b=bm0pVBboq8uFmdEv2xuGQ0f1XjuF56f5Fm6Ep6A3Gj7xh0YxDHNB7prwk7V27ySM8RD4/I1VNQFt1rfDsz4fCxU2up5yhrMxvZcP38AzOQK+C4DBX6O8eyDAJ70ncsX2MjyEsIzuhL1OTZpKkViKACrwGg7uXCqvedNTbbw8Puw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS2PR12MB9823.namprd12.prod.outlook.com (2603:10b6:8:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 01:44:25 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 01:44:25 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Oliver Neukum <oneukum@suse.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Michal Pecio <michal.pecio@gmail.com>,
        =?utf-8?B?QmrDuHJuIE1vcms=?= <bjorn@mork.no>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Thread-Topic: correctly handling EPROTO
Thread-Index:
 AQHcsij3bm/3l4J2S0+poPtO9iFJorWq8pYAgAAa5gCAATtij4AATvwAgAB6AQCAAEFHAIAD0b0AgAARygCAAAy8gIAALjgAgAAhdYCAAT4QAIAAHoaAgAAczoCAAQmZAIAAg+gAgABA74CAACdBAIAAI98AgAFicgCAAR4GgIAApiGAgAOuMYCAAPVzgIAAjG+AgAEQyAA=
Date: Wed, 25 Mar 2026 01:44:25 +0000
Message-ID: <20260325014420.45dfayulgbih4wem@synopsys.com>
References: <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <20260318235920.ioek26hdr25rkksp@synopsys.com>
 <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
 <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
 <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
 <20260321021439.7pmcdrpb5oxbivct@synopsys.com>
 <5b378006-666f-4a72-902b-bb5f466f7895@suse.com>
 <20260324010523.3ufngdffak7ldchg@synopsys.com>
 <44ce5041-7286-4f59-837a-995c4e1307ab@suse.com>
In-Reply-To: <44ce5041-7286-4f59-837a-995c4e1307ab@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS2PR12MB9823:EE_
x-ms-office365-filtering-correlation-id: e5a81107-03bd-408c-460c-08de8a100ba8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 Pj2Z7bbWJYZOG9ohytZynAeivLK7d81+XAxB8akTuINP0IjoVU7pQVS30zOmMP/5obQp1g+dGdd7EnCD1ne1h37EhEaSGaIDeORvaJFmgt+xzdyviPpNubq9kKImMTqm4NgTAqH/mH6CD0izSgk26yx9G3v0/TVtewNhzkpF3IMT9a/PBeF0glrAscGrcITirmPmMLieut1tIUS/oum8+GY/eFbPnM97yerdM82OtYq/Y3rKCHhY493CrHUtmBB6vO7x5V+m9V53Q/9mm2EeMyo1HRSoVJpPnyMN8xquYiQsgJZm1OXw+tpLsOJC38hZx58VdxbWgdIpB+c696bXWkwOO2Can8Ey48kOEBnWX/kDiuMhM8k+SUJ7isvJ7Bzh8E0QyHXB4MUnvDKmfkQ1a7uKZWcR3ejniPYTe/BZeJ4yNMc48EUrnk0ROFpih+sExHb3EVV/N7GuUXOS7J6ZNqirsR2Z4Y804AiIv5prHCDlyynMWVgOprSrroBtNKCuPRa1BqZ2gIcvRmibXWucdkW6XBWQS6xGAUPO1f6Fi3cNnHMxzl/bWmgNq1o5bsDs3w6xIEVNj+LP0InO8NDx/oRIgIHW60E5xCyhrkG9MkqwuFTNQcHbVao31IgXDzQV8SrKs24k6X8NW/ZCdRVgBaiUQtWhKH8vbMctVVx2QO+wGTB6TgBeIyslKXcPe9toNZXfRFJkcbOeWY1CSf6JpQItJdSDBsSP+YoaL/232LZ1KlpSZ1cIE2T3uV/jicG6Wh2ITVXPHgDI3EUZl5ed0LXM55yschcxWWDJJQ7/YuI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VmlCaFJtV0I4MG1ZTWdZRFljQ3YwdC9PSGg5QUFMZHd6S2NYTFpxOWRSQkJQ?=
 =?utf-8?B?QnZjRDY0bVBJMjlXTlpZL3U3MkRYdUNWSUs0RWtBMkFZVytWN0ZEbjFoY2JR?=
 =?utf-8?B?ZTBXZkJYb1MxVllvaXoxNFl0QUFndzB6VTRDRHNRNlNvZ1R5amt3ajB4eW5G?=
 =?utf-8?B?SHNDS0VReGk3aWZyNkdRcXFjY2NVRlBoNWdBd2ZjZzU0c1c1Zms4VGlOWUhi?=
 =?utf-8?B?aGc3TXRueDFBUTRuSnNUYXIzUFlRRDFBU3V1RjNHWGdRZTY5NDJCYVNYSjdp?=
 =?utf-8?B?Vko2SmdDY0MvV05iaVdXU3FTbFd1OVY3cHVENWFxaFBoRVgrZy9raldIVXNa?=
 =?utf-8?B?OVFjWmZZRzR6a2QwZzJOUFo0ckFEVTg1WHNmdTVLOHFwRW9Xb0NpbkI2Wm51?=
 =?utf-8?B?OE5vY0ZmMyszZVV3OFI1dmxhWW9YZmo1aGtQRTNhbU1kWU5kdVZtc1l2UExR?=
 =?utf-8?B?WWF2dFJJSVZpQXkxZGhhNkJqeDkwWmJJYmtmYlphRFplV2o1YTUwYVJuN3pu?=
 =?utf-8?B?R1hGeW1xRmFPZkVFYnY1Y1paMUFKMTNPWjdLeGhEN3JpN2daSE1mRTR1Yit2?=
 =?utf-8?B?Q2tKM2hTZW9mNE5KVjIxaWJ2NmEyM3dEdWlieVlQeTRFaldCcnEzMlNhTGtp?=
 =?utf-8?B?N2RrdjNZaGFEQnRmVjZhdlNTTVpKVWU1SktQcmdQUzgvbG5PUCtoY1laUkVy?=
 =?utf-8?B?dWlFMi9QeWpNS0t0VXNKckFoZ1JtdnBFU2lVKzRFSlMwUzRoNGc5TE5VRFpz?=
 =?utf-8?B?T1Y3SGl6VjhBVVNxNFgrV1RaL0VWTWErSG9ZU002MFA5U2pMUmtEall4WmVJ?=
 =?utf-8?B?MElPek9qVStMaDJFaUNiUzBVT0oyd25BL2d0WjlJUk5oNkJxcUl6YkZoWWE1?=
 =?utf-8?B?ODcvRVVPWVhQUm5RR2ZleHQ0elpZUnowM1ZzaUY2Wmt5Rm42akxGNHk1WHRU?=
 =?utf-8?B?aVlpVWpkdVpiUWdwdGJqS05PcFRkcFRZNHdqcC9jVlJXV3F4REVLeDZxQ3da?=
 =?utf-8?B?K3hoRE03b1paR3FxL3NXbFU0dWdwYnJmdzdNTFF1ZnU3d0NCQ05BNUtHR2pN?=
 =?utf-8?B?YUtGLzVheFZRWEFFd3ZKQ3REbnNnUjF3TlZDWTZMK0h1UW01c0s4emMrU2Mw?=
 =?utf-8?B?eVBJR0hYRmQxelY5Z2JjelVaS3MwZmpsa1IwV295WXEycUdVaUdqSzFLZU5S?=
 =?utf-8?B?U3NVYW1hcnlDWnRiVWJOT3d4WUNzRklvS1dYSS9oejM1aVFveFBoY1ZYaHZJ?=
 =?utf-8?B?WDV2djVxTFpScGE4ZXRrV3dESU5tKzNsMFdmRE5ZcW5mNzBYa21OMmFtcVUw?=
 =?utf-8?B?YS93Mm9EK2NuU01ZRzlyZmlEYjJ1NklnTDR4enV0VHBvYWdVYUZyQUEvcEFp?=
 =?utf-8?B?aVowakpXekt3QlZjYmdVUlBNUWFFOHNBMkdkQW1NMHY2TmNjbWJYSFpFbktj?=
 =?utf-8?B?K3FHcVl2cVN2Y1QxVWVEMGcwSGIzUTJyOUJhRDBjUUdHa0RCeXRjQk1ISjJq?=
 =?utf-8?B?OHIvMFZVakdQKzBaaVhuUzYyeGhreEV1SDZSTmJaZzdaajB5b0RsKzF1aGJx?=
 =?utf-8?B?U3V3eitMMks5aktzYnNzSldXOFcyNWp3OS9Fc3oyQlZTNlR5eUg1MWpYT2Fm?=
 =?utf-8?B?U3lIRVpCU1I0WjA1dW9ZZW1jS25DTGx3RUp3aHRSdE5JUWN6RnhqWlRBV2N4?=
 =?utf-8?B?WkZnbVNXb25OWjFyRE5wbVdCLzBMVnFSMUdEWnU3ekJSQy9xUVZrTnlCc3E3?=
 =?utf-8?B?N1dDMFV2b0d2RmJvdVZjTVRHUlM2TFY2ZnpFVW9XTW56Q2IvUmRyblc5bUxR?=
 =?utf-8?B?Q1VqM0lrNlg1bEp1eGU1T3JLTHI4ZlhpN3VYWEFVbklVTERZTmorektURElH?=
 =?utf-8?B?OXhEcnZsbC9ONmVxeGpRMjBncEtuejJiOW1aRVp3SVZ1aEJFMTVmOHp2Ui9r?=
 =?utf-8?B?NEVRcjYrVUY5aGJxTE54Y3h4YmlodHl5UENZRlJuQ3ZBdlB6ZFVrRlVjY1BM?=
 =?utf-8?B?Ri9ZeStsclh6NFJ0RHFUd1Q0eWxqQS9aeGlkN1lEM0JUek5wL0R0WVhoZkxT?=
 =?utf-8?B?dmppV1k1aFNDL2lPQ1YvQTZvekVZeGRxVkMwWUtYbk9UbU9ORk5PTmdyQi9B?=
 =?utf-8?B?d0xsM1NrQTcrR0lJZGNwWnBRTjdjdHVkZ1ZjVkFQYXhySTF2ZDh6L3didEtt?=
 =?utf-8?B?S0ZSeTd2a1QrS2ljb3ovR3JGRzFRSTd1QzBCWXlYTU9hOHdNRjYzb1dBRlBT?=
 =?utf-8?B?U3dGbGZTeUtMRDVacmp0bXFYWEI1ZitRME9vVXo0bUtFR2V3ZUJRLzdwbCtn?=
 =?utf-8?B?c2sycXRkSUhJMUw5Rmx6d0FNeWFoZmhFWUE0YnA5SzBYNjlvZXhndz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B424DEE7A8CE794B9361B7BCB81C2EEE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Rr3AijhcDjgiGkys+iV6CBumK3+GIem0bggzp4FHivjyeJ1IrDBMpArbxdcaKdkXovkKMDeqcKR9nhg2dZJ6aLXEWDfKdRba3b/7aBgQf1hqfw6Cj36kffBdPhOLbs/50lzyiwGYH6n91SfA6gKYyXtJo9bIdqIqyjfG7tMz6QTqqW6eDZh62A2AC3RvaTpkRVOIzUFO0cNq+fQPKX9YABlja5bIhhWPXD08mt6/KDd8+UXS3EXZAaLJZMEQoEZ4gccjPHZrCClW6x6g5T7TCXXIbjrz7DCvdEJd613lCCPXpzeqnKy20T3+Ake2Cj5XfmJx/tXxtGmF7I6LfEghug==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8LY9vDkP8eOsa96gdOTW/Ttz44rcaK+/2zmj3KR1Ky5lxL8+9LfAnUbyICcv/MeB+vYmrnUXo9rMs+zD5N80v3k/PjGA+sfzv7qU6qADF3z+flQZcj6Hf4J3S7gjUUWCsEPDqLZnRBLdZGAO+0IlGrusx9kTj05IBCGXqwZPb9M6r1v1lpPXHbbL38mMSpApPoy/VHJ+SkDr5fH1QApUp9Xk5vhUZMu5UNCK5XmGqZ8D15l4C7g92wR5byXZISWDNf/UUEZmoXMa0G7UbCpTuCMWWlY9lh2OJwKGoEJMzE3w6AiuAt4guIONVqySNec5NfQe2yQeW5iNYUVRvTIZcwaFCXfIxf8/27YZwolpvWjX9EAzQpiqdQtza37SaUfz38Q9QuO90Nc4N47p0Rh+5izUM9MHrfTYAIXErVwtxfYOcFc5VoGO7uljPT298ueIRIKBLYMuVNdlHg3xnQwmc2SaqGu7w+eGEfEFJOHxxWm0hBa0ZSA9Xes3vFPhud3UECyyI3NKGH8m8+EZOW8JiUaoKzNGPvLi+2oWhuJZltT/yDhwN25X4wFN7b/zIPy8glh9jzRgiWPrjy+YxVQNFBeX8OFAw0AaMtfJpZm2HKCfOBZizhNQtgk32XZvqL+Hqe8cozkCuWt7eCgSWKlY4Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a81107-03bd-408c-460c-08de8a100ba8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 01:44:25.2608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 91FkmPavKwGg5ct0+eFqyDz3lBWeI50eLN1WUkFW3he0eS01zBGHnF1/UJr874w0cAJhnu6bllbu0BSM0Jnp5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9823
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAxMSBTYWx0ZWRfX4rUVjcv0JT5i
 SyJSXls+dJKtw4frLjHbQsZUk9Zhnx4Oc2h0HMn70U9q5E+fLTI4TwSwY6E+UjKw917i2e5TTam
 Z5xoCosLEA0SK2jBiBD8OKIx+P22Eobe8TNzkUlQbUi2cU87PxTb/tjgi4eEdmyNI/j7rNe3A1n
 ss+eNkssWQ6WWVL7DPgiKgFlTnfP1Hwug9cMleRjp3NHT0iEXllWluaTWWuXFTR482/YK+GiWaH
 gbMyHzeCjSNaZxFiuS1PEn3C3c/alkB6OLij0eIoWPqXxYgAv3IzxdHEHR4SM70/xEFhJ1b3GxT
 FQoJijNoJA17XCPOzdd2wj+diChfBowibcasIu4LKiaRKs5ty+tjVcmvdsfCuqUocI3uef7P9DD
 DP414FyxC+l33lBMLMo4cUPBree9TqdBuwJTIVDx1q3E7T3vKImyNJfMxUp6CWCeUJtbajmJToq
 LkQA/ugjhVkA/5DaFHg==
X-Authority-Analysis: v=2.4 cv=GsBPO01C c=1 sm=1 tr=0 ts=69c33e00 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=3-KnyrS_0JiVUugGbRwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-ORIG-GUID: Sp0c5EyUzNH-Cj-IdgXjynNYjgw2AhQT
X-Proofpoint-GUID: Sp0c5EyUzNH-Cj-IdgXjynNYjgw2AhQT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250011
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35421-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:dkim,synopsys.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,rowland.harvard.edu,gmail.com,mork.no,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8A5D031E612
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMjQsIDIwMjYsIE9saXZlciBOZXVrdW0gd3JvdGU6DQo+IA0KPiANCj4gT24g
MjQuMDMuMjYgMDI6MDYsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gDQo+IA0KPiA+IEkgYXR0YWNo
ZWQgYSBjb3VwbGUgb2YgdXNiIHRyYWZmaWMgc25pZmZpbmcgdHJhY2VzLiBSZXZpZXcgY29tbWVu
dHMNCj4gPiBiZWxvdy4NCj4gDQo+IFRoYW5rIHlvdSBhIHdob2xlIGxvdC4gVGhlc2UgYXJlIGV4
dHJlbWVseSBlZHVjYXRpb25hbC4gSSBhbSBub3Qgc3VyZQ0KPiB0byB3aGljaCBleHRlbnQgdGhp
cyBkaXNjdXNzaW9uIGlzIG9uIHRvcGljLiBUaG91Z2ggaXQgbWFrZXMgbWUgd29uZGVyDQo+IGhv
dyB3ZSdkIGRlYWwgd2l0aCBhbiBlcnJvciBpbiB0aGUgbGFzdCBwaGFzZSBvZiB0aGUgY29tbWFu
ZC4gV2UnZA0KPiBiZSB1bnN1cmUgd2hldGhlciBpdCBoYXMgYmVlbiBjb21wbGV0ZWQuDQo+IA0K
DQpUaGUgc3RhdHVzIGVuZHBvaW50IGlzIGJ1bGsgSU4uIElmIHRoZXJlJ3MgdHJhbnNhY3Rpb24g
ZXJyb3IsIHRoZSBob3N0DQpzaG91bGQgbm90IGdpdmUgYSBoYW5kc2hha2UgaW5kaWNhdGluZyBw
YWNrZXQgY29tcGxldGlvbi4gSWYgdGhlcmUncyBubw0Kc3RhdHVzIGNvbXBsZXRpb24sIHRoZSBk
ZXZpY2Ugc2lkZSBzaG91bGQgbm90IGNvbXBsZXRlIHRoZSBjb21tYW5kLiBJDQpleHBlY3QgdGhh
dCBhIG5ldyBjb21tYW5kIHdpdGggdGhlIHNhbWUgdGFnIHRvIGNhdXNlIHRoZSBkZXZpY2UgdG8N
CmNhbmNlbCB0aGUgc3RhbGUgc3RhdHVzIGFuZCByZXBsYWNlIHdpdGggYW4gb3ZlcmxhcHBlZCB0
YWcgcmVzcG9uc2Ugd2hlbg0KdGhlIGhvc3QgcmVxdWVzdHMgZm9yIGEgbmV3IHN0YXR1cy4NCg0K
QlIsDQpUaGluaA==

