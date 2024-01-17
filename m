Return-Path: <linux-usb+bounces-5139-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B006F82FE04
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 01:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DFC51F25E22
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 00:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4F979D8;
	Wed, 17 Jan 2024 00:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GCcBhhx1";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="T0uB2Qnj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KTixSDQh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA85D79C2
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 00:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705451740; cv=fail; b=Ldmjdr2zv10cZybsJwPui5Qr0xN7Mdw+h+bC0fMUJr9ETSDS+cz9UJGMasApIeatA3QTJoFrEXWRiHMdx4rK7rDG+tMOgxPA5mfSU7qS/X0OBubdT4u78BsuBdn5YZaxDxl+Fdg/vNiopNKivw1RNeei05NgXUUgjByEZ9CjQ5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705451740; c=relaxed/simple;
	bh=eAEBLL/9MQQwrg4ac06BDGDs6ifdTZToLZwOTBjJD/g=;
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
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details; b=a36fzZ4gHVnfkIvdEw+nySZ2JL0uiFBczZxUPt6W661PYqlfwaO4RppKCksY/yZrDMmwE9yC3OR1xw7VP4+s3zK3Yxu+5aCrKfSNyWM7yWxv7yJ3JQKZH/kh7VlHi9V9sLJES7a/STPGejpDgr88FiVYBx+n8n+fndq+JpHXmpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GCcBhhx1; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=T0uB2Qnj; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KTixSDQh reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40GJSKJO013962;
	Tue, 16 Jan 2024 16:34:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=eAEBLL/9MQQwrg4ac06BDGDs6ifdTZToLZwOTBjJD/g=; b=
	GCcBhhx1f6GQusHCerR3BA20gJAqjqffuCRn5oftW/8Z94/7ZD9bZs+i/b5dVBLT
	tzJj5VjZm5LMI/P1Vh8AVUSzrU9zXQ0Vfkiu6J5UC04qjY12R3DY+QpvtXnKm8If
	PcDj4GZzbqXSA7tKtI/nXNHNVL0B4tEy1KWQdLVbUYFQwZNhIeTJWFyPejc+7VQ4
	KfqOQEtNWqxJcKMKqzJQXdDf/Na7Ig9FHiicpvXD4gW2c8RyG9HB9tfDAP/6y/RG
	2p4LJzjBXvSzs4rOXlNMgoGYzzT90p8scn117GQGroz0B5ZGREf9uOrXA2qhmD7x
	CebxX4pQkP5zs4HIaGScDw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vktdnf172-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 16:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1705451693; bh=eAEBLL/9MQQwrg4ac06BDGDs6ifdTZToLZwOTBjJD/g=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=T0uB2QnjhT7LqkF2Y5RO3wSBK5utepCAr62hRPAFCiyXjUEoe64yczGIlbkkOl3BL
	 OlZV1NPwN674ZNipZ5yqU7oeqRmB3a95L2UpwnllxwGw5CD21pbMMwgk36mAQ955UX
	 TjNXxRm6iYjAQYdHSXuegqXcjOv0B51E1Cj0cOpGEsYZecFnQMhE0ilv45QsOBAyl4
	 pz9o3c58C8RWueD0k2dn1rRhv26eCEukUM+xyKIPEDuiI3KPaHD/oy3vg7zO8VsG3o
	 11EZtXO3jrl+dh78hvawbrzWaz6mJKG/HNwGK2dQT6kd7ySYPUFB/X4YH9Lu6SVkoo
	 S6dDjadz0mnPg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AC8854012B;
	Wed, 17 Jan 2024 00:34:52 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 02CFFA0070;
	Wed, 17 Jan 2024 00:34:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=KTixSDQh;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id EA68940169;
	Wed, 17 Jan 2024 00:34:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hf6Vh7W6NioBIbFibmonxtlqpYzLtot7/Od6qCBhlad3sxp2uGUsTnGJHPPRscTPf6wnKaXmCPRCCmneDQ9YhSGB/edfu4IHZC8oS2JoL4rolpgy0SKn4zLvl3P/diufJa6IaEaiE01S8dJyphKfDCns16YA8mEv+nFPO4doE5N9gGzDyF53lKkG2OfF4Lkink6BtXlvBp3+jqv8lXzaj1fhaSX1hl4owKy7qZHZQPvrGndL25WQa6G7e5Vp5dSIZa+xW04Xj45zAkyBuKAOk1xcq0k5xZUDlTg2l4t3hzggGhoN4hI5UpKWK6RjlYUQ1Qu+rlN0h1VPMmJ3/JBSKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAEBLL/9MQQwrg4ac06BDGDs6ifdTZToLZwOTBjJD/g=;
 b=jvabViDpCcKSY9kpSDs5nZuXRLh7amLfYIloWJ30KUrp6l81t4HbykOkxZWBJkYheRoCtzBd97/5Xm/ujDZMEN/1WKgTFX5tw2Z1KlaZVEdhaTumGLa+dKgOG3ZK+zhoXQiZd7+KvnxZ86OhEpCCqJBADcGj7fTdL6l2SKGhpKRUMSr9zFOZs7wnpikvSQNQoD4TU91elA6dnX1lfHFbyOmYXrK1c1Fku3/SCFK33+fWUkKr+Hh72vO5y5CzVqYM93tW3wU4yPS33XA6etZ5At+aepEE/acu+Hmei3RAUFgFvtZ8tP3Yefu7oob2cugNa1jZhf1/ERumFQ3JSVMRKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAEBLL/9MQQwrg4ac06BDGDs6ifdTZToLZwOTBjJD/g=;
 b=KTixSDQhyi/QvCPh1sbbtUIaY5n238L9HZKmrstk/yVKr3SIS5tByUro3bTB2iTfeectXrwA2O10dHHQDuu81KQY1xWCKNbi8C3zJvFkjdhLdQQe03CtjW9W/ZKsoVXTgelioSu5jXwuMGSdz557W7mxNnRi1OhTI2GY3mDH5Gg=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Wed, 17 Jan
 2024 00:34:44 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3%3]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 00:34:43 +0000
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
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscAgAWsYQCAAIyKgA==
Date: Wed, 17 Jan 2024 00:34:43 +0000
Message-ID: <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
References: <20231122165931.443845-1-gpiccoli@igalia.com>
 <2dfbf5c9-dd38-c919-c604-618ad08ce456@igalia.com>
 <20231205012336.mn7b7f4zypwcyv6w@synopsys.com>
 <9efaed91-d246-cf3c-efc0-e866f88a943d@igalia.com>
 <d85a5507-4d4a-9e60-fbd1-68b42afb2143@igalia.com>
 <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
 <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
 <20240113013320.mrqqrdajrnw62kis@synopsys.com>
 <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
