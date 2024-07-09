Return-Path: <linux-usb+bounces-12087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAD792C633
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 00:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE7F1B21FEA
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2024 22:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1AC185600;
	Tue,  9 Jul 2024 22:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vChbSG+l";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ye5I2qwW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bWZQS8uZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646841B86D6
	for <linux-usb@vger.kernel.org>; Tue,  9 Jul 2024 22:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720563612; cv=fail; b=T0Vy8IuBYOwmuxyCY3jmCk6TyXrZ6/B/zXQkrFwdr8jluSzPXDlz4AeXfIRGdAN4IkF8NWSnGzXL9bsDKU4bHrupiKzsXJca675xji8seZ1tJI8v96ZWnO9pduak8hOFC15fTdg3rtDRw0OWzCdyoricPnK4vuULUoALnqvQdb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720563612; c=relaxed/simple;
	bh=0h0nbIn3W8GRdCrmxZKKhapt/b4sFm9+xxuQ0/MIgRw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fUao/O1Oyy3fCucubsaW295+ggJNOk0XgOI7vyAmhM5MdNM2cFW0LJCre0zbDqeKQIS9EJmUF3CnQsZoCNW2bkSQvy3gu7fttXbDfqM5oMqObv4sB7xuAnLirgrAuU7ycPJZtiMaszD92DWVxCI0GU6yy0PmznSl3CKsdqTo7ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vChbSG+l; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ye5I2qwW; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bWZQS8uZ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469LWKAS016885;
	Tue, 9 Jul 2024 15:20:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=pfptdkimsnps; bh=0h0nbIn3
	W8GRdCrmxZKKhapt/b4sFm9+xxuQ0/MIgRw=; b=vChbSG+lY2KvQDVwhMYbUMHY
	GDkIsNX6YgQoC3M5UlM7ec5UdLH/CgVFoM0N6J0/BTa7dhQaovavQ0U7AJX6dw7y
	sKwW3vOHGOkKIARK+Kv2RYxCeNnQS/j9NV5mKM8iUbn7oIZhV5uBdwiCPFqn4qLF
	B+/XVF1kJnuLMwChFW/l+t3mLNamYP1ibCWwsRrEkJD96SZK7Ws/Mu1gTfuF+oVZ
	D9JLclSa8oBJUD/6FDT1kjKdlR7eTrFP4YwfFYE2l0OVMT4BJj++eppRr5XNhccs
	elHTEtE2QqFgFPZaHL3DXxBSuPBl4D6UFXGVszlCH/cjQPtPa/+Y3W/G6gtVug==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4074jcpks2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 15:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1720563607; bh=0h0nbIn3W8GRdCrmxZKKhapt/b4sFm9+xxuQ0/MIgRw=;
	h=From:To:CC:Subject:Date:From;
	b=Ye5I2qwWS9IHB2vSiVtj6DWVImgf/IdC/m+Hd5YDwKb6P00UxUsh+NhZunrHoy/rm
	 f2LU716EwV++9nCoi0t6fB5laBmB0Q4NdtHVCUySZ9K7COheEo4g5e1IaDtu1Ba5Om
	 ZUgr3S/6Qs4vIQm3tRG2yrMlY7EsBbtvLh2UWodqgmMq2phPZaUy+btOZOIB5dpK6G
	 4pO3ESvBKM3Ru7Vn9xm9jqwKuycfsGRA2/g9PQc4BqHTlKJQB0cOJ6bUoSCK516GCe
	 lO03gD8SvdMiczuuKcNWu0NaWmUYSJ2nh60xTcPxCdqHrqp7USyDhnTnNLBZFIl0Jn
	 sEX28B9Bl9JvQ==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 47E0040408;
	Tue,  9 Jul 2024 22:20:07 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C3E14A0084;
	Tue,  9 Jul 2024 22:20:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=bWZQS8uZ;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 85DAA4056C;
	Tue,  9 Jul 2024 22:20:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq8eE13d2GAmCcNuhkoT68tCgtrGclIm9d50jtr3xClMgMO/cSaek7UiNg+NWzC4ITALK71s/AZ8KHqcJpNUzqLHNq/VnsUaESisN2PuOpxdtx2/ZQ0And6OhdXJOw0YVV6dUMe9R71RuDBJjCRC81Lr2sJ7fEfxa4LSIsBcwl9R3utdhTP8v1qPRdm3WXqZlE1OacfGdqFrlErL1zx6t5cCaFGa054B2Dj4fJlWNucisTh+vJLh70S1zoHVT/1+rJq5ASiH6drIw2Fg4/EfNpWpBlhVpbXO0xkOQYHFxWn1ya8a776Q1384NuHLKpMey0L6myMWw+kH4e8LgTwNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0h0nbIn3W8GRdCrmxZKKhapt/b4sFm9+xxuQ0/MIgRw=;
 b=c3805/1dJLoZWxy0Srbp6ilkhviOwmRGIYngZp4hr+7o/DabZd+162UfTgiEW8H6hMirletcC8lgUs63Etc7+7p6ojcJMKdujRmaGWG6lzbE27vwlhBJjBLQ0Clv8A5DAnV3ibDBc18VNBe6Dd/BcmUE+LoXs731SPIbuu4AcePjXH+IQNsKXZcQ7+P+U129j1AKpUjQDp8+nmLzwDf0o7gvFrGzMY1tHpeeY8gzAyXy1VrrYfGmGGaQe/mMUHHE/eIgoYc+PUIdfKjkWPjtWcvgeudV1WZJRgkNhS7XpapdiMtV0rGyk8G4WTjTzFT1+Mzw89KMQVMSgw4TM0ZnFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0h0nbIn3W8GRdCrmxZKKhapt/b4sFm9+xxuQ0/MIgRw=;
 b=bWZQS8uZpfA9YSjgwuUKruzxhjreLXUNfNSvBB75U6mCXlaM/n3pVk0bt5M9i8jUBqVkn6Wi9FwPwWHMLX5ZyGdaQgtkpiaynzFlig50+rpndN6Od/lEQloQcVtgxaY/l2C2ys1lGZ0MNaMrE7Brn83fmXBBqoq8ymtc75LB798=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 CH2PR12MB4232.namprd12.prod.outlook.com (2603:10b6:610:a4::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Tue, 9 Jul 2024 22:19:57 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::e2e0:bc6d:711f:eeb]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::e2e0:bc6d:711f:eeb%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 22:19:57 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: dwc3 maintainer will be back in 2 weeks
