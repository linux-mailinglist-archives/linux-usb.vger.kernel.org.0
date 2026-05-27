Return-Path: <linux-usb+bounces-38114-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA1VM0x9F2qqGggAu9opvQ
	(envelope-from <linux-usb+bounces-38114-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 01:25:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 316765EAEA3
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 01:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3F53305F08C
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 23:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FBC3CB8FF;
	Wed, 27 May 2026 23:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ghyK35xu";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kYj/THL4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="w70nNviG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0413CAE63;
	Wed, 27 May 2026 23:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779924265; cv=fail; b=Cc+kmGm9CI1L73sj10hmF4z7X0mptLqelOaaLr6BWsia583T0gI+NTxScX5nCWmaDIEul/5mNakK88V3CEV4lmJve7EjYd0QVSbFepSd4fI97+kiw8xVsKaExxQo+qdepqalkYEJdZDhmGl3VLZmNx/jQG6CN6cigJWmwvbky9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779924265; c=relaxed/simple;
	bh=kXgoDK/BTuDRBtWym6ZGJwanlhrIPAme8akovt/2/A0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bxib/OxnOnfG4AC3JII5PrdAOhcQNKl6B9l1TvcFjh5ltVzjEiyNKsrQ0S6eYSXGZWB9j+vUranYwAl5bOif1Wn8qJsdNYnp7iJbeIAu+2C4mIDipl90y3YRX5bpZEGt1r1Qx0nrDL8dSpwA/UPWs6F1O2E3khtoup671LJXVjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ghyK35xu; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kYj/THL4; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=w70nNviG reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RMlQrv2453500;
	Wed, 27 May 2026 16:24:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=kXgoDK/BTuDRBtWym6ZGJwanlhrIPAme8akovt/2/A0=; b=
	ghyK35xu2GSRWGIH3pI7SnSwWq/MdbOdFQQbBTCsYb51NrNu/P80/c8BU6bi2xSC
	tXe7X/vQHo9ek+v+3SlXlIAu4ozEIjyajhvXlOsZoDxrjhZFRk429zRRUQU3bZk1
	FNSxpCBLWggovayw018ISnPXu7PCieybjt/B7TolRiTjb8Y5FujQPMlfa0obGPiu
	T7cuxiVLoYilp/+YKOqIHy28yR4Omr4MVYD6bbWO/Z1pcL7vdyBnS4suAS9D7jbh
	DexKP+HpHbds4dWl+7Ve4LaJugi/OLDe0QwsqVJ52kFXVEc0hX9slgwdb7+OUGcd
	RFLsfeULWAVOj6eR40zsJQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ee7xqgp38-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 16:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1779924245; bh=kXgoDK/BTuDRBtWym6ZGJwanlhrIPAme8akovt/2/A0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kYj/THL4PR9/TCipDg8C3yTXMvDtZAjke1xZ3yv0b8KOYKpxOEtM7PlAtb9Gf6N0D
	 4mtdtdtHSp7Bl1e846f7rwDpGIemcRgvCPyFOqHv6lxciOz5A6p1QD88aa5z3Wpq4b
	 rU76vbUdNmwiqj7WdoHmTsDpUpgG4fvVV4W2Ax6+zxtTGzy4IQDFypZa+y/MBxM8uc
	 tVJJSVBW0z5qVrGFlt4MUK/fiH1APxy8KGGlxUvJHMqagJF5zwqVrNvWIzGW6lTzoc
	 BAfWM7ojy3ecAR44+S4mfG5S8xK+cPa6djuf8ICFRSSZonw65H2XtPYccOLUZ6N/Iw
	 tTKjOYHKqSPHQ==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3DBDC402D6;
	Wed, 27 May 2026 23:24:04 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CFF6AA0073;
	Wed, 27 May 2026 23:24:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=w70nNviG;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00100.outbound.protection.outlook.com [40.93.20.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5F8A640B79;
	Wed, 27 May 2026 23:24:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ca8XEYIeVAXlDFduN0PmMNSeBq4XLcNANAqcLYSz/+uiSWN2pXv8FWp4NUrcL+8n4w7MEb0vV8aw3377c8vLz6VBb2DfXqnwf7u/12ILI/1rE55egsVHyRux1ZfJ2M9OAkeaKAkyClq9UvX/llgVlcYLLg9R1FRTM0c44iFxlVQQ3ZkkQGJhzQa5RBM5Zeb8QFk2Z3N1+7t0XhYgN2Nawwh1r0n5oihWr2tPSV5rNV8JMZcCYM++vt9Ne9btKX65Fy+iEGXsnjYHMZ4dXtAjsgN1DmONECNCuRw/6gkU24VeAYGa+SJ9HzmQoVfgad62dEdVc0ObEH+CvsVWiZWcjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXgoDK/BTuDRBtWym6ZGJwanlhrIPAme8akovt/2/A0=;
 b=oBR9SfHO6MXZageJFXy8tKuzlnwKcNU4mX1N8jA32jdYXMOqeIzcjzA93oLJwWAUKyH3iHtJDBYCblR2b1cGkYVNLc2/pGz7i0u3nQcCe2NgtchGiGh97xcxa7R6IMkX1dDU+PGArFltcEtq2pZnHgCH6nKsyaOHwWgG1OAv/PE/xQB8oPC+xJ0upTO/xHjglLZWd5dlTXCMw1375fETv2YwR9H2IrsAElXQu9w5zI566M08AQYkzVF9Hx70wrLvM6n00maGxKWEUnMCqMyXG5o4ZcflfQ3FxN4JntXKAh46s2Z/4XKrcJ1NaC6URz0VvOnBVZ1/0dLqEq6ymXfPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kXgoDK/BTuDRBtWym6ZGJwanlhrIPAme8akovt/2/A0=;
 b=w70nNviGbA+sygqEqryUw0392idhO1CnuawqFI6L58ggyF3hcur5iZ8LC+DAjXA5tO8SXAlBUNjkcSy8o5uvqyCjO2AIHoLqNJgklGSQxnuebxyMLmkgwizTJrQfeWrGgKCUepcTGhdiQT9YGsrOqPjXDwIilrF9OiDJHbNVODQ=
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 (2603:10b6:610:2fd::7) by CY8PR12MB8410.namprd12.prod.outlook.com
 (2603:10b6:930:6d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 23:23:54 +0000
Received: from CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61]) by CHXPR12MB999220.namprd12.prod.outlook.com
 ([fe80::c13f:e49a:47dc:5c61%6]) with mapi id 15.21.0025.020; Wed, 27 May 2026
 23:23:54 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH v2 2/2] usb: dwc3: xilinx: use reset_control_reset() in
 versal init
