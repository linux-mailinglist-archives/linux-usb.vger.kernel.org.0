Return-Path: <linux-usb+bounces-22775-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC307A81A65
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 03:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C18CE4C1DCE
	for <lists+linux-usb@lfdr.de>; Wed,  9 Apr 2025 01:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1314913C9D4;
	Wed,  9 Apr 2025 01:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="I+fxdm5w";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KBDmnetk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ajg+jDMM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E7F27726
	for <linux-usb@vger.kernel.org>; Wed,  9 Apr 2025 01:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744161434; cv=fail; b=DRYDIzC6PGAT50rqFR9DIrxlY0UzRM/fPtLM+vhzKr7DbLPT0HcutfK8ynQZwf6xWN1MiBNIaEI0D88UtRyBBseuI3LWawYSB+JR2RE4J8lwJ2NCh4zaSy4wnad24S14B7BpW2xnhE2fGSuFEzrsno7votNnrYVGkz5WzSMPD7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744161434; c=relaxed/simple;
	bh=QZVGcmINxPfL67hL9SsBlAYRJzxXS1m7LBkyXXE/8ks=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qd/xJiKDhVcpUNPHlIb1oYvyzMsTz+VlAK1XLJt7iVm4z4EeGy7yCm51+jsNZeemGKJlbtkL2WHK0Wrc43hm8fPKxknMzzy/XbuVX3A6Es8XtemOyoz83/XIn8eQPDVqkz4Z2VF+9DXQK4g6nL6m7S59K2Of7rgjskklPsO+jE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=I+fxdm5w; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KBDmnetk; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ajg+jDMM reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5390M7f4031426;
	Tue, 8 Apr 2025 18:17:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=QZVGcmINxPfL67hL9SsBlAYRJzxXS1m7LBkyXXE/8ks=; b=
	I+fxdm5whOY406l3D3Q4P83L9O5cf9l0fTbTEB1YZ39FVSrIKWnssCkMUuFSPKkS
	Ru5XMSzBP6yihabsF9AaWWfu0C4ieEl6n14QK3+L5Pd9EVQDZgoDnuXxnpzqo8v4
	IR1pLBX0IoF3QeWKXUWcuNGPQ+hanN9AbvgAZ9F3uTF7DyQazICWTg+Rf8HLnwwS
	TwZA7muc9C0bytKtOXhYC5jXFkatIXIs8mm3Q2uSFIQbDJoLnNMRhMsDfpkMmO0X
	0J+ClpXxe0QSDu2QOeymiDd3i3OdDEBIwbzn79OOo6E6pTT8+d3VgBuXpc7KWqY/
	SELIjGygzS+6heMHHYDR0Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3hpj6np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 18:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744161421; bh=QZVGcmINxPfL67hL9SsBlAYRJzxXS1m7LBkyXXE/8ks=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KBDmnetkGVsePqgLT+Qo7fgv5CdSPv6jJ1Mov3nIQLTbmZGE1KsB/vb959wqAkkGP
	 wLyHi21nmOvkvXjWvvHeG2WiJ6qVNU7LeNeDtJc3hZ7XQlofMZLlQcIykdVO61EVBD
	 8exwXV4GBjPDBtT+5jBTwQfT4BSc/15D6h08qD6nPzDtxi0TMEjiLQIaOn46Qg5pmi
	 EOzAkaJ2NtGMNVcCJUwW1cRpZ+r7jKGgpQlFc6J4mCH1xzbkAjVxlFD8lJOiqobdyZ
	 gShd1tMTYUQJcAmFwFbsXhTf9OnaIvlpWKjZGbdgEsovu0vSnLQZCBW/6Dhg+4GcxG
	 +09oKDv5LeqqA==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A197E4012B;
	Wed,  9 Apr 2025 01:17:01 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id B2D36A007A;
	Wed,  9 Apr 2025 01:17:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ajg+jDMM;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BE568401D0;
	Wed,  9 Apr 2025 01:16:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bo1buOGII6AVWwOBkVh+8LEn9PejQU98UFoO7yJRJYzfZOMnxoGPrH+W0ei3w58Plu1avqY6KZnkkkh8cMlPKQk3NguVjHgDlKgCSZkjBOg/+hyGIkvLI9QzUOJJp7SI4Fyza8ieSrJ7vYzWJV2o5R71J21UGOyK9JpDe2teuHooecsoXAFhP6MFEzVHWFdRkdkcVO0s4JkUmNJftS9RVeG6MwM3CaD+J0xPeAINEvaOzpqsw2UzqT1eaSIEd+hfFLcQJT06dY9NrDRi2HMwla63raZH+zFwMbeupu6Df3oIZpeQ2Gi1M3sKnzE1LK12Qu+ufOdjudBI51S0ZsjfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZVGcmINxPfL67hL9SsBlAYRJzxXS1m7LBkyXXE/8ks=;
 b=Q1ndml6Fki7V/lac6UKQLavI+eDRfuV86CnuvRHUkEdNCAj1Q0uvsQWyxOAfLrnz4PkAU4Bl51+K/pRS/kYyEsfdmerDlnnAkGcXl8zyRk/l8xCa/bf6t+Ntboh/8aI2n2Ol3zEtwKWR05cDHto5OG35Gt6E9322hEE11kGIDQ+X0veS6SXJDWONSCg5/yY/eW4FCles2OHjCWxMTtAxHUlkLQt9qqXFnxPdZIrrHSRdzUV3V0myRcZE3rlSqo0DNIsYZ7GE4pg844jpE8giTcYaIIFH1XeK5xjhmmND7oarOzYzWFZknlCe2vZGF3+IettrdiXMcaKXoEQJ81X+Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZVGcmINxPfL67hL9SsBlAYRJzxXS1m7LBkyXXE/8ks=;
 b=Ajg+jDMM8X36hSyRf2dVxmAkoCv7wWcSwb/PnU1xV7b9yFGNLpUjdlfDZMQkc382Vfb9ytRuGF1IpmfvErTSn05/oql8H4+slBExBZU1NAZjRKlfkH6yxZLlKvb+rK3OM9Qsqu+oIqjKPvpgZ/UkDoiK5PqPvYNJBMFOnE71SIY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 01:16:55 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8606.029; Wed, 9 Apr 2025
 01:16:55 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frode Isaksen <fisaksen@baylibre.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Frode Isaksen <frode@meta.com>
