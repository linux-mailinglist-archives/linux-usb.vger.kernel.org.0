Return-Path: <linux-usb+bounces-17568-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AA99C7FAD
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 02:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 988781F21A8E
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2024 01:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8A31C4A02;
	Thu, 14 Nov 2024 01:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="kkJznl/L";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cfO39Jdh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qhWZwMJw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F370D1BD4E2
	for <linux-usb@vger.kernel.org>; Thu, 14 Nov 2024 01:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731546159; cv=fail; b=Hgmco5OmWJmrN/xJJckdzOBNf2gTNjlz+D6kuuVHlz56yCEBh+46PJ1LpCYS1BJDyaW5jytxqtSlf7gzy0vg/kS9Bg4nAypyrrcfEJwPkoUldzQBoqnoKuI4o257zsv97yLXYcHq0b8e+bXPxx6TrwYqHToRDryF7Z3MyNF3n2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731546159; c=relaxed/simple;
	bh=jQUTHCaZneDB/DfGtKWjIVjcoo+UaN155TL/6xhUixk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bzi2fBQTYAnI/PFtovdRMNo8nyV7/QdbNIyFgsw8LAO9yoG+P8rPWQVfsKbVvdhk7rFeuXf3mNNsx/RuqgMg3gvq+SIReBkVAjK3mBdktNKPW50zf+H1tjs984jx6h+BQQiZSjKfdyDSlU2bAIpoAspQwGQz+tkZbel+r/1actA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=kkJznl/L; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cfO39Jdh; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qhWZwMJw reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADMcEw0016957;
	Wed, 13 Nov 2024 17:02:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=oZ/q2Il1L3TJ8NR3L+XWQgf8rKBVgkzUBDxR7BZJA9Y=; b=kkJznl/LCjdU
	GCiFDo4Db9pjAtZZg5dyFY+p8b3iVNNm6nH9FsQGzAk6pFEgwcLbjIYQWsCiUUj+
	A+qIkQK+UHkME26f7isLaiJgeX0o9kK8xvAn0OasSgTaZFmXC5ZA9OqfHqssf4+j
	V5z4OGeEvlByolno5N0F1nZZU/0H5k5G9EfL0PPgZy8lIhCduXAUOTs3/6mMrZC2
	+y31byRzlJ6XQHtnqF356sxO9C5khpGY5CusQ/+fMZsq4J1ymot40nytB1HE78dJ
	Hz2kFhBKx5bemgtUnG46YVyx8ODWyJlYRpmSJznt08GI5SaVghNs9LTRE1hPeMlo
	FYDGXJcU9Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 42w52s8ha3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 17:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1731546155; bh=jQUTHCaZneDB/DfGtKWjIVjcoo+UaN155TL/6xhUixk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cfO39Jdhsulvh2QvIVYLENoe3J+sf/4q7twaAdQtPdqHNSBe+cYjDnQuWQg424mH6
	 H/oh7p/vhg/CLFX49WfWSe2mtoRXyq1aunbMP0gofgYwnRyCG32ETbmW2eLnwVmvU2
	 fozVNvb6Lixg30x+9usiNXeY3z1uEwewvTBXbZVh24+wOJ7CX6jc+dLMrF4cyb70Wl
	 HEMGtQPfP5Rm8CdDFzmn6HZ7Uyyisro8b22gGPZplCVFBfIsHoLwx/vTGKFwsmyV6c
	 RH+QS1qLBnoshNUsnurno0dYTBmsowOfKQ5krjjwKHOXNPZtWsbLCZTIG6J9T2Erpn
	 QCms8dZluzlQw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D5F4540126;
	Thu, 14 Nov 2024 01:02:34 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9DEC7A0084;
	Thu, 14 Nov 2024 01:02:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qhWZwMJw;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 66C7740424;
	Thu, 14 Nov 2024 01:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mm0M6bxbdgBAAKfEgV36M5wwdtFsR1/bfGLYan6qcpiLvAySYJzOJhwZOLTk8lJU5QjnCsH0lAcGvR8zHF/E/Ai1U/pRrnzrbAnhgesfHL6gChd9icg/A0bK0jqavXiMIVZfoXC391JexCC9u/I1Na0QGcCeG/o9iH0hl7udFnDiFqr1yKvBLHhH97KIQeZzRb6wHIVCE25LQpEU78XsMUuVgAqxJyWat7djgevLNc7TB7arw6Zk0AD68DqBQsPIncm8hYIdZwrlQvf5XDXvu2XjASfC44LI6ptN93sUpb3PEbBsjMXgLw5Eg8n6VvmnGH6BnZJ7VA7pVq5qYO9iig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZ/q2Il1L3TJ8NR3L+XWQgf8rKBVgkzUBDxR7BZJA9Y=;
 b=FnEdNrGFwROlbJNLCdKG5quRyj2r2K6KmD0byiB89A6Kh3ZT+o35wdl4Zmvfgg70L7E4FeU5nSWCjWG9y1U/3c4XrKMNZ5Uy2V0NIG9K9ea/1R6EdL9XzuL93bsXgWt8UMla5UQm18LL90IRvpQ7mJmDKLcJpOuB2tTxI2WbNu5Ne4jRMWd+ZpYCaroLfsWvdCs0W/7QKE/O/YK3WHb4+zrcTsEv35PdLJ0+tM7vfTf6P3oqyqY8kHKaY8deaVv8E+Vh56ANPcsNEbQKZ1URP79tFxobXN0bJBBae/hPHGLjnPcfiuM1FRLdVyJT+QadL/gGfL+hLDyBkCmuwAZ8IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZ/q2Il1L3TJ8NR3L+XWQgf8rKBVgkzUBDxR7BZJA9Y=;
 b=qhWZwMJwr7yqfk/+8bewVrhGQv5+/lP2eSupMpAT4DTXpHflQLK92YSQ4WwnnHki8XqR2dS+JoeRcjSlW58ZTS9UfcY69r/xKDZO6uZSEuXz5QGxPVEMeEP8YXJxQBvD2k1uIl8VguCqxedmWFdWpYtAm6knExx2LY+BS31tsEc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Thu, 14 Nov
 2024 01:02:30 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 01:02:30 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>
