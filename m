Return-Path: <linux-usb+bounces-17760-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 421889D44C0
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 01:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30A97B21FF4
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 00:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34CA29A0;
	Thu, 21 Nov 2024 00:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HQ2hzgzP";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iH2XjkZ1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WN1vfaQd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D019A
	for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 00:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732147364; cv=fail; b=R8wCzfz4IH/e88AMXsBSUbwtjFszrj8Bx3CVwiap7urEq8h30+4ZBGzwIO7IujJhtwAgyehutHbmI56+qREXYsZRqDv0SFHiuz7LBCyDcUuLeG/MrclJgxZPAFDbch3Ir4F6ydejM1iZDlm1Fh64hqYMfpaIx3CmppT08R4QcH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732147364; c=relaxed/simple;
	bh=X3Go/kRUA7BdRokbCraS9PxHSv1l6WQFT3AtUL+i+sU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oIa3ApCdpg+ON+VH/JGfEt3vrCluwxnXvpdHJPdd1pi6lJp4ff3OnWN8Ng83lzIj9EvomF578mzqEkwdo9abiY/W8ZepGdL46mWoIXyEeWRjD9irvKRbYWqnMJz+7fXxsTedouSbP+Ms3+zCiCM7q/gNc/CRKbetl2cufmTqx+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HQ2hzgzP; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iH2XjkZ1; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WN1vfaQd reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKHS3fV031801;
	Wed, 20 Nov 2024 16:02:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=X3Go/kRUA7BdRokbCraS9PxHSv1l6WQFT3AtUL+i+sU=; b=
	HQ2hzgzP5GNIhTNvI3mqbK9US2wLvRcT1HiKRd8//4OlK199ED5uChaHY8jpVkf6
	uUe5k86pEb+6OzDTuXpMggTK2ZIvmiuyFQm/btbht2LH901SjVCgqbPq2U5q5xCy
	EAxqdW1oRAfxmx0vE1dEBVx1I7gEayvbcQHDWLrjlkFr7OqwLYzbM1paKjfRcMHd
	5ID6Tin4AxrDsN5yi41dAfv1mUKkc9MpNyW2/DpS86oowlSTJRud+4eHGPsvShGx
	cWuBmXfjLQpZs/6UjujsXELfcOlQh2uzwxIv4R+P1mZRC/FspvMRnqyQwaCLbkpT
	f/zHJ+G8HiYZi1aqsqMIaA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 430ep9d0xy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 16:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1732147348; bh=X3Go/kRUA7BdRokbCraS9PxHSv1l6WQFT3AtUL+i+sU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=iH2XjkZ1LM8B8ZBjiBrV/jZQiGOjNds9QIK14jdzk7yOdFPSlgEFuaAQzlpX8hWw9
	 hXgOKqT6YyXPQkaeHsTwQPIzoybLp6P6zu/6pwmNrQZdGEQ7EbplE+HKbKseO2yY6N
	 yb97s/bAyqcTRL+jh2nOT5qQVnWS5HlDYqZT39MjKYfOkseE8L7/Vn22kEe6SqYo+A
	 /1QHQ0Eew8MDS0YL+PzSkAYjXVdP8zZ3yUTlshA9vthBNM2PS19C2n0dpkI2bU4LV7
	 FtMmOCJ6pTv8S3Pd8NdECLF0inCjwsOgvEjTKzLXPCjgB9lwrvpToqzWp8fREuRAQc
	 jKrSoQsFgCIJg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 51C3E40144;
	Thu, 21 Nov 2024 00:02:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CF863A009D;
	Thu, 21 Nov 2024 00:02:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=WN1vfaQd;
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E9527401D3;
	Thu, 21 Nov 2024 00:02:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsszvJKpwTnxn0S+MX4WwinejeKK17jVpoJmOV1apD//b0wwCJx8AeSpOw5zjNen7L1triTeF/9fqMWjCsaTX9Oryj5KitugeVofwYlxtx4yh5tgjRWRw94nCWCwNlZ66qWXsh99vdDkfB3VgrtxoP64tdyfWyMvcNIfdZxCIIg1pSOBgNYCKASDw9FqaxjSrV5a9RK+5cz18axvv5k4niiEsAacWLxr7xci4g11KpWILIXOu/O7X0ObKmSIe5p0TAv8mXbtC1hClAkBXXuiGYo3kqwRxCYTSvl1VV7EoGPhw3UDgBumP2PwkRdChELJZmiMzHo0xG04CjpFQ3W5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3Go/kRUA7BdRokbCraS9PxHSv1l6WQFT3AtUL+i+sU=;
 b=DCuKIy3jQgqn73GIZdGpnXA5XMg5hRsMosW80gIRFB3GIwFlPXT081m5OCH0yzY7HOLz2Jo9WG0TLa1Ydq1q8Vocn5654S8kxPZSkvGgSBs0to7x2kZJV5WAZsBgDxDoE6821UgO5U6JaCtES/84e+wh2go40SuVYCFnCW1S6wcxtiq0yIOd6ftlPHMsDMSvYcMzH45l+0NNdZaNCkhBJIMsqfrwuAnWqpsSIcC15AHIp44mAaEGYUqYjVALE3ibbRhtxE8gQxnVSaYlmp9fTS0TIJAV8uN4bg+o+NejXkUjTelONKgv6hLHpAcEgTJWm4SzQbUFy1KPRUyU1IKVDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3Go/kRUA7BdRokbCraS9PxHSv1l6WQFT3AtUL+i+sU=;
 b=WN1vfaQd5yn5DVOxxlHoPfDVcONcEuArFXscZjWh7dhpgkxbCOidE3zT0T7ZAP9HvSI0QeDvYdDmiOueuwfJJEe2RcO/oKi07Ds3B0jEehZ7vGMo1PvrybqIOAtAFMKpS/SWsCdxsllgjXZQyrz1mfK1sKZ7sUuQ2KHvtloglBg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW5PR12MB5681.namprd12.prod.outlook.com (2603:10b6:303:19e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 00:02:19 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8182.013; Thu, 21 Nov 2024
 00:02:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: =?utf-8?B?TWljaGHFgiBQZWNpbw==?= <michal.pecio@gmail.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman
	<mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: How are halted endpoints supposed to be handled in Linux?
Thread-Topic: How are halted endpoints supposed to be handled in Linux?
Thread-Index: AQHbO6GbghrbG+wzLkSWOTQI8KWvyLLA2fwA
Date: Thu, 21 Nov 2024 00:02:19 +0000
Message-ID: <20241121000216.kif557p3p6xyahax@synopsys.com>
References: <20241121001138.23a45f6c@foxbook>
In-Reply-To: <20241121001138.23a45f6c@foxbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW5PR12MB5681:EE_
x-ms-office365-filtering-correlation-id: a644049c-9935-46a0-a08f-08dd09bfc48b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WUQwMVRHalR6OFltTVI3YTI1MlJXdkw4NzRnb3hiYVBxbWxFNXR2Q2dlSmc2?=
 =?utf-8?B?a1g3dnZQaHYrZzV5dmVpT2diZ3Y3VU01Z3NLU25JWkp5RmtwK2paemVIa0lV?=
 =?utf-8?B?aUNCME9Relo1K2FRQko4T1VramppWWFmalQ1bGs0cm9GbzZsRFY4Q3hWNWFF?=
 =?utf-8?B?aTZLWEh6UEFTQ2JqUmlxY25ZQW5OeHREUEFPSG4rZmttSy9DZmdjai8ydmFL?=
 =?utf-8?B?aTFYZHk2MVp0QmJBNXMyT2pKT0xWZ2lCMnF1YjRCamQ0NWNJRnhZR0JIcHBp?=
 =?utf-8?B?WVRBdGhlM2g5dkkrYXZROE1HS3NxR21VZFVqbTJHVjJCOWNWU1hNdW1Cc0R5?=
 =?utf-8?B?UUNmS3o3dFpwSlVMQlFNMGJjOEM3d3NUazhmRjlINlRPdVV0UEVNMzJkYUtk?=
 =?utf-8?B?NWE0VXByRVNjL1lBTzV2aFdsQVVOeGZXNEhuUkpRbkN6K2xlaGJ1aVJubFJo?=
 =?utf-8?B?d092TG5laTh4Q3JUY2FvN2NEczBxQXd1Z3Y0ZGZBYXBsN2RDdmlab1RqWmpt?=
 =?utf-8?B?WlNjbEprN2RVcFkvbkVmd2lDeGI0Mi82cGQ0NTRiZzNIZnZYZWNreHhZQmJD?=
 =?utf-8?B?aXowTFNzbEZvU2tDczVrY2dhU0xNWUNNQTYyTm9XNVEvdE5lTlBXY1pVeGVM?=
 =?utf-8?B?ZlNKdjVYRjJqK2pYMjNvVm5EYkhLeTE0WTkyK0EraUFGMjArajZLZVBDK0NS?=
 =?utf-8?B?eUVJcG01cE44ZFdLaXZlMnZZcDQ2eUw2NkJXY2ltUWhRcHd1SUw0L0JhYTNF?=
 =?utf-8?B?eUJnVjh6aTNMM2N1aUpDZ2c1M1hNdkF0S1ZlMHhOMmkyc255M1NRRFhoUVlq?=
 =?utf-8?B?UE02MzM2VXBsYlVuUEhlakJIdW9KVzdjSmRNK3EzeGphcDNtQ1V4S3BpWVU1?=
 =?utf-8?B?VXl5UHl3SCtLOHlwbUYxSzhSUElTOFMrUExGVEhMaERCOWVuZWJQaHRRdVdM?=
 =?utf-8?B?MDQyTjlkR3dIQlhFYlh5V2dtajluZUgzU1pZMHpJQUtkb3pkODREN3d1SlF2?=
 =?utf-8?B?b3cxMmtLNEVKbUZ0VUx3eER0UnlJZ1hmb2RyQzhJRWNZa25VenU3VS8zSWla?=
 =?utf-8?B?RDM5VWordHRNRkgyMkxydHlPYnlEakNNdHR2VzFsL3NJb1lYUHNQR21RWFBC?=
 =?utf-8?B?ZDN4N0R4bEo2SVk1RDdMVVNSeVVQNllGY3RGSDRISGZmV091M054RVRIRkI1?=
 =?utf-8?B?NjIwdFdydE9Lc05Wa09acGI0SUxxVWVUS3JUSkFybGJPRDFQMUlFRXBwWTlo?=
 =?utf-8?B?dEpzR1VIOTRPNm9jV3pRWk1MdFF1azRaZFR1c3FvTCtiT1AwT3Q1T3UwL1ox?=
 =?utf-8?B?Y3pVR1AxQTk4M09sQjFYT2JzWGxadFptaGM0UWg1MTJkRTlLMGswSmFxTHBU?=
 =?utf-8?B?YTZLRndxMXROenh2NVZ4czE0QjZBbktpWW1KZ3dtdWhjb2lBMkRkdjdnVjN6?=
 =?utf-8?B?SXkycDZhb2RxS2VuYS83elM4YlRJdDVjbDZNazhmd3IwdjQ2OE9nWnQzSkFt?=
 =?utf-8?B?bnlFUi83aExaN2g2YVgzS2h4ZTNvWjVqTjZzbWd4YUs5SUlqTlIxTE5wb1lk?=
 =?utf-8?B?cE4wekNLcVJjL2FienJUU0RmaWJlLzdJQ3lpRXlJQ2ltY0ZRdWZsV2NJYXRq?=
 =?utf-8?B?MCtMMEtjRGRERkdoSkRkMU9MRzFRRGFwZTJWTUpyNGdNejJBdE12ODAvMW1M?=
 =?utf-8?B?bFRYMFZucWlTWW9YTFdGeUVzaUJuUS90dXUwNjBPclgySmczU1FVd0s3N01o?=
 =?utf-8?Q?GLavHMWQU4l2HslAGu6Ax1amJofD+lsMCp6+mrJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1lBZEgrTXdmYW1PY1ZFeHk4VTNxSVVhQlpIL0JHZ0xtUCt4L1B4K3lpZVpz?=
 =?utf-8?B?ajE5a3kxeFpSd2dyUVhpdmQvYVBKQStOdmx1bVJDdTlqRmhBa2Z2UTdLQkZj?=
 =?utf-8?B?MHlBd0hneEtxb3ovdExhclU2aVN3MHNwUXliZkM5cjdFUmVzTXllbnBoM2lG?=
 =?utf-8?B?c2YveHNmcXhvaVdVOFFZTThmMWNTQ3h2SHBjTnl0V25wQWhOaVpLZGJ3dWJw?=
 =?utf-8?B?bXBBc09EanAvejhXM1lTU0dtK2J5bUEzcnBYc1BQQ1BweFRVcUxqL1ZyWENC?=
 =?utf-8?B?MWdSS1FWS2RSZjd3eUFQRE1PTnZZVVVPTW5NSnBwMkFQYnhGTElRUGlvaE1L?=
 =?utf-8?B?Mm5teFQ3TmlnN1RlSFlqaFlONzlXMXpMQTJRUytnSzl5aC9RZFdpRWd2LzhT?=
 =?utf-8?B?ditUUy9ZMHoyZVRGd3l5QkYwUklZSG9GdXZNc2d6c1p3ZmFqbzVFRzkwRDZx?=
 =?utf-8?B?OG1VYVRXd3RMUzdId2lJdE4wYlNVMUpCdGlGSmRrR1VOYnAyTmgyaTlTYUNJ?=
 =?utf-8?B?eTEvNGFETlpPRG9iVVphQzFpT1RTdlJkTTUyTHRhYnAvYk93NnlYUFdua3Bt?=
 =?utf-8?B?MkIyUXRjSGE4YTlja2NJQWc4WUlSaUhUTzJwb1IxbkF0aUlIYklBSXRSQm1Z?=
 =?utf-8?B?RjFWTHdxRE1QTElBbmMxTzN6TlBuOTB0a1dHOEdKVGNONU5nR2FxaFNlLzVn?=
 =?utf-8?B?K0dmekxXQnlpOGFWR0MzazZMZkZrcVZvUXRneXp6TFRYaWZrOXhFTXRyNEZY?=
 =?utf-8?B?cTB1aU5sbjVhT3A0R1EwcnpiUXlISUJRVExDYTg3czdmaEYzdElvUjRHSjNS?=
 =?utf-8?B?YlpzNFRkSVJHNUkyQ1NLNDJndXFUclpPQ0lCdUMzdENBblhMcVJqNENLdEk3?=
 =?utf-8?B?RzBsczgrbVpaZEYvU0oxL2IxYVh5S2EzWnVMR3I3OXRSeVNweTR1MUgvZHRp?=
 =?utf-8?B?WXFLelBsSVl3UjlnbzdjUCtsMHkwVTdjeVRLcEFDTnJqODhKQ0dENFhwQmYx?=
 =?utf-8?B?cVltb1ZEemxuRmg2MGFFZTA5MTBMNUllaERTdW9xaklNNGRFaGljTEFQTllh?=
 =?utf-8?B?Vkp6RUZiSWdKU3pnNHdGNG1rMndrRk5ydnlOYTBESW41Smp4UGtpWERPMTMw?=
 =?utf-8?B?Yjl4UDZwUjRmQ0lMNy9QdUtVakNvYzZVbHM5WjJTVHpzdllCeExRKzgyZEg5?=
 =?utf-8?B?Q1pBa3RHZXU4UHNYMGU1Y2hKdzBDN0laaS83WTlxV2RIN0RKQ2tjbVlUTjVX?=
 =?utf-8?B?STVRaHJGclJRWitEZEcyWktzODFjQ0ZMRTVhRTBndTJjKzl0amRTdTI1eVhN?=
 =?utf-8?B?bkkxMndhUU93Q1dIUDBGaUVHTzhNblRzRTZZSmlLWkdmRm9ZM29vME5XVStL?=
 =?utf-8?B?aXNUUjRQT1hyaGw4SjA3Rk94enZDWEYvamlmb3BoN1RRRVhDRE8yM2FZcFN1?=
 =?utf-8?B?Y2xjR0pmMjZtQ1lzN0k2d05ZTVZld2YzYmhSU2dQQXZSakRmREczbmt3aE1v?=
 =?utf-8?B?Z2FyQnNLVWE3ME5EVy85M0h3ak1UQkNlbnlMR1lwS3RIeHdCNUZDZUlEdkhR?=
 =?utf-8?B?ZXlCeGxza1JEYW84WEVIYWo3SXdPNjVCSHFTdTl6VGhUYTlZb0RkeFVrOEZJ?=
 =?utf-8?B?RmdsT3FmdnEvYW5oMVk0SXJKbmZGa3NkR3hEU1hxcG9OcUh1MTBQa1pyOHZQ?=
 =?utf-8?B?c0V0MEM0OVR3RXgyaWR2d1FKK0RKK1MxYnlHWEdHaWFCNzEyam5FbHlpWUp5?=
 =?utf-8?B?QXdta0RrVXZjWExBMEh0dU9Rd01TdlJ1Zytkc1VJb2xWaFUzZDVOU21lZmo5?=
 =?utf-8?B?a2MzMjJsd1V5N0hCVE96bkNIY1E3dm9ueEZ4YXA1eTFCRjFtaFkrV1lJUDgw?=
 =?utf-8?B?bWZ4K3EyOEZOdDZUbEVBMHBIVXhRelZuNmJXbDBPTWdtUHRlR0s3L2lsaDlV?=
 =?utf-8?B?UVJUemRtbFh6K25hN1h3dXNUd3docWZsaU9wcExtSlpuajB0R2NPdTBmRTBM?=
 =?utf-8?B?Qjl1VENhempUZnFaSGExQU0weUgrcVhaaDlGUnRPRVhZNW8ybi9RbS90cGor?=
 =?utf-8?B?cEJlWTBFdHZKamhYZjVDajRVUUFSS2FGL1hRb2NzVCt4ZEkrRGd4Z01HbzBI?=
 =?utf-8?Q?vniVREKrwBNEDp5ptvUarV93O?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E33E5C419CCB545AB00CA471281D900@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IJJ6PDzjGWfawAYWoG1CS8FCjVlq3C0Z1kAl+fM4HIucJ4Rknn9VXPvumRt3Rdf9eRPp9PfcOwdunQNwVr0d5lmH2VsYQQUVDLaNwr8MYWbF0972CJQoW22DfJrvxSK3q/1CoT6U2N1WoIftLU6RyOqqxBfPQ7gXFLTndu5JF/lbnbZgYl1mxwAv826TFBAmHuQqU3cOwpbwTeHE17O3D94oBY/tpNAQW/XlW30ahlSYL8bSwjg+sW0aWPMHFsGSKqqXM02XKzRHwcVbQwSzV97/p2FL/T2fKkbSa9mNmUBsKmA1TB6hVcSuzEzOfUaDKPaCatIxMr5qF2RiD6WzAeDbV8RHG/exqKfyjd3qvEeRqOgbqYxytji8VFbo951HcN8IvZ/bzxhNfOWe1CLTpzkkGjMAH7QEXDXzJWY/Tm9rcKu/Ibq+NuHwtHxEGvlsRF874Ge+lQCOCVnX7NxDihpUDjUtSNS209WzRW0UWXx0UwaW4wevwYKuuqFRvKAxI2w6F0Tj7te75YkoI1fV9pRymm8c1PvGWlByxLI4CpVmy1vrtw/l2gGbVB3KrX4NZMZZmAkZJNqADr2CeWohJ7N982TdcYbgJHDG2iZxnbhsIjUUcjkHuQagrtRMApbgDOarMI+lneewn7DAk1wqeQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a644049c-9935-46a0-a08f-08dd09bfc48b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 00:02:19.7059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FuhPLM9c8ztPHB/xsyF4U0lDprKkmKnNzWnTs7eOn+zgi5rNhbHauJ3wlQ3xhaU+U5QDZgDzIV5Gn3AH3KzQaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5681
X-Proofpoint-GUID: OaPJS9Q3G_pi2_xKfTXbTPK2Uc89x4W5
X-Proofpoint-ORIG-GUID: OaPJS9Q3G_pi2_xKfTXbTPK2Uc89x4W5
X-Authority-Analysis: v=2.4 cv=X/0AK3Te c=1 sm=1 tr=0 ts=673e7895 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=ISvzprHUgfLDBR-PghsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 adultscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411200167

KytBbGFuDQoNCkhpLA0KDQpPbiBUaHUsIE5vdiAyMSwgMjAyNCwgTWljaGHFgiBQZWNpbyB3cm90
ZToNCj4gSGksDQo+IA0KPiBJIGhhdmUgYmVlbiB3b25kZXJpbmcgYWJvdXQgaXQgYWZ0ZXIgc2Vl
aW5nIGhvdyBpdCdzIGRvbmUgaW4geGhjaV9oY2QsDQo+IHdoaWNoIGxvb2tzIHdyb25nIHRvIG1l
Lg0KPiANCj4gVVNCIDIuMCBzcGVjIDUuNy41LzUuOC41IHN0YXRlcyB0aGF0IGhhbHQgY29uZGl0
aW9uIGR1ZSB0byBlaXRoZXIgU1RBTEwNCj4gaGFuZHNoYWtlIG9yICJ0cmFuc21pc3Npb24gZXJy
b3IiIHNob3VsZCBjYXVzZSBib3RoIHRoZSBkZXZpY2UgYW5kIGhvc3QNCj4gZW5kcG9pbnRzIHRv
IGJlIHJlc2V0LiBJIHByZXN1bWUgInRyYW5zbWlzc2lvbiBlcnJvciIgbWVhbnMgYW55IGVycm9y
DQo+IGRldGVjdGVkIGJ5IHRoZSBIQyB3aGljaCBjYXVzZXMgaXQgdG8gaGFsdCwgdmFyaW91cyBl
eGFtcGxlcyBleGlzdC4NCj4gDQo+IFVTQiAzLjAganVzdCByZWZlcnMgdG8gVVNCIDIuMC4NCj4g
DQo+IExpbnV4IGFwcGVhcnMgdG8gaWdub3JlIHRoaXMgcGFydCBhbmQgb25seSByZXNldCBvbiBT
VEFMTCBoYW5kc2hha2UsIGFzDQo+IGFkdmlzZWQgaW4gRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBp
L3VzYi9lcnJvci1jb2Rlcy5yc3QgYW5kIHByYWN0aWNlZA0KPiBieSBkcml2ZXJzIC0gdGhleSBk
b24ndCBzZWVtIHRvIGJvdGhlciB3aXRoIHVzYl9jbGVhcl9oYWx0KCkgb24gLUVQUk9UTy4NCj4g
VGhpcyB3b3VsZG4ndCBuZWNlc3NhcmlseSBiZSBiYWQgaW4gaXRzZWxmLCBidXQ6DQo+IA0KPiBP
biB0aGUgSENEIHNpZGUsIHhIQ0kgd2lsbDoNCj4gLSBnaXZlIGJhY2sgdGhlIGN1cnJlbnQgVVJC
IHdpdGggLUVQUk9UTy8tRVBJUEUgc3RhdHVzDQo+IC0gcmVzZXQgdGhlIGhvc3Qgc2lkZSBlbmRw
b2ludCwgY2xlYXJpbmcgaXRzIHRvZ2dsZSBzdGF0ZQ0KPiAtIHBvaW50IHRoZSBIQyBhdCB0aGUg
bmV4dCBVUkIgaWYgb25lIGV4aXN0DQo+IC0gcmVzdGFydCB0aGUgZW5kcG9pbnQgd2l0aG91dCB3
YWl0aW5nIGZvciBoY2QtPmVuZHBvaW50X3Jlc2V0KCkNCj4gLSBpZ25vcmUgb25lIHN1YnNlcXVl
bnQgY2FsbCB0byBoY2QtPmVuZHBvaW50X3Jlc2V0KCkNCj4gDQo+IEZvciBTVEFMTCwgSSB0aGlu
ayBpdCdzIGEgbGl0dGxlIGF3a3dhcmQsIGJ1dCBhY2NlcHRhYmxlLiBUaGUgdWx0aW1hdGUNCj4g
cmVzdWx0IGFwcGVhcnMgdG8gYmUgdGhhdCBhbGwgcGVuZGluZyBVUkJzIGFyZSBnaXZlbiBiYWNr
IHdpdGggLUVQSVBFDQo+IGFuZCB0aGluZ3Mgc3RhcnQgbW92aW5nIGFnYWluIGFmdGVyIHVzYl9j
bGVhcl9oYWx0KCkuDQo+IA0KPiBCdXQgaWYgdGhlIGRldmljZSBpc24ndCBzdGFsbGVkLCB0aGUg
bmV4dCBVUkIgbWF5IGV4ZWN1dGUgcmlnaHQgYXdheSBpZg0KPiB0aGUgZmFpbHVyZSB3YXMgdHJh
bnNpZW50LiBUaGlzIG1ha2VzIGl0IGltcG9zc2libGUgdG8gZW5zdXJlIGluLW9yZGVyDQo+IGRl
bGl2ZXJ5IG9uIGJ1bGsgT1VUIHBpcGVzLCBiZWNhdXNlIG9uZSBVUkIgaXMgc2tpcHBlZCBhbmQg
dGhlIGRyaXZlcg0KPiBoYXMgbm8gcmVsaWFibGUgd2F5IHRvIHJldHJ5IGl0IGJlZm9yZSBzb21l
IGxhdGVyIG9uZXMgbWF5IGdldCBleGVjdXRlZC4NCg0KVGhlIGNsYXNzIGRyaXZlciB3aWxsIGtu
b3cgb2YgdGhpcyBlcnJvciwgYW5kIHRoZSByZXRyeS9yZWNvdmVyeSBzaG91bGQNCmJlIGRvbmUg
YXQgdGhlIGNsYXNzIGRyaXZlciBiYXNlIG9uIHRoaXMgZXJyb3IgYW5kIG5vdCBmcm9tIHRoZSBI
Q0QuDQoNCj4gDQo+IFRoaXMgYmVoYXZpb3IgYWxzbyBjcmVhdGVzIGFuIG9wcG9ydHVuaXR5IGZv
ciB0b2dnbGUgbWlzbWF0Y2gsIGFuZCBhcw0KPiBmYXIgYXMgSSB1bmRlcnN0YW5kLCB0aGUgaGFy
ZHdhcmUgd2lsbCByZXNvbHZlIGl0IGJ5IHNpbGVudGx5IGRyb3BwaW5nDQo+IG9uZSBwYWNrZXQu
IEFub3RoZXIgY291bGQgYmUgZHJvcHBlZCBpZiB1c2JfY2xlYXJfaGFsdCgpIHdlcmUgY2FsbGVk
Lg0KPiANCj4gDQo+IEVpdGhlciBJJ20gbWlzc2luZyBzb21ldGhpbmcsIG9yIGl0IHNlZW1zIHF1
aXRlIGJyb2tlbj8NCj4gDQo+IEkgd29uZGVyIHdoYXQgb3RoZXIgSENEcyBhcmUgZG9pbmcgaW4g
dGhpcyBjYXNlLCBhbmQgd2hhdCdzIHRoZSBpZGVhDQo+IGJlaGluZCBpdCBhbGw/DQo+IA0KPiBS
ZWdhcmRzLA0KPiBNaWNoYWwNCj4gDQoNClRoaXMgbG9uZyBkaXNjdXNzaW9uIG1heSBiZSByZWxl
dmFudCB0byB5b3VyIHF1ZXJ5Og0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiL2Jh
MDY2NzlmLTkzZDItNGNiNC05MjE4LTllMjg4MDY1YmRmYkByb3dsYW5kLmhhcnZhcmQuZWR1LyN0
DQoNClRoZSBjb25jZW5zdXMgaXMgdGhhdCB0aGVzZSBlcnJvciByZWNvdmVyeSBzaG91bGQgYmUg
aGFuZGxlZCBieSB0aGUNCmNsYXNzIGRyaXZlcnMuIEhvdyB0aGV5IHNob3VsZCBiZSBoYW5kbGVk
IG1heSBiZSBkaWZmZXJlbnQgYmV0d2Vlbg0KZGlmZmVyZW50IE9TZXMuIElmIHlvdSBmb2xsb3cg
dGhlIHRocmVhZCBkaXNjdXNzaW9uLCBpdCBtYXkgbm90DQpuZWNlc3NhcmlseSBhIGdvb2QgaWRl
YSB0byB1c2UgdXNiX2NsZWFyX2hhbHQoKSB0byByZWNvdmVyLg0KDQpCUiwNClRoaW5o

