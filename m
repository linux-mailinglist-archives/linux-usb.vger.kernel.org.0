Return-Path: <linux-usb+bounces-18355-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF809EC0E4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6FCB2825D6
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06743D0C5;
	Wed, 11 Dec 2024 00:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="nLL5kMGz";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lDv43Z4l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NcqEgnjI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066B817C8B
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877242; cv=fail; b=RVwsqAZBNd6vjaEwupA5Y3NMi+4iYzcazBRgUznNKF4wBkSgGz9NdZZzoVOIYwy6VQWC3N5bjja5pynnmy3pBgwDWxFAjjPblNX6JdkJANy8KtwQYZ0eJ0+d3CCYP9MhN0IdUaa0VUAtCoA/kMipc0hZCs4GjaF7g4aIEFESiic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877242; c=relaxed/simple;
	bh=Lr15AbdgDncZ98FAo+OWYqHL624Iax+ytDIK1SHQ5p4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ShMDRhbGTqYPDeyf6n8VhG81CxT+NJ93y+eDEyzXz20KbnZszyPacEk7vzy5c0Bmh07ocRC+N7+DZ+LOAc364oWZkmY6lwZZ+GfBFc0RvFLGxRkCioIPsMpoRn26gZnDgwoVJQftdz1i5KncwKHUrudqay5aOHbf+p2rqesbAE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=nLL5kMGz; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lDv43Z4l; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NcqEgnjI reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAMVk65010832;
	Tue, 10 Dec 2024 16:33:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=klS7lpgVmvLHoVeehrhlIaompsbJx6W9uWqzgEjmnLA=; b=nLL5kMGzsx/h
	4ccum1H88qtuUlU+RbQrmKSRBrseBEAXLluHfBHcdfaAYZhaaykKzywSDJ9CKE87
	oB9D5bXhm66mnf5R5en9DwP8BAeIFuk4Mm8g1TrpKzhFxJkgu40mSAMcLRF4fskg
	pKaDhEPBqwwMN/lFcmhlT7Afm1eTXT4yHsU+hhyyWAl3zX79cxEjJT+6y37htudh
	+x9+e4sMytnC7SbWTPqfI1+eBDCJ7JdlBEg7AC4ebaciuQ06UtMfk7QnREAj356N
	WZDcFHsD6Hnjb7VBD5G4ejNBgftFe0h5Yf7L85odsqcnc0qRijnMR+DG+e25l1m5
	hh7xDdN8jw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cpgb9q3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877234; bh=Lr15AbdgDncZ98FAo+OWYqHL624Iax+ytDIK1SHQ5p4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lDv43Z4l7UdzSwgTKsRCYEWB6VoF/H88xCmqGu3mBRLLfV8h5AzWIISAl6VpGJmx0
	 TDxnRd1AHHpo3eifo1UXjV2cFWOp/+apFshsLWgIzO6ikgEteojqpeJiLgElYQBfB+
	 Bp6IREfL4mvWRIi1dZ/levOOmlzKE4wr8N1+Km30CukMx8cwqa8OWL5rH0bHW7qc02
	 oQoBPgNcwYVLWNhDDdoh5hP0DI+c7VFl0H8Fg0wHw1X9hvjeJvtARUhhqOHZzJXqkJ
	 7D5bdRsp5qsCUB/p/7FPx6jo1mcXb1Orz3KoVKzlj9UbFUGJBKGza5nUo5E6nwWUm7
	 SsMjdQ7m5RCRw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1D776401F8;
	Wed, 11 Dec 2024 00:33:54 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B798EA005F;
	Wed, 11 Dec 2024 00:33:53 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NcqEgnjI;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 67EF1405EA;
	Wed, 11 Dec 2024 00:33:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQCm9gfoFt0KVbdmUbGhz7X32SrfzeMr9e8vugR9GZPl4y4m5gCUa/3/bnxlHTuBoVWLBh504GavmxXuHeH8idMItrRfgjL+gnWs3czHCO+/BJqsyV4l7bYtAvKXHMI4Yac5iCoWOys9c3LBiMB4UhzDxgWO5I8RCuoOGBc+5Kz/IXHKDpWHdA++J6WHtrmD7UMpANzqiYnFI0gPmvtmdcojYWQwFkjE429jyNURmOEHMwMLPxeNYlB72F3sEkcKaFVN7pFdOVQ8CRMifZQ0A2CIbxrxTYBAFv/DaxzI31YIAEsY+i0WN3Hkmr2SFvRokEII4QlGAE10gUj4sCYXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=klS7lpgVmvLHoVeehrhlIaompsbJx6W9uWqzgEjmnLA=;
 b=Pwpa1/niLwyld4TfUyuWGQWmnxOFaHem0klEthOlP6ZUvguegbBKIC2x9TiUX9mVDATTmq9mLb+WSVpy0kfYnQbrG9SbQhmdsluMeE2iTS0FuBnVtp73xwm3yqqrzxafq+6TTc0lS1uK+iBR/A/zdsPnqZkNB1k/yWQMqZkXKJewV+h3N9gkbFRJIxrGNNHNmjqqedBP52oU/fENuQ+ibfymdAV83nmCugCQV4HEq8k5LW58wROF587vwOF8VsR7FYFmlepNnzJiXZlCrLRwsGdKwqPSgZRn/5JlElxl8PeEo/sQXPQr36fcwfPMeaDJIJ7ZR4q/8c+b2XJWwFhebQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klS7lpgVmvLHoVeehrhlIaompsbJx6W9uWqzgEjmnLA=;
 b=NcqEgnjIOqw9mVlElJvqRoC8ca01NV+qtCCh62HwVxARPlZao95AI8W7WzxDVLvUODXxMbNopoiSPSdihlMSE2nfat5sENu1quL0lohEuqDy5n4hCEe50FH00p27ETg+J7gCntX4ROGltNG3+NsLlGSq5GUH5pSPWDinKOGC1Xg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:33:51 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:33:51 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 23/28] usb: gadget: f_tcm: Handle TASK_MANAGEMENT commands