Subject: [PATCH 5/5] usb: dwc3: gadget: Remove dwc3_request->needs_extra_trb
Thread-Topic: [PATCH 5/5] usb: dwc3: gadget: Remove
 dwc3_request->needs_extra_trb
Thread-Index: AQHbNjDhMgwt2K3oO0GTaYtg7vPrHQ==
Date: Thu, 14 Nov 2024 01:02:30 +0000
Message-ID:
 <08dd88a3308ac7894267c52340eaf0e1564bbf36.1731545781.git.Thinh.Nguyen@synopsys.com>
References: <cover.1731545781.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1731545781.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA3PR12MB7950:EE_
x-ms-office365-filtering-correlation-id: f938bc2a-4e4c-43b2-638f-08dd04480402
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qS4oR3n97X+y3J1HMuU3/HBC6U/2f0JKxdikzLttNO1ReVv2daH8eXgz8a?=
 =?iso-8859-1?Q?bjyrYR4QjK4S0OxUuEdKlt4DXWIg7qw3bmQ6HW9A2SipcWNfr4M0R1EDZh?=
 =?iso-8859-1?Q?7c9XHAaDXB3saHKvtI8Y1ien3lzRzBHKbZxo6tNJTfPqFHmCcZbeMUqyHl?=
 =?iso-8859-1?Q?szGNnCN+3fGa8BFTI5rYjLCd9939+qLluHX2zEyD89nKJ2Vdf3fKrqfb/P?=
 =?iso-8859-1?Q?XMmeFYPgY1hXEKdGdrYqls+e4awlyKV5WZ2NC/PbuFVspkI3rauNyN09yU?=
 =?iso-8859-1?Q?bFbiYq7nIclpUEMYcrCt98BkVMSYsg8EO/tMnp8onF2vZFm8KdvaqQCpLU?=
 =?iso-8859-1?Q?Qhumj8IZaLlvFUfdFHC2tAlohcAfPLrljcoJ3HLM6uUsLS+tcw884Q5fJJ?=
 =?iso-8859-1?Q?oATNJejDMtUOpgSVk0ZHdUR+wCiBSs+MsEvRsx6PDj1g6APZZwmToAiwXt?=
 =?iso-8859-1?Q?NUl0FBBS/gmzbwbt7VVfeh0n4Qi57QxWpRohFefx9WSsSSblOOtY3+pSjl?=
 =?iso-8859-1?Q?3Qe46IigQUORiKiCULRNxFs0Fdc5mwQNQSp+I5Ydp7ne7RuYvl2fZvZ8YZ?=
 =?iso-8859-1?Q?uskeKsOZn+hw/ss1ZvSoKWkJ8x/sFcuGSB0uq8OU37Agex5wNpcNJX7pNz?=
 =?iso-8859-1?Q?dGUlBR7Tzydxz6K3uwfJr8w/2hzAn33trUb+rPwSNTfA7xrh2bbty1G5u1?=
 =?iso-8859-1?Q?7FeOCh1WZe7CcsbGDohL+DkxRsfDbGLOsyUg3XwZKR5R3ZT2TMQU1a/VGU?=
 =?iso-8859-1?Q?3ADgEsp2LjvUENsm0G516a0ozV1Iw9tgJcWlKkqwzkyTwwIkfMUrRLsrCU?=
 =?iso-8859-1?Q?lPYlIdyn7g9SDxY6bj6rChUd/gf7o18LfyYFOOnhN80H0nKy3aGnO0Dw4P?=
 =?iso-8859-1?Q?lQoXhfUr7Q5oCgKJvbDR5Z7lVEewJt3z7JPg6E2vzams1tBexwmvZfh5/f?=
 =?iso-8859-1?Q?/X0VPap1gZBO1Q1HgtGiEACh/qPOLWrP0zrbRfzIK2aLY1SDDG1Q9425/6?=
 =?iso-8859-1?Q?1GIkvsQAxoDO2k/jK1/QImNIQzRjMu5oGWNyLLzqXwxikkSA2lCbNOozO3?=
 =?iso-8859-1?Q?gwckgQWVeo9aH/ZyV3fQHafV8qae1ELxY5q2eOAb6/iZsIv/VstmESqT63?=
 =?iso-8859-1?Q?UJOBbc/sZ0F8NezuelEtVTWn8mOdzvKV6/CYVjYTQHRiY8xL8PYCvRz3fj?=
 =?iso-8859-1?Q?M/sQ44Xhyl0xb7Y9voGJHDDgMK1UMrFNohxAP4eib7o35wKD29aAN6qusO?=
 =?iso-8859-1?Q?02uzquZShzJKK6d4H352JfLmrCbwoeVzjoTzGVH6Vu70azi4zyl50DltPk?=
 =?iso-8859-1?Q?rBXSXBniGgFCotXP27PSrvESHF6Q/Pt7QAyYCCGItqbusi5WSTyYOOCR17?=
 =?iso-8859-1?Q?DawRie9dJ+YdM+H4qDkO5M6STPEbhsQUKJLBSlAggDjxKLx9kqciA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ObohOE9lViIv+1KGXZinEgBfMpzL7xfHVFi+jYxcYHtpoqyPPARNZOY1x2?=
 =?iso-8859-1?Q?yTMDH+8hu1WPIySE5d42svqMlldFLJm1UFBJpHcPDrsY7GFcrVPTDEEf94?=
 =?iso-8859-1?Q?TJHzt0ZISE1kIAdRkLNqVYAT4U6gysEc/YLXUY8q2PjoF9ZZCFGhnqJdnz?=
 =?iso-8859-1?Q?zkEzB9TXvB2fhiPdz5s5JFGIi2im5GPprIICUAxTh8gdbA3qo3m00LmoNc?=
 =?iso-8859-1?Q?+qgVNZDRyhYuhs1NApdam/czcxuaQorMVqCxKQZS17fDFHZuLzg6oMt7Wu?=
 =?iso-8859-1?Q?pXS2GXppI65Y9inFd+JWuCRvcJ1R/OYksW7nElw2hb3zH+yriu4ClzFLQp?=
 =?iso-8859-1?Q?9Fa2RDSIj27dbS1DHubbqUgOuJByDPp7Hln+IfMwjzo9iwO/6PtOT8GNwG?=
 =?iso-8859-1?Q?q6eTYPvoD6NmO8fyfGyTGpxrKsBjLf45ndwYI3WmHarUyHIuOC8wU8AacM?=
 =?iso-8859-1?Q?zDCerGuqmKXcEBjgplx4A3wOB7605I2IvoH/qZqpMjim3/OWsTvr6/q144?=
 =?iso-8859-1?Q?N/3y8uOtc0TvOhMpXWR8rLFDWdUV+Cv/jsYMPIGzTm9k2X6IBFQI4cblwI?=
 =?iso-8859-1?Q?HVae9AQY48QvK0mm20HEVFGNDDsn4t4E9eh9AI8/ONhqBXUA51y3Bw/IsK?=
 =?iso-8859-1?Q?W1jiLtybzzKDsN7u9XPyPV98RhVjwMk1Tg/a9wmtj5jxG9SA+Aa3n9dA3k?=
 =?iso-8859-1?Q?Z+CfJ/zr37X2wVd0du6b55CdNr51tWjYOxzxf1vYR9WYMo4HmqKB3cNrkc?=
 =?iso-8859-1?Q?4AJ9NeBluGqLfxRVL1SHZhP1ZKKd9jYbjSgQvJYCoJUZVZmKM1ShEICndb?=
 =?iso-8859-1?Q?voDt0YZ9KV/5TACd/TBjHdg36dG+L6G88eKQXJQKVLHARHxF/qOKSH06gd?=
 =?iso-8859-1?Q?WXT3gDLiaJvnPZRW+6iKXkVqQzIVfoN1KuG3zERetzrm+bT4byAzXyu4oD?=
 =?iso-8859-1?Q?YB2II4goguwTN7v9vEvfnFaPzMjLGqQcMrxfbE6qlaY922KdX5NJi15D7w?=
 =?iso-8859-1?Q?ZM6rBD9r5OuWClG90mxLtiMv96dDNYo4HVjt7zgrA1jmOuzfZygWegamYs?=
 =?iso-8859-1?Q?ZWuo4yRFEoYcYjRbjohRYvuNZFMqlHB2JB3hNYid8Sd7a3qk2KDIfyHjnA?=
 =?iso-8859-1?Q?H2t+fYiF642s9FFJINhwkqMIG4EzMGUEINA90WJMZD7CnnZoFzXCcoAVWP?=
 =?iso-8859-1?Q?jrX+ZVIB563YWP8wB1EAQ7syYVmYMtHe1XJeVcD6bEJZt605JLrNVS5wPf?=
 =?iso-8859-1?Q?PXesPP573zHLG/+3NMI6sgfTrdcfbKTREwzXJU8TYBaGOJDxNPyjXT2tED?=
 =?iso-8859-1?Q?ZVMraKanpdhESVXFQXFiK1ZlskucCZFGJdZWPBuZ5bCf/uJFIImEAJZ5RK?=
 =?iso-8859-1?Q?qK3pI8EijONmTMBV/fN/KdsLBfhJqPW0X3lP2F6IL0rZT/7sq6sQ4NSZHG?=
 =?iso-8859-1?Q?tGpcuVRm99KMF4Mk9mUoSitpTK765BNBQf78ak1O2oAyFTc2ePaKAyHNDK?=
 =?iso-8859-1?Q?LNFnYprN6BJHEJoMT3Z/7XO0b5OLM0hncjoYC8tDDUIhHYi/XYODwTA6X+?=
 =?iso-8859-1?Q?9i/fdFf1CI1XO3cGHRc28i/G2Mv4DkExA4SMiLWohSuGofJnq+aA/C5T3F?=
 =?iso-8859-1?Q?l8GyDcs8u4p4QgpZGJ9rTwHeAutDvopE2p?=
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
	geqbiHo8sPQ1hXfiIesqBzVMZagu75olY+T7jcSXZD+RWD6JLCPi4JAAhdgSGYOPszHcY+Bhu4TmaDRc2LpLNrE15M9qu/0iuw8CeQTUM/acdNgDH5XAFUnAw8HPCVuj2hF0NpFVsCKgfnIs2FRQpSgYta1iudP6hahcOscOFdpNelMlQi4a10SBJk0RpyMCjthaWr/1mlVgnDTOb3qP5xg48Oy+tcIugljG0KelteYTu2Vp2OTuLVlytm3ME4lwIipelQr1Mlgy5O1BdI4d5OGaZuv7dkmJPoODRMM5armVt1yqkgDsYa1bj+w4ZEBtH5Xok7s6m256z4dvzmxXwyPNWQ8cNtcsi7Ad4uu1YKbZdT7JuON9e4KSCbrp30p+geZ3pKxl38DstxpdPgc/Ls2mZScy8s1gv16QKftdBF+R7WbTVb0AHtwMzaHqkL6QLBtj0IQtDLf0HVrER8qeaoJWjTLJF//LhWasFpLNzYCeEydfpmKUogWAxAsKclewkL7HXxwlUHMfxnQ88XUqTlzuie6yyQbFLwdLk6bZHRsjWZzsslUtmIdyxCojemEmQUquPDRYR1+R4o/KA805f3CFoQZ09in2ZzA/y0lXVd9aw6qECyyfYC0Q3tWzrtTRJN7QreVSaL5bmR8VHwgqsQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f938bc2a-4e4c-43b2-638f-08dd04480402
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 01:02:30.7617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+hy79fYI5M3oDBm3QNRuUr3RvKapZKlolWnZgvALCZDakETMv+ahc4G3g3Etrw5T57JAR255z7Qh1JkLgLp1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950
X-Authority-Analysis: v=2.4 cv=UvMxNPwB c=1 sm=1 tr=0 ts=67354c2c cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=M3LnWOeIi3LTSXqGCcYA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: d2l7RpX7w9rvpxJQGZVyQ7e-ECeWzMFq
X-Proofpoint-ORIG-GUID: d2l7RpX7w9rvpxJQGZVyQ7e-ECeWzMFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411140005