Thread-Topic: dwc3 maintainer will be back in 2 weeks
Thread-Index: AQHa0k4hkz02to0tyUyoQNW5n8FEqw==
Date: Tue, 9 Jul 2024 22:19:57 +0000
Message-ID: <20240709221953.wcxtlyc76kjlzc46@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|CH2PR12MB4232:EE_
x-ms-office365-filtering-correlation-id: 11319d02-ee5d-4e4c-72b0-08dca0654407
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UkphZmRtSVMxdmZEOGd1RlZEelZvd2hqMStvSWtwKzIyKzFNZFdPRVJqY1Jp?=
 =?utf-8?B?dGEwY1kvYUwwN01JSW5xUnRLZ3liaDJRSjFCVDArSWpPaWlNc1U2ckYvbDRa?=
 =?utf-8?B?bklJNSttQ2pFY2o3L0RXQjUvaEFqUVhKcUlrSDdNV0x4VVFwN056WEREWTVN?=
 =?utf-8?B?S0dJa01DbVJPTlA3SkZxelk3VVJUdWNvdnNad01aTTFJNFBNRGFhL1ladkdv?=
 =?utf-8?B?N1laWWJGOEVvVEVPOHNxZXg3b01mT3FRTmhEK3lKM25zc1NQUWVrdVllVjRw?=
 =?utf-8?B?Qmw1cnByRExzN1hPT1hEVVVHMzBKcFdHNlorMWlCOFdQTGRNdHh1clY2aXhL?=
 =?utf-8?B?amZQWXNEdTZ1NGxXNG41RTgrYngvU0Y3NlRWRG1Yd3BNZlBZYkhhYndOaFRp?=
 =?utf-8?B?d3pOYnd2enFlb0JXQ1Q5MVV4YkwvUDRrZW1ESjAyZFhxVUF0SGIxWWJ5TTk1?=
 =?utf-8?B?dmRpMlo5bklwMGk0MzRqSXFhSmxDN2pOdGg3b2xHNklCQ1BhTXNjcHRHNGlI?=
 =?utf-8?B?VnlrNDNKZ0xRNnZVWmpOZUhOajRCMkZ2MHFsanNBYldoSmpLcE5UaTJjemR0?=
 =?utf-8?B?ZlZ5R3hTN25BRUcyeXorWURTMm4vczYrVEJ1ZFNsWlFiL3liRksvR1JybEJI?=
 =?utf-8?B?TW5rL0NPS2lGRFRzVm1kUE5OMG16USt3NkdtU2crZTQ4d2NtSXZZNWsvSDZZ?=
 =?utf-8?B?K2dDVHpNVFhDL1l6TXBZV0JMUC9vVllTeXlSRW52SE4wbUpQUnZyTm91d2gz?=
 =?utf-8?B?ZFZXMUxZZU5kVHh1TDllUnZTcFBzeld6ais5Z1J5bG1RRy8wVjBmek1Vanoy?=
 =?utf-8?B?djcrUUUydFZ1eUFhWmtZS3BBZzFXYnRHdUg1bTVrWUZFMEZDNHQ0MFAyWFhq?=
 =?utf-8?B?THdETkxEY2lHYVVuNC8zWTM0ZlJDamRXREM5REVyMDVtLzh4Rzd3cUpSZkt5?=
 =?utf-8?B?bHNPdyt0OUUrWHpMbVd2ME1ZSDNzMlN0SndhQy9ZOVpJM3pNOFhPOFhreEgv?=
 =?utf-8?B?QVVabURkQmE4TVUrWWx0aVl5aWptWUtZS2ZzMkpNSUlXNStGNWdOL2hmS0xk?=
 =?utf-8?B?Y0krTUYyVEc1bjFvc0VlVElmemFaTFNhckhnUDB2WDNaaFY2ZTRjMUsvMC9X?=
 =?utf-8?B?ekRQdGJrVEtYNG5VUG1mMXpuelRTVTQrWnloY3J5Y1VSQy96TWpHWjRQOEhF?=
 =?utf-8?B?ZVp4aVh4bTFoKzVPMHRxWEUzMnVoaCt1QXpUR2hDMVRJaWRVVWFlU3ZqN0lB?=
 =?utf-8?B?UDZwQURrRU9oTnBwWFRZV216SVMySGU2R2NTRGF5SWx0SUNrOXVzOGdJVldE?=
 =?utf-8?B?dzQzRlExS2daUkdSKzRxdGkwelM1OUlLemw3VzRFSUl2bkZqMExUV1FBUHRl?=
 =?utf-8?B?azY5Ym5HQlR6a3IyMENnZWg4cnJ0OGR5bkNoQmJoZDBtcitQaVRFbmF4b1o1?=
 =?utf-8?B?SlQ3UHF1UG02MnRuT0ZaYkkrcUxENXZHRUV4MGQzN3pCN3dwYnZ3ZjZKL1Vu?=
 =?utf-8?B?ZDV2WnpUcVViNGNkcFpmTXlnQnh2TkU1SU1WUXpCRmJvbkJjbU55NE96bGx6?=
 =?utf-8?B?U3V6WEdET1VFOFU3aFJnVUNiaVZvMytBUnpSL1UyU2ZMTExXejVZcmVlZ0V2?=
 =?utf-8?B?cmYvTWNtK2hXMk1VTzBDcVR2bVA2OCtnWWZURjdydmpyZnFWWkpoSEdwVkly?=
 =?utf-8?B?WXU2ZENFUGFlK3hZZGJQa29TL3FDMHgvNXZBVUszUG11TTUvSGVUVFlqMXNW?=
 =?utf-8?B?U2k3L3hwWnNqM3hWU2dWZ1o3bm5BRm1MUkhJOXJrcVNRVGVhOHRvR2d5RTJB?=
 =?utf-8?B?ZStYbnA1RmY5dGlhNXNxa3o2ZTlKOWZtd0kydHZ2TDV6UGo1QjExa1hGNEM0?=
 =?utf-8?B?c25kWnZtOWVtNFZBS1FITlhWR2hhajdZcklaT2FjOVVEUXc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T25OMkhxRGFEcCsvVHNnOHRrM29QN1hMZHNYZGs4cTN2ajRPS0RrK0IybHB0?=
 =?utf-8?B?UFpzc09ia2R1dWR3V1V2TDNaaGFuSnJYVlg4ZTRpUUtBSDFkMUFyM0M2SnVX?=
 =?utf-8?B?eDEzVE1pTm53dkd2djJrYnFjRG9uWEJEZDZIaFk1ZTVpZlBIRVBlMS9ZRHdl?=
 =?utf-8?B?eDFuMlNoQWt2THFCNmp4Z1YrVW91ajl3S2l5UmVNNHRwOGRjdzhJbjM1ZmJZ?=
 =?utf-8?B?QU95NGVIeHhKYkZQam0yV2wyd1hJT3BuZ2pWRzBUMjJNTW5HZjB2OWRHNkVE?=
 =?utf-8?B?WHVaZTh2Y0htdEM2aUZEREtBN3FvOEhFTnBvbjZQcGt5cDRpWjloQndYVi9R?=
 =?utf-8?B?VUhIbEExRUV6aGR2dXYxL0RRL0s5RW1DUlBCbXoxR0sxL2JSMHN5Z040ZmlL?=
 =?utf-8?B?ODhlTUF5YkQvUmRUZVR6Y1VzdDR1Qnp2RGNaTExHWWp1UEg5MXVFKzVrRGJj?=
 =?utf-8?B?ZWdOSEx2V2FRUnplcStaWVIwRWxweitycUVoNkxjdkhXbktmNi9HSktTaEwr?=
 =?utf-8?B?cVFIRkN5UmdBK0k2MmdGTmtsQ3QrMDRDZGljSjZJbzNhRnZzazFqYnRMalB1?=
 =?utf-8?B?MnUvbG12SHdaVy8ybDRsRk1xSWtLSnU3a0l1a3MybFRpbHhhd2hoWTgxelpB?=
 =?utf-8?B?MGc4eDBoblVBd1lYZ1hnZWplTWNXSE9CQk9wVFp1czM2TXd2dFFlMWJwcGto?=
 =?utf-8?B?dURwRFk5TDRtRldnT05iaitxN3BKaVhpMHFSN0pGbmJtaEQ0a3lja1NXZGN1?=
 =?utf-8?B?aGoycDVxVUExMmtYdTFyWDJzZ1VUR0lMTzVIMUtDaFo0RFhxakxITStnNWJt?=
 =?utf-8?B?RjVyWmVvUWNuQXN1NzVERDRMcG5wRFBqNFpYN0c3aUpyWGE0L3RaY2NDOE1s?=
 =?utf-8?B?M0JLaEQzWUFoWkxGMkRwVEZ0UW9wSnd1alJqbXdGVjdNK2JWR1d4U1VnTTRN?=
 =?utf-8?B?SUVqVEJ0cTNTb2dzeFVmMWVyT0RHU0hvOTg2TW8yQm4wOGxFR1BCbEVBejZZ?=
 =?utf-8?B?S2hhZzgxZHNIcy9IaHNQbGZmRzdpMzhONFUxZ25SZ2dHS1E1WnVBemRkVFo4?=
 =?utf-8?B?ZzF4c01wckhWcVFOWUMwVGxoMitQcHNhTTBSU1dqZGdFUzRPRUU4UHNCY1RM?=
 =?utf-8?B?Mm11OFlPMXlsajNuWTI4ZnRqTGx5RlhoeCtNZ2VDeFhPTG1kL2Z5a2dZUDZC?=
 =?utf-8?B?d3JHSlpTdnJER2VuUzdZL0xWV1kzSng4R3R1M29HdFRjZjhHTmgzMkpzWXVY?=
 =?utf-8?B?RlRraThCdlUxUGhkem04elBHQjFicVk4ZnZuZ05vM0VadnY1V3ZQZFJBNDBG?=
 =?utf-8?B?YVFIbG9pdnEvNWdUN1JoOHpsYjU1WXlhM1dYcG1oRjd3QnJVZ2FmR0dHdjdr?=
 =?utf-8?B?YlF5dDRtSTdIZXlQZTFkYVJVQ2pETkxaNXY0NFB6VndSUUZqbGI3T0paTVZo?=
 =?utf-8?B?RDZGdkhmZ1phMHVGUVNFNnBodVBwZHdFd1o0UDhOMkRiSXF5Q0ZhbFV4ZC9w?=
 =?utf-8?B?NkhTZmxPU3JFZWM5NDFwZlBNWXNqSHlsdHoveWtLb3ZlUitMU0RzbzJodkl1?=
 =?utf-8?B?KzVLY3pEOTZOU0hSSDNEaDdnK08xY0ZwWnlUdUkyamlSZlpIcXZmejdmdFBx?=
 =?utf-8?B?bThWUUxSR0drSy9UZE5qQzhnYjk4bGlxWVo5TWhmMkRPc2pDUEhKS0R0a2x5?=
 =?utf-8?B?bms0Q2d2bVpLT2tPc3duL0d3cWdFbGpJRUZrUE1DTGF0cWp6TmZQSHdKUXN5?=
 =?utf-8?B?UVk1bEcyUk1rNmpEVTZZR0xiZWE2amNybjJGdjZwb0N2bkthVjNOUGVhS3pp?=
 =?utf-8?B?MXRGRTdTSmw1Ujloelh0a09YTE1ETHYwRVhwdlg4NFMwOTNoekw4N0FQY2lr?=
 =?utf-8?B?R0pLb1JIbmlhK0wzT2dJUERJekprY01pMFdVbEhWYk1ncXI4VFFBS3k3amM2?=
 =?utf-8?B?TjdaeUtZMVBCSG04dzhTalhWNkpHOEpHTFljeEtaY1JwYlI3ZWhCMHcvNm55?=
 =?utf-8?B?Y1J2VXE3NTA0dXBud2EzdmljNXQxdHZBcFpVMXhkRlVHbWJiSmtNMy8zNzdk?=
 =?utf-8?B?RWpTSWJDWThrR1Z1MTA1STBwY05aSXBWYkdYdHBoZFdDeEdzRTdJcFo2UllN?=
 =?utf-8?B?ZkNsOVJldDNMODd5KzVndjBDNlNwa21HL1J0K1pYb2VwV3B2TGhkRG8zNUtl?=
 =?utf-8?B?OVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50B5F00D623B2841B016B50BB9A0480E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	jZW3dIiD4BrlDZcAA93OPj0MAt1aFwElMk2vpggDACwfXMHRMIiP3lQB2/XiqicbPaM5wSiI+YwEaObA6/RgV5HFuWMI0cfu5DbW7GG/opAqfPN7a1l+t4T2xiZGmt5GS91e4kqvZTfkM8Zgu7ieepdWWiW7Ba1SQJyQpqD7r+NXKTTpQ7jGWB14aDo1aCgLN2MPi1hFu2ACPlLefLXv6hNEKpAFxK/4psh2g9K9cenMbqDOic8i/4IOhVJdcO97qEL3HNh1eOslzC6YHUl3ZJ3oK0Eox2yeEwBpQMngSM65bviGXfx6mzmou5kkr8dxGO6OYXc8o0iDnqzXWSZ4e3MA7ebv6ZM1lCmzwSlgCYUCR/zPQgN0xIkHuri8AmryU9NTrsV7Rjc0p7jImGMWIXKtGjMlz4xSfb+xUpWkQ+xXreKldSlKbltZAsXo6EWobS+Wl2eBx+p6DSFyqPFAIJit1oy9KSle9JT5A6+tgbZ2NER0Vzy06ImEze9Dg0ialblsZ96+wCAdiYUQGpDmfI7+E+WwYwqq+kNYAPWzv+OQtr68ZS+87DeEmk+o65U8MiuS/SAP2c51sp43WdYYx758abYH4HH3Vb3AykE2iRuNYAA4Eu4JJAoeIEl6CabedazhoKaA6bXoZb/Fuhez7w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11319d02-ee5d-4e4c-72b0-08dca0654407
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 22:19:57.2960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UXJTHwOufofShU+8uw0cq2RG2p9Xd4OKRNx3hWJ+S+GVrvtxdoSNHEYxPpO0+lvMq5EYj0ydgCGaUjMqazz1yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4232
X-Proofpoint-GUID: Yp6HGVFAaY2l3ZF305tEuN1CUvTy6pQt
X-Proofpoint-ORIG-GUID: Yp6HGVFAaY2l3ZF305tEuN1CUvTy6pQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_10,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=429 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407090151

SGkgR3JlZywNCg0KSSdsbCBiZSBiYWNrIGluIDIgd2Vla3MuIE15IHJlc3BvbnNlIG1heSBiZSBk
ZWxheWVkLg0KDQpCUiwNClRoaW5o

