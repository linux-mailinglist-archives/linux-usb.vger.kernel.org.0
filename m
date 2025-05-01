Return-Path: <linux-usb+bounces-23592-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B855AA58F4
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 02:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8166D1B65039
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 00:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9960A20EB;
	Thu,  1 May 2025 00:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oZookp0m";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="V+5ZfbWk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fXkYzklL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBD3376
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 00:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746058500; cv=fail; b=ffpGm1OADRMM1GP+CTQmH6pW+jSkGnAvod+BlRm/dpFoRvyOmQSeYIgZNRjKzXS8Ib6PYWvyuLFK5QrM5Qc8WiMeQVUxgFlZEh1sMW6IiVb9M9KxqTczT+cRqv6FTF3t5KCbbhmiJx7Np2VZUS3QDg1liyMPiXREuzTgF+lKcqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746058500; c=relaxed/simple;
	bh=JEjsP03D+uWCRagkn7iDMLTE8CEC5vSdCoIYWrciy1Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YQ8nnHzQAjO4Aj+NyKSA4oh2/za847HM0Kev6HzlhkCMCkZ7GuLqmXm/Q+dnMQdJWPQ7zvlRASf5U79oMRaCEW1mb2imKLWsecSOyBY9qXDdImCuOz+adalm65dT1Lfv5ix/LOTEyWrOUSTFNDc9wTqurRgnibd/rpXTv9mD2T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=oZookp0m; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=V+5ZfbWk; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=fXkYzklL reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UMf9Kl021813;
	Wed, 30 Apr 2025 17:14:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=JEjsP03D+uWCRagkn7iDMLTE8CEC5vSdCoIYWrciy1Y=; b=
	oZookp0m2utjIlzi7N2iZtVdd1WT/2naJC0kXsX6uoTyX86Cqj56F6y9/phMnFQl
	lF2u8AzFUkcl+zoolScZghu9XBge6etLSGTScQUvL5zUpWaptgWX3w8G1dg27vtJ
	D+1YMflDuA76IM9X0DPA6kIVZRJulaBDXezUI0EGEBT19rUVzPWZ/xdRUE4tlZEb
	4szclqFgkUSWj4Xfy2BBHbMogUymMEZMNUPGaGZ375+ZH3abwcGhB3uEstbiuB+A
	8xmIh1iY/g/hOD0OH9/xAX4NWw5ji1VsuUdneU0mAIuB9O3mYJw+ld/kOx4yIHX+
	/Rzi0jgPkGyEvXOxptNBQA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 46b6ug73a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 17:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1746058476; bh=JEjsP03D+uWCRagkn7iDMLTE8CEC5vSdCoIYWrciy1Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=V+5ZfbWku6jnGElZyA55dBsJdOoVQzH4JaG/aGAJbjBamTJtmrfEkzSNdwo3nRFfw
	 JGHVhcHfaS6qsX9Re4wjb0fWxg3K4AhurIRDAVwsHErnTqQvQHXqSo1CycfCKUSpFb
	 2hAqCgWuyxSxU31lMSjnCCtwgnczdlBk/lDmwuSryiWr7MoE0vJSEdnwXaKU+ONEjb
	 j1wYOajS2jnLoYXJKoduUqBeyygUIGs5mnAWJZIbLWaFoXZhOdqD8fTuyMHyZMnoxn
	 GomqK1VrQNJQfiphmmQt/b4FFLBOoXfx9WVdQSwlaZyhRtC4c2sCxjM/THLrB8Mbu/
	 H0Wwu9TK1+LqQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0AC8940141;
	Thu,  1 May 2025 00:14:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id AC307A0099;
	Thu,  1 May 2025 00:14:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=fXkYzklL;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4724640555;
	Thu,  1 May 2025 00:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feiXCfzrecRc0r32hWguBwtcVEebMPV19eRvw5tRPro3tTOWG/wp+791g4BP/5Ti1/FjBGL8agVW0nw8pOZ635npVk5LOvPhGZb9A0D+vhMry1YdTNhXNjZ8yIr3rQAvToROUn5yXyJlgXsLcumBsMgWsjiqP0YKoLpDIKzZt1IlDEdioe8I9Zwm7A444CjOq2aIUClQoWzSH1aE26Zr7rJH+uE0zQ6ZwJJ1gyArXpcTiP5etQh4kwDn7AqcVFrCTxlDbIeuvSNfErLRKP980v6OzuUlbjAtd6yFG7/5uT1OrL6lzp9Nz3U8QPP4n5+oxK8+7KUdi78JQGEict6gqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JEjsP03D+uWCRagkn7iDMLTE8CEC5vSdCoIYWrciy1Y=;
 b=qICSUQfelWCsV2dQhJ0YQammk+IMTDErc8yaSX8THlyyrCHJ7hFMZ+EFzo5KpgTeil6lllNh9rapxSFouiM4O3yjI7NRI45HVF7P/xZzs7R4N7lAej6r2P4Ic6NxOJEHZKEYVLwr9Yt8CrJazumn3pcwEDHeemLVPmwdl1oCHvMSO0O3XRcDg9kEaN1XvxllDGczVWCHZoztSAyottruQTypLHjuAU6cOHsV2L7O+oTKt/GxwYF6Q8XRuk044l+qxFKIZuepaXByCwKO/G6nbD21LJ2Tt01cfDKs0qmikS6K4bfIO7/5d0JWTkIgx+CuK/QhLyg/TX2kfkwgzFjK5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEjsP03D+uWCRagkn7iDMLTE8CEC5vSdCoIYWrciy1Y=;
 b=fXkYzklLwXueC/oFDDeroLUYv6DrAxvU6v96AQZz9TokxNFFUghfqfSBGgme1x/4vR3AryQ7KzL4cGplbiDlnI5ynWSeu3zKEYEJ1LbhCqfI2fYr7oZyipHIEZg7G0Tdb/k84wxp8uafa0f7FHdddYnnmC4qkoC2OrRD2c7N9qM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 00:14:31 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 00:14:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Jakob Trumpower <jakob.trumpower@matrixspace.com>
