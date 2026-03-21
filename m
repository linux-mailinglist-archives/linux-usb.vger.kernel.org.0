Return-Path: <linux-usb+bounces-35266-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3knPHzj/vWm8FAMAu9opvQ
	(envelope-from <linux-usb+bounces-35266-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 03:15:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7B12E2DF1
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 03:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19B2B3046EB4
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 02:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADE7286415;
	Sat, 21 Mar 2026 02:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bU01xTTO";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ecFRCyTs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mhNEGU7m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA272E413
	for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 02:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774059315; cv=fail; b=Jvr6dJ3cff9aXwQaXKRb+hoXFGC2lYLh5GoZy0QgNIrFWDSd74tXqGW+s9N3jQLhTuY14HKZo7zsi9v2+TlgfSx2ozszDpIYoqfUass3LkNCGLLeKtYpgcqYGQ3AmNI2jpkaqUksYnIKf2jn/uBzbsYv4EIx54BLz47Vx2t5jtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774059315; c=relaxed/simple;
	bh=HJA8IhRWr/wiRcfvRv4kOIMOPImBEDaI95cKzGOGDGQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R66Ttj7mYbS7qwnHkTqIpIOGBFdWDkkkKxBeXGm5I65QN15MMhzCySbXpSuE5p8TIa3gz1ZzuiCAWT0WBhnlPHWtPVIvJs8TRfsWgcstIwoKeelvuPQLHMnGjS0MeQ8ZJd0IJ/KLF6neLtTOQsvrgWJqHWbP35vBihf+XzgElNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bU01xTTO; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ecFRCyTs; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mhNEGU7m reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KM3Qj63342367;
	Fri, 20 Mar 2026 19:14:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=HJA8IhRWr/wiRcfvRv4kOIMOPImBEDaI95cKzGOGDGQ=; b=
	bU01xTTOjdLneog9JlmZWKCh7A9tHm0j+By4RbOyK1bTt5C0OoZsQgJwt0DBgqPI
	mJ31yJjAziV1y5uhWc5otnOn1PgYZdvL1zL+SuwxI58gi5t/m/jKStq1Q+E4sruY
	3xp59xwN2LkfcaM/y69XZFTOCszTc0a1oEcTiY4D7G2/f0OvaQvgMR6aDxNvVQl/
	Dsvhevz+s1TpZWyMzvrywKOPYdQoXb1e1p8ejXRsrBKMDVlaE2wUPBPoX5c9QJ8I
	jSXejnVlkQ26reOfD67hEhFYJTBT2kmvi328QCzEkcOruTjm5x7vexwmCen76qeP
	F0mGSAmNXsHJSu0gYT+NAw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4d17rab5a9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 19:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1774059297; bh=HJA8IhRWr/wiRcfvRv4kOIMOPImBEDaI95cKzGOGDGQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ecFRCyTs8jBNJfZI801vC3XVqLW4Os+q9k78TigXe+RKEzvnMUFU98PhbiGjMEbWd
	 HFL1Cu04yxqr+dErjOrifVwfBRtRNnL3yxkjXjM39CD6bS7D1JE2VgkejCxMCAGHlL
	 63bPVqIi6nESTKX8sNglFFQKohu/OtI9wJzy67hvFTWzykEGEK9rTN9W3alfT+wznD
	 9TNNu9fofZ7X7vd28PIzEsg5REoopvT1g488+OquaOeX2i/aKiNtGQI7vHi80KoEdS
	 NQWg9zYK1lnTj/vtiy7EfGWguULu0Zcqj60suzKC/uvzDG1F4iHYE8j88J+oueGExL
	 DKc+4tZUqK5VA==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8419C40143;
	Sat, 21 Mar 2026 02:14:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 09EDDA00A1;
	Sat, 21 Mar 2026 02:14:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=mhNEGU7m;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00102.outbound.protection.outlook.com [40.93.13.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id EB0024065C;
	Sat, 21 Mar 2026 02:14:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4+Jql2vBfD+RwokomkPoqsCg+QNfFPzCtbclY9o9Lyuqtgcb4G+mPQzWWTL28y8uTCZYOMbAP8vh1S8WCIrplpxR4p8/9aI6i1I6BoVDesD92BSCBWX/NsXxgKy2VV5gGpJJHEfJGt97Omz2cdr6FL8bLGSdn2zIwG1nCfXrYMOfeKil9Zgw6yqJqyWGcJE7jjhp3uwYiHnpLSvYZ8qytdoXRH3hhWBTrGS1US6Ciwn8iqBLSF7gK2q6iY+9FTOv2uOURAIm2zp8xtPsV1BNDGQ+Y9K/nL1zCKItEtiEpDtyeoRO5SEZyIDOxXrafXBbbrdmtbFzn0V0iDd/Zgmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJA8IhRWr/wiRcfvRv4kOIMOPImBEDaI95cKzGOGDGQ=;
 b=V4qvEIYtf2SWCE+oRayISP8+ScDHQnjK3Q3brLVO3QrE1a6Rj9Di9VzcO65Gdt3+UrjCzbBdmpB+r8hE+pVyc40gszk0yisRlE4TPVHGhljG99TX1l1wh0KALx4oXEJ3tzyyW/UmS2ZET1wXy7kARPELyyN6Gma0/l/FgDbt/TPN9BkbJfAp2tuIwtUTcWsFAkQ4hsSheoCCfXHq8oPSfquHR0KYtJqn4lhYRJbgTkwRWxRmAx89BSCaZp28W+jXYDGmyndQDB4vDQ97ldaFHy1XIkNDpK2Wi78jgH/4k/ee/7p+aorgR2Tyxo4qDouRq04cRsFKaV9DHTQ+hdgILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJA8IhRWr/wiRcfvRv4kOIMOPImBEDaI95cKzGOGDGQ=;
 b=mhNEGU7m04aCP9AaJJzlusF4N28QCP2ms8/mNpHwSEG+4S4avJLSgZHBsR4MuwPHYESby7Yg35NU2Mj101eEJ+Nq8NYBAP3MMx5AeOZ3QhUk7NGWKbMFatP1a9WwumYVRudeJLpK+QQwpTg+NubKQ9jqEGptimdNGOaJYrFx6hE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY5PR12MB6348.namprd12.prod.outlook.com (2603:10b6:930:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 02:14:46 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 02:14:46 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Michal Pecio <michal.pecio@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        =?utf-8?B?QmrDuHJuIE1vcms=?= <bjorn@mork.no>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Thread-Topic: correctly handling EPROTO
Thread-Index:
 AQHcsij3bm/3l4J2S0+poPtO9iFJorWq8pYAgAAa5gCAATtij4AATvwAgAB6AQCAAEFHAIAD0b0AgAARygCAAAy8gIAALjgAgAAhdYCAAT4QAIAAHoaAgAAczoCAAQmZAIAAg+gAgABA74CAACdBAIAAI98AgAFicgCAAR4GgIAApiGA
Date: Sat, 21 Mar 2026 02:14:46 +0000
Message-ID: <20260321021439.7pmcdrpb5oxbivct@synopsys.com>
References: <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <20260318235920.ioek26hdr25rkksp@synopsys.com>
 <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
 <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
 <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
In-Reply-To: <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY5PR12MB6348:EE_
x-ms-office365-filtering-correlation-id: 0ca250cd-bac3-4b3e-1cd0-08de86ef9f88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 JCOKdYiWYRZuoKvls3c2FH5inu7rq3VnfCakXQ2qliK7MZsGrAjxCRkMemB9VHC8wYabaMMyvkhWhlzfybLZGqUHoK/XGLnskMzr0n7D2BWHfo2oKMtEiQjLfeloMbKjZHy72sEIO5+BYp2R3S9serMjWa+KHVRtTsxaxDh8UxVdOIme0plMl3kOAJYlHMEn85BVNIfj3fe+QfACWAqNeAbS5hx97Nj0aGAx+mF1vrBtopvHU2irfvM/0xu5iR9GKTKyrhgVtoeEaAs3y7BxleCNNzzq7ss+f3WJojWDCxK4uzPc13ntRVgm9LXOOESPfkOPJTlaCmdEkYTnMaKzxeRxaS/u2J/B51R0nfjmP3x27LhmIui6+7fxqROe5eGQlcNp99HFA1p/qtdbVIW6KdMQqHOsfKybN+a6dkdb2ZWG7c7TVRR3DsmUFLI0CeZOfVWKxy4PFHO6xSggKDq7zWZJNWpDNmgwpYYYt1djepBRzC4jd/g3WFFicnQ+pJOz3+SWgiJPRJOclst++rsMye07Sb7DbyR4th0geVWDENl0FZRXXA3sVOdaeGUjdKRiqPjAI2WGJZ+vgqW30XqIeeanAN4N3XpzpiD+sTjZMBh/Bvbe8Lv5j6T5PY+Ooam/avgglDV9k5+UItigRM+sm2G0SJ3U3jEEAk1P8VR0GFYAMprl+fVeASIHAkmsTdHr9GjOnaNLNDl5XmsZdMOCUzOwo4WHzQe+dTzZFy0M02+5FZRz0Q6QVqFBZXeR4JZWnMiw3SlheBpIhSeyHs53LMH++dBrpKgOnLpA85LWd3Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2l6SEhoTE1nekJLdXZrL0RqVEVuNVNhMS9oaGdMZnRLZE9JR0ZQWTZOUUNa?=
 =?utf-8?B?WVVwYS9jcGtLUE1yTDFGQkIxZTFUaU1iTDBQNWRsenF5TnJ4bGVUdmVRcGNt?=
 =?utf-8?B?R0RGZVN6RU94NlFSNmRpa2dyRzl2VU1oR3NKQndqNm81Sy9aRzRMUHVtVCta?=
 =?utf-8?B?akFpazFJai9Kc2w5Sks4c0ZZUzNCU0hTKzUvQTc5MW9iTlZWRVIwcWhLcWM4?=
 =?utf-8?B?YW9WOE1BVnliUk1JQXpuVXZQcC9PeWdkTENCWnJMQzdRYnY4bkNHUHluN0kw?=
 =?utf-8?B?Y29IR3pScGJGakRMMVdUL3YwT1VJVFVHdkpTb282VzZpdUZRRlcrSFB0S1RD?=
 =?utf-8?B?UkVwQzU5bWZSc1FLS0dSVk50ck9jZExGLzM3MW1WWFBDRFJiVXFjdldEZnZq?=
 =?utf-8?B?T3hTeUVUY3RxbElQQUt0R0hyMDE4Tkt5aXlVNFo4Y1BpVzJnbjJhRTFMakZC?=
 =?utf-8?B?TDBPOTFsWGpGY3NLZDFOUlFTeDFtVi9FRmpiUHE4UGZIeExIL1FkYzloQU9t?=
 =?utf-8?B?YytBcGxJdG5MTWZDejc3d01KVXA3K3VBR2dCSGowa0s0MThiZDJtY1MrTkIr?=
 =?utf-8?B?bkoxL2UwM1RkRGpOQUpqd0NCOFhsODM2TjBUUitwTlkvelplbk96a0VnMEVU?=
 =?utf-8?B?eXpSdG9qTmliS25wbjVoTlVxYUI2RXI4YmdRSjhQOXdyQnpsaG8rY1lYc3Vo?=
 =?utf-8?B?eUJBZGJuRXV2SHFvdzc3aGZ1bjVQcGlPUUxTeFY0YWJtR3RFMjRDTnBsRTcv?=
 =?utf-8?B?bEJDUlk5eUxqZWtCOFlXaUMvVVdVelRJb1RVWnlpdE1FcUJsUFBNN3JXRWxY?=
 =?utf-8?B?aGt2SXBteDdqODNDcVdjQVUzcG0zWkZleGlkMlBtUnRwQnFadVFBTkV2RWNX?=
 =?utf-8?B?VXNuTFQzc1BQTEI2N3hkallXTXlhTzZ0WEVsQUJ4VjA3SGpPOEJyTlFsM1pH?=
 =?utf-8?B?TXdrMnRoV0t2SVIvV3ZkL09nQ2NtM3N2K2F1L2t1c0ZEVzIyYTdVZ1N6UGZ1?=
 =?utf-8?B?T0ZQTUdjUmdjYmoxVTJISU81RUJsOVpqOXJYdWJZU3FWZGxXQWozR0VWeUky?=
 =?utf-8?B?Y0tWd1lmdDJmWkloUXpuRVA3TkJTdXJmTmU2eGw1QUllMWpkMk9tYUFnWWhr?=
 =?utf-8?B?RThkUXNKN295dXRSbmdrTjlIUEtGUjgvczlZbTdqZHdCRTBWckJCai90YVY4?=
 =?utf-8?B?SjBwaFBNYzkyWWs5UlpwbDhxYjB2L2VmRWVRTmdZNEJ2cG9CTW9ZbDJLK3U1?=
 =?utf-8?B?Y280RGhuNU03WmdLNmh2alVLSDNBaUlLY3NvQzN5NHNqRzI1TGdNWk1RZGRz?=
 =?utf-8?B?aDJDaDlWSEpvT1V2SUh0ZCthYVJDaWdWOWNYb1kzbUNITzRsUlV2N0pjNHpU?=
 =?utf-8?B?NGFwU1BJeWRkNGxnakRTTDBUSnpWY0VzVHhrUW85aXFndW1uRE9Kcll1c0Vr?=
 =?utf-8?B?RS8yYUpncmlkeEhSTUJsK2tqcXpQRkVuR3hkbE9xUW53NUowUjg4dDdJN2Mv?=
 =?utf-8?B?NHc3cDNhVUwyYytISnNrU1BiTFBqblhEMkphRHQwL3FuNkx1aTZ0emwvNTFT?=
 =?utf-8?B?ZVk0aWxPenNRWm5PbG5XTkxvY2s4M0EyaUh0VERmMklJaEE4V3BMV0JMQkJU?=
 =?utf-8?B?dkFWbHl3ajE1aXBCTFk1T2g0YUxwYUloZVBxOVY1SnhacnlrcEpDV2JJQkZM?=
 =?utf-8?B?RzB3NnBkNWhpSDBDMHAvY2hTcEtMNWRGV0IxclJaTUYrenZ6ZWtoTUhaZCta?=
 =?utf-8?B?dW5KcjZQSmljMDBESTdhRUUyb3ZnL2RuMHMzRTVKODArbmExcENNUDFSQzAv?=
 =?utf-8?B?QVEyK2ZrTDZaZmtndDBhT05LODQ0ZStJMFc5Z0xyMFZndXRBQmtET0JNUE0x?=
 =?utf-8?B?Um11eVBsTER2Vy9Dc3FHbktMK3ZNYTV0U0ZvcEZFWWg2L0tSYzRLK1RJYVk5?=
 =?utf-8?B?azNrSktIcXc1bHBuWVpXMGQ5a0dqQU9NbWZnVU5CcmtXTXF6QzNwRVJKT0p0?=
 =?utf-8?B?dTRPL0c2L0NDU3l0TnNJdHJ1bE01aE0zM2lId0FpMWhFSmVIYjFjbldoclZR?=
 =?utf-8?B?UGw0YktKTFovWUl2MFp4dHRGN3pmenQvUUZKdnM5TFlmZDlFQmxkUVpYTE5i?=
 =?utf-8?B?cFNWWGo1Vy9qa2w0c0ZneENOMlhCaDZMREJIZ2tXN0M1R2lmM3ZWajJRV3Z3?=
 =?utf-8?B?cWFTZDI2cHBRaUVHVkV2enA5VjRXS0VzYnVhd05WWmlMUEZUTFoxNDYrbVlZ?=
 =?utf-8?B?ak0yT2JnVk5xZ2kwVTBlbTJYM0l5blhMNm5BbU9VWndxaC9LeUk5bTRiVU04?=
 =?utf-8?B?MlNtT0o5V1hpbWtYK1ZzWmUvOTYyVVUxOEpOUDV4RWQvS3NuNEVGZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D724868F3ED9C94B8DE14E35AB07DFEF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	nf/2OecLHKwOkcPlFhJnlK+IJFFfUjG3A0eox/C6g/NTUpm/32N/vv6SVOTO8hJbDJbZDX+kaqWxjfXzScslIvAPQ5ZMmzoSMs+o8mjW9JVp+TsyWLbmUhT4Rf1evjyiA6SaDZ8S6C106E1pjkHVE6iD+fo7jQsXzWutQ8k4BdDs+Q9hHLxmU9xdRMygoiIt2NF4ZEvIt35Ck8sElbRG1pYgZLjSAvpJOakKbWYLPVtpjvMs95/u1WWl0qHoymHXLN9fyRsQf1RPdTjyreNsrK6hJf1YOLue9besnCV2WqisGVJB0Qa+KVUMGVzRAhl3R8QBNwAzLEt2Idv0pzy1iA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	txFeKppjn6LvsMlLldSjVKSTsLlZ6pdkXvd9WFM0x9XYhclWibWv3hTX7WGxiDsOb9hqm2p6hbaLHly4Kdy4u1ZN41CLIpUcKoWcWzP2hedTaU/9/os75mXb+BeVFM5UON/FQ4qtBOb9OCMSnqlp1VXwaqzq3F3M164jWcvcmgjPpCI29QrAVY9Eh3MflaK04gP1quECKLy7+pUj9JPnUz9yxaT99zyAO3wBvliKdTy4Q1/EHzzWB7qoyVO0sQSWlr0fIIc3k7IB4xJ40LiroocnD0WCs5Kae5K6jILrAUPvkVmqHjZ3MoPBgEaRex3CL0lNM89A01RQRPWassctKc6Wfua8zegzZiZP1tnolhzvvFQHWjjNN+MVJUkOQPbelRjqzK0HXwxh/YqN0UGiZNc3PtvZk5J+FyEfcTZTD73zxQDaRTwW9176oJhD3FCw3Z3viH/rk3g3VreBZ6cQzdC+rZ7pFw6jg+ivKFFeaQ6OViM0pj33yNvm/OT6XvgW0nTzi/559Jj0pxers0MnOseqCVnBi5CbjyD1lMWDVOXfcRDCCXnNu8R1yU9yrmLmehF6Hx0TLmHBgFaq6YwI1UGskgPfSjKFPVy6+a2Yq2DWdBCYR5k4DkarcRi+4Dr0gqwKvffW+YKNvGUqztx2Lg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca250cd-bac3-4b3e-1cd0-08de86ef9f88
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2026 02:14:46.4355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sraEmD+JS6psL6r6Xz0I81jE2DmAXyW/XEIWj1Ovjww1ZxFaxRNaK22FrRpGsv/ufvcsjMeGCjyDCoDIoQSUYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6348
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDAxNyBTYWx0ZWRfX4uZ2XMYIcF1m
 Ht0/00sB53UAhrC0g2PLTjKloXzK78ClSLSPxv1QLsH7wiP4CFOPk2YIWXJ2jeSikviSbGJ8Fpj
 XC3GYZQvH7kVA7dvHQEGLrrPKWLDr8FUTwNuUJF6LadbgNX8qsgRCMSOAuRLh3/9cxRy6IsBjxa
 XrAGOCxuWJ4bFwZhcx6RTXaYMjobF/1Z0sHcctw79b9cTVx1UFa8QGGyhs3WwzEU4ehqzXGsI0m
 5skJMSddf4T6vMnLgJPCW7wodIO6Om9tRnVoXzCmiKFq3DTpgUWg+mRsOsIPxcsQRlUphVlajSS
 LSqctuA4BESM5R2yLgJM6vVl92xgbFPECtSJjuew+e1zqC4W89IImtuLYaJz3DJpfVkjYeZtx6i
 xkGEKn8LbOWJlk7D0toJBTio8kEDaQapwplCsXS3rg4lO6+BE0HCipT2X2jJ0CyWYXPEQVFrWvZ
 kK5/u9faxXRhiVvix7Q==
X-Proofpoint-GUID: Zd2j3jvyYUvTxveFZrG9ZQBj5WxtlYvb
X-Proofpoint-ORIG-GUID: Zd2j3jvyYUvTxveFZrG9ZQBj5WxtlYvb
X-Authority-Analysis: v=2.4 cv=GulPO01C c=1 sm=1 tr=0 ts=69bdff22 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=uXKlA3loZ-tuP_uAFU0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603210017
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35266-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,suse.com,mork.no,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CD7B12E2DF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBNYXIgMjAsIDIwMjYsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFRodSwgTWFyIDE5
LCAyMDI2IGF0IDExOjE2OjIyUE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBX
ZWQsIE1hciAxOCwgMjAyNiwgQWxhbiBTdGVybiB3cm90ZToNCj4gPiA+IE9uIFdlZCwgTWFyIDE4
LCAyMDI2IGF0IDExOjU5OjIxUE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiA+ID4g
SSd2ZSBzZWVuIFdpbmRvd3MgZHJpdmVycyBoYW5kbGluZyBVQVMgdHJhbnNhY3Rpb24gZXJyb3Ig
cmVjb3ZlcnkNCj4gPiA+ID4gdGhyb3VnaCBjbGVhci1oYWx0IGFuZCByZXRyeSBTQ1NJIGNvbW1h
bmQsIGFuZCBpdCB3b3JrcyB3ZWxsLiBJIGhvcGUgdG8NCj4gPiA+ID4gc2VlIHRoaXMgdHlwZSBv
ZiByZWNvdmVyeSBpbXBsZW1lbnRlZCBmb3IgdXNiIHN0b3JhZ2UgYW5kIHVhcyBkZXZpY2VzIGlu
DQo+ID4gPiA+IHRoZSBmdXR1cmUuDQo+ID4gPiANCj4gPiA+IEkgZG9uJ3Qga25vdyBhYm91dCB1
YXMsIGJ1dCB1c2Itc3RvcmFnZSBoYW5kbGVzIHRyYW5zYWN0aW9uIGVycm9yIA0KPiA+ID4gcmVj
b3ZlcnkgaW4gYXBwcm94aW1hdGVseSB0aGUgc2FtZSB3YXkuICBBIGNsZWFyLWhhbHQgaXMgaXNz
dWVkIG9ubHkgaWYgDQo+ID4gPiB0aGUgZGV2aWNlIHNlbnQgYSBoYWx0IHRva2VuIC0tIGJ1dCB0
aGF0J3Mgbm90IGNvbnNpZGVyZWQgYSB0cmFuc2FjdGlvbiANCj4gPiANCj4gPiBUaGF0J3MgLUVQ
SVBFIHJpZ2h0PyBXaXRoIHRoaXMsIHRoZSBzdG9yYWdlIGRyaXZlciBrbm93cyB0aGF0IGl0IG5l
ZWRzIHRvDQo+ID4gcGVyZm9ybSBjbGVhci1oYWx0IGJlY2F1c2UgdGhlIGJ1bGsgZW5kcG9pbnQg
aXMgU1RBTEwsIG5vdCAtRVBST1RPLg0KPiANCj4gQ29ycmVjdC4gIEFzIGZvciBNaWNoYWwncyBj
YXZlYXRzIHJlZ2FyZGluZyBUVHMsIHRoZXkgZG9uJ3QgcmVhbGx5IGFwcGx5IA0KPiB0byBVU0Ig
bWFzcy1zdG9yYWdlIGRldmljZXMgYmVjYXVzZSBhbG1vc3QgYWxsIG9mIHRoZW0gY2FuIGNvbm5l
Y3QgYXQgDQo+IGhpZ2ggc3BlZWQgb3IgZXZlbiBhdCBTdXBlclNwZWVkLiAgQmVzaWRlcywgZXZl
biBpZiB0aGVyZSB3YXMgYSBkZXZpY2UgDQo+IGJlaGluZCBhIFRUIGFuZCB0aGUgVFQgbWVzc2Vk
IHVwIHJlY292ZXJ5IGZyb20gYSAtRVBJUEUsIHVzYi1zdG9yYWdlIA0KPiB3b3VsZCBzaW1wbHkg
cHJvY2VlZCB3aXRoIGEgcG9ydCByZXNldC4NCj4gDQo+IChUaGVyZSBtYXkgYmUgYSBmZXcgb2Rk
YmFsbCBkZXZpY2VzIG91dCB0aGVyZSB3aGljaCBjYW4gb25seSBydW4gYXQgZnVsbCANCj4gc3Bl
ZWQuICBGb3IgaW5zdGFuY2UsIGF0IG9uZSB0aW1lIHdoZW4gTGludXMgcmVwb3J0ZWQgdGhhdCBo
aXMgd2lmZSB3YXMgDQo+IGhhdmluZyBhIHByb2JsZW0gd2l0aCBzb21lIGxvdy1lbmQgbWFzcy1z
dG9yYWdlIGRldmljZSBzaGUgdXNlZCBmb3IgDQo+IGtuaXR0aW5nIG9yIGNyb2NoZXQuICBJdCB0
dXJuZWQgb3V0IG5vdCB0byBiZSBhbnkgc29ydCBvZiBwcm90b2NvbCANCj4gZXJyb3I7IHRoZSBw
cm9ibGVtIHdhcyBjYXVzZWQgYnkgdGhlIHVzZXJzcGFjZSB1dGlsaXRpZXMgdGhhdCBwcm9iZSBl
YWNoIA0KPiBuZXdseSBhZGRlZCBkaXNrIGxvb2tpbmcgZm9yIHBhcnRpdGlvbiBhbmQgTFZNIGlu
Zm9ybWF0aW9uIC0tIHRoaXMgDQo+IGRldmljZSB3YXMgZXh0cmVtZWx5IHNsb3cgYW5kIGhhZCBh
IHRvdGFsIHN0b3JhZ2UgY2FwYWNpdHkgc29tZXRoaW5nIA0KPiBsaWtlIGEgbWVyZSAxMDAgS0Ig
KG5vdCBNQiEpLCBhbmQgdGhlIHV0aWxpdGllcyB3ZXJlIHRyeWluZyB0byByZWFkIGFsbCANCj4g
b2YgaXQgcmVwZWF0ZWRseSwgd2hpY2ggdG9vayBhIGxvbmcgdGltZS4pDQoNCllpa2VzLCB3aXRo
IHRoYXQgZGV2aWNlLCAtRVBST1RPIHByb2JhYmx5IGlzIHRoZSBsZWFzdCBvZiB0aGUgY29uY2Vy
bi4NCkl0IGJldHRlciBzZXJ2ZSBpbiBjZXJ0YWluIHRlY2ggbXVzZXVtLg0KDQo+IA0KPiA+ID4g
ZXJyb3IuICBPdGhlcndpc2UsIGZvciB0aGluZ3MgbGlrZSAtRVBST1RPLCB1c2Itc3RvcmFnZSBk
b2VzIGEgZGV2aWNlIA0KPiA+ID4gcmVzZXQgYW5kIHRoZSBTQ1NJIGNvbW1hbmQgaXMgcmV0cmll
ZC4gIFBvc3NpYmx5IHNraXBwaW5nIHNvbWUgaW5pdGlhbCANCj4gPiANCj4gPiBUaGUgcmVjb3Zl
cnkgSSdtIHRoaW5raW5nIG9mIGRvZXNuJ3QgaW52b2x2ZSBhIHBvcnQgcmVzZXQuIEEgcG9ydCBy
ZXNldA0KPiA+IGlzIHZlcnkgZGlzcnVwdGl2ZSBhbmQgd2lsbCBpbXBhY3QgcGVyZm9ybWFuY2Ug
Z3JlYXRseS4gSSdtIHJlZmVycmluZyB0bw0KPiA+IGFuIGludGVybWVkaWF0ZSByZWNvdmVyeSBz
dGVwIGF0IHRoZSB1c2Igc3RvcmFnZSBkcml2ZXIgd2l0aG91dA0KPiA+IGRlbGVnYXRpbmcgdG8g
dGhlIFNDU0kgbGF5ZXIuDQo+IA0KPiBJIGRvbid0IGtub3cgd2hhdCBvdGhlciBzb3J0IG9mIGlu
dGVybWVkaWF0ZSByZXNldCBjb3VsZCBiZSBjYXJyaWVkIG91dC4gIA0KPiBUaGUgQnVsay1Pbmx5
LVRyYW5zcG9ydCBwcm90b2NvbCBfZG9lc18gaW5jbHVkZSBhIGNsYXNzLXNwZWNpZmljIHJlc2V0
IA0KPiByZXF1ZXN0LCBidXQgdXNiLXN0b3JhZ2UgZG9lc24ndCB1c2UgaXQgYmVjYXVzZSBleHBl
cmllbmNlIGhhcyBzaG93biANCj4gdGhhdCBwcmFjdGljYWxseSBubyBVU0IgbWFzcy1zdG9yYWdl
IGRldmljZXMgaW1wbGVtZW50IGl0IHByb3Blcmx5IA0KPiAod2hpY2ggd2FzIHByb2JhYmx5IGEg
Y29uc2VxdWVuY2Ugb2YgdGhlIGZhY3QgdGhhdCBXaW5kb3dzIGRpZCBub3QgdXNlIA0KPiBpdCku
DQo+IA0KPiBJbiBmYWN0LCB0aGUgZXJyb3IgcmVjb3Zlcnkgc2VxdWVuY2UgdXNlZCBieSB1c2It
c3RvcmFnZSBpcyBhcyBzaW1pbGFyIA0KPiB0byB3aGF0IFdpbmRvd3MgZG9lcyAtLSBvciBkaWQs
IHNpbmNlIHRoaXMgZ29lcyBiYWNrIHF1aXRlIGEgZmV3IHllYXJzIA0KPiAtLSBhcyBJIGNvdWxk
IG1ha2UgaXQuDQoNCkp1c3QgdG8gYmUgY2xlYXIsIEknbSBub3Qgc3VnZ2VzdGluZyB0byByZXBs
YWNlIHRoZSBjdXJyZW50IHJlY292ZXJ5DQptZWNoYW5pc20sIGJ1dCBwb3RlbnRpYWxseSB3ZSBj
YW4gaW50cm9kdWNlIG1vcmUuDQoNCj4gDQo+IE5hdHVyYWxseSwgVUFTIG1heSBiZSBhIHRvdGFs
bHkgZGlmZmVyZW50IHNpdHVhdGlvbi4NCg0KV2luZG93cyBoYXMgYSBjbGV2ZXIgd2F5IHRvIGhh
bmRsZSB0aGlzIGZvciBVQVMuIEl0IHNlbmRzIGEgY29tbWFuZC90YXNrDQp3aXRoIHRoZSBzYW1l
IHRhZyBhcyB0aGUgZmFpbGluZyB0cmFuc2ZlciBvbiB0aGUgY29tbWFuZCBlbmRwb2ludCwNCnRy
aWdnZXJpbmcgYW4gb3ZlcmxhcCB0YWcgcmVzcG9uc2UgYW5kIGNhdXNpbmcgdGhlIGRldmljZSBz
aWRlIHRvIGNhbmNlbA0KdGhlIGNvbW1hbmQgYWxvbmcgd2l0aCB0aGUgcGVuZGluZyBkYXRhIHRy
YW5zZmVyLiBUaGlzIHB1dHMgdGhlIGhvc3QgYW5kDQpkZXZpY2UgaW4gc3luYyBhZ2Fpbi4NCg0K
QWxsIGNvbXBsaWFudCBVQVMgZGV2aWNlcyBtdXN0IHN1cHBvcnQgb3ZlcmxhcCB0YWcgZGV0ZWN0
aW9uLg0KDQooV2UgY2FuIGdvIGludG8gbW9yZSBkZXRhaWwgc2hvdWxkIHdlIHdhbnQgdG8gcHVy
c3VlIHRoaXMpDQoNCj4gDQo+ID4gQ3VycmVudGx5IHdlIF9oYXZlXyB0byBkbyBhIHBvcnQgcmVz
ZXQgYmVjYXVzZSB0aGUgYnVsayBzZXF1ZW5jZSBjYW4gYmUNCj4gPiBvdXQgb2Ygc3luYyBhbmQg
dGhlIHhoY2kgZG9lc24ndCBzeW5jaHJvbml6ZSBhZ2FpbnN0IHRoZSBkZXZpY2UgZm9yIHRoZQ0K
PiA+IHN0b3JhZ2UgZHJpdmVyIHRvIHJldHJ5IHRoZSBjb21tYW5kIGRpcmVjdGx5Lg0KPiANCj4g
VGhlIHNhbWUgaXMgdHJ1ZSBmb3IgRUhDSS4NCj4gDQo+ID4gV2hhdCBJJ2QgbGlrZSB0byBzZWUg
aXMgdGhhdCB0aGUgZW5kcG9pbnQgY2FuIGJlIHB1dCBpbiBhIHN0YXRlIHdoZXJlDQo+ID4gdGhl
IGNsYXNzIGRyaXZlciBjYW4gc3VibWl0IGEgbmV3IFVSQiB3aXRob3V0IHVuYmluZC9yZXNldC9w
b3dlciBjeWNsZS4NCj4gPiBXaXRoIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIHRoZSB4
aGNpIGRyaXZlciwgd2UgY2Fubm90IGRvIHRoYXQNCj4gPiBmb3IgYnVsayBlbmRwb2ludHMgd2l0
aCAtRVBST1RPIGVycm9yLg0KPiANCj4gV2hpY2ggbWVhbnMgdW5saW5raW5nIHF1ZXVlZCBVUkJz
IChlaXRoZXIgYXV0b21hdGljYWxseSBieSB0aGUgY29yZSBvciANCj4gZWxzZSBieSBoYW5kIGlu
IHRoZSBjbGFzcyBkcml2ZXIpLCB3YWl0aW5nIGZvciB0aGVtIHRvIGNvbXBsZXRlLCBhbmQgDQo+
IGlzc3VpbmcgYSBjbGVhci1oYWx0LiAgT25jZSB0aGF0IGlzIGRvbmUsIHN1Ym1pc3Npb24gb2Yg
bmV3IFVSQnMgc2hvdWxkIA0KDQpUaGUgY2xlYXItaGFsdCBkb2Vzbid0IGhhdmUgdG8gYmUgZG9u
ZSBhZnRlciB0aGUgdW5saW5raW5nIG9mIFVSQnMuIFRoZQ0KeGhjaSBlbmRwb2ludCBpcyBpbiBz
dG9wcGVkIHN0YXRlIGFmdGVyIGEgcmVzZXQgZXAgY29tbWFuZC4gQXMNCmxvbmcgYXMgdGhlIGNs
YXNzIGRyaXZlciBkb2Vzbid0IHN1Ym1pdCBhIG5ldyBVUkIgdG8gdHJpZ2dlciBhIGRvb3JiZWxs
DQpyaW5nLCB0aGUgeGhjaSBkcml2ZXIgY2FuIHNlbmQgYSBjbGVhci1oYWx0IGFmdGVyIGEgcmVz
ZXQgZXAgY29tbWFuZCBhbmQNCm5vIHRyYW5zZmVyIHdpbGwgc3RhcnQuDQoNCj4gd29yaywgaWYg
dGhlIGNhdXNlIG9mIHRoZSBlcnJvciB3YXMgdHJhbnNpZW50IGFuZCBoYXMgZ29uZSBhd2F5Lg0K
PiANCj4gSSBkb24ndCBtYWtlIGFueSBkaXN0aW5jdGlvbiBoZXJlIGJldHdlZW4gcmVzdWJtaXR0
aW5nIHRoZSBVUkIgdGhhdCANCj4gZmFpbGVkIChhIHJldHJ5KSBvciBzdWJtaXR0aW5nIGEgbmV3
LCBjb21wbGV0ZWx5IGRpZmZlcmVudCBVUkIuICBCdXQgDQo+IE1pY2hhbCBpcyByaWdodCB0aGF0
IHVuZGVyIHNvbWUgY2lyY3Vtc3RhbmNlcywgd2hlbiBjb21tdW5pY2F0aW5nIHdpdGggYSANCj4g
bG93LSBvciBmdWxsLXNwZWVkIGRldmljZSAod2hpY2ggaXMgY29tbW9uIHdpdGggSElEKSwgZGF0
YSBtYXkgZ2V0IGxvc3QgDQo+IG9yIGR1cGxpY2F0ZWQuICBJIGRvbid0IHNlZSBhbnl0aGluZyB3
ZSBjYW4gZG8gYWJvdXQgdGhhdC4NCj4gDQoNCk9mIGNvdXJzZSwgYXMgSSBtZW50aW9uZWQsIHRo
ZXJlIG5lZWRzIHRvIGJlIHN5bmNocm9uaXphdGlvbiBtZWNoYW5pc20NCmF0IHRoZSBjbGFzcyBk
cml2ZXIgb3IgaGlnaGVyIGxheWVyLg0KDQpUaGUgeGhjaSBzcGVjIGFjdHVhbGx5IHN1Z2dlc3Rz
IHRvIHBlcmZvcm0gY2xlYXItaGFsdCBhZnRlciBhIHJlc2V0IGZvcg0KdGhpcyB0eXBlIG9mIHNj
ZW5hcmlvLiBXaGV0aGVyIHRoZXJlIHdpbGwgYmUgYW55IGNsYXNzIGRyaXZlciB0byB0YWtlDQph
ZHZhbnRhZ2Ugb2YgcmV0cnlpbmcgd2l0aG91dCBwb3J0IHJlc2V0IGlzIGEgZGlmZmVyZW50IG1h
dHRlci4NCg0KSSBjYW4gc2VlIHRoYXQgdGhpcyBraW5kIG9mIHJlY292ZXJ5IGNhbiBiZSBkb25l
LCBhbmQgaXQgc2VlbXMgdG8gYmUgYW4NCmltcHJvdmVtZW50LiBTbyBJIGp1c3Qgd2FudCB0byBw
dXQgaXQgb3V0IHRoZXJlLg0KDQpCUiwNClRoaW5o

