Return-Path: <linux-usb+bounces-9126-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D4989D83A
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 13:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4297B289744
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 11:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3EB12EBC2;
	Tue,  9 Apr 2024 11:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ax4G7xff";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OANbIcrL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Zb5mj+67"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A23E12D75A
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 11:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712662756; cv=fail; b=QYWT48/mDO9zlG+lRJtceCZhLa/pS0YhvvRKdB2kQKcLlyrzXzdo2Oa03oSidnF4IveKSVCWZLEWNZhL9LnnDCESjFbj8Gd7/KN3j26skv54kq6/IzNxqtkJDaeXgra+RzP3scvqjHRnBpeyYzhuaGLT0lxyTLlcsxlOliHTlX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712662756; c=relaxed/simple;
	bh=6Ej8iZUwEYBef0D7JutTk862111HBLa7T2555ECvOK0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a2Wv/dsfrUgxvMgIe7+uSge1M8R2eTDc87gECKWV8tYwYQKpQhE80kenZiLyKtuYuc7V4yKMokOa5FT9CyWZPkr8KsdUWfgfyHIBk1Uq2Ntmr9N7tGw/Reze7i0vrc2hB+0gqqJDuIN4PiaJ9HZeDMpn83kQZGHahDdzkbRkevk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ax4G7xff; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OANbIcrL; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Zb5mj+67 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 439B1Nas015434;
	Tue, 9 Apr 2024 04:39:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=6Ej8iZUwEYBef0D7JutTk862111HBLa7T2555ECvOK0=; b=
	ax4G7xffhl78lT7IZZobQJXsuNl1kBiCDKWuePLtHkWkPnKJ0mI7Vw8OmNT9SMVr
	zpYEPaH8PeFP1DvKVYKQEHEqto9BvpW3kY3H5dKty2YQYdRZEylELe9uSJFd0yhn
	JsyXVE255caLlLc/sigc127UizQo1jbF6zqEoLmnNPKGT5c4iFweZnGwgWbVH1Rw
	X7lWK7eVh4Ksd7ahZIZzPmKkpZXo/+IsIM/8hcd/JG4DxSwFnu2/Uinm9x3s8ED0
	fkb09I85UfS9ZPBtwfglbKZOw6Jlps9AzJRf8F7XFVGmy2kENwpFkHH4hio+DkFy
	paL8gbVRftTUvqGW6Vo+6Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3xb5n3s6pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Apr 2024 04:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1712662751; bh=6Ej8iZUwEYBef0D7JutTk862111HBLa7T2555ECvOK0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OANbIcrLmyBEfl6cdPiPlMTJpc/1KiSEEVOI+1ukKVCe5HddVDyqYoyJ/r9xz0TOo
	 y3usF5k5dM1ysEhp5PJuyc1f0Vc5l63F04+6YgkdXQhb00aAnS24jwXFaf6vfFso+u
	 JO/GQ/2NMyQtd5FDtSKABhPbfT5AZpNDSpXh58v8amC+wDp5wh39mZ8hHEVibtJtp9
	 uVl6SVeM+DLXnZiHDhItA4uv9qQQiTWCHo+GGchd8XTuplbF8pcgqhxaOdtRJyIElP
	 eUntGVdZuWaYLedb3w53YAoUpHQ9wFECN+xdVyjp+19yqoOi854dtXlWEsU6mNqM3V
	 fD6iugN9BfYQQ==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 88C9B40349;
	Tue,  9 Apr 2024 11:39:11 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 209CAA005E;
	Tue,  9 Apr 2024 11:39:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Zb5mj+67;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 50927404D1;
	Tue,  9 Apr 2024 11:39:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G701XZc0FVXz61Fqt96P2FGAgMOwMk6N1BI5pXbY3UIbXXZH8AjCQfzE0XSFv8zqIYfuNCCJz+14czMK/CjADJPbN/JA/R5+8Cujk53uf8XJ4rEMNNNlFkfvch6FXExqW0C/h+YnXBjwyxyjjOBLCcmy/ABZgemmEjaROFH55CTC00V3UAqpBkr9vUuWWM7uuG38nZe+1LKVj1Dzau9ktVX5ctUPrcsTmFFnpXLPbxbX+6C7qxAeUTGg1DwOxOSRrxG1LMD0lbfWOYpHKotcGVt6QLgwahH4pnML9TrW88Cncq62oVg/ABuFE9RIs71ctcVTUDXeHb/Udj0Vluf0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ej8iZUwEYBef0D7JutTk862111HBLa7T2555ECvOK0=;
 b=gc0rJwpy2dyQXDUjnMlrS5W6oIJHwRELrEz+Xusm5R6nyl/40TP32hAaOLEc2e0T6gJVwklKMKbJOQo9AN1SGG4c6bF1gotmgR749oaJ8kKIAy0KXDd1M+SiXxF73KyJD6cj7qo9oLYdVLYXc37M3eT4GN5q0t5EyKSGqwA+QGG1le8ei7GGdYz0eI15zDiMaFpWaD3/DWFtbxobIy0+AZKwjbC8zIgqzqA6WkOYWITaB++B1/wl0KYUfQRt7NrFqY0mi0hwxPwSUOM96g9RLd5zqTrhazNu8qlcyAGBVSoCa22SuxoxuaO6EWcj6WlujeeVvsq6M/A8Tf6a3XWQfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ej8iZUwEYBef0D7JutTk862111HBLa7T2555ECvOK0=;
 b=Zb5mj+670ThJufRlPUSKO9lkHzEpZpKrZWaU7FJ0/RqCF1EVPcieiu5LIPGhglIx41WOoWpC51wF9vCkMS9O4xvpWIJWwzdAis+XmNm1mq8EgtgXwtAcMD0apKQade3Z6vHd5/JBLlmgZXoI+SdVeLIBSsdEkk16mS9i4Lmil4U=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Tue, 9 Apr
 2024 11:39:00 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 11:39:00 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc2: host: Fix dereference issue in DDMA completion
 flow.
