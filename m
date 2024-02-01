Return-Path: <linux-usb+bounces-5714-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF368844EA1
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 02:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95E5228D5FA
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 01:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3A7442A;
	Thu,  1 Feb 2024 01:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dKMizFyZ";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="W+aRPZ1z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="j60BYuQ7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFC74417
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 01:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706750649; cv=fail; b=N75tjaiPDKgPWciS7OJI0cGrYZBAl70bFldvE1GVaiUUAELZ7bdTAaFlfjw/CkmsnMUkMeDJBZRVs5WYGbhDN/uwRUPcXJozo1d4I76wY73tu4tB+KGa65dU11GXZoV+eI4jb23vIyDxUx1RwJy0LQK5KMVTjgTmTpaqx3tR7kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706750649; c=relaxed/simple;
	bh=wU6HIKUT7M6yfY7Vp5Ss+S+lck86x+pl2pUrjrD8O0c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mwNQhXzVN0t7M6BEw7UrbKxHQ1odBo0z5JdbW9ZJxaV965YdXUoEfRiK0drY6NBYIpz/dF6fHExBzNcZf36dg5gVqqBPhHR3Qyt72xefyEu/Y5j0wNgE/mRnFhAi+DfKz0RYzgIBnkMkRhbrOJqMMp1gS3/BAbjcbCWQasqwLbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dKMizFyZ; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=W+aRPZ1z; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=j60BYuQ7 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VKLbZg019889;
	Wed, 31 Jan 2024 17:23:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=wU6HIKUT7M6yfY7Vp5Ss+S+lck86x+pl2pUrjrD8O0c=; b=
	dKMizFyZubGbYvSUlKYee/bf2ZtbOx7PqK+RU0YhDc+hz4Rlv7bN2Wz19tLd+hFE
	DW6jPgZaS6UpLpGRFOI9HcNNpY9bc+9FAFI4lf818HVlKfKPOpkYSSVdVgIdqzsf
	G1LXACxBmOVUf9eCfsb8TUgbJS4tvqJx/45ZHgLB5INjZfWP4BeRaX5jAar4NM1E
	cnXDwnT+hHwc9j3G9j7Pj845/6GVlzIbGxg/kw+/FzR3jVngFN9hTG3EeRxZIp1P
	TBdPDKyhDHC1veVpB5SHw5nvfSt2/SkH+5blT2j1F1RAU9u/MKUooIZg9h09lMLU
	ffh/o3SVywrLciOpPi07gw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vw1mwmmf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 17:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1706750605; bh=wU6HIKUT7M6yfY7Vp5Ss+S+lck86x+pl2pUrjrD8O0c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=W+aRPZ1zGp9MZAmLiERdRZ35p3O2T8mnBzH/BTuWftUpTZX9OFwlcHXsAv7BlEX5c
	 RpbdBB1lVIslbNF/7fYAB2ZxsT/nNG9V71xlVM/waNaWg6MzLSaThn1Q+OOKwD+kUj
	 hxhJWWmVbjIETJukCyLmXAaDsyWtrf3DptOXohz/yLKB6ggaqY2CVSMiObA0WvxcUo
	 jyUunMrsrqklp22mtB2LV4NFBsYTL/XK3VRvizDZU+IKyXe5HCcsYu1roCdwNozZt3
	 JkgakfbySlpAMM7AVTP46gVGon1ObLzEmQW2Vg63tX7gsJy690LLntjmO1Aajl9qsn
	 xtgmhPN5PULkA==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A0C3C4035A;
	Thu,  1 Feb 2024 01:23:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 7654BA0076;
	Thu,  1 Feb 2024 01:23:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=j60BYuQ7;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 536EC40138;
	Thu,  1 Feb 2024 01:23:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bg8JWRt9ybTVT2wTERM72JDWvCIk33d+Sy9AGo/SvDV2R+NKIVc3BOkCVuq5ZJbiYmrWvClXXYddg2W3ms4sQ4xuom3n+MdjE8Q8SLALEvAx27gSvqEaja2wMQ2zH7NDNNQLSPi9XckB9LgzPN3ylK7uJv6j4TjSQpHSrCXZmileYax+HUjfJeKHzsVtDmhr5lypT3I+djy9wjLtuSfQQKw0Wc5Ecx+athyrMHb7WWFMeL3NgBr/88t+nAyNmFNthC6S2F7SllmTiiB2elwid2WPM2q2us0vZlOdtqHWaF3CvhNWhx7Q2CLNmHkLCpheSGqPBO1YC6lnchM6Hwvbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wU6HIKUT7M6yfY7Vp5Ss+S+lck86x+pl2pUrjrD8O0c=;
 b=Bwu9JQlzUvt4UvVBxfXp0Gk3lgbxU/9RDrrjD3AtkjGKfSv+dyECB3qHREcZbcxbbn8RMABJf01HcqbjW4/DejBe0sbve1Z86Jq3ihbq+NEXH1mLEmU5uc36P+dg0TYVbMygdM+ZX1D9vjwOuGfkIui9oalJnI7/9dTweMaOtjfwc9nicnCbVxODgHd7y3CVLYl8bAkWwBJmy29IxfwZOBy4Ydv0gB5yzMViXPbtA+ywyKNSIIJwdPszhgkU+LK2d+pJoC/eORi8po55kfY0nO/AhpE5R8HqoqBE/jIRVIg5vB/3soqHxbmd7V6lnHdKZVM/J0kxbj2Jtk80mJtTGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wU6HIKUT7M6yfY7Vp5Ss+S+lck86x+pl2pUrjrD8O0c=;
 b=j60BYuQ73H0352A8VPZiD+d0IoZ/y2BX1sEPd25H30sB65KWWkxmGijHZsAxcKTjQgAEqCM3k2lPad4pYFb5o+Sdh4or+p1l4skryy1S7sZtkA4RqREIbAwdFP2XB5IeQHk/J9GjwvaBgrTSvmdJ3LyQXWsA50VGXZuluVMlFEI=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 LV8PR12MB9155.namprd12.prod.outlook.com (2603:10b6:408:183::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.32; Thu, 1 Feb 2024 01:23:10 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::62f1:63af:9a29:35ba]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::62f1:63af:9a29:35ba%4]) with mapi id 15.20.7249.017; Thu, 1 Feb 2024
 01:23:10 +0000
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
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscAgAWsYQCAAIyKgIAAqmqAgADpX4CABdZRgIACH0WAgAi5FoCAAkh6AIACnmOAgAB3LIA=
Date: Thu, 1 Feb 2024 01:23:10 +0000
Message-ID: <20240201012301.qtp4vr67cwnte5im@synopsys.com>
References: <20240113013320.mrqqrdajrnw62kis@synopsys.com>
 <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
 <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
 <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
 <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
 <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
 <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
 <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
 <20240130021704.ndbkkyksauku7nwr@synopsys.com>
 <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
