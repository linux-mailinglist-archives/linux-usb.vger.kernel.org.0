Return-Path: <linux-usb+bounces-14615-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F39B196ACFD
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 01:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DDD21F25A99
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 23:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D44C1D799F;
	Tue,  3 Sep 2024 23:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vMyOCVRf";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jwC2nQZG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eiHu2HES"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA52F1D7986;
	Tue,  3 Sep 2024 23:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725406910; cv=fail; b=g+trNq/n6FCFZo2O7Z2lSIZ9X9Vx2GHaXJcqdk569kH3Mk3bNRVIuw2YKjvf+kjJw8fwZVWP/Art2HmCYmDecwaxbfR4TZ4ouX0Q2BK9bjytIxTAcQ0rZ1yBUFaWO+YkwLM1GqvpeuhyHr0Q6oiHPOzxnm3MKQIAstq8o5LjVWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725406910; c=relaxed/simple;
	bh=InqzKC6XBUi6a021Aqtc7zQsFTt6RoRBlOojFl8hxy4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VRJ44HFafgB5gkSVtbfdfhJHZGQ53VW8Eq5nSTF0pvuYDgYD44HJ2/ZDjdr0iAbzeZ7fG6wpcFC92GN2PhOpax92mefTRpnfjanbiLodHIyZGP+8+wuPp/d4b56aCHbNLBN6mUDuW4nKOPABoGwqRv9zo/AZjnKpLAe3nTcYFcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vMyOCVRf; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jwC2nQZG; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eiHu2HES reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483LYLMT023540;
	Tue, 3 Sep 2024 16:41:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=InqzKC6XBUi6a021Aqtc7zQsFTt6RoRBlOojFl8hxy4=; b=
	vMyOCVRfMcNDUuMOsupstYraiXHty420ax1rrIMyopYamzJGKFE6vogALUPzv90T
	ECTiwkr1HsKM5yAmlkEncIwGPgdhwbvCXnc/4yHaXXQxNwxcxHYkVvQQ8SGl7sXL
	QJ4xn8JsVIuciJYnUPOGNetFQj6WoD4v0ONy/wYtWy+YNfGZuK2na1GPnie47eue
	T+zc9cPY/yCzb8BNYvvZN9yKv9i0jcpF2cE2+yGfuM6onTCt4AZ8c3fWApJpyVAm
	KSGasMPX7jyF8YILY7saiO61x9yROExZjPvxcrTJaDVlWaaBs14PfV2acXq9nXIf
	IJcIb6aMAR3DYum4uyxHbg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 41c23wwcrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 16:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1725406895; bh=InqzKC6XBUi6a021Aqtc7zQsFTt6RoRBlOojFl8hxy4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jwC2nQZGyHPHHt/3GlZaCtlxd8KR68GUIM8ZcDVKwNqVUPAZoT1TcSKoojLfflaKz
	 KMG+/o5IjYFO6KKHqFmRY+wW0faxk5bbzqvFOKnr3aLMfMRsRJyduHdziEPAl+f35L
	 A8msXwJUhCJaO3mCLZWt6QBkmkf1E3l60vAGPb4tkcgEvqCnGRD3/l85tS20CsJFn8
	 wtyDkLM6Mo91qwyUeuMcnmF6lWZ379Y9v0V3G3DTLdWQhWTPdNQ5PWhrQORAWQ4tuJ
	 8n2g3J/PVtcuqS1PxqiYD4n9oAAiscjqMNVytA0Y8r6FSuDjevwBag3BcJi2wq2fDm
	 f3YiudBbmIjgA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3F19C40136;
	Tue,  3 Sep 2024 23:41:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BEDD7A0070;
	Tue,  3 Sep 2024 23:41:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=eiHu2HES;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 640DC4011F;
	Tue,  3 Sep 2024 23:41:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP4IhChqUwSeo4ij/0voiB273dJvG8WE35NlSaq3jikh+B4ixuMGEjQ7G4GhtzK60qIlreUsmniTiONVkyRJcz7/7uHJsB9tnX5f3PTeZULnOFXidHFjc6iu46MUUKDYDJCSQBiBmHxAu61ELvsLkccznbrsX75ID0dMEcFBGUDDX8VA2VXv6C77ng8ycSxk9XZf4ENrl2C5Yhfjk14MogJyiaSFIPrCHOB88fH3uH7TdX5w7pGmozBQvBiB4/9tM2LpHtxBE0bQOrr+4OdXkWCK/XVgFxmAjNoC7QGAxvVNbKuhQQ0/YK15nPuYd/RD98PYWf9VAn0Q4J1OAi1UAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InqzKC6XBUi6a021Aqtc7zQsFTt6RoRBlOojFl8hxy4=;
 b=ERKOQ+3y0TGZysoyCZeNrj8r0dBtYwIlkjkOhf+9sJmnVDlpu+YFx/wICS9iOr45OHbF5E9lrjhUHAmnCsWaAF+dRxe8/sttZ0WXmzDaNqWe7Y8dVM+UsUFy7E9ZqFIzdMH9VsvwP6rkkq/vq8yyrCtoVtM4jWazvLBeFZiz9JJqb7Yvke26hsXx7BBEARoA7CNi4dwxgUduItAGFSULwD5CYuNKjflPZab+0xGWjdwVD1yc80zLZoR/O0XGM38DL00Q2p8X93D+lC0fxhEQf1SJoE+b2OKrKbFTpAuXdPYw7oS62NLgddLSToggggmuZY3lovOZatOAGK/mYDP1OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InqzKC6XBUi6a021Aqtc7zQsFTt6RoRBlOojFl8hxy4=;
 b=eiHu2HESjEeWzj25xjrn9swzmsNM2JF05d1adTrtMxeKvMlQq20d8oJUjxjRkOc8eMv868+7CyxPDMmnF6X4Js1lAjQYGjnNzOm3aX2hpMC/iFhT20OEPqqu9fi60vdJIdjS2u3tKQnK5wqOiAd/MhG9BN3zXf7Ra3chmx7/5oE=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA0PR12MB8840.namprd12.prod.outlook.com (2603:10b6:208:490::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 23:41:27 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 23:41:27 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jh0801.jung@samsung.com" <jh0801.jung@samsung.com>,
        "dh10.jung@samsung.com" <dh10.jung@samsung.com>,
        "naushad@samsung.com" <naushad@samsung.com>,
        "akash.m5@samsung.com" <akash.m5@samsung.com>,
        "rc93.raju@samsung.com" <rc93.raju@samsung.com>,
        "taehyun.cho@samsung.com" <taehyun.cho@samsung.com>,
        "hongpooh.kim@samsung.com" <hongpooh.kim@samsung.com>,
        "eomji.oh@samsung.com" <eomji.oh@samsung.com>,
        "shijie.cai@samsung.com" <shijie.cai@samsung.com>
Subject: Re: [PATCH] usb: dwc3: Potential fix of possible dwc3 interrupt storm
Thread-Topic: [PATCH] usb: dwc3: Potential fix of possible dwc3 interrupt
 storm
Thread-Index:
 AQHa2cstTT8AcV9+kEe9fm+4hVNVnLIbEIwAgABflQCAAT06AIAAVgGAgAK0ooCAIEFKAIAA0sIAgAPWhwCAAl9ngA==
Date: Tue, 3 Sep 2024 23:41:27 +0000
Message-ID: <20240903234121.2ljm62u2ldb54h72@synopsys.com>
References:
 <CGME20240719110149epcas5p3dd468685a095c094ed2e540279bf3ec2@epcas5p3.samsung.com>
 <20240719110100.329-1-selvarasu.g@samsung.com>
 <20240807003806.5owtgwgw2lczg4u5@synopsys.com>
 <b6baeb45-1684-4fcb-8c71-392cb4788c85@samsung.com>
 <20240808011536.oid627ez4ppdfkhp@synopsys.com>
 <b48e7aba-6c54-431f-bbb5-3e5490df0c1a@samsung.com>
 <20240809234227.eriwy5e6leatzdyh@synopsys.com>
 <b273201d-c589-4c57-9d57-ad2affaeade0@samsung.com>
 <20240831005046.5lndwdr7cfm3k3to@synopsys.com>
 <2e678109-8399-48d5-9567-033eab910bca@samsung.com>
In-Reply-To: <2e678109-8399-48d5-9567-033eab910bca@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA0PR12MB8840:EE_
x-ms-office365-filtering-correlation-id: 447d92d8-ee8d-4c6c-738e-08dccc71edc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TGg5NVNTeE44eVIvdlNickdFNXNMYjVnN3BqSU1EMDkxUU13a2xrang3Qkdo?=
 =?utf-8?B?cmt4SC93YjNMSlFTOTlFNDBEV2t3aDFTMUgxRmlGcW1xMGtrTnY4dFhrMXkz?=
 =?utf-8?B?VlVwSTdJTVNxek9DWWZKMEw3WTJkcWprOVM5U0t0Y2ZRZWJDZXZpc1hRR2NR?=
 =?utf-8?B?cjc4NllPR0pnNTJaVGJuZ2ZySnRGRjFaWE9JOG00S0NHQnN5aWhXMXFZSnFq?=
 =?utf-8?B?UE83QmNtOVZ1N1g5NHZDbDFYZTNnTDFiclBhTjFvWmJsT0xQamJaTnR1K0hm?=
 =?utf-8?B?c1JJUFp4WC9pL0pSYlJwdnY3Mmh6ODkrNmJYenJNT0tqQklkMkdVeFZLNmpH?=
 =?utf-8?B?YnZnczJyMVlnYS9tZnNYckdmdnpneGJheEg5UjJMRk5za1NCM0sxS3NrTzhw?=
 =?utf-8?B?ajY4NXNKT0kzOFJoOUEwWnliSDJNN09obStSZFFwUHJsWHVMWDRyejZrWlU4?=
 =?utf-8?B?Ry9LbUk5SFlram9aMXdXQnVLaFlBNGVlaFQ0QTdCZU1vSWZ1bFBhdWJKSjBY?=
 =?utf-8?B?YjdLZS8zUklsMnIyOHR0TjRRMm41Q2NIZ3JwYkdTUXlEMndSemdOYTExR2lI?=
 =?utf-8?B?YkRKL3VDeUZBdFJ1akNzQno0bkM5ZDdWTllNTituc3MvOU9ucS9MdXd5ajJO?=
 =?utf-8?B?UUFVRmk1LzRSYlhNdHBHcDFhSzVRc2RRUWRTN0tWSXRkeTNqcWIrRlFBcllZ?=
 =?utf-8?B?bHcvbHlTcDdQbFBXaGNMTytIYS9kLzFMRjh5MzZwc2QvWUZCRWRqUFhKU2xw?=
 =?utf-8?B?cjVWWXBOTUhaTXlIK0VzbXNvL1BqWFM0aytVSGNlbVdIMUhaUGd1NlBHaFZ1?=
 =?utf-8?B?YWsrZ09HbVZpbkMvRTJtVERXTFUxL2FRbm9aVFRzQ29zck5yR3dVUHBXWWQ0?=
 =?utf-8?B?NStUL0x2dUxKczF5NnoyUHhYUVhUTDZRaGowakJWMjEzQytlRWpsZ0Y0alhR?=
 =?utf-8?B?WWY1QkY5ZGZWamdCamNFTTUyZkFkTklKQ0ZrU1FZN2wzaG1GVlFBQUFyUU9U?=
 =?utf-8?B?aTV2VStKcE9yenFNMlVzbWJuVEZXV2dnZWI5VmFYaTJRMGdJanVtMFdlWTFG?=
 =?utf-8?B?MHJ2NFVHbTBkZlBzSk82YTQ1K2EzZ3dkTGVSbzhPdDJyUWFIZFVLZTR3bmU3?=
 =?utf-8?B?VkVUd1VGb3dFcTR0MGYvQVhOWFB5MFZrSFhyWUVGTFZJRVJaUTd6d1RmS0g4?=
 =?utf-8?B?Z3FOR0JHUUgzTlk2OTNjZVZnbU1HU21Zb2xkWVJKQTFra2xvS3Nyem5yQ1Z5?=
 =?utf-8?B?MHFsKzBmT0JyNlJkbmVEbEdKTThkMXdET2pwV081ZVBYVTRxZHNITXRzQ04v?=
 =?utf-8?B?WE52ODRUUTZyNzhINTArNTBEZkdDaVd0ckI3ZEtHTHVJTUpBdHNBNHdxTzFo?=
 =?utf-8?B?WTBYNEx1RUFEbjJaaUoyQW1JaUpmblIyamQvMkFTNmZvcDdpZmt0d01GM0FE?=
 =?utf-8?B?YlVWNVpudktLMDZ3b2RlYWpwY0pKQzArUjdmSDNWTmZZZUpGQmFibGVmejB2?=
 =?utf-8?B?NmVuOE9pS1dVYWg3T2Q4MHM5Z295Y2dHZjBTTC9DV3lnQXhLR3I1ZnprUVps?=
 =?utf-8?B?Q1Q1KzdCLzZvYmg0dW96OEJnaWpkTU9kaDQ0UDhHbENsUERoUHNwLzk5cVJk?=
 =?utf-8?B?SjVCeEY1QkFGTjFSNXY1OUMvNG5TTlBwNng5Q245dCsrc0NkM3pUcmRGUVhz?=
 =?utf-8?B?anovWWxSd3hQT21UaXFGSU9uWFlkMzRnbzM3MGs5dDdUQlh3Ni9oMENTNWpH?=
 =?utf-8?B?M1FWZWxJM0dEakM5NkE4VEZSNjdnYmg2QU5oTm0rdzNtN0NOYk9HZWpVTFFR?=
 =?utf-8?B?SDFyeE54N2NSRFNrM0YraUVEZ3hFT1FkTjBrUjFiNEl5ZWI0MXZHdWRic0dr?=
 =?utf-8?B?dkY1MWg3K3VRb3ROTk9SZmNmck1rcEd0bnEyNFRROGxJbmc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R0w4YXFTNkhJbzQxM3Fva2xPRFViQ1BleVdBeUIwZUxtbDZjQ3hTOTdTTHk1?=
 =?utf-8?B?b2ptb3NVdHZKUFp6bUJoZUVUNHM5K0VXNDJWcGFERjRVSy8zTGxiYmFIVHNX?=
 =?utf-8?B?blpFdk5PdXYyMFdhdmVjM2daNm1NcHNLRTd6alVWODc2ZkFiQ1BrSGdpVXRB?=
 =?utf-8?B?emZiam9vYVM5YS9BUmgvL2EyNzU3czlRTGtPd0hDWWJOaWR5RDcxOW1BdmE1?=
 =?utf-8?B?VFJ1clBnczlacjZVMnJFR2RweUVUeGdYS1dobHRpeDVmcmdUN2xzMEpWdTVR?=
 =?utf-8?B?N21JRExrUDV3VEtEUWNHMXBxRUZTVUJtMmFsVEl4VXdIWHR5bDMrUHRyRHhn?=
 =?utf-8?B?cGJTTnVZMFZqaUorNzZtalpHV3Z6TExYUzQzMURQNlBhWnFFRzJqK1lvdSsr?=
 =?utf-8?B?dWNWNzdmSUR6eTNVT05BYVhoKzhUeHRRMHJSWkRKbDBld0lPRmhrMWlyMXZ5?=
 =?utf-8?B?THdqUHNiNExKUjhsTW11UCtGVThSVmdxMUZualcrcCt2aTdqbXAyVlBmYWVS?=
 =?utf-8?B?S3NKZjIvR2dHdXFqY1hiSlh0U0lhVkpPemUxWXhkTk0yOEV0WTFteENTWDJO?=
 =?utf-8?B?eHBwbWlFUyt3L0FpbTJlWHg3REJ4WmM1Zlh2S1E3YVVDdnZ3THU3eUtpcVpH?=
 =?utf-8?B?UGU1TW1Sa3BJUXZ4c0t1N0VJZXVVNEVpbzYvbG9Yc2lHZFNzT0h5L29FOXhz?=
 =?utf-8?B?WFNLTGRha2ZEOGlzYkVBcVFjUXJZT015cmdtR2hOR0N2bzlVdnNZbzRkQXVt?=
 =?utf-8?B?S2lvOS9xQTZHaDEzOGtCdkx2VWFyc21hMjJ1WFJ2b1YyTW5QQ3NzYWdtSmJ5?=
 =?utf-8?B?L1puOFR6bnZqbHg1aVN5UlJYbnBXZHRsOWNBR2w5cVk3YktFL2ZLb1BEemxX?=
 =?utf-8?B?T3JhWGlmUG94QzVhMVJSNXR3M1o4UG9rVFhTM2YxTlBCbGhSbEtrR1ZScVZE?=
 =?utf-8?B?cHRGM2JsdFFwaDkvcmNmem83eEJhSDY3M2dWeWJxZkdXd3JveU5Vb25VR05k?=
 =?utf-8?B?NW53TURUU1ZLWkdQRFhkbkoxNHZBQXlza0x1NnNzSi9kT0tMZW9ZanJRbHlQ?=
 =?utf-8?B?Yi8zWjRZWXF1azF6dXVFRm1NWk1LUVBtangzY3lEQzZ6SDFPQm1jYkc4bjJm?=
 =?utf-8?B?R2VVYngxZktYNzV4N3FKVm9vYmhsaDRrT0FmM2VrNEhpeHZldzZpekNtdE1y?=
 =?utf-8?B?VE5vTHFqWFBFSXNXbGoxYXNOQUNha3Y2aWgrUEJ0REdyT0RNd3dCcjdYZmZp?=
 =?utf-8?B?d3hCSmVwMmEwZHVtaVdhdjY5YnJKSjdTMk5JbjJoMjVrWUE5dU9EOEFMeFZ5?=
 =?utf-8?B?MEJWMjY3RHpSekUyc1grdmp1ZGNBZWdvM2t1MmdoTENtWXQwM3c2MUxjRFNw?=
 =?utf-8?B?ZE9NV1RKRE90QUZ0S0FadW5NWFlSSlMrN3N0L1NhSW54ZC8xR3d3bkU5eDl4?=
 =?utf-8?B?U1RLSm1wdTh3WGo0YVZsU09KNEtFS080bzNhM2lGLyt1N2xIK3Y1Vm9OTkli?=
 =?utf-8?B?TnJMSE5CZlJRUDJhektBeWJvOVZENFBqMFFaNTlxbk5JbldncG5YSVV6NFFC?=
 =?utf-8?B?RzZGYTQyTWFFb09FWVU3bjY3eXZIaUtxeDBEQWN2Q2I1Nmw1MWFaclNPVjIz?=
 =?utf-8?B?WFkxR2YrcFBJK1VwbnpYNjY4SXV5RThQVnJyRktCbjZsNkxTUDlqWDBpbjE1?=
 =?utf-8?B?WkRYaGNEa054a0JNY1pNSGZrbkh3VnEyWUc5R3hJa2U2NW52Y3laMXZhMzV1?=
 =?utf-8?B?Z0JtYUc2MzR2eEFJYzdVTHZtODRST0s5dTArMjV0WG5LRnBIeXh6cTJNSmEr?=
 =?utf-8?B?UXovUXdnKzFSU0FINThFK3dQKzhaZTdXMXA1cVhhUnUxVm5WbStNeERtVlg3?=
 =?utf-8?B?NXZ4RU84c0x6K0s2RGxsR0t3ckd0eXFSRi9vK1RqZHNZNjFsMDE4TGxPdnNm?=
 =?utf-8?B?R1NYS0RrUnVVbHpiMm9ORFJ2VkxyOW1MbGtxbERxQk13b05LZzBkMThrZE81?=
 =?utf-8?B?dC9hVE1VemJHckZITDdNQVRZUFBMeWlyZEpVWXU0L0pxbkVkaVpXNi8wWFZq?=
 =?utf-8?B?ZnI1aStYMllnOFRUeXY4Q00xbmJnR2Z2TEVxa3RnQThWVnlZYzlsMjUyZDlF?=
 =?utf-8?Q?w4I9gSIh6P/a4tr6V0+hp5Dw7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57EED1FD6F183B4086FA1F83F8DC7CF5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eh5p3wTAJwrAfyd27Btsy0r45roKpx4qicIfBZbXgtzWGtQz/uOgOa2eudGJG5fBhk4xiVvxT1Tb/yFDHHshH3TSQCteseV+7JTnewQrXmD0EK9OqwJ38FfMqPYtx5KvSNyiGbY1FN6g36EwGgQAYJ9DrD53bLWXyBHO5DBjC+WfJ4amXnIXyXPBTrGf/xRRm/Ae0C0il1TsCYevUqmBKshF7/kuGA6YVpXU134TL7WCKPksqy4b4NcrIorWncAYfdLDSkNAyevWp8CYTzb+CQF0VhY53FQa+8xoD5EWVS1zgB705M1rI+iimx3CLLOmNS+BNhgkLx2COo4kZ8+dTsIkx7Oh6y3n4vLbJYj1/tGgWBi/jekn9WqSS9J4oVOnHibgVBjZJ4VZHIlavfcUYLwkffJCvsIragxFK9c+a1n4ePbNRtk5VZMVXbyCb1lWdQlPprAfHVDu6Werj5179FUUlAEHUSl00osy5yfqJ4QGq6hGU6LsrMXutc5maqsGJNz6g60cEslimHodu7YtqDwbhPu6t9AP6CeNt/p6IRslpiDk7o8YrX0u8ysEcrNmJ6zZQrFGedSMZOGFVKaKd1xhSl6DDJrwsMc2jqJWV4z9kSNicOc0w8Mu4g3L+mijBvGeFvytxf1w5j+RJU6Mvw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 447d92d8-ee8d-4c6c-738e-08dccc71edc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 23:41:27.1955
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NZBGGXUJ+HJpsIUXUraVzOX4C64RaMGMhXlUrAtv1fxIMTw1YDz+S3XmEg1VZ4+nHwDlocnV0MU+UqcMQ3xpmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8840
X-Authority-Analysis: v=2.4 cv=Z9G+H2RA c=1 sm=1 tr=0 ts=66d79eb0 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=nEwiWwFL_bsA:10
 a=qPHU084jO2kA:10 a=hD80L64hAAAA:8 a=-s65Cw8kGGtVOqxWr3QA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Z5crK8ic7R4CQjLSLf0bBXHxm7n-A8Wc
X-Proofpoint-ORIG-GUID: Z5crK8ic7R4CQjLSLf0bBXHxm7n-A8Wc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_11,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409030189

T24gTW9uLCBTZXAgMDIsIDIwMjQsIFNlbHZhcmFzdSBHYW5lc2FuIHdyb3RlOg0KPiANCj4gT24g
OC8zMS8yMDI0IDY6MjAgQU0sIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBIaSBTZWx2YXJhc3Us
DQo+ID4NCj4gPiBPbiBGcmksIEF1ZyAzMCwgMjAyNCwgU2VsdmFyYXN1IEdhbmVzYW4gd3JvdGU6
DQo+ID4+IE9uIDgvMTAvMjAyNCA1OjEyIEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4+PiBP
biBUaHUsIEF1ZyAwOCwgMjAyNCwgU2VsdmFyYXN1IEdhbmVzYW4gd3JvdGU6DQo+ID4+Pj4gT24g
OC84LzIwMjQgNjo0NSBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+Pj4+PiBPbiBXZWQsIEF1
ZyAwNywgMjAyNCwgU2VsdmFyYXN1IEdhbmVzYW4gd3JvdGU6DQo+ID4+Pj4+PiBPbiA4LzcvMjAy
NCA2OjA4IEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4+Pj4+Pj4gT24gRnJpLCBKdWwgMTks
IDIwMjQsIFNlbHZhcmFzdSBHYW5lc2FuIHdyb3RlOg0KPiA+Pj4+Pj4+PiBJbiBjZXJ0YWluIHNj
ZW5hcmlvcywgdGhlcmUgaXMgYSBjaGFuY2UgdGhhdCB0aGUgQ1BVIG1heSBub3QgYmUNCj4gPj4+
Pj4+Pj4gc2NoZWR1bGVkIHRoZSBib3R0b20gaGFsZiBvZiBkd2MzIGludGVycnVwdC4gVGhpcyBp
cyBiZWNhdXNlIHRoZSBDUFUNCj4gPj4+Pj4+Pj4gbWF5IGhhbmcgdXAgd2hlcmUgYW55IHdvcmsg
cXVldWUgbG9ja3VwIGhhcyBoYXBwZW5lZCBmb3IgdGhlIHNhbWUgQ1BVDQo+ID4+Pj4+Pj4+IHRo
YXQgaXMgdHJ5aW5nIHRvIHNjaGVkdWxlIHRoZSBkd2MzIHRocmVhZCBpbnRlcnJ1cHQuIEluIHRo
aXMgc2NlbmFyaW8sDQo+ID4+Pj4+Pj4+IHRoZSBVU0IgY2FuIGVudGVyIHJ1bnRpbWUgc3VzcGVu
ZCBhcyB0aGUgYnVzIG1heSBpZGxlIGZvciBhIGxvbmdlciB0aW1lDQo+ID4+Pj4+Pj4+ICwgb3Ig
dXNlciBjYW4gcmVjb25uZWN0IHRoZSBVU0IgY2FibGUuIFRoZW4sIHRoZSBkd2MzIGV2ZW50IGlu
dGVycnVwdA0KPiA+Pj4+Pj4+PiBjYW4gYmUgZW5hYmxlZCB3aGVuIHJ1bnRpbWUgcmVzdW1lIGlz
IGhhcHBlbmluZyB3aXRoIHJlZ2FyZGxlc3Mgb2YgdGhlDQo+ID4+Pj4+Pj4+IHByZXZpb3VzIGV2
ZW50IHN0YXR1cy4gVGhpcyBjYW4gbGVhZCB0byBhIGR3YzMgSVJRIHN0b3JtIGR1ZSB0byB0aGUN
Cj4gPj4+Pj4+Pj4gcmV0dXJuIGZyb20gdGhlIGludGVycnVwdCBoYW5kbGVyIGJ5IGNoZWNraW5n
IG9ubHkgdGhlIGV2dC0+ZmxhZ3MgYXMNCj4gPj4+Pj4+Pj4gRFdDM19FVkVOVF9QRU5ESU5HLCB3
aGVyZSB0aGUgc2FtZSBmbGFnIHdhcyBzZXQgYXMgRFdDM19FVkVOVF9QRU5ESU5HDQo+ID4+Pj4+
Pj4+IGluIHByZXZpb3VzIHdvcmsgcXVldWUgbG9ja3VwLg0KPiA+Pj4+Pj4+PiBMZXQncyBjb25z
aWRlciB0aGUgZm9sbG93aW5nIHNlcXVlbmNlcyBpbiB0aGlzIHNjZW5hcmlvLA0KPiA+Pj4+Pj4+
Pg0KPiA+Pj4+Pj4+PiBDYWxsIHRyYWNlIG9mIGR3YzMgSVJRIGFmdGVyIHdvcmtxdWV1ZSBsb2Nr
dXAgc2NlbmFyaW8NCj4gPj4+Pj4+Pj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09DQo+ID4+Pj4+Pj4+IElSUSAjMToNCj4gPj4+Pj4+Pj4gLT5k
d2MzX2ludGVycnVwdCgpDQo+ID4+Pj4+Pj4+ICAgICAgIC0+ZHdjM19jaGVja19ldmVudF9idWYo
KQ0KPiA+Pj4+Pj4+PiAgICAgICAgICAgICAtPmlmIChldnQtPmZsYWdzICYgRFdDM19FVkVOVF9Q
RU5ESU5HKQ0KPiA+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIElSUV9I
QU5ETEVEOw0KPiA+Pj4+Pj4+PiAgICAgICAgICAgICAtPmV2dC0+ZmxhZ3MgfD0gRFdDM19FVkVO
VF9QRU5ESU5HOw0KPiA+Pj4+Pj4+PiAgICAgICAgICAgICAtPi8qIERpc2FibGUgaW50ZXJydXB0
IGJ5IHNldHRpbmcgRFdDM19HRVZOVFNJWl9JTlRNQVNLICBpbg0KPiA+Pj4+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBEV0Mz
X0dFVk5UU0laDQo+ID4+Pj4+Pj4+ICAgICAgICAgICAgIC0+cmV0dXJuIElSUV9XQUtFX1RIUkVB
RDsgLy8gTm8gd29ya3F1ZXVlIHNjaGVkdWxlZCBmb3IgZHdjMw0KPiA+Pj4+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRocmVhZF9mdSBkdWUgdG8gd29ya3F1
ZXVlIGxvY2t1cA0KPiA+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGV2ZW4gYWZ0ZXIgcmV0dXJuIElSUV9XQUtFX1RIUkVBRA0KPiA+Pj4+Pj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZyb20gdG9wLWhhbGYuDQo+ID4+
Pj4+Pj4+DQo+ID4+Pj4+Pj4+IFRocmVhZCAjMjoNCj4gPj4+Pj4+Pj4gLT5kd2MzX3J1bnRpbWVf
cmVzdW1lKCkNCj4gPj4+Pj4+Pj4gICAgICAtPmR3YzNfcmVzdW1lX2NvbW1vbigpDQo+ID4+Pj4+
Pj4+ICAgICAgICAtPmR3YzNfZ2FkZ2V0X3Jlc3VtZSgpDQo+ID4+Pj4+Pj4+ICAgICAgICAgICAt
PmR3YzNfZ2FkZ2V0X3NvZnRfY29ubmVjdCgpDQo+ID4+Pj4+Pj4+ICAgICAgICAgICAgIC0+ZHdj
M19ldmVudF9idWZmZXJzX3NldHVwKCkNCj4gPj4+Pj4+Pj4gICAgICAgICAgICAgICAgLT4vKkVu
YWJsZSBpbnRlcnJ1cHQgYnkgY2xlYXJpbmcgIERXQzNfR0VWTlRTSVpfSU5UTUFTSyBpbg0KPiA+
Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBEV0MzX0dFVk5UU0laKi8NCj4gPj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4gU3RhcnQg
SVJRIFN0b3JtaW5nIGFmdGVyIGVuYWJsZSBkd2MzIGV2ZW50IGluIHJlc3VtZSBwYXRoDQo+ID4+
Pj4+Pj4+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KPiA+Pj4+Pj4+PiBDUFUwOiBJUlENCj4gPj4+Pj4+Pj4gZHdjM19pbnRlcnJ1cHQo
KQ0KPiA+Pj4+Pj4+PiAgICAgIGR3YzNfY2hlY2tfZXZlbnRfYnVmKCkNCj4gPj4+Pj4+Pj4gICAg
ICAgICAgICAgaWYgKGV2dC0+ZmxhZ3MgJiBEV0MzX0VWRU5UX1BFTkRJTkcpDQo+ID4+Pj4+Pj4+
ICAgICAgICAgICAgICByZXR1cm4gSVJRX0hBTkRMRUQ7DQo+ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+
IENQVTA6IElSUQ0KPiA+Pj4+Pj4+PiBkd2MzX2ludGVycnVwdCgpDQo+ID4+Pj4+Pj4+ICAgICAg
ZHdjM19jaGVja19ldmVudF9idWYoKQ0KPiA+Pj4+Pj4+PiAgICAgICAgICAgICBpZiAoZXZ0LT5m
bGFncyAmIERXQzNfRVZFTlRfUEVORElORykNCj4gPj4+Pj4+Pj4gICAgICAgICAgICAgIHJldHVy
biBJUlFfSEFORExFRDsNCj4gPj4+Pj4+Pj4gLi4NCj4gPj4+Pj4+Pj4gLi4NCj4gPj4+Pj4+Pj4N
Cj4gPj4+Pj4+Pj4gVG8gZml4IHRoaXMgaXNzdWUgYnkgYXZvaWRpbmcgZW5hYmxpbmcgb2YgdGhl
IGR3YzMgZXZlbnQgaW50ZXJydXB0IGluDQo+ID4+Pj4+Pj4+IHRoZSBydW50aW1lIHJlc3VtZSBw
YXRoIGlmIGR3YzMgZXZlbnQgcHJvY2Vzc2luZyBpcyBpbiBwcm9ncmVzcy4NCj4gPj4+Pj4+Pj4N
Cj4gPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogU2VsdmFyYXN1IEdhbmVzYW4gPHNlbHZhcmFzdS5n
QHNhbXN1bmcuY29tPg0KPiA+Pj4+Pj4+PiAtLS0NCj4gPj4+Pj4+Pj4gICAgICBkcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuYyB8IDggKysrKysrLS0NCj4gPj4+Pj4+Pj4gICAgICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2Mz
L2NvcmUuYw0KPiA+Pj4+Pj4+PiBpbmRleCBjYjgyNTU3Njc4ZGQuLjYxMDc5MmE3MDgwNSAxMDA2
NDQNCj4gPj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPj4+Pj4+Pj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPj4+Pj4+Pj4gQEAgLTU0OSw4ICs1NDks
MTIgQEAgaW50IGR3YzNfZXZlbnRfYnVmZmVyc19zZXR1cChzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiA+
Pj4+Pj4+PiAgICAgIAkJCWxvd2VyXzMyX2JpdHMoZXZ0LT5kbWEpKTsNCj4gPj4+Pj4+Pj4gICAg
ICAJZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0dFVk5UQURSSEkoMCksDQo+ID4+Pj4+Pj4+
ICAgICAgCQkJdXBwZXJfMzJfYml0cyhldnQtPmRtYSkpOw0KPiA+Pj4+Pj4+PiAtCWR3YzNfd3Jp
dGVsKGR3Yy0+cmVncywgRFdDM19HRVZOVFNJWigwKSwNCj4gPj4+Pj4+Pj4gLQkJCURXQzNfR0VW
TlRTSVpfU0laRShldnQtPmxlbmd0aCkpOw0KPiA+Pj4+Pj4+PiArDQo+ID4+Pj4+Pj4+ICsJLyog
U2tpcCBlbmFibGUgZHdjMyBldmVudCBpbnRlcnJ1cHQgaWYgZXZlbnQgaXMgcHJvY2Vzc2luZyBp
biBtaWRkbGUgKi8NCj4gPj4+Pj4+Pj4gKwlpZiAoIShldnQtPmZsYWdzICYgRFdDM19FVkVOVF9Q
RU5ESU5HKSkNCj4gPj4+Pj4+Pj4gKwkJZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0dFVk5U
U0laKDApLA0KPiA+Pj4+Pj4+PiArCQkJCURXQzNfR0VWTlRTSVpfU0laRShldnQtPmxlbmd0aCkp
Ow0KPiA+Pj4+Pj4+PiArDQo+ID4+Pj4+Pj4+ICAgICAgCWR3YzNfd3JpdGVsKGR3Yy0+cmVncywg
RFdDM19HRVZOVENPVU5UKDApLCAwKTsNCj4gPj4+Pj4+Pj4gICAgICANCj4gPj4+Pj4+Pj4gICAg
ICAJcmV0dXJuIDA7DQo+ID4+Pj4+Pj4+IC0tIA0KPiA+Pj4+Pj4+PiAyLjE3LjENCj4gPj4+Pj4+
Pj4NCj4gPj4+Pj4+PiBXZSdyZSBub3Qgd2FraW5nIHVwIGZyb20gYSBoaWJlcm5hdGlvbi4gU28g
YWZ0ZXIgYSBzb2Z0LXJlc2V0IGFuZA0KPiA+Pj4+Pj4+IHJlc3VtZSwgdGhlIGV2ZW50cyB0aGF0
IHdlcmVuJ3QgcHJvY2Vzc2VkIGFyZSBzdGFsZS4gVGhleSBzaG91bGQgYmUNCj4gPj4+Pj4+PiBw
cm9jZXNzZWQgcHJpb3IgdG8gZW50ZXJpbmcgc3VzcGVuZCBvciBiZSBkaXNjYXJkZWQgYmVmb3Jl
IHJlc3VtZS4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IFRoZSBzeW5jaHJvbml6ZV9pcnEoKSBkdXJp
bmcgc3VzcGVuZCgpIHdhcyBub3Qgc3VmZmljaWVudCB0byBwcmV2ZW50DQo+ID4+Pj4+Pj4gdGhp
cz8gV2hhdCBhcmUgd2UgbWlzc2luZyBoZXJlLg0KPiA+Pj4+Pj4+DQo+ID4+Pj4+Pj4gVGhhbmtz
LA0KPiA+Pj4+Pj4+IFRoaW5oDQo+ID4+Pj4+PiBJIGRvbuKAmXQgdGhpbmsgdGhlIHRyaWdnZXJp
bmcgb2YgaW50ZXJydXB0IHdvdWxkIG5vdCBiZSBzdG9wcGVkIGV2ZW4gaWYNCj4gPj4+Pj4+IGRv
IHNvZnQgcmVzZXQuIEl0J3MgYmVjYXVzZSBvZiBldmVudCBjb3VudCBpcyBtYXkgYmUgdmFsaWQg
Lg0KPiA+Pj4+PiBPay4gSSB0aGluayBJIHNlZSB3aGF0IHlvdSdyZSByZWZlcnJpbmcgdG8gd2hl
biB5b3Ugc2F5ICJldmVudCBpcw0KPiA+Pj4+PiBwcm9jZXNzaW5nIGluIHRoZSBtaWRkbGUiIG5v
dy4NCj4gPj4+Pj4NCj4gPj4+Pj4gV2hhdCB5b3Ugd2FudCB0byBjaGVjayBpcyBwcm9iYWJseSB0
aGlzIGluIGR3YzNfZXZlbnRfYnVmZmVyc19zZXR1cCgpLg0KPiA+Pj4+PiBQbGVhc2UgY29uZmly
bToNCj4gPj4+Pj4NCj4gPj4+Pj4gaWYgKGR3Yy0+cGVuZGluZ19ldmVudHMpDQo+ID4+Pj4+IAlk
d2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR0VWTlRTSVooMCksDQo+ID4+Pj4+IAkJCURXQzNf
R0VWTlRTSVpfSU5UTUFTSyB8IERXQzNfR0VWTlRTSVpfU0laRShldnQtPmxlbmd0aCkpOw0KPiA+
Pj4+PiBlbHNlDQo+ID4+Pj4+IAlkd2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR0VWTlRTSVoo
MCksIERXQzNfR0VWTlRTSVpfU0laRShldnQtPmxlbmd0aCkpOw0KPiA+Pj4+IFllcywgd2UgYXJl
IGV4cGVjdGluZyB0aGUgc2FtZS4gQnV0LCB3ZSBtdXN0IHZlcmlmeSB0aGUgc3RhdHVzIG9mDQo+
ID4+Pj4gZXZ0LT5mbGFncywgd2hpY2ggd2lsbCBpbmRpY2F0ZSB3aGV0aGVyIHRoZSBldmVudCBp
cyBjdXJyZW50bHkNCj4gPj4+PiBwcm9jZXNzaW5nIGluIG1pZGRsZSBvciBub3QuIFRoZSBiZWxv
dyBjb2RlIGlzIGZvciB0aGUgcmVmZXJlbmNlLg0KPiA+Pj4+DQo+ID4+Pj4gaWYgKCEoZXZ0LT5m
bGFncyAmIERXQzNfRVZFTlRfUEVORElORykpDQo+ID4+Pj4gCWR3YzNfd3JpdGVsKGR3Yy0+cmVn
cywgRFdDM19HRVZOVFNJWigwKSwNCj4gPj4+PiAJCQkgRFdDM19HRVZOVFNJWl9TSVpFKGV2dC0+
bGVuZ3RoKSk7DQo+ID4+Pj4gZWxzZQ0KPiA+Pj4+IAlkd2MzX3dyaXRlbChkd2MtPnJlZ3MsIERX
QzNfR0VWTlRTSVooMCksDQo+ID4+Pj4gCQkJRFdDM19HRVZOVFNJWl9JTlRNQVNLIHwgRFdDM19H
RVZOVFNJWl9TSVpFKGV2dC0+bGVuZ3RoKSk7DQo+ID4+PiBTbywgdGhpcyBoYXBwZW5zIHdoaWxl
IHBlbmRpbmdfZXZlbnRzIGlzIHNldCByaWdodD8gSSBuZWVkIHRvIHJldmlldw0KPiA+Pj4gdGhp
cyBydW50aW1lIHN1c3BlbmQgZmxvdyBuZXh0IHdlZWsuIFNvbWV0aGluZyBkb2Vzbid0IGxvb2sg
cmlnaHQuIFdoZW4NCj4gPj4+IHRoZXJlJ3MgYSBzdXNwZW5kL3Jlc3VtZSBydW50aW1lIG9yIG5v
dCwgdGhlcmUncyBhIHNvZnQgZGlzY29ubmVjdC4gV2UNCj4gPj4+IHNob3VsZG4ndCBiZSBwcm9j
ZXNzaW5nIGFueSBldmVudCBwcmlvciB0byBnb2luZyBpbnRvIHN1c3BlbmQuIEFsc28sIHdlDQo+
ID4+PiBzaG91bGRuJ3QgYmUgZG9pbmcgc29mdC1kaXNjb25uZWN0IHdoaWxlIGNvbm5lY3RlZCBh
bmQgaW4gb3BlcmF0aW9uDQo+ID4+PiB1bmxlc3Mgd2Ugc3BlY2lmaWNhbGx5IHRlbGwgaXQgdG8u
DQo+ID4+IEhJIFRoaW5oLA0KPiA+Pg0KPiA+PiBXb3VsZCB5b3UgYmUgYWJsZSB0byByZXZpZXcg
dGhpcyBydW50aW1lIHN1c3BlbmQgZmxvdz8NCj4gPj4NCj4gPj4gICBGcm9tIG91ciBlbmQsIGFm
dGVyIGNvbmR1Y3RpbmcgbXVsdGlwbGUgcmVncmVzc2lvbiB0ZXN0cywgd2UgaGF2ZQ0KPiA+PiBk
ZXRlcm1pbmVkIHRoYXQgdGhlIHJlc2V0dGluZyBvZiAiZXZ0LT5mbGFncyIgYXJlIHN1ZmZpY2ll
bnQgd2hlbg0KPiA+PiBhdHRlbXB0aW5nIHRvIGVuYWJsZSBldmVudCBJUlEgbWFza3MgaW5zdGVh
ZCBvZiBlbmFibGUgZXZlbnQgSVJRIG1hc2sNCj4gPj4gYmFzZWQgb24gcGVuZGluZyBldmVudCBm
bGFncy4gVGhlcmUgaXMgYSBwb3NzaWJpbGl0eSB0aGF0IHJlY29ubmVjdGluZw0KPiA+PiBVU0Ig
d2l0aCB0aGUgaG9zdCBQQyBtYXkgY2F1c2UgZXZlbnQgaW50ZXJydXB0cyB0byBiZSBtaXNzZWQg
YnkgdGhlIENQVQ0KPiA+PiBpZiBkaXNhYmxlIGV2ZW50IElSUSBtYXNrLsKgIFNvLCBUaGUgZml4
IHNob3VsZCBiZSBhcyBmb2xsb3cuIENvdWxkIHlvdQ0KPiA+PiBwbGVhc2UgcmV2aWV3IHRoaXMg
b25jZSBmcm9tIHlvdXIgZW5kPw0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+PiBpbmRleCBjY2MzODk1
ZGJkN2YuLjNiMjQ0MTYwOGU5ZSAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9j
b3JlLmMNCj4gPj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPj4gQEAgLTU1NCw2
ICs1NTQsMTUgQEAgaW50IGR3YzNfZXZlbnRfYnVmZmVyc19zZXR1cChzdHJ1Y3QgZHdjMyAqZHdj
KQ0KPiA+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bG93ZXJfMzJfYml0cyhldnQtPmRtYSkpOw0KPiA+PiAgIMKgwqDCoMKgwqDCoMKgIGR3YzNfd3Jp
dGVsKGR3Yy0+cmVncywgRFdDM19HRVZOVEFEUkhJKDApLA0KPiA+PiAgIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdXBwZXJfMzJfYml0cyhldnQtPmRtYSkp
Ow0KPiA+PiArDQo+ID4+ICvCoMKgwqDCoMKgwqAgLyoNCj4gPj4gK8KgwqDCoMKgwqDCoMKgICog
VGhlIERXQzNfRVZFTlRfUEVORElORyBmbGFnIGlzIGNsZWFyZWQgaWYgaXQgaGFzDQo+ID4+ICvC
oMKgwqDCoMKgwqDCoCAqIGFscmVhZHkgYmVlbiBzZXQgd2hlbiBlbmFibGluZyB0aGUgZXZlbnQg
SVJRIG1hc2sNCj4gPj4gK8KgwqDCoMKgwqDCoMKgICogdG8gcHJldmVudCBwb3NzaWJseSBvZiBh
biBJUlEgc3Rvcm0uDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCAqLw0KPiA+PiArwqDCoMKgwqDCoMKg
IGlmIChldnQtPmZsYWdzICYgRFdDM19FVkVOVF9QRU5ESU5HKQ0KPiA+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBldnQtPmZsYWdzICY9IH5EV0MzX0VWRU5UX1BFTkRJTkc7DQo+ID4+
ICsNCj4gPj4gICDCoMKgwqDCoMKgwqDCoCBkd2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR0VW
TlRTSVooMCksDQo+ID4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBEV0MzX0dFVk5UU0laX1NJWkUoZXZ0LT5sZW5ndGgpKTsNCj4gPj4gICDCoMKgwqDC
oMKgwqDCoCBkd2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfR0VWTlRDT1VOVCgwKSwgMCk7DQo+
ID4+DQo+ID4gU29ycnkgZm9yIHRoZSBkZWxheSByZXNwb25zZS4NCj4gPg0KPiA+IEluIGFkZGl0
aW9uIHRvIHRoYXQsIHBsZWFzZSByZXdvcmsgYW5kIHJlbmFtZQ0KPiA+IGR3YzNfZ2FkZ2V0X3By
b2Nlc3NfcGVuZGluZ19ldmVudCgpLiBXZSdyZSBub3Qgc3VwcG9zZWQgdG8gaGFuZGxlIGFueQ0K
PiA+IGxlZnQtb3ZlciBldmVudC4gU28gcmVtb3ZlIHRoZSBtYW51YWwgY2FsbHMgdG8gdGhlIGlu
dGVycnVwdCBoYW5kbGVycw0KPiA+IHRoZXJlLg0KPiBIaSBUaGluaCwNCj4gDQo+IFRoYW5rcyBm
b3IgeW91ciBjb21tZW50cy4NCj4gDQo+IFJlZ2FyZGluZyB0aGUgaGFuZGxpbmcgb2YgbGVmdG92
ZXIgZXZlbnRzIGR1cmluZyBkd2MzIHJ1bnRpbWUgcmVzdW1lLCBJIA0KPiB1bmRlcnN0YW5kIHRo
YXQgd2UgYXJlIG5vdCBzdXBwb3NlZCB0byBoYW5kbGUgYW55IGxlZnRvdmVyIGV2ZW50cy4gV291
bGQgDQoNCkFjdHVhbGx5LCB0aGVyZSdzIG5vIGxlZnRvdmVyIGV2ZW50Lg0KDQo+IHlvdSBiZSBp
bnRlcmVzdGVkIGluIG1ha2luZyBjaGFuZ2VzIHRvIHRoZSBjb2RlIGFzIHN1Z2dlc3RlZCBiZWxv
dz8gVGhlIA0KPiByZWFzb24gZm9yIHJlbW92aW5nIGludGVycnVwdCBoYW5kbGVycyBmcm9tIA0K
PiBkd2MzX2dhZGdldF9wcm9jZXNzX3BlbmRpbmdfZXZlbnRzKCkgaXMgdG8gYXZvaWQgaGFuZGxp
bmcgYW55IGxlZnRvdmVyIA0KPiBldmVudHMgZnJvbSB0aGUgbGFzdCBzdXNwZW5kIHJpZ2h0LiBJ
ZiBzbywgYmFzZWQgb24gbXkgdW5kZXJzdGFuZGluZywgd2UgDQo+IGNhbiBzaW1wbHkgcmVtb3Zl
IHRoZSB1c2Ugb2YgZHdjM19nYWRnZXRfcHJvY2Vzc19wZW5kaW5nX2V2ZW50cygpIA0KPiBpbnN0
ZWFkIG9mIHJld29yayBvbiB0aGlzIGZ1bmN0aW9uIHNpbmNlIGl0IGlzIG5vdCBuZWNlc3Nhcnkg
aWYgd2UgDQo+IHJlbW92ZSB0aGUgY2FsbCB0byBpbnRlcnJ1cHQgaGFuZGxlcnMgZnJvbSB0aGVy
ZS4NCg0KVGhhdCdzIHJpZ2h0Lg0KDQo+IA0KPiBJIHdvdWxkIGxpa2UgdG8gcmVjb25maXJtIGZy
b20gb3VyIGVuZCB0aGF0IGluIG91ciBmYWlsdXJlIHNjZW5hcmlvLCB3ZSANCj4gb2JzZXJ2ZSB0
aGF0IERXQzNfRVZFTlRfUEVORElORyBpcyBzZXQgaW4gZXZ0LT5mbGFncyB3aGVuIHRoZSBkd2Mz
IA0KPiByZXN1bWUgc2VxdWVuY2UgaXMgZXhlY3V0ZWQsIGFuZCB0aGUgZHdjLT5wZW5kaW5nX2V2
ZW50cyBmbGFnIGlzIG5vdCANCj4gYmVpbmcgc2V0Lg0KPiANCj4gDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBp
bmRleCBjY2MzODk1ZGJkN2YuLjYzZThkZDI0YWQwZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTU1
MCw2ICs1NTAsMTUgQEAgaW50IGR3YzNfZXZlbnRfYnVmZmVyc19zZXR1cChzdHJ1Y3QgZHdjMyAq
ZHdjKQ0KPiANCj4gIMKgwqDCoMKgwqDCoMKgIGV2dCA9IGR3Yy0+ZXZfYnVmOw0KPiAgwqDCoMKg
wqDCoMKgwqAgZXZ0LT5scG9zID0gMDsNCj4gKw0KPiArwqDCoMKgwqDCoMKgIC8qDQo+ICvCoMKg
wqDCoMKgwqDCoCAqIFRoZSBEV0MzX0VWRU5UX1BFTkRJTkcgZmxhZyBpcyBjbGVhcmVkIGlmIGl0
IGhhcw0KPiArwqDCoMKgwqDCoMKgwqAgKiBhbHJlYWR5IGJlZW4gc2V0IHdoZW4gZW5hYmxpbmcg
dGhlIGV2ZW50IElSUSBtYXNrDQo+ICvCoMKgwqDCoMKgwqDCoCAqIHRvIHByZXZlbnQgcG9zc2li
bHkgb2YgYW4gSVJRIHN0b3JtLg0KPiArwqDCoMKgwqDCoMKgwqAgKi8NCj4gK8KgwqDCoMKgwqDC
oCBpZiAoZXZ0LT5mbGFncyAmIERXQzNfRVZFTlRfUEVORElORykNCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZXZ0LT5mbGFncyAmPSB+RFdDM19FVkVOVF9QRU5ESU5HOw0KPiArDQoN
CldlIGFjdHVhbGx5IGRvbid0IG5lZWQgdG8gY2xlYXIgRFdDQzNfRVZFTlRfUEVORElORyBmbGFn
IGlmIHdlIHJlbW92ZQ0KdGhlIGJlbG93Lg0KDQo+ICDCoMKgwqDCoMKgwqDCoCBkd2MzX3dyaXRl
bChkd2MtPnJlZ3MsIERXQzNfR0VWTlRBRFJMTygwKSwNCj4gbG93ZXJfMzJfYml0cyhldnQtPmRt
YSkpOw0KPiAgwqDCoMKgwqDCoMKgwqAgZHdjM193cml0ZWwoZHdjLT5yZWdzLCBEV0MzX0dFVk5U
QURSSEkoMCksDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJp
dmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBpbmRleCA4OWZjNjkwZmRmMzQuLjk1MWM4MDUzMzdj
MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiArKysgYi9kcml2
ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IEBAIC00NzM5LDggKzQ3MzksNiBAQCBpbnQgZHdjM19n
YWRnZXRfcmVzdW1lKHN0cnVjdCBkd2MzICpkd2MpDQo+ICDCoHZvaWQgZHdjM19nYWRnZXRfcHJv
Y2Vzc19wZW5kaW5nX2V2ZW50cyhzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgwqB7DQo+ICDCoMKgwqDC
oMKgwqDCoCBpZiAoZHdjLT5wZW5kaW5nX2V2ZW50cykgew0KPiAtIGR3YzNfaW50ZXJydXB0KGR3
Yy0+aXJxX2dhZGdldCwgZHdjLT5ldl9idWYpOw0KPiAtIGR3YzNfdGhyZWFkX2ludGVycnVwdChk
d2MtPmlycV9nYWRnZXQsIGR3Yy0+ZXZfYnVmKTsNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwbV9ydW50aW1lX3B1dChkd2MtPmRldik7DQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZHdjLT5wZW5kaW5nX2V2ZW50cyA9IGZhbHNlOw0KPiBlbmFibGVfaXJxKGR3
Yy0+aXJxX2dhZGdldCk7DQo+IA0KPiANCj4gVGhhbmtzLA0KPiBTZWx2YQ0KPiANCj4gPg0KPiA+
IE9uIHJ1bnRpbWUgc3VzcGVuZCwgdGhlIGRldmljZSBpcyBzb2Z0IGRpc2Nvbm5lY3RlZC4gU28g
YW55IGludGVycnVwdA0KPiA+IGFzc2VydGlvbiB0byBub3RpZnkgYSBuZXcgY29ubmVjdGlvbiBt
dXN0IGJlIGEgY3VzdG9tIGNvbmZpZ3VyYXRpb24gb2YNCj4gPiB5b3VyIHBsYXRmb3JtLiBObyBl
dmVudCBzaG91bGQgYmUgZ2VuZXJhdGVkIHdoaWxlIHRoZSBydW5fc3RvcCBiaXQgaXMNCj4gPiBj
bGVhcmVkLg0KPiA+DQo+ID4gT24gcnVudGltZSByZXN1bWUsIHdlIHdpbGwgaW5pdGlhdGUgc29m
dC1yZXNldCBhbmQgc29mdC1jb25uZWN0IHRvDQo+ID4gcmVzdG9yZSB0aGUgcnVuX3N0b3AgYml0
LiBBIG5ldyBjb25uZWN0aW9uIGV2ZW50IHdpbGwgYmUgZ2VuZXJhdGVkIHRoZW4uDQo+IA0KPiBB
Z3JlZS4NCj4gDQoNClBsZWFzZSB0cnkgdGhlIGZvbGxvd2luZyB3aXRoIHNvbWUgY2xlYW51cCBh
bmQgYWRkaXRpb25hbCBjb21tZW50czoNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCmluZGV4IGNjYzM4OTVkYmQ3Zi4uZjAy
ZGFlNDY0ZWZlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCisrKyBiL2Ry
aXZlcnMvdXNiL2R3YzMvY29yZS5jDQpAQCAtMjQ4NCw3ICsyNDg0LDExIEBAIHN0YXRpYyBpbnQg
ZHdjM19ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQogDQogCXN3aXRjaCAoZHdj
LT5jdXJyZW50X2RyX3JvbGUpIHsNCiAJY2FzZSBEV0MzX0dDVExfUFJUQ0FQX0RFVklDRToNCi0J
CWR3YzNfZ2FkZ2V0X3Byb2Nlc3NfcGVuZGluZ19ldmVudHMoZHdjKTsNCisJCWlmIChkd2MtPnBl
bmRpbmdfZXZlbnRzKSB7DQorCQkJcG1fcnVudGltZV9wdXQoZHdjLT5kZXYpOw0KKwkJCWR3Yy0+
cGVuZGluZ19ldmVudHMgPSBmYWxzZTsNCisJCQllbmFibGVfaXJxKGR3Yy0+aXJxX2dhZGdldCk7
DQorCQl9DQogCQlicmVhazsNCiAJY2FzZSBEV0MzX0dDVExfUFJUQ0FQX0hPU1Q6DQogCWRlZmF1
bHQ6DQpAQCAtMjU3NCw2ICsyNTc4LDE0IEBAIHN0YXRpYyB2b2lkIGR3YzNfY29tcGxldGUoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBkd2MzX2Rl
dl9wbV9vcHMgPSB7DQogCVNFVF9TWVNURU1fU0xFRVBfUE1fT1BTKGR3YzNfc3VzcGVuZCwgZHdj
M19yZXN1bWUpDQogCS5jb21wbGV0ZSA9IGR3YzNfY29tcGxldGUsDQorDQorCS8qDQorCSAqIEN1
cnJlbnQgaW1wbGVtZW50YXRpb24gZm9yIHJ1bnRpbWUgc3VzcGVuZCBzdG9wcyB0aGUgY29udHJv
bGxlciBvbg0KKwkgKiBkaXNjb25uZWN0aW9uLiBJdCByZWxpZXMgb24gcGxhdGZvcm1zIHdpdGgg
Y3VzdG9tIGNvbm5lY3Rpb24NCisJICogaW50ZXJydXB0IHRvIG5vdGlmeSB0aGUgZHJpdmVyIHRv
IHN0YXJ0IHRoZSBjb250cm9sbGVyIGFnYWluLiBUaGlzDQorCSAqIGZsb3cgaXMgcGxhdGZvcm0g
c3BlY2lmaWMgaW1wbGVtZW5hdGlvbiBhbmQgbm90IHBhcnQgb2YgdGhlDQorCSAqIGNvbnRyb2xs
ZXIncyBwcm9ncmFtbWluZyBmbG93Lg0KKwkgKi8NCiAJU0VUX1JVTlRJTUVfUE1fT1BTKGR3YzNf
cnVudGltZV9zdXNwZW5kLCBkd2MzX3J1bnRpbWVfcmVzdW1lLA0KIAkJCWR3YzNfcnVudGltZV9p
ZGxlKQ0KIH07DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuaA0KaW5kZXggMWU1NjFmZDhiODZlLi4yZmEzZmQ1NWViMzIgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KKysrIGIvZHJpdmVycy91c2IvZHdjMy9j
b3JlLmgNCkBAIC0xNjczLDcgKzE2NzMsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHdjM19vdGdf
aG9zdF9pbml0KHN0cnVjdCBkd2MzICpkd2MpDQogI2lmICFJU19FTkFCTEVEKENPTkZJR19VU0Jf
RFdDM19IT1NUKQ0KIGludCBkd2MzX2dhZGdldF9zdXNwZW5kKHN0cnVjdCBkd2MzICpkd2MpOw0K
IGludCBkd2MzX2dhZGdldF9yZXN1bWUoc3RydWN0IGR3YzMgKmR3Yyk7DQotdm9pZCBkd2MzX2dh
ZGdldF9wcm9jZXNzX3BlbmRpbmdfZXZlbnRzKHN0cnVjdCBkd2MzICpkd2MpOw0KICNlbHNlDQog
c3RhdGljIGlubGluZSBpbnQgZHdjM19nYWRnZXRfc3VzcGVuZChzdHJ1Y3QgZHdjMyAqZHdjKQ0K
IHsNCkBAIC0xNjg0LDEwICsxNjgzLDYgQEAgc3RhdGljIGlubGluZSBpbnQgZHdjM19nYWRnZXRf
cmVzdW1lKHN0cnVjdCBkd2MzICpkd2MpDQogew0KIAlyZXR1cm4gMDsNCiB9DQotDQotc3RhdGlj
IGlubGluZSB2b2lkIGR3YzNfZ2FkZ2V0X3Byb2Nlc3NfcGVuZGluZ19ldmVudHMoc3RydWN0IGR3
YzMgKmR3YykNCi17DQotfQ0KICNlbmRpZiAvKiAhSVNfRU5BQkxFRChDT05GSUdfVVNCX0RXQzNf
SE9TVCkgKi8NCiANCiAjaWYgSVNfRU5BQkxFRChDT05GSUdfVVNCX0RXQzNfVUxQSSkNCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRn
ZXQuYw0KaW5kZXggODlmYzY5MGZkZjM0Li5lYTk3ZTljMWQxYmQgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQpA
QCAtNDczNSwxNCArNDczNSwzIEBAIGludCBkd2MzX2dhZGdldF9yZXN1bWUoc3RydWN0IGR3YzMg
KmR3YykNCiANCiAJcmV0dXJuIGR3YzNfZ2FkZ2V0X3NvZnRfY29ubmVjdChkd2MpOw0KIH0NCi0N
Ci12b2lkIGR3YzNfZ2FkZ2V0X3Byb2Nlc3NfcGVuZGluZ19ldmVudHMoc3RydWN0IGR3YzMgKmR3
YykNCi17DQotCWlmIChkd2MtPnBlbmRpbmdfZXZlbnRzKSB7DQotCQlkd2MzX2ludGVycnVwdChk
d2MtPmlycV9nYWRnZXQsIGR3Yy0+ZXZfYnVmKTsNCi0JCWR3YzNfdGhyZWFkX2ludGVycnVwdChk
d2MtPmlycV9nYWRnZXQsIGR3Yy0+ZXZfYnVmKTsNCi0JCXBtX3J1bnRpbWVfcHV0KGR3Yy0+ZGV2
KTsNCi0JCWR3Yy0+cGVuZGluZ19ldmVudHMgPSBmYWxzZTsNCi0JCWVuYWJsZV9pcnEoZHdjLT5p
cnFfZ2FkZ2V0KTsNCi0JfQ0KLX0NCg0KDQotLQ0KQlIsDQpUaGluaA==