In-Reply-To: <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW6PR12MB7072:EE_
x-ms-office365-filtering-correlation-id: 86ed6626-5045-4bcb-301e-08dc16f419bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 8ZSV0pMKRRxxMUKKvD8EFbo8MutPPPoArOcAuLNm5XhbIe4iC+xZCzPyvj45+jJhXPESINWNJSYKSLNsDvXiWnqfeyLyiffjB32CFuHWoKJGD6r/TGEzZCsjWtk6pyl3uWwDTql5Xx35rDHqfw+AdZd2x0hAUuJRSbdWMcRSN674zp+tYB4d1+CcUSpB+wcl8l4bkiqpLV0+eGjIpFsjoyMMAOAD2bPO1Dk9E6/8El3j2E2Mjozjsw3ZfgVvL5I4rur4a5/5hJsufwIPOeqIxRhUCAQ8at215neIjjYXd3nhSG6SOVQrkiPdm1+dTY2jPoAWZOn31134n46DiKWujaPpdpmXJVVpZZWYcWZ6jPdL2j2qfZEozqrnWnfRW6zxgXdZgdwnXp/r5zwKliL6duG7+mAgsWFmGLxEmzCxjcHG3TIGEVqfJvcTrYzfhKadGqC3po5l2M/XrzqI1J1q4W7RQ9QJDdC4LwgdRmbyEqVi4Dto3IHClkEf+mdJ5FhI+j0RWd2AwKMwkMU67gt8gsdYQB7OyXWRAzabhSmuqVsBJEwd+7kSV0u4i4biZWcRe+uTWo21OW1FOHMBA7bBoNURy79q2pwsV4qsbK2P5qw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(136003)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(122000001)(38100700002)(83380400001)(38070700009)(36756003)(86362001)(66946007)(76116006)(91956017)(64756008)(66556008)(316002)(54906003)(66476007)(66446008)(2906002)(7416002)(8936002)(6916009)(4326008)(8676002)(5660300002)(2616005)(1076003)(26005)(71200400001)(6486002)(6506007)(478600001)(53546011)(6512007)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Tnk0QkRvZTE4MTdpaVJJbitmR1ErWUJ1Wm1WWTJFZVdCUWNoMW5sbHZmRU83?=
 =?utf-8?B?NGJNdWtMbkFOMk5WZ0pwSjRxUWZNTWpWc2MzNlFGUjNFdlV3R0JONHd5RW01?=
 =?utf-8?B?TlFYNm9jQ2VIaUVpMVpSZEFDY052ME1OUG8vb3EzTVVrZ3l5elNMalhZM095?=
 =?utf-8?B?a2t2aEp4NVIxcXg0ekFrR1Nib2JYZGlHdllmS0hCWit3emNGTTdXU1ZoOUI5?=
 =?utf-8?B?cWNzM0ZIRmV1YVV0TE5wYmRibUN4Z3BTdmVlOE9EQjkvT2pxaGVIbnkwRjJC?=
 =?utf-8?B?aDF5M3hRRmpvVTNqd2VCMGNNcFlGS2Z0Q3pJYVdJZmMwdXBUKzB5QjQ3MWp5?=
 =?utf-8?B?S244K0tRRmoyZU01REpYTlNvN1VrT01iMWtHU1h1T2t2VmlRMnZwNXZQKzIz?=
 =?utf-8?B?Q00xYmI1akVWVk43cTVqdW9vcEp3cUFNWUczaGE3c3NsSE9BWTV4RkI2NTEz?=
 =?utf-8?B?aGVnYkJnRlZUSEsva1JudDZScVZqSUlBcGVXS2E1dklrb2RQYk1TWnFJUkxS?=
 =?utf-8?B?NHlQN2thNmxoN0tKVXpQVm50NjZyZHhvVGRtNWw4U2RDQm5zbnQ5aE92LzU0?=
 =?utf-8?B?RmJveTNhRnpjcVZxZjdwandiVnU5QUNHcVUwRmxkOXgybDZ0ekkvTmNrdmp0?=
 =?utf-8?B?SjF5MEl6UWd4SHVHUk93R3c4bmhiMnBHMUxIdU5CVmVONllkL3FWNUQrTTcr?=
 =?utf-8?B?dENBeWtCekNRUm5vYVIveXlneDdoQkNjL3FLR3RLelRPM21ZNnpncHJwOGxw?=
 =?utf-8?B?QzJpMFNIcXpZNGpUeGJ1OG9JRmF2L2wxS3JnQm1aZ1hHSlkySU9rYy9DK01I?=
 =?utf-8?B?UUpScjl5cmxodkMzVWtDV2UyT0liSW1UZXdXZUlkSXpsRDVBaXdZZnZpd1VS?=
 =?utf-8?B?UkpwZVhWSlZHMXVxcmNzemdKQkp6N2dRL0RmNGdISElZWDNDdlZBZVpwLzdq?=
 =?utf-8?B?M1Y2NkpJL1E3ejk0Ykc5MldGMFBpWTZrNWt2d2orVnFpODhaK3VEZGVlYlYv?=
 =?utf-8?B?K0JTVjNZMlk4U1pvWDB0a0VsRUQ4Sk11ZmtDYVpCYzhqTFlYajVTTlZEQmU5?=
 =?utf-8?B?ZU5SaHorczFqcGdGeXJ5cTlFQmF4cWI5Qy9aeEU1bmRMOGVySVh4cW1UeHVz?=
 =?utf-8?B?cXZRNkZkbFFkSG9uSldjbUZyYWgrek1LNFExa0FqK25CbWczd2NUNm9IbVI4?=
 =?utf-8?B?VHFaUDE4NlNDM1pNeXdGNjlIQVVpbW54SzJEMTB5MDhPVmhnNW9RR3JUZmpV?=
 =?utf-8?B?VUQ2SUZjUnVlQzRmZ2xDRzlqemRlWlRDejVkSWVLZFNmWXZIMjZqT3p0TkJl?=
 =?utf-8?B?YnNDOUpXZzJWeVdRU3YyQlBQdzJGekIzZTR2U29PVUVTa2F3ZXhzVzJpRnUy?=
 =?utf-8?B?K05wZzZURkMzYlB5T3BuNUh4aHdMakFlcHpEbjRPNjhZNkxWV0VCUTZmWE5W?=
 =?utf-8?B?YTBWK2NSQXhWbjlKQkp1MHZBdDFxWnh4N2hEamlLUlA2R2tEZFlBOXcyajFz?=
 =?utf-8?B?K1E3WDlPUWtuUkUrbXZ4RUdsRW9TYnJXR3A4Y2s5Sjd5TWorTjYycnd2T3ZH?=
 =?utf-8?B?QVdSdWJBTEpuK05YWjU4YU85eTU5R25oMjZTSVVySDFqbjYvVXhDWmJ0TWhM?=
 =?utf-8?B?TWNkdWk5aFNUQStCZ1FlRkF1VlRtNUo4SnQ2T1hjU0RGdzdIMlc1YlNxMnkr?=
 =?utf-8?B?eGlJeE1SdUp5b2l3NzdjcUcvdGY1S04xeXdDRGxZeDhHQkZLQWJkMDVnSjE2?=
 =?utf-8?B?ZWZ0WmVralRUMXVYU0N4ZW1sY3EwT2ZpR0FJMDU1Zy8zQUtLMlo5SHFCNDVJ?=
 =?utf-8?B?R0lGV3hQOHZocnljdkRWL0dmOEZUR0pDK0dwREVkaVlkc3l0bUV5V0FrTUFR?=
 =?utf-8?B?YjFRYlQySUkzSWN1VkxMZTRkdjJ4ZlJqa3RFa1A3b1BHSFVBV2IybnFVVnlM?=
 =?utf-8?B?MlZIOFBPYms1OHhST0tjaEhuMGo5WHAxQTVocGNNSTljWExKVmEyWFJsZTVH?=
 =?utf-8?B?YzdVaVFHSUoxdFAwZVdORW9lUTBXQTJDQUxKOHRPVHJITU5yVVg1amN6OHJT?=
 =?utf-8?B?VGtranR4S0tQaXd2emdIVkp3Vm9zSSt4YlM4Z3A0eENqUy9nemlQSy9qdFBC?=
 =?utf-8?Q?Rxhp+WS7FQ71VFaFjCQ1bu4rl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C41EB6D6EDC3342A1BE4C2AA0AC054A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	UlQpSb4uDzIBfPVYXP+ltebz6w3sqvLFbBp+U4KXKBz4pkUy6NzI5khE6HFP1j1MWrvP8UR5W4tbhw2rCsHhT8nCUFj6gCKnClNS0E8XV7aQMfNx843HidoI46yGsNdI7UWzI9gAH8fAHFcP01BDFtORBLM9n4zvptTHNLzEhUvE3UUA0a2/0jLdcm0/GYAlusP69mcSNcuKvQlq5zjwO0lT/564N/2yb9j7PjDpiarQu2PPe208jlKfndsHT8ex35hii6l1U7R2QIxdJxKXh2z7AmYDsLz8I+6g6NsARKHmCQwleKyDrDeFz+wKPOl0nmixVaE8qJx86Zq00neuGej8pY3iDAkwrskQ1gyr9ZaTHFZJko6Qvn2u7hVskuVWXF4UzxnWG0GviyOBtTG98m+GTaCNUh7DKfewZQnwuZ/HWvPvnIUInWxE0FHhajDT21s5YhdIxmUuYSp9c7a1aTxu8+EAvHz642RoDheMRxJxvMGoAa9rGBtRHvqIb6R8XwI2z3jRuT/Iy3RVO+H3IZuJE8NXIV0H5iiQDX3nfh46L64frYI7RySV789+0l5a6ltwe1hT2FIzw7EWDxHVDoEZXrQaaIPSonrNBLs3nBIt9Iff6jMhf5ST+u+ZX81LmEHPPJBVgaycZzhRl3HGfg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ed6626-5045-4bcb-301e-08dc16f419bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2024 00:34:43.8697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ai7rpS+9T/1JXJSxPRMPS/dzIz1IpoS2TXp9i6/TdP9QRFBLe+xmNmLAcrtLjeBuTOUVU29hhTXga9V881KhQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072
