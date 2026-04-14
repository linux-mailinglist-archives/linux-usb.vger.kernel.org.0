Return-Path: <linux-usb+bounces-36225-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEKgK7+p3WlfhgkAu9opvQ
	(envelope-from <linux-usb+bounces-36225-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 04:43:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA6B3F512A
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 04:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BC2F302E86B
	for <lists+linux-usb@lfdr.de>; Tue, 14 Apr 2026 02:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AEF291C10;
	Tue, 14 Apr 2026 02:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="n/h/P93+";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NUNtYfyk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QOtIhwSq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EECB8460;
	Tue, 14 Apr 2026 02:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776134587; cv=fail; b=SJW7UPMkrSE0+KTk8LwRHanqxsF4Gt2fqoFBatVs0I1G3omnWi+wTNzVSJBeSZknod6ZtOjD5LhVzz++lu974WlPgouyIXWL2EdZPsWXhu2RsO+aXLXC3E25JTjNj9ZBkMNsdoSuc5XI+v6hJBbmfwjVXxz5xc36ln16UQBIULQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776134587; c=relaxed/simple;
	bh=a4ePGcq36t4hksXVOMyDTxsNmXcQTArxrQTFzLTu/4Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=faBpPgSKAlx+6hHawZpeBpIr829EJNKp52PS5mhv0XAzL4P7aqPWW8QTLIgYviQ4ZxWBsIlq+K0WB5Tn1s1pZ1nS8NGH6pW34K/59EhzZwRHSJQHY9b0WnIx2lXmuM8tg/4wWlOWMn/NZH9Q5QdRNvpMcXdYBgeTvJyLlqMeIjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=n/h/P93+; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NUNtYfyk; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QOtIhwSq reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DNgYJP1774977;
	Mon, 13 Apr 2026 17:59:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=a4ePGcq36t4hksXVOMyDTxsNmXcQTArxrQTFzLTu/4Q=; b=
	n/h/P93+5petrCDIYYcUBtTuAIw1Y0RJ+bOsgWz4gLMuzDUUeXhmjZTYSxksxlO9
	3/wqFDN+3NxjVXafxlWh7Kj/PiomLAZDken1YJeseGM9iUv+tVRN64gRaBbmNaZn
	EDM1lrNmj/nEjyOu+9A49dkAPYFmcfpLwcwz049SzRgn9MoOPNR2BWAYAuRGX+x0
	eGFrALVOPWt6E+tAlKCxZsTO0VF/p+WLvpL2028XfDp3J5DZZoCvg1kOCcgSWPNa
	ZCiX8gN3UBl3vMD6hZCBDbUlolhDr1GXdinfpa9iQpRg356RroZcCXUaZk8vsm+U
	zrEvt1Wr5NTQGQz0c/oBTA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4dh84tgtne-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 17:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1776128376; bh=a4ePGcq36t4hksXVOMyDTxsNmXcQTArxrQTFzLTu/4Q=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NUNtYfyk9afDb+suJvmTiQY+iOR/YrdlsUUsSCbLcsJ3pd2bmvhpYQ/UgLtm1BSY1
	 +ZjaW0Xd5h8gpf9ngRN6/AShSh/iscL/1A+MBNsdAdlwxA9yO4b5wjqhaajvasgS50
	 LTp5rRNd+Lw37hKu0sYGtUTwFbgyeSWX7yC2CikWJAIy9DOFTuEafX1cMz1m0L3XSv
	 BhcGRl+4uUi85yIqmbwoilax5dnKQRXZYofQhrmpTwOxaicbZE50jm/hX/Bd3wvKFr
	 kmUzy//sOedQcHjz93TYh4cB2Lb175+/X2qX3Y9Llx7nZzSNIbueAEjJ33qbdMhJyQ
	 q2i0KoepAlGng==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8453C401F3;
	Tue, 14 Apr 2026 00:59:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CFB37A005D;
	Tue, 14 Apr 2026 00:59:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=QOtIhwSq;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00100.outbound.protection.outlook.com [40.93.10.96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4E8FD40590;
	Tue, 14 Apr 2026 00:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlwX6KxFGH33OSv1yirv7VAvQqCa26PGuAUklC/UJ9rqsgKH3NuEu8F5xpGB/e2GmblDkoTrmVp0vrn1Fe+WdmLhrUmKrI1TgUHLcR8TchGO5Z0FA/9OVFWMNSY3L86Z56Wgi/GNOpv03nkn+Zzf6ew3J4VxcKe+gaFeuBQgVGQnnq61VtutRv5FRBxTINKNkSRFHHepl4am2EAsO+DjyqZ6pFBxwLB+2FyyDLiqDhCAmLy4gitaURGfbeFi564UCe7+rJLr+XKYPRQlLOtrFl+WD5beOqQdNXDOay7QkSjnUnBtYYDDQKew8eN8YLO9EyUEUeYHpf7Xrg0M6xGARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4ePGcq36t4hksXVOMyDTxsNmXcQTArxrQTFzLTu/4Q=;
 b=YViQ4XBo2JdlIw8FoATxifs7gGaaQK4vEAuOxfFigC3dxEYJAJwtcVwGNxjHRh70duw0wqWNrtNx8/e+XoZcTyRuoyO0JiRczXX+QF3Z6HfZSobq2F0iYZwvnRDj7BsbVz7QNPXNOlOzonkr9FyJTnoAro9XRR1Ju5TGTLWZEbPg5Ef9wYyqyWKHJPKTFnmQLTLcYH6v5zjQG38bMBThJHKDwwGV9ksXQ0tgA+XbebdWOtN5VXKn0nRVAWfX8KVpKFTm56lcC+ie08jLF0bEIyeIlbMuw4BcwX8M8JgE07axBWhYdPvbshzAdtwd/Ao+OUePF1VpHnqrxNXKAHwyhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4ePGcq36t4hksXVOMyDTxsNmXcQTArxrQTFzLTu/4Q=;
 b=QOtIhwSqdYxyWXsYcjpHvVWDZL5rq8G6m8B6LYPQ4StDZeYDhggsZi6IK3kZiDhxFog/KG65RTelrq2ktJyk+nY2p6Oy4vCCQpxKu1hei2eNvWZuU5LiJaWPPkdCpJL8iyTueY+ZMm/X8i784ghaLiEHFEgc0zvSDEA7wmxfdP4=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM6PR12MB4356.namprd12.prod.outlook.com (2603:10b6:5:2aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 00:59:29 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 00:59:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Minda Chen <minda.chen@starfivetech.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] usb: dwc3: starfive: Add JHB100 USB 2.0 DRD
 controller
Thread-Topic: [PATCH v2 2/2] usb: dwc3: starfive: Add JHB100 USB 2.0 DRD
 controller
Thread-Index: AQHcyNy5eMp1Tl1XUke2BX6szD3cF7Xdwh4A
Date: Tue, 14 Apr 2026 00:59:29 +0000
Message-ID: <20260414005918.l7ze7dmbem5itxsi@synopsys.com>
References: <20260410112500.90432-1-minda.chen@starfivetech.com>
 <20260410112500.90432-3-minda.chen@starfivetech.com>
In-Reply-To: <20260410112500.90432-3-minda.chen@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM6PR12MB4356:EE_
x-ms-office365-filtering-correlation-id: 9b53c5b9-8091-446d-b2ce-08de99c11501
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 pyBZh8V3IJncznZGpEShsUsb5iJbxuD321uIoHa3hlaYzXJejezxUcljWLXOX7HPUGbLnWAghSHalzRxIeLC+HRFDhanJpRr7PibZEK9OoD4Wfoomtnb5mkHvggii3o+WxGI4slYylIwCCJdoB19RVazIssxMF6XLnCT+tkq3nyMxGOyXfuZCdKoSPvOuOjsYh1po9JG2sooIYceitYGpF8epVJ3agJ3EvcY2NKBWFxl/bGo3q0JGRVS5DtLTygTd6mEN9xUN3ICriKe6V83Lw+tf7k9SRwh6cfiZOCRP9+XJz0E0baiqan7tJGKXzRk/IT05ALvQCr7dh+U+efOs7XijbsZjwgdylFdMh7aQjIIwXdRwO2yN5QYx2S17MMoFKnJh/fsq1U2oHgVofCV8jJaD2zy3lsJKyu3BqdRDtlLQjP7L0Xbt5ITbyk0Iwbb3jtBRkJpHXZjvyXV/UiEqFTNE/J5hEL10zqrWykgt9EQDhnMCkKsrpiCGDAxW3uHXcdGhXLkdUlQ/mE1Vf9k4XwILdNu3adXrsRv9rD7GgeWmnWx/ssdrGlVmveSKckTfxZR0tjHJSU+VjzMZkgN72sQdMeMj12JSvYU94CeMHh7hX62Xm4DOrstfTSAa1fu/2Ql9lxtXT8Hi1yG23quh6j4xHVII5w0IXy0A1wZV4wsFmBQWo8yQIejwlbW0d+DNh3Y+U/sXCF+9z5qoy7NmOFM6tR/SDnKhQiZP74QszYpwPHB0pIdrJBZObVh1IwdSPDXF4vK//pXQj28trOgpK/SwZCA7BYdinWfUybrn6w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RFpOZ1p2Y2dPemE0ckFzRGNZcS9LSVJ0NjJIT3RzL0VTOWVkU05WUGxkWTIr?=
 =?utf-8?B?ZWxqVXYvWjh0NEpiajJGN05TL1lBSml1ekM0RTgvS0tLLy9WU0xCUEtRMDB5?=
 =?utf-8?B?c3lrbXRYNUlvM2d5bUpXNW9Ed25BVkgwcEp2WTI1WG5oRTFVQjdSTEdQM0hl?=
 =?utf-8?B?bEJrNkZndXY1VmZWVFRsMUllNlJkVWNDbTIwSi9yNmhhV1doaW9BMjVJaFVw?=
 =?utf-8?B?ZE1neXFRaDVVaWw4Tm04QkNnVytSWDRRSW91R2Zueis4M1dpcjgxbEwraHNZ?=
 =?utf-8?B?Z1oybjlmL3oxNUNzaUNlWVl6blVtVHdYZjhVZXlTd2ZPR21lbkUrWTBMSGNW?=
 =?utf-8?B?bDZFK3hoSDBpeVNQakxaaWN6Wmt2bnprWi9qSXl1QW53TUtlclJNZUswZjY3?=
 =?utf-8?B?dXlyMkdhRUhVME1jRkJFbDdzREREVG13YkNSb1dFVjRxc3ZuNmFPbFFRWXpp?=
 =?utf-8?B?VmpXdTNIakdCblp1SHRYblZPT2V5ZFNYNUU5VFdCaGN5MVVBTHFVRlU2SmxG?=
 =?utf-8?B?YjAwRWd4RkJrUTRmT3RzdjFDa1Y5MTNrSEt0UkNWNDAvQVZwUEQvVnJzZ2Z6?=
 =?utf-8?B?Tmp1SjRaUmJBRmR0K0RFZ3VTbWM3V2d6dW52MVUvWlI4NjFLN09BTmhWUlNo?=
 =?utf-8?B?QU1QeUVHZ1R6c2M5R2hUdE15TjhmbXFQdGNkRlJMaGMvUG84SFFrYUk1Mi9F?=
 =?utf-8?B?VTkyZ201U3RSRHJMZjFmK0ZNYkpnKzM1U25oVm5rUzBNYkhhSHdOMk91QTJt?=
 =?utf-8?B?eHRCRDMrMGttQXluQzFva1hQNW9vQlhuMDJ5dVRaS0JxYmUwSllZbWdSZGRw?=
 =?utf-8?B?SDQwQzY5Zm1HajZCeVowM0loWThUZi8ram9XZmVTbjVCRHFXSUx1MnA3Sm9N?=
 =?utf-8?B?L2JkaDhra1NzdkFSbDBwSzZzZGhXQ1htbFU4RTdqR3FHOEg1dThSM1hPQnk2?=
 =?utf-8?B?TU9lR0hZNjdBUkRiRjBXeGJKdlJkQ0hXdlcyWnV0VStHcHVFK0VXbVpHc1hj?=
 =?utf-8?B?Y2hESmtaVEVMRXZXbjA0VzBiTWJ0cHplQTBaenZkbnpsby9sMG9yQmhFQktl?=
 =?utf-8?B?QXEyYkdwUklSOW5iZnZUNFZYd0pHMER1cTd6VDhpTTJFZVVEQ3MzV2I2S3Jh?=
 =?utf-8?B?TUZIdDk0K2swa0hLbTB4RFdpalBRMlVJVHVwSWNqNmdFVUptZ29MSW5EK2or?=
 =?utf-8?B?N3JqYTY0RHFOQ3pDNi9jUHVVa1p6TUo5SDQ0M0tTRXZPUnpaMTJqK3NMaCsx?=
 =?utf-8?B?NjN1bGUyN25oV3AxNy9aSnZQLzlrWnQrM1lxMFlUK0lscUg3bXl6S2RHVUZ4?=
 =?utf-8?B?Q2V6OGhHUGxHTm1YNXFGTXVVeUI3Uk54TllWelRIVmlvME9vY2VhNStHWUY4?=
 =?utf-8?B?Z2t4b3JmejJTZThUc1JJOGNWbjg1M0FRV3BPTlY4TENlQitJTFhReS9GSXBW?=
 =?utf-8?B?RmVFUC9jNVRHaFhWTUI3SWlsUDRPNk5sVmY3eWxMNitCVjlES0ZMK0ZaS2VS?=
 =?utf-8?B?ekl1NXR5dExpN3ZnbCtZZUJ4Rk4xanVkZk01Q28ycnRJUTRqdytIMzh4ZlNi?=
 =?utf-8?B?VVFicmNzUlZqRTJCODUvQkIrMkorQlFSdndScmlLKzFmTGlYcnVnd3Nua0dB?=
 =?utf-8?B?bkZpOEVFNGFjOWJWRnZqeWZmU09oQzhUV0dqaGc4VmhBOUhjTGhCaElBejFt?=
 =?utf-8?B?UGlMMm1iUldLbnpWWDNIbmZydksvU0U5WnB1NWxKV3U5QWpMNk11SHpZQzBI?=
 =?utf-8?B?ZXE3OGY2aTcrcFpaY2U1K3NKK20rMG02UEV0WlE1QkNRUlRmS3d6RGxZS3Qw?=
 =?utf-8?B?ZllDRjBZUkVPMzNZZ3pzeWFuZ1NpdkJGSFMyeDBFSHRzM3ZKd2NnRFVYSCt4?=
 =?utf-8?B?eVh1MkNrL0NSSkt4bGpLRnBPMVRVSyt4bFQydnVsNys0cUtiSWh4WVIvNHBy?=
 =?utf-8?B?clFkR08vakdNOEl1amsvbnlDWWFESmlvM1RXTnkyK285Z2pyV0F4RUxGeHdR?=
 =?utf-8?B?elpUM1NxWnhwZkRyV1BQR2dhQldxazNuQUdSdkdwMkVRNThLNTI4YnhYMDVl?=
 =?utf-8?B?SWFKMHdiSDFSNVRraEpsbnlJUW1qS2FOVFFLSys4TElsWTFOSXY3ZVF4ZldZ?=
 =?utf-8?B?RW5sc2J0eC9SekxwSHBCREtES0ZXZ1ZPcHRQdlgyYmR6N2FUcjZmUnJlVVhP?=
 =?utf-8?B?cmFwWHppY0xrNFV2RkxaN3E3WWVqKy9EQmNYYkNyUVN1TlI2dXdGUDFMdm9E?=
 =?utf-8?B?aEJXbk1jbWRPZnlUSGVZVHU2V0dKamhYNzh5cVN2cG0rakdIamRET0h2UklX?=
 =?utf-8?B?OXNCV0dla1EwblJJeHB2Q1k1UDNoSzltMUNsNUc1QzFLWUJ5Q0RNdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F311E6137074E4CAD2FF094E91EEE8D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	mQyIA5z+aMMssHBHsW8ZZExP0myKJNfjYaL1cl7EjDpPD4hzqonPCjRJSajtu+db9KEIOJzCCtKjhH6aUhSj4xUuTX1hSRHPMn0VZIcrbtJVtbSWObFNRWg/R7CyEyhSalm+W9NCBv7VMpAbowAGUe1R4zZIJePZk7pEMveQz/WSlavNoQUqC/zJ9o2omKdm6xOqz+XZ5GdHLYiExkOu1nd9aWcSyCYMDOp72MkbUtCWy23PvqKgbfMnECN70RJTxP8I49won6FkransMLeyPfujEOn2lSWyIQXdaiTixZX/fvLpJgHB4yisRiSHegYM4I5uELKtqqmkXmaB0rfMeQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KUfUn/T0yOtT+6oJpIKrIaeUdMHXof+8JthkHPrVbOJfoLHDur4mALyAueNBgs6rGX/zYEUn6Kp5tGFJF8dClec1BupUpmXbWJV9MU+Q908W1y93H/GGvpY9Qsk2uHHnw3qHxNp6auyp/zfZCdZ/t/Cmdjbb/8wXFom7xJp7x4kntBWVvmb/51wuRL+ZQwhJoAaIf4AQsocxumhuM+bjx2Y9Ga5fMZH1MnXCey77BAuii3m0ooI6qccikf51i0bI0DoUSds8ghqGgho/unkeC8fqrZGupVv5ZDbakM6k8+gmvRlge99OchV3cLFT9Bf7/rXuO+N/WKmQ8mc++Tn9Y8q3M+UagQSpl53eYtJwiB4qYT+WQUGMTF76ScvpvvkZP/fkA9tX+G5epX1lA3NgnrvGz5WhQhiU5CFlTowJuwX9hgfroXbWKcuv1H9on3LKqVnBGX5Mj1bdDPb33P/oS1RcanPS+WOqLkdXRSb6PTmjLDDi0gD08ZjELTtsCqO7PPqybVUUrXJ+6/nl7Kxyr3SCvFySf1adCaiyabmmUxweYVn5aSQfgOW6KoiEeyzVWMdGdJbKJouukvqkfYrYYw9AFAcDe3B8E6ndSXL0sedVvnimhRp+hEQufzZ+2OE38efXYOyET1Ldd351GeAcgA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b53c5b9-8091-446d-b2ce-08de99c11501
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 00:59:29.3126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nAH6tZO4Ik8cy8aEbgpr/xXrN7FZPB5jW2Aerdw++GH3Vfj4FKDeSmLZi9BUoG82YxSa+S0C+yMc2r4ZTPjYXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4356
X-Proofpoint-GUID: zHVjGdB9s9nhZF9FkGx4HNenqlOBKcHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDAwNiBTYWx0ZWRfXwmpzLP/LZHPG
 LKqrkfe0pWpMRw/q/ii0mLSJik3+u8YSQ2v5vQ7PRMcNPe9PyicfNqcm+O55uUy6qUzk7NmFh3X
 83PUlQsrNJhkdZvt2CheOaiWhF+rHRmhSO8maW1FAqzqwZ5h7aJ65e+QAu3OTLzYGPl8xXuReBG
 Kn/y4ouyseFiIdyJ2/VcyMJ2cB1ctz/+aEo0a8IrIRWouMzZ0BIpA3TpZe0oOSxdIeRyGN2g6fI
 lk++yS4c5tT/EgbTcgck72q7hPt/PL0aHs3KA08g/flNWQwpwxbWk3nlzGVUnBE83DCdLghKGwb
 9WbEh5hV0c55H+WOb6iuW5ur/Uj7E27ZcFubK/gx1C7hxkGbDzjCnbynisKDB7KBLUQmfI59rOT
 ix4SCdiKsAg8eqG2Whj/QqDxzbLh6LUgbV0H5+84yxOQF7a+/82//XWvoho+lCkD140hR5lqYjk
 1KZbyEvtNU7c+qB+AKQ==
X-Proofpoint-ORIG-GUID: zHVjGdB9s9nhZF9FkGx4HNenqlOBKcHn
X-Authority-Analysis: v=2.4 cv=TIB1jVla c=1 sm=1 tr=0 ts=69dd9178 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=xKlp24NoqlmsZ8y70KjX:22
 a=Bq6zwJu1AAAA:8 a=jIQo8A4GAAAA:8 a=1gv2NuyY7WRhfDCDS3QA:9 a=QEXdDO2ut3YA:10
 a=KQ6X2bKhxX7Fj2iT9C4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 clxscore=1011
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604070000 definitions=main-2604140006
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36225-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,synopsys.com:dkim,synopsys.com:email,synopsys.com:mid];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2AA6B3F512A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBBcHIgMTAsIDIwMjYsIE1pbmRhIENoZW4gd3JvdGU6DQo+IEpIQjEwMCBjb250YWlu
cyAyIGR3YzMgVVNCIGNvbnRyb2xsZXJzIGFuZCBQSFlzIGFuZCB3b3JraW5nDQo+IGFzIFVTQiAy
LjAgc3BlZWQuIEl0IGNhbiB3b3JraW5nIGluIGdlbmVyaWMgcGxhdGZvcm0gYW5kDQo+IHNldHRp
bmcgZGVmYXVsdCBwcm9wZXJ0aWVzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWluZGEgQ2hlbiA8
bWluZGEuY2hlbkBzdGFyZml2ZXRlY2guY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1nZW5lcmljLXBsYXQuYyB8IDEgKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxh
dC5jIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMtcGxhdC5jDQo+IGluZGV4IGU4NDY4
NDRlMDAyMy4uZTllMjliNjNhYWE0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3
YzMtZ2VuZXJpYy1wbGF0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLWdlbmVyaWMt
cGxhdC5jDQo+IEBAIC0yMTQsNiArMjE0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgZHdjM19nZW5lcmljX29mX21hdGNoW10gPSB7DQo+ICAJeyAuY29tcGF0aWJsZSA9ICJz
cGFjZW1pdCxrMS1kd2MzIiwgfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gImZzbCxsczEwMjhhLWR3
YzMiLCAmZnNsX2xzMTAyOF9kd2MzfSwNCj4gIAl7IC5jb21wYXRpYmxlID0gImVzd2luLGVpYzc3
MDAtZHdjMyIsICZlaWM3NzAwX2R3YzN9LA0KPiArCXsgLmNvbXBhdGlibGUgPSAic3RhcmZpdmUs
amhiMTAwLWR3YzMiLCB9LA0KPiAgCXsgLyogc2VudGluZWwgKi8gfQ0KPiAgfTsNCj4gIE1PRFVM
RV9ERVZJQ0VfVEFCTEUob2YsIGR3YzNfZ2VuZXJpY19vZl9tYXRjaCk7DQo+IC0tIA0KPiAyLjE3
LjENCj4gDQoNCkFja2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5j
b20+DQoNCkJSLA0KVGhpbmg=

