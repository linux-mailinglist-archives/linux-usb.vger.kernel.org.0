Return-Path: <linux-usb+bounces-18341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6059EC0CF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69DAE18861DD
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEEC23BE;
	Wed, 11 Dec 2024 00:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ujIZCTW+";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QHrslhrC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UzQBCcWv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51DBE573
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877174; cv=fail; b=eetrSW/wxyUnP3F0kiCtYV3wIs70NGt84FRAvDiVAiYPUJQrGHfWnL1jRXzonKqLyIKCJef7iwK1usll1MiAiGfFqcn5vmNv+df3Et7q7sqe8xzSfZOGtVW+csRPHuz47w/PU3GGTfzwmphazYI5Ld7pyp1Xy9PllRlHGCsSiV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877174; c=relaxed/simple;
	bh=s+Y1wqh4PMvPM77pGrBUQc5l04AS9w+OIbxssKROCmU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jBrgbx7WhskdYILrgcgwXs37H4AB5GiEgbil/FdwDTvXm6/lUKGgXIEtIiIQZtoiMP0znJ+sHm04aEE5Ng+i8cSldf3jrx5RqNXnPIHLyL0LZebTk8hMjq+FmXdruEjbsTMShCpXFefIcT1YhhPr4WyVzxOktr73tWfNjRT5Dmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ujIZCTW+; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QHrslhrC; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UzQBCcWv reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAM3qEJ017428;
	Tue, 10 Dec 2024 16:32:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=/vUPAoV4Z+6LjBwFiK0/lfi8/ExrWD54nkRrG+y0MMo=; b=ujIZCTW+u6nQ
	UDKxewSmLdjdRInDo0Sq0fZIh9pPMjM5/L8uCkRiaYIMV2TwVtScoTJCVeaL3RdT
	HsnECbXH33EZpPzsTFnrgbE29/e8jBnPihzBQY6OIntXXgItcfaLmynpSxCPw1vq
	FCJEx831ECG4WxsnOGbyuUnA30X8HCvDXxl7T7+gY+EOr6rGGhsL/d6ijuUM5PfQ
	82J7a7G6pVVqvXX6K0G4rxClFBU+mgibwuv597iIoMuQcHtTGA23Ss3Z4pWUyRdK
	FtpaPFDhcd4ljs+zBwcVyZ08z+KykilXfObuvh8bW1/VxOk7YBZEzNl6NMe9UzCi
	LJTRBUTnEA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cp60t116-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877167; bh=s+Y1wqh4PMvPM77pGrBUQc5l04AS9w+OIbxssKROCmU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QHrslhrCxkIVcNaT/L5rFT1J296YwuIkzPiCq+AWJaYwa6BiVRVo23yoJqDgx315l
	 0HI5X0XV+wmXv0oZP45A2yHsDUsrK7/snJQxrrvtb78R3Y52ZMO1nY5lgtekEQAGAK
	 zB/5UlztVHiBVle8hmvWoxYDY3HpaKFK5f1ovpH5tV+8eRmwFJxVjB4f1cJKHXsfMM
	 11XJr5XbEylnqo7eOgcLu9dwm36IuhkxFYbTDe9hG4bcjEryJxjvVbixtBJ91kcrzV
	 JyXKMSBf2Z4rFrYGtof2OpZEBvzSWyEFfAzgkzaZlhTqy3bzAgX+T8hbA1oTQuUSPQ
	 QON0ZIXKtzzRg==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 59E0540126;
	Wed, 11 Dec 2024 00:32:47 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 20B0AA0082;
	Wed, 11 Dec 2024 00:32:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=UzQBCcWv;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id B4BD34041D;
	Wed, 11 Dec 2024 00:32:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKMQCFX7Lhf5dakIJ4ZQzp/80q+/dI9Jjvl5309zgDCrpzp4HFY2sNP36EjXK0vJoWQVpxTTvFzqdhU23t/hIlKV4aNskYorWX31DOvP8eTWn6QkhKmBEm1kIUmrbgAp22ylttZIH60CF7Ax6ORmAFV0Bfy+JMmTvwzQEXk9dTy5Aybf6qRaNVUY1t/fWLl7JLMj3mmwcKuJoCSgkt6EJ/vPmzxxuhhImBI9PRDFKeAjibPQxc7zSYEK4iceeNBqRpK3GP8X/wpnryX5wpOqUKrAOXqD1y7CaIl0enbNW9cJ1B6Q2sVpyS+ZI9wP5rc9rjBqWVprBXZQgKaW8rI8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vUPAoV4Z+6LjBwFiK0/lfi8/ExrWD54nkRrG+y0MMo=;
 b=d0HcNIXRPlwZYsj+YDM6XYQrBmzT3CmeZSGMFjTjdnibPM1CdkUb55ge6pCjai4SJR+5ZTx/OOeb2saim8zKOPVqfeqLgIe8jbGPLL/DFrPhE25QDuRrz2MVRSsYMvh6OhpBowjK+KkhKSUwTM3m+7+onWur1wEU6zVzmYRGdgvzWz8lJAStZQ97m8w97T9hdtHXDiN+i+PeV38rO1PPX+X2thQKksbGUdGLNuUt5VjmaSR3ITpKHaz+R/YVX+cAu8Cx55tUucEODZ5swuROipVuxDo3l7XqpBL8k3813uyr7fAIEnEWTSIebh+lOWU/8xYUTwLqeZIYA+oY7cj2yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vUPAoV4Z+6LjBwFiK0/lfi8/ExrWD54nkRrG+y0MMo=;
 b=UzQBCcWvjQ41/dxqw54IwfPIsZ48PGYXW5aUHCLNhqxAk2MDAkvudCikWpCdtvxA0kIPTJgIguFNuGRQQvJ1hNJWCwl16rcOh2euwSXYdOsSq3lXnGDPy6MOQsBE8AI9v5JhTIk8w2k/MsyxWjDIpjvjmwb2Zhb0IJokFzeQARk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:32:43 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:32:43 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 12/28] usb: gadget: f_tcm: Allocate matching number of
 commands to streams
