Return-Path: <linux-usb+bounces-18350-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 738CF9EC0DC
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:33:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00375282CFB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C75118EAD;
	Wed, 11 Dec 2024 00:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qauCdUzO";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YDFESKW1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iaXxCuda"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA97CA4E
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877228; cv=fail; b=IStPEdpUguGChVlILuRrRmpTgPHKlG1h3H+8kRSHh5m0UaEhl+2RnyJ6MQdWy/zAW0qa4C+Sxb6i6r+LWDLFC9NQB6n4/Ag/8nvl8xw+VcbzZ1xNU5knfe9LdHIZ4iqbpjtlk1vWWnExnvFbMZz4wszej+d3l8QV61Pj7kensIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877228; c=relaxed/simple;
	bh=30ftRg4Jmj9R7n7OrzBjhix+0oJnLNuGdimoGSN0j3E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q7hUYQ2itPW29RO9ae+iJk3/mI2zWH7zBjC62iKUZFmB6p5RxbiPkOYWskE35JQu8tPVqgpAD5ekqh5ZNuAJnm1g61bk++PD7Ou1p8TQQ6NsXVDmKcYXFrAe590jZZPYvMIOV2+OBm/ra3CeZdSZqaf64P3UHAN1TmOnLq596WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qauCdUzO; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YDFESKW1; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iaXxCuda reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAM2wCv017317;
	Tue, 10 Dec 2024 16:33:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=q3NC0aDaPgk1HYByKqbgq7c8XzFCrpLkuyVpwiRqOmo=; b=qauCdUzOqdO6
	vsKUk0hTtvj79o44v3JfXT5M8lyVVseeO7bnXiD12gqE0IMbaeEU+BvPSVJipwWj
	kFyMeMoWHEfAKO+SiXzQwS88eFDI1/SeAIqpnhcSFKtR5k3huNKtPp3eHI5DI3Jc
	X3TOcReTOiqV0OxG/ENZA5CeCRL58OXdk9rnTvAMVBs/5kQFk34nIIGfVriLrbVp
	wWz8y8Pp6a3kPifv9JwYCPA+QPwGZDHL9H4sh7t1ICIAUGmUJtA6/nIUOY6Qhe2j
	flYRTM2BuLiMyoPqwTbCdKFpFjapj5ic1+xPqIBtH1X5fGRAjKsS7asuCSioQ+yo
	0V2eQJKvXw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cp60t151-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877222; bh=30ftRg4Jmj9R7n7OrzBjhix+0oJnLNuGdimoGSN0j3E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YDFESKW1jfia1pIWcx94efxjrMJR49932DShuNzddamMbfK74ti7Rjstfw9tZgkM7
	 jyDwqxwXeM0XAp2g2Hbbg5TxM1u6zhpQEHk8Ke0zhHPNPTmUKKjXTgDYk44FS5PMph
	 oT9soEU5++YVn8A2q4G9OvyI5Nf3BKJJjIxoyWVZMnaYcw2n4c8LRiU+BkoGe2viCr
	 mfpSDtpHmqkkwzLvyvGCLIsxuXy2xg1cVqx0ZsYLxuKZ95cNyrT8D4IrzyotH9xQpy
	 b4Zw32+N89Jlvl/CAb9XYl/sUGcw1M0MHPBJCciWcTYYn1CFSf+Km+3E/5HwFcgul1
	 fMb/zvaOJyTSQ==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 11B85401F2;
	Wed, 11 Dec 2024 00:33:42 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CE40FA008F;
	Wed, 11 Dec 2024 00:33:41 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=iaXxCuda;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 985A34041D;
	Wed, 11 Dec 2024 00:33:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpvPQj/vj7WWTKeG9S43sYhBKGYumkR59HCU6V64sQZAmLHgnXgeFhDp/99ZVm22nr7RvNh9LdmXQRt4JOp9/YKoLqQG6WTz7Qbv8XZXkCY+AVSU+ms+wiwOm9k3CWJ6EvhsglUBZF8uhmuoMlV9Wt44Azuip0cTtVX5aSIfJjD0GomjpxaES2oynl7JnouiNOBMqgfjY00t7vsIuhEk72azs8BYemvw+V8Wa+jFWSd/VMpA/1rrRVBV2xt7SS5Dt2TxSmnAhnLWzNWFOwn3cb5HU4I26pC14s69U6Dv3fepMFF3tvnNygldpaMKx+5UbAtcgIhsYZw6I0Bekx2Ihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3NC0aDaPgk1HYByKqbgq7c8XzFCrpLkuyVpwiRqOmo=;
 b=apdezKVLpczQacbl/DEpJ7euF0mwtZPCDCH8EUrWeh/K7LYWMdli0my72rapObfWcuklOitRUbw7zLYTdh5Jm9ctwlEmsyKlz+2kzTIrmkc+5zPj8EHQ1hVo+YEaQK23ZtF4UJmNmuyuY4KQPZw61BWeIAvjrZXN1OA6ODozDcKhTn1j9KYRhTwBgk/sfsQyYRWOfONsVMsoaXeqCU6bYvcZnwl0/BJ/nTGmgDx3lpF4k+sQ6mEcGMkdCty3YTtllliXLrjJpZlXxf1IvdrNg4v7yl7cW1/HuyizA8sHnfdUN8zfz7VyFmuTiTw0JXWPDp+eYbGgIoDdZs0/iltrjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3NC0aDaPgk1HYByKqbgq7c8XzFCrpLkuyVpwiRqOmo=;
 b=iaXxCudaQhqivyUdcsKNrH2NqsiQ/gFyeUexGD1U6ZuJtHJe9mCzOufRC+P4Fx/S3lBSJpcAXw8sWssi+wcit91T9QSmTkRkeyEvgRreMUlTvcIlxy7Aavc6joxTzOUnLKDMHs81wcK2UQ/P+a1I/W4UaX+4tpjwTWvJnvixKKc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:33:38 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:33:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 21/28] usb: gadget: f_tcm: Save CPU ID per command
