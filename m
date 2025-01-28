Return-Path: <linux-usb+bounces-19797-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C08A202E7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 02:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88FEE7A3A3B
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 01:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F953BBF0;
	Tue, 28 Jan 2025 01:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Qnxgbogk";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F1Pphyqv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="sD/5r4uC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10F68462;
	Tue, 28 Jan 2025 01:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738026885; cv=fail; b=OLcaSn71Sxx5sA9fNxoEyqoFpjFQlJQhORYPqFLDF0srGXIkzSFbmOulwa5JFgm19MEDErqlD7d3Q4Q8GZCQwL/BlEazD15c3Rcnh/lMMBPLlvIxQAMRX+8hBkhRDZKA18W0nZ8iCSAAO8m514Xvh3SZD+nLNueQgXWxcHddaPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738026885; c=relaxed/simple;
	bh=izTqbUl5wtBIwAFBALX9YX2tdRMuytti3Lqutsx2dCQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MRF3k+/8nW+AKs4W15PRu1JEXBMT3QzRJuBT3iN5opb6D1snobGHqwfkYaYTyh6ZAtfvTf48qrNwt1AWTgRJaQvt42eR+1+vDHBPVSAEczeeGjq8T8PwXBGFmhc+/AKt79NEblOJXJ/RPoQacwyA3KXlRPfgZD46mts0mnnEgWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Qnxgbogk; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=F1Pphyqv; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=sD/5r4uC reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RN2FTD019970;
	Mon, 27 Jan 2025 17:14:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=izTqbUl5wtBIwAFBALX9YX2tdRMuytti3Lqutsx2dCQ=; b=
	QnxgbogkI2gU7k1309FRqahmLLDM54g7LetCms6I+twTfWf1TA/snoe3VOKGbCtH
	1CHgA1iFFos5fJp702necw0aK4xy1sXrt6XMcOjE09TK0WfaUlj3JMGIlQ1nP2Ik
	QBVWLDRo06EM6RAD+slErEixSpCLWc/tXjyPr0ecSBNa+qIwXU1UXPNUEnBf8Kbj
	VHeKdLwJUEMd2HTHlvR+HstMjtUnCZLnh4GLIU9dVLeOV0X9SLujh6nqC8PcnT5l
	A8j7KOMIjy81nsiDovSH4dTkiHCC9CJ7993YU542+IoJX/QFNPD5rhvtwlzjmBcE
	hZw19/gu2XVg4EtismMOWw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44ekf58dmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 17:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738026873; bh=izTqbUl5wtBIwAFBALX9YX2tdRMuytti3Lqutsx2dCQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=F1PphyqvFuXkzekTThoyDtedNyAsCu5fMur3g3Qu93lwfyfOXpSYhtq4LLBrfxers
	 xQnceEvu8s5b0jFgS2aj+a7yyPEkENmuvqvFlk+yD6KAL86IkYQcVeX5pyuxP4mOI2
	 K6EvLQVWmtlbX5Td8qnY4uB8E6EnTdIAuudJeotNUN1+RHreTjsc6mzC8C7qKM7M8x
	 Ouu0a5uzeziWuvvF8SVW/AZ8Rr1AL7e607Fb7fo3wYgeO4k2jXcFaQyCT31/c0FDpQ
	 4NtmRHFdEHGCmBDIrB/fGNJ7KrLMvc+1MyIlbahHDi4SfcV1U0OsoP6WHWeUhHN72d
	 e8kuGKUIjBEqg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BE09A40105;
	Tue, 28 Jan 2025 01:14:32 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 28EB7A007B;
	Tue, 28 Jan 2025 01:14:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=sD/5r4uC;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6540340363;
	Tue, 28 Jan 2025 01:14:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTG6wmKZnk7xX0cNZmPhS7UQXbC73CstItcudRX8z1xyWQswoYLDwwAeSagEB/pymoyDV1YFJZyxXwGwh+27TWQP6dSury4lKx2xpvviEvWwZqqXaDo3XCBTNUR3jtUPPnSYo6bvQBdjb2udW+mviCpqP6ALwP7GfvkL2StgMi4zKhkZ4uh53YNPXZ7DqqNAL8WX/dldl28/iS0JeXfsB9Ind2x7lZPWReqzkSI12/xyQHFVWHh+lLiL1l25llmwWr+9yGwOi++YpcLsrDxOz8BIwxTrhAUrlsmpgkflgRYeISBvBQmROUvcX2FSDJBn4Gtwg6w35jA3S1RrZ48HCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izTqbUl5wtBIwAFBALX9YX2tdRMuytti3Lqutsx2dCQ=;
 b=XB+bt/l2JAj06GxYV5GKCpp01k40HKo1Qf8t1eOR9xoR1pJvLC9Syb6l3YaNwaS+pgHhgMAyW9kLtVT/Tb1YI1Fw+bBRO2BtpB91FXXv5E227iSALRIKO5h0WIIhqXZSwOr4xDCERp7c1/3eoNc/DfDxI3vgBwQ201jPzgRscRQH9f/TMHeWJ6I2P6W0JBqKJL+hg8mVo/t5ewVPDbfTWcShb9sogZb8UV8bN+VNgwolyh9WnLXggf++4QF0GiHoYOjsqmoRGZEkUfVraB++SNQ/pIefxE9ZGE9bdo+1zdcx34J+rUo9QaFTA86Wx+htbF/4RA6sECWmR5CPnuvGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izTqbUl5wtBIwAFBALX9YX2tdRMuytti3Lqutsx2dCQ=;
 b=sD/5r4uCiR4oe25SZ2olcxWAIpZnD7sTqysq8+2dWREm0klZ41pBq8Nd88MnlCK0wOK24fe85rY7r97x45g0i/go4p24tbWLIzXRFSLSfQsWe+NfQu6xmKEAQQTGK+jfnmBo2BXNw/ZEvD2hwHwxp42+qCbGOG9z4iyHfFFIn4w=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MN0PR12MB6368.namprd12.prod.outlook.com (2603:10b6:208:3d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Tue, 28 Jan
 2025 01:14:27 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 01:14:26 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Camila Alvarez <cam.alvarez.i@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix DWC3 documentation warning
Thread-Topic: [PATCH] Fix DWC3 documentation warning
Thread-Index: AQHbahiWh6PaycB7x0e9oOkAmrz6TLMrb66A
Date: Tue, 28 Jan 2025 01:14:26 +0000
Message-ID: <20250128011411.b22j6vmqqzuvrcsi@synopsys.com>
References: <20250119021803.23272-1-cam.alvarez.i@gmail.com>
In-Reply-To: <20250119021803.23272-1-cam.alvarez.i@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MN0PR12MB6368:EE_
x-ms-office365-filtering-correlation-id: fadaf754-b992-4243-aad5-08dd3f391bcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b3JoR3Q2OWdTaEVwRm9yTVhWNWF5RVVLYWdtK3l3Y2NqVS9CSUZiVXkwNEVU?=
 =?utf-8?B?L0Z0VHlHU1IwckdSbytUT0hsRzFEUmdYS0pVd1VXbmgwZDllTlBhc3dIeHdF?=
 =?utf-8?B?VlhwMHJnS2RrUnd1NVU1UWxuUzRWMFJQRWxNQ3pWS2R4NStId1NHMW53NHdh?=
 =?utf-8?B?eGFIVFVqOFpYSHA3dmNNL1hDeHZveDBOdTJMUmJnOVE3YngxTWxlUDM0aFh3?=
 =?utf-8?B?RmRDc01pbjMzVG83NjB5ajR2ME93L3FubDFlVzJyUUk4c3Bzc0tyQ3BaYzho?=
 =?utf-8?B?K0FWSnJvc0c0YlQ4aHdDVXpGeitjOGVyNk5HOUJCSFRSL2c3aTlxTy9pZW4x?=
 =?utf-8?B?WWZWUkoyclE2cG1DK0NtSVNSem0zeFFzeFRlbkFpYlp2TGN2bC9YVTNmcGtM?=
 =?utf-8?B?ZlhFVGNxQmtoVlA3SjMraTJLaTk2K1pRTGRMR21QNnNoYm53bGdJZ1RBY0JG?=
 =?utf-8?B?djR6Y2w4cjVKd1RTTVZnK0FGNW9xbFJNWGZ2L1MxUm5SN1hSZm5VMXBlN2V6?=
 =?utf-8?B?ZWRKQlkzSGN0bVljU21RZnRRT0RPUU50RkJjK1p0QjVMY3lJUmJxWEZqQUw4?=
 =?utf-8?B?cTV2eXhSOVNzRGpIV1hDQkh6cjlEUjdCcTFVSEs4U08wdVZLRXpHNlVuVHlP?=
 =?utf-8?B?ZFZTdSs3cUEwSU9IL015dTUrU0UrM0tMTXIyaStib09BRHArMFV5eWdLa1Rp?=
 =?utf-8?B?MUJKYU5jbzdBRDhwb0Qya3grWXkzRWI1TlpZRk5MMFl5ZWFFRENrT0l6ZmlR?=
 =?utf-8?B?VXhnTGFMQjJaZGZqSlp0aXpHUXFVdGFwTXo2UXdzdnRGUkFPbGYyWWlVNWgz?=
 =?utf-8?B?dTVwd3dmVnYyeCtkRVhMTDhBMy9DTENxVndaSlV5bXpiTHVuNzVKOWQyY2NR?=
 =?utf-8?B?RmJ2YlZ3L0dxTEFvYmhQK1BLQVJQM1cvUVlLaFB4ajJpOGF1V2JBcWZZUVBh?=
 =?utf-8?B?dWZLMVNhRVlaV3JUYUxmQlZYWUpXRFNMUU9ZK2hkVUdWMWR3KzJCZTM4K0VX?=
 =?utf-8?B?V3BjL3ZtOE1lbDRHYVNHOEFzTkxJWEdJem9rNG5adVBHQmZyV2RzeDQ1N1hx?=
 =?utf-8?B?N2FVUGhKVXY2NDhxODZPczgwZ0N0TGFwbENYeVRqZERqNFpZMlFFSG1CMWNI?=
 =?utf-8?B?Yjh6R2VrY3VNQkIzNmhUcHNyQy9LUFQxaXkvcDJleDV3YUhITWZNUUZ6QnpL?=
 =?utf-8?B?WGNjaU1taHMwdFNVdG5QSWV0aFV4Ui83YktqYXZBQVlpRUhveFl6V255Yk02?=
 =?utf-8?B?SGYvVE4wZWNQY0RMeDdTdm1UelRSaFExdndOcGttNUlqb3B4dVh5b0ZUck9k?=
 =?utf-8?B?SEgzZ1FsbDlYSFBnQnRabEJIaGxjNmZLYzRaVmJtakFlQkdRMUhhU1dIVC9N?=
 =?utf-8?B?M2J5b3Q4VXFsODFncDZES0NKWVFKb24yVlJhZEpROEhQQlcvRGVHdkVJZjFm?=
 =?utf-8?B?Nms1NWpZTWdIdzEyV3dCVzZiMmFXbnAxMkFsb256OFFaaURiNmhTZDJuUTN2?=
 =?utf-8?B?QmM1K0pyd1dsQnRPY0Y5NUJ1OCtSY3lUMTExSTZnL0Q3RUEzYUNLYlNVUU5Q?=
 =?utf-8?B?dFV5WUJ0UGE1SFcxRkJYRjhVcmRDOEpVZmh0UHZiZE52eVFQRStlQ0pyZDZS?=
 =?utf-8?B?Q3NlRE51alFDaFhNb3VnUnJtZCtQQldqUkZxdlMxZ1NVeHgzclJpdy9NVk4y?=
 =?utf-8?B?TkNqT2s0cWw4eGNXdlI3b0kxeCtKL1dwdGF0R3kxMW1Kb2p5WC9hODg1RjZX?=
 =?utf-8?B?eEtQS2QxN0tBdFk5TzB3T25leUF1V3pSNXVvVFRQZlJmWkQ4blNpVzJ1R2E4?=
 =?utf-8?B?Y0JRUmtKbllHeTVDZjhsVmZOZDc4SXM5QWhnVktyM0RvV282MFExUnZScnpv?=
 =?utf-8?B?L0puNGE4UDZJNzVCZE9HSDBFT3ZiUkdPbjV5UVdxZ1dRQUVyWlZhNWRGL2ZC?=
 =?utf-8?Q?fz84MfqKbbxuXFqbGwiCS890J0w8ggSy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U1NPWlJhQ2NlYmVBSjZvbnk0RHFIWUk2UmRZdzhaaU9pSmoyeTNUOWF3ak0r?=
 =?utf-8?B?MkMzYnhNV3RyTEdDTXNXWTVrczBkTVdpb0wrMTNjNTZ1MUkwSGZrblU2cXJx?=
 =?utf-8?B?TjB0VE9qNlNBZ1dMbFVWeStZNVRrUm9Pb2xXak9FZGlUMVg4ZXFKekJqd09K?=
 =?utf-8?B?N1BzWmVHOGJNb3MrVUZrOGVlVUgzS2dib1RwUHZvTVA4R1dSbTUvZnpBRDVL?=
 =?utf-8?B?SEppa1pKTFRGaCtXMzFoTnNiVkJrZlQ3d2kwc2lWM1BqUk83a2NPSjFNT1c3?=
 =?utf-8?B?TndGem1DaFoxMzVTSHJvVXlaM1h0b2pocVdrMEJPSmZnKzMvbWZlb1NOaVNB?=
 =?utf-8?B?Z291VkgrOVU4ZHgrZFc3Zm8wdGl3dlVqTkVHa3FjcE0zNUNtOXRXcmFYUHFx?=
 =?utf-8?B?bWtPbFMrb1ZWZk1yTThpbTNjZGZObFdRNnB4SmdGbCsyZExndWlkcXBMKzJH?=
 =?utf-8?B?dzRYbzVGYWJxR0VTemt3c0tteEhsOG1TWVpYSCt6c3FEclVSdFVOYytPRjlj?=
 =?utf-8?B?SktwTzFpMENDeEJMRmlDT1lqNDJoanpmeHY0ZjAwWWhpbHhVN2VrSUZFTWQv?=
 =?utf-8?B?Y3Vjd2J6enN3TTM5S1pnOXVhazVXOHFpVmxiYVdISFcxNXRSZmp2QldRVzNC?=
 =?utf-8?B?TnBadFZmT2llcit1aEtvOGtBRlRROE52NGYwc2ZaUXJiNjRJWHk2QllaU0w1?=
 =?utf-8?B?MFk4N2c5SnhaU3ZyVW9sWTVPSmhmL0w0cWFlbkJ5aVhqMmJnSXdVUnB4QnpZ?=
 =?utf-8?B?eXVaWmdYU0dJazJLbXNFaFpleTlMdmlwZSsrUDQvOEJxbHhlb056bklMMk8r?=
 =?utf-8?B?dHZvT0RQbHovQ3JMZ2thNWxBeVhtRVBYWFNlTmhJc2tvZDJtZENSNUJtOWw2?=
 =?utf-8?B?dmQ5R2ZpRms5aEdrNWI3K3JvTlRGSlpkZXFVc0dmYUxLUVVpcFN0bkl0RjNm?=
 =?utf-8?B?aEc1LzlxT2tRWnpjZjFhRmVDaVpERy9zb051cnBLbHBDMXdKZ0ViQzJPb3hH?=
 =?utf-8?B?dlgzSU93SXRXb3ZFMll6ZXArb3c0UUxNamNDeXNuNWZvRDRZa3NCbFp2RUlG?=
 =?utf-8?B?YmVJNnFJNXlXKzVVN0pXejl3b2NQU1FrMGFEQ01wRUF0QTM3ZGNBOEFYMkYx?=
 =?utf-8?B?QVIrZWx5RVFVR0xvUlJCY1FTYTJGODZPQTY4Um5RZzQreHlxMm44aC91NTBQ?=
 =?utf-8?B?VUxvTFBUOGYzY3RzenBCUEVTYWlrSWJ2RHAyZ0hzQnNiN3ZCNnJFL1BYTkg3?=
 =?utf-8?B?Y0h2d2tKVld3RlB3WnBEaFk4eGNObEVPOGtoL0hkdVJleUtrWFFwcEo3WGth?=
 =?utf-8?B?VnQ4OGFpODl6NWFPWEsxY3dreVhHdks5eitPYlJPOWdwSThVNStRTEpQbGNS?=
 =?utf-8?B?OE5uZG1GZy9Ta1VGalZjWDNJcFp3S2dsR0JwQTl1aWtkNGsyRVJZSVNCMUpU?=
 =?utf-8?B?MGhsTnFuZVpzTzgxZkVMWlVaakJQcFhtVFBWZWlaMG43K1JxQnJqaUJIUU0w?=
 =?utf-8?B?UzZKTVZQMVU4ODA0Mit0Tm9BMU00dXRFMUUyY3U3VVdBbUtVNlJqTHMrT2FO?=
 =?utf-8?B?QkxIa3hhamVrZGlvNG1ST1JGTDhhWitURm9WL0dNOFFSSUhYcTdJdVlNT2Vi?=
 =?utf-8?B?NTNnWGJFM1VkVlN0SUFXcWxaWkRjZFBPZjVyTEtTOXdqUmtHQmR6QW95eU9w?=
 =?utf-8?B?Mk1pN2c5aDhRM2Q0RXo3b21Cd01FSVR6UWl5NEF2ekhna3RMdFc3WUpKc3Zv?=
 =?utf-8?B?S2F5czhxQW44bFMvKzRYWFdKaUtyUFFJbE54UTZXelJpS0F0RU5vcjFjU3lN?=
 =?utf-8?B?QlBsaFI5Zkd1WXQ0RXpyUFFoR3JnNXMzdURyY0cvMGptcG50NStsSC9mbnp2?=
 =?utf-8?B?ZlNFSFJuTWd2YzZCNTBGdERZZFR0KzNITkJ1Y0RUL2NrVWZqOXdOYi9ib0Ry?=
 =?utf-8?B?NU5ZSWltVzBySjY5UzdoMGtkSlYvVzFFZGQzRnZvV1NraFkwNDNXa0RSQ0ZX?=
 =?utf-8?B?K3VIZ1ZnRm9UZFVvWHd3WUNBWDFzUHI4blhIQzhrb0VwdE9MUWF5N2kvQ0Fu?=
 =?utf-8?B?dDVHd0hvSlU4bnFvMXlFNzh5N2lpVDV0c1hYNlc2aDBCQWQxeXJ3NXp3VUVi?=
 =?utf-8?Q?9YW2L0iAyO5kdMpArexAy77zB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB257ADB4A4DB4498E1365A5BEC08971@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uZOX3Zzwhqud4rpRQTTCzRRkIY+YFdVeWIldtuNBvF7jUXogZUuiPXV0kJXIRmN0x+ZGJREd7X3BlknI3ERMMYoz0zF++WV1pucwFHoW93t1bX1dYpVG6g+4qso3yBLA0+fpMPA3NvLU+SUi+oqppaEYYXncCJF1LEY3StJ51u9iRdf8Dn4J6fQQbnpB+X+j9pu6oLKqg+hrvt6w0fV7dUnEaDvb7GSbZaU0e9cnlS39s9AjDzfzezAzGHV3NYNBLJH5upPZ8xKgU9tNuvSudfQe2HTE8UwB8wClkuDjBBXUiMcWWI/B7hzmeYc+q/zp7n4ge4uJ/TCJU+ZfuiJqn7HIKnOz6j8PG/jcHCVIleZRmkpKBfIvcnZ2mHUW7pZnIW0oP8YbkGguBEG6piu7YNELwFHuF/Ww+7OqO3ynvCx/1+Np78oRuIXFZK3qum3DYWYpf8mcFl+8V/UtVihPZVk56wE1M+tlPMLWCswdV8n8QhGjnpha6FCjSNN0Anwu55I5R2rt7AL2/FEYbxqfZ++nM3AQgpqk/QLhWgwnyI98vGCae57zxnxpBife4YGhtlB26nbe+mH0KFBtLstqVbqCszc9SssdO2ClxKRyELP/eNFpoCvllPsHZ7rZeBLy9AYHX0PlOs+ZkWLWisJqaw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fadaf754-b992-4243-aad5-08dd3f391bcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 01:14:26.8156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1+UGpZ4Ev4AKCFD8suyd5UcGTMDKBr/LJZ2ie8hQC/bNyy0ZuMFsL1VLdQEG7EFC1LOmxm3qxJ+BwvEj9zUNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6368
X-Authority-Analysis: v=2.4 cv=ZdDnNtVA c=1 sm=1 tr=0 ts=67982f79 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=I_mtzhhOyrhnmpxuOzcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: JlYWVp8Vqrsq6g8XMUuzDRVGVTJQ2hZM
X-Proofpoint-ORIG-GUID: JlYWVp8Vqrsq6g8XMUuzDRVGVTJQ2hZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_12,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 clxscore=1011 spamscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501280007

T24gU2F0LCBKYW4gMTgsIDIwMjUsIENhbWlsYSBBbHZhcmV6IHdyb3RlOg0KPiBGaXhlcyAuL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5oOjk4Mzogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9y
IHN0cnVjdCBtZW1iZXIgJ3NnJyBub3QgZGVzY3JpYmVkIGluICdkd2MzX3JlcXVlc3QnDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBDYW1pbGEgQWx2YXJleiA8Y2FtLmFsdmFyZXouaUBnbWFpbC5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggfCAxICsNCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5oIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gaW5kZXggZjExNTcwYzhmZmQwLi5l
Yzc0ZDU4NTkzNDMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ICsr
KyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+IEBAIC05NDIsNiArOTQyLDcgQEAgc3RydWN0
IGR3YzNfaHdwYXJhbXMgew0KPiAgICogQHJlcXVlc3Q6IHN0cnVjdCB1c2JfcmVxdWVzdCB0byBi
ZSB0cmFuc2ZlcnJlZA0KPiAgICogQGxpc3Q6IGEgbGlzdF9oZWFkIHVzZWQgZm9yIHJlcXVlc3Qg
cXVldWVpbmcNCj4gICAqIEBkZXA6IHN0cnVjdCBkd2MzX2VwIG93bmluZyB0aGlzIHJlcXVlc3QN
Cj4gKyAqIEBzZzogcG9pbnRlciB0byBmaXJzdCBpbmNvbXBsZXRlIHNnIA0KPiAgICogQHN0YXJ0
X3NnOiBwb2ludGVyIHRvIHRoZSBzZyB3aGljaCBzaG91bGQgYmUgcXVldWVkIG5leHQNCj4gICAq
IEBudW1fcGVuZGluZ19zZ3M6IGNvdW50ZXIgdG8gcGVuZGluZyBzZ3MNCj4gICAqIEByZW1haW5p
bmc6IGFtb3VudCBvZiBkYXRhIHJlbWFpbmluZw0KPiAtLSANCj4gMi4zNC4xDQo+IA0KDQpUaGlz
IGlzIG5vdCBhIGNvcnJlY3QgZml4Lg0KDQpTZWUgYmVsb3cgZml4IHRoYXQgd2FzIGFscmVhZHkg
YXBwbGllZDoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTY4NmQ0YTJjMjZiNDllYWY2ZTgxN2YxNmI3
Y2I2YzRiOTYxYWE3YTcNCg0KQlIsDQpUaGluaA==

