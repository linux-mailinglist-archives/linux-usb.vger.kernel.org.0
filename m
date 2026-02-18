Return-Path: <linux-usb+bounces-33428-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJhSDstMlWmiOAIAu9opvQ
	(envelope-from <linux-usb+bounces-33428-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 06:23:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4C51531BC
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 06:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 143E4302D093
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 05:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A832FE076;
	Wed, 18 Feb 2026 05:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iQLMp2w1";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="U+6NU75F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BuysUgF5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D4F1F1513;
	Wed, 18 Feb 2026 05:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771392196; cv=fail; b=oOubB3+44YPIqv22cmXHMqndrJWdZVA9OALVaXcj83+1ilh2JFhnqTOKCi24UVecYSsemWUoGu+suZ51bEUPom8JOH2ih0+UZXSKgjbKOuXPO0oy9BojMG85dAqJBfPbPAF3jwt1d6iO9exIDFg9wwEY13hk7GHmjhEbg6Y28lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771392196; c=relaxed/simple;
	bh=nOB2IgPtPtE8tnYjupkCHLbdGl28fjsM3aoYPEnO//A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OzJtTvEH3dXZD4r+eYkyqEQk7Dz3uRo9/OXtLxmaHeFJp2Srm6EXRcbbfgZw0enxD9yWIrGLC+Wyznzu5G5wO/eSjjX4II2Tt2Z3zXjsLCRg6oQzPfiAGik2uHOIurQv2MhVmi2u5eZpgpUAaXiqv+0X36omR0YG6hbkF9Hc+vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iQLMp2w1; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=U+6NU75F; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=BuysUgF5 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I1BEr3205514;
	Tue, 17 Feb 2026 21:22:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=nOB2IgPtPtE8tnYjupkCHLbdGl28fjsM3aoYPEnO//A=; b=
	iQLMp2w1kQbkXiQ3HHlPGZqWhFaRM0uAFz3KrwCi3mzuMrQ8YqHCcviLShFi1L4q
	Y3RTi7Cowi626hGvkvA3KCEvOKTbDUxng1CCKVu6gqc/eraV+Nb9UQv6VJfD3KqC
	VibF+16DvV6YrJ0GMLw7RssQDPufxyN+RqAJL2OGkw1G54EKfAKBn8KIX9dGii6F
	8SytmCFtUqZl6R/1uCzQ89+mlJ+/o8RlAQyjPuhEbNncsgz2RG+wHTmCOE4KZ8Eb
	1sg1hX/cWLCdzB8/1L8MX5jPYa5l6flJzB8eNbzlZ1QuKelbVJms4+wMDvvDpnrw
	arOJrwF8D/+k/uHWAIhGUw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ccx1tjpa6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 21:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1771392152; bh=nOB2IgPtPtE8tnYjupkCHLbdGl28fjsM3aoYPEnO//A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=U+6NU75FWCMYBrH9rFqRs5eqiX/bnQ2nk6r5yENSfGvpy9kthB6FyEbLKLNo/+ydL
	 /IJO+pDTJkg+a8RxE3W9tff4ecuNjEfH6yXoI+8/JPmVXfeyxHL1/Td9Wggj+r07ab
	 hjbvnzrxidm4GROZtu4WrY124/d0UoHwqLRz+F2sg1Cw5zT1l7qm14KVjJs4obwpt2
	 RUx/bwCX/Xxqh22wst9cYzlAhmwfkNX6v42qh7OpQ/bKkfdy8hZV2xrLsOn/NbRZf8
	 A7dhnfXM6rlp25WwtbI+VNXZM6xFdz6sUGB2guBPMGkkwfjTupJ0xFjqQ29OgN/rd4
	 f2RlQu+tDjqXg==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 25E9C4058F;
	Wed, 18 Feb 2026 05:22:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D6A4EA007C;
	Wed, 18 Feb 2026 05:22:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=BuysUgF5;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00107.outbound.protection.outlook.com [40.93.10.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3AC4E40149;
	Wed, 18 Feb 2026 05:22:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4bU3pgWbIWHTlQz9kez9foXBf9SxoQVcFou864dUReS7M3zUB8CKmn4y5Gwkz0zOaLfKhOECNkmmusjyo1V+Jv0NGz0APGGdig7oumFTy/bCcxzOQEWFO1iHxeo+6RpScuyPBUUuDEb/5dfoNFLNa2HWi3G0p6/rgX1ybeRg9sie9DKqfl+a5jYzAggLobpSBgljfJTm2vLON0Kt/UJh8Pn9Q/rzodtARrRkdXz9AAhixQ3tFN1z/Jm+mB04uduFJVHeDHLpFjjjzg9QZY9f0P4Z5vuzUev3uqDCtDmCK3QAgUz8IH3y5yQzntzfOuhMEJG31aRMrYel50UbqSMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOB2IgPtPtE8tnYjupkCHLbdGl28fjsM3aoYPEnO//A=;
 b=oZytIM4emO2oo2TUbkxJSNKdga+BEdUCvlCFvnqZf+rKsSzz3Hu8IlEFklrZYXlRHOOv41NvCtENLqda3KM13JD+/pv9MNHH5VvfG8MP2IFvLwPoL9KMPN//JbG/2axIe1fVd9Pj+0LbdDnIkE6Pqt4qWYkZ/n4DbXWnBFLgbJlFdp7VmevMbdDtITJWEcuGo7bgEWK502sYACquMAU+B/qa9TDeBoR/S9nv940tHiFhZvuIoCpgX8upXVnDp/9kY7OfNM7HXAfKH+fjxPU3gz8Ku3T5WSROizFjwOqRHT8j823XaoxyhMpu+zQsVySp+v+J2tBMZgwVpe/35Cua7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOB2IgPtPtE8tnYjupkCHLbdGl28fjsM3aoYPEnO//A=;
 b=BuysUgF5WE52CPuv1fzvTZRGnILzcG+y5PgaB6uCvHWV9CzeFGx235IgtPNe2S53ZgK7pGhTeQQC//9oBkPTxIORiaOP2/KMQ7XkQPMofqgoul7Mlxyr1nGaFgSbz+kBN5/DG9T+oI1b9c5Q25vfLHCt6F9+a5TvctwD6ss/2Xw=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 CYYPR12MB8924.namprd12.prod.outlook.com (2603:10b6:930:bd::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.13; Wed, 18 Feb 2026 05:22:21 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691%4]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 05:22:21 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen Yufeng
	<chenyufeng@iie.ac.cn>,
        Nicholas Bellinger <nab@linux-iscsi.org>,
        Andrzej
 Pietrasiewicz <andrzej.p@samsung.com>,
        Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in
 nexus handling
Thread-Topic: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in
 nexus handling
Thread-Index: AQHcn4Wvu8qf06pbZEWeYsPWKDmbZbWH7g+A
Date: Wed, 18 Feb 2026 05:22:21 +0000
Message-ID: <20260218052219.l7gfndrn5e4h3qe4@synopsys.com>
References: <20260216204848.10748-1-jiashengjiangcool@gmail.com>
In-Reply-To: <20260216204848.10748-1-jiashengjiangcool@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|CYYPR12MB8924:EE_
x-ms-office365-filtering-correlation-id: 9b845e1d-09ed-4b42-10d4-08de6eadb11a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?V0F1ZHJ1T29mblQzWFNBZnoyZ3BJUTR1TDBlTUxVdlBXNTNjdVBZRG1ZZzJE?=
 =?utf-8?B?L010RjZBeXZWOG5RVmIzUnNscmMydWc3eHV2bnFoamhvS3JJRzZ3YkxBU1Zn?=
 =?utf-8?B?SHJGNVlCVldTekFuOG9TNnY5UnNnQUNOQkJBanoyR0RzYkx6WkJHZTJkOWVI?=
 =?utf-8?B?MHpDYVpZN3ZTNWxQTGs2VFk2eGpoRFRPM0FGaDh1YllXYTJhUE9iNy8wNWQr?=
 =?utf-8?B?SDZuRzQvc0JvcnR2RVhiZ1krNGdWYWlOeFpWeGxXb09tdTlhbFo3MkN5QWpV?=
 =?utf-8?B?U3dMeU5NcFZ5VlhCRlRHTjBpSnpwbDU2aStiRVhQRG9vTHlLLzlxSjJ2ekVF?=
 =?utf-8?B?RThuUnFUTm4rNytJVTBRSnJST0YyVkxWL3JIemZic0pISlFKOHNRMnlEVWk0?=
 =?utf-8?B?ZG5qcThqT0I3YWcyS3VDMmRjb1FkaXdXYkpsNVZ5VnFOODRobVVsb254Z2dy?=
 =?utf-8?B?K2J0Z01JNTZITE95YVc1UGtOVTF0RDlpQ1QvOGtBMXl1T2tiUGl5T1hTaUpY?=
 =?utf-8?B?Z2I3WlhwcFBEUFB1NGdvVEo3ckgrQmlEWFZBUjE3ZFQzZ0JwbkF1OWh3ckhh?=
 =?utf-8?B?eHRVYURicHF4ZUZMMnI0V0N1eDVOc2hQQjAzQUNIZngwakVlRE1aeWJOVjBK?=
 =?utf-8?B?M2NDZGRJS3dkbnVGbjI2TUpiUDRud2tYRXlIL0h1bU1HcWRta2NtdU53VlJ0?=
 =?utf-8?B?QkFmNStMV2RSVTRBckM3Zno0L1hzUXUyeENYbmZwWSs1VW5FVjM3dHR1dlZ3?=
 =?utf-8?B?N1ZaS08zZm9qdFBRK25vbkw5UHZWWnFaNGNVOXp5bWthU0EwbkJCUGx3SVB1?=
 =?utf-8?B?c2NFM1ZoUHM2RVVQdURhOVpNTCt5bVJ2THZwNEttLytsbjZHTEVQcERGQTYy?=
 =?utf-8?B?aENNYXFMQ1hBUWlKQ2tNanFteEtMNXphRDJHL2hwRWlrNlo3eUtjMXJJWU4x?=
 =?utf-8?B?ZFdKa2pkeThxTytId3JWdUU0VnNCZExWcm95RG1aNjlYMjFJSkVvRXNMZE9C?=
 =?utf-8?B?T3hsVktwYlBSUjFuVUdQcmhlaEZONDhlcVkwTFltaGg0dExSUThjOFJPMU9k?=
 =?utf-8?B?VVhDQ1hlRkR1OG1pSzY1cjNibGc1a1ZCc2FjYUNGQnVyeEdsVVR0UXJMWEJ3?=
 =?utf-8?B?ZHpabjJHbGFZdE5CVVQ5S3VKallJU1YxcTlGc1VCSmhsN1pmTnhkZTZKVndO?=
 =?utf-8?B?VTNzQ2R3ZS9SanZ3c0loTVRNa0FnUFM4YlZCeGRCdTVpdnBwaFlMRktXRnlC?=
 =?utf-8?B?L0VIOHcvMVg1SDlrcUJKSmsxd0ZNTFlPR2ZCaDM4MnF1RFdJWEhDaElXVVAz?=
 =?utf-8?B?RlZoaDdWWkJscElJdEVJQVRHVXVZTEs4dmZ6cFFFd2liQitYcktDcVhSUXhY?=
 =?utf-8?B?WUZRdkx1RDJtWVc2YTVrQlF1RHpsM0lXZ3ZkaE1mRDVXZnhLQUJKcDJoZkZD?=
 =?utf-8?B?bDg0WmxMRmU5UzZWMjVGMUg0eVhkY3IweEwvT0FKVEpvd1pPak53WDBFK0Vz?=
 =?utf-8?B?YjY0U2dURFk5cENoVC9LWVZTYkZzNzBmZUFrWmpnQnM2LzdpRmdzVHV4c1pr?=
 =?utf-8?B?MTVUdDVPRFErM01kbG0wYkZadjhhK09TVGhhOFkzMHkzbno3TzA1YjMvUFdQ?=
 =?utf-8?B?WVA2R3Y0cUhOa3MzWXZFTWlETTRsRUkrOWw1T3JuYUxOUE1IY0xFWmZhVVpm?=
 =?utf-8?B?ZkdyM1FPR3VuU3VwbVVBTzZtRkJaSEk2andWcThCSXlFejc3Q01XMlc2dkk5?=
 =?utf-8?B?UFoyTUhwY0ZUa1lLL2kzWG1ZR2VoNzhLeU4rd3dGa2xLeEhtaFlsVU1WVUJs?=
 =?utf-8?B?a2FVMGw3Q2UrZWpvdm1zWURnRzRZS09YOUZuWEtxYzdoOGN2MEZyeVVGT1hl?=
 =?utf-8?B?aklzeE1VSXRhN21IdlZjRTNDSUFMTlFUYmJTTmxWN2FlZkRuNEk4cmNPb0g5?=
 =?utf-8?B?cFExZEdYZmw2a1hMd1F3L014Q2lZOWFJN1lnNTBlU1ozK2VnTmkwbG1xREFz?=
 =?utf-8?B?SnVVSHNVVTBmbE9qam44VWx6eCt6T2lNYkRJd1h1bE9QbUpvNkpQTDNpeHcw?=
 =?utf-8?B?YU5teXlPVGw1NTN4K3U0a3E0QlNJT2RrTE11cC9lcWV1M3JWazJQNlRWWG5V?=
 =?utf-8?B?U2FMZk5SQjlueWpuZG55cms5dDF5YzlxbmgrZ05kOFg0cERvQVY4djEycnpv?=
 =?utf-8?Q?7cKogD1NDzwqFUY+gaTgkxY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZkRoeXVzMlpFUHdoSUJ5aDlCOGpBZXRyTXRNUktaNTVtOUp4VlV2aXFzMjE4?=
 =?utf-8?B?MmJrUXlJZFRhQVJhTkNjV0xoM2ZLOXg1Zk5Vb0tJRGdKdjNIWWcrdzFNeGdt?=
 =?utf-8?B?ZCthb2RsZHMzQWM2enhZb25JdmRuMkVRREZhazNiMmlPUHlIZWh5aEdBdy9k?=
 =?utf-8?B?bGNmS1BMVUU0ai85bytHL2ZOZzZmcmxrN2QranFIaWZ4b2dhcnM0bW9COWhN?=
 =?utf-8?B?R0FtaXF3ZDVpeEVhS1drNE5PaTBqV2VVYnRSS1VwZFZvZW0wUGg5aDMvVGtZ?=
 =?utf-8?B?QlNLd2JrQUxEQldoaEZIUStoWG93UEhZWEU2MlJqTGo0MEhtVmEyQ0xXMG1x?=
 =?utf-8?B?d2lGdmhzaUdneS9HT29RYXpSQ1pndHpndHA4UDRtNmpCODJIaGZ2SGp5dlgr?=
 =?utf-8?B?b0pWT0UzeS9mVEdXQjNuSExjcXZDa3JOaHc0bVh6KzhHaSswUGN3TjBmUTlm?=
 =?utf-8?B?L1IwZzdUTHpNNTc2ZHRidExXTktJdkdFQWd6ZDZmakZOQWFSWWhhbzNyOUJW?=
 =?utf-8?B?WXdqUlFzbG1uMHJSaUZ3c0tCTGlLTXJDR2JaWTYwbjJVOHRqcVZRSm5xckNR?=
 =?utf-8?B?bHd4SHVKZHg1aTliZWk3cVB5OVZjVVlsUEJXaG5sWGtscFpvSGFaQUQyMXl4?=
 =?utf-8?B?U0tzMlVQRlRZcHlDM2d6MllnVFpoWWhrNVp2RkJKZ2ZpT1lYTDZJNnJlM2dk?=
 =?utf-8?B?MG4xb0JVSFJ6VWVrYmtTcXRsTW9haXVqajkvTEU0Q0d5Z3VCeVFvd2M1MUh5?=
 =?utf-8?B?cmZGRHFSYmlJZFRkVlRDUTVWRFFMdzcxSElIZGFtelh1UHVlbXR2Z3NXaFZq?=
 =?utf-8?B?alY0dlB6TTVyelhKOEM2Y3hSRFNIV1hIb2xnZHFVd0syUUhLWVdMd1BiVzdO?=
 =?utf-8?B?SXFUTmtGWlpqYUFhZWFvczVzbzVuMUF5b0xMQ0tkeS95UmkzVDR6TXN1b2tu?=
 =?utf-8?B?REUrTmdxMCt0cXVQL01jUHJwdjhOdTc2Ri9wc1RRb3p6a0hoSC9LVitPNDlo?=
 =?utf-8?B?M3RKL2JxdmFua0xiSUo4Z3cyNlpQdEdFalNQYzBpd3lHalB1ZzQyQ2pjTkR6?=
 =?utf-8?B?Y0dLems5L2I0aEhPcG5Fbm5lS0RpUll6UVBReU1sTy9SS0FJV0EvV2dVN3RU?=
 =?utf-8?B?bG42aVZkaHlyUk8wU2hOcllpMDhiYWEwS0kvcUlBdTZORkVvcjJzeTlHOVFT?=
 =?utf-8?B?Q2wwSktZOW1sbnhObFZXZ2w1dEpqRWJiOWlib0VDbzk5UmZSWjJleTlDSG12?=
 =?utf-8?B?RWRqRDV0YkRJODFjWWw0VlFwL3c1YlUrWlQ0cW5iZjNSbnZ6M1pLWHVOMHUv?=
 =?utf-8?B?OHhGaWU2K1c4SkNmU1R1aThWKy9CYVUzcTNwcHVzd0pRZUpwaFcvMWFpaEdi?=
 =?utf-8?B?Q1o3ZzVjYlNnT3hZWXlWbnN6dTVmekUrRG82WlRnd0FvL1ZPN0g1T2tKdi9S?=
 =?utf-8?B?ZUNmUzlrd0dWUWtKeWhwS0VlN3RqVHF0WUZicFJOQTltYVNZWWRXc1dab01O?=
 =?utf-8?B?NnlQemZkVHFUSTZ5aHJwclhkZlRRTDhCOUpEa2daS0dJdjMwWUhtNjdwU1No?=
 =?utf-8?B?STJheXQ3Y29KQkpmZHZnNTFoQnp0azVKU1puTnBrMEw1YXlHWW9Fd21CUDgv?=
 =?utf-8?B?bXVTbS9USlBJMVJFKzJXRW1nNXNVdzJObUFmckNiVmFUWWhZRndDS0dXZWkz?=
 =?utf-8?B?amFuR2lLYXhodlMyMnZYcXhNT2JFN3dESmpqSzVuVlJSWDdiYUJZWkgxZEcz?=
 =?utf-8?B?SkxqWG4wUmE2QmJrR0U4YlhPUm5ENG5ncW5peFZ5UzQvb2dwVUswdW1oN3dq?=
 =?utf-8?B?SGpSWWY4UG1YbHVGaWtSb1psY3UvRXdDK3R2aDVaNCtLWlg3Wno4azhkbmFs?=
 =?utf-8?B?aWZONzh1ZytodXNxRmRueWtmTEd2bERSTTE2Q2o3cTdNWFNIdWIzejJuZ1hh?=
 =?utf-8?B?MS9MNW1qdy9SNTl3Uk9DN2VCTS9IaFJmcnpVS1NMa1dSVXdTbkV6Q0dXR2hk?=
 =?utf-8?B?WlZmNEg4ODRLQWo4RkJPZU50MjA5cjRiR1RFMjlQM0t6T0JPNytPU0Y3Y0pR?=
 =?utf-8?B?VDJVK2F1OHl4YzdvSEtseFdqS3paQmxndi9LRGxuMEJCOHExL0gvbEp2TkFV?=
 =?utf-8?B?ekhjK1A1ZFBNVkRoNmQrUjdvaks3S1pIZlNlalhsazVNaEhzcko5aXV0ZDV4?=
 =?utf-8?B?UkwzemNWSVVvQXpJVVFVaXBiUHdneVp2R05DclVlREd1TE9sOXBDZittU1lR?=
 =?utf-8?B?aHczNGMyUjdOQk5OcUR1ZHQyUEl6N0JoMURwa3h1anZpRWRjWk5VczhxUTcx?=
 =?utf-8?B?NlJ6UVhhbUkzdzEya0NVekRENFJpSkp5R2dHSExzS2FxaDA3bUtzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED4E7EECBCE82147B966312ACC26ED30@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/h3hB4/Ud53kg/acdgfxK7+eeKkIF55XGvab05VYYouHUjv7w8omTkXr/I2Fthg++/zWwZQ074LiGdd52sv+QWeACTxqZg/2TOKYsSS4zYghbhzHHJnOempI0KrfD3K34BNt4JXix66q6RE8pkYDBpoBudtQzLdF86hm7VSbHMW9E+euDKlBiWPvZQFh/XJTwAfiIi6BoaPSt9DOiha4oe1GLd8heZsXuNrJwaA2c+MclGg7m6og0neSUFtVuizU1dL7MiesJWUC0HJJKRwwxaLBKD+7arHX7Gj9+dMZdoNfc422F6Xku2acA09NX0PvnXF/JjKE/H4EEHk1k0YvfpxobbgA4+K2EzQ8e9WGa1D2Yk3Aaz703L13d2eylT9MUqYOTguLOVIWFEWgefthD7lWdNgZZdbj4BRZb5If9ia+xjv+0KNSjtnn5TCv8R2KJxTAflm+ysZfj2e7o+SciLTVbZjkTawOxO2vOc6MjRslQTTU3fPXl1Lvr5nhQIjJTarGCt8qg8Jjnb4WmINdmiQTpKRqdrA9BD3hQUWR02MnmZUG1BPahzDx31Jykj4IsYNcn52iL6GyT3bxbDpczSmsDEXRyDTP8P4W5rlsjh+d/MdG6/SRdwZAB8ODgiJBiJkzJmhOTaNjSwcU459utw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b845e1d-09ed-4b42-10d4-08de6eadb11a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 05:22:21.2842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vr2x24OBo8KYPqj+XiXGYLeuxreUZI9E4xa1iN6JXkV3zZIOJCx055XUxnle8X186ubmgTtfqivnxWIUXydtEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8924
X-Proofpoint-ORIG-GUID: 9LPZdAwKp0sECX6WX_3LF707GQundRK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA0NCBTYWx0ZWRfX8zm4QMW9UKtf
 +WRbRIrSwOykY1UL5iR704gj7nExR7JITwTnQjyC+pKMXK9bVtZOe6GFipNx7UDfEu+JaJm09uh
 wwnoxYVRZZY+eZDSMc+QWrDjIMHZdAHuxcra+IL5aMRN9Mp3mMwCJ4fd391OrPYMeeYx4am8TI/
 9IKMZGTy7cD1IR+RwrDDUt8UCr5M5wtmiFrG83kXR8ofV+EA55kV/upXS58ERqFN3nj74DTJ7AN
 T24351Xcdnh7Qsg47+6w8+KoEzOiQCWe8zEF3TBV8PXnAN+bh9yhw/LNnPQ2ZrZ1jhxhKjeJ4Cy
 EaZj0ZbGBv6yfhZ7I6EqVT02Kb0VjxpCYOK0rUXXCNNWghQ5xrzL46d/NbmbFU1wLY4/vcLm/oc
 004FRkBPdP3l2pk44vXS+sY1aWFHqPKvcr8jTG2OFKcCA9WP3EwSN/vcHDiFJop9hilMAMCHTnL
 +zk2JwBm0bI+xkeuAXg==
X-Authority-Analysis: v=2.4 cv=AZC83nXG c=1 sm=1 tr=0 ts=69954c99 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=yCWK0LWkn9MOfIs9Db0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9LPZdAwKp0sECX6WX_3LF707GQundRK_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 phishscore=0 malwarescore=0 adultscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602180044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33428-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:mid,synopsys.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8B4C51531BC
X-Rspamd-Action: no action

T24gTW9uLCBGZWIgMTYsIDIwMjYsIEppYXNoZW5nIEppYW5nIHdyb3RlOg0KPiBUaGUgYHRwZy0+
dHBnX25leHVzYCBwb2ludGVyIGluIHRoZSBVU0IgVGFyZ2V0IGRyaXZlciBpcyBkeW5hbWljYWxs
eQ0KPiBtYW5hZ2VkIGFuZCB0aWVkIHRvIHVzZXJzcGFjZSBjb25maWd1cmF0aW9uIHZpYSBDb25m
aWdGUy4gSXQgY2FuIGJlDQo+IE5VTEwgaWYgdGhlIFVTQiBob3N0IHNlbmRzIHJlcXVlc3RzIGJl
Zm9yZSB0aGUgbmV4dXMgaXMgZnVsbHkNCj4gZXN0YWJsaXNoZWQgb3IgaW1tZWRpYXRlbHkgYWZ0
ZXIgaXQgaXMgZHJvcHBlZC4NCj4gDQo+IEN1cnJlbnRseSwgZnVuY3Rpb25zIGxpa2UgYGJvdF9z
dWJtaXRfY29tbWFuZCgpYCBhbmQgdGhlIGRhdGENCj4gdHJhbnNmZXIgcGF0aHMgcmV0cmlldmUg
YHR2X25leHVzID0gdHBnLT50cGdfbmV4dXNgIGFuZCBpbW1lZGlhdGVseQ0KPiBkZXJlZmVyZW5j
ZSBgdHZfbmV4dXMtPnR2bl9zZV9zZXNzYCB3aXRob3V0IGFueSB2YWxpZGF0aW9uLiBJZiBhDQo+
IG1hbGljaW91cyBvciBtaXNjb25maWd1cmVkIFVTQiBob3N0IHNlbmRzIGEgQk9UIChCdWxrLU9u
bHkgVHJhbnNwb3J0KQ0KPiBjb21tYW5kIGR1cmluZyB0aGlzIHJhY2Ugd2luZG93LCBpdCB0cmln
Z2VycyBhIE5VTEwgcG9pbnRlcg0KPiBkZXJlZmVyZW5jZSwgbGVhZGluZyB0byBhIGtlcm5lbCBw
YW5pYyAobG9jYWwgRG9TKS4NCj4gDQo+IFRoaXMgZXhwb3NlcyBhbiBpbmNvbnNpc3RlbnQgQVBJ
IHVzYWdlIHdpdGhpbiB0aGUgbW9kdWxlLCBhcyBwZWVyDQo+IGZ1bmN0aW9ucyBsaWtlIGB1c2Jn
X3N1Ym1pdF9jb21tYW5kKClgIGFuZCBgYm90X3NlbmRfYmFkX3Jlc3BvbnNlKClgDQo+IGNvcnJl
Y3RseSBpbXBsZW1lbnQgYSBOVUxMIGNoZWNrIGZvciBgdHZfbmV4dXNgIGJlZm9yZSBwcm9jZWVk
aW5nLg0KPiANCj4gRml4IHRoaXMgYnkgYnJpbmdpbmcgY29uc2lzdGVuY3kgdG8gdGhlIG5leHVz
IGhhbmRsaW5nLiBBZGQgdGhlDQo+IG1pc3NpbmcgYGlmICghdHZfbmV4dXMpYCBjaGVja3MgdG8g
dGhlIHZ1bG5lcmFibGUgQk9UIGNvbW1hbmQgYW5kDQo+IHJlcXVlc3QgcHJvY2Vzc2luZyBwYXRo
cywgYWJvcnRpbmcgdGhlIGNvbW1hbmQgZ3JhY2VmdWxseSB3aXRoIGFuDQo+IGVycm9yIGluc3Rl
YWQgb2YgY3Jhc2hpbmcgdGhlIHN5c3RlbS4NCj4gDQo+IEZpeGVzOiAwOGExY2IwZjY1ZmQgKCJ1
c2I6IGdhZGdldDogdGNtOiBmYWN0b3Igb3V0IGZfdGNtIikNCj4gU2lnbmVkLW9mZi1ieTogSmlh
c2hlbmcgSmlhbmcgPGppYXNoZW5namlhbmdjb29sQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl90Y20uYyB8IDEwICsrKysrKysrKysNCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfdGNtLmMgYi9kcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24v
Zl90Y20uYw0KPiBpbmRleCA2ZTg4MDRmMDRiYWEuLjk1NTRkZGQ5YjRiOCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy91c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfdGNtLmMNCj4gKysrIGIvZHJpdmVycy91
c2IvZ2FkZ2V0L2Z1bmN0aW9uL2ZfdGNtLmMNCj4gQEAgLTEyMjIsNiArMTIyMiwxMSBAQCBzdGF0
aWMgdm9pZCB1c2JnX3N1Ym1pdF9jbWQoc3RydWN0IHVzYmdfY21kICpjbWQpDQo+ICAJc2VfY21k
ID0gJmNtZC0+c2VfY21kOw0KPiAgCXRwZyA9IGNtZC0+ZnUtPnRwZzsNCj4gIAl0dl9uZXh1cyA9
IHRwZy0+dHBnX25leHVzOw0KPiArCWlmICghdHZfbmV4dXMpIHsNCj4gKwkJcHJfZXJyKCJNaXNz
aW5nIG5leHVzLCBpZ25vcmluZyBjb21tYW5kXG4iKTsNCj4gKwkJcmV0dXJuOw0KPiArCX0NCj4g
Kw0KPiAgCWRpciA9IGdldF9jbWRfZGlyKGNtZC0+Y21kX2J1Zik7DQo+ICAJaWYgKGRpciA8IDAp
DQo+ICAJCWdvdG8gb3V0Ow0KPiBAQCAtMTQ4Miw2ICsxNDg3LDExIEBAIHN0YXRpYyB2b2lkIGJv
dF9jbWRfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ICAJc2VfY21kID0gJmNtZC0+
c2VfY21kOw0KPiAgCXRwZyA9IGNtZC0+ZnUtPnRwZzsNCj4gIAl0dl9uZXh1cyA9IHRwZy0+dHBn
X25leHVzOw0KPiArCWlmICghdHZfbmV4dXMpIHsNCj4gKwkJcHJfZXJyKCJNaXNzaW5nIG5leHVz
LCBpZ25vcmluZyBjb21tYW5kXG4iKTsNCj4gKwkJcmV0dXJuOw0KPiArCX0NCj4gKw0KPiAgCWRp
ciA9IGdldF9jbWRfZGlyKGNtZC0+Y21kX2J1Zik7DQo+ICAJaWYgKGRpciA8IDApDQo+ICAJCWdv
dG8gb3V0Ow0KPiAtLSANCj4gMi4yNS4xDQo+IA0KPiANCg0KV2hpbGUgdGhlIHBhdGNoIGl0c2Vs
ZiBpcyBmaW5lLCB3ZSBzaG91bGQgcHJldmVudCB0aGlzIHNpdHVhdGlvbiBmcm9tDQpvY2N1cnJp
bmcgaW4gdGhlIGZpcnN0IHBsYWNlLiBUaGF0IGlzLCB3ZSBzaG91bGQgZW5mb3JjZSB0aGUgY29u
ZmlnDQpkZXBlbmRlbmN5IGFuZCBwcmV2ZW50IHRoZSB1c2VycyBmcm9tIHJlbW92aW5nIHRoZSBu
ZXh1cyBpZiB0aGUgZ2FkZ2V0DQpkcml2ZXIgaXMgYm91bmQuIExpa2V3aXNlLCB3ZSBzaG91bGQg
cHJldmVudCB0aGUgZ2FkZ2V0IGRyaXZlciBmcm9tDQpiaW5kaW5nIGlmIG5vIG5leHVzIGlzIGVz
dGFibGlzaGVkLg0KDQpCUiwNClRoaW5o