Subject: Re: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Topic: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Index:
 AQHbnyLuqf9Hu8uhE0ul0JwT/TVjubOPgwsAgADYZoCAAKFwAIABD9gAgAbixICAAIS9AIABJ6YA
Date: Wed, 9 Apr 2025 01:16:55 +0000
Message-ID: <20250409011652.kr2q7keumvykxser@synopsys.com>
References: <20250327141630.2085029-1-fisaksen@baylibre.com>
 <20250401234908.npkn5h3vdyefkvxr@synopsys.com>
 <26644fc1-98c1-4443-9809-b7e4d6cec2e3@baylibre.com>
 <20250402222128.2soczlkfwonz7r3p@synopsys.com>
 <cf51ea66-24b2-49f4-87ec-5165249d53c5@baylibre.com>
 <20250407234337.ejaghhulwqumbk3j@synopsys.com>
 <fa1b7d70-b40c-48cd-9dbe-61b6cf6f8d6d@baylibre.com>
In-Reply-To: <fa1b7d70-b40c-48cd-9dbe-61b6cf6f8d6d@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ1PR12MB6194:EE_
x-ms-office365-filtering-correlation-id: dfc972fe-86a0-4674-d110-08dd770437bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q3BSUGJZSnQwdHlyK2xzbmp4dUVoc2taaWEzczA3T0pJdGFtcmF2Yngwcith?=
 =?utf-8?B?c2FSMXU0NEQvdFVvYkpsME9vTGFHY1EydXVXOFdUQTVhWmlmZ1UweFBtT3A3?=
 =?utf-8?B?dlFhRmRvSDJXa2dVQnZQNGZGWVg3WC9uVDV1bG5Xb0R1MSsxclg0OERTQ29z?=
 =?utf-8?B?RzFZYzh2dks5bzBMSU42MmVveUlhTGg2ajg0M3UrT0xJcHVvVk1wV1VTRGdX?=
 =?utf-8?B?V1FXMlllNlM1eHFTV0VSSzN5UFEwQTJieGppcC9CSFhGU3NVYmlTVjFBK04x?=
 =?utf-8?B?VTJFdFVZRkpJVEpVdEQ3REhKeU9VUitYVmdkYytJTEJnaXhoanJjSFZ2Yy8y?=
 =?utf-8?B?clR3MmhSZW92aUFUZjV4eURDYXQ4TzJiVkJtV2RSdXRacDUvUHNPdXJTMDZp?=
 =?utf-8?B?V25WVFgvNFlSWEQ4S1hFZGF3MWt4WVJtZkJvQk5aR1haai9BNWlxRTVhVk1R?=
 =?utf-8?B?ZnUydXUxdERiREZ3Y1NldWJzTEhDS0ZWcUVYR24rK21zUUlNMktXUkdVTTdl?=
 =?utf-8?B?eDZ4ZGVWL3BpcTBCVkZOS0xMMmhxTmRlSER2NFJpbm14OWJvTVJqZW1tOVBH?=
 =?utf-8?B?S3ZnWXNyRXFjbHhMYjdzWjU5VTRMVjUvaC9PSW92cnpKV1kwWGh3dnZIaG9K?=
 =?utf-8?B?aXR1dlk0eGxOaEE2d3JqS0ZYdWxhQldYN0RaSGhTUFdNSUtCMUVkRzQvVWM3?=
 =?utf-8?B?TkZ3b3BtOFo5Q0xVRmJnR2IvN3dzSGhLT2VRd0tjVWNDZDBRWGRzTkxMRjZt?=
 =?utf-8?B?NmM4VWJ5eEdGdU5iNWRZeDNpQzF2QkxHQUhydFA0b3JhTUNPaXk5dmtqL0dv?=
 =?utf-8?B?bklmMTdxa29TNFJUOXY5ajhTd0xHdFNCU2cwN1FxODUxRVpINVRrbkVKQnZZ?=
 =?utf-8?B?bm5jSllteE9ZVXFnNmlHSisrZmtQSlljMUhKT244cXZkRVZkSmlRclV5UjB0?=
 =?utf-8?B?cWJubDdNNzFka2IxVU5ZZDk3TnI4SFVabjdMTW9yeFNvcE9NaEhaRFZ1MTFx?=
 =?utf-8?B?MzM3S1YwQXpMTm9NRzJIY2VxQlBjekxDbFVnaDZMSW4yMTR3SnR6ZFNsMVIw?=
 =?utf-8?B?cmJhYWlRSHhlZmsvN3ptc2F6RFlXa3pzWnlhVGxreDdBUFdiNnJSaU9wZkpv?=
 =?utf-8?B?aEhQNmtvNDRFUmpDV01WYWc5SmRmMnhaU2Z0T3hQaWplZk5zQzVYNFZsUHRz?=
 =?utf-8?B?ZzBEQ3pEYmc1WU1kSittTFFUMGNHdE5Icm1SK082V2tsTHd2WDgxUFBxWjlw?=
 =?utf-8?B?ZUhINW5pMTcyOWZxMzlrZng3bGVmKzRBcFVWZG9JS2R5c3ltQWk1MWNxdjlE?=
 =?utf-8?B?V0Q0aUtiejRvMDRrbGROc3FWby9xbmdxVFl1NzZJRGllVzhWY2swdTFkWHJq?=
 =?utf-8?B?SjNPcTZ5MVAycGdLcXFXTW45ZkRuRVFnb0NQMXVCdzFzNTlsTEtjRURqMkkr?=
 =?utf-8?B?RTZOZGErcUQ3U0JWYU9ncS9wejZvWFc4NUxHWms0VWJkNGd2R1VDenV0OXht?=
 =?utf-8?B?YkF0V29sR0Z0eVE0ZFpiSjJqRjBsVjhqd1d5aml4bWVQN2FVdzhLbU5ibkZn?=
 =?utf-8?B?ZXJCQ0ZiSHk5ZHlGSUNuZS9PbHZqQ1FjTlVZREcrZ3hEN1I1YW5oZXV0c0Ja?=
 =?utf-8?B?d2JISmhXczBVY1JVb0JtNFZySThRVFBINTBLc3J6UTJScXRmaDZDRGF1dGJE?=
 =?utf-8?B?MXA5SDdld2I5QnJENC8wRmpBdUJmQ2xiak54N3M2dWVIWFd0ZDBZMStscm53?=
 =?utf-8?B?elViOVplL0ttRDVuMDlJcld6ZGRhZ1BNL2xSYVA0a3hBaXBNRkEyQmxQZy9w?=
 =?utf-8?B?N2d5UmZ6UnRtd3drOTRwRlp2TGpqQXRZNGZnV1NuUm1FRnVUVVoxeG9iUUNm?=
 =?utf-8?B?MWpIQ3BrTm9YNEJpZXNGRWp3U3BWSU9mN29vcFRmVlYrSjMyMmEwWTA4Nlcw?=
 =?utf-8?B?czIzQzNPRVhpaGVsQTRnUFNEM25xWmRYZGkwR3NyRVU0TWtqZS80dVV1dlVl?=
 =?utf-8?Q?lj9wEdkEDAIrqWbqCrvslFFaZIE30w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dk1QTUtVaG9WcHhwTlJnWkJQZUQxZk1wU0YvOFNUMm1IZkhWWlhTZHZPYStR?=
 =?utf-8?B?UUU0VHlPTGVKNnRqdStiS1hYTVRvS1VBRksyNVphaHdBckNUWU02ZkxoL3BS?=
 =?utf-8?B?QnFEOURQTEQyVW1YMHpIZnBZQXR4T1gxcU0zUFV3cm43djNGa0o1a3hPYlNU?=
 =?utf-8?B?TklwSTdlN2dxcFBOV1NWaGNHTFBVVGJoY1BTbllYNWlXMlB3T3R3Q2tmWWxl?=
 =?utf-8?B?UEMrMU4waVM4Z0IzRFNPRk1FWlRjTm9zUUtLR3VHa1Zkc3NKL1BGK0s4QTd2?=
 =?utf-8?B?S0VZZDRjbGJPcUx2TFExTnRVM2p4d1N1L29RVlkzL1hkdE9qUW9Va1lJbDVo?=
 =?utf-8?B?NnppcmZ3Y0Y4WVQ5S3R2V210SU05OXNxeVhydThRWVhpVXoya0Q5am11dnpI?=
 =?utf-8?B?dXlJdUV2dXFuVm1DU3V1SVVpN1kwTjYyU1BvNzYwWm9vVU01d3Q1dk5sYUtN?=
 =?utf-8?B?Ni9TZGt5aS8zZE1VbG1mc2FKRUg2NjNDRHI0Ym5JWEpZS21TSXMwU25hSExx?=
 =?utf-8?B?MVZiTFF0QzBlUmJhK0pFVnZhY291b09wS3pyVE9ScDBhdlAwWHF6MEUyVHVz?=
 =?utf-8?B?dmI2MFljV0N5RXc4RzhTT1djK2xKZ0I0WlZmd0xlVS9QazNzNUlyR3NrRmNU?=
 =?utf-8?B?L3RLSjYvbmN5S1plbmxiV3daSUJtaFBkVWdFMnpTVnVxZFZjTVZCTjNXSjll?=
 =?utf-8?B?RUJkQmoyNVU2MlE3SGV5UWRMYjhseWNMYjcxMjlRVXlWWXZLSHpSZ3ZnQjB2?=
 =?utf-8?B?dFFIclBCTGszdmYxaFlTaEREZ1lRcHZIMzNnTWd6dXFwMU1EaVBtRzF5RUJt?=
 =?utf-8?B?SC9tQTRoa0tiL2J3Ni8zQlNzODV1dFJTM0dKV0RTM3RaK3RlYVFCZk9rT3Nn?=
 =?utf-8?B?OUJ4YjdOR243R2labFJOZmdJbUdzUElvSzVGQk9NTHljZmtEMEZOMDJuUzJa?=
 =?utf-8?B?NXdubDdIbnkvNXNveFBnUDVZNFZEYUhTZFlKNHl0N0Yrdm0xNi80WXI1M055?=
 =?utf-8?B?amFFbUhwRWw1RHc5MW04L1Jxc2F3UVZhZ0srZThMYVpHRmtreGZSVjVpd20v?=
 =?utf-8?B?OXN5K2grLzhMYWt5ZDlKOWExZmo5QzBwMlYwSzdWRUZ2RGlKTHZmb2hBMnUv?=
 =?utf-8?B?eXhOOE5mMXFLUUk0OTJ2VnZjNlQwdDhBdmFGN0ZPbkZMbW9rRjZGbmxHZG5R?=
 =?utf-8?B?dnFnV1gwenNXb3pqcjVodTJoQWRLaUtoVHNWWld6WUVOVXBreUtGcWt2NEUv?=
 =?utf-8?B?RzRGMDBna2VYeTNwYldkYnAxY2FQMmNhRVYxUm84WXB0WWN3bHZONnhoTnZG?=
 =?utf-8?B?WFpJYTEvS2VCQVFNbjFWYWNlbWZkOXNxazJMc2Z5RWRKRTFCcWFKbmVQYWU5?=
 =?utf-8?B?KytOTkJNMFR6WlJyM2RMYjZtdXByb2lIMnh5eXRLSEhXOWdySG5JMDJ4aHha?=
 =?utf-8?B?WFBMS3cyTGNwS09WcW1KQTFkb3g4c1hXelBtUWlCU2xsMlFxMzNSSGg3OFNl?=
 =?utf-8?B?SUdVWXhHV1IrbDNHQnpCcU1zVzU3amJ0RHhIbDV2akJPN3J5SFQ1SzYyRXh0?=
 =?utf-8?B?NTNtK1ZxRjJMeUxrYWl6d3M4bmpTV2pkc2RWek1rUzZIUXd6c2tyQ1JwMk0w?=
 =?utf-8?B?bXhOUms4ZGxHTFVzUnZ4eVZBaVptR2dZalJ6Wlgrb0Q4SnNaYkhiWWdXN3h0?=
 =?utf-8?B?cnpkNU5weWpMOXRlNTdNcXdxdHpaVnR2NEhPRzZrZ1ZIUmJjSS9ISjNCcUR0?=
 =?utf-8?B?YXRUSDBSa01qejNQYTdmNktsZ3BlYUVkVVRtNFU3R3FGM2RVM2FrTlRRcDBH?=
 =?utf-8?B?ZHVWYzMyMHNUZFpPVVA0QXIwZGRKRUdYRlBLaHB4eExYWVIwSkRsUEFodkoy?=
 =?utf-8?B?QjFtWFZlYmtzZ2xFMU12b25yNWpJQ3hSaXpOSjVabjBjbFVzTnZmWExsY3VZ?=
 =?utf-8?B?S0xxNS8vWW9sZG9QK01UZ3dkL1Nnd2x0bEFMZ1NDaUpCVFNKSWQ1SnNMSFc3?=
 =?utf-8?B?YUozdHhrN1pNZlM2bjVKa2NOaVpYQlJoZXZrNHhiaGdyY1R3SHRNSms0T2xr?=
 =?utf-8?B?TEhyQTlPMTJ3WnBpa0pHVmNBM09jbklZcmladXdrYklaejhJVUVxQk9lcXR2?=
 =?utf-8?Q?W0v9HyLXtyYR85n0aEM3bMmRM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E95986D65359146A3671B6519D63220@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7/OTNUrhydtHTfRo4RiLOqOaZ4LE0toKEDvGq/+kY+PsJaQgzLZU2YxijwGunauMfSyaFviPQYKWTGv/RhejktzcSADKyDJjnEKdgrdLAJtQ3zIkQlM8R1gEjaIfXFnweizFPVLQXbVkgY3oAbS1aQhVTumUlAr1NiIuab7oqiNwRrA28s+gJe1+8k6dA4tDSV3FKARFsxrMGGKGrNGdHrm+/xx82EiXJ3536fvRw0pW+NP3/OLtpaR3uqA6GkXxaGFQECsl18ludt37ybN2JsyZFkYZDlQdVChBMj07DxzchoWJ0bT5311GDqgEHbA/3sIqvN/g5dt2yDAd6tz1K66W6jKsUDjEranoVnr/L4Cr+H8p45LnJKqE1vp6xhuqILZMqrY0wWvTVwvIYdib18JsFe1Z5q+dHTAniQYZK+1+TrxVpDrgOS8HnieaRphnuKXrCCBSt1qI9NMcAIYSN0WrRyid2isvm4c5AxxbN7iMe2l9kqLORTg6QWvQ9+aaFd+ymlVMi1qqbqnf4jSVKjhKLqI0CJpzaq3OTLHuoA5vv7vGHstfGVVvF4Gp+Gv/yrKu/oeIzEpQdZEgsJl2pbA3CpN73IHNNAWA44PoRPMphLtuqHo9MbOYegT0Yo7FIxs6EPsdxAuG/YuXmIluKQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc972fe-86a0-4674-d110-08dd770437bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 01:16:55.5127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HvOdcz6J2voXgKNrvhZMGwbFW+y+OF48zvK8a2MXRUJ51yTi4vtvCMC9QwrJGMgJSoAUcsvTB8QkOoc3II0PDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6194