Thread-Topic: [PATCH v3 23/28] usb: gadget: f_tcm: Handle TASK_MANAGEMENT
 commands
Thread-Index: AQHbS2RZIqz1YKbGoEi+NnLha4u+vg==
Date: Wed, 11 Dec 2024 00:33:50 +0000
Message-ID:
 <50339586e36509dadb9c208b3314530993e673b6.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: e77703d6-3d41-437e-a1cd-08dd197b7c13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?znoP2vOeJaABCckVQnslBZtPNP/hK3f/XZJ5XyAeJ/fh01GMv8SUOkTobG?=
 =?iso-8859-1?Q?lOJm7oKK19DnJjshOx689u76y1aMMd99+LuGFulv7l4JCn23v1/sE+nh/f?=
 =?iso-8859-1?Q?yIsEfaqyN/R08CV0QvR4vdnHsM6/mlUec308Ny30L5Ao+o58FkwAnW+vLO?=
 =?iso-8859-1?Q?mayz80/Yz8XvJF780xbWpMD71YFVjoaBjSarETktP47VxQMJ0AJ9JOZxww?=
 =?iso-8859-1?Q?l9dR8gorFT+nfB5EUwVmJ6UU93j+i+oagERTRRyKAQVtmeo8/z5LltbgH6?=
 =?iso-8859-1?Q?/HZcDeZHkuePysKiW1ILok1jbHRXevPgKaOikTnQXcYvpaieOAdSpVDhqW?=
 =?iso-8859-1?Q?hDf/iP3HiLsC3x34SCOaQMlrlF26eXbQPkVj4+1OwkefX2kyfgYJ2i0M7g?=
 =?iso-8859-1?Q?9SdfomVYo2eBV2RiKtFreMymxy0pT7vx3mIczfkEEVF5dUjsfEmdu+0WED?=
 =?iso-8859-1?Q?iGIh2LoiPFv6/jDqHAEY7Wer1+yq3PRrMfhnhpK7XNV1/+TyfUYDU7MNyz?=
 =?iso-8859-1?Q?CIKdy3nQI8b7/inh5MMA0qd7/Fkg3tOBldh2AQsGO75ojwfRcHYueu35wl?=
 =?iso-8859-1?Q?XDJGpEp+DSrd7oncAocPMTsEc3cpWo8MKTjyY7oHS3mJZiLn+VJQj1s2xp?=
 =?iso-8859-1?Q?WXLTj3sxonf6m2XGQs/4XPJVgsHi72gCXAKy3emCFDaihlu9uJP4jwVmZ1?=
 =?iso-8859-1?Q?XH6nxo6cbKKUUFUgPRAqMMElXLok8wDW8uCYn/ZYRXybA7Fr1m4YaRdctB?=
 =?iso-8859-1?Q?ztJleO9AdzQCIBrsjWmRGmOH+DKQuDz0i4Qc9hcRx843JkdnJrUGJQFPXy?=
 =?iso-8859-1?Q?0yPqYbAW/+pzPyCZBwXftr15ECzidcPvcO9AFYWa7ZLvoe+3YkCNDmkWO8?=
 =?iso-8859-1?Q?mt0WWPou+4Uni5C7sbyNctQEpNBun8u/oGB2uES2lD1ojXh1oBeHe+7SRq?=
 =?iso-8859-1?Q?+bZxbe0r8y0AT15XKP/0Gm+xQ1Q80VeiWHAwSi4G8sRgOQZm4PsCmsDP1L?=
 =?iso-8859-1?Q?ZlerV+f2NJftnnpVvp/R1r4h6XcP53tUWneeu+RLpAdviemqIwMXfjOMsX?=
 =?iso-8859-1?Q?wDYnEI6yxdPZse2MZGmzmHPa5r/wrzyx2mN2Nz8AAMjmgPGoB8sd8RoTxr?=
 =?iso-8859-1?Q?1dE9jGEyJRBE7cWl8gxvk1IkfiZOY28SMv7UcaPsiI9f/2SCDeTc3G1/dj?=
 =?iso-8859-1?Q?4TyAs+VfknAF2OA1occ8ywsQQi2n1ZFfNBv8Ixy0YI/7LqpcMQXck2NeFy?=
 =?iso-8859-1?Q?RC46kGPTjDrq1OffKuq355NdwHbiN6TZXhl/ph/ihQqNpweTafjJPkVgFy?=
 =?iso-8859-1?Q?AC1nSqvPVV8g9upBFa/h6xo6oOXGuunfJPm14yf3vvmhhti8y9BOCyYaHL?=
 =?iso-8859-1?Q?akE7q0aorcn1Jp4FQmnZcWglLdI3qQmyy/68W2era8t+3b2PkaPFwc8eLe?=
 =?iso-8859-1?Q?E731PE1UU3lun1Lo4yGPaygxfFfegHQwbur0FQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FpyWK72DzxNwFvq8I3TNuajS6Ktm7rs3SCF8Vvt7px0Uy8TZ2l1LjwfeE5?=
 =?iso-8859-1?Q?IJww2LLQfF7Nn8AbJCiXZuOjdQZSgMA/T5gPtzVOMrRMWFAOudgS+AFShC?=
 =?iso-8859-1?Q?giBd2csiIxDkVY4qLTDgCcHilZk9TMZr5WwIeoNZKWNX0ZAiZLMRp69osv?=
 =?iso-8859-1?Q?IgsHfxxKgpNuIT0I4bPtjs5ZuQyoZY2rOO6UtmV6VDVuZXYgxSZfM408Uz?=
 =?iso-8859-1?Q?/sh/HWd9BuiHMnroIDBdgNhv0ou+i2+l1BdoYqiBvwoANSvLC3pbfD7yur?=
 =?iso-8859-1?Q?jE98+LSNc1VzMTcp9JNtYn9oosNQz0ByaZjfJuF0ExTgMFwNTbN/5XQ8ES?=
 =?iso-8859-1?Q?b3blVum6TRNHUVuUbLj6Y7qs8x8ZTAxTYkIW151Rm2SpzDvgZ4XjJndTen?=
 =?iso-8859-1?Q?TH3DiFODJqM+JjQr3Yt5jgmIqIfT/jYo7IQFsQs1IoywYSePK8SFSOk2Kq?=
 =?iso-8859-1?Q?gqqqn228p1onr9bBxlpNVWzHoL+jz787SB8aWzjmABaNrvAg6tcDCnGuJ5?=
 =?iso-8859-1?Q?WLqy6Rh/Aq5Uk1kki76bdQnKaetbJnyNy72dc6eccLzQmuaRWQbfgnk6ky?=
 =?iso-8859-1?Q?6gxyfOtJtqL6fOyhZixLkbbhwe+fsRS/K8ALgOIWEuPHDIKtppiSxuFCHU?=
 =?iso-8859-1?Q?UcbRr2oZkM4vY4f8OsIN4dYWDs45IqrnNnBb2pjVvRuxOjhwfa63cEay6S?=
 =?iso-8859-1?Q?SN/Cu5yXAzzhVoL81oFfCmuAwrmhJcdx6F1xjy17CjZFtWcNDN0xEPivjA?=
 =?iso-8859-1?Q?nSw/1q8XSIuKntZ6g1nXkcmkhh8jHXx5FSrj/EUfero08xM/in9fr0412O?=
 =?iso-8859-1?Q?+T8fLjtcpLfhtD7l7ZbKH+CXZZAFbWi6km4Vj2d7Wi/2RKZAE9EBHrlB79?=
 =?iso-8859-1?Q?O2UDjAhDSBHEhFeQbfo2fZuH4SOPhghRDMF+xYZh4WtZmpufH9NtFP2ihx?=
 =?iso-8859-1?Q?4H4iwFIvUqgrHA8sXGPN3NHZAknpLnPFiuzyMOzSES8r/1dJzETGRKsjlD?=
 =?iso-8859-1?Q?1+zjpiH6lVDyh7RB5ikHeeoV0th6yANTmnpX+cx9yPnJwI+pqBdufBnmln?=
 =?iso-8859-1?Q?am6FZDgWjukp8deCxq7OHLPCo/K6gQjixtdZ1tA0Ym4OycSi536NKI/sHZ?=
 =?iso-8859-1?Q?dCxlASYzmg2lTofK73boVozB2ktLy8WnKUWE/m2EuY2PS/pxsjSG2Z0cFa?=
 =?iso-8859-1?Q?Dn4rmfWnahMhurf/IX7dPIzq+oPyiRKlQVf+fn6IhkMVmuBAZH2nBlXz9J?=
 =?iso-8859-1?Q?gtY1cjAhVRmCZMM9ucuenQ6ywgwLb9dZyDsCqa/BFqi7sNNnMOZEj5iyhw?=
 =?iso-8859-1?Q?hJIQvu+k68yLKOIr+WlVxBkdhW2oprnrjX9UarZmQuZ8lKp5jH6Q5EU3in?=
 =?iso-8859-1?Q?Ls1sTLuYIxlaK5KUDbHvbszaFfi+5zgrFDyET1QgHOPFrNSNUXOrnG4K7g?=
 =?iso-8859-1?Q?bxfsTYuQCrXACUD5iEH5B/MXzdGjiTBhGSvPzD76fzQJ420N30Q/AtY+D7?=
 =?iso-8859-1?Q?UEv2FFEtjhVo3/GCmtEpCmb/QlccGi+q8bDk3XtLzvxXM1V4nEF4VePFXX?=
 =?iso-8859-1?Q?xT2iOELNkvfayvi1V7zpiYZJa42l3E/NWxm7VT784Q7l8WsqLdXcg/YqyO?=
 =?iso-8859-1?Q?9SUJ8V+NV7wVHW9cwzeqIF0Any8lqfi3xGdFUZBdJKVNMCI7f3Usi5FA?=
 =?iso-8859-1?Q?=3D=3D?=
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
	j9XT/shZF6TwZKAlkgOiDq3Qk55nMZ2G/X/lfa+2Q1gz7Mp+1vHtuWey5zY8RAkV3+YRB68s76NDIJ8Grf124ZI7PSqjAOO93dQmAiYuWf+oJYnYwv26fzK1g+ADYrwnXh8htVvcmMmqIuHxcVco2lR+hQPtP/SZnhaDmjt82mXriQvAxBG2/jzIERpUBckG5ocEvqs8TNztt2NtNJdi/TenugMIN0vJ1P8oFm6EG/KE4EOVCGERuSd+MEIx6xhIqHSJZ2SZEK056DmSeWMhK/Vs5JuYGjDMZGY7xuxFPPvnZmeJxq6lW1oT/1oa/EPwb+MvlCZ6v3WsErCTqwaKEkIVBwPXwfVRMwf4r7XXbaZ6o+T/CUh9fFtE/S07w0zhc66pWnZtHt1O6ml8TfJR1U6gwm/EfD9jun7Pa9O73FvNzhBi65UH57Dg3366JWo+aJy7p0pwZ9TRoOQE3sHQwVjN4Uny7xE2sa1OI+fuKHu4FgIQHUWb0j7ifi+zzzsGNWOBsBEUulLh800e3cNhILVwCuRuy4X2EKhDOJH5/j+NdBpzpO5tE0qp6yPz0qAmZWG0xoqV0iO6iupke02BP1pJyk+pz/BQ9uzI//URyB3u+soq4gYJ81wwl7GhT2s7zkjcgtu8UPx/TnmCSPopQA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e77703d6-3d41-437e-a1cd-08dd197b7c13
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:33:50.9757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KN5uQLXF04ZJI8/A6LH0EHI0hyW4PmhOMLE17i24RcpOTjppGyTLbA2RYE9ylDusvja8AYdRiI8isgN8qqHeSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=d+8PyQjE c=1 sm=1 tr=0 ts=6758ddf2 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=mpyWSJtGwHFLCFruFkwA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: aBHDLRwi63KrAtPDE3QwFxOUcKee0Zwv
X-Proofpoint-ORIG-GUID: aBHDLRwi63KrAtPDE3QwFxOUcKee0Zwv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

