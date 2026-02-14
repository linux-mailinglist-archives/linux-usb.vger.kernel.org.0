Return-Path: <linux-usb+bounces-33351-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFSoIiS9j2niTAEAu9opvQ
	(envelope-from <linux-usb+bounces-33351-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 01:09:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F02F13A1AB
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 01:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 338513007BB8
	for <lists+linux-usb@lfdr.de>; Sat, 14 Feb 2026 00:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066A718024;
	Sat, 14 Feb 2026 00:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="sxM8ycu0";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="h3ildcYv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="N3rhIMrx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C934E1799F;
	Sat, 14 Feb 2026 00:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771027745; cv=fail; b=PdgEqosH/lERytHNaenrYNBpoiFjhj7rkRF/IuMZky35Cyz2h2mEn7p/0rSa8b3qEQ86B6BxhSer8ZIk1h4hxnXLV9dKHYQ4MEJzyUDvYMyBVLGBn9TVUPqCSgOwi/HXVfaZzHaoapD/Reg4VxCk1a3fOBH9g1x9i1R3M+kbdCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771027745; c=relaxed/simple;
	bh=iwNaNA0xb5p+vWrg9LYRIbV5vQUJgJMlujSYoGErUj0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ukzRXxmWsv38zJx86ylf3bloqth40+QkAIu/+XjitP1Jot9mWzqj9SOSmoN+mHgHdjC2u/i+rqa6iB807poXr2uVYxH8fXN0QdUbzEvqpo1vEfYj7wykH7IHFcncx5yJXsAn+Yy5n6zFDtRK3pQ3zPj+YGvEQZIG8dVQnkAzrpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=sxM8ycu0; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=h3ildcYv; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=N3rhIMrx reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61DLB2BU501919;
	Fri, 13 Feb 2026 16:07:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=iwNaNA0xb5p+vWrg9LYRIbV5vQUJgJMlujSYoGErUj0=; b=
	sxM8ycu0WEoWAnKSPeCwpgAaL+J+73Rr5p2gT3wXM+gGLw3Y/cCro5E7/5QvkvkB
	vbPZYHRzoU2u0Ji3fdPqRIgcc+ZiYg81uoyly0xTshLCg/LscdDhPP2rAfIvqPVH
	VmNItF/M2jZCyyAqMepyPnnn74RDq7V0oX6lbOpPXr3KOaxuchWOmsuPOKCwu3J7
	DrjkYwDsssSFej+8gtLCKgod2aeYP5LhiYhIad6ot9pxGZEiZ+8ujbAy3300gfvk
	SCD4S9OoVR9fCVibMuEyfqcpbLmvCxGEbIphJxMQOQfqPhrvC+xRIEjX1AdY2c3U
	BYEtDr8DwIV9GQVd2uMeHQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4c9tg7wce9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Feb 2026 16:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1771027651; bh=iwNaNA0xb5p+vWrg9LYRIbV5vQUJgJMlujSYoGErUj0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=h3ildcYvm7Sh71RxT5GfmKm3WbYpivpGzxW8D+EqW0kUxSYrdxvNz24wSi/ckFjTV
	 Fq+SVTlHqHdlvKbkgpJdB+LYCKsq1keyXEgGDWll9ZBXEF+mTiNXyV8uomstG+IfGI
	 sYueuZsFBdG4hAtcGN/jjM3dvmFU9tfdTrWz5T7pmGUaPizCX1zQsqiGOzYfgieitX
	 mrYPcZvW8fk8/af9Dx7rDVF3CQVYv1mS+NA3L034CUG6vGnhBmSVbHzzszOHUKLaaC
	 /j66Gv4P0OijVH3F6AiddeYL6PieM2eEneHjowdXM6fih59AriDdv/ljQC01x/LrD+
	 PMhqAKucj13gQ==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 377EE401CD;
	Sat, 14 Feb 2026 00:07:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 22CB3A00A1;
	Sat, 14 Feb 2026 00:07:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=N3rhIMrx;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00104.outbound.protection.outlook.com [40.93.10.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B708C405EA;
	Sat, 14 Feb 2026 00:07:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDt69/Xz0Q65eQsSiJdnipdbF5NyzHIh+7H0e+v8h9nuGD+qIC2xaQXQVJN7ToCB3/p3Kfub0zeoYzQ7TQC+/Cj+aCMTcdASYGSPyC42lBZ5oObuFimmlAnlvK8xruInpA8xlDvCmvfiLWx6TGnseElvrW/ssdkaXSRDd26JvN0upzaPXxhAgLywlgkM1jo/To0GXFNP7L1K7oMZAoiTg1CLk6LcPE5WZWm1lxwo/tXDPCaw73uO7XtPf9bYnd1zBVKc7m0CvPUpAEzrhQkIRalPdtINnykDftYByjGB+1EfU53Zm/kY1/M0Uasyn12oCx/21VPa6B+OUw+io88Qtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwNaNA0xb5p+vWrg9LYRIbV5vQUJgJMlujSYoGErUj0=;
 b=u+5BoE8TC1r6MrcTyt+aD7ftjkuj5eBWLQH9FNZkwCWR1Lrsh3fYnS2N3D5CgJc0s4GcE9EUnvSz+7xEjaaNtXWdUSyps8KwtqsjkBoCbZJNPdGJ8WOJQhr7CEHwIYg+icJ/LBaFZpQOk+JvwwqlaBdsgy+Q+faL/6GlhgGnBY9nEpomkkm9185ZBx2BrLhEnt9QXsY/HLFQv607L1UO69KtA8mv0Aw3u4zyY9NvHzbt9TAq8AdCZdEQuczVIdNB7KO2WoaFBRTz4R+rvqWSrskcY0exAxVjE3KKl7hl/soaFFYAgWE54UroKNDnuDoaHYaO97kLuBPUAfMfkvZtpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwNaNA0xb5p+vWrg9LYRIbV5vQUJgJMlujSYoGErUj0=;
 b=N3rhIMrx1wAHTQTb5l/kSecP0L9RfVMF7O9fC1XkcaVme9ZxcLylcQZitlnjUvmMsxCL1ckDotmnGQBxUPXzLj5ka/i8xFHlnO0+h78KbcHLx6mWBNIl61Zs2NIEkz9uDOocd1thjJk2XiHhvlj+F6v23M8lDV0lJeqOSUa9EoQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS4PR12MB9657.namprd12.prod.outlook.com (2603:10b6:8:27f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Sat, 14 Feb
 2026 00:07:22 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9542.009; Sat, 14 Feb 2026
 00:07:22 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Votokina Victoria <Victoria.Votokina@kaspersky.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
        "rogerq@kernel.org" <rogerq@kernel.org>
Subject: Re: [PATCH] usb: dwc3: am62: handle usb2_refclk enable failures
Thread-Topic: [PATCH] usb: dwc3: am62: handle usb2_refclk enable failures
Thread-Index: AQHcleA75cB5zKKQo0SQSZsrhM0EO7V7HS8AgACYq4CABaomAA==
Date: Sat, 14 Feb 2026 00:07:22 +0000
Message-ID: <20260214000716.cnreguzwzbc6j4me@synopsys.com>
References: <20260210003034.twbkgavdegwlnsvo@synopsys.com>
 <20260210093659.2268056-1-Victoria.Votokina@kaspersky.com>
In-Reply-To: <20260210093659.2268056-1-Victoria.Votokina@kaspersky.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS4PR12MB9657:EE_
x-ms-office365-filtering-correlation-id: 900008ba-e7c7-41fc-0421-08de6b5d06df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bVhvVENLSmR0RVMwaWE5RXVxWFp5ekc3MHU5Qy9LWHlwL3RXWWVFZXRkdjRz?=
 =?utf-8?B?NVAwOFNmdmliaC9NME5HQXdJL1pmK0NMWk5tYmR0WStYN1lqK0dWM21iNVBr?=
 =?utf-8?B?V1BIOW1IdjZ1NVpRV1QyVDN5R0swa0lxWkZhaFRTNFFDT0kzUUw4akFKYmVH?=
 =?utf-8?B?OUEyWEJobnIwaWxVT2toZHR5OUFZdHdHVmN3VEYwOVkvaDV3enY2b0pMdHlO?=
 =?utf-8?B?K1pNeEh3dVlsekptZ0pnRllEeHRZcU1PUkkyRGpxd0FOZzVJaUZ4RHRxUzFy?=
 =?utf-8?B?dnc4QUs0R1VjVGxBZVlYVzNCTk5KeTNLOTdMVDh6bmJicnorSnNkc1R3WEl3?=
 =?utf-8?B?RUs4U2U3SDFrWnA1eVlPSTZCeVluVVNERkRuaG1PaDRqT0lCMXNVVjJsYWlp?=
 =?utf-8?B?WC9zUzRkdk5Yd2QyV1dqTnBTbC9TTjRtRWlUampaTkpzS0NzYjFJRlE3d1po?=
 =?utf-8?B?LzhoK09xV01hQnMrWnJla01Bc25PbVZjZUFrSkZTc1JlWkM5aWNaVDRHZC95?=
 =?utf-8?B?RHk0Sm13eS8yUWtvZ0Vrak4xcUVjU3JSNXVqRXBzcXhWYW11RE5RdCtqZll2?=
 =?utf-8?B?M1UxSXZUanNYcG5PUFBYdlhlL3lZM2ZmbmpaWjRFVXlvZ1pzRGl1eWVvVWZ0?=
 =?utf-8?B?SjZRZ3RPR1E3emxSQUdIS2JLdFMzSEJoYVFuejA5NGxDK1lyMTFmUkMvWWJv?=
 =?utf-8?B?MzFuRmRacysyaHRsUWx4SmlXeXJlRFY2SkdWSG5PUWppZjBmd2k0ckJ1QjZP?=
 =?utf-8?B?N1BaNS94S2tNY1pDVTc0cWtPMS9udFRWRFZIVkhtcmE4NXFmSUlEWUthZmND?=
 =?utf-8?B?blhWcFdjMm5MTHVnK1F2eHAwYjJFKzd6QUFTSzhOUVRRVlBPMUFkWjNzZk1I?=
 =?utf-8?B?bEUvdTVQd3owbHpDUytZSFRDOHBNQ29JWkpzdnh1aDNVWVUvdkpzY1pnRGk5?=
 =?utf-8?B?V0pKUkZ1R0RMOXJsNHhQaXQ0anpWMTRQeFhSN0NnUXJBc1VMbWtYYTZHNk41?=
 =?utf-8?B?cE44Z0NiUzA1Rnpqc2VPNkhpeEdUbVEwZC9kMDJUS29qL1loL0xxd3NlUFg0?=
 =?utf-8?B?WUtjSHhKSERReC9BcHFUek1ONlZ2SS9la3FZTndQZUovRzdNUkxBNnRVMWR5?=
 =?utf-8?B?SmNHL0RtUmZMbnhKTEVEbHFsNXdYdTlYakRxNnZCa3hPcXR3eUZaL3p0dnZI?=
 =?utf-8?B?SXNWYjBXeXpTUnRwRmN6akRsai9nOXFmRFpBOUw0YjM3UnlPTytubjBpZ3Qr?=
 =?utf-8?B?bm10K3paQXVqVTdFTzZDYkR1eE5vVU5YWG55ZUxCSUpqNXRZd0xQSG5aK1RK?=
 =?utf-8?B?bXhydXMzbkRGR3FORmNyUEpldmppTEJsUGp5QjFaK1QreEFiWSszeG9pSlAy?=
 =?utf-8?B?RUNzbm1FaWdRTzZYVE9mQm1jMktDb3dKYkdMS25rTDRlRzgrWUhyemh6OW51?=
 =?utf-8?B?YllaRkVmNzZkalBsNXJTQ2QwUXZLUUhZMUZZSngyK2N3ck9INlZSL2U1dm8w?=
 =?utf-8?B?VmF2c294UzBrK3JRck1rU05OWXJranpZb3RkQWNQUTZvYmhZNTg5U1Fqd04v?=
 =?utf-8?B?RFZPNjlMWVI2dmJXTUhWVHdjU2RMb3lCOGlreHk1Y3lGUGt5WWYyNUJJMFhT?=
 =?utf-8?B?WEpZMXg0c01vcisvVDZpQ0VUTU1XSm5PQ1c1VmpaZkZhSjFmK054bE5EU0dW?=
 =?utf-8?B?azNhOVFQbmJ0K3NFVVZmeTRyTVZSdk9uWDdxQ2Y3dzRYMjYxakVRVmc3VWll?=
 =?utf-8?B?OVhRQVc0YWJUdGhMeG5LZDc3bVpaRXIwM2c4RUUxS21OVTJiWGRBWG9aMjJO?=
 =?utf-8?B?REM3RTFSMU5heGpQeFNZNUN5cEVyZEM1QSs5ZVMvVkNpOWZtMHBxU1dGRW01?=
 =?utf-8?B?VSsyQkdVa1llemJuRW5laG5ISUcva2NUVWJ6cVRRWHR0dGcxNVNibEhuWXc2?=
 =?utf-8?B?YnB0WlB2MnpDTUQzWDBEM21jak16RXNrRkh1bnpxWENYdENOS3hiM0hwOGhD?=
 =?utf-8?B?QXBCUFB3N2dnd2s4MUdnT3hjZU9jSWxyRm9HKy9NVzVwM0RNdWlhNzhkay8y?=
 =?utf-8?B?cVNLL2tBRStPTkIzV0hkYmV4eGtZT25aQzIyaEtPY0pkVnp0anJGc1hKR1Rw?=
 =?utf-8?B?cGFBZXUwdHZ1cG12QUI0c0x3MHdqam9oSmlCMGRJT3BnYnFTS1owR25ibDNC?=
 =?utf-8?Q?YOYJ/GOfzETwlsiMKwBDPlk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y3ViSHpNNXl5TTdTOCtFc29jbTBqRlk1c2c5SThnS05OWDJVU3ZObkd4OHhD?=
 =?utf-8?B?QUNWRno2RVpKanV2Zjd2aDlHL2grWFdmVWQ4OXJRcmE4N2lNSmlMM29QbXNw?=
 =?utf-8?B?VS9PTW5Gd2ZIcTZPUlBmOWFDYjdjcTlCMVc0ZjRRZW1kcnhja0hacHZScHVF?=
 =?utf-8?B?b2RCMlFUNEE4NXhQY2RlQmU2b2VHMUNTSFp4aXJpdTQrMzhZTGErOG55NUIy?=
 =?utf-8?B?a0ZUQVRYMENHOHZCSGl1ZzNWRncxOWdSN3c1QWxxUGVCU1FPYW9JMFhDK2hx?=
 =?utf-8?B?N1d5bjI4c2dXMnlvWTNkMVVlWkc5c1BFS2JGeXkrZE9zODladXEvTzJYaWJZ?=
 =?utf-8?B?cnRZSlB5YmwyZ2xpc0ZObTFES05SMStYQ2xGMlRqM3dUb1VJdUMrbVJadGhV?=
 =?utf-8?B?Q0hpcVRnZDEvQldjTXhXZmdJNGFLdTZ0YncwZGsra0l0S1ZUOVVoQi8wbHRw?=
 =?utf-8?B?d0pSbmo4VkNNOWdNTm1RQUlGV2pRNW5rczg2TXhSSGxYc01aYnZrdWZlUkFC?=
 =?utf-8?B?aCsxNHNJbUQ2aVF5S2gxUjhSUGZiWmZJMndsa25EUWFFRGE4MmR5aFM1QllH?=
 =?utf-8?B?MXRsNFF5R2luUkR6c1ZFUHY5SElzTHVuamZhWGd3TWw1Rm44M1pTRHdQOTV4?=
 =?utf-8?B?NEpGQlFxK1pQZll3SXNCUUpsTHFmU2tLU2FvYS9vRmw2YTF3T29WSmk2UzlL?=
 =?utf-8?B?cGZIN0JWS2dNajhUcUJpbk9pSmppTXMxUTBWY0lHRVROUHhocWFEK0xBaHNK?=
 =?utf-8?B?c3RtbWUwUmhsVkNOQVJ4cDJENmFkVmNURXA4OVRiR1FXRVA5akhQU0g5Nkwv?=
 =?utf-8?B?cE9keUhZWllUT0tVajlMZHBLa3lIazEwRTd2QW9lcUgzdUxFOS8vSWxURnEy?=
 =?utf-8?B?Umdseng3MDVzdFBxamluRm1xQ0xqSStmSFpBOEpsaEVvQnorRDBZY2RmQ2l6?=
 =?utf-8?B?T1lCT2F2b2x5R09tL0dndHIydHR6VFp2T0dYNGZQdlB0V2ZkRk04R0I3UGVp?=
 =?utf-8?B?SlduOVdDcDFJWmN6WFcyTWdqak5PcWFtWXExZWZjWWl4TGtPVURFZXdvZUtk?=
 =?utf-8?B?ZXFPQ3BDTGo1RmJoSjhTbFZuRDZuNTRRaUg0NkFtMXhaMUxXMmlYMVhnd0V2?=
 =?utf-8?B?aU9wSG8ycWVCUXl4ZzVMN2kyMkZ1amZ2YTBDQ2NnSExpdVNvUGcvMWo0Z0Zt?=
 =?utf-8?B?RkFQMEs4Q0lJM0RqUFhiM05mdjB2ajluN2Y2ZWVYWDRZWWJTeTJoTVA1SWE2?=
 =?utf-8?B?WE52clkwdlorVStVYUlWMVpPdEZyYUJqNnYrTTVxa0JnTTZFUkVLNmVFS1NZ?=
 =?utf-8?B?UGlrWXFaakdubGxKZGIvMjFQbGJpRXl2eXlxdWhWRWIvWmsyQ2llVGtTQVNF?=
 =?utf-8?B?VlVLMWtuU0Ztc2FWS0Uzd21ldTJPN1R2cEdPR3pyWkV2T2lKNWFIcVhNQzdv?=
 =?utf-8?B?RGx6K0xDRzFvSU9KWUdWd3RsNkJJM08rV3FhbFVORVhJZHJ2b3A4SVUwbXp5?=
 =?utf-8?B?YU4zRWJ6RjUvSFVXOWJ6LzZ4ZlJHUzltSnpZWnJaR0lRT1VCdlZUMUlobGov?=
 =?utf-8?B?UHdqRHhaUDFkTUY5SjZwSUZDUU5JNlBXSEdmVkFYcVJLby9JMFBEZDUzUm14?=
 =?utf-8?B?NjNZOFNpRWNQRWRkMTgram1MZVhUZVk0dlQxdzF5aFFncm1BVzJ0NE5HQVk4?=
 =?utf-8?B?M091V2c5d1ZaekEvWXRHUlo0QzVkWVROT2Q3a3dKcGlSM3F5N0t4Ukg3T2Jl?=
 =?utf-8?B?Ukl2TEFGeHhiNVRQa21hbW1HNkxVYVBWS2NxUTFhMXlJQjBzU2RPYkZrR044?=
 =?utf-8?B?QlVORXZuU3lFeUl5ZytVUG1BbmVqL1d6a1dmYytNTHZSZHlBd1VTbmlteVF5?=
 =?utf-8?B?UW0rSzQ3b1h2RXh6eVo5K3Q4ejRhOUNEcnZneGc1dU5adFpwdG5STFdwcXJP?=
 =?utf-8?B?RzFXZ2RMOTB4Mm1kS0hIc0R4YUYwSE0xbUQvemZKYnZacjMybERjcTRKUFBV?=
 =?utf-8?B?Y2UyTDlqQkVTQjVaQ1hIcXNEM0lGVWcxMVpMV1NqOGtjbXBOVlY2NDg2NmND?=
 =?utf-8?B?bCtXS1RTOXJtSmRTNlJGQ0V4RTh0TEZvdGVQbXh2eWNod1FiR21oeUhZSHgv?=
 =?utf-8?B?SS9CUkdQWENLVGlRS2tOL01KdG5GcUx5Y0Y1cTl3MVVCcWEyZEpESi9lMVZ0?=
 =?utf-8?B?OHBjSWltR2l6ZjE2WjFtQUF4WDNnWEwwSlozb1lmRzdRZURNekp0by9zemp6?=
 =?utf-8?B?QytLbVBTdkM5eDlHWXNwKzhQUzRUeDd6dXBPdlZqcmpkRDFabHhJTC9oYngx?=
 =?utf-8?B?ajJIWGt6UDBYZjd0VDhaZWpRbjNuZ0Q1YStoYWQweWIybnJnSmt2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57964806D007664EB4946CCA431B65A5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eUyKm1d/FA6Pc7gpFVfKjXlOERG8rXg6b7ze1039N2NXrpqE1jJ8UrjkO9o+Pex9p8bZW8AJH7rNKA9mnAcV+c1s5mxeH6915QkZf4Umu5hnV8zgfFhsbwAw0qULZMQNn5BG54tk9/qoYOJCI27IVEKiHS4YMrxhtxSPzTZc/tGhoD+jrQd2/R1yIZF65pQA2EKIdYDhhlt717dWHPPERy6z5hPdc/sb/fXypw0+HudE1JAhCyQ69MHbUxzivuWr0ug6olKfTNoQRfhdH0fr4CgKxDA6AtFNuwrPsIOXo0LqScDOShZ1xR6daJrjEqOtLMODRISeUFiZQ7MpXJtB3wEgxcjzSv49uneWHBxnFPUeIZmGiCSZXSqo2vitzfaImHQOOUg7e/ti5vlIiOsErthKYp1cwnELz2B2nzWwG8sAmdp3jrN/3bxT5h6SHq7w4bjMInUCK0VIyrnJ12wkvBmCEqEBIsWgbi/pZKsgV10hPGUQKsNXI8yXAwEv/vyPLz16X9QJROY7KG4j9H3C5szAYkQRJLBxt+FfqG4tpBOhoL3OQeyCyCiSWwCyWKfXdsBYzlHNlb1hU00dLOWSMtOd8LRvRTfyITn+uRATCvHPD1yD81ESP7wvjz1N2kJfQV5LPkTtduQmBcfPU79/Mg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 900008ba-e7c7-41fc-0421-08de6b5d06df
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2026 00:07:22.4581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rwaN6L5AaJKCCJkQCmCKqiAz7ysSBvxMLxqR+RPRlHQwA9VPXUchDajTb2Gj0svGUC0xTP1uowL7SrvYIhEZXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9657
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE4NiBTYWx0ZWRfX+4bJTzIgWIM5
 MLrNIr4Buc7al/CXcWTJJ+1fMzLje7KRWHqRC8sVabn+aruLIXf5oI6qkhX2GX1ZoET71uhHsPa
 pUJtxkOFGFq4kGy4Ez1N7v7ZkT3HWNXnJHLwEI4L1I+in9XnrEechhk2JVFHvN4oKyEo5TuucoG
 FtZw/OyPzu03rDGdy28UgOQQ/ckNb9trDtWkOY1wpil72RlpxmZvLhiagagG0mKjDIGin20Yyf4
 bdjgOibqdc9JUYC3AyL/1GU/yfeVKReGtLEp3mNqsOjIgkBd62Kng0JtECWmZbptsI4YFWyk7Be
 qG9J21lYligXuNrbbIdJRSb4EGTKWx4MP8wkfLrKKwAFs3PZmU4mDyx/TwNzzn2JV1u9DVrw/Jz
 CiK+zE8pX/JyonAsGQw5YRUq4uJapWk3E2fzg2yNGoe5EaiWUNDBHei+VRb2qIEtpLZAaTl6qZw
 hWAiFbpWFj8Y7e14xhQ==
X-Proofpoint-GUID: maRVp6pt8wLFYoD528TW7iziFYFkl279
X-Authority-Analysis: v=2.4 cv=GrlPO01C c=1 sm=1 tr=0 ts=698fbcc4 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=9VXgxdaWft4w39k99r4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: maRVp6pt8wLFYoD528TW7iziFYFkl279
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_05,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602130186
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TAGGED_FROM(0.00)[bounces-33351-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:mid,synopsys.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1F02F13A1AB
X-Rspamd-Action: no action

T24gVHVlLCBGZWIgMTAsIDIwMjYsIFZvdG9raW5hIFZpY3RvcmlhIHdyb3RlOg0KPiBUaGluaCwN
Cj4gDQo+IFRoaXMgd2FzIHJlcG9ydGVkIGJ5IHN0YXRpYyBhbmFseXNpcyAoU1ZBQ0UpLCBub3Qg
ZnJvbSBhIHJ1bnRpbWUNCj4gZmFpbHVyZSBJIGNvdWxkIHJlcHJvZHVjZS4gVGhlIGFuYWx5emVy
IGZsYWdnZWQgdGhhdA0KPiBjbGtfcHJlcGFyZV9lbmFibGUoKSByZXR1cm4gdmFsdWUgaXMgaWdu
b3JlZCBpbiBkd2MzX3RpX2luaXQoKS4NCj4gU2luY2UgY2xrX3ByZXBhcmVfZW5hYmxlKCkgY2Fu
IGxlZ2l0aW1hdGVseSBmYWlsIChpbmNsLiAtRVBST0JFX0RFRkVSKQ0KDQpDYW4gY2xrX3ByZXBh
cmVfZW5hYmxlKCkgYWN0dWFsbHkgcmV0dXJuIC1FUFJPQkVfREVGRVIgaW4gdGhpcyBjb250ZXh0
Pw0KSGF2ZSB5b3UgdmVyaWZpZWQgdGhlIEFNNjIgcGxhdGZvcm0gaW1wbGVtZW50YXRpb24gdG8g
ZGV0ZXJtaW5lIGlmIHRoZXJlDQphcmUgYW55IGRlcGVuZGVuY2llcyB0aGF0IGNvdWxkIGNhdXNl
IGRlZmVycmFsIGV2ZW4gYWZ0ZXIgc3VjY2Vzc2Z1bGx5DQpvYnRhaW5pbmcgdGhlIHJlZmNsayBo
YW5kbGU/IFdoYXQgb3RoZXIgZXJyb3IgY29kZXMgbWlnaHQgYmUgcmV0dXJuZWQ/DQoNCj4gYW5k
IHRoZSBkcml2ZXIgY29udGludWVzIHRvIHRvdWNoIGNvbnRyb2xsZXIvUEhZIHJlZ2lzdGVycyBh
ZnRlcndhcmRzLA0KPiB0aGlzIGNhbiBsZWFkIHRvIG9wZXJhdGluZyB0aGUgSVAgaW4gYW4gdW5k
ZWZpbmVkIHN0YXRlLg0KPiBNYW55IGRyaXZlcnMgdHJlYXQg4oCcZW5hYmxlIGNsb2NrIGZhaWxl
ZOKAnSBhcyBhIGhhcmQgZXJyb3IvZGVmZXJyYWwNCj4gYW5kIGJhaWwgb3V0OyB0aGF04oCZcyB3
aHkgdGhlIGNoZWNrZXIgY29uc2lkZXJzIHRoZSBwYXR0ZXJuIHN1c3BpY2lvdXMuDQoNClN1c3Bp
Y2lvbiBhbG9uZSBpcyBpbnN1ZmZpY2llbnQganVzdGlmaWNhdGlvbi4gSSBuZWVkIHlvdSB0byBw
cm92aWRlIGENCmRlZmluaXRpdmUgYW5hbHlzaXMgb2YgdGhlIHBvc3NpYmxlIGVycm9yIGNvbmRp
dGlvbnMgYnkgYXVkaXRpbmcgdGhlDQpBTTYyIHBsYXRmb3JtJ3MgY2xrX3ByZXBhcmVfZW5hYmxl
KCkgaW1wbGVtZW50YXRpb24uDQoNCj4gDQo+IFJlZ2FyZGluZyBkd2MzX3RpX3Jlc3VtZV9jb21t
b24oKTogeW914oCZcmUgcmlnaHQg4oCUIHJldHVybmluZw0KPiBkd2MzX3RpX2luaXQoKSBkaXJl
Y3RseSBjaGFuZ2VzIHRoZSBjdXJyZW50IGxvZ2ljIGFuZCBpcyBub3QgY29ycmVjdA0KPiBhcy1p
cy4gVGhlIGludGVudCB3YXMgb25seSB0byBjaGVjayBhbmQgcHJvcGFnYXRlIHRoZSBlcnJvciBm
cm9tDQo+IGR3YzNfdGlfaW5pdCgpIHdoZW4gcG93ZXIvY29udGV4dCB3YXMgbG9zdCwgd2hpbGUg
a2VlcGluZyB0aGUgcmVtYWluaW5nDQo+IHJlc3VtZSBzdGVwcyAoZS5nLiB3YWtldXAgaGFuZGxp
bmcpIGludGFjdC4gDQo+IEnigJlsbCByZXNwaW4gdGhpcyBzbyBpdCBiZWNvbWVzOg0KPiANCj4g
cmV0ID0gZHdjM190aV9pbml0KGFtNjIpOyBpZiAocmV0KSByZXR1cm4gcmV0OyANCj4gYW5kIHRo
ZW4gY29udGludWUgd2l0aCB0aGUgZXhpc3RpbmcgZmxvdy4NCj4gDQo+IEkgYWxzbyBzdWdnZXN0
IGVuYWJsaW5nIHVzYjJfcmVmY2xrIGJlZm9yZSB0b3VjaGluZyBVU0JTU19ERUJVR19DRkcuDQo+
IEFjY2Vzc2luZyBVU0JTUy9EV0MzIHJlZ2lzdGVycyBhc3N1bWVzIHRoZSByZWZjbGsgaXMgYWN0
aXZlOw0KPiBpZiBjbGtfcHJlcGFyZV9lbmFibGUoKSBmYWlscyAoZS5nLiAtRVBST0JFX0RFRkVS
KSwgcmV0dXJuaW5nIGVhcmx5DQo+IGF2b2lkcyBwYXJ0aWFsbHkgcHJvZ3JhbW1pbmcgdGhlIGJs
b2NrIHdoaWxlIGNsb2NrcyBhcmUgb2ZmLg0KPiBUaGlzIGZvbGxvd3MgdGhlIHVzdWFsIOKAnGNs
b2NrIGZpcnN0LCByZWdpc3RlcnMgc2Vjb25k4oCdIG9yZGVyaW5nIHVzZWQNCj4gYWNyb3NzIGRy
aXZlcnMuDQo+IA0KPiBJIHRlc3RlZCBjb21waWxlL2J1aWxkIG9ubHk7IEkgZG9u4oCZdCBoYXZl
IEFNNjIgaGFyZHdhcmUgdG8gdmFsaWRhdGUNCj4gcnVudGltZSBiZWhhdmlvci4gSWYgeW91IHBy
ZWZlciwgSSBjYW4gZHJvcCBhbnkgY2hhbmdlcyBiZXlvbmQgDQo+IHJldHVybi12YWx1ZSBjaGVj
a2luZyBhbmQga2VlcCB0aGUgcGF0Y2ggbWluaW1hbC4NCj4gDQoNCkZvciBzdWJtaXNzaW9ucyBi
YXNlZCBzb2xlbHkgb24gY29tcGlsYXRpb24gdGVzdGluZywgSSBjYW5ub3QgYWNjZXB0DQpjaGFu
Z2VzIGZvdW5kZWQgb24gaW5jb21wbGV0ZSBhbmFseXNpcywgZXNwZWNpYWxseSBwYXRjaGVzIGNh
cnJ5aW5nIGENCiJGaXhlcyIgdGFnLCB3aGljaCByZXF1aXJlIHRob3JvdWdoIGludmVzdGlnYXRp
b24gYW5kIGNvbmNyZXRlIGV2aWRlbmNlDQpvZiB0aGUgaXNzdWUgYmVpbmcgYWRkcmVzc2VkLg0K
DQpCUiwNClRoaW5o

