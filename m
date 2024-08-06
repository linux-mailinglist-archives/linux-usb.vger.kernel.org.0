Return-Path: <linux-usb+bounces-13161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58173949BA6
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 00:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11C3E281224
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 22:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DD9171E5F;
	Tue,  6 Aug 2024 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="S2ZdctT9";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NMNDWJXC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Z/ISQTVK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1413BB30
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985038; cv=fail; b=bqeNI0ZTkyRWBTfzgGnn8IJvMw+o9Sqvn2ublivmcK8+5SvcKd1Fp0BG8vwGKFJdiWNPsgE7MEvgH96FIkbX5H9U7ORaeoDyPXUUAziv1SoneqqsdszA0W2BMb/pfjYbF8VRdv+g16npYCisZ88S9dt81U5cEy6n8CqmcLWJx3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985038; c=relaxed/simple;
	bh=S5X+mCywaxBj24WrfT6z66mOLYdmVo1CBPY2JiWc/oY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tQhV+RYunBEpj6gf/ViT5BgZdimcPPXqtbKFqApahy0D/a21c7RyJCFgpriruR1YhkPHCyWNdH985KW5Y3dskw82xK4IAQCkgp07nmc/bjSr0gnP04x0sn6G+eVAWvjAEvD3K/R8+2Rc3xFwSfNpL3jr/6N6qz8o2khhVAsE5Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=S2ZdctT9; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NMNDWJXC; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Z/ISQTVK reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 476Lv6X4016931;
	Tue, 6 Aug 2024 15:10:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=S5X+mCywaxBj24WrfT6z66mOLYdmVo1CBPY2JiWc/oY=; b=
	S2ZdctT9zhlXFaBJ49YHLECQj74WXXNbq2oIS1T/mEwgYwN9OPA4jYwJoXGtiZzg
	eGJxTPxRmTEmBmyY1DTx3bCDeK7QXFawbFlYF4G2M3txMuT/I6BWl0+m3DN1iC9f
	ReX2IRcBYTCpqNPUtnt5+f0/ZjZlX7AQkf3TPiTWmsxXPWlEkLLPBRqlSvFT3d6e
	sV0IUpdUMFgEifXejAofz9bDEx3PDDeiU/FI7z+EteWs08dI/P1MB4QQLdeRqjfm
	tKE7HAwraf00I9glt+jsCugaqWge+m02KvMPqiBgQN/pea/xakr6SLu3B2q8gCGh
	xZ69pYCCL+q/QOTX0oNPLg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 40uujg86h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 15:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1722982235; bh=S5X+mCywaxBj24WrfT6z66mOLYdmVo1CBPY2JiWc/oY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NMNDWJXCikJOh2PgWtViUhOeFVW/KYDnXsLT9Vz72S0QqbloRQNa/IfqL+rUeLDGE
	 qid43iMyxK+Kja43qmKHHpaiyVreblLwG5Adrxzywp+Vi+eE2tjUuAGWmszMf63b8D
	 Gmk7Sy4d9g34q82mV9vO1cNqQUnKSNWu5EFJ7IctCiK++kajKhCAqJLeq74cmZ/ZvE
	 LJVS4sEf9JB5dIFWgmpgspHxY6+dQkW/KAB1YIi7IjwGs9jbTmEosPZrdtUwU4+j2t
	 yPghWEDNp6Cz6cHzPzuJXs9UepbCT0tFhXKp/RprobCm1IGfVhdi5cEv6Qy0Id/r+H
	 uQfWqCUE4cXqA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9177040147;
	Tue,  6 Aug 2024 22:10:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CE8DDA006D;
	Tue,  6 Aug 2024 22:10:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Z/ISQTVK;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0574C40582;
	Tue,  6 Aug 2024 22:10:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QT9Z6k/ttAr0s1EHyTZiLWolRwt6OiIlYA2Ef+cSsoglJGMTHf6D3oJbxa7HwRbsUhB2si1g1BFX2Y3/wVhiVBUkigzOrcjB7OmPtFv1lt8mHvHQAhJmvKG0dKeeyCKwvOggD8PHaJbWvJUIkJg/vB3mKW6zK398YX4rEpKH3wCIDgArfVRwghgQ+ZKnRilulVYnmz7pnCMhzqROjsUXSkYLC6A9hqmByjniispNmIi9zXjNJ2bNyi1pxTM/dR5db+xGWJK+JqM0ZfmQaElBY+eMY07cRuaV70gdhNt3MOfIczdSxaRx6DvITl5P7NLoj4q96GGZCpPnP5kthTp9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5X+mCywaxBj24WrfT6z66mOLYdmVo1CBPY2JiWc/oY=;
 b=wzMCybS3EKAi1Q+6U8Bd0EnfPvzMoeUk0Tt9RYnsyhuy/Ut9bGUcL5u/HKKWM1kXP9g6NA9kE8iQ3yYv74AmU2mojFvxCDCLI0YAUotGXa4h+TcKvPm0N9rFeOrUrDyR05JIH939ib80dHbacV/JOSn7TLeQOZvOj7STvUQ4EPMwDP3JjpzGIMN+7xHvrJi/LX78IEsi3OA2QIGA6yxUffdp7vQ73IQ2VoQE4r04pvRP2SV03AhhUa2cN0qB3KSg5DrHGmc9GI+AYnczhEQwstbwEXhfpQQh9R9R06uqQfirGsebFE3Dapydo04fT2wSF2j8/GM77D18hVrd1iVXJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5X+mCywaxBj24WrfT6z66mOLYdmVo1CBPY2JiWc/oY=;
 b=Z/ISQTVKihnJlSTjhvth85Iqc6z34wKSZwTBKf1Y9X2tlQ8dOJpAt0KF97OdeLQoSCfl6Ar/eUlMVgsH5iuTanbMODiL87TpWQ8fP0K2I0VkVNukYZqnOOM2xAOgyNRGlUgEQ+Cg1lJQnkOmFoKP3CbWfNjYheenGeWEvUC28Yc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW4PR12MB7120.namprd12.prod.outlook.com (2603:10b6:303:222::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Tue, 6 Aug
 2024 22:10:27 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 22:10:27 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Ana Clara Forcelli <ana.forcelli@lsitec.org.br>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: Issues while implementing DWC3 on an Actions S700 chip
Thread-Topic: Issues while implementing DWC3 on an Actions S700 chip
Thread-Index: AQHa6DX4Lpr2sJ8+WUOV/J6kRoXn/rIaynGA
Date: Tue, 6 Aug 2024 22:10:27 +0000
Message-ID: <20240806221023.rbb24twwx5riidfl@synopsys.com>
References:
 <CALWWSVGV8vj+tP5H+DNfE5G6hZnHq8PtCbKTK8AmiZwxVFzqeQ@mail.gmail.com>
In-Reply-To:
 <CALWWSVGV8vj+tP5H+DNfE5G6hZnHq8PtCbKTK8AmiZwxVFzqeQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW4PR12MB7120:EE_
x-ms-office365-filtering-correlation-id: 6a8c534b-6a50-4dc8-4791-08dcb66493ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OEk4UXVISmRuOVdWclFQNDgyTm1OM2N0TkhuSFhiSHp0WGZHWGQvSlo1a2ZU?=
 =?utf-8?B?OFlqQnpWSkErdnY5OCtjRHorQzZhU2NBT0lOVnJNM3E0bW82UVFCaFNkcEJ3?=
 =?utf-8?B?OUxMWVoxZkJKVlBDa3Q2QlFkQndQcjRJb0xOQzFmUEU5NWo1M3NPQnppcmxY?=
 =?utf-8?B?RkFsbUdmQUNHWWxGYU40ZVBnRTFCREIrenQ2K2tGTXhYTlVDRHAxVTF2R3Fq?=
 =?utf-8?B?TXZ6N0NRcFJVcFp1VkZQV0ZFUVRUWndXenhaTnBiNDNFZVBNU0QzWlpRV3ph?=
 =?utf-8?B?UDBDdGN0MTRYa0d1ZXQva1NtektTWEwwMGZhMDJtSHNMK3lXYmdhc3dneERx?=
 =?utf-8?B?RitPM0FwdGU2czNUSERUcnR3VHk0Wm9BbmNhOVZPSS9SQVRtQ0JWMVBEcndo?=
 =?utf-8?B?TkdLTW9iT00xSXhJZGxpeldiZUNLSGNNZ0ZxdW12WXBjVFhmbmV5TjZKSHkz?=
 =?utf-8?B?V1JYZDlNUGNKUVFUTFN0R3FPVnd3VWVnQVdkWi94WU5Jc3JpRnZURjZDVXgw?=
 =?utf-8?B?M2t2OEdTRThTVlBYOGFHSE1XUi9pdVJHYXFEVnRrU3VNMlRiR2NqR2tOTWs1?=
 =?utf-8?B?d3BtRHp5RlhhTlNBanBYQldHckJZSlJhaWRacEl4U2wyNmo1WlcvU09VZ1JY?=
 =?utf-8?B?SXNFbjdmT0V3TmhPeGphMUovcEJDbW40dVJUbU8zbTRXY2FnaVNiYlBweXAr?=
 =?utf-8?B?aDkvL21EcXpIRkU5RTFhdktob2prbE5OZ0J2UE1IdXRXc0NLMW5MbUJ1S1Vo?=
 =?utf-8?B?ZU9RWmRwTkx5Mnp1ejhra3lxV1dDYWFwcFdoTllGZHJGMFVhbEtNOTZlRXVs?=
 =?utf-8?B?eWJSM2VKc0w1MmhwdGoxN2ZVVEVmN0laSkVSWHhmRVFMeHZncXZjQXZUSlhN?=
 =?utf-8?B?Ynk0b2pITTVxOGVMNlNBWHZZNGZELy9TVlM4T3pYVEJ2UXIvVnV2MDVvOWRx?=
 =?utf-8?B?RVQzbkp6Q25KZVFENmV4bFZQN2JLVkkvQVltOW5NWWdHQXRRdmdpZ2dWbzYr?=
 =?utf-8?B?VVBPT0M3eUEwNUVCRW1GaVNWY3l4d3BGZjdJeXB3SVlwUjk3MWd0clRKc0hn?=
 =?utf-8?B?L2VMSzBBYkVPeDNaQ0FMOGtCME00Q0hiZ2Y2WmJ6R3FkTnBmSE5ldUNoYU5n?=
 =?utf-8?B?aHo3Z3dJMU8rUzhwcFlWdUU1NHFWMGFQVStFMmE2Q1BKL1pFWEJSSGRMOFBP?=
 =?utf-8?B?WERWZDhOZTJrZVdMdW9vemQraE05bk10SjhYSXpzOXZ2dDFqbVIyVWIvTlFu?=
 =?utf-8?B?ejFFNExSRXBaamRIZXlIUXovRmswN0JmYWUxOFRtVTJyMlFLRHVMd3Nva0Nz?=
 =?utf-8?B?N1dSQUlYQzI3OS9GWVlPQTlkbUhyQ3FQOUtYUHBWdnlZZTl1MXhzK1hueVFM?=
 =?utf-8?B?WGFoWW5GYnZxRlBGazYwQmhUVmI2djYxRTRCNU5xbnRDbmYySXhZdW9BTjUr?=
 =?utf-8?B?T014V0kxME5mTmFKWGNIYjlhWmxUSGU2MkcydGN1WXZYN29iM3BzemoyVE50?=
 =?utf-8?B?cGtTc2ZPWkRncnFQT1AreWF5TXdPRmR6NkhoSERZQy92L3pXb0NiamtaVWFq?=
 =?utf-8?B?R1o0YnVXcDArellHN1huOC8rSUU5OU9vRmdmN3QvQ0x0OGR2d2RGSVpsZjVK?=
 =?utf-8?B?L3RRRFFpQU9OaGV3MWlVN2pObGZGU0xYSEdMaE9PamlFRVhyMlBsYkUzMDE2?=
 =?utf-8?B?ZWMxb3VLbXNwdVBCUHpRT0dEM1ptRkVWZEFYTEtCakFVR2NUM0JJUFZvQnIy?=
 =?utf-8?B?L3ZZQlFYN1g5UDltdzlGTE90dHZzcVNRUlp1QUlqVHBNQ0Q5RU1JS21wVmhQ?=
 =?utf-8?B?Rlk4aUFtdy8wMXhrMmZsb09LS3U0aWxJc3pqQkdwd0puejlLWm12eTRYNkpC?=
 =?utf-8?B?ek9GMlJVWUJXR1V6a3h1QlFrdlpLd1p5WkhZeFlmNDhVVEE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SE5ObGY4TGsxcmM4a1M2ZFpBL2xsbFFBTnJCNUsyckpYU2Jvd1NaRElzRi90?=
 =?utf-8?B?aGhncUV3TlVjMkdLTnFCWDRBYVVDeHlsZG4rZDZUQjJrQS94amVmakRPRi9v?=
 =?utf-8?B?MklQVFJKMnVyR2xqMHE1TWNQUzgyZno1YytvYytFVGgvY1dMMjJyYmdwVllk?=
 =?utf-8?B?UGd3ckFOUU1ZcVFTZGtWTnVaRC9ITDZlY0VPSGF0a3B6dnUzZTUzK1MvcnNM?=
 =?utf-8?B?Uy94QXFDeVd4WXE0OHdQbkkvR2FtdmU4aGVRYitVUGRXdU9KR3p2V1hzNWRz?=
 =?utf-8?B?RUJVWGJYZVVVd3BRU2d2MnJZVHdYR3diL3JUdjBOVWNoS2xFRG5jZUVXcENw?=
 =?utf-8?B?azlMd29oRVI0QUNpbXJjL2dMZ3Q5WkExbldnVVFjSWdpbXN0eUlBOHhGKytp?=
 =?utf-8?B?MWdLcjg1SmdNR2ZuM0pMdlV0WFJnZ0l5Ukhtck9SbnVNcjhiTFBTZjZKUWxO?=
 =?utf-8?B?QS9uM3FVMjR0elkzYlN2Z2p2cE52VFZEeVYxSEEvaXI5VWpURkxBdERPL3dN?=
 =?utf-8?B?Ym5HTy9xZkRDRTI2NTN1dDFpenVCQ1JDWmJzTGhFOUFSVUN5V3prL3pWeGVN?=
 =?utf-8?B?VE5TTi9XRjhwL1h6VC9tK0wzY2QyM0hKUzI5Nlp3a0hXSGljQnhEMjJsSTdC?=
 =?utf-8?B?SDRGQkNSMHpmWCtLa0U2UTY2Uk9EcXNQMWlWZHEybjZtZGozMnlZNGVYS3Na?=
 =?utf-8?B?VXF1eEw2V3FUeXY5N1VXS1VrSFFzTVhSejJ0WGRDaGtmM1l0RTlzNzdnMFJL?=
 =?utf-8?B?aUl6enZCUS9PbHZmWjY5YzJVd1kyNU8xNU43cy83QUFIb21tNVF2NWg2alNz?=
 =?utf-8?B?Q2JTT1ljVUNvTkxjTURqYzhjcDlVUDJJMnVVb0QxY3BjcUp2ODNHT0RFVXk2?=
 =?utf-8?B?NEVma2w3MmM5NHpsUldHWS9PN1JDWFRSanJQdG9Sc2dESjFNc1h4dHd3NTZ4?=
 =?utf-8?B?VkFSVklDbEZsNm9kSnlVVkp5eFhXQU1SMjR3bXdjYVdPeGNWSFZMNklyT1A3?=
 =?utf-8?B?T3ZnWWM3cEdIcExpVlZSTUFtN1Z6SldnK0luMWVSYXFXRENhSHFreTZzYUlS?=
 =?utf-8?B?eEN0TkthTVRlcjRJZFhWYlp0cjVZK2hyQURTbFAxRGFpSi9KeDVXcDltTXkx?=
 =?utf-8?B?dVQ0RnRQblhBQkZGdHpCNzN1a2FORCs2WEV5WkxyRGNXdm9vd2pvckl4ZFNW?=
 =?utf-8?B?ZEpESW5hdEpzeEh5REJuclVjQy94L3dUZ0lwN0doVno1OUQ5SUoySHJoaEFt?=
 =?utf-8?B?M0RFeU9ra3JvN3VBY05yRkJsUmJnT2ZUYTlPaDBRTFI1a2JMMllWemg3bHN2?=
 =?utf-8?B?SDJUNUZiaHZ6Uk0rR2hRaFJVeEtaWWdlWFpubExKaEMrNXI1VGF0YWYyTmsw?=
 =?utf-8?B?UjROVkE0TS8wV3c5RkFuLzV1UERzdFBHOHNGcS9FVUZqUnV3Y01BaGVwZHNw?=
 =?utf-8?B?YzZqSmR1RnVpUy9WV2RleENIcThoUFJvcEtVdG9qRVdQREFFTGxOczQ1MmJi?=
 =?utf-8?B?Yzg1Y1FNMmlNZDNOL0krakwydjJSUHo4Y0M2dHFsRVpGODZ2Lzd2YmlFaTFF?=
 =?utf-8?B?cmZJTXdlWWFqaFQzZEpBMWFvbjFWQVQ2ZlRGRjVhNGE5WGU4elhQdHM4NmNG?=
 =?utf-8?B?c0greTIwbUVXNTBaQ0NXVk5scDk5Y3dXNmFqWFpyNXVwQ1lwSlA4dmVZZzho?=
 =?utf-8?B?Wmt3ZTZROFpKb1ZLTTVid1lDOEJBTzU1b3NpUUtPRUdYelJZNWg2NUhmVHF2?=
 =?utf-8?B?TmJhUzZlWGh2cHNDQk1lRVRJQko4eUNjcHZLY1lxY2tSdmd4Q3RHWHhyS3FS?=
 =?utf-8?B?dXB3bTEyOUtwZnZQSmhZTUcrMGgxSlFwSEMwNW1EQXJLbTBDekZVQTU2WFFv?=
 =?utf-8?B?TGJhdTBGY1NQTDZSa3pBQWNPaERkQi9yTUhmYXZxVjN2YUFpaUpYaVRvZldX?=
 =?utf-8?B?U2VQay9OcG4vZkZRQkxJTitqUFRZUXZIcDFpcVc5WWxUK2FKTzBFOEl0WDNR?=
 =?utf-8?B?NExWOGw5amJWdmJYMC8zbEJNSlRET2Z5VXFmNlBWZXBvaWRmWmNOaG12Mmx5?=
 =?utf-8?B?aXhacEVQWStnbXFUbGZrb0ZDWTNmelA0bXo5ZkxsQzMyOWY2VUdaeDU0dkJt?=
 =?utf-8?Q?vy82f8whx41tfQtrbqAKY7z1Y?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDF703E5D0DA8047944A7E294BAC36B9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JmSstUqK84HfyUx4wcPLi4/PF67Y+x9vss6ISozXEh5xVxY78yH8RzmagFpct5nK5kzx7jpAqkp8356QI1TvNsMo0Q8UF7TM5N2JHENrAx1CEXJwSXKOpbHlaAdd/+l653RX3VDzvg80+VN1+7uffl6av+x2SQ6LSMGhGzdwAV4xTRjubtEkosiTUkP8Huukc/9OIJvcAcAkyVV6bT4lYP2jtipKLXH0DSULs2D3IpOOAsgw7nT7PaqCMudYsrZFReKUKnuvnLTcoC/kQYfXp32ItniXYgf/FWF0spgoJDX5o4A3Iy94Jpcd388GAhZ5T6EmM+mERcS7APHK/Eq0vo6N0ILOvngSDMkNlT/Vkal8bTd2F7hCkKyt21U0zs0alVNJiW4KZc9wk1tc85TS/bP1XPjIR4RTgkhDoqd0QWP7t1WquRYMg+0uQNbHCEtkc6sAeFnX3MDHJ1GgENeZ2UCiUCnQ1cZpkCjOUlRwlDJWumRzicefDIuRtLNKDC3erwfC2n3ajklzCkfSC2g5WSOzJlrUJ3+WgcG9n5zxjyoCGUyKrQ+3bG8X/EIUgEyrjVkwXc4f25brD3QzJrx80qQl74NB6P1pNWyXh8jIMNNFR7do7RYJ1O/i+apgiWXC5K5cLITrQ+yEd/d6F8c+lQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8c534b-6a50-4dc8-4791-08dcb66493ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 22:10:27.2196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KIAhfTSWj0N9LnI/pbTw2ZndeiTZi8CJitIBYbgSeXmeo2NvxxKN5OLEIU8sMbSjJFDjXryWlbVt90vy/RUsnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7120
X-Proofpoint-GUID: 9i4Kld2pzEujSuFuCF58YLIdwhvyCTgH
X-Proofpoint-ORIG-GUID: 9i4Kld2pzEujSuFuCF58YLIdwhvyCTgH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_18,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408060155

SGksDQoNCk9uIFR1ZSwgQXVnIDA2LCAyMDI0LCBBbmEgQ2xhcmEgRm9yY2VsbGkgd3JvdGU6DQo+
IEhpIHRoZXJlLCBJIGhhdmUgYmVlbiB0cnlpbmcgdG8gcmVwbHkgdG8gdGhlIGxhc3QgdGhyZWFk
IGJ1dCBmb3Igc29tZQ0KPiByZWFzb24gbXkgZW1haWxzIG1pZ2h0IG5vdCBoYXZlIHJlYWNoZWQg
eW91Lg0KPiANCj4gSSB3YXMgdHJ5aW5nIHRvIG1ha2UgdGhlIG1haW5saW5lIGtlcm5lbCB3b3Jr
LCBidXQgdGhlIHN5c3RlbSB3b24ndA0KPiBydW4gd2l0aG91dCB0aGUgRGViaWFuIHBhdGNoZXMu
IElzIHRoZSA2LjkuMTAga2VybmVsIGZyb20gRGViaWFuJ3MNCj4gdGVzdGluZyByZXBvc2l0b3J5
IHJlY2VudCBlbm91Z2g/DQo+IA0KPiBNYW55IHRoYW5rcyENCg0KDQpJJ3ZlIHJlY2VudGx5IGdv
dHRlbiBiYWNrIGZyb20gbXkgYnJlYWsuIFNvIEkgbWF5IG5vdCBoYXZlIGEgY2hhbmNlIHRvDQpy
ZXNwb25kIHRvIHlvdXIgcXVlcnkuDQoNCkl0J3MgZ29vZCB0aGF0IHlvdSdyZSBhYmxlIHRvIHVz
ZSB0aGUgbmV3ZXIga2VybmVsIHZlcnNpb24sIGRlc3BpdGUgaXQNCm5vdCBiZWluZyBNYWlubGlu
ZS4gV2UnbGwgc2VlIGhvdyBmYXIgd2UgY2FuIGdldCB3aXRoIHY2LjkuMTAuIEkgaGF2ZSB0bw0K
bWFrZSBzb21lIGFzc3VtcHRpb25zIHRoYXQgdGhlIGR3YzMgYW5kIHhoY2kgZHJpdmVycyBhcmUg
bm90IG1vZGlmaWVkLg0KDQpDYW4geW91IHByb3ZpZGUgZmVlZGJhY2tzIG9uIHRoZXNlIHRvIGdp
dmUgdXMgc29tZSBjbHVlczoNCiogRGlkIHlvdSBlbmFibGUgYW55IHF1aXJrIGluIHlvdXIgY29u
dHJvbGxlciAoZnJvbSB0aGUgb2xkIGtlcm5lbCk/DQoqIEZvciB0aGUgZGV2aWNlcyB0aGF0IGRv
IHdvcmssIHdoYXQgc3BlZWQgY2FuIHRoZXkgb3BlcmF0ZT8gQ2FuIHRoZXkNCiAgd29yayBpbiBi
b3RoIFN1cGVyU3BlZWQgYW5kIEhpZ2hzcGVlZD8NCiogSGF2ZSB5b3UgdHJpZWQgZGlzYWJsaW5n
IHBvd2VyIHNhdmluZ3M/DQogIChDaGVjayBpZiB5b3UgaGF2ZSAidXNiMy1scG0tY2FwYWJsZSIg
b3IgInVzYjItbHBtLWRpc2FibGUiKQ0KKiBEb2VzIHJlbG9hZGluZyB0aGUgeGhjaSBkcml2ZXIg
cmVjb3ZlciB0aGUgaXNzdWU/DQoqIENhbiB5b3UgY2FwdHVyZSB0aGUgZG1lc2cgYW5kIHhoY2kg
dHJhY2Vwb2ludHMgb2YgdGhlIGlzc3VlIGZvciB0aGUNCiAgbmV3ZXIga2VybmVsPw0KDQpCUiwN
ClRoaW5o

