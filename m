Return-Path: <linux-usb+bounces-7510-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0DA871490
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 05:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CEC61F22AF9
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 04:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52113C087;
	Tue,  5 Mar 2024 04:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JFv1z0W8";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YjwKH+uc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="pefTIQmQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313C38FAA
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 04:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709611962; cv=fail; b=f2JgqjBp/Y8sek5BE4TAvigqq44fT7rKHewss+HbdUhBe/PwQ76OxCRz9RLSMv8huMHSZ7Ezc3KEzlhHiK0ffgL24XmzIb1b7aU704yNevAfXDQkDZeM1RIria9/Y8j1A+fupqQvQHnkM44vCTj3w2+y7kJ6h6tv8nhsEDfWiX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709611962; c=relaxed/simple;
	bh=zdO3O2doEQU6TM+ly9JoFvP1VpNokaSLel8cwG8mvMs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m1sgcGWaRjYyhjs1hd0Kv4GAQ4LQP3uuVFR8L7vvarp0ubhQs2TrY12IncNHRxUxaglhdpSXZQVN4kncnSx3OcjBImPmol//03aSXufYn3DsDHuYzy0p0fofPc4+/JeIpRLO8tJLlaSpRVypKREa/q5jrxBM426KJZs0UZUp3TA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JFv1z0W8; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YjwKH+uc; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=pefTIQmQ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4250Xh7b031647;
	Mon, 4 Mar 2024 18:41:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=zdO3O2doEQU6TM+ly9JoFvP1VpNokaSLel8cwG8mvMs=; b=
	JFv1z0W8163KeMJTgB0P7JFx86qvIA2h6pyXloayoKslPHbtno6Hx1Pls/1qjHH/
	DOp2EnTTsCr5P60iVXJu8LNS03R8ilq2Z9O6rrHioqJUybyNsBcpIVRHYY3/5Gy9
	DvHFBJmuXKJongs099xTqO4T/MXczLlWKwyq/t0lmZ/FldAcAeZ+pLQy+XWfVf+7
	Oq+HCbJTCuC6Mx8A7eisS357RMDFyORnSFy6jTMsnLDtKzNBehdgZaBYqSO30zFW
	ud+6gh1P/tQEOcHf3orv/Wxcjpy9yBfOPKg8La8juHht8FnR3dov7YZwKjRNpbLd
	K7zSXfeuvhzWRisiFReaqA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3wm3mh9644-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Mar 2024 18:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1709606513; bh=zdO3O2doEQU6TM+ly9JoFvP1VpNokaSLel8cwG8mvMs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YjwKH+ucmusthu7s+JGM0PMTkRVzLrqn5FyzDCPjEWjPItkcHQ8pGvMoFMOsSNBYw
	 /boAACjkXP6GCKnm/O/v4ub+xCQqiCHqhdC7wtOFuc7sNNc1qNpdT33sHif6aWl5kX
	 AFUGdxICco1Zu8yhkrlTiYrM8Bkioe3cClsrZcFolqmcxaMQXzgtc2zzu2odgcjDbB
	 YE5S60d7EWrTHS3xq0aRmcWxrv0CLVSmdIe6dxY3GdpfGN69seYSW54veRQKrJxDD/
	 aMUAFyoTufE9L1GDbyIhI9bUSLapliMDyChwsR/8B20qSbl7hbVq1DCdZZa3YA7WZb
	 9Xfh2kbeWcUuA==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ACF364035A;
	Tue,  5 Mar 2024 02:41:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E3692A0096;
	Tue,  5 Mar 2024 02:41:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=pefTIQmQ;
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id F387140347;
	Tue,  5 Mar 2024 02:41:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmTZL/yHKNv0Skx8z2yJtHXFlKTqVfCZ04EIV0kVqRKejTCgoULNLzFjc38jTauaCNJpKuX0Jy/sonteU8ZjYV31kj75EGVZ+W0SpVjsDNHVU5lNJVjNkNIagyXnIcqL3alKEpa0TzaUnHrYLMbo7envzY7raA8oRqrGACcRhARQH233XmeYwm9qPYKKxiuiTPnLGZLGM9KJFntN0Er2NK8fXN0orD3eyKm/M17P679gMrGUFRoFxO1qHl/ceqG44JAzO9zhT27u3wq/MTSAiK7N6Adtmvzfe5/MZSIT4x26Os0fi7cJxxvuygQn/43wCspSaIJhCMtJht8FjbATag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdO3O2doEQU6TM+ly9JoFvP1VpNokaSLel8cwG8mvMs=;
 b=JYq5qnbdxwt0I/eEzZg+2H3Nn0d0P0U77/GC6P7ubAIBKPO8RENLSJE4sfziBot2jbv6ED+ZNSHEIYbZyDfgHqCYoihKDnJd6LeF0Kmg/jIupF6uJysBHRPVUoehOIgbCUke2SUalklQpGGwgiYDa7e7CxPohYOsqEsgoUrXyAuao+HABXATGez8zMBs5dZlYiU5PwGBLG5udTJnQvF+PXfJeiYJCJVt7weyQSNOP2yiiJXVJrjLNg7Kpxrfgbs2hqfFtVzAAzCEZN50CFBmzdDZJZWKuuVi6Ucn2ffmJ1pmJtzeANDEhBVF+TE6O2dQ82BgcwazlBEq6ADjMnxEcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdO3O2doEQU6TM+ly9JoFvP1VpNokaSLel8cwG8mvMs=;
 b=pefTIQmQriOILME2MnzZQybL1qE2QFxUQnlHNnF5lTQO+7klNFDgvHlRywhCZNh59UvP34shOjpx8imNBo2gX0QA7VtzqneDYnV4WLkfpDyb/u1g9kTP3Lq4eOyFBkMxZ9slORprodbW7AAznWtNIpckvpO9y82oa17VnYm4Tcw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY5PR12MB6624.namprd12.prod.outlook.com (2603:10b6:930:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 02:41:45 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::c87:4fbe:a367:419c%3]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 02:41:44 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "johan@kernel.org" <johan@kernel.org>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
        "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Vivek Dasmohapatra <vivek@collabora.com>,
        "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
        "ray.huang@amd.com" <ray.huang@amd.com>
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Topic: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Index: 
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscAgAWsYQCAAIyKgIAAqmqAgADpX4CABdZRgIACH0WAgAi5FoCAAkh6AIACnmOAgAB3LICAAN6oAIAHFi2AgAB/wICABATrAIAAF8SAgCauMwCAALNhAA==
Date: Tue, 5 Mar 2024 02:41:44 +0000
Message-ID: <20240305024126.iuculhwkj5epg4gq@synopsys.com>
References: <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
 <20240130021704.ndbkkyksauku7nwr@synopsys.com>
 <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
 <20240201012301.qtp4vr67cwnte5im@synopsys.com>
 <20d855ca-678c-671b-d956-f08f2ac88573@igalia.com>
 <20240206025307.j2lz3v2idwm7gusp@synopsys.com>
 <43013c1a-92c1-658b-ace9-8ed6ae98769e@igalia.com>
 <20240208235300.pjife5zxfz5onqvk@synopsys.com>
 <b9495221-54be-ae5d-774a-f1450290b104@igalia.com>
 <7594701a-34d7-579b-6c9c-05a18d3ab651@igalia.com>
