Return-Path: <linux-usb+bounces-19604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D6A1882F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 00:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D46FE16487A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 23:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C48E1F8AFB;
	Tue, 21 Jan 2025 23:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mfJLs6F4";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dHTidfTi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZjyhcUBS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEB41F8915
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 23:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737501112; cv=fail; b=tPqLbzjp7N7UjvIC1hCyk8qOs2ym3KnufYmexFAq7rLCgcDBSMxhTdbnlhubQBmvW5/Wu70XB0sSmGr4KmqlucOttGOWxWu2/5leOboaH51e2no/zZz3s8nH9c1xkCMl4sMNA9zLzGe877aF97Dc2TqCAikVbm3KZqfsL4nyPmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737501112; c=relaxed/simple;
	bh=0P8H7x62fAw7RsV5dAU+DCdIWlY5yXjE2qUiKxgVPF4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hjmd5LqEB/xlNopoerygTwXztNXDEyhedfqnjcPtfcVd91SJBHIZujYrnatNvDku9rcJbTtNDZW5Kz30JGlLz9ywTR1dNsV9rOdyQmYdzzNTycwv7pbBjHgZiaowjHQVZSVXEXWa6IUnu2kqfA5DFLirY0bWVu3nAPjQutPmIQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mfJLs6F4; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=dHTidfTi; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZjyhcUBS reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LK2eBh006239;
	Tue, 21 Jan 2025 15:11:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfptdkimsnps; bh=CDOA4MOgbkGaQp4CjBp
	SqVowgM0NIlPJo+3ddVbh308=; b=mfJLs6F4/AJBJBeBwBux0KCGLGpGgzgF1xm
	OHSAtVGN9q1VLBZM2BdxrI7dPnZ4W5TFGv0AMrdxVu53/7hvtA5jXLB2D9nJ0IR9
	sycVfz5uw1eozkAnbnxUYHP4X9EZI6AmPa+DRohWzX2HKaWbkY7y0vRsHzeMv/JL
	X3iuQDE/0SXzIpKZn2hi8OmbtNU+mQ7N9jVWqdhRm8wvAzIjHU2Cq9vPpfL3vgTD
	GtpKZZ0H/vkzoP4L0BaHoe0SNfKlEOewoBEl0u9MrWX4kEzYvguSezXFJ0+b5vea
	NlXG23jZDlTu62ZIRK4VR6nHRzAd8VNNsYdZQO8WbMu3jCJV98w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 44aj978sc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 15:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1737501090; bh=0P8H7x62fAw7RsV5dAU+DCdIWlY5yXjE2qUiKxgVPF4=;
	h=From:To:CC:Subject:Date:From;
	b=dHTidfTi8KiPgqkNYHGWKHGwbKNi2R+rQc8EheT4DDDmei8t9SFfKtZ8gCgm2xlqJ
	 3C6XX+QRM7CAmDxL68IKqoiKCc5tTcLcWtbKsJJW5Z2tKiY4AJn2Imi3XjgSMUV5bh
	 hCf9ilaXW0P68Fhj8M5IC9C+MYK7pn+tudAMYvhnciF7m77DCQs8IHbca+i8sBgLEe
	 W2jirektS7XtsxCdhwia1SHFTC/zHJt6KCK59qVO777hgy9yzTyav1rGaRpqIU3EUK
	 O4XcPemjWsN7qoSVfGmO13099KLNXtrSAip9FTXs0S5WWt+7gFxae2y5LSK7VLmguX
	 iAcnrwuBrb0/A==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D428340518;
	Tue, 21 Jan 2025 23:11:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id AEAC4A00B7;
	Tue, 21 Jan 2025 23:11:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ZjyhcUBS;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 766874051A;
	Tue, 21 Jan 2025 23:11:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjJ2jsXzdg6ATNleJPsNlvXWUVEQc7TlCq8J3nrtT/QQrKTcfRLtlOW9FBa3DFlRRouH7P8AJeAs7rczVvAaOHc7Bf4GE3ZTe4yp6whW0Z2U+5odCZ2dYvDcABMbzdaG2L1/cr00nLkjhXF5ZeZ1tqLYbNKlVqT/VBXnhLmJepw8i1SoL8td7YKBfrSqFNFjfzSxksdxIyaBski5I/HfJqmhugXdHhEdHOpUmN1j46PtTvftkspQQ+VqLq2s73vU4Sj13Z9fXBoP8nobNJdkR9MfNtEQ+qekqbwJ0cMQHQ3IBLMFjTf1oK5hkm8XKeEhl2THxtGbINPy8fbaVWZ4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDOA4MOgbkGaQp4CjBpSqVowgM0NIlPJo+3ddVbh308=;
 b=uumUma/ScTTJinWvUDiLf9TCdDDuXu7JluC423GyHj/ME2CN1fnuURWusmP/p/4U+T7pbi1YYT2zT3VtFYQdV9hLnxp2lq5/kgJrDyWSCQgcZ2yEP2vt9IMjq7lwo8uqvMSfm30D4F83+6Jul9GEYASllyefa/0eTBr69GkuwzJnmsWQSGfeAfROufPA2wRJ41Rg876DPlvi/8dCIQJTpyPyFwfBoKKyWwke20o3W+dTjBLozvRzH25GrlKGsaczQyBvKrHR6mYQYwFM49YQ72ehRi+e7Ucy9ewXopXvr3mV09Vlmz4I8j9w1MyAGy4bQZ4sv+iJKy6ghf1MDbSf0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDOA4MOgbkGaQp4CjBpSqVowgM0NIlPJo+3ddVbh308=;
 b=ZjyhcUBSo5lBI0m+S2fWWN5wkzPSDTjy4S0e0EWVqDzcxxGh2J3PEcVVIewr3//NFCHoLGuebB1VYiSiY8uhRqygqb+N4llkujxPz0vHWT0CxtzDkfp3ANr50N3itKAN+ILNptzYQw5iSr2VZQy8dRB0gHOLew5HlbeAEvQzIbw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA3PR12MB7860.namprd12.prod.outlook.com (2603:10b6:806:307::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 23:11:24 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8377.009; Tue, 21 Jan 2025
 23:11:23 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] usb: dwc3: Document nostream_work
