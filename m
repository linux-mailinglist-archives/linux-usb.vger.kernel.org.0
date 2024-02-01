Return-Path: <linux-usb+bounces-5715-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AC3844EA2
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 02:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 652EB1C27EED
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 01:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4701442D;
	Thu,  1 Feb 2024 01:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="g2w0XNs9";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="T+CyuAKl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JQ/DDjog"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1284C75
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 01:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706750670; cv=fail; b=A+j+f4q00hLc9ySerjZL8yM1zIzk8aOZ5sgcIPT/YcDROtTi4Bk0Oz6Ho6yRkMV8hSDh0GnhNIyNpe4wE5G4BD6CgRX8bpfdvtMxqRq+Jr3fONI46cXHvT+uEIA/GH+6rUEmacSJ7/BFi/yU8v0tNkukhgZCG0oVm/0G1ioVJDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706750670; c=relaxed/simple;
	bh=OHBxd29zSgStHfJ/qjwKzrxpINX1ttlnngYkzS6Y8YQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iTen8f/SJDCoychW7/TwxGeHR2oIKngTKha7Qih+cY7qfQN5RGngVionMYDAkyvAXT2qQSI8Q/kTtpnNLYaYub9eI/DKein2DJ4LLTdwW34Rg+/vMEN1zNnH8380QkIfUac3C5splTzMdq1w5oUqckL/c5KHQWQUrBnUH7VJx7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=g2w0XNs9; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=T+CyuAKl; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JQ/DDjog reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VKLas7003527;
	Wed, 31 Jan 2024 17:23:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=OHBxd29zSgStHfJ/qjwKzrxpINX1ttlnngYkzS6Y8YQ=; b=
	g2w0XNs9FLZChEhLwj/2P6wtfZ+nR9fQAdLt3RcOv4YfKan2BQ2/ulcrsKTBhuBZ
	73nfe8iLzC/oJVS4qWBk3gvO1Okz17GA2I7FeQwpTod64vXRz9RTnvhZUlY5KUbF
	E+wjVe+UtO0L1jnp42NFOHCQjVNa52wYPwSyTYyTzlXLFYvrQtckU2jnE0uiAFco
	lt4BAwgUvNzicFBOKrVp5Am6a37elohTuCi75diij3p2gSQUOLl2kwfjz5jyMAG7
	J4WmuYEsXBSp+QENTVlRq4str/DaLL9Nyz2ao7KRWz3KFHVKQ8Ve7FMKoCLNnRA3
	lx4/pmC5tSrP8gj2Se7X4Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3vw1qpmcw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 17:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1706750623; bh=OHBxd29zSgStHfJ/qjwKzrxpINX1ttlnngYkzS6Y8YQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=T+CyuAKlDhILMO00g1zQVz4gYGFNOpL+ofKeT2fk5Ymh4JI4qsQTjTlQb0GKl+NDI
	 e81UnlNueV6wrFVhTRWwynU3UPVGlRc6aY5KXb1qIDjbBFuBquNNRAFdIWaGO05k0r
	 /nIWEW/9Sg5DcgcdhI0RUhlq7hzetf7D0gNDEnFOY/CqHWp6ni7o94gAZA4MvlAIbx
	 8FtW+UZkZAcK8UKNEJhTRC47oMBAMu4B6ITSq4YAkTn7UPf9ur0v6CJeChGc4JKGSj
	 3qaTAr4bMw279TYjv38vdmmpXiu32Urb/iVGVMOCLy+x1d1GVVso2CN8jMst2xFE1Q
	 NF/UzKFPf/efA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 24986401D4;
	Thu,  1 Feb 2024 01:23:43 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 54B53A0071;
	Thu,  1 Feb 2024 01:23:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=JQ/DDjog;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 528314013A;
	Thu,  1 Feb 2024 01:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDP7/nZYVfn1AUjNqxCQDndUTamFVHbhZ+bX5etq6+2FiYRm1+oqlvip93BF+9q73HYdctUPzQ/gWuhEassOj2XZMOjxSiVmV6a7ZpTWFHOfaRjGIkPI0o1QYGBDp9fMZD7t0LWyMpNjAeTkhYsTFGBlGUiVbWm67DozHxr8h8UdaXZbDSsLDdSaFyrHXegojuD1mvMqjRmZ3pj8/CzjZ8sexe90KQnv5iBvc8u6Xd+4GwPg3Ms44ZGmxQardZPzHiBF8ba6yN6ThmJQ+tHfdytyuSVu/l5YZbRamGP4xoAC2ajWYwzFBiARz756GVmkvdmrK1XHpJneBbicGFRRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHBxd29zSgStHfJ/qjwKzrxpINX1ttlnngYkzS6Y8YQ=;
 b=lWZUUIwDwX1AOW3rrlxYOCyCrKj01wDzqY6L6BH+bDfmb3KrTh/txD7tsa8ZBRi0bWjVEuQtWUDLP62U7nj6Y5ROahAajMVM5m32NBnfqM/s6+VSAHZHyMHKWxsKbnTVmzFJe6fJ2fa0ZShsjVplU+mIn1c19QNMwT2oP52COoZLcJdio2W3SeVPwSA7dPKXxZ97z0DE7jzDmLCq9b12qRpJp1VKYecT9DHNy5zRVvf6YUQC0VeDxwAPJBKudD0bEst93cgo9y+mfK9O27XQqV8M7uwtObHJxuMI1iacyE7tepcGvaXdxKx3mIoqjCAVYJKNGyPzLUSGwrXxfsZ5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHBxd29zSgStHfJ/qjwKzrxpINX1ttlnngYkzS6Y8YQ=;
 b=JQ/DDjog/nCSngOhy2SBAZpeAO3PVPRyCBgBTnTvZDq8pQzZJmNTOk2tH1cc9n/9HTyQqJ1ucVVZ+7RTx8BBX6DWNWdlPMVI4JrTqkrj0eGyf+mQRiiH+7S8UdNq+bFWXuKqtTcmKW+vGrfUDDL5Y1CA6nByrXa4cj4pGnNRAHg=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 LV8PR12MB9155.namprd12.prod.outlook.com (2603:10b6:408:183::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.32; Thu, 1 Feb 2024 01:23:31 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::62f1:63af:9a29:35ba]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::62f1:63af:9a29:35ba%4]) with mapi id 15.20.7249.017; Thu, 1 Feb 2024
 01:23:31 +0000
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
 AQHaHWVQyO2xJEu1EUm3AscfDvsycrCZEZEAgADm+gCAAN61AIA3OYEAgAIYloCAAO4SAIACLscAgAWsYQCAAIyKgIAAqmqAgADpX4CABdZRgIACH0WAgAi5FoCAAkh6AIACnmOAgAAQvACAAGaPgA==
