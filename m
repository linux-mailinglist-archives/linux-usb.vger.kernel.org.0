Return-Path: <linux-usb+bounces-16842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4969B5608
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 23:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C2CB284162
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 22:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C46120A5CF;
	Tue, 29 Oct 2024 22:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oNqInl4f";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AJ56g4Pb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gEg14fZU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26EF18FDC5
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 22:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730242175; cv=fail; b=gyqhFqLFWkbZYlgqAZlQZhACQhtvBnAJfUxRX0Y9/oeS9RlbfqUCowYxumqeiN0uciNLtziPpfb9JqXJS1h5yubGiAdlz0Y/E1rzlQy82fnc2PkMCl2dEuskizpC2k3/+mQxeaTmpqQ1cKSuJTjtjIPbOX5nDHhbhBeJCaz6TiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730242175; c=relaxed/simple;
	bh=tpxx/g+e0JoouMzbdokX79OpGU5YvkunYFW5M+IlfaM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jwh3/X7n23dsa6quJkgjO+2wWifNTOufACq5vi7QPYbuF5k9bwdEAEFkX9F4Z1pH4guMh42hyuzRDvraLyswg8e7S5sz6n2LXGxNbGENXUx2pQyV3fSIlmunMD4aCdG/N5FNuHxmbDuiC070L4atQGTgRFfQjdGN+DBLUNYNH/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=oNqInl4f; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AJ56g4Pb; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gEg14fZU reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49THa787031425;
	Tue, 29 Oct 2024 15:49:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=tpxx/g+e0JoouMzbdokX79OpGU5YvkunYFW5M+IlfaM=; b=
	oNqInl4f6qXyza/5R+UL6O6SLZD5w+4bhqqBtAnKglfXEbPi05Dgg817jlMlmVyP
	IpBGAA73Y+QQESvDNqhLDXdhERglAhaDhrKTmmZ0vG212n/07eBxyZBh0V+8o5IG
	bmZ1Tel8BLA34+JtHgwNn8Ghdff8NJVUH/XdIdZvffbrrNAOUEHI2MB6Rlnh4fEm
	0mEGJ5biecg8F/t2gonILtcW1svg24V9xGHc/RCIHX/P3KijXdXqrurEzVfhMleN
	6MLviowjEiRKrCkCTfssjC/ZQxHz291uEWKqtPk+haAzSXM8YzRgx4chzF+Lp0ds
	YNsk2eI8WflAeNxCPgMC5w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 42gybw2xxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Oct 2024 15:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1730242159; bh=tpxx/g+e0JoouMzbdokX79OpGU5YvkunYFW5M+IlfaM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=AJ56g4PbfPURdjvlW+mNPUDsl5gNBQvq6z7V213H/WnVS0gCjWoeZ9cDlKOMOqUFT
	 2nDSLSbWPbTe1/+CnRX9/yBXrpPe5YbRTNvbJKZKc4OBdlJ/KjLO1YcA1ZM6YkIEdt
	 it/AfdIQw5zJJQVsodovBHwT7crDPWoHfb9OY4U5i51QhZHnR8G0OTzmwVXl0PjT6Y
	 LKiDYrtwMrWlqCvOJUEZ+sOs3A1wIYAE5/nltlt0Vp/p86U4mSYPixXzna3fEhbhLS
	 I8lRMTVA9HlnqIVn+M6glKzqdMMw3u1zKHMSpQSdbez0kwfHE5dF4dmSg4bGNPt/ew
	 arH+0fI5kyJFw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EF9D440409;
	Tue, 29 Oct 2024 22:49:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D138DA0096;
	Tue, 29 Oct 2024 22:49:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=gEg14fZU;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 32064401E5;
	Tue, 29 Oct 2024 22:49:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJx98uS8n89dXd14/79qHWoAxHTbGTgCkT41XNdKhPj5orMIzVi2bu7pPBThekfDbA+qgP5SFAI7XG+KD8sJL7GeozQG3EMEW4DfbPKmPWlIqP6DI3Vy1mRHEHkig6CtbATIHYgvi4SUc9PBp7rZyvfSu51VQQueVE+6OOSOjMjrFdevo3ae0xab9s/J8YupV4/sbU9Yx9C+ZoTLLB43L1RnhsKleeepJzUKxKffjUQvNF4fGzVZdiFWKe2m8UtYoONtXhKmyndNfZrMCCCbUBae7VHb3+PZYzd3+NR8Dg/4RlbQu8NX67soPRI0kvfUAyyccHUOFheIC2+tkt4mUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpxx/g+e0JoouMzbdokX79OpGU5YvkunYFW5M+IlfaM=;
 b=DZtxD8uaUcO00s9RZBT5z3+TPbJLON3ZKDDgDe9bhPIjEgAYVp5KK244hbccMPS+fjQkOrvlnE/Ff2VENt7VMjYA8TU6vhyNWjd4hmBjciuQ0DWLeRcp2Ma+GalAlWBGuUdBUXwq9KbTRIe0ZQt5H+kjLGgriiCofqXJZjMGwOdoMJUAwPNhHmYmK2w5ucRuzQ1qNyvOYQifDXpMHxuj31hU9MvEM1UdlamDMwX0BIxc/EOmlmE6vBbL9d3FnvJ7S57xD0kDSYuxf1Nxq0E0j55OTLg+LBMcAGI8mr+uZtbcazg6uodRNSmDRGolz+9/zC7v2frZTxp6rc0swDr47w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpxx/g+e0JoouMzbdokX79OpGU5YvkunYFW5M+IlfaM=;
 b=gEg14fZUx/TZiHvxPr92fMpefZ4X/4KOMrQyzijK2Fijy8iRRzNqQ41bdjWP8AMCm33zcUw5wFyJvQ5F5yTD3p8SUcm8PTA7jo1MDDox46RDodYsrhbcgykikBclG0yBFEeHBYQpG+PH8tHL2rwOB06RT7hl0zokpvVhR9zvjS4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 22:49:14 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8093.027; Tue, 29 Oct 2024
 22:49:14 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chris Morgan <macroalpha82@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Roger Quadros <rogerq@kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
