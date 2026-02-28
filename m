Return-Path: <linux-usb+bounces-33804-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAcaBZM0ommn0wQAu9opvQ
	(envelope-from <linux-usb+bounces-33804-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 01:19:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A017B1BF5FE
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 01:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A67753063FE5
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 00:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41EF239562;
	Sat, 28 Feb 2026 00:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mjfWzYUz";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iVY/XNKY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hebklIut"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D58230BDB;
	Sat, 28 Feb 2026 00:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772237961; cv=fail; b=NFy5nyfEGK+dk0LCcNJs2J4a4fv2t+FzCt7UzXj7w5tP8UsPf3QkkUMDZ/1ModIfYs5LIMxW+2l6LuHtnzROjjU7KtRW8IoSrAwtaqZifR+o9Wlkdv27/5l+veuiw1ZSc0vE4usP2y7XPAA+ph/zqM+6TABxp6Kv/7pzQeImUFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772237961; c=relaxed/simple;
	bh=fD1eEZMkigWyZ6vwVLqs6+dYD+akakdAyypxfq4TA9s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NgT9VkmLiAEdx70+dD0Lp23y8pn3eIvLmbDpMHpPdDXraWK8ltl+dnk7nnxgBPDaz1CHGj/KsiceOgyTOxYNEqzhUNSzPwfAkBIV7qSzfMX9W1+gw741u6QhfOK5aOZzhFi4uAVFbgJj98RKOItsb1/QgS9/mZhqUwcG7RvDwa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mjfWzYUz; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iVY/XNKY; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hebklIut reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RLBG8U3097229;
	Fri, 27 Feb 2026 16:18:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=fD1eEZMkigWyZ6vwVLqs6+dYD+akakdAyypxfq4TA9s=; b=
	mjfWzYUzYJWJHqlF9fixrDPqDoeNDh7qtV+N52yIAMWnuin5UKtZWgGZDca5p4pr
	XIZOJIMUgyhPwNnsnwTqWirNJsvkpKQzzZf6f1Xo3B9OPND5Af/oYoQ0NlwnRC0M
	e5hBtJokNmSyQ+eLB47EybbwUPj7jfn1J6m7JpG8JTknymR/CSh/+sFZuW4B+Oru
	HMSIb8WRTJqAGJ/acVWNTF/jkmWeDd5CItJQrj41u+Y10wHvR02kf3jr4H4ANmmZ
	ycSrZSSKBoqMOnHK5LgSgBPQ9KCnx2KwtSKW8/cM8C+21f0A932HiwIEvc51rOrH
	9OuHGab/YenQClGpU02mdQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4ckdnmk3aj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772237925; bh=fD1eEZMkigWyZ6vwVLqs6+dYD+akakdAyypxfq4TA9s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=iVY/XNKYdVWrQHx0M/XmkLBIZX+dSSp6JGcpyXSBVolHx5WUZIwRS0EVhOPrABdOk
	 DsE6ArZkBQR5+eZIWHI0KAbIb3RIsQIO87K65t78gyRoUIkMAU99rPdFUgnkosIfSI
	 eu4DdF0l/mbB1me1zTQPtgF8eKuZDt0622uHmSM/ui/n0M+B0OV60494WsqNLYZ8q5
	 CllZupaFe5FemO1W1apVgp04vKNNBuw57piwhuyx95a/iVxTlS/nd2YuOlltTrKzMh
	 bgyvgl7eGKsWYzZZJCXZafbf/10pTrxuVo0ByZpSbu+RvA/kK8al7y60z2uCchAcWw
	 ygmzyU4iuu2Sg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ADA9640346;
	Sat, 28 Feb 2026 00:18:44 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 97317A006D;
	Sat, 28 Feb 2026 00:18:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=hebklIut;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00100.outbound.protection.outlook.com [40.93.10.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 82D13220141;
	Sat, 28 Feb 2026 00:18:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qS21Cq7nlcAeEfC9GbZxdfyfx5PKpC5BB/mL5zJX2QwAamwF1cC8ftoRWwBYdfTj5xlCvKzno2pVuQuCsifLeGgjAzE5yps7hJKDj0+ZkH+MyXq1nOvVb3vFoA+z1RD1SlMi6TbSAN/Cm1CGw5hyCy310/kg+BnjWlNS7ecVckYeQB1op04klmV6J0tvCH9oc1l3QWOv0j0incUYCDAxXO7Zb9R80SDv3WVVFhlFz2eNMyHCV72bsxhwEMlRQlU8sopmwRw0ti4TS88GmJPDWL+j7p114PgLQkfv7DGb0k8ZzklFG5S23D6u5aofmmsTcvgXV9Xl6yPn6ZDEn2jyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fD1eEZMkigWyZ6vwVLqs6+dYD+akakdAyypxfq4TA9s=;
 b=XX08lt0T355uuOATMtvAKcY/glingAOJTLI1VFCbLO3/pm1p/+ETJb2VT0nVL71QqmQdnxuhi6UlbxsKCacRUKW5dHyldJMU8UR4uGXKtoWNIHt7EXV79NpRNNEu/3UvgsquB1oLe/0I/OQhUSetw60ohEsbbczc4gkXJF+6lq5gkZe0aJzBOlv1/SdKUzcN0rc/UK1xl7IqA+twMCLWTiiSkFlAuMdjiWChc1gyo8Ie4FWBsMfo/4HxLoS5oc7CiEjFC3cn014UPhFOhX0RLwFq8D5g6bV0O6gZsFAjO2kykDNDJcsz8XjYKNOpqJCzZ62gypA0T0skxkgOoJHVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fD1eEZMkigWyZ6vwVLqs6+dYD+akakdAyypxfq4TA9s=;
 b=hebklIutkeKSX6zRgeGAFp3ANlnaZML5N3zm6WrP2RAqRZzhzdvoYZMmP+MJmLp/UnLIHty4py+vJKyQmPiGaIQMbGVj60nyTVanCPDcdwK8kB1e/ltqYQ3DjIOgE7hm8HdTsh+Wg0bb7LiIE/agzZjeqUR79VelpAndi50tMHw=
Received: from DS7PR12MB5984.namprd12.prod.outlook.com (2603:10b6:8:7f::18) by
 CY5PR12MB6645.namprd12.prod.outlook.com (2603:10b6:930:42::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16; Sat, 28 Feb 2026 00:18:35 +0000
Received: from DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691]) by DS7PR12MB5984.namprd12.prod.outlook.com
 ([fe80::2062:8c19:8492:2691%4]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 00:18:35 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Dayu Jiang <jiangdayu@xiaomi.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Longfang Liu <liulongfang@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        yudongbin <yudongbin@xiaomi.com>, guhuinan <guhuinan@xiaomi.com>,
        chenyu45 <chenyu45@xiaomi.com>, mahongwei3 <mahongwei3@xiaomi.com>,
        Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Thread-Topic: [PATCH] usb: xhci: add xhci_halt() for HCE Handling
Thread-Index:
 AQHcj33Mdj9vpu0YaEml411T+NyHbbVl34MAgAFnWICAAAIXAIAtnDGAgAB6GgCAABoMgIABAtyAgAD0ZoA=
Date: Sat, 28 Feb 2026 00:18:35 +0000
Message-ID: <20260228001829.txes2e2xiwyotw7o@synopsys.com>
References: <20260127110422.306711-1-jiangdayu@xiaomi.com>
 <2026012708-liability-sincere-5ed4@gregkh>
 <aXnNcQa5Ooq2wIX2@oa-jiangdayu.localdomain>
 <2026012857-deprive-putdown-0ee8@gregkh>
 <aaAR5VOtnMhvoCem@oa-jiangdayu.localdomain>
 <871991ab-6c8f-47d4-a5b4-b65751750e71@linux.intel.com>
 <20260226181715.ofgjiq3iq7d7dx6y@synopsys.com>
 <9113319a-b82c-42c7-ba1a-19113a5edb80@linux.intel.com>
In-Reply-To: <9113319a-b82c-42c7-ba1a-19113a5edb80@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5984:EE_|CY5PR12MB6645:EE_
x-ms-office365-filtering-correlation-id: c7486ba5-203f-463f-55a2-08de765ee9f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 b7PW/iV+ttm6qABidMoIhBhdqwCgfnaNiMY7owCMtiNUHl9SPoXdEJ+ZI0q+zS4KcVyfjQQlkGryPmknAODL0v5tzDQo+AniHH0XmLk5qulbzgo670rZSmbqFr01/QpWXqfGOnrvKlAr6UIqdpXpDrypuNOepJfoMN8/um3T2FOzJETJH13oa16bpZUSRi3KX0WSGK23FtrUCLmiiCeUDi+uJLPeszsYZDkGUL+p13r4CpFh/fu1HCFwNc698gOSugouSC6rM0Cv8g7Sxb7RRYV6TiYXXu04a1IctQxRb+axDBEEyTGLO2rKkabYRybH3yrd92CXKEmKx1rO3t7yjR0rEf0TevhW+h+gPJx/aH7OOJD3DKm7BPL9FwYJriQbCNmVIFvJb03jaV+szqIrYRtBgpvf3k/vgA5Q8GzEEl1d9eviakgTbGqCy0KV+0+oxnSw01Td7aR15LndZBNUAU5Ksg2YBK81yPL3wjmUa/5LCZ3s1M2L0y+4p7Gr4y4TzofukmSzjKxkhVHv+qH56Ia4tt2cF0BHh5cG3ttKvIAlRbzOrBOUdJ2My0mj0yjilSpYpBcCn1q5mdah85ucolbw3ShkZq/iCLoBSmATwpghGfT+PAqj8t2DF6vG1MzTcA2oTjoBzD+3IHJQ6hfrcN6bcl/AMnb+2Pibk+0j8JejswmavWBYaIFlo9fpSPtEEiCPZfD7V2lFyfbdtdvX1V2+Db3fQoPKHuri/B1+JSN46+VNAXjVljYOz4H/AMVW
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5984.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eHNnWHVzeXltbkZ2ZjArTWhlQ0hiemJVRVEyTDFjMzF1VWNqd0Q0WWxQSkNl?=
 =?utf-8?B?a2R4OEtpWHpFV2lFcUtUanQwRVBiTjNKNEFJZndISE5wRGtMY3V6VHVzQkMz?=
 =?utf-8?B?SHJuVnpSYVZVVDAzUGFSclZkcmd5a2VWWDVocWZnd1BnY0tDK3FheG5NeGQ3?=
 =?utf-8?B?ajA5cFdLOG1zd3hGSk5sR2M2eFU1VnIzd2p0WjdqakR3SGlOd3VtUDN6bVhi?=
 =?utf-8?B?YXVseVlhcFZjRGx4b2FVZlJOY1JxM3dVS3BzZXR5OVl1cUk5SWdHczBRZEJR?=
 =?utf-8?B?N2FXc1FURGhYc1U2VzJOVUoyc1BUTFlWRjNaWHdZL0hHRWp2bllVSTRKLzR3?=
 =?utf-8?B?a1lGZ0hPTTlRNldkUHVBQ1VMSDVtUDE5cS9kQy90LzZydE1xTlFNWGNTcS9W?=
 =?utf-8?B?a28wbGtoVVlndC9Yd1ZIaFFVVWtwWG90VmN1WjA5eDlYRGlMa3lycUgzUFBC?=
 =?utf-8?B?Rk1uZjZMYWthcldlVGFpRzhIc2FXMVhEbVNaSnFEVzhJa1c2L0IydUZHdzU4?=
 =?utf-8?B?VDRFNUxMd2I2V0lkYlpmVEg0bS8wc3cwTVdEeFBLNWduVmJ1SFBNNk1RRmdK?=
 =?utf-8?B?SGxKdHkzcU9kTGdySmNIVzJBU2E5blZBSm9wVFp6SWVGZDF3VG9vUEl1azky?=
 =?utf-8?B?T293U0JlVEdtdFVPbnZlK0NBYytZS1JkRTJjeVdvSzFyUUJ0NHUzT1NtcVVE?=
 =?utf-8?B?ZURoMVkzZGNjbEJKUkE0RHl1MC9VQU5VQU5mcjdDTm5hRGM1WWN6dXp5MmR1?=
 =?utf-8?B?U09EZHJiM2t6anMxVHQzaEgvbFlnUHA3WlIwNlFUU2hKSllwMklYM25ZMEY4?=
 =?utf-8?B?elh0Uy8vbXBTWENBcTA3SU1yRXBUQ0dyV0ozRk5XQ25ZdDFMWXpabVlCdDda?=
 =?utf-8?B?Q2FkRGVYbVVnUHVHd3d6cVgvNWs4VnB0WE5nVytUOHovcXNVYVR6TlpQd0FI?=
 =?utf-8?B?TjNCekhOVlZZRHA5NE1hZTBab2FSOENZYjlRZG5lL0N0bTVFK1o4QmhTZlJW?=
 =?utf-8?B?Q2pYN3FFV0M5M0w1cW1iTTFsUzBTcXNhSUhPaWlNSWg1WGpRcW1XeVpFcmVu?=
 =?utf-8?B?YXd1UVpjWUNHam9WeWVWaXp3Q2NUOXpNUmV3V0RQZFI0eHMzNVJIb2M1TXNQ?=
 =?utf-8?B?b2tqZTVBSzF3R1UyYXk3ZzFFTXd6OGNxTTNpRG1pN0Y3NVlwTkl4dHZ4aDRr?=
 =?utf-8?B?dnJHd3NSMU1ZZDZyNC9UNlB4WDRtWWxmOTFQTzRDT2M1dGNmaGsyL3hxcWRR?=
 =?utf-8?B?WGJEMlV0R0s3VzRLalJidlIvbHQyRG9JbCtkY3V5NmQ1VFFueEVjU0tLc2ZW?=
 =?utf-8?B?MThYNlovWTBEWG96d3VTbUEzcmhvTm1KaEE2bWU5VjhJYjdiM3JTa1EyNkg1?=
 =?utf-8?B?YkhkU01MZDd0UHVtUUJVcmhwV2o5M2R0QTA0MzNrU2hWcENBQkpJQzcyQ0ow?=
 =?utf-8?B?c2xzemUvYzNsZVhpV0EvaERHMnVsMEMvd3FaZHI4eGxSM1hYSzZjME5iTzNS?=
 =?utf-8?B?WFd3RzFLVk5CcjU4Vk5BV0gzNmkwQjVpRUZYdlVCbTc0ME9ZcEpYbmR5SUsv?=
 =?utf-8?B?NlNBUmEzU1JrTmlXV25IN000eEx6MEpjSS96bEZ2dnFiSDZhODZvUDROa0h2?=
 =?utf-8?B?eHM5d0w3WWp1Tm9iYXFlNkpNc3E5eG1od3hyQ1NQTmppRDFpNHBzbCtMalB4?=
 =?utf-8?B?VGpmMWVKMTlsV3ZLN1lJUGtqdGF0VDZYOW4zczFvemFSK1ZBQWFzSXNlNDNJ?=
 =?utf-8?B?MW8xWlZxVVRubTdGWksraHZKVkVNRTlGeEEvdTdrR1dHNm9tYngrOVhkZng3?=
 =?utf-8?B?OCtFMDhsaXdMTituM0dUcnp5cGNsd2ZtbWhKeU4zQ3llMVdrRDB3WUpHdzg2?=
 =?utf-8?B?S0cwbTM1SlNyRFRzNmUvU0h6VTR6Z1hDV0J4N01mKzE0NisyL2FtQ0N6Qmw5?=
 =?utf-8?B?ZnFrSkowV2NGQXJsanFWVXZzNmt4ei9oZU5LM3RoS1RDY013L1dXSk5vdWlU?=
 =?utf-8?B?dmhlQys5T2ZTYm9sNmIxREpOaHNoVjlsY3JyYWJWZHRSZ1VENUljU1pmSU9G?=
 =?utf-8?B?bnNXOFI3cG9oSjA5MUxHaVVSU2JUcDFoRG14d3Q5bEhtTGRsWERIYnliTFVS?=
 =?utf-8?B?SS9jNHpvWUlTWjFOQ3ZLM0I1bEVsSzl5UU5GdnU3eTZxb3NsdW5rcGxsUUtq?=
 =?utf-8?B?V3JJbnVjTjYxZFVvNDdHTHVtM2RGcGhrY2hacnpna3hnT2F5b0N2NnhFSDdC?=
 =?utf-8?B?RmUyRE5pRURKdDc3MjgydXZOUHAwUStQWFU0ODE2VW0xWUtUWE1HQ0dmSkxQ?=
 =?utf-8?B?SUw5bldkcEUxcjZMQlV3MDdTdUNCQlBad21tWm5WaW1xTUJwRld4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55BCBECF5D814C4A8AF996E470A48D2B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	ndl7C5ey/cRXjrPEj5f6rXuPmqd4ObBwX0oDaYXnF7tv7aF8hi8dX92itRBorGYw7fn/Pby6Bm/w/5YwPDIRlgR4WFCil6Sc27QFX+XIaL+I26rv/QkLohCVuiokpg3K0kBo4h1uF7lEW4o8KhQE+XiiPndDRXa7forVzIuebWxVnvoryfRso5j0//iJSQ0mo1yR1iUJ6sq3YAMumukYDmjwNO8upBHZOcJYe1PzuPfbeHOteN+VxCm1g8JVP1+4KSushCPR+g2l7XLxVR0CG8pVkoXFE37LvRaAhXO7TRn5jYS/zA0rF5X3Mxtl9Mr2fWJtdxoDbl9RyE2SqHQxBw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Kp0Yw0yhLVis9ncyW2so3eR++rvD3GMZYKK1e7Qr7jBsTZVh1agcmzqynbj90OcW58PJCcB46Pbc/2gKvEmFIjDNnT2AxKUomWPsUYl275qdrvI2D7/nVIYe8TYo8l7j4gzFBbB55d2jGwqnFr+aMdHLebR9i8YuGM7yOaFAZrYldqWSYVwPJygGVS74BaeHWow48D6lWWyYzS+9zaTT1Attwrlm+JOg5Q/6spIwAWuaYdQsl12cjkNbmlPWyoRDddX01RU4WZSuQ5W3yd7vxqki8/H3t8nQFXF14U7IFcdwYHgO8HLx2KTG7E55ArAw7F6+jouMzDvFz4Ivc4ikU/6BXg505euUBovchJdn4V9UM7IYmpsBTAx8HBNx+17x07osyiAATFyPpxGEDS3JG15G3WrIwpFYk7YsQ/Teesv+ajVZpjGnsj4SWdGID/ZNrIoQ0OURNgObf5r2SL/i0ZapZDPDJgDwkxfY8XXQgckOPjVtPL/FXe0Us7Rvv8t+mRurUw6v0ZA0E5ec++E5HIUjDl4bzi7lBSKGPRHjaHBw2sNEdoJLPiTrNFd5JaqKbFPmSf1zcNfSNrD8ynPO/AksSqvptZenuWwz2sZ2wB1rELVlMMLRXr9Q4HaMh47xQV5hj+5ID+fxjFTzpzRonw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5984.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7486ba5-203f-463f-55a2-08de765ee9f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2026 00:18:35.7066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QVZTQsnWLjwtrNHzfobUUHOVv6aQy6RnDeCQhkG7u39aaZg4qYtgDx6foa2Amud4dH1/hI2lrho3laQwGYJj6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6645
X-Proofpoint-GUID: poQVO87e-IAcK78SHmSSgYqcqxs16wWB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDAwMSBTYWx0ZWRfXxwVnhmaKpVex
 cRd5uKHmIBX8SneIQI+ZElTj9PmYhKABYZXQZrvv7jS53Ue8xN+0lvszRg6AeK72D45TV98Y4lI
 td70ddG4aIMpFALh5OHKNetZiiX8Q5o/OQFRLWqbSFtDeCjrcLmwoUKAqsXqw/6TBw5KvVUVca7
 sdDTkro5fio9lia6TqiyJC+yXtM+qT+8sXxxa/CBokJnRSxyCc/yhgN4oJO/4Ts8SDxRhRGhMiO
 u5gQtxPSDFIRWUUGLt0gUr/YAjto/UmL5jDU7uNxy4Poqwob27l/Jz4UFGZlIGouk7mOj1OhEDr
 w5gPuGsz1oI308/WbwPt21ZsX3yelHgx3lTL36FxT0IyeX8j2YbncX5pkg74cXvFcaXIqjAginf
 I2UY8i/1uko9FvFHpAK2soC5XOGGhFD3fpJfJnVwJ3QtwJoz6bAOtUsmpTrWjnv/yXPUgzGoj9t
 IexquX2hcYEhVhix0Tg==
X-Authority-Analysis: v=2.4 cv=C4bkCAP+ c=1 sm=1 tr=0 ts=69a23465 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=VwQbUJbxAAAA:8 a=IeNN-m2dAAAA:8 a=JnmriOmaFi0V88fNqkEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: poQVO87e-IAcK78SHmSSgYqcqxs16wWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_04,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2602280001
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33804-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,synopsys.com:mid,synopsys.com:dkim,urldefense.com:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	REDIRECTOR_URL(0.00)[urldefense.com];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A017B1BF5FE
X-Rspamd-Action: no action

T24gRnJpLCBGZWIgMjcsIDIwMjYsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IE9uIDIvMjYvMjYg
MjA6MTcsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBUaHUsIEZlYiAyNiwgMjAyNiwgTWF0
aGlhcyBOeW1hbiB3cm90ZToNCj4gPiA+IE9uIDIvMjYvMjYgMTE6MjcsIERheXUgSmlhbmcgd3Jv
dGU6DQo+ID4gPiA+IEhpIEdyZWcsDQo+ID4gPiA+IA0KPiA+ID4gPiBJIGhhdmUgdXBkYXRlZCB0
aGUgY2hhbmdlbG9nIHRleHQgYXMgcmVxdWVzdGVkIGFuZCByZXN1Ym1pdHRlZCB0aGUgcGF0Y2gu
DQo+ID4gPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC11c2IvMjAyNjAxMjgxMDA3NDYuNTYxNjI2LTEtamlhbmdkYXl1QHhpYW9taS5j
b20vX187ISFBNEYyUjlHX3BnIVpTSk5ES3lPaW5tMjZxbmdvcExXLWF4aVF0d0RBTWVseTRiRHF0
cVlER3YxRXJXQ3RTNmtaNlphbWRpS29aS3VDeUNrMEl4TVFLNWc2MjVHRUl4WVdGektwQUVpQ1Vx
NyQNCj4gPiA+ID4gUGxlYXNlIGtpbmRseSByZXZpZXcgaXQgYW5kIGxldCBtZSBrbm93IGlmIGl0
IGlzIGFjY2VwdGFibGUgbm93Lg0KPiA+ID4gDQo+ID4gPiBJJ2xsIHNlbmQgaXQgZm9yd2FyZCwg
YnV0IGNoYW5nZWQgdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiA+ID4gRG9lcyB0aGlzIG1vZGlmaWVk
IHZlcnNpb24gc3RpbGwgZGVzY3JpYmUgdGhlIGNhc2UgYWNjdXJhdGVseToNCj4gPiA+IA0KPiA+
ID4gdXNiOiB4aGNpOiBQcmV2ZW50IGludGVycnVwdCBzdG9ybSBvbiBob3N0IGNvbnRyb2xsZXIg
ZXJyb3IgKEhDRSkNCj4gPiA+IA0KPiA+ID4gVGhlIHhIQ0kgY29udHJvbGxlciByZXBvcnRzIGEg
SG9zdCBDb250cm9sbGVyIEVycm9yIChIQ0UpIGluIFVBUyBTdG9yYWdlDQo+ID4gPiBEZXZpY2Ug
cGx1Zy91bnBsdWcgc2NlbmFyaW9zIG9uIEFuZHJvaWQgZGV2aWNlcywgd2hpY2ggaXMgY2hlY2tl
ZCBpbg0KPiA+ID4geGhjaV9pcnEoKSBmdW5jdGlvbiBhbmQgY2F1c2VzIGFuIGludGVycnVwdCBz
dG9ybSAoc2luY2UgdGhlIGludGVycnVwdA0KPiA+ID4gaXNu4oCZdCBjbGVhcmVkKSwgbGVhZGlu
ZyB0byBzZXZlcmUgc3lzdGVtLWxldmVsIGZhdWx0cy4NCj4gPiA+IA0KPiA+ID4gV2hlbiB0aGUg
eEhDIGNvbnRyb2xsZXIgcmVwb3J0cyBIQ0UgaW4gdGhlIGludGVycnVwdCBoYW5kbGVyLCB0aGUg
ZHJpdmVyDQo+ID4gPiBvbmx5IGxvZ3MgYSB3YXJuaW5nIGFuZCBhc3N1bWVzIHhIQyBhY3Rpdml0
eSB3aWxsIHN0b3AuIFRoZSBpbnRlcnJ1cHQgc3Rvcm0NCj4gPiA+IGRvZXMgaG93ZXZlciBjb250
aW51ZSB1bnRpbCBkcml2ZXIgbWFudWFsbHkgZGlzYWJsZXMgeEhDIGludGVycnVwdCBhbmQNCj4g
PiA+IHN0b3BzIHRoZSBjb250cm9sbGVyIGJ5IGNhbGxpbmcgeGhjaV9oYWx0KCkuDQo+ID4gPiAN
Cj4gPiA+IFRoZSBjaGFuZ2UgaXMgbWFkZSBpbiB4aGNpX2lycSgpIGZ1bmN0aW9uIHdoZXJlIFNU
U19IQ0Ugc3RhdHVzIGlzDQo+ID4gPiBjaGVja2VkLCBtaXJyb3JpbmcgdGhlIGV4aXN0aW5nIGVy
cm9yIGhhbmRsaW5nIHBhdHRlcm4gdXNlZCBmb3INCj4gPiA+IFNUU19GQVRBTCBlcnJvcnMuDQo+
ID4gPiANCj4gPiA+IFRoaXMgb25seSBmaXhlcyB0aGUgaW50ZXJydXB0IHN0b3JtLiBQcm9wZXIg
SENFIHJlY292ZXJ5IHJlcXVpcmVzIHJlc2V0dGluZw0KPiA+ID4gYW5kIHJlLWluaXRpYWxpemlu
ZyB0aGUgeEhDLg0KPiA+ID4gDQo+ID4gDQo+ID4gVGhlIGNvbnRyb2xsZXIgaXMgaGFsdGVkIGlm
IHRoZXJlJ3MgYW4gZXJyb3IgbGlrZSBIQ0UuIEl0J3Mgb2RkIHRvIHRyeQ0KPiA+IHRvICJoYWx0
IiBpdCBhZ2Fpbi4gTm90IHN1cmUgaG93IHRoaXMgd2lsbCBpbXBhY3QgZm9yIG90aGVyIGNvbnRy
b2xsZXJzLg0KPiANCj4gVGhpcyBpcyB3aHkgSSBjaGFuZ2VkIHRoZSBjb21taXQgbWVzc2FnZSBm
cm9tOg0KPiANCj4gIldoZW4gdGhlIHhIQ0kgY29udHJvbGxlciByZXBvcnRzIEhDRSBpbiB0aGUg
aW50ZXJydXB0IGhhbmRsZXIsIHRoZSBkcml2ZXINCj4gY3VycmVudGx5IG9ubHkgbG9ncyBhIHdh
cm5pbmcgYW5kIGNvbnRpbnVlcyBleGVjdXRpb24uIEhvd2V2ZXIsIEhDRQ0KPiBpbmRpY2F0ZXMg
YSBjcml0aWNhbCBoYXJkd2FyZSBmYWlsdXJlIHRoYXQgcmVxdWlyZXMgdGhlIGNvbnRyb2xsZXIg
dG8gYmUNCj4gaGFsdGVkLiBUaGlzIGVuc3VyZXMgdGhlIGNvbnRyb2xsZXIgaXMgaW4gYSBjb25z
aXN0ZW50IHN0YXRlIGFuZCBwcmV2ZW50cw0KPiBmdXJ0aGVyIG9wZXJhdGlvbnMgb24gZmFpbGVk
IGhhcmR3YXJlLiINCj4gDQo+IHRvOg0KPiANCj4gIldoZW4gdGhlIHhIQyBjb250cm9sbGVyIHJl
cG9ydHMgSENFIGluIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciwgdGhlIGRyaXZlcg0KPiBvbmx5IGxv
Z3MgYSB3YXJuaW5nIGFuZCBhc3N1bWVzIHhIQyBhY3Rpdml0eSB3aWxsIHN0b3AuIFRoZSBpbnRl
cnJ1cHQgc3Rvcm0NCj4gZG9lcyBob3dldmVyIGNvbnRpbnVlIHVudGlsIGRyaXZlciBtYW51YWxs
eSBkaXNhYmxlcyB4SEMgaW50ZXJydXB0IGFuZA0KPiBzdG9wcyB0aGUgY29udHJvbGxlciBieSBj
YWxsaW5nIHhoY2lfaGFsdCgpLiINCj4gDQo+IEkgY2FuIGNsYXJpZnkgaXQgZnVydGhlciBieSBz
dGF0aW5nIHRoYXQgLi4iYXNzdW1lcyB4SEMgYWN0aXZpdHkgd2lsbCBzdG9wDQo+IGFzIHN0YXRl
ZCBpbiB4SENJIHNwZWMuIE9uIHNvbWUgeEhDIGNvbnRyb2xsZXJzIGFuIGludGVycnVwdCBzdG9y
bSBjb250aW51ZXMgYWZ0ZXINCj4gSENFIGVycm9yLCBhbmQgb25seSBjZWFzZXMgYWZ0ZXIgbWFu
dWFsbHkiLi4NCj4gDQo+IFRoZSBob3N0IGlzIG1lc3NlZCB1cCBhdCB0aGlzIHBvaW50LCBhbmQg
d2UgYXJlIG5vdCByZWNvdmVyaW5nIGl0LiBJIGRvbid0IHRoaW5rDQo+IHRoZXJlIGlzIGFueSBo
YXJtIGluIGEgbWFudWFsIGhhbHQgYXQgdGhpcyBzdGFnZS4NCg0KV2Ugc2hvdWxkIHVwZGF0ZSB0
aGUgeGhjaSBkcml2ZXIgc3RhdGVzIHdoZW4gdGhlcmUncyBIQ0UgYW5kIHRoZQ0KY29udHJvbGxl
ciBpcyBoYWx0ZWQgYnV0IHdlIGRvbid0IG5lZWQgdG8gbWFudWFsbHkgY2xlYXIgdGhlIFJ1bi9T
dG9wDQpiaXQgYWdhaW4uDQoNCj4gDQo+ID4gRXZlbiBpZiB3ZSBkb24ndCBoYXZlIHRoZSBmdWxs
IEhDRSByZWNvdmVyeSBpbXBsZW1lbnRlZCwgZGlkIHdlIHRyeSB0bw0KPiA+IGp1c3QgZG8gSENS
U1QsIHdoaWNoIGlzIHRoZSBmaXJzdCBzdGVwIG9mIHRoZSByZWNvdmVyeT8NCj4gDQo+IFNwZWNz
IHN0YXRlIHRoYXQgSENSU1QgbWlnaHQgcmUtdHJpZ2dlciB0aGUgSENFIGlmIGl0J3MgZHVlIHRv
IGEgImhhcmQiIGZhdWx0LA0KDQpUaGF0J3Mgb25seSBhZnRlciB3ZSByZS1pbml0aWFsaXplIHRo
ZSBjb250cm9sbGVyIGFzIG5vdGVkIGluIHRoZSBzcGVjLA0Kbm90IGltbWlkaWF0ZWx5IGFmdGVy
IEhDUlNULg0KDQo+IGFuZCBkcml2ZXIgbmVlZHMgdG8gdGFrZSBhY3Rpb24gdG8gcHJldmVudCBh
IEhDRSAtIEhDUlNUIHJlY292ZXJ5IGxvb3AuDQo+IA0KPiBIQ1JTVCB3aWxsIGNsZWFyIGFsbCBy
ZWdpc3RlcnMsIHNvIHdlIG5lZWQgdG8gcmVpbml0aWFsaXplIGV2ZXJ5dGhpbmcgaGVyZSwNCj4g
d3JpdGUgYmFjayBhZGRyZXNzZXMgb2YgZXZlbnQgcmluZ3MsIGNvbW1hbmQgcmluZ3MsIERDQkFB
LCBzY3JhdGNocGFkcw0KPiBkZXF1ZXVlIHBvaW50ZXJzIGV0Yy4NCj4gDQo+IEkgc3VwcG9ydCB0
YWtpbmcgdGhpcyBmaXggdG8gcHJldmVudCB0aGUgaW50ZXJydXB0IHN0b3JtLCBhbiBpc3N1ZSBz
ZWVuIGluIHJlYWwNCj4gbGlmZS4gQW5kIHRoZW4gc29sdmUgcHJvcGVyIHJlY292ZXJ5IGxhdGVy
Lg0KDQpUaGF0J3MgZmFpciB0byBtZS4NCg0KPiANCj4gTmlrbGFzIGlzIGFjdHVhbGx5IHdvcmtp
bmcgb24gZGVjb3VwbGluZyBtZW1vcnkgYWxsb2NhdGlvbiBhbmQgeEhDIHJlZ2lzdGVyDQo+IGlu
aXRpYWxpemF0aW9uIHdoaWNoIHdpbGwgaGVscCBmdXR1cmUgSENFIHJlY292ZXJ5IHdvcmsuDQo+
IA0KDQpUaGF0J3MgZ3JlYXQhIEknbSBsb29raW5nIGZvcndhcmQgdG8gdGhhdC4NCg0KVGhhbmtz
LA0KVGhpbmg=