Thread-Topic: [PATCH v3 12/28] usb: gadget: f_tcm: Allocate matching number of
 commands to streams
Thread-Index: AQHbS2QxFqD4F+Za4USHnh777XmgSA==
Date: Wed, 11 Dec 2024 00:32:43 +0000
Message-ID:
 <2d806120dcc10c88fef21865b7bc1d2b6604fe42.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 218d645d-814b-4e4b-5c9d-08dd197b53ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Pj7b5fxNzIcvnXxEqykAxjTtX5NM5x1ysDXVF6RmXCrq4uWzhhVWwXnD4S?=
 =?iso-8859-1?Q?RnGcUXgJq8OaUPPg1vdLXvsVWlgG/U92iHwPYB2Xn9APYLSJaifDO4dAk7?=
 =?iso-8859-1?Q?F6YY8W7aBGYLdLH1/bDGDB4GJwmbKyTi8ryhR3evNZfdThQfo+LwljxTu3?=
 =?iso-8859-1?Q?x2/HOq8fL+JYjEF6DLVFQ2Mx4INXByaszp7ga9d+qsXkrKpFzwEwovnRvK?=
 =?iso-8859-1?Q?x7oq2oy/H6qsYgJmEeL2ZdvtYTk6aVZSwd2wnFhTHfVU2dlLbnFhBWZpL8?=
 =?iso-8859-1?Q?QeM0hzQbj5f8aws7jWqXx8HDmMTlSWdqkiYPxen/4tq9gUqXYchVeGLWu6?=
 =?iso-8859-1?Q?yxefhJeBOLLjHyjxQraCHJI3x0ToD4oGtGJG6yOY1soiCv2AvvaODQi7DQ?=
 =?iso-8859-1?Q?GYRi5TLRlWlsCIpQJveKbknfwtXLQRd1CjqSGRJWFMKiPJP96HsKsk8QTn?=
 =?iso-8859-1?Q?Ic44nconnxaU/G+ZfuMDqza0eC57eM290z/J20r1TuhtPeignCFCLXpb7N?=
 =?iso-8859-1?Q?R2bs0mNN2REltDJjv4VdblA+4oPvtVcFNsgW8QJWXq7HL+UZLI8IYTvXdx?=
 =?iso-8859-1?Q?FvCFN94VGPzicrCTjAVVLhgis+o9KXZ8jiQdI07gFCTIv5m3/THoi+TDcm?=
 =?iso-8859-1?Q?SJvjrW/d7N818tO54MH6iT2fGTI2ZFYwpv4AeswosylB8Cr3kpLKvLjzjI?=
 =?iso-8859-1?Q?QwZzSI4+QfW+UsKM3MQ6iH1tdr0yrLn+lYGVjLAKSZOVVnfgk7D3kckcg9?=
 =?iso-8859-1?Q?Vgu1Rbs+hW8v+z9JNZLeVfKHxaQ/6nNFJ6ZxkPCwLnoiAFsoDx9+osZi2n?=
 =?iso-8859-1?Q?Trfv7Au3+FRD0ngtAfzPAEHXh+Q3VHYx3DHS9ZDacs6PVpl1y2kiJd+isk?=
 =?iso-8859-1?Q?iQ7jel8H/VguTI+a+GIqxFabCPP3+YCZ9P7m8JeFMO1mKhZO07SSzI36Sh?=
 =?iso-8859-1?Q?jz16egYAbeaFptTT9Y+w2sf0jRMN81MqBdJL3Gg2Xo3r1k3xzaL8hv2yHP?=
 =?iso-8859-1?Q?cAxRIpzb2Vh7m3mYZxlvcjLtbYBcdqhj27nOKsq1cQuC80+ik0x1YJbwQi?=
 =?iso-8859-1?Q?lfzflJoxhrrH3rdn6uXIcEp7X9f5JLF/E2hcUsH9cg7igY3a5ATUrcj7p8?=
 =?iso-8859-1?Q?E4KgyJz8JrJHldF5NXBsJ3+pzc7tiDpECOZAzxrERRHZ3E2lysmNwa+2z+?=
 =?iso-8859-1?Q?B+9AK3mEwrmdodcagKBtuV6K8lzT5FIpJQmVYTwjl9N3jZ8NXzKhhyP7/4?=
 =?iso-8859-1?Q?o0fTUqzwnlAKa9jmspPAhUs/8xdVz5A/qSCi9UUx80Xq7OooqJROQp2psy?=
 =?iso-8859-1?Q?lwL7TNKXt/aRne1Zo0SFHx+8pJF2UY0xMRzm22fTGOwZ/oLw6g4sGFXNP1?=
 =?iso-8859-1?Q?lOhYx7+l7PY2ZZm7GWsxDei9J+3zPLcjvZgmiInFU2FG3bQRv6IexQTEy+?=
 =?iso-8859-1?Q?gmXnxF6PisHiYxY80DVZRMMqTm/lCtKvAPMkNA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6FYSCP9JTmp7X1e7qsEd8rLxga7QSBXRAaBM86cid4MzT3wcXbVBC0Osry?=
 =?iso-8859-1?Q?tDRToefRKiCraECMwoQ7q5jESatwjEQEdIh2ci95rsflx7dp9NohaQrmWg?=
 =?iso-8859-1?Q?BxWAXgQpTK30ZJrgc4/KLGT0erUl/nbP0fSP9RgzzolxbV6TYCS/5CUizK?=
 =?iso-8859-1?Q?uK+Dtne84YyygmLJmvrgacKnzv4xkuFIef0ZuAeZJtBrgehZNYrbYaXu2h?=
 =?iso-8859-1?Q?OKHDf1b5oU/ovwV2XH36JfPVR1e5Qaoovnozq6Phx7fGGhqIfDZFZ8/6x2?=
 =?iso-8859-1?Q?glXz4g1gABkeU3HwS3R6so1eDsA1UxfrtyMwQDPYIJqE1OgH4yjDNq/mAX?=
 =?iso-8859-1?Q?+dyVjdzUTnnPI1V3a3GyfQinbD1SBCsV61iFEjSVbMyBMKRgbYMRZ67TjA?=
 =?iso-8859-1?Q?v/niooupSUsoMjHBkCGMMxmNavD/54zfve5F34LC9DIvmRGWCrmffHCZUR?=
 =?iso-8859-1?Q?gV6WpiVNGz2DkBwVMF5cMpu1KlEDKmBUl8zGV1ttu1n/bribYiPJXq5phm?=
 =?iso-8859-1?Q?7+KLhzPVAoheQxwlXlT1pHQmxWhRXNtxvQiUC9c0szCdZx6UrCi/8Y8VB2?=
 =?iso-8859-1?Q?kLycJb7+LRnq3T2W6sbclsXBG8CktnxYdS5jqBnilMND1WecSsZxlezD6k?=
 =?iso-8859-1?Q?l0cPtG1kKNGCSqHGF5+Np3JqxcbVXFHQW8qAHSvVxVFI/hhOHHSgsHje+b?=
 =?iso-8859-1?Q?h06Dymui7Ax0x7uaA9Uyt3K//dHDFG3EFWKKCt45Py4NUNuQ9Y/lJZ5WSz?=
 =?iso-8859-1?Q?JeSu1JtswNL0ILckEsqWQoFMnQZnVSUk40SCXh3uYay1A/ln7bil7Yql6O?=
 =?iso-8859-1?Q?nc+AV6lDUy90lPuaHzc+tHUNqYG2O1tj0l0RVmeUuwvY0yynvxPloK/tq3?=
 =?iso-8859-1?Q?ZqBHzYDwCy6+mhqdrPtWIHpI1hAFhi2pPMwTyMjAv3OlQzYj7EgnJZ4H88?=
 =?iso-8859-1?Q?USIax439ZfMy+sEA+H+vgmXAVnr/RXdXyns0/6PGsKr/g8Y7cGaxxTykJM?=
 =?iso-8859-1?Q?1dH9SG7AGMmCfwyJVyNAXWQzX3D81aK4LsGM4yhKqtt0JaGRmuJPpRiSpg?=
 =?iso-8859-1?Q?ggTdfMio8ZYaTKx7I2HpslrG/XkWYxLFXRkdlncrgKo3NXrmCSplHVxeU0?=
 =?iso-8859-1?Q?sMkmOnMtACGw0MFKxq+Lb2+S10RjPdqqanKp2z0XGNzeVk2F+o3TPu89/r?=
 =?iso-8859-1?Q?nM7zJhL/kfRjcC7DhmIi1B0kXqo2OXN9RTpgrKzjgoelsaUi/Vk5qkZ3Fc?=
 =?iso-8859-1?Q?agHC9C2LURP0xjwclcGZmBQBtRXJg6zXWBsQZC3/UDulRtLh1OyRYzzOp6?=
 =?iso-8859-1?Q?FasxCyzoqIKso4gjRRmk2OUJ9RW5qRl1Uis3hkHD0uC8hd3EEy3ubm2UnS?=
 =?iso-8859-1?Q?WtorvARNMuaY8ThtiOB4jONaunP5RodeaHWipioNkUnWJxajUGoxlIW+zm?=
 =?iso-8859-1?Q?0KjJu33Tb3aSmLGM2rEO+Q6BT5B4QyGkfZCfXfw6zLvT6ZvmbG0L/Bjobb?=
 =?iso-8859-1?Q?UXGvsR0NkuZeRaoBQN0dXVxORgWyyGf8xckeh9y+Mfby8kau+hc7j5BMAE?=
 =?iso-8859-1?Q?eZyRhF5m4y0R/sDdi3aMv5fyU8J8QCnLhOumimDPwpBKYuXTU+0cXyPT5S?=
 =?iso-8859-1?Q?Belvx/sQI9IYi+MvVuPNG9LgKLpr5KwXkaMQjrLsUJTnXc8XpV6OsZYw?=
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
	PWdeFQ/aDG3R9duIx55NLYHFOkF5M+nAX93sR+m+vCsr/9n3i2EBOKevktDWATH9Z9lDU7Ryx9Tls20QFF8DK/3XwaADeXczDAzoDzSjIUb3yxKLkxPn3Ik7i9vU0xRecgDP3q6WhMHToi3KmKvNZkaCw6Zrbtt9VIQj/spNDnysDghlA+qozY+e6vjlxer9HbYreu/cqhqllP5gpfpY/NmSaneZKwgBUMVzHvRKQ5+7p8kq7hz9y5ZV0WbF+E6bIZMM/VCk6LzUbODdL8XIoxE138O3dKF2o/5ltprsp1lJUiSYqGJmlUgNu1qm+tGVEDtMP04cE0gMtU+YNcgtYRnZ64x+jh7HBeu68ZJbI8o9kqIPfypc7Qj2wJrzHtfyHANq7JzU5WWPDD7iIdDQFNv+AVMYLROCN+pvm1DSvTX7Ivrk/pwaXTxk6XqidfxVPhxOJNkC24pS9C2aL2BXIRNGVKDi2F681cwdaiGY650XGoWJKhqIEX72nTelXZESSMRM5n+dwSG8ThawH45xRwS1V1mNfTeZi7EjGy2kzfXAF10a1uakvA9VoGikDLS3Iaqe1isxCe3x88Xi4knjAYS1PVawk0SI6mpCgYldEHIGq/kPrCts3/vCA0VpNhOR9eJl0sCm7nh/YKzOsqpMxQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218d645d-814b-4e4b-5c9d-08dd197b53ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:32:43.4129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NNByvbLIVWACrCE9CZdt33zvll7ss07CEgka8s+fvMy22aMKNbpUAgAISjk1v3IiflySamUjxSGiVpxHgeGl5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=Z9YWHGRA c=1 sm=1 tr=0 ts=6758ddb0 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=TH2HjKJD5bRpUVrW1iQA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: 7zAkdcjPjJ2HbHXkHpn1--I4O96J-JY6
