Return-Path: <linux-usb+bounces-24814-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB93ADBF49
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 04:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 963223B3A2E
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 02:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D5748635D;
	Tue, 17 Jun 2025 02:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="egjaNDdE";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OXYfQdfw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kL807HDZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBED1F8AF8
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 02:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750127949; cv=fail; b=fx5s9CmKlrkuMGqx9VINZVHCh3xZYSV0AO/YHYNCCHos+GdRwNVwhSk4muNypqXVVEy8P7TWeNaTAMhY+nLBRWG0V0QV1X/1bIUsgJvZuGtJtUHvd3ed/rJN+JEzn0FdV++jVuYZ7wuOZdEnK6IRAde70XxV0hmReheH9cSzeEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750127949; c=relaxed/simple;
	bh=CDkV+pyWRm8dW7KpmGwEs40Vsj5IA+vpQdLpb8xpjKw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jpqk5+oy3XU94A59iLTtvUu+7cL7DyUtsTwR+10qWHcovKDTdfmV9WOP7kE9IrOtAEycIK6YlPVdORXMruuVCdB6FoFIEZCwurm3q6RJs3ouscTqbUk7vhNEvZPVXdMNBtdxRPtec+bdqCLJaeTo4p8qHLFgb3SAEYbSMxZN8s8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=egjaNDdE; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OXYfQdfw; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kL807HDZ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GJYCYs002107;
	Mon, 16 Jun 2025 18:25:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=CDkV+pyWRm8dW7KpmGwEs40Vsj5IA+vpQdLpb8xpjKw=; b=
	egjaNDdEgQ0U9xxy6fsOJIs54IllpOzvcIhUlwGZLpucFbRUY/0qgl0jOe7sANVb
	sHuSxEcEVvoCSpU977wMgl32y3lVGpU+5kHzaDe7duIOuxxs+bwArwDJbCPB6Tvk
	pq6eCASxVokEcuIU8fu/5F+rMnuQ7LMx6TmVtMQBH5tntYmgHLtgdEwxz4HE1PTh
	Pnac9/pB0su3LTxjnDM1dZfAy4f+4yBOTUM7OoCN9IkLJh0wrwzHaQkDyAG/Z5TV
	vr1y/Z+3062S5+dLTG9RaXjfvRvlMpRuvpyvzCFtKjG5X5Hhx0wJNMimwIx021D1
	8bm3i7t/0LSQD+cCaKiqvQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 47983pgmq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 18:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1750123503; bh=CDkV+pyWRm8dW7KpmGwEs40Vsj5IA+vpQdLpb8xpjKw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OXYfQdfwSWOsQxlJ3sLy3zLdZwKt/3oVVBHwK/FKtEzuGluyIxxpDzssvPul+VpE2
	 d0n4HWEOtlwqdcSgWdxRZ9JRr+3R5BWiEP1sIIFXZH02Gyf2GZoNwCYrglvtc1ylrw
	 gz5kaP6qcAeZ4gYB+1wIdZQpgw8LKEc+q3IF8pC0lCjQcfnASzuTeNnGny0Gsvg+Ni
	 z5535WkMB/KDPNaXlEQe1ng+c/xezG/A7UW/XUqymruy8H6VaeXiSH4IwIh+V/QlYV
	 kvM4dLDkMZDcobPB9NHabEdNxxgiBieY3h0EdJbrXUOLzjOb2aQfZAP0c0WK3abDok
	 evCl30v0r9VoQ==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 677C840583;
	Tue, 17 Jun 2025 01:25:03 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 03367A0070;
	Tue, 17 Jun 2025 01:25:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=kL807HDZ;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 818A1401C7;
	Tue, 17 Jun 2025 01:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svzC1xYvVBOvgVrmdDJFviw7K2gSXmcZvt4x9cYPOH0/gdFqOgIja1QwOLnuceohxQRshHyUo9BteJZBsAZ3CSE1K0lUuRPniZGV/Q/rL+dx93GOArDW8YY1LQ6h7RdT5b2lTTFWZWn/cHw8NfAvvI01e6R2S4jVDtHXvcGHd4obSmojdyMDxAmkxW+jkTttMEeethEj5VowIXu4pDdNT+gY+LA1xdFf65r8vDWSOFgGE5LoUj81attWkwwgDx8mx+doSWVcQg1xjE5qdJS/dIXG5ebgGw3U4xrLnFGT0u5nBRxOT//IKs2TzzmgUdeJ1APEsuNMLVJlhQpEyqqZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDkV+pyWRm8dW7KpmGwEs40Vsj5IA+vpQdLpb8xpjKw=;
 b=BQSJJtdm4NBavWqLT8Fyuq817MnJvpAuoShZoEEuWLBopxjcGeW5wVie7K+mU+ZsvzSHOQJw4629WwObEV+1J79uMkvVNO8nLfdM/1KO8l/0S3aI4fBlcZc2Kx/VzEFrTOUw8Sv3Rw43UwrAtUMc19NkP5pZ5EcLOkRoR4nYpV1p4/yL/bMPHdgFy9vaSxk6jHyC4CLHRSpve/vZrUeZRyv62Aw5ITCf+2cjNwozuW9EqVwV3TYAsbPviAM0Dp6msl9Qmz61zYAyV4Pk/K+aLJ0qwdAZxhVIDhjQfeA5VpZ7JwkgrrhDEoMsmgj5xa6qjo+jdProfWx/SJnj01SCiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDkV+pyWRm8dW7KpmGwEs40Vsj5IA+vpQdLpb8xpjKw=;
 b=kL807HDZe2j8SFcquux7rL9f/OS//fUUD5wVsQ7l41umc64ulPdQ6+Cs5JWIZNKKqVZV0kQUNUQ8hr5NVb1XYuwcxRLMKJP2oYW3mZjvUrgXXXWDchJ1pNR0YAIzt3tCpW5Ajlu2uUjPQ01lU3WuMZ8l/k1aKsEd9Nc+zW8WPLA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ1PR12MB6267.namprd12.prod.outlook.com (2603:10b6:a03:456::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 01:24:59 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 01:24:59 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Jakob Trumpower <jakob.trumpower@matrixspace.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.
