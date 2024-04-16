Return-Path: <linux-usb+bounces-9412-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 497CA8A7874
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 01:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 000D9281DC5
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 23:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0E413A89B;
	Tue, 16 Apr 2024 23:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PorAgazh";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IqoktxM7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lpgictj4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518513C099
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 23:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713309089; cv=fail; b=kn1JyBn4O1MrBjBEz/TBrzcrE/CWEJ9Qoz5xko5BInMYOUYGFCWRaBvkwsr1Tuf96qRfMTakHoLu4D/n5O9YLnr86CMHtFfrnpaPwJJ0BqIOLPTuvnQae0OIyMLAL4HofjyBtlHOGlhYURxz6z9HtCWSg1Hy1xgTNFhgGRhfkik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713309089; c=relaxed/simple;
	bh=AA3nBBn+Q0gurFdSt5JDimLMe1kTLjNVzyB7c8tkGyg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NxkxsdHWa2v3WU6npI0GX4L84be5HnoL9ENUdyCFPVYybpH2z6KfLvO/k8wdGjbb6NI17T8CXFkjicfYozXdIXnYYsHZnn/ZaBKtlEKdYbJ8prHza+A21KUIiANgQsl/xMDfU9cEilzgIh4rUhQcX/fwk5ZJF4GTkLjIb45IfYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PorAgazh; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=IqoktxM7; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lpgictj4 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GHbYMp013741;
	Tue, 16 Apr 2024 16:11:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=LimR
	YrURYq/SJdC4X2LanReU6rfnUkvw4vRGicIH/2A=; b=PorAgazhruOa2GHqGpbz
	H8r5LIJHmpUpOx97zXashElhXHOJyoZVO7oDRSyQpVjMmwLyr3PJFwy9vLnE7A/R
	uGT4c4se6wQwt81hhVv1cIsSvGjWBQ8QK2ucDV+YHubNIIN5vSQiCjCC/8iLA0n2
	3esvPFNqYk3Wu1kKppJFjLfeNAF4ykcT6jr2QERVt9qFVA8KEC2QVO5jRsmMri99
	ZsVJzoXLbZdUg7G5HFqwm+Eb1n5+JgXC0fgMB/VHRRMmHa9KdtoB6lth2lvbGfck
	ekyEagnUixJ8ran5h7+us3Nz5cnn9UEy3avdduWd698rQN7xGSnLw8detBl4lQQr
	ng==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3xhrretn9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 16:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1713309085; bh=AA3nBBn+Q0gurFdSt5JDimLMe1kTLjNVzyB7c8tkGyg=;
	h=From:To:CC:Subject:Date:From;
	b=IqoktxM7ETVWK/6KasOiATw/ORk/lVAzicqrpJkOmyLk+GlUM4cjgEtyKrqJiG2C8
	 8FgxeKWSNSB7nUj/dlnBbq6XeCbs8XEQSzqfw7ZX/k72NJkxlV1w5v39TXFyobSRmV
	 FF1gIagPGs4OXU9CkGf+oHOyie+zx/C8yOqVZJORb21idYkvoN5UHJUuttgdo5XRi2
	 PeoTA6ZMoKEBQWPFZYRoeqFg4klgnf+f6L4yKxGvKUw0+awDn94fdztjJ2Q96I0bfu
	 PpjhkeV52E97YnYVqWpSK3Jcz4OInB4qvsUPTP+R9ikookRi5ECQ7Tg78qVS3ZdU5p
	 QovxZF9Y2AR7g==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 17C22404AC;
	Tue, 16 Apr 2024 23:11:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id ADAA3A007F;
	Tue, 16 Apr 2024 23:11:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=lpgictj4;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 3FE7A40524;
	Tue, 16 Apr 2024 23:11:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T466kyqh753y7CNAHjfvdCYEKDAqoDx5gxw/qwkJ6xPz9/0pGMNJ05XGocyJ+DzgufVCm8Suea4fs39vUxpcougl2neryPhwioUNSz74ZRBCUCvZb2SHoshmdjpyVYMqwtabHIoXYDHWiXbZjK/GyGy6kLeCGI0+aJWnzN7C03+VPCl22+f4G2VQQuf0z0gkXbBqwuOSwO2PtsIB0L+d9Eb4hnnh+IyGyChpw+uj7Pv+t+ZeqZ4hgFtxxgfJYhHpqoJg9dThiPnRx8fbGrBnF3XaoEXm3WfP+J/Qy0UbotvI3z9/rSQNmP7katAoLcPc80AVvrgOu/80OXljCgV3Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LimRYrURYq/SJdC4X2LanReU6rfnUkvw4vRGicIH/2A=;
 b=LhAK8W7RruliUa3QDq3W/oihAJAZ6qLdly2vKmpayv5iNDKo93W50QHf23jfZgu6E/wRFFzDbMd2oe5rl1pyrRr0UcekDyYRimbXL6AzBwsB9s0Vbw0lLRC22Bxsx4osb0LY/FrXi833Ulu4VQLdumNHvo3D9lCdCB2SdBqTb0w9CZH2xteUA1kC6XZU4bjovBtyodxkGO/FZfcPPRNtfYol5qe7zqLsWvRvEgRFQzzo3u8EaIq+FD8Y+0eDmX+s0pM+mRxIaTeO7F12sHMXh+hoKQSya79AlkWAKl31BywiE9A/W46SLhmYeep1XdBMKskJ6PyzcNWvMTk3NyGQgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LimRYrURYq/SJdC4X2LanReU6rfnUkvw4vRGicIH/2A=;
 b=lpgictj4jnakaaerTkHGoxb7GurDtNtq4zhfZdQJRoXzkioHC8BgtmyCwHRvCE4II5lG8I29XcO+floy8Ugvwvlmuv+wzyE0Ju3obSwf9dNZ1ajzbAiOZZE8ReAlnVghxGggj4PadKM1+6Bgq6j++/gxIySuxwyjUKUW2xpSbA8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW4PR12MB6924.namprd12.prod.outlook.com (2603:10b6:303:207::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:11:20 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7827:b41a:c9d6:8e1d]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7827:b41a:c9d6:8e1d%7]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 23:11:20 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: dwc3: Select 2.0 or 3.0 clk base on maximum_speed