Handle target_core_fabric_ops TASK MANAGEMENT functions and their
response. If a TASK MANAGEMENT command is received, the driver will
interpret the function TMF_*, translate to TMR_*, and fire off a command
work executing target_submit_tmr(). On completion, it will handle the
TASK MANAGEMENT response through uasp_send_tm_response().

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 220 +++++++++++++++++++++++++---
 drivers/usb/gadget/function/tcm.h   |   5 +
 2 files changed, 206 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index c6bdd6023588..3e04ce40a4a0 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -12,6 +12,7 @@
 #include <linux/string.h>
 #include <linux/configfs.h>
 #include <linux/ctype.h>
+#include <linux/delay.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/composite.h>
 #include <linux/usb/gadget.h>
@@ -449,6 +450,45 @@ static int usbg_bot_setup(struct usb_function *f,
=20
 /* Start uas.c code */
=20
+static int tcm_to_uasp_response(enum tcm_tmrsp_table code)
+{
+	switch (code) {
+	case TMR_FUNCTION_FAILED:
+		return RC_TMF_FAILED;
+	case TMR_FUNCTION_COMPLETE:
+	case TMR_TASK_DOES_NOT_EXIST:
+		return RC_TMF_COMPLETE;
+	case TMR_LUN_DOES_NOT_EXIST:
+		return RC_INCORRECT_LUN;
+	case TMR_FUNCTION_REJECTED:
+	case TMR_TASK_MGMT_FUNCTION_NOT_SUPPORTED:
+	default:
+		return RC_TMF_NOT_SUPPORTED;
+	}
+}
+
+static unsigned char uasp_to_tcm_func(int code)
+{
+	switch (code) {
+	case TMF_ABORT_TASK:
+		return TMR_ABORT_TASK;
+	case TMF_ABORT_TASK_SET:
+		return TMR_ABORT_TASK_SET;
+	case TMF_CLEAR_TASK_SET:
+		return TMR_CLEAR_TASK_SET;
+	case TMF_LOGICAL_UNIT_RESET:
+		return TMR_LUN_RESET;
+	case TMF_CLEAR_ACA:
+		return TMR_CLEAR_ACA;
+	case TMF_I_T_NEXUS_RESET:
+	case TMF_QUERY_TASK:
+	case TMF_QUERY_TASK_SET:
+	case TMF_QUERY_ASYNC_EVENT:
+	default:
+		return TMR_UNKNOWN;
+	}
+}
+
 static void uasp_cleanup_one_stream(struct f_uas *fu, struct uas_stream *s=
tream)
 {
 	/* We have either all three allocated or none */
@@ -552,6 +592,61 @@ static void uasp_prepare_status(struct usbg_cmd *cmd)
 	stream->req_status->complete =3D uasp_status_data_cmpl;
 }
=20
+static void uasp_prepare_response(struct usbg_cmd *cmd)
+{
+	struct se_cmd *se_cmd =3D &cmd->se_cmd;
+	struct response_iu *rsp_iu =3D &cmd->response_iu;
+	struct uas_stream *stream =3D &cmd->fu->stream[se_cmd->map_tag];
+
+	cmd->state =3D UASP_QUEUE_COMMAND;
+	rsp_iu->iu_id =3D IU_ID_RESPONSE;
+	rsp_iu->tag =3D cpu_to_be16(cmd->tag);
+
+	if (cmd->tmr_rsp !=3D RC_RESPONSE_UNKNOWN)
+		rsp_iu->response_code =3D cmd->tmr_rsp;
+	else
+		rsp_iu->response_code =3D
+			tcm_to_uasp_response(se_cmd->se_tmr_req->response);
+
+	/*
+	 * The UASP driver must support all the task management functions listed
+	 * in Table 20 of UAS-r04. To remain compliant while indicate that the
+	 * TMR did not go through, report RC_TMF_FAILED instead of
+	 * RC_TMF_NOT_SUPPORTED and print a warning to the user.
+	 */
+	switch (cmd->tmr_func) {
+	case TMF_ABORT_TASK:
+	case TMF_ABORT_TASK_SET:
+	case TMF_CLEAR_TASK_SET:
+	case TMF_LOGICAL_UNIT_RESET:
+	case TMF_CLEAR_ACA:
+	case TMF_I_T_NEXUS_RESET:
+	case TMF_QUERY_TASK:
+	case TMF_QUERY_TASK_SET:
+	case TMF_QUERY_ASYNC_EVENT:
+		if (rsp_iu->response_code =3D=3D RC_TMF_NOT_SUPPORTED) {
+			struct usb_gadget *gadget =3D fuas_to_gadget(cmd->fu);
+
+			dev_warn(&gadget->dev, "TMF function %d not supported\n",
+				 cmd->tmr_func);
+			rsp_iu->response_code =3D RC_TMF_FAILED;
+		}
+		break;
+	default:
+		break;
+	}
+
+	stream->req_status->is_last =3D 1;
+	stream->req_status->stream_id =3D cmd->tag;
+	stream->req_status->context =3D cmd;
+	stream->req_status->length =3D sizeof(struct response_iu);
+	stream->req_status->buf =3D rsp_iu;
+	stream->req_status->complete =3D uasp_status_data_cmpl;
+}
+
+static void usbg_release_cmd(struct se_cmd *se_cmd);
+static int uasp_send_tm_response(struct usbg_cmd *cmd);
+
 static void uasp_status_data_cmpl(struct usb_ep *ep, struct usb_request *r=
eq)
 {
 	struct usbg_cmd *cmd =3D req->context;
@@ -590,9 +685,23 @@ static void uasp_status_data_cmpl(struct usb_ep *ep, s=
truct usb_request *req)
 		break;
=20
 	case UASP_QUEUE_COMMAND:
-		transport_generic_free_cmd(&cmd->se_cmd, 0);
-		usb_ep_queue(fu->ep_cmd, cmd->req, GFP_ATOMIC);
+		/*
+		 * If no command submitted to target core here, just free the
+		 * bitmap index. This is for the cases where f_tcm handles
+		 * status response instead of the target core.
+		 */
+		if (cmd->tmr_rsp !=3D RC_RESPONSE_UNKNOWN) {
+			struct se_session *se_sess;
+
+			se_sess =3D fu->tpg->tpg_nexus->tvn_se_sess;
+			sbitmap_queue_clear(&se_sess->sess_tag_pool,
+					    cmd->se_cmd.map_tag,
+					    cmd->se_cmd.map_cpu);
+		} else {
+			transport_generic_free_cmd(&cmd->se_cmd, 0);
+		}
=20
+		usb_ep_queue(fu->ep_cmd, cmd->req, GFP_ATOMIC);
 		break;
=20
 	default:
@@ -616,6 +725,18 @@ static int uasp_send_status_response(struct usbg_cmd *=
cmd)
 	return usb_ep_queue(fu->ep_status, stream->req_status, GFP_ATOMIC);
 }
=20
+static int uasp_send_tm_response(struct usbg_cmd *cmd)
+{
+	struct f_uas *fu =3D cmd->fu;
+	struct uas_stream *stream =3D &fu->stream[cmd->se_cmd.map_tag];
+	struct response_iu *iu =3D &cmd->response_iu;
+
+	iu->tag =3D cpu_to_be16(cmd->tag);
+	cmd->fu =3D fu;
+	uasp_prepare_response(cmd);
+	return usb_ep_queue(fu->ep_status, stream->req_status, GFP_ATOMIC);
+}
+
 static int uasp_send_read_response(struct usbg_cmd *cmd)
 {
 	struct f_uas *fu =3D cmd->fu;
@@ -1016,9 +1137,23 @@ static int usbg_send_read_response(struct se_cmd *se=
_cmd)
 		return uasp_send_read_response(cmd);
 }
=20
-static void usbg_cmd_work(struct work_struct *work)
+static void usbg_submit_tmr(struct usbg_cmd *cmd)
+{
+	struct se_session *se_sess;
+	struct se_cmd *se_cmd;
+	int flags =3D TARGET_SCF_ACK_KREF;
+
+	se_cmd =3D &cmd->se_cmd;
+	se_sess =3D cmd->fu->tpg->tpg_nexus->tvn_se_sess;
+
+	target_submit_tmr(se_cmd, se_sess,
+			  cmd->response_iu.add_response_info,
+			  cmd->unpacked_lun, NULL, uasp_to_tcm_func(cmd->tmr_func),
+			  GFP_ATOMIC, cmd->tag, flags);
+}
+
+static void usbg_submit_cmd(struct usbg_cmd *cmd)
 {
-	struct usbg_cmd *cmd =3D container_of(work, struct usbg_cmd, work);
 	struct se_cmd *se_cmd;
 	struct tcm_usbg_nexus *tv_nexus;
 	struct usbg_tpg *tpg;
@@ -1059,6 +1194,29 @@ static void usbg_cmd_work(struct work_struct *work)
 			TCM_UNSUPPORTED_SCSI_OPCODE, 0);
 }