CC: "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
Subject: Re: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.
Thread-Topic: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.
Thread-Index: AQHbtgHIe40KI1iUEEu1UTaSuuJEJrO87/qA
Date: Thu, 1 May 2025 00:14:29 +0000
Message-ID: <20250501001425.ijly3g2knjghvese@synopsys.com>
References:
 <PH0PR06MB7077FFC05705A02FD5CB94C2E8842@PH0PR06MB7077.namprd06.prod.outlook.com>
In-Reply-To:
 <PH0PR06MB7077FFC05705A02FD5CB94C2E8842@PH0PR06MB7077.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB7592:EE_
x-ms-office365-filtering-correlation-id: 386ace09-927a-41f7-4c5f-08dd884523fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ajVLOFhRd1VKeElwbDdnYURJbUVaUGZSOVpKN21LRXNEdkNtcTJFRzJzZFNi?=
 =?utf-8?B?NE9CZFFWS2ZjSkdMZkp4eUkzaEJnYVZVU0hsem9qa1I0aEo2VHhxMnNRZURK?=
 =?utf-8?B?RGozbitJRnJRV1NqYzMvT3pFcEZ2elJSUmpxN1YrTlRLa0lOL25WNCtzSHcz?=
 =?utf-8?B?SkFRSlByRDRwV3d1cy83UytLUFpzVnZIeVU0c3U2R2t6L2ZLTmJWYzA2RllS?=
 =?utf-8?B?aWY3Zjh2eXQ4amlaTDRFYlpyemlJTE96TlhjZDRRRit4YzR2QSt3ZjFYU3d6?=
 =?utf-8?B?MnJpT292YnRPbXhHd3pEVndRQnlxTm96RWZHR3hDaWVOL1F3aXJqNWNWNEpm?=
 =?utf-8?B?dzA0L0xmVUd0alFqaDV6bVNlekdwUFEraWI3dDdia0tQRVFMNnpFNVBsbHRz?=
 =?utf-8?B?RHhlQ3NjQ2tjZDFPMnpEcnNxRGs4QzdDSUIrS0p3OU5qcHJDWVNEZ0RWWUJn?=
 =?utf-8?B?M0prbVN6NkFpMmFKODRIN2RXWEtDVFo3Ti9uN2RRR25pTE42OTRFTDdVVGYw?=
 =?utf-8?B?OUIzQ1FBTXFnS1hYNDlEa2F3VkZVcWpLbDYyL2NKN1BqekFwV084VDNnSEdX?=
 =?utf-8?B?ZVE3dDJhb1Fka0REMjNXVURXa3JPS2xUSG5DSnY1VTJvc3ZIV0xNV2t0QWZ6?=
 =?utf-8?B?a1FQVzVnd2VySWg5aXVPV0IzTW1tU1ZEVG1RS1R3NTZoMVd1VFZ6NnFaS2k1?=
 =?utf-8?B?UDVTYVdzcTl2L283ZEpPWWp4QWxzendMOE5tVzNWVnJRb1RydkFkRE9DU3BV?=
 =?utf-8?B?Vlh4UGlrcFJCSElheGJzTkhFNElIa2xaTlNad003TDJveHo5cGszU0E3UDFK?=
 =?utf-8?B?MVI3d28yRFpnVS81QmVxTCtPVGZmQmhCcUlvQnllT2EzcEFWM0tEQ1BDd1lE?=
 =?utf-8?B?QllTMmpxbk1xa2MxUmhrOHdNR2RqZ1B4S3FDTlZKK3RnSFhIUzYwTjVKclZi?=
 =?utf-8?B?am50WEsvaS9CN3NuR2RQcmhib0o4eHJic1daelIrSytZODFibEs4NXF0QVcw?=
 =?utf-8?B?b3JNMzRydFg5Z2ZTT2FGUk1VaTUxNkxEV1ptckU3VFhNclVZU3BiVGl0ejVs?=
 =?utf-8?B?SEU5ak5CcXNxMCtzdnRnMWV5SU1xeDJhSkMyZW54clhCMXp2d01VVWVZOU1k?=
 =?utf-8?B?dU52WWlVc0F2emRlSjNFNkdJbG9nVkpKU1RPNFdYK2t2ek9Wbm12U0pZcmRv?=
 =?utf-8?B?S0MyQXd3UFNEakVPbVBPYStubU5rNU5OY1lIYVNqbWwzRkFkQ00rZ2piQ2Zr?=
 =?utf-8?B?OXovcjBQUlFNTThoNEx6VGVCYTcxbmp4VWpWNFNocFE4MUp2Q0ZteklPSVBk?=
 =?utf-8?B?bjNqdnhwRUcwUSs4SWtlRXlBcHlMc3lCSkdMQk9sZGJxZnlqTDNRMktiOXJn?=
 =?utf-8?B?WUpyOVV5MEdGTjN6YWllYWozVVRPNmpkUHF6ZGRYb0w0ZTFEUmtPcDA2N21G?=
 =?utf-8?B?UG5kVW1CUS9xV2Uwa3dWTnlIYTlhWGpmdGZoN2wxSU5ZYXNsUFl3bXUyUnBy?=
 =?utf-8?B?SitGSksvUlhOWDh1WGxTU3NTVHJ4aDFYVkdwZ1NaS2ZOZXBlYThQMEFmZXVq?=
 =?utf-8?B?SDIwcXFZaVpaV1VrUzZ0QlFGblNOSVo0L3lyQkFsalRzWHMrRnZ3VllHblF4?=
 =?utf-8?B?U0VvYWRTaW1mRlZUTUJqUGlaWS9HdXhKakN5OWpFam0rTG9lTDhtaVN6Y3VL?=
 =?utf-8?B?TGxqZTQ2REpaazdMR0hEcG5ROU9FaDRDY1hjN01lRXZ4dDV4TDVTMUFHSXhU?=
 =?utf-8?B?RW5iNFRsSnBLZTg5bW50Kzkwc0Q4UTJGcyt3VTRHQ2Q3ZFNKU1VaQkJESHpR?=
 =?utf-8?B?OVU4OTZsVXorTWk5R0laVERPSzJjMiszL1lON1dOV0Z6ajBMZzRpS0tUWUYx?=
 =?utf-8?B?V1J1WHEwMkdjWStEOEZyNmRZZkdSRi9HOUVmcS9SMk5hS1I0cW9HRWdWU2Ey?=
 =?utf-8?Q?Fk+NUIJg4l8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZEV6aGZWMGJDY1pOVDRUcVNpaHd2MnI5bFVIMkhYalRKcUZOWTdabEZPMUVH?=
 =?utf-8?B?WllQK1pQY3RyallrOGh5U3JkSWpRVU5ZOHVMMTdSYVdQZDdlYUVGcWxyVVFU?=
 =?utf-8?B?MXZXNU1ud0o0bmY0bHlId3ltZTVKMkFkMVN2TjRHQ2hZQ1dxbGc1aThLTVZU?=
 =?utf-8?B?d1R5eVBCRzk1WHNvY0dTQWhvbFE5VkhBaGt6eksyL2E5d3B5SGYxRVJ1Qmlk?=
 =?utf-8?B?a0RSTGhEL0hONEtTeHpNbFZqQXZUUUNoYlVQT083OGlYUDBmYUZKM1ROaXE1?=
 =?utf-8?B?WUN6UVdnZFBhWkxKdXJFMW1ON3UrQVg2OFJaUHVCWStjcVpDRFhSWUVRbEdI?=
 =?utf-8?B?OE1Ed3BpaUxRbytBZTIrOFUycCsyb1p5Q0t6MDFBRVluSEZqWTE5a3lmdFNJ?=
 =?utf-8?B?Uk1GZS9PNUU4cWh3eER2QkFMK2IyWXo0ZVJHb1M1VWd1ZGFsUUpWQk0xbHFH?=
 =?utf-8?B?K1hzUjd6Ky9TN1k3UmtkbThOVTl6anlsekdxT0ZyWUhFaDBQZzd1QnhoVUhG?=
 =?utf-8?B?c3ZRZGZSQ25MRWRNSXN5NThtd28zYm0yaEl4NERNdGxnZTJHMm9Zak41V0Fz?=
 =?utf-8?B?LzZ2VVNDWWhpeWdHZ2M4a3J6ajRDZEZtdDhPR01KYkxXelU0OTAxZmtMaEw2?=
 =?utf-8?B?ek0yVFhTTmxNVk5qSm9ObTRIalY4c3NTazYrTzBSYmVIMjFESW9qZnNOMk5a?=
 =?utf-8?B?NTNMVlJJNGdDVytHVW80VHBzWXY4MlMzaGpZVVBkc2xMUVZXdW1NVkE1d0F0?=
 =?utf-8?B?dHRFN3U2TWxXVnoxZ0kwOEdpZ1dJQktreTJaK2Z5a2lPSGE2ZTM2VVM0di9R?=
 =?utf-8?B?MlB4djc5NU00QytsVCtwYWJJbkV4TGIwNkVWbUJyZjBYSUFTSUVMUnI3V2la?=
 =?utf-8?B?d2xBTG03VnNXMUpPZXBSVW53OUwvZkZxZGtpaHRXdEJhZ29sWHNVTFcrOW5q?=
 =?utf-8?B?UnBzNTVIZ0MwSWdkYjJyd2RQR2dqR21oWkdHMDYrZTFPenhCNUZObnJFTEhS?=
 =?utf-8?B?SGk0MkdjcHRLVTR2Ym5mdnM2bFVRNTNXYTYrU1NLam1sKzdmTGZDbjltZUR4?=
 =?utf-8?B?ZnVhakgybThDREtQUDRWcFh4UlAzTk1PQzM2QjcrMnBBOTA1dkdDUVh1eXNZ?=
 =?utf-8?B?c2IvRjlaL04vR212UHkyUDB6RStZQ3BNcHNoYTI5dXgvVkVtbmYvNmNES3FS?=
 =?utf-8?B?dmt1dkxjbTZSaVc0RWExNVNCUlViTkN1OTRZVUlzVjhOUWpwWUNxdEM0a0o3?=
 =?utf-8?B?aGRjY3VlNW5KazIxdjlWaXJobk9idWV0dlpsRVNKazJQOWVRV0VJdG1YVGEw?=
 =?utf-8?B?MWtjQUtNKzE2aGlUMjdOVXM2TXNDU2dWQ05FM3FWeWozOTRyNFJxMzhYSUdV?=
 =?utf-8?B?c040V1F5UTlidlhuUlZGdExSdHJNMWlSTWdCU3ljWkdMUmU3MjFObjhORHVN?=
 =?utf-8?B?QWRYWXlObzVFd0xxSVh2dmJFajZkT1R5bWxaMFRLK0FwMC9LOUVBZzl1WG1C?=
 =?utf-8?B?bWRJQklzRy9WQXNjUFRxQkg2bENQMElBS1JPc0dmYVhtc1lPcnhvcllIRzh0?=
 =?utf-8?B?dFJaTk1KTnp1MGp2UDRoU2pTZjFIZEtYUVVIY0Z3Tmp5bEhGb3lvcjI2Si8w?=
 =?utf-8?B?a3pnSkY4bHJHSFFkdnFqSUk4SFNkN0xmVXc3YTNMR0pXQjhHQVQrQ3dCd2pF?=
 =?utf-8?B?dmJvbzlOcUlPQ2l1dzdNYVpYZzV0cVowNXp3MHpFUXlBM29WQmZXTVUwbWZ5?=
 =?utf-8?B?ZlFJWE5rWEpXMUNhTzhVUURvRFEzQjV6RElJUSs5YTAxbWRZWExQREdGRDNx?=
 =?utf-8?B?TEJtSVArOUM3YjVOY1p2OVRuV3lIcFRXU29lc1BlalR1RVNNZ2Q1K2tkT2xm?=
 =?utf-8?B?Z3hXdC8yRHA0MFJYOGZuZTR2aE9STjAva1B2U3ZBcTVQdWgrbnRMa0tDL2lm?=
 =?utf-8?B?V1Q5SHN3ajcyemRRVGxycGd1SGtzS0tYOFU3SE51Y3FtT1lIeHdpQStSb05Q?=
 =?utf-8?B?Z0w4T1R4RkZzTWloNGxxSjZldkE0WUV2RTl1Q1ZQVzBGUXFFODhkckRySTMx?=
 =?utf-8?B?OXM4M3RIODA3ejVxd1R3MmR3Zm9RZGMzYS9PMTdMUlhIYnc1TVE4bzFnQ0NQ?=
 =?utf-8?Q?kCnO7Bycyi1jwSwMOhSKTKC6n?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFDFCE984F19624B81C854EF53FEC732@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PyXpqHj+dbF5wzScEqknF3Dq66BBi38penu70JPMVAJRAADdO8Gw3qNGignumNGfTwaOguL8mGSWZmW78+DWKXf7+EiqUs1qsXpQzlq3AKcM5C6QtGawUepPEpBuo2wAWXbou4Gor8Cni+wsQiOFRqUEfgMpbvzjsegH0Ac6iMt6YiI1EcneMNb4ED69Hkyh2o9dhvjAAqzJQuxvcvJii2NCOf9lGr3hZUJaUDjVBQ61kbXBDe4NpJPsi+rJ8bDU4nN7VEgsibeTH6IY+3Qq1MZlcmdU3SdLeVWW+Yz1TdV43JkkeRoOi2YHgb0gIZlvrLyul5B+3/S8L7MDyxcqlqtgFMYnBy2RCwsBpvgFN1zdd5Wqw2ppDIl6dacoEib9Pi945//1zJU6FYb9yrFzAz8cjKJiNATp8ud7ydMTRIwAmALYWqCWDkAb/G5RWpGwoRXRhpkkq5Bdr4lKSZfiSqt8vt5PkaM15aPv+oyYcagx+ghFo1RzYTAqIEJuqS4oUOWsSPtjSaQQXvc/KFwKw/vl22cMmOWUoB1N/v5ym6hatarUwfsaIjcDmLVI+CtRmQEuu+FU29LjEw30jJpBdO2wBvY3Yh/Lk3ih4VesV8y89vrV3ItEbppZEOt/xuUSCE1V+8a2Yg9srw6IXQD5Xw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386ace09-927a-41f7-4c5f-08dd884523fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 00:14:29.3615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k20f8c3vevA85S6F1Nqf/EOQiL2IMo+QOi7YAHQxloa0DJqB46OkzK2RUIfinB5EYRCMB2TPXKzxeBXy/1Imhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592
