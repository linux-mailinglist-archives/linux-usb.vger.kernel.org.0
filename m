Return-Path: <linux-usb+bounces-30785-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8B2C76C89
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 01:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id DB3E42C4AC
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 00:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36D6264612;
	Fri, 21 Nov 2025 00:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cSRJ/FEG";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TsUmgYnK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="W+y6bA37"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C421E3DCD;
	Fri, 21 Nov 2025 00:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763685516; cv=fail; b=ANDXIzA68gTKwM0kMje3MQfBMfEgOHRjrGj/HI8VkHkqw2w2nvIpO+2fNCl7BEW7BKpwI4O6oAYbXXkhnLurr4H3Mi1sEb/ZVZm8bH1vE+Uzo5rba6yk9RUA/xTfkFpr+eVGcDMUz4UApDj0M4oUXoE+M/fSJ7qVy7yw6/lfAiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763685516; c=relaxed/simple;
	bh=vOlOJ3Akhn7wZneokm9RnMjWW4P3GE9oWI7JzJPgFR0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QE5+dfvthY12ewU9fSyMUxBYFkds5K8PRyv4mY/Og9iD0VPieuvNWlD3IGn9yEC+S01cFq2sqhzQTDIrBF9Gd7CDlUDdtdWuvrjsiK5VouC9aa+an8rxd8IMNgb/oO8HjLP2ClS2CpB58dgIszSASP1KWudDFb66AheNjFi7+xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cSRJ/FEG; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TsUmgYnK; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=W+y6bA37 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKJCeQc026141;
	Thu, 20 Nov 2025 16:37:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=vOlOJ3Akhn7wZneokm9RnMjWW4P3GE9oWI7JzJPgFR0=; b=
	cSRJ/FEGqESRKd9jklmWF110Y1cyv9w85u22CfQ/VIhRCQ8w/T+V5zjPjVMDMKHu
	KUc0Z6YgYpgrV7b6+v/r6DSr/Hhi4EPbMVNbckOTY1goaluZiV0BUyTzkryg1YWH
	XFGvk/YgTvmzYXLvBmHmqqVQhH6nJ5R+xpJ3kJI+1O5B2wxEEEg/pbxOL0iHZL1r
	BWeOs9SkChx1mZkXLamYx0SAf7zoGS5TJwRcdYknCr9zQMfh2CGqA+mjUc0o1AEM
	+tKAbGYhQKe3ingWv1sgVX7MTgJ3xkNGX8FdNrnjQZbnc8eMwAda9S49Fu1ttbzO
	COepLSo/xYIlvTcl0ws0kA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ahj8tg9qx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 16:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1763685476; bh=vOlOJ3Akhn7wZneokm9RnMjWW4P3GE9oWI7JzJPgFR0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=TsUmgYnK46x5vv+P3Eu8ZisqLsQzZOtWH9eZJXAKwPcf8QMCnJ25eU3gCWAsC7g3I
	 AHSFPgzTH0awFR+B4wIb6UUH8eKfjef3xlkUGHb+dHtQEdRH72BxN7tuCadDQEHFmh
	 0rJ4VYAPMK1mvXrCbSO4mYkfpgPnengo8HA07ZZhu5TJJLH8OWQKO6y4o8vVmKab+o
	 uTjLIcqNtMgadV2Ri0fAANQUPIJO3LJ7D7KwAmbsFVUlP9TM9npCKv5qUBZXEYPgKZ
	 GgvNR0oRaZiSNWqCING63AdCvtlDH88TEKdDr/iYIE2KJIHYasWkZKYHaF3zL4qHTQ
	 i2fgncv8fr9Aw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D34584034A;
	Fri, 21 Nov 2025 00:37:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BBB72A0072;
	Fri, 21 Nov 2025 00:37:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=W+y6bA37;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00106.outbound.protection.outlook.com [40.93.20.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C5AB8404F3;
	Fri, 21 Nov 2025 00:37:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeTcw1kze5WxY54luK+KXAoLEVNqcMlvPEsinNea5mWhm9VU3OUlPgxFAkUJq8oQy/EISom6S2yCPszb2gXESV7M2JukJY0mpxMaXzqyaNVlBnK2z9DVnwVAJTWOsJLVals3MwERQx1TGPDYjcglLPgdc8SWGbnE8FI9j5bsCkbEC9Tu3p57y+2NpmDoWKxrDax89gWDiGD5q1Qp/0PoAdJOa5GqzOQ15ef7Rxzgwu5uZC2IvlNaII7pciNIaBPlA0Q6SzZE6bWZ2Th4c2xKl8IAyVl2fo0L7KGadIkXqyhDyZFUj9kzKxavfP55sJmLRE9v9125hKFrm0ngV3Yo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOlOJ3Akhn7wZneokm9RnMjWW4P3GE9oWI7JzJPgFR0=;
 b=WR6AVrZrynSprYoYTQdLrN2hgKWr5REx3uFk5N0XKBxrPxeVGO0eVWANuJE8yDS0ZYPSD8b2yOFrgHXPa1snY0dIh1Ivh/vFZ36Bubf6WKw5InGvIsnvvmm08IgET+ZG53K9SmC3XkQoQ7uR/nN2v0Pyv5kZ5GmBA7a8xSMTQ39/2hmK/w0hbUTymnVLHWM9DgEi1sqsHBVe1xYTsbRkFpZb2sLv9zE7XXvhB2/fQiHDyw5gWFlEq/+wM4zp9esV0w7nVTD866sImf315GY+GelEncyIpt1JTuqVjz2aqaZ91fRRHNQg5yk5CEkfCjT/qd7mK200PUF+TU6NAT4CDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOlOJ3Akhn7wZneokm9RnMjWW4P3GE9oWI7JzJPgFR0=;
 b=W+y6bA37oQblKlTdx2i0hQ8Rp88pTmw20aT9q8yiKKjw9TikGkTrLdFz9PbMMsgbYtssw/JIUqyxnvyaNr/m0+ykctoiPE5IXm2ppF4OTm1FPK5I9DF1dLSo+fFj1Kc27kcdcx4I80/lIZW8qP5910pMipHVGQxcZ7UcVuuLMVc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB8449.namprd12.prod.outlook.com (2603:10b6:8:17f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 00:37:47 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 00:37:47 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH 2/2] usb: dwc3: imx8mp: disable auto suspend for host role
Thread-Topic: [PATCH 2/2] usb: dwc3: imx8mp: disable auto suspend for host
 role
Thread-Index: AQHcTigLFJc1f1uJi02/Qj90wUqLQbTxR8CAgAUyT4CABee4AA==
Date: Fri, 21 Nov 2025 00:37:47 +0000
Message-ID: <20251121003742.q54ouezxhghmpwgn@synopsys.com>
References: <20251105074504.1427926-1-xu.yang_2@nxp.com>
 <20251105074504.1427926-2-xu.yang_2@nxp.com>
 <20251113230541.wbzt6xbine5gdmpp@synopsys.com>
 <7kpf7gnftumdwdowutryjz73nkap4vp3cfisrigt6def4f36vg@ijlj2eqwzsip>
In-Reply-To: <7kpf7gnftumdwdowutryjz73nkap4vp3cfisrigt6def4f36vg@ijlj2eqwzsip>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB8449:EE_
x-ms-office365-filtering-correlation-id: 79afa781-a63c-4d3f-3c4b-08de28963172
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VFEvOW1xSXNnVE8vQ0ZTeUVUeUlWZjdBVFZlQlJVaEREbDhkN1NpZGtkSU5B?=
 =?utf-8?B?QVRpN0p5bU1UMmEwQzZBNjcvUDZHWVovRUNadHJoOGRRTmN3cm5CbEN2VVZZ?=
 =?utf-8?B?Ymp6MGJEMEVrWnBuQS9hM25zc0RKUTFCWEpUL3IzbnVlWktJSUxvT1Bpemlk?=
 =?utf-8?B?YndiVVJDK042cFo1amdpc3dDelEwelZoNG1OZTB1QklOTWp0SVdoc1NZK0Z1?=
 =?utf-8?B?RHJtZDBDdFR3UFhXdW9sbVppMVpST0JwTmkzZ3BLc1c2NnJaMlJYeFpHZ2ky?=
 =?utf-8?B?ZHJxazFYVVVqMHA0eFFGV1pEaVNpaHMzSXRMbFRnaVFBeGx6WFRWc0Jndm9C?=
 =?utf-8?B?SFZoZkhYdFV4U051LzI4bEttcm11RmxnVjBDRElCZDZIZStwS0FWUDUyM2da?=
 =?utf-8?B?WkR1VEwwR1RtSERxYmhEZ2NUbFFaMVd1a0RvTFIyaU9DbEtrVzFqY1A5dmlz?=
 =?utf-8?B?U2xmZDE3SEFDa1BSUWVxZWFKaFNnT2tKcm0xelZKNy8zY09NVjZHU0pxbUFM?=
 =?utf-8?B?Rm5JbFd5a2pnTnd3Qnh5VGM3dEZxVExXYUdacnVuNnBLM2M2Nmg1SkM3NEl5?=
 =?utf-8?B?V21yNlhJVTNhWDdlVGFyQ05YMURzNWFuS0xseVNaZWRxNWNrR1pWS1paV3dl?=
 =?utf-8?B?aWxFakk5UUJIbHprS3lrMS9HWGw3MVZvalE1cEVQaFRLUURGVEJ0OEhOSmcw?=
 =?utf-8?B?bS9OYnFzcVZMKytnd1RabHVNNWEwSHY0OExPUlBwTk9HY1N1Y2FrQWJHM0Fp?=
 =?utf-8?B?T3VpbzJPV1FxTWlTNXpiUVhBMmxSSzNzTmFHSlVvYWVEK1VOVFJ5NVVNZk1D?=
 =?utf-8?B?RFZIRWMvMzRCOE5SVldEYm1aS252ZVRxMkRHWkY4cmJLeFdTU0RwTWJXeHJG?=
 =?utf-8?B?RjcyYXpIV3Z4VzIwSUhPSkN0c2hITzJZKy9nV1dhZXl4OXU3NzlPSGthZ2li?=
 =?utf-8?B?N2xEdnhHek94azFIZ1JUUVBJQ1oxZllWM0RlL01jTEFBNXNnYXlZa2dXUXl5?=
 =?utf-8?B?Nkg0V3V6K0M2bzR5YTJKMEdwOGxLVGZEaHR0UU12bk9pK1NrbHhPcG5pbTBi?=
 =?utf-8?B?NWZScDhLWHU2aGdOWmRIOXRiSlRMU2E0djBXUWFCV0J5dHJEV05VaGlSdEZL?=
 =?utf-8?B?TnV1dXZiMHpza3hMcG1aLytFSFVwNUtIbmlEejlSM3hlaXhQTXVyd1ZtM3pM?=
 =?utf-8?B?Uys4bDgxbWh5ZG9zSHhUTUduWGx0MmJESW4weHJoVWV6VTFIbDFPb2hjcTlj?=
 =?utf-8?B?VVgrRWQzV3J6eEF2ZjFkbjhsWnNBODlsTmtQMzkwNmZWcmVVUkI1cjNDRFho?=
 =?utf-8?B?VE15SXhnalRqeUtXWmhSNDF4eFprYytkSEZpa1JxaGtTTHNVcGVscmQyVFFa?=
 =?utf-8?B?UlVRYlplRVdXeks0d0p2V1dVMjlUb0V0RDhpeGFZbk84T3JNblkrVWhEV25S?=
 =?utf-8?B?VnNjeUpKNXFvekZtVEM5aERwSG5CY3FiT29PL2Y5a2hrd3RNaWFVbmtIM1cw?=
 =?utf-8?B?Sm42OUFySy8vV29yWXNDbC83eElsRFViMjJVajd5dTVyZzVmQWgvODU4V2ty?=
 =?utf-8?B?T0FOUmIveHdBRmhmYlkrMWRadGlDQTZ6UDl3ZzRPc0FyZTZJbkdGVXZLajFG?=
 =?utf-8?B?YjJaSU9uRUgxU3NjdWJwcUNpaDh3cU4xT2tjbGlScFpkUDdGNmswUmFDYklq?=
 =?utf-8?B?dWxQNWxKZGFGcW5PSjdTMi9UcFFDK3RFTllVcVlSVGM5aEZzYlBpVDlkdFdZ?=
 =?utf-8?B?OVkxTVdXMy8xUHNodlZlWDgzcmVsL1hmcGxRd2prL0xYVytvM3pNbndEMTlh?=
 =?utf-8?B?c2dyMDVVTFJuRDNFdmlDblg0b0JGRnNQMVZkTXRhY3dJbXgwNjJzNmRjcTlo?=
 =?utf-8?B?T2l1NWNrVndJQVM3RkI5Ky9iMmw3T3BVcWRDblkwa0RydlFVcVlLRXkvbi8z?=
 =?utf-8?B?b0JhenNFbzkydXVRQ29EQi80Q0xEWnR5ZnpPTEYxcDVqNVppaDRHZjB2L0pG?=
 =?utf-8?B?d0JTMlJ5OEd0OFdrNTh3dWNNMDBDNWJMczlqdkFndzh5bGJnQzJIRThGYTdy?=
 =?utf-8?Q?CeBsOO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUM4c3RkZkJkRWR1MUFEYmR4eS8wQ1NubTlGNW85NE1qNUMyK2ZzMFg4cHJh?=
 =?utf-8?B?QVhQditleUpqaWpoaXVyUjhtTmVjQ3J0T2JLbGtxU0c3SW14WlNVTEdPQUNS?=
 =?utf-8?B?NjFGSG9GM2lwUlhnK1Q5b2tGNC9oWUU2NkNtT3c2clV3c3JHTVM4VjY2RWo5?=
 =?utf-8?B?WU5qc2FNK09iMnNHWTF0WFF5enR5UktzcU1OQTIyY3FseFc5V09QYVN0TVlH?=
 =?utf-8?B?YUgxUXBHQnFXbnBHNTFtWTJmYW5xZFJxV2dOdEtPUC9UTVI3b2FrS0ROT1pQ?=
 =?utf-8?B?RGVDd1Y3T2M4V0NrUlJwUVVBVld2RURZMnhhcGtvQStRa3RKRXo4SUtBS0Mz?=
 =?utf-8?B?V0ZQaGIwRE5lampUODYvM1dWZ0xuMmNHVXAyVDlqTk5KRnBPYmZOdGFEMTJq?=
 =?utf-8?B?ZExtd3gxR3JNQURyQVh5dU9ZSzFQQ2hMWkhkOXJpamxUV0J2TE80YzdtRTM0?=
 =?utf-8?B?TWZ5L1p0bHlsS3huRjFicjJYUkhtUkMwaE5BcVVzOG5WSnNQUlltK2hQSDgv?=
 =?utf-8?B?SWlpeUhNMzFYc2hMbUVNeGgzOFA4aC9kRjN0UHJNeC81czYrNlR1cDJjZ0lN?=
 =?utf-8?B?NERJZGhxcUNleSt2V2NlZUtOWFN1OEtXQm5LbGg3WXlJSVc0dlA3cTNQMzho?=
 =?utf-8?B?RE5oWHpwK2RSTk1VTXBiNERoYm1jcnNtVFN4WXd3QWFYbkYyZitxdnAwa01m?=
 =?utf-8?B?UktlQkwxc0lBOHFrOHJkR2xCeWFVL2RRQnZGbHZncDlMVE1RbnNSZlRVSEZt?=
 =?utf-8?B?VjRBaE41QXlXTVg5c3pKMkxJL0dwTVBxQXNjQTYvQXJMVnFpTkNlcjJzYzFy?=
 =?utf-8?B?VUN5WENNcDV6UTVwMytxYVplblRBTjZBME1IVXJGaVBJbXF6S0psWVlxZ29i?=
 =?utf-8?B?Zy9MRmQvOHdiZ0YzWGNteGV3Q3hPZkFnMnU0N2h4Um9oOGQyV1JaNmpPRmsw?=
 =?utf-8?B?U1dtOTM3T1JVZE9Ea01RYXhWVUpTa2xSRGdyckJRR2lLTndSOUFOV0NXMDBY?=
 =?utf-8?B?RFM1QVhvTmo0cEpCcVd1MXZSZnVyOG95b0pPVWUzbGFUOE1FVFhCRWRhNy9V?=
 =?utf-8?B?Y2hlSkNhbGRLZzZtbEVDZms2eXNKYlE4R0ZIS1VNYkM0dm1yKzdWTGZxUWpC?=
 =?utf-8?B?aGJGRnU1RU16NFZsU0VidU1EVmpMbmFndW84MlAxbStQb3pmVlRkVWx6MHN3?=
 =?utf-8?B?Unhjd2RTSjZINUd6dXVZeVoxblAvOEdjTElJMGpueFBzY3dtNktWN2FLZ1VZ?=
 =?utf-8?B?TC9SSkNDS3NpVXVUdG15QXorSTJxd2FVU2JLMXVrYnhMQkxvRE5neFFqcTlS?=
 =?utf-8?B?R0lhclVwOElHbnEvcEloL3VzTThueUNyYVlHd3c4eVdmQW5mdmFPQjNrV2N1?=
 =?utf-8?B?ajBGUXBqczlqSzNvSjlkYzlkMGFWTzJISFhyMTFzUmNWN1I3RUJOSFV1ZGZS?=
 =?utf-8?B?bjJqRElDZEh2bWV1V0N1OTdtT1BpQ1ZBd0N0MmFZM1M1VTJTNWlVYlVQTHRE?=
 =?utf-8?B?ZGFGd3NGRkZlN01nOVE3am1iNldVbGFjOThseUFtVCtwRXorK01sYlovekRX?=
 =?utf-8?B?c2tnNllaa1I3SFlFNzhub0NWNlAvSXJoVVUxWE5NSm1SUWZMVTVvSFNWYXpG?=
 =?utf-8?B?M0RpZDh5NzRjam5Kdm8yRGhFMUNzZmNzQVcybXpzNnJ6RHFKdVB6MWFPcUZh?=
 =?utf-8?B?ZzBzL1hvcUpnN2d3ZEd3U1A5cXNHSVdZTno5OWZYZFczN2FRRzd4RjVnTGVr?=
 =?utf-8?B?R2w4STdERktQNDJKRDdWek1QZ05iZ2pmVWVVMFlJQzNRZzNmZlZxNDRDUHVw?=
 =?utf-8?B?cEtqOWc3OHdtUjVRUnBMclRPSWJZZUZBY3ZHNjdhNXB1N1h3d1VYMTVQSlhL?=
 =?utf-8?B?UmRBNVZ4Y3BaUGZOTjFaS09DR2pYYkUyRUpxVUFXQitrUDhSYkdTVG9xNm1H?=
 =?utf-8?B?MjU0clU5Q1FtVC9SVE1YTGlWSC8zMEt1cEw0dExVL1pJc200Z1Q5Q1JkTEtU?=
 =?utf-8?B?TzJmNlIweHo0MWhZTU9Zc0VaUmE1UjZpVk5sbUVpZGI5Ym9oRlJJQlM5Q1Vs?=
 =?utf-8?B?TmpCbDROUEJkbHJhSlRRYWowdUE2aWJ2cE1KWGNwaGNYTkdKWktuc2Ntd1U4?=
 =?utf-8?Q?HlfucBOkRGHFLWDY13TYMc0yN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5BFDD5A1A8E7245BD384E22BC3C2D90@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/2uvXlfAm7YGW985eitBmGplm+kxPy7lwoNVGUIGW55LaBwHde3bbp5vpVOiHUauk5bzYbH5VoA9j8EIvGfA0skzXpxUdGNcqfU/sNaagYkAhju3EeAb66lp4jZAII3kGGFsq4wfRQ0YlwJ4wvZ2TXs+nE3HrmU0dboJg95EQMyLjE6Wkxfz6V57tD5Y6io0dquj3flWFuV34bW61Rlwx6ny463+P6zLsdgoKWt4uCGhLjZsmRIv7g98GQprVZ0RHVFulAQxR6QVVphuupba6k4CBCbPQ7oWqt/cldE0m7pDiUgqPT9dkmTEn1xAXhGh5OUM6m/06ks3uSMJNCaXR6MHJTScEzaTY1rs9cNDOctrkkPg6OIHmiTHAQhCARVpEI7Xx7Cm5pSgEIC4XcBh2mbabnLFotKwE/Zh41WCvSM0hB8bnoOf7IMwWQBk+5xC/YcnhUMTJMAUf6m54ECZBvbiBrZ+0lRq0RIAazm8hm3eUsmzWFU14QM4VpXwhU1VN6FFIci7ge0VbfAm0FWitl5K/6xbSITZUB0DrhtS9Jn6mIgw3g9B2zrGMmBcfovxzyRxxOYRO/OVcD02LBAGlXzNy70tVlszOZNNeD3FKOWXdQevNb84EHET5nsoIud6mqAoL9hLyCMB8Z3C0N0n2A==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79afa781-a63c-4d3f-3c4b-08de28963172
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 00:37:47.2647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C7wmcj3fw8lnezDU1C+PhnnjhoLynntFFrHfISiXK29fSSDF+nj3dbR7VZvx4oh8aLZcnop45iI8CkTdSFIy1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8449
X-Proofpoint-GUID: G12BSo8ZEjSo8R3KIVunAwy419P8VhpL
X-Proofpoint-ORIG-GUID: G12BSo8ZEjSo8R3KIVunAwy419P8VhpL
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=691fb464 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=tmpbkv21Y_XYcirI1q0A:9
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDAwMiBTYWx0ZWRfX17i5V1luDagB
 cM34Fe0jTfwLnCSgEmaDCUmPboxLxBdtbmzdr02O78eDWdfTOamyhke2/xYRXrSYy1Hkj0VO/SW
 v8rXpT4EBdsIdcUCav4irK/pFIDscyOhLPZVwsnQiQ25K5hoUpv1i9qIbebWJHNGJNAVQfOqcni
 eyogPzIjW/3/45RrhWFMQ/nq/Xx4CHwntHKw4EPhxHUnKbMCQGy1QMmZAV0CRAgF/o2e74/3FAb
 Xzp9mD0bnyzA0ANkizM1LYC7d6moOyfxZBkKNtFU2enIZBEkJ9utbed3OpykBPuhUltgebI4hyd
 i/B8ELen2N5+a5EpIT6vwTSQiD2TqZLtx7cFzQbdbz9LKxl7p+huOwWKSKA7FuqWyns+6WesXJC
 /m5PkjOf9uCQsjKZNargk9Y5agbLVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_10,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210002

T24gTW9uLCBOb3YgMTcsIDIwMjUsIFh1IFlhbmcgd3JvdGU6DQo+IE9uIFRodSwgTm92IDEzLCAy
MDI1IGF0IDExOjA1OjQzUE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBXZWQs
IE5vdiAwNSwgMjAyNSwgWHUgWWFuZyB3cm90ZToNCj4gPiA+IERvIGR3YzMgY29yZSBhdXRvIHN1
c3BlbmQgZW5hYmxlIGZvciBkZXZpY2UgYW5kIGRpc2FibGUgZm9yIGhvc3QNCj4gPiA+ICwgdGhp
cyBjYW4gbWFrZSBzdXJlIGR3YzMgY29yZSBkZXZpY2UgYXV0byBzdXNwZW5kIHNldHRpbmcgaXMN
Cj4gPiA+IGNvcnJlY3QgYWxsIHRoZSB0aW1lLCB0aGUgYmFja2dyb3VuZCBvZiBkaXNhYmxlIGR3
YzMgY29yZSBkZXZpY2UNCj4gPiA+IGF1dG8gc3VzcGVuZCBpcyB0byBtYWtlIGl0cyBwYXJlbnQg
ZGV2aWNlIHN1c3BlbmQgaW1tZWRpYXRlbHkNCj4gPiA+IChzbyB3YWtldXAgZW5hYmxlIGNhbiBi
ZSBlbmFibGVkKSBhZnRlciB4aGNpLXBsYXQgZGV2aWNlIHN1c3BlbmRlZCwNCj4gPiA+IGZvciBk
ZXZpY2UgbW9kZSwgd2Uga2VlcCB0aGUgZHdjMyBjb3JlIGRldmljZSBhdXRvIHN1c3BlbmQgaXMg
dG8NCj4gPiA+IGdpdmUgc29tZSB3YWl0IGZvciBnYWRnZXQgdG8gYmUgZW51bWVyYXRlZC4NCj4g
PiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogWHUgWWFuZyA8eHUueWFuZ18yQG54cC5jb20+DQo+
ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtaW14OG1wLmMgfCAzMSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDMxIGlu
c2VydGlvbnMoKykNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1pbXg4bXAuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1pbXg4bXAuYw0KPiA+ID4gaW5k
ZXggYmNlNmFmODJmNTRjLi44MGE0MzFjYjZmZWQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJz
L3VzYi9kd2MzL2R3YzMtaW14OG1wLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1pbXg4bXAuYw0KPiA+ID4gQEAgLTE1OCwxMSArMTU4LDMxIEBAIHN0YXRpYyBpcnFyZXR1cm5f
dCBkd2MzX2lteDhtcF9pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqX2R3YzNfaW14KQ0KPiA+ID4g
IAlyZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4gPiAgfQ0KPiA+ID4gIA0KPiA+ID4gK3N0YXRpYyB2
b2lkIGR3YzNfaW14X3ByZV9zZXRfcm9sZShzdHJ1Y3QgZHdjMyAqZHdjLCBlbnVtIHVzYl9yb2xl
IHJvbGUpDQo+ID4gPiArew0KPiA+ID4gKwlpZiAocm9sZSA9PSBVU0JfUk9MRV9IT1NUKQ0KPiA+
ID4gKwkJLyoNCj4gPiA+ICsJCSAqIEZvciB4aGNpIGhvc3QsIHdlIG5lZWQgZGlzYWJsZSBkd2Mg
Y29yZSBhdXRvDQo+ID4gPiArCQkgKiBzdXNwZW5kLCBiZWNhdXNlIGR1cmluZyB0aGlzIGF1dG8g
c3VzcGVuZCBkZWxheSg1cyksDQo+ID4gPiArCQkgKiB4aGNpIGhvc3QgUlVOX1NUT1AgaXMgY2xl
YXJlZCBhbmQgd2FrZXVwIGlzIG5vdA0KPiA+ID4gKwkJICogZW5hYmxlZCwgaWYgZGV2aWNlIGlz
IGluc2VydGVkLCB4aGNpIGhvc3QgY2FuJ3QNCj4gPiA+ICsJCSAqIHJlc3BvbnNlIHRoZSBjb25u
ZWN0aW9uLg0KPiA+ID4gKwkJICovDQo+ID4gPiArCQlwbV9ydW50aW1lX2RvbnRfdXNlX2F1dG9z
dXNwZW5kKGR3Yy0+ZGV2KTsNCj4gPiA+ICsJZWxzZQ0KPiA+ID4gKwkJcG1fcnVudGltZV91c2Vf
YXV0b3N1c3BlbmQoZHdjLT5kZXYpOw0KPiA+IA0KPiA+IFdvdWxkIHRoaXMgb3ZlcnJpZGUgdGhl
IHVzZXIgc2V0dGluZyBldmVyeXRpbWUgdGhlcmUncyBhIHJvbGUgc3dpdGNoPw0KPiANCj4gRnJv
bSB3aGF0IEkga25vdywgdGhlIHVzZXIgY2FuJ3QgY29udHJvbCB3aGV0aGVyIHRvIGVuYWJsZSBv
ciBkaXNhYmxlDQo+IGF1dG9zdXNwZW5kIGZlYXR1cmUuIFNvIHRoZXJlIHNob3VsZCBiZSBubyBv
dmVycmlkaW5nIHByb2JsZW0uIFdoZW4NCj4gdXNlciBjaGFuZ2UgYXV0b3N1c3BlbmRfZGVsYXlf
bXMsIHRoZSBkZWxheSBzZXR0aW5nIHdpbGwgYmUga2VwdA0KPiBldmVyeXRpbWUgdGhlcmUncyBh
IHJvbGUgc3dpdGNoLg0KDQpTaG91bGQgd2Ugc2V0IHBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3ko
KT8NCg0KQWxzbywgaWYgcG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQoKSBpcyBzZXQsIG1ha2Ug
c3VyZSB0byB1bndpbmQgd2l0aA0KcG1fcnVudGltZV9kb250X3VzZV9hdXRvc3VzcGVuZCgpIG9u
IHJlbW92ZS4NCg0KPiANCj4gPiANCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3RydWN0IGR3
YzNfZ2x1ZV9vcHMgZHdjM19pbXhfZ2x1ZV9vcHMgPSB7DQo+ID4gPiArCS5wcmVfc2V0X3JvbGUg
ICA9IGR3YzNfaW14X3ByZV9zZXRfcm9sZSwNCj4gPiA+ICt9Ow0KPiA+ID4gKw0KPiA+ID4gIHN0
YXRpYyBpbnQgZHdjM19pbXg4bXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gPiA+ICB7DQo+ID4gPiAgCXN0cnVjdCBkZXZpY2UJCSpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+
ID4gIAlzdHJ1Y3QgZGV2aWNlX25vZGUJKm5vZGUgPSBkZXYtPm9mX25vZGU7DQo+ID4gPiAgCXN0
cnVjdCBkd2MzX2lteDhtcAkqZHdjM19pbXg7DQo+ID4gPiArCXN0cnVjdCBkd2MzCQkqZHdjMzsN
Cj4gPiA+ICAJc3RydWN0IHJlc291cmNlCQkqcmVzOw0KPiA+ID4gIAlpbnQJCQllcnIsIGlycTsN
Cj4gPiA+ICANCj4gPiA+IEBAIC0yNDAsNiArMjYwLDE3IEBAIHN0YXRpYyBpbnQgZHdjM19pbXg4
bXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ICAJCWdvdG8gZGVw
b3B1bGF0ZTsNCj4gPiA+ICAJfQ0KPiA+ID4gIA0KPiA+ID4gKwlkd2MzID0gcGxhdGZvcm1fZ2V0
X2RydmRhdGEoZHdjM19pbXgtPmR3YzMpOw0KPiA+IA0KPiA+IEl0J3MgY29uZnVzaW5nIGhvdyBk
d2MzX2lteC0+ZHdjMyBpcyBhbHNvIG5hbWVkIGR3YzMuLi4NCj4gDQo+IEkgd2lsbCByZW5hbWUg
aXQgbGF0ZXIuDQo+IA0KPiA+IA0KPiA+ID4gKwlpZiAoIWR3YzMpIHsNCj4gPiA+ICsJCWVyciA9
IGRldl9lcnJfcHJvYmUoZGV2LCAtRVBST0JFX0RFRkVSLCAiZmFpbGVkIHRvIGdldCBkd2MzIHBs
YXRmb3JtIGRhdGFcbiIpOw0KPiA+ID4gKwkJZ290byBkZXBvcHVsYXRlOw0KPiA+ID4gKwl9DQo+
ID4gPiArDQo+ID4gPiArCWR3YzMtPmdsdWVfb3BzID0gJmR3YzNfaW14X2dsdWVfb3BzOw0KPiA+
IA0KPiA+IElmIHlvdSB3YW50IHRvIHVzZSBnbHVlX29wcywgcGxlYXNlIHVzZSB0aGUgbmV3IGZs
YXR0ZW4gbW9kZWwuIEkNCj4gPiBkb24ndCB3YW50IGR3YzMgdG8gYmUgaW5pdGlhbGl6ZWQgYWdh
aW4gYWZ0ZXIgb2ZfcGxhdGZvcm1fcG9wdWxhdGUoKS4NCj4gDQo+IEkgdW5kZXJzdGFuZCB0aGUg
bmV3IGZsYXR0ZW4gbW9kZWwgaXMgYSBtb3JlIHN1aXRhYmxlIHdheS4gQ29uc2lkZXJpbmcgdGhh
dA0KPiBtYW55IGkuTVggZGV2aWNlcyBhcmUgdXNpbmcgdGhpcyBsZWdhY3kgdW5mbGF0dGVuIG1v
ZGVsLCBkbyB5b3UgbWluZCBhbGxvdw0KPiB0aGlzIGNoYW5nZSBmaXJzdGx5IGFuZCB3ZSB3aWxs
IHN3aXRjaCB0byB0aGUgbmV3IGZsYXR0ZW4gbW9kZWwgaW4gdGhlIGZ1dHVyZT8NCj4gDQoNCkRv
IHlvdSBoYXZlIHBsYW5zIGZvciB0aGlzIHRyYW5zaXRpb24/IFBlcmhhcHMgdGhpcyBpcyBhIGdv
b2QgdGltZSB0bw0KaW5pdGlhdGUgdGhlIHByb2Nlc3Mgc28gdG8gYXZvaWQgaGF2aW5nIGFuZCBt
YWludGFpbmluZyB0aGlzIGltcHJvcGVyDQpjb2RlIHdoaWxlIHdlIHN0aWxsIGRvbid0IGhhdmUg
aXQgeWV0Lg0KDQpCUiwNClRoaW5o

