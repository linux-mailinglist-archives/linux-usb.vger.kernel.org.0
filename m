Return-Path: <linux-usb+bounces-19605-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA94A1887E
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 00:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CB1F3A39FA
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 23:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10AF1F8EE5;
	Tue, 21 Jan 2025 23:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="n5HVwz/t";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GSlxpPfM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ttx4IQmB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37811383A2;
	Tue, 21 Jan 2025 23:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737503024; cv=fail; b=ei1gcMZjYnYGyyg+gkapa0RMTOoVe8QOFhhOUgg2i+dq5c97syfmElqoxiwkOe5pCvi6QF7rTMGY9ygbIacKk+o+9KxdH1nX/ybQjZjZEiKygLB/dBN2Gr/gqwIcYWjDUelybrtt9jwTYHaJHJb76LrFNAD/RjQzkK5j/Jsgypk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737503024; c=relaxed/simple;
	bh=dTYmiY8jrB7eEZkiUjjkzL1uEVGdYhn3MtKStLT4yzM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mVtCy1tQhL4yMyoIlaHJ/hmDTxRIlZtjD8Zk2YWCOPNhoWGTf5HsMm7LZw6ttE2lxUTTv54lbhX1mYLPO11WxnWPOevpz4v8VrbpWduNehi55vWI1v9qw0lE3oEMXM9mw68nZjpAyEw2BUxuCg2NzGiPK9uEdKQYFnLz+0pTSUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=n5HVwz/t; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GSlxpPfM; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ttx4IQmB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LK2j5M006506;
	Tue, 21 Jan 2025 15:43:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=dTYmiY8jrB7eEZkiUjjkzL1uEVGdYhn3MtKStLT4yzM=; b=
	n5HVwz/t21rKM6ZihzK8zr+r0JBxyKW75h6yaJOYmXtLWKPLYtWaudf/FkE1CxKx
	ykRImjbiu0Q9MeLH9Vtsk054Niio8aGKoc8kGynbjM2GfNcz6EHfmzoiuM18qQao
	ZK625vf+egmSygjMfM/mKD+75ruxCVlpqTT1K622fySwc3taf03jtybTPzETlM04
	W09eMwfnXJAK2h4UiJG/sajonjzeB8MJgLuvwDQ/jNXyCCl2/IDyOExVYDpDesSU
	s1tUNEQi0+eYKObKIOcAiYJHqg+XfPFE92FLWRbKIwn0f+JMi5z/jN7cQkeD86DA
	NXLReGp70VMkfsAHRaDT1w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44aj978vpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 15:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1737503007; bh=dTYmiY8jrB7eEZkiUjjkzL1uEVGdYhn3MtKStLT4yzM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GSlxpPfMhH6pSc55030OrsK6KZWndsa/UA5GY1R0zdZb0A8kuwrmWDQKSbMu3JKB4
	 YGqMMXwTzVX4tqj23QO4/+ZCs9y6z+gfa8m0V4URa4RNGZnv03Qw48Vt1lzJo/sXhy
	 mkyhIR5CR9VDD0wDb0Am2NfGH47IJ92cBIRWeke/rxZk+KxhWEzz4aJwLkJjP7nKJE
	 6Gs6Ar8xwL905+HvIBWD7sUiLOEhH63tKJA76wuO87twG01/aMMOYHOU0LlxovbMlw
	 TcLoKKf3lUWa+uDWYGQbljFonN1CwyjgbPKEHADqqRNWoTguf57oDQw1Clw8VGyBLF
	 IGI+PtYCnfpPA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A10AA40105;
	Tue, 21 Jan 2025 23:43:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D2049A007B;
	Tue, 21 Jan 2025 23:43:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Ttx4IQmB;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 349164012A;
	Tue, 21 Jan 2025 23:43:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay1/SPd0nbVZkU8XCq5peyT2p1ZyaFa18ptYmDEwNW2pzY0jPOUti04YaEFMnjOBy/TiK9jSqrECOlk8kMjULwMpBARgvoUjDMcbZzFYp3AYaE8UNDON4L0BxuynvJzvisWoZAqqxQrkB+JpTPzkeNDynqvbuqwH4qwWAgc/hvIbOtTIM4XDUc+HtxswIVrKurh0xp3ZKpTO9NTT2SQDNrSX/OUTTWcQcd+eLLy7GwrlbnWhsokGcOx2aF/0G5akXrupe8oQw/aOGqY1yXnBrO7vuEvT2IG0iro7yxZRgRh8VtoU4oHV5ChIG02aYlpwFwg4FdJE4NVZ7Zc3YFCP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTYmiY8jrB7eEZkiUjjkzL1uEVGdYhn3MtKStLT4yzM=;
 b=NDyo7vAtQ3oaJ1JCZZdU1Y4tmbm1gMRHCESAAoJYhJ8x5qrdeZ6mj3G8n7pLuHvCYs+OZXlDGWtKBJLy3DO4eGfYX3vqBAPGz0bmKps6NkjLzJ7/G6fxaNXHnJxbZ+1T5U5FVPae2xWZyIRaD5x+I7PEORg19vmPIRSMfSnVXEkpSlufNhtlkxGrmXTrURz6aQZKlwlOKDrfwZ/7akKy3RxLqM+WTbP54lMXUHonJNwo8HPJ4UXrkNzkAfhJQuANHsTVsm05c2YhuBDrRh9Ds//jnzC7t0sLPQ3/N7IFxJoSU+befSwZi+xewhSAifePcly1y1iv3sszPq3nDryoIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTYmiY8jrB7eEZkiUjjkzL1uEVGdYhn3MtKStLT4yzM=;
 b=Ttx4IQmBs0FsfsJZbJu9F9pHCO6YaOAyiGqeGWpGBsTSGzuuTTSx6BdVCH3jFNpkGmShwhDWRQc6aIXA+lE6MxUSRf27RkRxc2jfNrXm+FnpeEh01EFRIwzsEVy5Lw/90drPKIoQCUzR/S844zamyrZpHnZbRQOJetT4NgPjE5I=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BL1PR12MB5828.namprd12.prod.outlook.com (2603:10b6:208:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 23:43:21 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8377.009; Tue, 21 Jan 2025
 23:43:21 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 0/3] usb: dwc3: Avoid using reserved EPs