Thread-Topic: [PATCH] usb: dwc3: Document nostream_work
Thread-Index: AQHbbFnKSTmFLbOSr0GRysnCjSt1zA==
Date: Tue, 21 Jan 2025 23:11:23 +0000
Message-ID:
 <7cdeaa346d24907712aac533c1c5f90a03151189.1737500936.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA3PR12MB7860:EE_
x-ms-office365-filtering-correlation-id: 72af7ea1-d736-49ac-e74e-08dd3a70ecb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4cplGtUUtbRoAxUHi/GkhM3KLKGH3NRckOKzIbZjX7hCWeSWBf3Lnm9+mz?=
 =?iso-8859-1?Q?QdL13UkC3nUWzRIjYmhIC92iVacvWQT/bF6Pmi8WqYi/2zQNzgBTkHHA3J?=
 =?iso-8859-1?Q?+x6Pog+kYkwSmKoximNm3oJVCwZy7nRfl5fro+MEWf2W9PtE4n76Y9U7GX?=
 =?iso-8859-1?Q?O7ul4pBw3sQfqmW61hETQbgMv+2jwW9s0LvqtrqvLRZpHYqv6X5kBzlU0z?=
 =?iso-8859-1?Q?5aF2Xcl1igmUUjztTr4WeCRzYt712xzytjpnTHcT/L7RFZr8mKx69vCl4P?=
 =?iso-8859-1?Q?4nGmh8g+WWbJRWRHeqe3MH0XN4iOo1VkZYe2ldT9yp8pWI5xJGFH7eVc9E?=
 =?iso-8859-1?Q?5Gz/fbLKC7mve6YHopeSMUNH700B6sa5nvuZLe4pn7xwF3F7C9encWPtsV?=
 =?iso-8859-1?Q?u6lsmPKgyHEDHLNUJxlx3BMZiBPHZwGl1hUhldJg/harOTSHhSQgumHUse?=
 =?iso-8859-1?Q?WTRdEHPz5w36gukbVK98qgKHkD5fd0rwme++Kv7DlZpvXQubVoX6opQtfm?=
 =?iso-8859-1?Q?JyJrpzW6Mnp73NwAVmRPUqciSR1NUFhkU4/4AHrN9MTbnIO81Cz5cPIs64?=
 =?iso-8859-1?Q?Mv+coNfPz4s6rYCr+LiBeUzF8qdYZR/gzqr/2eBDcvKIuck0JAlOcG7JOE?=
 =?iso-8859-1?Q?JJcsg8BG03iF7LR2PnPhENjWvnRlpQ6D6fMEfBU9XmyYvgXx7Fami58vsV?=
 =?iso-8859-1?Q?VlDRggBBvnpBaBZUYhKjT02FpQtrnRMg3UrXoK4vbUmjDZq7V346ZIPdiA?=
 =?iso-8859-1?Q?woZCHQ8zSbcy+UgoKfMwotx4D6PYEpVV5F8Yutx7SSHNvSfuyivPMEVL0c?=
 =?iso-8859-1?Q?8yq4xShqzdex9FWYqIO73PqY+tx/xg7gsCuAdPbUh1t2fTNE7Huh0+fqXo?=
 =?iso-8859-1?Q?9YCSlQIcHAFmwwK/ZAVsNeynIy4ofEK1RSY4rUVZ1F5Xx+nKZeX0+udncX?=
 =?iso-8859-1?Q?dXG35UynkYC7O3hT72g1kzwj0lQ3wmidTJoq5Qn1i7hoP4s/o3jlZsGHlj?=
 =?iso-8859-1?Q?+0zyIFynyQNAfTpUK3k7NTAloFyq2VCypTYgvk8/lyhdoxhjly2plC4+U9?=
 =?iso-8859-1?Q?H9cGWcuLPyt48DEFUo/YuGDQQvW+TAFmJ/+39969AM4vy0X5HPx+gr2++C?=
 =?iso-8859-1?Q?M+YtzMI34XHfQHHzkNt8DuiokOJcT54zo124v8gNJhOSQvzrNjaPXYIgtW?=
 =?iso-8859-1?Q?znOBYLDnirqCzIoRFi0acMBoAPd0H/8fSf5O26YDGN+ytC7vg5+W5b5H74?=
 =?iso-8859-1?Q?jomi0E/a3gYBmaIqP1+R22dkwG3/l305DI48cKXYtN8b7jHU3tVZe+8jhK?=
 =?iso-8859-1?Q?AntJHQhI5D5GV7z+ILP4ECfFthKW00bXpWNZiWvb4EwTiAGs1UAfmiprYu?=
 =?iso-8859-1?Q?aecuyq+uqpeLp06OWppjFr37loouH975H+4pOtnGcYdfou0lYNZvVMYz1y?=
 =?iso-8859-1?Q?M9G0Ccml1TYIwKoLgZM4qV9xV+2Ba9pUKMkXOkNA9/AGn+O0ISjn7H0F9n?=
 =?iso-8859-1?Q?BJyyfhCLSdByf7O3BG6fuf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5xv1f3UaYC/AW0xLm5RQxGGWALG62VxQfGK6DgNfjS7J5ZWKvKK2oCSCZd?=
 =?iso-8859-1?Q?X3xNiI0K0kd0HLlQ5Ey0CS4PxKIeMrEWgwwCtGY6D3iGBaFc2YEVcXGtay?=
 =?iso-8859-1?Q?8XLzRLfDpAa7y7XxJtVfdxywRKw5oeCW5QUU/9v9B1n/3SHkyMjZxgZpR2?=
 =?iso-8859-1?Q?vSUgNxWM4T7flTQB4KtaGjZREXQm5HeQaZyRo50uQy/7QMtYuzUSNiHwfu?=
 =?iso-8859-1?Q?CNjuYwJyoAcsoPAxjP2ITooUsaGZWzf/vWaf1h9AEFhoq8b44WkCrYF8Vs?=
 =?iso-8859-1?Q?+FGrUVf1TWxT+Tc8EBI4sUvfRXKvPjo3mKDLuf51bwUSSrAA+G4Eb8fEJs?=
 =?iso-8859-1?Q?dzd7va1lSa0gPKAlp8w9P40jL7/BVWaGiCo3qvJBaC5J10hjGaCHXCCio9?=
 =?iso-8859-1?Q?NIU6YNK8ZZk2fWJ7ZtwwFuhcUDAXQtp66b2QHwbzr+VjwIpqZSSiWF8YrW?=
 =?iso-8859-1?Q?GbGSmcI4WQNfKTP2+yV42/49EIZoIIPgESIwq5WSbvPeivlfT4Ph77uTqC?=
 =?iso-8859-1?Q?sZA0z25l9B4iMdESGRNYQOkVL0uUW3pCYZZ12etpMM0936NG3SNSKFJ4dw?=
 =?iso-8859-1?Q?jIqlcXq3B27SMop+mOaHMnjWmxfQDtN99FH2g6xGTGP3RxrZij9mujARQl?=
 =?iso-8859-1?Q?LejXx0tCaTkRl+dk8BPm2gC8bvQZ6k5kfpWwiBE9u/3IA+xWAnIxyFLKtc?=
 =?iso-8859-1?Q?TtVjkaGb4kKq89Vp6Vo1T6OaNfPOF5YnLk6U8jbk5/9uiOykRdXtzSI3Az?=
 =?iso-8859-1?Q?m701Gmn4ru1VERbGfJ5R76BaTtok1/zlBF91+HhDeUYRORvSxKCCGXi1VY?=
 =?iso-8859-1?Q?RztjtoxbchPwwpGeyTP3dH5Y2ePwjjHqV8St4jLtQWAKEvOFNYBbgAEbXP?=
 =?iso-8859-1?Q?81VNlww170AGH0sG3e70x6hWPVM4Dj808JuUQRacQpV/yDYfq9lP3fBBYt?=
 =?iso-8859-1?Q?u1VDP0k6RjPOEJzSLvYkJYEnwjsuncJpvrA03IIZ0bjrRpSEUUkuTF06+n?=
 =?iso-8859-1?Q?6Vn8Fvz0sn8cIOiyi9Za3O8gXHow/U99Ns09qBa8apvMoSHwndrBZ+fz/M?=
 =?iso-8859-1?Q?b5JB2ERVYcfns0PWmhQUPTXSt3oNSjYg3ZpKv8yaMrLxHfTYoRiJdBzS7Z?=
 =?iso-8859-1?Q?XBECwf9PgyTxfExFYvBakZJp76BZ9iXaU3kzNaB+ZQp8QLzlNdGFE/Yh57?=
 =?iso-8859-1?Q?09+9AXd36u2Ew2OMTvGfO77qBJJ82ruO2j16naA7jI74R+b/k/5OpLMoTe?=
 =?iso-8859-1?Q?SgL82qn8IvKTU1OEhHTJnseeqFjQYHvhOsGb0I8D/PICvUPP3xu/m1LDqg?=
 =?iso-8859-1?Q?h7wSkVFr53RvpE27YKT2/CQpV50u35RUD0g1EJ4VdBdDk6eWbKZ2x9IaCH?=
 =?iso-8859-1?Q?frFPFr6xWCoRVsMZHByOmxokJbNJGOAqbWoyTHLkDbDX+Hfy2j/4Rx5vGB?=
 =?iso-8859-1?Q?iYfoRIb6C+k3yQEyn+y0/gb4nYwryeb7lXvNv93N882m9gogAztCM303Z/?=
 =?iso-8859-1?Q?RfpXfafaVTOXUNrG/GUZSC8AkHC5G71BcLH/I3PHmS3HcIiTG6zZngj6Qb?=
 =?iso-8859-1?Q?qQXjirakwgJ5wUrQi+qHhhcayJtJysHNhNUSgurcS9DputZfG8YDUcS2bO?=
 =?iso-8859-1?Q?FwYhf617duwzD6poI0q3uKpaSuyURbd2a5?=
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
	L60WfPzL7wmArmuJO3y1cPAu6Myp+MGExr19ybL/XRfwLpIuCoXwhrvjYZfXnKvS8pu78Eehpg1qLctmF6fYzD3X1Th6htozuYeX7OzjEGhl3giIVu18kZQpLU7O6/Mw398gehyGdhTxg8G2iXmq+93m5gRZckqU7/CgtT8bNGenhfGIzabQewHCD5pi/Sh2D3fEvunwoYZYnc7SW1Gvp321g/ozq5gxU/nyU21EL53a7NEjTH57WXj6NnF0SDRbzd3Edd5Iyyyrx/idhloPCtCvBBwVugcjrG51Cz+fXfYrS5J0eBjsj/NaskGFO6JX8+vJxrC3185fQIldiABHw+rUcHxpsJ10AO+aFS4OXTKxY/k0eaQ0k28l1UAptkqsKacfnGl2aubHzdO+GRTbZTASPGix3IqNgTd6evwF/8vURaqWlbjr7ioOtmFqta3bMeW0M2CUn8FtYtHWMR+pWNtDCUhbaAeG8+km30zRJMrEAb3XDoB9OJ4BhEhDfdBtvs6yqLYYzZ4rHhZYIewm84DkpuelkFG1eclsfvKGed1yy2MAv2Ksakd5jFLzVO3nMdTvKL/eY70uNB38QD4hVbk5BA5NUPv1nElGmXSoeAhS3AdeHtHHdjU7XjmnLApb5pQsxUUCUrOPKVrN6QpzRA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72af7ea1-d736-49ac-e74e-08dd3a70ecb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 23:11:23.7850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ya6eG5mwXYx/c2VwPsuYr5FdzTgkDWsdRCGWjd/TYuf6YKkzRp1XFrib/1IR7L2I90wUdpbtjpas4fj8qWiHJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7860
