Return-Path: <linux-usb+bounces-17570-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF6E9C80D5
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 03:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79D04B218A5
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 02:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21FD1CCEE7;
	Thu, 14 Nov 2024 02:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JGGgEPPO";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ahsaHX6y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IcHb0vWH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D611A2F5A
	for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 02:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731551722; cv=fail; b=Z4xvnrhrRLz/CrRDRnkeomfhR1/tEXJUtYvjSjwPQ8omsEFElLTzqKlb+Ptej1bdNdjlgetIEQOoppHgjRJ3nWjJehsaaDK5Kl1hmwetUmal4cIMVJArG2kywZ1okaQRh3SMwog0pIDSYqj4MbDTaTcb/CdKbAehcfcfem/9CEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731551722; c=relaxed/simple;
	bh=WtpE2S4Pg97RzTDtZwPAM8fCkUdKefKNfEYh+YUYrDU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qV6UleLqZIkMIdS8BpXicPR0F3fSkmytfem8lvvIxrZanVN1GyLEXey714bHHFlW+58Hos1hvm7pnSCGt8KKlkYNC5ZREafZSjoBv/PSVsuPKfHMLeKbywUrLyMQVNwrk8Z8pvqMtxxA7nGa0jctx74pzDP1fuwULoP3LN9ceW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JGGgEPPO; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ahsaHX6y; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IcHb0vWH reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE1iOGc025096;
	Wed, 13 Nov 2024 18:35:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=WtpE2S4Pg97RzTDtZwPAM8fCkUdKefKNfEYh+YUYrDU=; b=
	JGGgEPPOsxf9LOEer2+NAsFUWNiGipgiJbSO54RnoX19W4WbjsgfwGqM9RS26+Ve
	ZtmFbMdLnlJOsiBX03YADqx+Byd9tdOnMPhyjt1omIcAwJ2hP6ui7K1yqispb+wZ
	bqmBjVEbJst+xXkxwjkJ8jw8yy4Chl4185fhm8VEYp8Iqh9oDUcVbfvtJBqicyD1
	Z5UQIoEnMMHGvfiD+SNSRG7xlfEeVj/NbhLM+QpTUkDjfgSzI+Edx8t9kiNjOqyB
	1tVpIunc2nZL8HEEWH8I7tDB/NW8tY7+kNvbcwjd0pVPRO58mfVApwmbY5CP2Oup
	BLnINwnoa9ZcfX42227TPA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 42t78m2haf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 18:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1731551708; bh=WtpE2S4Pg97RzTDtZwPAM8fCkUdKefKNfEYh+YUYrDU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ahsaHX6yDQAr4rz8dDZRIH21KduQR6S03lqq7tBqxEFByu7rZUFLOcBCZ2KtLSO2N
	 mLbEZjYPKl+woY/UdWjQOlqF/tiesS4345yeDtkvvW2ZPtgzcDUfdy2Z+Bqr/nBP0X
	 Ysqe7Lr4laQQm+BkD7D1hh6t3b57t9n68Lg9/DISXuqQ2kzuI3RX2/OiOz/eW2S4R4
	 D+sZlpdl9+qxrn/o0GAv7zXs1KdeBzya0QB9+bNrjaSWRRMW5ErDHrS7eNzkmyy7Z3
	 yMbGFZyM82GYJ2CQNBJrrLBekhAg7ko4nm+XhIFWFVGLinhbUew8XWgFIOCJprtG4b
	 pkuQC3QwYyJ6Q==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C3A8C4024D;
	Thu, 14 Nov 2024 02:35:07 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8C9DFA0062;
	Thu, 14 Nov 2024 02:35:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=IcHb0vWH;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 052D9401D4;
	Thu, 14 Nov 2024 02:35:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRl63rhV+aYb2XX9AnMyoObDSEQTGsZ4Fn62Ur0Qjdaqpyi4inUPdDL85l19JcyuYCKtkhTVVwpN3zkrxjL5m6Lq3pYd4B6Vl8d+r8qkMTjgkjNS/nUkFazZ36RBbpVkwudUFrftA54zi2QUray0Y8LNZhvs/n5ivaONEDA/le9RZ+fpR7EkKFFsvbs9VIJyY0nq/S0i4OWkrGvQfi3bPbg4M5TECQ2ILmdRWzhyhQmR3rueT3vWZDKVMCv20JZBLCH1hpmBMIMhJF23c4tg//EuwtxQLngUR66SX3pTNGRfXCMDVXdDxBUVxuQ9HGhYgBwoxh79yJqFTvK7JUfATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtpE2S4Pg97RzTDtZwPAM8fCkUdKefKNfEYh+YUYrDU=;
 b=pLIENHYoGf4mYvcbapvLAUCin04FiOAVnBMGUMtl8z7az103a+RCSWSyqFL3ZHGg921kYFybrEM9reMHczRi9NS+Y9SztBHsnbzkCgfMXS0mEGNvmx9h9zxT+QkAuGyVRy1n2nO0oWxwoiSGRK4O/ksVst3ttjg+W0ZgqWUx+li3/L7PbcXMQcHUiw83zMblL2hEchqh9n3BrLHBOTov56eYiatShvl6DPcaQbWyK1mxDzGrwXZApMqlAOUKt0wGyUDgjY4rJ/XaYNuZOvu/j2u/nRywws0EVZnTkzTj87fwofXOA9Tp/eKEgLlZ32rYw27l7kvREHXcU07yE5pgiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtpE2S4Pg97RzTDtZwPAM8fCkUdKefKNfEYh+YUYrDU=;
 b=IcHb0vWHsz6WcbZZOFxJqMdjJ3uS6EhvSwmD/M7xsf76tXGz+SWYFuJ2qJ0DYmypuVyQe9xabUumKyKY45PbXOfZUsoR62i7oj9biQSCjLiKSmiv5XdPhQa/QX72rQUSiqM2HkkqMTELZF3ZugIm+Zcbc0LL9woCZj1yFpN7b04=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SN7PR12MB8132.namprd12.prod.outlook.com (2603:10b6:806:321::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 02:35:03 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 02:35:02 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chris Morgan <macroalpha82@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Roger Quadros <rogerq@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
Thread-Topic: [PATCH 2/2] usb: dwc3: core: Prevent phy suspend during init
Thread-Index:
 AQHakFeioIjMhcyoIkClbCNPPNRvWLJpHmKAgC/myoCAADfOgIAF5FQAgABnfwCAAPC4AIAAdCSAgABbi4CADCIBgIAJ77MA
Date: Thu, 14 Nov 2024 02:35:02 +0000
Message-ID: <20241114023458.s2gf7gagiawhxn3r@synopsys.com>
References:
 <e8f04e642889b4c865aaf06762cde9386e0ff830.1713310411.git.Thinh.Nguyen@synopsys.com>
 <1519dbe7-73b6-4afc-bfe3-23f4f75d772f@kernel.org>
 <671bef75.050a0220.e4bcd.1821@mx.google.com>
 <20241025224003.yfujqurxhrgzgzld@synopsys.com>
 <CADcbR4KhWdXpynk2c-tryx1=Eg4LhC4t=C6zcVHAMcMz2hH-8Q@mail.gmail.com>
 <20241029224900.by3zglncf33izsgw@synopsys.com>
 <ca4daad3-9a34-4331-9faa-91b960924b9e@kernel.org>
 <672291b9.9d0a0220.1f040e.013f@mx.google.com>
 <20241031013353.cgxjqgboz6hcy4xx@synopsys.com>
 <672d0c05.050a0220.114196.1e8b@mx.google.com>
In-Reply-To: <672d0c05.050a0220.114196.1e8b@mx.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SN7PR12MB8132:EE_
x-ms-office365-filtering-correlation-id: 488c0ec9-b298-4e6c-3c07-08dd0454f15d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OW9TZXd5WUdGM3RFUzJ1V1h3OFVmRHo1d0FITzFKWDcyV3RxRDlrMm9PcWpX?=
 =?utf-8?B?V2M1MjY0NUI3SWNNRDI5a3c3ZmVpbjVhQ1BGdUlUZEE0QlljeGtjZHpHbDNr?=
 =?utf-8?B?SmF0cWdyNXdmN0MyNG54OVNGUkorRXl3M1ZIZ3FlRXNwTWVnVzdoc2xXZVZo?=
 =?utf-8?B?NitvdzlnajgrblJtQlF1eTRRNk5ha0prUkgwOU5NQVFtOUtqSWc0TWhGaG1P?=
 =?utf-8?B?MUJXamhrcGZDZGJIakpsWXZrTC8rNEZycENaN1cyOEVwZlFCalA1ZkMvUThv?=
 =?utf-8?B?Zno3WkNwM3ZubXFNOTJnVWlTL3dMaVJGVXpSZDNETkxCNEFHRHJiaEZMOUZZ?=
 =?utf-8?B?TU1jTTVwTnBVWCtnSXdrUms3Z0VrOGpkVHFXQWpuWkt3MU5MUDZYWG9Zbi9l?=
 =?utf-8?B?OTFyMFNGcDFzeTZGT09mNzREd2kvcmExUFMrZEZ0UGxWanZHZjJod2NKaGpN?=
 =?utf-8?B?L3J2N2FLeDVwUHR4Mm1OVFhxdTVaRTlqd1hPOWpYQnNwMWVzUWhvTDI5UzlC?=
 =?utf-8?B?cEQwZHI3cDFBUWd4N0pPNFhEdndLVGpuazlpWFdheW9ZMllJMlBRUTMyVnI1?=
 =?utf-8?B?MzRnTVpIV0k1VXZTeThka3c5ZDNhcEFtT2FLekpWSnlaSlliVU5lYjFPVjdK?=
 =?utf-8?B?ZTJDMHpPWVFZaHJkY0g2ZVplS21hMTVuTWdpSnVwTXlqZDdJWHN1YktYUkJJ?=
 =?utf-8?B?YkdOL0NnUkgzTWY2Mm9RdDlST2lqTW9VK085b08xdWdFODVaV0lhZGlybnhm?=
 =?utf-8?B?Tnl1dGM1MVpnY3A3ZEVBL2htRWMrUFBvZHF0WVFzUVc1REM3eUVPbUJuaDlS?=
 =?utf-8?B?a205dU9RMm1JQ0MyTXBSN1IrbjA2cFR4TEgramxQQVhPeTBWdmRlU0VzbWwv?=
 =?utf-8?B?OUlWVkhPVGEyME9SZTBsbjcvMTg2c0d3eDc0V2hsMHQ0ejRtSmo3eGxHTjl0?=
 =?utf-8?B?aVVQY3p1S2xDRUFUbkpBZTRKY2hqeGQrSk9xWjc1a1hPTjV3LzVlcnhlRXJD?=
 =?utf-8?B?RHVMUzR0ZElNK3R3WW9aMUVON1QzLy9MR0RLQXRkYzRjY0g1R2lycGVtcjcz?=
 =?utf-8?B?Y1gvZXlHZTRuNXBsdC84U29IaVQ3aytkVEYzZG9ZM3gweUJwbEtmZitkSnRl?=
 =?utf-8?B?eUMvT1p5REppYklwbEJITmw2ZWQxa0w0L1BUamZHejBCUXJmUVJVSDZSM1BN?=
 =?utf-8?B?RnlhRUtEZDZUcGRseUx0VXNoYWZ1ekthV1Nvdlh5bVhRK1BjMzN6c1QvVDRS?=
 =?utf-8?B?WUZORDVVTlNib2ZhQUFoTk9xeVdEVStpQkxEVjAySjVmdEtlSzBOb2F2SDNp?=
 =?utf-8?B?TkJKZ1hEVHVkMk81a1V6ZDJJRzZadU41N3NuNW1WTHFlQUxZY2UwWkw5b0hJ?=
 =?utf-8?B?MDRvYXNudGsyTDZoazBHT0U2bWFOS01LcEhoK0FnM0QyMmJ4OEtEeUY1U1k5?=
 =?utf-8?B?c3ljQ1J3cE96QmpRYnRyQUJvVC93cVkxZ1lBMWY0d0N5NnFaTG9IbUtxbDhy?=
 =?utf-8?B?Nkd4amIrNXBSTDZPeDgvbmlGQi9zQUViL0tDWnE0bmJOekVkT1VZODNmSDlV?=
 =?utf-8?B?cUNZdnhHWlZuYmhmYklOV2hCRmxHcGtPWDFqRjFzQ2d2SldsUTYyZ1NiQS9K?=
 =?utf-8?B?S3ZOZ1NzMEZMa00vc2RKdjFuczRKNnhZYlJ0ZEQ5U0Rid2tpNlVHZllOdXBt?=
 =?utf-8?B?NzNCUHh2a2lVU25PUU1JWHE3cER4S0gwOXJzK0V0bkcyU2hqVk43ZzJXQ1hI?=
 =?utf-8?B?TGRiTGZlMFRwRHFUYnpHNjFOTmwxODF3OUEwWHJjVlJWdlNKamF3NUFkbEVw?=
 =?utf-8?Q?rOR6Y0TekYSDEoH8vhnTulRLp0nSw3l9YqDc8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UDg4cWFzK0JIenlBYm5OU0w0QXoyZFhuRExHUUtmTUdGYm9RTS95Y2QwYXhx?=
 =?utf-8?B?dUZEbWhmTEVCc21oZDZZWkxqVTRLZDJqUDQraFh4QXp4bHQ2UjZ2Vlc4Zzlm?=
 =?utf-8?B?RVEzSmdXSDcwVWFxZDFMR25mR2NnaXdNWEZvV00vb2J1QmhaSXg4ZU1iWlE2?=
 =?utf-8?B?YkViUmdQd3haK1NjS0R0eUhJRnRxSnMzTFJOTEl0RmxiaDlTUUZMZDhIL1FK?=
 =?utf-8?B?WmFoYzE3aWVzYmE2QVVYdlc3dXhDUStHT0QvYlhvMUhxS1hsQjRDTjhhUU5M?=
 =?utf-8?B?enFCZkoxejNqM1ZjQ1hMNHoreWhsRzdhZUwrM3pWbWtJYUhDUjJ4M3RLWUlk?=
 =?utf-8?B?UUpVUHBaNkNBRmQwT280eHEvVU5wajBEaHFiS1k0VnFVeWY3V0ppMHpwUDI0?=
 =?utf-8?B?N3RpemRFbVBZeW1TanhTVXdSZm5WT01NTXk0RExnalMxa1graWRFMDgrNlRx?=
 =?utf-8?B?cnV2eGI4WkxXWEhVenM5bldjZ3dnU0tMMTZKelZWN0IzcXg0QldaOVMxWFpZ?=
 =?utf-8?B?V201b3BIK1hUajN0akszTnN2U0p0WjByVzF4SFFpZXdVRmM0V2lMTlVlR1ZI?=
 =?utf-8?B?SFhoT29RTXlhTnVENG82RG5RdDZxZkNuMnZYQ2Z6a0NhL0xmaW13VnA1KzFV?=
 =?utf-8?B?QzRqZmtGNnArcGR2Yk93TjRlVlBXTVpEYmQwUjVIM0FXTHJBNFNaeHR0Nnpn?=
 =?utf-8?B?YzM0RzM1eXk4VVc5VnNjSjR2V2NXNzV0bTBseEpaUUNLMFI2VzhCdjBzVjJr?=
 =?utf-8?B?dTFGRDFFOVdlcHl6V1grWmJsSC9HbWo1cWxMS2M4NzArVzdkZTE0aUVjWU5V?=
 =?utf-8?B?VFpFWisrcUc2MEhFZTg4MXdFSWR1K3RXSys3dHg4TGdPY3hlQ01CZWxYWEVw?=
 =?utf-8?B?eHNiOEs3N3BVRjlBRHlENGhla0l6RWtKWXgwNGNzVmZJR3J0V1NUaHRYZ0Zy?=
 =?utf-8?B?UFgvS2Z1Q1l2OHdKOE90cGNRSjA5SnljWjRaRVlsU3o5ODhpb0dHMWZWOGV3?=
 =?utf-8?B?S1dNeWN6SnNEL2Nsb1N5THh1cWpkeWZsbFUxc3hJditTSDNqZHN4bURJTjJF?=
 =?utf-8?B?Y1gxalRqZFlJWXlsYkpZZCtPY0x1K0dRVGtza1AyR0hqSHJwV3hvVlJNZVVV?=
 =?utf-8?B?dnRVSTVXOWpXdXZmaEZaT095QzBCYVFnZTFRMVVMc0dOR2VkbGp5bXEzZnph?=
 =?utf-8?B?enhHaGpNNUpCa2JzVlJvcWo1MHlpUEJoWjhiMTA4ZzA2Qzc2MFdwQ2xZcHN4?=
 =?utf-8?B?Y2lXWGp2V0d1d05wSWEvZkxpMTcxY3dTcm9MZENBdnAzSzZmUnVqUjNkbzYx?=
 =?utf-8?B?dW9RUVNYZGJpRFozdjhSaTdtVEN2WDFJWFNKK24zUTBNbTNLL1lNVU1LQUdw?=
 =?utf-8?B?d2ZJK05BMVZrZHpySnlxdHU0YUd4M0JWc3gxVkpCQWhjYmxHR1BiTFlQeWJY?=
 =?utf-8?B?RFBva2RGbk9rcms5U1JSdVZxelBJZnhKY1dzQlJWazhrMHRhdk1GQzFFbnh5?=
 =?utf-8?B?eWk1eXhOV2RKVVp1SHptaW54YmNaMEZQeHJlb3E5YStWM0JyZFl1YXpPYjUz?=
 =?utf-8?B?djB2NTNGMVRGbkwwdFZMVldYb1hPWmZpTk9hdWhrb0ttZEswQW1jYWdGMzAr?=
 =?utf-8?B?d09FOG83TFE5eXd2STdFUTUvUE9Dd2pTQnV6YW5kQ2daWjg2OWhQWk1scjV6?=
 =?utf-8?B?N0l3L1F1UUVyTVZVQXA2MjlkaEIwbTN6N3FGZGxxQ0VGN1pTclhHL3A1cXRm?=
 =?utf-8?B?UUNOWkI2NE5mTDFIUE5WRXNMc0VoMEdsZkxvQ054NFVSMklGckc5M0dxTFM5?=
 =?utf-8?B?Wjc5OGFyMmF4QkFqdkEyb3MyVU5xaTZWWngzb05jcmcwSkJ6VllFcSt6UktV?=
 =?utf-8?B?S3RlZVNncXBnQjBKSGNIKzhQTlNRRWlURGlJOFloYmlJQ0hDK3FsR1ludlc2?=
 =?utf-8?B?YnhNOUhkRG5NR3hFQzNmNnBubVdJb1FZT2xNMXEzZ3dDQmhRa3FKOEMrdWJJ?=
 =?utf-8?B?M1ZVSnIrV0ErNkM5RGtWUUxuZEZtM0xPcndIK2UzVFc1T1dNZjFrNEtxZzBp?=
 =?utf-8?B?MnZJYlhzWTVCTW9NVUxSa0NQb0FLK3hnc0Y4MUQ1UUJRb1d1SU9sajFnUFo1?=
 =?utf-8?B?MGVzUkwxditWcDhEYWIra3JlanNYeEtpZXQ4SzdNTVdBcGFud2cwazlFUGs2?=
 =?utf-8?B?K1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <840AF7C8A912DD45967978CA97C5340F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c5SBdgWlMKZrhbmsfpSro8qR0q9Qw8IZqE2n+5VkcjfvfuJuM1y6SWFF8dTgU/mxh9W2N6IK8eJRKPOJwnz3/x7xlYtCWM8acpHcKBDPROrFGf+0OhRo+7b6Iz4WzMVFJrlnKbc9b2dWqcFkhKsvSyumrQPtlY6toM6VRfRyl9Iri/YJAFeIp/EAq5j/X4y4oAWkQjGAk5ZUt9llh1zQj0aa7YoSI5fcCKreO01zYE9dcPVO4DXrQcDrE02FJ2qPkHgJjQ6omBykHZrFpNpr0comS2sqp7haUG/4JSZScKvSgKZSuofhN5t5JEXhCjPBinkY1jkhIExHdLAIqJ9kmAaLkhxGC9lJ6BPs4luKX4XouYktMLU163Or0cjgEKTwftV0mMJtjAQGCzjRTXWaTHxJMSGjF0QLNI01Qjw8ZFjxUtqhUTwEvYmO1RiQAeYu54zQIasFkpcC5wuPlXV7nvKFpLICwCUvfHOqn9vYTxHnG7inotrBL9byLYYindpgcZTu6ejLFdopvTcu8XBEmEdecnOof1q9qmM2L6CuzHgwTxTdC/WxYrh/qVa0q2PYBx2a5V5HZzm9WY62C/YFzTiHqvhfC8rMMNIAYFD9mkbZ/9n4usYiPUZFbXA+vh9kwM5f1TjbRr+9Lt1WjduwMQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488c0ec9-b298-4e6c-3c07-08dd0454f15d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 02:35:02.9239
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qukqOeL3U8yx5RL/wPUzTXPCtOKzHv1Kc2hGx4Rqvp5tzvnI/cKmVliyyy+CUcTLMLWyIfHa9/8cR3vYdczCJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8132
X-Proofpoint-ORIG-GUID: 1wG8abZqD-dKcjrSm9stsMofTuI5-q1-
X-Authority-Analysis: v=2.4 cv=NPuH+F6g c=1 sm=1 tr=0 ts=673561dd cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=soRp7Y47kFhHs49xC94A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 1wG8abZqD-dKcjrSm9stsMofTuI5-q1-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140018

T24gVGh1LCBOb3YgMDcsIDIwMjQsIENocmlzIE1vcmdhbiB3cm90ZToNCj4gT24gVGh1LCBPY3Qg
MzEsIDIwMjQgYXQgMDE6MzM6NTRBTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9u
IFdlZCwgT2N0IDMwLCAyMDI0LCBDaHJpcyBNb3JnYW4gd3JvdGU6DQo+ID4gPiBPbiBXZWQsIE9j
dCAzMCwgMjAyNCBhdCAwMzoxMDozNFBNICswMjAwLCBSb2dlciBRdWFkcm9zIHdyb3RlOg0KPiA+
ID4gPiBIaSBDaHJpcywNCj4gPiA+ID4gDQo+ID4gPiA+IE9uIDMwLzEwLzIwMjQgMDA6NDksIFRo
aW5oIE5ndXllbiB3cm90ZToNCj4gPiA+ID4gPiBIaSwNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBP
biBUdWUsIE9jdCAyOSwgMjAyNCwgQ2hyaXMgTW9yZ2FuIHdyb3RlOg0KPiA+ID4gPiA+PiBTb3Jy
eSwgdG8gYmUgc3BlY2lmaWMgaXQgd2FzIHRoZSBmaXggdGhhdCBjYXVzZXMgdGhlIGlzc3VlcyBJ
J20gbm93DQo+ID4gPiA+ID4+IG9ic2VydmluZy4gV2hlbiBJIGV4cGxpY2l0bHkgcmV2ZXJ0IGNv
bW1pdA0KPiA+ID4gPiA+PiA3MDVlM2NlMzdiY2NkZjJlZDZmODQ4MzU2ZmYzNTVmNDgwZDUxYTkx
IHRoaW5ncyBzdGFydCB3b3JraW5nIGFnYWluDQo+ID4gPiA+ID4+IGZvciBtZS4gV2l0aCB0aGF0
IGNvbW1pdCBpbiBwbGFjZSwgaG93ZXZlciwgc3VzcGVuZCBmYWlscyBmb3IgbWUuDQo+ID4gPiA+
ID4gDQo+ID4gPiA+ID4gT2ssIFJvZ2VyJ3MgcGF0Y2ggaXMgY2F1c2luZyBpc3N1ZSBvbiB5b3Vy
IHBsYXRmb3JtIGFuZCB0aGUgJHN1YmplY3QNCj4gPiA+ID4gPiBwYXRjaD8gQ2FuIHlvdSBwcm92
aWRlIG1vcmUgZGV0YWlscyBvbiB5b3VyIHRlc3Qgc2VxdWVuY2U/DQo+ID4gPiA+ID4gDQo+ID4g
PiA+ID4gKiBXaGF0IGRvZXMgIm5vIGxvbmdlciBhYmxlIHRvIHN1c3BlbmQiIG1lYW4gZXhhY3Rs
eSAod2hhdCBlcnJvcj8pDQo+ID4gPiA+ID4gKiBXaGF0IG1vZGUgaXMgeW91ciB1c2IgY29udHJv
bGxlcj8NCj4gPiA+ID4gPiAqIElzIHRoZXJlIGFueSBkZXZpY2UgY29ubmVjdGVkIHdoaWxlIGdv
aW5nIGludG8gc3VzcGVuZD8NCj4gPiA+ID4gPiAqIENhbiB5b3UgcHJvdmlkZSBkd2MzIHJlZ2R1
bXA/DQo+ID4gPiA+IA0KPiA+ID4gPiBDb21taXQgNzA1ZTNjZTM3YmNjZGYyZWQ2Zjg0ODM1NmZm
MzU1ZjQ4MGQ1MWE5MSB3aWxsIGVuYWJsZQ0KPiA+ID4gPiBEV0MzX0dVU0IyUEhZQ0ZHX1NVU1BI
WSBpbiBEV0MzX0dVU0IyUEhZQ0ZHKGkpDQo+ID4gPiA+IGFuZCBEV0MzX0dVU0IzUElQRUNUTF9T
VVNQSFkgaW4gRFdDM19HVVNCM1BJUEVDVEwoaSkgZHVyaW5nDQo+ID4gPiA+IHN5c3RlbSBzdXNw
ZW5kIHBhdGgsIHVubGVzcyBzbnBzLGRpc191Ml9zdXNwaHlfcXVpcmsgb3INCj4gPiA+ID4gc25w
cyxkaXNfdTNfc3VzcGh5X3F1aXJrIGlzIHNldC4NCj4gPiA+ID4gDQo+ID4gPiA+IEkgc2VlIHJL
MzU2eC5kdHNpIGhhcyBzbnBzLGRpc191Ml9zdXNwaHlfcXVpcms7DQo+ID4gPiA+IERvZXMgYWRk
aW5nIHNucHMsZGlzX3UzX3N1c3BoeV9xdWlyayByZXNvbHZlIHRoZSBpc3N1ZT8NCj4gPiA+IA0K
PiA+ID4gSSdtIGFmcmFpZCBpdCBkb2VzIG5vdCBmaXggdGhlIGlzc3VlLiBTcGVjaWZpY2FsbHkg
d2hlbiBJIGRvDQo+ID4gPiAic3lzdGVtY3RsIHN1c3BlbmQiIHRoZSBkZXZpY2UgYmVnaW5zIHRv
IHN1c3BlbmQgYnV0IGZyZWV6ZXMgd2l0aCB0aGUNCj4gPiA+IGtlcm5lbCBsb2cgb3V0cHV0IHZp
YSBzZXJpYWwgY29uc29sZSBsaXN0ZWQgcHJldmlvdXNseS4gTm90ZSBJIGhhdmUNCj4gPiA+IGNv
bnNvbGUgZW5hYmxlZCBpbiBzdXNwZW5kLiBBZGRpdGlvbmFsbHkgYnV0dG9uIGlucHV0IG5vIGxv
bmdlcg0KPiA+ID4gd29ya3MgYXQgdGhpcyBwb2ludC4NCj4gPiA+IA0KPiA+ID4gU3BlY2lmaWNh
bGx5LCBJJ20gdGVzdGluZyB0aGlzIHdpdGggdGhlIEFuYmVybmljIFJHMzUzUCBkZXZpY2UgYmFz
ZWQgb24NCj4gPiA+IHRoZSBSb2NrY2hpcCBSSzM1NjYgU29DLCBpbiBjYXNlIHlvdSdyZSBjdXJp
b3VzLg0KPiA+ID4gDQo+ID4gPiBJJ20gbm90IGFibGUgdG8gZ2V0IHlvdSBhIHJlZ2lzdGVyIGR1
bXAgcG9zdCBzdXNwZW5kIGF0dGVtcHQgYXMgdGhlDQo+ID4gPiBzeXN0ZW0gY29tcGxldGVseSBm
cmVlemVzLCBob3dldmVyIEkgY2FuIGdldCB5b3UgYSBkdW1wIHByaW9yIHRvDQo+ID4gPiBzdXNw
ZW5kIGlmIHRoYXQgd2lsbCBoZWxwPw0KPiA+IA0KPiA+IFllcywgYW55IGRhdGEgaXMgdXNlZnVs
Lg0KPiA+IA0KPiA+ID4gDQo+ID4gPiBUaGFuayB5b3UsDQo+ID4gPiBDaHJpcw0KPiA+IA0KPiA+
IENhbiB5b3UgaGVscCBhbnN3ZXIgdGhlIG90aGVyIGJ1bGxldCBxdWVzdGlvbnMgSSBoYXZlIHBy
ZXZpb3VzbHkuDQo+ID4gDQo+ID4gVGhhbmtzLA0KPiA+IFRoaW5oDQo+IA0KPiBJIGhhdmUgMiBw
b3J0cywgaGVyZSBpcyBhIGR1bXAgb2YgZWFjaDoNCj4gDQo+IHVzYkBmY2MwMDAwMDoNCj4gDQo+
IGZkMDAwMDAwOg0KDQpUaGFua3MgZm9yIHRoZSBkdW1wcyEgVGhleSdyZSBoZWxwZnVsLiBMb29r
cyBsaWtlIHRoZSBmY2MwMDAwMCBpcyBkZXZpY2UNCm1vZGUgYW5kIG9wZXJhdGluZyBpbiB1c2Iy
IHNwZWVkIG9ubHksIGFuZCB0aGUgZmQwMDAwMDAgaXMgaG9zdC4NCg0KQ2FuIHlvdSBoZWxwIG5h
cnJvdyBkb3duIHRoZSBwcm9ibGVtcyBieSBjaGVja2luZyB0aGVzZToNCg0KV2hlbiB5b3Ugc2V0
IHRoZSBzbnBzLGRpc191M19zdXNwaHlfcXVpcmssIGRpZCB5b3Ugc2V0IGl0IHRvIGJvdGgNCmNv
bnRyb2xsZXJzPw0KDQpXaGljaCBjb250cm9sbGVyIHN1c3BlbmQgY2F1c2VzIHRoZSBwcm9ibGVt
PyBUaGUgaG9zdCBvciB0aGUgZGV2aWNlIG9yDQpib3RoPyB5b3UgY2FuIGNoZWNrIGJ5IHVuYmlu
ZCB0aGUgZHJpdmVyIGZvciBlYWNoIDEgYXQgYSB0aW1lIHRvIHByZXZlbnQNCnN1c3BlbmQuIGUu
Zy46DQogIyBlY2hvIHVzYkBmY2MwMDAwMCA+IC9zeXMvYnVzL3BsYXRmb3JtL2RyaXZlcnMvZHdj
My91bmJpbmQNCiAjIGVjaG8gdXNiQGZkMDAwMDAwID4gL3N5cy9idXMvcGxhdGZvcm0vZHJpdmVy
cy9kd2MzL3VuYmluZA0KDQpUaGFua3MsDQpUaGluaA==