Thread-Topic: [PATCH v1 0/3] usb: dwc3: Avoid using reserved EPs
Thread-Index: AQHbaC0eMwYEug38l0SxHHfTxkybwLMaCZSAgADwVICABM5tgIACI8mA
Date: Tue, 21 Jan 2025 23:43:21 +0000
Message-ID: <20250121234313.2xiixrqru5m35dyp@synopsys.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116231835.isbwmq5yz5issy3w@synopsys.com>
 <Z4pdZZhR6m1LB3yk@smile.fi.intel.com> <Z45lja5InqAXs3CQ@smile.fi.intel.com>
In-Reply-To: <Z45lja5InqAXs3CQ@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BL1PR12MB5828:EE_
x-ms-office365-filtering-correlation-id: 8ef8606a-48ed-48e5-df64-08dd3a7563cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OS9KUDRqeGtUK3MvUWpoL1J0c2MzQkIrcHN4TUpMeS9EaWlzcG9Xd3g5UHc0?=
 =?utf-8?B?NFVxZENyZUx5RWhVdmlmc2Jubi9NcnZwVmRqNDYyU1c1Mk5Db0NwenlHZ1Rx?=
 =?utf-8?B?cmkzUE1oODQ2SXV3c2VXNi9zdWNBcUZSRGpzbXVpeE0yYTBYanhoQ2lhR0tm?=
 =?utf-8?B?QUVTNU0vMms0elgwVWZBNTBFUUd2QjhyL1hGM3djQW5vOHN0UzlGNnhHY1Ra?=
 =?utf-8?B?bXRqbkxBQWxpOFBOMThLY3dkVlREVVF0Z0ZqdmFzdlErK1ZRSjIxeHp5TzZh?=
 =?utf-8?B?Vnp2QnEvNWNReWY4SzlLY0cya0luVlVBVkJRajMvVDljd2JFYmQrc1ZlS1Ru?=
 =?utf-8?B?VjBlQXFDM3p3Umk4OW1vTDVxbFlBajgyb3BLZHMzbmFsSHllaVNJajNtcHc4?=
 =?utf-8?B?MGZRUkJGWS8wRzJOay90SnIwcFp3YldkTWtYT2JoL2k0Njl2bTcxcEZrb0dR?=
 =?utf-8?B?SjV4N3c2NWVUakplRWl0djh5di9SU0dzb2E3RHU1ZzFkQStSZ3J0OVVieStB?=
 =?utf-8?B?cHNudStQblErRGRVekYyaHdpd0d4ZzNyV0Urc2VNWTBmaUdkTFpZVVhKRUxo?=
 =?utf-8?B?UE5PZGFnNTJVbXpYR1phMlRSYjFjb2x5ckRlL1BjZXZxRy9Fc3psR1d6YmxZ?=
 =?utf-8?B?Mzhic3VVMnEvaUNVNGIwTk1ucExuVEhkQTUxV3M0b3hWOS9RMzRjeTRVNHE4?=
 =?utf-8?B?WmZEMFFPSUdPYURhamYvM1RHb2RRa1ozZHZGQ0dSRFVHS2RBZWlzRHUvNDRX?=
 =?utf-8?B?Q01WMkUxdEluZVZ2ZWRpaTFET2JVM1ZDSWt5UWJGdjBuNVpFNlErMjlGREhs?=
 =?utf-8?B?allQQ1ozNWFKTkdmYllXdnlncDg5NUhST2wwZEZvL3JibktVb0tnbG9KVXVy?=
 =?utf-8?B?M2RzK2Z4ZkFZa2FZVFFSM1pQVlZYZ1QzUkVvMHBwVkFUWmlIVUM1QmViWm9N?=
 =?utf-8?B?eE5qVWlDSGhna1FUVGRqUU8zS2xKWUV0bTRwYnl3SFZQSytoYzFBeHNYSHZV?=
 =?utf-8?B?ZGYxYUxobFhCVTFySnFWbzNiNFAvaWM2Q0Rlakh6aEp6Mk1FR3gvVFBHS1FB?=
 =?utf-8?B?ZW5kNEg0cWxmN3hzbGRVc3lXUlpjMDRpcis5TmVxZDlNaHhOeUxjM2cvTXlM?=
 =?utf-8?B?MW5kSk1UVkhVbEQ5bGdlUldVRTJEbFVwdmt5YW1iWWMwcENyaWY3M2hYV1BL?=
 =?utf-8?B?cFZhdDdvM1pXcmR3SXhVdUI3dk1HQnZHSFFsRit0M0czS3Z6WVY5ckNlcnoy?=
 =?utf-8?B?NlJqWlArUXVrUjE5aW56Y3lSWjdaNTMxc3c2WHVONE9XZ1FHK0drRWtUVWJ1?=
 =?utf-8?B?N1NLQUU1NmtCc2d4M1NSSmxxNEhjc3kwSXZRMm11b0dYZS8yZzkxbTFHUHBP?=
 =?utf-8?B?TU54TjAybXYvWjY0bzRxWGVuc0QzN0VmaFJBbFI2V2lTVExRa0xlQTdJZEdq?=
 =?utf-8?B?aGZWYlZqWEFmTms4N0RnQ0Q1TFUxSnJvcXQ4bE5aTE9pUnpXTmV0aUxueGVJ?=
 =?utf-8?B?dTcrbWdlQzVZdUpzTXUvd2FrMWIxemhMTGlydCsvc0dnNERablJsRzhoUFhj?=
 =?utf-8?B?aXUxaFlpallGOWUrVTNmTDdSWnZQelNTSDNXOTQ5OHI5YnRGUFQvWGtyZjZ2?=
 =?utf-8?B?b1l2b0xxd2dXT2NGODdMSFY4VkU0WENCMDRLREduQU8wZjQ4Nm9WTFI4MGZj?=
 =?utf-8?B?a0J1ZGxOYTE4SzR0Mkhwc3dmQTUydEtEblc1Vi9lUmc1MlZWWG50NHUxWXlo?=
 =?utf-8?B?Y3ltSmZyTEpsOWYzNiswYzNVdGRMN2VuZEtYVUt1MFVVSTY1aXpvT2FTaEhR?=
 =?utf-8?B?eWZ6bFBUMUwxS1FWS2VTZCtSdXFrcHh0UHA3bzVMKzlPSk9BdUhVMjlraXE0?=
 =?utf-8?B?MHVZM25vQ1dJVUl2MFhCb3RLcllMMzg2NFFjbTVtTXEvWUl4aWhzbEZlaG1I?=
 =?utf-8?Q?Y326jmTaYiKVgE+JICJ2kVsXaI8xypv1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cEo3VzBXb2dyOWw4NXRVbzdiZnA3dlh2M3BTM0xOVWd3aGcxZWFhT0NQeDRt?=
 =?utf-8?B?bmx6bWwzd0xUZmhQMklON0JucmJ4eE5IZUpWME4rRldXVVJWUi9hUmxqdTIx?=
 =?utf-8?B?b0pPdkVrWkFKa3lXRGpqRTIrQ3RXb2VIdHlsRHowQ1M1R1Y0bDM1T1hwemxl?=
 =?utf-8?B?cDRRTk1uRFBaNWxmemtndUlOU2YwWHBiOWNjcEFXNVRCWGNDK05aNWtqSktW?=
 =?utf-8?B?SDkxRzBSYUs0QzFCZFFBbklkaWdaMFo1dWtBeSthcjFyRFBlV2lJWjZSblhJ?=
 =?utf-8?B?MlZwZEJaVEM2NzZxYmpOenBSR3hSUmZnQ3FyZUFMWDdzMWNiWUUwVHFpd1Q4?=
 =?utf-8?B?dnpVZmhQc1RVNlFVTE1aTWh6a2pwYS9nb1dLTGV0WjFTSTB1SlFDMmlYeVJQ?=
 =?utf-8?B?S08yYVJWWlZIckx3bjZaem1oZVF2bHU4TktXaEdOdXlPMXlWZU95bE1Ucmt0?=
 =?utf-8?B?MU53V0dXV3lmUmF6R0RnQWdmbGxGd05TZmJpcko0WGZ4bUFLcXhiOFdvZ3Q4?=
 =?utf-8?B?NGR1bzQ4cjlnUmsvOGtWUElRSlhuNmFydEZUV3FDdVpPTXBKVWZRKzdsY1Fo?=
 =?utf-8?B?eTNQblIxL2hnREJrY1VjZjRHWDZ3Qy9pUHdnMTNkcnJEOHZJdzQxclpTUnNy?=
 =?utf-8?B?bkdCNkZFbDk3dkZRTkl0VWxUNHdvemtuK1g0WVVjUHdNbDU0RFpkakhaVUZa?=
 =?utf-8?B?bnNtSXp3UlJ2NEhzWnZrZGlldHMra2s2WjdKTVF5NjJJZ2R2U1B1QTZuNlRJ?=
 =?utf-8?B?clR2T1NlWG1vZVJqUnk1MmpPSHUzYkZHaUJaWHdVY3ZNeGd4ODZybUx1d3Zz?=
 =?utf-8?B?Q09SR1M0anlwYlJOQTVHV2dpOEp6MjJOZURncUZvNGltODJyYU4wQmNKbVZW?=
 =?utf-8?B?bytHUEVLUkluTVg3Z0dsUVlZSzVXUWwyTjN3amoxNWlrMUpySTRwYUZLM3FS?=
 =?utf-8?B?M1NTOWEwY0drWXZsZG1hajIxU0xmNy9GbWhXSlR1eWpUbVgxZ2NxT0I4Q3NV?=
 =?utf-8?B?Sk5ONCtucjB5VFUySENMS3U0bVRnYitpcE9pckwwRzVRR3FkYm16cktNRjU2?=
 =?utf-8?B?Y0x6d1VJa0dkb2M2ODVLMzVPZVpkVE1DM2RtK3N0MWo0OFVuVkhXVDQ4d204?=
 =?utf-8?B?T2UrVElnZEJ5VVdoTlhReisrbHdtNi9IOWJCZDJ6QlNVbGtHeENBdmlrVjJF?=
 =?utf-8?B?WGQ5UGVYa0ZHMjkycUVsbTJvdnlZUnJxVFhic2hFNzNWVWhZOGJwQXhNVlcw?=
 =?utf-8?B?R2pRTWVHUis5TkNRb1dzZVdPOEZ4dmNMb2tqbGtqWVRWaVdMdGRLc2dFNGpP?=
 =?utf-8?B?U2JmSnZCaEs0cjlkbnhtNzZmbnc4SHFOM3grTnU2ME5NMFd3cGU0R3Rja3kr?=
 =?utf-8?B?TFY1SWJFZmY1OGxlczhCWEk5MTRCNFlobE9DNk5IZGRsS0UvclpPTzdXR2Vq?=
 =?utf-8?B?WXpPcXhWVmRvVEhLZ0tPU0xKVGs1TGpDdHF3eVlRSys2a2ZQTzJCalltN3Bx?=
 =?utf-8?B?SkVEaktYTXNHdmEyNm56c3RGRWxpeGhkQldFaUFwL2JhTjBwYmd6ZEVtVEtJ?=
 =?utf-8?B?bDdKRnlnOGMrMnBUYTBiSElUWDZNUXIyb25jOHpBZWhXNkJhUUFObzFkUld6?=
 =?utf-8?B?b0czMHRsYjJqdjNnYXdHTC9YRnRpRnh5ckcvN0NxMm9pSUpYVTEzMEhOTndX?=
 =?utf-8?B?aCt0V1FJTHZxUFFIL3lyOFhORXd0NFkrRUFsNjNUWm9hbVFEbUZqZ2pnRDhZ?=
 =?utf-8?B?OFhHTS83RkxPWFRDNTNBeTc4MStydU1qdGY4ZXVlZDI3SnRDdmFxbFBaTGgv?=
 =?utf-8?B?QjZPL0pIQjUzNUZySXRrSlFoZkJYd05kZE8vMUhyL2hlcytpcDV1SkJPZmho?=
 =?utf-8?B?ak5tclQrTU9yQVp2RGdUQmpGQW56T3RKREJCVHN3NDU5cVUxSjhHN1ZXR0Y4?=
 =?utf-8?B?dWRCTWQ4aUh2WXB2SDVHSVN4U28zejZheEFzOTk4di9PYk90bXZIQm5SVzJW?=
 =?utf-8?B?MXlkdlBFSFBKZjFLd3Z4cDhheHA0dTdxdjBjVWEvTDE0WEc4TTNyNG53S3JD?=
 =?utf-8?B?ZzRpZzh5OFBGbXdmKzBEb2V0alA3T3lWcllEVnZPNjh0Nm1oL2ZaY2llODdM?=
 =?utf-8?Q?z7cO/Y525Af3viVgd5QtIuAyN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7485F4181FCA80419575367E1B1550BF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0wN4jaD30nzMXELCwWWFHUiQLhMXjuFZfW9/U24Sf1blg0UsZx8nl2yolRR+yaYgBEFYj5fCIQ/1kd08Lk5l/XjglJ2O75JCO7/OMrPH6vK7875smEu/O4kR1WtXRe1Ul/CCGdcKcdLgtcKwn8JK90aC9aG4XQTNl8869acoNOO840HfgAH5pYq91UMIdmCkNmudrvTBEIbWMluTKpqVkECNpIT08U59jxcwCQ0JERpBoZ5K2QwxGSQeYylaPMsLIFAqN7Uh4ClqfyrQq6k2qJVwp/ru7ng91M5bl2FpS64zu5ve7UmpwzucFnqnZAcCCqtgOFdmO2/fdEybg63OiK/KvLApoJWW3Vu3StpWzRvUz6ik+57V9Ub5s9o9qQsyabPg0Z7VSyDrmNQSH0Y+ulTrLAdfg+RQ2FrC6r9hRBvI2gdh9KcUOdXDYWuyHsWlcJdu2v2UKZFKItNwM2BI1Z8JV7zsOY5+CYeGFw2t9Jpsp4vHra3AT/iEfuU/XjZZVqRzzLSB8V61iWEGg/alIiqnYUAL54HDYsmDc86d6XrqtI/9jnPJI11nJXUOM1JwTMHqnbnLOKvv6kz31CsE0qh1j41/oog7PDnefCue3cGR/d8Au/h363Uk/SUffknU7P8qlNDsu37EvD03MQPAnQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef8606a-48ed-48e5-df64-08dd3a7563cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 23:43:21.5936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: opLn+aIm1wp5IvLNuLxaiOuu2GMoQBThIqTG2qTaUf8tg2tWrNdMHPrwhEjY8LuqnGYHyv/ttU9HGDhZu5N7wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5828
