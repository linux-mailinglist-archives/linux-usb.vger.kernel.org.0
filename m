Return-Path: <linux-usb+bounces-5902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCAC84AC72
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 03:54:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EB1B1F25297
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 02:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50C4E6EB69;
	Tue,  6 Feb 2024 02:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="t8sZCIdu";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bPJxy03h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="opGFC7rW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41BC4F8A9
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 02:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707188062; cv=fail; b=PEmqUGnaVJOp2B5b/b7pB0HfKGofXkyezRwFLnz2a/YwmyCw1LmJIBHsWa1eOuRXiIKwV8YJWmKT7sF0Dqbwt3LqzG73tYm61+kffa8RGRJqRGVU5s+T8nt0hLVphv+xneWG2i1DF2VIHS0lu+somhLiGNAnc00hXq0WNEBNBDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707188062; c=relaxed/simple;
	bh=SCW250FFjAXCsvqq5mAODBY7SxqZD45VwxteNuK5x+0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZCStzXDL64fi8cF86GJ94c0N7dtSKtZ8QfAFIUwyvbEfp8cjDG6uA8f3jKnwb1FWjVWcly43S6DQLoqy4fAtof05ozs66xy3vBPG4AYxrs347NIXiDH2YMQf9KfVlwlhyR78aWiHvRIMETO26GwUkMQc7wH2pomQYgcisj/mJaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=t8sZCIdu; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bPJxy03h; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=opGFC7rW reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 415KYKeg019771;
	Mon, 5 Feb 2024 18:53:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=SCW250FFjAXCsvqq5mAODBY7SxqZD45VwxteNuK5x+0=; b=
	t8sZCIduYZ6FpD3vgjgUsFtq8V4M151QcMbG8rqA6UYNCIcV0FptdjMRMTpCjixV
	vPXrVtMRberO0/TCVMPYrpMj+WldCy5H4eW52o+jn3Zkxco9cRSVEBc3b5wdjfHJ
	5wfJsKbmVe3OnJO8VPNdGGxT6zTssHy+KZ3S4lEz/OyfcVWL650RtDGu1W/zGkir
	8yC1sZwrAjropNnFjRnXf+b20J1H8+Dr3nuRTs/ol0GYdcObKBPJcQvGYZLtpp+l
	0RkWCFFYcMKFIX7NlcQ/mE8cDv0k4BUOHk4d4BbKAFHAZOs6AyKFqA4wlkJZaQ76
	2ema+7LBstmE5T8nHW4HBw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3w1n0g99dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 18:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1707188015; bh=SCW250FFjAXCsvqq5mAODBY7SxqZD45VwxteNuK5x+0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bPJxy03hug0oYBopTwfZAnMMDiZeLgcbXunSEKEpJxbH3cFOcM2t3RgQa1fBk477J
	 uD8at4FBbZdufetdQ6iqRnBbLml3TfRBmBCvu+vo+cf9tYe3F/FhsEsU1nhOggRpER
	 82a8bZVusDxLCyfGkLChebsHCXOyQ9rIgTM8ynHqSXMYGfOrzbUndtBNHZQ/cqnvN3
	 lsYgvjSNGKc/ZMkDVbrCPSkK/EahNNL0WajKNGv5xT7t9b0s26A8suhS1kAfAtw3w/
	 NlkFenKBVwFFRe4gzoRUKhkh32glLoPG7eB8qDZ7pc8keayZCRSxTVPSP6vnqVNPir
	 z7DBt37dPdc1w==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1913440453;
	Tue,  6 Feb 2024 02:53:32 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E89EDA0087;
	Tue,  6 Feb 2024 02:53:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=opGFC7rW;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 08B08401C4;
	Tue,  6 Feb 2024 02:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISyhSgGhAwqtmqA1lu8Oo/Plfa8Ab9r9cHlKYgEJi52Gq+dJehlX+UkHo3wpYFtamUfr7s5SezkjFeEfDsTAn+uG6ehg8Bf7Uu4+BTP79KsbbC4HmDZoGC1xrROMwjwanyQQmk0JivkKTG53dDDMGh4k4tmqrRJYPwsHOlMG/MJHgQhHGmd/nZ6K8Zoc9IKL7fLyAVQGWjsz52y7pSHV8HxBxrwZpWSd1FeMKkasq6O2vEgDU/CgjdhRYCYHsuZDWzY7UJtoq8ughEZrLmaZCARfbp0sXh4ViLkbpeef/L/CCrHfyjSGhRy1XDOQ24bFZCMLyICEYo+7HmtTN4TjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCW250FFjAXCsvqq5mAODBY7SxqZD45VwxteNuK5x+0=;
 b=QAiLh2KHUwCE7gzBDcfzuqcjfazc2F/UWwAUEFGU+Oc6Vq87JRJV8X7/uEi7RTtuhnr3XOjhfOHmlmmzmaW7G5r69TKM0DJfAk4x2y5QhzRJtzb6vmWkJ5S7lmQgBoj6ij52/v97q/V53R71ddWXt0tD28f+clNJzQq+bC5V7cmHQuSXBeTujkXz4/lZMPmXZzWJS/Z3PHe7TYfi/NSu3sfGcB8+77vjB0hRi0f8cyYhkSJfwU4i7ZzIR0kv7rFPCXynmtAZ1A8kgcWStRneO9snM0Oc/CmOb9CFXSuyaophKAT9yWx+MTePuUR/gOLo17XBka7eRIgVkvmb/1+rSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCW250FFjAXCsvqq5mAODBY7SxqZD45VwxteNuK5x+0=;
 b=opGFC7rWrP7+8eZkTAfNNEDZyF6sDZuhCP4np03oP0wCNTJMjs+ZcY6SOfZR2vjh7ZGyp7FeRPmqtA4WS+3hgKefqObbhiBRAlanvTcUfl0I43MkhwfU/YYEhtL2AlkwRtePXHx0cIOfqdkyi8HDDsLoFMhKhIXqiX4PBSebPV0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ1PR12MB6147.namprd12.prod.outlook.com (2603:10b6:a03:45a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.11; Tue, 6 Feb
 2024 02:53:24 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3%3]) with mapi id 15.20.7270.009; Tue, 6 Feb 2024
 02:53:23 +0000
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
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscAgAWsYQCAAIyKgIAAqmqAgADpX4CABdZRgIACH0WAgAi5FoCAAkh6AIACnmOAgAB3LICAAN6oAIAHFi2A
Date: Tue, 6 Feb 2024 02:53:23 +0000
Message-ID: <20240206025307.j2lz3v2idwm7gusp@synopsys.com>
References: <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
 <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
 <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
 <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
 <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
 <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
 <20240130021704.ndbkkyksauku7nwr@synopsys.com>
 <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
 <20240201012301.qtp4vr67cwnte5im@synopsys.com>
 <20d855ca-678c-671b-d956-f08f2ac88573@igalia.com>
