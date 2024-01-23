Return-Path: <linux-usb+bounces-5388-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 505B0838562
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 03:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72BEF1C267EF
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jan 2024 02:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF9B4A27;
	Tue, 23 Jan 2024 02:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="W8vh+hxH";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aHbU8Akx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZJrjtM/C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812C933CC
	for <linux-usb@vger.kernel.org>; Tue, 23 Jan 2024 02:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705976004; cv=fail; b=aUCl8d4yvS9128hvVdCkAxQzHrAIW5pP1zOVHuYm6bgaIoucy26ONokLS+rwoUEY/5rsfyLXUFX+M3eiXRHxi1SiWY7q125EEjFL7zH9KfECfriPwtdICwJoWDyAhsksGx/08rLlNh5zitQsn9Ln8P/MQvc+T+JuYnciINlDhhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705976004; c=relaxed/simple;
	bh=gY0M+QstkqhYouwSyCP3kLq9jqpVDpZcuPox/MMUhgo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G5YOHM5nqZWVHJGu0eg/uTg3vpmkt8xTJd7uwni5dduUpC8MHD6E/S+1TDtx4SFvuA10CcsNJWpE/utNT3zQk7mm2IkWcGWsBc9UG1e0GlIdot3+OHwO7jd2T2QJWs4xbmAc8/zqkgXrPqS/75l3i5eIrph+G2nXEzpKvvWa1ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=W8vh+hxH; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aHbU8Akx; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZJrjtM/C reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40N0nQMl031894;
	Mon, 22 Jan 2024 18:12:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=gY0M+QstkqhYouwSyCP3kLq9jqpVDpZcuPox/MMUhgo=; b=
	W8vh+hxHfudC5QoKbq5hjcqxPG61vqTF03aAkcJeTJ1AXW050487wNgQ8gk0pts+
	s+SVKFAi32GkQCfrksQxwwiDVtJrJqKv6nFh9zcJuvlRDpmFg02cRRUX322rFVHP
	mQVmoM5ZqrWU7u7wkraFltmPOaMmnqKQRT5dZ7T++2ywUgXvjxNQ2k+Qn3KVjX+G
	ibOc4nAJy9IsNqbXnotga6Jq1NDREcWFxOp9OPvNrkLa0uJxWATwYEy2QZxgYnbS
	sJ8f3VORIzre4JZfAkK3f5aBUZoeA2MMuOrK2TOJ4bt9WurVh4siythZwkWSjWfz
	9wjG75AUaxb43UpH7e7G/g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3vrdpgtq0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 18:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1705975974; bh=gY0M+QstkqhYouwSyCP3kLq9jqpVDpZcuPox/MMUhgo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=aHbU8Akx67QPILrRkhfNC+kW2K2LBxf35qanho6Tvyck8MKT22DtdKuayKuOHPdRJ
	 YEt8ZUTua5KqMt4XFSHXn603yjZq/pkiTltRKW6Z8g54iM1ASvEqb7y9GIqtH1awAV
	 HiQ2M2wafa9bYSLWIGg9AKL9M5u1rA471Cim9M7vpOyv3xuEcBWMCKY8yqtv018bWU
	 y537Iv3IhiYUmA4c1RCTq7GJwqYYaP3m2SrwD82jMjn2kji6zN/TNEErtJYcTA5Qjr
	 lM/rDFf1857Lb6YvrYDG+5j/m3X93GAdbiEHbvS8CiacNi1wzl3KKi1bpvjOso65xV
	 JT3ekNGHhQ6VA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7E84040362;
	Tue, 23 Jan 2024 02:12:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 414C6A0259;
	Tue, 23 Jan 2024 02:12:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZJrjtM/C;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B13D840408;
	Tue, 23 Jan 2024 02:12:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBMVvGBtjxtl/r9mxzB5Voy3RLmDWASyTwPifNjBFaYcRRgsvwDlDx/G2oSHWGcsBdjpdTaBnrrHEf+uaBN9BieCBNoNOlaWrtIJDnseC8bsiSsynztpvn3FgpJHPpghsZUaB+zrB+j5UANSQyGf8VoQ5AVvKnT1IUs6qLlGvfW89JaJuPz2AWnXqWs248l9jjnW/Qf5/kkWLCdOqc9KfLCHTvl2r4uHUcduxYF4Y42INZaDA6REFAbpefEXk8xeOzKsORp1Pi9iQiJvKJaliIQJEsPnX4yU7FvCRTb2QOx8RGlLM1A/xtjzxsfC0L2Zvui9Jb46zd/qF6tmcnkXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gY0M+QstkqhYouwSyCP3kLq9jqpVDpZcuPox/MMUhgo=;
 b=LKlcb//PFzEWHaoAJaLXxnTDI6gxNGsBC/sOMdeiVDbmbqtsP1yxSnP4aOt7e2pzJot+9FYX8YMFusJ5+2VVXs33ZI5mxnX05qElbq5J/HnX5e6E4n0ebhXJjsnGp1M/1aKYgCakJVtBc0crnXhaEmjabG2xNX+sKr9k1U95wffchHaGic6InGnY6z9jLKhOxJnJAV73oLPosnJbAm9iaogToimDPg7HRLvr+BTT79T0exWwiVSCY8ViUM+tVMaERj6hk5bRiGxI0d5AsAujKPVmdiPGK4FywU8I09b09a/xrZVJNeg+WJM1LRwn2pt/WpxujDJtCufw9IhBF54UAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gY0M+QstkqhYouwSyCP3kLq9jqpVDpZcuPox/MMUhgo=;
 b=ZJrjtM/Ce/uqmJtdKCwt2j7bGiXpFAE+V1FI8Uad9tHxXIh7u/Fs14TmuYzuKo++PiwM2Qr+rBsQFlF8srjx3hAy8sF/PEUjCBAyDOeitwRHfs6PBiwrDc3UxevSvH9jU7R5Fo0VgUD4oG9xdYLTJUMvvOynm2BXlRWQ1aiDsqw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM6PR12MB4532.namprd12.prod.outlook.com (2603:10b6:5:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Tue, 23 Jan
 2024 02:12:45 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::a6b8:3d34:4250:8ae3%3]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 02:12:45 +0000
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
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscAgAWsYQCAAIyKgIAAqmqAgADpX4CABdZRgIACH0WA
Date: Tue, 23 Jan 2024 02:12:45 +0000
Message-ID: <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
References: <9efaed91-d246-cf3c-efc0-e866f88a943d@igalia.com>
 <d85a5507-4d4a-9e60-fbd1-68b42afb2143@igalia.com>
 <20240111020119.5u3k3csn3bi2zhtw@synopsys.com>
 <849d11d9-9302-4d76-01b6-b5046f474fda@igalia.com>
 <20240113013320.mrqqrdajrnw62kis@synopsys.com>
 <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
 <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
 <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
 <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
 <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
