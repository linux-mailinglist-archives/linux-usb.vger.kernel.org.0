Return-Path: <linux-usb+bounces-18358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B19EC0E8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 596061643B9
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7292BD04;
	Wed, 11 Dec 2024 00:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="t4dM9rbv";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cjb4Um+e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RChHFbaq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9689C179BD
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877253; cv=fail; b=Es9XoRQ/2md+Da6IHXKI/tJUIoyN0Zgg/y8lq8Tu6SNyCfRRModUcFstW6eER42W8yEPe1JCZu6vw4qVwzmT0BhussOQkJy4d9kww6iszyrRnOq2Zz7bfgE8vUo5ZAnSl9Z50GfqVgiAL/TmfeKMaIpsRbN+I8FGd2dxr9uRDFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877253; c=relaxed/simple;
	bh=5jXeXpuL7S9DDm0b6gUnh4ARmdN4BnGmYjPEuXI+/no=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dt0U5fgQ+WXrqO/6lIqkMvDKKEmVsAeY4RujrHSQDXSBzFX4300uMQGRb7sbjS49rpNfHmZ/N/FmUAY73xFr+v7AV5h3nC9Yy/IikTh8e6rSYBbK34vMDJc5aHA93eDX65ksR7wl9BwILqBb/vL+4uJscEO4g6+qgD7dorNh6oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=t4dM9rbv; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cjb4Um+e; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=RChHFbaq reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAMaLaS019443;
	Tue, 10 Dec 2024 16:34:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=hJ+fMSI1NZfbj+club3P96NT5wA1yHKB4MV7xa7ampI=; b=t4dM9rbvup7D
	32SAuxohaxGP5SzfAm0z5le0bSqUq94jFRfQUKvP3A11GLk6elb7sttRigvxU4Le
	z44YPgD2DdhztQ8VIetd/gfSxsfw6gvD/CRT6HwX+BegBFAq8sq0tjGm4pwmcdK8
	ZGWnxGcicY+qVRVx8QbMnlOiG25XlXflIFDwzjpXBiw9OQ/iMtDeQpAoOT+y9cyJ
	2Dy68N8ydFXfnKhU8KN5fQud6s7fyUFllfSZTLQ4+mmkdzjuUGdkOGS5/srVG+hx
	zeEtc7O27FU1aM9AyYrvJdLYY+RD1ID0nWfBpGQIWsjtmHm2KygTWOcQ2JQYV3b6
	SwghunVlPQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cp8t9vtw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877246; bh=5jXeXpuL7S9DDm0b6gUnh4ARmdN4BnGmYjPEuXI+/no=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cjb4Um+ewsJTm8L79sp7fSNIdj9ltzvNVCAwF23Dy5bVp0+p8CWNcQ1zYVVWeDbqX
	 FtIqAoApIy8BLy8wpfjHreJNyjmmuNh1wO8sDbBrkr28jWaptCuJxRqwJCLY7hllcK
	 HyuFppWNf1SzRejn0TbMp+NoXghMFmi2Md/8NmPRhWp+59S5eLLOPit60RE/ryId2m
	 UVsXsM5NTWOLUKrOWsGFa7jM2SPUiL0t/oJasYGzkM9+qvcxiYSQAoxO4UHJVW10gE
	 //XILSjJbkFd63VSH1+x78QNgdElq19+LAL4Tu9r/nX4aHr8s4g2FM5+lQQPNSdFoS
	 ZB7RM1HbcqeYw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B61CC401F8;
	Wed, 11 Dec 2024 00:34:06 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 580C1A005E;
	Wed, 11 Dec 2024 00:34:06 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=RChHFbaq;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 205ED4035D;
	Wed, 11 Dec 2024 00:34:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=folURxooVZRoE+OjfWUAO1edBWJEjedzQBe/hnWW00hrlFSUDKXQtmu+KJZr0wwm7a0rUd/TKGTk5X0xs2236ddFiMyk3eCcVQRwt4mUWUrNApDaMWtoBq7zWBvV4AMOmieXytlK3LUFKhK/8KiPZmqV7J4Jd33bB8/wpnIAZuKyIBwYXVTi1mgG5wEKct7X7Owu+CGbEBjyCUWf4gQNCHm1omqXqR1OEwtDZl7bwrbnyMGwlU+mNWN/VXypod7d7CyQIxMnYLH2Cy3IXrm9Z+qkqvS7KQhfsjO1mbXWZZ8elq5IPmw4hltscNr539XQKkpxkB3EWfei87lYcebaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJ+fMSI1NZfbj+club3P96NT5wA1yHKB4MV7xa7ampI=;
 b=ntRMFyWWtzrxdIFQZsahJ4V3t4NpVsE10y3pqi1g6oAWP9rfv4gDte5z37epxBBTfKeMPzn0cf6dnxPa3hB/zw/8OJmzvQofRUtRv2Whk/yG727kyA81cPOB3qbpQwcP+lGBVrG2wuy4ym9vthuVHWZYgeAU3dXKJAU1kmtqJUotM46dvCbbz468lB6hGmXzcJAU7JoPMvNOIL5/KKeBLVmkWwC4zWxmfCuVwKan3q1ugcAcQs2zQhdp7MJcATywgrXUZd9EH117S9cFKbRGc6bSYjb/NCi3U8DOZu6WKbfQ3aYU0QIkvnpz4Q0jmS8DnGN/jfnAZI9AJiD6zjh4kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ+fMSI1NZfbj+club3P96NT5wA1yHKB4MV7xa7ampI=;
 b=RChHFbaqNM93UzC6V0ButvY7HClN/18SyirG+uQoA/EQDvXvdGc4woeyP4pYeVpoJ5pi0aq1K3GGal6ZOgvd3NczqfvoMUzUvG/UDSUs2grGa+2cGilrk7hJYtgANixOV7o57H4Ap1gw7c7b7VqlXEREiim/I6NMAMsBizEpubM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:34:03 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:34:03 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 25/28] usb: gadget: f_tcm: Stall on invalid CBW