Thread-Topic: [PATCH v2 2/2] usb: dwc3: xilinx: use reset_control_reset() in
 versal init
Thread-Index: AQHc6oMMdVy+tE4CYkmEqh528RDkXbYiir2A
Date: Wed, 27 May 2026 23:23:53 +0000
Message-ID: <ahd8_jIDBQVsZ3Vp@vbox>
References: <cover.1779518171.git.radhey.shyam.pandey@amd.com>
 <6a5e4e25d84d6abc971f1669739aae4d3146700f.1779518171.git.radhey.shyam.pandey@amd.com>
In-Reply-To:
 <6a5e4e25d84d6abc971f1669739aae4d3146700f.1779518171.git.radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHXPR12MB999220:EE_|CY8PR12MB8410:EE_
x-ms-office365-filtering-correlation-id: d14f72d8-7af8-4cb2-435f-08debc4704ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|18002099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 7cCZ7VTG5QfKsaGCvKcrqzYouB/MXOoQhtmwJXvpoTBhv3kimztUZtStWhwi0HqVPg+YtSMwBHl4U+FOi/fsnWn4CMi78U1ZtBX+QMhKiwUAOYKv5QqDyMl4khU0ii0zaGVDy5h/qqQpIIzOciFgsZzid0Mzsz2VL15oifn2uQPKLOfVFGfp1tzRDGBU/lzAGXJ12i9hP2tWoPTsxfra8rqpnl8gFiPnOyKtxLO7jCZuZJkE26V8cKzAQqDI1RO0oA4EMBH+kuL/a3pa/H3dLhTL6WLJkBfx4R1sOTSpQnspmc0yF1adAyeeBR9Wj35QZlabaXGP5utc0Jyn+o7LRfXxbB33j3Qr+MbkWnWW6TP786FC4uowwvKjJhoC+LyYjag45akuFZfFLbXzONKeMlnIhhSr28c3D1COjpaKaCCysuBxu/qPtYUHeS8zBslQFamkfj2JKOUVkljB6Y/NvQ6NTCQj+j9531WA1i+voHDKgLKHmv+ovLuS4tYGfpnxS6wQwV1yCw4oaNEJ5MXYkleEzC6tS8E0R0AipPA/KVsuObbNX3g7/TSAbYUk96kQqboHKpAS6jBwtzSeZ4E4QBZDSeOJV2Hc9haqFGpbeAoGCBu79ghcVPOYMFCVdycBgzTFtmlE5HaSV0rtSmyp1G/bQEIxUrnMufRfAbAAv6KVEzf/Hzw1+gpMxqTc6TuL8QVzuGI4Kib3VdN4ZOVMW6ZklFxM5XJdmVIuEe+aW2pFxiRF82gDT+2suRNZm80Z
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999220.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWRNM2Z0Q0dicVJDY0laMlBrVmc5Mk5vdWdueW8zaXllVGtpcWRMSkxPVXdh?=
 =?utf-8?B?RVFqZVBrNGNyWTd5TG1YL2VTRGVHcW9jdVZLYWR5SFJLTVlhZkRBRy91cm82?=
 =?utf-8?B?VkNLaW9MQTFWMDc5N1VLcjF5QVdDSnhzdXN1Nml3NHpWcnk2czVVL1ZjU2M1?=
 =?utf-8?B?UmRCUVdKVWhjMGZBWFZaR2NYc2FzQlJFUjBQZTJLKzM4RnNXbjRZMnZTY2FQ?=
 =?utf-8?B?VHQ0amRUU1JmMTlpaVN1NDdCRXl3SnNmenY3dDdFK083ekpJbW14c1MxclIv?=
 =?utf-8?B?NWwwMVNUSm0rKzZSbk5uOXVIWFZ3S2l2UkY0Wmc5Y0h5TFgwYnhTOTdPNm9w?=
 =?utf-8?B?d0QwdVlPSElBQ3JrUitpYkJIczhDaWU2WEJjaTZCNG1RdFdjVjk1TzVyNGJk?=
 =?utf-8?B?ejhVT1ErQW1rZzVvRzFzL3BiaWdCcGZnRFhnWjNDSmZ6eDZvbjVaZ1dXa05C?=
 =?utf-8?B?czlCYXpMdGR3Q2FnbHhMdHF1cHpoS0l2Z3dPTFdyQldxQy9RNlM3QnplckN4?=
 =?utf-8?B?azVLVEtKMk1hZGM0b1ZJZ2c4c1dCWlBVcXoyK2syVFNEU2svMVdRWnNZelJB?=
 =?utf-8?B?dUlPRVRNM2EzTS9SdkFvc0JCNCtrdVBlWGt0QlZtQktodWVQa29hQ1kwVEVG?=
 =?utf-8?B?TTJnSmNraUl1enpzekNXcFZMbC8rTWVlWEh4YWJGM2hhSzNOWENiYVgwSGND?=
 =?utf-8?B?OXdQb2ZNQllWU0lENUdhNUhCR3l3M3QwbzRMd2xzSE01eFptUjAyY2pYOXFZ?=
 =?utf-8?B?M3YvdWpneFUraUl3OWRnb2hQRU81aGhEbHA0S0pZVVFKYXdpK1k3VkU3dWcv?=
 =?utf-8?B?dDVUZXRLTUdCN2J1VzlZdEQ3dmlPWWVhdlhOZm94T2Nvd3Z4VlkxRHVIQ0Fi?=
 =?utf-8?B?K09kZGZqQUFMRVBiTy8xUjdBbzE1QjZmL1M1RFpJZjk0eGhLZXhLdXhPRkt3?=
 =?utf-8?B?dGFzZEo0M2pyWEc1NmxkVW9iUnVRSmhRbXVVVnBIYk9ab3ErUVNUbG9pZytu?=
 =?utf-8?B?dkpBekRXdXMyNnB3OWlZR1pLL3QycGswbnM0UFplOUFPMVo3MlNZYmozM0Ux?=
 =?utf-8?B?MDZLcHBMeWNIVytjbVZ1cU1mQkFqV05QVFhpcFpwTHJFK095cE1ja1lsYXYx?=
 =?utf-8?B?Y29EVXBwdGRpbE01a1FqZXlXVDV5aEFhUk1uWTdYbW0zcER5VVhja1A1S2NZ?=
 =?utf-8?B?a2JVRUt2QVlhSE1pTHcrcnZTZFpycW9YQU1tRnRxSGdOUlpsaEpwL3NMYnlD?=
 =?utf-8?B?eDZySlJJU1RnUCtybm5LM1Jwdmc0WFhQd1d3OU1ldWZCd1FpNi9iYmNvdVdO?=
 =?utf-8?B?dzdzU2xpTGo1VWtXUitwZmFDR0ZBZFZGYUM1N0FaVVJLaFU0RmZHRUZ3QW5P?=
 =?utf-8?B?RVJFUkc0MWlNenZQNHpzVUhtcGpacU9zR29zRHpoajhsZTZIak5HekNLYTVO?=
 =?utf-8?B?Z1JyenpLMmJLeGJNUjhpSVBDU0p2bTFLcFYvTTNCM1l5bEpYYUZMM0UrWUdF?=
 =?utf-8?B?engzekJvSWI2T0VrVll1RXFiQk9NZzlxVmZSWHN6VjhyZ0U3UFdDOUlvVGZJ?=
 =?utf-8?B?NERlb1gzQjIzeTFsZDcvSHZwNmw1V2hhMmZGdlVKV0RlZGxVWlJqbStUNDhC?=
 =?utf-8?B?RE50cVZOSlFDaTIzMy9KTmlRVjdvT1Z4c3lZNUttV2F2bjBNVktTd1MrS0Rh?=
 =?utf-8?B?VFN0Q2F2MzIraVVIRitxTHdhUEYwL2QwVGxLQ2tQY21yNEdrMFZRVml3VmZF?=
 =?utf-8?B?dE1JQTZrT3NLZ2VnaGdoQTFmQmhHcldOOWxvUjlzSStwWTZUUmEyMFpYRW12?=
 =?utf-8?B?Y1dxeUEvZFVyTFpTaklVMlVpbWxwTTFXOEQ2WEpYc0M1SjZvcWExK05lRnBU?=
 =?utf-8?B?djJKSFdZQVBkTlJLTUhUemVzK1duZXZTa0hiZmtqRkxWS3ppcGVYampJWG9T?=
 =?utf-8?B?RXpYOUlmblBvVTViZURxRlRXTlppYyt5eW9WamJsYmpDMTB2c1E2cnZDRkNz?=
 =?utf-8?B?SG1DMjM5TVRXaTJQYTUwZERaYnUvcU9ZTnJKZGNRSDhhK3dTNFFWdGY3OUJD?=
 =?utf-8?B?Q203K1NGUE43NVV5eVRwdTNwalIvQkVER0JKV0NBTUdVTEpmSzRvVVQxNi90?=
 =?utf-8?B?YzM3RkV2aDhhcWt1b05XaXBUZnByMHIxdmh0NHcxUFM0UEFnVlhlVGJuNXQ4?=
 =?utf-8?B?dExBTGF1RkpMMStqaGpOVmFHTG5KZEVmc0Nma3pRbElrc3dpNWV6L254MzFi?=
 =?utf-8?B?Z29EYi9XMlorNVRKMXJlSVBkQU0wNUJrcVZkZkRWd1Z6Q2FnRDFOQkRNSDBh?=
 =?utf-8?B?RXo4akdqRUp0LytRSzV6TE5BNzVveTh6WDVHUmZESXVWTG0yeHYwQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F69FDD4A8BD5345BD540D18CF0F41ED@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	bT3zErO2QHXxJUIKlP9uW0udyH1ybBf2wWjTjrqS6Ydy2wz3jjrE1njhloy7AW5siNQRxAtjgC6MhK7rZW9zs4M+UHohBT7u6Jc1ukn25ZCZwwJsSA3c03WyFwaD7Q4bpemjbAmjFFERggiufLP+oWV+cSXDRealhmmrJZa2G/ZKWXwtimBJBdJti1thctTWgko7Xc3XcHQAtZCTawtkAGwipwSu9RPE0bQNLY0WZDnHLVsg0fV6NBUOrU9FKuBVCkNVeXy1nZtd31j5i2uTJXSVYlxYQTcb2C/cQfapEQp4ryg1dEx3y5tz27rU/FfI6qUeiReGzUb5l7DUcU2DYw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mURsU9kc3Px+/g0E2jW1DiToM37AjNxOCX2Btijzo8AgMT2gzXHGFn7Wng1KUiYz2C26iPGpoomyrlvrHiIJpnU4tzkHs9nDZkrxUUDkImYEfdryT7ODKGQ+anI+4SOrrOlHbAi+ibcbEo7UFbwGayDSqc1bM3yWy8d9vQg1Vby2UJbT+cuuXkAsnAT2kXJ3tAUwUKlOEE31U/OvLXE1UvGtpZwd8vUlnTr1uCIYfFHrtt+Qp3U0jkrS66SiylbMlf7DQwE9PSXPllXFSLuIab+CAySBw+NzWwsCdN10c1IO4jZ/EhUoxAhtGNsb3fwAQsUzEZaWstfcWAbDRSGQsWt7wwLkQKh5HmXpqYonVCyyUD8zFel+kmg9Go62yKLEekhUIG6oF3bNRq2X4hsZ/qdukVBQ5fWFRknWJ/hDVS9SvX/FfNfn0e5pxy/eeR3y9MsvcUB/2lnx7svj0M/+/fsiDI6JqvywgvzexCPne328rAITuAdTNkVIPEtWK5FhAkH3qdoXa1dzB52DuKQyuLThd03YTYJs05MKrxEV5RdadItXGr7y0hJVUenHmeEBtRmTXu96BGtmyGmP1L0ba0v4IOSF1BjM+wpms//gbMqnzYZyIxkXU+ohmjlXcFvgMFeRmR8nFK7HZ6YKzGgWGg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999220.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d14f72d8-7af8-4cb2-435f-08debc4704ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 23:23:53.9468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b96/Q17rlxRgfgQgZq+Jlfp6swwAW9F+inrP9wT0dctGKMYF8iOVJdXjcDcbmhVhEg4eff9CE3XngE7FYa8MXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8410
