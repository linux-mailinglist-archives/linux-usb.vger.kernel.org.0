Return-Path: <linux-usb+bounces-30026-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72810C2EBBE
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 02:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9775A3B9780
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 01:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3798C2153E7;
	Tue,  4 Nov 2025 01:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SSZtfCjs";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="j3k7xlQq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ltj5zl7G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D6D21D3EC
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 01:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762219244; cv=fail; b=fc4QPwIV1LVW36G+S4qG1OnaiTKR8XS5ZOUjvpqFI9ucrqzqIOYEOGOXz+xp3U6Y/4mh5WX0q5hD1SyPIiEI2gZrkKEuZUlQguDtiwiPhnnBX5NLt3hHLFeNFSfxL72JjOcQK24xJOPjI7oOcsCGynYiaw10Vk3wapCQ6C8yUes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762219244; c=relaxed/simple;
	bh=yD0f73iUIo7Mfmw0+GQ9gG24nqXNj0RYZXnUTBCicpk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QS7PH0uau1GZzpOpG+80cayIDGBVND+AzvO4c30U1JWEkQu7s60IXUgQ90ibypugy+mm4HWrBsmxylhw0th6fNlTp/AYumUuRsy8e7+pmTbs4tMFP47k2Xjt9j2hTp30dnTXEZojNjRd4iMmbIEqkla49ufK8HDqcmWnTFq502k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SSZtfCjs; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=j3k7xlQq; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ltj5zl7G reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3IFtb1135484;
	Mon, 3 Nov 2025 17:20:27 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=yD0f73iUIo7Mfmw0+GQ9gG24nqXNj0RYZXnUTBCicpk=; b=
	SSZtfCjsn7yylJAEKLcMbON+BD3lPL9osEEpkS3NQdvfcZ1J47diepDi8GLPBFKo
	UvHKwTk7e3fhnQRR7ldF9XlvQ1mTa7hjaAxQsdqY8In47sct0a6n7dNjZowDmDpM
	mAYTOwgPTpoIcG549FlXjsMlEnUoo3uERY93sIFzX90tJHJ8fZEu4gVZWpAATRrR
	GP7pshx4CPQUXK0udA2yylX6W3sdSBQ3hz9NQon7u0zpUQA1Xvayo+za7On3gupZ
	TwB88mYL+/SCNCeXHPDwaYxX9JxjW5bf+FTF4kfLIAnqEyv0CiUtiJDSc0tza8MZ
	JY7Xhe4TwEbSXSlE+a40MA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4a717ksfxe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 17:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1762219226; bh=yD0f73iUIo7Mfmw0+GQ9gG24nqXNj0RYZXnUTBCicpk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=j3k7xlQquvSyRiFg3ZuTxcXYASCAQmvA8nvzmHbLRxvuvs/E73KX8QlnRQKY8dmqD
	 p4EEmXUocARE+RSd5ek3kOm4r9zAPMmnBBbgdzii4yiDkvxBcF8QAjcahBRioVlAZK
	 TCiY1/VPuLN4trfDMNw9XUCZBvGvmnTa7MqAgGMaRRoRgFZQVhwtkCEOSiFfq5JkNK
	 ZrbHWZibvdOJtCzrIO5P6UXACE1Ac9yOYSUhCyRbtN9I/DaNIcexzp06lrZxld4sKk
	 EH2LniGKMeH5NVKMYY/fcTyFY9Hwk+UawOczfdSLSo39kdAx75045UCV2HlPw/TPSA
	 872Z4zRTuCJWQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4CF98401EF;
	Tue,  4 Nov 2025 01:20:26 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 795D0A00D3;
	Tue,  4 Nov 2025 01:20:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ltj5zl7G;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00300.outbound.protection.outlook.com [40.93.13.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1ED1A40054;
	Tue,  4 Nov 2025 01:20:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7dCXF2J+kZHSjT69wkTBSWM6cDgvjkSug/5Gq6J9io1fq493ft9+Pexo0dQLuJrLbRkNf2N8Ojg29/alHYZFXx6B4H5UTYO+yh9IFUgiN2KnrJv69q72fgB6mrJjCCKmrBzTnJNttTaXtoDqoeGuyLvL8upwpcF1ivjq/E1wMy5uD2nAwgsZg4NgMjDf7bJc6adwqdnaOXm8Z+BL9zUkqYUGnt8LYK+Cwlfqker+ohoepmNrC/NpbKpv8FkZR6NhRr+yqD0urgGeJ546MDdMoI9h5oPFU0r/jazN5ty53+UHDZ/MKqSVdHek4ywOzYM2KhycI4pVfNyWkfHew+ukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yD0f73iUIo7Mfmw0+GQ9gG24nqXNj0RYZXnUTBCicpk=;
 b=ikp27qXjiDvgdxUTtb/sVv5dpwjIHQhoSmPMU1JFQq3npYaxX/iUTkmXIbGoUAXpT9vXxMSaW5/RwAjWOpZ/mbo6UDN54wi3tbsW/Mrc6U4dCbieMBrVm8KZzRezF//Pz5uSJ+YH1zxeWQYSo3TovV8HVoIE0hdrvQvGRzoCaUxFQ3Th8x9+Mrjpny+s7G5QBr1MN3aBulQf9DoHNQ7v2AzUCU/Rr0R5hQv+VjxZH8ogqJSzYLRMJcGbDWt3WSu1m85w5oocPpHBwLL80DjmnN++9uZmM0Q57Vdx4FIDmf+ZzsORxTUCqfQJQe6br6TyMsPgU0E7bviKkr+oodT5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yD0f73iUIo7Mfmw0+GQ9gG24nqXNj0RYZXnUTBCicpk=;
 b=Ltj5zl7GjCySJQTKxXGdPtIhx74uWIFibIBZhw4Je9pq+aWbnxBlRnQMDyoioisNNrtQX6akIygqXv0v3WlwrosrShnVElyIbXa0vOhB/1xjCA9L488NRtW4G138b02CHOb6cSR7wKv4cKxIjijcKpyQ/4JWcaRX4EgBxtYJUIY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY5PR12MB6225.namprd12.prod.outlook.com (2603:10b6:930:23::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 01:20:20 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 01:20:20 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Li Haifeng <omycle@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "Felipe.Balbi@microsoft.com" <Felipe.Balbi@microsoft.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Issue with DWC3 Gadget Driver: Stall After Transmitting Only 2KB
 Using Scatter-Gather and TRB Chaining
Thread-Topic: Issue with DWC3 Gadget Driver: Stall After Transmitting Only 2KB
 Using Scatter-Gather and TRB Chaining
Thread-Index:
 AQHcSXrPEz2q12AfYEm0nk8jz4+djrTab0eAgAA0aICAAjhGgIADpW6AgAE82ICAAAErAA==
Date: Tue, 4 Nov 2025 01:20:20 +0000
Message-ID: <20251104012018.qkpbmacoogw2yb7b@synopsys.com>
References:
 <CAFNq8R7q-GvFgwRKewzG=ZwkbxEfhKjEsxHWXQ0q8BsSSDFcnQ@mail.gmail.com>
 <2025103049-suing-renewably-fd67@gregkh>
 <CAFNq8R6uZSS3+nWXkR8XERjMRGTC_4_47UKm_N=P8Um5ySLAtg@mail.gmail.com>
 <20251031224113.4ml474v6fuiytkcf@synopsys.com>
 <CAFNq8R6tk2VVpsmG-5dS0UPWRQF3TgVH-nhJ+6bbR1yYSS3UAQ@mail.gmail.com>
 <20251104011607.jixamckrfphh3ktx@synopsys.com>
In-Reply-To: <20251104011607.jixamckrfphh3ktx@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY5PR12MB6225:EE_
x-ms-office365-filtering-correlation-id: b22821ac-d928-46f0-f27e-08de1b40522d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?UGVMckYybnpQNmluUnNEbE5LWk1IY3hTZ1RobFJ4aDRvOVQxRDF0WFQrWTBv?=
 =?utf-8?B?bi9HVC9JUTBCTGVoYlFVNXkxU1U4ZThCYllFOFNXNDdHUkx2bExWWGI5TTN4?=
 =?utf-8?B?dElsL0NIYkhEczg5WWV3ZWNJZldLRnYxT21HQkJyTVNrTUdqZE5nRG9uR2hn?=
 =?utf-8?B?YXQxK25BN1l2RzdWUVdmeWhneXNndFlsZkdtbDNqLzJxRi9zamNSdkhheWFI?=
 =?utf-8?B?ZDRLT1h3STBRRVdrNjE3bldyTWh5NW1jbjhBSWFnbzFKRVZ1cDlRQ0xnVU1Y?=
 =?utf-8?B?NjBDQVdjdDBQRWVKZXdSRGlMMS9MQzZld1U1cjlzY2poSm5NWXJPVlJvNDhn?=
 =?utf-8?B?azU5eC9RZkJDN0RpTU94SGdJTFdCeEdWVzBGeUxNRTcyamFkK2pMdVpJVGh5?=
 =?utf-8?B?VjllY1p4YjQ4ejhzOGp5QkVqREVmbkFDSWY0bGNXdTM3UVVqYVMxaERFeDQ2?=
 =?utf-8?B?K2sxeVNsdTc4NVJrc2N6SjZ1YWZpelAwZXNIV3lJM2dNSFd4VHN0WTdqSVJY?=
 =?utf-8?B?ODc5YWduNUViUStGbWZUcFkvNm1VYnRQTGFMbjdyY00rczUza0E4clZQTGxB?=
 =?utf-8?B?cmkrNnNHQjdxSzc4RS84ZmQ3MnlDU1pua0Z6OVpURHp5UkxQZDBxdllFbnVJ?=
 =?utf-8?B?dUtGMjE4eFI2ZDFzT0Q1Nkw1ejBqWkFVOGpyQ3hqVTVpaGV3UE1LTlF3T2Nm?=
 =?utf-8?B?RGdDV3dFWE8ydERTM29aWHFrMzRkNHBWYmNEa0NaSVpkWFRhNjJaSkowK3Ri?=
 =?utf-8?B?YlRRNGNaUXdJQTBGKyt1RWZ4RVhkMWNSdDhXd3Vua1RMRXVlSkRLd1VJN2lm?=
 =?utf-8?B?S0sxd2lFdzRJaEdBYjJtZU80RFJZejFDQXFiM1k2YzZBZ1I1Qmt0R3VwbUw2?=
 =?utf-8?B?MHZpb2NRMHREc3pDcHdrcWpXc0dxbVJtTVRiejJNY0tCZHpoRGhmT1pacDJZ?=
 =?utf-8?B?d05WcVFaYUtPQ2wreWxQNkl1UHRaSWpDMUsrUHk4QVZBU3ovZE42NWxCNTV0?=
 =?utf-8?B?ZmdQTWRoMktsUFN1dUNhbTQ3VjRRTXFWT2NEODdDM1QvK0FVdDN1Nm9iUEhT?=
 =?utf-8?B?UE0yaW90V0RBWXRxdFBMbDdhSlRtdTFxbEY2ZU16U1prMGtPcll0Unk5WXZD?=
 =?utf-8?B?K05xUEJsdzFtQmRwVnYvaXU5VGxLZUo4aW9qbUY4dzVhMXhidkRQU1JOQUFS?=
 =?utf-8?B?Q1BCcTBoUkRMa28zN1ppZmhISGcya3V2L01TbVU1a3JUTzNud0pNeXZ2cFNW?=
 =?utf-8?B?WkpseUNsbERtSmRkM1lyZHNBbXJIYytxT1NpU2FmZk05TklrL0grQTg1MEE4?=
 =?utf-8?B?V1RMQWNUOW9CdzdqUU9ER2ZZZFFJbWpSQ242WWVEMGFrcWQ3bDlnQzZMN25N?=
 =?utf-8?B?bG5qU0VOU1ZZRE5UelJ3OVd6SUxrRlk4OG0xb3NTQUtxWGs1Qlc1NzJoUUtt?=
 =?utf-8?B?NUFKd2RjYjFOb0dubitiWERVaExGQTVCbmlYK3BiZ2VSOUllM0JldWlrQ1Nn?=
 =?utf-8?B?WEw0TTQ5cmZSRTkzdm5zaWI0MitjVXJ6M25tTHNsTmUvU3lLMDY4cUE2a0hL?=
 =?utf-8?B?UXpBVUs4U2wzaWdFTGoyR0F3RW1uYmZQVjVtVHF0cXpZSGZ0cUtBT0FzaWhI?=
 =?utf-8?B?ZDZRZHI5amk3QXYvM3ZzNWVlQ2tYM1NpbnBOK0Vqc1lRZlJSR3l0aFRYSFFp?=
 =?utf-8?B?TnpsRlNPZTczdFhLWjV5SHBqbUQzQlpXWHQvQVpPSENkaUJBWnJpZGRWRDdm?=
 =?utf-8?B?YXRwY1FvRHRxMFJZVGlxZlphc294RFJ6RXhMZXVNSThVbUxWaTJJb0R1OU5K?=
 =?utf-8?B?N2tRYWZZbElGaWdMMGpuWkM5dFNiVUVUYnNhV0dUVG5QYkZaY3M5VVVRbkVE?=
 =?utf-8?B?WTNIc2VLRjRKT284NDFSN0ZXWDJzSEU1NnJTWVJGazRoQWFMUlJhcHdVdTlJ?=
 =?utf-8?B?dUc0c25ueiswZFUzOFB3UGsybWRJMmhJejB5Z1Ruci9jVUswUG1YdjI0M0pW?=
 =?utf-8?B?UWRZd3U1Rm4vTjZpQ2hwNi9QaGJXa3NNNERkOHVHaVRJbEdsbGJYaFN6bTF2?=
 =?utf-8?Q?6mwLG0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QjJMRzBMRUZsbkM1YUR5d0NGU3Q5cDdLS2Z6WU92L1RodCs1cmJNcXQ1d3Fo?=
 =?utf-8?B?NEgwc0hqUUgxTDZObk9UN2syd0hIejlTbHJpV0hWSHdhNTB0ckNyVmZZWExU?=
 =?utf-8?B?WFBEVXNJZElTYUhXU0V2bm1uK2pPcW1XWFJ5Tyt4VG0xZGJ4c0pPRmlXN3Zj?=
 =?utf-8?B?Z2szcjZUSHRzYy82OWVUMlhEd3JZWDJyR0hlRmV1N0NYemJqanU2YkVzS1hl?=
 =?utf-8?B?aGw5aXFwVmFTMGI4cW8waDVoS3ZwWCtVZDBDbTVqSFI1d1ZKTkJtczlxeVVO?=
 =?utf-8?B?MWdtcFRCbU5yT0lrVTlKYnpKaXFLaDM3eXZPMFFRQ2JmbzA0YXU1MUdxaUtq?=
 =?utf-8?B?UGRlODB4eWlrQXNkTDdWSmRhdEZYKzVMSGF6UmRiZ09JTm1wTndVdTZYUERt?=
 =?utf-8?B?VEVpVUplbkwwSzVZcUN1aEkyV3NlTFpMTVJqcFpMaXZoSm9zUGE1N3l0dTBE?=
 =?utf-8?B?VkxDYUoyOG54Nm02YlhSeWIyNWR3M1d5Z1hNYzYzeXZ1Q0JjTVJwR2hkaU16?=
 =?utf-8?B?bWgreUNIUFFFZmw0RFYwVGNkMDN0bFJHQTlMRGF6S1A5NmNqYXdVNXBpb0x4?=
 =?utf-8?B?cE56RlVyMXNlM0d1MHFQem52bkJZNEFHQVhoejVtRDhQdEFoSmpNcE1YczJ5?=
 =?utf-8?B?VzBXeUNMTnRLNHZ1dE1GMGQ0NGovblpUcWpMN0Z4V241cExzK3ZtbVNXbUhK?=
 =?utf-8?B?dk1zMVF3bXpmczg4RGRCV05JWlAvem1JY2R5OGV6bFJxRXdlWTEvdjEyS0FM?=
 =?utf-8?B?anJTcDl2clF4bkk5WGFnMXpIMXkzaExHelhzVGVkQ0hRTmhzeWJSU0MzNkVv?=
 =?utf-8?B?YnB5MlJJakNRWStoZHg0Vjh5eGFQRkRuc09ZdVNjOXRnOEVsMDdKa0tPb2hs?=
 =?utf-8?B?MzhURnJWdlp2MEx6cEVLRUxNMkRHTng5U0thU042eXRnbXMxYkdPZjdpdG1v?=
 =?utf-8?B?ZlpCZjVLSm1kVGdlZjFxYUMxWnVDSkpOTko3R0pBbDlzWmNhWUZtTHg5c05w?=
 =?utf-8?B?Y3Q4c0VpZFp6eml4VEZJVlpzaE5aOVhxNjcyL1k4a1hSRDVjTExFTjdYL1hP?=
 =?utf-8?B?ajgwWWcxbTdEUTZ2NDlzbklBeFFldHkzY1FyWWV0RGJURFNWanh3RW5iQXJl?=
 =?utf-8?B?aUxQLzZSbXpxS3BOY0pZblRKT3VlejkyRlREbUtldmlJQlRLNEpRVDhKMmFx?=
 =?utf-8?B?QTFGSysyUkVNdVBjd2draUJUNldMTmZLd0pQdGMzS3drRTIyaU9NME1zOUNh?=
 =?utf-8?B?ek83clQyYXE1R0k4OGhydnJUWWdWUEdZeWN1ZlBNUzBRUERvMEhrc01EdmhR?=
 =?utf-8?B?bytjdFdPRlpWalZLM3dCYjAxYlllaENzVlZDbjl4K3gwYytVd1pRSkNpdndB?=
 =?utf-8?B?eFFwMkFJRFJzMzdPZmFhcktjSlduaVlJbWZIQkk2YkRuMEdLSGZnck9Qb1do?=
 =?utf-8?B?SCt5L3RCWEFST0lMOEdqOTdwZDZ4N2RYU1NSenJlaFR5V2IydDBldHhSbHJP?=
 =?utf-8?B?am5sRVZTQWVDcTVvRThLRisvcDF6R3hkUjZuNU0rdllER3RwREZpekMySC8w?=
 =?utf-8?B?enVja1Y5WW5lVFpZZlE5blI5VTdLMzR1MzRPMjdyc1BNZklLRmc3RE5BZFcw?=
 =?utf-8?B?Q2NTRHpBYVZUTlVaQVY1ZzY5M1NPYVdwWVI0aSs1WXkrKzUzSUc2RVdPSFhT?=
 =?utf-8?B?VEFvbmZCSG1qblJpZ1dxSmpQa1ZQcS94bm9pZVdxVTA3QXlQM0lERTRDaG40?=
 =?utf-8?B?TlVrbTZBOFI4cU11K3N6RjdtMjlPTFhXckx0dXpYc2x2NnZmYkhMV0MyaU9G?=
 =?utf-8?B?cGsvcHoxNjVrNjFFeTdYUXF1dnZZWk1uRjYyZnRrMkVlNzB6UzNNL2lxZjYz?=
 =?utf-8?B?M1d0NTFGaFpHUndPNlJpVDhCdzBRdE13aS83TTFKY21pYXFZTjFDRWFZL1Mx?=
 =?utf-8?B?WDdHUk9FYmJhL3lDSHVYWHozWk9ycU14dTdvUTRPdmhZVVk4dnZHMXVxN21h?=
 =?utf-8?B?QXhwTGtwaHo2Nmc3dkJmV0dsNnVRNkxtTGxweXZnV3VzbFdHSWg2ZE0reWhv?=
 =?utf-8?B?VHoxTlhUazdCaFAzUENHQUIzZDJ1bWlwYTFDQUlCNG1FTE5HWjgvWjZFeTE3?=
 =?utf-8?Q?9VKSeTTGEynkM6wi5yhrBKovf?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB60EB799D2A734F994BDB1BC79D2D48@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fDMi2SWLV4xZvW8VPJobPjdOadDH+n8x0pj1wAtGA8Gb9qCWa1sMvDXODdiNUbQ6vWFh5M+/XY+Ojc/x7gRE0KOMU0Wm7eEF0p2u/9161Ow7GqY1733trK3YLcWoxuzW+y4rltSkygcVGS1Z8tKB67RlVe15tqqOEKerkKkGy2aPrwUVasH0OH9WC2BSDmyNwF4X6gyS24e9QNyW5/PswPt9QlyXFZu11V9F0ps+5nzB1bkFbCNJGxUvLsYTjEQEfelHskfCNm5AM7ze9fm6B4XYlvZND06Yk/BJmJala8z+j+bNuIHccdJpZ2dPlpywGg+sQ4iwLKdEFE1seFb0EAXV6zuIHoVYzwMhDGVXxKimot3cSxc8FdgI3aSNB+cMrWZ6B6i5keStPThu8FpJEFj4iLZ0E7CkvjMCTJ6K9JUU8xcE+njJeQfc1OHATdNP1tMrfV/FMJDWzg3BZt1kQBM+68hRJYHNuO19aSRxxtSLNwGA5OwX0P+XYplaKkjZB8WGs5ty3SrcEyH/aJLvK7dk9ZZegahicqM7FU/m5aRbgnddGaH5awWL6H5rLpolQaMRsLSrcsRu56mgXXm7iaqgTLCuoCgpmavDu7Yu7CxybslrInBiuDVsbzQKTiaOxrJDD2awaFh6zGEqbhVzPQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22821ac-d928-46f0-f27e-08de1b40522d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 01:20:20.3256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CRb8yJnyVv4Jh0UCah3nrQq0S8+4c9WEc713oxVGQYRy38P4eX5ItSsLUwxP1+k4wfoS6lIl0dLj+6Hw/Nsc7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6225
X-Proofpoint-GUID: AJLWb3O6Wg9_i3Bpu4-24mn9H8f7of1o
X-Authority-Analysis: v=2.4 cv=V75wEOni c=1 sm=1 tr=0 ts=690954db cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qiNToksraQSjd-ME_4IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAwOSBTYWx0ZWRfX7+S26ViFZ0Tq
 Fe8zJ45VN90Attdpd51oGcKQTOL9n/RcFlF499tAoOrHvm44zdfdjV4ZkivLA5bt+gqDwsso0PU
 2BiqZwdAmfmR9LQ62qjzXNcz6R8+JQ/hLt2IXc12Pg8aPv2YPcFKxgqKPWkKucIHj7NyUyxflfd
 PqdnYMizGz36+iC/wVW6VSTQhYxnHWzA+k+tbE0js9GIV0ubqf1KTlZi1LqMqb4zWzIwlyvu86O
 Ra/t/lOSUp1zHHUpP8nDy74ybtZEt1/eRDeZfQFK5qqnuS0ojOiuH61SGKd1RDp0sVnBBKevo8B
 CKfBA+wkgqe2xj5VhsIgMBlUFtSyRM4o44mC6PmZU/JO+rCoVaHxVCLGuREB7w44irWh3aT9Sji
 XkIXWxo2bSTggDSZmE5iui/+25M0Ew==
X-Proofpoint-ORIG-GUID: AJLWb3O6Wg9_i3Bpu4-24mn9H8f7of1o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511040009

T24gTW9uLCBOb3YgMDMsIDIwMjUsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gTW9uLCBOb3Yg
MDMsIDIwMjUsIExpIEhhaWZlbmcgd3JvdGU6DQo+ID4gRGVhciBUaGluaCwNCj4gPiANCj4gPiBU
aGFuayB5b3UgZm9yIHlvdXIgZGV0YWlsZWQgYW5hbHlzaXMgYW5kIHN1Z2dlc3Rpb25zLg0KPiA+
IA0KPiA+IFVzaW5nIGEgbG9naWMgYW5hbHl6ZXIsIEkgZGlkIG5vdCBvYnNlcnZlIGFueSBOUkRZ
IG9yIGZsb3cgY29udHJvbA0KPiA+IGV2ZW50cyBvbiB0aGUgZGV2aWNlIHNpZGUgZm9yIHRoZSBj
b3JyZXNwb25kaW5nIGVuZHBvaW50LiBJIHJldmlld2VkDQo+ID4gdGhlIGhhbmRsaW5nIGxvZ2lj
IGluIHRoZSBVU0IgRUNNIGhvc3QgbW9kdWxlIGZyb20gdGhlIGxhdGVzdCBMaW51eA0KPiA+IGtl
cm5lbC4gSXQgYWxsb2NhdGVzIHRoZSByZWNlaXZlIGJ1ZmZlciBiYXNlZCBvbiB3TWF4U2VnbWVu
dFNpemUsDQo+ID4gd2hpY2ggaXMgMTUxNCBieXRlcywgc28gaWYgdGhlIGRhdGEgc2VudCBmcm9t
IHRoZSBkZXZpY2UgZXhjZWVkcyB0aGlzDQo+ID4gdmFsdWUgKGFzIHRoZSBwcmV2aW91cyAyS0Ig
c2l6ZSBkaWQpLCB0aGUgaG9zdCdzIGJlaGF2aW9yIG1pZ2h0IGJlY29tZQ0KPiA+IGFibm9ybWFs
LiBJIHdpbGwgY29uZHVjdCBhbiBleHBlcmltZW50IHRvIG9ic2VydmUgdGhpcyBwaGVub21lbm9u
Lg0KPiA+IA0KPiA+IFdoYXQgcHV6emxlcyBtZSBpcyB3aHkgdGhlIGRldmljZSdzIGVuZHBvaW50
IGRvZXMgbm90IGdlbmVyYXRlIGFuIE5SRFkNCj4gPiBldmVudCBpbiB0aGlzIHNjZW5hcmlvLg0K
PiA+IA0KPiANCj4gVGhlIGhvc3QgZHJpdmVzIHRoZSBkZXZpY2UuIFRoZSBkZXZpY2Ugd291bGQg
cmVzcG9uZCB3aXRoIE5SRFkgaWYgdGhlDQo+IGhvc3QgcmVxdWVzdHMgZm9yIGRhdGEuDQoNCi4u
LiB3aXRoIE5SRFkgaWYgdGhlIGhvc3QgcmVxdWVzdCBmb3IgZGF0YSBhbmQgdGhlIGRldmljZSBk
b2VzIG5vdCBoYXZlDQp0aGUgZGF0YSBwcmVwYXJlZC4NCg0KKHNvbWVob3cgSSB0aG91Z2h0IGhh
ZCB0aGF0KQ0KDQo+IElmIG5vdCwgdGhlbiBwcm9iYWJseSBob3N0IGRpZG4ndCByZXF1ZXN0IGZv
cg0KPiBpdC4gWW91IHNob3VsZCBiZSBhYmxlIHRvIGNvbmZpcm0gdGhhdCBpbiB0aGUgVVNCIHRy
YWZmaWMgdHJhY2UuIFRoaXMgaXMNCj4gY29ycmVzcG9uZCB0byB3aGF0IHlvdSBub3RlZCB0aGF0
IGhvc3QgcHJlcGFyZWQgYW5kIGxpa2VseSByZXF1ZXN0ZWQNCj4gMTUxNCBieXRlcyBvbmx5LiBU
aGVyZSdzIGEgbWlzbWF0Y2ggaW4gdGhlIGNvbW11bmljYXRpb24gYXQgdGhlIGdhZGdldA0KPiBk
cml2ZXIgcHJvdG9jb2wuIEknbSBub3QgZmFtaWxpYXIgd2l0aCB0aGUgRXRoZXJuZXQgcHJvdG9j
b2wsIGNoZWNrDQo+IHRoYXQuIFRoZSBkZXZpY2Ugc2hvdWxkIG5vdCBzZW5kIG1vcmUgdGhhbiB3
aGF0IHRoZSBob3N0IGFza3MgZm9yLg0KPiANCj4gQlIsDQo+IFRoaW5o