Thread-Topic: [PATCH v3 25/28] usb: gadget: f_tcm: Stall on invalid CBW
Thread-Index: AQHbS2RgSwPrd+p/1UqSq2xBtr3xrA==
Date: Wed, 11 Dec 2024 00:34:03 +0000
Message-ID:
 <96022e2d5225f01a20263a4ba9c2e2c8a63328b8.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 1c3d8f6c-1bbc-4139-f740-08dd197b8354
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WfVbkIZB/pSQDbPzWVbNTyFD/jJHiNhgcw5w8athITVoLQw/rxsIy/m9BH?=
 =?iso-8859-1?Q?LSq9iwXjChcUFZ0YqvOouN1FEVTi+mZ72aeaUNsO+hJuwWBItzYml+F9g9?=
 =?iso-8859-1?Q?hpeJeyjZCMLqmJW4gsb9GPUw+Zk+aPNSE+bx5GeGCdzHCr6V/FC9KoFRbP?=
 =?iso-8859-1?Q?Gzx6eRbY8Nbd6XO0BX0rEYXfmF33SoP20ldFjOrQtFTz8Iw6ZnuS/1tayV?=
 =?iso-8859-1?Q?fOBn8A3rduu4be/M0G684OBFvSJkvHFrs6zIdE2dY6+ijxipyMpcG4t4ql?=
 =?iso-8859-1?Q?0X0U3FPHcUKk5FGiJOkwpxzbNP9gMG7/gfq+IG0NR1ORdpwnisPqHS68hw?=
 =?iso-8859-1?Q?zUbxozpGUbNleWdEgzwn8EsIr48Ime7HhT2nBDiQ0WSLh5n3b8Qj3YUQU8?=
 =?iso-8859-1?Q?syfBzUVvw9E/Y94oE4U9qEYPU5tuHGRxQGLHK+yYxQhlCFBTWVlPtHtQ+0?=
 =?iso-8859-1?Q?iXrqbecR/ix1/Ovz+e8W/RbBeeYwmwNIu4+iALmFrsMW4JlUlL+2E5bORp?=
 =?iso-8859-1?Q?FP0J1/ppjRByOwPhJOkPN79PWoMK/2cbLvhoe+2Phum1UzobQtHj+vnTv1?=
 =?iso-8859-1?Q?/2uuQdTAiI/81+D3WkumGIflPCkCUwV/kZm7bcBhTVFWbE9Ks7O10V7tW6?=
 =?iso-8859-1?Q?GUWLKC2c7Aj3v1K1/yc1rfAevrsedXyYnab447nhwuUw9CL1f4mzlREeGX?=
 =?iso-8859-1?Q?bRT6CCBmRzrIDhMf/IFMsi4Htqscc4Zuxwu1AiDBJFb4LIvrR+sq14qKWB?=
 =?iso-8859-1?Q?kyblMKVQ9NirMkPQa4aSVqD6jxwNYLGYbEHTZZGvkBOGiTQl9WeGKLu8f0?=
 =?iso-8859-1?Q?nyW0LvUTYkcCDBiAs5Cdu58Bqu2i3eYbIFzTsEUvtRoYkUe94lkv1oOxrz?=
 =?iso-8859-1?Q?/e4VXMUHBM9nEayv6/OmEIVUBomHhJ0WW7tiDnsLiy6hTbqe24lfqZr9jA?=
 =?iso-8859-1?Q?rKbPfES2zKu90joJnxrHkH2cieV8Fs4Cs0nWjKNACkTZlLcLn+Frjcs3qg?=
 =?iso-8859-1?Q?wPWoUrjhOBYtrpRO9emvv1nk/Dz1Iaxl0O9HTP9Vw9OYCDEZA4nZnjeodP?=
 =?iso-8859-1?Q?hwWOqHdGprMT0bImkcDm/z/cHfPCrrDn3UPYWVsXXisIKa0iL3m0Qvp+29?=
 =?iso-8859-1?Q?IbwpK8XG4JdTQEf5iPLm/BTda499iiiizXgr4P1FzHfZgFY+kJb+IJSjIK?=
 =?iso-8859-1?Q?N+8kt7sU+po0L+2rk04Yqkpd2bgfAeuG75s0Sa2u7pPJkRFT07lYdXzi3k?=
 =?iso-8859-1?Q?w/vuXKxpaNUy/coNx/JWvXIkRPJKyojjdY3gYKLs/QMFtARFMbILqW4sDk?=
 =?iso-8859-1?Q?1X116F0fQlxxE9noHswMDq8F4dOzIfli3/Dk/0li+8McSN2/MctGxEyqJ9?=
 =?iso-8859-1?Q?+ptbTt+JeSYfzzCzSI6WG8s8+HGZ2hTKiG7Oxj3rCkdWZmCTWFPLVszDqT?=
 =?iso-8859-1?Q?V4hkXxkfkq1ktsdf0JS/0ETkH3oSHsQl9rMULg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nWXsbh2MxoxtapEW3d22deVQ14WvaZefRhv6xHc25+e89r1+WP/Gldb5pb?=
 =?iso-8859-1?Q?SMWrpZ4wodODbSlXkLuyvFIwUwXLOEu2O0jl7ob6ARdTjhcpfHRgugZYVU?=
 =?iso-8859-1?Q?rXHts0cO3rDODAsN2O5ud0+XEXhu1rU+MTIBXke5irZ5lhWOmjHgJIWzgw?=
 =?iso-8859-1?Q?kGuT8DPy8JJd+QgrXIe4OskK7rXFA1mfbGmb4Oe+dxNjr1YIHBjd1kkX7e?=
 =?iso-8859-1?Q?DIphSdhl6NYba0TywNTIcqj+sNl/OiaBBzMCGQA2EW1edcHN9+dJo1kfRH?=
 =?iso-8859-1?Q?uwaDwJzTcfl9Yfr6Q1o2Vu3/fToAH0qtwiwSkzoFmlHqNiODxSiXfdBNZG?=
 =?iso-8859-1?Q?BbrIzlIkQUnq0LzuGUFtrShdfMhhoU/BnkGqsD9TC7qLXGg1vYJzGmfgue?=
 =?iso-8859-1?Q?d+NNVifATumz/cQb3o2ukXlgA9aR9sDlzpdSNeEujI8K+r3h82g3Dsa7q5?=
 =?iso-8859-1?Q?EvB2KOTZIVe0XhxLcGX5puS7M5Jht95IOi1iErYSGNorBj7Zqdo1lC/p74?=
 =?iso-8859-1?Q?WgS98a9sY0ydjLstG71jPQYmokviFTURvjHGCqxuZavp6Gtlwq+6Eu3q5F?=
 =?iso-8859-1?Q?N6k1h8A876Vg+6549RMKsIqFZqK96VbCTDQV6m/VON7LxeIV1kS4feoyhK?=
 =?iso-8859-1?Q?A6gfGPesIY4UyWIX+iP2lFuSajvJ395rMQP8JobcWFmHo9BH+ofhWczaes?=
 =?iso-8859-1?Q?ZSb2gSCCjGXj5H/3R7qsuUzeAaZNhDMMln2sbSDFBAKd4/Z78ggMK6IfqQ?=
 =?iso-8859-1?Q?yG8TAPtfc8NP/DlW370XoZN9cM9lUtXo3IXUlNm86rvzC+eKR7QYBW3+DQ?=
 =?iso-8859-1?Q?LfSF17sTbE16XzBn2CQZKr7wQr1yOOf8nX8OYlUxAgVyUAIQryb3o5jFeK?=
 =?iso-8859-1?Q?XkEJSTk1A9vzhTOOXBaVMH4zbsGb4YVhcgE5TW+5mO4pvSFlczDMW1B4L7?=
 =?iso-8859-1?Q?xx6Xm4P6B5piHQwkyZ/ubmnRXZSIoojtHJCMxmE7v6TuUUd1BX4D+3OE7y?=
 =?iso-8859-1?Q?Cu9cK6V70EFTu2KRPAAxhw98xuAl+kMU8X1aO5YI8jP5fiJOkig3Ik5vIF?=
 =?iso-8859-1?Q?GFXTuU0tYLUMWPvn1dvIztF6aKtWiwG/m28hVUeItwvKxUi8+RxuKK+/LK?=
 =?iso-8859-1?Q?IyawDybA27KEcS377TG+ycN4FIIJ+yXvxHs5U/s8/LhmxVzacCptKNE/BJ?=
 =?iso-8859-1?Q?OY0g3emLa4gSI9vhDQ046ELssNbZnPkb0Tcxuiwa2dTlr8U7foRs/qDEf8?=
 =?iso-8859-1?Q?eFl3CmrzzGP3yVxs9SPemQPSidcD0Q2JPepFho6goUgmDFRC9mG/cBf0rT?=
 =?iso-8859-1?Q?Dj2g4vyvQxnazu5nzRbgYm7RQSXwnAdd4uDbev5MpHf97HWgaQlt9npq1k?=
 =?iso-8859-1?Q?9QLZ4rYqTqdkPWHthpxaCruWUrSMK8I42VdtcnD2spNBr/migYCQLn8fcm?=
 =?iso-8859-1?Q?1ixt65PD1VkhS6GAl+kazksysib6mnxdWeIsh650MooKPBOiONnZz6G0/j?=
 =?iso-8859-1?Q?dkCaHrfMzOKgbTGNf3lK9ZjfD5JJrHH3u7lF8nsC711YA3XS/bRybuP7gm?=
 =?iso-8859-1?Q?H5Apl9I+iQqok+z2P0gySJI6ixTsi7mBaXL0EDkKSLDfgkaCZR7zWzutKa?=
 =?iso-8859-1?Q?xJWdaJ22WvtGWMPmAXDkyKIoviqDdDyDcAHjcawZ7/u3gnVOHNVTuaCw?=
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
	EMUU8IfsqWncCCjUxPApB8B0HwQgMk+ZtIRMGoCtALJvn22edeCpvcJcbQCUGuO3LRN6y3piYiuM5GeVmCH1b8yI7zwNXt+jpmG3UnczZkt1iVVgDgxHsO8arWoa4Hz9aEa/by7AUhqaApXVm2BgmIxGI8I+lnuuP6T5sxLUIoJabeIjh8usnEnXGHlbldx0sF0hsBTUojuNYBaIut/BXfMO5Z7TkC/mNL7vIf7Gnvt8gPCd5iR705DPuTc9/6/USFRTTav/l9WaQNM+7wi+M8qXOX3FbyOHfS4ZxQXY5yUHUohNiFN7CfZKwXyL3FeCg6ubZHolmR28F9nSfu3573kCODfEN4+CkV4Pt0D7nsrdsrlwCAhaSUdCY+sGetDUQ+4/C1UTk3/URtjg0Pea+SuB2ulPZI296hnWEdJBhaYsV6fEcePeBD3bF2BRMJv1RldBLurKJbUY23nl8owKZ8O4grwV73IkyBWDJxcMR24v/U2EitpOEYMwk8QOB2d+ZAkmpqFreUEEUG0euUsDESx74qgig5WPE3EHE8wYqohj6XYDISIBqMM9kU4JOthqXLg1KhoMKjp1apR19LMviephRDb3ynOzMLwT3CmYoZBCCQDZNdJFfQKq+8vgWhG7eHtcWfnWsghjNKSCl6qAmg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3d8f6c-1bbc-4139-f740-08dd197b8354
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:34:03.1262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NM5MD/wtvmRHcpZvZqphhKIFce15sOLzfQqcBRdJ+vunP0G8DlGJAOzT2Ne5wsVi/aKltMtepMJ923FGPUgraA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Proofpoint-GUID: Uoza1v-v8DoZGCQsp-9CKTHLxedETquw
X-Proofpoint-ORIG-GUID: Uoza1v-v8DoZGCQsp-9CKTHLxedETquw
X-Authority-Analysis: v=2.4 cv=KdsosRYD c=1 sm=1 tr=0 ts=6758ddff cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=86P5cLNenNSuEYrntEkA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=968
 suspectscore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