X-Authority-Analysis: v=2.4 cv=KaHidwYD c=1 sm=1 tr=0 ts=6a177d16 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=zd2uoN0lAAAA:8 a=jIQo8A4GAAAA:8 a=oMSxk5RmX12PZ-aoHwQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDIzMyBTYWx0ZWRfX8dIs/6Nnsg79
 bGJJb5Ag2XyPMV8EZtrpbXod/lEVuMSiXWzPsokRQOU3k8tciXiEfAy/5qwW9DMPtOaq3weQ+2Z
 /1DutF7Ff/Q215WU+c4jkmIJXDRfDhEIBDvzhRKImjj6ukJK7bhOqpteWUJuZPspKs1NBI2TJ9f
 ai7ZIICqUK62QKUXr4n/TxNKD09LFaqSHzmnWxwYamMrT7Oc5c77HSHsQfnpyfVWGpZ+lbT4jV8
 tBOCYOYkhXkWX6ZJjIqwXiDqj6/T3EawyGMrkTiSVqcTf6cblYZ6OlIo/6jpJ5tg8G3pA3zJrvd
 A3JUpxniim4joRSzEjhVlU3hIAUVzqDbsslXhjUupcwxqsG8fHyyrBBkE32mlsiITEXRQjziqK9
 1ejvJmA3LNEiHTgRaEu1mXwqz5ZCM7TszYdOrlzjsYnwkUK+MlTiYyZqyDGH9KKCFcf0QsksD+w
 FZwxc8Dhey+YUNRLOPQ==