Thread-Topic: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.
Thread-Index:
 AQHbtgHIe40KI1iUEEu1UTaSuuJEJrO87/qAgAjQYTuAAjUAAIACgqPDgAbvq4CAAob3hoApRMkAgAmtzgA=
Date: Tue, 17 Jun 2025 01:24:59 +0000
Message-ID: <20250617012448.ax4o22ibvj7ppg6e@synopsys.com>
References:
 <PH0PR06MB7077FFC05705A02FD5CB94C2E8842@PH0PR06MB7077.namprd06.prod.outlook.com>
 <20250501001425.ijly3g2knjghvese@synopsys.com>
 <PH0PR06MB7077C939CDCF50DADE0A70F6E889A@PH0PR06MB7077.namprd06.prod.outlook.com>
 <20250508003232.t5bqoqvbmnohpeka@synopsys.com>
 <PH0PR06MB70771B5C2F3FA38E0BC9E2F4E88AA@PH0PR06MB7077.namprd06.prod.outlook.com>
 <20250514004759.v4twvbma5rm3mept@synopsys.com>
 <PH0PR06MB7077F3F58590593F11AEF749E890A@PH0PR06MB7077.namprd06.prod.outlook.com>
 <20250610213624.afp3pxu3uqluhjhc@synopsys.com>
