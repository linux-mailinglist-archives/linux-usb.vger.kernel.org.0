Return-Path: <linux-usb+bounces-11548-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C885D913129
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 02:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECBC41C21CD6
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jun 2024 00:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A601865;
	Sat, 22 Jun 2024 00:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EbtOwMHm";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="O0W6R03I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="wrLBz+ka"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59787E2
	for <linux-usb@vger.kernel.org>; Sat, 22 Jun 2024 00:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719016120; cv=fail; b=S0be/w47s7+qudxhRHZQzuL65AYjJVCxbenQQ9rggg9Ddzv8muSMnd+bnox1kYmIJWYcAOOU5KqREokuhMjm3ddgrGdg295V6I2WiBRoRj7ssGEN6mS74G9sxuxCjEZF6MxRZ247kXPeySFWcoXpQp0RTuHUz20aFL5SwsZeUfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719016120; c=relaxed/simple;
	bh=Tp4qUaWlmmLFYwawRX4jLJY1IQZ00pr7i8Ls4WfGJ40=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZotpDsAQR3MbkQxZ06BabDIR/syJu4RLSzEzRKY4iWESIi+P52FiH5UE5SqYPsMHY+9LqHLN4BCx/23iuVdfHTRWfXY82I6o+d7vDNA1rBI/5xlHBSxdE82D3Sfhe/ET3sYKyncXqkTwEKjelJnvuDNk65zp+mpxNwPahg2WqO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EbtOwMHm; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=O0W6R03I; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=wrLBz+ka reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LHjLf7015990;
	Fri, 21 Jun 2024 17:28:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Tp4qUaWlmmLFYwawRX4jLJY1IQZ00pr7i8Ls4WfGJ40=; b=
	EbtOwMHmSDHscWIX2RDECSGuZtmYITcIigo6c79dJLkGFirwPzWHYzqBSneDKZaH
	g274t++NzTFQXjhsHssghOjwferYRSOtgpZgJHd0nCYwbwJ1g0hXGEeEQu4pdSC4
	O4WB0vGrNPbndf8rRjt58Nf44xPNJFKJ2D3X9Y6N85/m9bwMKorLsCC3nTWV97lk
	Fmp5zuAkgaRRrBPiqK8ndwCKWwqVKsOVdDCf+1b4PnlW7iGACLcouUgdPWWmAUwQ
	2GWArRiJhhamaAfOqMur3kvhZ43t/ZSg7m/wlpsqAl8XAcyNXIGQcBYzRCaVl9FW
	WXiFLNkr7f6loQqjctnMJQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3yvrk1ph7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 17:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1719016112; bh=Tp4qUaWlmmLFYwawRX4jLJY1IQZ00pr7i8Ls4WfGJ40=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=O0W6R03ICX8j5i+KShydqsfEMT0w+0tfuia9VhADPlyZrCMklE4mKshPmUWBfOEjw
	 hUfGSRkdBojGjodC3k4g1V+si8e/nuJQzHqqUcrYJkjS0RwrezBtSFYO1bjvvXXmeT
	 H6SXFkULG6Coso66lZURoCVozcblhZDPfMw4uCln37LQLT3vqOJcFBghaUZRQwSpO8
	 q9OCYL8GnIGGvV8fnrRWXmFgMXM7D1h7Wl2zbLuKaI5zlCbqEk//djEAB2yAtXpiCb
	 /8MRQlOhopFmBA1V6MCYGpojYQXfqSfBtLATvGFAaO81VHrBvELXll9Otg0yupt+/M
	 lGQOlgoPAxgUw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2BD0640467;
	Sat, 22 Jun 2024 00:28:32 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B18F9A00CD;
	Sat, 22 Jun 2024 00:28:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=wrLBz+ka;
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0A4AA4028D;
	Sat, 22 Jun 2024 00:28:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lS+RGvNphGArk/CWOqLqYK9INlh/mDe3UOEk49eYa8Eu4dmE675TcKn1atTuaBOuKY/ZbzYznT+nqQygytDmAVUVWLvKr3pvPob+KflJIM5jnqaM5qcOwpbPuQ5yA6x2Zf0Y2xdCTEKx+NyEI+GENqC5Rii8G0WPLJJy+69AD6yHyuwlC/ay+UF5ZoQpFkZOw2BLVFNq4ubO1Ri8JQN4UJKUW/sNaB+hOSSl/y1YXc+e73WkpCHxhPjy0KQU/3B+c2vVxR5LZpXBleiqXgZ3kDMIfFUgKHMiy1TQts3jDcKIb/Zc1U+0xGdspZyd3MQYnOQGeMGzVSA1C2hhSrSspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tp4qUaWlmmLFYwawRX4jLJY1IQZ00pr7i8Ls4WfGJ40=;
 b=mbdZ6RzUIEDAUYCKQpVOt+SdDvUb0/dw+UDMCDhHjZIg3Ou8B8UXz60g11BuejLI2BA+kitVM+T8FkgYA7qochK5fVFLr/5+mXYy9o3AkpQQ1oztAuz2+C/3fslyKm6/0JS0i6tCMmKGznWONOIRxKOj6bAvck55WY/iFHRm8i8JdJiIOr//tjbToTLjANpkAilAu7gSRZKoa7tA6jhB7o8dEszPCulcEx8cSfFg+uJz5uHCeSs9Y56OlVOr4nvEDGtBRqc9GmdVQMeqQc9M8th6X8GeYjFrjvJnQKuy4SPgWQjJryCNMt0FXgIaUvufK2U8JF3284wYOx3Mtt4UUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp4qUaWlmmLFYwawRX4jLJY1IQZ00pr7i8Ls4WfGJ40=;
 b=wrLBz+kavBvNhbzqbhpgkVhLRqE1dLv3JrGT0E4e85TCt3lkyUk4rSMdoYN5ZJrTAriq3XvldM4Faf9IBypnMKKKhcnlB9aHUkkFYBIkeyxkQIrhlIkNAEvZEUw4XUhWaHX91ixKekjCFgmeH6gwiPrEd6QHjJbzLb4VlU184DE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA3PR12MB7858.namprd12.prod.outlook.com (2603:10b6:806:306::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Sat, 22 Jun
 2024 00:28:27 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.7698.020; Sat, 22 Jun 2024
 00:28:27 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "bugzilla-daemon@kernel.org" <bugzilla-daemon@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Thread-Topic: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Thread-Index: AQHaw4IjMglKghOq/EqS6pvi0QWBu7HS7ymA
Date: Sat, 22 Jun 2024 00:28:27 +0000
Message-ID: <20240622002823.u7twl7kxunba4vi4@synopsys.com>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
 <bug-218943-208809-u8V53GmkQx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809-u8V53GmkQx@https.bugzilla.kernel.org/>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA3PR12MB7858:EE_
x-ms-office365-filtering-correlation-id: 3acbc297-3e3f-475e-82df-08dc92523c17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|366013|376011|1800799021|38070700015;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MmIrWnZGaVJNK1k3aUZwREVReHF1VmZnZG9ybWU3bGkzMXByTmRBbUhGK1NB?=
 =?utf-8?B?SFc5ZHZhS1VWR0NSWEExTldkYmQ4QU44V2duaGVFUWtDbElQRVJwK3NyR1Iy?=
 =?utf-8?B?SVUvaWlyOFVxSCs0dzBZUVJsSmFjM29jdXJFMXpxYWlPY0FPZ1FRUTlqU2R6?=
 =?utf-8?B?bFhGd2tOdHJwVk82L09QbExvK2xzbnJkT2xNaGNNSlRqSWN6dUZDaEYwRmdq?=
 =?utf-8?B?TXJuQUJ5RTZXOWx1WUM0QllSTEVmU3djTkVGMmxmTGg2bElkWDd4bTBObHJj?=
 =?utf-8?B?ZlF3cUcxcG1GMjVWMnJqZy9iNFRkODA1MkhXclpNQzRLVnBlQnRDUWZjeTFo?=
 =?utf-8?B?TnNBTDdYenNSdmlyamZ1Ni83U25OMkltNU9tY3ZNZXJON1RoSzc3WXNDRGlZ?=
 =?utf-8?B?U2ZEKzd0SVVBYVVsVlBpdTM1dUx4UlFKczhJTXp3T21iNkt1YnIwZDRmQVhu?=
 =?utf-8?B?R1o2VTFYd25Ga2w1bVhSNzFWTC9ScTVEL3NnWXNXVWRvNHZPN1pmWWxzQ01Q?=
 =?utf-8?B?YkVmdDdVaDhQUk9BbGtJdFBKdnFnMVp4L1NjeGpaN3hQUHN1clhRMUcrOTJ4?=
 =?utf-8?B?RlFrZVFQSEgvWVRqZ0daenNsTDBaelgxMklTdkFGTzVJbVZjUElacHp3ckVp?=
 =?utf-8?B?UUVKWExRL3NNZG1sTjVFRGgyQVoxbDlmeUhnRG44UFVJT0V5ait1eTRXSFRN?=
 =?utf-8?B?a2lKY0ZDcmNwU1RUU0MyTlNTRGRQVU40Y1ZQbjZXZ3Z2RjRPMTlnK1dVSU9i?=
 =?utf-8?B?d0NRNjlFNXJUSnVEQy9OcWdDN3hRS0U4d0tUdVVpanhrS3M0UXVGMncxOXhn?=
 =?utf-8?B?VHpLM3FFdE96akpGaUNFcGczRGhCdnhKTkYzeEhDSFhSRkVNbktPeXp4Rzls?=
 =?utf-8?B?ZEd2aWJXdmh4REpEUjh5RVE4TVNQOENtSUpZZ293YjFoRWtvNFJNdFVEOUpx?=
 =?utf-8?B?cFdnTTRmV1lmRUpIU01yeDRwRC81UnJRMWEvZGlSaE5sdUpPYmRwUkpKdUE1?=
 =?utf-8?B?OGpMZGVWYkNPVEZjUnpoV1pqZ1Q2S29vaThJdXR1OFM1VHBhREttUkZUaEx3?=
 =?utf-8?B?R1lXODcvN2FsZk81SnRNdFZPMkxzNEZuMk11MysycldzeGl3NE1kVTVEWnRW?=
 =?utf-8?B?ODk2UE9XMElFRlFEUy9kVmlaMWVhSjRhcExqY1B3eU0yaGVjckMrOFNxNFRz?=
 =?utf-8?B?SWhDZWhxbmNyV1ZQSkt2MlRTdTBEME1qU0dvUGdjdEQrNmVmVDVxL1F1aWNw?=
 =?utf-8?B?NXRhOHFqZ1AwZUFnOVZqOHJ5Z2RzaUc5K0laNGlQekNvSVlqRk9HOVlLN1RJ?=
 =?utf-8?B?MWlLMnRieW03U1hjdGlSaVhIRXExdGphMXY4RndHSVZBVVpOQkg4ZHZIK2NB?=
 =?utf-8?B?TkJXYmtlNEIzUjNVc1FSUzVoMzcyRkdTUXBDdVpvUCtyQ3lXY1M4eGVSMFMv?=
 =?utf-8?B?bGNEa2ZlY3RJTGtTYWZobExLdUpkK09TS3B4ZTlZK21PUmJTTC9qQk4vMWNt?=
 =?utf-8?B?TEc0U0I2bmRrbjBvcFNobnpteXoxNVdKdThJak84RFdoWFdNMmtBYjNvU0h6?=
 =?utf-8?B?SXkwcmtsazR1N2NJdmRwV0txb3JKbUE4aG5lbkFDRlIyNWRwVmhWbGU5cXl3?=
 =?utf-8?B?M1pjWFlYOFRJVUNiQlBxRDR1WkF6eS8wNVpGb3B2RnoxSGdjcnJwdE9PUmhG?=
 =?utf-8?B?WUI1MkFuc3BpREFJdXZ4OUxHbzFITElEK1h3bmdKaW1ncmdvdjZ6Mjc0QThE?=
 =?utf-8?Q?5xq7Gj3VYBl3sRTUkejw6Z3+lfgiBpOsnw0EemZ?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z3Q3Tyt5RDU3dDZtTE1VeEZwSmREVEVPeWxVTnFqaUZQSUVTYnFoYmkxeVYr?=
 =?utf-8?B?VVE2OGdJK0N0WHNmQTBSa0MvSEtSK05Tb2hURGQwRnIvZ0grTG1DWTNKNkg1?=
 =?utf-8?B?ODlock8yOVc4bi9LZW5RSjg3VVNhVHBLVFo3SFdyRVFUbFVzTWRuYXNQV3Fj?=
 =?utf-8?B?dnk5MjNsMHlaSXNybG1GV2JnMTU3ZkNjN25LMGlkekVPRS9TRG1IMWhBenpL?=
 =?utf-8?B?ZEhCeHVUY0w4VGFBVHNzTWN4cWxIb2ZjbDVaV2FvNnFiOHMwajZKTkY0eDJt?=
 =?utf-8?B?THJQNklLV1lzTUdsZW5NbWhsMWw0bEJvcVpEOVczVlZqVm01Yi83Sk9zNDZV?=
 =?utf-8?B?RDdoUjdNd2NZWFc5QmN4K0VVS1JnUTVkUUl3OUdMM0R0ZlRFcU9RQjFQbDk5?=
 =?utf-8?B?QnB0VTk2MGNWYnJST1o0cU9sbitKN1J1aHljSUtYR0p2Mzl6ZEVMbjVJOU9x?=
 =?utf-8?B?RnJXYkg2Wi9pQVdEN3NMTjhabjk3NEF0bk90S0Vwb3NBS0FsTGVLRlhDbklh?=
 =?utf-8?B?dTl5QlRkVWJ3RmVVM0RJRHU4ZU1PVGQ1bmUvZGpqd3ZGN29FN3NOSDl6MlFH?=
 =?utf-8?B?aEJONzlBa2JrcVlsdm9tQmd2OHRNcnUyVmZScDM5VGhCanQveE9Ea1NxVEk3?=
 =?utf-8?B?d0RkTE5RY1NYck82OXgySnpMNEQzTFQ0SDZTdnNlOWgzalYzbkZMeVVyUWU3?=
 =?utf-8?B?dlQwZFVKOTF4N3RxQmdwWVdXL3FSMGpDaHpmTzB3QjdwMm1MT05Dd2FCcVlC?=
 =?utf-8?B?YU5YQmc0dEhPeDBGV055NXVrcExRbmZ1WUIzRGJYajhkcE80ZU5ZQ0xQZG5S?=
 =?utf-8?B?bzBvajhqNXg5VGU1eDgvVE5zcVFIZkxaeE1UMVFYNVdzUjNYUEw2K0UrZ25j?=
 =?utf-8?B?aWcwZXRvNEZBZ1dTSDV3KzNFSjNzY0hwNXBIQlBkSlNxWDNtcGo3T0VjS216?=
 =?utf-8?B?QldTcDRjOW1IZUE3M3pQaXlidXIxd2daWC93cVF2TlBvR21HZDV5aStxZWZI?=
 =?utf-8?B?Y1lMeEhvNkluYmdjM0NqcXQyTmtiUE5VZ1hmQTBkME54NWh2Q000Y2xWS1p1?=
 =?utf-8?B?QStCc3JIUWVvZmRBZW1RUnJIYXpzeUgzT3ZadVlVSUIyOHA0VFJmYzdXanAr?=
 =?utf-8?B?amMyMGl4K3hxOGJVcW42azVkcnZqSjE0UmlSTWFER1AyU09aZjFQTjVTZ3lt?=
 =?utf-8?B?NmR0N0tQWVMxWHNFUHRXOUtJaXJSbHl1cW0zUUhRRUFCMDNldWJDdXYwN05L?=
 =?utf-8?B?WFJkYkFSY21BaWR0NU5sa3c2Z1ptcTYzZkNEMVBSTW5RK0dhbVIzNzRCb25O?=
 =?utf-8?B?amN6S2k3em95elM4SGtTVmFOZTVleDRpZzUrZ01UNlJIdVYxK3Q5TTdQOVIx?=
 =?utf-8?B?Zk0vUmVQMDBPVjF4MEp4cm1WWGxkdytRbkkyMDAvWGZiWGY0TjhKVjd3VnBX?=
 =?utf-8?B?NVpxcjVaK3BVdmNzV3ZkdmFLbit6TVBxVm4rUjFmZ3dHYTNnVGFKVGF2SFJm?=
 =?utf-8?B?anBMV3QrZ0dSc1N3WTFSd2NQSkpqK1lVMFRnVHBWVlV2L28xUWVxMERDUU5t?=
 =?utf-8?B?SVFmT3RFWVVwbXBjTFQvTkdnMklxakNEaHlKVW5GRzExRUlMUkxmOEZHMzVl?=
 =?utf-8?B?T1FWOXFXTElDUnpHb3MrZERLVG5OeFNabllWOWhIbXJaRUFKNENwUlBXY1do?=
 =?utf-8?B?VGVSNkRaejh2SFpmNXB0azFSV1ZvY0ZDaWw4UHQ5OUZ3UE1STEhKTzJEM2J2?=
 =?utf-8?B?V1pTY290OUYxa1BKYk15cFlMV25Eb09BTmRpTjB2S1NuU1dBbWhsMFY1VVBl?=
 =?utf-8?B?THpTRVdCdHFFNnZiMDNkZ25QVlA5OEp5d3VMWWtNSWJRWE9LMFlzZnJwOHV2?=
 =?utf-8?B?aG9RRElCckhQTUdIRDlaOURXcDN3MFB2SExUOXRZc2RaSkxQUUJqUVFzUkp6?=
 =?utf-8?B?aVFKclhTWFY3Y2RBTmxDaGJoOTlRd1hyVkRXVEt3ekNxN0taeDNZNWJmTi9w?=
 =?utf-8?B?ZE5NRmdtVm5VUnZpOXloYm1RNm4wUmZMY09UTlF2OFRXdDBCQkQ4RE5WRCtU?=
 =?utf-8?B?ZzRSWmFMMWVudCsxZENRZHM1RlA0TUNXbURtSmZLKytNRjN6WUpWcUhGRk9r?=
 =?utf-8?B?NVVlclo2YmRNdEVOUHlqSjBQYnFnY3ZEdDRhbHRkUjJnSDdjSUh5N0F6S2I4?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2454D4809C073A47A76F3B0D16CEFFBE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	BN4jE2kPK5QgZJlhlyFmT9VHSl5g8KVwxx9Xq+F72AldQfmR5r3X8UhfFPTuaCiK7TwRJNvaoX5o6xGY4pnVMgTgCF+8en49T48B22oQbtEAYgp7fGhhoHuDbSlCOXZ3k4PC/MATKcgsVggTHdtK5YG0UsjEiLFGJGyn4M22boEZoN3KRkjgxq96QWeT3+eozbaibeBlMZZgupK1Yh/lSfHG9l4YymYTfacAYw0TFWUjsqGJJx37EM72fbHM8gljNENRgJgRRA8PR+D37OBU95gAtax2mvvTIFANGiaUVmHPnhc3m0LzowwZVq/nD3lepek/Fv8vtm7dUoMkh7fMm+WOgfzCiaOgIf25gAwm4iFxzf6Y6nrN6byf/2l8KilAifxlTnDpebnyy0ko3rkA0OrtZCDZ1j+QzCPQ4TYdsAMgv8RwkfzbB4+kEU7yNyjVjD3uytWa0d1x/xihGh2+WH/rONt+FWWqBFkeDA41G+FCc9s+N5Icegg2ki8iH/SCjmaIT1qAV2hwZI2vrmF6oKrUBfvxjkWL8iFK0OptpVbmDOvB59YjxQzVT56Hm5biCxTNp8XJmJeDJl0OyAE/qj3U8B48Ad6GWJhbGWiWEE7YANg7QzZr+FN1FLBphEbqdiPewKxYO3aKWr8EIGwWiA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acbc297-3e3f-475e-82df-08dc92523c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2024 00:28:27.2622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1zpxGzykzwqTfEHBctiPCxUWxJp0LWeeWoB1IhZEuXVl5GxvWCP2gR1kwdPdjFO89ZmI8IIAq2gmHBNvUwQfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7858
X-Proofpoint-ORIG-GUID: tHRqykOOeYQAdgcpKJzarNZDFgkTzWVI
X-Proofpoint-GUID: tHRqykOOeYQAdgcpKJzarNZDFgkTzWVI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_12,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406220001

T24gRnJpLCBKdW4gMjEsIDIwMjQsIGJ1Z3ppbGxhLWRhZW1vbkBrZXJuZWwub3JnIHdyb3RlOg0K
PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yMTg5NDNfXzshIUE0RjJSOUdfcGchZk9EUHB2dThRTUkxU0gyTlcz
OG1KZ054U2NkZHR4bHI3LUZSYkZsbjhxdDRJU202SWI3UDZPWHJ0YjFZUlJ5ZjV6RDdrb1JHWUdM
TmJ5V1cwVHNfeFV1R2tITkhwRmhCJCANCj4gDQo+IC0tLSBDb21tZW50ICMzMiBmcm9tIEphcnJh
cmQgKGphcnJhcmRAcHJvdG9uLm1lKSAtLS0NCj4gVG8gY29uY2x1ZGUgdGhpcyBidWcgcmVwb3J0
IEkgaGF2ZSBtb3ZlZCB0aGUgT0JTIHNlcnZlciB0byB3aW5kb3dzIGFzIGEgdGVtcA0KPiBzb2x1
dGlvbiBidXQgd291bGQgbGlrZSB0byByZXR1cm4gaXQgdG8gTGludXggZXZlbnR1YWxseS4gDQo+
IA0KPiBIb3dldmVyIGZvciB0aGF0IHRvIGhhcHBlbiBJIHRoaW5rIDEwR2JwcyB3b3VsZCBuZWVk
IHRvIGJlIG1hbnVhbGx5IGZsYWdnZWQgb24NCj4gdGhpcyB2ZW5kb3IrZGV2aWNlIElEIHdpdGgg
c29tZSBwYXRjaC4gIA0KPiANCj4gSSBoYXZlIHRyaWVkIHRoZSBzdWdnZXN0ZWQgUEFUQ0ggc2V0
IGFscmVhZHkgYW5kIGl0IGFsbG93cyB0aGUgSFVCIHRvIGNvbm5lY3QNCj4gYXQgMTBHYnBzIGJ1
dCB0aGUgZGV2aWNlIGl0c2VsZiByZW1haW5zIGF0IDVHYnBzIHNvIGZ1cnRoZXIgcGF0Y2hpbmcg
d291bGQgYmUNCj4gbmVlZC4gSSBkbyBub3Qga25vdyBob3cgdG8gZG8gdGhpcy4NCg0KU28gaXQn
cyBub3QgQXNNZWRpYSBob3N0PyBSZWdhcmRsZXNzLCBpZiB0aGUgcGF0Y2ggYWxsb3dzIHRoZSBo
b3N0IHRvDQpzZWUgU3VwZXJTcGVlZCBQbHVzIGh1YiwgdGhlbiBpdCBjb25maXJtcyB0aGUgaG9z
dCBjb250cm9sbGVyIHJlcG9ydGVkDQp0aGUgd3JvbmcgcG9ydCBzcGVlZCBJRCBpbiBpdHMgcm9v
dCBwb3J0Lg0KDQpUaGUgcGF0Y2ggZ2V0cyB0aGUgc3BlZWQgZnJvbSBkZXZpY2Ugbm90aWZpY2F0
aW9uIGluc3RlYWQuIFRoZSBkZXZpY2UNCm5vdGlmaWNhdGlvbiBzdWJsaW5rIHNwZWVkIHNob3Vs
ZCBiZSBwcm9wYWdhdGVkIGZvciBkZXZpY2VzIHVuZGVyIHRoZQ0KaHViLiBUaGUgZmFjdCB0aGF0
IHlvdSBzdGlsbCBzZWUgNUdicHMgbWVhbnMgdGhlcmUgYXJlIG90aGVyIHByb2JsZW1zDQplaXRo
ZXIgZHVlIHRvIHRoZSBob3N0IGNvbnRyb2xsZXIgb3IgdGhlIGh1Yi4NCg0KPiANCj4gSWYgYW55
b25lIGlzIGFibGUgdG8gaGVscCB3aXRoIGEgbWFudWFsIGtlcm5lbCBwYXRjaCB0byB0ZXN0IG90
aGVyIHRoZW4gdGhlIG9uZQ0KPiBpbiB0aGUgY29tbWVudHMgaGVyZSB0aGVuIEknbSBoYXBweSB0
byB0ZXN0Lg0KPiANCj4gVGhhbmt5b3UuDQo+IA0KDQpJdCdkIGJlIGJldHRlciBmb3IgdGhlIHZl
bmRvciB0byBwcm92aWRlIHRoZSBzdXBwb3J0IGFuZCBwYXRjaGVzIHRvDQpyZXNvbHZlIHRoaXMg
c2luY2UgdGhleSBoYXZlIHRoZSBrbm93bGVkZ2UgYW5kIHRoZSB0b29scyB0byBkZWJ1ZyB0aGVp
cg0KaGFyZHdhcmUuDQoNCkkgY2FuIG9ubHkgcHJvdmlkZSBjbHVlcyBmb3Igd2hvZXZlciBuZWVk
cyB0byBwcm9jZWVkIGZ1cnRoZXIuDQoNCkJSLA0KVGhpbmg=