If the BOT command CBW is invalid, make sure to respond by setting
status endpoint STALL until the next proper CBW or reset.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 16 +++++++++++++++-
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index 0c7a41568f40..7ea48845f8c3 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -287,8 +287,17 @@ static void bot_cmd_complete(struct usb_ep *ep, struct=
 usb_request *req)
 		return;
=20
 	ret =3D bot_submit_command(fu, req->buf, req->actual);
-	if (ret)
+	if (ret) {
 		pr_err("%s(%d): %d\n", __func__, __LINE__, ret);
+		if (!(fu->flags & USBG_BOT_WEDGED))
+			usb_ep_set_wedge(fu->ep_in);
+
+		fu->flags |=3D USBG_BOT_WEDGED;
+		bot_enqueue_cmd_cbw(fu);
+	} else if (fu->flags & USBG_BOT_WEDGED) {
+		fu->flags &=3D ~USBG_BOT_WEDGED;
+		usb_ep_clear_halt(fu->ep_in);
+	}
 }
=20
 static int bot_prepare_reqs(struct f_uas *fu)
@@ -442,6 +451,11 @@ static int usbg_bot_setup(struct usb_function *f,
=20
 	case US_BULK_RESET_REQUEST:
 		/* XXX maybe we should remove previous requests for IN + OUT */
+		if (fu->flags & USBG_BOT_WEDGED) {
+			fu->flags &=3D ~USBG_BOT_WEDGED;
+			usb_ep_clear_halt(fu->ep_in);
+		}
+
 		bot_enqueue_cmd_cbw(fu);
 		return 0;
 	}
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/functio=
n/tcm.h
index f6d6c86d10b3..009974d81d66 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -130,6 +130,7 @@ struct f_uas {
 #define USBG_USE_STREAMS	(1 << 2)
 #define USBG_IS_BOT		(1 << 3)
 #define USBG_BOT_CMD_PEND	(1 << 4)
+#define USBG_BOT_WEDGED		(1 << 5)
=20
 	struct usbg_cdb		cmd[USBG_NUM_CMDS];
 	struct usb_ep		*ep_in;
--=20
2.28.0

