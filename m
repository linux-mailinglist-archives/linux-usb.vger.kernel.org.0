Return-Path: <linux-usb+bounces-18348-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED09EC0DA
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C962D282368
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AAF179BD;
	Wed, 11 Dec 2024 00:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rCsXjnZu";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jOsArcvr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="seWfI2Rp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBEAC139
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877218; cv=fail; b=khlM3os70KH/J8T0vF8oUC50xItJ/Q2y5eYJ7uErL8UDT1VulpBRPA3JqSD5oX0vqaFgc8xUrJE3lb3Qsz802YizHzvH8AjKWmnjRdg58wauVW9s5kll35zmiy453TgYL8VJzusubrHuZ6zDSU7nJc5nFFwucfOYUp2zK4PVvUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877218; c=relaxed/simple;
	bh=y7y7QB1rITiY4DXIYn75hrsMrqjzEQdIW74GQnWuxmI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H6Efw0IqqNY+deqvWMs5gxGd6BdmfNVDBki6yW1lwmWU8WLGQprYz0JJzW0TDVa1TaEzxRAzHcyQO7c7UjBIhH8xW2aiSFWhF2Md+Yy7pMuBgoSt9BucCPaj2tRwhLjhwSaAv2iGwSGmrdJU3IzTefSNXr+mZ5rkYo0RjMuYgko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rCsXjnZu; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jOsArcvr; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=seWfI2Rp reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAM2iuN017236;
	Tue, 10 Dec 2024 16:33:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=aGwvPBaOH/6OD4a8rbBiEzhkTgAJBc/m5xQmq11EMMI=; b=rCsXjnZu44nW
	TrWABh/4otCi7m3j/nzlQZ4aZth/I03dJ1iiA9fvrQGYsGOIMhiMBE2/84IpP2ho
	z4XuS7c2fPy++DRp+x4RUgwU7Czv8y+qSiD7MB2pbFRN933yzRCuvjvz4C8rW3Kt
	hR1zsn+8b25aOPwpE+P3z+NOol7wDyz7z0Wdb64Hi5VREmS83h029YEgG7IxFbVI
	t9C1uNw/1qCWVjev5OrtMBdqbeMLRwlzHIVS3mAU/uZ5e7Ws65PjulHc9D80rnCK
	i0qziiqsXbIJIi/TxQhP1leAu6qK4WkvyoRdV8Lnar7fOc2jTspQovrzIRPWfZ2N
	8SCyGzBSSQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cp60t14b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877211; bh=y7y7QB1rITiY4DXIYn75hrsMrqjzEQdIW74GQnWuxmI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jOsArcvrdIV3b04A+/Rqqy4+abAnb6gXEppuKaMfmUyBLnbq0+Cnu3Kzy/1ip+5qd
	 fal29U0r98FX4U5QRbmWoSsahT8ZrJU1KwYXEa2IVHdS5sY8BUtSzrsxUSthBNGSKe
	 LJm/HakXuSIFfv9noXumMj40yeTwRIslA9zBxFtutNGS/Y12Tp3VcxanlzodYojk4o
	 TA8diUbqmL0VWc5OPWvlCJsmmQKQ9PbOVk8pXaDsQ4BcgVqweoX6atwg3Lf/giS4KT
	 FZKP2KFLU+LBdp8zAU04uymdfWIOEtNYeCKl42snVgCuWPSn99r7LTHN3dH5Ltz52r
	 svVkmXm56aZeA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E2A4540593;
	Wed, 11 Dec 2024 00:33:31 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A9605A007E;
	Wed, 11 Dec 2024 00:33:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=seWfI2Rp;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6DCD8405EA;
	Wed, 11 Dec 2024 00:33:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4WDFb83leLkwMyU+IOk7pCKTA7Tc9fYx8pFnrLYIg4wZg0aupqmCNzl67RJpq23WFQWPuP75W2EJSGlomO6IQURCO3CjVFARqecLZ1Oc+HLfPhPdNO+opo7lM/UNOghfke8dk9BpiieuSAVBzbJwTNuhwDU9B0TP6aieicg1q6XLxDurjYmSd5TXMYLXl65fz8moidCUy1RxE/SqNY4ODZR/ekE9CbYFIm/2jdnmXROPnOwsD5HOVEN3Vj0xgkt+yfiyoHrcs+YV6y/E5p8gtXtuVlT0gw6Iu7+GmNMPJZMs+O/Cck6zuz4tM/K82hgZu/LDibV8A5jA3CZoIjrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aGwvPBaOH/6OD4a8rbBiEzhkTgAJBc/m5xQmq11EMMI=;
 b=YBZov54U1yOvxHGGGex0Sfe4ah86oFTdE3kwP/qFva00SpTrvjBy3uPdSYSVG1d+V7NKLdbkAi9npi4ETjdZPm1H6QpXuBVtWQcwQiBKGyRwBCQimx1hwi7LHSQa323ObFcz8oenR1PF/1FSttKvh/tnk8hwVKTP+WXt++ecRVbaSbjAaBDYw4UG7CWQKa9n12v3UvU5oXmsz7Bt+sLlNq7JEiC+Mav+GeCjgp0zeL7fPraxVAwyjMsnR6eyJvsFf3Er3syWm6fud+7BQaGTdRo2fqGnart62Q9SrFRYSO1dFTgR2ikxqGGxnDnygFg/sWw5AtHSeapXDv+VBl/SfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aGwvPBaOH/6OD4a8rbBiEzhkTgAJBc/m5xQmq11EMMI=;
 b=seWfI2RpAu+DUZt02SAO01R4xZh7ZYnVwkiqvRCvde9T+D17Wc4jJXoGIP+o141N1m/A22hz/Ur5oXpLk7szvFLKjocCjieoOG1c1Bz39d1uqdkKADYnM0rQoT+mddOunGAtisNIQCpdGDdyA2r8WV/5DulKnydZ5GsQs3Ac1Xc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:33:28 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:33:25 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 19/28] usb: gadget: f_tcm: Cleanup requests on ep disable
