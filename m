Return-Path: <linux-usb+bounces-32090-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 510EDD06A69
	for <lists+linux-usb@lfdr.de>; Fri, 09 Jan 2026 01:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86DEE300ED83
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jan 2026 00:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E691E5702;
	Fri,  9 Jan 2026 00:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HP7JZsEt";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="AT358BV/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hrSbeShV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5598654763;
	Fri,  9 Jan 2026 00:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767920020; cv=fail; b=YsCLevBgLxwnUxvoEQDFKQUKROw9q43aYz+H0bLvKq3vFNHwTMctBQZdNZvEYOpDf1jp9+0A7TO3y+0izaFIee45c+DnDIYvZqBW7cvekbkQhoe81tAMG3906+wo9E32eP7Vmt1iHi/xipuMTcpp7bCI7hR6sV+zTlDFCbKaQVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767920020; c=relaxed/simple;
	bh=zeKWDszBWVYDp8TM7kjN3E8jEZW+qdhaXRvcVc70fqY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EGRuQWQKGb/D9pVlJgn4h7juKEk6xjCZu4J3Z4J3nvEzkcWWKLRK1YFAqiVCMcdeVMuTo6d9d87Uo8e8Vi/JKPCQjVKARs1D+A4WpIi5eQK87L93mKf5YFVCrDY+wM4O3M0gcSbwNTsF9EUcrjL9khbCQLAiMr3nzCkuczXsKdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=HP7JZsEt; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=AT358BV/; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hrSbeShV reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608MhYEo254910;
	Thu, 8 Jan 2026 16:53:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=zeKWDszBWVYDp8TM7kjN3E8jEZW+qdhaXRvcVc70fqY=; b=
	HP7JZsEtoDDDKQkZ29uHVRNOmwR7k8edCu+CDrzc8DZxhdPSK2K97htDH+XE7hc/
	x58qKTRrAzSp+YmoZgDWufKLhN/UHoKOOZNjBvxlSmUx6wGUIGVW2W8Tw9S8i5up
	6c/YRIUOaqZRku6o4syBqcBa1DrPXIiaF57kadj1TOGNSpWsQALmB3wLIWWFAR9a
	ZkM/E/d1V65YY7boHK28SjvgRc50cBuXRhJvETC132LmszNeE1OCiOzCXe/JmN2A
	5YJT2jjvoTfICasVVFLXv042okSkH13bn7xb55sU/0baVQcrphopW7OyaZAinJa/
	CO0uQovWRGQePBamJ+BGnA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4bjng3rt11-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 16:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1767920014; bh=zeKWDszBWVYDp8TM7kjN3E8jEZW+qdhaXRvcVc70fqY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=AT358BV/Y3X6V6mKaszSv0ZePTTPGlGhjAe1MHnSTF0wC20Q/cg0O32oC7vzH+Dis
	 o/1zV/UqpkGeNgPrq8j8XxDHhhANYtftoEFMSIV0qUZg6T4ovr2gkj0XZW607w4FGF
	 /gj9/xmw2lfpRTgRW11XkEat3qg+s9fGPG+QTX7ray4SrTvK3tg/OFSqIxdSS5GH1N
	 0BVI2FgqW4Zu9l060LgwREs9vahK/tGaXDK8byNySoh6Z/sxe913EldWxVoC2b+gK0
	 s64vniTNgJz7KN2pKA5mkGHjfU0oascJAoF1uKHfJzr9qpsuqUDaYfVKF5n5Vc7OCg
	 4AOYCV74oNS3Q==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 53F3A40726;
	Fri,  9 Jan 2026 00:53:33 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CEA59A006D;
	Fri,  9 Jan 2026 00:53:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=hrSbeShV;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00102.outbound.protection.outlook.com [40.93.10.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3A7444035D;
	Fri,  9 Jan 2026 00:53:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgYayk8rTcONp2pk1x2XnZEpLJEER1dvZP9lMfife9TfyT8VBAzMgbW1PZIS0Mvc7z2wERfs/bZQ8J3X/ZNr+UPEYvYq8+R+4+a5Pg5z7iU82WI/+TbpJ3vIujBCmh/K35mE3XyOYvxu5OVmTww/1a2es1DyTP1Z75uPJBFqFDJuLbP9p8rD0d3Y6tDzAuJ6WWU3E2vUqjNSfpP2JRExThW7mVvB95OmuGnGCr/1EH7Y0RY8bf2ewJuSEObkXa5qhS9koI0ADs3xtI3KC6Hr8jF1cBLGhKiZeIclstkr81cAIDBkwpdY5O7gO7ehYrmoXk02tByfU+ZWnAf2isNI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zeKWDszBWVYDp8TM7kjN3E8jEZW+qdhaXRvcVc70fqY=;
 b=JhhrrdL/5Bfs/+SN6Tik/yYYFlL8SK8wc0Lf1t7RA1MyI1xwinmf7qpfaPu4qzS1SHc5pWa2r/WsBsEUUbgBQdNDfQoLD3AVjPrWMO0uQ0sqxJu5xEUNDUitrpOE6eL4xPdlEDJ6Cs4r1kzBKc5NOsVTtU1eLk1gWx2eQahTGFnUa0Ixp2kX12D1toHZPROhZMW0VZm0QJB3VJtM2i9uikoDICyBoBiSqu7iNPEwJ61JOKVKCmZsZHGUm7HI5weQXY/H7AFJH0hwRwZqcTMBzYasaAQu6Z+Z3c7NcCPoJ0MkUWRU7U468ubiDSiBqm8506JNSQeQiMfstqBvzEm4qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zeKWDszBWVYDp8TM7kjN3E8jEZW+qdhaXRvcVc70fqY=;
 b=hrSbeShVYxHK/SXNfo88IILTx2/Ivb65ymlNsbS6gl27GR/u6YYvyy2b3M+AO9PyMSm+n2b+AT3iFodFr//Sgw6IuT/fEjwcxPyYix8aJZ2EhnqiXJBuU3fbdb8RCrPFinxyAYH9F19JgbRwYyjtqfSaWU1CQ9rLMySTPkdFqA4=
Received: from MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15)
 by BN7PPF521FFE181.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 00:53:30 +0000