Thread-Topic: [PATCH] usb: dwc2: host: Fix dereference issue in DDMA
 completion flow.
Thread-Index: AQHaimWZuxHaDJEmgk6XQBdj0Zfu6bFft5wAgAAYnQA=
Date: Tue, 9 Apr 2024 11:39:00 +0000
Message-ID: <5a9376a4-d60d-1c27-4a41-5796000bd023@synopsys.com>
References: 
 <30794381684043b7083bb873d82b012254e033f5.1712656793.git.Minas.Harutyunyan@synopsys.com>
 <2024040936-dosage-marrow-c1d6@gregkh>
In-Reply-To: <2024040936-dosage-marrow-c1d6@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|MN2PR12MB4189:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MglGi/3Xoq+PtjK3nfwjEacjkGpExstJYMtNxqWXI5xolUoJZAOe4FVtN6Mw+XXaVPsjntOyOXI6HvebWtXA0C05e1N0mHKxwVYOakpfEpuE0YmXf/MW9TJXdQbu9yONVkrMokx4obLVaq9ja1rbSvTANqKLgURdkgybOaapyJsM7fvg/r4hZCfkPVpgpUT1meTIWTiSHa7u2S1sqxKK6mLixDumRznvAl4F/FmAUGxwiJ9qLoPEM2vvnzB71MCnxN3dtHvqCOHgn+F+DGVz9xotwxM3rHfyJP9uSUOndtHiTXjRhOlbbDrIqYm3i38OlDW8B+xmU3ZUNjZR4vGv/tZHi4rz7vBsGltVtzJqk3Hg3DLlqoHKWOmHM90G+wx0BdqNxM5eoMCBfHrd+VPrpYYUu2E5H24IBLow+UR3UqufHCDxDWyLSOyOM59Hs9k4Wc9E1fRGvRvxpzI0/EW4CQklkKVILhZyzgjculO+UmEmeRWfdwUHeBjtLiAR8jkWOIxm4o2mDvQEhlyyWEhS7VpNxzcBlINOSGvQQ24ZbaGAfz8rXpUEvO0HDDUSRFO2D7KvqnUaflDX1RpdUzgQ0QvNHUBOGbBLWWS9sE2lUl6Cx/f0IR+eNnOCgGMks2FdQpky1ic/zaLEmgQuOWmnJ9Fi2FrCpJwevkw8Ku2hj2Q=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YmVHWXA2NVJzNmJNYzNIaVN1cTRoWVhHd0tycmJxY1pyRTZSUGF2L2Q2YUl6?=
 =?utf-8?B?TXRQSEFMWXlLU0s1RUtyUzBaSlM0VmZMTFlYYVlSUnRoaU9QS1hFLzE2eXky?=
 =?utf-8?B?UXhtOUZ2cEpOdjdyc3lQbTkvWHIvWlp5MGsxN0NsbHM1NThNeVZQUmpJYjl4?=
 =?utf-8?B?b1dCdUNkRmkvVGtCSDhpbWRSWUxocFg1YXhtWG5HbjNCaVRSejJvVnFJRkhH?=
 =?utf-8?B?OVBHaGVIZFphNzFsSTZ4UDR2R2w3S3U1ckdJQTNUS005ODd4dkl1ZzYrd2I3?=
 =?utf-8?B?YW1JYlpFdzFCWjFmRG1XUUQ4dUQzOHN6WTBGdmdkRWVNTjVUWm04WUdFT21r?=
 =?utf-8?B?ZTZmRkFxaFltVWhBSDEzdGd2U3B2SjdTKzd4K28vVkRNTHlsZGFjU2dTaEUw?=
 =?utf-8?B?UHdWdHoxQlVsbXplMi9zR0h6ckcrS0NxZzlyTzNNcWg4UjBXdC9hdmRXY3NB?=
 =?utf-8?B?ZmV1NWpzKzdpaU15VWRLeXZobHpnTXVFY0cwUnFENFNITVRFVGhObTN4aVk1?=
 =?utf-8?B?cU5CK3U1Qk5DOWdVSnFZMVFLNDlmUTdzbHpRNEJPYVdLV1Exc1ptaFdlQWF2?=
 =?utf-8?B?Tjc0UDhadFo4Z0hCcVREbktYOUw1U3QxS1N4SURNTmM5a2xkYVhyL2tOSk9S?=
 =?utf-8?B?c3NOVkR6L0ZMNjVONnVqNlJVVjZreW1GWTFRZXpzdWN3WWkvMVhSOWFuMUxv?=
 =?utf-8?B?c05mdTdaWTRGL01wTTFMWFRpeUtrSUJCRHo5NXJKVlBhVTNCTG5OU1ZLTWUy?=
 =?utf-8?B?bHhGS1pWM0dwU2JpY2tnN2RwdHBldFltK0hIOW54TVdIVUhZQzFEMEFiY0JT?=
 =?utf-8?B?RDB1NTNUeTQvdlIxV3dXdzVxczV6KzB4NTZLd1F6WnlYTXhQaU5pWUJ2SkFm?=
 =?utf-8?B?aVcxaGl5THVERzVsVjR4ZlUvV2tVaG9TV2dLN1l4QllSMVdnaEp6NmpZVVpM?=
 =?utf-8?B?NG5yQ293UnRWTkxORUFLeUc5SHBGS3A4SFlQc3RwT0dObU9DMnR5OGVDUGdX?=
 =?utf-8?B?QjhqT3hVSHRQMnM4ZlZ4am1HcFdqczFQMDMwUERCSS9BYk1lZVVnN2JZdmFD?=
 =?utf-8?B?dzhadHdaMW8yT2o4eU1XTUQ5Z3V3eGp6emhXQmIwUXdLOSt6dUM4cWx0c1Z5?=
 =?utf-8?B?TU9ON0JkWlJjbktHeWJFbXlRUXhPdUVHa3NnVFkyVTYvbUZ4bGNBS0UvWEhp?=
 =?utf-8?B?QUtubGVnSjd1NEhtZzNVYUl5cWtmZlZuMkdiajN2eFJ4OWZadmpaU3p2TVU1?=
 =?utf-8?B?Yk9LTHlsOEltejRoODZyVlR3bVZ5ODZVU3EySXhXM2ptcE1XdVdFRk95UWo5?=
 =?utf-8?B?YkdyNlBJOGdIV1c0c25xVmp3Tm40cFZuSmdwdU5jY1FjZzQwU3lkcTEwVUtX?=
 =?utf-8?B?RlRPejlnU1piUHF4NHBBVlNGcU1JUFZxK1FTeUdEWEQvMjZ4ZHZ6Unc3Njk0?=
 =?utf-8?B?QmMyVVdBODhDYXFRVFd6OFVLZUNwZTg4clZNUXRIWDhSelNISFFFU3J2MFZK?=
 =?utf-8?B?MHRJb01NZC9wQkVma3MzYnZmdTJmZVBuVmh0MjZ5MVg0OVRyRktzUmpPQVZL?=
 =?utf-8?B?TGFtOGZSY3R6SVhxRUo5KytXUUlhUTFUaWVMMlRyeDRkUlJZSUVQNnhRcEtL?=
 =?utf-8?B?U1E0TUpFNXRHZnJDTHd4VFo0Qmc4MkpLa0NrUytvVk5Vci9aMUxtalRDSWxG?=
 =?utf-8?B?V0c5TUtQRmhMbDRSbXhvaGV2MlZYcjhxVy9mR29sZTRCaDhURXNqcHJ0Mldk?=
 =?utf-8?B?VVIwSEtDUThuMmx0eGFQSmtHL2QrSkpPOWo4VHBJbmR6cCtVb3V5TTZFd3BJ?=
 =?utf-8?B?WjgyWVA4cml6MjRzYlVYTUFOQWdqcWNvUkxkYjF5R3FRM2VFTlpxbm8vK2Zx?=
 =?utf-8?B?ekhWcmpGTVQrM3dlREhWY0gyRWNoaFBpR0c2cWdkb3ZqSlBJU1d1U1UwYndz?=
 =?utf-8?B?bW1pQUpkTEpEcG1aQjcrT29WNytrUlp0VlBwN2wrZjM0aWthS1JOSS82d2M1?=
 =?utf-8?B?M0gvazlGMWFrNzhlYm1DRDJySyt3WDNhN2V3dmpKSk9aQmx3K3JrTks2Y3Rj?=
 =?utf-8?B?S04zVWZhV0FBSXdpR3VVdTN5T3pQOU1WdnBpZnB2MnVUa1JvVFlyRmpHNjda?=
 =?utf-8?Q?xmwh1/HPsg/iQwIJwDn0gdTRH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61119D95A775C7488D44F48B4C7B958F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Li9Ro2Mr/+++ZBWDDTx4/CHXHkP+SBKdEAqv7rUTEMv4am5uL4tEII1fotF097lKzm5RfdNbqZ3VVapXBsAYwch8k7PITx/auVprkPCpVx1wvLa4ZzPjLm6kTm3gmlKowhZ7uVRbHaZUXdFbbrR8I3MUdHhr0+XoHC35HFiwzWn9AnDto5PnESeOkRcBerUeslzj5uhH80iVAJE16PAJOEkZnzusx7CLwTr/uqfiTCtK0fl0Bv5zFWSKcGJq9ecugpsJel3oIvp1T+q/dIRvmlMxwZ+XlqoKrdq2yEHXdNqDQipRdl1ViXaJxCuNf31Q2uaI+aLuZzax4x9LwsLIJ6/awBlXvhbtGj7NSQI9g7BDMviYBxLjz7lInXVdbCBudeFrGq9cW2ACxKlxApEoU4g3Hhp/HD4T9JPP+u9WcykBA0SEAUhFd1OarmJsj3ZiWKSGM9GClEsarqRQIe7p+cafloiTUXlpLl87yvNzsh7owA4cvitIsHINX+tEvs9aOogR5v1FOgdoYkZjmFrUKCLmpFuZ2L1GYlYgs0P6vrQuSKS55kkwsEZeXGALc5J1v9WlrU8YGFfeSMFTULTd01++uFmrYy6K+N1J4a37c171V5Rq2lMwGiP3TE1EKWpqsNNFzMVLPxTB2uxle7gJUg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be95497-5844-4aa8-ad5c-08dc5889a65a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 11:39:00.4021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hDjrMiBCOtqpGHe63oJM2yiStu7k3NRcsCA8LInipCdhm1R+f9tgZAL3qYCyfxxtGHdJAAOMK6vcH1vJX1ntyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