In-Reply-To: <7594701a-34d7-579b-6c9c-05a18d3ab651@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY5PR12MB6624:EE_
x-ms-office365-filtering-correlation-id: ebc1db45-862c-447e-f290-08dc3cbdcbf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4EZQpIEdLOTb2ZljHfjfVcN5rjgDOUw2htwhNKGQGeCpnA4045BHMbd/Cxng4g20dO5GD16BTOhhdi1f0ifmc6gCWbleRQnjeJOFrsxqkqb1HC38yHoyfilkeh9kVhJzbnAjxdqm2nGFEtH1GX9FJThDOrlQh6aCqdTUH94HXCHLNzV1HVrzfz9DFiuzTVWGeAGnDWhMglGC3uOAGRsjaxjXQ6VpZ0Gigl0nclgfQr2xsVEWxGwR0zmpImpQqeI8mS3g7TOmcCo/knnaKnRg0q9+slNmp0AuMdXgVWdQMwybs7qVzdnJunSoJHCmhZxQc1WnJMpGZTwVUH/hGPLgxk6XJ5Wu5qtX5fePyXvWTkhdTgu5TbDudOtybFyecnKUoOLBSxgbCsxZJbQd9S1txHZW61/1H8Wf609aPchHLgEclAw7Bgfj9dECQls6qWgfU5QsoMieaXn9IJqCQmNaQ8JuP/MBXbBd9XalIvXhbxlfEIovsu3jvUTTemNkUYcsQ5Orxl3vAy21Nq70MPEhnxaCSmeCK0XLRdws0BHNQ7YFFFurFIKwU01jfFcB+w7qjLANtdQZA8m3TvD82e79lA+p5f4BUFQW8QsIFxtnUICi2IOn+tpR6RmZmByMg5rSTMPwL7L61vG3oquZeh6/alWBufJIQ3Oz4Q4CWMseUDC1jHtjhcAJtZdReqRX3cdTR7xNl8VDsI22XQjXP3BNwg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bm1RVDdLZUdEY1JpeXV1YmtxYnF0cnVndjFObXMwUWFyZk1TVi9GQ1pqK2hv?=
 =?utf-8?B?eU5Mb3pkaUhCcXYxdEc2SXltVk1YTjg0RVFpeHI1UHB2aFIwclkxMXVjby92?=
 =?utf-8?B?ckFLL0hJaVhQL1pqc1hwNkdVMVpSQVlSQXdxK0FZZTErNmlENWhlT21aUmo5?=
 =?utf-8?B?S2JmQktsRVlNTXdxdUIzU2hnbnJ4TTYzZFB6MkJjTTF4S2RWYThhNzd6Q3pi?=
 =?utf-8?B?OGlzRzBMMnhHSWpGazk1eW02V1dmR1crNDZxTFlwcDZCckRpd0tqV1ZCWXBS?=
 =?utf-8?B?T3NmLysyZGJPUk5jem1KZlUzcTdYeEM3M0NEK1pFN3hDcG5zaDBNMnczTldl?=
 =?utf-8?B?dndpYVJneXZSK1crNW1LNVZBQit4UzZRdnVmbGdGYXExNjBMZEM1WDYzblh2?=
 =?utf-8?B?c1lBV2M0RWt3ckwxTllsQ3pWdG0yei96UElMMGhCN0pqZ2lVMWw5Tm1lQ2Ur?=
 =?utf-8?B?UFg2Mmk2S2hkL1EvbDk2U2lYeEZ5RXdQQitYczFUVXRPeHJiWVk1TGZzRzNh?=
 =?utf-8?B?R1RKTCtkS2VnelNRMDNueFhJNjM5MWV0dHR0TldaZ0tDbDQ3TDlHZEpZbngx?=
 =?utf-8?B?Qnc1VWJSWkdYbjZ2Y3VGSGlLbEwwNHRjc3RzekdSTm5yeWJhK29HdnUvdVhi?=
 =?utf-8?B?M2ZtMjY2WmY1NkVDc0RiOThqeEpoME40eVVlMEtxTFhzblJjK1hURHNNS1V2?=
 =?utf-8?B?TW92WXNOelBsNVRDWmVzdjZPMzFXTXhHM09kN29iOUQ3d0R1U0lkTXFaZlBk?=
 =?utf-8?B?QVZ3WWZUTHVHZnRzSGVLVTRKRWJSVFBQYk85cUJnZW5KUk5CbjczWWZsY3hk?=
 =?utf-8?B?WGJpaDA5U0RLTjhBcVVvNVBYV2hCQ3hqNlpveUhuMENlSjVoeTEzTVh0MlV1?=
 =?utf-8?B?UWZhbEkrN1NKZUVVdHlyWlBEUXBVMDZlSDJVd1hGeXkzeWMyS215RlFib1R4?=
 =?utf-8?B?MmVnSnNYWTAxazdBeXFEcmZLQ3JpcWF5MjB5ZStLVXdUSVkvYTRpQXRuTzhD?=
 =?utf-8?B?Mk9Ob3VkVjV0cDdFMXVGcFl1UEVEdkdHaDAyVkZrV0ptY2hrQ0VUYWo3aXZu?=
 =?utf-8?B?enptY0JBUE5pMHYyUi9naXZLcGx3ZVkzdVZWZm5OS053b2Nma3Z3eFlERlRk?=
 =?utf-8?B?R2FGUit6Y2NQMjVZYkxmaG1LdStjVDA5a0swSTgwNzNhQVVZai8xMzlRYU91?=
 =?utf-8?B?V2V1UVZLT0hOTWpIRi9xY25TZEF3UlBHTjRaWnh0VDJRU0VncVBhNGYzdXVW?=
 =?utf-8?B?U3VnRTl2NDM5T1k4Q05EUmpuN3QvUEhWVmdsbklVRTZCVTlkZ0YzUE92cm9l?=
 =?utf-8?B?eHBOSlYzc3pSczNQVFlISFcvZkZxdEpxQ2xEL0c0SWZtTjY2NGVJNVpkZVA5?=
 =?utf-8?B?cThpSjVCUTVCOXpUVEE4S1JjcFFvcmU4T05qeHgxeDR0aXpEemZIR1UxNm16?=
 =?utf-8?B?N2I2UWZ1ZC96WG9UWDhDY2pqdm13UXNFcnZYMlFvUFdyamVEUUd4bVAwc1Qw?=
 =?utf-8?B?cnlTWitNdnJMV01hUGNVeXlhSjZrWDN0Y1MzK0l5Mi9ENGVpdTU0bnJoVUox?=
 =?utf-8?B?alBSY3ljMGhVbXlRQThneHlPR2QxallEZ05tbmV4SGd6Y3NoWDhyM29hVjlz?=
 =?utf-8?B?NTBLVU5ZLzFDS1ZQVXFNV3RoWFF0azErOHhCeWMrRnIwQlhjeVVqKzRnWEty?=
 =?utf-8?B?T3loMDEyR2ZRdGlnQzJ3enFORC9GUUo3RlpuamVLY3QyT2k1cldldGRrMGN4?=
 =?utf-8?B?Z3ZDWnIvWUVGWmV6Qko4Q0Y0MERZTHowV0VENU91T29yTS9wU2Y4Q0VPMldO?=
 =?utf-8?B?MlZUVW9SaXVxVE81M0k1RUluN1hTeVVqVjkyMm4xY094c2c2SExTM24ycVg2?=
 =?utf-8?B?TldtalQweGVPOGpkamEyaFZTVkNULzdWeTZ2bHplWkRHS1ZxQXRQNExrL2lq?=
 =?utf-8?B?QUFsMVhvN0c1WVBsa2h5Ymg3eXd1eTdrbXBqQVlqdGJKc0VLVUc3bEN6Y1BL?=
 =?utf-8?B?RFJPMnVOZGd1Nm43ZHR5elRNQVJ4clZIejlwQW9pdG1QWFUwM0hmMUwrVVpw?=
 =?utf-8?B?eFdpRGdaUUI4bnFLd2pNZGkvd3JOaytuZjQxbndQMWkrTXZEbEVwT25rd1RJ?=
 =?utf-8?Q?tTa8A4RKTAnyAC98ipi/e4PFW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4697488A1448E418ABAC558A838B891@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	EPJHZMbSmczbDxmLEGtePsgSxJ0jqx2jNwtKTIgwF+YLW6s4/4YZGwL5qZElzwm2kCuj6nQGVZK/ANKKRc7TZ/g+Tx6w20qXeBW6btKuUs0EugFrnU4yvhj8ShaiHSB+7GagtsoY22tBoOp80cMVnyWBTnMwJJjU7+eARlk8Tdf7Ig0bbij27dekX8mVLXykkCnTE3yfEnpwroTfN0skrLWTT7xidyaoWltnPFjUO/bDEzK69Tm/mXWGFDsKAFjCX5HyBdMu4uDNhvOy9gAO5joxC9sOgq43PdbnYK+2sHjJYovID1hupZapnl/rwBaEdb0iLG9uPqsxJFDJbYsGuG4ls0NwOsL7D7vPXPq0WxMJT0kX81ysNlGaTcZUAKnxRtRUkuFiJ49qHpdJTSDTqMKA62ml5VvtOeAKh1/oOi/n/7SXqGjtDAL3zb8h9ECtQAk++Xe/aAFjR8AtL3a8B4d66Q2H4C0Oip/pbxpYD5Knbhp8Xw+MXS1hZ8vycETgEDbhlOPbjw9idJN4VyDuDcW6pDbFJaNUpGBC/E6KUaxfhOSExalyQa9xHWY0zb9VgrMiKJN1wIP+T3jTcg4yPeqAWfLA2X0dr/TGkhMLrOAfbVwEs0CXUKR5rPj8zyrIghzu2b/6c92zxeiQtRqdaw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc1db45-862c-447e-f290-08dc3cbdcbf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 02:41:44.7793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SQ1eVnnCkrJ5rF1zbMVkdyE4kKhcDSrfbOExeX6saxAN+jhidX/4nrxvqIMWSZ9y4Hd9HKrs4hunPysgh3XWUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6624
