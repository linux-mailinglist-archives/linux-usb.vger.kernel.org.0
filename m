Return-Path: <linux-usb+bounces-35990-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HhJLrbS0WliOQcAu9opvQ
	(envelope-from <linux-usb+bounces-35990-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 05 Apr 2026 05:10:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E52339D2F3
	for <lists+linux-usb@lfdr.de>; Sun, 05 Apr 2026 05:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ABC6D3004DC7
	for <lists+linux-usb@lfdr.de>; Sun,  5 Apr 2026 03:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907573451CE;
	Sun,  5 Apr 2026 03:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="E9rFs8H1";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="B9bKzCsW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="w3wTzh+f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454B41F1304
	for <linux-usb@vger.kernel.org>; Sun,  5 Apr 2026 03:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775358641; cv=fail; b=QolC0dfBpfHZUOCu3/KimF09Zav5hB6z8HvnsGP1+OiAiilR8R/UaXCC2Sm9TSKe3247aXUOQfbQN0p2sMZPaZmmUlXYg7sKNk6ChUOHgHIVmTBjM3QKcFE/N0hU/NTjuxrq5I90NQbxUB6WSkM1UyLaPUqPWcYDOCBNuHJ6mZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775358641; c=relaxed/simple;
	bh=d9b7R880o9nePAbsXwmZsJuzM9ZFYNHRZ8kp/4GQo9c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qbcqFzjagW8CZDBdTp5eG+l/5kpszrtH2W5kGrxWV+DW5LdqdWef8Kvif7OMNrHVVMuOTuMCQASp7k5HBs+vGen5HySexad/KQRgfBieQK6zQr04uYUD6igwC/84jbgggl9ygja+y7PywT91drMaiVrdKlrR6EFvt/pliMsM/CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=E9rFs8H1; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=B9bKzCsW; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=w3wTzh+f reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63538Yjq2631289;
	Sat, 4 Apr 2026 20:10:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=d9b7R880o9nePAbsXwmZsJuzM9ZFYNHRZ8kp/4GQo9c=; b=
	E9rFs8H1w7/qwhuaVKmH34+KDM3I9nNYiphU4t03LRnHDj4EER10mnYjHVhDdkqT
	fT2iStK2LcEDnfXPQdhDamlt5zVkrPIjbbTjfL0jLjR7y43+HdZ7Iu/gFnQq+xdu
	laLDqq0UcgOLfsC15ILLANFcAbw+OlbwMLZIiWqWsc7WyWEAjI+2Xcw/ByG1PqRC
	/5yzSqNQauNslCvcjxaeD/U8S/r/ut9QbYSsqvb2KtNf/vNLU9hc46FKGAtKFXKE
	CI/lCEZTBObPH9dFX4OmXUg0Ym6ODti0miaPRGo7X84ULBOLWk6oXeWRmJmrr17f
	WDWbSgL37aMis0U1IzisrQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4db1jr1x9a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 04 Apr 2026 20:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1775358631; bh=d9b7R880o9nePAbsXwmZsJuzM9ZFYNHRZ8kp/4GQo9c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=B9bKzCsWmuzZraNOftfMUy9px9bxYnnT3jK+1Ck+Tq4WKnraPNBxknVhOr8I0XcGq
	 OtC4aiGe657HEKI0Sd+LpqDSt6ydpi6mGY24dYwo6Y+8B+gxjMhAjnn2uRiIuaFc/y
	 DLNdbsyMHNhHCcCQ9r4Cxf541U9XSzBuXy2Ja/bqLSR7NziSDFmxAG+HwTT3d34McS
	 RmKBuzo16k8s9vjtq5FJ0sF8BeyR2iF7xhJrHWbbY6QkSlhGl2QOUqIFUc08X4WUNM
	 kOVwzk6Nir2h2X/kuJx9e+e5gEr+IkE4gOmp8Bv1yhp1oSJKTEXSZx8R8XYfrZWJiF
	 WNSwHupIsyX8w==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C2A4E401EE;
	Sun,  5 Apr 2026 03:10:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 45C9FA0270;
	Sun,  5 Apr 2026 03:10:30 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=w3wTzh+f;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00100.outbound.protection.outlook.com [40.93.10.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A7FF940342;
	Sun,  5 Apr 2026 03:10:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnwtAb95Dq09c0PBo4ftnLOAKZMzw3xc/uoxMGkeJ0wFauwb+qwA+xnZ65hm0vOaUK1Y2wFOahz+UfplJTah2r9PcQZQg3npJFrpYC9oKaJ4e5Ckb+doV73+YvLqNs4TlehzoxnpGgzWHS9rQ1RJjxtUxRk5jrF4g1gzzTHA2D0673disnMAVHISbliO4/tnDtsj5yxoKYhBByLwHz3kY5J8+yEw+BA2gFaxjjNAkZuQHQiNKe7c/pa/mXtpLta/ldPyEFRpNJAhdcFIkm2w88l7/VGG/TGDxrDx72XFuuiIhgyE4b5c1YL89zEp+CA7IE44s1TWBO/myhLOW9lGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9b7R880o9nePAbsXwmZsJuzM9ZFYNHRZ8kp/4GQo9c=;
 b=oM3ZQ9FDuK8Vc/95TWidxuZqBDFzY8rwg5hOy5MGQtTOQ2W9i5x6xfliasg8OLh1lmKHzWwlTcaHweUNSJRtwClHVyywqybeZGcsjPAHUgNp/TDWx4191zLMkNLEh7jqigYJ1hutV8PRs28fNxdXecHWP4dBclx3xnKMLWE/g8BVBlHdIBLIcVi+K7NlQbr/w307bCcy1Jo1NmbLrYGM6Y93WDvHVeIVYxkyMMKrVhvKTaogbrswBBZwt6X/dtrI95kJ/M7vsbBg0PrVSohOBMamSzOv42pACPCevtLQJQeifcAaKa/cXqcf+b+7hPyJC2l8GhVYcsHKf6qq7vwCzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9b7R880o9nePAbsXwmZsJuzM9ZFYNHRZ8kp/4GQo9c=;
 b=w3wTzh+fRqtqYaZKtD5BERHRRkAPyFux8zjNIXRRppgcO/3S74xr3T+po53RdlU0RBF+UlrxGWR0t8cTeJS8s3Uu2mMT4pIQow6xgQgM004g8zc1600zL4KHSexSKXvXPZxbz5bjEJZPIjTwpzX4U0vSrV19FUGhllofL08PtQA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW5PR12MB5652.namprd12.prod.outlook.com (2603:10b6:303:1a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Sun, 5 Apr
 2026 03:10:23 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.020; Sun, 5 Apr 2026
 03:10:22 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>
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
 AQHcusCFdimQniQh+kKFqQp1mqfuYbW+fjMAgACCooCAAQbCAIAAqVYAgADI0gCABZiuAIAAGBMAgAFDQQCAAGOTgIACAVGAgABK5wCAAYgPAIAAC/aAgAF5+wCAAArwAIABOtuAgAAUdoCAAAXNgIAAA5AAgAAyzgCAABvgAA==
Date: Sun, 5 Apr 2026 03:10:22 +0000
Message-ID: <20260405030954.32jbg3fphi5xdla3@synopsys.com>
References: <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
 <20260403015950.lx4n4zdqki37dy27@synopsys.com>
 <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
 <20260404011530.aukxllvizvmc3f3x@synopsys.com>
 <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
 <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
 <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
 <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
 <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
In-Reply-To: <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW5PR12MB5652:EE_
x-ms-office365-filtering-correlation-id: b681351f-6389-4901-22b8-08de92c0e038
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 maO5USZo3hpUBXxW0O0/WNV8ga5BuSOTuzxOgsN+k7NTdnFKsABBPJIN7ymFg7R9k8jQTWYV0ild+8weOwbp2bbEHR4tJ/CWxg3HzDVuM9CsnQTXuAFhvpMXeqS2+vKPWcsNkC0fpz9GIVUO1eHBAV60kNS9xSMoOMPPeB4PxJm1R/G4fVI0Oc/1UtIE5sdu6hgITj+Ascai6OlEHT5kz1kTolNK26ygsvsXfqRjmXfWvCeRywFaYgLLfdtATXmw09vDrA5ZskHwXRj+b2NAYJnSTbTMWgktILJVubUGxK9e74PvdF02GslhBzUkv+SQrutEmVz4G7VoKwvzN4mStcUuLTQPFFIvnaGFbMvuxuyEXVgQaAPfFJeVp3H+TuY3vmQmzaHJFq7kL1pAo9u67Zp+f3XADhOd3F91m4RcNxBlDM9CckqvaiWeJUjbVvyuJPH/iAkrzphLJq0gw4zMpJfn7lhSlxwgMRe/VwRs5YIoymgUnCkzaVXf2eLumpeKrkRcE+q/BL/vSvZTGPLj7v1Uv/6gayE2SbWHqRIjtsD371zXiDrDzEuzFr1gpuMWsM/BUJVMN0D9ta8R3BHHihQn1MkDMx5CHjeNJKkxogJJyvxBWRFGSLVTtROxSSd3LkOqwoSlGzL/Ie5iv1sTYnGuLS1ppJfwzz26vUOf7dp6aReNviIpELDD2mGmrh1dLc1afrV5VVaRYbSVZohuLNEDL8XAA8Jhr9KGowSvBWJyqK74/3U+mfXi1mrcGtEKGRYmNehDLPbAaizgyhacJE2BktCIPYygvSUsPPWSZN4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnY2WktOY25TbEVuYjFrVmwvdzF5VmMxZHc3c3I4ei93dENhL2dsSktGdkNG?=
 =?utf-8?B?YXRMQXlyTmlZTm9ReTI5bnhWV2ZFaTVIaXZFV1FSV3pLQTJOTGJmUmF0VHpX?=
 =?utf-8?B?QWxMNGl4UzhOMkpNT1N4K2dqN0hTTHJXcjFMNDJ3NlQxWXdaZ05xUUpDNXZy?=
 =?utf-8?B?ODl6Q3g2N2RrUGtvQ3c1aVpmcDdLaGhTVmpJMUVRaEpQUWx6ZlQ4UERYRi9N?=
 =?utf-8?B?QVFKU1plWklZN0lvbGk4RVVWVDJGT3ZMdWtXazc3c3hlRnNyUHpXaGp0UlNP?=
 =?utf-8?B?WTIzMHdUNHQ0VURUSSsvTFZoQVlpYTd6OFdKZUYwSWFkbVc4TVZWNkFFc1ZO?=
 =?utf-8?B?Tm1TNnFvd3JINUpJR2hRNWs3clpGT1EvcnR4Y2ovYk1ocWpLOGFyVkFNNXhP?=
 =?utf-8?B?bUZLbEt3RG9CaHNLZEp3MEtMVXV1YTZNaWNtN3hsU3phL0ZkZmpod1NtVllT?=
 =?utf-8?B?Q1ZyRlJUUEcyRHJZdGtWOHN6SnlJOElEeXMrTUJQbStpemhtQ0FKSjRpTFJX?=
 =?utf-8?B?QW9tWWhaa3ppc2xBUHRYVld6SmhqMmZqQjJXQ2pNY1J1UUIzMjNZQ3JZV3Fn?=
 =?utf-8?B?VThHRkVTdFhXVTErdHcrVFZXWU1HNDdmRW5kSFBMSlM2LzFkVVZDWTUwWHpU?=
 =?utf-8?B?NjlzcFQwdGRKL0s3TWcyYXdLMk1yQnpIZGZCdnVoYjd4ZnZuYjJkRUhXZllO?=
 =?utf-8?B?SU9jQUc0aUdQeG5pMVhTSmJtNVNyMnd6Ty94dW5qMW1sekN1clVNNm1ZSHM4?=
 =?utf-8?B?OGJuVG1hb0xhR3lPcVF0TmFxOFRVbllwVnY2K2VOMStlcW5PN0c4VitPNU5G?=
 =?utf-8?B?eFVGcGJTQmFldENGbHRZekh5NjJnUE44Z0tUcldyRlZMVk9GbVNlWkFCZll2?=
 =?utf-8?B?eGJPZDJKaEU5cE4zb2wxMkFXQjZpZ0RZYlhDWk1WdklwQk01V1J1aXFqZWsz?=
 =?utf-8?B?UkF3UWdkKzF2Q2NXTXVRMk43OFZFeC9pdFZlNVdjc0wyTEVSMWNpakJrWk9M?=
 =?utf-8?B?NlVqdkZ2TmJxUmg0eU9YdndhTlpHZ2tFa0VSVkxJbHBoYWtLM25CeXFXV2pl?=
 =?utf-8?B?ZkR0RU9sbUloSnRJL3BWc050MG82UkdKZ21VWm5YckRlc1VqMnROZUE4NHA2?=
 =?utf-8?B?TkMwWjM1d21ld01MdDN0RTdEZ0xENFZYNk5mOGdnS2FMNGIyKzlBbHlldVBo?=
 =?utf-8?B?TFVzcURncjV1V1NIOTdDT0ttcUpFMHN4aFFRbWlKL2ppaXZwVmRmQUc1RlNn?=
 =?utf-8?B?UmRYQmM1VkV4TWtLOXJibXNCSXpUTTAwWVF1YmMyNVdIbFJiMUZHVTllK1FK?=
 =?utf-8?B?Mm9iemxOUFZlRjVYNDVsQXBxTmhkWUxZNTBHcCtQWjdVcURpYmh5TjNsVzJS?=
 =?utf-8?B?SE9FL2RmcG5FWEUwUkd2TGo3ZTI5M241OTFrb044VXFqUVRaZjdkRy9xeWdz?=
 =?utf-8?B?ZGlpLzcyVkx0QWoyQlRHaXdXT3VoYmxhbGgwWlNjdUJHUEs3RDJpd2ZtaGVH?=
 =?utf-8?B?dEpkN0JxcUZwRTU5alVJZzJlRS82MnJxUTNjaDN0TytIK1hlaFFJQjRTV3M1?=
 =?utf-8?B?dVdGQlJtdFBMNXBwNUdScGdoVksxNUZMMll6Y1dUTDdiRnFoVVNJaUdrUWV0?=
 =?utf-8?B?alBSelR6ZWdndSttSmhxMXFVenlyLzNIUTcvbjRPc3NIQTNMUGRNUjViRFpY?=
 =?utf-8?B?MUt3ci9pVXo0OW9ENDZoQkkrRDQ3Ui85VjRMdUJteTNVSnNjM0pKVjJhOXZ4?=
 =?utf-8?B?Y3lXU3NIRjlyazNCYWp1VUVoTytoSDFjL2FPUEFyeENtb0NlWEthR2xNYjln?=
 =?utf-8?B?QzdXZUJXYnVNYTBMalFXVVArajNVL0FJd1hsTDNyU2o1Skdvem1FWlNNWHZ6?=
 =?utf-8?B?cWVZL1ZUTGNweHVJRmcvSkNMV3A2R3l1UVlRU1RQTmJFbXNQTm1LSTQ3RDVJ?=
 =?utf-8?B?TWJqeGhHRzR5ZTdtUUkvNElHZHJxcHRSVXlNTlZvRHhFRlEyRWttT1hiZ29p?=
 =?utf-8?B?d0w2RDM0dTlPbmtBbE8vS21aUTNTeEdwTjI0dTFYYXFNaThPbkZMeEY0OEhU?=
 =?utf-8?B?NG5Wa1d0VWJPNlFWamtNZFUxWi9ZMXpQdXJIRnUxbTFwUnNZeGNRQXAwc3hG?=
 =?utf-8?B?K2x1dnlxWXZhOHJ3VE9wd3ZxZlErVWpnVlZSUXdaUVRvOFRFaklUQUdOUDVD?=
 =?utf-8?B?Yk93TGgvMCt6eFI2WEFiWURaNWszR0RWRDFhcnBqOExJYU9HZ05qdHA3Ukho?=
 =?utf-8?B?eENTTCtaWXpZRkFrL3ovQTNaYmhhNDFpckNtblh5TUtVSWhoQmFLUEh4TnpE?=
 =?utf-8?B?K0l3cUlVVUtHZ1hISVVNTHBPMFFmUTUyM2NqcUV4UFZET2V3c2lkZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <720DCDDAF0CC5B4CBA3EAD24D8D171EA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	EiIsKmt/8i8SiPe5/rPdyGK+TjTrcTCvxmRh9G37dihixsoKqTTwl9+b6Dp/U0sC+r/1VWYMo0vNdgkwb3FVBlFJNmgSUfc9H9UwUuQkz/RQ1z6d4NuuSTw8e8xrObiF//VUvLCo41An7zAjrXxFGDNVGsIwpnC1c8Wgdry9okT49n+7hMUe5Pv407c1y6k3aJprHUpjMGjbeX43v+GhcJyFVQtM/qknEH+hL77aXBTIIm6eJOc45IsqGl1vkQU3TsRFkkI9TGz1GHIGuRdbSyIb2ZuMUdvBBNDZ3wVLkNAjLT7YXUkHamztgnAY18CG4H9OlOeNxAaUM1rig1P5uQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9hyNkkV14jzWG5aHRvCN5YgY6pY6WSg786GRpvJI5mSY+OSfZPpvHoflV+9XWRE737VQiZhStyvEy1MSFF2lHhTscPQ635ECtcdrPNWRYDUg9xv2SdF2NtYGg1b/gT50F4rtV4QXAhMkXIDAmj/Sf7VJSumWPhanBGsv7JwmXUMFepIbo7ZoPFbHKnWKuDXUZXTlfQkAd0KZUeJ6YSnBr7zAPBPzUmyOtzUEQPtfrC7K+7DO6UnV7YWxLrjdK2yF3p4Gb00SMAnPnoTR2v8NhCtjoYkmvwehj9v5bk2ohyygU0zG/xBGgyx/R6mt3XtVNKQktkAyk7IVidaiiRhh0voSO6SNW51yprW/SDBdUOZGta5tsFWRa1oWQfV2IRPEgUKX3UEnxRiqBs8eK8kBUV7hcXB1kg09xZ/UGyBIgVxHLJov0AjDDMV231Vr0EsnlCQO2CpkkrskTOZHG9p0crgNRIExiJ/onuEASa+OlwE8F8+0wPBVjE9xAXn0YXKvX7n0TZZspm0e8wToKW1SCSQdD4VMQo98bHjuaLtXUpP5oOC+HqrkckyORxaibrEflcMSdy2bvVju5r1qHQA3vIIbW2Vo88dpLepojpPisYXup7Iw0pPJQQPClgEJkmG7pG52TuLCe6Uou7pTrarDlw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b681351f-6389-4901-22b8-08de92c0e038
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2026 03:10:22.6297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LOYiXpG3Er/UAbxGgvjjtJDhreZNTvcVjf7bWtmlSeAq9Lf0oakushy1UqO7FWMlbEY1xOO/OEoDw3zsMsCskg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5652
X-Proofpoint-ORIG-GUID: chGbfIp37DUCU_O4U6Pt_jsnbt1rV0B3
X-Proofpoint-GUID: chGbfIp37DUCU_O4U6Pt_jsnbt1rV0B3
X-Authority-Analysis: v=2.4 cv=ao+/yCZV c=1 sm=1 tr=0 ts=69d1d2a8 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=8jkYBAhDOjnDwm0Z8LkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDAyOSBTYWx0ZWRfX4oDODf8ivYmr
 7sAucX0QaUEq8+Tw+Vk2xOFG99jg+ZTyoY3HX5pxc/ABlosdw7VpvdaiuqvHpQQrww7gGpRHuij
 e7l62A2h5gaW35guMtuF0ILYDbQMUMPUaC1YY8Lcr0xki27JcUGCLm93pF/w2Qa+7EhYRr4gwHk
 515DuwJaTyq4K9qi9axJvCFybt6Ic42UvoJOLpdRimBv53nkXwIiGADCXFUvR1bg9fQ7uksu/he
 tq0dBBfJdALydc+gK3Xa9RVBzErmF/YpQirlaAqRgJH6pDHojDLSu4Jk8ZyIxAVr4iLr9hBIxm9
 +BQtjHhjaD+ny2UsbdIsTqyAPJtpf/bfJRVHPb+pWAVgLhf8753hNNknuczJf9bytd2CxcrJJbN
 FcvGkae4mW6Vy8p5nUte+bvLYOPcQIps5HckZuZJ4nxS+R95bIrup0N+vEGILKFmGpyeJZxv7os
 yBOaCrKmyGozvDx5+Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050029
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35990-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[synopsys.com,linux.intel.com,vger.kernel.org,gmail.com,suse.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6E52339D2F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU2F0LCBBcHIgMDQsIDIwMjYsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFNhdCwgQXByIDA0
LCAyMDI2IGF0IDEwOjI4OjI0UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBT
YXQsIEFwciAwNCwgMjAyNiwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+ID4gT24gU2F0LCBBcHIg
MDQsIDIwMjYsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+ID4gPiA+IElmIHRoZSBjbGFzcyBkcml2ZXIg
d2FudHMgdG8gdGFrZSBzb21lIG90aGVyIGFjdGlvbiAobGlrZSBzdWJtaXR0aW5nIA0KPiA+ID4g
PiBVUkJzIHRvIGEgZGlmZmVyZW50IGVuZHBvaW50KSBiZWZvcmUgdXNpbmcgdGhlIGVuZHBvaW50
IHRoYXQgc3RvcHBlZCwgDQo+ID4gPiA+IGl0J3MgZnJlZSB0byBkbyBzby4gIEl0IG9ubHkgaGFz
IHRvIG1ha2Ugc3VyZSB0aGF0IGl0IGRvZXNuJ3Qgc3VibWl0IGFueSANCj4gPiA+ID4gVVJCcyB0
byB0aGUgc3RvcHBlZCBlbmRwb2ludCB1bnRpbCBhZnRlciB0aGUgb3RoZXIgYWN0aW9uIGlzIGZp
bmlzaGVkIC0tIA0KPiA+ID4gPiB3aGljaCBpcyB3aGF0IGl0IHdvdWxkIGRvIGFueXdheS4gIChB
bmQgbWF5YmUgaXQgaGFzIHRvIHVubGluayBhbnkgVVJCcyANCj4gPiA+ID4gdGhhdCBhcmUgYWxy
ZWFkeSBxdWV1ZWQsIHdoaWNoIGNhbiBiZSBkb25lIHdpdGggYSBzaW1wbGUgZnVuY3Rpb24gY2Fs
bC4pDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBUaGVuIHRoZSB4aGNpIG11c3QgbWFrZSBzdXJl
IHRoYXQgaXQgc2hvdWxkIG5vdCByaW5nIHRoZSBkb29yYmVsbCB0bw0KPiA+ID4gcmVzdGFydCB0
aGUgZW5kcG9pbnQgd2hlbiBnaXZpbmcgYmFjayB0aGUgY2FuY2VsZWQgVVJCcy4gSXQgc2hvdWxk
IG9ubHkNCj4gPiA+IGRvIHNvIG9uIG5ld2x5IHN1Ym1pdHRlZCBVUkJzLg0KPiA+IA0KPiA+IEln
bm9yZSB0aGlzIGNvbW1lbnQsIGl0J3Mgbm90IHJlc3RhcnRpbmcgdGhlIGVuZHBvaW50IGluIHRo
ZSBjYXNlIG9mDQo+ID4gdW5saW5raW5nLg0KPiANCj4gSSB3YXMgZ29pbmcgdG8gc2F5IHRoYXQg
eGhjaS1oY2Qgc2hvdWxkbid0IHJlc3RhcnQgdGhlIGVuZHBvaW50IHVudGlsIA0KPiB0aGUgdXNi
X3Jlc2V0X2VuZHBvaW50KCkgY2FsbCBpcyBtYWRlLiAgV2hldGhlciBvciBub3QgaXQgcmluZ3Mg
dGhlIA0KPiBkb29yYmVsbCBhdCB0aGF0IHRpbWUgbWF5IGRlcGVuZCBvbiB3aGV0aGVyIHRoZXJl
IGFyZSBhbnkgVVJCcyBvbiB0aGUgDQo+IHF1ZXVlOyB0aGF0J3MgYSByZWxhdGl2ZWx5IHVuaW1w
b3J0YW50IGltcGxlbWVudGF0aW9uIGRldGFpbC4NCj4gDQo+ID4gPiBXZSBjYW4gYWRkIGEgcmVx
dWlyZW1lbnQgc3VjaCB0aGF0IGlmIHRoZSBjbGFzcyBkcml2ZXIgc3VibWl0dGVkIHRoZQ0KPiA+
ID4gcmVjb3ZlcnkgVVJCcyBwcmlvciB0byBjb21wbGV0aW5nIHRoZSB1c2JfcmVzZXRfZW5kcG9p
bnQgKHdoaWNoIHNob3VsZA0KPiA+ID4gYmUgZG9uZSBhZnRlciBjbGVhci1oYWx0KSwgdGhlbiB0
aGUgSENEIG1heSBrZWVwIHRob3NlIFVSQnMgb24gYSBxdWV1ZQ0KPiA+ID4gYW5kIG9ubHkgcHJv
Y2VzcyB0aG9zZSBVUkJzIGFuZCByZXN0YXJ0IHRoZSBlbmRwb2ludCBhZnRlcndhcmQuDQo+ID4g
PiANCj4gPiANCj4gPiBBY3R1YWxseSwgYWRkaW5nIHRoaXMgbmV3IHJlcXVpcmVtZW50IHdvdWxk
IGJlIHRyaWNreSBiZWNhdXNlIHdlIGRvbid0DQo+ID4ga25vdyB3aGV0aGVyIGl0J3MgcmVjb3Zl
cnkgVVJCcyBvciBub3QuDQo+IA0KPiBUaGUgcHVycG9zZSBvZiB0aGUgc3VibWl0dGVkIFVSQnMg
ZG9lc24ndCBtYXR0ZXIuICBUaGUgSENEIHNob3VsZG4ndCANCj4gcmVzdGFydCB0aGUgZW5kcG9p
bnQgdW50aWwgdGhlIHVzYl9yZXNldF9lbmRwb2ludCgpIGNhbGwgb2NjdXJzLg0KPiANCj4gQWxz
bywgSSBzaG91bGQgcG9pbnQgb3V0IHRoYXQgdXNiY29yZSB3aWxsIGNhbGwgdXNiX2NsZWFyX2hh
bHQoKSBhbmQgDQo+IHVzYl9yZXNldF9lbmRwb2ludCgpLCBwcmVzdW1hYmx5IHVzaW5nIGEgd29y
ayBxdWV1ZSBmb3IgdGhlIGNhbGxzLiAgVGhlIA0KPiBjbGFzcyBkcml2ZXIgZG9lc24ndCBuZWVk
IHRvIGRvIGl0IC0tIGluIGZhY3QsIGRvaW5nIHRob3NlIHRoaW5ncyBjb3VsZCANCj4gbGVhZCB0
byBlcnJvcnMgYmVjYXVzZSB0aGUgZW5kcG9pbnQgbWF5IGFscmVhZHkgYmUgcnVubmluZyAodGhl
IGNvcmUgbWF5IA0KPiBhbHJlYWR5IGhhdmUgbWFkZSB0aGUgY2FsbHMpLg0KPiANCg0KVGhhdCdz
IGdvb2QuIFRoaXMgaXMgd2hhdCBJIHdhbnRlZCB0byBjb25maXJtLg0KDQpNYXkgbmVlZCB0byB1
cGRhdGUgaG93IHhoY2kgaGFuZGxlcyB1c2JfcmVzZXRfZW5kcG9pbnQoKSBiZWNhdXNlIEkNCmJl
bGlldmUgaXQncyBleHBlY3RlZCB0aGUgZW5kcG9pbnQgdHJhbnNmZXIgcmluZyB0byBiZSBkcmFp
bmVkIHByaW9yIChieQ0KdGhlIGNsYXNzIGRyaXZlciB1bmxpbmtpbmcgVVJCcykuDQoNClRoYW5r
cyBmb3IgdGhlIGNsYXJpZmljYXRpb25zLA0KVGhpbmgNCg0KcHMuIEhhdmUgYSBnb29kIHdlZWtl
bmQhIEknbGwgYmUgYmFjayBhIHdlZWsgYWZ0ZXIu