X-Proofpoint-GUID: LZdOYst0IXAyoFPexHDrJF1b7GgCL-qv
X-Proofpoint-ORIG-GUID: LZdOYst0IXAyoFPexHDrJF1b7GgCL-qv
X-Authority-Analysis: v=2.4 cv=PewFhjhd c=1 sm=1 tr=0 ts=679029a2 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=jIQo8A4GAAAA:8 a=wkbaRhw7rSV6RoIMuokA:9 a=wPNLvfGTeEIA:10 a=MP9ZtiD8KjrkvI0BhSjB:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_09,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501210184

Add missing description to the nostream_work of dwc3_ep. The work is
used by bulk multi-stream endpoints for a NoStream event to reinitiate
the stream if needed.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20250120182219.30dcb3c6@canb.auu=
g.org.au/
Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ac7c730f81ac..c955039bb4f6 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -717,6 +717,7 @@ struct dwc3_event_buffer {
 /**
  * struct dwc3_ep - device side endpoint representation
  * @endpoint: usb endpoint
+ * @nostream_work: work for handling bulk NoStream
  * @cancelled_list: list of cancelled requests for this endpoint
  * @pending_list: list of pending requests for this endpoint
  * @started_list: list of started requests on this endpoint

base-commit: 70cd0576aa39c55aabd227851cba0c601e811fb6
--=20
2.28.0