X-Proofpoint-GUID: 4AAiT03Zw8N2imFDCR31BVMF0snfiLcJ
X-Proofpoint-ORIG-GUID: 4AAiT03Zw8N2imFDCR31BVMF0snfiLcJ
X-Authority-Analysis: v=2.4 cv=PewFhjhd c=1 sm=1 tr=0 ts=67903120 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=lY71feQQy3X3qcVm3jUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_09,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=985 spamscore=0 priorityscore=1501 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210188

T24gTW9uLCBKYW4gMjAsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gT24gRnJpLCBK
YW4gMTcsIDIwMjUgYXQgMDM6Mzg6NDZQTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0K
PiA+IE9uIFRodSwgSmFuIDE2LCAyMDI1IGF0IDExOjE4OjQ1UE0gKzAwMDAsIFRoaW5oIE5ndXll
biB3cm90ZToNCj4gPiA+IE9uIFRodSwgSmFuIDE2LCAyMDI1LCBBbmR5IFNoZXZjaGVua28gd3Jv
dGU6DQo+ID4gPiA+IE9uIHNvbWUgcGxhdGZvcm1zIChJbnRlbC1iYXNlZCBhbmQgQUZBSUsgQVJN
LWJhc2VkKSB0aGUgRVBzIGluIHRoZSBnYWRnZXQNCj4gPiA+ID4gKFVTQiBEZXZpY2UgQ29udHJv
bGxlciBtb2RlKSBtYXkgYmUgcmVzZXJ2ZWQgZm9yIHNvbWUgc3BlY2lhbCBtZWFucywgc3VjaCBh
cw0KPiA+ID4gPiB0cmFjaW5nLiBUaGlzIHNlcmllcyBleHRlbmRzIERUIHNjaGVtYSBhbmQgZHJp
dmVyIHRvIGF2b2lkIHVzaW5nIHRob3NlLg0KPiA+ID4gPiBXaXRob3V0IHRoaXMgdGhlIFVTQiBn
YWRnZXQgbW9kZSB3b24ndCB3b3JrIHByb3Blcmx5ICh0aG9zZSBkZXZpY2VzIHRoYXQNCj4gPiA+
ID4gImx1Y2tpbHkiIGFsbG9jYXRlZCB0aGUgcmVzZXJ2ZWQgRVBzKS4NCj4gPiA+ID4gDQo+ID4g
PiA+IEZlcnJ5IGFscmVhZHkgdGVzdGVkIHRoZSBwcml2YXRlbHkgc2VudCBQb0Mgb2YgdGhpcywg
YnV0IEkgYXNrIGhpbSBhZ2FpbiB0bw0KPiA+ID4gPiByZS10ZXN0IHRoaXMgdmVyc2lvbiB3aGlj
aCBpcyBzbGlnaHRseSBkaWZmZXJlbnQuDQo+IA0KPiAuLi4NCj4gDQo+ID4gPiBJJ20gbm90IGVu
dGlyZWx5IGNsZWFyIG9uIHRoZSByZWFzb24gZm9yIHRoaXMgY2hhbmdlIHlldC4NCj4gPiA+IA0K
PiA+ID4gSG93IHdvdWxkIHRoaXMgZXZlbiB3b3JrIHdpdGhvdXQgZHdjMyBtYW5hZ2luZyB0aGVz
ZSBlbmRwb2ludHMgKGFsbCB0aGUNCj4gPiA+IGluaXQvdGVhcmRvd24vZmlmbyBhbGxvY2F0aW9u
L3N0YXJ0L3N0b3AgZmxvdykuDQo+ID4gDQo+ID4gWW91IHBlcmhhcHMga25vdyBtdWNoIGJldHRl
ciBob3cgaXQgY2FuIGJlIGRvbmUsIEkgaGF2ZSBhY2Nlc3MgdG8gYSBsaW1pdGVkDQo+ID4gZG9j
dW1lbnRhdGlvbiBhbmQgaW4gcHJhY3RpY2UgaWYgdGhvc2UgZW5kcG9pbnRzIGFyZSBub3Qgc2tp
cHBlZCBhbnkgZ2FkZ2V0DQo+ID4gdGhhdCBhbGxvY2F0ZXMgdGhlbSBzaW1wbHkgd29uJ3Qgd29y
aywgYW5kIElJUkMgdGhlIGVudGlyZSBVU0IgdHJhbnNmZXJzIGFyZQ0KPiA+IHN0dWNrLg0KPiA+
IA0KPiA+ID4gQ2FuIHlvdSBwcm92aWRlIG1vcmUgaW5mbyBvbiB0aGlzIGhhcmR3YXJlPw0KPiA+
IA0KPiA+IEkgYW0gYWZyYWlkIEkgY2FuJ3QgcHJvdmlkZSBtb3JlLCBzb3JyeS4gSSBjYW4gbG9v
ayBmb3Igc29tZSBzcGVjaWZpY3MsDQo+ID4gYnV0IEknbSBub3QgdGhhdCBndXkgd2hvIGtub3cg
YW55dGhpbmcgYWJvdXQgaW4tU29DIHRyYWNpbmcuDQo+IA0KPiBTbywgaGVyZSBpcyB3aGF0IEkg
Zm91bmQ6DQo+IA0KPiAtLS04PC0tLQ0KPiANCj4gSG93ZXZlciB0aGUgZW5kcG9pbnRzIGFsbG9j
YXRlZCBmb3IgU1RNIGFuZCBFWEkgZGVidWcgdHJhZmZpYyBjYW5ub3QgYmUgcmUtYWxsb2NhdGVk
DQo+IGlmIGJlaW5nIHVzZWQgYmVjYXVzZSB0aGUgc2lkZWJhbmQgZmxvdyBjb250cm9sIHNpZ25h
bHMgYXJlIGhhcmQgd2lyZWQgdG8gY2VydGFpbg0KPiBlbmRwb2ludHM6DQo+IOKAoiAxIEhpZ2gg
QlcgQnVsayBJTiAoSU4jMSkgKFJUSVQpDQo+IOKAoiAxIDFLQiBCVyBCdWxrIElOIChJTiM4KSAr
IDEgMUtCIEJXIEJ1bGsgT1VUIChSdW4gQ29udHJvbCkgKE9VVCM4KQ0KPiANCj4gSW4gZGV2aWNl
IG1vZGUsIHNpbmNlIFJUSVQgKEVQIzEpIGFuZCBFWEkvUnVuQ29udHJvbCAoRVAjOCkgdXNlcyBF
eHRlcm5hbCBCdWZmZXINCj4gQ29udHJvbCAoRUJDKSBtb2RlLCB0aGVzZSBlbmRwb2ludHMgYXJl
IHRvIGJlIG1hcHBlZCB0byBFQkMgbW9kZSAodG8gYmUgZG9uZSBieQ0KPiBFWEkgdGFyZ2V0IGRy
aXZlcikuIEFkZGl0aW9uYWxseSBUUkIgZm9yIFJUSVQgYW5kIEVYSSBhcmUgbWFpbnRhaW5lZCBp
biBTVE0gKFN5c3RlbQ0KPiBUcmFjZSBNb2R1bGUpIHVuaXQgYW5kIHRoZSBFWEkgdGFyZ2V0IGRy
aXZlciB3aWxsIGFzIHdlbGwgY29uZmlndXJlIHRoZSBUUkIgbG9jYXRpb24gZm9yDQo+IEVQICMx
IElOIGFuZCBFUCM4IChJTiBhbmQgT1VUKS4gU2luY2UgU1RNL1BUSSBhbmQgRVhJIGhhcmR3YXJl
IGJsb2NrcyBtYW5hZ2UNCj4gdGhlc2UgZW5kcG9pbnRzIGFuZCBpbnRlcmZhY2UgdG8gT1RHMyBj
b250cm9sbGVyIHRocm91Z2ggRUJDIGludGVyZmFjZSwgdGhlcmUgaXMgbm8NCj4gbmVlZCB0byBl
bmFibGUgYW55IGV2ZW50cyAoc3VjaCBhcyBYZmVyQ29tcGxldGUgZXRjKSBmb3IgdGhlc2UgZW5k
IHBvaW50cy4NCj4gDQo+IERvZXMgaXQgaGVscCB5b3UgdG8gdW5kZXJzdGFuZCB0aGUgcmVxdWly
ZWQgcXVpcmsgYmV0dGVyPw0KPiANCg0KVGhhbmtzIGZvciBsb29raW5nIHVwIHRoZSBpbmZvLiBU
aGlzIG1ha2VzIG1vcmUgc2Vuc2Ugbm93LiBTbyB0aGVzZQ0KZW5kcG9pbnRzIHVzZSBFQkMuIENh
biB5b3UgYWxzbyBwcm92aWRlIHRoaXMgaW5mbyB0byB0aGUgY29tbWl0Pw0KDQpCUiwNClRoaW5o