Thread-Topic: [PATCH] usb: dwc3: Select 2.0 or 3.0 clk base on maximum_speed
Thread-Index: AQHakFNkUC+kH/mRlEug/ltvhEZqdA==
Date: Tue, 16 Apr 2024 23:11:20 +0000
Message-ID: 
 <65003b0cc37c08a0d22996009f548247ad18c00c.1713308949.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW4PR12MB6924:EE_
x-ms-office365-filtering-correlation-id: dd550634-7676-42d8-8b02-08dc5e6a86e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rax/bCctEKZBSluTHOUrlQGuf+sA/tg4M4+D8YyxmSU6uhIHtdmGarcA3tZKHWtvgomqD8QH4nRNxSpDfpJqY2TYEJegHd3Dl9R8ZGfnnEmWyLAmASrXLmDQ/hF7hadwhAuQvxcjcpHul4I4I3Guir4j0PpxxFFD8ZCPJLtrJWa/v7So6qV4+TTjottqX5wNHk7/wzhnD7kKX9Cb5KOYwyiM4L7hjF3PCoudtaOizUx0YuVP1NeXeLkBgw0jzVInf1FS/1Ds/DuD4uFk/yJO3E93n9VpyP2BdroAQkcOPzFnpue73xCg9zh6XFG9BniqpQ1sgWOGb2DnqQD9wSYCJ1mfeTUitLhX7TYpR5MBraISRNZQMNySlDH/NBOIvanNbDFw72jLllPXKsTPmudZX5o60GR1RCPZOYOl+o/sH3aIYwg+lUMLH+vZDW2D1+D4xKKlrSm4UUVUVgtY4fgDtV2TO9E2KquG+Le2lgUV8G2RYJx16tnKaAbQruOSX4KbczQ6wx8EqBfqleHM5BbZjkj9tX29ykoRP8BWHVVO4jkufCPJyxzGPeKKCxXxL/d8gBWQ/nk8X5YWr9sJjmgKoHoXtT/m8k3j/JRi7Aj7btCQ+EfGN0arZLaF++9xFdeQqopuYbB2llrWtW5pmLfi3SBwG3lhGYtuwesWFWW35/nRdy7Eyd3SsLCnYzBJLWAt6g4H8Oq8sHI+2v612xYf8bhFktbjHeTEEhEE8HGiti4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?I3zKlB4XjPIMOkrK1edauHNAx1qYUmCboquis0SGf9w8ZGCvcdW5VIjev6?=
 =?iso-8859-1?Q?u+rroWGY9duBWZlFjLkChNFesUpyXsiO8Xmb92oxb5pLQ85TJ3JEFI85FL?=
 =?iso-8859-1?Q?h3vUpJR4QGXeWjuLtxw/9aXXxUOK9ynMtdldzbJMMdWsZG0ZUgmmNPSGFO?=
 =?iso-8859-1?Q?/goF4a0Auvm45d4CGR3bjVK7quz9Nh5YDUF4tiWDjUEn91ohudyawpANP8?=
 =?iso-8859-1?Q?V+Jnmdu9fhyiaM0W1BnFNjhItmtTKYwsjypmRQxD1chi1X3whmjtbcrVS+?=
 =?iso-8859-1?Q?g7JV7Qpes2H+La4J9et/pMTVkTk3nf+646OpSThCqoqodzD32ERv/zH0cG?=
 =?iso-8859-1?Q?7htdzw2DHEFL164Y2/ENt2isRm8U5aAMHncER4y1lV3eO6EvzDzqflPAXt?=
 =?iso-8859-1?Q?8g7TSGKUGqPthGQknc/tn+S87Xmnwo/g0jzSH2SanQvjr1HLSA9tjG4gqX?=
 =?iso-8859-1?Q?wtgqJOPzPmOa0vN3oxuj1nEDwAVh1ZrDrif6igSxJCuEZFAdFgJOg0BjTN?=
 =?iso-8859-1?Q?jIIH/T8RRelEHqn8rdvfwBoDRkjdNyQLwleCcquuat3Sf41/Zi3lS368GB?=
 =?iso-8859-1?Q?atid5odPjVEWPH4S96/KMCkZzAUJ0ITsqJtzS22tu8epDgrm8PMO+saZkn?=
 =?iso-8859-1?Q?fp3NeZkHtIPacIP5Aq9D51lIQFHyJnBVhi3lk9nF2mNnMubmUpQLFGTL1P?=
 =?iso-8859-1?Q?ojoUE2RrzR4N6jAuU3MSGFpLt82ATsumrvYBNher62KfHFwYWzJrBv0Luo?=
 =?iso-8859-1?Q?P8bXVePFUq9mB9ICjEAuTrhf3+NwJzuDhVW981SwgqFIXyWhAs5/UIgTJb?=
 =?iso-8859-1?Q?8RerTCoPV1A3uNoItMC7mO1PmyiAQAErPi4K28CWitSbEYGbABMAhNrKJ+?=
 =?iso-8859-1?Q?lprIvDHY8lNwy+iFGFVNXdTaq1ngD3UHCLIYe9u5+Xk0H05gkUJC7v758q?=
 =?iso-8859-1?Q?oFrmPVDLWkStJdTmrjAUzDKEnQhUM6fff/EI8aQN+SfjzaSMXinzsZzv0d?=
 =?iso-8859-1?Q?+l7wSkn9YvRI5LBYzOhOK0v+VVhoCCNUOlOsMHDrEBgihjfYD75O9wzbEK?=
 =?iso-8859-1?Q?LgO/VYZLAsn+7nhavlp81zt3liBYEPX3kl9yQ/UycZvDndmS6LO6iX2DGc?=
 =?iso-8859-1?Q?JrRs4jc/0DyAlsOupdmUk+qi7eYOXu1zdbALnMEhlLcCo0hKuQwFe/HdkS?=
 =?iso-8859-1?Q?JM9voTwJVGQS/2kHxz8lKKoa4PfnpTKNnSlx4AXx5rnA18roIN9pB1RVuW?=
 =?iso-8859-1?Q?v+RP0iuejXnT7erLkGLpTpPS3eYDN6/l1Wxh+2SbgGqZbOMoRZWTILEI7M?=
 =?iso-8859-1?Q?gsgWrrbC+rZuKtL3NDzQzscg3OlVIESt0ez8EtnPfo8VN8aEIs/+Uh0k0s?=
 =?iso-8859-1?Q?BMeo2Hthy5RvM16RxOg/5FAguGaheXjWztJ/HeNR5q3gk4XFQmu6y2gN3z?=
 =?iso-8859-1?Q?cfD3mwYR5oMJbopp7JgRqw44Dt/V20PiBKtuROJkWqDX9Y+V+oPaJne9Mn?=
 =?iso-8859-1?Q?dBl4NPx0Mw69EIyKNU4L88Z/GlaEuqdiqYC+zP2wtMjQamGtKu7JX0xAIG?=
 =?iso-8859-1?Q?ju/FhkTn2oKRHlTiDZMofpn/OazBi+wmJujKgS57R7yVAY3d97btas0RfT?=
 =?iso-8859-1?Q?jx+rGRddZ9tfKcF7JQ2bGM2qFZPtzsJnfc?=
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
	bRk23QWj0zHGln6jxZtFoY4EXAFvahOSJazJ4hyx9lPqfVoSskTPdM6QcYMsGxw6NC+xuxS1pdum2XBuAJQBk8gt6CvlLJ/EpCQyvJDfZjJaRuqWXKAtx0gKmjAJqVr1tlcukHUaDx4FSVDPBrw342LImQi+p2F8kAss0JH/wvmMx+HkLhBxdZuXFyL1cSspXR+ECrkGGqS0ESzNXesfR8y/Xg8rxyy+s5/eoLcRcVspeEI7LVeJ9XrhArbnDnRlcagutj6PMRxBoMtW92fgPJcClCoGJPPgUoyPKlpEEvPMbUzbefvtse6Atb/cKdEnxvFe4WSJSZ73ZxHraKhcNlJy7Vu6ClElu9PvVA+FcE04RZnQYqzZANOFdpFwaLhuhJxBgwvXRod3m3HqDHBuYoQUjbLGmgr6d1PsUsBANbauQr/bSYvDwLMsgFrCwEYZ+HcgkKqCAwXEkgtQtIs0dZLn+1Sin9JZDPEp8t4LkMSWVTvmO+uCPn1IXYCXrmum1FAPiBAf/McPOholdgz71NKAPPuiXY2KFge0ESJup7urz8n4wk6QAluoeYr+lW0cyd9Sfw+kfReZJxY4jbvi04ljYri0qV0XrZcVxPLATArYXKw31tXqdQ0Kp1MFgq04kMjRzzQOBVUwRUDt3G/eLQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd550634-7676-42d8-8b02-08dc5e6a86e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 23:11:20.2155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GfdWrQ8j3PiLC4n87ZR5LJMf/O3ofuTXASTctI6dVcvy2Du2FdsDpS5SeRAEcPlgDGtLpv8K0v+L9A1fdyiFmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6924
