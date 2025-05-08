Return-Path: <linux-usb+bounces-23786-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B462AAF000
	for <lists+linux-usb@lfdr.de>; Thu,  8 May 2025 02:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCB464C8694
	for <lists+linux-usb@lfdr.de>; Thu,  8 May 2025 00:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FCD54654;
	Thu,  8 May 2025 00:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SDNAaUMZ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="C41HyNaD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gvF9aCUI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4922AD2D
	for <linux-usb@vger.kernel.org>; Thu,  8 May 2025 00:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746664382; cv=fail; b=iQQM+JlNWe7cIY+PH6MoyLJL/1Hz3uhijeXASM+onMo6cxzycvGFRMEijWJDyxJFSpZ5NrjEG34tpPWrTtXe+BzI+CKt+DbCEAfkMaZdo9UcwltEfQOMHJKWyaNMqWFJ426Q14iwKlybhaHJLfs+MOH899oo2h37IpY+JUxFLME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746664382; c=relaxed/simple;
	bh=uQspxOj8pzzot1UKCoMD0AbD1r/1JsKPhnIOy81MhNA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=atFrekKmS2lfTc/YAspUOVgVzbiRPp4xPhqyeKa9h9nwbYT1Sm7P1HeKVhXoj5mEqsglFomHxKVzGmYi8WB5nKMPsIoQRImwuetXs0I2tk7R5sbBCKCStOhHhjBbX8dJxarpl8YBLeuaVUxSthU5Dh3SvNAyfd5cnkJ0KLbO3Hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SDNAaUMZ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=C41HyNaD; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gvF9aCUI reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547HbsDU011327;
	Wed, 7 May 2025 17:32:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=uQspxOj8pzzot1UKCoMD0AbD1r/1JsKPhnIOy81MhNA=; b=
	SDNAaUMZnzpzfLioU/s0yO8Ey/gY3mvZut8fUQ4m3e3b8NUnCHtmJZBcPy/LgGx9
	zHz7ew7ZCQxu1d8Zc9oR4/wbiBsqG5zEqYTvowY1kEsqtAlfGapKTZjFgnNLEFDU
	JIiDd5SAskN6lXmElw0EKxLTQl4SCuwvBVjReJe+TOUOKyClS9zIr4svVQmNQqMr
	o0ZKVMgdPxkcMNNdtXQzCRQGkqJ2ia6lWaVZQCpN/4ACnWFkPeGxMuWpEUYuiM5w
	LrjRuvte9Lm/FFCmAsjdI6/Ran7ob6freOryS8mGrSQczPOgA3mfLTsGbyvCufNR
	TvKibWc5DMhf2UNSW0/NlQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 46g29mw9fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 17:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1746664360; bh=uQspxOj8pzzot1UKCoMD0AbD1r/1JsKPhnIOy81MhNA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=C41HyNaD3WoFmrnRbEtcq/zmaFGopmXwJhNfUfkebjjOXIooS+F7xk43eCfmHM1Rm
	 opOTIU6fFwgZdUczqAo6Xn/87/r1iHOjwrLVToc/zTUfHgGXnAM/sKrTyQ3a+UgmRI
	 W3CeBD5INKXtDOqTqBIiH8rvy65+XxZSnfXhdJhcw6vyqD8eZF4/iFmgVEiybbUL5y
	 g1AFyC1tofg2QqCEDRYL3JUrJgljJB2xzhfgIb8i0Yu7ITTuGUoM7/reTYISoNXXnd
	 sXU9ceYgiv2E74uqp0VEwXW9G9UnsaBbhYrGZmRml8DFWI95uZsx1MnfOddt9LMoOi
	 Vgo6AqH9tXCXQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 64F6140174;
	Thu,  8 May 2025 00:32:40 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id F2E97A006D;
	Thu,  8 May 2025 00:32:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=gvF9aCUI;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6E89D40144;
	Thu,  8 May 2025 00:32:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sM6QAW6bU8S3sRCHSF9KGgYWE53mpyYgIJCLRIcUZ1E9SF6rM4bpML5mv2RFqpqTwSM+TUuRDK1qzoi0js+7mc1qz7YRNk4DTf10TTBzyQ82/Bpe885J9W+t5Ju1UDaLv15uFp5vaWiRFkPoi9AMeaSM3u5j/o0Nv1b6v/WENBOXULFIx9P7WaELGrxonuM6cKPHHzZi9XoANykUXpeVNewmEQWe606riTtL4Ttz7DDB2qH9z5ZNv4EmXdN0YVTDg+dvoO3VQ5NRpXHwIFU3CmnUXvrnOcXSSd74Pr59+wR1eYnx3UqNvsF7P1UsNKcj7ohDtV7/vpRiI1RRO0lxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQspxOj8pzzot1UKCoMD0AbD1r/1JsKPhnIOy81MhNA=;
 b=bDylYoM7AMK++0ccTCNcMgzX2DBbqJUb6dITZA3eBpE4i0thwSSFsXASbVAc5aKPOyuanDcc8bCoy2SzyvWNmGqcyv+E6yq0rJ2jbABmXDCe/RsIxKzKg4yLfEDjvoANArZVekfi5bh/K2r9xvECfu1UH1/N/vDFR2KT5z9lTRw02FoGsKY1jbeIkZDZ8r7G1SX6K0nsP5D9W6Pv54q4PqgXtN+zl5ENTvVxXT/DN3Hw+HDNxLEdd1JqssPBma6Yc1kIS6mxvAlsPsUBr8euBKcL0QmVXNio6lnBdlxWuWxrOD0V/Buf0THhs914iD83g5elscHl+uPuA8EDMGoesA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQspxOj8pzzot1UKCoMD0AbD1r/1JsKPhnIOy81MhNA=;
 b=gvF9aCUIvCHcNT6YVJPE5olsj/c5ycRWxajdzzWXM4W6zjRNTUCj7vVpaX7mxNkJKkMmRH3xklVZ4DdrjI3aCztG3VtInw2J9L7fl8OETZgI3wBDGz3Gax+jciaiinHMkSBHCXVS+tnPw+4HUwLdCgtlfXLYyMYtt3u/DXke75o=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DS7PR12MB8229.namprd12.prod.outlook.com (2603:10b6:8:ea::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 8 May
 2025 00:32:35 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8699.026; Thu, 8 May 2025
 00:32:35 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Jakob Trumpower <jakob.trumpower@matrixspace.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.
Thread-Topic: [BUG REPORT] usb: dwc3: Failure to enumerate from boot.
Thread-Index: AQHbtgHIe40KI1iUEEu1UTaSuuJEJrO87/qAgAjQYTuAAjUAAA==
Date: Thu, 8 May 2025 00:32:34 +0000
Message-ID: <20250508003232.t5bqoqvbmnohpeka@synopsys.com>
References:
 <PH0PR06MB7077FFC05705A02FD5CB94C2E8842@PH0PR06MB7077.namprd06.prod.outlook.com>
 <20250501001425.ijly3g2knjghvese@synopsys.com>
 <PH0PR06MB7077C939CDCF50DADE0A70F6E889A@PH0PR06MB7077.namprd06.prod.outlook.com>
In-Reply-To:
 <PH0PR06MB7077C939CDCF50DADE0A70F6E889A@PH0PR06MB7077.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DS7PR12MB8229:EE_
x-ms-office365-filtering-correlation-id: 10aa26ca-4b8f-4602-247f-08dd8dc7d3f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y3F5bWV2UmhpN1lQeTlLOXlaTWdDVTROcXV5dGhnZ0svTUpCZGwwOTVWQVI3?=
 =?utf-8?B?dVdjU05xVmdKdGliVUk4MEVsQWNISHFaSGVVZVdjMG1HMmtXWkFidG5mczhw?=
 =?utf-8?B?TlFsekZwdUExSTl1SE1EeDA4STB3RzcrcEpoQ1dvZjJCTEtBd0FXWUYzTGU1?=
 =?utf-8?B?VGNWWUZyRlhaQlpFbklSQ3R4K3h6OXg2TDJZWTZrYm56NkJMbGxMNHBRTlBY?=
 =?utf-8?B?bDdBZnlIVVhUOEUyTzY3T1JEV1VFb2x1SlhERUJHWDl6TG1mWk1OQ0Jwc3Ju?=
 =?utf-8?B?N1pMbUd5MnIwRlYvam5mVmRUaFRqcU9iVGpKVFIyK08yVE0rWkpTRk42VWN2?=
 =?utf-8?B?Ulh4OUZBTkhVODFOOW9MVUNkYlJncFdFbm44enZjSS9jMlFHZktNbW5Nc0t2?=
 =?utf-8?B?cGlaaUwwZ1VkaFhFdVJDZDRCVDVRbE8wNlFzc05saU4vdHNtMEJhbWR5WGUw?=
 =?utf-8?B?M25HeFJjbzdpRmJtOXVxUVd0Z1JQbzlsY3M1RTVWVWxVUENXTnNoWUxhVHd1?=
 =?utf-8?B?ME95aEJZeHRsaFRWV0NORlBaQWt5R1ZqbGlJeU4wL3ltWVFYYTV3eDRlQW9i?=
 =?utf-8?B?b3ppcndKd2dJUDhNcjJaaEw0cS83dzV5RGIvVlVxemZqcGEvR1VieDNvSWZa?=
 =?utf-8?B?NjdiY2ZJanVBQVd1bmdnUEl1cWMrczdMWEdqaE53VGd6YlhYdHRTNHBkZmJt?=
 =?utf-8?B?WGI1bkJhV1VTL2tVYXhJdTB6UnhvTG84akU0U0VuY0NtUWFuNm5HVEV6SENp?=
 =?utf-8?B?aDVoRUhtb2JFL0habHByZDVhRkduL1R5MmRrZ1pzRGVCQnFIS1BhRUsveWxr?=
 =?utf-8?B?dnp4Ymhvalc1b3I4RVRlZjlHeFZ5MjRBMHhxblY5RnBXYzRHdmErR2JuSm5W?=
 =?utf-8?B?NlFOa0EyUWwxRXVHTGlUMUd5cnJGak1CZmsyKzc0S0pBanU3eE5XeDhsN3NB?=
 =?utf-8?B?MVRDZUVLNCsvUXJ4RmkxSm9RelZsYTdSYjRtL3IrL2JJR0dOc3dzbTdPUDBW?=
 =?utf-8?B?aGI0czZ2Y1YvZEhIb3p4MFd0aVhTbmxPQTMvTmpsOWRmUS9SZXRib0FrNUNX?=
 =?utf-8?B?b0UyVUpnOThYdlhTZC9mQWRmVXRaR1NZU09WSnJPcGpMcWxpWkhsTmlLOVcw?=
 =?utf-8?B?Znhob2JKckJIc2JOVWFvLzNubjdhS2Z6RnNqWTkraDZCclNRVDNIWnZKZkg2?=
 =?utf-8?B?bU13V1dVdEJiUDZRelczdzIxU0wycW9lRjE5bWpybXJSblpMZHB4bVBGeEky?=
 =?utf-8?B?S1RSVG5LT3BvSXdCd0psMzRQTHFPREZKa1Q2Sk90VFQvVTlyNWcrdWpmejdK?=
 =?utf-8?B?MmxLMVk3dTBjWTNtMEtYSzZQYUZycE4vd2p1Si9kZWREc0ZkdUJ3MFNnRS85?=
 =?utf-8?B?dWV1WHlncE91WjhPb09va3RDcUtvWUlDamNnTnIzUGg3Q2dTMUtNOGxybUJM?=
 =?utf-8?B?MkFxa2FRMVRGbncwNHA0QVp0MWJ3aG5DME9wNlNoclpDcVBTOXZZZnYzVnlF?=
 =?utf-8?B?cndGU0J3SUtpVTE0ZkJQOHcyWUFiTE5YQis1QWRORVFvQzZWNlUzM2VrTVY2?=
 =?utf-8?B?aUxaU0NBUjdmUVM0eWIrMjBDZnYzdlRmd0xCd2dnZ1lxdU41RVdsTkxIb2RM?=
 =?utf-8?B?WDF3Z0ZuS1RCSjBrUDZ2NnZKcTErcGJ0eVRGZDlOQ1ppY0dZZkRva3VaNlFi?=
 =?utf-8?B?UXBuWXJUMldYRTkyOFlxL0hvUGdBVHI3ZmgxTmtDd2dHSjlnWUdQQkFJWUhY?=
 =?utf-8?B?UmFHS0gzWEsvbHVWUWx5TzVoM2xkbjluQ0Z3dmFDY215SFU3YnM1bnNMWmMv?=
 =?utf-8?B?MG9ZUVBYbmk2WXMxQkdPd2FaUFN3SmVFYy8yNjBrRG4yNFd5dlNKekNIb3Bx?=
 =?utf-8?B?b1hMUE9Ub3h0RnAwa0FiY05LbGo5cWFNMG9NRVBnQmYvQnlvTWkySURGYldU?=
 =?utf-8?B?MG1ua0o1MThaNjd2YkVQMmYvYmpDazcxOE1mREVRdmpnUE4rdGMyWnVtMEJG?=
 =?utf-8?Q?mUjUIwjCDAWgWGhbKmljzbWH2jb//0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUhNUHJNVVB2K2R3TzczNkNiNUpiSEVvZi96OFBoZWdpc2d4WEV1b1pkdUhI?=
 =?utf-8?B?MFF0NkRwUmlDZ2RpN3RKYjVhR005aEc1M0JmWVZEMU4vQWd4eUxmbzRRMTd4?=
 =?utf-8?B?MmxiZ0dkWnV4TTVaUFgvKy8vVHEvVHV2SStYcWhjR25WOGR0TlBTOVJYWUxY?=
 =?utf-8?B?alBLZWlSQjYyNFhuYS9SRXk0Z2NaQXRJeWh1cG5IczhVeTRWVnlnVEcrSFFq?=
 =?utf-8?B?aDVLY2NPRkVoM3VBQVp2b3RqNDZNUkFMMUVGcWhMZVlMTVdBdDFCRDV3c282?=
 =?utf-8?B?YS9mMVJzNS9BY1RyTDdRMXkweUpMQTA0OWVVMnhLMW1jM21GN3l3T0wyMmdD?=
 =?utf-8?B?cDRTQmpqVjlabzErdGxQQTMvaWpjaWpZTWdRdk1HSDMvem41Q0Q4dXFPNGtw?=
 =?utf-8?B?NFhQMUdlTWIvWHBLblBqQ0FyUC96UXBaWHVwTVdhd1ZObkFQRGpMK21CMG1W?=
 =?utf-8?B?c0gyQmtEQSs0VEhCVlNxcFFwN21PVFFIdEREdlkveDFwQXhXYjdjMVkwaFdo?=
 =?utf-8?B?OWlPQjVhVEZnMWtXVXUrZkVGNXNzWmlSY0VXRWlnejRnZ25sZzlLd3E4dlR5?=
 =?utf-8?B?RUtnZnB6eW9JZG9TL3RLcXBRSUxYcDdpbEVvTk1YczlJYkxxcGNia1pSY25R?=
 =?utf-8?B?dXo2cEVEVU1xVnl4YXRyV1NaZUd4UWZ1a0VTYUFzTk9LK2dHK3JiOTkzTWs0?=
 =?utf-8?B?em5ySmc1cStWS3NEOTk1U2VmRGw1VUtuWHA0Y0xGdlBGVVo4M1Q0ZTBHYTRm?=
 =?utf-8?B?aEVDckhtT1dWVnVTb3h6N0x0NUt3UnJ4LzBoVnRWSkV3eHgwNWZySVFVcHpk?=
 =?utf-8?B?bThXclN5YXRRalRvRC9obm1BZmJFakxxNTV5MnZVNGQrVUFXSFV0M1VpZ2R0?=
 =?utf-8?B?azI1elZQbkFDL2lWQmxRVjk4b2hoQXRmeHRMaE84dHFOcDFpY05tT3lqYlc5?=
 =?utf-8?B?enJqa0pXSTFQNTRRcEswcHVQdHNYU01vR1Z3VG5UYjFyOUgyLzlkb0pvejhR?=
 =?utf-8?B?U1RXcmVkdG9ueTFaQjhabkQ3ZXdRaVZsdTlJUHp5a3lqKzRIMWVKZU1XRjc1?=
 =?utf-8?B?MGNtUVFqd1FsODRmakg5YXl0NzN6aC9XSEZNUGwwRXhZL3dVUmo1b1dOUTZZ?=
 =?utf-8?B?M1RtcG0reGZrQyswMVd3Z0xyN0d6Y0pXL1dWNXRCK1lDemFoVk5NTUVwb2ZI?=
 =?utf-8?B?TGlxVlo3WUtlVnVSRy9ra21xUi9kYjR1bExGN1EwT2N0WkJ4Si95a2E0bldQ?=
 =?utf-8?B?b0tGcnJONVRGZ2d0cE53NXlTYmprSUpxQkhzelpuT3pHQ1orZEZpa3RhdW5m?=
 =?utf-8?B?ZTY3b0hoQzFJNVhIZFQzVlMyTlZVU2NHWTlqR1NheWl3V3VCZVVDa3M3WlNm?=
 =?utf-8?B?R1FkdzRjUEFzVTU4VkZScXFJbW9oaU1HdzM5UkszQTljb2FQWXBXYmI1aElY?=
 =?utf-8?B?MkM5QVBXNElMY29NNUVrdHJUSlVTYXNvdE9WOGdvRzFXVlk0bkZ4UHI1Zy95?=
 =?utf-8?B?RDhlR3N2akVrOVp0U2RBK2VNUDNRR29tSUtENmEwNVB4TmFDalNIallEVjdN?=
 =?utf-8?B?Vmw2WmN3dFdJOGhDczJqOXFNc2ptMEROTE9jWmZxb09GVUpObUpaRm8wWHlq?=
 =?utf-8?B?c3JJSHVwblkxSy9YcTd1amxHL1RJUXJIY3dCcmx6Z3lqNVpHQ081a0VPcEo2?=
 =?utf-8?B?SGpucWRmZ0hNSDR5b3oxWXg0K1phS1hTY0pIbisvWkRyZnVhWUVvc0JKYUxa?=
 =?utf-8?B?VWozZjQ2NVcyOXVDUUVtWnlhTldWdFZGSUtSWkdleUxvUGlPQmlhalY5Yzkx?=
 =?utf-8?B?TTdESnpWR09EYXZCMHRGZklWbWJiYU1UNEdZOElvV0R6Z0xDTzcrQ2RrSHlS?=
 =?utf-8?B?ZXNUNnVjcktvRjEvRGxGZGk0ZWM4WGtpUmdxN3FsWXVXc095R0YzTWlCcGFQ?=
 =?utf-8?B?M3J2QVdCNnRIT0RqZ2hQMDNVMTRCMFR5ZXhQQWxxbkM4STdpSzZOd3VxdExp?=
 =?utf-8?B?bU5uVjlWN3IvMDBOeC9sUUhJZS9BWTNQclkzbU4zczZGR0NlaDJCSHljekF0?=
 =?utf-8?B?dGNDWWp5OUhaNUhOclh0MWUwQnp4QTlDZWtxbE5vZnF1TGFpNkdsT20rYTJQ?=
 =?utf-8?Q?aocvdwVx7g+mk9TenpoMkmP+Y?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D103D7F31BAF3A44B4286166FBEB40E2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rSJ5akcUSEQoUxIEJGMO3Rvqqf6IvIY186YWtO86AsqqQJlboa0LlZxHaD4cSPRExLOZKBIfYClloiUK+EMxC699G5DCwnkai3EameoNMLToFbQwBsA2PHaQskzALDue33VfVkB/P20bTOZHgwQjkyXZkpac24rqIupJ61dwRrL7cLsGZtmw3PhFWt7D8m8oCf7q8WvZOnsPbhU0nvA7Jz89gzRK3py8CK4hAcFibzrKgSj/J9XgW7/NARzU27a+FOk8zDxeo+ll/ExusSMOmjyOrMAH0FRDJU/iUargckTT98uLr9OyA6OdmnkU8M4YKrZG0yx2VR0o06xGZ4rviyAYFbxbo8vCTgHUsxZFestqAlSsxCis12IKaQbI58OO0PHLwD5zYk3yzrLrEtJkd3HlaXxrQQQMCvPqIakE4Hqu/HVONU9htSUbhw6uXckSRb8oyk7JsUQGXjD3o9xge9TnCPcdx8q2/76o1cqy7RlVYcUaIUDoSAqtcly0q6UKMUQCpYX4++QamVekv7pYMdbiR6ptA2S0pS7zCzo/7k8s3z1RzG91fhzzWQ+uuq82houQ+89ZAa+oi6P/D0yV9J8Ct38+2uEUrAnKYX0d0zKv/Jy4AESsn3N99idH9LrZclqEUsQN02F4mApOnXcmxA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10aa26ca-4b8f-4602-247f-08dd8dc7d3f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 00:32:35.0632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XMUW+8JVqNmyeNgcZ7sLzT9NKLfuDHvExwSK0tEilyDjk8j7k2mrXrhMfPFQXuEJQiMtngIwlpBiAIWRt2CaRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8229
X-Proofpoint-GUID: 5jRHVtD3t2YPkP2BMGjcwgCV-EdJiazZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDAwMiBTYWx0ZWRfX/zzLTFxfyYUT
 B4UMzgeivzPPNpLHgmlx0GLoNlrLJ9K+ls5J7r5awBzwiN5Ef6zTupp7fcsMZbdD9PaSiO/b8Kd
 4ZLHpV/KLyPpzV+bKV7HslpvrrEPTR+vYwxuEGHSQNx4ayTQm6UNrTzERKEsda/owS0m+DTUNFc
 Nn9c+QXk0rshqBLrAgKS5bCC6xkBDXL/W3vPF0Kcbch8wM47sLFOIqba/jORQGbOEYui5pYW3od
 xnsU/wIalH1XFt48w/HlMmTwkxfL/MehIDPJk5Mt/QvXxFBD2YkAMpfGefi/m9S72F+bPnlvGKN
 7KFLWNyAb81KqtLy8cu8GNknYi3BgiFr9bKh84WVI5xMiP/vKgbJdjzm4kK4BtFgYE44RckwCx0
 P862bmjwjwz5wKA9bKza3StGsu8kiQWFR2opgN+OBSS4H/1Ib4812rKWH9VkRJqbLn0UzBRb
X-Proofpoint-ORIG-GUID: 5jRHVtD3t2YPkP2BMGjcwgCV-EdJiazZ
X-Authority-Analysis: v=2.4 cv=JOA7s9Kb c=1 sm=1 tr=0 ts=681bfba9 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qPHU084jO2kA:10 a=44edV753jD8mZGA8i-sA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_08,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000 definitions=main-2505080002

SGksDQoNCk9uIFR1ZSwgTWF5IDA2LCAyMDI1LCBKYWtvYiBUcnVtcG93ZXIgd3JvdGU6DQo+IEhp
IFRoaW5oLA0KPiANCj4gVGhhbmsgeW91IGZvciBsb29raW5nIGF0IHRoaXMsIGhlcmUgYXJlIHNv
bWUgYW5zd2VycyB0byB5b3VyIHF1ZXN0aW9ucy4NCj4gDQo+ICAqIElzIHRoaXMgYSByZWdyZXNz
aW9uPyAoaGFzIHRoaXMgaXNzdWUgYWx3YXlzIGJlZW4gdGhlcmUpDQo+IFRoZSBpc3N1ZSB3b3Vs
ZCBoYXBwZW4gb2NjYXNpb25hbGx5IChjb2xkIGJvb3QpIG9uIGhvc3QgaGFyZHdhcmUsIGhvd2V2
ZXIgdGhlDQo+IGlzc3VlIGlzIGNvbnNpc3RlbnQgd2l0aCBPVEcgaGFyZHdhcmUuIFRoZXkgYm90
aCBtYW5pZmVzdCBpbiB0aGUgc2FtZSB3YXksIGFzDQo+IGluIHJlcXVpcmUgdG9nZ2xpbmcgVkJV
UyBmb3IgdGhlIGRldmljZSB0byBlbnVtZXJhdGUuIFdlIHdlcmUgb24gYSBrZXJuZWwgZnJvbQ0K
PiA1LjEwIGJlZm9yZSBhbmQgdGhlIGlzc3VlIGV4aXN0ZWQgdGhlbiBhcyB3ZWxsIGFzIG5vdyA2
LjYuIEkgYWxzbyB0cmllZA0KPiBtYWlubGluZSBVU0Igc3RhY2sgbWl4ZWQgaW50byB0aGUgb2xk
IGtlcm5lbC4NCg0KT2ssIHNvIHRoaXMgaXNuJ3QgYSByZWdyZXNzaW9uLg0KDQo+ICAgKiBJcyB0
aGUgcmVnZHVtcCBjYXB0dXJlZCBhZnRlciBib290dXAgd2l0aCB0aGUgY2FibGUgcHJlYXR0YWNo
ZWQ/DQo+IFllcyB0aGUgcmVnZHVtcCBpcyB3aXRoIGEgY29sZCBib290IHdpdGggdGhlIGNhYmxl
IHByZWF0dGFjaGVkLg0KPiAgICogV2hhdCBxdWlyayBkaWQgeW91IHRyeT8gKGRpZCB5b3UgdHJ5
ICJzbnBzLGRpc191M19zdXNwaHlfcXVpcmsiIGFuZA0KPiAgICAic25wcyxkaXNfdTJfc3VzcGh5
X3F1aXJrIikNCj4gWWVzIEkgdHJpZWQgdGhvc2UgcXVpcmtzLCBhbHRob3VnaCBJIGRvbid0IHRo
aW5rIHRoZXkgd291bGQgaGVscCBzaW5jZQ0KPiBhY2NvcmRpbmcgdG8gdGhlIFVTQiBzcGVjIHRv
IGdldCB0byBVMiwgYW5kIFUzIGl0IGhhcyB0byBnZXQgdG8gVTAuIEl0IG5ldmVyDQoNClVuZm9y
dHVuYXRlbHkgdGhlIG5hbWluZyBvZiB0aGVzZSBwcm9wZXJ0aWVzIGFyZSBub3QgdGhhdCBncmVh
dC4NClRoZSAidTIiIGFuZCAidTMiIGluIHRoZSBwcm9wZXJ0eSBuYW1lcyBjb3JyZXNwb25kIHRv
IHVzYjIgYW5kIHVzYjM7IG5vdA0KdGhlIGxpbmsgc3RhdGUgVTIvVTMuDQoNClRoZXNlIHF1aXJr
cyBwcmV2ZW50IHRoZSBwaHkgZnJvbSBnb2luZyBpbnRvIGxvd2VyIHBvd2VyIHdoZW4gaW4gbG93
ZXINCmxpbmsgc3RhdGUsIG5vdCBwcmV2ZW50aW5nIGxpbmsgc3RhdGUgY2hhbmdlIGl0c2VsZi4N
Cg0KPiBldmVuIGdldHMgdG8gdHJhaW5pbmcvcG9sbGluZyBzdGVwLiANCj4gSSBhbHNvIHRyaWVk
IGFsbCBvZiB0aGUgZHdjMyBxdWlya3MgaW4gc25wcyxkd2MzLnlhbWwgb25lIGF0IGEgdGltZSBh
cw0KPiBhcHByb3ByaWF0ZS4NCj4gDQo+ICAgKiBEaWQgeW91IHRyeSB0byBjb25maWd1cmUgdGhl
IGRyaXZlciB3aXRoIFVTQl9EV0MzX0hPU1QgaW5zdGVhZD8NCj4gDQo+IFllcyB0aGUgaG9zdCBt
b2RlIHZlcnNpb24gb2YgdGhlIHByb2R1Y3QgaGFzIHRoYXQgY29uZmlndXJlZCwgSSBhbHNvIHRy
aWVkIHRoYXQNCj4gc2FtZSBrZXJuZWwgb24gT1RHIGhhcmR3YXJlIGFuZCB0aGUgaXNzdWUgaXMg
dGhlIHNhbWUuDQoNCk9rLg0KDQo+IElmIHRoZSByZWdkdW1wIGlzIGNhcHR1cmVkIGFmdGVyIHRo
ZSBjb25uZWN0aW9uLCBJIHNlZSB0aGF0IHRoZSBjdXJyZW50DQo+IFBSVENBUERJUiBpcyBzdGls
bCBpbiBPVEcgYW5kIGRpZCBub3QgZ2V0IHN3aXRjaGVkIHRvIGhvc3QuDQo+IA0KPiAoTm90ZTog
SSdsbCB0cnkgdG8gc2VlIGhvdyBtdWNoIEkgY2FuIGhlbHAgaGVyZSwgYnV0IHRoZSBjb250cm9s
bGVyIGhlcmUNCj4gaXMgcXVpdGUgb2xkIGFuZCB0aGUga2VybmVsIGlzbid0IG1haW5saW5lLiBU
aGlzIHdpbGwgYmUgZGlmZmljdWx0IHRvDQo+IHByb3ZpZGUgYWNjdXJhdGUgZmVlZGJhY2sgb24g
dGhlIGRvd25zdHJlYW0gY29kZS4pDQo+IA0KPiBVbmRlcnN0b29kLCB0aGFua3MgcmVnYXJkbGVz
cy4gTXkgYmlnZ2VzdCBxdWVzdGlvbiBpcyBhcm91bmQgdGhlIGN1cnJlbnQNCj4gc29sdXRpb24s
IGNhbiB5b3UgbWFrZSBzZW5zZSBhcyB0byB3aHkgdG9nZ2xpbmcgVkJVUyBhZnRlciB0aGUgZHJp
dmVyIHByb2JlDQo+IHdvdWxkIGhhdmUgZXZlcnl0aGluZyB3b3JrIGFzIGV4cGVjdGVkPyBJIHRo
aW5rIHRoYXQgcnVsZXMgb3V0IGEgbG90IG9mIG90aGVyDQo+IGlzc3VlcyBhbmQgaXMgcXVpdGUg
c3RyYW5nZS4gDQo+IA0KDQpMb29raW5nIGF0IHRoZSB0cmFjZSwgbG9va3MgbGlrZSBwb3J0IGZh
aWxzIHRvIGVuYWJsZSBhZnRlciBwZXJmb3JtaW5nDQpwb3J0IHJlc2V0LiBDYW4gd2UgZG8gc29t
ZSBleHBlcmltZW50Pw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY29yZS9odWIuYyBiL2Ry
aXZlcnMvdXNiL2NvcmUvaHViLmMNCmluZGV4IDYyYzc0YmE3YmI1My4uZTA0N2E0ZTUwYjgyIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy91c2IvY29yZS9odWIuYw0KKysrIGIvZHJpdmVycy91c2IvY29y
ZS9odWIuYw0KQEAgLTQ4ODMsMTIgKzQ4ODMsMTcgQEAgaHViX3BvcnRfaW5pdChzdHJ1Y3QgdXNi
X2h1YiAqaHViLCBzdHJ1Y3QgdXNiX2RldmljZSAqdWRldiwgaW50IHBvcnQxLA0KIAlpZiAob2xk
c3BlZWQgPT0gVVNCX1NQRUVEX0xPVykNCiAJCWRlbGF5ID0gSFVCX0xPTkdfUkVTRVRfVElNRTsN
CiANCi0JLyogUmVzZXQgdGhlIGRldmljZTsgZnVsbCBzcGVlZCBtYXkgbW9ycGggdG8gaGlnaCBz
cGVlZCAqLw0KLQkvKiBGSVhNRSBhIFVTQiAyLjAgZGV2aWNlIG1heSBtb3JwaCBpbnRvIFN1cGVy
U3BlZWQgb24gcmVzZXQuICovDQotCXJldHZhbCA9IGh1Yl9wb3J0X3Jlc2V0KGh1YiwgcG9ydDEs
IHVkZXYsIGRlbGF5LCBmYWxzZSk7DQotCWlmIChyZXR2YWwgPCAwKQkJLyogZXJyb3Igb3IgZGlz
Y29ubmVjdCAqLw0KLQkJZ290byBmYWlsOw0KLQkvKiBzdWNjZXNzLCBzcGVlZCBpcyBrbm93biAq
Lw0KKwlpZiAoIXVkZXYtPmNvbmZpZyAmJiBvbGRzcGVlZCA+PSBVU0JfU1BFRURfU1VQRVIpIHsN
CisJCXVzYl9zZXRfZGV2aWNlX3N0YXRlKHVkZXYsIFVTQl9TVEFURV9ERUZBVUxUKTsNCisJfSBl
bHNlIHsNCisJCS8qIFJlc2V0IHRoZSBkZXZpY2U7IGZ1bGwgc3BlZWQgbWF5IG1vcnBoIHRvIGhp
Z2ggc3BlZWQgKi8NCisJCS8qIEZJWE1FIGEgVVNCIDIuMCBkZXZpY2UgbWF5IG1vcnBoIGludG8g
U3VwZXJTcGVlZCBvbiByZXNldC4gKi8NCisJCXJldHZhbCA9IGh1Yl9wb3J0X3Jlc2V0KGh1Yiwg
cG9ydDEsIHVkZXYsIGRlbGF5LCBmYWxzZSk7DQorCQlpZiAocmV0dmFsIDwgMCkgICAgICAgICAv
KiBlcnJvciBvciBkaXNjb25uZWN0ICovDQorCQkJZ290byBmYWlsOw0KKwkJLyogc3VjY2Vzcywg
c3BlZWQgaXMga25vd24gKi8NCisJfQ0KIA0KIAlyZXR2YWwgPSAtRU5PREVWOw0KIA0KLS0tDQoN
ClRoaXMgYXZvaWRzIGEgcG9ydCByZXNldCBkdXJpbmcgaW5pdC4gVGhpcyBpcyBhIGJpdCBvZiBz
aG9vdGluZyBpbiB0aGUNCmRhcmsgaGVyZSB3aXRob3V0IHByb2JpbmcgaW50byB0aGUgaW50ZXJu
YWwgc2lnbmFscy4NCg0KQW5kIGlmIHRoYXQgZG9lc24ndCB3b3JrLCB0cnkgdG8gZGlzYWJsZSBh
bmQgcmVlbmFibGUgdGhlIHBvcnQ6DQoNCiMjIENoZWNrIHdoZXRoZXIgdGhlIHBvcnQgcG93ZXIg
aXMgc2V0Og0KIyBjYXQgL3N5cy9idXMvdXNiL2RldmljZXMvdXNiNC80LTA6MS4wL3VzYjQtcG9y
dDEvZGlzYWJsZQ0KDQojIyB0dXJuLW9mZiBhbmQgdHVybi1vbiBwb3J0IHBvd2VyOg0KIyBlY2hv
IDEgPiAvc3lzL2J1cy91c2IvZGV2aWNlcy91c2I0LzQtMDoxLjAvdXNiNC1wb3J0MS9kaXNhYmxl
DQojIGVjaG8gMCA+IC9zeXMvYnVzL3VzYi9kZXZpY2VzL3VzYjQvNC0wOjEuMC91c2I0LXBvcnQx
L2Rpc2FibGUNCg0KUGVyaGFwcyB0aGF0IGdpdmVzIHNvbWUgbW9yZSBjbHVlcyB0byBsb29rIGlu
dG8gdGhpcyBmdXJ0aGVyLiBUaGUgcGF0aA0KYWJvdmUgaXMganVzdCBleGFtcGxlIGJhc2Ugb24g
dGhlIGRtZXNnICJ1c2IgdXNiNC1wb3J0MTogQ2Fubm90IGVuYWJsZS4NCk1heWJlIHRoZSBVU0Ig
Y2FibGUgaXMgYmFkPyIuIFlvdSBuZWVkIHRvIGNoYW5nZSB0aGUgcGF0aCB0byB0aGUgcHJvcGVy
DQp1c2IzIHBvcnQgbG9jYXRpb24gc2hvdWxkIHRoYXQgYmUgZGlmZmVyZW50Lg0KDQpCUiwNClRo
aW5oDQoNCihTaWRlIG5vdGU6IHBsZWFzZSB1c2UgdGV4dCBvbmx5IGZvcm1hdCB3aGVuIHNlbmRp
bmcgZW1haWwgdG8gdGhlDQp1c2Iga2VybmVsIG1haWxpbmcgbGlzdC4gQXZvaWQgdG9wIHBvc3Qg
aWYgeW91IGNhbi4gVGhhbmtzLik=