In-Reply-To: <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM6PR12MB4532:EE_
x-ms-office365-filtering-correlation-id: 01c31133-acf0-4578-5bac-08dc1bb8c9e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 avNzHkTG1FC1rEI0VQ/qal9cZPfQd9cVVmdGGBV8hP/TJy9qfOxi/EI2LQU7iaoyCv3EpNd43v78xROm064i5KXUdBsjowPEC/ETDOD+5eQWaXyCouKrcymb7SyRQ1EO2fDW0T8s6iTMUmeKwWjDxTrdFotY5BcnoDfkKrexK02AD6SmkvBmj90Tszl88lGgRr0KCN+aXk6IY2pUx4xNRXHp5jxMJDfkAuc8eFuKem7s/lDY0Zek1WrNPecAla2racGkUBrM8V5i7JDg3VArLALbSMcmntefzI74AxcGmCEgN5q54d+4gGGIEYgn3G5qDMD356gOXqRl8q5OEJiV1hSogGCYKhG9X2/xAwRRciU5dzSKCioGvhZLr/7eB89uTiOfO3ofLTxO7wVlRW/fL63KyBOfByvvkdKhMUIcgWhSzSnglAEnOONnMh+NpKwN3s+XPGEyV9y134b+yAeIMr61GK/vBe1UIavLYhnjUVqIy9E6+c7MYVdWWLh1kY3Jkb7Q8cCHztpOerIOB1IyIU9AaPeK2GLNmTbb0qaRGdwT178GRoReVESAiLTgpDWL+tpzwAzSzLte8HQ/jITXXx24DAUXuKaoYsk5cx6oC80=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(1076003)(71200400001)(83380400001)(26005)(53546011)(4326008)(66946007)(8936002)(91956017)(41300700001)(6512007)(478600001)(2616005)(38100700002)(5660300002)(7416002)(6506007)(6486002)(64756008)(66556008)(66476007)(6916009)(316002)(2906002)(966005)(76116006)(122000001)(66446008)(54906003)(8676002)(86362001)(38070700009)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eExMbTk1SVNKM2RYVmZXRnVLS1lYcmpYb3l4eW9qSWxEbHBkYTNBenRwTWVX?=
 =?utf-8?B?b0R1NmFuSTV5Y0VTWXpVc2xDeUJubDVNUmhJRjZCTDlhUzBRdXdlZWJtdEVJ?=
 =?utf-8?B?MFIwaHNCR3RyV3NTK0NVTDk1NjBsbFE4T1U1aW5zd09MMnRMNXNwbm8xb2Fv?=
 =?utf-8?B?aitxdGN5TlNkZ3EreFZSOVcvMG9PNUlxcTZ4RTM0SzNhbk5WYXRiV3BLZUpR?=
 =?utf-8?B?RzRVY0kreEFoRTFXcG1TNDA5eW83amxjUWFQY3h1akhLQzYvMjV3M2g4NTFJ?=
 =?utf-8?B?NzRReXBLUDBnanRjdGpGcnRaQXNGMDNKQmlLMkEwZWhNUXNseUxHMGhVaDBG?=
 =?utf-8?B?SEx1dzhhWU0vMFAxaE1XY1d0VlRQbVIwTlBTS1E0b1B4VU11Q1MvUmwyRzc5?=
 =?utf-8?B?MUNMUUg1cTZDWnl3blFCemh0L04ra2sxWFJQWjRyMjNzekV5WHZDUHFPVENL?=
 =?utf-8?B?cjVlZitNbFhUZStrTkkvblJhUW9JQXBsRTB0NUdJTkZZNTBGaTJXdTc3WE5v?=
 =?utf-8?B?SjhheUYvcyt4alpnRlltUHlRbnNOOC9sL2NaL01ZbVhlS3JUV0VHc3B3TkYv?=
 =?utf-8?B?R2ZNdmhuYW94dXRnZnlVSjZTODRhZ2crV3BJS3dPd2h5RzFkdndKM3FiUHJE?=
 =?utf-8?B?Z0hkSUE0djludzJiZ2d3NEkrNUt3RmhKVndnQnNSSlFUV0IybzMvSCtyTE5m?=
 =?utf-8?B?alFPNnJ5QitHTFlESC9vRDdsOFo1ZTNFNU45c1ovSkNQV25sRGhySVFxWGRF?=
 =?utf-8?B?YUJLbFpXZmNkeHVZOS9tRE5kUytHLzBtN3pEbXJFOHBoZG1zWEgzQ1BrSTh0?=
 =?utf-8?B?OC93WjBwSzduQ1Y0UG1SMmp1RkNJTzVaZEpYUTVkQjVPd0F2b0xjRDJSWWlP?=
 =?utf-8?B?djNzbko5bzZuTmttcGwvaDVjcUI5QStxbGRKKzAva2laRkp5VnB4cUlCYktQ?=
 =?utf-8?B?SWNIamJGaHVCb25lbjdGazlKdVZmR0tTSWlGR3Vmd1RJRnRGOCt0K0d5c3hL?=
 =?utf-8?B?Ly9JWHV2U2R4aGE5bmtKb3lXVVhNSFRhWnFKcG5FUGNIZ09kd1FlZ1MvanFa?=
 =?utf-8?B?d3lBT21LVEgxbWRzRm00ck9hMGI4UlF2cnloOVhYVUk0OVo1Z05uVTIrWHZM?=
 =?utf-8?B?WVVWQy9ORU4rZ0pYQTZHdndxVDNHZmRyRTN3ekRYMm8zbnIyZDB3b0g3NWl0?=
 =?utf-8?B?SVdKTmVJSmlNYXJDQlBoRXd5VVMyQnJmRXhYTkVrNHpkbHVwWUEwQnpNS1Ry?=
 =?utf-8?B?RC9FNHpDeFVDYThBWEJ5QzU1ZGpoLzFnOUtGNmRyLzlzQXQzMEdVY25GMThm?=
 =?utf-8?B?NFFlZW5KY1NISUhoa280cmE2TWZLVXpZdWtUTWl1eS9KVGZDSGRSREYyZ1p1?=
 =?utf-8?B?TkhkOHVIa2o5RGdCQnZvTmhBZi9zR1pWRnJtYWh3Zjl0ZmVIai8wMVdjL3Ju?=
 =?utf-8?B?N3pubWZLYTJ6czN0SkdqNTV4SWphV21iOW1iOHVqc01lM001ZjhkYndPamVS?=
 =?utf-8?B?WmlMc0RYZ1l1NHp5T3d4Y2pLR09PSkVvanUzeG1UWXdkYk51S3VybFMrV2VF?=
 =?utf-8?B?ZG1aV3c5aTBYejZIakFtL0dyK0RsVWhGME9uL3ZocXBCU3N1WlhITHZHVTJX?=
 =?utf-8?B?SFpPbVlOMkFIRDFldHVZUll5MVBUOE9MUTU3Um5vTXB2eEp3T3JuSlB0cnF2?=
 =?utf-8?B?ckt5eFl5UjZ6b0VsR2N5Tm1Td3BJVE5UQ2VtYWJVZGkxZzBPdFhrTTljV21a?=
 =?utf-8?B?NytCSzY0VjR5eVJ5Yk1ZL2wyRGl3ZkR1RUV0SGhJdUpUTVZtUUwxa1labENP?=
 =?utf-8?B?SGY0RUpqZTd2eklUYTFYK0kyc2tkTEV2U1hSclhmNkgzSXBaYnFRVjRjV2tK?=
 =?utf-8?B?VlR4SFNROEF0VTNxRHhGdm0xcGUwajBCRTFmOWZrWjNmSjhGL0VmVi9Ec3gz?=
 =?utf-8?B?K3BFWXg5RmdIMkl0QzhmWEhoRUt3WXZDOWNmTmtEV3Q4WmNZeXlMYWZUNTlX?=
 =?utf-8?B?am9iKzlId0UzMkk1QldyQ3dqZm9JaFl1YWhHeU4zSS9IZytaa0N2b0VMdmFO?=
 =?utf-8?B?anRaNXFkVVlDbzFOcGtoVFBkdVk0Uks4eG1HUnhHQzkrSHlmWkZ3Nm5jUlVn?=
 =?utf-8?B?R0VNSFlCdUdXSUc3bWJhcXBOT0g4Qm0wNE54MEZhbDRod0VaYWk5OFptTnVw?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <726FC1E76C90764CA0469ED109763AE0@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	2C2kjiCUKYsG9EjZ2VZojj2mfN0598qAKMIa+bLwEhIxHSYZfitwwBRZyuUI5pSs0WbVri92ndxMy51MGoK2NsHG2c26/JkepW4FoYpljTgdU5+7ZU6RRRPnqASva1CfcguI8ZeEhAr4VzxIrGwbi/2H4bPwmIVPvvxdRw+J7iq83YJ+mWk+gUB7ck3jFcAm1doTOoWhySEgYPsiTT40ojywg/0AW+clMLP+XYgJR9YWaTuBJRiVXjLxG61oOi/pKjb9HMqjjc/lhHqYKTFn9JNgiQRL6J2p2O8FTLbNHwv3ix/4+KX5FmMBWwovRM6TueRS8/P3uvkzHOOAlypTTzfkCLjM2enby+3L+wwjuMqWubDapttVRKuaz1JPQTdLAZvGa6votB+V90rUgf2QZlXgDs8DA8L1RTF1OEezMUFv0fO5Y22o4mcfuvIju0P8riUVx/x42yoKgNbLYD78A7wPivor+wBywqPPyPlEAQLod8dfoApYsn67l78Q+u49aIo2JM8pShT1DR85tf7IUU3ySVWc358YellyCLlP1aNoOd7/XAaOrZHIblFHLiGOWxoDDg3OmkVA6ItXkv2NnLsqRWPwpVewnp1N6zVdFa4Gfi1U6+HvrA8aukUJE96kUee6cDIsz4qagbxIBFenjg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c31133-acf0-4578-5bac-08dc1bb8c9e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 02:12:45.5134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WVhvYzYv/felHaUjUk8WtteakLQRuejLXNleQybnluNyz0m/Uo4IZblNbFrjmwwq+vrnv80oY1NpQsjmYu2hNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4532