X-Proofpoint-GUID: AMsQ4aTEIDT43MjctriTdwpOsyzeMHKs
X-Proofpoint-ORIG-GUID: AMsQ4aTEIDT43MjctriTdwpOsyzeMHKs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2605270233
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38114-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,synopsys.com:email,synopsys.com:dkim,amd.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 316765EAEA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU2F0LCBNYXkgMjMsIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IFJlcGxh
Y2UgcmVzZXRfY29udHJvbF9hc3NlcnQoKS9kZWFzc2VydCgpIHdpdGggcmVzZXRfY29udHJvbF9y
ZXNldCgpLg0KPiBGb3IgZHdjMy14aWxpbngsIHJlc2V0X2NvbnRyb2xfcmVzZXQoKSByb3V0ZXMg
dmlhIHRoZSB6eW5xbXAgcmVzZXQNCj4gZHJpdmVyIGFuZCB1c2VzIFBNX1JFU0VUX0FDVElPTl9Q
VUxTRSwgd2hpY2ggcGVyZm9ybXMgYXNzZXJ0IGFuZA0KPiBkZWFzc2VydCBpbiBmaXJtd2FyZS4g
VGhpcyByZXN1bHRzIGluIGEgc2luZ2xlIFNNQyBjYWxsIGlzc3VpbmcgYQ0KPiByZXNldCBwdWxz
ZSBhbmQgdGFraW5nIHRoZSBJUCBvdXQgb2YgcmVzZXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBS
YWRoZXkgU2h5YW0gUGFuZGV5IDxyYWRoZXkuc2h5YW0ucGFuZGV5QGFtZC5jb20+DQo+IC0tLQ0K
PiBDaGFuZ2VzIGZvciB2MjoNCj4gLSBBcyBzdWdnZXN0ZWQgYnkgVGhpbmggcmVwaHJhc2VkIGNv
bW1pdCBkZXNjcmlwdGlvbiB0byBleHBsYWluDQo+ICAgZmlybXdhcmUgZHJpdmVuIHJlc2V0IHNl
cXVlbmNlLg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvZHdjMy14aWxpbnguYyB8IDE2ICsr
KystLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEyIGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy14aWxp
bnguYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy14aWxpbnguYw0KPiBpbmRleCAwMmRjMzVlMTEw
YjkuLmI4MzI1MDVlMWIwNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhp
bGlueC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy14aWxpbnguYw0KPiBAQCAtOTgs
MTggKzk4LDEwIEBAIHN0YXRpYyBpbnQgZHdjM194bG54X2luaXRfdmVyc2FsKHN0cnVjdCBkd2Mz
X3hsbnggKnByaXZfZGF0YSkNCj4gIA0KPiAgCWR3YzNfeGxueF9tYXNrX3BoeV9yc3QocHJpdl9k
YXRhLCBmYWxzZSk7DQo+ICANCj4gLQkvKiBBc3NlcnQgYW5kIERlLWFzc2VydCByZXNldCAqLw0K
PiAtCXJldCA9IHJlc2V0X2NvbnRyb2xfYXNzZXJ0KGNyc3QpOw0KPiAtCWlmIChyZXQgPCAwKSB7
DQo+IC0JCWRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gYXNzZXJ0IFJlc2V0XG4i
KTsNCj4gLQkJcmV0dXJuIHJldDsNCj4gLQl9DQo+IC0NCj4gLQlyZXQgPSByZXNldF9jb250cm9s
X2RlYXNzZXJ0KGNyc3QpOw0KPiAtCWlmIChyZXQgPCAwKSB7DQo+IC0JCWRldl9lcnJfcHJvYmUo
ZGV2LCByZXQsICJmYWlsZWQgdG8gRGUtYXNzZXJ0IFJlc2V0XG4iKTsNCj4gLQkJcmV0dXJuIHJl
dDsNCj4gLQl9DQo+ICsJLyogYXNzZXJ0IGFuZCBkZWFzc2VydCByZXNldCAqLw0KPiArCXJldCA9
IHJlc2V0X2NvbnRyb2xfcmVzZXQoY3JzdCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIGRl
dl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gYXNzZXJ0IGFuZCBkZWFzc2VydCByZXNl
dFxuIik7DQo+ICANCj4gIAlkd2MzX3hsbnhfbWFza19waHlfcnN0KHByaXZfZGF0YSwgdHJ1ZSk7
DQo+ICAJZHdjM194bG54X3NldF9jb2hlcmVuY3kocHJpdl9kYXRhLCBYTE5YX1VTQjJfVFJBRkZJ
Q19ST1VURV9DT05GSUcpOw0KPiAtLSANCj4gMi40My4wDQo+IA0KDQpBY2tlZC1ieTogVGhpbmgg
Tmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==