X-Authority-Analysis: v=2.4 cv=Cra/cm4D c=1 sm=1 tr=0 ts=6812bcec cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=Mrx6X6xIAAAA:8 a=rDNMMDBYGzJiRzp4v8QA:9 a=QEXdDO2ut3YA:10 a=mtBcDF-1Tj68bwe_P4gJ:22
X-Proofpoint-GUID: D-dXEWbOghkYPrG713wv6HjdLY72l8Co
X-Proofpoint-ORIG-GUID: D-dXEWbOghkYPrG713wv6HjdLY72l8Co
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDAwMCBTYWx0ZWRfX4F1GYkDyTnqn qqn7HR5WWH2b6jIIXI5k1/D4Qy7uMdArwyFoJMrK2VQJB8n2YTgw8xwhz/GNTyQXnTbAoW2wSFr 0lHDK/xMSEc0oyq8afZFBPmYcT/IXJNsEGWhfmshVn5T3F2Bw9SSfdWy4NQwEk6pa4m1D2Nyk2b
 abnahu1OFDjuX/uEKYdjD//mnIsoAegyobMqLza/PwOLn7LXCDPh/fUHBiEOpBnhT3Ogj+bf58G guKXyhuQNRzeia89SdZbE6L9aGhQlGJVGS4gDukUEvPLZEu6YGhbisuz/1++jC0rTZhCz8ooSkM VWuSHJOQSkWoLeQr8Hdd0NTO9yVgVSWaHg4MLyS5rvSR+l2rtMAP227P9cqs2aZ/5UfCG3p4YR6
 J3/sV2Tn3Kfdt5Ev1RV9SXsSmsakx0paij8Mu/GhY6D6T2PZAcsPOELyiZaR9vcxxrMIrThn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505010000

