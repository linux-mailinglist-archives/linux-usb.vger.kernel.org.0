Return-Path: <linux-usb+bounces-19607-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E344BA18893
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 00:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEC523A682C
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 23:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7747A1F8F0C;
	Tue, 21 Jan 2025 23:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jzlqQvBT";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bb0pJuJL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NWILc/zQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CCB1F55E3;
	Tue, 21 Jan 2025 23:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737503524; cv=fail; b=T+5R7e1K2yTVyJHt7gn0sKd5dvG71CKzmeVk3Mbvn7ytw6rXe6Uty8s6fzoxJ5XhOwJp6RpQtXqAtlWrcN1RWX1fC9Hn+0U7TN+EbaqdZGv8dQtRIt7ngP4HZv6Er1fByF0+lnFFiEC0zQrqo4J51a7gC+Hug9YYfU0yQMpAvhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737503524; c=relaxed/simple;
	bh=ZNbWVRYvWSK9/HG/3sHwUCst/XtPrOf9ntWDKbeUmJ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eAWA2qpioSG1eGw0gPz0ImcfMtYVDcYycKIg+lm5TtCYyvnFGbOANYZbE4MAfbqIyznedU3wpZ10O05LghgOvpsRwqe0LnsOS26onD2am3S90cPz+DvJHLj3FKhnnXz3JRAMd0DshfJa53mgd9P660q2SK/1jPu9iy1is8L4xNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jzlqQvBT; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bb0pJuJL; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NWILc/zQ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LK2jcC006409;
	Tue, 21 Jan 2025 15:51:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ZNbWVRYvWSK9/HG/3sHwUCst/XtPrOf9ntWDKbeUmJ8=; b=
	jzlqQvBTOt3TdvUWfq7a/rDyrU+MCdzYy70UVzK5zIV+LVGP0R4eVszV4Au9beVL
	faLY2VlEJT/uKIkW2G0y0xtf+P1Y4zOXwlAIE72pQaMm6l8uWbCRFGBUOUyNH9pu
	JUuZ1cyTwdpdQK/I5zRHXsx0Z2t6h9xVureTiuo/SR4nxOuF2tfikHKatsY6fvhF
	veHlncDqnf5qr2M67ZRMkRsKhryad4Xqa7p4wu3mR+T9bPZUbt1/RNEe1pNoR4Ai
	uJ3Q4EEv+sMKbBudmBjS8+lL711PkFGkBtEN1Q7IdgJ5ceXq2CcKInoj1100OZIK
	FeQukLWyXbjiItRuXrwOpA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44aj978wj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 15:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1737503516; bh=ZNbWVRYvWSK9/HG/3sHwUCst/XtPrOf9ntWDKbeUmJ8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bb0pJuJLwZpnt8f/vSQ0p4FMVv3wgdYYKRhbT3LTc0JSQKwOTPBxdsxUBL3ktADIZ
	 xYqpIyDrbkCYDBBUtA7+GxnhS1/FM6zNdbRYMV4nZe0k1F3xj3VzJ4iP2l5XIP7npu
	 RjVlFo58kQ1UebnQ0LkQdqgDNDS7sMOf4eEfxuw/DICGW2sAFJAI3+hDobQzT3ugx+
	 qIk3pExV1muFty+UKYJ7PWs0YlT9iux6dY4Ad0St4eCQisQKiHkOwdn9TiDASE9bkH
	 9LuFL7+g7sb2RqZcM/s3FJU3Q6+/+ihAOMQwngLacP+1gPsRQcHVCURI9EZFrCahNO
	 hE2IlzEzzkOgw==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 01D4A40148;
	Tue, 21 Jan 2025 23:51:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 31445A00B4;
	Tue, 21 Jan 2025 23:51:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NWILc/zQ;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A6287405AD;
	Tue, 21 Jan 2025 23:51:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQ+aoYxMoV31GYzxcSDI9GjVngGOQMXkY9Sjzuvv+YdeNmuHgmHn3rpiefbg4IgAfnoq0/Z1I6TCgO9Bs0rqK3f3qX92ZkqGkTQjj3lOJRMdnqF79BbAcM5/9NI2s1OhG/wUt2puHMaDVCS+dWJMQTz1FA76y8Zuu6kUz7Bpv02fXFaJK9IEo6z4zlcJlDFtxhKBO+2WV7ZDi41DhfpRp0IifhSdKG/6k28l0fkNn88rU6FqICrlIb40V9o8dvLLQt5+Se3wfxrviP0FEeOfnJVyK9k5CwMf2IovjaPQEiAQ3k8yNefOOB4rUd/P6KEMlwaLZOMzk42aTzfV6gY7Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNbWVRYvWSK9/HG/3sHwUCst/XtPrOf9ntWDKbeUmJ8=;
 b=oyPcSK70ZMv2dBmLF3qaFLN/sg5a1KOGpNXbLTMhCYjNVj1T4+sfpZjSFvzsiU32xWw1IxhJPASuwx7Wxyf4evY3H35UWJRzloQaw3yTXnWw84NDRc0xfhaYx1GvzEEAkCdY7PmEcOWPMUV7+Fg4KdE7QTJysT7HbpTIJWlaRUaiZLqXIL5e1Id6+FwqhGLnfF/5iImmOBGcA3uaVlYNss/YiC/mU8WpqtgyJ0Co1YLIvlrXfKcMt0JWxUsaAq/pPawp76iZJeza41kqtgxkEOovGjnxQqFWuo0VFoP8cJwQiOjfoQVNz3c78QtLXJM/MJaVHSkTyNBua3koCdv3OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNbWVRYvWSK9/HG/3sHwUCst/XtPrOf9ntWDKbeUmJ8=;
 b=NWILc/zQ8EUkOQKzp0/Cmd48bJTKjXe8ZKZrZuxHsWGoI8wKTVtRPdZorjIxvkazYKmGBiwNEeUZaQE0MtDiO5w0COWREf5FIMGlRYnOO2m8vqmwZJhhn6GSfR6zlDZQs7BwBVOBnp7c1s1JYdsVe/16/wy/as+tH7JKSEl1x5E=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB6388.namprd12.prod.outlook.com (2603:10b6:208:388::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 23:51:51 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8377.009; Tue, 21 Jan 2025
 23:51:51 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 3/3] usb: dwc3: gadget: Skip endpoints ep[18]{in,out}
 on Intel Merrifield
