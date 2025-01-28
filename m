Return-Path: <linux-usb+bounces-19798-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC7DA2030F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 02:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 037531653A5
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2025 01:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16554824A3;
	Tue, 28 Jan 2025 01:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jGknsl3a";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QAecf22D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tSKAfkd4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE4B674;
	Tue, 28 Jan 2025 01:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738028667; cv=fail; b=lrkmzrS2OzxziiWKgsYgWmELiACyGs9Yk5VT3DfXnNs+zxefV578aC0d3lSTBgotS6KaRMlKJn0DYupta8rOWM7Tt2RfNdyXMLOSCt0554fZezfY0Jyobl9x1HMbhTpYBGGDVX0cZV9Lu6yXGj+6RHFTqzQ7qYT/3Jlvxq2CALg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738028667; c=relaxed/simple;
	bh=Y0lEMyCVvHRPw0fTJEv1SRnsbgdQP/rZnscRS5ERRww=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CsiMOgO2fLbjdZntU1vP6tsrpNiEm8NXsXLUkSVcs6J06sN9/UXSbv72n47DUZZQ6zUwVQj+EI8C1VUjW4yLav9YMhMHOhFeVtgPb61TH1mlAYWOLw73fIgPzqh0su9rFvLTRWv2J6ys+tgPWgjfpX9z1hT/CHbeLGaJTYwRxO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jGknsl3a; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QAecf22D; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tSKAfkd4 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RIIYX5012820;
	Mon, 27 Jan 2025 17:44:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Y0lEMyCVvHRPw0fTJEv1SRnsbgdQP/rZnscRS5ERRww=; b=
	jGknsl3aWh54vZNBmA7mwDfvdt4LJMls/aa0/N7ymgfDWsxUskxgUqL8NazqVUtE
	gsI/RDHtRi/QUzv50yw5AhFUVwX/2sTdngdL5MUh3hvj7XfyU/RoW3l5/FjRZU2L
	huS8lBXRb7k72jOBKjVx5C1KodvLEsBl/i8lcXIGa0cnDLT09gj708ZMpS92FvRy
	KQHbGfYF1b1E/n+zUha2sV05GHHZUVUFUnuntIH6Wgi8slorMjnR/9J+elJldOnX
	ZJrWwHxaix9KTyw816N9X7/gnzb73np6uYOvCQmmdQmHAN2ekn1SObDwWKL4O/VF
	K0VyY1zJUVLgQkPT0UtHSg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44efadsmqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 17:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1738028654; bh=Y0lEMyCVvHRPw0fTJEv1SRnsbgdQP/rZnscRS5ERRww=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QAecf22DAx/XWR5x152ymA8JEXxSR02+Ktph/DwHjzy5OM16nYn2DrsAMf6Y1G1Cg
	 3xz6TWzxjg9tnzfi9Bk6XAATD00OOHrCdi1PtNc9//hhVin3+va2g1ncD2Nv6jlMyR
	 yml7MJJBGjvNkziSWDbTagY7HeAK4aWMEn04y3IqZ614SthtvAx2efPZ/SHaZQQ4vL
	 zOJQH75icyfiwJ+pgOBp4kiV+uuAAssv2jF4mSOrIgs/Q39X1AThdBnoI2lR7ftPIW
	 Yxgi2Ik3SIU3psUBd2S5HeWXzCanMC65vvO+9aF5nGmTIVuP3mIDgmQioJezn2UpVo
	 FWbEw7f7yIF+g==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EB2E040110;
	Tue, 28 Jan 2025 01:44:13 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 7ABBFA0072;
	Tue, 28 Jan 2025 01:44:13 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=tSKAfkd4;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 53F3440122;
	Tue, 28 Jan 2025 01:44:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0eHBlLkH74jSPEIGy9GDlkwFhZDpZRz6lmFN9asBT9IhtwlGxwjz1AyBfONU65aTks2t1GpTmaXBzYcrUJsNxDA0GPXYqB+xi1RNLh6iofA/J3qbCveRe8vPO+v/8/igXHp6scFJ8LA3+B0MbCkEwm67wztRfhkh/NanHJekcu3GArH3/UNl/0jDv+FdOS7O90mHBolaWxf0FuHEy55r4khIKXk6AYclPSHtN6gC/+JH9dTYyKiDcWVGsNbHt/ZQcpyLZ8SgZ357EpKzZrsvq95j7FMtfCz5cH2Hx0mq9i1RI8DrX9q5DJVqZ6YyAJLCxn8txNO1UCWi3Nqnxqp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0lEMyCVvHRPw0fTJEv1SRnsbgdQP/rZnscRS5ERRww=;
 b=JmHUGorwAnneubupgEA6c3VnJiB/qnbHdrifoIIoWczmZo2/VpCTyE+jM5F5+OaAKo/jQLEbhSwKGjYmP963f+oQXle1bSG6vhlNEtkErptnfCIno6G0Oc9a9usf8fBkSwz9g575zd3jEGNv0c56PbJyscr3R2MUrILhZtb/jSspNm4+JIGsXFz7VS3OR+QI+MUhR7xfHUE+arRY7EQMZTzOIDE0fOEInfdF6oe6YQ1enVBkh4rmFz3XhtiCbbw/GQyAv5mLzrCctt9sEHbvYi3oLg+aFHEhXJDLOOvzXrKU5HApncBkn7SF8NjbFwLggmMVHu4qhK0rtUVDDfdW/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0lEMyCVvHRPw0fTJEv1SRnsbgdQP/rZnscRS5ERRww=;
 b=tSKAfkd4wFEHrn8ixxQWKv2p4zZACD9BekJ2zh1C1j90rBDNNrAGgATEMyrYnPaF236wLcpWLdibum/eGAZSYdGvPIzK4nO1ep7bSJSsax8bd9qAujFkIN+cyjXVjbMEoXtVzShcANgY4EbJKXNHePunnKgrideQbqiQMez3zaY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB7137.namprd12.prod.outlook.com (2603:10b6:510:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 01:44:08 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 01:44:08 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Roy Luo <royluo@google.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "andre.draszik@linaro.org" <andre.draszik@linaro.org>
Subject: Re: [PATCH v1] usb: dwc3: gadget: fix gadget workqueue use-after-free
Thread-Topic: [PATCH v1] usb: dwc3: gadget: fix gadget workqueue
 use-after-free
Thread-Index: AQHbbHehrFLU9nYZxEKMjqWESLja9bMrc0UA
Date: Tue, 28 Jan 2025 01:44:08 +0000
Message-ID: <20250128014400.7jx4segwn53vjnb5@synopsys.com>
References: <20250122024452.50289-1-royluo@google.com>
In-Reply-To: <20250122024452.50289-1-royluo@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB7137:EE_
x-ms-office365-filtering-correlation-id: 51a89410-6847-4555-7246-08dd3f3d41d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RU5raWU5bjlyME1lMHA5QWdYT1YyQ2JsaVFKSWtCNzJDMkZncE1jdjNUV29B?=
 =?utf-8?B?ZXY1aGlTeFNjRWplV0htRzVjT2NZM1ozMnk0Ty9KMFlySVFBWm1SVTNYZVRH?=
 =?utf-8?B?cG9NT3VNbEhEcDhabFJBelhrc2xHVTNwUEEwZjF0Y05OZEcvUFZ6RUpxYnpz?=
 =?utf-8?B?OEtlbWkvSEl1Wm9qL2k2WWd3dHJ6L2dROGdmSFNzdnRFWFl4emt2Uk92Z1U2?=
 =?utf-8?B?d24xZ2VMMjFxdy9qaEF5ZWk1RTRwVk1VamxSRS9wOCtCQ00zdDBEVmEvTFdO?=
 =?utf-8?B?YTIrdkNONS9GRi8wOWpzQ0Zvb29yVUw3NzNqb1g5VFRFd1A5U0ZkdTNCRkZl?=
 =?utf-8?B?WitERS83bXJxRjFXZjhvaHk5U2pGSng3YmNoZ09PTUtCY2MwZ21kUzVBZUl4?=
 =?utf-8?B?NzR6Rk9JTkNwRlk2cXhJNjI3NjR3MTVoRkxpSERmdHlRTjdlQmxEMEt0STFh?=
 =?utf-8?B?TFlUVU1LWG1sQVY3U0lRTCtYZEEwSkZXMFkyenc0ckFHMW9WTHhwWkFrYWtk?=
 =?utf-8?B?YjFxNm1uT2J4UUtlQSsyMjBHR0xIZjRtdThvdUpLUXNZNWtJVTMzdmdYYk02?=
 =?utf-8?B?Y1E1L2t4eGt3ZTVyeGZaRFlSMXlJaTJ4OHYxZUZOTnJNRmtDcGJ2czc2T0tG?=
 =?utf-8?B?UzBtN1NqMTgxSGNUeDdDUDlra2VHWkFKVHZObDRBNzNRbkpuQUxqYTdRU1hG?=
 =?utf-8?B?a09TcmlSc2c3ZkVPb1lIUlIxUU5hQ0x1UzBmR1FlbFg0WU4zeGZ2Tm1sSzNs?=
 =?utf-8?B?S3FZN1ByWmp0YVE5cGYzZk9GL3E5Q3R0Z296NE1DbWwzRWZGSFBGSUs0a05B?=
 =?utf-8?B?MnNhc0RtN0ZHVXl2Y1V5dHd2aW0ya2hNajJsNlQ4NkhjcjhVRmJmYXBNZWg4?=
 =?utf-8?B?SDYwdkZzOXdyNFQwcDM3VGdBcDd0MEZ4ZVgybGR0cGI4TUkrUmlqS0pKeDZp?=
 =?utf-8?B?YUp1NlZOYzA5aE43eTFCcmhrMFIwMmpGcWRTL2txRzkreHFvbVdhY1JlaGZx?=
 =?utf-8?B?RnJobSs5WDAvOUVoVDIzMDc5R3E1Rzd1amg0eko5a1RZOFV5WTBDYXpFL09I?=
 =?utf-8?B?RTVwM1hBK0tmb3E1TnNweEs5QVZoSi9acEhzNzJnd1RDRzByNjRNSnpXcEFq?=
 =?utf-8?B?c1dQWEI3ak5QY0I4TjZCamt5ZUdRcWM1OW81QWZqdjRGSnYzZ0JOOGJVdTVZ?=
 =?utf-8?B?V2d4aVlYdU4xZkJpcEtKRGVJUmdYL3MyekxkSmozd3htY0RUOEpETXBrMU4v?=
 =?utf-8?B?NWJjdUUwa0pGS095OTRxbUNPTHdOTmRUNEdXZExmdkc2SWJqbmZGTWxEeHRw?=
 =?utf-8?B?RTRHN3lTeVZWNXVyOWFsQmd1d0JDOWVhKzBnc3p3SUZ0ditVY0FHZTN4eFdp?=
 =?utf-8?B?TzIvb0p1VzdTa0lnczBnaDJCNjhwTVFvcjRLWWwwcWoyZDFVTmJTWTFKZ20y?=
 =?utf-8?B?cXRKbWFFNDkwM1YzdG55c1ZYTkFUYjZTY3VOZk5jNGxSRE4rTll4L291dWdx?=
 =?utf-8?B?QXhaUlc5OE9mQzJDOGYzTTRGTWpaLzcwTnB2ZzNlcUxVRHJ5aXEwSUxVRlR1?=
 =?utf-8?B?a2JKb1QvL3JWSTFIdWlDR1Y3ejg4N1I0clYrOHljRWoxd08ySFo0VWFmbm9X?=
 =?utf-8?B?Z1hsNUl6RmQwMGJoQWViOUtsV2QxbzVpQUs1S29Zd0ZMQzBSbW5NQUpndHA5?=
 =?utf-8?B?L0dXTXdnQWowNkZhRzd2SEZyQ2hHa1FJc1A5M3JZT1JnQWVocEhTL1F3Vk52?=
 =?utf-8?B?cXhoU1ZUZ294Zk9kN1VialA2VW52MXZXbVVFemF2YkFwZ0xmU1hHRWNScDFZ?=
 =?utf-8?B?M2dvWmdqdkFKT2M5Y3BCbjBUMW1rWlRZaEJkY2NnbisyczNxYll4OUMvUHQr?=
 =?utf-8?B?c3M1YW41d2dDazF2NlhZeXN4UXVkVk5QOFQ4YTBodWtFQkRtUTJ2eG56NGdS?=
 =?utf-8?Q?rikFoUmpXMaQ2KedgqOa5nr9+jia5nzv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UStaQUswYkJaejk2Rll0SUprSm1QY0tVZjNuMGdUbVhqZGJobTJJNjJNcjdG?=
 =?utf-8?B?OStsKzNGU3YwWWFHd25jNzVob3BEdy9nT09MdjNCKzdrZzlxV3c1b1VkV01t?=
 =?utf-8?B?SmJWKytsT0VZZll6YXdHa3FZZmw2clZmakNFaDFicE5KV0JndTZZaWRZWk9q?=
 =?utf-8?B?bkJDUHpyRDdJYnBnN09CUXJtQk9KV2s4OGkwUUdIUEJDQTV1UEcwODRzWHV3?=
 =?utf-8?B?eTUzeVBUN09lUVFJTWxkdzREV2dRSVh4NGk3MkV1VXhrbUdFQ2Fhc0RQQTV2?=
 =?utf-8?B?QUxCVjBIdGVybGRiakp0RWttZHdsTFE5VEVTYkFNWUxZdkNZY09DZUVvaWQw?=
 =?utf-8?B?MG12WnVDeE5WR3RFR3BSdktiM2V1UVd4YWtoM2tGa2VLR1JLbWhGZitibnhV?=
 =?utf-8?B?ejkvamJ5d0tTM1FneGU4M1hiNzR0Q05KaW1BZ2RtaWY5MjlrcVdOajZFY2dh?=
 =?utf-8?B?WUFSUE1TTVdJMkQ2NkNPaEoxNTN2VWZQeDJZMGN0Zmo4Vmt0NlUydC80QTRw?=
 =?utf-8?B?c3BsbU1TeXF1SGU1NWJtZHpqNklualhITytTVWJhTGdXZnhTN1RHZ3o4Wm5H?=
 =?utf-8?B?K1pQL2hsdU1Ea2RNcGk2eGlKQmt0VlJNbmxQakV0MFFTVk9jY1htbzFoZjFa?=
 =?utf-8?B?Mk9DRHZyK1hmKzVCZEVIb2QyWkJ6ZFhsamtrZDBrNWNKU0p0R2pORkVvdFhD?=
 =?utf-8?B?WEJJTXcyckwwZDZ5TzFXTW9idTRpMFNDQTVpbWdCc0I0N21leGN2VHpjUUFh?=
 =?utf-8?B?bjNGYWxwaVBCNitkblJ4bTRuTWN2L0dKem9GSEhwRGxHUkhHdDBUYy9vM015?=
 =?utf-8?B?eTBHd0VXZDNFZHltTUE2WDBINjdPbzVwZjllRFlxWk5tWll6VmFNUmlYMCtl?=
 =?utf-8?B?UmpUU3htK1Vrb1RpK24yb1BKZTdkR2JtaDNGNlpLdHpaWTVPL0hyeUNFZWVF?=
 =?utf-8?B?dlVtbHhLU2UvTFJrZFlZQTZXZVYrdVV5cEtrd29MQytJOEdtOFNTVEdtL3Qr?=
 =?utf-8?B?ZzVtTXA3ZklVQklqZG1ORnpYdU9nWHkreWtsYWpwVHVqN2tnRXBHUWZPYVNW?=
 =?utf-8?B?WFA0WU1LQ1VESG5wYUFtNjBqVHZLdXcrNU15WEIrVS91ZU9iaHA3eGhhVHZM?=
 =?utf-8?B?c1JPanUvaGtRQk8vTVZkcVRCVjVHcWJYY2dqZWIzRHJTWTUzODRjU1liVHVX?=
 =?utf-8?B?V1UzVFZQSzlNUWVoVWVOYXkyeHZmQTk0VHZlcjhDUzlpWEg2MUQ3QUFtSUp4?=
 =?utf-8?B?bnJlemEvTjVtRTcwZkU4VkNqS1NLV3pCM3BtSWlnK08rb0ZwbE9BaE54Sjdv?=
 =?utf-8?B?T1pSd1hKaGlPUDYzaCs3d2ZiVzhVcSsvcUQ2aXFiTlRxZ3VZU1BTKzlJT0to?=
 =?utf-8?B?UktxT2laYWYyekRtd0ZwMTlyM1RtUjd6R20yTkFvTDZqNzJod0t6Mml2VzBI?=
 =?utf-8?B?SWRqRWI1anlaRTFOeFNhVk9Qbm1FbG5Jb1JodU05cjNkcWo2aTlpVGxkbVFj?=
 =?utf-8?B?ZlFvekoyQzI0b3RyMWtIa1A3MHluWjMvUXVJV2d1a0dmYXRjZkczOElkY0dH?=
 =?utf-8?B?aHlPS0tJVWxpZlJ4WlpZd0VaQnVyZUwzWm9zbWg1T1Y4QWd2REx5SHFTZTMz?=
 =?utf-8?B?alRXMXhBTmU2cnlYTWxEN0JjcDhtWmx0NWFBY3oxNEhVNm9Bb25BZXFWSkM5?=
 =?utf-8?B?TXY5SUQxN1pTMTgyay9uUTR1WHRNNzVBTm9DbEptTnNzUUJHWFpDSCtKcVJS?=
 =?utf-8?B?MkR6Wkp1aU8wSHZVS24rTVN6ZVpyWWpub3NJQTFhK1c1NW9taFlReDJuMGdi?=
 =?utf-8?B?MTJtWDNJdGRDZzc2WitvQk1RNk1xRlZCNmFMUjdzSHVwWG1tRVd0YmwxOFd4?=
 =?utf-8?B?ald2QXUrTHQ4UE9IN0RDR09qU2VEeGljNzdURWkweS91NXE0cXNjZnNRRnBW?=
 =?utf-8?B?VTk1U1BWWHhzME92dXd5U2N5bWVYSEloQW9COW93c1QxRmgrdGJ6V0V6UGVs?=
 =?utf-8?B?N2poNGdZMGlJZllUbUhzSjluMThSTFVEaUtuZFdlTURBR2IrYlJnZTljaWJv?=
 =?utf-8?B?VTJKNGRqTU9zd21yaHhBVzhaSFVuVG4xZVZyT3pGOFN0M3N1cFZsUDYyN1A5?=
 =?utf-8?Q?IM8p8jqnlDk+UkHfGKSTmadGh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <41205E842AB1FD46A2F3B7DC370AD66C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	04Y10fCh7uyJipReL84mGwmF94o0scRWj+ieXLgpWsaKRpbdhfPOWStmLN9+hF3K4ebh9csyCd5jA4LUesta3IVFEHKpYrmcNZAiWNYCSWCfOoUGCjjADXBUz7Jl0Ww/N1gnQpMxAJRqgrHMnCSUEoS2xpDTfaulmBzpZWOn/WU7mC4XtoSfZuviOXG6gpXvAuB/HZ8hRwh7kkFm08ArapgdN6rzOP7RMEhZvb3iaeYtumC4d1J/INMa6+kmhDvHVFlpnPSMcpm5iLblD6gi58vrP0vPRlZavX2zxcC87kIPz95SF7u9Em0iOL0LowO9hzs62CSqXqDz3fwWhH/46ciX5guMV3aTPmUJFhc4A3UvJPHhotSbq8d3nOGBp9ITtWg3iZi70Bfhg/UMKr0Fbu6khIzQlXcSHhgMZtJD4tQC+iaps0s8j+laCygzGv/tu0L4RThEvSDLAs0DLxRan4kb9eDivNDZ7vWMcVvuh2qR0KS2kfaeWR7MY+p2bNWzfipTqyRU+WlCBogUwom8+kS/M+zvLQGts4g8Vla1HUygGWqBoMDvMHRge/FylpeWtu2tfKcnkYnWRnrU3frJJBl5jt137Sd95kQ6Poe2RUdGVHXwMVcyvRVLad7xrPyBRQGLuL6G/B+gLICN2RH8qw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a89410-6847-4555-7246-08dd3f3d41d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 01:44:08.6176
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: banQSvupClvr8GCK1rTsCiB3YltgH0aj5DADyT0L/89CX+5dN8jQmerOE6Ax2QRJFaOLkdhe6ZGpyt8Ke9yMPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7137
X-Proofpoint-ORIG-GUID: kQqNxW-7nGpHYY6HAHRN5r4SYNNFZdYy
X-Proofpoint-GUID: kQqNxW-7nGpHYY6HAHRN5r4SYNNFZdYy
X-Authority-Analysis: v=2.4 cv=VtfZA/2n c=1 sm=1 tr=0 ts=6798366f cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=1XWaLZrsAAAA:8 a=Jd7s64i8MjAozNvHXbcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_12,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=772 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501280010

T24gV2VkLCBKYW4gMjIsIDIwMjUsIFJveSBMdW8gd3JvdGU6DQo+IGBkd2MzX2dhZGdldF9zb2Z0
X2Rpc2Nvbm5lY3RgIGZ1bmN0aW9uLCBjYWxsZWQgYXMgcGFydCBvZg0KDQpUaGUgZHdjM19nYWRn
ZXRfc29mdF9kaXNjb25uZWN0KCkgaXNuJ3QgZGlyZWN0bHkgcGFydCBvZg0KZGV2aWNlX2RlbCgm
Z2FkZ2V0LT5kZXYpLiBJdCBzaG91bGQgYmUgcGFydCBvZiBkaXNjb25uZWN0Lg0KDQpDYW4geW91
IHByb3ZpZGUgdGhlIGZ1bGwgc2VxdWVuY2Ugb2YgZXZlbnRzIHNvIEkgY2FuIGhhdmUgbW9yZSBj
b250ZXh0Pw0KVGhlIGhhbmRsaW5nIG9mIHRoZSBmbHVzaGluZyBvZiBnYWRnZXQtPndvcmsgc2hv
dWxkIG5vdCBiZSBwYXJ0IG9mIHRoZQ0KZHdjMy4NCg0KPiBgZGV2aWNlX2RlbCgmZ2FkZ2V0LT5k
ZXYpYCwgcXVldWVzIGEgbmV3IHdvcmsgaXRlbSB0byB0aGUgZ2FkZ2V0IHdvcmtxdWV1ZQ0KPiBh
ZnRlciB0aGUgd29ya3F1ZXVlIGhhcyBiZWVuIGZsdXNoZWQgaW4gYHVzYl9kZWxfZ2FkZ2V0YC4N
Cj4gVGhpcyBsZWFkcyB0byBhIHBvdGVudGlhbCB1c2UtYWZ0ZXItZnJlZSBpc3N1ZS4NCj4gDQo+
IFRvIGZpeCB0aGlzLCBmbHVzaCB0aGUgd29ya3F1ZXVlIGluIHRoZSBgcmVsZWFzZWAgZnVuY3Rp
b24gYmVmb3JlIGZyZWVpbmcNCj4gdGhlIGdhZGdldC4gVGhpcyBlbnN1cmVzIHRoYXQgYWxsIHdv
cmsgaXRlbXMgYXJlIHByb2Nlc3NlZCBiZWZvcmUgdGhlDQo+IGdhZGdldCBpcyBkZXN0cm95ZWQu
DQo+IA0KPiBGaXhlczogMWZmMjRkNDBiM2MzICgidXNiOiBkd2MzOiBnYWRnZXQ6IEZpeCBpbmNv
cnJlY3QgVURDIHN0YXRlIGFmdGVyIG1hbnVhbCBkZWNvbmZpZ3VyYXRpb24iKQ0KDQpTaW5jZSB0
aGUgcGF0Y2ggYWJvdmUgaXMgbm93IGluIHRoZSBtYWlubGluZSwgbWF5IG5lZWQgdG8gYWRkIGEg
c3RhYmxlDQp0YWcuIA0KDQpUaGFua3MsDQpUaGluaA0KDQo+IFNpZ25lZC1vZmYtYnk6IFJveSBM
dW8gPHJveWx1b0Bnb29nbGUuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmMgfCAxICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdl
dC5jDQo+IGluZGV4IGQyN2FmNjVlYjA4YS4uMTIwNTVlM2FmNjIyIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmMNCj4gQEAgLTQ1ODAsNiArNDU4MCw3IEBAIHN0YXRpYyB2b2lkIGR3Y19nYWRnZXRfcmVsZWFz
ZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICB7DQo+ICAJc3RydWN0IHVzYl9nYWRnZXQgKmdhZGdl
dCA9IGNvbnRhaW5lcl9vZihkZXYsIHN0cnVjdCB1c2JfZ2FkZ2V0LCBkZXYpOw0KPiAgDQo+ICsJ
Zmx1c2hfd29yaygmZ2FkZ2V0LT53b3JrKTsNCj4gIAlrZnJlZShnYWRnZXQpOw0KPiAgfQ0KPiAg
DQo+IA0KPiBiYXNlLWNvbW1pdDogZjA2NmI1YTZjN2EwNmFkZmI2NjZiNzY1MmNjOTliNGZmMjY0
ZjRlZA0KPiAtLSANCj4gMi40OC4wLnJjMi4yNzkuZzFkZTQwZWRhZGUtZ29vZw0KPiA=