Date: Thu, 1 Feb 2024 01:23:31 +0000
Message-ID: <20240201012327.kaq53xmtvxvggp7d@synopsys.com>
References: <54a9b6b6-ef41-f76a-43e0-a395adddb455@igalia.com>
 <20240117003437.mxgo3ebxql4ftwjt@synopsys.com>
 <8b49285e-46de-c52a-ea8d-542c91ba4128@igalia.com>
 <20240118003949.tmw3uq76hvwe4ylz@synopsys.com>
 <e2d02355-b47b-8298-c5c9-8c6d199b2728@igalia.com>
 <20240123021237.hyckfhsxvem7ydqv@synopsys.com>
 <dd3339b0-75ac-b64e-4dac-d9394e91baef@igalia.com>
 <20240130021704.ndbkkyksauku7nwr@synopsys.com>
 <29ebf575-e09b-4452-ed60-41a667e78c5f@igalia.com>
 <9e21fe04-6571-2c29-e40d-4d16b55ae46e@igalia.com>
In-Reply-To: <9e21fe04-6571-2c29-e40d-4d16b55ae46e@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|LV8PR12MB9155:EE_
x-ms-office365-filtering-correlation-id: 70d5d663-ae45-4b0f-5c89-08dc22c466b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4kC6xQQ7FpduItkHVYIaZxsJlWULZe0GiD/KiTWzUJWPlsQATZrT7zKTt1e5DwDymQFA64vXXreEmCRdm/MWyP1cKtJ5E9G2KBAoR3wx4W3FAUWDST95ECKhV6k0TyWd92pDODqiZeE6HInWcP5P1kj0sJRlt8ATTBJac8wd4pd41848tvsW3iKb1JHRkq98cXDpa4FuU6mN52KO2SCrFnM66rgSynfYn3egpexIU3GgkGNCxnXaHTGfnq3fTOLxH9BwT8q7TcpP2JhOd7RoD1zeKmyH5CUddUFwS/V170ZZSl48KxDv6VPo0Cx400n45ct7LbYzbWbq/v6vlqtsmlIPVrG6a9idl4bCRkZTkStFB1E3udYxdOq2BZm3D79EgsMLDT0qWAC3cDhvCvzLD0f+YxFAeUqwrRLlt9WPbn5j6GbxY3XcBSPbuXSgX0XcdkwjDIENU8dbGH0U8C4ldUO/hXY+Phy7UBnYpHCQAuv/w4fqMYbVTfntGHKO0gt1WMBPfzM9LBYP1UKK6I03rFLAXdckyj3PEPQNROCoq1/UBpb4btbFzqEqetTooc9Plk6cAWMqpuaC8G/xK1idrRch0cadflIMcgYk0RONCxHaN6BUPaCuTb+bVgEVEYIS
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(316002)(66446008)(8676002)(76116006)(4326008)(2906002)(86362001)(7416002)(64756008)(8936002)(66946007)(66476007)(5660300002)(54906003)(66556008)(6916009)(36756003)(38070700009)(122000001)(38100700002)(53546011)(71200400001)(6506007)(478600001)(6512007)(6486002)(83380400001)(2616005)(26005)(1076003)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M1VyOTZFVVB1akFXU21hU3RBM0VpTFVZbmoyRDRUUFVvOThmc1FUZTIrQjkr?=
 =?utf-8?B?MkhTQjIxOGMxaVZ1SE5yZS9sRW1zUVhFaVVXOUxFbStqaGt5N3pLQzh2Z2or?=
 =?utf-8?B?UTg1TEhSTmlVaVd1ZW5LMitWN3dacjBFaVhickhDeTBoRTZqVUsrVE1DUVNn?=
 =?utf-8?B?SVFsOVUvUGJoaGVJbU1ZZWg4WjlVWmhDaHN2alBYZEJoblFhQ1psQnp2YnM0?=
 =?utf-8?B?MVlVQ2lBVXRGS0VQMnFPTHNWcnRIUmRtRHVjZzZ5RHBxcG9jTzJRS204Ym5w?=
 =?utf-8?B?OC9xVkRsckFueGE1VmFsOWtjYlVLUEc4bjAzNWhJZmsyWUY4QnRZSW9SYVNO?=
 =?utf-8?B?U1dJQWgvbHVnWEFpbkl6TUtKa3VoZ3VpaXNkblY2cjhiWUFWL3luQlRQdmlK?=
 =?utf-8?B?bnRnZUE0Mzdpa3l3dVk2cG9BU241K0Q5UEFOaGFNSFUwalF6dWMyNXpWVDhp?=
 =?utf-8?B?VFE5cUlsZXd2UzV6eDhIZnJYZWMwcTZaL3l6RnFVL3UrY0NhbE1odUFVdDBM?=
 =?utf-8?B?WkM3bCtvRk1PeXU5eXpNT3RqNjdqdmVJMWxCOTVQSU9OVVZNWGJkWElnaVN6?=
 =?utf-8?B?UkM2MWZaeFpFbWhVcXovVzBOYWJRTGFoRWdWbSs2ajNtVUYzSGRnZGk3eUhR?=
 =?utf-8?B?V1llUUJWZld4YWdxNGEyNmNiQ3A0U1lTZnBlaVpPS0xtdytONUJTSmZhT2FV?=
 =?utf-8?B?R2o3WU1NNzBoV05CZEpoTUo5WFJ2UDI2b0RPbUw5eWdFKys2aXk3cDZZcklT?=
 =?utf-8?B?VFYrdk5sQnhyaklXZHlYMyt5R2hZcnhRTUFQdE5SS2J5Y1dKMElxZ0ozZHBK?=
 =?utf-8?B?SGZwNmNKN2tCakI3ZDVFSWRBTFFUUkd0S21YTi91SEtpeWRkZDZwY1pQNXkr?=
 =?utf-8?B?UGswOEZqbi9IcFdjVFJzSWVOTjVrR3J4Q2RGU2hFUllzTHFWQ0xoMzltejkr?=
 =?utf-8?B?TXd1MUZWSU43aTJTL0FRbUR0TWlnVEhjUUJaY0FrYjlORFpkdEZLOGRHd0I1?=
 =?utf-8?B?Tm9kSEJSa3E1ODNIK3JVUWswWlRGY0dpZjRHakFDaVp1RjRzdHI4MU9zOGhG?=
 =?utf-8?B?cmJQbGczSEpyUVZOQzZ0cGdPR1NSOTFBVVZOUkg3cVdVSkQya2ZsRmN2OFBk?=
 =?utf-8?B?eDVkaHovRllpdUpQUkhCS3BEQUE0MS94cGx3VjFmZzBLN2JzUTdxSWhINEN0?=
 =?utf-8?B?ck4vbzlrT1ZPN2lvNGZXT3dIa0hBY2g3UFkxSXpsN2NYOEhjMGRrbzBZSmxr?=
 =?utf-8?B?MUNTSm1QU1p3UDFZK3Z2cTN6SkVCenpsS0NmQSt6NGFSNjV5aXRLaTAvVUJa?=
 =?utf-8?B?MXBZNC9udEJGbVFTMXlNU1BlUWJaVFFpcVM5a3NBWUpCNm1wWlNpQjg2Q1pz?=
 =?utf-8?B?YVJjWm5WM2o2ejVzS2x3THFLQTBjeFc5UEhNTXd6bGlZZFk1aEtOVjhMSHV0?=
 =?utf-8?B?UWhiTEJMeUwvMC92L2lqcWNlcmZqQlFLVEZPbWJmNTEzUlJ4SllnNGQyeXdP?=
 =?utf-8?B?TWxjcVVSR0lxVlp4aWpwWldyRUlUWXF3N0hqK3lrNWtHNnlOaHpvdk9VMHBE?=
 =?utf-8?B?MDVweXBtOTRFU1FLTVJqeGF1ZTZJeUZrKzhQMS9UeFVQNFlmRSs1OGVka0li?=
 =?utf-8?B?dWpNOXVWZy9FRitIYUNhSy9KRFM3Y3JmWktjSis0UENvVjJVRkNLK013V0h1?=
 =?utf-8?B?SlhoNlY4QnE5N1BLd0JwVmhqMVZKeGlucCtqR3JWdWZuQTRocW5jUzRlMDJT?=
 =?utf-8?B?OEpqbzB1YU83NHR3Y3ZPWFJ2MWQxU01wdmRJcEJoRDlWa01OQ0VjMFJUNDlk?=
 =?utf-8?B?Q0Fpd1QxdDQ0NnlFMkU2dDNnV3lXd2U5SXNZZ293SUdidkozc2Y5a2p3Vm80?=
 =?utf-8?B?NGVHcVVHb2FzYzVxMjIvMzhzdXhsb0xZanlCVjE0QWQrVVZqRmQwaWRKNUFq?=
 =?utf-8?B?QjY4N2N4UlhEVU9xY2p4UjBjbjJxalcveVVsaE9hSjJYQzlyL2tBWjhCSG8z?=
 =?utf-8?B?RTAvbngrTnlkeWxPcG9LVHdjaWRZejAxdUhKL3lLYy9MNGpqU3ZzZSs1Qjh2?=
 =?utf-8?B?VlJPcGNkTmx3aDduZ01QMGVmYmVpTVQxbldkc2ZlUkZnRVBha0QxWVpTamp5?=
 =?utf-8?B?WG9BOEJhdHY1NStueE84UjVRbFNqY2txcldpeHhzaG1uUHN6ang5NzNRTmNx?=
 =?utf-8?B?OXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA4E28EEB27A3746836FE5F28D8049D9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	5BqHcVZlHc3U5PmqAPLJs/T6L2sH4OLvfBTFwTcMUF5Jmhvvmbw5jJqVwIDPIxXFPB4mSz+kCpl0DM/UvtF3htWdHZkn3PIi/JgBAqJjZAhUfe4V2EQRoSD11DPNQYT6V3wbvUhYDHJk5rn6n7R8kZVEZgGLY3vAug9gD2dT/K3IEm5eMKQA34Y9td6iKIO82xCLgtiHJO4BogBwhugkk30aFnvspzu631GfDKeQc3clTNwWVE0UoSmpLqqy9U09l3IYUtcG0HwlH37CcR6EMlcPb4Aa7f6FY1d6lnuGAQRt+FDe19iYxX8nFxZE43+RTcVxsqbPxNv1O9S/xoXQE21ADHW7dTkHNa4gJ0hWwkLA1yrnSwsaTlsTlQxj1OdI/wlBW0ctFGxNc6vjVMVx7pYqrWGM4vJVftXrRhsKt9aK2N4EEQoTyvm6aQTn5H7b6IL75zUEpSLEA90EOe5jHfetzuW03hBfZVRHLvLGxIU3B4g5snDx9eSUaQh0xmGKoXFuyEOu/zhn0/jwNF9YgSmW8xZOYj4qesoxDZflJ/ZMURuETUzy15JD2qWkXEdOLwBNR3bvyBerShZ203C/vVbqEYL1OIAKAdtQTtAAVDhcghlSqqUbHWLcs6iBP/tBGzwxfMEwyq5LkNKBITf7kw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d5d663-ae45-4b0f-5c89-08dc22c466b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 01:23:31.1943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bOc6pEqL4KOZ0h9zrlEYEV8/ERGqNEZ7G50OnJ9iwImPTXIN/ofFB4spHJSq5d7HloHqa5t1G6FW0rUaiM1SJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9155
