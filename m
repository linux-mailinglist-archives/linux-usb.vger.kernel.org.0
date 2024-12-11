Return-Path: <linux-usb+bounces-18349-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B25359EC0DB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34E91163C30
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846D91DFF8;
	Wed, 11 Dec 2024 00:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SAFwC2TB";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="L+Ouhgx9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Y882D3Ai"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409671C683
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877221; cv=fail; b=ahF0au1hScxjcugCq8jSvXiT3RV/qND5cbepPn0tA+M8GGxMX1Z6w9lTJM3JlqVxW1klsk4dIjflEv2x/J+XW5WKMTphr2YvGiu9oRr50gNFv7Snao8eTfgdoIEL8z5DX3Ixozu0g455SSVxwxVyKs1DMjgEQyzA/zQ4HGKKSCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877221; c=relaxed/simple;
	bh=PuyhBbFwjB0sJmxNEgQITo4QkZTXcn7FaSQ7Hgy1TxQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=coiG7EHuNepi/ZXs8r6KhmU6ezF2kb1/FdAnOpp63NsGrabhzisbxLQ31JEmuxHqraDr2LV/S3k0Gbl+sBbKbKtKhwcm+3dqL/SMXuXv6etw5Hf3sS8i1DNq8wCmjRxYdBfx7FxKf0DQbr2ItP4gjtVsuXE5+24t9u4oD7xAx2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SAFwC2TB; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=L+Ouhgx9; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Y882D3Ai reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAMtPgV000581;
	Tue, 10 Dec 2024 16:33:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=aHURBgCdOxhTFPlNJ9N5wX/XJt7Lu8g/HA2e5EA3Klc=; b=SAFwC2TBQQmg
	CoO7mZdovOoNFUKM5Xm/2h2Qp9JhumGAaGc24eO6FNYyoYdHDA4aaCZBnsMMbWYb
	EUbtFaVNE/mXzZkDoIIMKKrnO0w4PnxyzcdlOr5B7N2WWaxDIAzIb1WfsmypLcMZ
	2a8pUozNaee6qh6Q44VGfIQ7YTZWH7T/IUi3EVQkIg+L7G2sruLAN95ih3gsTvlE
	GUXfqlsfj6809hkDddfh+PhlsQ2TPwBo0X01trQFWYARcKa/cG/qd0Za9hZElZQa
	NiM/JzvFmWs9dqKLnjRTTauNeMp+j/xuZ0Owqdfdm5z8u+Y3cGVp5iBrkNOhbOHM
	ixjNIimzfw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 43cnvka198-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877214; bh=PuyhBbFwjB0sJmxNEgQITo4QkZTXcn7FaSQ7Hgy1TxQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=L+Ouhgx9OwAmTPG8XN1YFRJsf7GwuGEshnDXawAGE4HJV9PaRbVX+qiNO3d71SsjD
	 7ZthBreeWI+iv/67BgdiuNoAYl79fLsmbYwKnB4bFpBYQ1HBRZPKw41TWus3sZHpzD
	 SWox7jGru600Z/81rCM1bubpELFUmBgkbpGM9fv1o8Ni1e+8oQc5+YbSgT5VAcA1No
	 dC8n4n2Y/j9g80YN4u76La5uE6Xa9Pv1lQgu7WOE9jJp4pvijowhmcHzzvZyp0VpDe
	 1niKh3KDsCkVEglCwDKFgzJQ9mXRq78FI91i3kmS7B1SnSef035sQiIR0cAly/5Uur
	 KuQbehjLL6Jdw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7D1BE405EC;
	Wed, 11 Dec 2024 00:33:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 60970A005E;
	Wed, 11 Dec 2024 00:33:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Y882D3Ai;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1ABCF405AD;
	Wed, 11 Dec 2024 00:33:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZW7OhDpx2L2zsL7BNxWOkZ1vSmsLPtLiYfwn7tWz4kfuoaB6s/DF0RNYzQMeFUkVUZcvvpX5enuJOcXDXSGlip8Ms6T5Rb4ltmpCm4lPoJNuMGYXOdW/v4LTJIDFBmfCJuhZ6lyqaHtbymyXThLpCO4xqYrPUQNBzzn/7qVNgbnmuGoJzCSJHrj8mVwzFSolPs7XPfAg35bLGy8vtxZ8lJhDjUH08dbczUXkob51BfcqVMNgkmeUHdUebmRPGvCzq4erwuEN8IWF0jtKB65a/fa6EYsFdLJCQnzUQC3U/N62zY+qlQmKEDHwabdb0IPFRNtk67gkjSMLuJIDFh1Afg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHURBgCdOxhTFPlNJ9N5wX/XJt7Lu8g/HA2e5EA3Klc=;
 b=fNsgd5BpFgatKzTXp9gFUsRwaWMtIvXSl3RFonjHi54JXig/NnOHJ43sJu34J8gUUhfQUC7U1HCIz1qr2m0QFoDkNdTTbOMvGNQlo49m8DmguyLmr1Hvquyn5fpMVUrVvX97KfDcyOSmmQO7IWQxYlPDtJ2Rnc0rk4zSaHiJqL/nEhSsg5FzIyqBaJgUuWstxYhe7cpAYYUsW2jlEhsVnDhIPVXrHUU4ZoV5xCN56ThU7FhG/Uo6f0tEmjEHIHsQCAH4F0WT2JHXw/HpLXWuwW+MweaDU2MzOxlM+U+RygoUXrzKp0vICuJ0JxmQY7hu03DcZpBUWKSafGBsGwF+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHURBgCdOxhTFPlNJ9N5wX/XJt7Lu8g/HA2e5EA3Klc=;
 b=Y882D3AiSMUyNArGS5Qaeq1SpK6U0kZJUj4MR0wyVA2kLbnYSO4/jzny97NR1HwyCRnN9j5Xf9XkZNwaMKrtIWx2Fp6cCYVUrHMAqcSsJZkAwjVrVEvMOJrSmBNd9rgVYdjgeCuy9on9+CT1whLhuAJvOINnUds0s18IQZD0LMs=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:33:31 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:33:31 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 20/28] usb: gadget: f_tcm: Stop proceeding further on
 -ESHUTDOWN
