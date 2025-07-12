Return-Path: <linux-usb+bounces-25725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52039B02873
	for <lists+linux-usb@lfdr.de>; Sat, 12 Jul 2025 02:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ACC7189FE19
	for <lists+linux-usb@lfdr.de>; Sat, 12 Jul 2025 00:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C657DA7F;
	Sat, 12 Jul 2025 00:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="djIW534S";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hCtuOxcj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ghfCLx6B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F96C6FC3
	for <linux-usb@vger.kernel.org>; Sat, 12 Jul 2025 00:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752281473; cv=fail; b=PPQLrQs9yoDSwe072+9dzAZUWBca14PyW8JFxt2LYcQK6gUdX5XMlSZIQGSdeY67Xl0wa1X2CHd8ToSiNUwKUussOrDmNdybhquFf+7FZO29ov/OgydWQuTyPOvNML4cY81t4qnZBMTKUPILEXKzkhunhu8Tpj8/lQK1nvaHxkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752281473; c=relaxed/simple;
	bh=W7JlVUQu3o1YQYnHjOMALRvtCWSQHOUThnQQKCikLwk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=N6wy5TesQ7yjtn5hRzklTdHkChFplrXB8l4MeZaEdYs2WjB1IOO8UEUR/W+ALtcliWlrQMFP2iTRnC3xv+xzTCn5BYZu0JRrWYWO5Ep23B5RPBHgZ2H0V5NErOQlrfaJuqSah5Mkgk+OU5lhlsKpozUNtF6qjocGP/ppLbEbzck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=djIW534S; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hCtuOxcj; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ghfCLx6B reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BKijUF032502;
	Fri, 11 Jul 2025 17:51:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	content-id:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=pfptdkimsnps; bh=W7JlVUQu
	3o1YQYnHjOMALRvtCWSQHOUThnQQKCikLwk=; b=djIW534Si68cCt/6w7Mxmcbg
	H/B02EMNW9qiSg21kzMLyGlCYxJCkBpwxAtPGDgrsE3VvQLz3uUdDvIv3Jr8dU4X
	gaoiOch/DJ2uR6APv3ULhg54elCUJEFUvfDdNVFvbws0yTVuzscTToj5sRl4DIO5
	kNXTLg9imtkMNPFZZs/EwL9FxnNFj7cfZxG92gRhUkas9QJq9M9vaOvtjj9YDUbM
	x+ldCXGsShKItyIARiEDxC9fbRxkKPWxo81BAcSKhkbLz0vIZ64T+9dwBPD4UArG
	UvNdNgCWNh0nyiE2I2uSz4Uqn7PCq7h0oMUNMkofyVbsTOfroQZCKAzg0HPmtA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 47t6m6swd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 17:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1752281467; bh=W7JlVUQu3o1YQYnHjOMALRvtCWSQHOUThnQQKCikLwk=;
	h=From:To:Subject:Date:From;
	b=hCtuOxcjKbDT2753VvF8e3bNRhyYKHYrOnCqGdU19OE72AqgiNAVU+Dh01XbVLZEF
	 vSA7TZZ1hOpzgGuO/boxgVmyUsTuNXhqR6YNZ+YvcDBSM/1E4n/E8R4Zff+Hew4253
	 iClJy1KwRWc9NHKoK8LfR2A1ItzlhtOjepMsMkWcfddZamgKWyJheUI6T5cJrld6Zg
	 950Or9sn+zNG61TK25ogmAAf4KV6TnW9T3+7hi6HXZELGNgp4CvAgJfPXtTrO2lFW+
	 JZx+I2svmUKxCY6kbnmjiFiAF38zyoOL00M/M8HAxnGGLLv4gMjq2g5QU8i4Vjkeii
	 dFCn4OCOpS6iw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1AB4440148;
	Sat, 12 Jul 2025 00:51:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B40FFA006D;
	Sat, 12 Jul 2025 00:51:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ghfCLx6B;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 96595404CF;
	Sat, 12 Jul 2025 00:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezqNNb+NUwjOulpJPHTXqtfgSaEOzRaZaLqnU/oWhk1kBvSljZIhYquoZFjVHKDvSjs2vjkNkOmE9ffEU8cY/A1oGLSsiQYNCmART9+FDyLBHfhqvQV13fqDOqPLsn3QkqnLnqHlaT7ML77/4LNN3+K7jg0Us0j3SqINWyJrkAzYsRIHnrRh4e/YLEzdp6IDuNFe5EY4e/Xdn6ih1m70uKiYJT1+gOL/d0TSEBqyyj3fyzRHuEJokb1IyxpZbH3zHN4QnmAPOsdzUPTAiq3h9UdxKC6wHVq0DwSRWkun8tOznmuOGJPmxDtPzuP4Ger2XHWSodqANfWwm5/MzwJa+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7JlVUQu3o1YQYnHjOMALRvtCWSQHOUThnQQKCikLwk=;
 b=cfeGkdP+qNiAsPYjF3BpaEc1sx/O6Ixq9//IN4gctylrCMEJZzGnz+OkQYnS7CqdQ31mqQ8z8xXzA84Og8puJrWvdlZ87Pame/6uALL54AFkKor4l0k5lmG3EpS51KMxuzwhz10QsxXVWSpv+C6wo5WKKIcsOPOSjMPYbp//uEactc3LGRaF6FMrjTBv2uB4/xaJGhySEXn+08aPDzuGekXG6U8KouY0j+9ACA6iAJjTSae/Kk+K6KbzBRt+KoygszFWZ/kcRWn6FCoYiskvFHSGxLzMuYJDeG2cJcGHgwT6Va/9fxnk7v4NVaDDMbq3MTh4WDAKj5TTkPwX9qPUSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7JlVUQu3o1YQYnHjOMALRvtCWSQHOUThnQQKCikLwk=;
 b=ghfCLx6BbR33c4hu5Ubk1pnDrDRViEiUJ1ygoEJ6fiQXiwRFD+0xB/lr1yCAxecKOL7UHIoBugFY1Y2k4J0GU6Khxhg9/kFOOHoSoWtc+XOva6ezwYn4NWlCX1kdgPljNvKk0aq2WXjt/7CcdY3br6r2eVCwjTvMLJ0TVvO3E6k=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ1PR12MB6099.namprd12.prod.outlook.com (2603:10b6:a03:45e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Sat, 12 Jul
 2025 00:51:02 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8901.028; Sat, 12 Jul 2025
 00:51:01 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: DWC3 maintainer on vacation
Thread-Topic: DWC3 maintainer on vacation
Thread-Index: AQHb8scJMwJaQ2dmU0KZamT3uW6X6g==
Date: Sat, 12 Jul 2025 00:51:01 +0000
Message-ID: <20250712005044.52qtqeuuypzecibt@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ1PR12MB6099:EE_
x-ms-office365-filtering-correlation-id: bc85bcda-d216-4626-6b92-08ddc0de2c1a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VS9ORGVJVUppSW54QTE4OGdTVzJMaFV2N2Q3cHpyMUtYOTBBV1pZZi8vbmVj?=
 =?utf-8?B?d2VvTGJ2dXFvTFZkcXRVbmNjRmd0WFlLTWpUUy82Tnl4am8rY2cxWWFDNjRN?=
 =?utf-8?B?Q2gwVnF5Q0UySVAyOXR1WUJoQTJERnV1WEgxcG5NK2xldkRZTlpGbHdOZ2dG?=
 =?utf-8?B?d3N0MzY3dk1zZkN0UmRBVzJlMTNqNnl5THVOWmtzN0VjclNzbWQyY3ordk51?=
 =?utf-8?B?WG1yNHZiNEY1MXBrOStzdkV4dmdoNUlja212Zk9VTm5KUWpVZnBUcGVyQlFp?=
 =?utf-8?B?VjNMMDQ2ZmlXaGE3enpVaEpxU0cwanEzbmplcUdPVlRHOEJ0L2lLMGx5VklS?=
 =?utf-8?B?MSs3OUVQNTZEUC9LeVNYWENxZEpDSXBSSlRuQ0FWUlhHUUxBdmtGYUI5OXBW?=
 =?utf-8?B?S01ZQlZTZ3BlYnpMU2kwMVVXa3BJL01kUUEvZzIreXY4L0tzbytGM1djWHk4?=
 =?utf-8?B?Vy9yUHVwRk93end2bzIyZ1Vjc0Q0Q0FyaEFRd0k5c2JKRCtSUWRrTHY0ZVVI?=
 =?utf-8?B?eTFzU3FqQytjU0NYMTFIeUxSQ1VtYmFRdHc5RzBvL3JoamJLNC90OFdxM2h0?=
 =?utf-8?B?WXl1bE5YS090cDN6NDFwV0RwUTdlaGc0bURQUlE0K1hRRGRjUTFHQ1ZiUnl6?=
 =?utf-8?B?bTd4QjhOMHRUUzhiNGV1UEg0cHArQWRyZGwwOWNkVFFKSi8vWGxLTDAxc0ov?=
 =?utf-8?B?cUN3bzFqV2RFUHprSFZEWTB1SFpaTmpWbTBUZEVvLzdqS1RUQlNSRUdObWhL?=
 =?utf-8?B?Q1drY3JTaWRNcVBCeXZCSU9QSGh3bU42aDlYNklwL3NFdUdwbE5LREo3SUtK?=
 =?utf-8?B?cnBEUUwvd3F0bUx2TGJvU1liVkZiSU9zTDB4MkVpdkd0MUNKbldpZmJ6clE4?=
 =?utf-8?B?c2xOZEhMaElCSlBJUmZGUXZSdGxBWSsvNytYVllDUG1GNTRKUWJPbUNZWGRS?=
 =?utf-8?B?aUwvK1NPVzc0RlhaZmo1clRZY3ZzT0ZXT3BUM0FVTS8xeC84S3ovTHJGZXQr?=
 =?utf-8?B?Z2lMOEkralMrR0JYeUdEaGZmVkVoOTVMMkxWbkpYTWRLNlN4azVJUDJOZUla?=
 =?utf-8?B?NmZsUHFrd2VDZElYd2I2QW5lUFhkLzFoMnlTem82RXJmUmJVdG9sYUk0Q3hL?=
 =?utf-8?B?QkM2a3lDUXFhOTUxVklvWXdOSnJMbmxOV0I5ZUhtd1pxY3BPeGNQV2h3ajJh?=
 =?utf-8?B?VDN4bFBqK0JFUDVVWldhRzlHNVpKdlhobUJXTEQxakh4Uy9IQkliSFRIY2NQ?=
 =?utf-8?B?c2s5Qmw5YVJ0b1hiNlVFYmxMZXdMWXFsVXU5VXZHb29pVzdvSndaSEtwS0hy?=
 =?utf-8?B?UlFmQ2tOS1ZjSDFTMThwYWpuYzMxd2ZzRGI3ZS9sdEtBc3pnNGY5bzVXZjZp?=
 =?utf-8?B?SW54R2NKcDRQaGluNHRzUlhqbTRnMCs2SC8xY0N3OWFRRThoVTRUcXBCMUdh?=
 =?utf-8?B?Rk04UE5LWlZ5eTA0cS9Ra1p3eGZsVlJQVmpRUTF1VUdvdllXZ3RBdHlLWnc4?=
 =?utf-8?B?SmN5TDRpODZ4VUpFelFURitabG95a3FWM0pNaDFUOWd3aXNKR2Q1ZTJuVkIw?=
 =?utf-8?B?cEdPVXlpb0NzamlDVnlBYW9EeU82N2cwODdMak53Zk5iaVZiTWNJYnI1Z0cz?=
 =?utf-8?B?RFpuOFpDSVY3MkRZUEZ3cHlzdXFCRHZNWmlPYmRMRTZXOUlIbk5VRzNuK3E5?=
 =?utf-8?B?Ni9PLzVlNnNDZStkV1p1RjBlRFNYeGd4MVdEeUtKZ0h6Zjc3K0RaczJsYVpK?=
 =?utf-8?B?c0I4Nm85R1hFSW45UnVEVDV2OXA5L1duSVZBZ1I1S3NPTzNPdGRzQWxxRzhk?=
 =?utf-8?B?Q3FIU0tWZFVCU08yTGdzZktycFRTMGhQY1ZXVTlSdXVoUTh5T2t0eU01WER6?=
 =?utf-8?B?RnRINVVtbjZxaFA1dVNIRlBqWldncTRySm4zNDYrbEtzcTFtZ2dqazZJbDFE?=
 =?utf-8?B?NFRPbnByeStCblVEZnBWbXJLL2N0SnFTTWJaUGdoVCt2RDFzallGUmZIcFc3?=
 =?utf-8?Q?b6Ox2eSYgVDEhCzx6xsivh6Es8TzhQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NjM1NGFlUGY5L0RWNllZb2dWRE1XUHVjWEEvalFRTnA5dXBXUXhFeHZiOUNH?=
 =?utf-8?B?QTdoT0VLVXptSWdqNytKSnhyMFBCeDRBS29sb0drTlVlSFB0OXBsRTFyRzJk?=
 =?utf-8?B?ZGdOK1NZek5PTTBKd1JlSnljOFVXY2s5WDRJV0ZTNHQxaEtVWGJ2WTdmRHlD?=
 =?utf-8?B?ZVdlTzh0c2liRWRUYTR2YjFiRTIrK09mZUwzbU5ZUVpieGRWbnNnWG56bWJG?=
 =?utf-8?B?K2xlSXM0bERMRGEyNnlHdUhCK29yVEhVVEREMGYzK2RKQURvbnVNMFErSktJ?=
 =?utf-8?B?UEZMQlFJaE16cnpHd1g0THh1Ym94OVRXSlFBMjEvSDZ4OGVrM1N4ZWxJVUdD?=
 =?utf-8?B?QmZNdCtNNVlONGhLV3d3U0NEVUZMOStIV3BCVGpWYTFJRjlqOWZ5bFBlTzB0?=
 =?utf-8?B?cFU2aGNLejBPRjlmZDBNckFtQnJrckhLRHN5OE1RNjVadm5CT3cxN0xoZHJo?=
 =?utf-8?B?Z21iQ1RWT1NPTW03MFY5LzkzNHZjdVpUZFU1bkNSanVESlVjU2U0Z3JQU3VB?=
 =?utf-8?B?aVQ4TndZeUUzdEI4SWRkS0FFb2VBRUFiclJsYldOaXNRcE1CRW1DSGo2YSs2?=
 =?utf-8?B?LzhGcElFZmJlSkEyUnlJQXVLU2d4V2ZJV1JDNENyUlRscUJ1SXBOV1ZGYmZL?=
 =?utf-8?B?NHlDZmxyZXJQbFZBOUltNklKL2hGUDRCS0t1NTc0UUFad25TZGRybmFzQWNO?=
 =?utf-8?B?aDdmUTdGeEJ2UVE4YWx3TDlkM0JlaHRmaFZxR2dXQzU4Z0czbmdWRmxnQy95?=
 =?utf-8?B?SU1WMFhFVHlsY1JwQ0JBWXdvSUVoN1ExTnNvTG51ZXczZUNYc2w5SVl6RW5H?=
 =?utf-8?B?OTMyVjZaRUlCWXRqcnhPMkhkVk1jRlJMSHNYdUNoWVEyWDZmNUZ5S1NBMmpT?=
 =?utf-8?B?bTkybHRUcnN2eHdkbHJtVWFGaUcxRFJQVmwvc0NxalRJODBHVDJDSHFDU2xv?=
 =?utf-8?B?MFpmQnB5MnJwZnB1ZWFOdnlva1VGb0wvNVJjWGJBdnN1WVo1WFlRcjgrWEdX?=
 =?utf-8?B?bG0xQnJ6c2tWdno3RnhuellSQnJrRWo3ejNiYWszUmxJMUd3K1ExM2JqbjYv?=
 =?utf-8?B?dERnNG01ckp6cXFXLzBGUFBzUVU1ZEVUWlBVejF5cHFVYU1YYUlyQnJacy8v?=
 =?utf-8?B?QU9wYlZZNzJrRkRQN01GUElkVk1Oc2drbjhTZUVRTXlkVjJ1dkZpMkh2bDc4?=
 =?utf-8?B?QmFNUDkrNXZ5aVFHbkMyZlB3UEFxbjR0eUVwT3FGWGpHWTBQbVRTSWhyRmtE?=
 =?utf-8?B?a0s5eXQ4bHA3Mk03bitMd1h2ck9EQU5pWFhtVGpiTHh3R3N2OS9US3lnSmMv?=
 =?utf-8?B?M1MyS2hlVDNXK1pONG9KV0RDZ3QwaHM4KzdPeHRmRytPeEkzdndrd3lRSGpQ?=
 =?utf-8?B?VzVYQXRicUZKelhoQzZtSWJjeW92T1NkdFdNQTFEQ2txNHhzRnhTbFg5eTBj?=
 =?utf-8?B?d2tVVE9TSmFtQ3BjQ1BFY0k5dXZNYnpnSGhWeUZORVQ3ZjdNdTJpV0tzclNn?=
 =?utf-8?B?bmVIcVZpMnZTdjRJRFlxNjZabS9Gb3BUb3I4Y2FZRnNUR2NYRnB2MVJqRElQ?=
 =?utf-8?B?VXFMcHVwZXg3SHdMMVJoek9UdVd0YUxDZGlCN2gyRkhZRE81YkdDSXVUNW9W?=
 =?utf-8?B?MmdDbG9CaENRWjg2S3pIcURJOVFHajZ2djZUSzg2NGF4NitrWnpmbUVNKzQr?=
 =?utf-8?B?WldwdVMxSG5wdW5aa2ZYUHlta2VzK21QOTlYN2Y1OWNtemFka3JHOTg3SVF0?=
 =?utf-8?B?UmRhbDRuQldhRVJiUndvamFlbFVsWDNRVWY0clRNQVJLa21BVXc0MFNsOHBr?=
 =?utf-8?B?aVN3ZERxYWlVL2EvUklRQWk1MzVKLzMrMDdUcGUxV3RZajQxRWUrQ0kybGdD?=
 =?utf-8?B?VStYL0d4ekRESmRZUGN5Mmh1Z2FjK2NKN3htS1dNVXRLTDNKR1RkQWNWWFE2?=
 =?utf-8?B?SzR0Y0FIQmljOHczeGxJRnpIQ1RnOFVjak41SDNmTFZ5VVlvWVFBK2U1c210?=
 =?utf-8?B?NDVvRGpaVFBFc09uN2J4YnloUERQbWFONW9rL1A3VTdhbTlkbkxubHYyOXp4?=
 =?utf-8?B?d1I2Q2F1UlZmdnNHaDY0TnNyWkF0RkxpRXdwdkZFUlE4blBBSUtUeVpzQjlD?=
 =?utf-8?B?cDJRclJlVWUzVitjUkY5TU5uNDROK21xaHlMT0dRSjR3RHNZRzNzcmc5bTEx?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <061145C8B578DA4088434BAD7D00EB82@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d/by3H08xejA2YayYhxV0uClM+MRhw36NR1tN6rTAEM2YHuSa5Xj71jbYsaFfT3z5bM+T88Df1J4lGJ9XEfxKQU+5jdWgr2tcHCE79IH6LpKHO7nD1HrSdh7VYjRTLu3+MOg3XU3Qo6REN7SnBQun0CPC0JTQLXrNMI42kh9jTXXPA5M3/YBpiaC4zleb5AIlq+Peq00Ug3pFlc/iyMc4ynZZqbMcsj3CR1gS/h2rdO+LxV7rK7vRnaE9PaxLSOOBShoO+PDqM2xIv3wiUE/eT6tk1MEf0OzjLGKxvm2ClkCW9cKe53B2Tn29aAni8FFDVWPYU5EEarz3JIeuCgk1TRh6iFcsY4X8zZcnJOVO2446TRbgCKhyUuFvBuPofFuFysMIQXlJ8DTzm8wmyPoG+FlT2hO7Ay847KUJXOZmjLSRPsON89yKA9eXs9hTYTP675lordcHscyxscMVlj/3SRIH2Q6B4/FH7Nr35NpWoZvT3khx5/WWtOBazKhJyM8q6ZS6YeHTEo5TPJb10ukfw7EIuv4OHAEoeN4ge65FH5pJ5DfMh2W3m29l8cNYgRDmq/dI5LFFM/UTkG0P38Nsx9QtAD4FRbaRe7Ta7Ll43KI/ObR4/Bq+YtaBmRa/+NPTwPVjw55VQdHPzrEBq62pA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc85bcda-d216-4626-6b92-08ddc0de2c1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2025 00:51:01.1521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wR8N9zJHlhThMtP28wy1+ct4EdzkMXVuGrgnyRxATO0yQgpo6uwWZvn9yNpALKgBApWi2lPbJKxQVAyjab0LqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6099
X-Proofpoint-GUID: 5IDV-sxlGHkf3Fukm79JTgdf20aXu4kb
X-Proofpoint-ORIG-GUID: 5IDV-sxlGHkf3Fukm79JTgdf20aXu4kb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNCBTYWx0ZWRfX/SUrAVQ5hBZa
 DTrYM1Jic8Xd1NJJqkQ1pPu84sK8z8RHB4fc1/+1FxZ/NcbhhQIDgezQ4TiNV1OC24uTT2F/dHh
 NeX1+eq36dMmFBzSEBXHgnk4ioZksQMgMnm/N4YuvYgrDG4q31zHskUVc7EJPKQvOo4H/QyYBsl
 zPrPvCw+7Q1e6Q9ivi22Wa19yJUiLfUsyBpM12MX7B1pgxqLVsnllJK+pccufeNu/IX7vYb7MRt
 PCKGnkg0O8vYsEYKdtGS10t9uY+sqWsBJeWjwXbrEUJJBGXSUp29JdUEGnVr2s5V8DcDCFTBvk/
 1Y5oX4JduPWNNagkeQGDyJmG4cbqxRQv5MYLXOAsrChl60snZvfIE6Xb94OwuXfNflQMpdzfD/R
 5OT9sHN/fUyy3Q0Dr6RSFm0Ip4eYPGAWJcKJyN8KninXsCKFRa/J0xqvSXL8d0fcmIXX8vxV
X-Authority-Analysis: v=2.4 cv=LNpmQIW9 c=1 sm=1 tr=0 ts=6871b17c cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=qPHU084jO2kA:10 a=HYEssI4FhvGiMCWkaGcA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 mlxlogscore=452 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2507120004

SGkgR3JlZywNCg0KSSdsbCBiZSBiYWNrIGFmdGVyIG15IHZhY2F0aW9uIGJ5IDcvMjguIE15IHJl
c3BvbnNlIG1heSBiZSBkZWxheWVkLiANCg0KQlIsDQpUaGluaA0K