X-Proofpoint-ORIG-GUID: 9rX6KLCBNEgH_fQcUyoSqIxKqAhbZqY2
X-Proofpoint-GUID: 9rX6KLCBNEgH_fQcUyoSqIxKqAhbZqY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 mlxlogscore=597 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2402010009

T24gV2VkLCBKYW4gMzEsIDIwMjQsIEd1aWxoZXJtZSBHLiBQaWNjb2xpIHdyb3RlOg0KPiBPbiAz
MS8wMS8yMDI0IDE1OjE2LCBHdWlsaGVybWUgRy4gUGljY29saSB3cm90ZToNCj4gPiBbLi4uXQ0K
PiA+Pj4gQW5kIGZ0cmFjZSB0aW1lc3RhbXBzIHVuZm9ydHVuYXRlbHkgZG9uJ3QgaGVscCB3aXRo
IHRoYXQsIGl0J3Mgbm90DQo+ID4+PiBzaG93aW5nIGhvdyBtdWNoIHRpbWUgdGhlIGRldmljZSBz
dGF5IHN1c3BlbmRlZCwgc28gaXQgbWlnaHQgYmUNCj4gPj4+IGNvbmZ1c2luZyBhbmQgYm90aCBj
YXNlcyBjb3VsZCBhcHBlYXIgYXMgdGhlIHNhbWUgZXhhY3Qgc2NlbmFyaW8sIGV2ZW4NCj4gPj4+
IGlmIHRoZXkgYXJlIGNvbXBsZXRlbHkgZGlmZmVyZW50IChmYWlsIHZzIHN1Y2Nlc3MgY2FzZXMp
Lg0KPiA+Pg0KPiA+PiBUaGF0J3Mgb2RkLi4gbXkgYXNzdW1wdGlvbiB3YXMgdGhlIHRpbWVzdGFt
cHMgdG8gYmUgdmFsaWQuIFdlcmUgeW91IGFibGUNCj4gPj4gdG8gY29uZmlybSB0aGF0IGl0J3Mg
dGhlIGlzc3VlIHdpdGggdGhlIHRpbWVzdGFtcHM/IFBlcmhhcHMgY2hlY2sgaWYgdGhlDQo+ID4+
IG90aGVyIGRldmljZXMgaW4gdGhlIHN5c3RlbSBhbHNvIHdha2V1cCBhdCB0aGUgYXBwcm94aW1h
dGVseSBzYW1lDQo+ID4+IHRpbWUgcHJpbnRlZCBpbiB0aGUgdGltZXN0YW1wcz8NCj4gPj4NCj4g
PiANCj4gPiBIaSBUaGluaCwgaW5kZWVkIC0gdGhpcyBhIGJpdCBvZGQgcmlnaHQ/IEkgZ3Vlc3Mg
dGhpcyBpcyBtYXliZSByZWxhdGVkDQo+ID4gd2l0aCB0aGUgd2F5IGtlcm5lbCBrZWVwcyB0cmFj
ayBvZiBjbG9ja3Mgb24gc3VzcGVuZCAtIGRlc3BpdGUgVFNDIGtlZXBzDQo+ID4gYWNjb3VudGlu
ZyBvbiBzdXNwZW5kIChhdCBsZWFzdCBmb3IgYWxsIG1vZGVybiB4ODYgcHJvY2Vzc29ycyBJSVVD
KSwgdGhlDQo+ID4gdGltZXN0YW1wcyBpbiBib3RoIHRyYWNpbmcgYnVmZmVyIG9yIGRtZXNnIGRv
IG5vdCByZWZsZWN0IHN1c3BlbmQgdGltZS4NCj4gPiANCj4gPiBJcyBpdCBkaWZmZXJlbnQgaW4g
eW91ciB4ODYgc3lzdGVtcz8gT3IgbWF5YmUgaW4gb3RoZXIgYXJjaGl0ZWN0dXJlcyB5b3UNCj4g
PiBoYXZlIGV4cGVyaWVuY2Ugd2l0aD8NCj4gPiANCj4gPiBJJ3ZlIGRvbmUgYSB0ZXN0IG9uIFN0
ZWFtIERlY2ssIHRha2UgYSBsb29rIGluIGJvdGggYXR0YWNobWVudHMgLSBzZWVtcw0KPiA+IHRv
IGJlIGFsaWduZWQgd2l0aCBteSBwZXJjZXB0aW9uLiBBbHNvIGNoZWNrZWQgZG1lc2cgb24gbXkg
SW50ZWwgbGFwdG9wDQo+ID4gKGk1LTYzMDBVLCB3aXRoICJub25zdG9wX3RzYyIgY2FwYWJpbGl0
eSkgYW5kIHRoZSB0aW1lc3RhbXBzIGRvIG5vdA0KPiA+IHJlZmxlY3QgdGhlIHRpbWUgc3BlbnQg
aW4gUzMgc3VzcGVuZC4uLg0KPiA+IA0KPiANCj4gSnVzdCBhIGhlYWRzLXVwOiBqdXN0IG5vdGlj
ZWQgdGhhdCBvbiBzMmlkbGUgc2xlZXAsIHRoZSB0aW1lc3RhbXBzIHNlZW1zDQo+IHRvIHJlZmxl
Y3QgdGhlIHN1c3BlbmRlZCB0aW1lIC0ganVzdCB0ZXN0ZWQgaGVyZS4gQnV0IG9uIFMzL2RlZXAg
c2xlZXAsDQo+IHRoZXkgZG9uJ3QuLi4NCj4gDQoNCk9rLiBUaGFua3MgZm9yIHRoZSBpbmZvLg0K
DQpUaGluaA==

