Return-Path: <linux-usb+bounces-11374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE6290BFE4
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 01:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CEAE1F224CE
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 23:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5335197A62;
	Mon, 17 Jun 2024 23:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="F+WEIt3a";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VgHgj+RG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NsSCW1zs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A79288BD
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 23:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718668015; cv=fail; b=htGg3UOFHl3KtvRfpBOUwgvm2SWQ33KDKlN1EfoeFqA93svnF1vqbg+Ou7mYzofUIqkSQJsTzNc9/xSHprFUFLeCsIgrbyeSaM5JSJH5zCsZvWNXbKu+tI2km+2D4qIOY4E1u5xnERVHq0jszNOdaCzbi4XCgppxDLECxs5+i+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718668015; c=relaxed/simple;
	bh=msdEAlwoHYAmNZa+81lZIkl2Mrytp+eWIbHgzyoYrz4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mTxhLNV5p/fYFNVgYs5E+IT6kVlGRoc6NFWvrDWVfo7Ec3IBrwQgy7rpJqS2vZO0rJTAS0mP0O+as+cJa3cEHlk35YbGJtSkep7pQe0izQoBXIw8k8QfEqLBvLL0K/cT5L/SE3pZ1qocln1WW6QaFDseduOlBa6uckr9nAFHKLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=F+WEIt3a; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VgHgj+RG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NsSCW1zs reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HHWuux003691;
	Mon, 17 Jun 2024 16:46:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=msdEAlwoHYAmNZa+81lZIkl2Mrytp+eWIbHgzyoYrz4=; b=
	F+WEIt3a8TpEYe/ErCAqlhu4WYvqVft3ReCFVbpDZPj0ksp72MPvYqbY1ASHp9Pg
	J748KJQhTLXQTQOWuSK++PfGb0dLPSARqr20V0WYqN3OmQ5zfdBKL6Ntgeir1iBk
	HFk0X6amIQeuLv1LsmCCFEfvFboX/pEWSwYguGHcYdj0WnghtzYzdlgE1rWOsoKs
	5Lx5xH3M4qM3E4jmpfraZUivhsM6Zn6CPlSUiQiAVpxN86mi1a6CCbti5pTnp+Su
	MtzDkqRAsHcB9spwwwmHPYFF7kRmVvNtRBO1rfHI8CnJAMWBODGYsB1JNQMOgpcA
	ibolNUzztMxNaH/osVyLHw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ys9vt8mh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 16:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1718668001; bh=msdEAlwoHYAmNZa+81lZIkl2Mrytp+eWIbHgzyoYrz4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VgHgj+RGhZ5xd903zmiICCy2Fv/m58VXU63F0zY2Gzlr/YnIFWfu5KBh76fGUlSL+
	 UEWHTgaWkaYUkwPH1bjPPzDqAk0VoXdbsieIStOKGjfVbo8ZpDY6qhwWH0MRvWZ7qB
	 T208AtVqYNYMLxD/LGrDeuo30q3NrlcnEMlLveLREQIT1RoIBPqYc8LxSToi7aT06h
	 UDA/vlQzjO3kYgbTc5YpRF8yRyOA/r5oeQyo5YkqZLX1BkGH6Py+bq4FntCwk4PK5N
	 jE4cs8+oZGZKK7T0Enik5gfwumPC3iCOleJH3/evMQ4C5HK2Spmz9BvJVKoBOZe9Jr
	 wW1wDLvCe50xA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 17C3F40353;
	Mon, 17 Jun 2024 23:46:40 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8198FA0070;
	Mon, 17 Jun 2024 23:46:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NsSCW1zs;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9D8DA40363;
	Mon, 17 Jun 2024 23:46:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQpkz2MZCxDt/A6O+SGPyp6SifVr1oy3QBW5OxHkKQF+btkIt4VkXatPbPSDy5VlDXGa/qeXnOFOKTFq2jmwh+wTlNwU4O03VE/HEfhRrVKXPLfQezvoaBltheM1vdoYiJXUs8ffEdq837t7UaFMfLhuswfqcbAkcTsrcpOzKEBgACUidEXZmB4N+MpXFI9UmLvoThQeBiS8DFEtJ5FoKEuB9OJc67m4YQkzz33vV+tO0OscvgV3tzj+mFy789NbGVkyMlpxDRatNPqnZTgYae6Ut4uvJ7wfyiGQ6CFr/FpxaudVaeBZ0Szuwd4pecqcxwiDNeG6neW2gSCOPThUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msdEAlwoHYAmNZa+81lZIkl2Mrytp+eWIbHgzyoYrz4=;
 b=R/ALtyPrGiob+r1IWlei9yTmVw4rI3m85gU7qfCktBBYforKngbTSTN1Ai3q65wCYDwpskgYTaclua/+Ax5EH90Vrpk8PTVkOAqQEiEwdyGpR+TH9s7CaootMe/cdI4HTMra2mbxhqHulfddlh7+zwugOQJGNCUKekx4/sxhMYkh9BDFZCRfbM0sz7EcO3oSZ3sn3gyxVCSQV0TQ1/E0g0vb+L+thkuwAxTmAnsscLa/tE2TqUzMAOC5jg0j6KP0HlSPiNnMwhT7jS7zcGmT4507ljGFWdf7P+NHqIKu+/Ux1yzRAsKXSGBFmSCuTzrCtyISj1huyx6gUxAIXzcEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msdEAlwoHYAmNZa+81lZIkl2Mrytp+eWIbHgzyoYrz4=;
 b=NsSCW1zsKeiJ4Mf7o+9FnFsPBGQZ5l/4H9BkqVqiff7F60kRa6FtjjGsgLm1CgbLSjjAUtYjcRhz/EMOajg5gWi/AWPTPfVY3yDKKraDiT9aKrQGbtqYq/qkGJsLJmDJ2BuxmNE+EC88Bn5qLnhz/tvLDC8f7lt8HScTgaPJjDY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CYYPR12MB8939.namprd12.prod.outlook.com (2603:10b6:930:b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Mon, 17 Jun
 2024 23:46:35 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 23:46:34 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Topic: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Index: 
 AQHatbfXThCMnoxt4kuSB1VpY3Td2rG2ym4AgABJugCAASgMAIABAuCAgACmR4CAAPbwAIAAVn2AgACkcgCAARl9gIAFTzcAgAKm3ACAAIuQgIAHQ1YA
Date: Mon, 17 Jun 2024 23:46:34 +0000
Message-ID: <20240617234624.bitqpa3brkgil6tj@synopsys.com>
References: <20240604230624.dk3pssivd7g3qb7p@synopsys.com>
 <023d03d8-ef52-41e5-be9b-d75be49c615c@topic.nl>
 <20240606002805.bziyz3y4bcysdysv@synopsys.com>
 <d4322992-8aa4-4eb7-b7f6-63b1b706ad7a@topic.nl>
 <20240606202127.6gdk6v3jevrmoyzk@synopsys.com>
 <a630f365-7a7b-46e9-b5a4-9b150f31d74f@topic.nl>
 <20240607225731.2d24p4as4x7mrfaf@synopsys.com>
 <9eb64562-cbaf-4abb-95d8-5792d46bd63d@topic.nl>
 <20240613003204.beip3nbdl7h6zvsq@synopsys.com>
 <2e64b7a2-8d36-4bd4-8c53-2207c8a011f2@topic.nl>
In-Reply-To: <2e64b7a2-8d36-4bd4-8c53-2207c8a011f2@topic.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CYYPR12MB8939:EE_
x-ms-office365-filtering-correlation-id: 57f004a3-97a2-461c-1ea4-08dc8f27b8e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|366013|1800799021|38070700015;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TCtUWVVMKzNRK0FicmJ4TzZ4Mk1aZmlWWk4yWUpVQThIUG9jVUVUWTNyOU80?=
 =?utf-8?B?a3poMnBtcnk4QmNHMllUb1pVMlczblFQWmVUdWZ5dFYzQzZZa1V6aVZVMldX?=
 =?utf-8?B?VUFNTnBtQ1ZYa3UzYXdFczJ3R29VUGNmczNGNHkzUktlYjNiQU9WZEZIUmx2?=
 =?utf-8?B?aHRuTVl1UGhWVnJQY3BlV2ZLMWphUDBaR1R3aWJ0eml0U3lURHU0Wi9nSzQy?=
 =?utf-8?B?c082alRrYmlWL25QaFUySm9qTEtkTGgweEprZG1CSkFhSU1ZUWpveE90SHEz?=
 =?utf-8?B?Z0ZYdVFtblF1eFY0U29OS0hEVm9ab0dzdGtzMW4xS1l3Tjh1YUtBeUxzNS85?=
 =?utf-8?B?Zk0xSFZHV1JHWDJVNUN5bzlZVndacTd5K09yNFJZUFFkSHhXZDQ3L2pqaDdp?=
 =?utf-8?B?T0JvbzBGRGRNWTA1OEMrQktYUHNVeE5NWS9rcmZ4cHdEU3ByczQ5QkdlVW1M?=
 =?utf-8?B?TFZ5SFpSYTNob09XU0ZCQk5nU0hmS0RUakF5Z005V1UyR2tza0Ryb1RGeERO?=
 =?utf-8?B?YXgxRXpaM3NYZTlGc3RyVXRvTllnYmxvVUU2aFo2R052d0J3Rnc2ZHVxaExF?=
 =?utf-8?B?QjFtYWxhK3pUNFh0TnREejd5VkMzUWlBakwyRG1NcXcyWWRUalNQb0lMME9p?=
 =?utf-8?B?cGk5ckJYWVd1MDVoN093MkQzTnd6Zng5RVdDYkE0U3Q2T1dldXU2eFBFUjIy?=
 =?utf-8?B?N01CNHFqOEZTd1FnTjh5SWFGUUJtTGtwSHNEUVQxUFFTaUJ4UUtURTRRSGll?=
 =?utf-8?B?S2EyWlQyeXhpT3lER2I0NXEwN0hJaGdFdDNSbVdvMEF6LzU5U2Nnd0JBWFc5?=
 =?utf-8?B?T0svKzFYSjBDQldVVnFiNTR5WU5OMGNpb3c0U1pxVEhmSXVWcUloVTljQjNL?=
 =?utf-8?B?OURoVGt2MVhNQmlyYUNuOHU1dTNtQlJhK1ZRZHhDaG9iVm9rOXl3cFN0RzdX?=
 =?utf-8?B?RjF4OUVLZlEycTJndm0zYStuTGlhV0F1NjQ0eWJMZXN6bGtPTzl0cGxvRDVn?=
 =?utf-8?B?OTFjTTJBakE3VC9saUxoUkxLb3V4OGNHQU5ueU9EUWNZc2NMWXdVUUIwVlEz?=
 =?utf-8?B?ZTFFaG9tZzQwdVdzTFBIYzNIMCtTRVRxNWlWMUU0K1M4dGxnR2dSamhySVZ6?=
 =?utf-8?B?ZVVzVkRqcExTWHRwSnNYVm8rVk1IdmtWUnN2NDh0NlFqNmJoVndmV2hUdTlp?=
 =?utf-8?B?TlgxdkdIalN2SjBCSUxuZTlEczhlckhJWW5QL0dZYkswRHdVRnBzOWJ6YWkx?=
 =?utf-8?B?MmdGclJuQTJrMXR6YWhHZk9ycVF6dmtsdVRjanljRzRwZENoMnRYK2ZvUjZq?=
 =?utf-8?B?TkxiR1U1STdqTlJZdFg1TXNtcGFDdzBQcG90MVdSRURSV0FZOXBiYXY4dkMx?=
 =?utf-8?B?YmhGK1ptdTJPbHdka2pJY1NsWC9haEJPV3ZDbnphRzlKZjJFV05GRVBZL08r?=
 =?utf-8?B?c3dWRWorNUZnTm1td082Q2NVVlpuY1dvaWRVTHRKb2J3cUJHUUFieEN6NGph?=
 =?utf-8?B?Y2lxUzVhQjVMWm85M3BsZ09vY0F2RkV5R2dRVDliTHNuZkpETkhLRWw0T3p0?=
 =?utf-8?B?aEd4aFhISHgzQUZzRVVpU0tDSXVZOVhEK3pGNSs1bG4wZ09LUUswRktKQW51?=
 =?utf-8?B?QVc1V2NuY0NydGpxM1NpRXRCeFBDWHFBTnNZaDFwRUkyUWlaT0tUMEI4WGZT?=
 =?utf-8?B?amM4ZERBS0NCemNCa0N6MnlaanlmWWRPalM1eUo1QzA5eHJZN1Bjb1ljZnZj?=
 =?utf-8?B?ZjErYWNvbXppYzZPRHNFRzNMZ3NVR0tvM0g0WHhWWEEvd0lpV2luOHlkQll6?=
 =?utf-8?Q?XF8fq6Row2mH+Ew2EUN19SZYn/wi/fSWehjrc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SkhIeVJNR1FVeGNscFh0UEpHR2tPOVExTzQ5UHNrT0h4aDMySlpjN3VseHBK?=
 =?utf-8?B?SnlTbnVzR043NUg4L1VEblV3VGJBN2QyYlBIL3BlM3lxaCtwNHF2aUFYd0M0?=
 =?utf-8?B?aGdXbW5UOWhrYi9IbHMzanZlcHpidWNPQzBqUFpyRnB5QjVlekxqMkFCTTlP?=
 =?utf-8?B?b29US3FDakI5Wk52M0U1WVJsU0hoZmVkN21mV01TaEdXWnc3dzZmRHVRMjdM?=
 =?utf-8?B?UFhsMUpHeUFQT3lQdFAzNTd1K0pZWUtRR0dqOGJSTmdhdWpxaTFKVENWaWxY?=
 =?utf-8?B?eVBFYUg4WExGcHhqM25nZW9HQ0ZUdjBoUTJSVE9Sa1lWazRudzlkTVM2R2po?=
 =?utf-8?B?RVNKcW9TaHNUNGRUeUhuY0dOZnRyY3NEWkM2SURoS0JNZ2ZJVUV4ZVJiNlJC?=
 =?utf-8?B?UlBTUDRvb3NKUmlkbjg5VklhSWxFSGx2NWpZRk9zQXRwR1J6ZXFyVDNXeTJp?=
 =?utf-8?B?SUVPaGZRSS9sSWprQjBnbjZOV1RURlZKTVF4SnkrQXB0Rk95bXZRdnNNeitN?=
 =?utf-8?B?WEJ3cXRMNTFIN0Nzdkdrby9MdVpiT0ZIek50bkNEZWdOT0NlQTJqMDNWTmFW?=
 =?utf-8?B?dWREeWhaMzI1SWpDcXpuTHAybWNBLy9VMW5jaTBjaVBpcG56NjNvZ3JhR1pQ?=
 =?utf-8?B?QlExT21FZzlPT1VCKzdRSk9jWmNqaUExNHBoY2RBL3BzdU5PeGtDTHJXQmM2?=
 =?utf-8?B?YllGamRoc2dkWHFYSXhmcXRCN0FLMDVlRnE4TTFXZks2OGZ1U280VjYwdkJZ?=
 =?utf-8?B?emxNWkZLbHhUcHZ6YzJRbk5JdTBZVlRMQ1k0SHc1b3R5ZFJZbmVHVERiMFNI?=
 =?utf-8?B?YTVrcjBnT1BwbjN3dnJ0Q2pLWjlZSnU4THFmc0RkaHZDUmxKZUxxOVVqV0Fy?=
 =?utf-8?B?QjRPcHcvUmJHeG1Sa3JkdHdXQkZhcGVaVmNEbjJHcU4zN25QakY2VEp1MWN0?=
 =?utf-8?B?bWlRZG1MSUZtSkMwWGNxanE2NDVzZEZDRjlQM3kzK1VpbnRib2dyQ2p0ZlFY?=
 =?utf-8?B?Z2M2elBzY1NEcHZUVUg0Z1lCNVhENlJDaU9Od2xNVVFxV01rR3VTNDRYUk01?=
 =?utf-8?B?QXZUV0Y5YStOM2oyL25GM0s3SzM4WGhWUUI2OTh2MGcrekowQzFFRGpIeE9t?=
 =?utf-8?B?aVhuSjF0M3pYT29BSVQxRVIzaisrV0xGdk5jL28zSzJKZHRQY25yNXJ0RDJ2?=
 =?utf-8?B?dVc4RnBLUG9yV0lFeDJsOUtnNlVOV290S2lRai9YSm1ReGwyN2Q3Z1NqVGVK?=
 =?utf-8?B?YU1MZDRad09LOTcxdWdFQlNaeTJBU0huKytUUWxMTGU3YXFLYXZaNEpmK1Yr?=
 =?utf-8?B?VFVUUzJaL2FaTXhwRFFlcGt5VDBubUJDajFjVWl3b2xQUTAzYWJveVNvcVNX?=
 =?utf-8?B?bWw4ZWY4dG82QXM3NENWY3JBc2FBU3p1a1pHQXZacVh3RTBoL0thaEg4Y1Qr?=
 =?utf-8?B?T2ZVUUlwb1F2blF3ZU4xSWVzd3pGM2pSTWM5cC8vMFJMTmhyMkFYcTJtT0ZV?=
 =?utf-8?B?TFpXS0tDUmRZdjdGWU52ZHZIY1RXaHpkRkFaMjJKYU02RjRWYktBR2E5UXBW?=
 =?utf-8?B?R1dxRENjaTVHcm1ZdmdHbTBXaURMTjhSNEszVzNXOTRBNXc2L3RMaysvbWJ0?=
 =?utf-8?B?dVdwVGNFMzE3ajJMY1lEQnoxaytrTmYvSStNR2NKR0pZcjBvelJXTVhNWnhy?=
 =?utf-8?B?YVovYSswUFhkM2d3M1lNS1E2ejhSUW5hRE9tTnN3LzZvakhuMzVWbllkbU05?=
 =?utf-8?B?L3JyUDBJOThkY2JkZHMyZU5WRHRoMDMwNUJWNXpYOXNCc1UwU2dIM0gwbTho?=
 =?utf-8?B?MTZpMUFMNURLdzNjZU9yZ1BLNTEzSUxHM1Z5cGRnVWJKcmUrUGFka2JtRFl1?=
 =?utf-8?B?Q1NrQnN2Zm1WenpoZzF1NUxseEg4ZWhHdnExVFZwYzlFNjN4QzBFd1krbm9J?=
 =?utf-8?B?emZzaTE1eHg2QzJsQk8vYWRodHZvbFFpbEJBVjhOZE9JWlJKMmVvb2lORitJ?=
 =?utf-8?B?NWlBM1Q4bU42L2MrVlhSZi82S2tVZkVmek94QUpqZTZVRmZadm5veStjK01t?=
 =?utf-8?B?U2VyNzFETngrV3ZvVEJ4bFdONDNCMmVTdDJ6NE5YNGVkNTJNckgxemRVK08y?=
 =?utf-8?Q?vfFOuQ3rgVBP4KP2oRLE5vaYa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F7B1319B158444D80D3E94C503546C0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	F1D5NzwuGoBwycm7tWYxaBnsGOTzOTR5czh0ZCdxo5nDzxjnOFvMdfqmDUKR21L9kYqHAt5xboYA1HN8jPKD08J00Db5YVjKlrNxYOCf/eaOoBqE8vf2BOZkGMIztY9qmwRP4f4kwsHM+tH6FEcisl4VcGBxNgx40Vi2QfCcXJJ1t0YF2JrxInAvglTAjfrZ0Kb5SFbBjg15W8vKnLypPIUAAWrnNU8yLeAzNXn9Ww0c9WFVj1P00L8Po05n0LU0Iwaexz5XHFJT3RKbv0ZXs4hUF0GzFrvTgEqnOngg/vSILPZ9elqkDSfHe9GlX5mzZdnk//Pp5ellTLPy25OQY8c9bq/dkj5aqo75rv/ecIUv7yhiHtWi37odzqQWRN86zvY4KLbx5ZIqnGG1+E1AxegrcCqLdCWHA92ZTSX/3Pbs6OpVXr8HvHuxFXSpJx5GOukcgxORBcZAel3RBWxGnpQXBL7OshXmVck19+upz/S2LOW3cpNk67pD7WgXyRpJxP2/jkxzx/bHIRhIke/uzqv8NZv5mKkgXiZPiv0ly2wTiLCLYGeGUhTrLERdeISfMAbIsmvWCDwGPtrlbokxKpB9HYDf3v1Xlm+mHvUdJhi55TRLXLicElsMQ0RhGVy2klUQnsrf6FkHFRI2VpK8pw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f004a3-97a2-461c-1ea4-08dc8f27b8e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 23:46:34.7491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FPq7C426LXLtZPQ7n2SGMOKU2Ihest7ZcKgyK9YUYDVnSQuEddOeCnnEicFzcyfyi2DrTUfmQWInu32d7DQ5Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8939
X-Proofpoint-GUID: f22WsboMpNMY9pYDnBNAOJ3B4fl-GOE1
X-Proofpoint-ORIG-GUID: f22WsboMpNMY9pYDnBNAOJ3B4fl-GOE1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 adultscore=0 mlxlogscore=697 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406170183

T24gVGh1LCBKdW4gMTMsIDIwMjQsIE1pa2UgTG9vaWptYW5zIHdyb3RlOg0KPiA+IA0KPiA+IFdh
aXQsIEkgdGhvdWdodCB0aGUgaG9zdCBpbml0aWF0ZWQgdGhlIHVzYiBzdXNwZW5kLiBEaWQgeW91
IHRyaWdnZXIgdXNiDQo+ID4gc3VzcGVuZCBieSBwdXR0aW5nIHRoZSBob3N0IGluIHN1c3BlbmQ/
IE9yIGRvZXMgdGhlIHN1c3BlbmQgZXZlbnQgb25seQ0KPiA+IGNvbWUgd2hlbiB5b3UgcGVyZm9y
bSBhIGRpc2Nvbm5lY3Q/DQo+IA0KPiBBbGwgSSBkbyBpcyB1bnBsdWcgdGhlIGNhYmxlLiBUaGUg
aG9zdCAoUEMgcnVubmluZyBVYnVudHUgMjIpIGRvZXNuJ3QgZWplY3QNCj4gb3Igc3VzcGVuZCBv
ciBhbnl0aGluZyBsaWtlIHRoYXQuDQo+IA0KDQpUaGlzIGlzIGEgdmVyeSB0eXBpY2FsIGNvbm5l
Y3QvZGlzY29ubmVjdCBmbG93LiBJJ20gc3VycHJpc2VkIHRoYXQgaXQncw0Kbm90IGNhdWdodCBv
biB5b3VyIHBsYXRmb3JtIGJlZm9yZS4gV2hhdCdzIHRoZSBjb21wYXRpYmxlIHN0cmluZyBmb3IN
CnlvdXIgcGxhdGZvcm0/DQoNCj4gDQo+ID4gDQo+ID4gQ2FuIHlvdSBjb25maXJtIGlmIHRoZSBz
dXNwZW5kIGV2ZW50IHdhcyB0aGVyZSBiZWZvcmUgeW91IGRpc2Nvbm5lY3QgdGhlDQo+ID4gZGV2
aWNlPw0KPiANCj4gRGlzY29ubmVjdGluZyB0aGUgY2FibGUgaXMgd2hhdCBsZWFkcyB0byB0aGUg
InN1c3BlbmQiIGV2ZW50Lg0KPiANCg0KQ2FuIHlvdSB0cnkgdGhpczoNCg0KSXQncyBhIHNpbXBs
ZSB3b3JrYXJvdW5kLCBidXQgbWF5IG5vdCBjYXRjaCB0aGUgaXNzdWUgd2hpbGUgb3BlcmF0aW5n
IGluDQpGdWxsc3BlZWQuDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5j
IGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KaW5kZXggODlmYzY5MGZkZjM0Li44OTRjYTEw
NDQyODEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQorKysgYi9kcml2
ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQpAQCAtNDMzOSw2ICs0MzM5LDE4IEBAIHN0YXRpYyB2b2lk
IGR3YzNfZ2FkZ2V0X3N1c3BlbmRfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsDQogew0KIAll
bnVtIGR3YzNfbGlua19zdGF0ZSBuZXh0ID0gZXZ0aW5mbyAmIERXQzNfTElOS19TVEFURV9NQVNL
Ow0KIA0KKwlpZiAobmV4dCA9PSBEV0MzX0xJTktfU1RBVEVfVTMpIHsNCisJCXU4IHNwZWVkOw0K
KwkJdTMyIHJlZzsNCisNCisJCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0RTVFMp
Ow0KKwkJc3BlZWQgPSByZWcgJiBEV0MzX0RTVFNfQ09OTkVDVFNQRDsNCisJCWlmIChkd2MtPnNw
ZWVkICE9IHNwZWVkKSB7DQorCQkJZHdjM19nYWRnZXRfZGlzY29ubmVjdF9pbnRlcnJ1cHQoZHdj
KTsNCisJCQlyZXR1cm47DQorCQl9DQorCX0NCisNCiAJaWYgKCFkd2MtPnN1c3BlbmRlZCAmJiBu
ZXh0ID09IERXQzNfTElOS19TVEFURV9VMykgew0KIAkJZHdjLT5zdXNwZW5kZWQgPSB0cnVlOw0K
IAkJZHdjM19zdXNwZW5kX2dhZGdldChkd2MpOw0KDQoNCk90aGVyd2lzZSwgdGhlcmUncyBubyBv
dGhlciBTVyB3b3JrYXJvdW5kIHRoYXQgSSBjYW4gdGhpbmsgb2YuDQoNCkJSLA0KVGhpbmg=