X-Proofpoint-GUID: 7zAkdcjPjJ2HbHXkHpn1--I4O96J-JY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

We can handle multiple commands concurently. Each command services a
stream id. At the moment, the driver will handle 32 outstanding streams,
which is equivalent to 32 commands. Make sure to allocate a matching
number of commands to the number of streams.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 107 ++++++++++++++--------------
 drivers/usb/gadget/function/tcm.h   |  10 ++-
 2 files changed, 61 insertions(+), 56 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index a594ed1359fc..a3e886294c40 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -50,7 +50,7 @@ static int bot_enqueue_cmd_cbw(struct f_uas *fu)
 	if (fu->flags & USBG_BOT_CMD_PEND)
 		return 0;
=20
-	ret =3D usb_ep_queue(fu->ep_out, fu->cmd.req, GFP_ATOMIC);
+	ret =3D usb_ep_queue(fu->ep_out, fu->cmd[0].req, GFP_ATOMIC);
 	if (!ret)
 		fu->flags |=3D USBG_BOT_CMD_PEND;
 	return ret;
@@ -136,7 +136,7 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 		}
 		req->complete =3D bot_err_compl;
 		req->context =3D cmd;
-		req->buf =3D fu->cmd.buf;
+		req->buf =3D fu->cmd[0].buf;
 		usb_ep_queue(ep, req, GFP_KERNEL);
 	} else {
 		bot_enqueue_sense_code(fu, cmd);
@@ -297,8 +297,8 @@ static int bot_prepare_reqs(struct f_uas *fu)
 	if (!fu->bot_req_out)
 		goto err_out;
=20
-	fu->cmd.req =3D usb_ep_alloc_request(fu->ep_out, GFP_KERNEL);
-	if (!fu->cmd.req)
+	fu->cmd[0].req =3D usb_ep_alloc_request(fu->ep_out, GFP_KERNEL);
+	if (!fu->cmd[0].req)
 		goto err_cmd;
=20
 	fu->bot_status.req =3D usb_ep_alloc_request(fu->ep_in, GFP_KERNEL);
@@ -310,27 +310,27 @@ static int bot_prepare_reqs(struct f_uas *fu)
 	fu->bot_status.req->complete =3D bot_status_complete;
 	fu->bot_status.csw.Signature =3D cpu_to_le32(US_BULK_CS_SIGN);
=20
-	fu->cmd.buf =3D kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
-	if (!fu->cmd.buf)
+	fu->cmd[0].buf =3D kmalloc(fu->ep_out->maxpacket, GFP_KERNEL);
+	if (!fu->cmd[0].buf)
 		goto err_buf;
=20
-	fu->cmd.req->complete =3D bot_cmd_complete;
-	fu->cmd.req->buf =3D fu->cmd.buf;
-	fu->cmd.req->length =3D fu->ep_out->maxpacket;
-	fu->cmd.req->context =3D fu;
+	fu->cmd[0].req->complete =3D bot_cmd_complete;
+	fu->cmd[0].req->buf =3D fu->cmd[0].buf;
+	fu->cmd[0].req->length =3D fu->ep_out->maxpacket;
+	fu->cmd[0].req->context =3D fu;
=20
 	ret =3D bot_enqueue_cmd_cbw(fu);
 	if (ret)
 		goto err_queue;
 	return 0;
 err_queue:
-	kfree(fu->cmd.buf);
-	fu->cmd.buf =3D NULL;
+	kfree(fu->cmd[0].buf);
+	fu->cmd[0].buf =3D NULL;
 err_buf:
 	usb_ep_free_request(fu->ep_in, fu->bot_status.req);
 err_sts:
-	usb_ep_free_request(fu->ep_out, fu->cmd.req);
-	fu->cmd.req =3D NULL;
+	usb_ep_free_request(fu->ep_out, fu->cmd[0].req);
+	fu->cmd[0].req =3D NULL;
 err_cmd:
 	usb_ep_free_request(fu->ep_out, fu->bot_req_out);
 	fu->bot_req_out =3D NULL;
@@ -355,16 +355,16 @@ static void bot_cleanup_old_alt(struct f_uas *fu)
=20
 	usb_ep_free_request(fu->ep_in, fu->bot_req_in);
 	usb_ep_free_request(fu->ep_out, fu->bot_req_out);
-	usb_ep_free_request(fu->ep_out, fu->cmd.req);
+	usb_ep_free_request(fu->ep_out, fu->cmd[0].req);
 	usb_ep_free_request(fu->ep_in, fu->bot_status.req);
=20
-	kfree(fu->cmd.buf);
+	kfree(fu->cmd[0].buf);
=20
 	fu->bot_req_in =3D NULL;
 	fu->bot_req_out =3D NULL;
-	fu->cmd.req =3D NULL;
+	fu->cmd[0].req =3D NULL;
 	fu->bot_status.req =3D NULL;
-	fu->cmd.buf =3D NULL;
+	fu->cmd[0].buf =3D NULL;
 }