Now that we track TRBs base on request->num_trbs on reclaim, we don't
need to save the dwc3_request->needs_extra_trb check. Remove it.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.h   | 3 ---
 drivers/usb/dwc3/gadget.c | 8 ++++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index aa09ccbf34a5..ee73789326bc 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -949,8 +949,6 @@ struct dwc3_hwparams {
  * @trb: pointer to struct dwc3_trb
  * @trb_dma: DMA address of @trb
  * @num_trbs: number of TRBs used by this request
- * @needs_extra_trb: true when request needs one extra TRB (either due to =
ZLP
- *	or unaligned OUT)
  * @direction: IN or OUT direction flag
  * @mapped: true when request has been dma-mapped
  */
@@ -979,7 +977,6 @@ struct dwc3_request {
=20
 	unsigned int		num_trbs;
=20
-	unsigned int		needs_extra_trb:1;
 	unsigned int		direction:1;
 	unsigned int		mapped:1;
 };
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 687bb8cc4114..83dc7304d701 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -197,7 +197,6 @@ static void dwc3_gadget_del_and_unmap_request(struct dw=
c3_ep *dep,
=20
 	list_del(&req->list);
 	req->remaining =3D 0;
-	req->needs_extra_trb =3D false;
 	req->num_trbs =3D 0;
=20
 	if (req->request.status =3D=3D -EINPROGRESS)
@@ -1440,6 +1439,7 @@ static int dwc3_prepare_last_sg(struct dwc3_ep *dep,
 	unsigned int maxp =3D usb_endpoint_maxp(dep->endpoint.desc);
 	unsigned int rem =3D req->request.length % maxp;
 	unsigned int num_trbs =3D 1;
+	bool needs_extra_trb;
=20
 	if (dwc3_needs_extra_trb(dep, req))
 		num_trbs++;
@@ -1447,15 +1447,15 @@ static int dwc3_prepare_last_sg(struct dwc3_ep *dep=
,
 	if (dwc3_calc_trbs_left(dep) < num_trbs)
 		return 0;
=20
-	req->needs_extra_trb =3D num_trbs > 1;
+	needs_extra_trb =3D num_trbs > 1;
=20
 	/* Prepare a normal TRB */
 	if (req->direction || req->request.length)
 		dwc3_prepare_one_trb(dep, req, entry_length,
-				req->needs_extra_trb, node, false, false);
+				needs_extra_trb, node, false, false);
=20
 	/* Prepare extra TRBs for ZLP and MPS OUT transfer alignment */
-	if ((!req->direction && !req->request.length) || req->needs_extra_trb)
+	if ((!req->direction && !req->request.length) || needs_extra_trb)
 		dwc3_prepare_one_trb(dep, req,
 				req->direction ? 0 : maxp - rem,
 				false, 1, true, false);
--=20
2.28.0