Thread-Topic: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
Thread-Index: AQHakFeioIjMhcyoIkClbCNPPNRvWLJpHmKAgC/myoCAADfOgIAF5FQAgABnfwA=
Date: Tue, 29 Oct 2024 22:49:14 +0000
Message-ID: <20241029224900.by3zglncf33izsgw@synopsys.com>
References: <cover.1713310411.git.Thinh.Nguyen@synopsys.com>
 <e8f04e642889b4c865aaf06762cde9386e0ff830.1713310411.git.Thinh.Nguyen@synopsys.com>
 <1519dbe7-73b6-4afc-bfe3-23f4f75d772f@kernel.org>
 <671bef75.050a0220.e4bcd.1821@mx.google.com>
 <20241025224003.yfujqurxhrgzgzld@synopsys.com>
 <CADcbR4KhWdXpynk2c-tryx1=Eg4LhC4t=C6zcVHAMcMz2hH-8Q@mail.gmail.com>
In-Reply-To:
 <CADcbR4KhWdXpynk2c-tryx1=Eg4LhC4t=C6zcVHAMcMz2hH-8Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BY5PR12MB4100:EE_
x-ms-office365-filtering-correlation-id: 22ae58d0-d4b2-4c2a-14de-08dcf86be970
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cGswNWRBUHppTEVZeUhNVHhaUkoxbVVzMzNHbFFubUkwck5qbm9TcjBXSlVk?=
 =?utf-8?B?ZXE0T0tsOHh3LzJ4QmJPTjNUNEFUVjFDek9icFRvbEU0eUNMK0JmLzJuODFs?=
 =?utf-8?B?aGRnZjJFcksweTdRViswQUE2TlRsVDIrNGVMM0dzUmFrRVhmY0cvMU9TQW85?=
 =?utf-8?B?QVBNYXRuUnJjYUdyMXBveE5hUVQ3aVpDQ3htZm05MXBVWDh6L05tdW5UWUtU?=
 =?utf-8?B?R0lTd1FBZjdMeUhzNVBiRGJjdkdVcWg2TnlBcDVmRDI2RVR4dTVnSHpVNjFM?=
 =?utf-8?B?N1p3NkxBanc4MDRGVi9YZi9IY0dQSjY1N1N3aXB4UTJpWkNBU3JuSnJTQjNM?=
 =?utf-8?B?ckRwTGNHamxIbjNLWTNHWk4rU1dBR1NucVErNm5sYXkwWU1OaFVKR05hVFlH?=
 =?utf-8?B?NkdpaStmbjRGbkFTYjBpTTA5czZia3lhWE9qTjlROEgvVFBoRFczR0dPei81?=
 =?utf-8?B?UlFqMmhqQ0VIMUdwSTBYVktlOHQ1a1ZUUDRLVDExYXdvbnEvQk1WNldoYW1p?=
 =?utf-8?B?dTFZVml6cmhid2JEWDZoWnZ3SEJyek83RjJNTlU0SVArc2lEOG5GbEFjVE5T?=
 =?utf-8?B?NC9YK0N0SXZNVXAvRWY0eElZSFoyL0pRdkZ4TDZsNDNmRDVnTTVmK1pvelh2?=
 =?utf-8?B?OSt2cHFyL2Y5ZXRwWE1GTEJUQ01qdUh1VDVaNlJaY2Jyd1BOaFd1R2lXcCs3?=
 =?utf-8?B?SkZPM3JiQVZKSzJMcEM2a2Zlbkh5dW05ZjA1SEFIUy96Vm5sWCtpc2FIN3NB?=
 =?utf-8?B?Ymc0Z1c5YnhQNXRlZVFTUWl1YW0xanNmV1FLVlVaQ2VQZGUrNGJXbkxzL0Fx?=
 =?utf-8?B?MEsvODhwYmp3dUszK0twY3pvcEptK3BoZitMN1QzemdnWjhLWFVnUXZBNFVT?=
 =?utf-8?B?ZEs1YWV4T25FM0pGT01LVVJiUko1dHlUWnhkdkJ0WjVPTzJKck5KQWtJL2U1?=
 =?utf-8?B?Uy9XWitKYThKR0owaU5nZjVGQ2RocExXdDRpbldicCtTTnJEeDY3MDlrc1Ur?=
 =?utf-8?B?NG9JbkZGRnkrbzlmeHE4L3JGa1JIUVFzVU80N2hoL2JJM2FvRnZ5V2YyNzRz?=
 =?utf-8?B?Wm91SzdQOUNHeCtGQlRSQUs3VGhBOExaNlFxTzZXOElsMGZBNWJlN204cm1j?=
 =?utf-8?B?MzkxbkxEM1NqelBFc0JQcjVuc1JSUDdHS2FXVVdFeFFaTk9OVXN2OVR1WGpC?=
 =?utf-8?B?Um4xK3FQYXVETEl5L05idTJBYmQyQmd4L0ZWWWxTQ2krYnJCOW1WcmlQQmcv?=
 =?utf-8?B?ZU9TRUJHMFd1bVFtWWRibW5nN0ZQNUZhTHhLYlF5Q3lPd2dWTkE0RGhuTDVs?=
 =?utf-8?B?ZDBvallKV3JUTW9QQ2lRTUZiRW11MDR3bWJIYzV1WW9kWFRCL1JtVUJaTnZG?=
 =?utf-8?B?dGtlUDNqS29Ib2VmZWcvNUFIeXQyZHFGVlMwZUZ4dkhjOFZzRTBjZTRvdURv?=
 =?utf-8?B?cURWSWlBTXI3UFVqeG1HWVFnb3RTOWIrdUlneDZvMEdRL2R0Z0NEWE5pcGtF?=
 =?utf-8?B?Z1ptdkpKa3BXb3Z3U3FQTWxVVTNNV2hHWE5pWjZmYis5bDJnRVQrZlFTVll2?=
 =?utf-8?B?T1pPOThmSmNYM2lEYXRHSWswb3llSFZjRHJiOW1lVUJYQS91RWJsNldFL0pL?=
 =?utf-8?B?TFJXcDhHZDVSMzEzaCtCaGh3WEd6a1BqMlQ2cldxNjE0ZmF0Y2FQc1ZzNWhF?=
 =?utf-8?B?OG9RNFU3MTVoWE04RlRFckovVnU1ZmVYdjEyd1pGK1VNdEo0ellraVdGcllz?=
 =?utf-8?B?eTg4MjdrdUZhVDZucFNFdXVKT2F5RDZ1cGl5b0xUcUxwYUtWQU1rMUlla05r?=
 =?utf-8?B?b3p0bmE2T2ZxbEgrNUxHekFmYkVVeDhGdkYzdUhlQ21qd216emtQL0F5VU9C?=
 =?utf-8?Q?CJNTPL8BPPIDY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXB5V3dMTk5ESStKREtnNXJNRzZ6OHh4VXpVQXV2Q3BEMWk4ZktHK2pFS0l4?=
 =?utf-8?B?ZmlFQjJvT3lKdGE1OS9zdERtWlB2UmFMTU81aXdNYVRrRWFDOXVxZnhSc21k?=
 =?utf-8?B?UmhubGphQjIxTnMxTUY3Q1l1RHV1QmdKdXZVelNDeWY4WVB6ejQ1eVZuZHZ5?=
 =?utf-8?B?c3RYWkZFYTYwZWZxZGtKWTN5RCtaRDB5R09BL01FLyswTm5uVk1kOUFtb3R0?=
 =?utf-8?B?amJPQ0JoRkNlR2pCVHN1ODRHSHJwcGFLVTl0Y2pQTWxyQ2Nrbk5HV1Bjb1hO?=
 =?utf-8?B?YXdQSEhzUG15MzZGR254emFYaENkWGg4cXMzUGk5SDlpcmRKTURtTXg3cUI5?=
 =?utf-8?B?WEtBTFl2ZTZPOFZzeDBzYUQwR2RNRUkvZXNIMS9WRHFXTGpyd2ZmQ3ZxL0Vy?=
 =?utf-8?B?dTZsQkZ3Z084MG1OYUlEdkVQN29KL0w3ZDlISEV4THF5RGp1QU9CR2I4QUFo?=
 =?utf-8?B?OWtnTE5JRllWUCt4WTd1Ym9rejB3TEJvYVd5K2Y3YWkyZW9tSGR0WTA2eGZC?=
 =?utf-8?B?UiszMVdlZCtTZTJDOXFPV0phcGlIM042eStERk4yWTBlaWhGYSs1dDZ4aWpP?=
 =?utf-8?B?KzZ2T0lUN3VWUWZtNWlmQS9UU1ZmYVFaMFlubkdNU2dCT2pFa1g5SUJoaHJC?=
 =?utf-8?B?WmJaSk12VU40ZTM3MG5nb3VIWUV0NXA4MVdLeEJVQkhuYWp0UkJORWFRd1Nt?=
 =?utf-8?B?aDBSN3dMeTV0WERva1N4NkdUK3N2TnM2ek5XYUxmSlNWVHRGQTJPOVgxZVRH?=
 =?utf-8?B?WmVEVVIzaEhIb3JvTTBjMVp5Z21Odlk2aUZjNGlFekZ6Y2gyMVZJWkRtK0l6?=
 =?utf-8?B?S29mUkEzTno3dGw3aWN6UTg1L3R5WjE2RGF5U2NwRzhRQlhPaUhzaXNOZDFl?=
 =?utf-8?B?clVoczQ2dVNUUGpGWG5OZHJlVmNNNjlLd0EvM2JWeFkxcUViT25rZ3hNWi9t?=
 =?utf-8?B?S0ZqQTc0V1ZZQmMzZm1HNHRlZ2h6S2hzc0tHcm56YTJ2OEVLdllaVlRVWVBM?=
 =?utf-8?B?WjZVWXRMQ2wrSjBQZm5lcWt1VTFGWE5aN3ZxaFNkWW95UnBUQlhqOERtQ2Jq?=
 =?utf-8?B?L0ZYQ2ZYTkgvSDQ1c2EwaXdLdkJTTmNOeUt2S2dYQllCTHh3M0Z0bnFZZVBE?=
 =?utf-8?B?Ym1tWlRQbHU4djNUV09Hc2h3UmVhb01QWDRVVldnVXA2STk5Ymt3TmlJaW5l?=
 =?utf-8?B?OXNieDdjNDN3TmQvWG1JbVJER2dZaEk1UVRIa0ZLQis0SmwyZFBOdWdoQlhY?=
 =?utf-8?B?M2ZvUVJsQUxmSk8yb1FNc1RFbUhpNlVMM1Z0RzVYSnRCV1QwMUdIOUo1Rkd0?=
 =?utf-8?B?S1l3R2lrRnR5WFVLZXRYYWliajYwRDY4V21tMEk3V0ovNzZ0TXFPQk5JK053?=
 =?utf-8?B?YWlDa05pS3ZaM2NaMDEvdEM3L2NtMlZ5MVQ2eHFmdFI3UGpuK0ZPMXRudWRz?=
 =?utf-8?B?OE1BYUM1VHBVdWJsa0xhOEJxeTRxYmpkQmVMV25heDdaa3I2RDJneUU2TkJy?=
 =?utf-8?B?Z2xKWDFaREQxeWhFRSt2T3VnMG9FNjZvTkRtQWxWVHFVR3V6WldSTjBQLzJC?=
 =?utf-8?B?Zlo3Y0twTzRDMUpSZ2ZoN2M1bmZ4WGRNY2Q4V1pYMnJWWDdnMGJVQUQ4dmRp?=
 =?utf-8?B?ZWxTQUFGVFpCRTljd2dqUTVxMnluRGVxZVk5THFXZjhMbUd0SG5OalZ0N29o?=
 =?utf-8?B?RXFHMk1XamhLOTNENG1OMVJrVEJNb3YxZHlUM3o5eWNUMzN1b2NlUXJiWExz?=
 =?utf-8?B?ZWNsb2ZXMW9kMm9NVmJVTHpVUzc1RVJLTmJobEZJMCtnOGE1SkpZSnQ0dUVM?=
 =?utf-8?B?UGdENjZ4M1BhY09nVUZyQjVwZDBGMFR3KzZQS1YzaitSM1dNa3VmdTJyYis4?=
 =?utf-8?B?OGcxVUhjNUZMQzYxWjJrL09nS08yZEN1WFR2SU9KTWFHNjNkMjBRVktpUUQ3?=
 =?utf-8?B?bkVvRDMyRTZYZlJSV25qem9hMmxaQ3NtK1BrRE9nYWdpRkZqWmlUaW85bVNp?=
 =?utf-8?B?SXNGZ1B0R3NSdnh2TmVaSmNKZGRleXc2NUhiVkFkQTZXTTVLMjEwbjhXV3Bs?=
 =?utf-8?B?bjlNcWNNb1k0MTI2bksrVHNVRW53UllSRGd3blE0TVpveEczZ2lPSjl0SGJT?=
 =?utf-8?Q?x691OokXA8unJQn1tjMu9LF+b?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FADA0CA748EE784B9B1A7560E5643D8F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	M37OBa6iUWSSNwcLhcH/l0/uhQPQ1jSnenLvgLxkq8t7n0s115q0y8X5ykJJcC+S150oF4hpHWtRH/3uziFT+kJmPIt1ybqiiTF1dlsUnWSh0zoq+Sze9XJyzehChf8ui6vojUsS518MBO5QPF8qHhBClcHezStyJV2Zy9RUEggLr2gjXzGtITYYKRzJSzXG48+0Y3P80OH+NZaGmXE/3OvFsvXzQoAonh9+hLbjn5rQsRJCLw49HDSs/jJ5nZzDQ/nb/hLmmsMioO2kkFfud8mfIl0vZ7nOhX5lzvPmHyr+WE+r9hzBcmSA8g9rU1A0T0w3sDVIGivQCpPA0aA8aZjHhj/9BjMMV4M0QSjnSyvmYjSBwIL2sA6BbQKlinpPuHziBEkPlv+Lt8qNGetSCVIZgpqYNIrxGsvT6c/ESGJwtzmrFxG5ZiVreoPq/GoT/tGANQZnTx4JlHHFX4F60AJmL0WrO1FcVWKpHBUBLa5lnuo0HSYdgiK8zr9kYIk+lNsRb1nXWTn0CMObFma9/eQ9yk7weCpSpgtP5GXfEtohpUAfDGoK7xmk8Al/gCbPyWKeOFgRcM11iqXHsSJcro4pmzrLhL2Gdhx8gCuZYKE6TdiEBxtlN67Ax8SjwaaIz8Dn8kB345bhJcXCudrEPA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ae58d0-d4b2-4c2a-14de-08dcf86be970
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 22:49:14.1294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0eYIKwHTzW0bB2p0XjYf0UsEtMxlh8QQkmwm4Cjj0N/OuaiVpBsZksk5gaatYritzclTyhWSqO99M9J2Invtdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100
X-Authority-Analysis: v=2.4 cv=Av283/9P c=1 sm=1 tr=0 ts=67216670 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=nEwiWwFL_bsA:10
 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=SorTcOqnOCtW3R7e3DUA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: nKvRckM1oyshW0MJc3POy_-Fcl3tPoHn