=20
 static void bot_set_alt(struct f_uas *fu)
@@ -461,10 +461,14 @@ static void uasp_cleanup_one_stream(struct f_uas *fu,=
 struct uas_stream *stream)
=20
 static void uasp_free_cmdreq(struct f_uas *fu)
 {
-	usb_ep_free_request(fu->ep_cmd, fu->cmd.req);
-	kfree(fu->cmd.buf);
-	fu->cmd.req =3D NULL;
-	fu->cmd.buf =3D NULL;
+	int i;
+
+	for (i =3D 0; i < USBG_NUM_CMDS; i++) {
+		usb_ep_free_request(fu->ep_cmd, fu->cmd[i].req);
+		kfree(fu->cmd[i].buf);
+		fu->cmd[i].req =3D NULL;
+		fu->cmd[i].buf =3D NULL;
+	}
 }
=20
 static void uasp_cleanup_old_alt(struct f_uas *fu)
@@ -479,7 +483,7 @@ static void uasp_cleanup_old_alt(struct f_uas *fu)
 	usb_ep_disable(fu->ep_status);
 	usb_ep_disable(fu->ep_cmd);
=20
-	for (i =3D 0; i < UASP_SS_EP_COMP_NUM_STREAMS; i++)
+	for (i =3D 0; i < USBG_NUM_CMDS; i++)
 		uasp_cleanup_one_stream(fu, &fu->stream[i]);
 	uasp_free_cmdreq(fu);
 }