In-Reply-To: <20250610213624.afp3pxu3uqluhjhc@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ1PR12MB6267:EE_
x-ms-office365-filtering-correlation-id: 2b0e0bb6-52ab-4b2f-7698-08ddad3dc68d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?em1JaVQrbVNRY3U4UlpOQXBwbmppemhFZWxPdHN1bVh0Ky9wbEY2L3YycnZM?=
 =?utf-8?B?YmVkaFZ4bGVmc0xxc3FZejB5T3Z1RENVRVVsRk1LNDB4aFhZSUg3cUFlNTZo?=
 =?utf-8?B?Rlp0RkN3Y09xeS9IQ1luUlBZdVM0L1REWWVBVjdLMkkxRWRZZ3pmZ1c1akd3?=
 =?utf-8?B?dVMxK0J6Q29oOGhKV2VEM1drMFlKNVQrQnJ4Z21XaGR5azBHaTdkc1pTcnlE?=
 =?utf-8?B?eDhIMXVpOGdndkp0Ky91N2lhNWJSWVpSdExDbEQ1UDY4TnkxNDBVN1hUd3Z4?=
 =?utf-8?B?Q1JWMVJ0ZXZYbjJaSWh2Qml0ZHRvTFQ5ZnhYZFJnY2ptbFdiTHNPa2lReDI3?=
 =?utf-8?B?OExkK1lrYmJDdmpkdU9zZEwxTVA0bTdmUldiQWcvbEZmejhnRUg5MmdsV3pq?=
 =?utf-8?B?ODJrY2NWeVo4UnVCYmkzN21sRDcxRm1Wb09WUU8wSytNTjJkWE1kbk9BWmJy?=
 =?utf-8?B?QWVHSEEvYTRjaGVQZmVGTmhCZzF0ZVRYTzBlcFVWZzNrbG9KSTVpWGcydndo?=
 =?utf-8?B?d211MDJuZ29FQnVYWjJpUTkyU3hmVTFJdWlCQ1Y3VEtaZVF2MXUvT2xpT1VJ?=
 =?utf-8?B?WmZiL29RVnVJcXhHY0tOQkhYUkVXQVZZM0hmeTZrcDdqRUhMeHJlTnRXVzlx?=
 =?utf-8?B?WHNrbkUzTTVPQUV4SVJqd1Z5UGlrN2pZQ0Y5ZlJacXFMN29qRWRKbmxYQytq?=
 =?utf-8?B?OGNHODNvSmx3ODN4NVpHUWtLNmhuTzRWQ3gwa0R2aEx1dnJhbWNZS1FOQU5Q?=
 =?utf-8?B?cmthZVk2VGROWU1tdUw0YWlKSGF6UkNYUXM4YTZnMUFRbUFEN21Oc0o5Ym1k?=
 =?utf-8?B?Z2tlQXIxNWlZdFNGZGRIT0pHejIrS2hnSDhkZnRiaDVrckxvaWh2eW5OU0Rj?=
 =?utf-8?B?MVVsNkgxaG0rQ3pCaWtnQTVKM0lWdFVPd0dXbHV3bWx6dXZ1a3Vla1UraVQz?=
 =?utf-8?B?VGRKdmVaNHRFZDltYkNtTzJ0VHZxRkEyMGhSOUNJMFV4QWNzQnVXU0sxMUJE?=
 =?utf-8?B?MU9LRWJ2OWRyUFROMWQ1Nk5HY0lzeWR4VUkvSmN2b3plRlJPanlkWm1HSnlO?=
 =?utf-8?B?TTQyNDEzd1RXa2laZlhkcElOVDhXR0lKbmlhWTRJcnZQL3B0RW1ndnpEZVlx?=
 =?utf-8?B?cXZSMVE5c3FmOE5XbmdqMjU1aXIvR0lMUWpWdVhrY1pXY2RYR0R2NENYVXRj?=
 =?utf-8?B?ZFQwMHdwakdocHRWQW9oQmhvSlRyMkM0d3hYRWFPMEtydU9ySUxwVXI4TmZX?=
 =?utf-8?B?Z2twVTNaeHNNMzVyNWNuNVJZc0JES1pKVzhZZXVzWCtxbE02SmdqdVFGZUpJ?=
 =?utf-8?B?dmIwMVp0akRwVnlQRUlsemVOVm1DZ2xubFBtTFhkeWVUWjJJTnJmMzdNaEhW?=
 =?utf-8?B?ZXVyVUUvZXA3VGVBL1FuY3pSd2tDQklGQ1grb0VnV0VWUmc5OUVVTnhwSVYx?=
 =?utf-8?B?b3YvdHo0MmdoejdiSjY4eklxVTQzRlhackhpdDYyaEtjemJpWUxibUpFMkZG?=
 =?utf-8?B?RDdXNUVxMTdrSkRyaC9XNk1wRmpQR2VQZkRYbnlzSk9oOVQrTVBSeThLLzE1?=
 =?utf-8?B?bVVmOWxINWdiZTVRSnNvN3NSVnZsNlN1MHVKN2hUT2tBSW05M1Q3UktlYS9I?=
 =?utf-8?B?dllEREZhNVVWeGlPTHhuNlI1dDVqWEhreDg5OHM5Yk9qc3VFN3JMUHRuV2JL?=
 =?utf-8?B?T1VvRk5BaFZTUDlYNUZUZmxuWWVpdzVrTS9aazIvZ3pRbU9vT050M0YySjRh?=
 =?utf-8?B?R2g5SWR3ZE4xZlJ4azlPZmdFRjBacElBMndSNzdjM3pRVElTT1pLVUdYQVhK?=
 =?utf-8?B?SHNjSElscnpOQkxCL0JTcENQV2EvZ1NtMDk4YjA2bHRSOHV5aGYvMTFVQ2o0?=
 =?utf-8?B?TlI3cEtJa1hzbXdyc2h3MlYvSEN0dFVSWHRWYjVmSjVlTzhIVWM4SUZwTVIy?=
 =?utf-8?B?Z2hsWnFPMGY3dVpLZFdmWEU2ZGZCYWdnd3l0RmlGbHZ1MFl5WUx2TW5HM3pU?=
 =?utf-8?Q?1I6FiN26rEC2piuRsQ+FSIpHZEuupM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEdxeUdDeVIwMUpHWE5pUUtnLzM3LzRRUkJJZzdLQ3M3KzAwWEZ1d2JBQ3A5?=
 =?utf-8?B?R0JITzFURlc1dnMzRmNacVlkcFlCQjFScllhLzliRklFL2ZRNmEzYmJXQzhW?=
 =?utf-8?B?VGVWb1NzTGlXMHlFNG1DMS8vQTRnRWUxc1dkYjd3TDBTdEUva0dvU1JkdVRn?=
 =?utf-8?B?aS9sV2hvN1FDUGsvRmZ1ZHc4NFpYbEZ4aHp0K2NVTWJxbkVIZWUyc084bGlQ?=
 =?utf-8?B?NmQ0VUlBbGZISXIxaTFNVUlFcTMzaEVrcWZxYkxFTTVEY2F2V3FDcmhuTUtW?=
 =?utf-8?B?OTJGMG5yVVk1MksyVUlYTVJ1S2J6ODJQQmk1V0JkNlllbWlFb0RhMnJKdlVa?=
 =?utf-8?B?elhwQktkemVZYjJPK240cnNhdlRJM0tBOFc2SXYrSGxlbEU4ckN0cEU5OTB1?=
 =?utf-8?B?bXNLaHB5YkxVVGdBaUFld1NqQVJFV2M4YklHRHZlNytySFV1VE44RitJQ0p1?=
 =?utf-8?B?cTJDOHhCNXpjdkg0d0RZRUFhK3J4NWZUYTVPOGhucHFpVHhEOCt3K1h3eXlx?=
 =?utf-8?B?TjZlVVJyTmMzSnN2T3pRZzd3eGFGQmYvRXE1bUdVcHROallkYzlCSE5RZWlT?=
 =?utf-8?B?T2ZKTUI5L0RTVkRQbjFVSzZPRE5kWVJGemVpUEkyRWZCTU84U29hT0tKcUlR?=
 =?utf-8?B?Z3BOV3loc251MXlFb1FxZ204S0wrRE5YVUhKanl2Snpha3dNb2dmLzRoTlpq?=
 =?utf-8?B?R0NjbFVmYkpJSGZnd2lLM1pKWHc2U1UzRExrQUY5MUF1dFY2QnN1WmJ1OWVY?=
 =?utf-8?B?TElXYnAweGZzeVJESkdPTFgrR1lDK2d2SlJUNGU0V0NxSDFuN1gxU3pxeDdP?=
 =?utf-8?B?cmU4ZzNiSlVUTXhYRlMrWlVTZExkdWFUK0U1d050dmszREtmTkg5dlRmcHA0?=
 =?utf-8?B?V1RLWmdLUmNzUW12d1BKOXFOa0piTkFGQkp5cXRvcUkvd1VEMFlQMTJhRjA2?=
 =?utf-8?B?a0RNaktSWklwb25ReHZCNDJyWlRnTWNnY1NrSyt4Y2E5NWh0Nkh2RC9Odm1U?=
 =?utf-8?B?M2xUcWhZNEs2T0oyMnExMjdZUmpqcGk3RWVjVjRNd0VyM25IaTB3SDREOURH?=
 =?utf-8?B?V1YrUnZmNFQwcDh0Z0Yvc29Ram9aZDZiQlRGVXZuOFdRdktNdlNJUFRwcGZk?=
 =?utf-8?B?N1gvQVExWWNXUVpoZEhvd0FGbFJESk9wclBGMER4d2V1a0RuT1BpQlQrSWtO?=
 =?utf-8?B?Ymg2Qi9iNG5yR29iYkVBSlJqU2IzTXAzbmxhYkpkNHNPSUdNK1JvdithdTNy?=
 =?utf-8?B?VFZ3MCs4Tno5dlNPZXR1a00zOGJRTlQxdUxUZVU2elFNUTJlYnNIVmU5WEVW?=
 =?utf-8?B?ZVNDb3JuZ3FRdFdxTUFmNm9GdFliSGFUSkpoTzhLM0Ixc0F6bzdyTGJiZk9M?=
 =?utf-8?B?bXRYYm9qU3BZWnVTcnpwYmxtaTJ6eTNoV3J0UUxPUXFONExJd3RiQ3FoVnIv?=
 =?utf-8?B?ZjU1THZPTTJWYjAvNDRVUUQwU3RJeUVxWE1lbjBjdFFVRURNd1ptaGt5Q0xw?=
 =?utf-8?B?eDdkNk40OGJ2ZFE1UmtRaUNxMUJ6L3pKc3ZiYUU0cU5Pa2NZcWNpR3J4WjMw?=
 =?utf-8?B?UzNwWDVVSk9ZTXhSMTZpcTk1VXlad3Q4SE5Ldis0dXphMWpLYjNEcXB3dGN6?=
 =?utf-8?B?ekVPRFM2NHlkUUhjVFJSZXFMdXRYVUVvS05Oc1BtNXZ4WXVJeEtjNFpUSVc1?=
 =?utf-8?B?aTgyS0lpMWpWTHBVcGlMUUxXMXVNcGtqRnlUT0NDMzJvbnBMTnFTUXdYaUpE?=
 =?utf-8?B?aEhiMkhjb0gwZWcvZXNZM3BTYzhqY0plNWNDYml0WVVyUGNIMzJrVXMyUWtS?=
 =?utf-8?B?Y0NmUXVYYnpSdmtQMDZIb3lGdzNZeWhQMVFWT2o3dG0vU0QxNklSNEt3OWpl?=
 =?utf-8?B?RDk3WkQwR3Q2WWU1aFMzNVdsSmFFdHlYZnd0Mi9QWk1QRytqQ3NDa3VxcVBh?=
 =?utf-8?B?K2YxbXQvVys2bnVBOU1BYlJLVGVqL2xMTVQ0UmRjNU85d3pIQ1lES2ltY0hP?=
 =?utf-8?B?MW1XWWIra0hhRGZTdFZIVnZIQ2xiaEVROW9NY1loQ2FhRndWSWFMc1NTMmFw?=
 =?utf-8?B?RUdFTkZ5bUZPaHY2Mkt2ZzBVNW9QcU1xRkNPS24yLzZKb1FCUGdZMXJ6ZjlJ?=
 =?utf-8?Q?rPpvzMlhMA5NfFmXdzX4B/iPm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA23596E1890F84E9F03F346599E6E75@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a6zLHOzH8KK+Z/108RTdqSIy0pVw+jWBamaX1dzON8QaGmdK/Ipa4Oa03N9zUEoVCQGOWtB3+0fxmcb/coH13NPo3sckw0lQDKrCA9JYNu4V3tSN8Jpai2BcoqScRXqzEZspghShxCg6OQWTDHe4l35EAlDJeMIYKpo5G67HMuZnbwxvqbcUk846uZQr6e8oIGHSKtlmWXVQNmNc//c/1ZJEzZVw/8RwexwrtM7PyVJgpSWz9zFclUNcmPLSFTp7eAEedzMnna2HogMF+8wnr4KmTLd+yyyWXRXbnqeVcHhpwqkwPqh59T264/sfg/v1B5vN/cb/+Y9eqPJ/zXxEctHMJVbDe95jVHG3+pZzf+/KxDbczgrSt2RY5jvsgWHvMZCYrrZaHh2tb3Md6ryN7/ZjKgd3OvstQoRWqbFgjx3rsfZ+GF9ikcx9FspTHSdRi6DBsrYgg/SjRLkA0KQ1oifPtfYZj4F5Ex6qOLE6E8uEMDAUPr2djp+z3Wg/B6t/UvlVseN94ZGDnWd5zlMt7eBXajwUG5CVgRAxZCQg13C0pfCVkwt8enYn8XKTgoQIqmWa5d5Aj38yldbhTmspcoLAMuyUAs2YVZpqKbA4B4qNUA7Q8nPYNH4s7juZD+V9i9pcv5UhdKvpoKbm82LM8A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b0e0bb6-52ab-4b2f-7698-08ddad3dc68d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 01:24:59.1651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HUJmog/3tV0vnOuYH2yTxzQWQLz5yN636ZeAD0wcrI59DlRYIu9dtT9P8/YNCYJxPSQa+NiJKssSoNa4+m7bvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6267
