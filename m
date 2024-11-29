Return-Path: <linux-usb+bounces-17965-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3E9DE90D
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 16:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2FE71638B6
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2024 15:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEA713D8B4;
	Fri, 29 Nov 2024 15:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="TpKSTQLZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930E11FAA;
	Fri, 29 Nov 2024 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732892515; cv=fail; b=fItoCASa3zjANXb26mGhiqXZCOHORzitWkm5udxwWAbW4V9Oiesj/vaTH22a57NnHIDlpu9F8ofTyb/BDFyOimTzoIHWBx0wt7jBlJQ2YsqgCXeIylg01PcSnJsYV5QnWnqnVVmwpbjtz3vbA7sqxeiAD0RtYoQUtUmrNrmDmYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732892515; c=relaxed/simple;
	bh=55CT2M4GTHpBKe975tWehjimubQuBtXakURh/F2V01s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ON0xpfQXYENs77dsfeYTGdu1ZRhuJT1PVV27akxoE9tLhrXElEh/X7PzFxghX64caBcjNoTiH9VaYH9IvfQavS61FhJ9i5uFg3o2eGjnbfkz23omdZWxvt5DSGGRWNN3hjIwMpLIXatCACanwyvomBT71by++h0BOTRf4t4ol+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=TpKSTQLZ; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATCiW4K010922;
	Fri, 29 Nov 2024 07:01:24 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 437dvt878c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 07:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZXsFAkXSowtGxG5khTWQrk42oCh5uHNP+lvyKYAmDywc711aAAMktaFN2Xku0EFxU06Gr0LkF8ovDtHuea7nVnc6jN/8HzCR3KMIzUxatiDBN12F6TYXs6C6aCmJUHKUEzv6GYRhF6CbYALDavspthgazeQICRyFBD9QbBlKEXbqE/n1c88VPdjE9syBj5waYR1WwEDxFNo6VaKIkoG5/h6HrOs6WAYRIZgvo63l/VM5IfV3z/X+0rtnfMjLcOtRayDNk8FqLOwvbZrBH4ZePm+MmDe4frC2lW3CWjYlLSofiNhldeiUuaivl+THF/MUxXqkPconk5MHYhXVl2t3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6drQhuhPDDWYbW1Y7rIhzFhyXEH0YKdoYogEure8WBk=;
 b=AJiTg0ezbBWTsiy54Z5u019WtnWqnTY5J9ICGr9nUzIascGFPyycvsvs2A0uSwJyX/gXKe3GlGJhswmv5P+3ClPBtOXeSKes0IGkOz18+U9LXm3Dhe+BoEEtqeIL050B3DI6M2F8l2YoI6x9NRRX50Hm+QWvFNL1ks74A8My/CQQXafrWtq6C0/y8moj5IIhEnLDviuzlSt03lI4gAiN6ZD9gxAR1Vu1mQY8bDZxnThrADccbxQBYGu7RwURxKFk9nNB9ZMtZFJkIfqWZwK/ikugbZd0hWHWKqHRKozs0AT5mmbJ/HN/FfTKv6pRpz1eqK5iPMuLLlmWFnsCra+EyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6drQhuhPDDWYbW1Y7rIhzFhyXEH0YKdoYogEure8WBk=;
 b=TpKSTQLZDy53Y0BrQuYzouG+eu2g6mT36KmL18zLDl4MNjO/AWdOuvEDLIoHFmJM2OkN8SADo/eorklImKgZnTuN3roGl2+5ug4B8UfrrLFSxEKgBF4zJ+kpnYTFooybW+XpXXlaUuRut+fhHKci0omZTBbwS28WeCsAyAnAUhU=