Thread-Topic: [PATCH v3 20/28] usb: gadget: f_tcm: Stop proceeding further on
 -ESHUTDOWN
Thread-Index: AQHbS2ROWD2GU/49i0mc5sRQS4rGvA==
Date: Wed, 11 Dec 2024 00:33:31 +0000
Message-ID:
 <b14410cce6bc7b8a0b43da23a8e0cf1ed1fa8ab6.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 46314ebe-51c8-4d4f-276a-08dd197b7098
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?cLd5Ttx7eXBQYTSgEQPmP8ogBaX8LEWNDAfA0eryZYGFjWV2yp7I3RbXcH?=
 =?iso-8859-1?Q?WB9it+FyaD8McTn3vMGG66cEHOCSyX6gyYK21+aE9lPhDCCHoLFvqO5yWU?=
 =?iso-8859-1?Q?8f4V3CrTadAybfN793aVHOc9Y5fBM05JtHPBOQ7LHx+0wiFcrhMAcbLjsu?=
 =?iso-8859-1?Q?LCuFx7dFpOjdRXdjvmQMoTnd4bRzKr/fKRd3SgNKJxusravxnqHktLzINt?=
 =?iso-8859-1?Q?2HFirnHMI8rkWBFqhHhNbRXk7knKYhVLHoaGksveqATQRXoULelRbn+ceW?=
 =?iso-8859-1?Q?DoEN+5dpsky+dE6a2Gso/gr9VqGfzZfE9zkbX2AJhAKg0ulYudfm48Q5ii?=
 =?iso-8859-1?Q?iJ6cQURfLPCdeDZJrkSe5fXo/94RJMa5xlhHH76y4RuOFhSLkxy+qefmFZ?=
 =?iso-8859-1?Q?WGlyQ66i9UMiCzUp7+xE5aDbvJ1jWu+NRtebVg5WhOhi7r4R7UgTl9Nqmm?=
 =?iso-8859-1?Q?dBtmgmvrUr3iIkfebO7gozqdpOm/qX/FEhiWv9qUS3tKqjPbDsPNM57T/+?=
 =?iso-8859-1?Q?uc4jDzGmm9fvcKWZwS/zXmTKQtTQC7ykURLnNbWpALYe/2oqESSFQRP7da?=
 =?iso-8859-1?Q?t/k/jfIHxzOAQfGtKA/2iM+vMZARPFjfRaEir3Zst0/vzIuZTwO4t/tlsx?=
 =?iso-8859-1?Q?dlZYP0Lg9MctDGE0LPiX5vgQNKyDgt9Cj5glregxZ7v4iGt6W13GI0PDAh?=
 =?iso-8859-1?Q?Ig0Rw2aXpZWW4RXXyfxY0j0P4Lvjinu0bDBgQ75a1oUfFiDkF9ghjG1ykZ?=
 =?iso-8859-1?Q?d/KGUuEgxNUhaAWX/35+d2PywGISGH8bIbiOycevDaNvpjaC4z5JDj/dsD?=
 =?iso-8859-1?Q?tK/V/SM9TMmsGixM2sgF2W7Nb2SXtJWwempi5qkDRiCtDj/vcw0+7wO/dD?=
 =?iso-8859-1?Q?P/cRW0SFfPmkcrBDpop0zublxBcIZG41SHM3TiXGuzRiP9ZGg+xUQhj49E?=
 =?iso-8859-1?Q?6l9b0NhVkXkGxAroAXCfZTZkmEQJfVvDJq1/tzdFV48YbFcHENqS8arU9b?=
 =?iso-8859-1?Q?03kItfVPeolenFe4CYRVHbg+vk0+ZtepZLRf0C62IiQZtCczHB3Lfqq21Y?=
 =?iso-8859-1?Q?OBzg6YJAkmJlR8QT6/AmJpexwXzWy2WArKniVh21Jjv8f50/Vx8DCvBC9p?=
 =?iso-8859-1?Q?8REscer6SaZkeliPS93qq4aaBiapk0ka8+uejuEz4bnnvIlljfx8alxmkY?=
 =?iso-8859-1?Q?Jhl4Q9MfpqzKJttGT3IT2rcYo3UZWT8tBiGgX8fQS1pwaRZVHGAfekIVzR?=
 =?iso-8859-1?Q?DavgwZ3J5C7+ENNzGQpsqk7FFuigbomqK4Ij9kS3MyTqbzjuzRM6QNG9dO?=
 =?iso-8859-1?Q?USmMXxoCj2Ztz1CnsXuhraV+M5CfpNl0VBVnnbOh78+oNUCChU5CUYiRqf?=
 =?iso-8859-1?Q?QqfAGTkbHwSss6xMRzMAGX1fPbf9UpkFbOYEvUMKqH1+oiymxp76EWH5So?=
 =?iso-8859-1?Q?8sF7qh7yI3HSQAZuOGOhCceTuMw0rdHdcnEzNw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Hv1WYU6R6uhvMDFvJ5l+xEmmidDdxOuSD/aCYr1roo4uM+T1iNQaAZiokJ?=
 =?iso-8859-1?Q?iTU5FMy9JNeyH+Dg8yHfvOkrhbcvbCJNUvx+rm6YI160pTJI0l1VALYwK4?=
 =?iso-8859-1?Q?QVS+gFtC9k6Qma6YF28gTum8s3aHs12yaUn8fx5dWhovo3wiAzi/ydT8Ko?=
 =?iso-8859-1?Q?P9jt2eAWjHAtqkOp+AVVyF3Hy+YO6lhiyKpCnF8ZCHERC+jFEDhVVZxYPu?=
 =?iso-8859-1?Q?FBs5L22yW2iCyH0Kj8NkKgk4YRYmRoQbINlRiE1ewO74h8EZv6iSsUw6FJ?=
 =?iso-8859-1?Q?9R4gTEjN/OsjkDqdp72V7zQjHmg2BjAm0y8E5wNhGiB/Lyaa9e5VYSIrR6?=
 =?iso-8859-1?Q?1WWY1PXulL7HW6XWznSxyK4fYma4zr84/9PB956nZIG0RKloHA0tgl/B7/?=
 =?iso-8859-1?Q?KuDS/ieiamTZGtskIeZk9bOgMW3QOvTiLUzB9AC7YCIzSfixFRgiZrS+42?=
 =?iso-8859-1?Q?7jGw8hxFFkv5UrXieTKWIM9015K8kBZ6LueJzMr0/RJg3uJsJQl6H0GMvv?=
 =?iso-8859-1?Q?l0t3RNwd/5Ia6vC/CNoY+WKKh0lcx/+HCIyM3E2ZDOTfTJNraVwRIFE/Aq?=
 =?iso-8859-1?Q?og3zOk6oEghypnKz4J6C2zzv/xZJjfHcBXTS09FPpGhSGPxZJpQk+XkzGm?=
 =?iso-8859-1?Q?RQFsQT4D8ZcbjZnzwbRfe0HKPxuoIEG/ZL13A6vOnwi6WhSiebG0nH0XEJ?=
 =?iso-8859-1?Q?/GkdsNvht1q31JYYoltsbrYzrg+yE9IG2pylY+c/lOoM4asGgn1BU1uUs2?=
 =?iso-8859-1?Q?kolI4Pb0qeYCvMNanx8PFLM0nh9Tae75uwUeV4xtDQohOJervsHbSM3d/Q?=
 =?iso-8859-1?Q?5zBdEQdPd7MHeCOVa8vREoILmjs0Tqab8ueHId+UTqkGqEuSwsPI7eEIhu?=
 =?iso-8859-1?Q?xWvfD0hp8licB/SZ1OOyf6AYBSbNHCAT8QmZ/uGIVnHLuahO7kLqPfMGof?=
 =?iso-8859-1?Q?5AZg8op+Puc2urskwIjx8M8TCLwSRMVNtRi/z1D9YeYJKhSTjh8/NI3B3t?=
 =?iso-8859-1?Q?k5DogaBSK/Pbp+GKzE2+PlxI5LVFwCwFLUu8QWnVunnxLmLS3unqW08lP9?=
 =?iso-8859-1?Q?tNecl6/D8Db3Em92IQgE04g1z28SkhOjJEDmpsoWs4LJBSbnZy+Ykyavd1?=
 =?iso-8859-1?Q?+9vyhOEcXQEbHceOw4paTsa1/JTsNW/nPHUpSpbmNZE65TaBC1vu4jB9Lf?=
 =?iso-8859-1?Q?dah/bEvNGiTwYXxftxHnu7vsPgkr2TWXzHQaw9WYDKR5YEc2bwFU4DPmSd?=
 =?iso-8859-1?Q?2THZTizRBeTIfNxDXQVFL7u+UYdcj1AEa9FFX0RBR/OMvQY1xUYycoNt0W?=
 =?iso-8859-1?Q?gnrzfNhm3ye6G2LOPbP548iv+C0Jc6PezL/wNWqLXV9uNbdjCT5amuU2/c?=
 =?iso-8859-1?Q?PMzQzTEkKSfyWxZ2W45d9zw9F2Ct/ST24xr/TgmRt83Aw9RSCMwBs7V9rr?=
 =?iso-8859-1?Q?toN9jHkU35dYFYAj+ipn+2fYPGmCdb+AXeDIDL+VSCF26BcXbi3R3E8URo?=
 =?iso-8859-1?Q?7dsMTTIyk0CdbnMZWgflV5IxaXVB0Ia5dmQvjn75lluK9KiwUy/sG32U/C?=
 =?iso-8859-1?Q?yHqkMJ1R4NOiv8gnH9d0zPJZdixuDnVOMXHDwaH/f+xNeF5vA1dBQ05LKq?=
 =?iso-8859-1?Q?HXD36I65+MI1Mvy6MaSGJPL/dBSovZW3v3kDoJM333yUqrq42k7KWP5w?=
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
	EzK/TtGD8ehAMU27RhNoGif7TGHSoVil4CO6KbQRdo4Jy39WJYYS3lcZzTBWCQN4xp0wCEXaW36QsbovOk8hFiWhkMNGZfspC/TQT/dZMnFaRr/pDQik+jpjN2xjc21nNJuB6IPf34fZ0ay23IdTjKYUiqqZ7Wb6mUXCj10mkoVkj/n+SU2rNwg452im9zsa7JoavWzyY4wJbPwma5+crqJgF/pdNWTY+OXaCO1W6L6LssW0M0+4HFYgw/hWQzLuISVRqrJmZokjkJtecaoV4Gui87S3m+J10PB5/suWD21PZ6qTuntWsIzl7M1PTFep+Ver3M6eQ0Q6SiDBqf4jLj7nD/cO20D4Az/9Ji+DRq6eY+mkKUSIV555LoWbHOBIRy1BnysLUIMu9ZFwHvOwTzdPbe9WzE+2ihXnJ+EhFaPUdY53dGSsowsxlrj/ObQvBaUBYV+tSOa8l7PTmYVxJTc+ud81ZfxVVNl9rNLUmGJpgC++tBuc2cgWRZbdzo81yBCer/lh8eWcZmgsyESyeSIPjM3hcPLTz3GfUqDxwdwA4i63mt75yc50HGqnihWrERVBt93reCRimG8VwuOHizeNfN0Mc6DMLiI1o5TEhPp8jBxdXe+xg3htUHvTnCWiLb1BLYLt5ToA3m3wZjk51g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46314ebe-51c8-4d4f-276a-08dd197b7098
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:33:31.6665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xDw+wM7uUcqwC2qvE9XbjXZ+wLb4rMFyV4trkZejy2+ZpI11HlnpnPrbhGFETEU+q86ueUcsVJ34dTrnvii+1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=fNPD3Yae c=1 sm=1 tr=0 ts=6758dddf cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=CU69Gs6ASZi2hjXg0JQA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: 2AbITtMbTSsUn_y8BBVX6Dx9S00nW0oF
X-Proofpoint-GUID: 2AbITtMbTSsUn_y8BBVX6Dx9S00nW0oF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

