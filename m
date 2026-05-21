Return-Path: <linux-usb+bounces-37908-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGWME8eVD2o1NgYAu9opvQ
	(envelope-from <linux-usb+bounces-37908-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 01:31:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A74CA5ACBF5
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 01:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBA77307ACB6
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 23:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C11B2E6CA6;
	Thu, 21 May 2026 23:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IELt94bS";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Hx7bjQO+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WP4Dq6wp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48E02DF719
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 23:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779405749; cv=fail; b=ZPaoueySX938Bv1lLOFTbfBxh7SjCyeXUx0dQvu+VvuJR61SilrGHA4kfyzyOTf1xbcvzd9Ksqc/ionlu4w97BmKTnWbtgxTQ0cedubqOFfxa4429ax1wnWrYsuj1u9hV+hLpm77EGWzQmLHmvow73OVkJ7KQ1pbP293hnu52ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779405749; c=relaxed/simple;
	bh=SCZJMHs8uPfXlaJRymwLgY+vxgBrAY47109rznoLODU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LwglxynEPzhGpKqwgiNLFkyGKpIlTP6G66HkekStYrC7oAfPzaqp1TLeeaYrt4MTYX9PcS//sUHF9evcZPdQ1fBNfEiP+4bVbQV9Kf41YgYMuD5B+78ul3xA84erC8bmLH7rUloHGqMBcUjuD77k2yW5nYJeE2LM/iRHNQcGjdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IELt94bS; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Hx7bjQO+; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WP4Dq6wp reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LIcZ2R1427404;
	Thu, 21 May 2026 16:22:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=SCZJMHs8uPfXlaJRymwLgY+vxgBrAY47109rznoLODU=; b=
	IELt94bSX9xeUWD5g45dmIK10d+VxXWy5lnlAhV22qks7Qp3/nDuqHgVXL+otUVZ
	wHQZw8IWfk4u0AcEck2JQ9vyI7G3H2hJbdlcS/kIFzyYHRv/oLd5N/Km/32Toooi
	A5gu+187aACx1Xyxqidoi34dXLv+Arvg6kglRK4O9+c8BvShCfbkhSYRCnAeFCIC
	Q0dYMYCs/aKyR1E3Bmd0+hqkcpqXuT55cJwF9CFZhloYlCwfj2hUk+Rkgns1bL2f
	bfHVwCzokXIiSnZczMH2o7JkXZQwcUFhWJ9GH6afB6B1tSNvGs7dtzAY197DFi/U
	pPCBqarPc9FwdsndbUT2Ow==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4e9ydb00mx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 16:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1779405731; bh=SCZJMHs8uPfXlaJRymwLgY+vxgBrAY47109rznoLODU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Hx7bjQO+aEkfOXUnlV1dnkzOebKg3WTT6DHcDSgBVGJLALqOY62Xj72lhN7Yaw54T
	 2rI9d6bG8jp9XLKs8rNdjLvGrQ5PF0NmFpDrnhezJ6AUtir4DS2qleV2xImXMJPKK/
	 mBHk7e8Vy2UDM5sO0TFr2qXGB42FGjEQrKWwp3EK1YMtri3q1niphgZSgMUEXSFAjK
	 Qzb5QSN9VODrpbd5dyZrNLH9sHGzlPfzmxhpjHabnZ1487l2iNenu2PymihPGXONll
	 c2+6hArn/pNH9pReCN6ubmBhP1Ud7EJXBNEVbQt9DBqasBhVdeBenfqT662bcv//eN
	 CTK0fzAaT8oYw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 56A1F4041B;
	Thu, 21 May 2026 23:22:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3BA21A00CB;
	Thu, 21 May 2026 23:22:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=WP4Dq6wp;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00106.outbound.protection.outlook.com [40.93.1.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id D6E6340144;
	Thu, 21 May 2026 23:22:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMjgrr+OJeBp0dgpO5llySnfxioPAw1vsyrmZ2GfOQ0r9FD1I2/3Sgr2IVPFhm3md7yTrIqjO0U1oBEK/lUNGedyRjRA8PlQt6wrIb8JyDqdfGFnui2RgBAWvETdCfx7oA6BvMpfkromnba6Nt+F1K5DCha/U36PDxKz3k8uUvzaUH11U6X951PUsUDx5TJxqq78ScKUcDYtVwmHCErFbCz1u+Br3C6K8wsaqW2hOML4kAOqos1rUlUEW/jYPYzyjz0hH0ipTLcPq3EmFhdOLyRJBmbkfgEBmu9R7Hd8gp3JSc2onTkHcDRquj9BVZwGOUTiOIANIN1vIsfVEyFy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCZJMHs8uPfXlaJRymwLgY+vxgBrAY47109rznoLODU=;
 b=n8l+fmq/xol0jjRjr1DiaVXll8RZ1fB/Wx5Dor2YLdd5Hnnp5I71IVxtx8HMrQw1GkYV4pgKTQNegWhU/sRfAqWCpdkIDjYckLx3iKjn/rimU/gHztABjjhblJ7CQTLoj9tQ8TnGRlxMh8BU7gRBt+1o3CGdYr/N49V1Yy0JKC+e8m55d+Jbz8TZsv4/ub8g+8tjwCfaqAF7iGQOI20WE8ISLH1mf1LWh2O7rq9XaUUtITokSRNMrdjdCVpDOF72XQ8zsWmAwL8Gb1S8x9Tr5DLBdDmufT3UdJndDNV3m0iEpzW1CHYEKpXVqi5TPYLRWj///mqOFMmMnEHHeGS9/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCZJMHs8uPfXlaJRymwLgY+vxgBrAY47109rznoLODU=;
 b=WP4Dq6wpxEuGu6E9AA2N5vAdVpuwUwFJKpUxu6/04GrdAQg9b+UAHondUrZ2ctBWuWuPPuZBjblNmk60/EtsJhwFDPFFmZPTpP/MiQiDrlE+BroYUlHclEGbWU5yyC+DrNYt1C2JKkLPdRu1y1jODTntINtMvOkStspbU5ez46s=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS0PR12MB7677.namprd12.prod.outlook.com (2603:10b6:8:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 23:22:01 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 23:22:01 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Shuping Bu <bushuping007@163.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "GregKH@linuxfoundation.org" <GregKH@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: core: Fix incorrect kernel-doc comment for
 dwc3_alloc_event_buffers
Thread-Topic: [PATCH] usb: dwc3: core: Fix incorrect kernel-doc comment for
 dwc3_alloc_event_buffers
Thread-Index: AQHc6ByZIGK7oFJzQ0SbqvVelWO7/7YZIQMA
Date: Thu, 21 May 2026 23:22:01 +0000
Message-ID: <ag-RxMdNGtPLD8i_@vbox>
References: <20260520055023.2415635-1-bushuping007@163.com>
In-Reply-To: <20260520055023.2415635-1-bushuping007@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS0PR12MB7677:EE_
x-ms-office365-filtering-correlation-id: d27e5287-8f85-4e22-8aed-08deb78fc32c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 qvy5hr8ND/2Q3kO6hJXn9RNgrPK7oA6ymZB9nPuAsaSkp90837F9/NldXcTtsyum56zk7xSeqyaoDwY01Y/jYRYVvEcS0TxLLXw1giq6ViaowLNnrqYTavxElX3rTx/NyPdUrJ1bMieTr0mUtWJQBosqP1jvu/C1C/1vt3Vd5v46/WOWDgI9ZJ0+hHcwqOmgvXXAIWNV+SOxVlCND6YJZHgGCZ1FIG8fN5GEo7OnyyrHZcCyuKpWFzlkBUSBp3hYfKx1c48uUY8n3sIbqntWU1tFWoBgVFpwzt9GArixk50GHlDjzrhnHqchUFVXoq9wvwoGu9MFXthD0rh7/YqnBkF3Ch5gE504/rz+icrN//8sPE6Rw6UlzYqYRvKQ9g8L+uHIt9GMOLexHnszhLBIbWKczqOK0l5LiZlpt11EbQlRFCjOxLOnLljlptgJj6QnMt2j4cyVLL8CEhOXgm0lJFi9lvEfyEtC/ZKDLKM1pb7K8TqUrAR3KOW0b8ygL+lNDSz+7UdBWybI8OrvL1moAUm2K49ARVQten3NTdbymARbPepYerJBZpiChm3U9AfkJbOvfRADLuixPlql+7ppgfIy+9glDa6e59EM2Pknq2oU8pOV/+0egY7S6GXUFkHr9VQfomrjYHTqiBmRh/ShD1chA9/bvnMHbSMnYH7PnxtNfVkGZY58sp2T1AyrWqbxMEWiMX8PzkrgJxyRmlgRjltr3MFoRLuSpoegNSoue8fQavQ8MJLcY3L4Lpi67B9k
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c2VJbTAwa3V4ZndzTDdCd2s3VnNLNXlwcTcrMUNHYTZBaG5rNzVXN2JEMTJq?=
 =?utf-8?B?eEhEZlFrTTR3MHg0Qks2UW40aElkNTh2dTZqSzhsYmZSYk5kMFlmaFJxeFc2?=
 =?utf-8?B?b3ZLbS9tbjBzV0VIdnJhdWQzdk1yVDlyLzM0NXVPdVRIbjZVSUw4NE5uY2FK?=
 =?utf-8?B?dldNMkxoY21GRjVPdlZXeHZHNmRXNStuTTlPU0dJZDVPUm92UW8vTFlDdTJW?=
 =?utf-8?B?UklGS0x2MDd2c3ZxNGlOK25JRnFLdVdTdEhhSkY1RW1DN0Rhd0Q2dzJMQlZo?=
 =?utf-8?B?RDVraWFVVG1UdVcyQjJpRE1xVEZ1cW9aRUN1QzN3M1lwSTV3ZE5SQmx0elRt?=
 =?utf-8?B?QklvK3I4MElranM2K2ZZTVdHRm5IWFdreGZiekR6S2ZzaVgrdWM1RGV1L1BH?=
 =?utf-8?B?czA0QzFlS0FGazd5MU12RHh1SzZGUW5ERUUzaTBvcUlZcDVoOVorQzZISXU0?=
 =?utf-8?B?Z0xLNk5EYW9OQVlUOVdsU0VuL21DUVZCblB0dXFJYzNUck1yUEJzaE5HVkd1?=
 =?utf-8?B?OGpUcUJzMy9DMzFvN0puakVqSUFMR2NDWkVuVFoyNHpaMjhuT3ErNUpKKzdh?=
 =?utf-8?B?OW5udDFpOHBSL2VqQmhUY2tabTRlZmtnU09GYnRKamEvdis4aVJoV2xybzZu?=
 =?utf-8?B?Q1dyazJ0VEVWdm5wUDJwMEFuOWpiWGppdUZQeE10UHVmOHhYVDc3VUhrcDFB?=
 =?utf-8?B?dWlVRGpVUlkyWkpmcDZ4Zm0rTkdhdFBxa2pabXZ0dG1XekhTVXFkYkl0aC9I?=
 =?utf-8?B?WlArNWdObngxMUNLUEVhM2kvQXltWHoyenVnb0FTdS8yanBrU2o2S01zMUtQ?=
 =?utf-8?B?cVI4MlZScVE1T3E2NVBWTXlPNjNxUXRjTmtJSmlJUjF1bUM4RlhMNUw2SXo1?=
 =?utf-8?B?azhKbE82SHVvcFlwWnNaaFgzb3ZHU0tTdGtrc3F2QmtkVjNrbU56c242VEZs?=
 =?utf-8?B?QjVBV1NZRzdXcElNQzZDeTV5TzhROG9welIxYkxNZlZabGdWaXpTQjk3Nk11?=
 =?utf-8?B?aTQxRzUzSnJEbGlPRGVZUEpJemxzVkJqa09hcnhWZERnUEJ0K1dsSVkwd014?=
 =?utf-8?B?S21HSkJ4RHpDRXg4SzNyMVRBKzZNZTBTZE1MWTFWcDVnd2tFWlRqcW5YQ0Nv?=
 =?utf-8?B?bEJJTXhSV3haejV1NXFhY0RUdnZQOVQrU3hacndxakRYaGhUTmNKNGJ4TDVX?=
 =?utf-8?B?eFlvVmtYNDIzajBpNmtMVXVZZU11UWZ0WSt6ZU9BSTVvbndSeXdFNkQ4WGxi?=
 =?utf-8?B?L203MVpDNUtKbjZ3WlBNMzVBaERXcy95SlphZzlUMTd6WlBteFdlajZQdDdE?=
 =?utf-8?B?Q3prRnIzMTNCOUF6NzE1Q3AvYlVxTXRHR1Q5d2ZlSE1yVFRsL2xkMDNUTDc2?=
 =?utf-8?B?Z1ZmcFArVTJoZ0lieExmY0QwNisrbnRNeC9OdzJvUlE4Q0NrcFRZb25mZ3Nx?=
 =?utf-8?B?YkM3NG1tdzRqU015QUxTUFlJcndlUUQrMDJJbWpMWFMrT3FwTzlhZjFITDhN?=
 =?utf-8?B?QkdwdEdNYWJmT0VGSXdtb0p4TzhBemRpdzNHTXBkbXd0RG5RMzRmS2lPckgw?=
 =?utf-8?B?cm5VUkwrNXZVaE9uTXRCUTRSMmtCcXZ3NUV1anVvWXIvZTZONGZUN2pIT1ky?=
 =?utf-8?B?RkJ6S3ZSMDYySmpCaTRrQm5ENUFHR0Y4eSswZER3bFpQb25CTXoxMHhEYjNr?=
 =?utf-8?B?bFh1T2tpSUdURUI4S0JFaXhHOXpTdmMwT245OEVUa09LcXZEU2w3cHkrQmVi?=
 =?utf-8?B?a2M0cGxKQTlFMEZxeTJIVXlUTXNWODgxQnJqZlVhWXJnV3NUcUNxVnNvNTRr?=
 =?utf-8?B?L3lONHppWTZMS2FubWtzcVRTdXREYURZaWxSYzVZWEVhVXl3UDJjdHhmeWZz?=
 =?utf-8?B?b2EwK0hqUkFBOERvNll3RWp4K25FQ2JmdzFQb2paY3dhajlzbHN2QlpJNUhZ?=
 =?utf-8?B?cFRwTWtYdDd1ZTFTVnprWWRFMFZQMjZVTFNXSEdTUk5jQnhQNUQ3NzV6VExJ?=
 =?utf-8?B?K0hhUkFSdmtwTk5CbzZyQUZXM3E3K3N1SThOUTBJSDIxeldGN1JNN1Z4VGVL?=
 =?utf-8?B?NDVqUkR3N3VtTG5ZRUxFb1BIZmVNd280YWN3NDMzdnhLVXJsQnRRZWJSaTBq?=
 =?utf-8?B?NUdtcDdGY3NmVlRwNDMvMEdyNmhFRjcvVSsrMk5HNzdyQ2hUc2RBRU5zeTRW?=
 =?utf-8?B?ZUN0amdWN0RldXRMQitqcUNLWUpEUGlYMGpWYjFXZDMrK3JseDlsaHNvMFZ3?=
 =?utf-8?B?V2hJZFdXY2FTeDVNSlVSbUxRUUlEcjFrRnZYRjZsNHlmVGxzS210K0Y0QkNh?=
 =?utf-8?B?ZXhMaFNDbSs4bmhKSmxIWHhlc0JabHdNVVFoalRHcmpqdENRd0RNdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B62B71B48B0BD84B93D83A4A6C50DD00@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Qhd6kCos3RAQZpmb7WE7csFbxCn3BQEa2ATX1j2C34mp68KVkGUm8dImmd8NKFDR0JCor33a05NcFdeyL9mAyxL+OpBqPrH/ssHoC5cKTfBWh+EsXPmdvz9A/rd5VKAQ4fMXAt/wfPH+qhDdzxmBahzl+a/nnJ4Yaedc4WkZNpNEv8f4rjtCDzr9hEAamx8yDiGuJ0rROM5KQPKcjb1bPeC/6AW/oxR3PL2LqF9SHr5y8K/P/jBtSi2JHvVWY/3bLFT5Vwb19T9vWiSOF2EdJetOaGY4OFhygQm7w0TUmvGlBjO9W5Rx5SGL81WGpZhBo8XALJXwwirALcBIRLOPag==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NxeVwfzTNXt1xpbdDDC9afcq6hX0351L+/M/xM7vbUxSSJtjnY6ztElBCnJPPZSVpsB437cDOkBd0niouBxXIHmz4WFkT+kDADbrUF7syoYxyk3p2sk67zJxcYLaglWTciEEL/tXwb5KTU0W0NiVxmAbxQR2DdaujDKJZZiVHYCX0WBLTbsuEtq8xuNy8l/DLk9FXo34qpcsctVhKjL51o0CN5pEj2p7d1wN9zf+7zzWJWX2GBOVs9uQq8WlmW17ml6lJAOBhS4uHQ4jHsH/Y7KqMCOWuLgC7lfccrvA8TCBXscuUC9a/mUQoFb1cUPCIgoor8O2gf2QFJKN9qDT46KA26TyZ3fDTONeNinvrxvYpZPpCSHV/W9l5YFhXA72u9T4gm+9vxAipFItua+YtZOEO0vr+c8VkVszdoDm+Ol7086CptY18HpvuBonX+kTIAtXlSpPb1oSsqkHKhQi+C8mD9peILK+lrbOw9o0ASA/TepxMM6HUeUJthBYau4JbCmwjl4SQx76pr5Wiz03hQPzxvxI4CdHtP1iEJ6aD9ofuqqzH2Vf7aAdWyNaV5XhR4FvnwaoAgPuSq+p0htztkL9wfd6q7O+mgcAel6xnt/6pZD962xAvmzHgiUDuRL8/Qdl0jFdAqIHiabAihJIMw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d27e5287-8f85-4e22-8aed-08deb78fc32c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 23:22:01.5642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: umKKWbvhd+qDYKsrIuc5FTcHMMBAfPLOI4mrd/wpjXpPh5HUA+X4hEAJabsOIQ/i3aASBYJnCvs2BKBn16MdUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7677
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDIzNSBTYWx0ZWRfX10GQVGkKxYqv
 LwCfUE34YY8ulTrtj1782TlaloMxFkxC8v+c6RJegBnaAFATfgqWCAaDHi25lgWrHvzlmdOtQCO
 ptSuBBStqZjShi9F2d4QUJ2jeGAn7/+EbrkhytSeMIQrLuwUchm86k67Kh9h6fIFaE8MI5/+eIN
 YAm43Ji91/rWbsO7GjkPVsJuzNTWPPUAtigWy8Ln+scBW6bAtsFdzfeNbbBmPJ9pyu5V++5Kns+
 6+aLG1nzP14wTdMm8aUYZMgXHSG6U23gjrjQdj256sYRixEArk+jnrFsHyzdPIRE5HJSlJ5N03Q
 1YBQUEi+/UedAaeqUcPDKwLdb+uCwO1MqPPrIXQ2wNRLGHzmmEG9WDRAJ5TmVMF+u2+Cg+tHTIM
 0Yb/er82HyO3AeFEZ9wP9m7jHeGL+EBt39NOxxmY3G2g+OrDXSQNFCLYDQPMeTHrNlbKSebDDSQ
 3F6eJ4tR/dOgBhSedNw==
X-Proofpoint-GUID: OXK2F_4OrZVko59YXlgLLDpfKnWa0VjD
X-Proofpoint-ORIG-GUID: OXK2F_4OrZVko59YXlgLLDpfKnWa0VjD
X-Authority-Analysis: v=2.4 cv=JduMa0KV c=1 sm=1 tr=0 ts=6a0f93a4 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=Byx-y9mGAAAA:8 a=jIQo8A4GAAAA:8 a=JffnAvHzpx-V2MIkhycA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 spamscore=0 suspectscore=0 phishscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605130000 definitions=main-2605210235
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37908-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A74CA5ACBF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXkgMjAsIDIwMjYsIFNodXBpbmcgQnUgd3JvdGU6DQo+IFRoZSBrZXJuZWwtZG9j
IGNvbW1lbnQgZm9yIGR3YzNfYWxsb2NfZXZlbnRfYnVmZmVycyBzdGF0ZXMgdGhhdCB0aGUNCj4g
ZnVuY3Rpb24gIkFsbG9jYXRlcyBAbnVtIGV2ZW50IGJ1ZmZlcnMiLCBidXQgdGhlIGZ1bmN0aW9u
IGRvZXMgbm90IGhhdmUNCj4gYSBAbnVtIHBhcmFtZXRlciBhbmQgb25seSBhbGxvY2F0ZXMgYSBz
aW5nbGUgZXZlbnQgYnVmZmVyLg0KPiANCj4gUmVtb3ZlIHRoZSBtaXNsZWFkaW5nICJAbnVtIiBy
ZWZlcmVuY2UgZnJvbSB0aGUgYnJpZWYgZGVzY3JpcHRpb24gdG8NCj4gYWNjdXJhdGVseSByZWZs
ZWN0IHRoZSBmdW5jdGlvbidzIGJlaGF2aW9yLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1cGlu
ZyBCdSA8YnVzaHVwaW5nMDA3QDE2My5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9j
b3JlLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5jDQo+IGluZGV4IDY1MjEzODk2ZGU5OS4uYTI1ODdmOWYwYmI4IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuYw0KPiBAQCAtNTI1LDcgKzUyNSw3IEBAIHN0YXRpYyB2b2lkIGR3YzNfZnJl
ZV9ldmVudF9idWZmZXJzKHN0cnVjdCBkd2MzICpkd2MpDQo+ICB9DQo+ICANCj4gIC8qKg0KPiAt
ICogZHdjM19hbGxvY19ldmVudF9idWZmZXJzIC0gQWxsb2NhdGVzIEBudW0gZXZlbnQgYnVmZmVy
cyBvZiBzaXplIEBsZW5ndGgNCj4gKyAqIGR3YzNfYWxsb2NfZXZlbnRfYnVmZmVycyAtIEFsbG9j
YXRlIG9uZSBldmVudCBidWZmZXIgb2Ygc2l6ZSBAbGVuZ3RoDQo+ICAgKiBAZHdjOiBwb2ludGVy
IHRvIG91ciBjb250cm9sbGVyIGNvbnRleHQgc3RydWN0dXJlDQo+ICAgKiBAbGVuZ3RoOiBzaXpl
IG9mIGV2ZW50IGJ1ZmZlcg0KPiAgICoNCj4gLS0gDQo+IDIuMjUuMQ0KPiANCg0KUGxlYXNlIGFs
c28gaW5jbHVkZSB0aGUgRml4ZXMgdGFnLiBJdCBjYW4gcHJvYmFibHkgZ28gYmFjayBhcyBmYXIg
YXMNCmhlcmU6DQoNCkZpeGVzOiA5ZjYyMmIyYTQwN2QgKCJ1c2I6IGR3YzM6IGNhbGN1bGF0ZSBu
dW1iZXIgb2YgZXZlbnQgYnVmZmVycyBkeW5hbWljYWxseSIpDQoNClRoaXMgcGF0Y2ggZG9lc24n
dCBuZWVkIHRvIGdvIHRvIHN0YWJsZS4gQWZ0ZXIgYWRkaW5nIHRoZSB0YWcgYWJvdmUgYW5kDQpy
ZXN1Ym1pdCwgeW91IGNhbiBpbmNsdWRlIG15IEFja2VkLWJ5IHRhZzoNCg0KQWNrZWQtYnk6IFRo
aW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=