X-Proofpoint-ORIG-GUID: nKvRckM1oyshW0MJc3POy_-Fcl3tPoHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=901 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410290172

SGksDQoNCk9uIFR1ZSwgT2N0IDI5LCAyMDI0LCBDaHJpcyBNb3JnYW4gd3JvdGU6DQo+IFNvcnJ5
LCB0byBiZSBzcGVjaWZpYyBpdCB3YXMgdGhlIGZpeCB0aGF0IGNhdXNlcyB0aGUgaXNzdWVzIEkn
bSBub3cNCj4gb2JzZXJ2aW5nLiBXaGVuIEkgZXhwbGljaXRseSByZXZlcnQgY29tbWl0DQo+IDcw
NWUzY2UzN2JjY2RmMmVkNmY4NDgzNTZmZjM1NWY0ODBkNTFhOTEgdGhpbmdzIHN0YXJ0IHdvcmtp
bmcgYWdhaW4NCj4gZm9yIG1lLiBXaXRoIHRoYXQgY29tbWl0IGluIHBsYWNlLCBob3dldmVyLCBz
dXNwZW5kIGZhaWxzIGZvciBtZS4NCg0KT2ssIFJvZ2VyJ3MgcGF0Y2ggaXMgY2F1c2luZyBpc3N1
ZSBvbiB5b3VyIHBsYXRmb3JtIGFuZCB0aGUgJHN1YmplY3QNCnBhdGNoPyBDYW4geW91IHByb3Zp
ZGUgbW9yZSBkZXRhaWxzIG9uIHlvdXIgdGVzdCBzZXF1ZW5jZT8NCg0KKiBXaGF0IGRvZXMgIm5v
IGxvbmdlciBhYmxlIHRvIHN1c3BlbmQiIG1lYW4gZXhhY3RseSAod2hhdCBlcnJvcj8pDQoqIFdo
YXQgbW9kZSBpcyB5b3VyIHVzYiBjb250cm9sbGVyPw0KKiBJcyB0aGVyZSBhbnkgZGV2aWNlIGNv
bm5lY3RlZCB3aGlsZSBnb2luZyBpbnRvIHN1c3BlbmQ/DQoqIENhbiB5b3UgcHJvdmlkZSBkd2Mz
IHJlZ2R1bXA/DQoNClRoYW5rcywNClRoaW5oDQoNCj4gDQo+IE9uIEZyaSwgT2N0IDI1LCAyMDI0
IGF0IDU6NDDigK9QTSBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdy
b3RlOg0KPiA+DQo+ID4gSGksDQo+ID4NCj4gPiBPbiBGcmksIE9jdCAyNSwgMjAyNCwgQ2hyaXMg
TW9yZ2FuIHdyb3RlOg0KPiA+ID4NCj4gPiA+IFRoaXMgcGF0Y2ggc2VlbXMgdG8gYnJlYWsgc3lz
dGVtIHN1c3BlbmQgb24gYXQgbGVhc3QgdGhlIFJvY2tjaGlwDQo+ID4gPiBSSzM1NjYgcGxhdGZv
cm0uIEkgbm90aWNlZCB0aGF0IEkgd2FzIG5vIGxvbmdlciBhYmxlIHRvIHN1c3BlbmQNCj4gPiA+
IGFuZCBnaXQgYmlzZWN0IGxlZCBtZSB0byB0aGlzIHBhdGNoLg0KPiA+ID4NCj4gPiA+IE15IGtl
cm5lbCBtZXNzYWdlIGxvZyBzaG93cyB0aGUgZm9sbG93aW5nLCBhdCB3aGljaCBwb2ludCBpdCBm
cmVlemVzDQo+ID4gPiBhbmQgZG9lcyBub3QgYWxsb3cgbWUgdG8gcmVzdW1lIGZyb20gc3VzcGVu
ZDoNCj4gPiA+DQo+ID4gPiBbICAgMjcuMjM1MDQ5XSBQTTogc3VzcGVuZCBlbnRyeSAoZGVlcCkN
Cj4gPiA+IFsgICAyNy44NzE2NDFdIEZpbGVzeXN0ZW1zIHN5bmM6IDAuNjM2IHNlY29uZHMNCj4g
PiA+IFsgICAyNy44ODUzMjBdIEZyZWV6aW5nIHVzZXIgc3BhY2UgcHJvY2Vzc2VzDQo+ID4gPiBb
ICAgMjcuODg2OTMyXSBGcmVlemluZyB1c2VyIHNwYWNlIHByb2Nlc3NlcyBjb21wbGV0ZWQgKGVs
YXBzZWQgMC4wMDEgc2Vjb25kcykNCj4gPiA+IFsgICAyNy44ODc2NDJdIE9PTSBraWxsZXIgZGlz
YWJsZWQuDQo+ID4gPiBbICAgMjcuODg3OTgxXSBGcmVlemluZyByZW1haW5pbmcgZnJlZXphYmxl
IHRhc2tzDQo+ID4gPiBbICAgMjcuODg5NjU1XSBGcmVlemluZyByZW1haW5pbmcgZnJlZXphYmxl
IHRhc2tzIGNvbXBsZXRlZCAoZWxhcHNlZCAwLjAwMSBzZWNvbmRzKQ0KPiA+ID4NCj4gPiA+IFRo
YW5rIHlvdSwNCj4gPiA+IENocmlzDQo+ID4NCj4gPiBEaWQgeW91IHRyeSBvdXQgUm9nZXIncyBm
aXg/DQo+ID4gNzA1ZTNjZTM3YmNjICgidXNiOiBkd2MzOiBjb3JlOiBGaXggc3lzdGVtIHN1c3Bl
bmQgb24gVEkgQU02MiBwbGF0Zm9ybXMiKQ0KPiA+DQo+ID4gaHR0cHM6Ly91cmxkZWZlbnNlLmNv
bS92My9fX2h0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTcwNWUzY2UzN2JjY2RmMmVkNmY4NDgzNTZmZjM1
NWY0ODBkNTFhOTFfXzshIUE0RjJSOUdfcGchWlhRZFIydUx5a1NENjdfM0pTbTBSWkh1eUo3SVZu
dzVFdm1ZdkxuUHNmM2RERWlsdjVaZ0hEOUdYN2dacjUydDBIN29GS2lmekFFaGJkSzhFR1l6bVNq
aTJVSSQgDQo+ID4NCj4gPiBCUiwNCj4gPiBUaGluaA==