In-Reply-To: <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|LV8PR12MB9155:EE_
x-ms-office365-filtering-correlation-id: 0aa5b6bf-de80-4531-0c85-08dc22c45a65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DG+ySDt3VzWHR5N3XHnlGdKBeznhG4ynazsH27fxVndSfgZAj5HjqZH6rifWJ7BtiGXN+JdnhNYV5G3FFn6Jmba3QQgwQH+9NAQyUv1BnbCwr+Appq7qFzMkFwpIq8h4c7tAJa+tOS1mfgpZf1k34xns5a8qcGPHdpBEACWA6XtfC8F/uNBsgWt3pTDg7mn0Vg1XLahf7nwiyvjnYj8MrsSqq+FrB64aUWSgKZF3qnz9QpcTuqdhG7IBb5ZXrSVy2dHvJn4rjXgr32kBq8fmAshj+QYVcU+TYyHYFujoPCGQWsvvYW+iowl97ToSJ7Um95bqiDRlIzvJq+q6NgjNAfD7FT/8qhf2rPbreJ2BWjq3yYVm9Gbw9okIcquWv52/4gSfzRQLzZGJZ3Gcj+9AjZdahWKJEtELt7VjuzejZ0E2J2IPIpKI7uhyR7K/w3exuVh/5qX8BL0h9fa+8uBqxwmc37M5VPut1EbsuSGXWGJoJtVI9BvWO+QnYYqQVmEQclYJv6UxA8CvLMrsDFyRSjM+T3k8M/ci+L5xAN2+dB0f1w4pyqa75LGzLM7F087UBPGokBjAte74B78Hb8IGg6BQqTmXW2m5X2QnwCDIYvWmAOKaA14OEyHCksWd/VgTvzBAbxVCPyXbrB6Rl2insQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(376002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(1076003)(26005)(2616005)(38070700009)(36756003)(71200400001)(53546011)(6506007)(83380400001)(6512007)(478600001)(6486002)(38100700002)(122000001)(316002)(64756008)(7416002)(8936002)(2906002)(86362001)(6916009)(66556008)(54906003)(66946007)(5660300002)(66476007)(8676002)(66446008)(4326008)(76116006)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NHhaREx2Zzk5NWhHREtXRVJoQ1BIOHdjdE1UQ1Jab2pFSlo3Ulp5Z1NXMVlE?=
 =?utf-8?B?ZUV5SkdOVmRDa2ZhSHdibWR2VXZUaGFxcksyRlhEQTA5dy85OWJabVF6WmJP?=
 =?utf-8?B?Y0lJWm50Tzd5S2JEa0VlaFdGaXUvQjMrZHZ1ZnZNQVp6R3V2Ym9tZHZqNTMx?=
 =?utf-8?B?TFJId2tmd2s2aGhMbjFFak1FamE5SW4rZzFUcXhVbnE1K2l4ck02ZFdFaVJV?=
 =?utf-8?B?eDhrdDdlM0NmcTcxR2NFQUZFMlRZVGFsNzRlcHcrVlhNZ2NlbjZPajhnVHJK?=
 =?utf-8?B?RlpMeWkvSEVIblZPYjJaU0x1cVZhNzFaTmJZTG1kRU96VzNuNU1TUkplanpP?=
 =?utf-8?B?QjFZdTl3c0F1ZFliNUZ1VWZEQWFNWU5iSEE5dU9KSUZHNkx3TjUwaEUxZmNu?=
 =?utf-8?B?T1hxMXFXZDczYXFmUVR0bnR4cGJhQkZBSnd5d2lkdTJTRUJFWkhWdGk5dE10?=
 =?utf-8?B?Skovcm1mR2RxUGdHTzNSL1U5TmloUGpuMjZwdXIybkFBemVBWGVUSE5FRkZR?=
 =?utf-8?B?VS8rbFdQQy9kWDdwelZWbGljR1NBakhJVzdqZUVaZ01rVVp6YUtabHpmM0lJ?=
 =?utf-8?B?R1RwSzRFUURLNmxpcHZsSHpNYXU4Rllpcm1pQUIySlJ0NUJyM2t1TWZoK2c2?=
 =?utf-8?B?bU10QVF3c3krVUFBVnAyZ1NaZFVXZVZLVXh1Uk1ubDJwVDc5RHBPbGNZYmRF?=
 =?utf-8?B?Kzh1UmM3a1Mwb0lUZjZIL1VBRFZTTnZxaW9wcFJucGw0S2M4LzVVbUxFK1Y0?=
 =?utf-8?B?dGZ2Nlo4T05POXUyb0xUekRLU3RSWkZEUVBQY0tCTmxNUWpnQVI5NDE1Z0dF?=
 =?utf-8?B?QnQ2bzRNTmc0Q0RTQkgxL0xaNEx2eElDQ1ZHS1BCbkJyY3JtOXQzekViZzh4?=
 =?utf-8?B?cVJvbENTRk9XbVNSa2czV2FLSFJNUWd3MkdmUVFFdzQ5SmU4TGtSTFR6REUv?=
 =?utf-8?B?RVFDeHVSM3dYVStuWXBhNzhiZytMTEVjbldEOTNGYklseFdLTWViNlZEMzJC?=
 =?utf-8?B?U2t1OEhKMzZDL2dsNHNaR0Q3c3huckdhYVhQRFFXOGRHdEpOZmE5Z0l6VU9i?=
 =?utf-8?B?L0JjNWRTaFlUSHZtc1pjT3RPSXFDb0xBRnJtRjdhV3kxckhLOWhjTmpqc2Zt?=
 =?utf-8?B?R04xeWpUeFJMOEZNL3VockhpdVNOTW5Lb1BCYVBvd2VLdnZ2RkRqZG9ocDRn?=
 =?utf-8?B?WUZTbmJSYkY4dFZBZHN5Y01xWVNPb084ZjFlVzBIVyt3MHBmNDRVZ1FUK3E5?=
 =?utf-8?B?ZmRHLytCcEdQaHp6ejZUR2EyRzV1eHVCaXdkT1Y5VUpjOUV4NE15NHp2SXpZ?=
 =?utf-8?B?Y3NFdGZPRWpvZFpMY3VjbnBva0tacGhJb2dwNXJGVEVrd2xFbHdVZUE0azBV?=
 =?utf-8?B?dlJoc1pHL1lodDNSQ21CRE02YnBUSElaU0c2RUpBck45eGZqa0FuKzJMZHht?=
 =?utf-8?B?aDdmV3NBYjJxem8vUnhDMEtLaVI0UUtWUEh1c3BSRm0wN3pJYXJ3RmNMdzVl?=
 =?utf-8?B?N1hsMkpJeUtvY2VsWjBhYTVEanVwcFJCdXJKWE9ZbjQrdTJXRmt1NGpFemVs?=
 =?utf-8?B?YXA2Zkc0TzFWdUp2clVPK0dXVmozM3hQRmQ3NHZyQklXMy9PZkRicGpFZGEv?=
 =?utf-8?B?RDhvdHB0YXZ0SHRkRnRnWEsrd0tOdE5OTlEvMWVKS1NOdmdVVHYxU2FnMyt0?=
 =?utf-8?B?cjVwYTZPais1cHQ0cjFCWStteE00Rk1BeDR5Z3cwN0pYbit4R1I1TDVmeXFZ?=
 =?utf-8?B?cytDeEZhc1VOL2dPcjUwU1VSMjVQSzg2eEZ3NmlsQlB5bmxoMzRrd1E3SGhR?=
 =?utf-8?B?OVZubE05R3VUUTFob3pGTHFPQ3k5ZlExb2dvR2tOVVpUMC9Vd0dqNkNyamFS?=
 =?utf-8?B?dFR0MVZaWGlGeDJjU1pRRm1QVm92MHQ4aEVINTlwZkg1ZmljdnlPV0UrZHE2?=
 =?utf-8?B?cWFPY0Q4ZjdEVTVKblpKMmlXTG1DQitqZlBNaHdWV0FrSG53ZTl0V1dMVEsw?=
 =?utf-8?B?dnA1VlRwS0k5NU9CenAvM3d3MEx6clJ3NXFXby9SbzlxOWdpSFVsWStHM01S?=
 =?utf-8?B?Q3plNWRMT1JlbTJSYlg4a3BBQXYvRWhXVTE5dk44WHcwb3gzcTc5MnE3RDJD?=
 =?utf-8?Q?0sQKfYepWgwbH+Jo3EDwoxkBE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD72145D01FF734DB6D262BEEC600094@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	SIoe9jlJ3tycPgls7pJeEVw7fSwN20PbNA64vAbhz4PLKl6xrDrpXvVArQa3h5BtXccd3uJDaruXHjVTpQ9nVuwYiSRlQTkPxxF8GxqBOYuvVEJxTZv4NTAFQX2NSbDW3RX+eK3ADJkf4zkEKOMScFKkUIcN7FvfFk/MTMhe2b4cncZoRHabibfNykgmk6EGsnXt8/INxrCWk5HbREFZfMUCNU7pzn/GK9IVcY6kQL8ACsBooWA4VeBSpsFPJfUpUv5TokbDEiWjZWmvhA5sJrugZh+A6NfZ7If+o8hi4pPvHZyv6Vn7xVTkFEekOfDGWXsPls3DpRQMwXjNYD5kVMRFqvsJBCYcafUoh6+PdVNgXjAvS27XuAZvZWujG97EqjPwEiwduYvFZMkoi1U9ZeRjq9ePhzETjmBKN96bpv9L3bbZJouyb7XKO9i49NCJIt+aXBAyjqCddJb9wG3zBZjt1uPuK0eklSy32HmouHRHBQlWrzk8lDiLIf9W+mqn0ePuwrumjuqSjBILYUFYXzCxieQCooIVcwl1RW5QBuhD8iMuvFyQyNEnhZ/N/4Qt3HXBzF8q8wtG4axOgQC0Cv/+YtTrPI7XOhgVYN83m0KqAAITby5iXxrokwgPXxcyeskUqxqI3Dqv7yIDCDUL8Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa5b6bf-de80-4531-0c85-08dc22c45a65
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 01:23:10.4699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 95QX34EXP5JtwpKbpNH9Usx+gD9Zg+lMGTl6sjS21KPl2GteHOK5IpzMA0Ttip30cPNY5pESjlS4/wc+3+zNOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9155
X-Proofpoint-GUID: 0eGUMbpxhsffLYs8cjHwfI3vsts4pD7m
X-Proofpoint-ORIG-GUID: 0eGUMbpxhsffLYs8cjHwfI3vsts4pD7m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2402010009

T24gV2VkLCBKYW4gMzEsIDIwMjQsIEd1aWxoZXJtZSBHLiBQaWNjb2xpIHdyb3RlOg0KPiBPbiAy
OS8wMS8yMDI0IDIzOjE3LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gWy4uLl0NCj4gPj4gQW5k
IGZ0cmFjZSB0aW1lc3RhbXBzIHVuZm9ydHVuYXRlbHkgZG9uJ3QgaGVscCB3aXRoIHRoYXQsIGl0
J3Mgbm90DQo+ID4+IHNob3dpbmcgaG93IG11Y2ggdGltZSB0aGUgZGV2aWNlIHN0YXkgc3VzcGVu
ZGVkLCBzbyBpdCBtaWdodCBiZQ0KPiA+PiBjb25mdXNpbmcgYW5kIGJvdGggY2FzZXMgY291bGQg
YXBwZWFyIGFzIHRoZSBzYW1lIGV4YWN0IHNjZW5hcmlvLCBldmVuDQo+ID4+IGlmIHRoZXkgYXJl
IGNvbXBsZXRlbHkgZGlmZmVyZW50IChmYWlsIHZzIHN1Y2Nlc3MgY2FzZXMpLg0KPiA+IA0KPiA+
IFRoYXQncyBvZGQuLiBteSBhc3N1bXB0aW9uIHdhcyB0aGUgdGltZXN0YW1wcyB0byBiZSB2YWxp
ZC4gV2VyZSB5b3UgYWJsZQ0KPiA+IHRvIGNvbmZpcm0gdGhhdCBpdCdzIHRoZSBpc3N1ZSB3aXRo
IHRoZSB0aW1lc3RhbXBzPyBQZXJoYXBzIGNoZWNrIGlmIHRoZQ0KPiA+IG90aGVyIGRldmljZXMg
aW4gdGhlIHN5c3RlbSBhbHNvIHdha2V1cCBhdCB0aGUgYXBwcm94aW1hdGVseSBzYW1lDQo+ID4g
dGltZSBwcmludGVkIGluIHRoZSB0aW1lc3RhbXBzPw0KPiA+IA0KPiANCj4gSGkgVGhpbmgsIGlu
ZGVlZCAtIHRoaXMgYSBiaXQgb2RkIHJpZ2h0PyBJIGd1ZXNzIHRoaXMgaXMgbWF5YmUgcmVsYXRl
ZA0KPiB3aXRoIHRoZSB3YXkga2VybmVsIGtlZXBzIHRyYWNrIG9mIGNsb2NrcyBvbiBzdXNwZW5k
IC0gZGVzcGl0ZSBUU0Mga2VlcHMNCj4gYWNjb3VudGluZyBvbiBzdXNwZW5kIChhdCBsZWFzdCBm
b3IgYWxsIG1vZGVybiB4ODYgcHJvY2Vzc29ycyBJSVVDKSwgdGhlDQo+IHRpbWVzdGFtcHMgaW4g
Ym90aCB0cmFjaW5nIGJ1ZmZlciBvciBkbWVzZyBkbyBub3QgcmVmbGVjdCBzdXNwZW5kIHRpbWUu
DQo+IA0KPiBJcyBpdCBkaWZmZXJlbnQgaW4geW91ciB4ODYgc3lzdGVtcz8gT3IgbWF5YmUgaW4g
b3RoZXIgYXJjaGl0ZWN0dXJlcyB5b3UNCj4gaGF2ZSBleHBlcmllbmNlIHdpdGg/DQoNCkkganVz
dCBleHBlY3RlZCB0aGlzIHRvIGhhcHBlbiBmb3IgUzQgYW5kIG5vdCBTMy4gT3VyIHRlc3QgZW52
aXJvbm1lbnQNCmlzIGRpZmZlcmVudC4gSSBndWVzcyB0aGUgImxvY2FsIiBjbG9jayBpcyB0dXJu
ZWQgb2ZmIGZvciBTMy4gUGVyaGFwcyB3ZQ0Kc2hvdWxkIGNoYW5nZSB0aGUgdHJhY2VfY2xvY2sg
Zm9yIG9uZSB0aGF0IGRvZXNuJ3Qgc3RvcCBvbiBzdXNwZW5kLiBJZg0KeW91J3JlIHVzaW5nIHg4
NiBUU0MgY2xvY2ssIG1heWJlIHRyeSB0aGlzIG5leHQgdGltZT8NCg0KICMgZWNobyB4ODYtdHNj
ID4gL3N5cy9rZXJuZWwvZGVidWcvdHJhY2luZy90cmFjZV9jbG9jaw0KDQo+IA0KPiBJJ3ZlIGRv
bmUgYSB0ZXN0IG9uIFN0ZWFtIERlY2ssIHRha2UgYSBsb29rIGluIGJvdGggYXR0YWNobWVudHMg
LSBzZWVtcw0KPiB0byBiZSBhbGlnbmVkIHdpdGggbXkgcGVyY2VwdGlvbi4gQWxzbyBjaGVja2Vk
IGRtZXNnIG9uIG15IEludGVsIGxhcHRvcA0KPiAoaTUtNjMwMFUsIHdpdGggIm5vbnN0b3BfdHNj
IiBjYXBhYmlsaXR5KSBhbmQgdGhlIHRpbWVzdGFtcHMgZG8gbm90DQo+IHJlZmxlY3QgdGhlIHRp
bWUgc3BlbnQgaW4gUzMgc3VzcGVuZC4uLg0KDQpPay4gSSdsbCBrZWVwIHRoaXMgaW4gbWluZCBm
b3IgZnV0dXJlIGRlYnVncyBhbHNvLiBUaGFua3MuDQoNCj4gDQo+IA0KPiA+Pj4gWy4uLl0NCj4g
Pj4+IFdlIG5lZWQgdG8gbG9vayBpbnRvIHdoeSB0aGF0J3MgdGhlIGNhc2UsIGFuZCB3ZSBuZWVk
IHRvIGZpZ3VyZSBvdXQNCj4gPj4+IHdoZXJlIHRoZSBzb3VyY2Ugb2YgdGhlIHdha2UgY2FtZSBm
cm9tLiBEbyB5b3UgaGF2ZSBhIGNvbm5lY3Rvcg0KPiA+Pj4gY29udHJvbGxlciB0aGF0IGNhbiBh
bHNvIHdha2V1cCB0aGUgc3lzdGVtPw0KPiA+Pg0KPiA+PiBJJ20gbm90IHN1cmUgYWJvdXQgdGhp
cywgd2hhdCBkbyB5b3UgbWVhbiBieSBhIGNvbm5lY3RvciBjb250cm9sbGVyPyENCj4gPiANCj4g
PiBJIG1lYW4gY29ubmVjdG9yIGNvbnRyb2xsZXIgc3VjaCBhcyBUeXBlLUMgUG9ydCBDb250cm9s
bGVyIChUQ1BDKSBvcg0KPiA+IHNvbWUgc3BlY2lmaWMgcGh5IHRoYXQgY2FuIGRldGVjdCBhbmQg
cmVwb3J0IHRvIGEgZHJpdmVyIHdoZXRoZXIgYQ0KPiA+IGNvbm5lY3Rpb24gZXZlbnQgb2NjdXJz
LiBGb3IgdGhlIGxhY2sgb2YgYmV0dGVyIHRlcm0sIEkgdXNlZCBjb25uZWN0b3INCj4gPiBjb250
cm9sbGVyLi4uIChwZXJoYXBzIGp1c3QgY29ubmVjdG9yPykNCj4gDQo+IFRoYW5rcyBmb3IgdGhl
IGNsYXJpZmljYXRpb24hIEkgZG9uJ3QgaGF2ZSBpdCBhdCBoYW5kcyBhbnl3YXksDQo+IHVuZm9y
dHVuYXRlbHkgaGVoDQo+IA0KPiANCj4gPiBbLi4uXQ0KPiA+IFBlcmhhcHMgd2UgY2FuIG1ha2Ug
dGhpcyBhIGdlbmVyaWMgY2hhbmdlIGFjcm9zcyBkaWZmZXJlbnQgZGV2aWNlcy4gU2VlDQo+ID4g
YmVsb3cuDQo+ID4gDQo+ID4+DQo+ID4+IEFueSBvdGhlciBkZWJ1ZyAvIGxvZ3MgdGhhdCBtaWdo
dCBiZSB1c2VmdWw/DQo+ID4gDQo+ID4gSW4geW91ciBzZXR1cCwgY2FuIHlvdSBjaGVjayBpZiBo
b3N0IG1vZGUgd2FrZXVwIGlzIGVuYWJsZWQ6DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2hvc3QveGhjaS1wbGF0LmMgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5jDQo+
ID4gaW5kZXggYzVkOWFjNjdlNjEyLi43MTZiMDVmZjAzODQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy91c2IvaG9zdC94aGNpLXBsYXQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhj
aS1wbGF0LmMNCj4gPiBAQCAtNDcyLDYgKzQ3MiwxMCBAQCBzdGF0aWMgaW50IHhoY2lfcGxhdF9z
dXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgICAgICAgIHJldCA9IHhoY2lfcHJpdl9z
dXNwZW5kX3F1aXJrKGhjZCk7DQo+ID4gICAgICAgICBpZiAocmV0KQ0KPiA+ICAgICAgICAgICAg
ICAgICByZXR1cm4gcmV0Ow0KPiA+ICsNCj4gPiArICAgICAgIGRldl9pbmZvKGRldiwgIiVzOiBk
ZXZpY2VfbWF5X3dha2V1cDogJWRcbiIsDQo+ID4gKyAgICAgICAgICAgICAgICBfX2Z1bmNfXywg
ISFkZXZpY2VfbWF5X3dha2V1cChkZXYpKTsNCj4gPiArDQo+ID4gICAgICAgICAvKg0KPiA+ICAg
ICAgICAgICogeGhjaV9zdXNwZW5kKCkgbmVlZHMgYGRvX3dha2V1cGAgdG8ga25vdyB3aGV0aGVy
IGhvc3QgaXMgYWxsb3dlZA0KPiA+ICAgICAgICAgICogdG8gZG8gd2FrZXVwIGR1cmluZyBzdXNw
ZW5kLg0KPiANCj4gT0ssIHRyaWVkIHdpdGggdGhpcyBodW5rIGFsb25lLCBhbmQgdGhpcyBpcyB0
aGUgcmVzdWx0Og0KPiANCj4gJCBkbWVzZyB8IGdyZXAgInN1c3BlbmRcfHhoY2kiDQo+IFsyMjcu
OTkwMTQ5XSBQTTogc3VzcGVuZCBlbnRyeSAoZGVlcCkNCj4gWzIyOC4wMTIyNTVdIHByaW50azog
U3VzcGVuZGluZyBjb25zb2xlKHMpICh1c2Ugbm9fY29uc29sZV9zdXNwZW5kIHRvIGRlYnVnKQ0K
PiBbMjI4LjA0MTA1Nl0geGhjaS1oY2QgeGhjaS1oY2QuMi5hdXRvOiB4aGNpX3BsYXRfc3VzcGVu
ZDoNCj4gZGV2aWNlX21heV93YWtldXA6IDANCg0KVGhpcyBjb25maXJtcyB0aGF0IHRoZSB4aGNp
IHBsYXRmb3JtIGRldmljZSBjcmVhdGVkIGJ5IGR3YzMgZG9lc24ndA0KZW5hYmxlIHdha2V1cC4g
VGhpcyBhY3R1YWxseSBpbmxpbmUgd2l0aCB3aGF0IHdlIHRob3VnaHQgaW4gdGhlDQpiZWdpbm5p
bmcuIEJ1dCBmcm9tIHRoZSBkaXNjdXNzaW9uIGFuZCB0ZXN0cyB5b3UgZGlkLCB3ZSBjYW4gZGVk
dWNlDQpmdXJ0aGVyIHdoYXQgaGFkIGhhcHBlbmVkIG5vdy4NCg0KQ2FuIHlvdSB0ZXN0IGFub3Ro
ZXIgc2NlbmFyaW8uIENvbm5lY3QgYW4gSElEIGRldmljZSBzdWNoIGFzIGEga2V5Ym9hcmQNCnRv
IHRoZSBTVEVBTSBERUNLLiBIYXZlIHRoZSBERUNLIHJ1biBhcyBob3N0LiBQdXQgaXQgdG8gc2xl
ZXAsIGNoZWNrIHRvDQpzZWUgaWYgdGhlIGtleWJvYXJkIGNhbiByZW1vdGUgd2FrZXVwIHRoZSBE
RUNLLiBJZiByZW1vdGUgd2FrZXVwIGRvZXNuJ3QNCndvcmssIGNhbiB5b3UgdHJ5IHRoaXMgaW4g
YWRkaXRpb24gdG8gdGhlIHByZXZpb3VzIHBhdGNoPw0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMy9ob3N0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2hvc3QuYw0KaW5kZXggNDk1N2I5NzY1
ZGM1Li5mOTM2MWU5OTVmNWIgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2hvc3QuYw0K
KysrIGIvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCkBAIC0xNjYsNiArMTY2LDkgQEAgaW50IGR3
YzNfaG9zdF9pbml0KHN0cnVjdCBkd2MzICpkd2MpDQogCQl9DQogCX0NCiANCisJaWYgKGR3Yy0+
c3lzX3dha2V1cCkNCisJCWRldmljZV9pbml0X3dha2V1cCgmeGhjaS0+ZGV2LCB0cnVlKTsNCisN
CiAJcmV0ID0gcGxhdGZvcm1fZGV2aWNlX2FkZCh4aGNpKTsNCiAJaWYgKHJldCkgew0KIAkJZGV2
X2Vycihkd2MtPmRldiwgImZhaWxlZCB0byByZWdpc3RlciB4SENJIGRldmljZVxuIik7DQoNCj4g
WzIyOC44Nzg1MTddIHVzYiAxLTM6IHJlc2V0IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIg
MiB1c2luZyB4aGNpX2hjZA0KPiBbMjI5LjE1MDUwMl0gdXNiIDEtNTogcmVzZXQgZnVsbC1zcGVl
ZCBVU0IgZGV2aWNlIG51bWJlciAzIHVzaW5nIHhoY2lfaGNkDQo+IFsyMjkuMzE4ODgyXSBQTTog
c3VzcGVuZCBleGl0DQo+IA0KPiANCj4gPiBXaGVuIHlvdSBnbyB0aHJvdWdoIHRoZSBkd2MzLXBj
aSBjb2RlIHBhdGgsIHRoZSBkd2MzIGNyZWF0ZXMgdGhlDQo+ID4gcGxhdGZvcm0gZGV2aWNlIGZy
b20gdGhlIHBjaSBkZXZpY2UuIFBlcmhhcHMgaXQgZG9lc24ndCBlbmFibGUgd2FrZXVwLg0KPiA+
IExldCdzIGNvbmZpcm0gdGhhdC4NCj4gPiANCj4gPiBNeSBzdXNwaWNpb24gaXMgdGhhdCB0aGUg
cG93ZXIgbWFuYWdlbWVudCBpcyBtYXBwZWQgdG8gdGhlIHNhbWUgUENJDQo+ID4gUE1DU1IgZm9y
IGJvdGggdGhlIGhvc3QgYW5kIGRldmljZSBtb2RlLiBXaGVuIHRoZSBkZXZpY2UgaXMgaW4gc3Vz
cGVuZA0KPiA+IChEMyksIGl0IGdpdmVzIGNvbnRyb2wgdGhlIHRoZSBQTVVzLiBJZiB0aGUgUE1F
IGlzIGVuYWJsZWQsIHRoZSBQTVVzDQo+ID4gd2lsbCBnZW5lcmF0ZSBQTUUgb24gY29ubmVjdGlv
biBkZXRlY3Rpb24gaWYgdGhlIFBNRSBpcyBlbmFibGVkLiBXaGVuDQo+ID4geW91IGdvIHRocm91
Z2ggdGhlIHhoY2kgY29kZSBwYXRoLCB3YWtldXAgbWF5IG5vdCBiZSBlbmFibGVkLg0KPiA+IA0K
PiA+IEZvciBkZXZpY2UgbW9kZSwgd2UgY2FuIGhhbmRsZSBnZW5lcmljYWxseSBieSBvbmx5IGVu
YWJsaW5nIHdha2V1cCBpZg0KPiA+IHRoZSBmb2xsb3dpbmcgY29uZGl0aW9ucyBhcmUgbWV0Og0K
PiA+IAlpZiAoZHdjLT5nYWRnZXRfZHJpdmVyICYmIGR3Yy0+c29mdGNvbm5lY3QpDQo+ID4gDQo+
ID4gVHJ5IHRoaXMgKHRvdGFsbHkgdW50ZXN0ZWQpOg0KPiA+IA0KPiA+IDxwYXRjaD4NCj4gDQo+
IFRoYW5rcyBhIGJ1bmNoIFRoaW5oLCB3aXRoIHRoaXMgcGF0Y2ggYXBwbGllZCAocGx1cyB0aGUg
YWJvdmUgaHVuayBvbg0KPiB4aGNpLXBsYXQpLCB0aGluZ3Mgd29yayBib3RoIGluIGhvc3Qgb3Ig
ZGV2aWNlIG1vZGUgLSBJIGNvdWxkIHByb3Blcmx5DQo+IHN1c3BlbmQgYW5kIHJlc3VtZSBhZnRl
ciBwcmVzc2luZyB0aGUgcG93ZXIgYnV0dG9uIGluIHRoZSBTdGVhbSBEZWNrLg0KPiANCj4gU28s
IGhvdyBzaG91bGQgd2UgcHJvY2VlZCBub3c/IENvdWxkIHlvdSBzZW5kIGEgZmluYWwvb2ZmaWNp
YWwgdmVyc2lvbg0KPiBvZiB0aGUgcGF0Y2g/IEkgY291bGQgdGVzdCBhbmQgcHJvdmlkZSBteSBU
ZXN0ZWQtYnkgKGFuZCBwcm9jZWVkIHdpdGgNCj4gYmFja3BvcnRpbmcgdG8gRGVjaydzIGtlcm5l
bCkuIE9yIGxldCBtZSBrbm93IGlmIHlvdSB3YW50L25lZWQgbW9yZSB0ZXN0cy4NCj4gDQo+IFRo
YW5rcyBhZ2FpbiBmb3IgYWxsIHRoZSBoZWxwL3N1cHBvcnQgaW4gdGhpcyBpc3N1ZSA9KQ0KDQpO
byBwcm9ibGVtLiBJJ20gZ2xhZCB3ZSBjYW4gZGVidWcgdGhpcyB3aXRob3V0IHByb2JpbmcgaW50
byB0aGUNCmhhcmR3YXJkLiBJJ2xsIHJld29yayB0aGUgcGF0Y2ggc28gdGhhdCBpdCBjYW4gYmUg
c3VibWl0dGVkLiBZb3VyDQpUZXN0ZWQtYnkgd2lsbCBiZSB2ZXJ5IGhlbHBmdWwuDQoNClRoYW5r
cywNClRoaW5o