Thread-Topic: [PATCH v1 3/3] usb: dwc3: gadget: Skip endpoints ep[18]{in,out}
 on Intel Merrifield
Thread-Index: AQHbaC0e4vvQDZrPEUCV4IbmsnNVa7MaD3SAgADpBICABvSAAIAAAY2A
Date: Tue, 21 Jan 2025 23:51:51 +0000
Message-ID: <20250121235149.tgouwgtm2wgrqrax@synopsys.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-4-andriy.shevchenko@linux.intel.com>
 <20250116233937.s7mv5mu4tfuaexy2@synopsys.com>
 <Z4pcMUDsFZ8-deW_@smile.fi.intel.com>
 <20250121234616.eomj7r73o6ce3u2r@synopsys.com>
In-Reply-To: <20250121234616.eomj7r73o6ce3u2r@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB6388:EE_
x-ms-office365-filtering-correlation-id: 49e76b93-720f-464f-4f99-08dd3a769389
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R1RRb2NQNWFwUTBhZWhKY05uNU1GbU9ZVmxYUGZSRkl6c0tqRTU1aE93eWFS?=
 =?utf-8?B?eGpRellmQXpCTEkxWjIwYVM2dkk4U0cwTDdSVnhrZjN2VU9iZWJGL0hIaW5S?=
 =?utf-8?B?QTZ1eFpRbVoxbE92bEIwWmhzbmM4TjVMTFRRLzkxUHRweGxXZUwrdUNscWJI?=
 =?utf-8?B?RG5FWTM1ZUEycCsyc0ozUEZ5SmxVbkNOek8wUTBWVkFLcDVOWTZLTkxIaG4z?=
 =?utf-8?B?dzZMZ0pGTllacEEwM2pzdmE2dmRSL0tQbSs4Q3R5cDdKeU41TEZldlRySTZ6?=
 =?utf-8?B?Q2wzamZCMXkvdDJYYlRma3l1TkJ3Q2dJWXNXSjA0anFEL1dwVG1hRmpRYXpZ?=
 =?utf-8?B?Nk0wZUpqSmNTRXdVSDYzaVduVTlBV29WS1BSazRudzdZbzVxcS9pYStrUkpT?=
 =?utf-8?B?V0t5Q2t0b09pN1UxVFhQRVR3MExYeS9jS1BxZEFTQUZkSVpzNlBIVk5oVFR3?=
 =?utf-8?B?WGw3dlo0RnBoZExWbjJWNzJidWxiYnd4NUpLMlhVeG5uY0pOTWVNRkxiZXY3?=
 =?utf-8?B?YkR3SmRKUDRhWmdkdVJSRnlkTnVjSktoejg4K0NCZTQxQVNFcmUyMWkySk01?=
 =?utf-8?B?Q2VzV2hZSm14aUVDS3doaXMzd01BVS9WNXBqZCt2WFEvMXE1MC85SmxLZ0pT?=
 =?utf-8?B?djBLeEJKMElmOENGd241THcreUtCUGxUOXhIZTJldXdidTNGcFNmNVpybFp0?=
 =?utf-8?B?MExMWExZZExLRVVNNzY0bzNHbVQweG0wNmJWdXlrLzNRU3orQkVaSU5vcytC?=
 =?utf-8?B?YlF1czlQYy9Nd0dNQWE2amJkZjR6N3RPY3E0ZkVONmpvZ0tOa20yMkFnOFU3?=
 =?utf-8?B?dGd3a1piSDRrb3dtdktjeXhvTis4MTlHWFhNZTJtdGdSN3lBOWJOdGFQZ0o5?=
 =?utf-8?B?S2RCbW93TzVYUWd1Y2crWlJxREpSdnY4NkNaR3g5YkdHUWtPcFlMOEZIMGdp?=
 =?utf-8?B?Z2xKTmc1djh3OHk5cmtGcnRKOG0xMXdCRXJtbUVjb2RaMXU5Yi9ySUl5SVFv?=
 =?utf-8?B?THRQR0ZYZWJGSG9UdGVCelYremQxMnpmb0QvelkyM29naHF0NVI1dms4NWRP?=
 =?utf-8?B?ajJlTWFSQzJzTm5IWHJXT3d6Q1ZUMG8vYytyWFFGZ2d4b1JYdkc1OXBoclFn?=
 =?utf-8?B?WmJwRDhmaVhtQ3FsbEJSN3ZXdDBFK0YzejNqYzFRRjdLVm5aUnY0bHVWVXo5?=
 =?utf-8?B?Yi9DTU5rLzNCS0UyMWJLellHazlIR1lnanpaVkNWMXZiTTczN2FoaldvZHZr?=
 =?utf-8?B?SFRqTnBLblh4RjdHL3pCZ3hYTmFCcVhjNVI2c2t0YVJVc3F4djdWMFN0OFlP?=
 =?utf-8?B?aFNNVC96Mlp6QU1MZ1B3L3ozSjZrVVVuOElpZ3dDYTREc28xYkNHSGpxM2NQ?=
 =?utf-8?B?eVprWTBhZlRXUW5vc1NhWkYvL2w1ZFl2Y2xpaGxHTHp1dWFRa2dhdzVNWXJW?=
 =?utf-8?B?cUYrLyt2TWtlLzhKSnJsb1FHaWtJTDczTlhZMDhKS3NZejZ0ZnBvSG1YZm1H?=
 =?utf-8?B?dXc2eGpsaXhuQWZacndZSURPdFh2R0wzM0oxaGF1cnVBTFZIY3gvL0Z4UTNI?=
 =?utf-8?B?MVBUNWVIWEIwek9EZW9KUGVBOTlXYzFMTXpNNVFVcnk0eG02R0tZL0QrNkVN?=
 =?utf-8?B?QSs2RjhWc2xKMTI5Z1hMZlBFS0xPNEdERFZGVmd4bThZU3BtbDlXWEg1andl?=
 =?utf-8?B?cG82NWZYU1dlc1MzdUxNT3lOd0M2dDZCRkhzMjlQR2FmT2ZlYlducEdZdVJH?=
 =?utf-8?B?MDJ6L1RibFVQb1FoMG1HbTQzOVdPakh0QkVhWlN0eko3UjZERFNXamNYY2ZH?=
 =?utf-8?B?dEZVaUM5NDluRDFLRlFTUEpNVmROWTRXalI2UGszZTFlczNHWFNwSUZoMnVp?=
 =?utf-8?B?c2h6RmM2cVBKTUtLUkx5VStnTENzdVRZdDZsOUd5anZOLzNqQ21VU1YwZVVy?=
 =?utf-8?Q?az6IzuhpQy2QNZkW4LWf7r2Y5WgSn7d9?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OEZwZXJiOUJrZ00yV1N2NS9CZ1I5MXhYODliNHFab01GOUR1dTNOVVlBMjhX?=
 =?utf-8?B?YWl1TmRZOW9SM2lWbFRmQ3RQSTJ6cStTUm1neVNNdko3cWQwL1VFcmVBU01j?=
 =?utf-8?B?VmdWSm54WjFCOS9zV1V5N3VQbmpEVXRqU2VEM2ROVWlQN2VGc3ZneWtmc0FF?=
 =?utf-8?B?YXJqWHMzOEtiNTU1b0h4d3ZQclVDdWlVY0hHaUtFQVBRMWNpYmtvbnYwYU45?=
 =?utf-8?B?M3QxWThYdEUzdVpDM0hZTVFRL1Q0b3p0akt5Q2ZhZHNwdjV3eTZtUW5TTFlv?=
 =?utf-8?B?ZVZxWVI1d2JPbnl0MWJGQmM4OGp4eFVrQ2E5Z2ZaTnA0bDJxalpwZDBqY1FT?=
 =?utf-8?B?aVoxQjFLTzlNU21SUkx0YldWVEFOakVLR0NIS0VWU3pIU0x5bWpEejV1SmpV?=
 =?utf-8?B?RzRHMmVoQ1UwVEFwcDVmZVdBQWtLS0l4RjVCbWRLUVowODZ0R2xCcjZtQm9i?=
 =?utf-8?B?OGVUUTlIQ21rMEhOTU5XclJ0eUVkNnFHYTNVVDFDVmx0aFp6TWREY3hQZGY3?=
 =?utf-8?B?cGV0LytNUkNMQ2tHYSt2MTBya3VoSVB5TVNscnZqeG1QQXc3djlmRzJscFRu?=
 =?utf-8?B?aXdGd09aNjZTNnUzeDNyMjNCOGFlK3RuYW5GQmVFWjRqdDArdFRCVVVDc215?=
 =?utf-8?B?akRLelVtMGpnM2p4RFFLUG40VmYvcXBWQW9kdWFjalRGdktrQXVpZVh2c2Jh?=
 =?utf-8?B?emI5eHY2RjhEQjhLY2k5Wm1sR3lyRXMrOXZxaDErOFkyaS90RHIxVm5ZYVlS?=
 =?utf-8?B?NjhESWhNanZQOUVVRkViYm95a2hjUEp1YUVRUGcwS1hOZUNFTEp2Ui9NUXZI?=
 =?utf-8?B?QzNFZXdPbVYvMmxLOElUUTNDRzdTTEV1YU5MN0lFeUExSlk2Mmp2bW1uMkty?=
 =?utf-8?B?UGswMVdyc1JaMWF1VnpiU1dCc3RWdzM3OStFSUlkNEdBMFU1ZTcwTjFDMmJi?=
 =?utf-8?B?TmtJNTFlYXlqZXMvU3FLRHJhMGE3NlIyZHl1eVVxOUs2NTRvaWw0OEhCam1S?=
 =?utf-8?B?T1JvVHpHVVNxZnRvczBiVnRRNXZXVFZuQThwblNGYlgyZEdzaHFzcXREZ09s?=
 =?utf-8?B?YmF1cVYybkJLbUlQRmZCWTB3cEpic1NQenF6Y0I3cVp2elhSZG1Gd2pQenp5?=
 =?utf-8?B?Y3ppa0Rqak1sKzZYWm54ZnpPWThxQWlHVkFoaGQvOThYYUpPdW1KampZcXll?=
 =?utf-8?B?L3o2YzlmdVhmRmJuVnBFdlAwSWx3SGhxQkFvenNkQUtjUGViaHpxNUZQcHlF?=
 =?utf-8?B?WXFqTDRpdVBoYjY2WkNYVUhBZzJ1cEYrdmtaTjlHSFpCalkzb2RETC9DT1lS?=
 =?utf-8?B?dlNTNll3eWV3Z1FKWXpwdDY5QmZxZVhLMTlJUGVhelRwWG90TFl5c1FhYU54?=
 =?utf-8?B?dmVJSHRPdmNITVp0QXFxK3V2QzByRUFQZytTMFFZdGtkSE05UnZQaFVHR0la?=
 =?utf-8?B?QzNuUmR5VC8xc01BdTdyTlNIdjFPNmNXQ2tWVDFWdm9oOVZ1eG9oRXFXNW8v?=
 =?utf-8?B?aXA2ZjVmN3BjOE5sb0NVYjUyaldHMmJGbHdPTC9HeTdiUnJkQmN0Z0RuaFY2?=
 =?utf-8?B?a0Z6d0FleHNIaElpNjVQUjNBVzVoQjBYR0xQMVlkVzVySmJlK0dpcUhWd0xM?=
 =?utf-8?B?MTdEK1pkL0JFSmxOTS9US2p0ZytUY3EzY2tqSGR5MXdqcnpYaWY5dDAzVjMz?=
 =?utf-8?B?VmpMdHRJc2dTRngyRmpEdUhWamtpWkdOZ1A1KytkQ2Y2TC93ck5hcmtYMzAr?=
 =?utf-8?B?cTJwZGNscXlMb2tnYm10b2pjQ1B6ay8rYWhqb01FVnFNOEdsUnc5dHM4OUx6?=
 =?utf-8?B?cGxNK05BamhWcFA5UVpDa1ZnYXBMei91dUFzS01MUDRDdllvL1RVYTZudU5V?=
 =?utf-8?B?QkQzRGcza2lOaGlPdFNHMmRPTy9WL1QwY3B0bnJheU1nUzRlOFRGeElSOTRm?=
 =?utf-8?B?OUZESERjK09mSVpPbjVVRHNQaHFIcmpuQWhCZzk1VlF5dzVxV1E3aVptY3Fo?=
 =?utf-8?B?SE9Sc2JpOExlaWx2alFpdk9NdlNlY1RwWnR2bTVyYkZCU3luQkJtSnpxWWlh?=
 =?utf-8?B?bi9rNTlja3RpVmZOYVJrbExLMmlOd1BsbDNYWDgrb0FJYXIyaUtMVnNWRkFq?=
 =?utf-8?Q?hRdN+ZuLvkO9YzP7CInK/gV4O?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <99F096C2EA0E3141974F06350200E14A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hn0xqlYvF/sK+6VxbYcXfsrTBrmrMy1YxhjPd5/zq4Imql+5RlY5DaKqUrs4alS1JUa87R6VMgDIeUdHaZhC5OiN7c5aQv0NRXeIwhvsO6414l1RziGdW0046pDajygiyysBItQcfUtQtRC/5Dqpz4/CpIEXKFdmdM+Ks26ERkflDkJDG0scbbHjgEwIETREA2JM+3XTJ4OsyAyNJP/XRwUh+nbo5LN5e1xgUUktEg6m9YSqYMK8DEwv4gDYxQVMsXpezlibamqBiR3M0GzN+uJxM2wpMd1v37IBcGPSdDVgRmO5YlBlV7IvPh0PfjJ1f5gwR9O57Aqj8NiLmBBCmR2QiKHqYNbGm2wngF0x+u+1GRfd3YJLxRrW1q0EHYz19giWFTD+LCQ8UlKQq8jhwCtPgr7h29AimKt/Y/+v5DsevdJMLeH9n1o65brdxQoc+a28xX/gaLer2+irRfycb4SrYLNg5D5NwQBR3VUCbtM8cx7BsUXriYd5vNZmnbY3qSCAnHC24Yi1PC8sHguDw5nsBnGXvyvy7LNDDIEOZ1tJSlCH60nup+9sIM8IPwh8vR3ZuaFgIc9S9dbQm+EChGlYUhBJXXoijuCACH1299aPe/JsyQCv99X2IO3PvKyhEGuuGN/l/njhxF1XrGrY4g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e76b93-720f-464f-4f99-08dd3a769389
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 23:51:51.1733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3JxS8FiYj7aS5ThxOYmD4Nz9CQ7FfcBTCU3oFGRpB0MerU84b2wws6alTWl5ZZX28xX/J0M890VsRWpdXmaddQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6388
X-Proofpoint-GUID: PzUKNEeN5emrwKl0RaesPjME0GGCAyET
X-Proofpoint-ORIG-GUID: PzUKNEeN5emrwKl0RaesPjME0GGCAyET
X-Authority-Analysis: v=2.4 cv=PewFhjhd c=1 sm=1 tr=0 ts=6790331c cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=dIvxXwk-7_rvlxEAGyUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_09,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=565 spamscore=0 priorityscore=1501 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210189