Received: from MW4PR18MB5084.namprd18.prod.outlook.com (2603:10b6:303:1a7::8)
 by SJ2PR18MB5787.namprd18.prod.outlook.com (2603:10b6:a03:577::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 15:01:18 +0000
Received: from MW4PR18MB5084.namprd18.prod.outlook.com
 ([fe80::1fe2:3c84:eebf:a905]) by MW4PR18MB5084.namprd18.prod.outlook.com
 ([fe80::1fe2:3c84:eebf:a905%7]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 15:01:18 +0000
Message-ID: <2467884e-9a49-4ab1-9c57-fe58f619048d@marvell.com>
Date: Fri, 29 Nov 2024 20:31:37 +0530
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/5] phy: fsl-imx8mq-usb: add tca function driver for imx95
To: Xu Yang <xu.yang_2@nxp.com>, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, Frank.Li@nxp.com,
        jun.li@nxp.com, l.stach@pengutronix.de, aford173@gmail.com,
        hongxing.zhu@nxp.com, alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-usb@vger.kernel.org
References: <20240802091702.2057294-1-xu.yang_2@nxp.com>
 <20240802091702.2057294-3-xu.yang_2@nxp.com>
Content-Language: en-US
From: Amit Singh Tomar <amitsinght@marvell.com>
In-Reply-To: <20240802091702.2057294-3-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::21) To MW4PR18MB5084.namprd18.prod.outlook.com
 (2603:10b6:303:1a7::8)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR18MB5084:EE_|SJ2PR18MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ab0190-60e9-48ce-1592-08dd1086ad8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFJjWkRSUW0zbXlyV1FLak03NHhZZDNsQ3VEQUF4MTduc2NCSFdDbXhrOEZ4?=
 =?utf-8?B?NUdUTGlFS1pOclJPajI5MnRwR2JlVERLSkNuVThRUlFvSEMzTVlkMjd0L0Yz?=
 =?utf-8?B?TkdWL3FUNVVzTG5JT2dwRndOVTZuenBrS2xwOG9zRUhmUmhSZm82S2xRUWcv?=
 =?utf-8?B?RXZrckhyeERxNUtOb1FTbXZoMUNTTHpXYjI2OWkyNnRWd1RZci9BSmxnMW82?=
 =?utf-8?B?TTQrQU1FUzAvWmJ6amE3QWh5MjAzM3ZROUE2aDlFSXBXTXhISnlDUTdGdUFM?=
 =?utf-8?B?Tnk4NnMwc01SRk1GeGlQenRETEJ1dUQyWXJUcS9JK3hnUnpGbnBWUDZibDFV?=
 =?utf-8?B?K3hxbnE3Uk42MkZiQXlQdzVobnAwV0dsL0hoOVhWNmpUcFZ2UmZjeGEvZWF5?=
 =?utf-8?B?VkVRdHMwQVdiUGJZK0hZVkxDcGNSWVd3YXFzajdxdlAxN3lLRmJJOWJLOHBi?=
 =?utf-8?B?RXVDbWlWMjFiRkw4NmNEVm1RaHFUcXkxaGNDcEFhVjFkeWFVdjNzcjh6Zk5i?=
 =?utf-8?B?UitGUmN3eERBM1ppRllabk9qODA3RlJIa1E3QnJWMGNTYVVRMFZ3UUNLMFhh?=
 =?utf-8?B?NkFnMFBWQlhWWlZTVWF0VXh4T0pEREZra1NYNCtiVUtyOTJzRWlPNnBEb0FB?=
 =?utf-8?B?dEpPK1d0eG9remxyK2pEc0NEUTVUZUxZNjlXTDdzTDlRQXkrZmFNc290ckg1?=
 =?utf-8?B?UFdOL2V5V0lqOFFKanF3UGljS0NSU0dMaDZRU29pY1BycnoyUUhhejY4TG5m?=
 =?utf-8?B?b1RDeWxDZXV4VW5Pd25mZWtFK3M4L3I1cTlrV0VQVmViSkl6aDZRa202Wlh1?=
 =?utf-8?B?NFBoNWEwaEorOCtDaEJtcnQ3MGVhb292RlZDa0xUTXpPZ1ZwZjdGZXBKUDc4?=
 =?utf-8?B?QnhTVXcvR0ZXZzZmMHRPdjVWMjlkbXQzMmpMZHlpTERkZlh2cWtabGtPbDgx?=
 =?utf-8?B?LzlHakpvZExVa0RhWmNZYnRUTGpGZVQ4Ty8wazJpK0ZXaEZkZE03UUJoNUNr?=
 =?utf-8?B?UXJUOFZiTnIwZkp6OWpLZVN1ZWN6b29QcHN0TVBxQU1hNHNCL1V1cXN5OHkr?=
 =?utf-8?B?OFNFR3ArYm1VQlpuVHRVV1VHUjVuYTIyZHhjVG01WlRSMjBoM0JHL1h0N2g0?=
 =?utf-8?B?WjQ0S3QxUHFyMEM3MDNHUERaQjBNMDZrcFg2SnZUbk9YNDJaU0RFMS9FMklp?=
 =?utf-8?B?cFRORUZsRXBybVQ5czQyQ0JTQmx2RCtCS0JFdmdTTXdiRHo5ZDV4cjhPcTY3?=
 =?utf-8?B?d2s4LzNkazBrd3VJaXd0RDdrbzlBSHZTazRPNjl3T1BvUTdtMytYS1NocTZs?=
 =?utf-8?B?dExWdjVleUpEK3Y3QmxTUllSNmFHUVp1UExmSFppM1JGcGdCOEQ4NHhpbEJC?=
 =?utf-8?B?Y012ekYzNUFiWjFCd0lxSFlBY0pNNmlLM2dDdlUzWDlhYVI5MW43ZkQzTEN5?=
 =?utf-8?B?VUZMNTc2VTJuMHpFWHArVXluSTZkbGlpYXBEOG93STl3N2IvRnlrUWo5OUFx?=
 =?utf-8?B?RDFsaStRdUdsb2ZDck1VcDZ6T3FGcGhuWDVNU25ac0pna2V6Yzh2ZHNhUEFB?=
 =?utf-8?B?Y2dPamdQWjVFbWpWWjRtSFRQeVptaGZlYUtHNmYvTWhpV1pYdXV4WHBzcGRn?=
 =?utf-8?B?V0tkYmZiT3lxb2NlcEVnNG84UFRzSDQ0WUdKR0ZwMkU2aHNpNmRUVXFHd2ky?=
 =?utf-8?B?bDJmSUhDaWFFZVhQVGp4YkQ0SFFRK29veDNudTR6MkZzTWdqWEFsN2tzQm1X?=
 =?utf-8?B?NUI0UEdSUjkxYnY5VVhzV1JPbkE2WDhha3I4cFJ1b2Q2ZFV0TGY3ODF1Qm02?=
 =?utf-8?B?aXEwN3REaDBHZDNPVEJrK0phT0NUNG1NbndqZEdBV0thbnRSVjFTYllPeGVM?=
 =?utf-8?Q?Is4Kwh9Fwe+J3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR18MB5084.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em1najlLVldYcjdSQ3J0Y3hRVGhqNm01SERCVEVmemZiNTdpSXBIYkFKZ3cx?=
 =?utf-8?B?Ym5EQmhwTnI0TDk4R0w0ZGFPUjdTZlZzQjF0cGhMMVpTQUVLenhMRmQrZWVl?=
 =?utf-8?B?ZXJQQUxZK1NQeElpYm16cjh3aG9HTG1aeGp1anh5MGpSdkFCYkN4Ukp0Y2c1?=
 =?utf-8?B?MkQ3OXZaaFNIcEhOemNYdVpMU2RlU3hKdnJWTitObkJyVERoMnY5RGpFcUps?=
 =?utf-8?B?bmlOdU5COGZzWC9CYTJ1K01Oa1B2SFlNd3czUVVtZU5IVE1wZnNvVDZBbkhr?=
 =?utf-8?B?UDZFc1pzb1kwRmxwc2tGT3NqdEVDZ1d5YlNpajc3NHE5a2RvdzNMRUtNU0dM?=
 =?utf-8?B?MGtRclZ0SElJTmdOc2dXaS9QWk9wV3g0dTJCM0dGKzZyZGYvTTMwTEtoM21D?=
 =?utf-8?B?Q0JWVkQ3dnQ5c3VBeFBvQTdlMGNtbWhMVm1QMjhJai9xVzFES3VWY2poTUpP?=
 =?utf-8?B?cTUxL3V3d3pha04yQWdXUWxoY2k1QzVPc1RNMnFmd2hvMGhsR1B4WW00L0ly?=
 =?utf-8?B?ZWdNRWgwdmM2SDVSTFNBMDloV0ZINFdrcFRGSG5iRzNlMTRqTG4rWTFXRmJT?=
 =?utf-8?B?RkNxUlhXU2h0eFNvZlJwSmRyRzlPNXptYTFwQVExSHl1eGN0NzcwOS93cjh3?=
 =?utf-8?B?Y3ZLNS84Nm41K0lGWnR0Tjd3WitUdjVKK2V1STNtUng1K3B4eVVtQU0vb1g3?=
 =?utf-8?B?U0NNcisrdTNmak1FcU9JQzlNbVBxZjBtVEVlVnR3V3lYa2RyTnhrMkY1aDVv?=
 =?utf-8?B?Tmc2K0dUVjhJVWlMWG9mWEJVZUoxUC9pQ1J1ZWY1Ymw0M0U5bmllQ212MTIz?=
 =?utf-8?B?dkM3TlZOSkJHQnNJVDUzUHM1blgrZ2VncE5GRXdOQTdyczhUWTVzQ2NlQ3d3?=
 =?utf-8?B?NGdCc3ppVElvS0NEUHlVaHQvekRuY2wrVFdiNG9nTGN6KzI2MDNJUXR1SWVF?=
 =?utf-8?B?MEJ4ZCtaSzBCSGVHZE9VaE05dER3Y1ZBWVN3L0FvMVlYMkF3WmNxUUJubytT?=
 =?utf-8?B?cnBkOW9IMkE5WjR5ZWpHMUdjR2lHV1dQc1BhT1Jib2pXcS96Q240L084RnRL?=
 =?utf-8?B?Z05uRFliMEFpVDZWcFVKdzVXWkEwR3luSnJVa2Z0WVU3M29CL0RuNUhKUnZM?=
 =?utf-8?B?YkxWUS94d3NXdDh4MnpCRW1uOVpOcDNYTmx4WGRyRnRLUGN2NitYMGFoK3lh?=
 =?utf-8?B?Nk1MSTd2MWFBazIyWHR1ZjA1QUp0b081MTRyenpCNVBqUXlaOTBCZFNWQU1v?=
 =?utf-8?B?K0oxMkF2MjBCekx2Smh5MldlcXBmeWUwOXZjNWNOdCtPWkg5YVYyZFpqQUJO?=
 =?utf-8?B?cGlGZjRaL3ZpNys4OGliTkx3YTlGaFl5YU93ZWZoNmFpTVFVQmVvMTJsekFJ?=
 =?utf-8?B?c3ZFTWY4RVROdmhsc3N1QWhqTWVuRnNReEU3dzRJMDh6OFVFalZEcHZSaXlP?=
 =?utf-8?B?dFFSS0M2R0pWS2l5bGcwbVU3UG9CUUQ4YU84a24vWkNOQTNmZHVPN0E4NGU5?=
 =?utf-8?B?QmhBNFovcFZFREJRY2xWZnJQb2lGK0VpY1Y3WEMvTnpnMGNEL0FhS0t1Wkpk?=
 =?utf-8?B?UUxxTHlKWlZHL1ZES20wbHlDcjBlSlZPZTFhUnVlZTU0ZXlvUjh6VVNTbUhW?=
 =?utf-8?B?T1YrZnJFQUNVSXlKMGluWUx2ZEhvYUpZK2RXUFUvSTU3U204YTVidi9QbTNa?=
 =?utf-8?B?cXVtVEZGQ1BQeFloTEgvWGJLOHdNMkhvWFlRQWVHK0swTU8xUExjMmMrajVk?=
 =?utf-8?B?ekQrV1dKejdPakZNOVVBSFdBS3FxdFdhNTN0Y1VOL054cDNJb2Y5OUU4WHYw?=
 =?utf-8?B?Q1hyRnNtRERMOTBlYjlFaHpTUkdzbmdQOGM0bHBuZVZNQU9yTUVjR0dGSG03?=
 =?utf-8?B?NUsrYTF4Zm40QWFhelJxZ3BsMFl3TEMyM2EwMjljcmhoZG1lMmdZQTdSQzZa?=
 =?utf-8?B?VFdQTU9yZDR6WkovM2w4M25qYkEzTEdNb2M2T1lTcjZmRjJsRVZqVUtnODB4?=
 =?utf-8?B?TG9yQXVyQUcvUTZ4RVdja0VkbWxUV3JIdUIraitZWmxzNEp4aXZ4bExxbk91?=
 =?utf-8?B?MmVFNnFxeTJiN3FIbkdKR054MVM2ZGwzMURBN3VDMEQ4eGIwNmJWSEdiQWdy?=
 =?utf-8?Q?sdOkPTV26t47TIYv9W9OvHBd4?=
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ab0190-60e9-48ce-1592-08dd1086ad8a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR18MB5084.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 15:01:18.2951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BzP8nNe9eFNXAiRxRsqigL1RE/KyMof88mzL88TdzTCKzeqHody8tgfNgQ8MLwvyyCPTd8bTCZY8imeN74yDbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR18MB5787
X-Proofpoint-ORIG-GUID: QnChAq1L8OpkmPYun4NjIjQXcn9WL2NB
X-Proofpoint-GUID: QnChAq1L8OpkmPYun4NjIjQXcn9WL2NB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01