=20
+static void usbg_cmd_work(struct work_struct *work)
+{
+	struct usbg_cmd *cmd =3D container_of(work, struct usbg_cmd, work);
+
+	/*
+	 * Failure is detected by f_tcm here. Skip submitting the command to the
+	 * target core if we already know the failing response and send the usb
+	 * response to the host directly.
+	 */
+	if (cmd->tmr_rsp !=3D RC_RESPONSE_UNKNOWN)
+		goto skip;
+
+	if (cmd->tmr_func)
+		usbg_submit_tmr(cmd);
+	else
+		usbg_submit_cmd(cmd);
+
+	return;
+
+skip:
+	uasp_send_tm_response(cmd);
+}
+
 static struct usbg_cmd *usbg_get_cmd(struct f_uas *fu,
 		struct tcm_usbg_nexus *tv_nexus, u32 scsi_tag)
 {
@@ -1085,34 +1243,58 @@ static void usbg_release_cmd(struct se_cmd *);
=20
 static int usbg_submit_command(struct f_uas *fu, struct usb_request *req)
 {
-	struct command_iu *cmd_iu =3D req->buf;
+	struct iu *iu =3D req->buf;
 	struct usbg_cmd *cmd;
 	struct usbg_tpg *tpg =3D fu->tpg;
 	struct tcm_usbg_nexus *tv_nexus;
+	struct command_iu *cmd_iu;
 	u32 cmd_len;
 	u16 scsi_tag;
=20
-	if (cmd_iu->iu_id !=3D IU_ID_COMMAND) {
-		pr_err("Unsupported type %d\n", cmd_iu->iu_id);
-		return -EINVAL;
-	}
-
 	tv_nexus =3D tpg->tpg_nexus;
 	if (!tv_nexus) {
 		pr_err("Missing nexus, ignoring command\n");
 		return -EINVAL;
 	}
=20
-	cmd_len =3D (cmd_iu->len & ~0x3) + 16;
-	if (cmd_len > USBG_MAX_CMD)
-		return -EINVAL;
-
-	scsi_tag =3D be16_to_cpup(&cmd_iu->tag);
+	scsi_tag =3D be16_to_cpup(&iu->tag);
 	cmd =3D usbg_get_cmd(fu, tv_nexus, scsi_tag);
 	if (IS_ERR(cmd)) {
 		pr_err("usbg_get_cmd failed\n");
 		return -ENOMEM;
 	}
+
+	cmd->req =3D req;
+	cmd->fu =3D fu;
+	cmd->tag =3D scsi_tag;
+	cmd->se_cmd.tag =3D scsi_tag;
+	cmd->tmr_func =3D 0;
+	cmd->tmr_rsp =3D RC_RESPONSE_UNKNOWN;
+	cmd->flags =3D 0;
+
+	cmd_iu =3D (struct command_iu *)iu;
+
+	/* Command and Task Management IUs share the same LUN offset */
+	cmd->unpacked_lun =3D scsilun_to_int(&cmd_iu->lun);
+
+	if (iu->iu_id !=3D IU_ID_COMMAND && iu->iu_id !=3D IU_ID_TASK_MGMT) {
+		cmd->tmr_rsp =3D RC_INVALID_INFO_UNIT;
+		goto skip;
+	}
+
+	if (iu->iu_id =3D=3D IU_ID_TASK_MGMT) {
+		struct task_mgmt_iu *tm_iu;
+
+		tm_iu =3D (struct task_mgmt_iu *)iu;
+		cmd->tmr_func =3D tm_iu->function;
+		goto skip;
+	}
+
+	cmd_len =3D (cmd_iu->len & ~0x3) + 16;
+	if (cmd_len > USBG_MAX_CMD) {
+		target_free_tag(tv_nexus->tvn_se_sess, &cmd->se_cmd);
+		return -EINVAL;
+	}
 	memcpy(cmd->cmd_buf, cmd_iu->cdb, cmd_len);
=20
 	switch (cmd_iu->prio_attr & 0x7) {
@@ -1134,10 +1316,7 @@ static int usbg_submit_command(struct f_uas *fu, str=
uct usb_request *req)
 		break;
 	}
=20
-	cmd->unpacked_lun =3D scsilun_to_int(&cmd_iu->lun);
-	cmd->req =3D req;
-	cmd->flags =3D 0;
-
+skip:
 	INIT_WORK(&cmd->work, usbg_cmd_work);
 	queue_work(tpg->workqueue, &cmd->work);
=20
@@ -1270,6 +1449,9 @@ static void usbg_release_cmd(struct se_cmd *se_cmd)
=20
 static void usbg_queue_tm_rsp(struct se_cmd *se_cmd)
 {
+	struct usbg_cmd *cmd =3D container_of(se_cmd, struct usbg_cmd, se_cmd);
+
+	uasp_send_tm_response(cmd);
 }
=20
 static void usbg_aborted_task(struct se_cmd *se_cmd)
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/functio=
n/tcm.h
index adf4c415140f..d37358f09819 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -85,8 +85,13 @@ struct usbg_cmd {
 	u16 tag;
 	u16 prio_attr;
 	struct sense_iu sense_iu;
+	struct response_iu response_iu;
 	enum uas_state state;
=20
+	int tmr_func;
+	int tmr_rsp;
+#define	RC_RESPONSE_UNKNOWN	0xff
+
 	/* BOT only */
 	__le32 bot_tag;
 	unsigned int csw_code;
--=20
2.28.0

