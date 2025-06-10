Return-Path: <linux-usb+bounces-24680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74106AD44E0
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 23:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99C6C3A5809
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 21:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BD9284B2E;
	Tue, 10 Jun 2025 21:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pnGMaDWy";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="brfbbgls";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="n+s7kzxB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFA123958C
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 21:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749591424; cv=fail; b=A67BRYk0RXeAbON0ddbNMNe87w+u4jllsoh93dNytGS2xGwl++UfN8GamFwsrjD3UlKcz9ZNPggCwIdOCvLE/w7L6Seck0mha52/WyMp8dPxPaZlgG5Sh0eDtMDND3GTD5f4ynBrAAzHFMCGAlEPZx9noI2j9U5RRmEgQ0TxSSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749591424; c=relaxed/simple;
	bh=I0vg6beYYojE5B0fojqRmw04IQ9D/lvWQeOBcGJjbnk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pPqTJ+4G6HSDFvLRsewPj5T8NwC0dwvCbVcyUbcuBfjkvK+OTp3SEoidWKYE1/Dc8O4ptkXWhUoLJlPGD5P6hApWOp2tFIPDadbL4JChwK/pM9dMir4YyhYjs8/TZuog3+2P9N91OwsFBRcPUxdunaN3k8p8zVapc+qujVU19nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pnGMaDWy; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=brfbbgls; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=n+s7kzxB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AHkSoO019875;
	Tue, 10 Jun 2025 14:36:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=I0vg6beYYojE5B0fojqRmw04IQ9D/lvWQeOBcGJjbnk=; b=
	pnGMaDWy7tbHMX/1Or9YLeG+n1ak70lDIOS8/CDYTUj3YHvDoioFVQRhjYs080Z9
	C6VodxYeDqjrxWPnSJ2FPv56E1IMNT6QvT4Nr4heaVAq4ZygPg/VSU06XrL2jzAj
	WlGU3WD58h2/e9WWEUpJHIzLmgQJjTUWh9+WDrka5Nz5lHDV90wwuG5h4ywjZ9aw
	mRF1WUOQYmfFOtEvQJrbQlfdeTvSrqzKYghyrugpxuOueuyazPLlJZIDHk3FeZOl
	imTugjtJbjNzEA0maPku4vurny7wrBsDDaVs9ugRpr8JiafJzBSkOT6RUrctKGby
	Cks2ISnwRkosTHbn8acjrg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 474mbxkhjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1749591396; bh=I0vg6beYYojE5B0fojqRmw04IQ9D/lvWQeOBcGJjbnk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=brfbbglsuaF2/ppUrghR1L1osbSihPTsqYrZ+WuKMXYod6Tq1WEwQBJHOwhKjyE4S
	 vOlqsHcvFQsVqnT4UAqiPTEZBhSHbxPcu5oBmS7SWxj1MKCzu3P52WrmDh0ckSLHrh
	 MP2ytZBe3dF//v9ijjnoH3CM56p39Jwu24kUuP97RYYEm8xa/ga3vKA78rw88tpj1S
	 ll5aBjZRhBb50ziIvGGz8kLIOrM32Dv8HKvD3NHkxNANTlngPo4FMuPUVfHimMTA3J
	 JjIBh/YN6wT8zzEe8aKMxf+7JDSGExjnTnKxvvNZAjqsbd2Q488jL+grIyC2EXs29q
	 pQNZku4nc2jFA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 113FC4013B;
	Tue, 10 Jun 2025 21:36:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D2220A005C;
	Tue, 10 Jun 2025 21:36:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=n+s7kzxB;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 28B314056B;
	Tue, 10 Jun 2025 21:36:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpFl1FvehDs1i1mde2v+ZjBQDQ6My7TNhSYZAfMwfUwy8ceIqmE+z+oEDxBw1WmdCDJWKB6lBKkIbbMdpK2Ml5BBDlfxkZpCrv06oz/QMfPGg7pAfUYpyfQlRW0211Nq9OIOYsDfNGQykTYtKc0ZWLBBGMhR9l1bcIT1lbpSU5TMaHyWZ2nOanlKgORBqIeS+X3X+JIeT3hvNxU8FGhb1KcYNj/ZDwSyf5BF3rdd6EPJIUDwieYeCi/Se6elKqLbp4q5Q+NRVV62z7mF2dJ80Zto+NzMLnC8yYacMatjMsbXb3XNP6OAgSbIv9SZTDvmdy9oub8PTvIimMrpwXnetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0vg6beYYojE5B0fojqRmw04IQ9D/lvWQeOBcGJjbnk=;
 b=i5/Fklh4YmVMgEfYk1AzrKCWHk+Uxvmyqwbu5ZUg35Rdq77J1unpk/VvWT5I4ZSYyD2LstozgoRk8MEtnq5cKAPvy+CickCsD1EIzSSOJ5swBAS41VqyqjIGpNUcYp/cmGTCt8SKqbM/UBlUlH9UlFZAuOU5ijBBH8yC4YFtrMM+OmsV32JOw0VX1C/3iwK1qbQxBgEpJpA9diYJu29mFe0zIEmPQSg2MQDhA9HkdISCX3Iyh6WIr24C7ykHMO/8emWj+MBBK+3y9JlFPRRrIdkneboWcMTtR8zZSntKoGI+vvFEsJu9O/kQ7V+Vnc+SYd3oWvuUc35efBAVL0iJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0vg6beYYojE5B0fojqRmw04IQ9D/lvWQeOBcGJjbnk=;
 b=n+s7kzxBzvsTHFsgLMSQTJayCnlaJO3z5SbMkIRYjmg9Jc8w06NFrUwr5+AWGoYPvZoseElS7ic87bPtPyScfjYUyX9yJKLBl0RRPPm0M7/LpR5lzmy9oC1pwXEezz89mMEzxpmzM+9MygMWx1h+KaQ1Xxjsu9YjDO/2AtzvaYw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8649.namprd12.prod.outlook.com (2603:10b6:a03:53c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.40; Tue, 10 Jun
 2025 21:36:29 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8792.038; Tue, 10 Jun 2025
 21:36:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Jakob Trumpower <jakob.trumpower@matrixspace.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.
Thread-Topic: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.
Thread-Index:
 AQHbtgHIe40KI1iUEEu1UTaSuuJEJrO87/qAgAjQYTuAAjUAAIACgqPDgAbvq4CAAob3hoApRMkA
Date: Tue, 10 Jun 2025 21:36:29 +0000
Message-ID: <20250610213624.afp3pxu3uqluhjhc@synopsys.com>
References:
 <PH0PR06MB7077FFC05705A02FD5CB94C2E8842@PH0PR06MB7077.namprd06.prod.outlook.com>
 <20250501001425.ijly3g2knjghvese@synopsys.com>
 <PH0PR06MB7077C939CDCF50DADE0A70F6E889A@PH0PR06MB7077.namprd06.prod.outlook.com>
 <20250508003232.t5bqoqvbmnohpeka@synopsys.com>
 <PH0PR06MB70771B5C2F3FA38E0BC9E2F4E88AA@PH0PR06MB7077.namprd06.prod.outlook.com>
 <20250514004759.v4twvbma5rm3mept@synopsys.com>
 <PH0PR06MB7077F3F58590593F11AEF749E890A@PH0PR06MB7077.namprd06.prod.outlook.com>
In-Reply-To:
 <PH0PR06MB7077F3F58590593F11AEF749E890A@PH0PR06MB7077.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8649:EE_
x-ms-office365-filtering-correlation-id: 68fba69f-d917-41ee-1524-08dda866dc67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R2Jjamx4dGozRURCVEFXR3ZvdTAxTDdPVWJZeWh6WFpSeTZxa1kwblQzQlB5?=
 =?utf-8?B?TVlGcnRmQ0crTlVCK3YwZHZsTXNueUxOQTJoMU9SUkhuUUIxMW9tOHBLNFAz?=
 =?utf-8?B?eEdOQWJsb1RDcXJhNGdnam9BSTB6R2R1ajBrNWFhN0E3dFpOQlZkSHkwWkhH?=
 =?utf-8?B?aHJ6Sjd6NTQxb2dyaFlHYU4xaVFSUEJQdnlKekVCd0FjVXBJbldtZmhOQVp3?=
 =?utf-8?B?dmZ2b25ZT05jOXRiS1ZLQzVRdHlyc2ZBNDNBRUZDaDF3NWRMTjNPZ3c2QndI?=
 =?utf-8?B?RmV6NGVubk0vaUFIYlg2WTU0SGtLSUNSaXdIK05GK3pjbjdRSlFWWFhCMlFN?=
 =?utf-8?B?aGs0QmpRQmhlVlIyR1dWNm9nejhSMXRsTVF0bnE4VVB2VTAwNEczOHhiNHc1?=
 =?utf-8?B?MDIvTVcxL0dFcGovRllGM1hrR0lZSFRRRVRmd2svOWo2eTNkcWM2OVlvR2kv?=
 =?utf-8?B?Z042ZHRDU3NvT3VkWVVLYWVFRGFIcmQrT2dYbkptVjluVnhwVHhFMm81eVVL?=
 =?utf-8?B?NXowanJBa29XVDRnRldpSzNzZTRrQlBFVXp3Q3ZuZ1Z2MW1PemYrYWQrdTYz?=
 =?utf-8?B?QkQ4eWsvYVpjcUhVMXdPNHdENVdGWUZZVTEyZXhucTJCb0tBWk4waXo0bTRr?=
 =?utf-8?B?UUtGWTBKNUhiYnNpcno2NEp4cUxyZ1JVc0dNZHRSV3l0SXgzNkJvcHV4enJW?=
 =?utf-8?B?SU9uVnBQbjd0eDZMeWo0bE9ZaW9IUFB1ZzNZWEdYclNzVDZZRktCRk5FYWsx?=
 =?utf-8?B?b0hIb3BsVGlGOVZDMWY2WXhrMklublVZOTFZVWR2b3pkMXBNUWV6ZXEzZFF3?=
 =?utf-8?B?amJCYlhmTzlyMjF3cnAvVTVSZUU1QVZVMXh2WHNtdG1ORHd3MHJqdXdscE56?=
 =?utf-8?B?SitEMnUvbGR6QU54VldheXVPWTFhNERoamRFeHNtVEFoOGtQeU5LWmlOSit4?=
 =?utf-8?B?L2VYN1RPNHNtTUVRUGdkL3hBRVR5Q3JIdU9TMjNFZERFMFFCdlNBWERLMHVn?=
 =?utf-8?B?QTFxYk4wTkNXTzl1UWRQR1lodXh6NU9ndGJSMmVZbUpZZU5MM2xMOWQzbUVj?=
 =?utf-8?B?RGYrc2lhamxZUGRMczdBcm4zTUpxQlhLU1FJcWRXaXo3Z1h3WFFCdTZkMWoz?=
 =?utf-8?B?QnJCZ29OUzdGVjJLWnA0YXpZeWhTdGhyMmFYYzFwZTlNQWpMS2Y4N0k3TE1T?=
 =?utf-8?B?Q0RvNWRRQzE0bEhZRjFHY0VaeGpQOE5jVFQwTUVxaVFhNEI4Q3ozb0VYV0RK?=
 =?utf-8?B?ekMwWWMvUDRSaElUWTU5S05ZS3V4eXFrdzcyaGlpa2hqUFB0YnoyaDBlQUJ5?=
 =?utf-8?B?RGtIaitQWm5MNmgvNmwwQkF4eVIyN0ZqdmFVdlUrTEtBOVoxUDk2bWt4VnhF?=
 =?utf-8?B?VHVJZ1dLZUJsemp5bXV1TUk3V2I4R3hXbVgxR3FIUUhnOXNZNUo5eFNCMDNX?=
 =?utf-8?B?dGtSa2lGVisxVWxFWlAxNEw0YUJkbCtCUnBRbisvTU80V0pMdzI0MEl5MVg0?=
 =?utf-8?B?VkFQQ0FuRWVINzl6dnhVNTdMb2ZwQnVUQzBTY2V6eE1zcVNWRzViTjJjdmdL?=
 =?utf-8?B?WmlKWjFZTUIrK3JLMnUrenM1L1lRYlQrTlRlRkpsQitUZzFsRTVxRGl1cVVJ?=
 =?utf-8?B?Q3ZwNlZBdjRtTkRRT1hQTjZ4SzZCWmt3R2lpZk5FZmU3KzIyeHpsb041OTRL?=
 =?utf-8?B?Z0xCY2FuZ0t0ODFFclkxOGNFandEOFIxYzMxL3BFYXowWHE0ZzdIZkFQZ1hx?=
 =?utf-8?B?TTJYb2VnbmtmVVRuTjhIWWFKdnQ3QUFnOHJXTmJlOWdsb2dleWRyczRWNG96?=
 =?utf-8?B?ZGJMM2NYNnVMOWRreExxQzdUVHNUOG9OanNBcnRyOEc2OFUzb2g4NTF5SVRP?=
 =?utf-8?B?RFNYbThqL1R6MVBrb29Ob2k0bkhEL0ZKUFVUVzErekF0eXlGNnRmTm9xV1Rv?=
 =?utf-8?B?ZXlwczhpdEs2ZnR0OHpVb2xqc09ScDFNYjgzS1BGVy8xcXJKR1JsQ0RwMXdV?=
 =?utf-8?Q?bz0A6r98NAmlVluboGEiMlxC5WGdsk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THMrUGJxQjlMSFVGd3NtUHd2aE1UbWtvSSt1YUVoMXVaTjRJQjBqSHJRRTJt?=
 =?utf-8?B?Ykg3ejRCcHBnTTBCNmFoQkhSODRaR3NUSUZWRXZlVVZTTEhibFBkMHdVM0FJ?=
 =?utf-8?B?SUNndGJsdjRGbjhmMXBtU0YwVHZROUI3SmNNZ3BKWDlFOUJSa0hNcitPNTVj?=
 =?utf-8?B?SGVzNG1NYmJwT05HMFphMkk2S0YzNytSYk5XaXFmZU90OE04NkhsTVlFYUV2?=
 =?utf-8?B?cHlSMEwxR0pFdEY2VnE0eWhvVE9sMGhmWDYrUUFzSUpTdGZWeVdnOVloc3Fn?=
 =?utf-8?B?dzh1UDJJOWVTODlOaHBrQWFvWmRzNmVyRTNNKzdYVy9OclRUeTVQaXhTR3kz?=
 =?utf-8?B?eUVzblc1d096SUhLOUw1cFJPNmlVdUQ3TlMwc0ZnTUszM2k0Q1RTY3c3Q0Ra?=
 =?utf-8?B?c3RTTmhZVGUycE1XSGVCb2x2U0FKa0h0Ui9IVXI1QXFjaE5sNitPcjBYLzhO?=
 =?utf-8?B?eFNCR2dvYXpCclRtZXczYitGOEFsZXdlZkNnT25qbFdhMzVndHhtai9HeWUr?=
 =?utf-8?B?YUtJMkhNMThHa0EveFE5SFh5MU1RbUxGZWliclZEUXhyYXhJTjlpZWczSE1Y?=
 =?utf-8?B?ZXZvZWZlRE5BUU1pN3JsSFVLMy9pWHd5bWNaMTZaSm1QL3VraXVBckhwcEdk?=
 =?utf-8?B?b2JPWWJ2Ty9BNHoxR3paRnJlNVYrdUpFUXY0NUpsWmdZTElrYjdMOE5sdkEr?=
 =?utf-8?B?OUdCZjR0cStabHBaY3ZNU0pwVGtJSFI5OWpSSGkyaWFodTM4eUFhNWhieFZC?=
 =?utf-8?B?WFhNWWNrQUhrMi9TbG5YMGJIRjJoemJZcW44aVp0QlJxUlNGSzRtcHRZbmEx?=
 =?utf-8?B?TlF5RkNydWFYWitvK3ZvSEc2ZjZNb0VxVTNKQ0dKMGtCVWpnbVovZGtaRm03?=
 =?utf-8?B?WUNXSXBqbG1CejZNcXdXTG9XcWQwR0dPOXU1OXZtb3FrT2tFR0VaRDl4R29U?=
 =?utf-8?B?WnhJQjRZMlRoOUxNamxWcm1pSEQ3RStCSlpERThoWkNMSk9PTS9LeHBWcXBz?=
 =?utf-8?B?YWc4WVJSRHlJeDUwck5lWmd6YUJ1S25mS1BPOXJ0U0ZiWUZQdXJtUjlDb1Zm?=
 =?utf-8?B?UlFQRm5JaXBaelNzTDkyMGRSR3gyRzlzYmpJRE91N2VPdWtJME9lRll4eUJo?=
 =?utf-8?B?NXc0VVJucGdvekFOdG8xMGFHeEViQ3RIeHQ4Y1UyYms2anB6YlRMTmdIT2pD?=
 =?utf-8?B?Z1VjbkJEZ0REWTJNaFh0UXMxRWtVQzBIS2RNRS92MUxUQVVocHUwdnorVmZt?=
 =?utf-8?B?K3ZySjZxVlZSelhYL3hJWjcxY0pFbG13RXBNUkdHSDcxVWJadHlBRU9jSExt?=
 =?utf-8?B?ZU9LUGFIV1liZU85VThPOG02SWZSa0JEWXRlQTdqcTFkVG9mM3RQbW1QdE9v?=
 =?utf-8?B?SEZUYzZGdVZaMWo1ck1qTWpkMkFrZkhPVEFGcTNOTEI5L3VTRFRBMnVTK212?=
 =?utf-8?B?RE5BM1NLU3FDenpKWDVVODdpb3U5Y0VSV0EyVnhHeUtqSkpreVgwbFNvZnVz?=
 =?utf-8?B?em0xcEltRHhqV1hiWmE3WDVvYnpuVGdnWTZnbjVhT1RyOWhnaGRrOVZQMFcz?=
 =?utf-8?B?SERYbURvVFR1OVd2WUd4cFFJL3BkMWd5RUp5S0lQbDFwaW1MZjJBbE9QSlMv?=
 =?utf-8?B?RmlUeWZKb2pmakNXbk82d1lMayt0N0w2V2p0Y1RvdXlkR1ZPbDdhODlYYzh5?=
 =?utf-8?B?dzdxRXpVeFVETlhRUnhvY0FaT2VqZzBLaXRqazlhMi9FU29aazgxNndpenhp?=
 =?utf-8?B?ZzdCajdwcFFNTkorNjMyVUtCWFIwbHYrUEJISUs5WGJNTkVTczlLc3dwcXBD?=
 =?utf-8?B?aDZXY2tBTUthSTBHaUhid25tdy8rcTY2VnhJUCtnTzZYcjh2VzhPS2Mvc3FI?=
 =?utf-8?B?emk2cWt2TER0WDhLeG9odzVmQW5OOWoySXRWOS9YaUk3OWh2U2ZWR00rS2VS?=
 =?utf-8?B?T3k3MTZ1OUlOcE44NUpYVWVvNW5SUzIycVkvS2lzdW9ES0plS2tKcStDSWZi?=
 =?utf-8?B?bExpblV5R2ROSWtsODg0RG81M1Bza2pEY3V6OTVRTXgwa0pUa3gxdTUxdHZL?=
 =?utf-8?B?Qm5ONWRaMlRvS0pmNmdqYzIwWkpXeDZwTVZhVlhCRVB0cXJjNW5sSHRHWlpw?=
 =?utf-8?B?NnZlWnY3RzNub0hKeFQ1MUIxNXNNOFZON3hOMTNFdkIxbk9qbEUweVArZ3FP?=
 =?utf-8?B?SUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA006EF288013D43A1A828566630D62D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+AdJJsElpi1IDMFL1YYwXFi54RyhBUp0wRuJn/70CKVF/bUZK+ssbfhYTJpuUDHTPxJC5oq/HQBwTUc3TDAuhFOIWbBOxhw9/am1QP48SwimMcuWyUx3/dVEvVW0FX4F8UGwf0fZmHkfVmZ85pf2w0OMg0S23VfNFzyjzsbf2o+Q67SHd+sKNvNQD0cqjYjRExHWTceXB/LhZO/PRN9IIw09g6TH21u/jPwquiCUUmJNAkp42F54D31AeQrF8EsjPAijErqW+ppaIOd64C/krsntd2eQGr6+0dudcXwm0VIzgrQfbNJ4SungtE9ZCY4LhPTr32WOSI9uzyns3E/3e8wuwfVEUIm3itqc64fmE2qWzWePJQ17sWHzZX2upVRxJbyPFogyqE8clqEV1vVVZEgignaynJP3OmP0tbqgKwLPBo77P8TcRvqNVSmiqEplhtTpvvXUK/Xbzk5ZeQild+IfcLrYiLrFeM3Y/qK+W4z/EMeR17c08n6bpjoEz2yeQPOjNrKm3Oj8BzacQjqcXJzgRSqumxdVWyGZ3ie5CKILS6l7ToS+v4fs08SE2PqUL1TcliO97Ys8RTWh7TG1mxXR/S3Pr1lSk8sPJqFOq89lUbF5frJpbcpSeSjICEs9bQ+c9qhmVEjqqpw9OhUI2Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fba69f-d917-41ee-1524-08dda866dc67
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 21:36:29.4265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XesdzH13OfhZgpX4kbi11ZyKrbX/yreb65vAXMVmZe7LdZntwo+I9AWxJVfQLH0vQgcSYFtNbG8ifYmDZcqlSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8649
X-Proofpoint-ORIG-GUID: Tei-MXFTWLWfxYoXNeqrk3wlxAhCgJQA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDE3NyBTYWx0ZWRfX4Ks5m+kJ4+9x
 O4k1yZaH2D56BXNcWzvBie72rxcnN1jMfQpUF+E18hVgsZ9jto+znvC/se9KVdjnPfDh2sFyMl9
 jw7GJeBs5G2kbeIP1JRLubEVMveICjXA5OmwDKQh04j/JsZxl8STB1u2vFNYSwCbmwqvd2HV6IN
 5jww9F/GcjbVpev4x8eE6C8ALV4erTTwaVKwH6UDApqAVTxgbyJqRgcvvH+/bbQjV5PHcwWJK8d
 6/lrWhJdC54Q10oqzOH1kFxHIBKYAkZzrEJneOidLeHAlHYSgaueH94TSORRBz2w2C8xS9fT8Fy
 YGPFqVnjezpYSyXXXGPDxqcTMczFEgPplsDM/l+oE4yyEws4Yl2J2zzGRhQX9U0KvVCJ1fj9ble
 p2W+UTxTNvNeUzUACEAnPwwcM0fqnqtB9hjG8noKm5kHzW501pM4JMYLdT7xkU4z5yGyyMYy
X-Authority-Analysis: v=2.4 cv=XYqJzJ55 c=1 sm=1 tr=0 ts=6848a565 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8
 a=6cyazR8UQ32lyN2wwzAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Tei-MXFTWLWfxYoXNeqrk3wlxAhCgJQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_10,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506100177

T24gRnJpLCBKdW4gMDYsIDIwMjUsIEpha29iIFRydW1wb3dlciB3cm90ZToNCj4gDQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gRnJvbTogVGhpbmggTmd1eWVu
IDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgMTMsIDIw
MjUgNzo0OCBQTQ0KPiBUbzogSmFrb2IgVHJ1bXBvd2VyDQo+IENjOiBUaGluaCBOZ3V5ZW47IGxp
bnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGJhbGJpQGtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6
IFtCVUcgUkVQT1JUXSB1c2I6IGR3YzM6IEZhaWx1cmUgdG8gZW51bWVyYXRlIGZyb20gYm9vdC4N
Cj4gDQo+IE9uIEZyaSwgTWF5IDA5LCAyMDI1LCBKYWtvYiBUcnVtcG93ZXIgd3JvdGU6DQo+ID4g
SGkgVGhpbmgsDQo+ID4NCj4gPiBTb3JyeSBhYm91dCB0aGUgZm9ybWF0dGluZywgSSBzd2l0Y2hl
ZCBvdXRsb29rIHRvIHVzZSBwbGFpbiB0ZXh0Lg0KPiA+DQo+ID4gSSByZW1vdmVkIHRoZSByZXNl
dCBhdCBpbml0IGxpa2UgeW91IG1lbnRpb25lZCB3aXRoIHRoZSBwYXRjaC4gQXMgd2VsbCBhcyBw
dXQgdGhlIHF1aXJrcyBiYWNrIGluIGZvciB1Mix1MyBkaXNhYmxlLiBJIGFsc28gaGFkIHRyaWVk
IG1hbnVhbGx5IHRvZ2dsaW5nIHRoZSAvc3lzL2J1cyBlbnRyaWVzIGluIHRoZSBwYXN0LCBhbmQg
d291bGQgdXN1YWxseSBzZWUgdGhlIGh1YiBtZXNzYWdlcyBjb21lIGJhY2sgYnV0IHRoZSBkb3du
c3RyZWFtIGRldmljZSB3b3VsZCBzdGlsbCBub3QgZW51bWVyYXRlLiBJIHRyaWVkIGl0IGFnYWlu
IHdpdGggbm8gY2hhbmdlLiBOb3RlOiB1c2IzIGlzIHRoZSAyLjAgY29udHJvbGxlciBmb3IgdGhl
IHNhbWUgcG9ydC4NCj4gPg0KPiA+IHJvb3RAbXMtcmFkYXItMDE6fiMgY2F0IC9zeXMvYnVzL3Vz
Yi9kZXZpY2VzL3VzYjQvNC0wOjEuMC91c2I0LXBvcnQxL2Rpc2FibGUNCj4gPiAwDQo+ID4gcm9v
dEBtcy1yYWRhci0wMTp+IyBlY2hvIDEgPiAgL3N5cy9idXMvdXNiL2RldmljZXMvdXNiNC80LTBc
OjEuMC91c2I0LXBvcnQxL2Rpc2FibGUNCj4gPiByb290QG1zLXJhZGFyLTAxOn4jIGVjaG8gMCA+
ICAvc3lzL2J1cy91c2IvZGV2aWNlcy91c2I0LzQtMFw6MS4wL3VzYjQtcG9ydDEvZGlzYWJsZQ0K
PiA+IHJvb3RAbXMtcmFkYXItMDE6fiMgZWNobyAxID4gIC9zeXMvYnVzL3VzYi9kZXZpY2VzL3Vz
YjMvMy0wXDoxLjAvdXNiMy1wb3J0MS9kaXNhYmxlDQo+ID4gcm9vdEBtcy1yYWRhci0wMTp+IyBl
Y2hvIDAgPiAgL3N5cy9idXMvdXNiL2RldmljZXMvdXNiMy8zLTBcOjEuMC91c2IzLXBvcnQxL2Rp
c2FibGUNCj4gPg0KPiA+IEhlcmUgSSBhbSB0b2dnbGluZyBhdXRob3JpemVkIGluc3RlYWQgYW5k
IEkgZG8gc2VlIHNvbWUgbWVzc2FnZXMsIGJ1dCBzdGlsbCBubyBkZXZpY2U6DQo+ID4NCj4gPiBy
b290QG1zLXJhZGFyLTAxOn4jICAgICAgICAgc3VkbyBlY2hvIDAgPiAvc3lzL2J1cy91c2IvZGV2
aWNlcy91c2I0L2F1dGhvcml6ZWQNCj4gPiByb290QG1zLXJhZGFyLTAxOn4jICAgICAgICAgc3Vk
byBlY2hvIDEgPiAvc3lzL2J1cy91c2IvZGV2aWNlcy91c2I0L2F1dGhvcml6ZWQNCj4gPiBbIDIy
MDguOTUwNjE1XSBodWIgNC0wOjEuMDogVVNCIGh1YiBmb3VuZA0KPiA+IFsgMjIwOC45NTQ0NDBd
IGh1YiA0LTA6MS4wOiAxIHBvcnQgZGV0ZWN0ZWQNCj4gPiBbIDIyMDguOTYwMTY4XSB1c2IgdXNi
NDogYXV0aG9yaXplZCB0byBjb25uZWN0DQo+ID4NCj4gPg0KPiA+IFRoZW4gb25jZSBhZ2Fpbiwg
SSBjeWNsZSB0aGUgdXNiIEMgY29ubmVjdG9yIGFuZCBpdCBjb21lcyB1cDoNCj4gPiByb290QG1z
LXJhZGFyLTAxOn4jIFsgIDMyMy4yMTAzOThdIHVzYiA0LTE6IG5ldyBTdXBlclNwZWVkIFVTQiBk
ZXZpY2UgbnVtYmVyIDIgdXNpbmcgeGhjaS1oY2QNCj4gPiBbICAzMjMuNTExNTk3XSB1c2IgNC0x
OiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MGI5NSwgaWRQcm9kdWN0PTE3OTAsIGJj
ZERldmljZT0gMi4wMA0KPiA+IFsgIDMyMy41MTk3NzZdIHVzYiA0LTE6IE5ldyBVU0IgZGV2aWNl
IHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0zDQo+ID4gWyAgMzIzLjUy
NjkxN10gdXNiIDQtMTogUHJvZHVjdDogQVg4ODE3OUENCj4gPiBbICAzMjMuNTMwNjcyXSB1c2Ig
NC0xOiBNYW51ZmFjdHVyZXI6IEFTSVgNCj4gPiBbICAzMjMuNTM0NTA2XSB1c2IgNC0xOiBTZXJp
YWxOdW1iZXI6IDAwMDAwMDAwMDAwRkYzDQo+ID4gWyAgMzIzLjkxMzc5OF0gY2RjX25jbSA0LTE6
Mi4wOiBNQUMtQWRkcmVzczogYTA6Y2U6Yzg6YmE6YTk6NDQNCj4gPiBbICAzMjMuOTE5Mzg5XSBj
ZGNfbmNtIDQtMToyLjA6IHNldHRpbmcgcnhfbWF4ID0gMTYzODQNCj4gPiBbICAzMjMuOTM3MTY4
XSBjZGNfbmNtIDQtMToyLjA6IHNldHRpbmcgdHhfbWF4ID0gMTYzODQNCj4gPiBbICAzMjMuOTUx
OTg0XSBjZGNfbmNtIDQtMToyLjAgZXRoMDogcmVnaXN0ZXIgJ2NkY19uY20nIGF0IHVzYi14aGNp
LWhjZC4yLmF1dG8tMSwgQ0RDIE5DTSAoTk8gWkxQKSwgYTA6Y2U6Yzg6YmE6YTk6NDQNCj4gPiBb
ICAzMjQuMTAzMzk2XSBjZGNfbmNtIDQtMToyLjAgZW51MWMyOiByZW5hbWVkIGZyb20gZXRoMA0K
PiA+DQo+ID4gVmVyeSBzdHJhbmdlIHRoZSBwbHVnIGN5Y2xlIHNlZW1zIHRvIGZpeCB0aGUgY29u
dHJvbGxlciByZWxpYWJseS4gQWxzbyB0byBub3RlIHRoYXQgaXQgaGFwcGVucyB0byBldmVyeSAz
LjAgZGV2aWNlIEkgaGF2ZSB0ZXN0ZWQuIEkgaGF2ZSBhIGNoYW5nZSBvcmRlciBmb3Igb3VyIG5l
eHQgYm9hcmQgcmV2aXNpb24gdG8gdG9nZ2xlIHRoZSBWQlVTIHdpdGggYSBHUElPLCBidXQgbm90
IGFuIGlkZWFsIHNvbHV0aW9uLg0KPiA+DQo+ID4gSSBrbm93IFVTQiBhbmQgdGhlc2UgY29udHJv
bGxlcnMgYXJlIGV4dHJlbWVseSBjb21wbGV4IHNvIEkgYXBwcmVjaWF0ZSB5b3VyIHRpbWUgYW5k
IGV4cGVydGlzZS4NCj4gPg0KPiA+IExldCBtZSBrbm93IGlmIHlvdSBjYW4gdGhpbmsgb2YgYW55
IG90aGVyIHJlZ2lzdGVycy9leHBlcmltZW50cyB3ZSBjYW4gdHJ5Lg0KPiA+DQo+IA0KPiA+VGhh
bmtzIGZvciB0aGUgZXhwZXJpbWVudHMuDQo+IA0KPiA+IE9rLCB0aGlzIGlzIG9kZC4gSXQncyBu
b3Qgd2hhdCBJIHRob3VnaHQuIElmIHRoZSB1c2IzIHBvcnQgZGV0ZWN0aW9uDQo+ID4gZmFpbHMg
YSBmZXcgdGltZXMsIHRoZW4gaXQgc2hvdWxkIGZhbGxiYWNrIHRvIHVzYjIgY29ubmVjdGlvbi4N
Cj4gDQo+ID5MZXQncyBjaGVjayB0aGUgcG9ydHNjOg0KPiA+IyBjYXQgL3N5cy9rZXJuZWwvZGVi
dWcvdXNiL3hoY2kvPHlvdXJfY29udHJvbGxlcj4vcG9ydHMvKiovKg0KPiANCj4gcm9vdEBtcy1y
YWRhci0wMTp+IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvdXNiL3hoY2kveGhjaS1oY2QuMi5hdXRv
L3BvcnRzLyoqLyogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCj4gUG93ZXJlZCBOb3QtY29ubmVjdGVkIERp
c2FibGVkIExpbms6UnhEZXRlY3QgUG9ydFNwZWVkOjAgQ2hhbmdlOiBXYWtlOiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICANCj4gUG93ZXJlZCBDb25uZWN0ZWQgRGlzYWJsZWQgTGluazpQb2xsaW5n
IFBvcnRTcGVlZDo0IEluLVJlc2V0IENoYW5nZTogV2FrZToNCj4gDQo+ID5BbHNvLCBjYW4geW91
IGFkZCB0aGlzIHRvIHRoZSBrZXJuZWwgY21kbGluZSB0byBjYXB0dXJlIHRoZSB4aGNpDQo+ID50
cmFjZXBvaW50czoNCj4gDQo+ID4ieGhjaV9oY2QuZHluZGJnPStwIHRyYWNlX2V2ZW50PXhoY2kt
aGNkIHRyYWNlX2J1Zl9zaXplPTMwTSINCj4gDQo+ID4jIGNhdCAvc3lzL2tlcm5lbC9kZWJ1Zy90
cmFjaW5nL3RyYWNlID4gdHJhY2Vwb2ludHMubG9nDQo+IEkgYXR0YWNoZWQgYSBzdWNjZXNzZnVs
IHRyYWNlIChzaG9ydGVuZWQpIGFuZCBhIHRyYWNlIHdoZXJlIHRoZSBmYWlsdXJlIGhhcHBlbnMu
DQo+IA0KPiAtSmFrb2IgDQoNCg0KVGhhbmtzIHZlcnkgbXVjaCBmb3IgdGhlIGNhcHR1cmVzLiBB
cG9sb2dpZXMgZm9yIHRoZSBkZWxheSwgYnV0IEknbGwgZ2V0DQpiYWNrIG9uIHRoaXMgYnkgdGhl
IGVuZCBvZiB0aGlzIHdlZWsuDQoNClRoYW5rcywNClRoaW5o