Thread-Topic: [PATCH v3 19/28] usb: gadget: f_tcm: Cleanup requests on ep
 disable
Thread-Index: AQHbS2RK1ZO5JAmPM0+HF0TtLo5Sfg==
Date: Wed, 11 Dec 2024 00:33:25 +0000
Message-ID:
 <6c4ae2b4c2a9037bdcb6f909e173a94b11f04657.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 2862dc05-ea59-481b-13cd-08dd197b6d02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?wEN5m6FHbAFIqmAmEjlHPnnD/LIFIC/UfttrDFHvOH4CfL8Sm3kWAsDGMK?=
 =?iso-8859-1?Q?jt9WNBChaDI7HXl6cYV/YdF3pQElOHTx0td9fWlXnxwly77O0z833O/0aq?=
 =?iso-8859-1?Q?1Kn5uevehf31bqZsy9hCsK+QKtxH+73CBjHoEfxPibvSMU8OstVJikSycO?=
 =?iso-8859-1?Q?3dT+AyN5JB1iCD7b2v+5OI4E/6X57ocJ+fNGDv7bc+7uNeqCHPiLbD3Rkk?=
 =?iso-8859-1?Q?6YqXl5QPvWVEV8zr+cChswVL6LXv2fg6nPxrWTe3q2fbGb9GsOlyS8dIFO?=
 =?iso-8859-1?Q?vxrn5VQ2h45HVhCwixmH2MY3e1tH2POWaB4igpVfK5aMpO/1PHTT2WhSWd?=
 =?iso-8859-1?Q?CNtMmLDsHtp26Orz8PutqDPaXZUNP3fqz4ZGXCD5nbn5fJyJ1BeDxNLUEb?=
 =?iso-8859-1?Q?mn2YuXGpzftFvlCirvod0QbcWBQpb3KP6OIPzq3JI7ilqoFwTqFPIeveJl?=
 =?iso-8859-1?Q?0ZGMtZ+VZQ92t9LmGqijolvrTEcDqscgv93mRUQhHT2Hvz5NTt34XE/qNk?=
 =?iso-8859-1?Q?flsoCyDn4OSpZ4df/2N0jj+z3SyvXsHI15X9NQs9j9B4FwiY2i1ieqhAkA?=
 =?iso-8859-1?Q?Gy2pQeum3L3Lt2W5Ogjk7j2E6b0gtGwRbN5e/tFjCQhNoirUuHqUz26Xx3?=
 =?iso-8859-1?Q?xoQcbGcYzDUmbfZA9gwGJvIu8SOMgSHcOo8CtKfl1wW0Y2SEHMrsWttz6I?=
 =?iso-8859-1?Q?VnHnrE+jjllcYg6B853FGX81npketHm0d4nqFpbUvXb4g3V92KyvI0OVGb?=
 =?iso-8859-1?Q?hqdSfqVbTdzv3NXrXr/TfthpivvFRZMmB86rbFLi7O06f/EcUULxTpv5qN?=
 =?iso-8859-1?Q?BEynWP9o1YsyZcKVCcRFIHVq4CEuU09vk1KLDuZLWwb1LtUmpgA8D93CAc?=
 =?iso-8859-1?Q?LUmXi9SuAz8R+BilwmcyrPHdJh6MuII3GQWUhY9Q4g/yGNa2hVmAb6eVfZ?=
 =?iso-8859-1?Q?gun/AupfXrqrS24S8jWRRz8cX9ruka8+t8iCsx24HLAAv2byxtI1lTQh8v?=
 =?iso-8859-1?Q?77gjXJu5R8E8eQY3gnEGIVm335kcjhd3//9Rhpu9L+7FF4G1GW9eU+fq+K?=
 =?iso-8859-1?Q?xbHj9vy0IGI6vJNt2v2hK2X46khh5CqRsJI/6VtPirBRW9tnl27FaAwXLL?=
 =?iso-8859-1?Q?+zt9bQKEFANqd44GAMtwY85yWfQCH1RWiYVdvuj/+ea6sw5GoiFI+6BExR?=
 =?iso-8859-1?Q?3UxEhpmIr4Pebp5Aay4Qzza7Ux4RHSNVJTp/ASn65ZFZu/1yzgrfXsgdvn?=
 =?iso-8859-1?Q?veZBcBXZSbTdd0qsVB/uhO8LIuTOm48B7XsZ7MG6McKw0xAhAdOeK3uNQD?=
 =?iso-8859-1?Q?wjVg3cVWWEPXhnY4/9pafsxsPAF0xGIaGfYBIJrN4T1ijU+hj4eZQmIMx7?=
 =?iso-8859-1?Q?kP3GuXfJjYgg1/zexF7ErvGtKRcwa5BhTFC9VysNnxhf7UlxovFYyu/091?=
 =?iso-8859-1?Q?J4lPnosvjbg0QTEfFkSr7D58mWb9aRUBrLyFPQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gy1skcHAvRKB/L6avnZ2tzUSnHVM2SRGH4NcS1nk8wuKPg5RACLBSg2lU/?=
 =?iso-8859-1?Q?ryBnR+1VQ9i8eUk+zGzb7+Z1v6dqaWooATWUfzrDmUBBuvESV715ObC0Ns?=
 =?iso-8859-1?Q?Sx1/yoiuJ/8AcHD5et8dhXSOYil+XulnAF2Almy8hRz1m54+QoiN0AZK7d?=
 =?iso-8859-1?Q?Sij0rfuhRZF0rMqeQ/0L9uo9nShUgrQO9wXI7zqZ/qsccIbtt/4KoW83hq?=
 =?iso-8859-1?Q?XPXvCStTRjU4pB9DrytfsDyrUaPxtySsrKdCekb1WNS5FNStZ/9TQg3d7L?=
 =?iso-8859-1?Q?XZJAjdrx/z/z7VZtS/LDPzk/46y5/i0wGhhf0BDPUzp6Ob8jCxqKOtCjKu?=
 =?iso-8859-1?Q?gTNpMEC9X56Q9n7VfgL4cnbD4JWOGo44/wFU9dmxGonguO0heZZJfqrzSi?=
 =?iso-8859-1?Q?GMuJ3m7zqCZ/gGloMlqfjW+C4o+TbHJdFv4tfpHoiRdkv731Uk6ygBh2iw?=
 =?iso-8859-1?Q?mftIJcA11eoenARLaVDfuOPpTx7R+uXgqbgIT0iWpAMU4J6NH6WLjMBgYF?=
 =?iso-8859-1?Q?a3NgLasILTFB8uEajXeTibp3SKanM71rVfWvHYe7sVJYf8QbI9cTwT6j0D?=
 =?iso-8859-1?Q?qp3zGEvYhr1m9yuQKV/Tulv514A4pHQ7k/BMrcC9xwPoIaNzHGH6j4fu2c?=
 =?iso-8859-1?Q?C9jP6b2TSjtm4jlE26hQ1FXZrhF8zHAG73hm3OTMElVwAvEhbJSm7flfhO?=
 =?iso-8859-1?Q?YTzADsCC2kzI1bFRlQZf2KuzpCjzAy4khrsxBRxg3mdQDlZa3EEyeyWUY/?=
 =?iso-8859-1?Q?3XluAlnKUAeJFVw3aSbtz3LKETG2I87NtyvkVd7DQtrs6d45UV3qzNLoEf?=
 =?iso-8859-1?Q?LYjSD35u4KkwZ0ogD4hepQEgZ4a/FO1v8J88zkoIeT1YaR72SQKEYaLwHX?=
 =?iso-8859-1?Q?VBN8oSLzRrU4r5YcMvrXaMkQEPZUanOBLkPcXc7Hb+0vLH/kqyTlKU7BJP?=
 =?iso-8859-1?Q?vubLIFzcAWNyFnA1lsuD/tE5xotIxyBDlBOXQraFCh7nMlGVi9xs5R6mhx?=
 =?iso-8859-1?Q?VxZ86TteoINXu8Zn5RdqViAiMcj+f8ZdFJxIp8bvQvU6bNbnMgh3tOsmBq?=
 =?iso-8859-1?Q?jZ3HS1aSAurCQgNbyT+BQ3ZHhHQLIqDbvlDM2QdmiE/b2ebmr67kaibkFp?=
 =?iso-8859-1?Q?psWYghi7U6RIcVoABCaXXtpIW3nHqcr3mqlvRG5o32h+z1/mibrU+I131a?=
 =?iso-8859-1?Q?Z6NreyCQ/SpDzrMNvpfQ0tpJtXhKXWDeTc17GvRSBKB28w7Bxy11ZaUqXg?=
 =?iso-8859-1?Q?EWR6FaS9R92zw+Gq8XRQSm9orr9BOXW/o1NJgyUo5dcVSNuCfIIZQbjhy4?=
 =?iso-8859-1?Q?vI5zwzAZzwAxiXO0qL0KRCRu8Yu4+RqeO1NnkPagMlqOUldpG3Y6WSkI8Z?=
 =?iso-8859-1?Q?kEHpHbqu9lJn8lkcAzLPjPXNGTGV4YKEIxmjpdxmNbpZQwiwNNNb34SBwv?=
 =?iso-8859-1?Q?SEJqa5UIFSTO0tfAy0ZSeKOqGuiP8VzLlSK3jVBexPxe4XKLOtUfeSH6N7?=
 =?iso-8859-1?Q?3MN3BzEnrlI/tbyJu6uB932z98Q55TbDf5CXY8DahzdGDampXXl68Uz3en?=
 =?iso-8859-1?Q?PWgG48BQLdXvpsIT4RFJEIDJRKPp1SaC9Z/YssQMAxafaM+/XuHLdjRec0?=
 =?iso-8859-1?Q?vN7k4u64iCci7/n918mTlOJ3WpZDoV2n3sng6qqkDcUVv40SHnbhiW5Q?=
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
	qeMpwSPzVydZnaMhMTpyAXFmOEgNEyIMeKhsL5WJaKC+eV9zsGlQdPNSJ5cZjmC/DIlXUqtVvSK/2TXykSeKwVWQFiENsXWANSQD97ROXk7MV2CqvfxzE0QYnzVyprUF6uCXzz9AU6sW63JvAOF20HKB7nKvKSl+DIu3Si26hFWFQTxJhmkUdDgvC8UN09vekBJp0xZCosVcgqbkhn/jUJz0S33y43iZtO1pvLcoa7RbRBv1Jh1dCMV3yoLVHbfhjoZP5T3A9P1S+8R1L+NmrwzI8FCxnrm59rawj+CxYLEc2eafNUojc5j1nx5pUdVhrWHbpJm9HnV9MMFaHQs6VYRgnt+rLSBBdDycBpEr6ixzxt2TxLNNotDgsjAVC8NWBsi6EXa2Hahto6oCTgPn7Z4wTDIFVNcliWBimwGppY+C8EG6GsOjQuTgr84ECRH0/9M7EOpOtu8qB8BmwlY+yOxvC0lUgFi2PPqDWPu1x3o9QTsYQBs6IiHuCez+oIW9CbwjDute4D9pN6/Q2MzQDFW76b8wRjdV7/uD2t53KOFi7MJEWBW6/J23Q4075aDmJHrFkX/iLo8Pkp/pqz+CESxQ/O7w8xVrqx3+O7qihgpQbhHpprCx8wCe/Acpdvk/yBpPNCX7uHTMj607l+TF/Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2862dc05-ea59-481b-13cd-08dd197b6d02
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:33:25.6801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C1FfWST2DDAVCeJKv0iB5F9+Gc2d5NtfFRsFi5soWp6v8Ka+84ejc+aj+A/usJMgowTahx+QACFaXhoblwxFzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=Z9YWHGRA c=1 sm=1 tr=0 ts=6758dddc cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=WyihgUM6s8U50gmrnj8A:9 a=wPNLvfGTeEIA:10 a=kq0wLEfKOPNe3D03ryCD:22 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: bbkzY-ts4-Kk5vAPh9W4FDR5IzXhhzmE
X-Proofpoint-GUID: bbkzY-ts4-Kk5vAPh9W4FDR5IzXhhzmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

