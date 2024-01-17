Return-Path: <linux-usb+bounces-5140-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DD182FE0A
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 01:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E753528A17D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 00:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F85EDE;
	Wed, 17 Jan 2024 00:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="u7/t9rfm";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WATjHBQw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TL3HyOiZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8117280C
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 00:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705451876; cv=fail; b=rSoRdZCI1XODLfUA/TXbw/hMHesSL4N57g9YjAxZr9lELLPPe2QsoXcdmqLuT17075Z4v0kSiUeRatkp5zTQYWfyphpFlT/mq9F5AZsc1hB7DN15nOWVsfO+8NWEhItTNU2i6VL7vTWaFwELD9HOoB+k02TDBg1HfbLl26W1VA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705451876; c=relaxed/simple;
	bh=8eg0oUJ7IVoHUZf5ly7kca/gfBfAqCbBgzyuihoEQT0=;
	h=Received:DKIM-Signature:Received:DKIM-Signature:Received:Received:
	 Received:ARC-Message-Signature:ARC-Authentication-Results:
	 DKIM-Signature:Received:Received:X-SNPS-Relay:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details; b=USSIt3VxeltgdhT7+XydLt85VsCnEzUeDAwLjZQTpXTUbHP222FJ+2ARe7PxC1R4iO2XdVc7Bw9J8aFF07hSm0xZa31NMcIll2Izw57Ap66I8CcWxl4QyvVpDnbn1sejDwj/J16hBrBXGBkxDqWsS2ZnsM6QztKjdF9YnVW83jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=u7/t9rfm; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WATjHBQw; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TL3HyOiZ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40GJSUB2002519;
	Tue, 16 Jan 2024 16:37:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=8eg0oUJ7IVoHUZf5ly7kca/gfBfAqCbBgzyuihoEQT0=; b=
	u7/t9rfmVdktsiopgTze0pzKxgfuAHENbREBEU7+GwDbsO759lFz/Jsyz+KjZZUm
	UYaHRRDE3Q66O5kco5q9qCsX85DNecjdwF119x4JrlPPR0IovNKZ9mzdOLJSY/m8
	V9VEiZUwodi1/aPNSM3u7x8wNWQMVWcooHCPEKUS9KRqxDO4ooVD7FWeH9v1Cd/n
	WSD+SgV9F7ox0DZPVoLX/XWFoI3CO/8slhzoDeRn5aErogpsDDb6Tt9fP1gie+a1
	exZwS/+m/e1PVJcJX3IpAwfVvYJQnsQolycx/O7EMX+oy3ntoy2oflUMsMhs+JIl
	/qG7J7tdFZZNjse0lvJTmA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3vkt1ff4bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 16:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1705451833; bh=8eg0oUJ7IVoHUZf5ly7kca/gfBfAqCbBgzyuihoEQT0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=WATjHBQwTmZeCguXs43QjxdW7p8gd9hrYacFf287H8jCMQVeHTpSkw+eoVuPAHNqa
	 k/wKlXrlaGNqOSNMbuzwSk9K1d8I3LPFm7lbJn3Ed6ZR18CAwq9xyrYXc/6fjACcd5
	 POKaK6caExb3perF1lddeSyGpjqdEi3SfZjdDo8SdLlFYXE0cyIbFyCsd3j085wWG0
	 6vtifp8XPUqABZOTztKrXffJlWb8hAqqNNeEJG8OTLTGQU9jbU+x5zh6tg5XeU/pDL
	 OngxI1FRjfYhBiHVTC4/cdKkLU23sttOIUcEamXEjBmutASsoe1qnHNVWPwi3DseYg
	 wfYHIui/kI+nQ==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0821B40362;
	Wed, 17 Jan 2024 00:37:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 33558A00AE;
	Wed, 17 Jan 2024 00:37:11 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TL3HyOiZ;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7743A404CE;
	Wed, 17 Jan 2024 00:37:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iv2/b6BPsqdeuq/WSU8iIRWwag9BYrrz/3TbyYq46raBabm405RZoPSh+yPpxwFeMrB4SuRwbmH83bjOeI7Kse9pYBDa2GZeNcCsvY08hpvFLAR7OeFy3rBpG/MeIF0CN+OgUGbd+mkuDOfCThQg+7CkIQUWP/fagyP/4CE0jSpfC7OdDSfJkOU6rqtsbkAdNb/EFT5xYbh28cs791zGA/Q+20i2qCsGDy6g8HxxZnwXkhpbEu48GMP42Sh011G54rZ40G+8dLfu3GvH0bCeWXa+N+jAJeBhhTZ6rsesVopEppPQa65+LyhAnMsUIcgBwD7H/UTC16JrKi/Q2rBrFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eg0oUJ7IVoHUZf5ly7kca/gfBfAqCbBgzyuihoEQT0=;
 b=kQNCZJxygpjw7RuxSoRB4Dv+eeNqCosm3wRzy6m8E9TAUoosSSbUFSmdBjF0h739tcL6bRsmxjxxtHg92u6MnD3jXDSdo1p37wFsGHQIJaL9kfv9omVrML9Y7HJTk7NcFrVNRP36fKpWUZ2aInVQnUGh0iU2VqIkqCqxZUEeUpwljMuc23+CFwinKlRNK7jaqhS8xK8c1MFqOHspBEgxoDUQdHFIM2ZHyGYV1feDrfegD4xcemscZEDCMy/kPpQN5qIv5Ktag4Zz61z0Bi2sRI3Eii8573N4CLdY4auziTF/KAcwAGnYeK7wWuVS2Xnj+knoSavUtp7h71tcUiVRfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eg0oUJ7IVoHUZf5ly7kca/gfBfAqCbBgzyuihoEQT0=;
 b=TL3HyOiZATYOSTTZkIjrvRNRkJP2TZ8Am6JoModYZt1Fn0Rhk35w/DnhLpAH0DzvxQgKvdG6XotmmJIzUoNpO52dPQKElD9t+xW9Ei6WxmcsiqmE4woFq2LHJGOC69XoWscWFltQX1xlJaH+laXMrcQbrzRzwLqpPuE7+KRfHuM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Wed, 17 Jan
 2024 00:37:05 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3%3]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 00:37:05 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Vivek Dasmohapatra <vivek@collabora.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "johan@kernel.org" <johan@kernel.org>,
        "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
        "kernel@gpiccoli.net" <kernel@gpiccoli.net>,
        "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        "piyush.mehta@amd.com" <piyush.mehta@amd.com>,
        "ray.huang@amd.com" <ray.huang@amd.com>
