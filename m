Return-Path: <linux-usb+bounces-24014-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 078ECAB932B
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 02:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E60201B653C3
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 00:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3393C12B73;
	Fri, 16 May 2025 00:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Wi+ddkHP";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HqK7Ljuf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SWJ5DtjZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD914B1E65
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 00:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747355249; cv=fail; b=YXoZgeHfdkNlJtQzob/ZAf7UGRSzthpJoVlYXjSom01Ri6/blYQJw33iIce4J2BP7yEhQZ1MFCt0CNVleZYmnHkjF7ht7w9FTenz241dlyd66Kz0JlO6TjEbmQgz8oH/dD59dz0ZMYWolmm3az4VzZdnq3kz7lx3odocQ/36xBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747355249; c=relaxed/simple;
	bh=6mE6d6KStozxuiDQsV0/Jg/hlRhMkfUmcxa39NTD7Yo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K8Pz5TMWpK6ZN7e2gsGSWG4Oaj1FL9mCoTJgBlUMH+VpAck9nHdvkwHlGgzPC6d/iR625MTQxUD61VOcrwHHEEPEh4lSAxkl0zUE1zqxIfBMRQwrTVmt6zQ+Fd/X/02WYy+aFPU0hOhnfSR2Z4ax/ZKQaOe1vY4V9Tqvk8KA/ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Wi+ddkHP; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HqK7Ljuf; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SWJ5DtjZ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G0Jick029489;
	Thu, 15 May 2025 17:27:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=6mE6d6KStozxuiDQsV0/Jg/hlRhMkfUmcxa39NTD7Yo=; b=
	Wi+ddkHP2h4KkedNPiQ/mbo/2+DC6TtDu9SU0w9Cqz0lFzPGB1Y0IQ9SVWS9GDhG
	VrTSyBjHpnDMmmYaVs2n7oOwoO/q7TAfI9A7iNr1gGmtv33O6GWKk5PsJ50Ca5Ae
	8dsXV5buwWaekOAgEZ5dX53NFNHwk0ofBNHcwT7Gbf8NlEii2DViaikc1KXaOcoQ
	ukAz6T4JQBS9WWpgiDt1N4EN479NXdmVeCMmYTPc/Dzq35OpZSrF8Vzvl3+EmSYa
	eZ0z6CvOUGY+BU3PQQTJOrJm2fxW7OENC19vOCug8sJCRDbO0rlmQ5zrgQfrr0mn
	rl69/Cb5qUXlCI8b+K39ew==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 46mbe58svd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 17:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1747355232; bh=6mE6d6KStozxuiDQsV0/Jg/hlRhMkfUmcxa39NTD7Yo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=HqK7LjufZp9CTTvFBciF/9bmKDKFnMZJ+pZOvCqO1xWbTPqefBBckTcBNEAKxpKqs
	 otzEdU0EbD6/Qy9o3LjA8eQpSgH5XOPFSUXchB3pUkWD55S8QWQRgu/jDUfsbWO4Am
	 tYFPF60iHIYBBxCifDo+PKo/zRILyLP+hmyra17lYDcVr0zomw3FK/prJAy2RoYKDg
	 su5fwJlJrcsru1HCjjVNevm8WrHSefqBMBOeNWWouyq3kzTTlVyYPRoCgwZl5Gzh0i
	 zfPDU1IciVGsGyfRGQmeBGwC2DMs7YXeAgNej2EIInguuuMJ6we9Klra5X8qcIBK+T
	 Jcl5GlJpXQA+w==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B324C407A5;
	Fri, 16 May 2025 00:27:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 431EDA00A8;
	Fri, 16 May 2025 00:27:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=SWJ5DtjZ;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id AC2D0404D1;
	Fri, 16 May 2025 00:27:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c97snVcrTn3IqGvkgNLNJEQOpsVLNYpIRNmhycwxUfOmcTaXicP6IbxpfXEj4FxH01bzFkISyPsQR4VlXKD9df6UoR/zTZOOn2eV7JP6E/M7NbxYUxRYRuXFKOJe39qm4NO2ULHy0zbKrGeq/iydqcwhzqC66/V9U/5BpDPqVGZaGviTT/y0YG9dl5M3C26HMi8TL7EYqijp7122/Z9juRxG4WnBgWJQ/WWrFTkce2a5Mz0/yVrqULqTXcaFe7WFtQ41FDmSXUwC0IOuT8lkzpbs0Gyx5YZI/tmhQNXyKES7etDVjtez4oIX30u/4sbTbl3YYEKp0EtQtkuqkZYBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mE6d6KStozxuiDQsV0/Jg/hlRhMkfUmcxa39NTD7Yo=;
 b=UlXcA+m5IYT7T34I+mP8sHP8EsbUYN09oYnPE5+VGiYnIfuvQjJ2j+XlcrUVkaHwbvyW8gpfN6CoPZq2I6CBiBIaXYCVhyVEcloMPrWTjD+e5dMulyaanYmocUGkgP4RaQhhx95HJXz3wehrYjRji0CLOS7TsoLATbxEq1ejxPLDxrhLAI20yL+kV8T917VupWwQje/tOAm52LKq7D767LCz9Wa7fEIy0bwuJFaRultRgm1MO4B2+u+L/NJ9jmDwqfjCrJT2LfZCRSdC6PVGpmPA6GE5LtNGyyW7yemGy0UK95ZPGGmW/pcC2NaLW5D++xTM9rr73u/G/JdLYgurgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mE6d6KStozxuiDQsV0/Jg/hlRhMkfUmcxa39NTD7Yo=;
 b=SWJ5DtjZF5aTOxC4WOfoQRiDL0aRj77ezjGeFCoFnG/KFOiZ5url5eSuoIeC1lKHnrhOULHPtIHh/SIxaWlfl07omwG6KcgCuxzYyFyszEKRK3mFyIN1MPFWhKYAqqOCREY3Hd8N+9DdmVxcv/YAreK0QTWIpx36z3nxOa56C9o=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY3PR12MB9629.namprd12.prod.outlook.com (2603:10b6:930:101::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Fri, 16 May
 2025 00:27:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 00:27:08 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Amardeep Rai
	<amardeep.rai@intel.com>,
        Kannappan R <r.kannappan@intel.com>
Subject: Re: [PATCH 24/24] xhci: Add host support for eUSB2 double isochronous
 bandwidth devices
Thread-Topic: [PATCH 24/24] xhci: Add host support for eUSB2 double
 isochronous bandwidth devices
Thread-Index: AQHbxaGFPsYlUyA4m0aA1RSkmDivRbPUZzcA
Date: Fri, 16 May 2025 00:27:07 +0000
Message-ID: <20250516002700.cags7zapbshy7ri7@synopsys.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
 <20250515135621.335595-25-mathias.nyman@linux.intel.com>
In-Reply-To: <20250515135621.335595-25-mathias.nyman@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY3PR12MB9629:EE_
x-ms-office365-filtering-correlation-id: a41b074e-dc5b-42b6-9d7e-08dd9410644e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q21nZHVhbzBzV0FvQnJ5TWZnVmF6bVBlem1IN2pQQWVmV0puNS93VXdWN3p2?=
 =?utf-8?B?TVJIaHltdSt1c3pGUzhWK2NQOFBGVStRZWtUeDFqRTZWRHViNUlQL0pPUGhD?=
 =?utf-8?B?NVcrTVplM0I3QUp4NVdOTHNCc2MvQ2N1Z290V3B4N0ZBaDY4WTF4U2o3MUhh?=
 =?utf-8?B?NXZGREZvK0ppUU9OSHB2ZTJQNzhranA1MVhCK1ZqdTVsd0NkOFo4MVo3TWJl?=
 =?utf-8?B?dkE0dGNIZTN0b2YzRnI2ZExsdUY2bWV1NGpkdHFjaHBReHF4bHZFVWpNWTl3?=
 =?utf-8?B?c0lQUzJDM3Vacm1MZGg1TVBveGN5SHBKMVhubW9lVUhpWGg0THpFaGM4MTBt?=
 =?utf-8?B?L05rNTQwQjVUd0huY0FUUVZQUVFTOVgzM3BNV2J2Y3pTYVlqa0xla1FtZmc5?=
 =?utf-8?B?RVpGb21TQ1l4YnArbHdTZStVM2E2alRGV3E5R2Z6Tk1iaGFvbGRTeG9ZVGw5?=
 =?utf-8?B?Z3RZTWo0djY5cHRmak11WG5qeCtQL2xnR1IzWXAvb3dGL2tCUUo2MWtTTWtm?=
 =?utf-8?B?ZW5vcWFLT0plMHNvbUxPb0wxT05Way9uVkJTMTJMTyszZFRpdHlTOHV3WVB5?=
 =?utf-8?B?ZVR6dzJjc0pIRkVtcE52RlBEWGR3bHk3aGxmQzRmdGVxdkVmTmNueHpLTzJ0?=
 =?utf-8?B?cHVHckFUTk95cW5iQTI2NkprMUkzNHRtQ21IWTJ5d1AyV0EzWGxaeXdJbHJ6?=
 =?utf-8?B?RWFOeFA3b2Y5NlVaZjZlV2FKYk45OHdpTUdweU9ONXBGTVNLSlowYnRQL2p0?=
 =?utf-8?B?blpZT3lDSkRuNXBZTVAyQjQyZ3I0TWNuczZDL1RtdHdCSVR5Mk1Za2JmSEZk?=
 =?utf-8?B?a3pXL01NU3BMYlJpSWxmbGNBVGFBYjhkbEtMRkprcjlNdkZBeVRHNmVMK05Y?=
 =?utf-8?B?VkMwWTVrRjdObHBaZE1rSktJUk1YWFNocmR3S3BZRzY2WHRXVkJ5NFZmdlpT?=
 =?utf-8?B?V29NeGZ0Nko5akloeEgvK1UvVHpBL0pqcEpyckY1Z3U0WC9HbDF3aGpOZ2NI?=
 =?utf-8?B?SXY1b0MyQ2JRRUkwbHM1bXFZU1Boa0Rha013UFh1MjNReUs3TFUzOUpVdGRi?=
 =?utf-8?B?SWFOSm51NEhWeDRDQ2RCYTRUc1h6Slh2WjE1dUZ0OVFzSVhCOUVXWFRuN2FS?=
 =?utf-8?B?YWladkFPYmc0Yk56OHd5YlFBY3FvZW04SjFiT3dUQTNtTGZjam5zWUs4c2Yv?=
 =?utf-8?B?VDVKbHdFdi8zQWIxMFB2R0I2eWRKQTg1M3BwaXpnQTJBMm5LWkpvY1RaVTF4?=
 =?utf-8?B?WExienp5bUVoVlAyV2VTN1hTK01EZzJxM3lDd2MvcEVqYVlpYmIvY1hEb3Nn?=
 =?utf-8?B?MzJRbDNaakpPNDNaanZxSlRtM2QxNGtNVmttL3NFbU80YUlnRURkNHE1NTFl?=
 =?utf-8?B?eXh0cnBkYnEvN3dVRXljRkVtbEl3cW5ZN3M4Z1JmeUtTR1VIb3lCOXF5dVR2?=
 =?utf-8?B?blN1UFV4TTExQ2ZKU3EwU2dtYVVVenZtYm1aYkJzSyt3dlJhVGl0OHA4Vjl6?=
 =?utf-8?B?d1hOVHQwUnFTSFFKWWY1MkJKVUJRekNId3grM3lGZnZ0cDhhZ1VRWHM0bng5?=
 =?utf-8?B?NnFzMkV0TlRQaTdVcTVsc2J4Mnp0Y3Z1ZzEvV2gvUkVBaEEzZENremhEblQy?=
 =?utf-8?B?bGxOVk1HM1R1R1JqTVNnWGRuYXA1U1lSdjNya0FNVUhHVTFTTFRzV1BvUU9V?=
 =?utf-8?B?dEZ6ZDRqK2ZDc3ZWeHB1RDB5OVVOMFhTamxSUVhMM3o2bFdpTzVaenRRRHR3?=
 =?utf-8?B?ck4rVi8vREYzaHFpN2RoVXhXS0FTc2hDbTBqbWkxaVI5ODlLakg2ZlFrQkkv?=
 =?utf-8?B?ZmIzRzY0N2F6ZnBPdllRT0VaTnZ4YjBEcjdkYWlROGN3dDlLQXVVazBOU3ZQ?=
 =?utf-8?B?UUplQ2s1MkdqZ2pLQmZ5dlJ1ZU53cUFJZWFzUml1dlNiTklvR3NsQ1NTcGVS?=
 =?utf-8?B?M1RtL1NIbDFJdzltSFErbU5QeEcrQTFDekJUaW0rZFcyNDA3VmhId2NPVmxD?=
 =?utf-8?B?UXdWNS9yUzdnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2szY29Oa0hiaHFYZ2dVY205dXl6eHYvdGJ0SHc1ZmdtaVZ3U1VzWitpSFlT?=
 =?utf-8?B?RmkvdmpMMnZFbCtCR0lLZlZlbFRaZGpjZ2lmSEpwczlvVGl0cEoxNGs1dUNl?=
 =?utf-8?B?YTRlUU9HaXZ1enhrcm9zcGVrWkp3bHk5NVBEZGNWQ1EwMmtka1B0WExJYXp1?=
 =?utf-8?B?S3RWeDlzanErZmlqLysvRzFKOGNDZXlibWdqenF5cjZmUGZ2dkE5UkptNmwz?=
 =?utf-8?B?RUJqQUlqVG1SV2hTZy9sU1lMbklDTmI2VjcyN3ZVemZXRWFxaitiU0JIU29B?=
 =?utf-8?B?b0MyN2QrSm9qQmhFL1BBcXhCWUxCbG1YRW5STlZNSFFHbWJ0c3pMOFRZM1Fs?=
 =?utf-8?B?M3EzZ2M1bVprU3BIckxBZ2RhdUx4TklqVCtTZ2pQbjBzUzVTV0gybk03ZGxN?=
 =?utf-8?B?QjNaZkIxeUdNQ2VUdTZWRHI0WU13dndHZTNuMVMyYXlrQkt6c0laczZ4eXZW?=
 =?utf-8?B?SUF5dW5hL0xVZFFqaU4vdDQxRHVLWVNDSGhoQmRGY3UyTkJ3S09yM3ZjbTFL?=
 =?utf-8?B?YVVaU0hFTTN4T2NQSVQzRkltRGxlcXpCN0tCcTk3UTc2ZkdyWHRMWjBla1d2?=
 =?utf-8?B?SkdPK0RaV1RtRjRSSTNEaXdIY2dnSkp4b0h1U0xtcFZybEFTeHZ6eDRCQXhL?=
 =?utf-8?B?L1cxZ09nWkp2RUcxTDJFUExkNmNuQjdBNWN2L3AzdW9NelVFTzJXdmxCRFZk?=
 =?utf-8?B?dzBWSGJjQ0ZiWDlIeUZzNTVwRkcxd0QrZllnY1lzSXZnbmNIbU9EN2tOamRK?=
 =?utf-8?B?OFhLOW92YVlKTmtsK2U4TDNjdUN2SXY4Vk9DQnA5QVFOdjh0a1I0bUZicGdZ?=
 =?utf-8?B?emhTSyttQ2RNaEN0TTArdEM1d1p4OTNzTUloSk5DSDZYanpFSmF1NzVpTTda?=
 =?utf-8?B?MEROQWYrRmRqWTlXR25kdGd5ejVzOHhVRlBCckQ5TlNYbDFuVjlra1ZUekIw?=
 =?utf-8?B?bDdud0N1bFFEMkpCd09odGs2d0NVTHplNEU4S09Pb2ZMRWhpeUJpL0RiNG9o?=
 =?utf-8?B?eUU0OG1IUzJRbStJMUd1QzJxU0Zld05NU2dSWng2TTNGN2JXYWUvbXlRQlhh?=
 =?utf-8?B?bXIwMXhlclk3TzdOSjB5bWNZM2Uyb3RYQjBKRUFlSGtpb3ZOSmUzbE1jSjdP?=
 =?utf-8?B?cDVoQ1pBdjRWMzcwRFdaY1FUQVRZU2dVeUlRN2Jlam5XQzlLMVg0bHZtWW9V?=
 =?utf-8?B?NVh5aG1MRWxPSWovQ0FtTGJNb2pNVEVBV083d2VZbTZLQ1FGL3YwR2FKRXlH?=
 =?utf-8?B?ZVFyUENGR2ZOK3FFdTl4bEVoRjl5aGdicnJzb1V1endCb1VlR3FreFZKN1NB?=
 =?utf-8?B?eDhVZ1Y1T1R4VzcwdWx3VFcxdFcvVjM4WTNrVjJUQnFWL2lWYUxGRkZ2OHls?=
 =?utf-8?B?T1lUZ3BXWVU1UGVZOUcxZWRhaE1remU0dDhiYWlpRnFzU2dvVFVWMU1LUFVK?=
 =?utf-8?B?OGVtbzQwMkxQSXV6T0xnbWlsT1pkUmVLcmdxeVYzUlhvZzdsR09sOTVwY3Az?=
 =?utf-8?B?NmhZclpneWVFUExsL0ZnNWY2ZHF4VGNEMmRGbWRtOERaNTFDL3NxSitpVVVx?=
 =?utf-8?B?cGRqWjl2WE9NYVVqZXN1UVFlZGdGem42OVdmVUt6ZGJPeEVMVmlKT0ltUlIv?=
 =?utf-8?B?K2thcTZ6bHhvSGo1bEVZU2hzQm9LZVQyejIweEZVMW51c3VIWjczTm5uN1U0?=
 =?utf-8?B?Y21WNHc1U0RCQkdqOEtmT1ZuZzNJWG5wbWpQNkoreTM3TkgvMnJtR3JYYndy?=
 =?utf-8?B?NTZqWldDSTFmWkZYQ2dHMU5yYXNBbVBTVVo4K0FmOWUzRS92QXZWOGc1Mlg3?=
 =?utf-8?B?VGpITmR1OEZSMktJVW5BbGZNYXdZSHpBeWMxK0dKbXZCNmFpOGQydDIvZnk3?=
 =?utf-8?B?aEwxaldOQk00ZE9wdCtSUnVmWDh5UTR4TjM3bkpkLzU5WXAxVzBiNVY0YlhU?=
 =?utf-8?B?dlVGblFjNlM4bDJaMTBoUlErV0dualJFL2FpNUZ6QlJkZDFYZWxMVFZXUWFM?=
 =?utf-8?B?RVVSelRlb1VrNVhkVXVjV1QwaW5WMTZmMXlLYjl4WHdvbkZUcHYzS0loTUtO?=
 =?utf-8?B?dFJRRjZjSGZCUlk3YnY1SWgvdktVa244NThCRk8yYVBoblpSRHlQVFVGbnlK?=
 =?utf-8?Q?1Lsfdgxs+rOgqmagOXY5DrBrn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <544A21129A510F49960A2B0221FBD625@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tEsvrmwyagchGLcYHPnDBMkcFZh42dYif1oKdCGPz1Q71tbJU7jXm5Qmn5E/1vhF0uIQDNf7O6wwbHimn09QVhCd0fMOoiLPfCAbZ4acDe87qGmatnYQ4HdoX6paUe12FXlRZoM/weK5WlVTIwD9xA1qkMx+STs4Q5hpNSxX3/8haT06ZNKkoPVLDMNhxSRJ/nkqVgHRtbXgD5dIbEnfv81FgUNT3d5ooTgUgCGD7sIuhY84+Xn/6s+V+LuqiovLFbbG0LFZz2nQDfwJcoSOOSEsML4jW/bwnMS1yMC6xqSaZkzMRjwmULAgKaIn0cAhp5q4E4WszVbbroUoSsBmiuQG1CbmN1qCHPR8CGWWhh6R45hE7jWjM1istBVc65q6Bxblx8Uw72r7h54vw5TPUVZ0nWuUMzM+Srl3aDaZqA9xMFdHE67Vbu528pqUk2dJaiiDf82tPEC+MjhYKrdriakJQTqqvD1Is44b4/AIBiVYfpyPUnDQbBmVDxzlbQ2HggBDS4AQ+8QtUFnW3sPXT9UoczhloaKoa4/PC4VjOUMwV9/U8JeLZxXx3BbgycmYzwCM9yQuZFdwaD1H8n0QAo5uB0PpctHumU1Ejw1h9SmmL7YXrFcvg88kpdKpfNQ9hoACQUV+Mw0/2IDyX2LfAg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a41b074e-dc5b-42b6-9d7e-08dd9410644e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 00:27:07.9092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rmcJiJ5YJmowwq2b9og3rvdnp0e7D0X/4tNfCqmawqNsXQrtXiGj+OAdUri3ecjklQ/rLs0bDeBWIxMa0PpXfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9629
X-Authority-Analysis: v=2.4 cv=GYEXnRXL c=1 sm=1 tr=0 ts=68268661 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qPHU084jO2kA:10 a=QyXUC8HyAAAA:8 a=TFb_jClrZ8_gIoBtlo0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAwMiBTYWx0ZWRfX250kOioKEoBQ
 4w0yJHRvgVQUYoMrkbF94SIrOVKYcCaoi6mBx4ONRdb1fbcR+2KnS+o8ny+9fhFjB+SRbSe+Su9
 J0oXoKnTAztYq0zmtQYJMs5wCAScXL6xbi/UG0UVirwi4rQpQovyJjnI9SgTrZ4gXvhMvGyXXJ+
 zbpZiR29wiVLQ5eSg40YGN7m7/T96CX7HljpmfTK71lg8RhELWInb7yqv1J+xCtYiRCDai6R+U3
 /nIHlrqoeeS2CFC5ptKN5vCxQ7DDNhHaYaS15LDRtgsQf85e2ecc0/Z8CltobLNg7b+th+zDFzL
 GKk01FwBvs1nkkc67v7/pJ9bSYkY7xxPezzYPi8+UEP3LibApU0wtmdS93tocbGDVkoeqLPpEQB
 B1N0gPk3Hb5U3nyrO/4Bo7H3rAf2zeTZvg6Cs/AODPblYVUJmKXzl8zc0xmO1xYaggbPNleU
X-Proofpoint-GUID: xtdYqzCGdAq6_BeJkehTgTp40udOg1sQ
X-Proofpoint-ORIG-GUID: xtdYqzCGdAq6_BeJkehTgTp40udOg1sQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_11,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160002

T24gVGh1LCBNYXkgMTUsIDIwMjUsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IEZyb206IEFtYXJk
ZWVwIFJhaSA8YW1hcmRlZXAucmFpQGludGVsLmNvbT4NCj4gDQo+IERldGVjdCBlVVNCMiBkb3Vi
bGUgaXNvYyBidyBjYXBhYmxlIGhvc3RzIGFuZCBkZXZpY2VzLCBhbmQgc2V0IHRoZSBwcm9wZXIN
Cj4geGhjaSBlbmRwb2ludCBjb250ZXh0IHZhbHVlcyBzdWNoIGFzICdNdWx0JywgJ01heCBCdXJz
dCBTaXplJywgYW5kICdNYXgNCj4gRVNJVCBQYXlsb2FkJyB0byBlbmFibGUgdGhlIGRvdWJsZSBp
c29jaHJvbm91cyBiYW5kd2lkdGggZW5kcG9pbnRzLg0KPiANCj4gSW50ZWwgeEhDIHVzZXMgdGhl
IGVuZHBvaW50IGNvbnRleHQgJ011bHQnIGZpZWxkIGZvciBlVVNCMiBpc29jDQo+IGVuZHBvaW50
cyBldmVuIGlmIGhvc3RzIHN1cHBvcnRpbmcgTGFyZ2UgRVNJVCBQYXlsb2FkIENhcGFiaWxpdHkg
c2hvdWxkDQo+IG5vcm1hbGx5IGlnbm9yZSB0aGUgbXVsdCBmaWVsZC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEFtYXJkZWVwIFJhaSA8YW1hcmRlZXAucmFpQGludGVsLmNvbT4NCj4gQ28tZGV2ZWxv
cGVkLWJ5OiBLYW5uYXBwYW4gUiA8ci5rYW5uYXBwYW5AaW50ZWwuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBLYW5uYXBwYW4gUiA8ci5rYW5uYXBwYW5AaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBNYXRoaWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktY2Fwcy5oIHwgIDIgKysNCj4gIGRyaXZlcnMvdXNiL2hv
c3QveGhjaS1tZW0uYyAgfCA2MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0N
Cj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1yaW5nLmMgfCAgNiArKy0tDQo+ICBkcml2ZXJzL3Vz
Yi9ob3N0L3hoY2kuYyAgICAgIHwgMTcgKysrKysrKysrLQ0KPiAgZHJpdmVycy91c2IvaG9zdC94
aGNpLmggICAgICB8IDE5ICsrKysrKysrKysrDQo+ICA1IGZpbGVzIGNoYW5nZWQsIDg5IGluc2Vy
dGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPiANCg0KDQo8c25pcD4NCg0KDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuaCBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oDQo+
IGluZGV4IDQ5ODg3YTMwM2U0My4uZTBjNTIzOGM5MzI3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3VzYi9ob3N0L3hoY2kuaA0KPiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuaA0KPiBAQCAt
MTczNSw2ICsxNzM1LDIzIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB4aGNpX2hhc19vbmVfcm9vdGh1
YihzdHJ1Y3QgeGhjaV9oY2QgKnhoY2kpDQo+ICAJICAgICAgICgheGhjaS0+dXNiMl9yaHViLm51
bV9wb3J0cyB8fCAheGhjaS0+dXNiM19yaHViLm51bV9wb3J0cyk7DQo+ICB9DQo+ICANCj4gKy8q
DQo+ICsgKiBVU0IgMi4wIHNwZWNpZmljYXRpb24sIGNoYXB0ZXIgNS42LjQgSXNvY2hyb25vdXMg
VHJhbnNmZXIgQnVzIEFjY2Vzcw0KPiArICogQ29uc3RyYWludC4gQSBoaWdoIHNwZWVkIGVuZHBv
aW50IGNhbiBtb3ZlIHVwIHRvIDMwNzIgYnl0ZXMgcGVyIG1pY3JvZnJhbWUNCj4gKyAqIChvciAx
OTJNYi9zKS4NCj4gKyAqLw0KPiArI2RlZmluZSBNQVhfSVNPQ19YRkVSX1NJWkVfSFMgIDMwNzIN
Cj4gKw0KPiArc3RhdGljIGlubGluZSBib29sIHhoY2lfZXVzYjJfaXNfaXNvY19id19kb3VibGUo
c3RydWN0IHVzYl9kZXZpY2UgKnVkZXYsDQo+ICsJCQkJCQlzdHJ1Y3QgdXNiX2hvc3RfZW5kcG9p
bnQgKmVwKQ0KPiArew0KPiArCXJldHVybiBsZTE2X3RvX2NwdSh1ZGV2LT5kZXNjcmlwdG9yLmJj
ZFVTQikgPT0gMHgyMjAgJiYNCj4gKwkJdXNiX2VuZHBvaW50X3hmZXJfaXNvYygmZXAtPmRlc2Mp
ICYmDQo+ICsJCWxlMTZfdG9fY3B1KGVwLT5kZXNjLndNYXhQYWNrZXRTaXplKSA9PSAwICYmDQo+
ICsJCWxlMzJfdG9fY3B1KGVwLT5ldXNiMl9pc29jX2VwX2NvbXAuZHdCeXRlc1BlckludGVydmFs
KSA+DQo+ICsJCU1BWF9JU09DX1hGRVJfU0laRV9IUzsNCg0KU2hvdWxkbid0IHRoaXMgY2hlY2sg
Zm9yIGlzb2MgSU4gZGlyZWN0aW9uIG9ubHk/DQoNCkRvIHdlIG5lZWQgdG8gY2hlY2sgZm9yIGNv
bm5lY3RlZCBzcGVlZD8NCg0KQWxzbywgd2h5IGFyZSB3ZSBjaGVja2luZyBldXNiMl9pc29jX2Vw
X2NvbXAuZHdCeXRlc1BlckludGVydmFsID4NCk1BWF9JU09DX1hGRVJfU0laRV9IUyB0byBkZXRl
cm1pbmUgaWYgaXQncyBkb3VibGUgaXNvYz8NCg0KSW4geGhjaV9nZXRfbWF4X2VzaXRfcGF5bG9h
ZCwgeW91IHVzZSB0aGlzIGNoZWNrIHRvIGRldGVybWluZSB3aGV0aGVyIHRvDQp1c2UgZHdCeXRl
c1BlckludGVydmFsOg0KDQoJLyogSGlnaCBzcGVlZCBldXNiMiBkb3VibGUgaXNvYyBidyB3aXRo
IG92ZXIgMzA3MiBieXRlcyBwZXIgZXNpdCAqLw0KCWlmICh4aGNpX2V1c2IyX2lzX2lzb2NfYndf
ZG91YmxlKHVkZXYsIGVwKSkNCgkJcmV0dXJuIGxlMzJfdG9fY3B1KGVwLT5ldXNiMl9pc29jX2Vw
X2NvbXAuZHdCeXRlc1BlckludGVydmFsKTsNCg0KU2hvdWxkbid0IHdlIGp1c3QgdXNlIHRoZSBk
d0J5dGVzUGVySW50ZXJ2YWwgaWYgaXQgaXMgdmFsaWQ/IE90aGVyd2lzZQ0KdGhlcmUgY2FuIGJl
IGEgY2FzZSB3aGVyZSBkd0J5dGVzUGVySW50ZXJ2YWwgaXMgc2V0IGJlbG93IHRoZQ0KTUFYX0lT
T0NfWEZFUl9TSVpFX0hTIGFuZCBicmVhayB0aGlzIGNoZWNrLg0KDQpCUiwNClRoaW5o