@@ -582,7 +586,8 @@ static void uasp_status_data_cmpl(struct usb_ep *ep, st=
ruct usb_request *req)
=20
 	case UASP_QUEUE_COMMAND:
 		transport_generic_free_cmd(&cmd->se_cmd, 0);
-		usb_ep_queue(fu->ep_cmd, fu->cmd.req, GFP_ATOMIC);
+		usb_ep_queue(fu->ep_cmd, cmd->req, GFP_ATOMIC);
+
 		break;
=20
 	default:
@@ -697,7 +702,7 @@ static int uasp_send_write_request(struct usbg_cmd *cmd=
)
 	return ret;
 }
=20
-static int usbg_submit_command(struct f_uas *, void *, unsigned int);
+static int usbg_submit_command(struct f_uas *, struct usb_request *);
=20
 static void uasp_cmd_complete(struct usb_ep *ep, struct usb_request *req)
 {
@@ -707,7 +712,7 @@ static void uasp_cmd_complete(struct usb_ep *ep, struct=
 usb_request *req)
 	if (req->status < 0)
 		return;
=20
-	ret =3D usbg_submit_command(fu, req->buf, req->actual);
+	ret =3D usbg_submit_command(fu, req);
 	/*
 	 * Once we tune for performance enqueue the command req here again so
 	 * we can receive a second command while we processing this one. Pay
@@ -716,7 +721,7 @@ static void uasp_cmd_complete(struct usb_ep *ep, struct=
 usb_request *req)
 	 */
 	if (!ret)
 		return;
-	usb_ep_queue(fu->ep_cmd, fu->cmd.req, GFP_ATOMIC);
+	usb_ep_queue(fu->ep_cmd, req, GFP_ATOMIC);
 }