X-Proofpoint-ORIG-GUID: DWCuThXxjJOfx4bFN29M7q0aDsOV4MPu
X-Authority-Analysis: v=2.4 cv=XIAwSRhE c=1 sm=1 tr=0 ts=67f5ca8e cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=9ASqAVxQsIhdEGLnMGoA:9 a=QEXdDO2ut3YA:10 a=kUyRy_6n9IIA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: DWCuThXxjJOfx4bFN29M7q0aDsOV4MPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090002

T24gVHVlLCBBcHIgMDgsIDIwMjUsIEZyb2RlIElzYWtzZW4gd3JvdGU6DQo+IE9uIDQvOC8yNSAx
OjQ0IEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gVGh1LCBBcHIgMDMsIDIwMjUsIEZy
b2RlIElzYWtzZW4gd3JvdGU6DQo+ID4gPiBPbiA0LzMvMjUgMTI6MjEgQU0sIFRoaW5oIE5ndXll
biB3cm90ZToNCj4gPiA+ID4gT24gV2VkLCBBcHIgMDIsIDIwMjUsIEZyb2RlIElzYWtzZW4gd3Jv
dGU6DQo+ID4gPiA+ID4gT24gNC8yLzI1IDE6NDkgQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4g
PiA+ID4gPiA+IE9uIFRodSwgTWFyIDI3LCAyMDI1LCBGcm9kZSBJc2Frc2VuIHdyb3RlOg0KPiA+
ID4gPiA+ID4gPiBGcm9tOiBGcm9kZSBJc2Frc2VuIDxmcm9kZUBtZXRhLmNvbT4NCj4gPiA+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gPiA+IFByZXZlbnQgZHdjM19yZXF1ZXN0IGZyb20gYmVpbmcgcXVl
dWVkIHR3aWNlLCBieSBjaGVja2luZw0KPiA+ID4gPiA+ID4gPiByZXEtPnN0YXR1cy4NCj4gPiA+
ID4gPiA+ID4gU2ltaWxhciB0byBjb21taXQgYjJiNmQ2MDEzNjVhICgidXNiOiBkd2MzOiBnYWRn
ZXQ6IHByZXZlbnQNCj4gPiA+ID4gPiA+ID4gZHdjM19yZXF1ZXN0IGZyb20gYmVpbmcgcXVldWVk
IHR3aWNlIikgZm9yIG5vbi1lcDAgZW5kcG9pbnRzLg0KPiA+ID4gPiA+ID4gPiBDcmFzaCBsb2c6
DQo+ID4gPiA+ID4gPiA+IGxpc3RfYWRkIGRvdWJsZSBhZGQ6IG5ldz1mZmZmZmY4N2FiMmM3OTUw
LCBwcmV2PWZmZmZmZjg3YWIyYzc5NTAsDQo+ID4gPiA+ID4gPiA+ICAgICBuZXh0PWZmZmZmZjg3
YWI0ODViNjAuDQo+ID4gPiA+ID4gPiA+IGtlcm5lbCBCVUcgYXQgbGliL2xpc3RfZGVidWcuYzoz
NSENCj4gPiA+ID4gPiA+ID4gQ2FsbCB0cmFjZToNCj4gPiA+ID4gPiA+ID4gX19saXN0X2FkZF92
YWxpZCsweDcwLzB4YzANCj4gPiA+ID4gPiA+ID4gX19kd2MzX2dhZGdldF9lcDBfcXVldWUrMHg3
MC8weDIyNA0KPiA+ID4gPiA+ID4gPiBkd2MzX2VwMF9oYW5kbGVfc3RhdHVzKzB4MTE4LzB4MjAw
DQo+ID4gPiA+ID4gPiA+IGR3YzNfZXAwX2luc3BlY3Rfc2V0dXArMHgxNDQvMHgzMmMNCj4gPiA+
ID4gPiA+ID4gZHdjM19lcDBfaW50ZXJydXB0KzB4YWMvMHgzNDANCj4gPiA+ID4gPiA+ID4gZHdj
M19wcm9jZXNzX2V2ZW50X2VudHJ5KzB4OTAvMHg3MjQNCj4gPiA+ID4gPiA+ID4gZHdjM19wcm9j
ZXNzX2V2ZW50X2J1ZisweDdjLzB4MzNjDQo+ID4gPiA+ID4gPiA+IGR3YzNfdGhyZWFkX2ludGVy
cnVwdCsweDU4LzB4OGMNCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEZyb2RlIElzYWtzZW4gPGZyb2RlQG1ldGEuY29tPg0KPiA+ID4gPiA+ID4gPiAtLS0NCj4g
PiA+ID4gPiA+ID4gVGhpcyBidWcgd2FzIGRpc2NvdmVyZWQsIHRlc3RlZCBhbmQgZml4ZWQgKG5v
IG1vcmUgY3Jhc2hlcyBzZWVuKSBvbg0KPiA+ID4gPiA+ID4gPiBNZXRhIFF1ZXN0IDMgZGV2aWNl
LiBBbHNvIHRlc3RlZCBvbiBULkkuIEFNNjJ4IGJvYXJkLg0KPiA+ID4gPiA+ID4gPiANCj4gPiA+
ID4gPiA+ID4gICAgIGRyaXZlcnMvdXNiL2R3YzMvZXAwLmMgICAgfCA1ICsrKysrDQo+ID4gPiA+
ID4gPiA+ICAgICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgMSArDQo+ID4gPiA+ID4gPiA+
ICAgICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2VwMC5jDQo+ID4gPiA+ID4gPiA+IGluZGV4IDY2NmFjNDMyZjUyZC4uZTI2YzNh
NjJkNDcwIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2VwMC5j
DQo+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4gPiA+ID4gPiA+
ID4gQEAgLTkxLDYgKzkxLDExIEBAIHN0YXRpYyBpbnQgX19kd2MzX2dhZGdldF9lcDBfcXVldWUo
c3RydWN0IGR3YzNfZXAgKmRlcCwNCj4gPiA+ID4gPiA+ID4gICAgIHsNCj4gPiA+ID4gPiA+ID4g
ICAgIAlzdHJ1Y3QgZHdjMwkJKmR3YyA9IGRlcC0+ZHdjOw0KPiA+ID4gPiA+ID4gPiArCWlmIChX
QVJOKHJlcS0+c3RhdHVzIDwgRFdDM19SRVFVRVNUX1NUQVRVU19DT01QTEVURUQsDQo+ID4gPiA+
ID4gPiBMZXQncyBub3QgdXNlIFdBUk4uIFBlcmhhcHMgZGV2X3dhcm4/DQo+ID4gPiA+ID4gSSBj
b3BpZWQgdGhlIGNvZGluZyBzdHlsZSBmcm9tIGNvbW1pdCBiMmI2ZDYwMTM2NWEgKCJ1c2I6IGR3
YzM6IGdhZGdldDoNCj4gPiA+ID4gPiBwcmV2ZW50DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gZHdj
M19yZXF1ZXN0IGZyb20gYmVpbmcgcXVldWVkIHR3aWNlIiksIHNvIG1heWJlIGEgZm9sbG93LXVw
IHBhdGNoIHRvIGNoYW5nZSBmcm9tIFdBUk4gdG8gZGV2X3dhcm4gZm9yIHRoZSB0d28gcGF0Y2hl
cyA/DQo+ID4gPiA+IFdlIGNhbiBqdXN0IHVzZSBkZXZfd2FybiBoZXJlLCB3ZSBkb24ndCBuZWVk
IDIgc2VwYXJhdGUgcGF0Y2hlcyBmb3IgdGhpcw0KPiA+ID4gPiBjaGFuZ2UuIFRoZSBvdGhlciBw
bGFjZSBjYW4gYmUgcmV3b3JrZWQgaW4gYSBzZXBhcmF0ZSBwYXRjaC4NCj4gPiA+IE9LDQo+ID4g
PiA+ID4gPiA+ICsJCQkJIiVzOiByZXF1ZXN0ICVwSyBhbHJlYWR5IGluIGZsaWdodFxuIiwNCj4g
PiA+ID4gPiA+ID4gKwkJCQlkZXAtPm5hbWUsICZyZXEtPnJlcXVlc3QpKQ0KPiA+ID4gPiA+ID4g
PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gPiAgICAg
CXJlcS0+cmVxdWVzdC5hY3R1YWwJPSAwOw0KPiA+ID4gPiA+ID4gPiAgICAgCXJlcS0+cmVxdWVz
dC5zdGF0dXMJPSAtRUlOUFJPR1JFU1M7DQo+ID4gPiA+ID4gPiA+ICAgICAJcmVxLT5lcG51bQkJ
PSBkZXAtPm51bWJlcjsNCj4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ID4gPiA+ID4gPiA+IGlu
ZGV4IDg5YTRkYzhlYmY5NC4uYzM0NDQ2ZDhjNTRmIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiAtLS0g
YS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMv
dXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPiA+ID4gPiA+ID4gQEAgLTMwMDIsNiArMzAwMiw3IEBAIHN0
YXRpYyBpbnQgX19kd2MzX2dhZGdldF9zdGFydChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiA+ID4gPiA+
ID4gPiAgICAgCWR3Yy0+ZXAwX2JvdW5jZWQgPSBmYWxzZTsNCj4gPiA+ID4gPiA+ID4gICAgIAlk
d2MtPmxpbmtfc3RhdGUgPSBEV0MzX0xJTktfU1RBVEVfU1NfRElTOw0KPiA+ID4gPiA+ID4gPiAg
ICAgCWR3Yy0+ZGVsYXllZF9zdGF0dXMgPSBmYWxzZTsNCj4gPiA+ID4gPiA+ID4gKwlkd2MtPmVw
MF91c2JfcmVxLnN0YXR1cyA9IERXQzNfUkVRVUVTVF9TVEFUVVNfVU5LTk9XTjsNCj4gPiA+ID4g
PiA+ID4gICAgIAlkd2MzX2VwMF9vdXRfc3RhcnQoZHdjKTsNCj4gPiA+ID4gPiA+ID4gICAgIAlk
d2MzX2dhZGdldF9lbmFibGVfaXJxKGR3Yyk7DQo+ID4gPiA+ID4gPiA+IC0tIA0KPiA+ID4gPiA+
ID4gPiAyLjQ4LjENCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBJJ20gc3RpbGwgbm90IGNs
ZWFyIGhvdyB0aGlzIGNhbiBoYXBwZW4uIEFyZSB5b3UgdGVzdGluZyB0aGlzIGFnYWluc3QNCj4g
PiA+ID4gPiA+IG1haW5saW5lPyBDYW4geW91IHByb3ZpZGUgdGhlIGR3YzMgdHJhY2Vwb2ludHM/
DQo+ID4gPiA+ID4gSSB3YXMgbm90IGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgbG9jYWxseS4gV2Fz
IHNlZW4gb24gNS4xMCwgdGVzdGVkIG9uIDYuMQ0KPiA+ID4gPiA+IGFuZCA2LjYuDQo+ID4gPiA+
ID4gDQo+ID4gPiA+IFdpdGhvdXQgdW5kZXJzdGFuZGluZyBob3cgdGhpcyBjYW4gaGFwcGVuIGFu
ZCB3aHkgaXQgaXMgbmVlZGVkLCB3ZQ0KPiA+ID4gPiBzaG91bGQgbm90IGp1c3QgYXBwbHkgdGhp
cy4gS2VybmVsIHY1LjEwLCB2Ni4xLCBhbmQgdjYuNiBhcmUgcmVhbGx5IG9sZC4NCj4gPiA+ID4g
V2UgaGF2ZSBhIGxvdCBvZiBmaXhlcyBzaW5jZSB0aGVuLiBQbGVhc2Ugc2VlIGlmIHRoaXMgaXMg
cmVwcm9kdWNpYmxlDQo+ID4gPiA+IHVzaW5nIG1haW5saW5lLg0KPiA+ID4gV2UgaGF2ZSBhcHBs
aWVkIGFsbCByZWxldmFudCBwYXRjaGVzIGZyb20gbWFpbmxpbmUgdG8gZXAwLmMsIGluIG9yZGVy
IHRvIHRyeQ0KPiA+ID4gdG8gZml4IHRoaXMgY3Jhc2g6DQo+ID4gV2hhdCBjYXVzZXMgdGhlIGNy
YXNoPyBJJ20gc3RpbGwgbm90IGNsZWFyIHdoZXRoZXIgeW91IHdlcmUgYWJsZSB0bw0KPiA+IHJl
cHJvZHVjZWQgdGhpcyBvbiBtYWlubGluZSwgb3IgYW55IG9mIHRoZSBuZXcgc3RhYmxlIHRyZWUu
DQo+IEkgd2FzIG5vdCBhYmxlIHRvIHJlcHJvZHVjZSB0aGlzIGJ1ZyBsb2NhbGx5IGluIGFueSB2
ZXJzaW9uLg0KPiA+IA0KPiA+ID4gNTY2YmM3OTNiZGQ3IHVzYjogZHdjMzogZXAwOiBEb24ndCBj
bGVhciBlcDAgRFdDM19FUF9UUkFOU0ZFUl9TVEFSVEVEDQo+ID4gPiAzNzFkM2ZjNTc3ZGIgdXNi
OiBkd2MzOiBlcDA6IERvbid0IHJlc2V0IHJlc291cmNlIGFsbG9jIGZsYWcgKGluY2x1ZGluZyBl
cDApDQo+ID4gPiBkODE5YTBiYmI0OTMgdXNiOiBkd2MzOiBlcDA6IERvbid0IHJlc2V0IHJlc291
cmNlIGFsbG9jIGZsYWcNCj4gPiA+IDJlYjNiYTM4YmY4OCB1c2I6IGR3YzM6IGdhZGdldDogUmV3
cml0ZSBlbmRwb2ludCBhbGxvY2F0aW9uIGZsb3cNCj4gPiA+IGNiZmNmNTE3ZGM0MiBGUk9NR0lU
OiB1c2I6IGR3YzogZXAwOiBVcGRhdGUgcmVxdWVzdCBzdGF0dXMgaW4NCj4gPiA+IGR3YzNfZXAw
X3N0YWxsX3Jlc3RhcnQNCj4gPiA+IDRmYzM5MzI4NTc5ZSBVUFNUUkVBTTogdXNiOiBkd2MzOiBB
dm9pZCB1bm1hcHBpbmcgVVNCIHJlcXVlc3RzIGlmIGVuZHhmZXIgaXMNCj4gPiA+IG5vdCBjb21w
bGV0ZQ0KPiA+ID4gNWRjMDY0MTlkOGE2IFVQU1RSRUFNOiB1c2I6IGR3YzM6IERvIG5vdCBzZXJ2
aWNlIEVQMCBhbmQgY29ubmRvbmUgZXZlbnRzIGlmDQo+ID4gPiBzb2Z0IGRpc2Nvbm5lY3RlZA0K
PiA+ID4gNzVhNGYwYjVlMWY0IFVQU1RSRUFNOiB1c2I6IGR3YzM6IGVwMDogUHJvcGVybHkgaGFu
ZGxlIHNldHVwX3BhY2tldF9wZW5kaW5nDQo+ID4gPiBzY2VuYXJpbyBpbiBkYXRhIHN0YWdlDQo+
ID4gPiBhNzllODQ4ZTUyOTkgVVBTVFJFQU06IHVzYjogZHdjMzogZXAwOiBEb24ndCBwcmVwYXJl
IGJleW9uZCBTZXR1cCBzdGFnZQ0KPiA+ID4gOTEwZTllNjA0OTJhIFVQU1RSRUFNOiB1c2I6IGR3
YzM6IEZpeCBlcDAgaGFuZGxpbmcgd2hlbiBnZXR0aW5nIHJlc2V0IHdoaWxlDQo+ID4gPiBkb2lu
ZyBjb250cm9sIHRyYW5zZmVyDQo+ID4gPiBmZTUxM2UxYzI2ODUgVVBTVFJFQU06IHVzYjogZHdj
MzogZ2FkZ2V0OiBXYWl0IGZvciBlcDAgeGZlcnMgdG8gY29tcGxldGUNCj4gPiA+IGR1cmluZyBk
ZXF1ZXVlVGhhbg0KPiA+ID4gDQo+ID4gQ2hlcnJ5LXBpY2tpbmcgdGhlIHVwc3RyZWFtIHBhdGNo
IGxpa2UgdGhpcyB3aWxsIGJlIGRpZmZpY3VsdCB0byBkZWJ1Zw0KPiA+IGFzIEkgY2FuJ3QgZGV0
ZXJtaW5lIHRoZSBjb3JyZXNwb25kaW5nIGNoYW5nZXMgcmVsYXRlZCB0byB0aGUgdXNiIGdhZGdl
dA0KPiA+IGNvcmUgQVBJIGFuZCB0aGUgZHdjMy4NCj4gDQo+IFRoZXJlIHdlcmUgZmlyc3QgYSBX
QVJOSU5HOg0KPiANCj4gPDQ+WyAzNDEuODYwMTA5XSBXQVJOSU5HOiBDUFU6IDAgUElEOiA4NTQ4
IGF0IGRyaXZlcnMvdXNiL2R3YzMvZXAwLmM6MTA3Nw0KPiBkd2MzX2VwMF9pbnRlcnJ1cHQrMHgx
ZTgvMHgzNDANCj4gDQo+IEhlcmU6DQo+IA0KPiBzdGF0aWMgdm9pZCBfX2R3YzNfZXAwX2RvX2Nv
bnRyb2xfc3RhdHVzKHN0cnVjdCBkd2MzICpkd2MsIHN0cnVjdCBkd2MzX2VwDQo+ICpkZXApIHsg
V0FSTl9PTihkd2MzX2VwMF9zdGFydF9jb250cm9sX3N0YXR1cyhkZXApKTsgfSBhbmQgdGhlbiB0
aGUgY3Jhc2g6DQo+IA0KPiA8Mz5bIDM1MS42NzQ0MThdIGxpc3RfYWRkIGRvdWJsZSBhZGQ6IG5l
dz1mZmZmZmY4N2FiMmM3OTUwLA0KPiBwcmV2PWZmZmZmZjg3YWIyYzc5NTAsIG5leHQ9ZmZmZmZm
ODdhYjQ4NWI2MC4NCj4gDQo+IDw2PlsgMzUxLjY3NDQzN10gLS0tLS0tLS0tLS0tWyBjdXQgaGVy
ZSBdLS0tLS0tLS0tLS0tDQo+IA0KPiA8Mj5bIDM1MS42NzQ0MzldIGtlcm5lbCBCVUcgYXQgbGli
L2xpc3RfZGVidWcuYzozNSENCj4gDQo+IDwwPlsgMzUxLjY3NDQ0N10gSW50ZXJuYWwgZXJyb3I6
IE9vcHMgLSBCVUc6IDAgWyMxXSBQUkVFTVBUIFNNUA0KPiANCj4gPDY+WyAzNTEuNjc1MDQ3XSBD
YWxsIHRyYWNlOg0KPiANCj4gPDY+WyAzNTEuNjc1MDUyXSBfX2xpc3RfYWRkX3ZhbGlkKzB4NzAv
MHhjMA0KPiANCj4gPDY+WyAzNTEuNjc1MDYwXSBfX2R3YzNfZ2FkZ2V0X2VwMF9xdWV1ZSsweDcw
LzB4MjI0DQo+IA0KPiA8Nj5bIDM1MS42NzUwNjRdIGR3YzNfZXAwX2hhbmRsZV9zdGF0dXMrMHgx
MTgvMHgyMDANCj4gDQo+IDw2PlsgMzUxLjY3NTA2OF0gZHdjM19lcDBfaW5zcGVjdF9zZXR1cCsw
eDE0NC8weDMyYw0KPiANCj4gPDY+WyAzNTEuNjc1MDczXSBkd2MzX2VwMF9pbnRlcnJ1cHQrMHhh
Yy8weDM0MA0KPiANCj4gPDY+WyAzNTEuNjc1MDc4XSBkd2MzX3Byb2Nlc3NfZXZlbnRfZW50cnkr
MHg5MC8weDcyNA0KPiANCj4gPDY+WyAzNTEuNjc1MDgyXSBkd2MzX3Byb2Nlc3NfZXZlbnRfYnVm
KzB4N2MvMHgzM2MNCj4gDQo+IDw2PlsgMzUxLjY3NTA4Nl0gZHdjM190aHJlYWRfaW50ZXJydXB0
KzB4NTgvMHg4Yw0KPiANCj4gPDY+WyAzNTEuNjc1MDkyXSBpcnFfdGhyZWFkX2ZuKzB4NTQvMHhk
NA0KPiANCj4gVGhpcyBpcyBhbGwgSSBoYXZlLi4NCj4gDQoNCkhtLi4uIHdoaWNoIGtlcm5lbCB2
ZXJzaW9uIHdhcyB0aGlzIHJlcHJvZHVjZWQ/DQoNCkFyZSB5b3UgdXNpbmcgdGhlIHVzYiBjb21w
b3NpdGUgZnJhbWV3b3JrPyBUaGUgY29udHJvbCB0cmFuc2ZlcnMgYXJlDQpkcml2ZW4gYnkgdGhl
IGhvc3QsIGFuZCB0aGUgdXNiIGdhZGdldCBjb21wb3NpdGUgZnJhbWV3b3JrIHNob3VsZCBub3QN
CmhpdCBzY2VuYXJpb3MgbGlrZSB0aGlzLg0KDQpDYW4geW91IGNhcHR1cmUgdGhlIHRyYWNlcG9p
bnRzKiBmb3IgZHdjMz8NClsqXSBodHRwczovL2RvY3Mua2VybmVsLm9yZy9kcml2ZXItYXBpL3Vz
Yi9kd2MzLmh0bWwjcmVwb3J0aW5nLWJ1Z3MNCg0KVGhhbmtzLA0KVGhpbmg=