X-Proofpoint-GUID: dCcr2zUKAdBok0fiUstcJtRcVTxgZnOG
X-Proofpoint-ORIG-GUID: dCcr2zUKAdBok0fiUstcJtRcVTxgZnOG
X-Authority-Analysis: v=2.4 cv=ApHu3P9P c=1 sm=1 tr=0 ts=6850c3f0 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8
 a=9UXh74YsNjZlBzjOgdUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDAxMSBTYWx0ZWRfXxZ4RoGtWZ8WM
 Ib+2CXIKQBnEUotqEeKZQZqD6WWMIvGzUOgGVbVcbEtNMEkuMQMTPlgBihqbWL9tRccghryluxd
 nahF0qh0ivx7VhXZpuopsB+rIxSm4MIlJUhRaHWwZHK/vQ/K9Z62aZlYO45xTpn1222G5rVhgkK
 mhjxDXZq2L/MmIeTVgMpb5vMUwoF+/9O4eRWZeYNtjhtPwMXG8nSkSthDq3IjDVcx63s9r4Bmwp
 e0cfCct8HNbyp/sjC1FQukKDS7ATvrdtM5WSVqfTuNzrbkvZH2RRNDjdQZTfF4cm6S8sJFXYsnd
 4NAZEb3IsiHxz/wztin+vMUqciEKThLgO5v4ytOV2DqJQxRqUHBA0Z1ubnywoyCCiKOfQTjHf0l
 KqMwaOvuEbVY1awH/9PzFiQ6+LhQnJhWQiaM2XtnujlmnAXG4qou/hJ3n5QK5H0NaQi8Ssb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_12,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 spamscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506170011