If the error code is -ESHUTDOWN, stop processing the request/command
further and prepare for teardown. -ESHUTDOWN is for device reset or
disconnection.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index 8a5aa58e166e..6aa341c1472a 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -62,10 +62,11 @@ static void bot_status_complete(struct usb_ep *ep, stru=
ct usb_request *req)
 	struct f_uas *fu =3D cmd->fu;
=20
 	transport_generic_free_cmd(&cmd->se_cmd, 0);
-	if (req->status < 0) {
-		pr_err("ERR %s(%d)\n", __func__, __LINE__);
+	if (req->status =3D=3D -ESHUTDOWN)
 		return;
-	}
+
+	if (req->status < 0)
+		pr_err("ERR %s(%d)\n", __func__, __LINE__);
=20
 	/* CSW completed, wait for next CBW */
 	bot_enqueue_cmd_cbw(fu);
@@ -276,6 +277,9 @@ static void bot_cmd_complete(struct usb_ep *ep, struct =
usb_request *req)
 	struct f_uas *fu =3D req->context;
 	int ret;
=20
+	if (req->status =3D=3D -ESHUTDOWN)
+		return;
+
 	fu->flags &=3D ~USBG_BOT_CMD_PEND;
=20
 	if (req->status < 0)
--=20
2.28.0