T24gVHVlLCBKYW4gMjEsIDIwMjUsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gRnJpLCBKYW4g
MTcsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gPiBPbiBUaHUsIEphbiAxNiwgMjAy
NSBhdCAxMTozOTo0MlBNICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiBPbiBUaHUs
IEphbiAxNiwgMjAyNSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOg0KPiA+IA0KPiA+IC4uLg0KPiA+
IA0KPiA+ID4gPiArICogSW50ZWwgTWVycmlmaWVsZCB1c2VzIHRoZXNlIGVuZHBvaW50cyBmb3Ig
dHJhY2luZyBhbmQgdGhleSBzaG91bGRuJ3QgYmUgdXNlZA0KPiA+ID4gPiArICogZm9yIG5vcm1h
bCB0cmFuc2ZlcnMsIHdlIG5lZWQgdG8gc2tpcCB0aGVtLg0KPiA+ID4gPiArICog4oCiIDEgSGln
aCBCVyBCdWxrIElOIChJTiMxKSAoUlRJVCkNCj4gPiA+ID4gKyAqIOKAoiAxIDFLQiBCVyBCdWxr
IElOIChJTiM4KSArIDEgMUtCIEJXIEJ1bGsgT1VUIChSdW4gQ29udHJvbCkgKE9VVCM4KQ0KPiA+
ID4gDQo+ID4gPiBQbGVhc2UgdXNlIHJlZ3VsYXIgYnVsbGV0IGNoYXJhY3RlciBhbmQgbGlzdCB0
aGUgZW5kcG9pbnQgcGVyIGxpbmUuDQo+ID4gDQo+ID4gV2hpY2ggaXMuLi4/DQo+ID4gDQo+ID4g
VG8gbXkgY3VyaW9zaXR5LCB3aGF0J3Mgd3Jvbmcgd2l0aCB0aGUgYWJvdmU/DQo+ID4gDQo+IA0K
PiBQbGVhc2UgdXNlIGEgY2hhcmFjdGVyIHRoYXQgd2UgY2FuIGZpbmQgb24gdGhlIGtleWJvYXJk
ICgtIG9yICogZm9yDQo+IGV4YW1wbGUpLg0KPiANCj4gQW5kIHdoeSB3b3VsZCB5b3Ugd2FudCB0
byBsaXN0IHRoZW0gbGlrZSB0aGlzOg0KPiANCj4gCSogRW5kcG9pbnQgQQ0KPiAJKiBFbmRwb2lu
dCBCICsgRW5kcG9pbnQgQw0KPiANCj4gQXMgb3Bwb3NlIHRvOg0KPiANCj4gCSogRW5kcG9pbnQg
QQ0KPiAJKiBFbmRwb2ludCBCDQo+IAkqIEVuZHBvaW50IEMNCj4gDQoNCkFsc28sIHBsZWFzZSBm
aXggdGhlICRzdWJqZWN0IGFuZCByZXBsYWNlICJlbmRwb2ludHMgZXBbMThde2luLG91dH0iIHRv
DQpqdXN0ICJyZXNlcnZlZCBlbmRwb2ludHMiLg0KDQpCUiwNClRoaW5o

