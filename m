Return-Path: <linux-usb+bounces-18362-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8048A9EC0EE
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D0E91889A7E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCCACA4E;
	Wed, 11 Dec 2024 00:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cI19LNg4";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XRlqdeUd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rv3wvmgZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B26182B4
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877265; cv=fail; b=b+O3VhGLbK+sa2UI7mX5AsGygusr/AwqNNm8sK2DKDJLnFvPbq9AzUjYHm+zOA9L6+9MXFkLRtoPy1ny7f8ArJpBAzy1w/KrXIZAUh/FwWTLNkXghmpvf/p7MlpqlhbI0chfQ07jnIIuLBf8o3vFLX3oa6cyWwr7nYSo8lbUsAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877265; c=relaxed/simple;
	bh=ZT/CGhrWnIEYnEtMGoSvrM0+3Qyd14UZB8WzzX0g7qE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZD07evAzTQKAUOh5g7vzcvN6bsguFo8trBPIuKbvd9ItuNKXsz/ITSfaq232JaWgK/pzCq57DZYZK+pS50TIAf+XZ8H1MlR/I3KFG0yQbyg0zSj0Bp1pptgPDH9eN1BSCmVyPxdZwz4WIKwHU2ewL/EI2ju7DGRH+pIEMvjwWog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=cI19LNg4; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XRlqdeUd; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rv3wvmgZ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAMtPgZ000581;
	Tue, 10 Dec 2024 16:34:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=OorLWglAtFMuZwdRR5RYlQCQMOc4uR7iM8/c3phCHMo=; b=cI19LNg4Xi1g
	IZcXqBNglz3fyOK1U6fcoYzI4XhpmY8du2dzmpP4BgtVuefONftbmHdY/cXHYaeH
	XjTI8GIO6hv4g9qbN+cGqn5cw9ujji7UWAh2bFEckDTm2wpLgqO8Wrl63IgdmK+b
	tSYGt/OlqezqggHKvrLOATHzjtlwPZ08iGytu7wkBXduTSynnxcotLgnpJYRUHkz
	e+fLhvPMnAOkHcaHGECwJq6YLcOhOesml0OclDR3Cy7IyoTdfoZYC0Mnqzh6c0H9
	80uyzP4VPfsvvoYp1RRpZTIiOxmmI4jm5hTDm6rhd4O+zBMlq/po6/7JtKXkCZad
	iLf/C3yVqw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 43cnvka1cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877258; bh=ZT/CGhrWnIEYnEtMGoSvrM0+3Qyd14UZB8WzzX0g7qE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=XRlqdeUd5a9eqjthWXau5VfV+y1NPH6STiPU/dtwIB34/abxjVD8iOEXXjhiHdvt8
	 xg7gXkQocTLI5ou4EiAa6Zt/UOdu2YEQyWt5jOAWSW+zgOC3SWwzTWKccXXhWn2zDi
	 Z3TvJ+MAkPmquaGY0X24jns3MKkvRO7sj81iZkFDakuokJGU37hT7cxkQxqEFn2sw6
	 QAkdGsNKF9C4Jnk8pu3szYR9yJtvf7JHXRu/HX66NvwLap9VHhp59O+eiCv3K7rqas
	 SwkqM1MfkxWftpB4adeyG6hs+HAHRQQOSN+LRsn37G504AawSOlOj22DwpvpxmVB2O
	 PtuOxXO3OJGRA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 22E52405EA;
	Wed, 11 Dec 2024 00:34:18 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E77FCA0090;
	Wed, 11 Dec 2024 00:34:17 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=rv3wvmgZ;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9A0F5401E9;
	Wed, 11 Dec 2024 00:34:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eo/MZbftmjvnl+nRF5vjowo5a2pyqmvOwzEdY+7tvXVFRJAutlxvSLUR8iD5AU3Wo/C6kPj72L1ugV8M+qIEF9LX1NXH/hF5awvwcPGnVzq57ErxErnNL1MH3Pkr5yodUrJZ7OBKWmbickgEmUrL2Lc+etOM08REH+4XrK9lK9T6ao0sp1QWU9oub/kIn1bnw3eEPO6lmm47lfXZ1K/2QakzceQogajghf/8aEwqrG+zLT+qBfJjEU01BDS7yoOLFChjyWNH4GI4bkD17Bg/wNF87CK8o/06e04yEBntVoR4+/nkW9cN95XpIBjgr7PvPkk6qL6t23k7GSlWLqsUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OorLWglAtFMuZwdRR5RYlQCQMOc4uR7iM8/c3phCHMo=;
 b=vZ9lFEKY+bL43TooKy7iu5uy0NHDv8cnUSSnEw5O03gfR+RoqEkQhov/I3J6ukavGYGCqfd7Ru/Jpw64LCGmPeOmN+qV5mCRrLxV8icAcZcBy9DNCFXtCtrWXc1kBbzOD54hQAGtwjtx7Fq/T2LkJLTDeRsECIBOsupVoCqLzLsrFYflE5/o4UcUGhwLPp792p7lg1ndrrmdFgKDBJt71ZDx056verB5qexpZruA+riC5jD8m+ZQQosyYrpIeP3d0ykVg1Zz+ylRnDoVYqBkj54XDP5EYPXrZlVEvus/ydz3tqvCeudJazpVMQ5xEQ+VHgrlpuaAKz/MqCTJt2bvgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OorLWglAtFMuZwdRR5RYlQCQMOc4uR7iM8/c3phCHMo=;
 b=rv3wvmgZ+xkuz/PjBrcMVBTtp6Lmbs0VsFVA8YXCNbb6x0RbgFyf9luAGfHquFmYtyb3z++yKQ9cgTv84niYslOYpWDCCChlA6MFEOsTDUqH6rzU5NPXczB3CFBkSx4fdD6EvJKNCaOsXMpRYI6tXOx7n2P27aWF5lzPuKz9VfI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 00:34:15 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:34:15 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 27/28] usb: gadget: f_tcm: Track BOT command kref