Thread-Topic: [PATCH v3 21/28] usb: gadget: f_tcm: Save CPU ID per command
Thread-Index: AQHbS2RSnXzVtU++A06ydDEor1K92g==
Date: Wed, 11 Dec 2024 00:33:38 +0000
Message-ID:
 <ab45e37314405d9cdd7a8e3b761c654400bb2270.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 86cb6e02-63fb-448f-2488-08dd197b74c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?SCf2nmDmmDClzIjRlTYnfJ6NUjMQ6WFgiFhRqbMsLTl9agg0loRfRulDSE?=
 =?iso-8859-1?Q?Me/bgUwSPyDWPJjxl0RjdNhkyOXFANqnu/knSiO5sYPGxTneeVVED5Zmh4?=
 =?iso-8859-1?Q?OIKoxnaJeyG+JJt/dAo9rja3Lj1BhHI3n7hDm6mAYJWAfe1vFCJ/1zD7tE?=
 =?iso-8859-1?Q?utcZmuRahSXfba17nMdwI9QwzNPx1rvlLLRXOTYKuEhkV5bLU1GUrzlgMB?=
 =?iso-8859-1?Q?+dKsU0Z8SIGx0YPNkETdId5lsSyHg6H158KECOSYmqiJwjPlX/PO9agfwf?=
 =?iso-8859-1?Q?OnkZRMNfLR+KlIYmNalc01XJUkdrrsv1u6F97g//STt9bddIzAcO9+A3er?=
 =?iso-8859-1?Q?MwEXfUnQHD2oYzUVCjY7eI29UOb0nQv51cQGAt4Iv5ihHlTAhOiePNiJpy?=
 =?iso-8859-1?Q?KvXX4Ys7qc1goSEzNOFJbiYoqMSt6qozVxKTN96UHjPbSMeX+TLD7okJit?=
 =?iso-8859-1?Q?bu3OK2bhXUOzV3t9PWHN/PjWaDRhndcdFfFuH7KTeiJc9Hv39YH0506ZBZ?=
 =?iso-8859-1?Q?EhiA8y/aUIQcTGyj7yIUmRuwWZZDDX8WqueqhQ0/y3hbA+TBZPi5jfn28p?=
 =?iso-8859-1?Q?l4QWfa14VTMsXYrfSDFS4kyCFauTMSh4wEVKTFeR4S2nUwu5/evHriFwLB?=
 =?iso-8859-1?Q?vhPAucjGWVjCX1pNr4qL5LCV5fGZ2eLwCUncFOhdglIYJswrQsXYTJ6RE5?=
 =?iso-8859-1?Q?QyQKxGdns9aFV0Cx6ekIG91rC0ZBo14FKfRKA1sVe2CFnDbg0PkDNOHZV1?=
 =?iso-8859-1?Q?liqs4tipGPYvBaDVQjZuiT509xgnYjogA8G0TbykFnxEz7mupmJ/W057CC?=
 =?iso-8859-1?Q?Jp/ZIUOLCDCfLtg+bsIIdkqE8WOdV20+u54YAZeoH6PRz+Mz9XvrSScii2?=
 =?iso-8859-1?Q?b0Awiv6KJq7FwjHgrSVIX496I9KA1F1ri+tU/gcTPVv/YB1ROfL3kmpBiu?=
 =?iso-8859-1?Q?de8vH+b1qg/YULdQfxH8CHISMjh6zM5MwOFwUxjajvjVruhfmtB7be02Be?=
 =?iso-8859-1?Q?zRCzcbxqGLxjQIvcfPkEH3leVPZ/86rC9fdHcWVPh16VWu59WRsuqNGstA?=
 =?iso-8859-1?Q?Pk9dd/6TUY7dQZ9BVDxnGRZiqTG1YYF9bpSPa07xSqLVQOUhwvMsnGjOdz?=
 =?iso-8859-1?Q?+43BjpEIh3S8/iE7bPB2YveM0TkHkgB4feQxudJ+OYP9GbhltAl5ONsm/j?=
 =?iso-8859-1?Q?HrOAqKL5H1IY5ofX8jGBBb8WCy3fX6dPiLfXCOi/aOFtEAp/vJ6PKeAJ/G?=
 =?iso-8859-1?Q?OwfatVJFrFkV3mL9xLSWkL9W/6EKphULeyTwRfEl1Uuu08ZpHOnvw5Zh8+?=
 =?iso-8859-1?Q?1tM8X5/tAbyFbUaKBwqYvP8+jr4cPYGrIZQoJ9pnytcIheG72AGb8ugmnJ?=
 =?iso-8859-1?Q?T33tM53AXPkfKsTyv7oqn+8jswtXp/sxOuaHuszzfvmUbetJiggmn10N6e?=
 =?iso-8859-1?Q?fAUygCpoqkH1VCeVNXFQNVtOPTMsWja7pzZAIQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jk6HYoxNSkXy0dQ1WHo5dn/ZiLS+7KT6CLk8/ZxBoNai1JopD3u2886xd2?=
 =?iso-8859-1?Q?6EVOwsffCq8+fwKTLhBUf+fWwYe/BmmaPUoJ5yQYYymRsvv3yeFnyfKlAe?=
 =?iso-8859-1?Q?3ACLlqzdnuv6mVIa/nHLhLE1/dpCoHSXzfRx2jKoGR9ZABw6Qc/odpiVKb?=
 =?iso-8859-1?Q?WA+jkJnGukMg1cBQ/xT0Sc1UTCsM7LKSFABdz/BJc0kgl7b9YNFYZkWjzE?=
 =?iso-8859-1?Q?is6JaHGbaRJ6uyPU9q240HvNmHLcgOnKMGevESnw5GEfx8EoI+FMaQB4Ss?=
 =?iso-8859-1?Q?NbjQHoe1mJlQG5LSUgNOyuCQPjt2GgjyGh+JT5lrGDV9QsY49SflTvN6Od?=
 =?iso-8859-1?Q?zSyQNZQSUwyD2XuY6geHcJ1NhxHheqQWzEHr7+hKKWxjJSC0skX7kvn4un?=
 =?iso-8859-1?Q?NbEH/PjtifrG0Datt4tACmVLLXfWiRJbpTEaPLGU3ShWHoEngWKOjfbMBf?=
 =?iso-8859-1?Q?zxtQ/mauQFHMePlNOMLt3wBB7SaPdpBUCpGNLOzlx7IfWeEYDmpzFc1McG?=
 =?iso-8859-1?Q?DtOgkHXCEJGYcRbER+haAtKHxnb1B/SJS3S8HRA9zZLBOubVjxRFLxogoR?=
 =?iso-8859-1?Q?KaDkY4x4T21roLmSdaSbZgEfm4ewSrAPJRZCo3vRpsJ/IXYnJYB1VT9Dgx?=
 =?iso-8859-1?Q?PjDQN0CI+5QzDoDKufhSMDevwn0zUekzFcVw1QMKet1FiiYpoA4vKhViWT?=
 =?iso-8859-1?Q?8Dg5haDOR1PP0pJ9CAsECKzQRaeAwz7fbtaPMSIiLewSxHdWAv/bHJCn3V?=
 =?iso-8859-1?Q?fMap/hpETd1fqIi4638mwVIt85EBmg2t4o4WNlwINUMTk6JhzY/9KHGkdf?=
 =?iso-8859-1?Q?VZs0yEcpwe9KJ5TXCJEreU0JOK4aOnReNLrke8gqc66T4p6CsfKaXiEiwA?=
 =?iso-8859-1?Q?BvpKazXcCFjISFQ+ek7O5Q4VZr27qsN1H0hMQtHtASC0k/CiZ/oeZK1gPQ?=
 =?iso-8859-1?Q?YcpotndCROiD7qNRTecC0hSGuGdFb3v30k92qipn6JZ+dB1yGlVN+/wio1?=
 =?iso-8859-1?Q?Se5xqmXYupDPs4z+nazO1FbebNCmc6Mm1VpC384ipXcw43saDqE36Ydyj1?=
 =?iso-8859-1?Q?O85SXqdpQlTBJa9hIQ5RE8rJ3lEs47R+g+ZQo/34CWjUMSx7tXhE+GhXWl?=
 =?iso-8859-1?Q?32ZrQccrYEk/9aDS6OVmaBxMvolXtqD5Ng9nT51/xdf2HXC1IMCKs3SYgP?=
 =?iso-8859-1?Q?ugyHagGzFlbyHv8URw9CkoQcJ4fMpI/MKhPS9TbDy/TYpBUvhOvLiD8Umh?=
 =?iso-8859-1?Q?ojmZEjqdHzt81Pd9WPQUVn9ke79TlAhatxK8b/lY8HM66iLIfuXoKv9Nx1?=
 =?iso-8859-1?Q?/cC3rXGaMGw/qJm2e6lQwpw0y1L4snPu8CmMQOJ2hH0fq1ehh065/fagXI?=
 =?iso-8859-1?Q?hQ5u5gGoB4LKXkLctDAJMIFWUg44sD/8OrYAFxvIcoZYHbgz4lS/LagBNG?=
 =?iso-8859-1?Q?8Bq5U/FoD9NtDXAzkMqSreA/6URRTvxAC/BNl8hmpvAiBTY6EFQ4bE1ajt?=
 =?iso-8859-1?Q?lvoZk8G0roXVJNFi6xy5YdakoO3QzI1oqGU1PeyQ0NfGVAGDdnJ3JNfk8D?=
 =?iso-8859-1?Q?lfOgx0157JCMTroEmrdiwgfp5QBMXMoiqxBhU29mqM8/57XHC+v9Ge2YMz?=
 =?iso-8859-1?Q?zNAAo5QWa1kvp2edL4jVswRnFHIJkG4q+VMPtzSDeNq/RRzYc4BEtXWg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	un3vfLuaAWttHuYLKL9qVDKYUH0Bx5P13xY4YDo8qevHrqsoSIccYH598pjA5uqFYTRhG0aCg9xbdesNpCfi8BVXrapELii2S2ajokftF4CzB7EInbkzX24MdS92uINV5ZL4uqB9zTVihWW2E9yHSXcS4nu5xg+breZMpKKpcQe1y7kVOMnkc8dETuwf8rjJi25eASiquHEmtUPjmedkEMOia87CAxKNiu8ZbM/iZ4B6icNykaZZhArudkJzA4LmV8uvyflDTCrTJqsbK8oAlvbkE44j3W+4e0foLcL6oFO+0t+MKn7EQBvlSix7+mYgTvOVmoeiUnSbUQ1EF3Ft6gTgI7nd1+03A9QeHmSQybFeUrG7NT9dWr6HUDCDxDSk2UIL/vAbT2+m5DAhfX05dfld2+No9z0mC4gdOKcTvhH75CgqzDfe8XycUF59UsQk5Yrk+9BBz7UVwpzuKACj1MsJqVQBqDpzwKlbYX7gdInjU81stWV6WEuefn3Z2Yt0KICQQRcve1PaaqXuVHsVvRPAbj4codtzzW+qBIuXGbud2DU7EUQObP2mrcC5K1dQq7eI6rre9gNbbO12eyJlECxKEbcGvZiIf78d3h2sf6HqxPt+EDK8aZFjr4RMwzQ3/LQ8KcCj+Z11pjecWtXYzQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cb6e02-63fb-448f-2488-08dd197b74c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:33:38.6748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T7Vli/51xI6fnZlzQmA0mckAhEcRhu5IHCj/a3rO8qpZrHrEh340eT+6Ybt46glkVe8hJDMrtseD4Zbr1ItAnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=Z9YWHGRA c=1 sm=1 tr=0 ts=6758dde7 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=ZSQD_yvq6OMFtrDGxUoA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: bGWN9CmxNU5LvS1sFZg90cb3bzn0sWXq
X-Proofpoint-GUID: bGWN9CmxNU5LvS1sFZg90cb3bzn0sWXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=879 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

Normally we don't care about the CPU id, but if we ever use
TARGET_SCF_USE_CPUID, then we need to save the cpuid.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index 6aa341c1472a..da594767ba98 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1073,6 +1073,7 @@ static struct usbg_cmd *usbg_get_cmd(struct f_uas *fu=
,
 	memset(cmd, 0, sizeof(*cmd));
 	cmd->se_cmd.map_tag =3D tag;
 	cmd->se_cmd.map_cpu =3D cpu;
+	cmd->se_cmd.cpuid =3D cpu;
 	cmd->se_cmd.tag =3D cmd->tag =3D scsi_tag;
 	cmd->fu =3D fu;
=20
--=20
2.28.0