SGksDQoNCk9uIE1vbiwgQXByIDI4LCAyMDI1LCBKYWtvYiBUcnVtcG93ZXIgd3JvdGU6DQo+IEhl
bGxvIEZlbGlwZSAob3Igd2hvZXZlciBpcyB0aGUgY3VycmVudCBkd2MzIG1haW50YWluZXIpLA0K
DQpJJ20gdGhlIGN1cnJlbnQgZHdjMyBtYWludGFpbmVyLg0KDQo+IA0KPiBJIGhvcGUgeW91IGFy
ZSBkb2luZyB3ZWxsIQ0KPiANCj4gSSBoYXZlIGJlZW4gZGVhbGluZyB3aXRoIGEgVVNCIGlzc3Vl
IG9uIGEgY3VzdG9tIGhhcmR3YXJlIGVtYmVkZGVkIExpbnV4DQo+IHN5c3RlbS4gV2UgY3VycmVu
dGx5IGhhdmUgMyByZXZpc2lvbnMgb2YgdGhlIHN5c3RlbTogYSBkZXZpY2UgbW9kZSwgaG9zdCBt
b2RlLA0KPiBhbmQgbm93IGEgZHVhbCByb2xlIG1vZGUgKHRvIGhvcGVmdWxseSByZXBsYWNlIHRo
ZSBmb3JtZXIpLiBUaGUgZGV2aWNlIG1vZGUgaGFzDQo+IGJlZW4gd29ya2luZyBmbGF3bGVzc2x5
LiBXZSBoYXZlIGhhZCBpc3N1ZXMgZm9yIGEgZmV3IHllYXJzIHdpdGggaG9zdCBtb2RlDQo+IHdo
ZXJlICBkZXZpY2VzIChldGhlcm5ldCBhZGFwdGVycykgZG9uJ3QgZW51bWVyYXRlIHVubGVzcyB5
b3UgY3ljbGUgdGhlIHBsdWcNCj4gYW5kIHNvbWV0aW1lcyByZXF1aXJlIGEgaGFyZCByZWJvb3Qg
dG8gZW51bWVyYXRlLg0KPiANCj4gDQo+ICAg4oCiIFVsdHJhc2NhbGUrIFp5bnFNUFNvQyAgdXNp
bmcgYSBjdXN0b20gWW9jdG8gYmFzZWQgT1MgdXNpbmcgWGlsaW54IGxheWVycy4NCj4gICDigKIg
WGlsaW54IDYuNiBrZXJuZWwNCj4gICAgICAg4pahIEkga25vdyB0aGUgZG9jdW1lbnRhdGlvbiBt
ZW50aW9ucyB1c2luZyB0aGUgbGF0ZXN0IG1haW5saW5lIHZlcnNpb24gYnV0DQo+ICAgICAgICAg
aXQgd291bGQgYmUgcXVpdGUgdGhlIGVmZm9ydCB0byBnZXQgdGhhdCBydW5uaW5nIG9uIG91ciBG
UEdBLg0KPiAgICAgICDilqEgSSBoYXZlIHRyaWVkIHBvcnRpbmcgVVNCICBzcGVjaWZpYyBjaGFu
Z2VzIGZyb20gbWFpbmxpbmUuDQo+ICAg4oCiIFdlIGFyZSB1c2luZyBBTUQncyBLcmlhIEsyNiBT
T00sIG91ciBtb3RoZXJib2FyZCByb3V0ZXMgb3V0IFVTQiBTUyBhbmQgd2UNCj4gICAgIGhhdmUg
Y2lyY3VpdHJ5IGZvciBkdWFsIHJvbGUgZGV2aWNlcywgRVNEIHByb3RlY3Rpb24sIGFuZCB0aGUg
cGh5c2ljYWwNCj4gICAgIGNvbm5lY3Rvci4NCj4gICAgICAg4pahIFRoZSBzdXBlcnNwZWVkIHRy
YWNlcyBhcmUgd2VsbCBsYWlkIG91dCBhbmQgZ28gc3RyYWlnaHQgaW50byB0aGUgU09NLg0KPiAg
ICAgICDilqEgVGhlIGR1YWwgcm9sZSBoYXJkd2FyZSBsb29rcyBnb29kLCBJIGhhdmUgYXR0YWNo
ZWQgYSBQRCBhbmFseXplciwgYW5kDQo+ICAgICAgICAgdGhlIG11eCBhbmQgcm9sZSBkZXRlcm1p
bmF0aW9uIHNlZW0gdG8gYmUgd29ya2luZyBmb3IgaG9zdC9kZXZpY2UuDQo+ICAgICAgIOKWoSBJ
IGRvIG5vdCB0aGluayBpdCBpcyBhIGhhcmR3YXJlIGlzc3VlLCBhcyB3ZSBoYXZlIGhhZCB0aGUg
bGF5b3V0DQo+ICAgICAgICAgcmV2aWV3ZWQgYW5kIHRoZSBpc3N1ZSBzZWVtcyB0byB2YXJ5IGJ5
IGtlcm5lbCB2ZXJzaW9uIGFuZCBsb2cgbGV2ZWxzLg0KPiAgICAgICAgIEFzIHdlbGwgYXMgb3Ro
ZXIgcmVhc29ucyBiZWxvdy4NCj4gICDigKIgSXNzdWUgZWZmZWN0cyBhbGwgU3VwZXJTcGVlZCBk
ZXZpY2VzIHRoYXQgSSBoYXZlIGFjY2VzcyB0bywgaG93ZXZlciBvdXINCj4gICAgIG9ubHkgcmVh
bCBhcHBsaWNhdGlvbiBpcyBVU0IgMy4yIEdlbiAxeDEgdG8gZXRoZXJuZXQgYWRhcHRlcnMuDQo+
ICAg4oCiIFVTQiAyLjAgZGV2aWNlcyBkbyBub3QgaGF2ZSB0aGUgaXNzdWUuDQo+ICAg4oCiIFJl
Y2VudGx5IEkgaGF2ZSB1cGRhdGVkIG91ciBrZXJuZWwgKDUuMTAtPjYuNikNCj4gICAgICAg4pah
IFRoaXMgd2FzIHdpdGggc29tZSBPUyBjaGFuZ2VzIGFzIHdlbGwgYnV0IHRoZSByZXN1bHRzIGFy
ZSBtdWNoIHdvcnNlDQo+ICAgICAgICAgdGhhbiBiZWZvcmUuDQo+ICAg4oCiIFRoZSBpc3N1ZSBv
bmx5IGhhcHBlbnMgaWYgdGhlIHBoeXNpY2FsIGNvbm5lY3Rpb24gaXMgbWFkZSBiZWZvcmUgdGhl
IHhoY2kvDQo+ICAgICBkd2MzIGRyaXZlciBpcyBwcm9iZWQuIEFueSB0aW1lIGFmdGVyIGl0IHdv
cmtzLiBFYXJsaWVyIGFsd2F5cyBmYWlscy4NCj4gDQo+IA0KPiANCj4gVGhpbmdzIEkgaGF2ZSB0
cmllZCB0aGF0IHNlZW0gdG8gbWFrZSBpdCAiYmV0dGVyIg0KPiANCj4gICDigKIgbG93ZXJpbmcg
dGhlIGtlcm5lbCBsb2cgZnJvbSA4LT43DQo+ICAgICAgIOKWoSBJIGFtIG5vdCBzdXJlIHdoeSB0
aGUgZGVmYXVsdCBsb2cgbGV2ZWwgd2FzIDggYXMgaXQgaXNuJ3QgZXZlbiBsaXN0ZWQNCj4gICAg
ICAgICBhcyBhIHZhbGlkIGxldmVsIGluIG1vc3Qga2VybmVsIGRvY3VtZW50YXRpb24uIEl0IGFs
c28gZG9lc24ndCBzZWVtIHRvDQo+ICAgICAgICAgcHJpbnQgYW55dGhpbmcgZGlmZmVyZW50bHkg
dG8gb3VyIFVBUlQuDQo+ICAgICAgIOKWoSBPbGRlciBrZXJuZWwgd29ya2VkIGZpbmUgb24gOC4N
Cj4gICDigKIgQWRkaW5nIGEgc2h1dGRvd24gY2FsbGJhY2sgdG8gZHdjMy4gVGhpcyBqdXN0IGNh
bGxzIHRoZSByZW1vdmUgZnVuY3Rpb24uDQo+ICAgICAgIOKWoSBUaGlzIGhlbHBzIHdpdGggY29s
ZCByZWJvb3RzLg0KPiANCj4gDQo+IEhvd2V2ZXIsIHRoZXNlIGhhY2tzIGRvIG5vdCB3b3JrIG9u
IG91ciBkdWFsLXJvbGUtbW9kZSBoYXJkd2FyZS4gVGhleSBzdGlsbA0KPiByZXF1aXJlIGEgcGx1
ZyBjeWNsZSBldmVyeSB0aW1lLiBTb21ldGltZXMgaXQgd29uJ3QgZW51bWVyYXRlIGF0IGFsbCB1
c3VhbGx5DQo+IHRoZSBkbWVzZyBmYWlsdXJlIGlzOiANCj4gdXNiIHVzYjQtcG9ydDE6IENhbm5v
dCBlbmFibGUuIE1heWJlIHRoZSBVU0IgY2FibGUgaXMgYmFkPw0KPiANCj4gDQo+IE15IGN1cnJl
bnQgc3VzcGljaW9uIGlzIHNvbWUgdmVyeSB0aWdodCB0aW1pbmcgaXNzdWUgYXQgYm9vdC4gVGhh
dCB3b3VsZA0KPiBleHBsYWluIHdoeSB0aGUgbG9nIGxldmVsIG1ha2VzIGEgZGlmZmVyZW5jZSBh
cyB0aGUgdGltZSBzcGVudCB3cml0aW5nIHRvIFVBUlQNCj4gaXMgc2lnbmlmaWNhbnQuIFdoaWNo
IGxlYWRzIHRvIHRoZSBpbnZlc3RpZ2F0aW9uIGluc2lkZSBvZiB0aGUgVVNCIGNvbnRyb2xsZXIv
DQo+IGRyaXZlcjoNCj4gDQo+ICAg4oCiIFByb2JlZCBVTFBJIGNsb2NrDQo+ICAg4oCiIENoYW5n
ZWQgdG8gb3RnL2hvc3QgaW4gZGV2aWNlIHRyZWUNCj4gICDigKIgTWFueSBwcmludCBzdGF0ZW1l
bnRzIGluIHhoY2kuYywgaHViLmMsIGNvcmUuYywgZXRjLi4uLg0KPiAgIOKAoiBBZGp1c3Rpbmcg
cHJvYmUgb3JkZXINCj4gICDigKIgQWRqdXN0aW5nIGRlbGF5cyBpbiBodWIuYyBhbmQgY29yZS5j
IGZvciBpbml0aWFsaXphdGlvbiBhbmQgcG9ydCBkaXNjb3ZlcnkuDQo+ICAg4oCiIGRlbGF5aW5n
IHByb2JlIHNvIHRoYXQgdGhlIFVTQiBzdGFjayBjb21lcyB1cCBsYXRlcg0KPiAgIOKAoiBBZGRp
bmcgbW9yZSB3YXJtIHJlc2V0cyBpbiB0aGUgaHViIGluaXRpYWxpemF0aW9uIHdoZW4gYSBwb3J0
IGZhaWxzIHRvDQo+ICAgICBpbml0Lg0KPiAgIOKAoiBBZGRpbmcgZXh0cmEgQ2hpcCBIYXJkd2Fy
ZSBSZXNldCAoSENSU1QpIGluIHhoY2kuYw0KPiAgIOKAoiBNb3ZpbmcgdGhlIGVudGlyZSBVU0Ig
c3RhY2sgaW50byBhIGtlcm5lbCBtb2R1bGUNCj4gICDigKIgQmFzaWNhbGx5IGV2ZXJ5IFN5bm9w
c3lzIERXQzMgcXVpcmsNCj4gDQo+IA0KPiBXaXRoIGFsbCBvZiB0aGVzZSBjaGFuZ2VzIG5vdGhp
bmcgc2VlbXMgdG8gbWFrZSBhIGRpZmZlcmVuY2UsIEkgYWxzbyBnb3QgbXkNCj4gaGFuZHMgb24g
YSBCZWFnbGUgNTAwMCBzdXBlcnNwZWVkIGFuYWx5emVyIChvb2YgdGhhdCB3YXMgZXhwZW5zaXZl
KS4gSXQgaGFzDQo+IGJlZW4gdXNlZnVsIHRvIHNlZSBpbmRlcGVuZGVudCBvZiB3aGF0IExpbnV4
L2RyaXZlcnMgcmVwb3J0cy4gV2hlbiBJIHNlZSB0aGUNCj4gaXNzdWUgYWZ0ZXIgYSByZWJvb3Qs
IHRoZSBvbmx5IHRoaW5nIGNvbWluZyBvdXQgb2YgdGhlIGhvc3Qgc2lkZSBpcyBwaHkgZXJyb3Jz
DQo+IChtYXliZSBub2lzZT8pLiBObyBhbW91bnQgb2YgdGhlIHRoaW5ncyBJIGxpc3RlZCBzZWVt
IHRvIGdldCBpdCBvdXQgb2YgdGhpcw0KPiBzdGF0ZS4gVGhlIG9kZCB0aGluZyBpcyB0aGF0IGEg
bG90IG9mIHRoZSBEV0MvWEhDSSByZWdpc3RlcnMgc2VlbSB0byBpbmRpY2F0ZQ0KPiBpdCdzIGRv
aW5nIHNvbWV0aGluZywgYnV0IG5vdGhpbmcgaXMgYWN0dWFsbHkgaGFwcGVuaW5nIGVsZWN0cmlj
YWxseS4gVGhlIG9kZGoNCj4gcGFydCBpcyB3aHkgY3ljbGluZyB0aGUgY29ubmVjdG9yIHdvcmtz
IHRvIGdldCB0aGUgY29udHJvbGxlciB0byBzdGFydA0KPiByZXNwb25kaW5nLCBidXQgbm90IHJl
c2V0IGNvbW1hbmRzIGluIHJlZ2lzdGVycy4NCj4gTXkgYmFja3VwIHBsYW4gaXMgYSBoYXJkd2Fy
ZSBjaGFuZ2UgdG8gZ2l2ZSBWQlVTIGNvbnRyb2wgdG8gTGludXggc28gSSBjYW4NCj4gcmVzZXQg
dGhlIGNvbm5lY3Rpb24gYWZ0ZXIgdGhlIGRyaXZlciBpcyBwcm9iZSwgYnV0IG9idmlvdXNseSBr
aW5kIG9mIGEgaGFja3kNCj4gc29sdXRpb24uDQo+IA0KPiBJIGF0dGFjaGVkIHRoZSB0cmFjZXMg
dGhhdCBpcyByZWNvbW1lbmRlZCBpbiB0aGUgZG9jdW1lbnRhdGlvbiwgYnV0IGFsc28gdHJhY2Vz
DQo+IHRoYXQgYXJlIHJlY29tbWVuZGVkIGZyb20gWGlsaW54J3MgVVNCIHRyb3VibGVzaG9vdGlu
ZyBwYWdlOg0KPiBodHRwczovL3hpbGlueC13aWtpLmF0bGFzc2lhbi5uZXQvd2lraS9zcGFjZXMv
QS9wYWdlcy8yMDQ2NjU2NTIwLw0KPiBVU0IrRGVidWcrR3VpZGUrZm9yK1p5bnErVWx0cmFTY2Fs
ZSthbmQrVmVyc2FsK0RldmljZXMNCj4gDQo+IA0KPiBBbnl3YXlzLCBJIGtub3cgdGhhdCB3YXMg
YSBsb3Qgb2YgaW5mb3JtYXRpb24gYnV0IHdvdWxkIGFwcHJlY2lhdGUgYW55IGhlbHAuIEkNCj4g
Y2Fubm90IGdldCB0aGUgdGltZSBvZiBkYXkgZnJvbSBTeW5vcHNpcyBvciBYaWxpbnggb24gdGhp
cywgYW5kIEkgbGlrZSB0byB0aGluaw0KPiBJIGhhdmUgZG9uZSBteSBkdWUgZGlsaWdlbmNlIGZv
ciBhYm91dCAxIG1vbnRoIG5vdyBvbiB0aGlzIGlzc3VlLg0KPiANCj4gVGhhbmtzDQo+IA0KPiBK
YWtvYg0KPiANCg0KU28sIHRoaXMgaXMgdGhlIERXQ191c2IzIE9URyBjb250cm9sbGVyIHYyLjkw
YS4NCiAqIElzIHRoaXMgYSByZWdyZXNzaW9uPyAoaGFzIHRoaXMgaXNzdWUgYWx3YXlzIGJlZW4g
dGhlcmUpDQogKiBJcyB0aGUgcmVnZHVtcCBjYXB0dXJlZCBhZnRlciBib290dXAgd2l0aCB0aGUg
Y2FibGUgcHJlYXR0YWNoZWQ/DQogKiBXaGF0IHF1aXJrIGRpZCB5b3UgdHJ5PyAoZGlkIHlvdSB0
cnkgInNucHMsZGlzX3UzX3N1c3BoeV9xdWlyayIgYW5kDQogICAic25wcyxkaXNfdTJfc3VzcGh5
X3F1aXJrIikNCiAqIERpZCB5b3UgdHJ5IHRvIGNvbmZpZ3VyZSB0aGUgZHJpdmVyIHdpdGggVVNC
X0RXQzNfSE9TVCBpbnN0ZWFkPw0KDQpJZiB0aGUgcmVnZHVtcCBpcyBjYXB0dXJlZCBhZnRlciB0
aGUgY29ubmVjdGlvbiwgSSBzZWUgdGhhdCB0aGUgY3VycmVudA0KUFJUQ0FQRElSIGlzIHN0aWxs
IGluIE9URyBhbmQgZGlkIG5vdCBnZXQgc3dpdGNoZWQgdG8gaG9zdC4NCg0KKE5vdGU6IEknbGwg
dHJ5IHRvIHNlZSBob3cgbXVjaCBJIGNhbiBoZWxwIGhlcmUsIGJ1dCB0aGUgY29udHJvbGxlciBo
ZXJlDQppcyBxdWl0ZSBvbGQgYW5kIHRoZSBrZXJuZWwgaXNuJ3QgbWFpbmxpbmUuIFRoaXMgd2ls
bCBiZSBkaWZmaWN1bHQgdG8NCnByb3ZpZGUgYWNjdXJhdGUgZmVlZGJhY2sgb24gdGhlIGRvd25z
dHJlYW0gY29kZS4pDQoNCkJSLA0KVGhpbmg=