Received: from MN0PR12MB5979.namprd12.prod.outlook.com
 ([fe80::39d3:f259:acf5:7f7a]) by MN0PR12MB5979.namprd12.prod.outlook.com
 ([fe80::39d3:f259:acf5:7f7a%4]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 00:53:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] usb: dwc3: Remove of dep->regs
Thread-Topic: [PATCH v2 1/3] usb: dwc3: Remove of dep->regs
Thread-Index: AQHcfjoCZuAE4uc1NE6fS0IU6jKA2rVJCEcA
Date: Fri, 9 Jan 2026 00:53:29 +0000
Message-ID: <20260109005328.m4llx2okriuhuvo4@synopsys.com>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <20260105115325.1765176-2-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20260105115325.1765176-2-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5979:EE_|BN7PPF521FFE181:EE_
x-ms-office365-filtering-correlation-id: f4713c52-f369-4449-807b-08de4f19818c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?SHhCeGZFN1BvdjduMEFZWUtiMkswcE5mUVRvTUFKMWttTUJ1aXh3eGdJa3ox?=
 =?utf-8?B?Q0VDZEgzVTJiZHEzeWxCSGFxZFBZN29WYXhQTzMvbjZDM0RwbUlCZHJid3hm?=
 =?utf-8?B?UXZ2TGFLV1N6Y1ZhM2ZVYWVxSloveVcwMFBtcVVLSFNQSGFOdUlLb1dOODlU?=
 =?utf-8?B?czMxcERjc25yT0grdUVoeURMcS9OZi9QcFM5RVNoUHR1NEVLL2hjc2hNTng3?=
 =?utf-8?B?c0JIY00yUHNleEtJdUlIeWVKVUR3ZGU3Wmh3NWpXTE1jOVQyMWRVU3dpRzJh?=
 =?utf-8?B?OTdYTVJ3ZVorblk5SE1NWTRhaHdHWC9MUlJuYU1mWjBBYkRqRTY1MXliUldB?=
 =?utf-8?B?S2VoZXR1NW1ONEVMVTdETFhJQW1XZmhOUThVTll0VkJmRTB4anVEUmthNGEy?=
 =?utf-8?B?SHpXY3FwcE1raUxscERSdG9vbDBNR3BUQ20xUFRnZ0VweFNJL3hNNE5YN2kr?=
 =?utf-8?B?Rll3VEpCdnF2dnV3ZWV4ZTdCcmQ3ZHpvQmJkYmg0c3dxY2tURHJWLzU5dFph?=
 =?utf-8?B?ejZxK0V2bXRyeUtnZ0piQkFUSUhFRzgyMFN1T29BRDBpS21tSCtRNjQzL0pR?=
 =?utf-8?B?Yy92SXI4UGxuSXI5bFByVnJFVVNTK2djRUo2TmdrWkZXRTZ5UjFiL0V2c2px?=
 =?utf-8?B?QVpXdFlaK3htdXlMNnhURDNnaEI2RUpmNlc0M1RxL0RZRGV5V3BnU1lOc1Iy?=
 =?utf-8?B?VUZHUnlLTlVFUzZiRlIvSVk0UkRBbGw0UXBXdWx0bVMzYUF5L3lHbERLeWxo?=
 =?utf-8?B?eEx2ZGdTT2ZObFhvN2V0QS9ZeEhZdHNjVXpocFMvWG1HZlJVbUc0Q0xkRTQ0?=
 =?utf-8?B?cFl1ektxd0lETlFnMWtUTmZxdWFzdjBSS1VQRW1UVUxtREQzc3diU1EwVGh1?=
 =?utf-8?B?a1JxbnEvdGVzRmdFeVJISmN2U2Y1WUlUc0JoN0ViY2liaVp1UlFFaWxUZ0Va?=
 =?utf-8?B?YjZPcktENEU2WXhVRmhNaUdrNS9kdEZDR3pPQWtRbkw4Wm9NNytMaEs3NklS?=
 =?utf-8?B?cXFtL3RXOS8vVkZ3Qm8wWkpkdERjZ1ptOXJRazhHZHZIUXQ5M0JvaXYwVWIx?=
 =?utf-8?B?My8rU2VQUFpCNjdmUTJwK3B2YWduOEkyWXVMT2VSQjcxR3JvbjlBWDVKSmQw?=
 =?utf-8?B?bVJyMGh0T2ZUTGRLeE1MRUpibzNqd21pYW1jT2dXQUc3Sk0ybkpvbG8yeWtY?=
 =?utf-8?B?WDM5WFJva1hQdmIrSnRZMVMzSUhJSTJiS0g1YmNWMXl4VzV2YkZDOGVvVGEz?=
 =?utf-8?B?czJzYmwxN3BhUlpaWEpEYkhSYmZEelhmZEdPWW1rTXBuZ09Fc25vYzQvQVdt?=
 =?utf-8?B?WUtHdHU3ZStSK2ZMcHhFRDV1REd1b0Y3cFpBOEZjb3oyV011QzV0NnU4Mkhm?=
 =?utf-8?B?SElBUXg0NktCYXl1WjlmZG5ranVqMjZwY3I3bEJXQm0zQTBtR1JWU2d1ekpW?=
 =?utf-8?B?U29KWmdHMGQ5OWx0WG5TWTJJblFGMDNKZ25VQWVZQ0pic1ZkK3dHY3RZZ00r?=
 =?utf-8?B?ZTR2bXAwTW9JekRndmdTRFlPSnVwd2QwN3JLNnowN3dQR2dDcTZZL1lSVFVk?=
 =?utf-8?B?UnZQZWpaRWVyZjdJdGpiazBqdGROZEV2ajdBa0tCcGlYWVIrTmlTMitTcUxO?=
 =?utf-8?B?ZkpNS0I5T084UlBHQkc3ZGhzUWJlOTlQUkFITElYckxyNU5FbTFMUWhBTXBW?=
 =?utf-8?B?eWprWm5ocURXaHBRaENNMDBtYlVuR0czNE5Ia2V1em9qUUFNV01KZDhGUnE0?=
 =?utf-8?B?dGRZQWdrZ3p4ZkRHLzBTUVU5ZGlIWWMvYlZvUVY3ajVDbEdabnpCSUpiaTZN?=
 =?utf-8?B?cFNaQUt3RU9OalRRSFN2bDZmeXBJQ2ZuSi8zajZmeTAwcUhlMGpOeEJoalRs?=
 =?utf-8?B?ZFNRY3dmNG1oVzN2dlRvR1ZpbnRmNktEZnJRZ1dJKyt6SmRHc2hFT2FKeVFW?=
 =?utf-8?B?Q0ZmQjhjTjdxRXJnYlpIKyt2Ujdnc2VtYkJzOEkxMXd6NWphVWcxWk1LSHFl?=
 =?utf-8?B?ZlB2Y1NwVWZsUVdmVXVqYTdCTk9xUEtyVVpXRkZGa1NnNGw0RzZTQjNzZzlh?=
 =?utf-8?Q?1DxdCJ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5979.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RWhOMC9zV0JGRkZ0Q05BTGpkU0FXNDVzNWRwbDFHa0JBRmRIVFVKWDlHUU1z?=
 =?utf-8?B?YXFPbVdhaHhqTzJ4VTJNZUt3Rmpkc0R3cnZkS2NiQjNabmxYMlI2LzByQkF1?=
 =?utf-8?B?WS84aDRGemhWZ0Y2c3YzdVlVOTVnSTV5N0p3MHFRT2Vtcm0rUXRNZmRZKzBL?=
 =?utf-8?B?RFA5Qk02bGUrUTNJbWxGakU2Y1ExYTNkZWkydlhGNlJJSFZXWUZFTE9JSlho?=
 =?utf-8?B?emlrUzQ1OVRYWnAzUkREQ0p3M0IyWnNiYVZmQVIyaGVwS3BjTjlPY2RmVytv?=
 =?utf-8?B?MkphSTcvNVBvVkpMdE9mSVFXZmtUMVBxOXg0cGdacjkweHV3cGVsRm1mZ1Fl?=
 =?utf-8?B?TkNRQk5pT2thMmwxYThzWHhkbzRpd2s0Q2YzRXBsRnRsZHZQUlRjYXh2bERk?=
 =?utf-8?B?bnZIeVIzNi9zWTRrWFdVSk12bWZCOUF5bVRPQm5odldHaWlyc1lqWlFIcnpO?=
 =?utf-8?B?dEordS8vRkhKVEtGWWk2Qm1nKzhocDFGdkM0UUdBZ0dhUU1HbDM1Rk9wV0R5?=
 =?utf-8?B?WWpPUElrSHl0c0V3RXhJZVdwTDdLM3M1clU5TGlwTi81K2ZZMUpsZ1MrOWtK?=
 =?utf-8?B?b2JFUm9VT1BNRTRvOTFXOTNpV3l5eC9yUGREd2Q1YldNbk8yeDVOYUxVZ3ZH?=
 =?utf-8?B?aEtxL0E0UzdOR1JaekpGSi9waWNSQktFUmluSTIwWVp5RHhhUGlhQnZVUFNm?=
 =?utf-8?B?aXpFSUIvaXdTbnJkVTk0bXpqTkdRNUdadDdLRy8wUy85QmVvODk2Q2dabUVo?=
 =?utf-8?B?enU1OGs5c2R2VnBUNnBvU1VsenMvVzFWanpLMkduQTdQZnh0N3JJd2NIQzBV?=
 =?utf-8?B?OFQ5Rmh2eHQ5UWszM2UrVWlGU21CR1cwbGNaVFJHaW1vWXlrN0FvcThWVkNn?=
 =?utf-8?B?ZFhCUUp3UnYwU00vc2tIdDJiYjBZUExVM0ViZWE3NHIvWng5bnA4WDZCeXFw?=
 =?utf-8?B?UUpmd3grL2Z6ajRNOU1kRE9naTd4eDJrSk5SQVFlR1B6TXhGS3FEclBCbmhD?=
 =?utf-8?B?SXNHVlhmVjNhdXowZC9HUTdMZXBOMk1vU296SWMxTUpHRnNTK3I5bXluelFv?=
 =?utf-8?B?NWFDZ2h3Um5obnhqMk8xNTluamdhcHV4bG9MNk5CVWlIWGRubU9xdzBHeS9h?=
 =?utf-8?B?MTNGMndOdEtaMXlYcndIcDh6TG1pd2xlZVZjMDdvR0VDSDBabm1Tc0U0bUpQ?=
 =?utf-8?B?Rzdpb3d5WlVFRFMzSW9zV28rWGdOMnB6SFV2ckJkM3E5alhJZTQveWVtNElP?=
 =?utf-8?B?YmVSMGZsVjUyeGpwQm9KZjgyTUxnRFFLdytRUW9HRlRhTmNOWVdjQWRFNCs2?=
 =?utf-8?B?ejd0MVlsYWpnOE9oaXV2WitleFc3SHdyc3RLOG1tRlQvSWdlcG8xVTNtRHJl?=
 =?utf-8?B?bTdTQkpjVlIxMmhHMVNCOGh5Szl2MUJhTkNUSFFvRkpCQ1RMNFFFaFZuckRn?=
 =?utf-8?B?MXIyQTRlU2FLNnliUlBnajA3UkdMNTZkdGVoRXpvZldNazNvWklaZExISURP?=
 =?utf-8?B?Z2hGWHNBYk9lVjhxNlhISUhvMUczTlozdUI5MW9yN0NURDdZZGdpOVZ5MlZh?=
 =?utf-8?B?d3VnSEFZemVyQ3FzMFlxWE94WGVmN1dUOTlEYWZ2d2VFa3dDOUppSEVvd0RP?=
 =?utf-8?B?d3dyRmpJazlsN21JS3FUZkNHRDJFM0IzdWZkUkNxelZDcFAvNzVEQmgxb2Jh?=
 =?utf-8?B?ZWMrNFBzV0lia251bDdTS0hIVW9maFo2T0JVVjRzTTVjNHB0ZkhXRCtYUE5R?=
 =?utf-8?B?TWVKUFRLb0xqU2h1ckFob242WXlWOTlOeUhmUG9CMFgvSi9WNWI2K2ovc1Z6?=
 =?utf-8?B?SzNaWGMvelkyeWd1R2dPMkxzQnVrWG5LOU5waVdIWnNVM3gvN0pXZFRYTzcr?=
 =?utf-8?B?cHZGVDI2aWd3bityV1BDSFJHS1JHQndwdTY3WjVuMlJUalZ6UCswVFpHanF4?=
 =?utf-8?B?R0h3ZG9nalNzMnNVK3dTWTF1SE1RbjBJZXZlaDhZcUpUV1l0eUxlV1pZMGl5?=
 =?utf-8?B?cjM2bmtzTlVMWHk1QWtzTUxENzdSSUhBRDZ5Z3pnUktMNUtMME8zMmhKREYx?=
 =?utf-8?B?ejlqSkZqSlpVN3JYS0Z1S0luZmc3cHgxRzNLeG1mendIOWoxdW80SXF0dWpz?=
 =?utf-8?B?ZVJNSXo2WTNpZnBBMWNRcytLY1QxOXVVd2lWSnZ0WWFhb0VuMFFkVnNzR2hP?=
 =?utf-8?B?QzhNWjdEOXJjS2dnNk1neVBHRlFmOGM1TlRjaGpZMzBSMFVEdVRuMStONWJt?=
 =?utf-8?B?TGt1K3V1Z3NDeW1TdVNlbXBza3lmam1Rbmh3S0tvNmM1Q1JCOThQUEJmTDcx?=
 =?utf-8?B?dkxhUjVnajRkZlpmOFBnNDFpK0M3VC93ZHJIVGpvenljMG95NWtSdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E48691A769F2164AB2F1A38FC064B8BD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DUJzKbWZmZ17zCZYcWcIkLT9YK/546FFlo1Ojp4q/DN3M4m8T+PX8B2TIPVia5M8ioPCUBxWXsvojCcnwrOSps1FlAK35OBtfCt7nGBJLNKAYzsc63WMXkKvvLADPNq072NEgZJ1Z5CfH9AFUx3UJP1MGJdza89s0fgO8t8jE9Gdo1o/83KhdEK7/7Rarq/1rCOtGvHxsUvJn/XdOvAQYD7WJIo6BxADc0WKjHPDQIYmBFC51eGu6Bau/gBpNMTAbNztudb70M18+ISKywfRfV5truxLHyOqFb00YTY0UXUwqquLKzTtO5MsPPyyQSJ3GU1IZhqFUreao2aeB1zS65A1M6IUVFpiQ/+LmHbdTK+ieiRgyElqLqzBojBvYTI/BivYSNg5uJ+CsRIscz6b7bi9jKN7ilLu0uNievOgUbCx1tFcg9JMIrV1rXSCPd8qnJU1e1RMyLurPCXT+GLtqDYC4MOf2M1ta3ZufK1my//bX3xyO5qIBesd19WWVixP/8mnhBFcz8f6LsfMLngIDUVo9+ikjS1r4d3UORqpvMJDH1psj0Ksz8s5ZC5uhKgYrDiq9JGDmtmC9QdifpwNa8yFNh/x10fF9NZa7+KTzRsrhe4xwieh1Tn7O+NyFOQ45syOrR6HR/qYFdPy/if5zA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5979.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4713c52-f369-4449-807b-08de4f19818c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 00:53:29.9248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XCv9EFAi/7ROQnYnHOcw+t2AIE+zBmKfxmeEnsPJ+hVdAyR/f2EVj3FJKc2WhIBEygkQyeZlmnzDrr8Ka8pvaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF521FFE181
