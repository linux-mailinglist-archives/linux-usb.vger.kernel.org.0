Return-Path: <linux-usb+bounces-22861-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91225A834F0
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 02:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68EB51B638C2
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 00:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7BE1876;
	Thu, 10 Apr 2025 00:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QMKLBRsf";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PvxagFdI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EKPiJ5oH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378E938B
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 00:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744243782; cv=fail; b=dWIDy/hn2qyr/dPU7QvgCP8TfsmwUMA+N60js8foNiWKoFdwCJtP3CXBtuV5IzvgXuRCWsb0DixHDaWN42/zW93qmTXot+FUw+nICq4VugzH1zyMUTZczD4CtyqVNS9pzSJXJXDXJnwpGfwD9ZZqMeaTwbSRJBhuTCIxdNK4V6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744243782; c=relaxed/simple;
	bh=loza5CbDuA/s/sFU7LQkLXISCbaWgIj7bmzoszQnqjk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=vFvZLoRb1iZ3lhXuj8Rf1lkVvRIZBg0xYhewnCsK7lqQmrQI9rkjAXkG71lSomtMknK54CXZjHyPDkJse3EC0DgqKAAvEbmRlj2WNeLMeDiQmdRgOO4d4AqHvZIfpBYBXzrGiaRcHR6o/AKkhSISTdd/QdOvwUo2nC+1mA26gtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QMKLBRsf; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PvxagFdI; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EKPiJ5oH reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539KD6HO013382;
	Wed, 9 Apr 2025 17:09:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=loza5CbDuA/s/sFU7LQkLXISCbaWgIj7bmzoszQnqjk=; b=
	QMKLBRsfThqIO0BS4Mq5zdhHN7iVDLKQWAe5ko7ax/Em/2TORyU0AvdERGVIueq1
	s+8xAkSNTOSeBJ/0H5+aicuuO5xo2p94hN+Q0XZAXBYNWxYKKzgYKqvQSSko/7Qm
	iPzjDvrMTupn1TBCpjkeCua58NUaq+hvSaFDNQJIiUhmZ+0uZyJYJHXXMEke1RII
	HQCrMLgrASNuk4Q18Tbh8KeRdTvLW/U8EwIt5I+7y3IdbTdAtl+MPcw/XSdytgfD
	sUb7QN/+MTNaRvmw1a3qLbGM2RWkZRC+C/MJWDDgJV09O5OORUl01ymRobjMQglf
	Lbsycrdjdv81YP7Hwxzghw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3hpru9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 17:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744243771; bh=loza5CbDuA/s/sFU7LQkLXISCbaWgIj7bmzoszQnqjk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=PvxagFdIaHiOwb2QkLNKTSSpL+GpQu1EDeOj+DASx8V1TvJMzSCYMoI7VpKNiP4zq
	 0TKR1ZmVsGKtdnTVVWxDmGC+mCpIrU7XwpwtEv6xHLmlnQ1y9VJ4y8al0USOtfQ5lS
	 0V/u3oa6YPF9EseV24oxjCA7hnVZY0h8WDRqndLD0vVyWAhNDz1U60wJyOn+a2kaJE
	 48YOL3uECuKw50iFcH/QoHNzosQ6O7+XosX9xnBnWLlafBYkUigCW+X2bgWY4mazPm
	 6PcLzhYLLa7Nl5N3CpQ+oV+ponOE0wEWBjf4iWJlAkGW4KOT2IZ1lqUzHQrbYKUzQv
	 PfGfMg3zuw8GQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D651340235;
	Thu, 10 Apr 2025 00:09:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 346E1A006D;
	Thu, 10 Apr 2025 00:09:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=EKPiJ5oH;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 11EA14013A;
	Thu, 10 Apr 2025 00:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3a1t6DizZTBB4/BEb9YKjMySAQ6Pj1zx/w/Vy5N8VCbJHbTwsFHI9bHCiEjKvCzYxber1hoVuungP104jOC8xoyDbcOVFLO++HVx2cTFQ2hAJ4mH+PW7P/Fu5waiI1B6c9Sonsa39NdXxadwmnSbsWs+GxOmLSOZUBebW944d/A10SxHSWVsbK4cBmSGjRkbIw5g7rJ/2BLW917L5YsUwCky/W0eAqmK/6gLKUmLdVdDFSPS3S3rOcwVC+3KHDcLShIt3iEaJ7L9UfL7+XjvDRFxh1l2y5AatEmPa6JUottHHZstW9kPKkFeIQmEokHpfAy92gBO8PChbS+Yk7YZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loza5CbDuA/s/sFU7LQkLXISCbaWgIj7bmzoszQnqjk=;
 b=D70ThW2fhG9ePBboJg82tGp5cNMq+Bi2+lfMTe6saRP8OU3txtbmh90lKsj0mmITdvfbf+cNHGCqpfBKjfWil5UCKRgFAw++p+KC14VFKNWpZ6yjsAO2m/3AWrB9WgYkZp8pjjvQy0Y8bQNryZjfUCNIyd4OuQms/R57UnE8XBCgH0uuJgMHPntmw5FrXFtNKDDy1XcdicIIeeZFcRm/Y09XItHLlxh66lMjbVSQjf0CJ24IYClgvlzELkJExWotDFYLEici1LnfJXFQTk6+nKY6/zTLep2K/3b8nbuI395M7pcWHaZ8tV3kkgpGNQQ9TRsL7JRo/Oc1xsP4fjF5gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loza5CbDuA/s/sFU7LQkLXISCbaWgIj7bmzoszQnqjk=;
 b=EKPiJ5oHTo1mPoERali25fbCMP+9yXDGybBvuhC1Lz135mT1lMlXX92xi/BNUkXpkaqg/GN2doC+mp0cmdrzzeuDV1MJqTw7yZK3FoSHsO39CfCY3HrDFOvvFWbrmfAx4ntyM44zDeZI+Oc8muLv1iht/30npqUJrHAhQybVEv8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB6722.namprd12.prod.outlook.com (2603:10b6:510:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 00:09:24 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 00:09:24 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frode Isaksen <fisaksen@baylibre.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Frode Isaksen
	<frode@meta.com>
Subject: Re: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Topic: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Index:
 AQHbnyLuqf9Hu8uhE0ul0JwT/TVjubOPgwsAgADYZoCAAKFwAIABD9gAgAbixICAAIS9AIABJ6YAgAF/eIA=
Date: Thu, 10 Apr 2025 00:09:24 +0000
Message-ID: <20250410000921.6zffl57kpqbrw7rf@synopsys.com>
References: <20250327141630.2085029-1-fisaksen@baylibre.com>
 <20250401234908.npkn5h3vdyefkvxr@synopsys.com>
 <26644fc1-98c1-4443-9809-b7e4d6cec2e3@baylibre.com>
 <20250402222128.2soczlkfwonz7r3p@synopsys.com>
 <cf51ea66-24b2-49f4-87ec-5165249d53c5@baylibre.com>
 <20250407234337.ejaghhulwqumbk3j@synopsys.com>
 <fa1b7d70-b40c-48cd-9dbe-61b6cf6f8d6d@baylibre.com>
 <20250409011652.kr2q7keumvykxser@synopsys.com>
In-Reply-To: <20250409011652.kr2q7keumvykxser@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB6722:EE_
x-ms-office365-filtering-correlation-id: 3ef87a1a-5262-4e94-a4c6-08dd77c3f3af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S1FVbHlMRStVTE1sdU0ybkc2bmZ6ekl5OVFsT3p2WERMOTNuNDR3d2V6S1Bk?=
 =?utf-8?B?R1IxZDVTZFpkallmSHdtRk1zaWo3cDlVWERrRzRrYzBLeVJhOEJHVVdRL1VQ?=
 =?utf-8?B?ZGlieGZEWVlnRDFXOTI4ZDczb3A4ajAxOUY2Yk0wc2gyWUFVTXRGMGdRdllE?=
 =?utf-8?B?U1NabFNBc3VUejJKYXIvT3ZWemNPaUp1cjJvRkNtdFRZNEdmVXJQZkpQbEpN?=
 =?utf-8?B?R1BoWURnclRVUVZzdW9vaktpZFVmNG9WaDdTYjZFTjYvZ2lHNWE4eFlaRFJ5?=
 =?utf-8?B?bm5FUGwwMHJoVjJ0ZmRKc0djZi9RRm5McGUxWjN4SytuWksxN3dmcENRR0hj?=
 =?utf-8?B?eWd1SXlBbEt0WnVpa3RFek0rSzZvMGNYSE1HUndvZ2gzWWEwRTVUTXNoS2R1?=
 =?utf-8?B?eUVvdkFaRmZobmRrT2c0RWVxeTc2NEZrS2VMbDFEQStyZ3N0MzhBTnlkY2ty?=
 =?utf-8?B?YnI5azVvTGZmK3dIdWhzdEcyaUUyYzQzME0yUEJ6eHk0SGdpZ1k4WEFCYUZs?=
 =?utf-8?B?WDJUWjdoL25tZG5qSDhRNER3VHRKVnoxbFVSZGJIWE1qMGpIbHNnR2JkYkpr?=
 =?utf-8?B?bmtQNXZRa2Nkd3gwMERGR1piSXVIUlB3anVvajY4RG1KK2lOS0gwaUhNVENj?=
 =?utf-8?B?enhOOVQzZEhjS2hlMEFMam84Q2JHWGhrRlRjaHhRcmZGcnJZUmVueWRaWFBy?=
 =?utf-8?B?c3UxbmtzVDduS3ZmdjlTMVJXSFAvQVR5QVJkL3FWTk5SWVllRUdDa1JLZTht?=
 =?utf-8?B?K2xxSXFRc3psN0hRaFIveGVKQXB2QXVEbmN6alNNZ080TXBkWVpVYURPUDdl?=
 =?utf-8?B?aFVBdTMydHhrcitxVkY1bHhTOXdwWmRndlF1SGpVNWRTbTE5ZUs5SjZBZnNB?=
 =?utf-8?B?UmlEMHAvRHN1bXJ5M1NiWHpkdk1zM0VRMkE3ckVFUTFKRC9KQi9iUHl0L1c0?=
 =?utf-8?B?dGpnWnMzYU5CVG0zN3p1eFRsdFVxcUt1WnFUbjIvTWI0MzhsMVRSOGZVWEhQ?=
 =?utf-8?B?THBERHl6WEVySk9nZlljczZKaFRyb0V5OTVaUzZsYkEycFRQODRUTGlZWDZa?=
 =?utf-8?B?UFNRdll5VDVtRi9EYjFqSWsyQmVqYXdKSGtCQnB3clVXWjl1aWtPTThjNFF0?=
 =?utf-8?B?cnpEb0d6WmgvcjloTWF6eGswbUtJSDk5c2tRNHppOGJOa3ZmNnNBaVRnQ0Nv?=
 =?utf-8?B?ejBxTjlBZE9WbnBkbTZXZjdKNmx6cEw1YWdPTHVFMkpJK2w4YUl3ckdnbmtW?=
 =?utf-8?B?VU5QK0hWV245TWFRRzBUSERvNitIYjh5TWUzMlU1L0tBYTZNWDBSZGxTMDBK?=
 =?utf-8?B?dUJyVTRETTUycmlKV2RZdVdkNjhRL01MNjMwZWJVNHZxTVR4eGZYak5JR3Rn?=
 =?utf-8?B?eTdkVzFPdVlYVUk5bVVGQTFxWHlEcmdoYTlvRlpEVHhuVjQwS0wzZzRhUVJt?=
 =?utf-8?B?RTQrK0Jud1JTMGZtWGVVaitPbyt5dkRMeHRuTkZ0cDMvUnpUSHJleTNGVFNj?=
 =?utf-8?B?dXlZVktGRFcvLzhLdlcxYURHTk0wSnBIOC8wN0JQNGpuQ1o0VEFJWGpPd1pV?=
 =?utf-8?B?WW00M0lxYXJLTnJteHpPUy85Ui84Ym1rRHV6VjdnSWtycnloOWdIdjVzTFR4?=
 =?utf-8?B?ZFNlWjB1S3BCdUF3bkdTdjNQeDdmZ0h3bWlhb2NseG1lMm5FT1kyOVZvTHh1?=
 =?utf-8?B?VjRVejFKdWQ1NnEwbHhUTEpXdk4raHdaWFRlK1hvbnIwVTJGdUNSSUN0OUlC?=
 =?utf-8?B?V1FVM3hCY3FrOUVuWkR6ZlN2QXMvc2RsSHJIT2kraWtGRjBwemlYdlJKaUV2?=
 =?utf-8?B?elp4ZDBHRjEybXN5RW9DVWNHU0ZqVU8zME8ySFBiL0QwM0V0MWR6ckhJYVpV?=
 =?utf-8?B?T1ZqdFc2bjZsSlRPNUNJemJHSUkrUUNJd0M1R0ZWMUtSek5FV0pjdU9TWGw5?=
 =?utf-8?B?OVFrM056cU9IQUZVdmN1OE5JaDBPQnd5UzdBcUpHMjl1ZlZtbGxGQUpyZ3BE?=
 =?utf-8?B?OE9ZSW5ldFVnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0VZWGt0KzF0N2Y3UlFVbEZxLzR6N000MU1NeFFPTm1jOHU4Z3BYTGZvcEpK?=
 =?utf-8?B?Tm5RMldTWGhMVTZFYXlBYmg2eXd0Q3FHUlhZZ0kzblN5anFOWVM0V0xTZ0Vl?=
 =?utf-8?B?UWk1UWRkQnh5cVFVYlVncWkrdFFvekppbDVuY2Y0empSb2JHemVJbzJreXVP?=
 =?utf-8?B?d1Jpc0IvYThqZk1NOXVGNmNPVitNWjZFQTNxZk1pb1BUU3hQVndwVVVJVjN1?=
 =?utf-8?B?cGdZdFRNVkFWOEdkanNSYVRhVEQxcm93T2RhK0R4TkgvekFoenRoeWpZdlpo?=
 =?utf-8?B?MEJGWjU1RGt1cnlBeDBzRVU1aGpSQmFibDhQYjFJa0pKb2tVSy84a0FaWEx0?=
 =?utf-8?B?RTJKSWlXUm1FTUQzb0lGN2FsQVF3Vkxhd3FQTXlWYTJlYmZNYUFFdEdTVXdN?=
 =?utf-8?B?VlFMT2U0WnllbFVIVGFXVDVXRkVJZGllcHBodS9rN2lsTzZLS0tmcUVmWW5J?=
 =?utf-8?B?WmhZaXh4ZktHQVhWQm9KK00rdDg1clROVTNqc3I2aWdQZ2hjZTJ5UWh4eFlE?=
 =?utf-8?B?YStYSGlBZFA2bGI1UG5sZU81TWtPMys2c1FjbmVsUmRleHNGRkNwYjZlUEFV?=
 =?utf-8?B?SHNqTjU1NXBESVlqNU93Z1JhR0VaYmhWaTZoZ0RzdTRJTnpMcnRGNGdoclpP?=
 =?utf-8?B?Y0gzZ1VOdXltM0QvdjNnOGlXbU55RHZOS3EwTXNjS3dPRnRldTUrMTN6WHNt?=
 =?utf-8?B?OUc2MEl0eTllb0NqT2lXUWpUTm1xTEIrMmhkVkI2MC8veWlNS1htUmIyd1NV?=
 =?utf-8?B?V1VjSm5JTHFETEV1SU5oQmxuYlVqM1ErUkdPOVV3dnVrR3BsM0lrQWdjTWQz?=
 =?utf-8?B?OW5kNmNmMlhzWDYrcTY0MDNaYkgwWlNlMitXRFU3NDQxalZYY01ZNGlua3Zn?=
 =?utf-8?B?ZTBmS2NoL0ozZXRKQURTdHVOb0NxWWgwVVo2cWMwcFBnY0o4NUo5MGQrck9p?=
 =?utf-8?B?N041am5hbE9vbXlPUlhnQkNXQW9WQkhNNU96d3AySWxnSTR2TUZYLzMrZ1Q4?=
 =?utf-8?B?QW9iK0dIemtoQzJ0YTgwMmNDY25BT2ZUOUpURFNHS0hSMnQ1cmlJbHUvOG1R?=
 =?utf-8?B?TXkvUnY3aXliQjVMeURnSXdVMElJc3BSMkZ0dUw2VzBwY1NaOVA4V3FqL05U?=
 =?utf-8?B?Wm8yYkVKWHROL2xhNWdRRlZ2bFNIREhHRmdWNWdlblJ2anF2Qmhid3pxQU5z?=
 =?utf-8?B?cmFYL1Bac1U5SUk0TU81ajBpUWZUWUFONmg4U2padXU3K3hxV0NVNHd3ZlBz?=
 =?utf-8?B?ZnYzU0E0MjNpSGtIU09rOUxiMWlOTEtrcE83NnFhRXcwL0lLVThickdyQjNn?=
 =?utf-8?B?SlM5YUJRV25XajlsU2pVS1JicFlYYUNjdHdwVnhtUCs4MmttclpVQ3BaRmN6?=
 =?utf-8?B?QmNEb1FkQ29jODVKMGJwOGpNLy9NRmtlV3EycnpxMGdseG9SZm1vUEhEZWVw?=
 =?utf-8?B?emFGK3JsWllxYy9LeHdEck9TSWhDVXh1a3ZJcXg0clliWFhBWWlGSW5heTh1?=
 =?utf-8?B?cEZXTVhWdGZwNEJBUk1rYTkvdXBreWdxMTJNbjJubFlNUjdDb2VkTTJ5MExK?=
 =?utf-8?B?eGVoekhaNHNFSlVQWHBwazdBNFdXL3NhMjFqaWUzaHNMRzFpMzVLTzBHMGNY?=
 =?utf-8?B?M0FIVVhxN2lPL0JnejQyRXo0Vk05Vk1YWm93YzBEZnpLajlFWlA1bHFqUnBi?=
 =?utf-8?B?Q0dEWGQwUE5Sakkwd2xYZXRVMVEwQ28rM1BmQXBFUERwSkFEcDM3eUErcHZ6?=
 =?utf-8?B?VG1BNldycWFxYncxQnR1TnJBcEF4RGVOTEhEUXpCbFRUT0lLNXF5S05zY1hD?=
 =?utf-8?B?SDJOMFdwVDFOdGVadXU0eXpSZlJ4UGhEYWYyZmdtV1pNaWRUUlI3d0pab1FC?=
 =?utf-8?B?REZ1VUxWTlFoMXlLWm9LdXpYUFlDUHI5RXVNaWJCQmJZSTIzRG5UdjByOHlk?=
 =?utf-8?B?N0R5ZUlEc0RBNUo0NkhybGMwRGt5MzhVNTJtWjFYYnhWNitCQWl1SXdzUEtW?=
 =?utf-8?B?OWR3eHd4UldFUTVGb2hoV3dSRTVIL3JjK2VhMHh6RW42TlZXN2t0b1RrbDZL?=
 =?utf-8?B?dWpxTllTVGhKM3pXWDVuOG9pSmMzbUlxTWtxRE5QNk9sZHVsaDBOcHhXdGQx?=
 =?utf-8?Q?npN17DBwtnnc/Fne/0XPU4h5w?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <826631BA35A6094F9063B19D682E4BA1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xSf9/bhJ5bW75zMGTnOmGOB34sSir/G2EXK9odf83T0n+xx0eNc+cSj/K0SwGqvv4w7LJJ2bVEGXyz3OEIW5QYmBpShucgVPTRHb5sMD+kio8D0hCc5HEyA0L12dUxBXLYYkotob5lWKecCP1hUMq91J0mO4MRhNP18b9RRNB4ngw+eLDkxBlXKJs3bs6LBX8usdSvqaW6kUYmkoztC4JgWRHuXlazGDa2lingg4FB8eFxtQTqWZOkiUhCvASVHwY8BcF1KrIGwCqFwKd9GippKxiBm0jCU8WQq8BK1+xz5e/nOYP3wXyTMKM5Hgpp3zWIDwk1f3EvM8iVrBq70sx3e2oFr4sD9jrcKhzJVT5eRe7SjWD0jmzJZSoWJKc3bt3Wi/mMJPv/WER/EJVDEcguA9mF2CKACqFcRVArxntn01bsAtsPCAvPeQQquvnQ5jIH0xbIldlzE7v6e8cD1+O8gLf0e2bO+9M36dfuF/FL3D8xfXjQfhscSe0H8nVyHKWF34voue5agzEOPhP2Nk7uCrRRESDzXlWFDaBIeyq+HSW8kRz1Ko+xICiIR+oIhCIreqIX01wn0a7UBT1Rj0mUr2iI6Zgg2K2hGn7zD6opOYD/y5Gnr9O+DvLSv5DPhDvj96LDXopc3mDeRirZBEvw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef87a1a-5262-4e94-a4c6-08dd77c3f3af
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 00:09:24.6883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qzE8VfqsVk9aobot7MVYdAxVO6qpsuY/X2A2joiJ41LdC3m5yvpuya9nmgfzEqdBO8rDtjAfC1unyn3amkEnCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6722
X-Proofpoint-ORIG-GUID: 6YCqBI5MxBCsg-Cw2NQ4BWq1BoQpRMOl
X-Authority-Analysis: v=2.4 cv=XIAwSRhE c=1 sm=1 tr=0 ts=67f70c3c cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=EW4BbhcGaF4kcfOXkNQA:9 a=QEXdDO2ut3YA:10 a=kUyRy_6n9IIA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: 6YCqBI5MxBCsg-Cw2NQ4BWq1BoQpRMOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504090168

T24gV2VkLCBBcHIgMDksIDIwMjUsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gVHVlLCBBcHIg
MDgsIDIwMjUsIEZyb2RlIElzYWtzZW4gd3JvdGU6DQo+ID4gT24gNC84LzI1IDE6NDQgQU0sIFRo
aW5oIE5ndXllbiB3cm90ZToNCj4gPiA+IE9uIFRodSwgQXByIDAzLCAyMDI1LCBGcm9kZSBJc2Fr
c2VuIHdyb3RlOg0KPiA+ID4gPiBPbiA0LzMvMjUgMTI6MjEgQU0sIFRoaW5oIE5ndXllbiB3cm90
ZToNCj4gPiA+ID4gPiBPbiBXZWQsIEFwciAwMiwgMjAyNSwgRnJvZGUgSXNha3NlbiB3cm90ZToN
Cj4gPiA+ID4gPiA+IE9uIDQvMi8yNSAxOjQ5IEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4g
PiA+ID4gPiA+IE9uIFRodSwgTWFyIDI3LCAyMDI1LCBGcm9kZSBJc2Frc2VuIHdyb3RlOg0KPiA+
ID4gPiA+ID4gPiA+IEZyb206IEZyb2RlIElzYWtzZW4gPGZyb2RlQG1ldGEuY29tPg0KPiA+ID4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IFByZXZlbnQgZHdjM19yZXF1ZXN0IGZyb20gYmVp
bmcgcXVldWVkIHR3aWNlLCBieSBjaGVja2luZw0KPiA+ID4gPiA+ID4gPiA+IHJlcS0+c3RhdHVz
Lg0KPiA+ID4gPiA+ID4gPiA+IFNpbWlsYXIgdG8gY29tbWl0IGIyYjZkNjAxMzY1YSAoInVzYjog
ZHdjMzogZ2FkZ2V0OiBwcmV2ZW50DQo+ID4gPiA+ID4gPiA+ID4gZHdjM19yZXF1ZXN0IGZyb20g
YmVpbmcgcXVldWVkIHR3aWNlIikgZm9yIG5vbi1lcDAgZW5kcG9pbnRzLg0KPiA+ID4gPiA+ID4g
PiA+IENyYXNoIGxvZzoNCj4gPiA+ID4gPiA+ID4gPiBsaXN0X2FkZCBkb3VibGUgYWRkOiBuZXc9
ZmZmZmZmODdhYjJjNzk1MCwgcHJldj1mZmZmZmY4N2FiMmM3OTUwLA0KPiA+ID4gPiA+ID4gPiA+
ICAgICBuZXh0PWZmZmZmZjg3YWI0ODViNjAuDQo+ID4gPiA+ID4gPiA+ID4ga2VybmVsIEJVRyBh
dCBsaWIvbGlzdF9kZWJ1Zy5jOjM1IQ0KPiA+ID4gPiA+ID4gPiA+IENhbGwgdHJhY2U6DQo+ID4g
PiA+ID4gPiA+ID4gX19saXN0X2FkZF92YWxpZCsweDcwLzB4YzANCj4gPiA+ID4gPiA+ID4gPiBf
X2R3YzNfZ2FkZ2V0X2VwMF9xdWV1ZSsweDcwLzB4MjI0DQo+ID4gPiA+ID4gPiA+ID4gZHdjM19l
cDBfaGFuZGxlX3N0YXR1cysweDExOC8weDIwMA0KPiA+ID4gPiA+ID4gPiA+IGR3YzNfZXAwX2lu
c3BlY3Rfc2V0dXArMHgxNDQvMHgzMmMNCj4gPiA+ID4gPiA+ID4gPiBkd2MzX2VwMF9pbnRlcnJ1
cHQrMHhhYy8weDM0MA0KPiA+ID4gPiA+ID4gPiA+IGR3YzNfcHJvY2Vzc19ldmVudF9lbnRyeSsw
eDkwLzB4NzI0DQo+ID4gPiA+ID4gPiA+ID4gZHdjM19wcm9jZXNzX2V2ZW50X2J1ZisweDdjLzB4
MzNjDQo+ID4gPiA+ID4gPiA+ID4gZHdjM190aHJlYWRfaW50ZXJydXB0KzB4NTgvMHg4Yw0KPiA+
ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyb2RlIElzYWtz
ZW4gPGZyb2RlQG1ldGEuY29tPg0KPiA+ID4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gPiA+
IFRoaXMgYnVnIHdhcyBkaXNjb3ZlcmVkLCB0ZXN0ZWQgYW5kIGZpeGVkIChubyBtb3JlIGNyYXNo
ZXMgc2Vlbikgb24NCj4gPiA+ID4gPiA+ID4gPiBNZXRhIFF1ZXN0IDMgZGV2aWNlLiBBbHNvIHRl
c3RlZCBvbiBULkkuIEFNNjJ4IGJvYXJkLg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
PiA+ICAgICBkcml2ZXJzL3VzYi9kd2MzL2VwMC5jICAgIHwgNSArKysrKw0KPiA+ID4gPiA+ID4g
PiA+ICAgICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgMSArDQo+ID4gPiA+ID4gPiA+ID4g
ICAgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4gPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2VwMC5jDQo+ID4gPiA+ID4gPiA+ID4gaW5kZXggNjY2YWM0MzJmNTJkLi5l
MjZjM2E2MmQ0NzAgMTAwNjQ0DQo+ID4gPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy91c2IvZHdj
My9lcDAuYw0KPiA+ID4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4g
PiA+ID4gPiA+ID4gPiBAQCAtOTEsNiArOTEsMTEgQEAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0
X2VwMF9xdWV1ZShzdHJ1Y3QgZHdjM19lcCAqZGVwLA0KPiA+ID4gPiA+ID4gPiA+ICAgICB7DQo+
ID4gPiA+ID4gPiA+ID4gICAgIAlzdHJ1Y3QgZHdjMwkJKmR3YyA9IGRlcC0+ZHdjOw0KPiA+ID4g
PiA+ID4gPiA+ICsJaWYgKFdBUk4ocmVxLT5zdGF0dXMgPCBEV0MzX1JFUVVFU1RfU1RBVFVTX0NP
TVBMRVRFRCwNCj4gPiA+ID4gPiA+ID4gTGV0J3Mgbm90IHVzZSBXQVJOLiBQZXJoYXBzIGRldl93
YXJuPw0KPiA+ID4gPiA+ID4gSSBjb3BpZWQgdGhlIGNvZGluZyBzdHlsZSBmcm9tIGNvbW1pdCBi
MmI2ZDYwMTM2NWEgKCJ1c2I6IGR3YzM6IGdhZGdldDoNCj4gPiA+ID4gPiA+IHByZXZlbnQNCj4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gZHdjM19yZXF1ZXN0IGZyb20gYmVpbmcgcXVldWVkIHR3
aWNlIiksIHNvIG1heWJlIGEgZm9sbG93LXVwIHBhdGNoIHRvIGNoYW5nZSBmcm9tIFdBUk4gdG8g
ZGV2X3dhcm4gZm9yIHRoZSB0d28gcGF0Y2hlcyA/DQo+ID4gPiA+ID4gV2UgY2FuIGp1c3QgdXNl
IGRldl93YXJuIGhlcmUsIHdlIGRvbid0IG5lZWQgMiBzZXBhcmF0ZSBwYXRjaGVzIGZvciB0aGlz
DQo+ID4gPiA+ID4gY2hhbmdlLiBUaGUgb3RoZXIgcGxhY2UgY2FuIGJlIHJld29ya2VkIGluIGEg
c2VwYXJhdGUgcGF0Y2guDQo+ID4gPiA+IE9LDQo+ID4gPiA+ID4gPiA+ID4gKwkJCQkiJXM6IHJl
cXVlc3QgJXBLIGFscmVhZHkgaW4gZmxpZ2h0XG4iLA0KPiA+ID4gPiA+ID4gPiA+ICsJCQkJZGVw
LT5uYW1lLCAmcmVxLT5yZXF1ZXN0KSkNCj4gPiA+ID4gPiA+ID4gPiArCQlyZXR1cm4gLUVJTlZB
TDsNCj4gPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiA+ID4gICAgIAlyZXEtPnJlcXVlc3Qu
YWN0dWFsCT0gMDsNCj4gPiA+ID4gPiA+ID4gPiAgICAgCXJlcS0+cmVxdWVzdC5zdGF0dXMJPSAt
RUlOUFJPR1JFU1M7DQo+ID4gPiA+ID4gPiA+ID4gICAgIAlyZXEtPmVwbnVtCQk9IGRlcC0+bnVt
YmVyOw0KPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdl
dC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiA+ID4gPiA+ID4gPiA+IGluZGV4IDg5
YTRkYzhlYmY5NC4uYzM0NDQ2ZDhjNTRmIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+IC0tLSBhL2Ry
aXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2dhZGdldC5jDQo+ID4gPiA+ID4gPiA+ID4gQEAgLTMwMDIsNiArMzAwMiw3IEBAIHN0
YXRpYyBpbnQgX19kd2MzX2dhZGdldF9zdGFydChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiA+ID4gPiA+
ID4gPiA+ICAgICAJZHdjLT5lcDBfYm91bmNlZCA9IGZhbHNlOw0KPiA+ID4gPiA+ID4gPiA+ICAg
ICAJZHdjLT5saW5rX3N0YXRlID0gRFdDM19MSU5LX1NUQVRFX1NTX0RJUzsNCj4gPiA+ID4gPiA+
ID4gPiAgICAgCWR3Yy0+ZGVsYXllZF9zdGF0dXMgPSBmYWxzZTsNCj4gPiA+ID4gPiA+ID4gPiAr
CWR3Yy0+ZXAwX3VzYl9yZXEuc3RhdHVzID0gRFdDM19SRVFVRVNUX1NUQVRVU19VTktOT1dOOw0K
PiA+ID4gPiA+ID4gPiA+ICAgICAJZHdjM19lcDBfb3V0X3N0YXJ0KGR3Yyk7DQo+ID4gPiA+ID4g
PiA+ID4gICAgIAlkd2MzX2dhZGdldF9lbmFibGVfaXJxKGR3Yyk7DQo+ID4gPiA+ID4gPiA+ID4g
LS0gDQo+ID4gPiA+ID4gPiA+ID4gMi40OC4xDQo+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4g
PiA+IEknbSBzdGlsbCBub3QgY2xlYXIgaG93IHRoaXMgY2FuIGhhcHBlbi4gQXJlIHlvdSB0ZXN0
aW5nIHRoaXMgYWdhaW5zdA0KPiA+ID4gPiA+ID4gPiBtYWlubGluZT8gQ2FuIHlvdSBwcm92aWRl
IHRoZSBkd2MzIHRyYWNlcG9pbnRzPw0KPiA+ID4gPiA+ID4gSSB3YXMgbm90IGFibGUgdG8gcmVw
cm9kdWNlIHRoaXMgbG9jYWxseS4gV2FzIHNlZW4gb24gNS4xMCwgdGVzdGVkIG9uIDYuMQ0KPiA+
ID4gPiA+ID4gYW5kIDYuNi4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFdpdGhvdXQgdW5kZXJz
dGFuZGluZyBob3cgdGhpcyBjYW4gaGFwcGVuIGFuZCB3aHkgaXQgaXMgbmVlZGVkLCB3ZQ0KPiA+
ID4gPiA+IHNob3VsZCBub3QganVzdCBhcHBseSB0aGlzLiBLZXJuZWwgdjUuMTAsIHY2LjEsIGFu
ZCB2Ni42IGFyZSByZWFsbHkgb2xkLg0KPiA+ID4gPiA+IFdlIGhhdmUgYSBsb3Qgb2YgZml4ZXMg
c2luY2UgdGhlbi4gUGxlYXNlIHNlZSBpZiB0aGlzIGlzIHJlcHJvZHVjaWJsZQ0KPiA+ID4gPiA+
IHVzaW5nIG1haW5saW5lLg0KPiA+ID4gPiBXZSBoYXZlIGFwcGxpZWQgYWxsIHJlbGV2YW50IHBh
dGNoZXMgZnJvbSBtYWlubGluZSB0byBlcDAuYywgaW4gb3JkZXIgdG8gdHJ5DQo+ID4gPiA+IHRv
IGZpeCB0aGlzIGNyYXNoOg0KPiA+ID4gV2hhdCBjYXVzZXMgdGhlIGNyYXNoPyBJJ20gc3RpbGwg
bm90IGNsZWFyIHdoZXRoZXIgeW91IHdlcmUgYWJsZSB0bw0KPiA+ID4gcmVwcm9kdWNlZCB0aGlz
IG9uIG1haW5saW5lLCBvciBhbnkgb2YgdGhlIG5ldyBzdGFibGUgdHJlZS4NCg0KPHNuaXA+DQoN
Cj4gPiBJIHdhcyBub3QgYWJsZSB0byByZXByb2R1Y2UgdGhpcyBidWcgbG9jYWxseSBpbiBhbnkg
dmVyc2lvbi4NCg0KU29ycnksIEkgdG90YWxseSBtaXNzZWQgdGhpcyByZXNwb25zZS4uLg0KDQo8
c25pcD4NCg0KPiA+IA0KPiA+IFRoZXJlIHdlcmUgZmlyc3QgYSBXQVJOSU5HOg0KPiA+IA0KPiA+
IDw0PlsgMzQxLjg2MDEwOV0gV0FSTklORzogQ1BVOiAwIFBJRDogODU0OCBhdCBkcml2ZXJzL3Vz
Yi9kd2MzL2VwMC5jOjEwNzcNCj4gPiBkd2MzX2VwMF9pbnRlcnJ1cHQrMHgxZTgvMHgzNDANCj4g
PiANCj4gPiBIZXJlOg0KPiA+IA0KPiA+IHN0YXRpYyB2b2lkIF9fZHdjM19lcDBfZG9fY29udHJv
bF9zdGF0dXMoc3RydWN0IGR3YzMgKmR3Yywgc3RydWN0IGR3YzNfZXANCj4gPiAqZGVwKSB7IFdB
Uk5fT04oZHdjM19lcDBfc3RhcnRfY29udHJvbF9zdGF0dXMoZGVwKSk7IH0gYW5kIHRoZW4gdGhl
IGNyYXNoOg0KPiA+IA0KPiA+IDwzPlsgMzUxLjY3NDQxOF0gbGlzdF9hZGQgZG91YmxlIGFkZDog
bmV3PWZmZmZmZjg3YWIyYzc5NTAsDQo+ID4gcHJldj1mZmZmZmY4N2FiMmM3OTUwLCBuZXh0PWZm
ZmZmZjg3YWI0ODViNjAuDQo+ID4gDQo+ID4gPDY+WyAzNTEuNjc0NDM3XSAtLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gPiANCj4gPiA8Mj5bIDM1MS42NzQ0MzldIGtlcm5l
bCBCVUcgYXQgbGliL2xpc3RfZGVidWcuYzozNSENCj4gPiANCj4gPiA8MD5bIDM1MS42NzQ0NDdd
IEludGVybmFsIGVycm9yOiBPb3BzIC0gQlVHOiAwIFsjMV0gUFJFRU1QVCBTTVANCj4gPiANCj4g
PiA8Nj5bIDM1MS42NzUwNDddIENhbGwgdHJhY2U6DQo+ID4gDQo+ID4gPDY+WyAzNTEuNjc1MDUy
XSBfX2xpc3RfYWRkX3ZhbGlkKzB4NzAvMHhjMA0KPiA+IA0KPiA+IDw2PlsgMzUxLjY3NTA2MF0g
X19kd2MzX2dhZGdldF9lcDBfcXVldWUrMHg3MC8weDIyNA0KPiA+IA0KPiA+IDw2PlsgMzUxLjY3
NTA2NF0gZHdjM19lcDBfaGFuZGxlX3N0YXR1cysweDExOC8weDIwMA0KPiA+IA0KPiA+IDw2Plsg
MzUxLjY3NTA2OF0gZHdjM19lcDBfaW5zcGVjdF9zZXR1cCsweDE0NC8weDMyYw0KPiA+IA0KPiA+
IDw2PlsgMzUxLjY3NTA3M10gZHdjM19lcDBfaW50ZXJydXB0KzB4YWMvMHgzNDANCj4gPiANCj4g
PiA8Nj5bIDM1MS42NzUwNzhdIGR3YzNfcHJvY2Vzc19ldmVudF9lbnRyeSsweDkwLzB4NzI0DQo+
ID4gDQo+ID4gPDY+WyAzNTEuNjc1MDgyXSBkd2MzX3Byb2Nlc3NfZXZlbnRfYnVmKzB4N2MvMHgz
M2MNCj4gPiANCj4gPiA8Nj5bIDM1MS42NzUwODZdIGR3YzNfdGhyZWFkX2ludGVycnVwdCsweDU4
LzB4OGMNCj4gPiANCj4gPiA8Nj5bIDM1MS42NzUwOTJdIGlycV90aHJlYWRfZm4rMHg1NC8weGQ0
DQo+ID4gDQo+ID4gVGhpcyBpcyBhbGwgSSBoYXZlLi4NCj4gPiANCj4gDQo+IEhtLi4uIHdoaWNo
IGtlcm5lbCB2ZXJzaW9uIHdhcyB0aGlzIHJlcHJvZHVjZWQ/DQo+IA0KPiBBcmUgeW91IHVzaW5n
IHRoZSB1c2IgY29tcG9zaXRlIGZyYW1ld29yaz8gVGhlIGNvbnRyb2wgdHJhbnNmZXJzIGFyZQ0K
PiBkcml2ZW4gYnkgdGhlIGhvc3QsIGFuZCB0aGUgdXNiIGdhZGdldCBjb21wb3NpdGUgZnJhbWV3
b3JrIHNob3VsZCBub3QNCj4gaGl0IHNjZW5hcmlvcyBsaWtlIHRoaXMuDQo+IA0KPiBDYW4geW91
IGNhcHR1cmUgdGhlIHRyYWNlcG9pbnRzKiBmb3IgZHdjMz8NCj4gWypdIGh0dHBzOi8vZG9jcy5r
ZXJuZWwub3JnL2RyaXZlci1hcGkvdXNiL2R3YzMuaHRtbCNyZXBvcnRpbmctYnVncw0KDQpJZ25v
cmUgdGhpcyByZXF1ZXN0IHNpbmNlIHlvdSBjYW4ndCByZXByb2R1Y2UgdGhpcyBidWcuIEJ1dCBj
YW4geW91IGhlbHANCmFuc3dlciB0aGUgcXVlc3Rpb24gYWJvdmUgYWJvdXQgd2hldGhlciB5b3Ug
dXNlZCB0aGUgdXNiIGNvbXBvc2l0ZQ0KZnJhbWV3b3JrPw0KDQpUaGFua3MsDQpUaGluaA==

