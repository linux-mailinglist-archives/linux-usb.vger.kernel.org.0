Return-Path: <linux-usb+bounces-37432-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEouD74mBWq3SwIAu9opvQ
	(envelope-from <linux-usb+bounces-37432-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 03:34:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3937D53CBD2
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 03:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B2C63013AB8
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 01:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C271631DDBB;
	Thu, 14 May 2026 01:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mAMDunnL";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="PAAiWQzq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OzR5LXvx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC4931A053;
	Thu, 14 May 2026 01:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722488; cv=fail; b=YUH7Um9pH87++2T1+mZ4r7Mq3fl7yOJ0QGHWVmko1/vGZixpkHbHTGjLVfimzRPlQ9HBQFQJE5Jjh6BPLgAAUCEd1l6iEtEwtvZE7ge1sXz3errhg6wUYLzn++VdCipqWsDgtlUi6relVeaP1fezsLkr2FJP+iNWHZ5vPEqnccI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722488; c=relaxed/simple;
	bh=eGWByB/X/ucRHRIDeX+eUjf3V0+yRGV5LzbkGn/2VBs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IHvBZ68TOeMBieBqEmYDTpzbisXG7fnO9ADoY/fqeae/+Glygt+rFF9xNNiuf/4v7hNqfKDXVbZaE9aKGG86m1j0V+B766s/qbJ/t6Kk4lrvx8iMPgULxLV7sh80S+YbXogx1yzBHZh10EkoXKatgBLa74VQpst6czCMQhq7xFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mAMDunnL; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=PAAiWQzq; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OzR5LXvx reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DLZ39q2853317;
	Wed, 13 May 2026 18:34:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=eGWByB/X/ucRHRIDeX+eUjf3V0+yRGV5LzbkGn/2VBs=; b=
	mAMDunnL7aow1pkVItIQlUV+3mKroFU6FPgWDoQN+y78Xk6VWP+8FLmJquKYqYlS
	i0mxmYJjyNZJ2+7t8EnrPty59tScE5bXtUKKg76gx7Bz2v6FbQEgTL5cVCgFiTAs
	JsPdR2zYAwD0LQnUazJEXnfn22PQXuyFQCPYQiUc2YSrChcFs6GO44jiVFhHWY4I
	WD5L00P5ECb+hUbTAyXhYzQ4TvnzRMvg9MYWWbnq+6/QwJ/uJWqPRzmB4LTNoSRV
	JuyX6V3QrtVSuKNOdVymcCtYsZic7ktvFdJt+KTTlgH9bG/6GXJ251BssnJd+Inc
	MNm46uANxtvqUcIDHPHnnA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4e4wbkthk3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 18:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1778722463; bh=eGWByB/X/ucRHRIDeX+eUjf3V0+yRGV5LzbkGn/2VBs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=PAAiWQzqpdMqO2QzCp10A6yoFoZS9bF4tWFNCsXuwKwtyznHVz2ugRPMOKxaMUKsV
	 151Ur2JqHXM0gpno9SDvqSw5DYzwgZ4SyfiaGlORmmcVkecZZKuInHleUiUi38u3CS
	 nXs+9uG77UQj7eGs1qg8U4u9qtkH0riKah/V71o3UfF4jdJT0Bw1/2ryGDgCIgaplp
	 7N5/FNQM3keCBRYGQFNUSMqdyVhQem8o9+ta46itbDb76MJCmjHdA/lLibpufdPNbA
	 Li3rTDv8URA+ujjQnLDdBERz4cVvsFM1d0HOuU/OAn8UVkf9/MV/HvO6py2yZ8pgXN
	 N2oPZAP3zLnSw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1127040357;
	Thu, 14 May 2026 01:34:22 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 8EC76A006D;
	Thu, 14 May 2026 01:34:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OzR5LXvx;
	dkim-atps=neutral
Received: from BYAPR08CU003.outbound.protection.outlook.com (mail-byapr08cu00302.outbound.protection.outlook.com [40.93.1.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0DD6540298;
	Thu, 14 May 2026 01:34:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHnLcluFC78N9W9kN+Pcfy38GKAI6t07E4uStqnIis5ArjGpHKpvW90RrCCCXqryYoRkQm5lKTwwlkoSXsvKGJa7AOtVpzJdONp3/rSpWQtKsN/1Xld0qy8qMe3aEbaYbdsiDXdzRZBPR9/A6LMHoOR7SmWm6Uj3FH7i7415gfvzO5gKHqRX+fWhMgyu16UEEQBu+gurY2XuhbxW42gvQLAbzl0YQtcr0MqL/Qe8axcUL7oyRFS8tojXE9XcaxVwbspWcgZhEsqv47pYvFZvvgy+/Zf6P9h87sfMmx7mEtbxHRyJeQcvf8WZ1bhE12UUTLhDS/FTT4mwxJ1dIL70Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGWByB/X/ucRHRIDeX+eUjf3V0+yRGV5LzbkGn/2VBs=;
 b=iG/KlP2lUyvMFo5HeUsQDrmZQu3TnU2BZs+qpCpDa49wFbvIB+a2hH0uCc7lO5ual41y8hJ8UGOcE9GXEYPu4RD6snaRWKKNOvAeGBxOJE5/ZzD2xumwmVoJaF3cLtuMHOBMoBq0aS9IJt3NQnX36N7pUyZlTl4CqFCwlfjYxM2atTgM593cUy/tOTADKJ0bwOCsOWkc7TTpxB8VuNiGNSLOEibxHpP0KaDEEFwacuYWPmuZaIHbWk+0TsMqZ0Q0CXUyMj65L2H6fpa/lAPr1QyIpdXTE9+KaEW0/jvw1EYGq0zNvxczmxWZihgkwWNz/yTiP73KjKmiVA4aU2459Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGWByB/X/ucRHRIDeX+eUjf3V0+yRGV5LzbkGn/2VBs=;
 b=OzR5LXvxBDsCNwtDLcuumfBwNhNWRN0g5b3lG53+LUD9gRuo5HsptQ9ZOAio2tuXkhMIntvXUB1kBsqvO+3kHAUYrT2SxOxculp6MH51YisXXyNjXwk8U4MCdYxoDhYMlsrwNMqzAWsm05sKc+Zsvj5wp2eazbtIYkHCAA986qA=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7564.namprd12.prod.outlook.com (2603:10b6:930:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 01:34:12 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 01:34:11 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "git@amd.com" <git@amd.com>
Subject: Re: [PATCH 2/3] usb: dwc3: xilinx: use reset_control_reset() in
 versal init
Thread-Topic: [PATCH 2/3] usb: dwc3: xilinx: use reset_control_reset() in
 versal init
Thread-Index: AQHc4WB7RBHa6DOuxk6FKzMpQbn6XLYMwJMA
Date: Thu, 14 May 2026 01:34:11 +0000
Message-ID: <agUltzvDFgJtPa6j@vbox>
References: <20260511160814.2904882-1-radhey.shyam.pandey@amd.com>
 <20260511160814.2904882-3-radhey.shyam.pandey@amd.com>
In-Reply-To: <20260511160814.2904882-3-radhey.shyam.pandey@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7564:EE_
x-ms-office365-filtering-correlation-id: 24b25e2d-2353-4f0c-2d9a-08deb158e6bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003|4143699003;
x-microsoft-antispam-message-info:
 vdfpHGrKC3jp6KXc4YBFjRbM3HNZNXMPb7Jm5gj1xv/qMHvfB68SKH8vs/esOHtvKucx3QgiiTQR2NGFHm+28FzzpFStkXsmj1lxmV0sTiDHBeQ7visp5WMfrUy5jPUAa6W1mtG11qPZZO3Vem7cEtIJux22EFNVn0cx92Szf6/V0b6qDHfwuXBbes0722cugPRUpLACLyWN0uUBkWfM2GyoQY3yoRhB4sCK1UrBgytyZbPnY0tTZBi26RvludNdV3ru6AB7OG2PdTpGsGJG8GjWn0j5kqdwqFinrFUd7MCqOj0stuTfylS7i4UfRRDh2EI6NdyOLK7rus26IwuCCr2T2e1DfVqVrKHV+OdZNHn/pjPRFVe2Nzm8Ak0VyMfjvElj6euqjUXcSNWNL03YFUXC+OjgzKSiPzTIH2/CiPt3rcuHtfjoMLhdeCNVNVEB5g60MIzLIOwb+S9tbnhIXx9gJt4gevKGCU2H0uTk86fRb8g1WsIttYBsHuaeL9y+lE7eB+NL0gl8rMgvKSquCoSd/FhF1b911gqKIay5n8ga7z5/9KkDaEIDXs5AMeEpRmDdoYPF+vwmhWxMr4NQNzyXUqp1t/7ALapCKnQ0TCIm1e4CXD+v5EMt4B+aR/n3n0kCPH9ZkzoBdNgSSGfsPm0J76sx+Ly7RneqaYoraKrEDXti93ZjpE710Hu+/6QQZi3dp3wTnwRiz/a62frBTYsoU/Nk6swC/nhC4hWsmVjDICiqQIS0Hf2xeaBi8wM3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnMyZGx2aXNYc2Yvbm02bWdKMmgrNDMzUmF3NUM4bVNrREpvTDNqNnJFcGxt?=
 =?utf-8?B?WnZibS9hbzJpWG1lS2d6RFhJc3R5a0RKV3Vqb1JuVUMwUnU1YWpUTjhNNVZH?=
 =?utf-8?B?VkZSQzJUK2JBV2xSN2hjdXR5ZzNXRkdCZ1RnZFBqeG9lc3pUeVFSK2dZbVZL?=
 =?utf-8?B?Sy9xR3I1MldJRkhIRlIrZC90dFdtZU81ZEhlRzV1andQcUJGcUp5bWg3ZEd0?=
 =?utf-8?B?VTZwSFVzQTZsUlhqUDRucDBJck1TdnEyNXFzQXBpcThJQ0dUeWlwY3dSNmc4?=
 =?utf-8?B?YjRJSllvT3VxZUdiclpGOTFEQlJEaFBWMUtWZDl4dHRnMXNuM2NJaEVPQnEz?=
 =?utf-8?B?b3A3eDhkSDNETWtmQ3Z4aExyOFkxMGMyajgxcFZHNG90SEZ5MUpFUmU4NktV?=
 =?utf-8?B?cldWMWo3bXVQNGlTTmlySG5aZFlqSEZNWngvY2pyK1pjY3NCV0hZSzJzSTM1?=
 =?utf-8?B?L1NlUWMycWpNZ3RaeUNGS2czWWl2cTdKTmtSdVkxQnh6WlFyMWowc3FmbWpJ?=
 =?utf-8?B?aXVSdW0zdjBDMXY5M3lsVEZtTEtQL1QxbkpVdmZkOElNa1BQaGlOOVJJb09S?=
 =?utf-8?B?WEVlUW9DZUpVWjZZdXFEcm9PM2tHbHcrOHpWbkRvWFJrWlQ5NndDZDNyUkNl?=
 =?utf-8?B?bDNjM1FvZVZ3anhBdHhwTCtZaWdvVnFUN0phR21hTnI2ZXdnUDMwaURSNkps?=
 =?utf-8?B?bE8vWElYSXBpd2ZDbm1iZmplQ1U4RVN5b1ZUWGYxZGs1b3JKYU03Wjh1dUlC?=
 =?utf-8?B?WmR6cW1MbFpSc3dXcEJHZGFMZU11cGorTkNqM3ExODdIczdFZldnZUg2L0tW?=
 =?utf-8?B?NXRNQWloNXpIbXVMZy9zZjVEWHZ5eTJWcllZRVRQcm84VjVyUllVU1dQRVNV?=
 =?utf-8?B?MHphMVNoNkk4OWNpT1NibThQRUlrMFhCdHZNMlFDbFdBMWdYdEd5R29BNnlH?=
 =?utf-8?B?MVE1L2JoY2xjMGJPV1RlcS8vUnZqaDNFUFpGaHRWVG1xbkdXWUFTRmVtL0Y0?=
 =?utf-8?B?K0czVmwyRWFhbTRuVC8rNjV0UVFSd0RXK1I1QVM2YTZPMzA0ZlpobS9OLzhX?=
 =?utf-8?B?TmVRc2lsREVFTEk0ek9TVExhR0trNVNXY1UxQkhqL2ttQ0pIT0QrSHFuSDVK?=
 =?utf-8?B?ZGpyQWtlQTNTejdWZEtwQ01yTWpWZHNMU0xFV0RPS2lueXBUcDk3NjAwVy9O?=
 =?utf-8?B?TjVkRzR3UFVTT1E0UldvSFlKZXMyV0QzODcrRDZqTllKbTAxQUorUytJbS9n?=
 =?utf-8?B?WSs5UFJGa0NrdUt2dUkrdi9lUVR6K2lJVmpkUVJHcVZ1azdzakhUUWRvcEEv?=
 =?utf-8?B?WExsenEwdkpoTGkrR2R6K3dZeWVXVEU2ZXpEeXVQTmpSeHA4ZEV4czZRanMw?=
 =?utf-8?B?dFpFbTREcVNwV202UmNCN25ua2pLTlhaRjI3RVBjYVdsNE9lVWxVRGRabU5M?=
 =?utf-8?B?OHJTN09JWWZEb2lkR3NZRGhFQWszRGRvMkt5OFRYZzZFTjNRL2Vsc2N0Z3ZB?=
 =?utf-8?B?dW1xU09vdE50bDhjL2VqK0YrSi90d2x2ZnFyWEtuU2xQek1jejdqVlF4Q09x?=
 =?utf-8?B?UHEvTzRiSHZzcHEvajAxeXFLdlpYZ1U4ZFBIZkxDU0F1VHg2UFA0bWE3MFll?=
 =?utf-8?B?ZTRyckJPWDk2UHZCWEV6NGlIaGxRRjYrRklKZWgvSnJtcnhOMU83UGlOZHBj?=
 =?utf-8?B?NmhmM2ZOZWZzenhEcmhTS21ZWnkwTjdrZ0UvcTc5aWcxRlRNT2dWUCs0cS9k?=
 =?utf-8?B?ZlZ6dDgwcGwrcTNXaXBQN0NaSXBadmxvU0ZGN01GWEsxQUl2Z2dkMUwvdzZ5?=
 =?utf-8?B?T2FLclJaYTIwR3B5WE1BNDg5NWxYcXRYSTVoNHp2THNKQi9yYUJJSUtzM1E1?=
 =?utf-8?B?RFNoUDIvalk3aW51UjVWOUtYRWd2bk9mSDY3RkJ0eGFnODR0aFRqUGNzN29V?=
 =?utf-8?B?SDdraWJpQXJJbG1aL1hPcUFkUmVLRVlmU1E2TCtnYi9LOGxWV1JmQ0V6d2hu?=
 =?utf-8?B?Nnp2ZGp3MTVOWTFXT1FXT25VYzljbE91MU83cEZJU29DNG9CeGtpaW9sWkx4?=
 =?utf-8?B?MXpaZUpSd2tnTnN2VnZMQ0RUdXpZWEw4SXpxZi91WHJhQnd3VkZNaFlQRE4r?=
 =?utf-8?B?bEJPY1FxdkVJSE8xRndJbzdVY3QveHp3R3gyMzNRb1pNL0gvRDh0d280S2tz?=
 =?utf-8?B?TXRVbXdYNTRxQzViRk5HSTlvdVFuemYvUzkyZCtIdE95eVZrWFY1Ymh2TDkv?=
 =?utf-8?B?MitwRHJKUVlsSGNja00zMDlpZHFJWktsOVlNaVNiSHRyM1o0SFd0K2FUc29v?=
 =?utf-8?B?V0FuR3QyQ3F2WVZmd1NKb2V1aUd5M2x1MnhtRTJyUW1pOFZaUGpGQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF0AA3B50FECF44091CD6A35D3766CA6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	UnJWhpcvk8xo7SjWzTvBWxmkNTjayuLusq++DwSFP8xfVcvpWRq6XmNiDbpoatnAJ0cu5+kXPUVsd/elAXVS5A02fGyjfAjmtLheR9bg2MqU/c+YB+28VjC2Ug/lNHcnaXzSAnrh8XWuahHfmpfKs5CXjjEfuEW3R//Zmb3S9dvxMPfuxO0570wk3gkwMZJo2aRm+bu3KyzGWLTQ9aFLmfhzFUE6w2jdkLWKL+yWmzbfNi4BnazWtz/ff/oLYcvPKfYyqSxh/qY3uYuyVmykGSToTLMGoFqm1hfLv/RbRkpeW3NHddSB6Pje+qFH/RGmSvoePwLDXXkW0RVQPNeYTg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ckA2ZPNEngDKTwaQeAqd4U8Q9Pk4jgk9DQn5jn6SwM3qX+L91MuqS5KEBkyPknaey0WdN97+f8tEP8yA6h1y5dSklTejkze8gFKPSDsDMI7AYHpp4Ccsk+16YsaRdSOGhZF+BsBC37K16oA0sNAtBK5y79F9mIRvRaFV8blQa565tU3Ol5pnymAxXh4n1uinZTXxvw/Bo9p8i88g+pKGn0Kj1Ue13xFgsNuTlDR5kGwnu0ND9cgbLG+3QTOv5Uy9gwg5SEtWczk16D4Yvf5zz7wP41PqHDoO5gqZPzFDS7+nA+Psbu+ds1WhsmXWQpsaGW8BOsCUsdFMVkJQhxMIoM77ML0TBE2+8cnA+E0p05Si63lgMV36P8E3IRjmGSrIDGugrysG+2fS9kTkXaiV4sIHQfbXMvT2cPZwq1v+f33Ah75h1XLjasrlGYTAL0zpNNu0ZKTiiI98iUCHCpVsI8wy4m2ixLuKOREMu0MQvPWQvQKlZXRhBXp+8k59FFwzdfibTXgod5cdKrNiYme6wTsv/4Zn0+LX5CP5K2z8XIwpVA7M9KyxbV6IfFN+5jGmHZsO6mL7RPF7EZyIofeMdkBqVJx/9l1wgh8O0AV/7RtzWroc4BAS693sxj5kMKHLpa3+3IILx0qIse1Q2zW93Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b25e2d-2353-4f0c-2d9a-08deb158e6bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 01:34:11.9497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rKxk+SGLHeAGyOoUGw39bzI4jqH3rGJdS8XaeO+j4f1IN7tO+Zx2lsBrzH8dB9pnHyAPE8EJtgOr5JmJ0blhMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7564
X-Authority-Analysis: v=2.4 cv=WsIb99fv c=1 sm=1 tr=0 ts=6a0526a0 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=zd2uoN0lAAAA:8 a=oMSxk5RmX12PZ-aoHwQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAxMyBTYWx0ZWRfX0ZfXcbs9bxCa
 mKFn4T1AEZPDCidttcKHHnLpUWnjZXYBBBt3pOklufp4RRag2+V+sUrzYn2+6FV10xGfo1QnjgO
 avg0YMlm9oUwoHFep+YNMVe8Kgd2+NvbKLs58l/ET5CbtCQ/RKapcmb6//4m/evC71Q42OEe+WT
 86Ce4fke8nZSjV9ViXCT6kGN8uSZpdold7pHpf9wDOurToGIw47IkXPut8AcNQ/TTgkWvQofHPv
 /hN/zcsGx21xkPSzS5pVzz0O2SMLXTBBuKtP9aqiiwuXwprDpgsmarI8+HRYxwr+IQhhSTlWUM3
 ZAKc6HHwtaWvSKRqezp5RfqSaPA4Rz132ia2UWX+1IxB7hEGWEShJ69qFFEECBvJ8SMGzQEXqMW
 IboPnSlydgNCHBA4SuQ04YG+ZCF3XlBas6X6QFzXxzRt/G104FqYqq9okhQ62eMr73x0NsiMUha
 /duNBuIMKbRzfEZmcBg==
X-Proofpoint-ORIG-GUID: AKzlopJUEAXxkcDH3W8M-pYZXFItv2J_
X-Proofpoint-GUID: AKzlopJUEAXxkcDH3W8M-pYZXFItv2J_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 clxscore=1015 adultscore=0 malwarescore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605050000 definitions=main-2605140013
X-Rspamd-Queue-Id: 3937D53CBD2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37432-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,synopsys.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gTW9uLCBNYXkgMTEsIDIwMjYsIFJhZGhleSBTaHlhbSBQYW5kZXkgd3JvdGU6DQo+IFJlcGxh
Y2Ugc2VwYXJhdGUgcmVzZXRfY29udHJvbF9hc3NlcnQoKSBhbmQgcmVzZXRfY29udHJvbF9kZWFz
c2VydCgpIGNhbGxzDQo+IHdpdGggcmVzZXRfY29udHJvbF9yZXNldCgpLCB3aGljaCBwdWxzZXMg
dGhlIHJlc2V0IGluIG9uZSBzdGVwLiBSZXBvcnQNCj4gZmFpbHVyZXMgd2l0aCBkZXZfZXJyX3By
b2JlKCkgYW5kIGEgc2luZ2xlIG1lc3NhZ2UuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlLg0KPiANCg0K
VGhlIGJlaGF2aW9yIG9mIHJlc2V0X2NvbnRyb2xfcmVzZXQoKSBpcyBhIGxpdHRsZSBkaWZmZXJl
bnQuIEkgd291bGRuJ3QNCmNhbGwgdGhpcyAiTm8gZnVuY3Rpb25hbCBjaGFuZ2UiLiBIb3dldmVy
LCBJIGFzc3VtZWQgdGhpcyB3YXMgdGVzdGVkLg0KUGxlYXNlIHByb3ZpZGUgYSBwcm9wZXIgcmVh
c29uIGZvciB0aGlzIGNoYW5nZSBpbiB0aGUgY2hhbmdlIGxvZy4NCg0KPiBTaWduZWQtb2ZmLWJ5
OiBSYWRoZXkgU2h5YW0gUGFuZGV5IDxyYWRoZXkuc2h5YW0ucGFuZGV5QGFtZC5jb20+DQo+IC0t
LQ0KPiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIHwgMTYgKysrKy0tLS0tLS0tLS0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jIGIvZHJpdmVy
cy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IGluZGV4IGEzYzdkYzI1OGM3ZC4uOTQ0NThiM2Rh
MWEwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2R3YzMteGlsaW54LmMNCj4gKysr
IGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXhpbGlueC5jDQo+IEBAIC05OCwxOCArOTgsMTAgQEAg
c3RhdGljIGludCBkd2MzX3hsbnhfaW5pdF92ZXJzYWwoc3RydWN0IGR3YzNfeGxueCAqcHJpdl9k
YXRhKQ0KPiAgDQo+ICAJZHdjM194bG54X21hc2tfcGh5X3JzdChwcml2X2RhdGEsIGZhbHNlKTsN
Cj4gIA0KPiAtCS8qIEFzc2VydCBhbmQgRGUtYXNzZXJ0IHJlc2V0ICovDQo+IC0JcmV0ID0gcmVz
ZXRfY29udHJvbF9hc3NlcnQoY3JzdCk7DQo+IC0JaWYgKHJldCA8IDApIHsNCj4gLQkJZGV2X2Vy
cl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byBhc3NlcnQgUmVzZXRcbiIpOw0KPiAtCQlyZXR1
cm4gcmV0Ow0KPiAtCX0NCj4gLQ0KPiAtCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoY3Jz
dCk7DQo+IC0JaWYgKHJldCA8IDApIHsNCj4gLQkJZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZh
aWxlZCB0byBEZS1hc3NlcnQgUmVzZXRcbiIpOw0KPiAtCQlyZXR1cm4gcmV0Ow0KPiAtCX0NCj4g
KwkvKiBhc3NlcnQgYW5kIGRlYXNzZXJ0IHJlc2V0ICovDQo+ICsJcmV0ID0gcmVzZXRfY29udHJv
bF9yZXNldChjcnN0KTsNCj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIHJldCwgImZhaWxlZCB0byBhc3NlcnQgYW5kIGRlYXNzZXJ0IHJlc2V0XG4iKTsNCj4gIA0K
PiAgCWR3YzNfeGxueF9tYXNrX3BoeV9yc3QocHJpdl9kYXRhLCB0cnVlKTsNCj4gIAlkd2MzX3hs
bnhfc2V0X2NvaGVyZW5jeShwcml2X2RhdGEsIFhMTlhfVVNCMl9UUkFGRklDX1JPVVRFX0NPTkZJ
Ryk7DQo+IC0tIA0KPiAyLjQ0LjQNCj4g