T24gVHVlLCBKdW4gMTAsIDIwMjUsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gRnJpLCBKdW4g
MDYsIDIwMjUsIEpha29iIFRydW1wb3dlciB3cm90ZToNCj4gPiANCj4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gRnJvbTogVGhpbmggTmd1eWVuIDxUaGlu
aC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiA+IFNlbnQ6IFR1ZXNkYXksIE1heSAxMywgMjAyNSA3
OjQ4IFBNDQo+ID4gVG86IEpha29iIFRydW1wb3dlcg0KPiA+IENjOiBUaGluaCBOZ3V5ZW47IGxp
bnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGJhbGJpQGtlcm5lbC5vcmcNCj4gPiBTdWJqZWN0OiBS
ZTogW0JVRyBSRVBPUlRdIHVzYjogZHdjMzogRmFpbHVyZSB0byBlbnVtZXJhdGUgZnJvbSBib290
Lg0KPiA+IA0KPiA+IE9uIEZyaSwgTWF5IDA5LCAyMDI1LCBKYWtvYiBUcnVtcG93ZXIgd3JvdGU6
DQo+ID4gPiBIaSBUaGluaCwNCj4gPiA+DQo+ID4gPiBTb3JyeSBhYm91dCB0aGUgZm9ybWF0dGlu
ZywgSSBzd2l0Y2hlZCBvdXRsb29rIHRvIHVzZSBwbGFpbiB0ZXh0Lg0KPiA+ID4NCj4gPiA+IEkg
cmVtb3ZlZCB0aGUgcmVzZXQgYXQgaW5pdCBsaWtlIHlvdSBtZW50aW9uZWQgd2l0aCB0aGUgcGF0
Y2guIEFzIHdlbGwgYXMgcHV0IHRoZSBxdWlya3MgYmFjayBpbiBmb3IgdTIsdTMgZGlzYWJsZS4g
SSBhbHNvIGhhZCB0cmllZCBtYW51YWxseSB0b2dnbGluZyB0aGUgL3N5cy9idXMgZW50cmllcyBp
biB0aGUgcGFzdCwgYW5kIHdvdWxkIHVzdWFsbHkgc2VlIHRoZSBodWIgbWVzc2FnZXMgY29tZSBi
YWNrIGJ1dCB0aGUgZG93bnN0cmVhbSBkZXZpY2Ugd291bGQgc3RpbGwgbm90IGVudW1lcmF0ZS4g
SSB0cmllZCBpdCBhZ2FpbiB3aXRoIG5vIGNoYW5nZS4gTm90ZTogdXNiMyBpcyB0aGUgMi4wIGNv
bnRyb2xsZXIgZm9yIHRoZSBzYW1lIHBvcnQuDQo+ID4gPg0KPiA+ID4gcm9vdEBtcy1yYWRhci0w
MTp+IyBjYXQgL3N5cy9idXMvdXNiL2RldmljZXMvdXNiNC80LTA6MS4wL3VzYjQtcG9ydDEvZGlz
YWJsZQ0KPiA+ID4gMA0KPiA+ID4gcm9vdEBtcy1yYWRhci0wMTp+IyBlY2hvIDEgPiAgL3N5cy9i
dXMvdXNiL2RldmljZXMvdXNiNC80LTBcOjEuMC91c2I0LXBvcnQxL2Rpc2FibGUNCj4gPiA+IHJv
b3RAbXMtcmFkYXItMDE6fiMgZWNobyAwID4gIC9zeXMvYnVzL3VzYi9kZXZpY2VzL3VzYjQvNC0w
XDoxLjAvdXNiNC1wb3J0MS9kaXNhYmxlDQo+ID4gPiByb290QG1zLXJhZGFyLTAxOn4jIGVjaG8g
MSA+ICAvc3lzL2J1cy91c2IvZGV2aWNlcy91c2IzLzMtMFw6MS4wL3VzYjMtcG9ydDEvZGlzYWJs
ZQ0KPiA+ID4gcm9vdEBtcy1yYWRhci0wMTp+IyBlY2hvIDAgPiAgL3N5cy9idXMvdXNiL2Rldmlj
ZXMvdXNiMy8zLTBcOjEuMC91c2IzLXBvcnQxL2Rpc2FibGUNCj4gPiA+DQo+ID4gPiBIZXJlIEkg
YW0gdG9nZ2xpbmcgYXV0aG9yaXplZCBpbnN0ZWFkIGFuZCBJIGRvIHNlZSBzb21lIG1lc3NhZ2Vz
LCBidXQgc3RpbGwgbm8gZGV2aWNlOg0KPiA+ID4NCj4gPiA+IHJvb3RAbXMtcmFkYXItMDE6fiMg
ICAgICAgICBzdWRvIGVjaG8gMCA+IC9zeXMvYnVzL3VzYi9kZXZpY2VzL3VzYjQvYXV0aG9yaXpl
ZA0KPiA+ID4gcm9vdEBtcy1yYWRhci0wMTp+IyAgICAgICAgIHN1ZG8gZWNobyAxID4gL3N5cy9i
dXMvdXNiL2RldmljZXMvdXNiNC9hdXRob3JpemVkDQo+ID4gPiBbIDIyMDguOTUwNjE1XSBodWIg
NC0wOjEuMDogVVNCIGh1YiBmb3VuZA0KPiA+ID4gWyAyMjA4Ljk1NDQ0MF0gaHViIDQtMDoxLjA6
IDEgcG9ydCBkZXRlY3RlZA0KPiA+ID4gWyAyMjA4Ljk2MDE2OF0gdXNiIHVzYjQ6IGF1dGhvcml6
ZWQgdG8gY29ubmVjdA0KPiA+ID4NCj4gPiA+DQo+ID4gPiBUaGVuIG9uY2UgYWdhaW4sIEkgY3lj
bGUgdGhlIHVzYiBDIGNvbm5lY3RvciBhbmQgaXQgY29tZXMgdXA6DQo+ID4gPiByb290QG1zLXJh
ZGFyLTAxOn4jIFsgIDMyMy4yMTAzOThdIHVzYiA0LTE6IG5ldyBTdXBlclNwZWVkIFVTQiBkZXZp
Y2UgbnVtYmVyIDIgdXNpbmcgeGhjaS1oY2QNCj4gPiA+IFsgIDMyMy41MTE1OTddIHVzYiA0LTE6
IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0wYjk1LCBpZFByb2R1Y3Q9MTc5MCwgYmNk
RGV2aWNlPSAyLjAwDQo+ID4gPiBbICAzMjMuNTE5Nzc2XSB1c2IgNC0xOiBOZXcgVVNCIGRldmlj
ZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9Mw0KPiA+ID4gWyAgMzIz
LjUyNjkxN10gdXNiIDQtMTogUHJvZHVjdDogQVg4ODE3OUENCj4gPiA+IFsgIDMyMy41MzA2NzJd
IHVzYiA0LTE6IE1hbnVmYWN0dXJlcjogQVNJWA0KPiA+ID4gWyAgMzIzLjUzNDUwNl0gdXNiIDQt
MTogU2VyaWFsTnVtYmVyOiAwMDAwMDAwMDAwMEZGMw0KPiA+ID4gWyAgMzIzLjkxMzc5OF0gY2Rj
X25jbSA0LTE6Mi4wOiBNQUMtQWRkcmVzczogYTA6Y2U6Yzg6YmE6YTk6NDQNCj4gPiA+IFsgIDMy
My45MTkzODldIGNkY19uY20gNC0xOjIuMDogc2V0dGluZyByeF9tYXggPSAxNjM4NA0KPiA+ID4g
WyAgMzIzLjkzNzE2OF0gY2RjX25jbSA0LTE6Mi4wOiBzZXR0aW5nIHR4X21heCA9IDE2Mzg0DQo+
ID4gPiBbICAzMjMuOTUxOTg0XSBjZGNfbmNtIDQtMToyLjAgZXRoMDogcmVnaXN0ZXIgJ2NkY19u
Y20nIGF0IHVzYi14aGNpLWhjZC4yLmF1dG8tMSwgQ0RDIE5DTSAoTk8gWkxQKSwgYTA6Y2U6Yzg6
YmE6YTk6NDQNCj4gPiA+IFsgIDMyNC4xMDMzOTZdIGNkY19uY20gNC0xOjIuMCBlbnUxYzI6IHJl
bmFtZWQgZnJvbSBldGgwDQo+ID4gPg0KPiA+ID4gVmVyeSBzdHJhbmdlIHRoZSBwbHVnIGN5Y2xl
IHNlZW1zIHRvIGZpeCB0aGUgY29udHJvbGxlciByZWxpYWJseS4gQWxzbyB0byBub3RlIHRoYXQg
aXQgaGFwcGVucyB0byBldmVyeSAzLjAgZGV2aWNlIEkgaGF2ZSB0ZXN0ZWQuIEkgaGF2ZSBhIGNo
YW5nZSBvcmRlciBmb3Igb3VyIG5leHQgYm9hcmQgcmV2aXNpb24gdG8gdG9nZ2xlIHRoZSBWQlVT
IHdpdGggYSBHUElPLCBidXQgbm90IGFuIGlkZWFsIHNvbHV0aW9uLg0KPiA+ID4NCj4gPiA+IEkg
a25vdyBVU0IgYW5kIHRoZXNlIGNvbnRyb2xsZXJzIGFyZSBleHRyZW1lbHkgY29tcGxleCBzbyBJ
IGFwcHJlY2lhdGUgeW91ciB0aW1lIGFuZCBleHBlcnRpc2UuDQo+ID4gPg0KPiA+ID4gTGV0IG1l
IGtub3cgaWYgeW91IGNhbiB0aGluayBvZiBhbnkgb3RoZXIgcmVnaXN0ZXJzL2V4cGVyaW1lbnRz
IHdlIGNhbiB0cnkuDQo+ID4gPg0KPiA+IA0KPiA+ID5UaGFua3MgZm9yIHRoZSBleHBlcmltZW50
cy4NCj4gPiANCj4gPiA+IE9rLCB0aGlzIGlzIG9kZC4gSXQncyBub3Qgd2hhdCBJIHRob3VnaHQu
IElmIHRoZSB1c2IzIHBvcnQgZGV0ZWN0aW9uDQo+ID4gPiBmYWlscyBhIGZldyB0aW1lcywgdGhl
biBpdCBzaG91bGQgZmFsbGJhY2sgdG8gdXNiMiBjb25uZWN0aW9uLg0KPiA+IA0KPiA+ID5MZXQn
cyBjaGVjayB0aGUgcG9ydHNjOg0KPiA+ID4jIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy91c2IveGhj
aS88eW91cl9jb250cm9sbGVyPi9wb3J0cy8qKi8qDQo+ID4gDQo+ID4gcm9vdEBtcy1yYWRhci0w
MTp+IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvdXNiL3hoY2kveGhjaS1oY2QuMi5hdXRvL3BvcnRz
LyoqLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICANCj4gPiBQb3dlcmVkIE5vdC1jb25uZWN0ZWQgRGlzYWJs
ZWQgTGluazpSeERldGVjdCBQb3J0U3BlZWQ6MCBDaGFuZ2U6IFdha2U6ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIA0KPiA+IFBvd2VyZWQgQ29ubmVjdGVkIERpc2FibGVkIExpbms6UG9sbGluZyBQ
b3J0U3BlZWQ6NCBJbi1SZXNldCBDaGFuZ2U6IFdha2U6DQo+ID4gDQo+ID4gPkFsc28sIGNhbiB5
b3UgYWRkIHRoaXMgdG8gdGhlIGtlcm5lbCBjbWRsaW5lIHRvIGNhcHR1cmUgdGhlIHhoY2kNCj4g
PiA+dHJhY2Vwb2ludHM6DQo+ID4gDQo+ID4gPiJ4aGNpX2hjZC5keW5kYmc9K3AgdHJhY2VfZXZl
bnQ9eGhjaS1oY2QgdHJhY2VfYnVmX3NpemU9MzBNIg0KPiA+IA0KPiA+ID4jIGNhdCAvc3lzL2tl
cm5lbC9kZWJ1Zy90cmFjaW5nL3RyYWNlID4gdHJhY2Vwb2ludHMubG9nDQo+ID4gSSBhdHRhY2hl
ZCBhIHN1Y2Nlc3NmdWwgdHJhY2UgKHNob3J0ZW5lZCkgYW5kIGEgdHJhY2Ugd2hlcmUgdGhlIGZh
aWx1cmUgaGFwcGVucy4NCj4gPiANCj4gPiAtSmFrb2IgDQo+IA0KPiANCj4gVGhhbmtzIHZlcnkg
bXVjaCBmb3IgdGhlIGNhcHR1cmVzLiBBcG9sb2dpZXMgZm9yIHRoZSBkZWxheSwgYnV0IEknbGwg
Z2V0DQo+IGJhY2sgb24gdGhpcyBieSB0aGUgZW5kIG9mIHRoaXMgd2Vlay4NCj4gDQoNCkxvb2tz
IGxpa2UgdGhlIGxpbmsgaXMgdW5zdGFibGUuIEl0IGtlZXBzIGZsdWN0dWF0aW5nIGFuZCByZW1h
aW5zIGluDQpwb2xsaW5nIHN0YXRlLiBQZXJoYXBzIGEgd2FybSByZXNldCBkdXJpbmcgcG9ydCBp
bml0IGNhbiByZWNvdmVyIGZyb20NCnRoaXMuIFRoZSBwb3J0IGlzIGRpc2FibGVkIGZyb20gZmFp
bGVkIGxpbmsgdHJhaW5pbmcuIFBlcmhhcHMgdGhpcw0KaGFwcGVucyB3aGVuIHRoZSBwaHkgZmly
c3QgcG93ZXItb24gYW5kIG5lZWRlZCBzb21lIHRpbWUgdG8gYmUgc3RhYmxlPw0KDQooTm90ZTog
bm90IHRlc3RlZCkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMgYi9kcml2
ZXJzL3VzYi9jb3JlL2h1Yi5jDQppbmRleCBmY2VkYzE3ZWNkMmEuLjU0ZmI0Yzk1YWZlOSAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvdXNiL2NvcmUvaHViLmMNCisrKyBiL2RyaXZlcnMvdXNiL2NvcmUv
aHViLmMNCkBAIC00OTA3LDcgKzQ5MDcsNyBAQCBodWJfcG9ydF9pbml0KHN0cnVjdCB1c2JfaHVi
ICpodWIsIHN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2LCBpbnQgcG9ydDEsDQogDQogICAgICAgIC8q
IFJlc2V0IHRoZSBkZXZpY2U7IGZ1bGwgc3BlZWQgbWF5IG1vcnBoIHRvIGhpZ2ggc3BlZWQgKi8N
CiAgICAgICAgLyogRklYTUUgYSBVU0IgMi4wIGRldmljZSBtYXkgbW9ycGggaW50byBTdXBlclNw
ZWVkIG9uIHJlc2V0LiAqLw0KLSAgICAgICByZXR2YWwgPSBodWJfcG9ydF9yZXNldChodWIsIHBv
cnQxLCB1ZGV2LCBkZWxheSwgZmFsc2UpOw0KKyAgICAgICByZXR2YWwgPSBodWJfcG9ydF9yZXNl
dChodWIsIHBvcnQxLCB1ZGV2LCBkZWxheSwgdHJ1ZSk7DQogICAgICAgIGlmIChyZXR2YWwgPCAw
KSAgICAgICAgIC8qIGVycm9yIG9yIGRpc2Nvbm5lY3QgKi8NCiAgICAgICAgICAgICAgICBnb3Rv
IGZhaWw7DQogICAgICAgIC8qIHN1Y2Nlc3MsIHNwZWVkIGlzIGtub3duICovDQoNCkJSLA0KVGhp
bmg=