Subject: Re: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Topic: [PATCH] usb: dwc3: Fix spurious wakeup when port is on device
 mode
Thread-Index: 
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscAgAO+tgCAAnrjgA==
Date: Wed, 17 Jan 2024 00:37:05 +0000
Message-ID: <20240117003703.qgluqhprtmtf4lcr@synopsys.com>
References: <20231122165931.443845-1-gpiccoli@igalia.com>
 <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
 <20231205012336.mn7b7f4zypwcyv6w@synopsys.com>
 <9efaed91-d246-cf3c-efc0-e866f88a943d@igalia.com>
 <d85a5507-4d4a-9e60-fbd1-68b42afb2143@igalia.com>
 <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
 <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
 <20240113013320.mrqqrdajrnw62kis@synopsys.com>
 <721dd9c6-f160-4f5b-a593-02f13589e403@collabora.com>
In-Reply-To: <721dd9c6-f160-4f5b-a593-02f13589e403@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW6PR12MB7072:EE_
x-ms-office365-filtering-correlation-id: b7ad67e4-c232-4ce8-5c20-08dc16f46e17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m+9F/9/CR2JNMCYlmPT6G6hEtHlro2V0KL+MX3+PozHOaQxN2LfkOehWeT9F8FmAK1tu7kUU8DfzUXw7w5tPOcgQUGmbAWTLKwTno14HlHyDHmq5poaMcnPB0tBYhnKH60bfAp7+PvdmTwe1YwHvo0u3lVJvEZjdvZTpwGCS3soFG3im0TLEwgR7K2QmNu0Q6IBkCy3VsXBVNPSzWqJ+bzQT+ku7ZmcCyR/1CKi/j2SoI2cBUyGZKrSx1/XDR1CAjCLwngyxPBlOebsvz3p47csLu9fxlHlPsO8qBOpXVbEZP0f4HQB8Z3YBtrH1FXTvnqJUXHJe5X8+HDAySL42tmbRhMl4cMGasFCxSZSxwevjeuMREeVt8QgaIo2TCIO21DrH9VxixHVvsHPedourKuH4k4dU8/1+lNuvR8pz9NWeRMsRMRmR71TO1aHvNIjPTpvh2lqWMMgL6uUEcd1dug3gXTTQXujifnGPUjgK1Kuht3F37Jyv8CGoF1J8VQ034P5gS/0WxYJnTPktQOtfYNXoQfJnVXWJYyNs/YI/eL9cvPRWbEAFvFi9agUne4sRtRgCj1BmlvjP0usoSI31liO4m5snCgo2oQWjcavHJQxizuSpCrfxZiU0fWcmFLfU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(8676002)(4326008)(5660300002)(8936002)(7416002)(6916009)(2906002)(66446008)(66476007)(54906003)(316002)(66556008)(4744005)(71200400001)(26005)(1076003)(2616005)(36756003)(86362001)(66946007)(64756008)(91956017)(76116006)(6486002)(6506007)(6512007)(53546011)(478600001)(41300700001)(38100700002)(122000001)(38070700009)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZDBSQmQ3elVKUWFDK251aFhYN3NiOGZqcVczbWRsZGYwWnZ2WDdkeGNXTklD?=
 =?utf-8?B?WG5mOXVDMTZYYU1zUWRQMTNvZEpxbnh2ZzBSTDFuQkhwOS9pMXB3dDhHVDVI?=
 =?utf-8?B?VFE5Nk9uamQzUVlRUit6U0hCNk53VHNTeit5NXA2aHRWNUlzZnN3UEwzdVNH?=
 =?utf-8?B?aU4yZW1Vay8wRGVRQSszYkZJM2txdktqWXdjRkNXMXBZcXlPWmRWcW5ZV215?=
 =?utf-8?B?ZlM2aUs5VHNudk5hWFQvUTBIOVlVTmVSbEhrNGROWXZ1RnlEcFg3eUgyZnFk?=
 =?utf-8?B?bjE2ZnIrQ2g2c0didEtkcE9vdi9qWnZWNE54aVM1VTAxSWh5Zml5VlNDbUM0?=
 =?utf-8?B?WTlHa1J0RWVnQ3RzcHk3bER5cjQvTnFLWmQ1WlNtRmNKVHdlSGRycDBxb0lH?=
 =?utf-8?B?cHF4alQ2aTlWeStXN2YvTXNQckdoaGRjaUNGUWNCVUpjcmRLNXZUdXVTM2Zm?=
 =?utf-8?B?OGNVMm5pV1hSQUJ1UzdsOFhwOGN4UnJsYWNXZHRLTDRoUTRuWkdub0dWZitz?=
 =?utf-8?B?MjdCRS91ZkgyUUlUT3VwN0VFODcwM3VlMm9rc09ZMXZlTlZncWgybkF1ZUNx?=
 =?utf-8?B?OGpoWk5nNVhITFJYSlJiNFNvZ3pmVzhIWU91S09wZ1pYR05PbEJYNGwyRTZp?=
 =?utf-8?B?TlMvN0lDN1A4eUFjeXA0TzluWEpQTjYvNWwxMitwcVlsVHh3eFdYWmhYclQz?=
 =?utf-8?B?L2Z3WHJZQStrL2JDRnhZSFQ5c1BtS2huSHJuOHpORWpzbCttY1U0aFFSblAw?=
 =?utf-8?B?N0FXSG5QbzF5eUl6dHNuVjRTRFpVZWpsU3lCeWRMT2tFeXR4KzRQcjRJRnMx?=
 =?utf-8?B?SDNrbElRUVEzcFZ1OS82dWsyUkRoZW1FbjNMNUlQQ3ZNa25ZZE40Vm9Na1Ez?=
 =?utf-8?B?cjVOK0ZoTXIwTXVTaHJhd0dSKytTTXpSUXpzc0tlNTh2elIxbHNLQ3BTY3Fq?=
 =?utf-8?B?b2J5Zmd2QmVUYWlWdCs3bkt4VzhUQk83eGh5N0JSbXZycksyVjM1VE1yU3FH?=
 =?utf-8?B?ZTNMamNORk1OdzgvMDVUQ3JQUm1hdWF0M0EyUFdQanh6RUV6S2FjUE42ZGp6?=
 =?utf-8?B?WXZzUlVacHZaM1hWK3RhUDhLNENHNlFmbW5QeW9UZkl6Ni9wWGhjTENkbnNO?=
 =?utf-8?B?Uno2T1UvcVRqeFBEMWc2S3NCSEt3dG9wdWRBZDJLSTJXTjRsNVNXWm53Q3hM?=
 =?utf-8?B?OGxpNEh5TWtzd2VtVG9wNzNCYnhDS0JoUkxoS2twT09WMHlWd1RpUFdTdVhl?=
 =?utf-8?B?OU5CN0Z0MlN3N2VyZDI0RXBsVUxoWlpuWTB4RHF2Nk4ycm02aXBWM3haSnl3?=
 =?utf-8?B?U09pN1FTU3VCajJGOWlNUlcvTTFoRUpabXAwejVYejNMSmJZMjNJMm1ySkJP?=
 =?utf-8?B?UXZ0MXRDbkVWSUg5TXU3Z05TcnRuM1lJOU1hWUdFT3JjSTBwR2ZheUQ5VXNR?=
 =?utf-8?B?QS9MMEltSDRsZzFlWGNoL3NWZTdPOUpPcStPN2dleXRnMWJGQk4rKzNIWE5z?=
 =?utf-8?B?VlZDWHBnYnpIRTJTU29leGZDSWo2aUVWR1pBNGdRdWRZbTJJeCs4NlJjd3FR?=
 =?utf-8?B?U1d2dVBBSHZvN1NVdmJ6OS8wZVJLNG1qcGRmVDFUNElVb0U3OExPVVhnb1N5?=
 =?utf-8?B?ZnE1UU1VUitLNWlYRHU5V2pwVjJiSTQwQi96MVJ2clN1akxMeEwycTNLTXNR?=
 =?utf-8?B?M3FRV21iNHJvNFZqUnJVQ0NWbWJOVmE5OFlTMVJrL3pSeUhLckl1TW1sVXpF?=
 =?utf-8?B?bFF0aDBuLzMwNERObTEvMDZMQ0hQOXdON2dWbDd0YWhoN0RSV0RrU1IvTTNT?=
 =?utf-8?B?TjJCUXdWOGpIeTNEQWhKMHB1OTgwSDcvUlNjMUxrNExqNjBLUU5JM040WDNC?=
 =?utf-8?B?c2V2RllReE5aNHpRblVBaStVUCtBVDVMY2RFQVYzTEExTzRDSnI1MnhqcFdx?=
 =?utf-8?B?Ty9pNWV2ckhBbGdmNVZ6WHY1MWZOeXJnVlhkZmZaT2RybjhjeTNHSUhMOWxl?=
 =?utf-8?B?Z0RuS1JHVzhncDRHZVdudlc4YVJNQTZGMFh6emVXQXBDSk5ZSXZRRDhmd1lp?=
 =?utf-8?B?QXY3eVV3NnJMZXR0aTRMUDlQUlhlVHJud3drN2FwTGZiZEwyQUg3SFY4Q2ZN?=
 =?utf-8?Q?jWLXHuo3lLvTncKhForPjb78A?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ACCB5087B257774F8FFDDED59A87E98D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	IeMow12kE6gfye21/qhQT56kgMjI6kFu0mQDpQ5D0NnaJVhyv1Ih11tWJthr7KVXuRT2A8OAnAub9oIRJzrlOeoJ3qFy33dBAHXSezc0zlqAM4dND0fpmZLXt3ZwdfWnyqRGNJZBsfcfDV9EKVyqcn3SDZHlK4FrQs2Fjr5pWlqEehRNfaFcmrJyJjkFLzvNekvoq/kUqV1YJc+/xmUCyjvoohC+E9k34kG000drW7ATUURBsgjFSbsOxZmk4O41+zmuF5+jiceOsdQ2Tsci0Tv0R+ijp9GoZkweVX4gh4C503n6zbUqdageMqGzxq9zE0QIZz4Hbvr/+60d3cyQRj062kKa86oBZjjIgaOMBucn74T0uRUfkvGRF+gYyVwftx57j/hIPJFxvcevYMR4zZ+2Y5Lis1AYqDV0EDwrhuMkWSea41W7531H55drFbJH78S2v7wGfNogmCgBQb6gAq5dD0dqKiR3FT4J99Om7rMOVH1r1RbgNG4NLh2cZVe66PJ3uq4CzjhZwXLHTq99v8GTfdKvgXJnP2roAihMVNLSNqrE6a8VZCSmM7NFpYhXlX9fQvlPYqBwFGHZ69ozSw+v2WQM5N+nJZ0inlzCYFWrjiO7q1rR+zr/DCfUOh/8FohzCZnNKbiHt8ROvVvXrw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ad67e4-c232-4ce8-5c20-08dc16f46e17
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 00:37:05.4287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ncq1nwSnRu5QxWJopVoUCZRalzHfqdOp6oU1hlwLxRRAnHICVEH/3cOUTLpBQcqQJAFt553QtNWItuu8JLiYmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072
X-Proofpoint-ORIG-GUID: s-Hxj38kjOz5zZZThhoYfWbyzFdQEiRv
X-Proofpoint-GUID: s-Hxj38kjOz5zZZThhoYfWbyzFdQEiRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-16_14,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 mlxlogscore=734
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401170003

