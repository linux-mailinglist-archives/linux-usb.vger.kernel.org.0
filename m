Return-Path: <linux-usb+bounces-35081-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFUDMW4yu2mEggIAu9opvQ
	(envelope-from <linux-usb+bounces-35081-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 00:17:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAA42C3C69
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 00:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16EF230488CD
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 23:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9F221018A;
	Wed, 18 Mar 2026 23:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ktvNFqZE";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PeDM7q9D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="U6ILKPTp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906D54315F;
	Wed, 18 Mar 2026 23:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773875816; cv=fail; b=NPHD/R2pePv/r12Zl5M3FZzg2Z7DCB4lmbbKuz45T1Wp8GMeZb+Bul1I593jdxca8E71Ny67pzg9ioJbDgwLy5NN1OfrFTyBuCPvRA+Tgpx+/+phQmTU0tKfAw8oh/VtNxpZQv42ViuRDnmPNpSOp2oZKLofFp//HEEB2VlUblQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773875816; c=relaxed/simple;
	bh=OfbuvaB52mu2bw5l1ejCqE6vKyb54eWtUCmUBwo8EB0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h/jARQwYaaFv3bbDIlD9tk8afcMfQ/gUmj9a8gvu9XNLiyuXESd9HaKIiiCB26ch1BeDxJLTduYcFJEuGWkFNZz1WAtZ+0tfkSm2h5ClY2rk+AppKbdd3GZ8+UJEaeau/p9iQbjWwQSLByqKyphnJQe5/5zC2SoqxNeQOgpaHvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ktvNFqZE; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PeDM7q9D; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=U6ILKPTp reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IMYBcE2361912;
	Wed, 18 Mar 2026 16:15:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=OfbuvaB52mu2bw5l1ejCqE6vKyb54eWtUCmUBwo8EB0=; b=
	ktvNFqZEy2NNl3DzdiQeFb4ObiY6MIDQLxcfGqINx52UoIHP4wcGvbicUnddZkp0
	DOFSEMK80EpraRoXKdTLEdxVz/pTDnTdeeBluw777QHo0WjHdNxEm+ystAgITRYz
	2yOVQcywxCH4D9fSIupGGa2QfWvGh9mJDtYspdUnDdl/52gY0RkVEjfoYivcVmb/
	dRYJEN1PqHGM2AHudANN0W7jMLO3ARf/UyVfumQtXhrY25hBe6OwkGv4jEMP3vkK
	1WTymbgLSo7M7+rZNtr6shyyvSLk2O2P8hvfAtKtosDg9A6TS1u1G3fRrfPJwz6P
	v1hJVdbE0SUpgP79nfjKcg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cyt80na27-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Mar 2026 16:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773875755; bh=OfbuvaB52mu2bw5l1ejCqE6vKyb54eWtUCmUBwo8EB0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=PeDM7q9DNHwzwtN4viKutql34aK13r0+ElGSNCVJ0Mao/UcK8hp0m8tnole/NUEs/
	 MHm0URglNlk3rHLBQT38ekYOQHAhDzlnxDWl/vSizKDzTADsGrEJBJF33J3yUBVxt4
	 oO14362V6gMS0XPHlYFbDLlSj424ak8JXf5O1UCjQHJJcO/bhIOvUBXWJ4VYMkUSh9
	 o50gRtVQZQ/o7zLDP5AJBbIB05hGi5e4J4FfNs9QXHFy5pYaJnabah6AEf4QZypk6g
	 XNK9GOj0A+Z16qiRVU7ZhT4LuGdzValPYmCWBzjZICbC5huc8WoaeOonaV6h+auyMk
	 fakejdqP9E0+w==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 550A640143;
	Wed, 18 Mar 2026 23:15:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5E3A0A0079;
	Wed, 18 Mar 2026 23:15:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=U6ILKPTp;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00103.outbound.protection.outlook.com [40.93.1.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C9C47404D6;
	Wed, 18 Mar 2026 23:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpqTaxftenbMlNx66P1hkFCDJ7O/yxMqiB1kUBoaskj1QpDQM0FMCozyz/Qw8IGBqDmUg891uE0eVGqnNeTw+4xCTT9PS/WeD54eVCfKP1f0FteCmbAZbOXSrF/cpnRHAej6+viFGuLbKwx+WXPZMx3tnZGR1kPDrBUWCK1HOo8XYzwXRugscP9pydNlWaYL/OUnBsTK3L0WeIy+MhrgGJXaitsushag1160kTYY57d33aoXctymw2De/KX8ngYBtr5+K4ui8ihNBK+ElazKgqe0iOuq8eVtMvzSJ/c2rRdZkSoMoGqa16U25qIf1QJIzr3e5UwQ0zokP2a8WkZIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfbuvaB52mu2bw5l1ejCqE6vKyb54eWtUCmUBwo8EB0=;
 b=RJvfMDxfj21pqjpOeCYxjjA7Eja9kVrhn8y7LgUxJoEZBgM7RHTvPxRRbLxHPge5Rl0+EthFqWxpjF1DB6uN1ypMMpgmcS4iuAsjvCQR5qfzpZLkcVHiHEyTcu/D1OEGJOB+Dma13BceKNGFD4DQI5eS7c8HHyvP2e3CGBi9Nl8KRAN86SXNcuPxPz9MKSnAINiMSVSjrVUm4BITLkdW+eBd9o1BTHUPCx1WrA6APgXsv8I5Lgnb3m1oWg5KDwW3fScMAcJpiRVKHNHRaxzJ9ov4uPOOBQmxlEwHKFqUF65QQ9PvbVvnDRjpz+28Pa7xZVEf1bWYiX9VK4Sh4MoMwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfbuvaB52mu2bw5l1ejCqE6vKyb54eWtUCmUBwo8EB0=;
 b=U6ILKPTpWQH/t2jWGO6dFn4cciCLtUZHREWVIUCUy3ChsmB+mFV3hN3KmtyaKF0P0Deh4f2KO+mUNZ1rIay1IGM4iPoCzQHHU+UApWbCIfRg21Iuo8wmpSGJbUCDBZiPXy1ZHxPFvygMMp3sToTD8NNr6tE2hQYHUXV/+WS2KHg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH1PR12MB9622.namprd12.prod.outlook.com (2603:10b6:610:2b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.12; Wed, 18 Mar
 2026 23:15:44 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 23:15:44 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "dlan@kernel.org" <dlan@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "huang.ze@linux.dev" <huang.ze@linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
Thread-Topic: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
Thread-Index: AQHctRr0ppGnJPsRE0yK8zk2BTHieLWzcneAgABkoACAARj7AA==
Date: Wed, 18 Mar 2026 23:15:44 +0000
Message-ID: <20260318231542.mmbcrqy36oyw44xc@synopsys.com>
References: <20260318002953.6gknb2jfveqyisop@synopsys.com>
 <20260318063002.3743362-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260318063002.3743362-1-amadeus@jmu.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH1PR12MB9622:EE_
x-ms-office365-filtering-correlation-id: b28ec070-65e7-4374-49ba-08de85444802
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 cMNKpf8c52Y1clzrRwtoWrk9FzXkVKkPbKWdJNo21LckFKjPakd1R6cFbOA8B5uu/lunHhmTVWkGot5kRCzGIspjNj9j3kAsiCYWogpaJ1dw8empgMb2jgVFQR63SFsSDJ50dy/9bCU4MJaGCwTJd7H91HyBarFanjbIBhhanR4OFsrinNEeNqNFSq2KxiF0B+5HA5or8Q0AvjlUMP4RJlEh4kJx1fdo1fUhZ1aTH8Gdsv84axtMA7rL9rEhw2Z07kZ0rZhQl0z3U3CTMLnmbK3Fvjw4rcM3jjDOdJ/JcKk23MuCp5ITEtNKjH4yX0Iiuj4ihqKW9oYNlCYO0ddEHi57oSKy3taLLx4F4t0M7AF0t7d0dKlAkqeWReN9shPlkibeXBo57Bw1GtzBiP7XBjwPuxNUwxxuRbKCcNhBie6TJUsH6+eHAu8UoAAwrCgl+84UE1W0oiSTL1pI8Ug2z1HJhwtjaz4mhP93PJLU5+AFPXe74+g05So/lp87AJQOw+4Nd912BRstIaCI5cYBMpj0y1lGHzBIN1p6S/CFwP9Nn34ub05a3NE9E55p3xLvspAfyrhnYM+xlpHAIV8iEEbv/LfDWv4N+B+4cVnk+oqPmGLewZPJwYzmQ+GrgsH6f3aGGUV2M2A+2JFoU/XpPlGIObezsKSEDWFQWdFl7AnooXz8r+hZkqfbBNJoPDafBmfaxnqpNrvWK0GIrgtfbU/3j9yPiYoQ4xP67PK8nZ6alsEYpoC3nyO4FOfjnysz3P+c3UTCN/oFFAsIE3usiheC8hu2rMNvxSlF0aQzrV0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2w4YXJSQWUvUjI1NWFYLzlibExoUU5WQlpIekQzcUVsT0RFc29vZXRwV1pW?=
 =?utf-8?B?MG80ZXVkbWVpR0c5R0VNWTdwSjQreHp4cVNMYmwwREhVNDJBTy9taVN2NGho?=
 =?utf-8?B?SStWWkdmQVlmQVE0THduQTd2Z1pxZmNyUkNFeGlzYWoyMno5aGxOdXpHekYv?=
 =?utf-8?B?S09UaHVHYTVtSElyaXJjVEs0Q1lkOUdaNi93cE1ESmFpTEk4dlo0aFpsRkVD?=
 =?utf-8?B?c0xWWXRLZ21WWis3cThqR1hFTkFGSExXMllkSEZvTXorcnNXbkVPbWt5M1RY?=
 =?utf-8?B?bkptU2xqTngxbU5aZUxjcFE2T0o0QVEzSFRsMFJ0WDhJQzRBb3poVnRvMzZj?=
 =?utf-8?B?eHp3NytCbEIwVGlEWDVDRlgyTFlHNXozOGhjdWRnV2VVbHZtT2lYakM2L0lP?=
 =?utf-8?B?MlBjSnlKUDFlemtZZVc2WjFvK2U0b1k0Q3hjRTk5bWU2MGo4aFIza1gzWjBR?=
 =?utf-8?B?bUFMUTNDdlZyTHc1ZUlYeXU5QjFTMUl6QWlGaU1DalZrYVh0WWVqK2VzaXdH?=
 =?utf-8?B?R0FKS09FeUlyclJaUFJaR3VTcnZxdFU3MTE1WnhOcFJpRTFWcmtuV0plb3Bs?=
 =?utf-8?B?dUJTNS9uaWFoNlJPUG4rSEN6QVRGZ0NyK2lwUi9vdnk1TTJEUmxFcFBLRlph?=
 =?utf-8?B?WnBadlBTRlJnQjkzcGQ2SlhuTm9DZHhhK0NUbWxqZWhTUEg5VXZJVHErZUtq?=
 =?utf-8?B?YVlVbXJCTDRpQWxkbThXYjRpOUFrUHNFeTJ6blhvNFNEb1Z2ek1FSkd2Z1dl?=
 =?utf-8?B?VkVRRzhvMlpkZTY3RG5uTGl5U0xGR1BvNzY4aVBXbzJaWjRFQ1kwT01KVmhW?=
 =?utf-8?B?MEVXZ2J0T0UxRk52Wm1XMWx2VDY5NVdoVWIxelVyemY1b29YYnlwV2YvcjBE?=
 =?utf-8?B?VVgzRVMxdzlWOVdGREx1NXZBWXFlMjFXaUpaZXA4TFhlV3Fsdjl6OXlnSEU3?=
 =?utf-8?B?ZVBIZmdENzE3R0RSU3BBN25DcExUd3pBaG4zeDllNjRNME1OWVlTRWYyZFlO?=
 =?utf-8?B?d3NOcElrVVpUNHBoblhnaUtpWFBWeGhGelJFWHltYy8xRWZIUnJnM1hsdVYx?=
 =?utf-8?B?bm4xZ3dsbjR0NjFtdDRFeVdkbTFmT3gvVkJNT2lmc0FublFJOWIwWFJlbUVt?=
 =?utf-8?B?eW93TWdvV1NmWFVRelR4WlRVcTRxak83d2RBZnVBOHduK1JvRndob29VbjdH?=
 =?utf-8?B?OEpiOUl5b3l6WWFDblJ1cFA2aTdkWUFhRTNjWFkvbGtSZytiNVluZ0ppWXFm?=
 =?utf-8?B?RG9nMklnTFdqNjZNVTA2akw0aGk0aHpoNEkxWGIvQkZEMVFNNXpURCt1TGM2?=
 =?utf-8?B?aDlCWkFrd0hQeXVQQmRVQittUVpqb1dlc0Z4dlJlUVlROGlTZ2VDR0JEMUc2?=
 =?utf-8?B?TG8wQjREZ1BQeEQra3hxS00wZUhSNzEwZGxOcXlWQnZxRGdlTG50c05Nc280?=
 =?utf-8?B?QTZNOW9QMG1rR3ZQY2dVREFrVDk1TTVwZ0hHQVNDbGhUYTF0T00xVTNldmpm?=
 =?utf-8?B?RDFRdUY4NnMyQStQdzk4LytrdGdkbnAyRTh0VXJiQW0xalJlVG1MUDlJa1VG?=
 =?utf-8?B?dFpnRmhlTVozMExNREgrS3lTcHcwei9JT3dLc05RbFp6cFUxK0Q3dmV1VERZ?=
 =?utf-8?B?bTBTTGhpdmE3cE10SlZJampsQlM2WGJRQ2ozVElLVUpiYitXdHNPRzkxK25i?=
 =?utf-8?B?L3lmVGpzRnArQ2ZTZ0FpamkwT2Z2dFl6ekFKWjMxTjVyWEkxeEZsMitBaDRI?=
 =?utf-8?B?Njg4N3NCMlFSeFhYQzNjcERiTDVkTWlHZk55dU03YUJOVFRISE5pZTVPTEQ1?=
 =?utf-8?B?V0JIWE55UTJ0S28wYjFUaGYwTkc3dlBZditlZm1oYXlpZVY4TVUxRmFZa0lP?=
 =?utf-8?B?MDg1R0NTVGc3eUxucC9mWEFrT0s3Q0NZNW9JNm0zZU0vTzFRV3hXTER0WlZY?=
 =?utf-8?B?dzRTMTcvM3c2Q1FJdTBmODhPK3l4M1R5Y3NmQUp6RjZzTUQzRVUyOWh4U250?=
 =?utf-8?B?Z1QrOHh5QzFxdnN1N1Y1Y2RFRjYyT2ZYWitJRVcxNGJoUTh0QzVvOEtnUkky?=
 =?utf-8?B?bS9WV2VvTmR5ZitjUlNldHRzZ3hySHdVeDdFNkZpTFpON2lHKyt6OEhhOGV1?=
 =?utf-8?B?b2FMbjRSSkI0VHVJeEFkNzFsd3dtTmY4ZXJwdDhaMFpxRmxBSVFNSlAzVlJr?=
 =?utf-8?B?TzVHSG5XYnJPOXNMeXFsZklzSnNiS1hsM1FUNHlOMFV1Vjg3YjUvazEwSW1I?=
 =?utf-8?B?dDQ0MVExdjR2Q29kbFpGZElPRElkMEo1S1lhV2lzbnNDTEt5MW1Wa09UOGdz?=
 =?utf-8?B?aExxRkhLTCtxOUtGblJmS0h4dVR4R1ROYkVpa0ZieHFRRjd5WGFwQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9665876AF8368B4B9F4B6B8055812328@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	cB97KuE/ZYe5tkrpZRojL02AA4AZFm9e0N8xBqNzz3Ws1G/iZI2f2K+5xGw8itX7qI2HmAf6uEHyZjnmShhLc64EqaZW3BQ6MQvV9ck6l5adumK++d7AhpNJundMejzhNlynLVOXw5LIkewmZg1wVC70lA/qqpieBWz8fi9hznndVZRDUaTzQX64jgp5a3H88MK7MmNyfYX2t7gTNirE2X1a6bmntByIcG7L9HIk1IQ9qgqfO8mupLPtOLeQHhTbGPI36VKpFlm5wlDq4Q40SN5iYJ+4IQjlj9YDgk4RguB8TWpbUE3DZPS3wlnOIzem6OvG3rjNMrUqk0ihjef4dQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+aI1UX+Ao4XxdAMCpZkKwuZFpkX50vWPfjuXE4zIA87nd/xqAGAoZv4wfJ6wfUgzh8cwPhG5CeS7bqoVoul93hEiXy2vCrq8V1KvSgeWrBpLAcuFOflKp5MO0ybdjY+y1eFPuOtrnr+Nx38aET+VJ1NIbk4UIbQfLQmi8F7W6IZGt5xUUb4YTOSvwoxWXA2JKr8NqWnJ0A07GEi2oB12xkSYx9g3hqkOtnzInne/TGKpEG5Jik7gYJx++jK10a+xaWg6M86N2oM6DE5Wps+qk9ROCeH8uYO4AxdapXFDYelfEKbFkhkEcyo48GmR5XQ4kTNx6T3ZSfj1CUGouZlzfQApz2djDPaC4cwtSejzxZzOBL+esgFexh2KdMLIA1y8etSL53HQboDZEHAReoh0fm9LZ0dXMlwwMAEvwv3oa7T6OjQFJjwTrM1rY3rv9Asu4GBdne6ttzz1nQx0cAkfaS5i1pBYqJKcJ5zyUcDpiV6qaCGyft1FzK5FV7hXMiHrUU0cWOXzck/J7u2+7CH1atbDRoS/49n5ba+hW8E8XmFy3NiSS/TvxxkHcgy+LJTD1gZf25JcNRwFJ9yOPft+4ohTji7KXJFuk/B6KjXCVTgxqYPooGYSMxlJo+KSiP0Sn297rLTPMUCGH8+UUv7MYw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b28ec070-65e7-4374-49ba-08de85444802
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 23:15:44.5199
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XyWPp9CpU8x46moSbm1d+ORShPGM8zUx39MQv7q44N2Pj7ZRtXI/dK8+Qcc2pUsuH+DX9+DA81nQss4FfTpC6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9622
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDIwMSBTYWx0ZWRfXykA7xddhHDcJ
 jJyNP0EYBzmIwOauBIZgLU8+sLIaetchxAs00ron5rZNKPtvAmuYW8j9GRXIFxhEIG/Cx174To4
 Baxs/FcY/teOCGdT3aP22d8rCwOVfbCu3FRzdkbT9hTWQ3JGlX37xunytX46oMGClVB1MzEjNIW
 xJCd6gq/QZP40fWvTixZKXA+E0sLbd/iFZC5qkiaMJ44Qpk7XCPIx2Q3mcVZf5l3jrPpAJxBOCA
 zvD8J96b3pKQcwSOHgTMYRXCqWCBaPZZKF+vPJW3lMbCgIZgimoGeRAU77SAGNZukNIBM7WG5bU
 n7QVJkxk5CLF/wEQjfeo68snOAAvv4RGXvczjfP++1N+8MOJATKhGNYwdf9PlK5Q/56msZDR0UD
 3gYMBTCacBgS5TpMZmOzfP9CbNLmKw2hRpV87K+g3aiNd7nG/9c0pTAHRnsFLjqezXsjLLST4Qo
 4C8hqJC1CeeX64nbE8g==
X-Authority-Analysis: v=2.4 cv=QcNrf8bv c=1 sm=1 tr=0 ts=69bb322b cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=3aj-GYhVtthe46Tand0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: goBMB9tjoEEZB_T4ezodnnYo5PGJPIdg
X-Proofpoint-ORIG-GUID: goBMB9tjoEEZB_T4ezodnnYo5PGJPIdg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_02,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603180201
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35081-lists,linux-usb=lfdr.de];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,synopsys.com:dkim,synopsys.com:mid];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2FAA42C3C69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMTgsIDIwMjYsIENodWt1biBQYW4gd3JvdGU6DQo+IEhpLA0KPiANCj4gPiBJ
ZiB3ZSBoYXZlIGEgc3BlY2lmaWMgdXNlciwgcGxlYXNlIGluY2x1ZGUgaXQgaW4gdGhlIGNoYW5n
ZSBsb2cuIEluIHRoaXMNCj4gPiBjYXNlLCBpdCBsb29rcyBsaWtlIHNwYWNlbWl0IGsxIGFzIG5v
dGVkIHVuZGVyIHRoZSAiLS0tIiBsaW5lPw0KPiANCj4gSSB3aWxsIGNoYW5nZSBpdCB0byAiU29t
ZSBTcGFjZW1pVCBLMSBib2FyZCIuDQo+IA0KPiA+IFRoZSBuYW1lICJ2YnVzIiBoZXJlIG1heWJl
IGNvbmZ1c2luZy4gVGhpcyByZWd1bGF0b3IgcG93ZXJzIHRoZQ0KPiA+IGNvbnRyb2xsZXIgY2hp
cCBhbmQgbm90IG5lY2Nlc3NhcmlseSB0dXJuaW5nIG9uIFZCVVMgb2YgdGhlIFVTQiBidXMNCj4g
PiBwb3dlciBsaW5lLiBJcyB0aGVyZSBhIGNvbW1vbi9kaWZmZXJlbnQgbmFtZSBmb3IgcmVndWxh
dG9yIGlkPw0KPiA+IEF0IGxlYXN0IGZpeCB0aGUgZXJyb3IgbWVzc2FnZS4NCj4gDQo+IFNvcnJ5
LCBidXQgSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4uDQo+IFRha2luZyB0
aGUgT3JhbmdlUGkgUlYyIFsxXSBib2FyZCBhcyBhbiBleGFtcGxlOg0KPiANCj4gVkNDXzVWMCAo
SU4pIC0+IFZDQzVWMF9VU0IzIChPVVQpIC0+IFZidXMzMA0KPiANCj4gVGhlIFZDQzVWMF9VU0Iz
IHJlZ3VsYXRvciBpcyBjb25uZWN0ZWQgdG8gdGhlIFVTQiB2YnVzIHBpbi4NCj4gSSB0aGluayBp
dCdzIG9rYXkgdG8gY2FsbCBpdCAidmJ1cyIgaGVyZT8NCj4gDQoNCkkgbWVhbiB0aGlzIGlzIGEg
Z2VuZXJpYyBnbHVlIGRyaXZlciBhbmQgbm90IHNwZWNpZmljIHRvIHlvdXIgc3BhY2VtaXQNCmsx
LiBTb21lIHBsYXRmb3JtcyB1c2UgcmVndWxhdG9ycyB0byBkcml2ZSB0aGUgdmJ1cyAoZS5nLiBk
d2MzIG1lc29uKQ0Kd2hpbGUgb3RoZXJzIGZvciBpbnRlcm5hbCBjb250cm9sbGVyIHN1cHBsaWVz
IChlLmcuIGR3YzMgZXh5bm9zKS4gQWxzbywNCmlmIHRoZSBwbGF0Zm9ybSBpcyBvcGVyYXRpbmcg
aW4gZGV2aWNlIG1vZGUsIHRoZXJlIHNob3VsZCBiZSBubyB2YnVzLg0KDQpBbHNvIGRvIHdlIHdh
bnQgdG8gZGlzYWJsZSB0aGUgcmVndWxhdG9yIG9uIHN5c3RlbSBzdXNwZW5kPyBJZiBzbywgd2UN
Cm1heSBuZWVkIGEgcmVndWxhdG9yIGhhbmRsZS4NCg0KUGVyaGFwcyBjYW4gd2UgcGFzcyB0aGUg
cmVndWxhdG9yIGlkIHN0cmluZyB0aHJvdWdoIHRoZQ0KZHdjM19nZW5lcmljX2NvbmZpZz8gQ3Jl
YXRlIGEgbmV3IGZpZWxkIHRvIHN0b3JlIHRoaXMgSUQuDQoNClNvbWV0aGluZyBsaWtlIHRoaXM/
DQoNCnN0cnVjdCBkd2MzX2dlbmVyaWNfY29uZmlnIHsNCglpbnQgKCppbml0KShzdHJ1Y3QgZHdj
M19nZW5lcmljICpkd2MzZyk7DQoJc3RydWN0IHsNCgkJY29uc3QgY2hhciAqaWQ7DQoJCWJvb2wg
ZGlzYWJsZV9vbl9zdXNwZW5kOw0KCX0gcmVndWxhdG9yOw0KCXN0cnVjdCBkd2MzX3Byb3BlcnRp
ZXMgcHJvcGVydGllczsNCn07DQoNCkJSLA0KVGhpbmg=