X-Proofpoint-ORIG-GUID: P80Xse_t_jDj-Fv4vXzun09demr3ekq2
X-Authority-Analysis: v=2.4 cv=ZY0Q98VA c=1 sm=1 tr=0 ts=6960518f cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8
 a=kJ0GZwQRLS11VHkYxW0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: P80Xse_t_jDj-Fv4vXzun09demr3ekq2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDAwNSBTYWx0ZWRfX22GRwnna2Oco
 7xnCzaZgekIVLU1ze4MyjfwKKFBeeUa4+wn4yeN/XlSVfTlE3TGe6G4L4zUWRnMu+WR4z0gQmt6
 3r1zwL8cK+kXA8LVMyBKRrl4coQk9DVqSnfuFcmrryOaXHu4GUuIOwaOMnnM23yPgoRSmxl1MRT
 XMN96eHpe9/KNUh3cgdNBXXiKixL9l4unD7g1atqkMadm12FE/+W+vhEnIYS234M0m3p/AE22Xh
 r8f5ILiSF8uw7umlBsvmKU1Nstzu0eFyIutPYW2PCoU+6Ho8ttD/W+vKA3mOODFJraxuJRLK9TU
 ASE/06LkzAK8DsbXMW8jPn2+y0EIDN0Wq3/dsL1axhyPGyZgj69oz8JB/mJsTEOtg1tkxJzSCkL
 0NBmUvqkMz9irDxwc3mwxpQAlM5t+hr50ggbC3cXl7ozElF5pJFfCtX/F0tvh1/BehmTq+Eu69F
 r0EhVHGbT1Q4Ms7sVjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_05,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601090005