Thread-Topic: [PATCH v3 27/28] usb: gadget: f_tcm: Track BOT command kref
Thread-Index: AQHbS2Rn4316DqFVMUKTZO0txWRBIg==
Date: Wed, 11 Dec 2024 00:34:15 +0000
Message-ID:
 <e791c639e91b5d91a8787f5d6902e8c58f1dc172.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7635:EE_
x-ms-office365-filtering-correlation-id: 240d1729-a6f3-429c-0163-08dd197b8a69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?YAQgNwP7s5aiaHRkzi56v++0OzzAgZE7WV7XvZBeZYKOxqkbBaZwgliCzB?=
 =?iso-8859-1?Q?NIYpxMCde7pC/GvtgQuIU2jr6zjI9eTnHyQgA27t0f9ntRHhqiqZcBOW2B?=
 =?iso-8859-1?Q?0O1I8cSuoFcIp3XZFVlVt7IHxelM/0g0bA5yEOTt76nKs5oipIqI3jOhwR?=
 =?iso-8859-1?Q?yOjEl+OYAEvpru1a6DomBAQ2X9wvrTOpfGij6/yiPVSLRKRQ4lPkji1UD5?=
 =?iso-8859-1?Q?KXnLDQp9aQkyJEpM1eGacWbUnPSvmSuthhJPKZPW3zbENmrYGOtsbl38fL?=
 =?iso-8859-1?Q?+V+sFy0nIaFIkiz1g90hlMy5nccm7PcEoiuUJB1YFKAcv2KSWX91MYtd5s?=
 =?iso-8859-1?Q?A2gPGhi7fRZ0Fk6mFD7TYZ8TkV8sNlCsXaBpAr8GgZUABi5ryW7irGz3+0?=
 =?iso-8859-1?Q?sBxj66kYH50bMcfCJiFTPghqSaUJ9BUzZP9PUtxDyeaudaB8LpmOlZln2y?=
 =?iso-8859-1?Q?oE/fZyos2fqNNVjtMIGWkosZ8buwWmdhSIF6zFCMqDPGtTCXttOB2/XpIB?=
 =?iso-8859-1?Q?LPvYOXGeCYdi7omFHlx/hrDEGX1+tdOgjeJ2Dw/gpTtjJbCnQDqwV1A9ZP?=
 =?iso-8859-1?Q?VHKlPGpEsEbyTOpkl3hC4DIAv3zLVRfVZBN9kw/JB4kHaABoqw03B1+NVK?=
 =?iso-8859-1?Q?PHczfkb7nd89LbBmmO7nuED2kaMkm1TmJOZHorN5Yqf5Ta7hx+zUkHm7ED?=
 =?iso-8859-1?Q?b4Vo9TV2BwKmETpQGg1GyJqQArUyxhDV8c0Z/5CZU+GuEarMsW8A9843nV?=
 =?iso-8859-1?Q?qHoTJ3j28TigYxrTZARl2ZZ6AI7wZC0V9Vvnb7zvfsdIViM6saBlcWhi4r?=
 =?iso-8859-1?Q?dr+8ix1wgR8vpVQIvbVP1cojxQWH7+dJRa6IG74OUC4sS2hwOzvET7tISA?=
 =?iso-8859-1?Q?FOeIgSN+jPJVGzy8tvWI23pg3NPBO4MdXyJVQ3ntamy4E51WwmVVYnwdBp?=
 =?iso-8859-1?Q?9WIdACCv8oJcfb+JU3Qg6CNbGKdW6K2hHYOkR7aaDjSxCM9/8EjOzlR/es?=
 =?iso-8859-1?Q?V69NemWOExS2e0KhXB6AhQKPiXCXHewGDdSzGjJQ70nJZkuS4dJ8L4o3l5?=
 =?iso-8859-1?Q?nS0gBtPLYbAqqSC4wXyFAR3jk6hVFU17TVFZRSHttcFIVAHFzsr/hVOFY7?=
 =?iso-8859-1?Q?YKcO3sgFe3cuNC2UtyWLy2PjDxd+XJ3mzGCTydG8Rmf/dsKjNvW6S2t8qZ?=
 =?iso-8859-1?Q?D3kzXkHF4agoprC3wZkbZL8sya74y7ZRUK+A2Ioywm96VRrMyZZYdHsU/f?=
 =?iso-8859-1?Q?+voU6fqu7/5VmmgaWG2BWZ3EEviTfMvwb6UFPInFmkxVUMwP2IDUTxs2RL?=
 =?iso-8859-1?Q?UJb1uupYc0YaG6bcHJxkWQSNqbpdjYu1FMrO5SGYsYmLL3LgUoXWK55GA4?=
 =?iso-8859-1?Q?UttjXk5C9vOAqJPTFGzOhWqhsdPr0NsombKSoE887OaAx3TFcKFr6RDzZZ?=
 =?iso-8859-1?Q?F1Y/g4ndACJIbq3IUK9ACBll9mOIJqHd5J3BuQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?963nRJu+q8Gcw9pcc82u83GTaa8gEuHvD0bxVFnYhUOgV9dhsWROGZbHWT?=
 =?iso-8859-1?Q?BoCN0KTxja+3oa3wrFUX3GYYn6Crrz1vCzqUGvjtV9kn69fAXb09c6CrKk?=
 =?iso-8859-1?Q?fQCkn6gBBCJaiRqNGmZzDbYzhgOUaSIli1D5+GAYDaaopUUR+HPOEoV7C9?=
 =?iso-8859-1?Q?zIyMq7HxCU/QkWgm2iyTsUvQ9u4E41tYjpeQFvYXnbUP+VaB6/1E6ypOo7?=
 =?iso-8859-1?Q?PfZDNihXLUCc39Y3BcVeVMd5lAAHxQvqmm9l93fq/pAFekFpmGUrLEvwiv?=
 =?iso-8859-1?Q?jTd+PJkv75vRzEfRKIqibCDH2tURuKRV3O4Y2uTWChPpZRSacIstTu21mG?=
 =?iso-8859-1?Q?bOmz/LGI8QCsoE4SPKzQZY3vsQZj+I3CSLtJMCYVd8xvnK9qGklsmWBwrY?=
 =?iso-8859-1?Q?2czB19rW54edyNYr7FPGkfkLOv9YZx6qcm5QlnE6+NsLn148LvfC6fmUf8?=
 =?iso-8859-1?Q?O2OaZf2rr0lmwvsBVgKiVc+4noBrnT3peRsZQvYb1d4r/Ehp4XeuT8hy+G?=
 =?iso-8859-1?Q?yxw/8oqwGC6SCNSHlPtziInEEhcLHW13d/0flUiDaw4XXi5UmMDvNuZzLF?=
 =?iso-8859-1?Q?FFSd3g9Nftx3rK9QYOJ/eKwQL/ibiYuC5CG5Am+xPSnj25JXkDpbLu4aYE?=
 =?iso-8859-1?Q?mXOejrCN+zsEJWG/TztkNMMLquRPoVeWkF3uEEWgSxneAjPwSjtNrzSi6c?=
 =?iso-8859-1?Q?KP7OefQJbdhb87Kc6Cr7lS95EYcLaBa5T59kUE28sOPnSoU47szZX5NDNJ?=
 =?iso-8859-1?Q?WoK5ROqQ8oPTFWCA4OYbHTstMGxVmNuHbz20PNyOoRwowOFu7Gz5gbkUYO?=
 =?iso-8859-1?Q?3Whz3EWuFK/0p7U1Vmi54RY4hX/DQ5VzlNG1b4ZHvJIQoEPsyTRtXdZVvC?=
 =?iso-8859-1?Q?l0PmbjhV1d74isrMGOieZQnIwXjMbRxlZyrgpFCFBLG6oyly+fC6y/b07J?=
 =?iso-8859-1?Q?3sLuvYV0y/Wpnbawr94FIVXEWmN2pHbAZt9CMR6hkPibyD1GsALo96x7aY?=
 =?iso-8859-1?Q?hNADJnivPlk5eeeN2TzvsswjCL9wrIwnZdHYPG978xSB+PkWeo9PYSl4BK?=
 =?iso-8859-1?Q?nsYDix2HwJH6NTMEWaS+3X30ULCyXXcz2LG7R5YNbU7vhpbh/OVuYMc8lk?=
 =?iso-8859-1?Q?QqgZDoZ0Rct8UZU1qLtLR75rh/bhTug7TH8mNW7UOWk+pS8wPKcV4kwAEI?=
 =?iso-8859-1?Q?5c+wHKxW35c6LSJE2y0pxPclDB69eueJWk277ds8nq6P/MDew7LOWCjf0F?=
 =?iso-8859-1?Q?4xtUQAWOWa2eBQ7EzBha1SH60Uu9rJSKujkn8r3ZHePent6wgmTJ43M0WR?=
 =?iso-8859-1?Q?GDPUBlDamohFvcW7joK37QWWZRiU3Rw9iRCDIEVKSOb9jhMplwbeMuKQeM?=
 =?iso-8859-1?Q?wlI5v05VwspZipphD0kNQnUKOahh9RoRNO1sR4RtMZCjx0zQdEWme16PkS?=
 =?iso-8859-1?Q?9YaaPt53etunFThIN5JYcOFQlXjDx7KRHBawsgNLPS+wSLc7LvTjCVFYo8?=
 =?iso-8859-1?Q?hKCWF2EH5RmNQW543epLtHk93BLPcBEFZk8k0s75W6l3niyIwgz5JN15nF?=
 =?iso-8859-1?Q?WkC3MOrVuwREuAiBzFKnFhePQuG1nlpJdF9tZDmjAKO/UrUgiMvcYKKy1y?=
 =?iso-8859-1?Q?ond/nTLrvzvBe/ekDEvZ5Tjn2JG1bATtxJNbTa1tETKt5KOzDiLJzbUQ?=
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
	AvDtu7sctZqq1AjIAI4J6yRcugEeV1/MTWHTbOlRApBEg9i71hLrxf0GwcJ56eosOxVobtrY/JeFQIjEOxfIl1Nv0QcO6/prbynh/ERIlXJ9zVsrneokEL3l5mMyp9BdlBr8eEVPELKaA5qtbisImNpqceKFlnsIqHe5Z461QCJty3u13kyzNqcNxymEF2SE+Nh7UOsCEvTs/SWzV1IJh+VUzK0zIXWsBK6avLbPU2kzgYdcpfTrQkAyEHn3vr5tq8FaxeiHscYnLzINZyuzvKi7DPOCDRD7DTW6oPLrquOa3jD5XUAZisjmcJntZwcimF1V49zxfDDWTUlaulWan8AIRxuaXrBz/MbpjmDkuKWze1zBeVw3h+L/oN3yvCgOGHhISjGh0WbMLliMMAd21fUpe0/AHBcfuGsxunLxkYu7bjaak0tox8nrx2NDyaHATQOLHjCEwmO1rMkneJP8VpcK3MchXIxI1I5gcoEgQtTeMvsQnUF+hByDT9kZlxBjC+3AMmQpEvUZDdsiVkats4hnroV8WR0YeyVIqCetLF2/AolYeX2w4ZRql1zyxJ424pk4bOpNiNKZzSHBY9W855cMZ2SthiXkI19RkQBWQEvoW25bKi7uP0pkIwcEzP7uJ1RSNqULAqwa+VD98n5WTw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 240d1729-a6f3-429c-0163-08dd197b8a69
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:34:15.0250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LZdql8UPyZUAyK+gaG/3OckTcmV0+c4yrYx6O1qXu7mRPtK4mTFD0xtqQisGqvMbbfc40VQF6yDmJs1+kohRww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-Authority-Analysis: v=2.4 cv=fNPD3Yae c=1 sm=1 tr=0 ts=6758de0b cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=c0npTWfPIdM5zqziQOMA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: QPB5G-VMb5iqUTKh869aCAvXafkazbx-
X-Proofpoint-GUID: QPB5G-VMb5iqUTKh869aCAvXafkazbx-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

Set TARGET_SCF_ACK_KREF flag and allow f_tcm to take the BOT command
reference. A usb request may be canceled, the f_tcm knows this. Let it
decides if the command should be freed. This is the same as how the UAS
interface is done.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index be7d8df360d9..72e7d4558eef 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1466,6 +1466,7 @@ static void bot_cmd_work(struct work_struct *work)
 	struct se_cmd *se_cmd;
 	struct tcm_usbg_nexus *tv_nexus;
 	struct usbg_tpg *tpg;
+	int flags =3D TARGET_SCF_ACK_KREF;
 	int dir;
=20
 	/*
@@ -1494,7 +1495,7 @@ static void bot_cmd_work(struct work_struct *work)
=20
 	target_submit_cmd(se_cmd, tv_nexus->tvn_se_sess,
 			  cmd->cmd_buf, cmd->sense_iu.sense, cmd->unpacked_lun,
-			  cmd->data_len, cmd->prio_attr, dir, 0);
+			  cmd->data_len, cmd->prio_attr, dir, flags);
 	return;
=20
 out:
--=20
2.28.0