X-Proofpoint-GUID: S30RxC1oIUUMOkMR7jZrWSTl2Dj6KTj2
X-Proofpoint-ORIG-GUID: S30RxC1oIUUMOkMR7jZrWSTl2Dj6KTj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-16_14,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=902 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401170002

T24gVHVlLCBKYW4gMTYsIDIwMjQsIEd1aWxoZXJtZSBHLiBQaWNjb2xpIHdyb3RlOg0KPiBPbiAx
Mi8wMS8yMDI0IDIyOjMzLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gWy4uLl0NCj4gPj4gWWVz
LCBEUkQgaW5kZWVkIC0gYnV0IGl0J3MgdGhlICoqUENJIFBNRSBpbnRlcnJ1cHQqKiAgdGhhdCB1
c2VzIE1TSSwgbm90DQo+ID4+IHRoZSBVU0IgUENJIGRldmljZS4gSGVyZSBpcyBhbiBvdXRwdXQg
b2YgbHNwY2k6DQo+ID4+DQo+ID4+ICQgbHNwY2kgLXZrbm5zIDA0OjAwLjMNCj4gPj4gMDQ6MDAu
MyBVU0IgY29udHJvbGxlciBbMGMwM106IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gW0FN
RF0NCj4gPj4gVmFuR29naCBVU0IwIFsxMDIyOjE2M2FdIChwcm9nLWlmIGZlIFtVU0IgRGV2aWNl
XSkNCj4gPj4gICAgICAgICBTdWJzeXN0ZW06IFZhbHZlIFNvZnR3YXJlIFZhbkdvZ2ggVVNCMCBb
MWU0NDoxNzc2XQ0KPiA+PiAgICAgICAgIEZsYWdzOiBidXMgbWFzdGVyLCBmYXN0IGRldnNlbCwg
bGF0ZW5jeSAwLCBJUlEgMjYNCj4gPj4gICAgICAgICBNZW1vcnkgYXQgODAwMDAwMDAgKDY0LWJp
dCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9MU1dDQo+ID4+ICAgICAgICAgQ2FwYWJpbGl0aWVz
OiBbNDhdIFZlbmRvciBTcGVjaWZpYyBJbmZvcm1hdGlvbjogTGVuPTA4IDw/Pg0KPiA+PiAgICAg
ICAgIENhcGFiaWxpdGllczogWzUwXSBQb3dlciBNYW5hZ2VtZW50IHZlcnNpb24gMw0KPiA+PiAg
ICAgICAgIENhcGFiaWxpdGllczogWzY0XSBFeHByZXNzIEVuZHBvaW50LCBNU0kgMDANCj4gPj4g
ICAgICAgICBDYXBhYmlsaXRpZXM6IFthMF0gTVNJOiBFbmFibGUtIENvdW50PTEvOCBNYXNrYWJs
ZS0gNjRiaXQrDQo+ID4+ICAgICAgICAgQ2FwYWJpbGl0aWVzOiBbYzBdIE1TSS1YOiBFbmFibGUt
IENvdW50PTggTWFza2VkLQ0KPiA+IA0KPiA+IEFyZSB5b3Ugc2hvd2luZyBNU0kgZW5hYmxlZD8g
VGhhdCBsb29rcyBsaWtlIE1TSSBpcyBkaXNhYmxlZC4NCj4gPiANCj4gPj4gICAgICAgICBDYXBh
YmlsaXRpZXM6IFsxMDBdIFZlbmRvciBTcGVjaWZpYyBJbmZvcm1hdGlvbjogSUQ9MDAwMSBSZXY9
MQ0KPiA+PiBMZW49MDEwIDw/Pg0KPiA+PiAgICAgICAgIEtlcm5lbCBkcml2ZXIgaW4gdXNlOiBk
d2MzLXBjaQ0KPiA+PiAgICAgICAgIEtlcm5lbCBtb2R1bGVzOiBkd2MzX3BjaQ0KPiA+Pg0KPiA+
PiBOb3csIEkgKipndWVzcyoqIHRoaXMgaXMgZXhwZWN0ZWQsIGJ1dCB0aGVyZSBpcyBhIGRpZmZl
cmVuY2UgaW4NCj4gPj4gL3Byb2MvaW50ZXJydXB0IGJldHdlZW4gZGV2aWNlIGFuZCBob3N0IG1v
ZGU6DQo+ID4+DQo+ID4+ICQgZ3JlcCAyNjogL3Byb2MvaW50ZXJydXB0cyB8IHRyIC1zIFwgICMg
ZGV2aWNlIG1vZGUNCj4gPj4gW2VtcHR5XQ0KPiA+Pg0KPiA+PiAkIGdyZXAgMjY6IC9wcm9jL2lu
dGVycnVwdHMgfCB0ciAtcyBcICAjIGhvc3QgbW9kZQ0KPiA+PiAgMjY6IDAgMCAwIDAgMCAwIDAg
MCBJTy1BUElDIDI1LWZhc3Rlb2kgeGhjaS1oY2Q6dXNiMw0KPiA+IA0KPiA+IExvb2tzIGxpa2Ug
aXQncyBsZXZlbCBpbnRlcnJ1cHQgaGVyZS4gSSBkb24ndCBzZWUgImVkZ2UiIG9yIE1TSQ0KPiA+
IGludGVycnVwdC4gSXMgdGhlIHBjaWVfcG1lIHNoYXJlIHRoZSBzYW1lIGludGVycnVwdCBsaW5l
IGFzIHRoZSB1c2INCj4gPiBjb250cm9sbGVyPw0KPiA+IA0KPiANCj4gSGkgVGhpbmgsIHRoYW5r
cyBhZ2FpbiBmb3IgeW91ciBvYnNlcnZhdGlvbnMuDQo+IA0KPiBTbywgdGhlIFVTQiBkZXZpY2Ug
aW50ZXJydXB0IGlzICpsZXZlbCogdHJpZ2dlcmVkLCBubyBNU0kgaW52b2x2ZWQNCj4gaW5kZWVk
LCB5b3UgcG9pbnRlZCBpbiB0aGUgYWJvdmUgbHNwY2kgb3V0cHV0Lg0KPiANCj4gSG93ZXZlciwg
dGhlICpQTUUgUENJZSBpbnRlcnJ1cHQgaXMgTVNJKiBieSBkZWZhdWx0LiBBbmQgd2UgY2FuIHNo
aWZ0DQo+IHRoYXQgdG8gbGV2ZWwgdGhyb3VnaCBhIGtlcm5lbCBwYXJhbWV0ZXIgKCJwY2llX3Bt
ZT1ub21zaSIpLCB0aGUgbmV0DQo+IGVmZmVjdCBpcyB0aGUgc2FtZSwgaS5lLiwgaXNzdWUgaXMg
c3RpbGwgcHJlc2VudC4gSSdsbCBwYXN0ZSBoZXJlIHRoZQ0KPiBsc3BjaSBvZiB0aGUgUENJIGJy
aWRnZSBkZXZpY2UgdGhhdCB0cmlnZ2VycyB0aGUgd2FrZXVwOg0KPiANCj4gJCBjYXQgL3N5cy9w
b3dlci9wbV93YWtldXBfaXJxDQo+IDI4DQoNCk9rLiBZb3UncmUgcmVmZXJyaW5nIHRvIHRoZSBz
eXN0ZW0gUE1FIGhlcmUgYW5kIG5vdCBmcm9tIHRoZQ0KY29udHJvbGxlcidzIFBNVS4gVGhlbiB0
aGUgcXVlc3Rpb24gcmVsYXRlZCB0byBoaWJlcm5hdGlvbiBpcw0KaXJyZWxldmFudC4gSSB1bmRl
cnN0YW5kIHRoZSBwcm9ibGVtIGJldHRlciBub3cuDQoNCj4gDQo+IA0KPiAkIGNhdCAvcHJvYy9p
bnRlcnJ1cHRzIHxncmVwIC13IDI4OiB8IHRyIC1zIFwNCj4gMjg6IDAgMCAxIDAgMCAwIDAgMCBQ
Q0ktTVNJLTAwMDA6MDA6MDguMSAwLWVkZ2UgUENJZSBQTUUgWzBdDQo+IA0KPiANCj4gJCBsc3Bj
aSAta25udnMgMDAwMDowMDowOC4xDQo+IDAwOjA4LjEgUENJIGJyaWRnZSBbMDYwNF06IEFkdmFu
Y2VkIE1pY3JvIERldmljZXMsIEluYy4gW0FNRF0gVmFuR29naA0KPiBJbnRlcm5hbCBQQ0llIEdQ
UCBCcmlkZ2UgdG8gQnVzIFsxMDIyOjE2NDhdIChwcm9nLWlmIDAwIFtOb3JtYWwgZGVjb2RlXSkN
Cj4gICAgICAgICBTdWJzeXN0ZW06IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gW0FNRF0g
VmFuR29naCBJbnRlcm5hbA0KPiBQQ0llIEdQUCBCcmlkZ2UgdG8gQnVzIFsxMDIyOjE2NDhdDQo+
ICAgICAgICAgRmxhZ3M6IGJ1cyBtYXN0ZXIsIGZhc3QgZGV2c2VsLCBsYXRlbmN5IDAsIElSUSAy
OA0KPiAgICAgICAgIEJ1czogcHJpbWFyeT0wMCwgc2Vjb25kYXJ5PTA0LCBzdWJvcmRpbmF0ZT0w
NCwgc2VjLWxhdGVuY3k9MA0KPiAgICAgICAgIEkvTyBiZWhpbmQgYnJpZGdlOiAxMDAwLTFmZmYg
W3NpemU9NEtdIFsxNi1iaXRdDQo+ICAgICAgICAgTWVtb3J5IGJlaGluZCBicmlkZ2U6IDgwMDAw
MDAwLTgwM2ZmZmZmIFtzaXplPTRNXSBbMzItYml0XQ0KPiAgICAgICAgIFByZWZldGNoYWJsZSBt
ZW1vcnkgYmVoaW5kIGJyaWRnZTogZjhlMDAwMDAwMC1mOGYwMWZmZmZmDQo+IFtzaXplPTI1OE1d
IFszMi1iaXRdDQo+ICAgICAgICAgQ2FwYWJpbGl0aWVzOiBbNTBdIFBvd2VyIE1hbmFnZW1lbnQg
dmVyc2lvbiAzDQo+ICAgICAgICAgQ2FwYWJpbGl0aWVzOiBbNThdIEV4cHJlc3MgUm9vdCBQb3J0
IChTbG90LSksIE1TSSAwMA0KPiAgICAgICAgIENhcGFiaWxpdGllczogW2EwXSBNU0k6IEVuYWJs
ZSsgQ291bnQ9MS8xIE1hc2thYmxlLSA2NGJpdCsNCj4gICAgICAgICBDYXBhYmlsaXRpZXM6IFtj
MF0gU3Vic3lzdGVtOiBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuIFtBTURdDQo+IFZhbkdv
Z2ggSW50ZXJuYWwgUENJZSBHUFAgQnJpZGdlIHRvIEJ1cyBbMTAyMjoxNjQ4XQ0KPiAgICAgICAg
IENhcGFiaWxpdGllczogWzEwMF0gVmVuZG9yIFNwZWNpZmljIEluZm9ybWF0aW9uOiBJRD0wMDAx
IFJldj0xDQo+IExlbj0wMTAgPD8+DQo+ICAgICAgICAgQ2FwYWJpbGl0aWVzOiBbMjcwXSBTZWNv
bmRhcnkgUENJIEV4cHJlc3MNCj4gICAgICAgICBDYXBhYmlsaXRpZXM6IFs0MDBdIERhdGEgTGlu
ayBGZWF0dXJlIDw/Pg0KPiAgICAgICAgIENhcGFiaWxpdGllczogWzQxMF0gUGh5c2ljYWwgTGF5
ZXIgMTYuMCBHVC9zIDw/Pg0KPiAgICAgICAgIENhcGFiaWxpdGllczogWzQ0MF0gTGFuZSBNYXJn
aW5pbmcgYXQgdGhlIFJlY2VpdmVyIDw/Pg0KPiAgICAgICAgIEtlcm5lbCBkcml2ZXIgaW4gdXNl
OiBwY2llcG9ydA0KPiANCj4gDQo+IFswXSBUaGUgL3Byb2MvaW50ZXJydXB0cyBpbmNyZWFzZXMg
YnkgMSBhdCBldmVyeSB3YWtldXAgYXR0ZW1wdCB3aGVuIGluDQo+IE1TSSBtb2RlLiBObyBpbmNy
ZWFzZSBoYXBwZW5zIGlmIGluIGxldmVsIG1vZGUuDQo+IA0KPiANCj4gQW5vdGhlciBvdXRwdXQg
dGhhdCBjb3VsZCBiZSBoZWxwZnVsIHRvIHVuZGVyc3RhbmQgdGhlIFBDSSB0b3BvbG9neSBpcw0K
PiB0aGUgbHNwY2kgLXQsIEkgaGF2ZSBhIHBhc3RlYmluIGZvciB0aGF0IChhbHNvIGF0dGFjaGVk
IGhlcmUpOg0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly90ZXJtYmluLmNv
bS9kY2NqX187ISFBNEYyUjlHX3BnIVo1aGYyX2ZUWk1IazQycWQ0RmIyMm1qSGdGSnVGV1F6N2l6
LUxndXJOMzhYNUpHMHprOWdkeW9aYjBRbnFFMmVLc2Noa2VLdDJlUlRDSWpTdjlLdXRRJCANCj4g
DQo+IA0KPiA+IEknbSBub3Qgc3VyZSBob3cgdGhlIFNURUFNIERFQ0sgaXMgZGVzaWduZWQuIERv
ZXMgdGhlIE9PVCBkcml2ZXIgbWFuYWdlcw0KPiA+IHRoZSBwb3dlciBzdGF0ZSByZXF1ZXN0IG91
dHNpZGUgb2YgdGhlIFBDSSBQTSBmb3IgZGV2aWNlIG1vZGUgYW5kIG5vdA0KPiA+IGp1c3QgcmVh
ZGluZyB0aGUgcG9ydCBzdGF0ZT8gSWYgdGhhdCdzIHRoZSBjYXNlLCB0aGUgaXNzdWUgY291bGQg
YmUgaW4NCj4gPiB0aGUgT09UIGRyaXZlcj8NCj4gDQo+IElmIHlvdSB3YW50IHRvIHRha2UgYSBs
b29rIGluIGhvdyB0aGUgT09UIGRyaXZlciBzd2l0Y2hlcyB0aGUgZHdjMyBtb2RlDQo+IGJldHdl
ZW4gZGV2aWNlL2hvc3QsIGhlcmUgaXMgdGhlIGNvZGU6DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjIwMjA2MDIyMDIzLjM3NjE0
Mi0xLWFuZHJldy5zbWlybm92QGdtYWlsLmNvbS9fXzshIUE0RjJSOUdfcGchWjVoZjJfZlRaTUhr
NDJxZDRGYjIybWpIZ0ZKdUZXUXo3aXotTGd1ck4zOFg1Skcwems5Z2R5b1piMFFucUUyZUtzY2hr
ZUt0MmVSVENJZ19mbThETVEkIA0KPiANCj4gSW4gZmFjdCwgdGhpcyB3YXMgc3BsaXQgaW4gYSBz
aW5nbGUgc21hbGwgZXh0Y29uIGRyaXZlciBpbiB0aGUgVmFsdmUNCj4gdHJlZSwgYnV0IHRoZSBj
b2RlIGlzIHRoZSBzYW1lIGFzIGFib3ZlLCB0YWtlIGEgbG9vayBzcGVjaWFsbHkgaW4gdGhlDQo+
IGZ1bmN0aW9ucyBzdGVhbWRlY2tfbm90aWZ5KCkgYW5kIHN0ZWFtZGVja191c2Jfcm9sZV93b3Jr
KCkuDQo+IA0KPiBOb3RpY2UgKmFsbCogbXkgdGVzdHMgYXJlIHdpdGggbWFpbmxpbmUgKDYuNy1y
YzYrKSBhbmQgKndpdGhvdXQqIHRoaXMNCj4gT09UIGRyaXZlciwgc28gSSdtIG5vdCBzdXJlIGhv
dyBjb3VsZCBpdCBiZSByZWxhdGVkLi4udGhlIE9PVCBqdXN0DQo+IHJlbGllcyBvbiBBQ1BJIG1l
c3NhZ2VzIHRvIHN3aXRjaCBhdXRvbWF0aWNhbGx5IGJldHdlZW4gaG9zdC9kZXZpY2UNCj4gbW9k
ZSwgYW5kIGluIG15IHRlc3RzLCBJJ20gZG9pbmcgdGhpcyBtYW51YWxseS4NCj4gDQo+IA0KPiA+
IFsuLi5dDQo+ID4+IFRoZXJlIHdhcyBubyBoaWJlcm5hdGlvbiAoUzQgc3RhdGUpIGludm9sdmVk
LCBqdXN0IHRvIGNsYXJpZnkgLSBpdCdzIGENCj4gPj4gbWVtX3NsZWVwIC9zdXNwZW5kIHRvIFJB
TSBvcGVyYXRpb24sIHVzdWFsbHkgY2FsbGVkIGRlZXAgc2xlZXAgLyBTMy4gQW5kDQo+ID4+IGlu
ZGVlZCwgdGhlIFBNRSBzZWVtcyB0byBiZSBnZW5lcmF0ZWQgYW5kIHByZXZlbnRzIHRoZSBtZW1f
c2xlZXAgKG9yIGl0DQo+ID4+IGRvZXMgc2xlZXAgYnV0IGluc3RhbnRseSB3YWtlcy11cCwgd2hp
Y2ggaXMgdGhlIGNhc2Ugd2l0aCBsZXZlbCBpbnRlcnJ1cHRzKS4NCj4gPiANCj4gPiBJIHdhcyBy
ZWZlcnJpbmcgdG8gdGhlIGNvbnRyb2xsZXIgaGliZXJuYXRpb24gYW5kIG5vdCBzeXN0ZW0NCj4g
PiBoaWJlcm5hdGlvbi4gUzMgd2lsbCBjYXVzZSB0aGUgeGhjaSBkcml2ZXIgdG8gcHV0IHRoZSBo
b3N0IGNvbnRyb2xsZXIgdG8NCj4gPiBnbyBpbnRvIGhpYmVybmF0aW9uIGFuZCBzZW5kIGEgcG93
ZXIgc3RhdGUgY2hhbmdlIHJlcXVlc3QgdGhyb3VnaCBQQ0kNCj4gPiBQTS4gVXN1YWxseSB0aGUg
cG93ZXIgc3RhdGUgY2hhbmdlIHdvdWxkIHB1dCB0aGUgY29yZSBpbiBEMyBhbmQgcGFzc2VzDQo+
ID4gdGhlIGNvbnRyb2wgdG8gdGhlIFBNVSwgYW5kIFBNRSBnZW5lcmF0aW9uIGNhbiBoYXBwZW4g
dGhlbi4gU2ltaWxhcg0KPiA+IGJlaGF2aW9yIGFwcGxpZXMgdG8gZGV2aWNlIG1vZGUsIGJ1dCB0
aGUgcG93ZXIgc3RhdGUgY2hhbmdlIG1heSBiZSB0aWVkDQo+ID4gdG8gYSBkaWZmZXJlbnQgaW50
ZXJmYWNlIHRoYW4gUENJIFBNPw0KPiA+IA0KPiA+IFBlcmhhcHMgeW91J3JlIG1pc3NpbmcgdGhl
IGxvZ2ljL2Zsb3cgdG8gdXBkYXRlIHRoZSBwb3dlciBzdGF0ZSBjaGFuZ2UNCj4gPiB3aGVuIGlu
IGRldmljZSBtb2RlLiBBbmQgcGVyaGFwcyBwdXR0aW5nIHRoZSBjb250cm9sbGVyIGluIGhvc3Qg
bW9kZQ0KPiA+IHBhc3NlcyB0aGUgY29udHJvbCB0byB4aGNpIGFsbG93aW5nIHRoZSBkcml2ZXIg
dG8gcHJvcGVybHkgbWFuYWdlIHRoZQ0KPiA+IHBvd2VyIHN0YXRlIHByZXZlbnRpbmcgUE1FIGZy
b20gZ2VuZXJhdGVkPyBJdCdzIGEgbGl0dGxlIGRpZmZpY3VsdCB0bw0KPiA+IGRlYnVnIHdpdGhv
dXQgbW9yZSBpbmZvLg0KPiA+PiBEaWQgeW91IHNlZWsgaGVscCBmcm9tIHRoZSB2ZW5kb3I/DQo+
IA0KPiBUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0aW9uIGFib3V0IHRoZSBoaWJlcm5hdGlvbiBj
b25jZXB0IQ0KPiANCj4gInBlcmhhcHMgcHV0dGluZyB0aGUgY29udHJvbGxlciBpbiBob3N0IG1v
ZGUgcGFzc2VzIHRoZSBjb250cm9sIHRvIHhoY2kiDQo+IDwtIHRoaXMgaXMgdHJ1ZSBpZiB3ZSAq
bWFudWFsbHkqIHNldCB0aGUgZGV2aWNlIHRvIGhvc3QgbW9kZSBpbiBkZWJ1Z2ZzDQo+IC0geGhj
aV9oY2QgdGFrZXMgY29udHJvbCwgYW5kIGFsbCB3b3JrcyBmaW5lLg0KPiANCj4gQnV0IGl0IGlz
ICpub3QgdGhlIGNhc2UqIHdpdGggdGhlIHF1aXJrIC0gd2UganVzdCB3cml0ZSB0byB0aGF0IHJl
Z2lzdGVyDQo+IGluIHRoZSBsYXN0IHN0ZXAgb2YgZHdjMyBzdXNwZW5kLiBGb3IgZXhhbXBsZSwg
SSBqdXN0IHRyaWVkIGhlcmUgd2l0aCBubw0KPiB4aGNpIG1vZHVsZSBhdmFpbGFibGUsIHdpdGgg
ZHdjMyBpbiBkZXZpY2UgbW9kZSAtIGFuZCBzdXNwZW5kIHdvcmtzIGZpbmUNCj4gX3dpdGggdGhl
IHF1aXJrXy4NCj4gDQo+IFdvdWxkIGJlIHZlcnkgaW50ZXJlc3RpbmcgdG8gaGF2ZSB0aGUgZGF0
YXNoZWV0IG9mIHRoaXMgZGV2aWNlIGluIGhhbmRzDQo+IHRvIGRldGVybWluZSB3aGF0IHRoaXMg
d3JpdGUgZG9lcyBpbiB0aGUgY29udHJvbGxlciBleGFjdGx5LCBidXQgSSBoYXZlDQo+IG5vIGFj
Y2VzcyB0byBpdC4gVGhhdCB3b3VsZCBsaWtlbHkgZXhwbGFpbiBhIGxvdCBhYm91dCB3aHkgdGhl
IHF1aXJrIHdvcmtzLg0KPiANCj4gUmVnYXJkaW5nIEhXIHZlbmRvciBzdXBwb3J0LCBhcyBWaXZl
ayBzYWlkLCB0aGV5J3JlIGxvb3BlZCBpdCBzZWVtcywgYnV0DQo+IG15IGdvYWwgd2l0aCB0aGUg
cXVpcmsgKHRoYXQgSSd2ZSBub3cgcmVzdHJpY3RlZCB0byB0aGlzIHNwZWNpZmljIGRldmljZQ0K
PiBhbmQgd2lsbCByZXN1Ym1pdCkgaXMgdG8gdW5ibG9jayB0aGUgdXNhZ2Ugb2YgRFJEIGluIHRo
ZSBTdGVhbSBEZWNrIGZvcg0KPiB0aGUgdXNlcnMgaW4gdGhlIHNob3J0LXRlcm0uDQo+IA0KDQpJ
dCB3b3VsZCBiZSBiZXR0ZXIgdG8gc2VlIGlmIHdlIGNhbiByb290IGNhdXNlIHRoZSBwcm9ibGVt
IGZpcnN0LiBXZQ0Kc2hvdWxkIGF2b2lkIHRlbXBvcmFyeSBzb2x1dGlvbiBpZiB3ZSBjYW4uIE9u
Y2UgYSBxdWlyayBpcyBpbnRyb2R1Y2VkLA0KaXQncyBjaGFsbGVuZ2luZyB0byByZW1vdmUgdGhl
IHF1aXJrLg0KDQpQbGVhc2UgY29uZmlybSB0aGF0IHRoZSBTVEVBTSBERUNLIGlzIHNvZnQtZGlz
Y29ubmVjdGVkIHdoZW4geW91IHB1dCBpdA0KaW4gc3VzcGVuZC4gVGhhdCdzIHRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIG9mIHRoZSBkd2MzLiBJZiBub3QsIHRoZW4NCml0J3MgcG9zc2libGUg
dGhlIGFjdGl2aXR5IG92ZXIgdGhlIHdpcmUgY2FuIHdha2UgdXAgdGhlIFNURUFNIERFQ0sNCnNp
bmNlIHRoZSBjb250cm9sbGVyIGlzIHN0aWxsIGFjdGl2ZS4NCg0KSWYgaXQgaXMgc29mdC1kaXNj
b25uZWN0ZWQsIGJ1dCB0aGUgUE1FIGlzIHN0aWxsIGdlbmVyYXRlZCBhZnRlciBzeXN0ZW0NCnN1
c3BlbmQsIGNhbiB5b3UgY2hlY2sgaWYgdGhhdCdzIGFsc28gdGhlIGNhc2Ugd2hlbiBwaHlzaWNh
bGx5DQpkaXNjb25uZWN0ZWQ/DQoNClRoYW5rcywNClRoaW5o