Hi,

> The i.MX95 USB3 phy has a Type-C Assist block (TCA). This block consists
> two functional blocks (XBar assist and VBus assist) and one system
> access interface using APB.
> 
> The primary functionality of XBar assist is:
>    - switching lane for flip
>    - moving unused lanes into lower power states.
> 
> This info can be get from:
> i.MX95 RM Chapter 163.3.8 Type-C assist (TCA) block.
> 
> This will add support for TCA block to achieve lane switching and tca
> lower power functionality.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> Reviewed-by: Jun Li <jun.li@nxp.com>
> ---
>    drivers/phy/freescale/Kconfig              |   1 +
>    drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 238 +++++++++++++++++++++
>    2 files changed, 239 insertions(+)
> 
> diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
> index dcd9acff6d01..81f53564ee15 100644
> --- a/drivers/phy/freescale/Kconfig
> +++ b/drivers/phy/freescale/Kconfig
> @@ -5,6 +5,7 @@ if (ARCH_MXC && ARM64) || COMPILE_TEST
>    config PHY_FSL_IMX8MQ_USB
>    	tristate "Freescale i.MX8M USB3 PHY"
>    	depends on OF && HAS_IOMEM
> +	depends on TYPEC || TYPEC=n
>    	select GENERIC_PHY
>    	default ARCH_MXC && ARM64
>    
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index adc6394626ce..18d00cec0665 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -10,6 +10,7 @@
>    #include <linux/phy/phy.h>
>    #include <linux/platform_device.h>
>    #include <linux/regulator/consumer.h>
> +#include <linux/usb/typec_mux.h>
>    
>    #define PHY_CTRL0			0x0
>    #define PHY_CTRL0_REF_SSP_EN		BIT(2)
> @@ -50,11 +51,66 @@
>    
>    #define PHY_TUNE_DEFAULT		0xffffffff
>    
> +#define TCA_CLK_RST			0x00
> +#define TCA_CLK_RST_SW			BIT(9)
> +#define TCA_CLK_RST_REF_CLK_EN		BIT(1)
> +#define TCA_CLK_RST_SUSPEND_CLK_EN	BIT(0)
> +
> +#define TCA_INTR_EN			0x04
> +#define TCA_INTR_STS			0x08
> +
> +#define TCA_GCFG			0x10
> +#define TCA_GCFG_ROLE_HSTDEV		BIT(4)
> +#define TCA_GCFG_OP_MODE		GENMASK(1, 0)
> +#define TCA_GCFG_OP_MODE_SYSMODE	0
> +#define TCA_GCFG_OP_MODE_SYNCMODE	1
> +
> +#define TCA_TCPC			0x14
> +#define TCA_TCPC_VALID			BIT(4)
> +#define TCA_TCPC_LOW_POWER_EN		BIT(3)
> +#define TCA_TCPC_ORIENTATION_NORMAL	BIT(2)
> +#define TCA_TCPC_MUX_CONTRL		GENMASK(1, 0)
> +#define TCA_TCPC_MUX_CONTRL_NO_CONN	0
> +#define TCA_TCPC_MUX_CONTRL_USB_CONN	1
> +
> +#define TCA_SYSMODE_CFG			0x18
> +#define TCA_SYSMODE_TCPC_DISABLE	BIT(3)
> +#define TCA_SYSMODE_TCPC_FLIP		BIT(2)
> +
> +#define TCA_CTRLSYNCMODE_CFG0		0x20
> +#define TCA_CTRLSYNCMODE_CFG1           0x20
> +
> +#define TCA_PSTATE			0x30
> +#define TCA_PSTATE_CM_STS		BIT(4)
> +#define TCA_PSTATE_TX_STS		BIT(3)
> +#define TCA_PSTATE_RX_PLL_STS		BIT(2)
> +#define TCA_PSTATE_PIPE0_POWER_DOWN	GENMASK(1, 0)
> +
> +#define TCA_GEN_STATUS			0x34
> +#define TCA_GEN_DEV_POR			BIT(12)
> +#define TCA_GEN_REF_CLK_SEL		BIT(8)
> +#define TCA_GEN_TYPEC_FLIP_INVERT	BIT(4)
> +#define TCA_GEN_PHY_TYPEC_DISABLE	BIT(3)
> +#define TCA_GEN_PHY_TYPEC_FLIP		BIT(2)
> +
> +#define TCA_VBUS_CTRL			0x40
> +#define TCA_VBUS_STATUS			0x44
> +
> +#define TCA_INFO			0xFC
> +
> +struct tca_blk {
> +	struct typec_switch_dev *sw;
> +	void __iomem *base;
> +	struct mutex mutex;
> +	enum typec_orientation orientation;
> +};
> +
>    struct imx8mq_usb_phy {
>    	struct phy *phy;
>    	struct clk *clk;
>    	void __iomem *base;
>    	struct regulator *vbus;
> +	struct tca_blk *tca;
>    	u32 pcs_tx_swing_full;
>    	u32 pcs_tx_deemph_3p5db;
>    	u32 tx_vref_tune;
> @@ -64,6 +120,171 @@ struct imx8mq_usb_phy {
>    	u32 comp_dis_tune;
>    };
>    
> +
> +static void tca_blk_orientation_set(struct tca_blk *tca,
> +				enum typec_orientation orientation);
> +
> +#ifdef CONFIG_TYPEC
> +
> +static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
> +				enum typec_orientation orientation)
> +{
> +	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
> +	struct tca_blk *tca = imx_phy->tca;
> +	int ret;
> +
> +	if (tca->orientation == orientation)
> +		return 0;
> +
> +	ret = clk_prepare_enable(imx_phy->clk);
> +	if (ret)
> +		return ret;
> +
> +	tca_blk_orientation_set(tca, orientation);
> +	clk_disable_unprepare(imx_phy->clk);
> +
> +	return 0;
> +}
> +
> +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> +					struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct typec_switch_dev *sw;
> +	struct typec_switch_desc sw_desc = { };
> +
> +	sw_desc.drvdata = imx_phy;
> +	sw_desc.fwnode = dev->fwnode;
> +	sw_desc.set = tca_blk_typec_switch_set;
> +	sw_desc.name = NULL;
> +
> +	sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(sw)) {
> +		dev_err(dev, "Error register tca orientation switch: %ld",
> +				PTR_ERR(sw));
> +		return NULL;
> +	}
> +
> +	return sw;
> +}
> +
> +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> +{
> +	typec_switch_unregister(sw);
> +}
> +
> +#else
> +
> +static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device *pdev,
> +			struct imx8mq_usb_phy *imx_phy)
> +{
> +	return NULL;
> +}
> +
> +static void tca_blk_put_typec_switch(struct typec_switch_dev *sw) {}
> +
> +#endif /* CONFIG_TYPEC */
> +
> +static void tca_blk_orientation_set(struct tca_blk *tca,
> +				enum typec_orientation orientation)
> +{
> +	u32 val;
> +
> +	mutex_lock(&tca->mutex);
> +
> +	if (orientation == TYPEC_ORIENTATION_NONE) {
> +		/*
> +		 * use Controller Synced Mode for TCA low power enable and
> +		 * put PHY to USB safe state.
> +		 */
> +		val = readl(tca->base + TCA_GCFG);
> +		val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYNCMODE);
> +		writel(val, tca->base + TCA_GCFG);
If the register is intended to be completely overwritten, the readl is 
unnecessary. Otherwise, ensure a proper read-modify-write sequence.
> +
> +		val = readl(tca->base + TCA_TCPC);
> +		val = TCA_TCPC_VALID | TCA_TCPC_LOW_POWER_EN;
> +		writel(val, tca->base + TCA_TCPC);
> +
> +		goto out;
> +	}
> +
> +	/* use System Configuration Mode for TCA mux control. */
> +	val = readl(tca->base + TCA_GCFG);
> +	val = FIELD_PREP(TCA_GCFG_OP_MODE, TCA_GCFG_OP_MODE_SYSMODE);
> +	writel(val, tca->base + TCA_GCFG);
> +
> +	/* Disable TCA module */
> +	val = readl(tca->base + TCA_SYSMODE_CFG);
> +	val |= TCA_SYSMODE_TCPC_DISABLE;
> +	writel(val, tca->base + TCA_SYSMODE_CFG);
> +
> +	if (orientation == TYPEC_ORIENTATION_REVERSE)
> +		val |= TCA_SYSMODE_TCPC_FLIP;
> +	else if (orientation == TYPEC_ORIENTATION_NORMAL)
> +		val &= ~TCA_SYSMODE_TCPC_FLIP;
> +
> +	writel(val, tca->base + TCA_SYSMODE_CFG);
> +
> +	/* Enable TCA module */
> +	val &= ~TCA_SYSMODE_TCPC_DISABLE;
> +	writel(val, tca->base + TCA_SYSMODE_CFG);
> +
> +out:
> +	tca->orientation = orientation;
> +	mutex_unlock(&tca->mutex);
> +}
> +
> +static void tca_blk_init(struct tca_blk *tca)
> +{
> +	u32 val;
> +
> +	/* reset XBar block */
> +	val = readl(tca->base + TCA_CLK_RST);
> +	val &= ~TCA_CLK_RST_SW;
> +	writel(val, tca->base + TCA_CLK_RST);
> +
> +	udelay(100);
> +
> +	/* clear reset */
> +	val |= TCA_CLK_RST_SW;
> +	writel(val, tca->base + TCA_CLK_RST);
> +
> +	tca_blk_orientation_set(tca, tca->orientation);
> +}
> +
> +static int imx95_usb_phy_get_tca(struct platform_device *pdev,
> +				struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct tca_blk *tca;
> +
> +	tca = devm_kzalloc(dev, sizeof(*tca), GFP_KERNEL);
> +	if (!tca)
> +		return -ENOMEM;
> +
> +	tca->base = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(tca->base))
> +		return PTR_ERR(tca->base);
> +
> +	mutex_init(&tca->mutex);
> +
> +	tca->orientation = TYPEC_ORIENTATION_NORMAL;
> +	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
> +	imx_phy->tca = tca;
> +
> +	return 0;
> +}
> +
> +static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct tca_blk *tca = imx_phy->tca;
> +
> +	if (!tca)
> +		return;
> +
> +	tca_blk_put_typec_switch(tca->sw);
> +}
> +
>    static u32 phy_tx_vref_tune_from_property(u32 percent)
>    {
>    	percent = clamp(percent, 94U, 124U);
> @@ -315,6 +536,9 @@ static int imx8mp_usb_phy_init(struct phy *phy)
>    
>    	imx8m_phy_tune(imx_phy);
>    
> +	if (imx_phy->tca)
> +		tca_blk_init(imx_phy->tca);
> +
>    	return 0;
>    }
>    
> @@ -359,6 +583,8 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
>    	 .data = &imx8mq_usb_phy_ops,},
>    	{.compatible = "fsl,imx8mp-usb-phy",
>    	 .data = &imx8mp_usb_phy_ops,},
> +	{.compatible = "fsl,imx95-usb-phy",
> +	 .data = &imx8mp_usb_phy_ops,},
>    	{ }
>    };
>    MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> @@ -398,6 +624,10 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>    
>    	phy_set_drvdata(imx_phy->phy, imx_phy);
>    
> +	if (device_is_compatible(dev, "fsl,imx95-usb-phy") &&
> +			imx95_usb_phy_get_tca(pdev, imx_phy) < 0)
> +		return dev_err_probe(dev, -ENODEV, "failed to get tca\n");
> +
>    	imx8m_get_phy_tuning_data(imx_phy);
>    
>    	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> @@ -405,8 +635,16 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>    	return PTR_ERR_OR_ZERO(phy_provider);
>    }
>    
> +static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> +{
> +	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> +
> +	imx95_usb_phy_put_tca(imx_phy);
> +}
> +
>    static struct platform_driver imx8mq_usb_phy_driver = {
>    	.probe	= imx8mq_usb_phy_probe,
> +	.remove = imx8mq_usb_phy_remove,
>    	.driver = {
>    		.name	= "imx8mq-usb-phy",
>    		.of_match_table	= imx8mq_usb_phy_of_match,
> -- 
> 2.34.1
> 
> 