X-Proofpoint-ORIG-GUID: sacKtPM5_AhITvF3oGiYBtFBK7II8Qwm
X-Proofpoint-GUID: sacKtPM5_AhITvF3oGiYBtFBK7II8Qwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_20,2024-03-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=836 spamscore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403050019

T24gTW9uLCBNYXIgMDQsIDIwMjQsIEd1aWxoZXJtZSBHLiBQaWNjb2xpIHdyb3RlOg0KPiBPbiAw
OC8wMi8yMDI0IDIyOjE4LCBHdWlsaGVybWUgRy4gUGljY29saSB3cm90ZToNCj4gPiBPbiAwOC8w
Mi8yMDI0IDIwOjUzLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4+IFsuLi5dDQo+ID4+DQo+ID4+
IFRoYW5rcy4gSSBoYXZlIHNvbWUgc3VzcGljaW9ucyBvZiB3aGF0IGhhcHBlbmVkLiBJJ2xsIGNy
ZWF0ZSBhIHBhdGNoLA0KPiA+PiBidXQgSSdsbCBuZWVkIHNvbWUgdGltZS4NCj4gPj4NCj4gPj4g
VGhhbmtzLA0KPiA+PiBUaGluaA0KPiA+IA0KPiA+IFRoYW5rIHlvdSBhIGJ1bmNoISBMZXQgdXMg
a25vdyB3aGVuIHlvdSBoYXZlIGEgY2FuZGlkYXRlLCBJIGNhbiB0ZXN0IGl0DQo+ID4gcXVpY2ts
eSBpbiB0aGUgU3RlYW0gRGVjayA9KQ0KPiA+IA0KPiA+IENoZWVycywNCj4gPiANCj4gPiANCj4g
PiBHdWlsaGVybWUNCj4gPiANCj4gDQo+IEhpIFRoaW5oLCBob3BlIGV2ZXJ5dGhpbmcgaXMgYWxy
aWdodC4NCj4gDQo+IExldCBtZSBrbm93IGlmIHdlIGNhbiBoZWxwIGluIGFueXRoaW5nIG9yIHBy
b3ZpZGUgbW9yZSB0ZXN0IHJlc3VsdHMsDQo+IHdlJ2QgYmUgZ2xhZCB0by4NCj4gDQoNCkhpLA0K
DQpTb3JyeSwgdGhlcmUncyBhIHN1cmdlIG9mIGl0ZW1zIHN1ZGRlbmx5IGdvdCBvbiBteSBwbGF0
ZS4gSSdsbCB1cGRhdGUNCnlvdSBtb3JlIHRvbW9ycm93Lg0KDQpSZWdhcmRpbmcgdGhlIHJlbW90
ZSB3YWtldXAgZGlkbid0IGdldHRpbmcgc2V0LCBpdCdzIHByb2JhYmx5IGJlY2F1c2Ugd2UNCnRy
aWVkIHRvIGVuYWJsZSBpdCBiZWZvcmUgYWRkaW5nIHRoZSB4aGNpIHBsYXRmb3JtIGRldmljZSB3
aGVuIHN3aXRjaGluZw0KdG8gaG9zdC4gSnVzdCBuZWVkIHRvIG1vdmUgdGhhdCBlbmFibGluZyB3
YWtldXAgYWZ0ZXIuIEkgaGF2ZW4ndCBjcmVhdGVkDQphIHBhdGNoIGZvciB5b3UgdG8gdHJ5IGl0
IG91dCB5ZXQuIEknbGwgdHJ5IHRvIGRvIGl0IGJ5IHRoaXMgd2Vlay4NCg0KQlIsDQpUaGluaA==