=20
 static int uasp_alloc_stream_res(struct f_uas *fu, struct uas_stream *stre=
am)
@@ -745,24 +750,24 @@ static int uasp_alloc_stream_res(struct f_uas *fu, st=
ruct uas_stream *stream)
 	return -ENOMEM;
 }
=20
-static int uasp_alloc_cmd(struct f_uas *fu)
+static int uasp_alloc_cmd(struct f_uas *fu, int i)
 {
-	fu->cmd.req =3D usb_ep_alloc_request(fu->ep_cmd, GFP_KERNEL);
-	if (!fu->cmd.req)
+	fu->cmd[i].req =3D usb_ep_alloc_request(fu->ep_cmd, GFP_KERNEL);
+	if (!fu->cmd[i].req)
 		goto err;
=20
-	fu->cmd.buf =3D kmalloc(fu->ep_cmd->maxpacket, GFP_KERNEL);
-	if (!fu->cmd.buf)
+	fu->cmd[i].buf =3D kmalloc(fu->ep_cmd->maxpacket, GFP_KERNEL);
+	if (!fu->cmd[i].buf)
 		goto err_buf;
=20
-	fu->cmd.req->complete =3D uasp_cmd_complete;
-	fu->cmd.req->buf =3D fu->cmd.buf;
-	fu->cmd.req->length =3D fu->ep_cmd->maxpacket;
-	fu->cmd.req->context =3D fu;
+	fu->cmd[i].req->complete =3D uasp_cmd_complete;
+	fu->cmd[i].req->buf =3D fu->cmd[i].buf;
+	fu->cmd[i].req->length =3D fu->ep_cmd->maxpacket;
+	fu->cmd[i].req->context =3D fu;
 	return 0;
=20
 err_buf:
-	usb_ep_free_request(fu->ep_cmd, fu->cmd.req);
+	usb_ep_free_request(fu->ep_cmd, fu->cmd[i].req);
 err:
 	return -ENOMEM;
 }