T24gTW9uLCBKYW4gMDUsIDIwMjYsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBSZW1vdmUgZGVwLT5y
ZWdzIGZyb20gc3RydWN0IGR3YzNfZXAgYW5kIHJldXNlIGR3Yy0+cmVncyBpbnN0ZWFkLg0KPiBU
aHVzIGVsaW1pbmF0aW5nIHJlZHVuZGFudCBpb21lbSBhZGRyZXNzZXMgYW5kIG1ha2luZyByZWdp
c3Rlcg0KPiBhY2Nlc3MgbW9yZSBjb25zaXN0ZW50IGFjcm9zcyB0aGUgZHJpdmVyLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUHJhc2hhbnRoIEsgPHByYXNoYW50aC5rQG9zcy5xdWFsY29tbS5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggICAgfCAxMCArKysrLS0tLS0tDQo+
ICBkcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYyB8IDEyICsrKystLS0tLS0tLQ0KPiAgZHJpdmVy
cy91c2IvZHdjMy9nYWRnZXQuYyAgfCAxMiArKysrKystLS0tLS0NCj4gIGRyaXZlcnMvdXNiL2R3
YzMvZ2FkZ2V0LmggIHwgIDIgKy0NCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgMjEgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9j
b3JlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCBhNWZjOTJjNGZmYTMuLjIz
MTg4YjkxMDUyOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysr
IGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTE2NSwxMCArMTY1LDEwIEBADQo+ICAj
ZGVmaW5lIERXQzNfRENGRzEJCTB4Yzc0MCAvKiBEV0NfdXNiMzIgb25seSAqLw0KPiAgDQo+ICAj
ZGVmaW5lIERXQzNfREVQX0JBU0UobikJKDB4YzgwMCArICgobikgKiAweDEwKSkNCj4gLSNkZWZp
bmUgRFdDM19ERVBDTURQQVIyCQkweDAwDQo+IC0jZGVmaW5lIERXQzNfREVQQ01EUEFSMQkJMHgw
NA0KPiAtI2RlZmluZSBEV0MzX0RFUENNRFBBUjAJCTB4MDgNCj4gLSNkZWZpbmUgRFdDM19ERVBD
TUQJCTB4MGMNCj4gKyNkZWZpbmUgRFdDM19ERVBDTURQQVIyKG4pCShEV0MzX0RFUF9CQVNFKG4p
ICsgMHgwMCkNCj4gKyNkZWZpbmUgRFdDM19ERVBDTURQQVIxKG4pCShEV0MzX0RFUF9CQVNFKG4p
ICsgMHgwNCkNCj4gKyNkZWZpbmUgRFdDM19ERVBDTURQQVIwKG4pCShEV0MzX0RFUF9CQVNFKG4p
ICsgMHgwOCkNCj4gKyNkZWZpbmUgRFdDM19ERVBDTUQobikJCShEV0MzX0RFUF9CQVNFKG4pICsg
MHgwYykNCj4gIA0KPiAgI2RlZmluZSBEV0MzX0RFVl9JTU9EKG4pCSgweGNhMDAgKyAoKG4pICog
MHg0KSkNCj4gIA0KPiBAQCAtNzQ5LDggKzc0OSw2IEBAIHN0cnVjdCBkd2MzX2VwIHsNCj4gIAlz
dHJ1Y3QgbGlzdF9oZWFkCXBlbmRpbmdfbGlzdDsNCj4gIAlzdHJ1Y3QgbGlzdF9oZWFkCXN0YXJ0
ZWRfbGlzdDsNCj4gIA0KPiAtCXZvaWQgX19pb21lbQkJKnJlZ3M7DQo+IC0NCj4gIAlzdHJ1Y3Qg
ZHdjM190cmIJCSp0cmJfcG9vbDsNCj4gIAlkbWFfYWRkcl90CQl0cmJfcG9vbF9kbWE7DQo+ICAJ
c3RydWN0IGR3YzMJCSpkd2M7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2RlYnVn
ZnMuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jDQo+IGluZGV4IGQxOGJmNWUzMmNjOC4u
MGI0NWZmMTZmNTc1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYw0K
PiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYw0KPiBAQCAtMzYsMjMgKzM2LDE5IEBA
DQo+ICAjZGVmaW5lIGR1bXBfZXBfcmVnaXN0ZXJfc2V0KG4pCQkJXA0KPiAgCXsJCQkJCVwNCj4g
IAkJLm5hbWUgPSAiREVQQ01EUEFSMigiX19zdHJpbmdpZnkobikiKSIsCVwNCj4gLQkJLm9mZnNl
dCA9IERXQzNfREVQX0JBU0UobikgKwlcDQo+IC0JCQlEV0MzX0RFUENNRFBBUjIsCVwNCj4gKwkJ
Lm9mZnNldCA9IERXQzNfREVQQ01EUEFSMihuKSwJXA0KPiAgCX0sCQkJCQlcDQo+ICAJewkJCQkJ
XA0KPiAgCQkubmFtZSA9ICJERVBDTURQQVIxKCJfX3N0cmluZ2lmeShuKSIpIiwJXA0KPiAtCQku
b2Zmc2V0ID0gRFdDM19ERVBfQkFTRShuKSArCVwNCj4gLQkJCURXQzNfREVQQ01EUEFSMSwJXA0K
PiArCQkub2Zmc2V0ID0gRFdDM19ERVBDTURQQVIxKG4pLAlcDQo+ICAJfSwJCQkJCVwNCj4gIAl7
CQkJCQlcDQo+ICAJCS5uYW1lID0gIkRFUENNRFBBUjAoIl9fc3RyaW5naWZ5KG4pIikiLAlcDQo+
IC0JCS5vZmZzZXQgPSBEV0MzX0RFUF9CQVNFKG4pICsJXA0KPiAtCQkJRFdDM19ERVBDTURQQVIw
LAlcDQo+ICsJCS5vZmZzZXQgPSBEV0MzX0RFUENNRFBBUjAobiksCVwNCj4gIAl9LAkJCQkJXA0K
PiAgCXsJCQkJCVwNCj4gIAkJLm5hbWUgPSAiREVQQ01EKCJfX3N0cmluZ2lmeShuKSIpIiwJXA0K
PiAtCQkub2Zmc2V0ID0gRFdDM19ERVBfQkFTRShuKSArCVwNCj4gLQkJCURXQzNfREVQQ01ELAkJ
XA0KPiArCQkub2Zmc2V0ID0gRFdDM19ERVBDTUQobiksCQlcDQo+ICAJfQ0KPiAgDQo+ICANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2Mz
L2dhZGdldC5jDQo+IGluZGV4IGJjM2ZlMzE2MzhiOS4uZjA4NTYwYWYxNzAxIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMNCj4gQEAgLTMyMCw2ICszMjAsNyBAQCBpbnQgZHdjM19zZW5kX2dhZGdldF9lcF9j
bWQoc3RydWN0IGR3YzNfZXAgKmRlcCwgdW5zaWduZWQgaW50IGNtZCwNCj4gIA0KPiAgCWludAkJ
CWNtZF9zdGF0dXMgPSAwOw0KPiAgCWludAkJCXJldCA9IC1FSU5WQUw7DQo+ICsJdTgJCQllcG51
bSA9IGRlcC0+bnVtYmVyOw0KPiAgDQo+ICAJLyoNCj4gIAkgKiBXaGVuIG9wZXJhdGluZyBpbiBV
U0IgMi4wIHNwZWVkcyAoSFMvRlMpLCBpZiBHVVNCMlBIWUNGRy5FTkJMU0xQTSBvcg0KPiBAQCAt
MzU1LDkgKzM1Niw5IEBAIGludCBkd2MzX3NlbmRfZ2FkZ2V0X2VwX2NtZChzdHJ1Y3QgZHdjM19l
cCAqZGVwLCB1bnNpZ25lZCBpbnQgY21kLA0KPiAgCSAqIGltcHJvdmUgcGVyZm9ybWFuY2UuDQo+
ICAJICovDQo+ICAJaWYgKERXQzNfREVQQ01EX0NNRChjbWQpICE9IERXQzNfREVQQ01EX1VQREFU
RVRSQU5TRkVSKSB7DQo+IC0JCWR3YzNfd3JpdGVsKGRlcC0+cmVncywgRFdDM19ERVBDTURQQVIw
LCBwYXJhbXMtPnBhcmFtMCk7DQo+IC0JCWR3YzNfd3JpdGVsKGRlcC0+cmVncywgRFdDM19ERVBD
TURQQVIxLCBwYXJhbXMtPnBhcmFtMSk7DQo+IC0JCWR3YzNfd3JpdGVsKGRlcC0+cmVncywgRFdD
M19ERVBDTURQQVIyLCBwYXJhbXMtPnBhcmFtMik7DQo+ICsJCWR3YzNfd3JpdGVsKGR3Yy0+cmVn
cywgRFdDM19ERVBDTURQQVIwKGVwbnVtKSwgcGFyYW1zLT5wYXJhbTApOw0KPiArCQlkd2MzX3dy
aXRlbChkd2MtPnJlZ3MsIERXQzNfREVQQ01EUEFSMShlcG51bSksIHBhcmFtcy0+cGFyYW0xKTsN
Cj4gKwkJZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0RFUENNRFBBUjIoZXBudW0pLCBwYXJh
bXMtPnBhcmFtMik7DQo+ICAJfQ0KPiAgDQo+ICAJLyoNCj4gQEAgLTM4MSw3ICszODIsNyBAQCBp
bnQgZHdjM19zZW5kX2dhZGdldF9lcF9jbWQoc3RydWN0IGR3YzNfZXAgKmRlcCwgdW5zaWduZWQg
aW50IGNtZCwNCj4gIAllbHNlDQo+ICAJCWNtZCB8PSBEV0MzX0RFUENNRF9DTURBQ1Q7DQo+ICAN
Cj4gLQlkd2MzX3dyaXRlbChkZXAtPnJlZ3MsIERXQzNfREVQQ01ELCBjbWQpOw0KPiArCWR3YzNf
d3JpdGVsKGR3Yy0+cmVncywgRFdDM19ERVBDTUQoZXBudW0pLCBjbWQpOw0KPiAgDQo+ICAJaWYg
KCEoY21kICYgRFdDM19ERVBDTURfQ01EQUNUKSB8fA0KPiAgCQkoRFdDM19ERVBDTURfQ01EKGNt
ZCkgPT0gRFdDM19ERVBDTURfRU5EVFJBTlNGRVIgJiYNCj4gQEAgLTM5MSw3ICszOTIsNyBAQCBp
bnQgZHdjM19zZW5kX2dhZGdldF9lcF9jbWQoc3RydWN0IGR3YzNfZXAgKmRlcCwgdW5zaWduZWQg
aW50IGNtZCwNCj4gIAl9DQo+ICANCj4gIAlkbyB7DQo+IC0JCXJlZyA9IGR3YzNfcmVhZGwoZGVw
LT5yZWdzLCBEV0MzX0RFUENNRCk7DQo+ICsJCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBE
V0MzX0RFUENNRChlcG51bSkpOw0KPiAgCQlpZiAoIShyZWcgJiBEV0MzX0RFUENNRF9DTURBQ1Qp
KSB7DQo+ICAJCQljbWRfc3RhdHVzID0gRFdDM19ERVBDTURfU1RBVFVTKHJlZyk7DQo+ICANCj4g
QEAgLTMzODEsNyArMzM4Miw2IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfaW5pdF9lbmRwb2lu
dChzdHJ1Y3QgZHdjMyAqZHdjLCB1OCBlcG51bSkNCj4gIAlkZXAtPmR3YyA9IGR3YzsNCj4gIAlk
ZXAtPm51bWJlciA9IGVwbnVtOw0KPiAgCWRlcC0+ZGlyZWN0aW9uID0gZGlyZWN0aW9uOw0KPiAt
CWRlcC0+cmVncyA9IGR3Yy0+cmVncyArIERXQzNfREVQX0JBU0UoZXBudW0pOw0KPiAgCWR3Yy0+
ZXBzW2VwbnVtXSA9IGRlcDsNCj4gIAlkZXAtPmNvbWJvX251bSA9IDA7DQo+ICAJZGVwLT5zdGFy
dF9jbWRfc3RhdHVzID0gMDsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0
LmggYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5oDQo+IGluZGV4IGQ3M2U3MzVlNDA4MS4uYzNh
YTk2MzhiN2E1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5oDQo+ICsr
KyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmgNCj4gQEAgLTEzMiw3ICsxMzIsNyBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgZHdjM19nYWRnZXRfZXBfZ2V0X3RyYW5zZmVyX2luZGV4KHN0cnVjdCBk
d2MzX2VwICpkZXApDQo+ICB7DQo+ICAJdTMyCQkJcmVzX2lkOw0KPiAgDQo+IC0JcmVzX2lkID0g
ZHdjM19yZWFkbChkZXAtPnJlZ3MsIERXQzNfREVQQ01EKTsNCj4gKwlyZXNfaWQgPSBkd2MzX3Jl
YWRsKGRlcC0+ZHdjLT5yZWdzLCBEV0MzX0RFUENNRChkZXAtPm51bWJlcikpOw0KPiAgCWRlcC0+
cmVzb3VyY2VfaW5kZXggPSBEV0MzX0RFUENNRF9HRVRfUlNDX0lEWChyZXNfaWQpOw0KPiAgfQ0K
PiAgDQo+IC0tIA0KPiAyLjM0LjENCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5o
Lk5ndXllbkBzeW5vcHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5o

