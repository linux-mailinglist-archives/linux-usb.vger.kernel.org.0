Return-Path: <linux-usb+bounces-32432-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9401CD37AD2
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 18:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8EB7302754C
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 17:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA89D3A0E94;
	Fri, 16 Jan 2026 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Br1tLPBE";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="k4JSnMuG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZXIKnEIV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0866B39B48F;
	Fri, 16 Jan 2026 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768585918; cv=fail; b=qCsOcbHKM7D7fHDo1lBe5NDd5jkd0un4qG110VG7UrEEHH7ffYJlBFVOnd4/TA9zsfYF4B6OuR77fKvxObdRt/Lf8p/Oues3V+U+AKZqmiyFPemuW3IatlZnCM8RaCrIirbxkpuj3xrPmOD2x0WDAkT9o1WoWhB/fzwsZuK5rkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768585918; c=relaxed/simple;
	bh=A2wI+F/tIwLr4XlG5VXKyp6mnG5OkU18Lb+oLpr0yrU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IE4I9a9jIorEnhUFKXn0PDeiJf6YWiYNjvK+VgxwvWIgpxwtSwoSPB+HCUN2dsgtSd3c8MCidw3teUjYpsMzKx4JLqXRzq28nbQ6noyaH7MNbs+mYN4nIq1SjrHDkoz3ytBIPpVLttgJzI9XkfNogq5+izPIu4dN74qwRszfnO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Br1tLPBE; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=k4JSnMuG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZXIKnEIV reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GFVS8x182269;
	Fri, 16 Jan 2026 09:51:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=A2wI+F/tIwLr4XlG5VXKyp6mnG5OkU18Lb+oLpr0yrU=; b=
	Br1tLPBEB5TWHkBdHJArGAS5puf/ohTB9YfO6V8opTnenjIp1XeSCwLM7LyrcuW4
	HQKk8m69g5RARTnTIPAYcGbeot/l1v3Y2rN3WXUCA7Ny0u+ohkthTwZfdqFsMvrQ
	WW3PUpT6vb7XvNv2qTSSr075Ejy6toO+WmnLlHDmgyi4/vv5UaW4T6Q9h+94kbXv
	GrqVE073WiFoMH8xEztGB3wDLTzhT8FAcvFlEOBIzJrlWaBtNTFW66whSbh5a3uG
	AMoFC+cL9UrdJrdf3u9Ro7rknS8xVhoSBX57/dgEXCMMloEA+gm5bZl6QPazrIR9
	sqvmg8UR0jBfI0rU4SSUSw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4bpqf60ax1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 09:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1768585906; bh=A2wI+F/tIwLr4XlG5VXKyp6mnG5OkU18Lb+oLpr0yrU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=k4JSnMuGeY2kfVCcMIfldvPLTvEUzcCw4oor6KtlFJLBceeWWgrXrTAGBDmH3Y2Ab
	 BlcPTlf0VIZLj1gdH2ZjmWkSjX/E5ucwH3zUrau428GSP0BgTo8lff3VKzUWgnfDFw
	 ITDvPKHm7nUEsU5LovB6mI5DVRRO2XKGfj/RQI+oyB84oj7696+TOUPit+KqSlV4Br
	 /JX7Ak5+I5hLuRBSUi8z4Ig5iQx4gMgjxqR44RMMqGFoDP/s4v20h+cFBsvah9mcc1
	 JSPZjVE1dYfT9BfWXLo+uwlnKf+qRECi4CLRxbnJa7Touxy+bKL6vNoihd0uDmIBrl
	 I2Ft/iPj+17Bw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 815CA4035B;
	Fri, 16 Jan 2026 17:51:46 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3BE1FA0104;
	Fri, 16 Jan 2026 17:51:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZXIKnEIV;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00102.outbound.protection.outlook.com [40.93.4.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9443B4034E;
	Fri, 16 Jan 2026 17:51:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtM6YqFk8tlpHr5ffE/rSc1R6vO+Cq3Csp0j+Fvzk18QQ49MW3fobHfNIcjrazklRFa6oRkKlhnVNn7b403D0Grc79Sxy4UsNHc+oTMdZ9fAdOCCAR74tq6503hSbuL1rDu4ymzVuZj561aiYXekB6Tt3YB/YUyOS4Vm5mjubk/Y/OgfvELqZaYYcayKdzF6t8R7H9+u2WtNjWUgOMgX/ijoBnO9HapyuPhx+aMlcS0TCMb/9YeDwdVIsFxxvJMCWuJp3dTfGS2s4C2WR2GQ7roO/vhQynorpOn/5/lxYEUcMLYknfRqk34iyyOICX9HcokrP5CeYVSOy/9Q8WEHrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2wI+F/tIwLr4XlG5VXKyp6mnG5OkU18Lb+oLpr0yrU=;
 b=SEe3YSHK21+PaNQOLf1rLnHMxQ2UIlkP9WB+bWXqKYIpPPGwwGNCgF3UVLN+ve5s+1EAldeUGTivrRgCN8fMie4JZcfGkPUuowxQLueuIlCDQHwJqIScdcFjWuhnumDBq0MSXXBuG1907CSxWN/St/fPuX0RHfZNF5elIJ7Hf/ZSbljNkaKxtYRyFmGWa9kk28nkYxpCLHGYVvLC3AH1rYdfIysewJRe3QC2WqpK+zxsZaWRZzCI6Au7xN3AzCjSX8vronOHn6vlckJ3rE3LAna6H9E9+OZfkjSuRDUOkWeEscTkmcxGIkeNIzApJfIriwUYB1vD8U8qOuX7f/zOHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2wI+F/tIwLr4XlG5VXKyp6mnG5OkU18Lb+oLpr0yrU=;
 b=ZXIKnEIVp7x33n0FnRPFtY/l0VbG/AM5KOpuX9DbpfeL855Ze3zc8HqwjPNqVzinGKZ/KHet8TGvmChUzsNzx0SRsLcv0w4N9YNKMW5nsB2b1Afk5bytw0PZGNyUy8DmMzQ9LPau6jiGCR2iF6Z7iO8P8KEPzcelseaemFlAOWo=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB5818.namprd12.prod.outlook.com (2603:10b6:8:62::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 17:51:41 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 17:51:41 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Thread-Topic: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Thread-Index:
 AQHchT2wbJQWlMamnk2JtLup9X7IcrVRio4AgAC8f4CAABCPgIAAcMoAgACjbQCAAN41AIAAzP2A
Date: Fri, 16 Jan 2026 17:51:40 +0000
Message-ID: <20260116175133.m7jbgh2s3ofzj2jb@synopsys.com>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
 <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>
 <2026011400-monthly-commend-f89b@gregkh>
 <20260114225441.rn3affmwuhfl2z7x@synopsys.com>
 <20260114235357.zueeylekf4lfdq4g@synopsys.com>
 <2026011500-safehouse-alphabet-3056@gregkh>
 <20260115162234.ehm7l22ahh52d4y3@synopsys.com>
 <26f7cb41-5fa0-4aca-a119-2a7510b027a0@oss.qualcomm.com>
In-Reply-To: <26f7cb41-5fa0-4aca-a119-2a7510b027a0@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB5818:EE_
x-ms-office365-filtering-correlation-id: 755309f3-ef1d-44cb-da79-08de5527e789
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ekFrSGJqNHdEaDB0ZFN5M0ZqV1U1UXAvNU0yck5EU01SMnUyWmJhZStvQklX?=
 =?utf-8?B?ay9Fb2lNT0pEeERBUngyc2IrU1g5QmVTeVNiM1lhM1dTYjZoenJrNXptNlZu?=
 =?utf-8?B?SVBtRGxIbXc5Tnd0cDhvYWNDdkgyNC9vZlhEdzRpaTd4bTVEMlhNeDE3NFJY?=
 =?utf-8?B?cXI4Y1o3WGtqbWlxQnlpcmJoZUVpY1R2ZHIzV0hwZ3p5OE0vS2w3eGtJUDFP?=
 =?utf-8?B?RHZaUVdVNndDM0VkQ2Z0eEZFQld3WjJBSUtMMmJPa0xiMm91Q2NvMHo2YXRN?=
 =?utf-8?B?UUo4ZGw1cEFlSTRSYW83clJLT1czY0FjMzVjZHVQVGZoWm1jT29Ba3FBOG1O?=
 =?utf-8?B?eTVldDhqaGNBUlhRdHY4clc3NmIyQzNteGI1RDc3K2tKWlhVVk9XNnBVRW5s?=
 =?utf-8?B?aE85VUFMcUVIc3V2STZDaVVWUkJmU21ST1hkeEZScWdFZW9FcCtGdkYyOUN0?=
 =?utf-8?B?SHM3U29HMEZ1ZGVIRlRqODlCMkdNek9CaS9pZzJQcVhvZ0NubHYvVG9FRVpR?=
 =?utf-8?B?SE13a09CMUpxMkFEazdGUURTVjlNMzBYZEtWaHZkdjI0Unk1aThOMEM0SnFP?=
 =?utf-8?B?cmNwZVIwaHlPeSttVEFxMGZVS0NXQnNkampkTkJwdWVERzI4bDdhQUZyUVFY?=
 =?utf-8?B?MFZyb1ByN29lVE95TUJZYTNyalBMRHExRldMWTNYWElMdktlTm02SWlhYW1m?=
 =?utf-8?B?L2JrZ2ZiNGh0T2pXN0dIbXhPaTBIOWtuYTFRYzhpRWFGcmE3dlZQaUF4akZN?=
 =?utf-8?B?amwvMWJFQWRKcHpPV2ZGdFhmZnVzMDI2NC81aGlEZ29JVG1uWTdSL3lFNStJ?=
 =?utf-8?B?c1BTd2k2eGRCOE1GZGQ2QWk1RWNjN0NJZGpRdWVxNzR3alA1U0xHbXd2RmVN?=
 =?utf-8?B?SU5zdDZLUEZYMGEyR05Pd2xzcVVWd0txODdId096STdWb3N1SytMeGlTVFdF?=
 =?utf-8?B?MEEwdUxldWllR29Rekw3bmtLY2c5UXNsTGNPam5uY0FmbWhmb1ZjRW5QUHM3?=
 =?utf-8?B?NlRtV2pXUmNpbTRNRFhPNDNmc3BMVTVYblpEdnRFeVhEUHhGK0JaSkQwMndi?=
 =?utf-8?B?bzFSdWFJVXRvV29FdUhtRStSUnEzc25hdGZsVHJ1eklORTlKTlBlWmlzeHpo?=
 =?utf-8?B?V3dFcWQ5QzMvMk43QjlFZGVOSUxuVmpoYzZOSHJmREowdTBDWjBKRnpORVZ1?=
 =?utf-8?B?cVpTZngxQTRwMWN2ZFNoUTZycHFIUTlwMkFtYVZjNFh1SWF3ZzZLUkZ2ODhB?=
 =?utf-8?B?VkdIL2RMRSs4eUkranJEQzdQRDE2TlZ4czZYeVg1Vm5pTXV0QnpyVzZuZDBh?=
 =?utf-8?B?RnVGOFRTRHhDTldwMUJIWnRTbEF2eE5GRlp6U05sa1FQa2lNMW5jeW02ckhN?=
 =?utf-8?B?UzNvVEJaZFBtR0Q4OUhpZUVlcVNJTGo3RE5IZUg1Z0ZSVGNweTZBOHdMazRY?=
 =?utf-8?B?RGVqdjNBMGU2SXFiOVNrbGc2L3NqZVJpTUw4TmVDdzk5eno2eGplMTVraEd6?=
 =?utf-8?B?cTA2ei9rZFFicktIZDgzRjUvUk0zWHhRenNzU1JZSUwxL3BVdmNHK29uUXRq?=
 =?utf-8?B?Unh5MXlyQ3I0MHV5bklTTFAzY1pjemtzNXFSOGVqQ2YydmJ4NWtWck1MY1RT?=
 =?utf-8?B?bzExdHd4YzFCOG9qclN6YzVZQTRVc0dTNUZQaUhNczR3M2hyTlJwVTVkMjBS?=
 =?utf-8?B?bU5FRVd2MkwvU1ZwL01LR05Qc1dJNFNrbkZDV3FLNk1LRkRPVzhMMmFXUlQx?=
 =?utf-8?B?eDB2QlpWY1FZSDV6ZHNsbGV2RXAvVTlHVFdpSkVCbldURWpjZjZTZnl5d3Jy?=
 =?utf-8?B?SWdwUy92UnpobFNraFo4MjFESGVEOU1wMVluYjh2dTl3SkVjSDdOMkJoUDQ4?=
 =?utf-8?B?UUFJSEY4UERJYnpZc0s5aXVtamIyV0crNHZmU3lHNVNYODB2YVlzMGJQUEdt?=
 =?utf-8?B?K29ZSGt2SjZxc1ZiTUdCdWh6UUFIQUpMSHh0b2NJejlBd3c0QXVjNnNDQmYz?=
 =?utf-8?B?cC9pNytiZ2FNQTZNZ0szYUN5cWxUSVFyREFVczJBT3cxdmlKMzBXZk9TN3pY?=
 =?utf-8?B?d1BQbWFjZkdNZlYxTXpVNkZ6bUlBVnVGZ25Yd29XaGp6T05BUTBqUmVEN3dK?=
 =?utf-8?B?d1N2Y3dMemwwdU5DaGIxbjAvVUR5dlRSYjN4S2d6OW9vZitjenU3M1YyMDJD?=
 =?utf-8?Q?480/Xbb3d9TDxpzDqdNKP/o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V0ZnMkxaOERrMTI5MGJaV04wYWs0WkNGMlp2ZDlnbElHYkFtUnpCRy9WUGFO?=
 =?utf-8?B?VWlIVDhubGp3R1FlRmZPTjRVWjg2Q1JBZHdHU011M0Y5MWxITUcwMXAyQU43?=
 =?utf-8?B?U3RTZHF3eUVMR0YzZFdTdzNJQzJiWlBrQU9tRG9iWHJ3dVdQckc1ejNoRzVm?=
 =?utf-8?B?aTJoM3BnS3U0bmR0b3RBZG91T1czNTFXSUt0Rk5WOU8yUmlLYVpyaG92TUVs?=
 =?utf-8?B?c1ViVVAyK0NHWVluc2xmRW1ZcTFOa1RRaUFTVFRSR1VBZHR4dEVaZ3ZIUTRy?=
 =?utf-8?B?cjQrWVhydUxDNXFWMy9DaXMwZUFDaE9uY0hnYm1ycFlKSmxWZnRsRzg5OUlZ?=
 =?utf-8?B?bVZ0eWVoUFFjSC9TazlqdHZYbS9nZ3czQ3hBRnZzWElPTWpDUklZR0psTWxt?=
 =?utf-8?B?Q3ErTUxKd3VsYUZWYWJnMlRDMFhVSWQ2d3NiUEZaN2FGUTRSeVZtNmdEdWlX?=
 =?utf-8?B?ek1WWmcrSHRaandUbG0rem1BRWlIYkhnVWdqQnIySzVmS1E2Uk1YVWRLTndX?=
 =?utf-8?B?NzNjdDJ1STJVMjdsbmlTS3RLaGpNM3RpeWtWNWxRd2czcXFzYXpXRmFabllo?=
 =?utf-8?B?cUZRenBzS3RpRCt3ZE0vTDZ3TUdLM0FSeW9VMnY4OHVXa0J5ekx4OUhUZG9L?=
 =?utf-8?B?RVNYNWdiSFJIbjdNU21tWFcvbUNwVHBYN3MwL2N0VUprZ29ZV1lLczhGZ05k?=
 =?utf-8?B?QUJDWGdBalR0UDVNRU9xdGYzalJTMlNZZU9PLzkzM1RWc3loeElVYXVVWHpW?=
 =?utf-8?B?SWozQnQzcjh3Sy9mOEc4OHJDVnFWNFErSDRHWTA0OXhidXNxYmtyeDJMY0oz?=
 =?utf-8?B?YTlaMUtFK2c2SFRnM2wzWWtPTjNIT3VuR0dRWmFwSkpaOGtldHJPQklxcnZo?=
 =?utf-8?B?SHMyakEyZDZBZ1NVbHBJZzQ4RG1PNTlYdytPSEpGZVI4cExQb24zUXhkdHdn?=
 =?utf-8?B?NHg5NGtqcDFBek1EVTFyU0cxT0x0czdFbnQ2TGwzb3VNSzhMN0xwd2RDVzF0?=
 =?utf-8?B?Y0dXbzkxaUNEMW8ybTlyMG5NNTdNVVNYbmV3M0NxTkxya0dqcE42bFBGVXlS?=
 =?utf-8?B?TnZ3WHZkeTJqWlpjVWhFM1VmNzd3NUd6Vm1ucXRyQ0JELzZIUENVVDNBYWVU?=
 =?utf-8?B?QisvYWpsMk4zVkNYRnRIeFMxRlZ4bVZkRDFFclRac2RWNE0rZlFuVVhoN1gv?=
 =?utf-8?B?ZHVWNGFmYS9ORFIweFArQjRUUHBvZUtSQjF2YWJpRTFIaGNWQm1YQk15M1BJ?=
 =?utf-8?B?OFFUYmZCbGVjeW8zL1ZqYmw1QjR1cEVMMWZNS2tCeXhzWnZMSnNKakZ4TnVN?=
 =?utf-8?B?MDgxQzdtU1pwdjQ4ckZlUEk5ZnREQVJFV3RYTHNNMThuYmxVZTVKYU1KNU9n?=
 =?utf-8?B?dy9GOGhTUFM2NmUxQ09qNXJoSml3eEE2bEl1UHRiQ3lwbWlVSytnRk5DTVJY?=
 =?utf-8?B?cXRiT1lBaVh0NWFJc2h2eDBBQzltdW4rVEFOOXhSQTZVS3d1Ykd5TGI5bE16?=
 =?utf-8?B?aW5wY0pPeWlmZ3BFR3F3dzZDTTlsQ1ZmN0RRc2FnQUZqeHBDSXhxWUcwaWhZ?=
 =?utf-8?B?Rm4xT3Ywdis1YldGK2hpUjIzejNjdFBMd3VxOFMyWlVCYStpTUFzUjhROTBL?=
 =?utf-8?B?cFFMMFhCS0hPS2tIU2E0Zkg5aTdEZWQwbDZWeE5RRDBMeWxFSGdFMFE3QjVY?=
 =?utf-8?B?ak9TZlNNRjNIK2g4bVZ4cjB1Rk5MeUNubE1yMXN1ODV3SE5PUk93NFgvTFNz?=
 =?utf-8?B?QkJtU0xSdXQvWGw3a09GclIrM0tjQjd0eDFRQjduY3U4T241N3daWHQwa3ZY?=
 =?utf-8?B?bVg5ZytiZ3Z6U1V6N3dGYUZRKy8xbFBLTkEyQjlJaGlOajZWRzFCaXBZSDU4?=
 =?utf-8?B?cEppZ1N6R3Fua1hDMGtrc3RiQTIyNWt4NGNXeEZ3OGlaUksvNkdGc0dVS000?=
 =?utf-8?B?NU9adE9ndDkyVmZ4L21WTU13Q3J3N09nUlZ0cWN5TG5IMXhtSmI4d2x4bTdu?=
 =?utf-8?B?dlFhdjRla2tmYnNsVlNzRnE4ME0rMlJ3ZWVCbTdoaEQzUCs1YnNGamlka0ow?=
 =?utf-8?B?ZVg5R1ZGeXhuV3RONjRSbXFvV3AwMGR6aWdCMi9CV1krQUZQN3MwMUppdHdv?=
 =?utf-8?B?V204QXpDdzExc2VoRTZWRnhIR0lYVGhUbERGZ2lPeVNRTTZIbVQveUIxbUhE?=
 =?utf-8?B?d2QrRnhhcUtpMTc5NmNQdUYvK0EvVFJMd25BZkVoUnhoNzBibnJWbHhGNHlj?=
 =?utf-8?B?NmN3c0U5NnA3WmJwUnBKMyswdHluMS9MMWtWdlJIU3hCQXNxRi92bUpZeGhn?=
 =?utf-8?B?TXUvM3M0Y09RNU1CbWZlaWw2Qkd1WEFrS1NDb2NSQXVRMnExVWlQZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63A62B467B8509468B48CFAA9F165084@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YGbRgodwytnKQ2dixoVJ5t7/T9bF6+2697Cd7U2h/rFbDYHUDBc9RmV6ztyDYpQHREDcB1u+1HlcScvNxCQ7kxA3r6i/UEZv4QBlK5yDvrOK8NGB3mZ3lxIfUftjGB35mVWc91kQJBzdjap8iwc4b6V8PpdxkWYll0eeMzfJVtanLvKSGLtlk0DB57shVc1TbuE+BCMcrK1ELFnm3ewV75V9xQf1RIc74OPAIzU2Th03sZLNnHPcEYlUfbQuoQ3FUqkBW8fxNDJouCIKwv88iWW59iBMMiFlpF095bQFcgk8vo/TQiBRHAtYRUHUohnduJNI4BIxa/esVmTWleXQ2FvKarjWmNmwuSQNUvX+p5Y+NxkunW09NKQyBiFQC4reG36fxKqCVzILafW/A3VkqDJ9sVc7vHkmVlQ77D/GNYp1h2A46DgTcin9SOIjtrQBkvIajEtfNCTAqe3n9vgZBnh+xn7YYlhtUkEax1fCYu+gfDo8Qbv5auZI7D1EUettTV9fGH5GWIVgy31xH9RnbQUA//XVFdfSTCnumAayVAi3dnPloLWMPHneXzPoctSJT3JhRvpqji/tINKUn9b/8Fu7BGImIGamyj+fDOq+5SepTmk/Hqx6shMN3WqtUeCurJ95+26U1tZw2UNkxoaOKg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 755309f3-ef1d-44cb-da79-08de5527e789
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 17:51:40.9749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sx/SaAX9M+XFaBY+bKFfgsEsHvjifdJr/aKqLZdht2p0j53zjphwfdpcE+5gdMJ0G+ddolrLOqnCs0L9ookXeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5818
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEzMSBTYWx0ZWRfXylw55/L0n5rt
 L3K2903OOggYn99dg1kpG21Hv4jsbhpRSt0/FAHj6grZ679gYfNt8LYaah9f//czEU6/Ntg+vYn
 Fy1IxnXTJ0qAk6+6y0NOEMrTscUGK1lDRRxePrks38MFdk7Bsv1inrVZ9IGj4SqJIX4lp8Ha0/m
 yqE9/CX96IOjaZZjMtJ0lhfju7VFCkLPmN4XVEUo1BgjEGnP4RHcUuUmLitrefnIOIsGbXLAJXI
 6VuDd3yogxOdRCHwYuS2OGtX53LvC8i7QRqXPqG/GB14v9USybtYS4wrhgkYnnv8CC8tVamCDDi
 LdbMYX1wjyJQLdzYS1CoZfxhAJVDa/b0WgHr5MZ28H9yxYYQSUMFqQ12zfcdDREE8nZaLb1J9td
 bgDMdGaRIKojODYAZoXlaopZZaSFdz4BcQequ7Tadz6wpLtcMOAlCCA91rHcH1by/hKsPX7h0UX
 iyk52bd3Oxd6LXHXQ2Q==
X-Proofpoint-GUID: c7nJZLltepz4aaMDL6aL6belaKdEPIVn
X-Authority-Analysis: v=2.4 cv=Ap3jHe9P c=1 sm=1 tr=0 ts=696a7ab3 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=U5gwoGqeG3Z0SO3nojoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: c7nJZLltepz4aaMDL6aL6belaKdEPIVn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160131

T24gRnJpLCBKYW4gMTYsIDIwMjYsIFByYXNoYW50aCBLIHdyb3RlOg0KPiANCj4gDQo+IE9uIDEv
MTUvMjAyNiA5OjUyIFBNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1LCBKYW4gMTUs
IDIwMjYsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gPj4gT24gV2VkLCBKYW4gMTQsIDIw
MjYgYXQgMTE6NTQ6MDNQTSArMDAwMCwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+Pj4gT24gV2Vk
LCBKYW4gMTQsIDIwMjYsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPj4+PiBPbiBXZWQsIEphbiAx
NCwgMjAyNiwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiA+Pj4+PiBPbiBXZWQsIEphbiAx
NCwgMjAyNiBhdCAwMzozNzo0OFBNICswNTMwLCBQcmFzaGFudGggSyB3cm90ZToNCj4gPj4+Pj4+
ICsgKiBAYWRkcmVzczogQ2FjaGVkIGxvd2VyIDMyLWJpdCBiYXNlIGFkZHJlc3MgdG8gYmUgdXNl
ZCBmb3IgbG9nZ2luZy4NCj4gPj4+Pj4NCj4gPj4+Pj4gV2h5IGFyZSAzMmJpdHMgZW5vdWdoIC8g
b2s/ICBXaHkgbm90IHVzZSB0aGUgZnVsbCA2NCB0aGF0IHlvdSByZWFsbHkNCj4gPj4+Pj4gaGF2
ZT8gIFdoYXQgaGFwcGVucyBpZiB5b3UgaGF2ZSAyIGRldmljZXMgd2l0aCBqdXN0IHRoZSB1cHBl
ciAzMiBiaXRzDQo+ID4+Pj4+IGRpZmZlcmVudD8NCj4gPj4+Pj4NCj4gPj4+Pj4gVGhpcyBpcyBh
IHJlc291cmNlIHZhbHVlLCBzbyB3aHkgbm90IHVzZSB0aGUgcHJvcGVyIHR5cGUgZm9yIGl0Pw0K
PiA+Pj4+Pg0KPiA+Pj4+DQo+ID4+Pj4gVGhpcyBpcyBvbmx5IGludGVudGVkIHRvIGJlIHVzZWQg
Zm9yIGxvZ2dpbmcsIHNvIEkgc3VnZ2VzdGVkIHRvIHVzZSB1MzIuDQo+ID4+Pj4gSSB3YW50IHRv
IGF2b2lkIHRyZWF0aW5nIHRoaXMgc3RydWN0IG1lbWJlciBhcyBhIHBoeXNfYWRkcl90IHdoZXJl
IGl0DQo+ID4+Pj4gbWF5IGJlIG1pc3VzZWQuDQo+ID4+Pj4NCj4gPj4+PiBBcyBmb3IgdGhlIHJl
YXNvbiB0byBjYXB0dXJlIG9ubHkgdGhlIGxvd2VyIDMyLWJpdCwgaXQncyBqdXN0IGJhc2Ugb24N
Cj4gPj4+PiB3aGF0IEkndmUgc2VlbiBzbyBmYXIuIFRoYXQgSSBoYXZlIG5vdCBzZWVuIGRlc2ln
bnMgd2hlcmUgdGhlIDIgb3IgbW9yZQ0KPiA+Pj4+IGluc3RhbmNlcyBhcmUgcGxhY2VkIHRoYXQg
ZmFyIGFwYXJ0IGFuZCBzaGFyZSB0aGUgc2FtZSBsb3dlciAzMi1iaXQuDQo+ID4+Pj4gSXQncyBh
IGJpdCBuaWNlciB0byBzaG9ydGVuIHRoZSBhZGRyZXNzIHByaW50IGF0IHRoZSBzdGFydCBvZiBh
DQo+ID4+Pj4gdHJhY2Vwb2ludC4gQnV0IGlmIGl0J3MgaW5zdWZmaWNpZW50LCB0aGVyZSdzIG5v
IHByb2JsZW0gd2l0aCB1c2luZw0KPiA+Pj4+IDY0LWJpdC4NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+
IE9yIHdlIGNhbiBqdXN0IHJlbW92ZSB0aGlzIGFuZCBwcmludCB0aGUgYWRkcmVzcyBmcm9tDQo+
ID4+PiBkd2MtPnhoY2lfcmVzb3VyY2VzWzBdLnN0YXJ0Lg0KPiA+Pg0KPiA+PiBJIHRob3VnaHQg
SSBhc2tlZCBmb3IgdGhhdCBhIGZldyByZXZpc2lvbnMgYWdvIDopDQo+ID4gDQo+ID4gQWgsIEkg
bWlzc2VkIHRoYXQuDQo+ID4gDQo+ID4+DQo+ID4+IEknZCBwcmVmZXIgdGhhdCwgaW5zdGVhZCBv
ZiBzYXZpbmcgb2ZmIGEgdmFsdWUgdGhhdCB5b3UgY2FuIGxvb2sgdXAgaWYNCj4gPj4geW91IG5l
ZWQgaXQuDQo+ID4+DQo+ID4gDQo+ID4gWWVzLCB0aGlzIGlzIGJldHRlci4NCj4gPiANCj4gPiBI
aSBQcmFzaGFudGgsIGNhbiB3ZSBqdXN0IHVzZSBkd2MtPnhoY2lfcmVzb3VyY2VzWzBdLnN0YXJ0
IGluc3RlYWQ/DQo+ID4gDQo+IA0KPiBXaGlsZSBpdHMgdHJ1ZSB0aGF0IHdlIGNhbiBhdm9pZCBh
ZGRpbmcgbmV3IHZhcmlhYmxlIGludG8gZHdjMyBzdHJ1Y3QsDQo+IHVzaW5nICd4aGNpX3Jlc291
cmNlc1swXS5zdGFydCcgaW4gRFdDMyBjb3JlIHRyYWNlcyBjYW4gYmUgY29uZnVzaW5nIGZvcg0K
PiBzb21lb25lcyByZWFkaW5nIGNvZGUsIHNpbmNlIGFsbCBvZiB0aGUgdHJhY2VzIGFyZSByZWxh
dGVkIHRvIGR3YzMgY29yZQ0KPiBhbmQgZ2FkZ2V0Lg0KPiANCg0KV2UgY2FuIG5hbWUgdGhlIGZh
c3QgYXNzaWduIGZpZWxkIGluIHRyYWNpbmcgdG8gYmFzZV9hZGRyZXNzLiBGb3IgdGhvc2UNCndo
byBkbyBub3QgaGF2ZSBhY2Nlc3MgdG8gdGhlIGRhdGFib29rIHRvIGtub3cgdGhhdCB0aGF0J3Mg
d2hlcmUgYmFzZQ0KYWRkcmVzcyBpcywgaWYgbmVlZGVkLCB3ZSBjYW4gYWxzbyBhZGQgYSBjb21t
ZW50IHRoZXJlLg0KDQpXb3VsZCBzb21ldGhpbmcgbGlrZSB0aGlzIHdvcmsgZm9yIHlvdT8NCg0K
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvdHJhY2UuaCBiL2RyaXZlcnMvdXNiL2R3YzMv
dHJhY2UuaA0KaW5kZXggYjZiYTk4NGJhZmNkLi44ZTVkNDc0ZmQ1NGEgMTAwNjQ0DQotLS0gYS9k
cml2ZXJzL3VzYi9kd2MzL3RyYWNlLmgNCisrKyBiL2RyaXZlcnMvdXNiL2R3YzMvdHJhY2UuaA0K
QEAgLTM3LDE5ICszNywyMiBAQCBERUZJTkVfRVZFTlQoZHdjM19sb2dfc2V0X3BydGNhcCwgZHdj
M19zZXRfcHJ0Y2FwLA0KICk7DQogDQogREVDTEFSRV9FVkVOVF9DTEFTUyhkd2MzX2xvZ19pbywN
Ci0JVFBfUFJPVE8odm9pZCAqYmFzZSwgdTMyIG9mZnNldCwgdTMyIHZhbHVlKSwNCi0JVFBfQVJH
UyhiYXNlLCBvZmZzZXQsIHZhbHVlKSwNCisJVFBfUFJPVE8oc3RydWN0IGR3YzMgKmR3Yywgdm9p
ZCAqYmFzZSwgdTMxIG9mZnNldCwgdTMyIHZhbHVlKSwNCisJVFBfQVJHUyhkd2MsIGJhc2UsIG9m
ZnNldCwgdmFsdWUpLA0KIAlUUF9TVFJVQ1RfX2VudHJ5KA0KKwkJX19maWVsZChwaHlfYWRkcl90
LCBiYXNlX2FkZHJlc3MpDQogCQlfX2ZpZWxkKHZvaWQgKiwgYmFzZSkNCiAJCV9fZmllbGQodTMy
LCBvZmZzZXQpDQogCQlfX2ZpZWxkKHUzMiwgdmFsdWUpDQogCSksDQogCVRQX2Zhc3RfYXNzaWdu
KA0KKwkJX19lbnRyeS0+YmFzZV9hZGRyZXNzID0gZHdjLT54aGNpX3Jlc291cmNlc1swXS5zdGFy
dDsNCiAJCV9fZW50cnktPmJhc2UgPSBiYXNlOw0KIAkJX19lbnRyeS0+b2Zmc2V0ID0gb2Zmc2V0
Ow0KIAkJX19lbnRyeS0+dmFsdWUgPSB2YWx1ZTsNCiAJKSwNCi0JVFBfcHJpbnRrKCJhZGRyICVw
IG9mZnNldCAlMDR4IHZhbHVlICUwOHgiLA0KKwlUUF9wcmludGsoIiVwYTogYWRkciAlcCBvZmZz
ZXQgJTA0eCB2YWx1ZSAlMDh4IiwNCisJCWR3Yy0+YmFzZV9hZGRyZXNzLA0KIAkJX19lbnRyeS0+
YmFzZSArIF9fZW50cnktPm9mZnNldCwNCiAJCV9fZW50cnktPm9mZnNldCwNCiAJCV9fZW50cnkt
PnZhbHVlKQ0KDQpUaGFua3MsDQpUaGluaA==

