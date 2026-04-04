Return-Path: <linux-usb+bounces-35984-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tkAVAKV30WluKAcAu9opvQ
	(envelope-from <linux-usb+bounces-35984-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 22:42:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 835AB39C6B2
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 22:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDFA630041F1
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 20:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3283E31C567;
	Sat,  4 Apr 2026 20:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Tt3d053l";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="N/B/jz3V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TOfSv1SH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F80A12D1F1
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 20:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775335327; cv=fail; b=fkAPaggtOXSzhM4EA/dOXyRrikv+kA6R1M9aT+DPGyU1baV6retBtCFgcmg/NJyzNKnq7XdRApoCHc5tml8Q5zHopn2cG4JxxQWhltSD05eU3FhfhKsMwLXWzrpSAmhzRSox/6cWaohr2qwiHFTTSGss2HBclUXSaQehT+NxEko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775335327; c=relaxed/simple;
	bh=2dOjWpv2m7O6FX0y5DIROxf8hT+lMPJRAXZy5ASW7CM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W+eUjApLPWwdHuMxUZ4bZI3wy2kGJ4lu4RNtb05piYvUeJU131hTkePNvgdHW/9XK+jLLFaHDe2ADk1OZiq2bx6FsZzKM0X5i/ppkZQPJdf2Ba2kRrFJqx7GCKXPWwREBMOfA1gGSyoAetj8c7yOf/3qsNbZF3wlcyG0hDB+D0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Tt3d053l; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=N/B/jz3V; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TOfSv1SH reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634Ar8iv3171683;
	Sat, 4 Apr 2026 13:41:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=2dOjWpv2m7O6FX0y5DIROxf8hT+lMPJRAXZy5ASW7CM=; b=
	Tt3d053lUoU4jfXZ0U9E/Rv0iFkgWtrtIBvHgDa35oBk3f2WBtKqkhw3Z1Ya+nrG
	6pbLkA4gLBUXGMa706OQrNgW4nHklbkQYbovSov1kOjl+mQjPwL3RqC3ZE80mZ2b
	KcacI1bOyNaPPPTH3DrSb1NhZl9WvvPpHh9RqrEISrLnw6guYZtNqMHUzy6xOYhg
	xGQfWBgzGSgBPE42sLt52S916lxZucgm6Esu9NzDDBJiiNwX8O88NiEzlYFwPf3e
	s5Ci2pkZifiRmSSV0BjYMeEiDHP5TfOn6TkUuDCYGrCFIM64lnww9pMfS8Pa2nS7
	u9XIE5I+wwvaMlVIsosltQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4db19e9bp8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 04 Apr 2026 13:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1775335303; bh=2dOjWpv2m7O6FX0y5DIROxf8hT+lMPJRAXZy5ASW7CM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=N/B/jz3VtyMzxGR9cAID3e0HIz3SsSxoRXlJrrP0/W5EtnnOXQO+xYpYz01yb+7bf
	 zPCO31Ke0/nbtq44OmWokABKMmynEZHicHp99rwi1ko1oUR6NQd+tZD7oFUPyJOI7s
	 ULlhQwUGq2P38D2qzVI2XA4n2P0ufSi9pXW+uQZLAUKMal/nnvMAu16c82WeCLuoKc
	 /cLGB91HtwwQNI6JwRgtnWpRV4pAjgyJpd5xRRSiwStiC2Alw31t6HcAnKV9SV2r9P
	 A7VW5Po9YOjXSpAwVj90ic/nZfGEWZXI06EgWWvDLDk0FVQxDqgqNMhYwut+squMlb
	 GcHB8HA559vng==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CAB724039C;
	Sat,  4 Apr 2026 20:41:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 70E89A00A1;
	Sat,  4 Apr 2026 20:41:42 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TOfSv1SH;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00100.outbound.protection.outlook.com [40.93.4.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "Microsoft TLS G2 RSA CA OCSP 16" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B48FA40298;
	Sat,  4 Apr 2026 20:41:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQoufB5x7nHefLWIZQ6F2xVdRftBegDGVmlnpIugWNkCshtXPkZQ3phozQK0UbtUDYNbIH6AVbgX2D5dA4UGBIMBKyovHiVoXJe+gHFg9W7hvSUXodhSNKFqLc+GFFOqo+FpzDqYxEBNzzraRcWBUbXhlnyAtcwtIu6v7w/gLmBOFK7B3R97jk9p8NBPQkj37rrp+ua9HCotj/rtlmoWUwYigG1EY387FTjYqWR0DVHIk2RxGbSMARgQ7P6A6/4xNSpcbvM5RAgDUZdRKJ6XK9H3r3qHXceeQTGCPwDSYfee6q3dOP+Mer+qBETJEA6feqnOjWhZ65kXo0gBqh2L1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dOjWpv2m7O6FX0y5DIROxf8hT+lMPJRAXZy5ASW7CM=;
 b=UUeMy7xwmPPhXiROn0NyguDFufMMDIgV2gXdePB81jRcwn0MZIBvmf6HtuvMt4w/Vy7eWniSlUnGH5Stcj+4BIlTtNy9qLw4Ntu36iPaSKdOT5gJbs6EtsjbkUk/GVDz0isQJkawFzmWc3A11i7No9Vs4l7BDlDOuH5ej34XnT8cfGnM3h1kvb6BBlEWdbf7d+eHb1xnNmu/xuTJw5f46sIMVpI10e8uQJlkwumNXVXRge9UhnXOg3zWUsptNj7KygtQcu29bXcwhglrpeazc27atZ/IflqkqMfEG8eOaMoluAEluvwa6aake5wzDP7wiKfb5F0S8an81cjeYwRY3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dOjWpv2m7O6FX0y5DIROxf8hT+lMPJRAXZy5ASW7CM=;
 b=TOfSv1SHX+rzqP/DoaRVCoZ8vSL69sIwAdY2tRP30L2T/2SFIPlejxHMB3XKPsWt7U9r91TUEAexk28MWigEblQ8Xtr43WWjUZ4qgtdCPgSuMV3f0LhuWHy5Z1BzC2VzrQsNxHG+n3JDkX4ElkSg16A+GnhsmHObgd+C9AjUzZ0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB9039.namprd12.prod.outlook.com (2603:10b6:8:de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Sat, 4 Apr
 2026 20:41:36 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.020; Sat, 4 Apr 2026
 20:41:36 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "michal.pecio@gmail.com" <michal.pecio@gmail.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Topic: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Thread-Index:
 AQHcusCFdimQniQh+kKFqQp1mqfuYbW+fjMAgACCooCAAQbCAIAAqVYAgADI0gCABZiuAIAAGBMAgAFDQQCAAGOTgIACAVGAgABK5wCAAYgPAIAAC/aAgAF5+wCAAArwAIABOtuA
Date: Sat, 4 Apr 2026 20:41:36 +0000
Message-ID: <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
References: <2604e951-01e8-44d0-a11e-be63b0849c23@linux.intel.com>
 <9e62ef5a-5b31-4fca-891b-d028f5bbfc05@rowland.harvard.edu>
 <54121929-d775-45a0-b31d-09b783aada5d@linux.intel.com>
 <86876c62-01d2-45da-81f3-7d4499ffa0ad@rowland.harvard.edu>
 <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
 <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
 <20260403015950.lx4n4zdqki37dy27@synopsys.com>
 <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
 <20260404011530.aukxllvizvmc3f3x@synopsys.com>
 <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
In-Reply-To: <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB9039:EE_
x-ms-office365-filtering-correlation-id: fc10bfd7-b1b9-4e0c-8e3d-08de928a90e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 mr9wrL0F+w1VZx04nlAolZoIBeAVDW9cXXBf52Mbz9Ghm/F6aRfzocSDQnKOQ80Dm3xl+6GR4KH/OPTq2Jce4urlC9GkFATP9lADLPlah27quKp6JMfBverMkSChipyrcu/6x3vM06d6QzMEx4290l64AI9Lg3OI/NkYrnd0vWoB3JTQRnx4dtw5od3mAJdUV9l+oxSM7vVubMFyaqWsqxhF2y3T/DOKyxmqlTEP/pNuzuWaMVbUHS9AULTriXPlCraVxgeFlKfecBPSPOavv9JQm0WCvGlQMYACFKc9bCn2qo09dSrVGZGmkC6f310ap87AUt9mnP7FDY1Sl17mHVWPfAC2NnLjihJ0p4fA4xTSLkVD0FenVLuBysUvdZRngjSUsAN0JsKcq3677kgOU4Xrh7H/W26ZAZ/l2fbuNRv9FPLmYZr4GzT2hQCdwHoX/fUIwQlGYIcA7AHZ4UkdsqzIV0iUMwIC0gty+tHYUNxw88MnKvI2vS9zSKze8Ms1o47vl7S76Qw0F7mS5teql03h5oWQINxMKE+Jvnq9EcUvPmUKb4kgPhqUteZUDs8r3wwnO4H1yxi9qgPPw2mXgNEUjhNnENXo/s+oP/vuSz0xb3VJfp6GXLQjWxKCsd6/vMBb22B7dUn0LuC+vHaWKNLutvmIXNyCfIkcp6OrCe5lQixRlIEdMtWdICcX+QxYj2KoTguHezsEwRz/SFydGEltxqvsw+9OrQq3mmf17Gaia+dSwfKAFte6KgcUoMzXcMvOEp0SBsX0FR+nturdB60lUCz9sM1nSTvvoDnHaqM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SzV1d29wZGhkeUtsTXpWWUkvaThEbEF0NzVQZ09tUkhQVDlVTmw1Ump4N0VD?=
 =?utf-8?B?TWlnTEM3NE5sNzBtRXJic3RGUDFYTlE2Nm84ci9Kb1AzS2gzT09XOFRKMW8w?=
 =?utf-8?B?RVhqVmNacDFjaHNibzN2Z1NHaml6eVN3SDhSbHZkcjdzb3p1cmIvTEIvODcx?=
 =?utf-8?B?WHpmQ0tNdjllVDhRT1plZWgvQ0w2eCtqYlRJNyt0YWJBdXpnaWNNV1R5OVNh?=
 =?utf-8?B?S3YvQmU1UDI5cml6L0xCTTR3ZEhFeXNzZENrbGhBZjdjcnBKb1FFQ0dNd3JK?=
 =?utf-8?B?ZUlNdGpJZk1XaENyd082clhUTThOQURUY0ZYUHE4WS9VRDdGTUNsZTYyaGdq?=
 =?utf-8?B?NFRDVW8vTlJnd1cvM21sUWZoTFFaNVNpZTlxeGRJTVJic1g4VGhBa1JHRVYv?=
 =?utf-8?B?WG8vYm5OMXhGbFBvczlXMVEvYkxLQ3NST2JaWTRnTnFPNDdtd3k5QUt1a0hD?=
 =?utf-8?B?OTF6N3dmMXFTK0FLQ1Y4UEUxSG1tNkpJZGdqWDg5cG8zZWUrMmhHek5QaDRE?=
 =?utf-8?B?NjRHVi9GbS9XQ3dKL0N0c1gwbXBwNGp3eUlHOTE2a0gzQ3RlT1crR01YZUEy?=
 =?utf-8?B?emxVWHRGU0ppR2dtK1A1VEFTRzNBMS9CbWdITXI3MzZucG53VmhGU2g4VGxq?=
 =?utf-8?B?elhDT3hSRnF6ZS9QN0R5N1RQb3dzajNPQ1daZFljRzhObjNLcjdxTXdWSy9Q?=
 =?utf-8?B?SjI1SjJiNFZYUlBBSDM3TmRxWG9xckYyQkdaNkNrZENLSGJ4SWhtZHRyMk51?=
 =?utf-8?B?WDlmOGR3dFhNR0ZheHlPRmRXQnVxRVNwZllCNWg2bG9TengrRzEwSXpLOEI3?=
 =?utf-8?B?anhDZ25PMTlHb3ZmT3JWUXlveVVMWTRmakRiaW1vUmZveGJ6YW5CNDljYTZW?=
 =?utf-8?B?N3NPOWJLWjdVaUJtaHhGWk9BZnA4RjM4OE51WFUxbVEvcmJMZ2c0TmFQVE9w?=
 =?utf-8?B?RUEwR0pnQ2hlcW0xM2U1a1V2N3hrZ0F4YnZxdTR2RllTaFBHTDJ4cjg1OFVn?=
 =?utf-8?B?ZTVIUjlmdTRDaXA2b2pTWkt0TlA2NW5ObGtiY1dlNndDUFVlTHJpZWVhWU1x?=
 =?utf-8?B?cmlyQ1lkYWJMWFFrTUptQ3ZaRkxidzNWRitUSGdSOEFCeDA4ZmN3Q3JDWWx4?=
 =?utf-8?B?R3Bqc0NwOFRYYXg4K3hvb3Y5L2xvWU9iVS9OVGxpMHF4TGQvbXl5TE5XVGhC?=
 =?utf-8?B?bUsraUhGdDlzN21nRWJSN3R2c1JBa21Kc1M0SnhGcW0xRWpyM2ZGRUxkdUdx?=
 =?utf-8?B?dDVLZE1wMnFPSno0N2RBNUxxS2l2YjN2TVU5YUh0aGdBTG1DSDV3cWZZNCtO?=
 =?utf-8?B?dmtJMkxpckNqUXk3VHlLRkZZRXp3S2J2czNOT2ZXbjQ5UHdmc3B0dXk1eGxW?=
 =?utf-8?B?YlJUZVh1MHFHT3o2bnZ1ajJIdzJ1b1V6dlJtNmR6OUNJWUJrZy8wdW1hUUY0?=
 =?utf-8?B?Zms5c3NaR2llY1lrNWJLZ09INXVxdmRUZjBvYXZCMG9JTFZlYlFzRlFJVTNF?=
 =?utf-8?B?dFdKYkdHN2hKbC9qbUc1cXQzaGdjaCtaNGtvR3JUQlMzc0tXUXI0alRkMTBP?=
 =?utf-8?B?UmhyVlBIKzM0SHNOTGNwSXhGazdtWFN1M3JXTHRJbWthTWZtMi93eXZkYTky?=
 =?utf-8?B?c1Nzc3JhUDZ0SkJvWHFlVVpXdy80bmw3R3laa3FRd1UyaTdLU1dnSG0ycTlL?=
 =?utf-8?B?dXNsTWQrbCtyc2xIRFY2YkYwTnRZWnBLOUpXSEFab3VnanNkS1lYK3IvcHZS?=
 =?utf-8?B?Q0lrb0hTemhOTTlZbEFQWTlSTUxaZVNUV2VjelBWRW9UMFVTMmo0S2lmbzJ5?=
 =?utf-8?B?QXo0OWZxaDh3dU44bVRsU3M2a0dyVUhZUWsvQVNnQmJoRFJMRVhpaG0xUVJC?=
 =?utf-8?B?QW5aTnBXeEpIZTJLMHhkUVZRR29RazU3NGdIeFNKTlk2UnFZYmxIaTZhdmdx?=
 =?utf-8?B?dmowaUx3QlBjTnY2QzRQUktneG5PTlZRc294MXhhNHVJOEIwRWZMWkEyQ1Y4?=
 =?utf-8?B?YVFZZWF6eTNWSFphSy90alJkdldBSXBtcFM1Q1lxeUI0TzFpaVlPa080d3dM?=
 =?utf-8?B?K3pJUnY0K1FMcFdCV25yOFJYaEZUTWlCNmx4cERJbzdwREpKQW5ZaUV4YlNy?=
 =?utf-8?B?TVlod00yUElvY0hNSEpSd1pKZFhpL01xSEJXdHVGTTE5TGM1c3JHb0tQMTBu?=
 =?utf-8?B?Tm1UWW5objRlRXJFLzM4NENHMWFLeStkbWlBeGpYTGxYcklQZGt4b1hEY3lN?=
 =?utf-8?B?TDVrSzhwNnVKQ2dndE94d2g3YnFRL3MweVhnZ3o5cWJuSzcxd2tRclVCY2F4?=
 =?utf-8?B?V0pPWlM2bG96ajB1R0Z0UUd1R2lNUzRNWDlhQWdRa1lvM2NqblZBQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B39441AB2CC09C4490B64710A493D5E8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	RS7onK8sBsH/0YOwCvgnl+iEgzmTd7jT2eGETa5gOzl9cZYGO5cn8W+WEo8C3dxWVFPeE9v4QNRMdW/V8w1ql2w/4KRqUU9eB6sqQZWZ3Z9b1KW5uvipfGd8BXqGBQLFRESaG6f+JsP3KPXcPATg3eU32QkevFgRKGbXWnrAEyH28zCWhx4j+UAIGzfyRl8u7wJ3zqeE0zKS5VfNOAzrOcIKe5k7LykhyQnlXOBlQ+2ykMX3hzpYB0Lx3F+8I587MQbqbzXGUyz1yXE/aqY1/3xgkYENC3iUjFyKMHJX6UMBahzZuo+hzXhzbomVKmvmdxUqET01MztO6J+zWgbHbw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9RRFZ8UyKZedb6wzIvdTh5UakDt+1TeKz+s1fy5zCYDwmZnTdQFoA5M4NJD4+gtdPhQl8+iezyKIr6H3PEWhIHofp9fP4j9YWGg6VfaN16Sgr5CDVxiH6oKwWxsuTnzKsRP6xWfNd6wkp+b1fCf8rWVkyd0UETH/t8gP3Uex+Pvjsrav2/lUOa3qfLSr6B4MCQR3W8nTF0gT+DciA2y/H3piuGQGD18t7jZ2XjcrMCAVOXlXA5rC8X6z6XjPIDIHLLwb7pUwmRpgrYyNUz8P6OyiDx2NsRX99ToeNeDMeZA5lMtJfr4Tsr0ojGs700eaKmgLLKbAdl0n6LK9wt97Uvnalf8KxNHXezX/5IQgcK2aXpj3qpM6ABG64In6nbB0oGeiqlDQZLpJAsyvxjUL7JrI7hEftMKou4khNkDKE7uV7468DB1dk1IDL3vu6f5wRlq2gzF/GKYKToUE3UD731WSMKb8/je8wA+gxYKRhPRdkjGMmJJOzQXONczcRFz4qOtQmUIC98YZRwUXgsq9TBXUALZtT67k79m8kRv6kC3drsoA0cS8ewJXtLyR95KsRZR2UP4YtaH4z1eTCZu7YNQIia7WjxVYiKwsZrffpGeTc1AoZcLqzy/qd9m69L7KO975LSHC0M61bZ9Itgn93A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc10bfd7-b1b9-4e0c-8e3d-08de928a90e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2026 20:41:36.6794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+JeHLwPFPZIx1uLSoGOQeek1jfeZKKzvQIC3pQ9YyT9IDJe4JKNQl1ty++Xjb0dn8E0+uDSM7lI1eZrqY8bkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9039
X-Authority-Analysis: v=2.4 cv=edcwvrEH c=1 sm=1 tr=0 ts=69d17788 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=5PQezXqrdbhqImSeLCAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE5NyBTYWx0ZWRfX1Ss0BxstJaXp
 tOwbsnBl8BaUuvyNLMDLeqlEPi20P7Vxoe5bvrVZ/Kj+jG2HYOPN/7ZBgJ5tDRuBGR9H0tTgw0U
 ssrZS7+TvPy1J5ierkxXC1267dAYVE06ueLwH5oz0/ncA/cIAa1vrSQYJwwZBRIZrZ3WA8V8wpl
 Dhtzsh5ucwVMrfM5iaIc2KjcPuup3F3UCzMg9312Bsv/r9Bu9+gn+LV/944Nm92aM4iAHh712+I
 GsI/VsE6skA626qhWyCy9q/lzfHxb1zATtaX4Cj6mvsmHYt0Fh2rCc2xrZrPbmQXJi4dnm/TMTs
 ZAk/+Ts+d1UdD71yl/o964CHhem3BzP41FAhudhNzfa7Dl9VGmlFjB06MJiR7MRhIxxjCRV7HNi
 ev7+7pKuglCrkEQpcauAto9ob9JzFpuK8SvGIaxM5F/E5BFdtSAL1H4tqRVioa5QtpnDuKxc2HT
 DWjEoIcMKGIS8uxLTBQ==
X-Proofpoint-ORIG-GUID: E1rBXxrxsOhVvAb58W49X5H6kFuyK1a4
X-Proofpoint-GUID: E1rBXxrxsOhVvAb58W49X5H6kFuyK1a4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2604040197
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35984-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,harvard.edu:email];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,linux.intel.com,vger.kernel.org,gmail.com,suse.com];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 835AB39C6B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBBcHIgMDMsIDIwMjYsIHN0ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHUgd3JvdGU6DQo+
IE9uIFNhdCwgQXByIDA0LCAyMDI2IGF0IDAxOjE1OjUyQU0gKzAwMDAsIFRoaW5oIE5ndXllbiB3
cm90ZToNCj4gPiA+ID4gSG93IGFib3V0IHRoaXM6DQo+ID4gPiA+IA0KPiA+ID4gPiBJbnRyb2R1
Y2UgYSBoYWx0ZWQgZmxhZyB0aGUgZm9sbG93aW5nIGNvbmRpdGlvbnM6DQo+ID4gPiA+IA0KPiA+
ID4gPiAqIEludHJvZHVjZSB0aGUgaGFsdGVkIGZsYWcgaW4gdXNiX2hvc3RfZW5kcG9pbnQNCj4g
PiA+ID4gKiBUaGUgaGFsdGVkIGZsYWcgbXVzdCBiZSBpbXBsZW1lbnRlZCBhcyBhIGJpdCBpbiBh
IHVuc2lnbmVkIGxvbmcgc28NCj4gPiA+ID4gICB3ZSBjYW4gdXNlIGF0b21pYyBiaXQgb3BlcmF0
aW9uDQo+ID4gPiANCj4gPiA+IEkgZG9uJ3Qgc2VlIHdoeSBpdCBuZWVkcyB0byB1c2UgYXRvbWlj
IG9wZXJhdGlvbnMuICBVbmxlc3MgeW91J3JlIA0KPiA+ID4gdGhpbmtpbmcgdGhhdCB3ZSBtaWdo
dCB3YW50IHRvIGFkZCBvdGhlciBiaXRmbGFncyBpbnRvIHRoZSBzYW1lIHVuc2lnbmVkIA0KPiA+
ID4gbG9uZz8NCj4gPiANCj4gPiBOb3cgdGhhdCBJIHRoaW5rIGFib3V0IGl0IGFnYWluLCBpdCdz
IG5vdCBuZWVkZWQgaWYgd2UgaGF2ZSB0aGUNCj4gPiByZXF1aXJlbWVudCBmb3IgY2xlYXJpbmcg
dGhlIGZsYWcgb25seSBhZnRlciB1c2JfcmVzZXRfZW5kcG9pbnQuDQo+ID4gDQo+ID4gPiANCj4g
PiA+ID4gKiBPbmx5IHRoZSBIQ0QgbWF5IHNldCB0aGUgaGFsdGVkIGZsYWcsIGFuZCBvbmx5IHVw
b24gY2hlY2tpbmcgdGhlDQo+ID4gPiA+ICAgZmlyc3QgVVJCIGNvbXBsZXRpbmcgd2l0aCBhIGhh
bHRlZCBzdGF0dXMNCj4gPiA+IA0KPiA+ID4gRXZlcnkgc3RhdHVzIG90aGVyIHRoYW4gMCBzaG91
bGQgbWVhbiB0aGF0IHRoZSBlbmRwb2ludCdzIHF1ZXVlIGlzIA0KPiA+ID4gaGFsdGVkLiAgQnV0
IG5vdCBhbGwgc3RhdHVzZXMgcmVxdWlyZSBhIGNsZWFyLWhhbHQgb3IgcmVzZXQtZW5kcG9pbnQg
dG8gDQo+ID4gPiByZWNvdmVyLiAgRm9yIGluc3RhbmNlLCBhIHNob3J0IHRyYW5zZmVyIHdoZW4g
dGhlIFVSQl9TSE9SVF9OT1RfT0sgZmxhZyANCj4gPiA+IGlzIHNldC4NCj4gPiANCj4gPiBJdCBz
ZWVtcyB3ZSdyZSB1c2luZyB0aGUgImhhbHRlZCIgZmxhZyBmb3IgZGlmZmVyZW50IHRoaW5ncy4g
VGhlIGhhbHRlZA0KPiA+IGZsYWcgdG8gbWUgaXMgdGhlIGVuZHBvaW50J3Mgc3RhdGUgYW5kIHJh
dGhlciB0aGFuIHRoZSBlbmRwb2ludCBxdWV1ZQ0KPiA+IHN0YXRlLiBUaGF0IGlzLCBpZiB0aGUg
ZW5kcG9pbnQgaXMgaGFsdGVkLCB0aGVyZSdzIGFuIGVycm9yIHRoYXQgd2FzDQo+ID4gcmVwb3J0
ZWQgb24gdGhlIHBpcGUuIFNvLCBhbiAtRUNPTk5SRVNFVCB3b3VsZCBub3QgY2F1c2UgYSBoYWx0
ZWQNCj4gPiBlbmRwb2ludC4NCj4gPiANCj4gPiA+IA0KPiA+ID4gV2h5IGRvIHlvdSB3YW50IHRo
ZSBIQ0QgdG8gc2V0IHRoZSBmbGFnIGluc3RlYWQgb2YgDQo+ID4gPiB1c2JfaGNkX2dpdmViYWNr
X3VyYigpPyAgSnVzdCBvbmUgY2VudHJhbCBwbGFjZSBpcyBzaW1wbGVyIHRoYW4gaW4gZXZlcnkg
DQo+ID4gPiBIQ0QuDQo+ID4gDQo+ID4gSSdtIGp1c3QgdGhpbmtpbmcgaW4gdGVybSBvZiB3aG9z
ZSByb2xlIHRvIHJldHVybiB0aGUgcGVuZGluZyBVUkJzLg0KPiA+IFR5cGljYWxseSB0aGUgSENE
IGhhbmRsZXMgd2hlbiB0byBnaXZlIGJhY2sgVVJCcy4gSWYgdGhlIEhDRCB3ZXJlIHRvDQo+ID4g
aGFuZGxlIGdpdmluZyBiYWNrIHBlbmRpbmcgVVJCcyBkdWUgdG8gaGFsdGVkIGVuZHBvaW50LCB0
aGVuIGl0IHNob3VsZA0KPiA+IGJlIHRoZSBvbmUgdG8gc2V0IHRoZSBoYWx0ZWQgZmxhZy4gSG93
ZXZlciwgaWYgdGhlIGNvcmUgdHJhY2tzIGFuZCBkb2VzDQo+ID4gYm90aCBzZXR0aW5nIGFuZCBj
bGVhcmluZyBvZiB0aGUgaGFsdGVkIGZsYWcsIHRoZW4gdGhlIGNvcmUgc2hvdWxkDQo+ID4gaGFu
ZGxlIGNhbmNlbGluZyB0aGUgVVJCcy4gQXMgeW91IHNhaWQsIGlmIHdlIGNhbiBzaGlmdCB0aGUg
YnVyZGVuIHRvDQo+ID4gdGhlIGNvcmUsIHRoYXQgd291bGQgaGVscCBrZWVwIHRoZSBmbG93IGNv
bnNpc3RlbnQgYW5kIGNlbnRyYWxpemVkLg0KPiA+IA0KPiA+ID4gDQo+ID4gPiA+ICogT25seSB0
aGUgVVNCIGNvcmUgbWF5IGNsZWFyIHRoZSBoYWx0ZWQgZmxhZywgYW5kIG9ubHkgYWZ0ZXINCj4g
PiA+ID4gICB1c2JfcmVzZXRfZW5kcG9pbnQgcmV0dXJucyAodGhpcyBtYWtlcyBzdXJlIHRoZSBI
Q0QgZHJhaW5lZCBhbmQgcmVzZXQNCj4gPiA+ID4gICB0aGUgZW5kcG9pbnQgYmVmb3JlIHRoZSBm
bGFnIGlzIGNsZWFyZWQgYW5kIG5ldyBVUkJzIGFyZSBhY2NlcHRlZCkNCj4gPiA+ID4gKiBUaGUg
dXNiX3Jlc2V0X2VuZHBvaW50IG11c3QgYmUgY2FsbGVkIGFmdGVyIGNsZWFyLWhhbHQsIFNldElu
dGVyZmFjZSwNCj4gPiA+ID4gICBhbmQgU2V0Q29uZmlndXJhdGlvbi4NCj4gPiA+IA0KPiA+ID4g
VGhhdCdzIGVhc3kgdG8gZG8ganVzdCBieSBhZGRpbmcgaXQgaW50byB0aGUgYXBwcm9wcmlhdGUg
Y29yZSByb3V0aW5lcy4NCj4gPiANCj4gPiBZZXMuDQo+ID4gDQo+ID4gPiANCj4gPiA+ID4gKiBU
aGUgVVNCIGNvcmUgd2lsbCBub3QgYXR0ZW1wdCB0byB1bmxpbmsgcGVuZGluZyBVUkJzIGR1ZSB0
byBoYWx0ZWQNCj4gPiA+ID4gICBjb25kaXRpb24NCj4gPiA+ID4gKiBUaGUgSENEIGlzIHJlc3Bv
bnNpYmxlIGZvciBjb21wbGV0aW5nIG9yIGNhbmNlbGluZyBxdWV1ZWQgVVJCcw0KPiA+ID4gPiAg
IHdoZW4gdGhlIGhhbHRlZCBmbGFnIGlzIHNldC4gQ2FuY2VsbGVkIGFuZCBuZXdseSBzdWJtaXR0
ZWQgVVJCcyB3aWxsDQo+ID4gPiA+ICAgYmUgcmV0dXJuZWQgd2l0aCAtRVBJUEUgYXMgbG9uZyBh
cyB0aGUgaGFsdGVkIGZsYWcgaXMgc2V0DQo+ID4gPiANCj4gPiA+IFdoeSBtYWtlIHRoZSBIQ0Qg
cmVzcG9uc2libGUgZm9yIGRyYWluaW5nIHRoZSBxdWV1ZT8gIEl0J3MgbGlrZSBzZXR0aW5nIA0K
PiA+ID4gdGhlIGhhbHRlZCBmbGFnOyBvbmUgY2VudHJhbCBwbGFjZSBpcyBzaW1wbGVyIGFuZCBs
ZXNzIGVycm9yLXByb25lIHRoYW4gDQo+ID4gPiBsb3RzIG9mIHNlcGFyYXRlIHBsYWNlcy4NCj4g
PiA+IA0KPiA+ID4gRm9yIG5ld2x5IHN1Ym1pdHRlZCBVUkJzLCBzaG91bGQgdGhlIHN1Ym1pc3Np
b24gZmFpbCB3aXRoIC1FUElQRSwgb3IgDQo+ID4gPiBzaG91bGQgdGhlIHN1Ym1pc3Npb24gc3Vj
Y2VlZCBhbmQgdGhlbiB0aGUgVVJCIGNvbXBsZXRlIHdpdGggLUVQSVBFPyAgDQo+ID4gPiBUaGUg
Zmlyc3QgaXMgc2ltcGxlciwgYnV0IGRyaXZlcnMgcHJvYmFibHkgYXJlbid0IHByZXBhcmVkIGZv
ciBpdCAtLSBpdCANCj4gPiA+IHdvdWxkIG1lYW4gYWRkaW5nIGVycm9yIGhhbmRsaW5nIHRvIHRo
ZSBzdWJtaXNzaW9uIGNvZGUgYXMgd2VsbCBhcyB0byANCj4gPiA+IHRoZSBjb21wbGV0aW9uIGhh
bmRsZXIgY29kZS4NCj4gPiA+IA0KPiA+ID4gKEFjdHVhbGx5LCB0aGF0IHdvdWxkbid0IG1hdHRl
ciB1bmxlc3MgdGhlIGRyaXZlciB3YXMgcXVldWluZyB1cCANCj4gPiA+IG11bHRpcGxlIFVSQnMs
IGluIHdoaWNoIGNhc2UgaXQgc2hvdWxkIGJlIHByZXBhcmVkIHRvIGhhbmRsZSBzdWJtaXNzaW9u
IA0KPiA+ID4gZXJyb3JzIGluIHRoZSBtaWRkbGUuKQ0KPiA+IA0KPiA+IEkgZGlkbid0IHRoaW5r
IGFib3V0IGZhaWxpbmcgaW1tZWRpYXRlbHkgb24gc3VibWlzc2lvbiBiZWNhdXNlIHdlIHdvdWxk
DQo+ID4gbmVlZCB0byBhdWRpdCBldmVyeSBjbGFzcyBkcml2ZXIgZm9yIHRoYXQuIFBlcmhhcHMg
dGhlIGNvcmUgY2FuDQo+ID4gaW50ZXJjZXB0IHRoZSBVUkJzIGFuZCBpbW1lZGlhdGVseSBzY2hl
ZHVsZSBhIGNvbXBsZXRpb24gaGFuZGxlciB3aXRoDQo+ID4gdGhlIHVwZGF0ZWQgVVJCJ3Mgc3Rh
dHVzPw0KPiA+IA0KPiA+ID4gDQo+ID4gPiA+ICogVGhlIGNsYXNzIGRyaXZlciBpcyByZXNwb25z
aWJsZSB0byBjaGVjayB0aGUgaGFsdGVkIGZsYWcgdG8NCj4gPiA+ID4gICBkZXRlcm1pbmUgd2hl
dGhlciB0byBpbml0aWF0ZSBlcnJvciByZWNvdmVyeSB2aWEgdXNiX2NsZWFyX2hhbHQNCj4gPiA+
ID4gDQo+ID4gPiA+IEknbSB0cnlpbmcgdG8ga2VlcCBhIGNsZWFyIHNlcGFyYXRpb24gb2YgcmVz
cG9uc2liaWxpdGllcyBiZXR3ZWVuIEhDRA0KPiA+ID4gPiBhbmQgdGhlIFVTQiBjb3JlLiBBbHNv
LCBJIHRyeSB0byBrZWVwIHRoZSBoYWx0ZWQgZmxhZyBtb3JlIGNsb3NlbHkgbWF0Y2gNCj4gPiA+
ID4gdGhlIHN0YXRlIG9mIHRoZSBlbmRwb2ludC4gDQo+ID4gPiA+IA0KPiA+ID4gPiBMZXQgbWUg
a25vdyB3aGF0IHlvdSB0aGluaz8NCj4gPiA+IA0KPiA+ID4gTWFraW5nIHRoZSBmbGFnIG1hdGNo
IHRoZSBlbmRwb2ludCBzdGF0ZSBpcyBhIGdvb2QgaWRlYS4gIEJ1dCB0aGVyZSBpcyANCj4gPiA+
IHNvbWUgYW1iaWd1aXR5OiBEbyB5b3UgbWVhbiB0aGUgc3RhdGUgaW4gdGhlIGRldmljZSwgb3Ig
dGhlIHN0YXRlIGluIHRoZSANCj4gPiA+IEhDIGhhcmR3YXJlLCBvciB0aGUgc3RhdGUgaW4gdGhl
IEhDRD8gIEFmdGVyIGFsbCwgdGhlc2UgYXJlbid0IGFsd2F5cyANCj4gPiA+IHRoZSBzYW1lLiAg
Rm9yIGluc3RhbmNlLCB1bmxpbmtpbmcgYW4gVVJCIHdvbid0IGFmZmVjdCB0aGUgZGV2aWNlJ3Mg
DQo+ID4gPiBzdGF0ZSBidXQgaXQgd2lsbCBhZmZlY3QgdGhlIHN0YXRlIG9uIHRoZSBob3N0IHNp
ZGUuDQo+ID4gPiANCj4gPiANCj4gPiBUaGUgSENEIHN0YXRlLiBJZiB3ZSBjYW4gbGV0IHRoZSBj
b3JlIG1hbmFnZSB0aGUgaGFsdGVkIHN0YXRlLCB0aGVuIGhlcmUNCj4gPiBhcmUgdGhlIHBvaW50
cyB3aGVyZSB0aGUgaGFsdGVkIHN0YXRlIGlzIHVwZGF0ZWQgKGhvcGVmdWxseSBJIGRpZG4ndA0K
PiA+IG1pc3MgYW55IG90aGVyIG9uZXMpOg0KPiA+IA0KPiA+IEVuZHBvaW50IGlzIGhhbHRlZCAo
cmVwb3J0ZWQgYnkgSENEKToNCj4gPiAqIFVSQiByZXR1cm5lZCB3aXRoIC1FUFJPVE8gb3IgLUVQ
SVBFDQo+ID4gDQo+ID4gRW5kcG9pbnQgaXMgYWN0aXZlICh1cGRhdGVkIGJ5IHRoZSBjb3JlKToN
Cj4gPiAqIFNldENvbmZpZ3VyYXRpb24sIFNldEludGVyZmFjZSwgY2xlYXItaGFsdA0KPiANCj4g
SG1tbS4gIFdoYXQgZGlkIHlvdSB0aGluayBvZiBteSByZWNlbnQgcHJvcG9zYWwgaW4gYSBtZXNz
YWdlIHRvIE1pY2hhbD8gIA0KPiBTdW1tYXJpemluZzoNCj4gDQo+IElmIHRoZSBjbGFzcyBkcml2
ZXIgd2FudHMgdG8gdW5saW5rIHF1ZXVlZCBVUkJzIHdoZW4gYSB0cmFuc2FjdGlvbiBlcnJvciAN
Cj4gb2NjdXJzLCBpdCBoYXMgdG8gZG8gc28gaXRzZWxmIGluIHRoZSBmYWlsZWQgVVJCJ3MgY29t
cGxldGlvbiBoYW5kbGVyLiAgDQo+IFdlIGNhbiBtYWtlIHRoaXMgZWFzaWVyIGJ5IGFkZGluZyBh
IHVzYl9mbHVzaF9lbmRwb2ludF9xdWV1ZSgpIHJvdXRpbmUgDQo+IHRvIHRoZSBjb3JlLiAgSW4g
dGhlIG1lYW50aW1lLCB0aGUgSENEIGVuc3VyZXMgdGhhdCB0aGUgcXVldWUgaXMgc3RvcHBlZCAN
Cj4gYmVmb3JlIGdpdmluZyBiYWNrIHRoZSBVUkIuICAoTm90ZTogLUVQSVBFLCAtRU5PRU5ULCAt
RUNPTk5SRVNFVCwgYW5kIA0KPiAtRVJFTU9URUlPIGFyZW4ndCBjb25zaWRlcmVkIHRvIGJlIHRy
YW5zYWN0aW9uIGVycm9ycy4pDQo+IA0KPiBXaGVuIHRoZSBjb21wbGV0aW9uIGhhbmRsZXIgcmV0
dXJucywgdGhlIGNvcmUgd2lsbCBhdXRvbWF0aWNhbGx5IGNhbGwgDQo+IHVzYl9jbGVhcl9oYWx0
KCksIHdoaWNoIHdpbGwgYWxzbyByZXNldCB0aGUgZW5kcG9pbnQgb24gdGhlIGhvc3Qgc2lkZSAN
Cj4gYW5kIHdpbGwgcmVzdGFydCB0aGUgcXVldWUuICBUaGlzIGFsc28gaGFwcGVucyBhZnRlciBT
ZXRDb25maWd1cmF0aW9uIA0KPiBhbmQgU2V0SW50ZXJmYWNlLCBlaXRoZXIgZXhwbGljaXRseSBv
ciBpbXBsaWNpdGx5Lg0KDQpJIGxpa2UgdGhhdCB0aGUgY29yZSB3aWxsIGhhbmRsZSB0aGlzIGF1
dG9tYXRpY2FsbHkuIEJ1dCBvbmUgY29uY2VybjoNCkhvdyB3aWxsIHRoZSBjbGFzcyBkcml2ZXIg
a25vdyB3aGVuIHRoZSBjbGVhci1oYWx0IGNvbXBsZXRlIHNvIGl0IGNhbg0KcGVyZm9ybSB0aGUg
cmVjb3Zlcnk/IChpZS4gaXQgc2hvdWxkbid0IHBlcmZvcm0gcmVjb3ZlcnkgaW1tZWRpYXRlbHkN
CmFmdGVyIHNlZWluZyAtRVBST1RPKQ0KDQo+IA0KPiBGb3IgLUVQSVBFIChkZXZpY2Ugc2VudCBh
IFNUQUxMIHRva2VuKSwgdGhlIGNsYXNzIGRyaXZlciBoYXMgdG8gY2xlYXIgDQo+IHRoZSBoYWx0
IGl0c2VsZi4gIFRoaXMgaXMgYmVjYXVzZSBzdGFsbHMgYXJlbid0IGVycm9yczsgdGhleSBhcmUg
YW4gDQo+IGludGVudGlvbmFsIHBhcnQgb2YgdGhlIFVTQiBwcm90b2NvbC4NCj4gDQo+IC1FTk9F
TlQgYW5kIC1FQ09OTlJFU0VUIChVUkIgd2FzIHVubGlua2VkKSBhbmQgLUVSRU1PVEVJTyAoc2hv
cnQgcGFja2V0IA0KPiByZWNlaXZlZCB3aXRoIFVSQl9TSE9SVF9OT1RfT0sgc2V0KSBhcmUgYSBs
aXR0bGUgdHJpY2tpZXIuICBUaGUgSENEIG1heSANCj4gb3IgbWF5IG5vdCBuZWVkIHRvIHN0b3Ag
dGhlIHF1ZXVlIGZvciBhbiB1bmxpbmssIHBvc3NpYmx5IGRlcGVuZGluZyBvbiANCj4gd2hldGhl
ciB0aGUgVVJCIGJlaW5nIHVubGlua2VkIGlzIHRoZSBhY3RpdmUgb25lLiAgV2hlbiBhIHNob3J0
IHBhY2tldCANCj4gaXMgcmVjZWl2ZWQsIHRoZSBIQyBoYXJkd2FyZSBtYXkgb3IgbWF5IG5vdCBz
dG9wIGl0cyBxdWV1ZS4gIEVpdGhlciB3YXksIA0KPiB0aGUgY2xhc3MgZHJpdmVyIHNob3VsZG4n
dCBuZWVkIHRvIHRha2UgYW55IHNwZWNpYWwgcmVjb3ZlcnkgYWN0aW9uOyBhbnkgDQo+IG5lY2Vz
c2FyeSBhY3Rpb25zIHNob3VsZCBiZSB0YWtlbiBhdXRvbWF0aWNhbGx5IGJ5IHRoZSBIQ0QgYW5k
IHRoZSBjb3JlLg0KPiANCj4gQWxsIG9mIHRoaXMgYXBwbGllcyBvbmx5IHRvIGJ1bGsgYW5kIGlu
dGVycnVwdCBlbmRwb2ludHMuICBDb250cm9sIA0KPiBlbmRwb2ludHMgZ2VuZXJhbGx5IG5lZWQg
ZXJyb3IgcmVjb3Zlcnkgb25seSBvbiB0aGUgaG9zdCBzaWRlLCBiZWNhdXNlIA0KPiB0aGUgZGV2
aWNlIHJlc2V0cyBhdXRvbWF0aWNhbGx5IHdoZW4gaXQgZ2V0cyBhIG5ldyBTRVRVUCBwYWNrZXQs
IGFuZCBzbyANCj4gdGhlIEhDRCBzaG91bGQgaGFuZGxlIHdoYXRldmVyIGlzIG5lZWRlZC4gIElz
b2Nocm9ub3VzIGVuZHBvaW50cyBkb24ndCANCj4gZXZlciBoYWx0IGFuZCB0aGV5IHNob3VsZG4n
dCBuZWVkIHRvIGJlIHJlc2V0IHdoZW4gYW4gZXJyb3Igb2NjdXJzLg0KPiANCj4gT3ZlcmFsbCwg
dGhpcyBzZWVtcyBzaW1wbGVyIHRoYW4gYW55dGhpbmcgZWxzZSB3ZSBoYXZlIGRpc2N1c3NlZC4N
Cj4gDQoNClRoZSByZXN0IHNvdW5kcyBnb29kIHRvIG1lIQ0KDQpUaGFua3MgQWxhbiwNClRoaW5o

