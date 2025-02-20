Return-Path: <linux-usb+bounces-20893-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCE8A3E712
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 22:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1B31189DA7B
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 21:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4D8213E80;
	Thu, 20 Feb 2025 21:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="h6MFB8OI";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VJ9jdSej";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="r3OdWLyQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8E7214805
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 21:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740088620; cv=fail; b=VMpBmBy6gSyOtkoNl34LkzWfbLIH1VOc4sOjg+MmEz0Nl6cQvOpXQsYhCD+LlN2afjdzTWeUSI10gy8Ri1Oq2amsn6oqvZkcbNRLTESXAmV85+3pZEKARxyoH2DTNksSLNUDxCJVTeRG+/BEyc12bkkbfO+52vmFWNjMulF/NOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740088620; c=relaxed/simple;
	bh=d5PUZPz5tNncyLmcxFoZu+0iAfd+C1fCPsdO/hYKJHE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q4aIP6MeQl9FH31C4G3utva364E6IbXpLUrZx1rKYP1dsyc/cHnH20IKyQX8KRPcnQX0Cyqq5WdIcOHd1NHlQ0VemVdgdteFz/yVHLv1X7fZlNK8+D2pCFeXQ59hsjyCHWyD1SMW3E4+F1pIt2th2JCafKcsqiEH0kGH8RKZNF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=h6MFB8OI; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VJ9jdSej; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=r3OdWLyQ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KLeAe3007637;
	Thu, 20 Feb 2025 13:56:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=d5PUZPz5tNncyLmcxFoZu+0iAfd+C1fCPsdO/hYKJHE=; b=
	h6MFB8OI7fZ3mJUa72MjFSa3Ol2jCEvtb/01PxRMQWreeUiKZRDvF3q8ZS0lV0OS
	WSdGT1Sa2170BGywYt5hCsPCBsir7zplqH3Zy6Q8qkwMTdvJlnan8w86md6aA8xX
	cBVh37bdA/cdjzzG46r2Wnw3zBUkFfjA0yy8Nkvgu0qfVt/S1T0wKNPGllEA1kJG
	6vkDTECYbZTgBEJru4p/lVWwPnl1dSx5oGRPmmby/QJIujOsmMOZEmYkyKk+sR0f
	YPBIrgdleLRcbVi5EW2Bw68BAAlwlajghs/aCWLM9qni93CaBlfWE0OQ2G+vJg8r
	+YMj8qaevq16aHGQ8LkewA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 44w02uq3mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 13:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1740088611; bh=d5PUZPz5tNncyLmcxFoZu+0iAfd+C1fCPsdO/hYKJHE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VJ9jdSejg+KQ+RuCa2SYcwpYFTfT/v2okZ2GcRqFqvJf5gsAs60mvb7afWdRgmbTd
	 WpWfNpDbn1qJb+A0WqvgjZsEucOO32ZVhU6vCBTrmL4FoucX9ymjX+pdTXbaVYYZ1j
	 f6zVI2aTQXQAgdycWhZpd8yqKm+ASy5mJOmBzadEeB1d294EcgdbFpNj8xQwK0JUSn
	 M5EQN59DLim3rcuAtZ15tEsPOypHR32R65qHVaBKheC9i5tJZkC9xEQ9x0EYFK2PHe
	 SB8KRFAwAorrn9tSaVdDkQZxcNStCIYPRYpZGiqhz89nD5OFI9/TSNC5rwjGkZXy5U
	 V2aKbcD66rUPQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 36EA040226;
	Thu, 20 Feb 2025 21:56:51 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id ABF57A007A;
	Thu, 20 Feb 2025 21:56:50 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=r3OdWLyQ;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 22A6E40235;
	Thu, 20 Feb 2025 21:56:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhv+Oj1sirtpBFNYPMwKit3ihL30RdJOfie0K1thfxRmMICDkUl3TaQAD9Qpl6K4xDFRp5pck6P+niypGe+lxjiUKYWgiBM0oeYewyF2qInqYWv+RDjn1U1BgAr0CzkueOf2VM+Znt6QRiztGtYayS1wUe99Glkr2zayJStiH3U5xG+4FDm61kIjKKL/Sa+uQf1oUbmDwPSDap9TK1dtMzsyB/ssYGrCYW3RG8p9KWt8HMb3M17471EkjzwaTuRSiil+W4O6y3WFa06Emp+Eu1cVlIcnrz3bxG24oVb0Y8CElsOas4YwfLqz2H/IU2qFIk8GC2fUs/OtFo8yreDTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5PUZPz5tNncyLmcxFoZu+0iAfd+C1fCPsdO/hYKJHE=;
 b=WEcbrdploD9S28upeDFzIeXBJm4QFsqHo79sKrE+8ZX5c/YiSapC7F4rsttLs8DNovhjrVETVpJIgasNoLpX8KVMlAieQFpiWiHMKm0laz+PZxshmrVXL66Lg0AxJx/AnKDiV3+hh4dVW/pBxEczh50uXCXksYismbShCM2hJzBG5BfSFaIekYJxlS+iUju6NuXr21VYxsBwHXMLN45cYOLZGVyJk/oD6idqFaT1eegH+otMDMQy995ZSqDv7tVz12m0i6pymauB23KQOp+SwpRzpwaKCqgk5bxMqmAWwlaeu33Dkco+zcxsyB7swmbgLce3Nwo+wAE3juTjy0+htg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5PUZPz5tNncyLmcxFoZu+0iAfd+C1fCPsdO/hYKJHE=;
 b=r3OdWLyQVZi40Z+zaWIxsdeq4NlXXWBYL1JZax/LsGCCbR8JhDQrVawptSGFmMFaAidPIWGizTY7f9ML1mbkTPIQxb/Rg7VORhdPv6qJ5742ZSNdTxUbDCkcP6r13Jh+gLGkSehfqEoZSsCV9S7r/aJS4lG+ywSheLSltGNaFkY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB8972.namprd12.prod.outlook.com (2603:10b6:610:169::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 21:56:47 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.8466.013; Thu, 20 Feb 2025
 21:56:47 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Kannappan R
	<r.kannappan@intel.com>,
        Amardeep Rai <amardeep.rai@intel.com>
Subject: Re: [PATCH] USB: core: Add eUSB2 descriptor and parsing in USB core
Thread-Topic: [PATCH] USB: core: Add eUSB2 descriptor and parsing in USB core
Thread-Index: AQHbg6GanczywHH4y0yr9rIDc0ht37NQvVcA
Date: Thu, 20 Feb 2025 21:56:46 +0000
Message-ID: <20250220215632.iv2oym57nujqktwr@synopsys.com>
References: <20250220141339.1939448-1-mathias.nyman@linux.intel.com>
In-Reply-To: <20250220141339.1939448-1-mathias.nyman@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB8972:EE_
x-ms-office365-filtering-correlation-id: ab7832ae-cb88-49ff-a4e4-08dd51f978b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U1FQYjh2OUJ1cWd4aDREcTJnNlMrRXZGdlRpUXRCRnA3YXUrLys5QktRcWIz?=
 =?utf-8?B?VHhTVElRRXZDMDRvQU1BR3k2dUFKNTM1bGxvYnIySEM5ZjB6R0x2TTRrcXVX?=
 =?utf-8?B?bDQ5VFY5cUhFMkZVTGtpSmpMcTRHd1FDOWpqUDk0Smo4THdjSnZQbVZHTFFp?=
 =?utf-8?B?eHNFTnNWeHk1WlVVU3BzN3R5c3d4RitPZmpCTnhiNXMxalA5Tk15QkJCRm9K?=
 =?utf-8?B?NUZETmNpSHdHMy9ULzA5ZzZCRUk1SGZYbFFOUFpCengzRkNOWHo1ejZWTktZ?=
 =?utf-8?B?bnltbGFabHFJS25qQTRYK21DUlhLUEtrL0RWczl0T20zWHI3cTBRc0pIL0t6?=
 =?utf-8?B?UG91azd2ZWdaek1aTkVqckFwbTI4LzdxWEFQdXZHcXpYazF5dkdLbnhTWFZI?=
 =?utf-8?B?ZEtFN043aS9xc0ViSDBiL3N6V1lBSVBmejFLT29pUCt3VTQycndsSHgyS3I5?=
 =?utf-8?B?R3RtYzA2WW1SWkhpVnk1enZDTlNEbDNNZU1mdGJPdk1xcG1DbVYvN2YyRDhV?=
 =?utf-8?B?VytDUG1TZTY1WUV6dWtYL3k1eGxIbmdURUF6ZTFMWDRxOXdtVGw4eDI3T1ZK?=
 =?utf-8?B?RGo4RHNveGplTUhIeVlMWXFuVjNkeHlTOUNPeDREc1VDY0hFZnFoTXlHemFV?=
 =?utf-8?B?cVZuSHd2bDlsYkxoekJVYkFQdHBoQmdWNG9MNEl3N3N6ZnY2SFFZMzVwcGhC?=
 =?utf-8?B?TEx6VGZxMzNMOUR3bEV6UzNnMEZ2eEg0cFVxL1c2VkJER1lYcVk0WXBDZEJG?=
 =?utf-8?B?RG5aY2Z1WlpYejZpdkNxWVE0aDZIV3hpRDFtV3B2U3VJT3ZQVk9vYm5nclBH?=
 =?utf-8?B?M2w5d3NDNis5T3ZmYzVRSVQ4U2lVK3QyUkRXalZHTXJvNlBMd2tzYklqdnRY?=
 =?utf-8?B?eGZha0VpV3ltajJySFJUVzVpTjBNZmYrNi8zQXNpZThwZGtybm80QysrazJr?=
 =?utf-8?B?ZVlkdm1ac1NJVlhoTmx2OVlXbFF3UkNoZ2RUVVJBQ0ErSnlMU1EzcmxSdy9Z?=
 =?utf-8?B?TVlSSHRVMk5hWXV3bmVna2p2SmNteldYQmJ4enNjeWpENkRBYlpSN0pOYXJp?=
 =?utf-8?B?ZFJ4Ym1rZzE0USs2TmlJWStKbm4xT2tjZUxtSWlLYnQ1RGRqeGxCeFo0Q2VG?=
 =?utf-8?B?QksxbCtITmEvZlU5UlhmVmZvWUVxMnp0empQSjJrenE1NTl4UWVodFB0OWgw?=
 =?utf-8?B?S3pkUEI4RWlrRktLelBEOHJsbVgwaFR0U2dsdWJHTkZ6Y3lTaURqdkdEaEpa?=
 =?utf-8?B?QjZGRUp6TlEzZmFEVWlwS1V1ZjhzaXlYL1VNQWJFU0c1U1o4MGRuSHpUZzVl?=
 =?utf-8?B?b0Q4WmVPcGRiUmo3U3NHWW1WL0pmeTk4RFk4b1FCclBDald3QXFHRGl2aHJC?=
 =?utf-8?B?bjlFZ1h6RzlDNU5kNjRHVGJpT1ZSaFpMZTZ5RzV1SkV0RmliTGFpcXgzOEtL?=
 =?utf-8?B?Mm5qcE9TenFqSWR0SnQrSVA0M2R4Y0NuRDYvU1VMZ3QrYUFMSFVGbndpcXU4?=
 =?utf-8?B?YTNjWUZ1QmpYdlNHcmpoU3FaV3ptTnlva0xmKyt6VlgwemxyV24xMW54ckNt?=
 =?utf-8?B?aVl2RUswdFF0MlpQVncwUXR5SUJvUUs1d2ZhYk9Pb0kySDlqd1kyT1A5VjZh?=
 =?utf-8?B?QXlseFFVSzJLVmFMeXhueXNadVhIZ3VmUnhBczhyMEhsZ211d2J4MEdpZldW?=
 =?utf-8?B?L2poQTNCbzFsYlFGSkRSZGxlREFVVDA2YmxWMHE5Z3k3ckRIZW1pMmRLTVBl?=
 =?utf-8?B?WkxNYU1YaXk5OEMwZ3kra1hNUzh1WlNqVkJhYU9Dc1ErdkVCZ0U3UzZuWEpD?=
 =?utf-8?B?K3Bmc0srTFlNYkpEZlNsb3JIVHFwTXRKakpLeDNQcEo0Tk5QWGx1TkkvYVox?=
 =?utf-8?B?QW1wMHlPK2hwNDRZNVViVHY2cFE3bldnRmtQWFEyRkJ2OUN4UmFTbHBDdSt0?=
 =?utf-8?Q?vwfUDt0m6Hd4I5BCPIMaxbi3YUUVND+l?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGdJUGVqekY4N1ZhY09QZFZPd1dtZFFLSHhjZTFrNDZ6RWhKd21ISGlIWjJ4?=
 =?utf-8?B?K3hiQnUyQzdiSTduV3cwbVpJUWFkRnhiOUpEWDBpM09NanE5dXBSbzhIdkh0?=
 =?utf-8?B?dmFtd0lxTVpMVWtoMlpmbm5lRFRMTU1ES0pwVCtVMlpzZTN3R2t2TTlHR0xX?=
 =?utf-8?B?a0hUY1F1cWk0NGZLVmlEVk13T3BteTBaYk5TVFR0QVZ4Q29vZk52NUVRakRs?=
 =?utf-8?B?MmtNaDYxZDhiSThCdnJ3N0E2VUljbS9OcGY3MVlSeldSbVhxcFJvSTg3SFUy?=
 =?utf-8?B?MG5saGNRR3NGUHhPY0dRRjh4RUhsWkRacCtNb1ZIM3lKb0VuRE82SDI1YVV0?=
 =?utf-8?B?V0txWlJ3aDc2dWdBb0dlQ3BLOTlZb3pHcTBqRHp4a09mVmtTNC85MUQ0cDV5?=
 =?utf-8?B?eTZFYTZTMzVOMit1TWpRSTRPdjJUZDZLRnBPb3dUSER3akc1WXRwQ25vd2lC?=
 =?utf-8?B?QmVOZUE2cGpMK05rY1RTdFltZmdETzQ3QTZXa243aTBZdlZlVXVrZWN4aDJ4?=
 =?utf-8?B?WnV2ZzNUUnZzVVh5TmxMcGFWMTdEVzJKMG5XaWJSYXA3bVlqNnUvMmxCK25k?=
 =?utf-8?B?S2xTb0hWNnVIdmRRTUFvSTdQM3hMUGY0cTd2VjMrb1ZnbVFKcklhRmpoUytS?=
 =?utf-8?B?UXlMVmhhMmMxek5NOWJnUmFlQWRmYVJCYkJWaW1pMkczUjZHRW9lQUZ2R3RL?=
 =?utf-8?B?UEx1QVIwTkhYVkV0bU9xRDVXS2FvOVNPSDh6d2QvTHFHY1lGWEZTUFhxOGZk?=
 =?utf-8?B?SFVkbkQzMjN5R3pNYVV5YzhQYjV2eTlpc2FPWjh0YU5RN053ZlFIVHcyelJG?=
 =?utf-8?B?UmdoVmp5dG04U01BOHIzckhHM2hmM3JhNStYTTJTR3FHU0lIU05Oc1EvblYz?=
 =?utf-8?B?RjV1SWlvcnVxemFTL3ROUjd1aU1pVVc3c2N1cWlYUkVFODdkZ2tqWCt6ZTM2?=
 =?utf-8?B?dlMxeFhCVmJlc3M0MllKMlpXK2JEK0F0TVN2VE81MkIyOEUwSGZNeSsrL0FB?=
 =?utf-8?B?QWVWUW00Q1RoOFMzODhNOE5JRU55d1VUQzZJeTZFTTNPSXdnOTRKeHord1gx?=
 =?utf-8?B?YmhMSzdPS29zN3FiL1FkV0NrQTRVd0Q4S0pyZlBIUFp5Qmk5T0hzbk1HRzJl?=
 =?utf-8?B?MnRPK3QyVnZQTXM5MEZYRzYxSzgySC9xR0hpQllUNzB4KzIzNkM3YWtDb1BY?=
 =?utf-8?B?THUxejdrQk95cGdMa3ZJYjVTUlJ4andKUDNUMUtDU0NuNFNxVlN0VnN5S05z?=
 =?utf-8?B?S095UTVlMlNuR1hPaG5ITE0vZFRBWXk1U0QvWkljWjN1Ulpha0JEOTB6cW1U?=
 =?utf-8?B?MXA5WEVzWjRWQjhMWjQzaTk5MEdCSnRaZ1dIalo1QjVJSTZ2ODJReTY1WWl6?=
 =?utf-8?B?NUJYTzk0VW1qamdLeU1rUmZUZDFxUVFIZk5ka1Fna0tKYmZuc1d6Y3BsR3l4?=
 =?utf-8?B?aHdVVnlPZHlrLzRkcExVQmdsNGt1SGRrK01wSDFFeXVHOHJHMy9ZRkRpbWtK?=
 =?utf-8?B?b0krK3U1NHlGaCtReW1zaWJHekpwODNsbjBlbjRrWWFlVFI2eEZ1cFNhc25i?=
 =?utf-8?B?UVRMRDd4d2V1ZTl6c0ExM2hIUHJSbUZsQU5wMjRleTFQQjl2Z2dJUk80L0xT?=
 =?utf-8?B?bVV4TEthZlNNRHJHb0UrSWRwT0JUVmRSWXZuOEdtWkpSOUN5U3RvSXhnQk5D?=
 =?utf-8?B?ZjJ4QnBKY29UdGo0bEJxaEc5Yk1hRjcwVDJreU5zSmpENnh3dmZKdHFhKzRE?=
 =?utf-8?B?MWk3UURIYlBwM05qL3RaaVdSRzR2RTJoMVpuTFZWM0EvTHhiVHBtL2JRV3RZ?=
 =?utf-8?B?aVd3NkZqWUR0QkFINEtIcE9MemZzVUlYRjJaNm9QdGozQndqV2dYeUFtZWxx?=
 =?utf-8?B?WEV5eDZOMDlEQjZPNnR0STJzOE5odlRKTHBtSVhaMlhZQndITHhRSzRLbzJ2?=
 =?utf-8?B?aUxxZzRIMnhkY1AwSlF4VUtNczBna0szN2ZjU2EycERUSDFSWjM4dFMxbVdY?=
 =?utf-8?B?NXBOZjZWK1o2SlNIUW5DNk0venhOenFnYXljRkRjVUQzTmhDUTUxSFBvOTBX?=
 =?utf-8?B?L1VMWGJKTHhFNzM4dGl1OHB6eUVnQ3hYWFdpQmlYZjljdS85dHRPMnVESk43?=
 =?utf-8?Q?9rWa/waBbKF/R/xq/9XjnN69G?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <16A64F1467BEB54BB9C6CF99FFDDCA36@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lRQ3iA7OumfJweTwtoz3l5I3aQfyToIkKEkfj7sFZezOuNPOfo0bQDyHB6QPnuNxI8K8s6ba4LsjqH71gt0CsLfc7WFZ2YmrAguvTxIdGL8d2eocd+G/+MxXxV7o+nmKRMOoVzY/rkUhKu7Xoifiwmkmw3tugfkD7tBhavwjFZ8DG9DXrCwzyk6rTGOHVPCi8n6ol7nk8GzrFbvyQvWjDzxmQZYnPy1cctVAewhOkOt9Y7DBgHhVDNNpujvoGHAFi7mTbjMgPS9vIhURWNvEk+rR2QNdd1dVu/+VXof9it9MnJOcLv2yzZlNue5AqoOvC5eWo0vt/u5/mHW9j1grTcIfB5dMmCYA/cvIUafx3Equ5kbIXrS+aEloWf/wWDzciqu0xauYCRZhATvQhEqQ1ASs2f1BjzIgYGV6eOBWOHBq9X7ijhdK6e363v/pnRUGWrJ524aO8tZv7USjUyiW7gen70kp0nmD5mZBtxuZdwBbz4SeuArcbfeSRm3dNFNSPbinb5pegeMOfYbt357PpkVMJfhTw3Zi4UxNi6jHIdb/kS6Rv++iUgfrpXoRSZb/roya/VlMe19e0MRFDz6xU/8FzrJiqz3VopvV+LooVvgKxK4XUMunwIMFDilLJoZKDVBTeaGqOK26m5ZBe3RnjA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7832ae-cb88-49ff-a4e4-08dd51f978b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 21:56:46.9498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x38h45P86CHzbwj+jQRUcgYnnX4nazLPc9TkDDAU9H/rK+AqRgtPIamm8Qr+sihVeGxxVJ+0dT5t1ylqkkFjEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8972
X-Proofpoint-ORIG-GUID: tSeeXgrYG-vSPrnTxhg0rKj42QgoqnhG
X-Authority-Analysis: v=2.4 cv=f+2yBPyM c=1 sm=1 tr=0 ts=67b7a524 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=T2h4t0Lz3GQA:10 a=qPHU084jO2kA:10 a=QyXUC8HyAAAA:8 a=rk8hPeQNVOR28kBIlxAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: tSeeXgrYG-vSPrnTxhg0rKj42QgoqnhG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502200146

SGksDQoNCk9uIFRodSwgRmViIDIwLCAyMDI1LCBNYXRoaWFzIE55bWFuIHdyb3RlOg0KPiBGcm9t
OiBLYW5uYXBwYW4gUiA8ci5rYW5uYXBwYW5AaW50ZWwuY29tPg0KPiANCj4gQWRkIHN1cHBvcnQg
Zm9yIHRoZSAnZVVTQjIgSXNvY2hyb25vdXMgRW5kcG9pbnQgQ29tcGFuaW9uIERlc2NyaXB0b3In
DQo+IGludHJvZHVjZWQgaW4gdGhlIHJlY2VudCBVU0IgMi4wIHNwZWNpZmljYXRpb24gJ1VTQiAy
LjAgRG91YmxlIElzb2Nocm9ub3VzDQo+IElOIEJhbmR3aWR0aCcgRUNOLg0KPiANCj4gSXQgYWxs
b3dzIGVtYmVkZGVkIFVTQjIgKGVVU0IyKSBkZXZpY2VzIHRvIHJlcG9ydCBhbmQgdXNlIGhpZ2hl
ciBiYW5kd2lkdGhzDQo+IGZvciBpc29jaHJvbm91cyBJTiB0cmFuc2ZlcnMgaW4gb3JkZXIgdG8g
c3VwcG9ydCBoaWdoZXIgY2FtZXJhIHJlc29sdXRpb25zDQo+IG9uIHRoZSBsaWQgb2YgbGFwdG9w
cyBhbmQgdGFibGV0cyB3aXRoIG1pbmltYWwgY2hhbmdlIHRvIHRoZSBVU0IyIHByb3RvY29sLg0K
PiANCj4gVGhlIG1vdGl2YXRpb24gZm9yIGV4cGFuZGluZyBVU0IgMi4wIGlzIGZ1cnRoZXIgY2xh
cmlmaWVkIGluIGFuIGFkZGl0aW9uYWwNCj4gRW1iZWRkZWQgVVNCMiB2ZXJzaW9uIDIuMCAoZVVT
QjJ2Mikgc3VwcGxlbWVudCB0byB0aGUgVVNCIDIuMA0KPiBzcGVjaWZpY2F0aW9uLiBJdCBwb2lu
dHMgb3V0IHRoaXMgaXMgb3B0aW1pemVkIGZvciBwZXJmb3JtYW5jZSwgcG93ZXIgYW5kDQo+IGNv
c3QgYnkgdXNpbmcgdGhlIFVTQiAyLjAgbG93LXZvbHRhZ2UsIHBvd2VyIGVmZmljaWVudCBQSFkg
YW5kIGhhbGYtZHVwbGV4DQo+IGxpbmsgZm9yIHRoZSBhc3ltbWV0cmljIGNhbWVyYSBiYW5kd2lk
dGggbmVlZHMsIGF2b2lkaW5nIHRoZSBjb3N0bHkgYW5kDQo+IGNvbXBsZXggZnVsbC1kdXBsZXgg
VVNCIDMueCBzeW1tZXRyaWMgbGluayBhbmQgZ2lnYWJpdCByZWNlaXZlcnMuDQo+IA0KPiBlVVNC
MiBkZXZpY2VzIHRoYXQgc3VwcG9ydCB0aGUgaGlnaGVyIGlzb2Nocm9ub3VzIElOIGJhbmR3aWR0
aCBhbmQgdGhlIG5ldw0KPiBkZXNjcmlwdG9yIGNhbiBiZSBpZGVudGlmaWVkIGJ5IHRoZWlyIGRl
dmljZSBkZXNjcmlwdG9yIGJjZFVTQiB2YWx1ZSBvZg0KPiAweDAyMjANCg0KSXNuJ3QgZVVTQjJ2
MiBoYXMgYmNkVVNCIHZhbHVlIG9mIDB4MDIzMD8NCg0KPiANCj4gQ28tZGV2ZWxvcGVkLWJ5OiBB
bWFyZGVlcCBSYWkgPGFtYXJkZWVwLnJhaUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFt
YXJkZWVwIFJhaSA8YW1hcmRlZXAucmFpQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogS2Fu
bmFwcGFuIFIgPHIua2FubmFwcGFuQGludGVsLmNvbT4NCj4gQ28tZGV2ZWxvcGVkLWJ5OiBNYXRo
aWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxpbnV4LmludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogTWF0aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy91c2IvY29yZS9jb25maWcuYyAgICB8IDUxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLQ0KPiAgaW5jbHVkZS9saW51eC91c2IuaCAgICAgICAgICB8ICA4ICsr
Ky0tLQ0KPiAgaW5jbHVkZS91YXBpL2xpbnV4L3VzYi9jaDkuaCB8IDE1ICsrKysrKysrKysrDQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY29yZS9jb25maWcuYyBiL2RyaXZlcnMvdXNiL2Nv
cmUvY29uZmlnLmMNCj4gaW5kZXggZjdiZjhkMWRlM2FkLi4xM2JkNGVjNGVhNWYgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2NvcmUvY29uZmlnLmMNCj4gKysrIGIvZHJpdmVycy91c2IvY29y
ZS9jb25maWcuYw0KPiBAQCAtNjQsNiArNjQsMzcgQEAgc3RhdGljIHZvaWQgdXNiX3BhcnNlX3Nz
cF9pc29jX2VuZHBvaW50X2NvbXBhbmlvbihzdHJ1Y3QgZGV2aWNlICpkZGV2LA0KPiAgCW1lbWNw
eSgmZXAtPnNzcF9pc29jX2VwX2NvbXAsIGRlc2MsIFVTQl9EVF9TU1BfSVNPQ19FUF9DT01QX1NJ
WkUpOw0KPiAgfQ0KPiAgDQo+ICtzdGF0aWMgdm9pZCB1c2JfcGFyc2VfZXVzYjJfaXNvY19lbmRw
b2ludF9jb21wYW5pb24oc3RydWN0IGRldmljZSAqZGRldiwNCj4gKwkJaW50IGNmZ25vLCBpbnQg
aW51bSwgaW50IGFzbnVtLCBzdHJ1Y3QgdXNiX2hvc3RfZW5kcG9pbnQgKmVwLA0KPiArCQl1bnNp
Z25lZCBjaGFyICpidWZmZXIsIGludCBzaXplKQ0KPiArew0KPiArCXN0cnVjdCB1c2JfZXVzYjJf
aXNvY19lcF9jb21wX2Rlc2NyaXB0b3IgKmRlc2M7DQo+ICsJc3RydWN0IHVzYl9kZXNjcmlwdG9y
X2hlYWRlciAqaDsNCj4gKw0KPiArCS8qDQo+ICsJICogZVVTQjIgaXNvY2hyb25vdXMgZW5kcG9p
bnQgY29tcGFuaW9uIGRlc2NyaXB0b3IgZm9yIHRoaXMgZW5kcG9pbnQNCj4gKwkgKiBzaGFsbCBi
ZSBkZWNsYXJlZCBiZWZvcmUgdGhlIG5leHQgZW5kcG9pbnQgb3IgaW50ZXJmYWNlIGRlc2NyaXB0
b3INCj4gKwkgKi8NCj4gKwl3aGlsZSAoc2l6ZSA+PSBVU0JfRFRfRVVTQjJfSVNPQ19FUF9DT01Q
X1NJWkUpIHsNCj4gKwkJaCA9IChzdHJ1Y3QgdXNiX2Rlc2NyaXB0b3JfaGVhZGVyICopYnVmZmVy
Ow0KPiArDQo+ICsJCWlmIChoLT5iRGVzY3JpcHRvclR5cGUgPT0gVVNCX0RUX0VVU0IyX0lTT0Nf
RU5EUE9JTlRfQ09NUCkgew0KPiArCQkJZGVzYyA9IChzdHJ1Y3QgdXNiX2V1c2IyX2lzb2NfZXBf
Y29tcF9kZXNjcmlwdG9yICopYnVmZmVyOw0KPiArCQkJZXAtPmV1c2IyX2lzb2NfZXBfY29tcCA9
ICpkZXNjOw0KPiArCQkJcmV0dXJuOw0KPiArCQl9DQo+ICsJCWlmIChoLT5iRGVzY3JpcHRvclR5
cGUgPT0gVVNCX0RUX0VORFBPSU5UIHx8DQo+ICsJCSAgICBoLT5iRGVzY3JpcHRvclR5cGUgPT0g
VVNCX0RUX0lOVEVSRkFDRSkNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWJ1ZmZlciArPSBoLT5i
TGVuZ3RoOw0KPiArCQlzaXplIC09IGgtPmJMZW5ndGg7DQo+ICsJfQ0KPiArDQo+ICsJZGV2X25v
dGljZShkZGV2LCAiTm8gZVVTQjIgaXNvYyBlcCAlZCBjb21wYW5pb24gZm9yIGNvbmZpZyAlZCBp
bnRlcmZhY2UgJWQgYWx0c2V0dGluZyAlZFxuIiwNCj4gKwkJICAgZXAtPmRlc2MuYkVuZHBvaW50
QWRkcmVzcywgY2Znbm8sIGludW0sIGFzbnVtKTsNCg0KU2luY2UgZVVTQjJ2MiBkZXZpY2VzIHNo
b3VsZCBhbHNvIGluY2x1ZGUgYXQgbGVhc3QgYW4gYWx0ZXJuYXRlDQppbnRlcmZhY2Ugd2l0aCBp
c29jIGVuZHBvaW50IGRlc2NyaXB0b3JzIHVzaW5nIGxlZ2FjeSBzZXR0aW5ncywgZG9lcyB0aGUN
CnNwZWMgcmVxdWlyZSB0aG9zZSBsZWdhY3kgYWx0ZXJuYXRlIGludGVyZmFjZXMgdG8gYWxzbyBo
YXZlIHRoaXMgaXNvYw0KY29tcGFuaW9uIGRlc2NyaXB0b3I/DQoNCj4gK30NCj4gKw0KPiAgc3Rh
dGljIHZvaWQgdXNiX3BhcnNlX3NzX2VuZHBvaW50X2NvbXBhbmlvbihzdHJ1Y3QgZGV2aWNlICpk
ZGV2LCBpbnQgY2Znbm8sDQo+ICAJCWludCBpbnVtLCBpbnQgYXNudW0sIHN0cnVjdCB1c2JfaG9z
dF9lbmRwb2ludCAqZXAsDQo+ICAJCXVuc2lnbmVkIGNoYXIgKmJ1ZmZlciwgaW50IHNpemUpDQo+
IEBAIC0yNTgsOCArMjg5LDEwIEBAIHN0YXRpYyBpbnQgdXNiX3BhcnNlX2VuZHBvaW50KHN0cnVj
dCBkZXZpY2UgKmRkZXYsIGludCBjZmdubywNCj4gIAlpbnQgbiwgaSwgaiwgcmV0dmFsOw0KPiAg
CXVuc2lnbmVkIGludCBtYXhwOw0KPiAgCWNvbnN0IHVuc2lnbmVkIHNob3J0ICptYXhwYWNrZXRf
bWF4ZXM7DQo+ICsJdTE2IGJjZFVTQjsNCj4gIA0KPiAgCWQgPSAoc3RydWN0IHVzYl9lbmRwb2lu
dF9kZXNjcmlwdG9yICopIGJ1ZmZlcjsNCj4gKwliY2RVU0IgPSBsZTE2X3RvX2NwdSh1ZGV2LT5k
ZXNjcmlwdG9yLmJjZFVTQik7DQo+ICAJYnVmZmVyICs9IGQtPmJMZW5ndGg7DQo+ICAJc2l6ZSAt
PSBkLT5iTGVuZ3RoOw0KPiAgDQo+IEBAIC00MDksMTUgKzQ0MiwxNyBAQCBzdGF0aWMgaW50IHVz
Yl9wYXJzZV9lbmRwb2ludChzdHJ1Y3QgZGV2aWNlICpkZGV2LCBpbnQgY2Znbm8sDQo+ICANCj4g
IAkvKg0KPiAgCSAqIFZhbGlkYXRlIHRoZSB3TWF4UGFja2V0U2l6ZSBmaWVsZC4NCj4gLQkgKiBT
b21lIGRldmljZXMgaGF2ZSBpc29jaHJvbm91cyBlbmRwb2ludHMgaW4gYWx0c2V0dGluZyAwOw0K
PiAtCSAqIHRoZSBVU0ItMiBzcGVjIHJlcXVpcmVzIHN1Y2ggZW5kcG9pbnRzIHRvIGhhdmUgd01h
eFBhY2tldFNpemUgPSAwDQo+IC0JICogKHNlZSB0aGUgZW5kIG9mIHNlY3Rpb24gNS42LjMpLCBz
byBkb24ndCB3YXJuIGFib3V0IHRoZW0uDQo+ICsJICogZVVTQjIgZGV2aWNlcyAoc2VlIFVTQiAy
LjAgRG91YmxlIElzb2Nocm9ub3VzIElOIEVDTiA5LjYuNiBFbmRwb2ludCkNCj4gKwkgKiBhbmQg
ZGV2aWNlcyB3aXRoIGlzb2Nocm9ub3VzIGVuZHBvaW50cyBpbiBhbHRzZXR0aW5nIDAgKHNlZSBV
U0IgMi4wDQo+ICsJICogZW5kIG9mIHNlY3Rpb24gNS42LjMpIGhhdmUgd01heFBhY2tldFNpemUg
PSAwLg0KPiArCSAqIFNvIGRvbid0IHdhcm4gYWJvdXQgdGhvc2UuDQo+ICAJICovDQo+ICAJbWF4
cCA9IGxlMTZfdG9fY3B1KGVuZHBvaW50LT5kZXNjLndNYXhQYWNrZXRTaXplKTsNCj4gLQlpZiAo
bWF4cCA9PSAwICYmICEodXNiX2VuZHBvaW50X3hmZXJfaXNvYyhkKSAmJiBhc251bSA9PSAwKSkg
ew0KPiArDQo+ICsJaWYgKG1heHAgPT0gMCAmJiBiY2RVU0IgIT0gMHgwMjIwICYmDQo+ICsJICAg
ICEodXNiX2VuZHBvaW50X3hmZXJfaXNvYyhkKSAmJiBhc251bSA9PSAwKSkNCj4gIAkJZGV2X25v
dGljZShkZGV2LCAiY29uZmlnICVkIGludGVyZmFjZSAlZCBhbHRzZXR0aW5nICVkIGVuZHBvaW50
IDB4JVggaGFzIGludmFsaWQgd01heFBhY2tldFNpemUgMFxuIiwNCj4gIAkJICAgIGNmZ25vLCBp
bnVtLCBhc251bSwgZC0+YkVuZHBvaW50QWRkcmVzcyk7DQo+IC0JfQ0KPiAgDQo+ICAJLyogRmlu
ZCB0aGUgaGlnaGVzdCBsZWdhbCBtYXhwYWNrZXQgc2l6ZSBmb3IgdGhpcyBlbmRwb2ludCAqLw0K
PiAgCWkgPSAwOwkJLyogYWRkaXRpb25hbCB0cmFuc2FjdGlvbnMgcGVyIG1pY3JvZnJhbWUgKi8N
Cj4gQEAgLTQ2NSw2ICs1MDAsMTIgQEAgc3RhdGljIGludCB1c2JfcGFyc2VfZW5kcG9pbnQoc3Ry
dWN0IGRldmljZSAqZGRldiwgaW50IGNmZ25vLA0KPiAgCQkJCW1heHApOw0KPiAgCX0NCj4gIA0K
PiArCS8qIFBhcnNlIGEgcG9zc2libGUgZVVTQjIgcGVyaW9kaWMgZW5kcG9pbnQgY29tcGFuaW9u
IGRlc2NyaXB0b3IgKi8NCj4gKwlpZiAoYmNkVVNCID09IDB4MDIyMCAmJiBkLT53TWF4UGFja2V0
U2l6ZSA9PSAwICYmDQo+ICsJICAgICh1c2JfZW5kcG9pbnRfeGZlcl9pc29jKGQpIHx8IHVzYl9l
bmRwb2ludF94ZmVyX2ludChkKSkpDQoNCldoeSBhcmUgd2UgY2hlY2tpbmcgZm9yIGludGVycnVw
dCBlbmRwb2ludCB0byBwYXJzZSBmb3IgaXNvYz8NCg0KPiArCQl1c2JfcGFyc2VfZXVzYjJfaXNv
Y19lbmRwb2ludF9jb21wYW5pb24oZGRldiwgY2Znbm8sIGludW0sIGFzbnVtLA0KPiArCQkJCQkJ
CWVuZHBvaW50LCBidWZmZXIsIHNpemUpOw0KPiArDQo+ICAJLyogUGFyc2UgYSBwb3NzaWJsZSBT
dXBlclNwZWVkIGVuZHBvaW50IGNvbXBhbmlvbiBkZXNjcmlwdG9yICovDQo+ICAJaWYgKHVkZXYt
PnNwZWVkID49IFVTQl9TUEVFRF9TVVBFUikNCj4gIAkJdXNiX3BhcnNlX3NzX2VuZHBvaW50X2Nv
bXBhbmlvbihkZGV2LCBjZmdubywNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvdXNiLmgg
Yi9pbmNsdWRlL2xpbnV4L3VzYi5oDQo+IGluZGV4IGNmYTgwMDVlMjRmOS4uYjQ2NzM4NzAxZjhk
IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3VzYi5oDQo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvdXNiLmgNCj4gQEAgLTUxLDYgKzUxLDcgQEAgc3RydWN0IGVwX2RldmljZTsNCj4gICAqIEBk
ZXNjOiBkZXNjcmlwdG9yIGZvciB0aGlzIGVuZHBvaW50LCB3TWF4UGFja2V0U2l6ZSBpbiBuYXRp
dmUgYnl0ZW9yZGVyDQo+ICAgKiBAc3NfZXBfY29tcDogU3VwZXJTcGVlZCBjb21wYW5pb24gZGVz
Y3JpcHRvciBmb3IgdGhpcyBlbmRwb2ludA0KPiAgICogQHNzcF9pc29jX2VwX2NvbXA6IFN1cGVy
U3BlZWRQbHVzIGlzb2MgY29tcGFuaW9uIGRlc2NyaXB0b3IgZm9yIHRoaXMgZW5kcG9pbnQNCj4g
KyAqIEBldXNiMl9pc29jX2VwX2NvbXA6IGVVU0IyIGlzb2MgY29tcGFuaW9uIGRlc2NyaXB0b3Ig
Zm9yIHRoaXMgZW5kcG9pbnQNCj4gICAqIEB1cmJfbGlzdDogdXJicyBxdWV1ZWQgdG8gdGhpcyBl
bmRwb2ludDsgbWFpbnRhaW5lZCBieSB1c2Jjb3JlDQo+ICAgKiBAaGNwcml2OiBmb3IgdXNlIGJ5
IEhDRDsgdHlwaWNhbGx5IGhvbGRzIGhhcmR3YXJlIGRtYSBxdWV1ZSBoZWFkIChRSCkNCj4gICAq
CXdpdGggb25lIG9yIG1vcmUgdHJhbnNmZXIgZGVzY3JpcHRvcnMgKFREcykgcGVyIHVyYg0KPiBA
QCAtNjQsOSArNjUsMTAgQEAgc3RydWN0IGVwX2RldmljZTsNCj4gICAqIGRlc2NyaXB0b3Igd2l0
aGluIGFuIGFjdGl2ZSBpbnRlcmZhY2UgaW4gYSBnaXZlbiBVU0IgY29uZmlndXJhdGlvbi4NCj4g
ICAqLw0KPiAgc3RydWN0IHVzYl9ob3N0X2VuZHBvaW50IHsNCj4gLQlzdHJ1Y3QgdXNiX2VuZHBv
aW50X2Rlc2NyaXB0b3IJCWRlc2M7DQo+IC0Jc3RydWN0IHVzYl9zc19lcF9jb21wX2Rlc2NyaXB0
b3IJc3NfZXBfY29tcDsNCj4gLQlzdHJ1Y3QgdXNiX3NzcF9pc29jX2VwX2NvbXBfZGVzY3JpcHRv
cglzc3BfaXNvY19lcF9jb21wOw0KPiArCXN0cnVjdCB1c2JfZW5kcG9pbnRfZGVzY3JpcHRvcgkJ
CWRlc2M7DQo+ICsJc3RydWN0IHVzYl9zc19lcF9jb21wX2Rlc2NyaXB0b3IJCXNzX2VwX2NvbXA7
DQo+ICsJc3RydWN0IHVzYl9zc3BfaXNvY19lcF9jb21wX2Rlc2NyaXB0b3IJCXNzcF9pc29jX2Vw
X2NvbXA7DQo+ICsJc3RydWN0IHVzYl9ldXNiMl9pc29jX2VwX2NvbXBfZGVzY3JpcHRvcglldXNi
Ml9pc29jX2VwX2NvbXA7DQo+ICAJc3RydWN0IGxpc3RfaGVhZAkJdXJiX2xpc3Q7DQo+ICAJdm9p
ZAkJCQkqaGNwcml2Ow0KPiAgCXN0cnVjdCBlcF9kZXZpY2UJCSplcF9kZXY7CS8qIEZvciBzeXNm
cyBpbmZvICovDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdXNiL2NoOS5oIGIv
aW5jbHVkZS91YXBpL2xpbnV4L3VzYi9jaDkuaA0KPiBpbmRleCA5MWYwZjdlMjE0YTUuLjQ3NWFm
OTM1ODE3MyAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3VzYi9jaDkuaA0KPiAr
KysgYi9pbmNsdWRlL3VhcGkvbGludXgvdXNiL2NoOS5oDQo+IEBAIC0yNTMsNiArMjUzLDkgQEAg
c3RydWN0IHVzYl9jdHJscmVxdWVzdCB7DQo+ICAjZGVmaW5lIFVTQl9EVF9CT1MJCQkweDBmDQo+
ICAjZGVmaW5lIFVTQl9EVF9ERVZJQ0VfQ0FQQUJJTElUWQkweDEwDQo+ICAjZGVmaW5lIFVTQl9E
VF9XSVJFTEVTU19FTkRQT0lOVF9DT01QCTB4MTENCj4gKy8qIEZyb20gdGhlIGVVU0IyIHNwZWMg
Ki8NCj4gKyNkZWZpbmUgVVNCX0RUX0VVU0IyX0lTT0NfRU5EUE9JTlRfQ09NUAkweDEyDQo+ICsv
KiBGcm9tIFdpcmVsZXNzIFVTQiBzcGVjICovDQo+ICAjZGVmaW5lIFVTQl9EVF9XSVJFX0FEQVBU
RVIJCTB4MjENCj4gIC8qIEZyb20gVVNCIERldmljZSBGaXJtd2FyZSBVcGdyYWRlIFNwZWNpZmlj
YXRpb24sIFJldmlzaW9uIDEuMSAqLw0KPiAgI2RlZmluZSBVU0JfRFRfREZVX0ZVTkNUSU9OQUwJ
CTB4MjENCj4gQEAgLTY3NSw2ICs2NzgsMTggQEAgc3RhdGljIGlubGluZSBpbnQgdXNiX2VuZHBv
aW50X2ludGVycnVwdF90eXBlKA0KPiAgDQo+ICAvKi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0qLw0KPiAgDQo+
ICsvKiBVU0JfRFRfRVVTQjJfSVNPQ19FTkRQT0lOVF9DT01QOiBlVVNCMiBJc29jaCBFbmRwb2lu
dCBDb21wYW5pb24gZGVzY3JpcHRvciAqLw0KDQpTaG91bGQgd2UgbmFtZSB0aGlzIHVzYl9oc3hf
aXNvY19lcF9jb21wX2Rlc2NyaXB0b3IgZm9yIGNvbnNpc3RlbmN5Pw0KDQpKdXN0IGJyaW5naW5n
IHVwIHRoZSBkaXNjdXNzaW9uIGhlcmUgYXMgSSBkb24ndCBoYXZlIGEgaGFyZCBzdGFuY2Ugb24N
CnRoaXMuIFRoZSBuYW1pbmcgb2Ygc3BlZWRzIGFuZCB1c2IgdmVyc2lvbnMgYXJlIGdldHRpbmcg
bW9yZQ0KaW5jb25zaXN0ZW50LCBhbmQgbmFtaW5nIG9mIHRoZXNlIGFyZSBnZXR0aW5nIG1vcmUg
Y2hhbGxlbmdpbmcuIE5vdCBzdXJlDQppZiB0aGVyZSB3aWxsIGJlIHNvbWV0aGluZyBuZXcgaW4g
dGhlIGZ1dHVyZS4NCg0KPiArc3RydWN0IHVzYl9ldXNiMl9pc29jX2VwX2NvbXBfZGVzY3JpcHRv
ciB7DQo+ICsJX191OAliTGVuZ3RoOw0KPiArCV9fdTgJYkRlc2NyaXB0b3JUeXBlOw0KPiArCV9f
bGUxNgl3TWF4UGFja2V0U2l6ZTsNCj4gKwlfX2xlMzIJZHdCeXRlc1BlckludGVydmFsOw0KPiAr
fSBfX2F0dHJpYnV0ZV9fICgocGFja2VkKSk7DQo+ICsNCj4gKyNkZWZpbmUgVVNCX0RUX0VVU0Iy
X0lTT0NfRVBfQ09NUF9TSVpFCTgNCj4gKw0KPiArLyotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKi8NCj4gKw0K
PiAgLyogVVNCX0RUX1NTUF9JU09DX0VORFBPSU5UX0NPTVA6IFN1cGVyU3BlZWRQbHVzIElzb2No
cm9ub3VzIEVuZHBvaW50IENvbXBhbmlvbg0KPiAgICogZGVzY3JpcHRvcg0KPiAgICovDQo+IC0t
IA0KPiAyLjQzLjANCj4gDQoNCkJSLA0KVGhpbmg=