X-Proofpoint-ORIG-GUID: REbg3GkurUgNlZEsIKENdeRF6aAp_IMI
X-Proofpoint-GUID: REbg3GkurUgNlZEsIKENdeRF6aAp_IMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_18,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=970 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404160151

The dwc->maximum_speed is determined through the device capability and
designer's constraint through device tree binding. If none of them
applies, don't let the default coreConsultant setting in GUCTL1 to limit
the device operating speed.

Normally the default setting will not contradict the device capability
or device tree binding. This scenario was found through our internal
tests, not an actual bug in the wild.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 31684cdaaae3..637194af506f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1320,10 +1320,13 @@ static int dwc3_core_init(struct dwc3 *dwc)
 		if (dwc->parkmode_disable_hs_quirk)
 			reg |=3D DWC3_GUCTL1_PARKMODE_DISABLE_HS;
=20
-		if (DWC3_VER_IS_WITHIN(DWC3, 290A, ANY) &&
-		    (dwc->maximum_speed =3D=3D USB_SPEED_HIGH ||
-		     dwc->maximum_speed =3D=3D USB_SPEED_FULL))
-			reg |=3D DWC3_GUCTL1_DEV_FORCE_20_CLK_FOR_30_CLK;
+		if (DWC3_VER_IS_WITHIN(DWC3, 290A, ANY)) {
+			if (dwc->maximum_speed =3D=3D USB_SPEED_FULL ||
+			    dwc->maximum_speed =3D=3D USB_SPEED_HIGH)
+				reg |=3D DWC3_GUCTL1_DEV_FORCE_20_CLK_FOR_30_CLK;
+			else
+				reg &=3D ~DWC3_GUCTL1_DEV_FORCE_20_CLK_FOR_30_CLK;
+		}
=20
 		dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
 	}

base-commit: 3d122e6d27e417a9fa91181922743df26b2cd679
--=20
2.28.0