There may be different reasons for the transfer to be cancelled. Don't
blindly free the command without checking its status. We may still need
to properly respond to cancelled command. Check and only free the
command on endpoint disable.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index 2a74414c7fd1..8a5aa58e166e 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -196,6 +196,11 @@ static void bot_read_compl(struct usb_ep *ep, struct u=
sb_request *req)
 	if (req->status < 0)
 		pr_err("ERR %s(%d)\n", __func__, __LINE__);
=20
+	if (req->status =3D=3D -ESHUTDOWN) {
+		transport_generic_free_cmd(&cmd->se_cmd, 0);
+		return;
+	}
+
 	bot_send_status(cmd, true);
 }
=20
@@ -550,7 +555,7 @@ static void uasp_status_data_cmpl(struct usb_ep *ep, st=
ruct usb_request *req)
 	struct uas_stream *stream =3D &fu->stream[cmd->se_cmd.map_tag];
 	int ret;
=20
-	if (req->status < 0)
+	if (req->status =3D=3D -ESHUTDOWN)
 		goto cleanup;
=20
 	switch (cmd->state) {
@@ -915,7 +920,13 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, st=
ruct usb_request *req)
=20
 	cmd->state =3D UASP_QUEUE_COMMAND;
=20
-	if (req->status < 0) {
+	if (req->status =3D=3D -ESHUTDOWN) {
+		target_put_sess_cmd(se_cmd);
+		transport_generic_free_cmd(&cmd->se_cmd, 0);
+		return;
+	}
+
+	if (req->status) {
 		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
 		goto cleanup;
 	}
--=20
2.28.0