T24gTW9uLCBKYW4gMTUsIDIwMjQsIFZpdmVrIERhc21vaGFwYXRyYSB3cm90ZToNCj4gT24gMTMv
MDEvMjAyNCAwMTozMywgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiANCj4gDQo+ID4gUGVyaGFwcyB5
b3UncmUgbWlzc2luZyB0aGUgbG9naWMvZmxvdyB0byB1cGRhdGUgdGhlIHBvd2VyIHN0YXRlIGNo
YW5nZQ0KPiA+IHdoZW4gaW4gZGV2aWNlIG1vZGUuIEFuZCBwZXJoYXBzIHB1dHRpbmcgdGhlIGNv
bnRyb2xsZXIgaW4gaG9zdCBtb2RlDQo+ID4gcGFzc2VzIHRoZSBjb250cm9sIHRvIHhoY2kgYWxs
b3dpbmcgdGhlIGRyaXZlciB0byBwcm9wZXJseSBtYW5hZ2UgdGhlDQo+ID4gcG93ZXIgc3RhdGUg
cHJldmVudGluZyBQTUUgZnJvbSBnZW5lcmF0ZWQ/IEl0J3MgYSBsaXR0bGUgZGlmZmljdWx0IHRv
DQo+ID4gZGVidWcgd2l0aG91dCBtb3JlIGluZm8uDQo+IA0KPiBUaGF0IG1heSB3ZWxsIGJlIHdo
YXQncyBoYXBwZW5pbmcgLSBJIGJlbGlldmUgdGhlIGRyaXZlciBkb2VzIGluZGVlZA0KPiBkZWxl
Z2F0ZSB0byB4aGNpIHdoZW4gaW4gaG9zdCBtb2RlLg0KPiANCg0KVGhhdCdzIHByb2JhYmx5IG5v
dCB0aGUgY2FzZSBhcyBjbGFyaWZpZWQgYnkgR3VpbGhlcm1lLg0KDQo+IFdoYXQgaW5mb3JtYXRp
b24gY2FuIHdlIGdldCB0byB5b3UgdGhhdCB3b3VsZCBoZWxwIGdldCB0byB0aGUgYm90dG9tIG9m
DQo+IHRoaXM/DQo+IA0KDQpJJ3ZlIHNlbnQgc29tZSBxdWVzdGlvbnMgdG8gR3VpbGhlcm1lLg0K
DQpCUiwNClRoaW5o