In-Reply-To: <20d855ca-678c-671b-d956-f08f2ac88573@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ1PR12MB6147:EE_
x-ms-office365-filtering-correlation-id: b75cda56-f891-4bdb-c8d4-08dc26bec8fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jcOqnC2GIdzaQrWN8zMudn7mr9rJY9ADJZVpdyPXKw7wx0g7BHJsWNJwOULA4l/lCgoCvh9rx3FKBZ2Vanc2NBVYpUs69j3rDymcp7pr792KLUVi2zSt8t37qtrAt0Rs1IiU3zDcCLBY5c07PSu63EnpxzKUmf8khPPIqLdeVmsGNJTUydRZyWwIfLKqMcs7QgWeDoBU7fv2O/9YnDFWa39HIXbFoTsVkiaYfLg3GDKODbBgUyYXALq6714cEJ34xF15Skak7S7T4xLYJLEwA+C/ZUvVat75gLgF4jYrupqUznay57CwHeZrfptXkSAYTWRyf+AlrQFaKUxUnedTZ/VmswWdv3TRHqnEhnWkTKPalwihAvqntPDqxXtMhqOIqbCUzbvxUSlZN4lfMhSnwW7QhjxJsKM7m24A9jPSVfV8bXSypICqhPcidlGNyH9nFy4Co0XldCS6Dz3YhCPBVdAgAUyJW5U8dt7IZB8l7wxDDHGDDVjBUM3fm/pRBMV7FMnzq5O2s+aCCLmQVLhURPV6NjOPRywMu7kn9WngbXcTxPMbSIC2vz1xUiciGw0rA3Tv/evb88vhjzJvogGtcanXC8ZRKLg3peirLCPwvPz8/kxEOOJ/fzZD7FdkOUV/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(4326008)(7416002)(2906002)(66556008)(8936002)(8676002)(5660300002)(76116006)(66476007)(316002)(66946007)(6916009)(66446008)(64756008)(54906003)(2616005)(38070700009)(1076003)(6486002)(36756003)(53546011)(26005)(478600001)(6506007)(86362001)(83380400001)(71200400001)(6512007)(122000001)(41300700001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YmtCcUtyRzJUNTBLT3dEMkNEQlpvbDJnY2N6SS8wcTA5Mnhjbk00NVpwVnRr?=
 =?utf-8?B?OE10c01VbERnU2ttYW5telRBVDJMa0lvY2pVTlF5aTdyUjM0VHNsbGN6V3VQ?=
 =?utf-8?B?U2pPcXFlYTljbHpMVEs2MXdHWHlRQ2pqWlA3SDh3Ylg2L3RQWGYvcG8rRXZk?=
 =?utf-8?B?QU5uMjRiUGZGTkdUVTVZTnZFbGJuUWpqc2dBczlRV0poSUlLL0wrUzdVSXQv?=
 =?utf-8?B?d25RYTdEVTc1Z01maXdLSEVQRERHelZwWXJqWDBEV2w2djRjeDY4Y2dMTTFL?=
 =?utf-8?B?aHBqTC92RWYrWjlTeXJNdnIzcHB4cFgvbzVqSHZhMUJtWERwRFo3cWRJSDVo?=
 =?utf-8?B?bGpPWk02WkI2cUVyRWd3MmFvUmR5dE9wOTVaaXBNb2x1QTFpM3pOaUplalZ0?=
 =?utf-8?B?Q2lDRzlKQnBVOStMTkRYUFRoYnlKWWIyYW5JZzFkSSt4Zk0zQTkxc3RnMGd4?=
 =?utf-8?B?TmJRYWhTYldtMEUyZ1RPemRrWXFCZUQrZXBpMmVCUjliY05KVDRLUUpLU0p3?=
 =?utf-8?B?b3pEMk9mMWpNbE9DcWJrRWVWNnl2cHRYdE0zTkp4WHBmZkZFV1RXUVZ3Ky8w?=
 =?utf-8?B?TzE3VU1mT2oyS0IvVzB4SHB5Y3hnUXJweDVIWnlRbDRGc1FCNFJpNnB6OVVB?=
 =?utf-8?B?cGlhbk15NnFXK1ZZMjluS013SEtLaytBRkxaT1R6R2lZNWUyRVcrRHczeWtD?=
 =?utf-8?B?R2NCNjR5ZnQ0eGgrTW5CcDlHM0VkOEttWUg5ODhxeUY1bmNaRXh3N2xIWksy?=
 =?utf-8?B?QTdOcWI1OG5mYUNmSllUYjY2T2ttU3RNYi8wUDUvdmp2cHdaZXQ3VFVGb08z?=
 =?utf-8?B?dkg4eWNqQXJlVmJpTXVBcSsrRTRjM0xqZXUrK1ZWbHFDNUFIeUhYQk55R2lT?=
 =?utf-8?B?SWNRcFVNUFI5SVhHVzhhNkFTNGZzdDZCRTRCWmNVL3o2bzlnYndLc2JnSndS?=
 =?utf-8?B?bmJIQUcyQ0FjTnNHSjBvdktOTkNNT1JjVEpJQVhiZXN2cXNqT0Z3UG9FT2pI?=
 =?utf-8?B?VVg1V25xWWpXRFVYWUpBRXovNlVaZW5Lcjc1QWoxRzBxTFpnaythTDltdG1r?=
 =?utf-8?B?enIvMTJnR1Y3eHZ2MUQ4S2NQNGZhUkVsNU9oR0d6Y0V5NDZSR1dsRUx1UjMx?=
 =?utf-8?B?aExrOXRYWFUrVEhtV2RBbjJHc1BtRnVYdDAzQ2Vya3pBSjE3Si9xRzFkOGlx?=
 =?utf-8?B?NDVRWmw2T1RhTHB6UFliWUljd1dLTHlnb1hCWis5dGtGdDRKYjVONFYxeDRH?=
 =?utf-8?B?VDVBVytzcVpwTWtiYlhzZ3BmdUtTK0YyNXFhWnhNcW9udWFWU0R1N01UdjM3?=
 =?utf-8?B?MlBraVl0aE9WcG41T3Z2SDZkaDZvWUloMEhGNTd0TmlER0ZMcVk3REJ4cGND?=
 =?utf-8?B?NVY1MHlJbkNOa04yMzkyVU8xY2J3NzBQcjByd2l0UXZjYUdJc09sMloreHJh?=
 =?utf-8?B?T1NVTlR3NUE4TnlWb09KUHlxa1RubUhlaWxPdEZYNThSaDlHbkdPaXFLTDFW?=
 =?utf-8?B?dUxjTDVvMlVUT1A3aFBZOTdxYy82QytFQnp5MHFGM00zc2M3VnFuSlRsSjUr?=
 =?utf-8?B?K1VldkcvSUlGUmZ2d2FaVDRZN2ZvQkMzdXA5T1AwVnpRUmRMM25BY1FrWnJQ?=
 =?utf-8?B?NktidFN3RzJjZkNhcGtjMDFGNlExblZBT29ncUVMT0NwYm05MmlaMFN6dHVt?=
 =?utf-8?B?WWlKbVZGNWwrVzNNWWw1SW5JNUFuNUR5ZTE4T3dib3hoSjJ0Szk3WFd4NzA0?=
 =?utf-8?B?MEVmUXdwL0NMeGJQUmNtV2xWTzJaemV2NzVLNU92dCtqOGplUjFaay9sS0ZH?=
 =?utf-8?B?MjhqcTRtQlY0VmVHRWxLQ1pBNVc3ZGo2ODI5MUYxUXlJclpTSGJtc0VmYXE4?=
 =?utf-8?B?OEdvTEhGdlZrTXdPc3o0d2tZWS9sYTVhZmEwNFZ2TURZZnhWR0ZaL0dVeEtu?=
 =?utf-8?B?RmdFUUdDeG9EckpTN0x6UHZ1TGxjMjhLZEhqamZ6ek1VQjJRb3dvak5hTzNN?=
 =?utf-8?B?MzRHZjR6VThoUzhXUWp0cS9leENtemw3OVdBU2xQelU1Y1JocHZYZ1p3NEd5?=
 =?utf-8?B?TWg4M1hYbEtGekREUXdOT044aTlyZ1JWRlFXRzd3clhIMU1vbHRyV21HUlNZ?=
 =?utf-8?B?bTVOdzJGZ2EyUy8xZHhjUEdZVFdjMnFGVzhMMy9UVHFGNmt3MHpRRE82SFND?=
 =?utf-8?B?YWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFB0C0EA8FED934EA59A1A18C79146E9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Gb+BoKpjpPR0UqE1N5JnCc94NC8zP3S7uH05VzxEj96vGkqCZB5IMQseXKbmJbZy7iIGDPo9gZaj4+u0G8uWNFKStaDGBh2RJuccuh7vV1NFVeDzy6H9rCO4OCn7HcqSakpyBP3MgPBIvtGuhFcjVTv7aRtM1RX3aBZ7IyV1B4kvflekkW6SBMYStxDuCgd2Nke7lTiRbF73wlWf+ioQ74Xm1ppjqDw2mtcvE3cMZVRyRK8xqUzOG+9+hptiL35J3pDgQ5fpXRb01v8IyjPuMZ/s7kbEsH80ZL03glQReOqrrH2DccPWg/piuE28l4eivxKOQR3xbBmNkeoE/S9jAyOn7F45yN9YDot5aObv5AERtdPPJEsoalOX2DYmCeok+WjLXSy+2hSNxNTlU/r8riXB6CtM8iIeEIguyyN6qneOBe02Opk11dY+jQhAJaCWiplD/AFKyv7o1KY4m2N2qoK5RSBqFVR8mxD2ixyTah9r7VIb6oyEnmLxRoT15allF/XB8CLRbwoByMx50f61eI9RVRFuHD9RPF7kWTRuDjY61nv7ZRwSm4JkJnnq3MG8jOfjenyy0n47SiSNQIYJ5f3PaXlsp7tvyi/EdawjQNZ2/8N6kEf22LjEbP8vEULQd5D/m1jI4l4uqtJW6eGodQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b75cda56-f891-4bdb-c8d4-08dc26bec8fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 02:53:23.6719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xkRQUvBkdnn6p5xHJVM4CHm6qnry02HLim6dV1MddwpmVWS0jOGDYLF+xblLqqYu3Bgk30IftcURe8Z1C6Wmkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6147
X-Proofpoint-ORIG-GUID: Nl3qe-sXN19xFmOPmrkucri0WrrW4fM8
X-Proofpoint-GUID: Nl3qe-sXN19xFmOPmrkucri0WrrW4fM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_18,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=839 suspectscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402060019

T24gVGh1LCBGZWIgMDEsIDIwMjQsIEd1aWxoZXJtZSBHLiBQaWNjb2xpIHdyb3RlOg0KPiBPbiAz
MS8wMS8yMDI0IDIyOjIzLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gWy4uLl0NCj4gPiBJIGp1
c3QgZXhwZWN0ZWQgdGhpcyB0byBoYXBwZW4gZm9yIFM0IGFuZCBub3QgUzMuIE91ciB0ZXN0IGVu
dmlyb25tZW50DQo+ID4gaXMgZGlmZmVyZW50LiBJIGd1ZXNzIHRoZSAibG9jYWwiIGNsb2NrIGlz
IHR1cm5lZCBvZmYgZm9yIFMzLiBQZXJoYXBzIHdlDQo+ID4gc2hvdWxkIGNoYW5nZSB0aGUgdHJh
Y2VfY2xvY2sgZm9yIG9uZSB0aGF0IGRvZXNuJ3Qgc3RvcCBvbiBzdXNwZW5kLiBJZg0KPiA+IHlv
dSdyZSB1c2luZyB4ODYgVFNDIGNsb2NrLCBtYXliZSB0cnkgdGhpcyBuZXh0IHRpbWU/DQo+ID4g
DQo+ID4gICMgZWNobyB4ODYtdHNjID4gL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy90cmFjZV9j
bG9jaw0KPiA+DQo+IA0KPiBIaSBUaGluaCwgdHJpZWQgaXQgbm93IGluIHRoZSBmaXJzdCB0ZXN0
IHdpdGgga2V5Ym9hcmQgY29ubmVjdGVkIGluIGhvc3QNCj4gbW9kZToNCj4gDQo+ICAgICAgICAg
ICAgIGJhc2gtMTAxNSAgICBbMDAyXSAuLi4xLiA4NTIyNTY1NTc1NDQ6IGR3YzNfc3VzcGVuZA0K
PiA8LWRwbV9ydW5fY2FsbGJhY2sNCj4gICBrd29ya2VyL3UzMjoxOS0xMDk5ICAgIFswMDRdIC4u
LjEuIDg1MjI1OTkyNDA0MDogZHdjM19wY2lfc3VzcGVuZA0KPiA8LXBjaV9wbV9zdXNwZW5kDQo+
ICAga3dvcmtlci91MzI6MjYtMTEwNyAgICBbMDAyXSAuLi4xLiA4NTM5MDEzMDk5Njg6IGR3YzNf
cGNpX3Jlc3VtZQ0KPiA8LWRwbV9ydW5fY2FsbGJhY2sNCj4gICAgICAgICAgICAgYmFzaC0xMDE1
ICAgIFswMDZdIC4uLjEuIDg1Mzk0NDE1MjU0NDogZHdjM19yZXN1bWUNCj4gPC1kcG1fcnVuX2Nh
bGxiYWNrDQo+ICAgICAgICAgICAgIGJhc2gtMTAxNSAgICBbMDA2XSAuLi4xLiA4NTM5NDQxNTg5
MDA6DQo+IGR3YzNfY29yZV9pbml0X2Zvcl9yZXN1bWUgPC1kd2MzX3Jlc3VtZV9jb21tb24NCj4g
DQo+IFNvLi4uZGlkIGl0IHdvcms/ISBTeXN0ZW0gd2FzIGluIHN1c3BlbmQgbW9kZSBmb3IgfjQg
bWluLCBidXQgaG93IGRvIEkNCj4gbWFwIHRoZXNlIFRTQyB0aW1lc3RhbXBzIHRvIHJlYWwgdGlt
ZT8gaGVoDQo+IA0KDQpMb29rcyBsaWtlIGl0LCB0aGUgZGVsdGEgbG9va3MgbGFyZ2UuIEJ1dCBs
b29rcyBsaWtlIHlvdSdkIG5lZWQgdG8gZG8NCnNvbWUgY29udmVyc2lvbiBiYXNlZCBvbiB5b3Vy
IGNsb2NrIGZyZXF1ZW5jeS4gVGhhdCdzIG5vdCBjb252ZW5pZW50Lg0KWW91IGNhbiBjaGVjayBv
dGhlciBjbG9jayBvcHRpb25zIHRvIHNlZSB3aGljaCBjYW4gcHJpbnQgcHJvcGVyDQp0aW1lc3Rh
bXAuIEluIGFueWNhc2UsIHdlIHByb2JhYmx5IGRvbid0IG5lZWQgdG8gcHVyc3VlIHRoaXMgdG9v
IGZhci4NCg0KPiANCj4gPj4gWy4uLl0NCj4gPj4gJCBkbWVzZyB8IGdyZXAgInN1c3BlbmRcfHho
Y2kiDQo+ID4+IFsyMjcuOTkwMTQ5XSBQTTogc3VzcGVuZCBlbnRyeSAoZGVlcCkNCj4gPj4gWzIy
OC4wMTIyNTVdIHByaW50azogU3VzcGVuZGluZyBjb25zb2xlKHMpICh1c2Ugbm9fY29uc29sZV9z
dXNwZW5kIHRvIGRlYnVnKQ0KPiA+PiBbMjI4LjA0MTA1Nl0geGhjaS1oY2QgeGhjaS1oY2QuMi5h
dXRvOiB4aGNpX3BsYXRfc3VzcGVuZDoNCj4gPj4gZGV2aWNlX21heV93YWtldXA6IDANCj4gPiAN
Cj4gPiBUaGlzIGNvbmZpcm1zIHRoYXQgdGhlIHhoY2kgcGxhdGZvcm0gZGV2aWNlIGNyZWF0ZWQg
YnkgZHdjMyBkb2Vzbid0DQo+ID4gZW5hYmxlIHdha2V1cC4gVGhpcyBhY3R1YWxseSBpbmxpbmUg
d2l0aCB3aGF0IHdlIHRob3VnaHQgaW4gdGhlDQo+ID4gYmVnaW5uaW5nLiBCdXQgZnJvbSB0aGUg
ZGlzY3Vzc2lvbiBhbmQgdGVzdHMgeW91IGRpZCwgd2UgY2FuIGRlZHVjZQ0KPiA+IGZ1cnRoZXIg
d2hhdCBoYWQgaGFwcGVuZWQgbm93Lg0KPiA+IA0KPiA+IENhbiB5b3UgdGVzdCBhbm90aGVyIHNj
ZW5hcmlvLiBDb25uZWN0IGFuIEhJRCBkZXZpY2Ugc3VjaCBhcyBhIGtleWJvYXJkDQo+ID4gdG8g
dGhlIFNURUFNIERFQ0suIEhhdmUgdGhlIERFQ0sgcnVuIGFzIGhvc3QuIFB1dCBpdCB0byBzbGVl
cCwgY2hlY2sgdG8NCj4gPiBzZWUgaWYgdGhlIGtleWJvYXJkIGNhbiByZW1vdGUgd2FrZXVwIHRo
ZSBERUNLLiBJZiByZW1vdGUgd2FrZXVwIGRvZXNuJ3QNCj4gPiB3b3JrLCBjYW4geW91IHRyeSB0
aGlzIGluIGFkZGl0aW9uIHRvIHRoZSBwcmV2aW91cyBwYXRjaD8NCj4gPg0KPiANCj4gQXQgZmly
c3QsIGl0IGRpZG4ndCB3b3JrIC0gSSBjb3VsZG4ndCB3YWtldXAgdGhlIHN5c3RlbSBmcm9tIHRo
ZSBrZXlib2FyZC4NCj4gDQo+IFRoZW4gSSBhZGRlZCB0aGUgaHVuayBiZWxvdyBvbiB0b3Agb2Yg
dGhlIHByZXZpb3VzIHBhdGNoOg0KPiANCj4gICAgICAgICAvKiBQZXJoYXBzIHdlIG5lZWQgdG8g
ZW5hYmxlIHdha2V1cCBmb3IgeGhjaS0+ZGV2PyAqLw0KPiAgICAgICAgIGlmIChkd2MtPnN5c193
YWtldXApIHsNCj4gICAgICAgICAgICAgICAgIGRldmljZV9pbml0X3dha2V1cCgmeGhjaS0+ZGV2
LCB0cnVlKTsNCj4gICAgICAgICAgICAgICAgIGRldmljZV93YWtldXBfZW5hYmxlKGR3Yy0+c3lz
ZGV2KTsNCj4gICAgICAgICB9DQo+IA0KDQpEaWQgeW91IHN0aWxsIHNlZSB0aGlzIHByaW50IGlu
IFMzPw0KDQoJeGhjaS1oY2QgeGhjaS1oY2QuMi5hdXRvOiB4aGNpX3BsYXRfc3VzcGVuZDogZGV2
aWNlX21heV93YWtldXA6IDANCg0KT3Igd2FzIGl0IHRoaXM6DQoNCgl4aGNpLWhjZCB4aGNpLWhj
ZC4yLmF1dG86IHhoY2lfcGxhdF9zdXNwZW5kOiBkZXZpY2VfbWF5X3dha2V1cDogMQ0KDQo+IA0K
PiBBbmQuLnRoYXQgYWxzbyBkaWRuJ3Qgd29yayEgV2l0aCBvciB3aXRob3V0IHRoZSBwYXRjaCAo
KyBhYm92ZSBodW5rKSwNCj4gY2FuJ3Qgd2FrZXVwIGZyb20ga2V5Ym9hcmQsIGluIFMzL2RlZXAu
DQo+IA0KPiBCdXQgZ3Vlc3Mgd2hhdD8gS2V5Ym9hcmQgKmRvZXMgd2FrZSogdGhlIHN5c3RlbSBp
biBzMmlkbGUsIHdpdGggb3INCj4gd2l0aG91dCB0aGUgcGF0Y2ghISEgSW50ZXJlc3RpbmcgLi4u
DQo+IA0KPiBOb3RpY2UgdGhhdCBhbGwgbXkgdGVzdHMgYXJlIG9uIHRvcCBvZiB2Ni44LXJjMi4N
Cj4gDQoNCk9rDQoNCj4gDQo+ID4gWy4uLl0gDQo+ID4gTm8gcHJvYmxlbS4gSSdtIGdsYWQgd2Ug
Y2FuIGRlYnVnIHRoaXMgd2l0aG91dCBwcm9iaW5nIGludG8gdGhlDQo+ID4gaGFyZHdhcmQuIEkn
bGwgcmV3b3JrIHRoZSBwYXRjaCBzbyB0aGF0IGl0IGNhbiBiZSBzdWJtaXR0ZWQuIFlvdXINCj4g
PiBUZXN0ZWQtYnkgd2lsbCBiZSB2ZXJ5IGhlbHBmdWwuDQo+ID4gDQo+IA0KPiBBd2Vzb21lLCB0
aGFua3MgYWdhaW4hIFBsZWFzZSBDQyBteSBlbWFpbCBpbiB0aGUgZmluYWwgcGF0Y2ggYW5kIEkn
bGwgYmUNCj4gZ2xhZCBpbiB0ZXN0aW5nLg0KPiBDaGVlcnMsDQo+IA0KDQpTdXJlLg0KDQpUaGFu
a3MsDQpUaGluaA==