X-Proofpoint-GUID: hPAAw5hsE7CjealR4Hegw59mSIzzGza_
X-Proofpoint-ORIG-GUID: hPAAw5hsE7CjealR4Hegw59mSIzzGza_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404090074

SGkgR3JlZywNCg0KT24gNC85LzI0IDE0OjEwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6DQo+
IE9uIFR1ZSwgQXByIDA5LCAyMDI0IGF0IDEwOjA2OjMyQU0gKzAwMDAsIE1pbmFzIEhhcnV0eXVu
eWFuIHdyb3RlOg0KPj4gRml4ZWQgdmFyaWFibGUgZGVyZWZlcmVuY2UgaXNzdWUgaW4gRERNQSBj
b21wbGV0aW9uIGZsb3cuDQo+IA0KPiBXaGF0IGRvIHlvdSBtZWFuIGJ5IHRoaXM/DQo+IA0KPj4N
Cj4+IEZpeGVzOiBiMjU4ZTQyNjg4NTAgKCJ1c2I6IGR3YzI6IGhvc3Q6IEZpeCBJU09DIGZsb3cg
aW4gRERNQSBtb2RlIikNCj4+IENDOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+PiBTaWduZWQt
b2ZmLWJ5OiBNaW5hcyBIYXJ1dHl1bnlhbiA8TWluYXMuSGFydXR5dW55YW5Ac3lub3BzeXMuY29t
Pg0KPiANCj4gRGlkIHNvbWVvbmUgcmVwb3J0IHRoaXMgcHJvYmxlbT8NCj4gDQo+IHRoYW5rcywN
Cj4gDQo+IGdyZWcgay1oDQo+IA0KDQpZZXMsIGl0J3MgcmVwb3J0ZWQgYnkgRGFuIENhcnBlbnRl
cjoNCg0KZW1haWwgb24gNC81LzI0LCAxNDowOQ0Kc3ViamVjdDogW2J1ZyByZXBvcnRdIHVzYjog
ZHdjMjogaG9zdDogRml4IElTT0MgZmxvdyBpbiBERE1BIG1vZGUNCg0KQm9keToNCkhlbGxvIE1p
bmFzIEhhcnV0eXVueWFuLA0KDQpUaGlzIGlzIGEgc2VtaS1hdXRvbWF0aWMgZW1haWwgYWJvdXQg
bmV3IHN0YXRpYyBjaGVja2VyIHdhcm5pbmdzLg0KDQpDb21taXQgYjI1OGU0MjY4ODUwICgidXNi
OiBkd2MyOiBob3N0OiBGaXggSVNPQyBmbG93IGluIERETUEgbW9kZSIpDQpmcm9tIE1hciAxMywg
MjAyNCwgbGVhZHMgdG8gdGhlIGZvbGxvd2luZyBTbWF0Y2ggY29tcGxhaW50Og0KDQogICAgIGRy
aXZlcnMvdXNiL2R3YzIvaGNkX2RkbWEuYzo4NzQgZHdjMl9jbXBsX2hvc3RfaXNvY19kbWFfZGVz
YygpDQogICAgIHdhcm46IHZhcmlhYmxlIGRlcmVmZXJlbmNlZCBiZWZvcmUgY2hlY2sgJ3F0ZC0+
dXJiJyAoc2VlIGxpbmUgODcwKQ0KDQpkcml2ZXJzL3VzYi9kd2MyL2hjZF9kZG1hLmMNCiAgICA4
NjkJCXUxNiBmcmFtZV9kZXNjX2lkeDsNCiAgICA4NzAJCXN0cnVjdCB1cmIgKnVzYl91cmIgPSBx
dGQtPnVyYi0+cHJpdjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5e
Xl5eXl5eXl4NClRoZSBwYXRjaCBhZGRzIGEgZGVyZWZlcmVuY2UNCg0KICAgIDg3MQkJdTE2IHJl
bWFpbiA9IDA7DQogICAgODcyCQlpbnQgcmMgPSAwOw0KICAgIDg3MwkNCiAgICA4NzQJCWlmICgh
cXRkLT51cmIpDQogICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl4NClRoZSBleGlzdGluZyBj
aGVjayBpcyB0b28gbGF0ZSBub3cNCg0KICAgIDg3NQkJCXJldHVybiAtRUlOVkFMOw0KICAgIDg3
NgkNCg0KcmVnYXJkcywNCmRhbiBjYXJwZW50ZXI=