X-Proofpoint-ORIG-GUID: C-XIeOm1RLDTRAIdbAEvT5FZhocrv2W-
X-Proofpoint-GUID: C-XIeOm1RLDTRAIdbAEvT5FZhocrv2W-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_12,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 bulkscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401230013

T24gU3VuLCBKYW4gMjEsIDIwMjQsIEd1aWxoZXJtZSBHLiBQaWNjb2xpIHdyb3RlOg0KPiBPbiAx
Ny8wMS8yMDI0IDIxOjM5LCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gWy4uLl0NCj4gPiBUaGF0
IG1lYW5zIHRoZSBkaXNjb25uZWN0aW9uIGlzIGluaXRpYXRlZCBieSB0aGUgZHdjMyBkcml2ZXIu
IFRoaXMNCj4gPiBzaG91bGQgaGFwcGVuIHdoZW4geW91IHB1dCB0aGUgU1RFQU0gREVDSyBpbiBz
dXNwZW5kIHdoaWxlIGNvbm5lY3RlZCB0bw0KPiA+IHRoZSBsYXB0b3AuIEZyb20geW91ciBsYXB0
b3AsIHlvdSBzaG91bGQgc2VlIHRoZSBERUNLIGlzIGRpc2Nvbm5lY3RlZCBhcw0KPiA+IGlmIHRo
ZSBjYWJsZSBpcyB1bnBsdWdnZWQuDQo+ID4gDQo+ID4gSWYgdGhhdCBkaWQgbm90IGhhcHBlbiwg
Y2FuIHlvdSBjYXB0dXJlIHRoZSBkd2MzIHRyYWNlcG9pbnRzIHRvIHNlZQ0KPiA+IHdoYXQncyB3
cm9uZz8NCj4gPiANCj4gPiBZb3UgY2FuIGZvbGxvdyB0aGlzIGluc3RydWN0aW9uIHRvIGNhcHR1
cmUgdGhlIHRyYWNlcG9pbnRzOg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRw
czovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9kcml2ZXItYXBpL3VzYi9kd2MzLmh0
bWwqcmVxdWlyZWQtaW5mb3JtYXRpb25fXztJdyEhQTRGMlI5R19wZyFlNU0xSkJlR0ZNbkItWE40
eHRtMmMtekUtVThZNlNwSjlQY3dILWtjNm0zSDY5U2RQZy00LXd2dk0wLVhaOGw0aUN0bEp0cHZL
LWRvVlJEWkJrTzY3dyQgDQo+ID4gDQo+IA0KPiBIaSBUaGluaCwgdGhhbmtzIGFnYWluIGZvciB5
b3VyIHBhdGllbmNlIGFuZCBzdWdnZXN0aW9ucyENCj4gDQo+IEkndmUgdHJpZWQgbXkgYmVzdCB0
byBkZXRlcm1pbmUgdGhlIHN0YXRlIG9mIHRoZSBVU0IgcG9ydCBmcm9tIG15IGxhcHRvcA0KPiBQ
b1Ygd2hlbiBjb25uZWN0aW5nIHRoZSBEZWNrIHRoZXJlLCBidXQgSSB3YXMgdW5zdWNjZXNzZnVs
LiBUaGUgRGVjaw0KPiBkb2Vzbid0IGFwcGVhciBvbiBsYXB0b3AncyBsc3VzYiBvdXRwdXQsIGFu
ZCB0aGVyZSdzIG5vdGhpbmcgb24gZG1lc2cgLw0KPiB0cmFjaW5nICh4aGNpKSwgZHluYW1pYyBk
ZWJ1ZyBvciBzb21lIHBvd2VyIGludGVyZmFjZXMgSSBwb2tlZCBhYm91dA0KPiB0aGF0LiBUaGUg
d2F5IHRvIGdvLCBJSVVDLCBpdCdzIG5vdyB0cnlpbmcgdG8gbWVhc3VyZSB0aGF0IGRpcmVjdGx5
IGluDQo+IHRoZSBwb3J0LCB1c2luZyBhIG11bHRpbWV0ZXIgb3Igc29tZSBIVyBkZXZpY2UgZm9y
IHRoYXQuIEkgZG9uJ3QgaGF2ZQ0KPiB0aGF0LCBidXQgd2hhdCBJIHdhcyBhYmxlIHRvIGRvIGlu
c3RlYWQgaXMgY29sbGVjdGluZyB0aGUgdHJhY2VzIHlvdQ0KPiBhc2tlZCwgYXQgbGVhc3QgaGVo
DQo+IA0KPiANCj4gU28sIEkgZGlkIDQgY29sbGVjdGlvbnMsIGFsbCBpbiB0aGUgYXR0YWNoZWQg
dGFyYmFsbC4NCj4gDQo+ICgxKSBSaWdodCBhZnRlciBib290aW5nIHRoZSBTdGVhbSBEZWNrIGFu
ZCBlbmFibGluZyB0aGUgdHJhY2VzIFswXSwgSSd2ZQ0KPiBjaGFuZ2VkIHRoZSBtb2RlIG9mIGR3
YzMgKGluIHRoZSBkZWJ1Z2ZzKSBmcm9tIGhvc3QgdG8gZGV2aWNlIC0gcmVzdWx0cw0KPiBvbiB7
dHJhY2UscmVnZHVtcH0uMQ0KDQpUaGUgdHJhY2Vwb2ludHMgaW5kaWNhdGVkIHRoYXQgbm8gZ2Fk
Z2V0IGRyaXZlciB3YXMgYmluZGVkLiBTbyB0aGUNCmNvbnRyb2xsZXIgYWN0dWFsbHkgbmV2ZXIg
c3RhcnRlZCAoaWUuIHNvZnQtY29ubmVjdGlvbiBuZXZlciBoYXBwZW5lZCBpZg0KdGhlIGNvbnRy
b2xsZXIgZG9lc24ndCBzdGFydCkuDQoNCj4gDQo+ICgyKSBQbHVnZ2VkIHRoZSBVU0IgY2FibGUg
Y29ubmVjdGluZyB0aGUgRGVjayB0byBteSBsYXB0b3AgLSByZXN1bHRzIGF0DQo+IHt0cmFjZSxy
ZWdkdW1wfS4yIGFuZCBhcyB3ZSBjYW4gc2VlLCB0cmFjZXMgYXJlIGVtcHR5Lg0KDQpSaWdodCwg
YmVjYXVzZSBhcyBub3RlZCBhYm92ZSwgbm8gYWN0aXZpdHkgaXMgc2Vlbi4NCg0KPiANCj4gKDMp
IEF0dGVtcHQgc3VzcGVuZGluZyB0aGUgRGVjayAoYnkgcnVubmluZyAiZWNobyBtZW0gPg0KPiAv
c3lzL3Bvd2VyL3N0YXRlIiksIGl0IGZhaWxlZCBhcyBleHBlY3RlZCAtIHRoZW4gSSd2ZSBjb2xs
ZWN0ZWQgcmVzdWx0cw0KPiBvbiB7dHJhY2UscmVnZHVtcH0uMw0KDQpJIGNhbiBzZWUgdGhlIGRl
dmljZSB3YXMgcmVzdW1lZCByaWdodCBhZnRlci4NCg0KICBrd29ya2VyL3UzMjoxMC0xMDc4ICAg
IFswMDJdIC4uLjEuICAgMTc5LjQ1MzcwMzogZHdjM19wY2lfc3VzcGVuZCA8LXBjaV9wbV9zdXNw
ZW5kDQogIGt3b3JrZXIvdTMyOjEwLTEwNzggICAgWzAwMl0gLi4uMS4gICAxNzkuNDUzNzA0OiBk
d2MzX3BjaV9kc20gPC1wY2lfcG1fc3VzcGVuZA0KICBrd29ya2VyL3UzMjoxOS0xMDg3ICAgIFsw
MDVdIC4uLjEuICAgMTc5LjkzOTgzNjogZHdjM19wY2lfcmVzdW1lIDwtZHBtX3J1bl9jYWxsYmFj
aw0KDQo+IA0KPiAoNCkgW2JvbnVzXSBDb2xsZWN0ZWQgdGhlIHNhbWUgcmVzdWx0cyBvZiAzIChh
ZnRlciByZWJvb3RpbmcgdGhlIERlY2spDQo+IGJ1dCBydW5uaW5nIGR3YzMgd2l0aCB0aGlzIHBh
dGNoL3F1aXJrIC0gaXQncyBlYXN5IHRvIG5vdGljZSBpbiB0aGUNCj4gdHJhY2UsIGFzIHdlIGNh
biBzZWUgdGhlIGV4dHJhcyByZWFkbC93cml0ZWwgcHJpb3IgdG8gc3VzcGVuZC4gSW4gdGhpcw0K
PiBjYXNlLCBzdXNwZW5kIHdvcmtzLi4uYW5kIHJlc3VsdHMgYXJlIG9uIHt0cmFjZSxyZWdkdW1w
fS40LVBBVENIRUQNCg0KRXZlbiBpbiB0aGUgcGF0Y2hlZCB2ZXJzaW9uLCBkZXZpY2Ugd2FzIHJl
c3VtZWQgcmlnaHQgYWZ0ZXIuIFRoZSByZXN1bWUNCmhlcmUgbWF5IG5vdCB0cmlnZ2VyIHRoZSBz
eXN0ZW0gcmVzdW1lLCBidXQgaXQgcmVzdW1lZCBub25ldGhlbGVzcy4NCg0KICAga3dvcmtlci91
MzI6Ni0zNTYgICAgIFswMDZdIC4uLjEuICAgIDY5LjYwMDQwMDogZHdjM19wY2lfc3VzcGVuZCA8
LXBjaV9wbV9zdXNwZW5kDQogICBrd29ya2VyL3UzMjo2LTM1NiAgICAgWzAwNl0gLi4uMS4gICAg
NjkuNjAwNDAxOiBkd2MzX3BjaV9kc20gPC1wY2lfcG1fc3VzcGVuZA0KICBrd29ya2VyL3UzMjoy
Mi0xMDI4ICAgIFswMDFdIC4uLjEuICAgIDcwLjEyNTI5NDogZHdjM19wY2lfcmVzdW1lIDwtZHBt
X3J1bl9jYWxsYmFjaw0KDQo+IA0KPiBUZXN0cyB3ZXJlIGRvbmUgb24ga2VybmVsIDYuNyBtYWlu
bGluZSwgbm8gT09UIGRyaXZlcnMgcnVubmluZy4gSG9wZSBpdA0KPiBoZWxwcyB0byBuYXJyb3cg
ZG93biB0aGUgaXNzdWUsIGFuZCBhZ2FpbiwgdGhhbmtzIGZvciB5b3VyIGhlbHAgaGVyZS4NCj4g
DQo+IFswXQ0KPiBjZCAvc3lzL2tlcm5lbC90cmFjaW5nLw0KPiBlY2hvIDEgPiBldmVudHMvZHdj
My9lbmFibGUNCj4gZWNobyA6bW9kOmR3YzMgPiBzZXRfZnRyYWNlX2ZpbHRlcg0KPiBlY2hvIDpt
b2Q6ZHdjM19wY2kgPj4gc2V0X2Z0cmFjZV9maWx0ZXINCj4gZWNobyBmdW5jdGlvbiA+IGN1cnJl
bnRfdHJhY2VyDQo+IA0KPiANCj4gPiAgWy4uLl0NCj4gPiBUaGF0IG1lYW5zIHRvIHVucGx1ZyB0
aGUgY2FibGUgY29ubmVjdGVkIHRvIHRoZSBTVEVBTSBERUNLLiBQdXQgdGhlDQo+ID4gU1RFQU0g
REVDSyB0byBzdXNwZW5kLiBDaGVjayB0byBzZWUgaWYgaXQgc3RheXMgc3VzcGVuZCBvciBpdCB3
b3VsZCB3YWtlDQo+ID4gdXAgcmlnaHQgYXdheS4NCj4gDQo+IE9oLCB0aGlzIGNhc2Ugd2FzIHRl
c3RlZCBiZWZvcmUgYW5kIGl0IHdvcmtzIGZpbmUgPSkNCj4gDQo+IA0KPiA+IEFsc28sIGluIHlv
dXIgdGVzdCwgdGhlIGNvbm5lY3RlZCBob3N0ICh0aGUgbGFwdG9wKSByZW1haW5lZCBPTiBhdCBh
bGwNCj4gPiB0aW1lIHdoaWxlIHRoZSBTVEVBTSBERUNLIHdhcyB0ZXN0ZWQgZm9yIHN1c3BlbmQg
cmlnaHQ/DQo+ID4gDQo+IA0KPiBZZXMsIGxhcHRvcCBhbHdheXMgcG93ZXJlZCBPTiENCj4gDQoN
ClRoYW5rcyBmb3IgdGhlIGxvZ3MgYW5kIGRhdGEgcG9pbnRzLiBUaGUgdHJhY2Vwb2ludHMgaW5k
aWNhdGUgdGhhdCB0aGUNCndvcmthcm91bmQgX29ubHlfIHByZXZlbnRlZCB0aGUgc3lzdGVtIHdh
a2V1cCwgbm90IHRoZSBjb250cm9sbGVyLg0KVGhlIHdha2V1cCBzdGlsbCBoYXBwZW4gdGhlcmUg
YXMgeW91IGNhbiBzZWUgdGhlIGNvbnRyb2xsZXIgZ290IHdva2VuIHVwDQppbW1lZGlhdGVseSBh
ZnRlciByZXF1ZXN0IHRvIGdvIGludG8gc3VzcGVuZCBpbiBib3RoIGNhc2VzLCBwYXRjaGVkIG9y
DQpub3QuIFNvIHRoZSB3b3JrYXJvdW5kIHlvdSBwcm92aWRlZCBkb2Vzbid0IGhlbHAga2VlcGlu
ZyB0aGUgY29udHJvbGxlcg0KaW4gc3VzcGVuZC4NCg0KV2UgbmVlZCB0byBsb29rIGludG8gd2h5
IHRoYXQncyB0aGUgY2FzZSwgYW5kIHdlIG5lZWQgdG8gZmlndXJlIG91dA0Kd2hlcmUgdGhlIHNv
dXJjZSBvZiB0aGUgd2FrZSBjYW1lIGZyb20uIERvIHlvdSBoYXZlIGEgY29ubmVjdG9yDQpjb250
cm9sbGVyIHRoYXQgY2FuIGFsc28gd2FrZXVwIHRoZSBzeXN0ZW0/DQoNCkFzIGZvciB0aGUgd29y
a2Fyb3VuZCwgaWYgdGhlIHdha2V1cCBzb3VyY2UgaXMgdGhlIHVzYiBjb250cm9sbGVyLCBkaWQN
CnlvdSB0cnkgdG8gZGlzYWJsZSB3YWtldXA/DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9k
d2MzL2R3YzMtcGNpLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNpLmMNCmluZGV4IDY2MDQ4
NDVjMzk3Yy4uZTM5NWQ3NTE4MDIyIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2Mz
LXBjaS5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcGNpLmMNCkBAIC0zNTksNyArMzU5
LDcgQEAgc3RhdGljIGludCBkd2MzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGNpLCBjb25z
dCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpDQogCQlnb3RvIGVycjsNCiAJfQ0KIA0KLQlkZXZp
Y2VfaW5pdF93YWtldXAoZGV2LCB0cnVlKTsNCisJZGV2aWNlX2luaXRfd2FrZXVwKGRldiwgZmFs
c2UpOw0KIAlwY2lfc2V0X2RydmRhdGEocGNpLCBkd2MpOw0KIAlwbV9ydW50aW1lX3B1dChkZXYp
Ow0KICNpZmRlZiBDT05GSUdfUE0NCg0KIElmIGl0IHdvcmtzLCB5b3UgY2FuIGZpbmUgdHVuZSB0
byBvbmx5IGRpc2FibGUgd2FrZXVwIHdoZW4gaW4gZGV2aWNlDQogbW9kZSBhbmQgZW5hYmxlIHdo
ZW4gaW4gaG9zdCBtb2RlIHdpdGggZGV2aWNlX3NldF93YWtldXBfZW5hYmxlKCkuDQoNClRoYW5r
cywNClRoaW5o