@@ -771,26 +776,22 @@ static int uasp_prepare_reqs(struct f_uas *fu)
 {
 	int ret;
 	int i;
-	int max_streams;
-
-	if (fu->flags & USBG_USE_STREAMS)
-		max_streams =3D UASP_SS_EP_COMP_NUM_STREAMS;
-	else
-		max_streams =3D 1;
=20
-	for (i =3D 0; i < max_streams; i++) {
+	for (i =3D 0; i < USBG_NUM_CMDS; i++) {
 		ret =3D uasp_alloc_stream_res(fu, &fu->stream[i]);
 		if (ret)
 			goto err_cleanup;
 	}
=20
-	ret =3D uasp_alloc_cmd(fu);
-	if (ret)
-		goto err_free_stream;
+	for (i =3D 0; i < USBG_NUM_CMDS; i++) {
+		ret =3D uasp_alloc_cmd(fu, i);
+		if (ret)
+			goto err_free_stream;
=20
-	ret =3D usb_ep_queue(fu->ep_cmd, fu->cmd.req, GFP_ATOMIC);
-	if (ret)
-		goto err_free_stream;
+		ret =3D usb_ep_queue(fu->ep_cmd, fu->cmd[i].req, GFP_ATOMIC);
+		if (ret)
+			goto err_free_stream;
+	}
=20
 	return 0;
=20
@@ -1060,10 +1061,9 @@ static struct usbg_cmd *usbg_get_cmd(struct f_uas *f=
u,
=20
 static void usbg_release_cmd(struct se_cmd *);
=20
-static int usbg_submit_command(struct f_uas *fu,
-		void *cmdbuf, unsigned int len)
+static int usbg_submit_command(struct f_uas *fu, struct usb_request *req)
 {
-	struct command_iu *cmd_iu =3D cmdbuf;
+	struct command_iu *cmd_iu =3D req->buf;
 	struct usbg_cmd *cmd;
 	struct usbg_tpg *tpg =3D fu->tpg;
 	struct tcm_usbg_nexus *tv_nexus;
@@ -1113,6 +1113,7 @@ static int usbg_submit_command(struct f_uas *fu,
 	}
=20
 	cmd->unpacked_lun =3D scsilun_to_int(&cmd_iu->lun);
+	cmd->req =3D req;
=20
 	INIT_WORK(&cmd->work, usbg_cmd_work);
 	queue_work(tpg->workqueue, &cmd->work);
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/functio=
n/tcm.h
index cf469c19eaca..cd8d06419d5f 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -16,6 +16,8 @@
 #define UASP_SS_EP_COMP_LOG_STREAMS 5
 #define UASP_SS_EP_COMP_NUM_STREAMS (1 << UASP_SS_EP_COMP_LOG_STREAMS)
=20
+#define USBG_NUM_CMDS		UASP_SS_EP_COMP_NUM_STREAMS
+
 enum {
 	USB_G_STR_INT_UAS =3D 0,
 	USB_G_STR_INT_BBB,
@@ -24,7 +26,7 @@ enum {
 #define USB_G_ALT_INT_BBB       0
 #define USB_G_ALT_INT_UAS       1
=20
-#define USB_G_DEFAULT_SESSION_TAGS	UASP_SS_EP_COMP_NUM_STREAMS
+#define USB_G_DEFAULT_SESSION_TAGS	USBG_NUM_CMDS
=20
 struct tcm_usbg_nexus {
 	struct se_session *tvn_se_sess;
@@ -75,6 +77,8 @@ struct usbg_cmd {
 	struct completion write_complete;
 	struct kref ref;
=20
+	struct usb_request *req;
+
 	/* UAS only */
 	u16 tag;
 	u16 prio_attr;
@@ -116,14 +120,14 @@ struct f_uas {
 #define USBG_IS_BOT		(1 << 3)
 #define USBG_BOT_CMD_PEND	(1 << 4)
=20
-	struct usbg_cdb		cmd;
+	struct usbg_cdb		cmd[USBG_NUM_CMDS];
 	struct usb_ep		*ep_in;
 	struct usb_ep		*ep_out;
=20
 	/* UAS */
 	struct usb_ep		*ep_status;
 	struct usb_ep		*ep_cmd;
-	struct uas_stream	stream[UASP_SS_EP_COMP_NUM_STREAMS];
+	struct uas_stream	stream[USBG_NUM_CMDS];
=20
 	/* BOT */
 	struct bot_status	bot_status;
--=20
2.28.0

