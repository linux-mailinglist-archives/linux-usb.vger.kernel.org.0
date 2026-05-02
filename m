Return-Path: <linux-usb+bounces-36836-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xnteBuZk9WleKwIAu9opvQ
	(envelope-from <linux-usb+bounces-36836-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 02 May 2026 04:43:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F65F4B0B3D
	for <lists+linux-usb@lfdr.de>; Sat, 02 May 2026 04:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4080B301683A
	for <lists+linux-usb@lfdr.de>; Sat,  2 May 2026 02:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D5927A107;
	Sat,  2 May 2026 02:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="r2LA50Tl";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TWxSlezc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="U8J8Zf4G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6BB155C97;
	Sat,  2 May 2026 02:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777689824; cv=fail; b=Vj31/lfKF0utWA20sV2GiYaK5WnRKQ6P12CwK7wlF98vkCTaQxBayHC/BjkgYrbHg+gm9G+vd5d45fAIhAlYV1lSr9h3bvisAfVDbkP9zTCffJrBxesqxOmdajIUqUY7EfV0hIEB9hJZ8LCDi+q8WC8C4YdiYhUTCxlMTgJWZcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777689824; c=relaxed/simple;
	bh=a3KD8usAyZITvuOwzfQV4ardGK5GIIKVcOgfHgzUtMc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CB3BosEg5dZpwTsDJ/0j3p9bxJBpdgMcr9bs1/mANxeurGSuzgqEoyT/taDky2zJjc48qXtuITcZjCtVDpcVxOpneejIzLdELrSdtrOaYNbzDYE+0DheiCACkxb4Cjev9xVz4gKmLdatjpLN1o4CLLPRC3BMU68g90J8Art6L8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=r2LA50Tl; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TWxSlezc; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=U8J8Zf4G reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641JPrFQ3109225;
	Fri, 1 May 2026 17:56:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=a3KD8usAyZITvuOwzfQV4ardGK5GIIKVcOgfHgzUtMc=; b=
	r2LA50TlBpQsBWtEeF8HsjtX0iik+FhuJNWVw8ENfTp8JM0kgvglRDZ/x1rAu8UL
	TBTerRpMGquE1DuEfWqYvA63DNj5BuT3F5p5Zu5HcZovHzxmU2nHXKMaNmHy1trv
	L9yAQLllB09Smhw0I1qmPXFty9lIzjsyPWfSmQTd1ZArJvXo07ioE04vzUycpbg1
	Q3M8gkt+LwzvSZaxiJTy3j+GHZpHWNeisjkFSFG7OYBRKiobcpgVnDvfhLLVWCca
	vOlCm+WIDZuZY6XJ679UpBF8HhCtJVkNKNQxLOkG6ShaxCRkJR8NqFt+CH9OPJnN
	W9nwtkUyhweRbbEq+ayqfQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4dvex37t63-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 01 May 2026 17:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1777683366; bh=a3KD8usAyZITvuOwzfQV4ardGK5GIIKVcOgfHgzUtMc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=TWxSlezc/lfJ9K9HlFM4T7EE0Jxanu9OlQN/3qLhoqrFymD+603en/rreUUCp5i4x
	 9Qzqj7SaqS+jwGmM804MHQEqFkW+glyqwdBDqmyqIa8uAAy8RC+k9qpq4lE+AQvcf+
	 q5a6KvbxSZAlc76A6kpO6VoyIj6ZVkxvzThoafWXTaaUTzBkHC1wr7iTX9HB4+ZXJs
	 7+XtVwI/tKvWFvnNVzqB7qHkRG/YqZuj+raKIG/K4nv8aYJwfzoNbyTUhmSD5hISvd
	 ltYUcE0ZmoujR/JXvsj5elCINYqpV7YTIQ/eBqmsjAVvV//G6MHuF36qKj8xPnnZwQ
	 uPEr9Rp9XuDlA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B268C40340;
	Sat,  2 May 2026 00:56:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 0DEEDA007C;
	Sat,  2 May 2026 00:56:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=U8J8Zf4G;
	dkim-atps=neutral
Received: from BL2PR08CU001.outbound.protection.outlook.com (mail-bl2pr08cu00106.outbound.protection.outlook.com [40.93.4.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id F181740545;
	Sat,  2 May 2026 00:56:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YIXA1WcCTGbCYsPOopEM4yijJzaHdmAAYXp0KDMnxrI5qzippBYP1bZQ9oiNwauixOqwb8t6adLZYufuu7FYLRgrqZnUHLAFUeOw4lGgJablHsqE9BJut83SKBBq0xVa7v2aBejJu4ZPmg0JYegq05fb1yluXLIrIOtRFiPfkx4jCOS8zMkEB8gFULForPUUi9kVCWnWdh2eHAhO7Q5047+9opcfZuXgagpQk/YFOU9uxvWrJUxMt5ra8+z7CyRLXXr5+SPINd23gjdkkNLa55IFLEFNo8hOa7ilLI328OZTxgvxsMVO4t8I6CWDNFQZNGH0ykAeVGlTgYUd51ReCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3KD8usAyZITvuOwzfQV4ardGK5GIIKVcOgfHgzUtMc=;
 b=zGXw65AfaApAjGN6v9HH7FMsOy0Y4e+3CV+JXut+B2fjk6ufSthlPXFwLNL2j4RbWedFhjkBTWZ/Pnw0EuESr5cw7PCzixg3/vscKI0WpAos0xgVbUK6gFtnTzSACNJYJKmc/zHA6Mn3y3d//bW302yeetcSyOO20EInKbSTK8Vh6sjEIliFwcbEwI7Hi0OGrMyKFpsel9pmyhHcvFu9nafNp7GP3oMzdSMPh47BBP0rojn3zPKlwJS6fwfCYsiSbpUKFw8OBBvKP8nDMRPXeJmjRnSn2K2WLSthm9d2wMVv6QLuAmwzwY09rJUil2BubUXSB6ZeLXlEk2AbfrKr5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3KD8usAyZITvuOwzfQV4ardGK5GIIKVcOgfHgzUtMc=;
 b=U8J8Zf4Gpq7XvDmhR5pf8wjE8iJ2uXm1TBDCRLgt7nCaZ5SsVQoXfeZMTyTtrHnN+4urQDLZEMWOWmwZE+gdyhXI5W4pyinhX+dMvIb9CDGHmbLcQ53Li6zGypZPZrcWS6Haeg5tZEdlCmNJoBEcQCZXUnhqx/OdZ1BGRuQuICc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MW4PR12MB6975.namprd12.prod.outlook.com (2603:10b6:303:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Sat, 2 May
 2026 00:55:57 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9870.022; Sat, 2 May 2026
 00:55:57 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jack.pham@oss.qualcomm.com" <jack.pham@oss.qualcomm.com>,
        "wesley.cheng@oss.qualcomm.com" <wesley.cheng@oss.qualcomm.com>
Subject: Re: [PATCH] usb: dwc3: avoid probe deferral when USB power supply is
 not available
Thread-Topic: [PATCH] usb: dwc3: avoid probe deferral when USB power supply is
 not available
Thread-Index: AQHcxuWp9hYn7RcqQkmtW0XySNuTgLX6Dw6A
Date: Sat, 2 May 2026 00:55:57 +0000
Message-ID: <afVDFDK_cTO7rH2d@vbox>
References: <20260407232410.4101455-1-elson.serrao@oss.qualcomm.com>
In-Reply-To: <20260407232410.4101455-1-elson.serrao@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MW4PR12MB6975:EE_
x-ms-office365-filtering-correlation-id: f61e7add-0df4-4906-bf3f-08dea7e59246
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 RxK2uUoUPC4mYHRwsbCCsxRuYyKXbfOLXTU3vgeF85zRj+u+zGeZMSnjAW8YEzym+9bRyPBX6YHVu33MkfrC6t1R/KUgL9RBlOW6iLmwnEK2Y20qZvbwSMwxqrpjaMG7qm3Vt+jrDBRa6Y+lsE0W2QSfR6JjCoYPXhrkXbGG5DvotnudEMwQEskLx77Md43riE1vLHEDidDsL787yHyG4Tw9EM/QHFFaFQaqW6lMdKWY6CS/xg53vQvv43KjJTJCmQcGSS1JUMj58W4bY8DM1VspR1HOQbjhQd+6L9sb5J6yzN1mB1fEyX/sOvZhXWMUKIpIKgVN+m6JLEz/k1doa/jjBj5ZsgCPjacqfn86U+XuGHD7LxMalNDmTWWxZ3BTcvHmTPCWF8QMlYXWW1VurFyedsxbmmhut1+o/sFin6najjwbmPTM42dJUZKss8+3V8p4b1sPbaXuZuJwMT2kpdXzOItWxjBdbyoC4AnRwSJXNqjrZEIikImQRzXgp6IuqJizPss+aqH0Ccrwp9ISGd52qfdcxCLbqdSx0eo882ll++ySPKFNHlOmuJjyMLhMKojeq2HRe1huDElBf2L/xYQ4WFxxgzJgZZBucLGwnWNuw4Kxr6VFd/NT7vmIsmlRPQAjIzc/dYsQtwRKXlKVsa215RpHJVIh4dfH1z7hDg1qOrsZ3ATHylOymptzPXif5AMCQV88rZhaEv97Yw456PPKOxDnaBS7/dauQcl5YmgRvsHzs/JydSQlGydMzHi7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDVBL3dPSGw3bEJaNlJUNG9Xc21LNHFvdWJ2WWZoODRRL2ExTEFTd2JVbkxD?=
 =?utf-8?B?UlB0NjdSdmtJSGhScVlhYm9MMXdtWFJ2R2x5SE5oaGVUd0VoVkVnQ2hzT243?=
 =?utf-8?B?VDVCZWtDRXduVWd2YUcvR2N0K1pWOTdOT2poNFVhY3BEVlhhL3hzd2NoclhT?=
 =?utf-8?B?SnBtN3Vwd2YwUXZOQmFPbEYzdExNQ0RqK3N0RnlLY2VXRXFMZUhqU25yZitR?=
 =?utf-8?B?NXhmM1VGTEF1eXJFVWY5N0lHZWI3amQzSUdlZWRLMHpTcmVrWHFJTndvUDNq?=
 =?utf-8?B?SlIvK255dnRNTXpMREgzUGViTFFVOVEvMlB2VzRuRUZHRk9LVUtFaVRqRHR3?=
 =?utf-8?B?bmhadEoxMy9PZ096YzhqVHovMzN6TGlKRzNLQWxXaHB2bjlhbC8zZnNiUHFw?=
 =?utf-8?B?Y3FXTmVPeWFhUWh6YTVBNzgwWVUvUVdhTEJoa2I3amV2a2ZhVm5pODhxSndJ?=
 =?utf-8?B?QjJFNzBvRmJOK1JtYzVlTllmMjBKdVBNLzhLc2hyczNwcDRKRlJNSlBIeFlQ?=
 =?utf-8?B?bEY0RExmQVdWR1orMVNIZmZkelQxYnZRY3pqRHNSZlR4STZrZ2xPeW5uZUZh?=
 =?utf-8?B?N2VNRGU1SXhMaDVoMGlWNk5zUzVVMldWa0E4L29MOGR1QzluWi9hbGUyRWQx?=
 =?utf-8?B?bXAxQlZnVDhlZm5IZmF1UXRHZXlGQkJFVUpyczFEd1JXQkd3K0R5SzlzSHN5?=
 =?utf-8?B?ck5CMU90OWF3eVBQQXRBUlNydWVxZDMra3l0VkxvcUVoM2ZzR2RFeEQ4UTVL?=
 =?utf-8?B?UTJYblFXdjJ3QlZXN0xWeFYvdy9EMWM2T3ZXRWtHeVQ1cFhheHBBRkJRUEdR?=
 =?utf-8?B?bE1UejRCZUg5eVNjenc3MWlyWmVMcUlnZkQ1QjlXcGJjRFhSQlNrTGw4czJI?=
 =?utf-8?B?TGJiSEFKNkpORTUybWFtWjNST2YvajdITmV6U01QL2JWYW5RS21pU29PL0RN?=
 =?utf-8?B?ejI0QSsyYllyMlhackNyY3pJbjNTY2JNK0RQdS9ZMFFPMHErb2kyeGd5K2ow?=
 =?utf-8?B?eGVFbXJ5TWl2OG5NbmxSaGEvd1RBMUZBZi9zdTV2Z0hBeDRmR3JpQUxzTm0w?=
 =?utf-8?B?cm12dXEwazlBWm9Ya3JTbjZZTjVTWThlUmcvWjBEL21WSjVhRGl5MC9UcGp0?=
 =?utf-8?B?TEFCUlp3WDI0cTJhMHVKUjJJUDZGK2lUM3E5Ry9nL0VGOWRieGYweXBEeExT?=
 =?utf-8?B?ZWhtQmRqUkZnQ05CeDJkWm5idzc3Y1JFdVJ2bHV3OXAwanJPMlJuY2hoVkdE?=
 =?utf-8?B?UDBGT21JRkc1Snc0Nmw0Qk1wbU1aaVZDUmV0azN4b2lHbi91Ry90TDRSY2dJ?=
 =?utf-8?B?UEQ3WVExUU5KdlZwRE1UOERWeFBiQ25PN2FVVEUvUldGWGZZRVA0Q0grZXFt?=
 =?utf-8?B?ZmE1Z0dOL2Vta1hxVExzMk8vYzVPNGpjaGdMSXFGNGxobmRYREc5K1VKTEI0?=
 =?utf-8?B?ZGU4NzZxRk4vc2pZQUlaRUg1Ymx5cXpqVXNSVU1sUDdlR2xFc09pUExabFNq?=
 =?utf-8?B?dkF1OXQyR2ZaWnRmdGNjbFhsekhZVnhxaThGVmU2MkYxZUkxdmdLVDl5cnQ0?=
 =?utf-8?B?UXJ6MURDbUI0ZVhTRllrS2hrVmhFK2F2ZjBaZ3FSZUIvUFVCdmRhYjQ4dHRT?=
 =?utf-8?B?SXhSMXVEc1dHdHhtYlVveUIrSzNlS0JQcTYxQm1kUGtCTXhicnJtR1V3MndC?=
 =?utf-8?B?T2lHWjdDZUJjRUE2OFZTRzYyTXA5dEhXdkhMVXI4aEY4V1BNVEViTGtvYVFa?=
 =?utf-8?B?aTVtckdTcjFOK1Z0K3hQVFl0WXpwZWxiVUdxUXZXTWMxbHV6RThRb043WGVo?=
 =?utf-8?B?RzVCaHNRTHg1NHdnVXJPdGdHWHZrS0N6Lzh0SkxCYXNiNk9Qci9LZWNkenBP?=
 =?utf-8?B?bzA4NzJpU2h2V3paSitIM2pVRU55Zkwwa0g5R3MyajdSRnVvOEUrY1QwQTBj?=
 =?utf-8?B?cXlIdzROSk9EV2tEVEFaYlFXSDhHSE9IbjhXWWlnVUI2VFdKSEh1eHY2UmNH?=
 =?utf-8?B?TFRVVkpwbXlkbjB5SDZMRk50eDJWQ2szeDIwdXE2b0FtMnpDTEp1djYxVFBn?=
 =?utf-8?B?dmd6blNPUk1GcmpIbFU1cEZoQ2Q5QlJlTWg3M3NIa1lpbk5zN01od24zb3lu?=
 =?utf-8?B?cWxNaWtZTFp2emZrRmVjK280NEdJanhLOVBNSGR2UHk4NE1hSFA4QnppWUR6?=
 =?utf-8?B?ZXpFa3JENU1JQjZRMGgwN2NFMzRTL1lDYmVYaUUweXhhcXVNdGZCSkswdjd3?=
 =?utf-8?B?dHlFbDRNZFh3SGVzc0NUVU5Db25pS2c2VGVoTWc2clM3M1ZvZnR4VkdVWXlT?=
 =?utf-8?B?bU40MkVFeCtLdThNejFkbmZoWEd3T2R6dDY2NlROWDJUa3J5WU10UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82E3D270AD171E468C3BE54094F15330@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	uwWx4YMKo/bqRg4nuN5Jqy0S372cDHFj5YFjeHpInvmnkmGfNlNuumEwpdMtWQYeB8LRFCgjPFsyN5VOkQ88U6LRnSolOiCNP5o9ZJkEd39Jal8kl6O8tSASt69byCfVuTB+MZGKyOSbryO61M92j7QB/bwROwJzm6qyohh/RbceyYZiGO0LrKrxvMVGdJOJ9v8SHzlWub0Mm/HnMKQeXk310j+CS7rgxs4XFKrsF0wKEklFBH/Gw54NGK0ow88fBgXi1kufpaLRMs2BGUbW9VEFHPbXCUkbAqQyvN6ZUgJVgvT1Cy5qCTUTpnMOsM0t3SEkFOmLB/KDpVjPs8Khbw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a07U2A642Ma8Ls6ZcLji9qFuU3OaHEbfMY46jaBeo6wwwg3yOpeYuNJIeWpGsNPSVytJ3FMq5eQUzUU7yLYJIeklBBX71kyFWSx/oSxS+GFlmV2U3TrKSi25q1pvNtaFI9pMcbVLz2fPi7JiojF5SMj5Qbr/vZg2wFYGRyrbB8w+0vCrKkhBo2EHd57O+FDAD5v/UqU3LgfnT7CsVoyVb/EVxDFHqWRukM91YiYH6ixqdZdvdTCodZrUilUYklIRHLUyLLpkgzUmBJog9vdRVB4IyFnaL7SqTY8gcqDZ+p7JQUghgQirgrpz9209/i4o/mBEQADNuEf3JtMswr1G3ZTg1iF3Tjt3Tbq8mslBh723DLuaXBnM6n6kISMzNr6YwkBt4nukGT7xiC/4PSQghx00bqdzN9BSm9P6xo3Qyp7G5hw9ZicXhsRzXtuATQfmKvi0VU0RHjELp9i+MGKPC0hUM0Ox4x32NZkdJG6LpeRMvgT2yQkRZLcstV3uqGBU9/EYx8GL4j9iMavUYkIYoMi8XkqL07lhr9qnNNyygkPiYs04Ohk3UXWgHfzSjy7ZlMHtL0KXdOlsBP28SMq5CrYXUgZkWFA+P5UFc0NeEZMDczJjm7VnZ7O23DqnDp4z72hhm4z3FmwwtTmEkxsy3w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61e7add-0df4-4906-bf3f-08dea7e59246
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2026 00:55:57.6629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pA+1zCNG2FDuHpZy51q5L56aN9PrSdWBdZzDhjONit+gMG37aoeAib//85l8eb1IZS0hvjT6Lspy5DsOzFtL4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6975
X-Authority-Analysis: v=2.4 cv=LI9WhpW9 c=1 sm=1 tr=0 ts=69f54ba6 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=TyO6g7Z6QAL4RHLsGcEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: JUY9sw8xn-8Pp4-qh_bM_rtz3P7CO1at
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAyMDAwNyBTYWx0ZWRfX1Is9rb7KZvFD
 Y64XUXqxtgpxMifBL4oUXSCA93TMX3liAaE+83PLgsawhWlvl6wVen4ybwJgte2unDX346vVWdd
 ktWqdbOfZPdQ4t5xzFBYL8KIf+aZn5OE4CHygQS2q8ZWEVGjCfSJeRHax1nhX2GE2jTphpQ6fyo
 hwgxdEcJPYTOYfXkVknOxH40q7A63clROjGXKNwRpxZrK5/57HU/YZd3By5BxsC6XP2+xOSyUDL
 r3oZupDumfUbiz1Vp5yz9DPeV93v6DUqsKoDe4nF9ghAr4ZRkZTUFHKxw2eBFimuCJVud3rXzYv
 4KlRpb5wilcqGIB/L2OvW8a7ZnP6Ry6EKpu5lXOG+GHdzI14uzS+mXeWsVO0L2QuszcY2rsc5lv
 DGKh+5EaQ1CN+IC21i5Ba0eSzFJgZi4d6MYFHFjIbJ792uqrcW0ZevMp9JjeM3nQv9ndXrh38AA
 z3xUk53ZVeDfHqYyt0Q==
X-Proofpoint-ORIG-GUID: JUY9sw8xn-8Pp4-qh_bM_rtz3P7CO1at
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_07,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2604200000 definitions=main-2605020007
X-Rspamd-Queue-Id: 7F65F4B0B3D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36836-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

T24gVHVlLCBBcHIgMDcsIDIwMjYsIEVsc29uIFNlcnJhbyB3cm90ZToNCj4gVGhlIGR3YzMgZHJp
dmVyIGN1cnJlbnRseSBkZWZlcnMgcHJvYmUgaWYgdGhlIFVTQiBwb3dlciBzdXBwbHkgaXMgbm90
IHlldA0KPiByZWdpc3RlcmVkLiBPbiBzb21lIHBsYXRmb3JtcywgZXZlbiB0aG91Z2ggY2hhcmdp
bmcgYW5kIHBvd2VyIHN1cHBseQ0KPiBmdW5jdGlvbmFsaXR5IGlzIGF2YWlsYWJsZSBkdXJpbmcg
bm9ybWFsIG9wZXJhdGlvbiwgdGhlcmUgbWF5IGV4aXN0DQo+IG1pbmltYWwgYm9vdGluZyBtb2Rl
cyAoc3VjaCBhcyByZWNvdmVyeSBvciBkaWFnbm9zdGljIGVudmlyb25tZW50cykgd2hlcmUNCj4g
dGhlIHJlbGV2YW50IFVTQiBwb3dlciBzdXBwbHkgZGV2aWNlIGlzIG5vdCByZWdpc3RlcmVkLiBJ
biBzdWNoIGNhc2VzLA0KPiBwcm9iZSBkZWZlcnJhbCBwcmV2ZW50cyBVU0IgZ2FkZ2V0IG9wZXJh
dGlvbiBlbnRpcmVseS4NCj4gDQo+IFVTQiBkYXRhIGZ1bmN0aW9uYWxpdHkgZm9yIGJhc2ljIG9w
ZXJhdGlvbiBkb2VzIG5vdCBpbmhlcmVudGx5IGRlcGVuZCBvbg0KPiB0aGUgcG93ZXIgc3VwcGx5
IGZyYW1ld29yaywgd2hpY2ggaXMgb25seSByZXF1aXJlZCBmb3IgZW5mb3JjaW5nIFZCVVMNCj4g
Y3VycmVudCBjb250cm9sLiBUaGUgY29uZmlndXJlZCBWQlVTIGN1cnJlbnQgbGltaXQgaXMgdHlw
aWNhbGx5IGVuZm9yY2VkDQo+IHRocm91Z2ggdGhlIGNoYXJnZXIgb3IgUE1JQyBwb3dlciBwYXRo
LiBXaGVuIGNoYXJnaW5nIGZ1bmN0aW9uYWxpdHkgaXMNCj4gdW5hdmFpbGFibGUsIGFwcGx5aW5n
IGEgY3VycmVudCBsaW1pdCBoYXMgbm8gcHJhY3RpY2FsIGVmZmVjdCwgcmVkdWNpbmcNCj4gdGhl
IGJlbmVmaXQgb2Ygc3RyaWN0IHByb2JlLXRpbWUgZW5mb3JjZW1lbnQgaW4gdGhlc2UgZW52aXJv
bm1lbnRzLg0KPiANCj4gSW5zdGVhZCBvZiBkZWZlcnJpbmcgcHJvYmUsIHJlZ2lzdGVyIGEgcG93
ZXIgc3VwcGx5IG5vdGlmaWVyIHdoZW4gdGhlDQo+IFVTQiBwb3dlciBzdXBwbHkgaXMgbm90IHll
dCBhdmFpbGFibGUuIENhY2hlIHRoZSByZXF1ZXN0ZWQgVkJVUyBjdXJyZW50DQo+IGxpbWl0IGFu
ZCBhcHBseSBpdCBvbmNlIHRoZSBtYXRjaGluZyBwb3dlciBzdXBwbHkgYmVjb21lcyBhdmFpbGFi
bGUsIGFzDQo+IG5vdGlmaWVkIHRocm91Z2ggdGhlIHJlZ2lzdGVyZWQgY2FsbGJhY2suDQo+IA0K
DQpUaGlzIGdldHMgYSBiaXQgY3VtYmVyc29tZSBub3cgdGhhdCB3ZSBuZWVkIHRvIGNvbnNpZGVy
IHNvbWUgY29ybmVyDQpjYXNlcyBhcm91bmQgdGhlIG5vdGlmaWVyIGNhbGxiYWNrLg0KDQo+IFNp
Z25lZC1vZmYtYnk6IEVsc29uIFNlcnJhbyA8ZWxzb24uc2VycmFvQG9zcy5xdWFsY29tbS5jb20+
DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgICB8IDgyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggICB8
ICA0ICsrDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgMTAgKysrKy0NCj4gIDMgZmls
ZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUu
Yw0KPiBpbmRleCAxNjFhNGQ1OGIyY2UuLjIwZGYwYjI4NzYyMyAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4g
QEAgLTIxNjcsMjQgKzIxNjcsNzIgQEAgc3RhdGljIHZvaWQgZHdjM192YnVzX2RyYXdfd29yayhz
dHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ICAJaWYgKHJldCA8IDApDQo+ICAJCWRldl9kYmco
ZHdjLT5kZXYsICJFcnJvciAoJWQpIHNldHRpbmcgdmJ1cyBkcmF3ICglZCBtQSlcbiIsDQo+ICAJ
CQlyZXQsIGR3Yy0+Y3VycmVudF9saW1pdCk7DQo+ICsNCj4gKwkvKiBVbnJlZ2lzdGVyIHRoZSBw
c3kgbm90aWZpZXIgbm93IHRoYXQgd2UgaGF2ZSB0aGUgcG93ZXJfc3VwcGx5IHJlZmVyZW5jZSAq
Lw0KPiArCWlmIChkd2MtPnBzeV9uYi5ub3RpZmllcl9jYWxsKSB7DQoNCklzIGl0IHBvc3NpYmxl
IGZvciBkd2MzX2NvcmVfcmVtb3ZlKCkgdG8gaGFwcGVuIGhlcmU/IElmIHNvLCBzaG91bGQgd2UN
CmRvIHNvbWV0aGluZyBhYm91dCBpdD8NCg0KPiArCQlwb3dlcl9zdXBwbHlfdW5yZWdfbm90aWZp
ZXIoJmR3Yy0+cHN5X25iKTsNCj4gKwkJZHdjLT5wc3lfbmIubm90aWZpZXJfY2FsbCA9IE5VTEw7
DQo+ICsJfQ0KPiAgfQ0KPiAgDQo+IC1zdGF0aWMgc3RydWN0IHBvd2VyX3N1cHBseSAqZHdjM19n
ZXRfdXNiX3Bvd2VyX3N1cHBseShzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiArc3RhdGljIGludCBkd2Mz
X3BzeV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKm5iLA0KPiArCQkJICAgICB1bnNp
Z25lZCBsb25nIGV2ZW50LCB2b2lkICpkYXRhKQ0KPiArew0KPiArCXN0cnVjdCBkd2MzICpkd2Mg
PSBjb250YWluZXJfb2YobmIsIHN0cnVjdCBkd2MzLCBwc3lfbmIpOw0KPiArCXN0cnVjdCBwb3dl
cl9zdXBwbHkgKnBzeSA9IGRhdGE7DQo+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gKw0KPiAr
CWlmIChzdHJjbXAocHN5LT5kZXNjLT5uYW1lLCBkd2MtPnVzYl9wc3lfbmFtZSkgIT0gMCkNCj4g
KwkJcmV0dXJuIE5PVElGWV9ET05FOw0KPiArDQo+ICsJLyogRXhwbGljaXRseSBnZXQgdGhlIHJl
ZmVyZW5jZSBmb3IgdGhpcyBwc3kgKi8NCj4gKwlwc3kgPSBwb3dlcl9zdXBwbHlfZ2V0X2J5X25h
bWUoZHdjLT51c2JfcHN5X25hbWUpOw0KPiArCWlmICghcHN5KQ0KPiArCQlyZXR1cm4gTk9USUZZ
X0RPTkU7DQo+ICsNCj4gKwlzcGluX2xvY2tfaXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+
ICsJLyoNCj4gKwkgKiBUaGUgVVNCIHBvd2VyX3N1cHBseSBtYXkgYWxyZWFkeSBiZSBzZXQuIFRo
aXMgY2FuIGhhcHBlbiBpZiBub3RpZmllcg0KPiArCSAqIGNhbGxiYWNrcyBmb3IgdGhlIFVTQiBw
b3dlcl9zdXBwbHkgcmFjZSwgb3IgaWYgYSBwcmV2aW91cyBub3RpZmllcg0KPiArCSAqIGNhbGxi
YWNrIGhhcyBhbHJlYWR5IHN1Y2Nlc3NmdWxseSBmZXRjaGVkIGFuZCBhc3NvY2lhdGVkIHRoZSBp
bnN0YW5jZS4NCj4gKwkgKiBJbiBzdWNoIGNhc2VzLCByZWxlYXNlIHRoZSBuZXdseSBhY3F1aXJl
ZCByZWZlcmVuY2UgYW5kIGlnbm9yZQ0KPiArCSAqIHN1YnNlcXVlbnQgbm90aWZpY2F0aW9ucyB1
bnRpbCB0aGUgbm90aWZpZXIgaXMgdW5yZWdpc3RlcmVkLg0KPiArCSAqLw0KPiArCWlmIChkd2Mt
PnVzYl9wc3kpIHsNCj4gKwkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFn
cyk7DQo+ICsJCXBvd2VyX3N1cHBseV9wdXQocHN5KTsNCj4gKwkJcmV0dXJuIE5PVElGWV9ET05F
Ow0KPiArCX0NCj4gKw0KPiArCWR3Yy0+dXNiX3BzeSA9IHBzeTsNCj4gKwlpZiAoZHdjLT5jdXJy
ZW50X2xpbWl0ICE9IFVJTlRfTUFYKQ0KPiArCQlzY2hlZHVsZV93b3JrKCZkd2MtPnZidXNfZHJh
d193b3JrKTsNCj4gKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsN
Cj4gKw0KPiArCXJldHVybiBOT1RJRllfT0s7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGR3
YzNfZ2V0X3VzYl9wb3dlcl9zdXBwbHkoc3RydWN0IGR3YzMgKmR3YykNCj4gIHsNCj4gLQlzdHJ1
Y3QgcG93ZXJfc3VwcGx5ICp1c2JfcHN5Ow0KPiAtCWNvbnN0IGNoYXIgKnVzYl9wc3lfbmFtZTsN
Cj4gIAlpbnQgcmV0Ow0KPiAgDQo+IC0JcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfc3RyaW5n
KGR3Yy0+ZGV2LCAidXNiLXBzeS1uYW1lIiwgJnVzYl9wc3lfbmFtZSk7DQo+ICsJcmV0ID0gZGV2
aWNlX3Byb3BlcnR5X3JlYWRfc3RyaW5nKGR3Yy0+ZGV2LCAidXNiLXBzeS1uYW1lIiwgJmR3Yy0+
dXNiX3BzeV9uYW1lKTsNCj4gIAlpZiAocmV0IDwgMCkNCj4gLQkJcmV0dXJuIE5VTEw7DQo+IC0N
Cj4gLQl1c2JfcHN5ID0gcG93ZXJfc3VwcGx5X2dldF9ieV9uYW1lKHVzYl9wc3lfbmFtZSk7DQo+
IC0JaWYgKCF1c2JfcHN5KQ0KPiAtCQlyZXR1cm4gRVJSX1BUUigtRVBST0JFX0RFRkVSKTsNCj4g
KwkJcmV0dXJuOw0KPiAgDQo+ICAJSU5JVF9XT1JLKCZkd2MtPnZidXNfZHJhd193b3JrLCBkd2Mz
X3ZidXNfZHJhd193b3JrKTsNCj4gLQlyZXR1cm4gdXNiX3BzeTsNCj4gKw0KPiArCWR3Yy0+dXNi
X3BzeSA9IHBvd2VyX3N1cHBseV9nZXRfYnlfbmFtZShkd2MtPnVzYl9wc3lfbmFtZSk7DQo+ICsJ
aWYgKCFkd2MtPnVzYl9wc3kpIHsNCg0KSXMgaXQgcG9zc2libGUgZm9yIHRoZSBwb3dlciBzdXBw
bHkgdG8gcmVnaXN0ZXIgaGVyZT8NCg0KPiArCQlkd2MtPmN1cnJlbnRfbGltaXQgPSBVSU5UX01B
WDsNCj4gKwkJZHdjLT5wc3lfbmIubm90aWZpZXJfY2FsbCA9IGR3YzNfcHN5X25vdGlmaWVyOw0K
PiArCQlyZXQgPSBwb3dlcl9zdXBwbHlfcmVnX25vdGlmaWVyKCZkd2MtPnBzeV9uYik7DQo+ICsJ
CWlmIChyZXQpIHsNCj4gKwkJCWRldl9lcnIoZHdjLT5kZXYsICJGYWlsZWQgdG8gcmVnaXN0ZXIg
cG93ZXIgc3VwcGx5IG5vdGlmaWVyOiAlZFxuIiwgcmV0KTsNCj4gKwkJCWR3Yy0+cHN5X25iLm5v
dGlmaWVyX2NhbGwgPSBOVUxMOw0KPiArCQkJcmV0dXJuOw0KPiArCQl9DQo+ICsJfQ0KPiAgfQ0K
PiAgDQo+ICBpbnQgZHdjM19jb3JlX3Byb2JlKGNvbnN0IHN0cnVjdCBkd2MzX3Byb2JlX2RhdGEg
KmRhdGEpDQo+IEBAIC0yMjMyLDkgKzIyODAsOSBAQCBpbnQgZHdjM19jb3JlX3Byb2JlKGNvbnN0
IHN0cnVjdCBkd2MzX3Byb2JlX2RhdGEgKmRhdGEpDQo+ICANCj4gIAlkd2MzX2dldF9zb2Z0d2Fy
ZV9wcm9wZXJ0aWVzKGR3YywgJmRhdGEtPnByb3BlcnRpZXMpOw0KPiAgDQo+IC0JZHdjLT51c2Jf
cHN5ID0gZHdjM19nZXRfdXNiX3Bvd2VyX3N1cHBseShkd2MpOw0KPiAtCWlmIChJU19FUlIoZHdj
LT51c2JfcHN5KSkNCj4gLQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGR3Yy0+
dXNiX3BzeSksICJjb3VsZG4ndCBnZXQgdXNiIHBvd2VyIHN1cHBseVxuIik7DQo+ICsJc3Bpbl9s
b2NrX2luaXQoJmR3Yy0+bG9jayk7DQo+ICsNCj4gKwlkd2MzX2dldF91c2JfcG93ZXJfc3VwcGx5
KGR3Yyk7DQo+ICANCj4gIAlpZiAoIWRhdGEtPmlnbm9yZV9jbG9ja3NfYW5kX3Jlc2V0cykgew0K
PiAgCQlkd2MtPnJlc2V0ID0gZGV2bV9yZXNldF9jb250cm9sX2FycmF5X2dldF9vcHRpb25hbF9z
aGFyZWQoZGV2KTsNCj4gQEAgLTIyODYsNyArMjMzNCw2IEBAIGludCBkd2MzX2NvcmVfcHJvYmUo
Y29uc3Qgc3RydWN0IGR3YzNfcHJvYmVfZGF0YSAqZGF0YSkNCj4gIAkJZHdjLT5udW1fdXNiM19w
b3J0cyA9IDE7DQo+ICAJfQ0KPiAgDQo+IC0Jc3Bpbl9sb2NrX2luaXQoJmR3Yy0+bG9jayk7DQo+
ICAJbXV0ZXhfaW5pdCgmZHdjLT5tdXRleCk7DQo+ICANCj4gIAlwbV9ydW50aW1lX2dldF9ub3Jl
c3VtZShkZXYpOw0KPiBAQCAtMjM1NCw2ICsyNDAxLDggQEAgaW50IGR3YzNfY29yZV9wcm9iZShj
b25zdCBzdHJ1Y3QgZHdjM19wcm9iZV9kYXRhICpkYXRhKQ0KPiAgZXJyX2Fzc2VydF9yZXNldDoN
Cj4gIAlyZXNldF9jb250cm9sX2Fzc2VydChkd2MtPnJlc2V0KTsNCj4gIGVycl9wdXRfcHN5Og0K
PiArCWlmIChkd2MtPnBzeV9uYi5ub3RpZmllcl9jYWxsKQ0KPiArCQlwb3dlcl9zdXBwbHlfdW5y
ZWdfbm90aWZpZXIoJmR3Yy0+cHN5X25iKTsNCj4gIAlpZiAoZHdjLT51c2JfcHN5KQ0KPiAgCQlw
b3dlcl9zdXBwbHlfcHV0KGR3Yy0+dXNiX3BzeSk7DQo+ICANCj4gQEAgLTI0MTAsNiArMjQ1OSwx
MSBAQCB2b2lkIGR3YzNfY29yZV9yZW1vdmUoc3RydWN0IGR3YzMgKmR3YykNCj4gIA0KPiAgCWR3
YzNfZnJlZV9ldmVudF9idWZmZXJzKGR3Yyk7DQo+ICANCj4gKwlpZiAoZHdjLT5wc3lfbmIubm90
aWZpZXJfY2FsbCkgew0KPiArCQlwb3dlcl9zdXBwbHlfdW5yZWdfbm90aWZpZXIoJmR3Yy0+cHN5
X25iKTsNCj4gKwkJZHdjLT5wc3lfbmIubm90aWZpZXJfY2FsbCA9IE5VTEw7DQo+ICsJfQ0KPiAr
DQo+ICAJaWYgKGR3Yy0+dXNiX3BzeSkgew0KPiAgCQljYW5jZWxfd29ya19zeW5jKCZkd2MtPnZi
dXNfZHJhd193b3JrKTsNCj4gIAkJcG93ZXJfc3VwcGx5X3B1dChkd2MtPnVzYl9wc3kpOw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJzL3VzYi9kd2MzL2Nv
cmUuaA0KPiBpbmRleCBhMzViM2RiMWY5ZjMuLjY4MTcxNjI5YzdiZiAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgN
Cj4gQEAgLTEwNTgsNiArMTA1OCw4IEBAIHN0cnVjdCBkd2MzX2dsdWVfb3BzIHsNCj4gICAqIEBy
b2xlX3N3aXRjaF9kZWZhdWx0X21vZGU6IGRlZmF1bHQgb3BlcmF0aW9uIG1vZGUgb2YgY29udHJv
bGxlciB3aGlsZQ0KPiAgICoJCQl1c2Igcm9sZSBpcyBVU0JfUk9MRV9OT05FLg0KPiAgICogQHVz
Yl9wc3k6IHBvaW50ZXIgdG8gcG93ZXIgc3VwcGx5IGludGVyZmFjZS4NCj4gKyAqIEB1c2JfcHN5
X25hbWU6IG5hbWUgb2YgdGhlIFVTQiBwb3dlciBzdXBwbHkNCj4gKyAqIEBwc3lfbmI6IHBvd2Vy
IHN1cHBseSBub3RpZmllciBibG9jaw0KPiAgICogQHZidXNfZHJhd193b3JrOiBXb3JrIHRvIHNl
dCB0aGUgdmJ1cyBkcmF3aW5nIGxpbWl0DQo+ICAgKiBAY3VycmVudF9saW1pdDogSG93IG11Y2gg
Y3VycmVudCB0byBkcmF3IGZyb20gdmJ1cywgaW4gbWlsbGlBbXBlcmVzLg0KPiAgICogQHVzYjJf
cGh5OiBwb2ludGVyIHRvIFVTQjIgUEhZDQo+IEBAIC0xMjQ2LDYgKzEyNDgsOCBAQCBzdHJ1Y3Qg
ZHdjMyB7DQo+ICAJZW51bSB1c2JfZHJfbW9kZQlyb2xlX3N3aXRjaF9kZWZhdWx0X21vZGU7DQo+
ICANCj4gIAlzdHJ1Y3QgcG93ZXJfc3VwcGx5CSp1c2JfcHN5Ow0KPiArCWNvbnN0IGNoYXIJCSp1
c2JfcHN5X25hbWU7DQo+ICsJc3RydWN0IG5vdGlmaWVyX2Jsb2NrCXBzeV9uYjsNCj4gIAlzdHJ1
Y3Qgd29ya19zdHJ1Y3QJdmJ1c19kcmF3X3dvcms7DQo+ICAJdW5zaWduZWQgaW50CQljdXJyZW50
X2xpbWl0Ow0KDQpXb3VsZCBiZSBuaWNlIHRvIGdyb3VwIHRoZXNlIGluIGEgc3RydWN0LCBidXQg
aXQncyBmaW5lIGFzIGlzIGZvciBub3cuDQoNCj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91
c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gaW5kZXggMGE2
ODg5MDRjZThjLi40NzE3YzI1MTU5NmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMv
Z2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBAQCAtMzEyNCwx
NSArMzEyNCwyMSBAQCBzdGF0aWMgdm9pZCBkd2MzX2dhZGdldF9zZXRfc3NwX3JhdGUoc3RydWN0
IHVzYl9nYWRnZXQgKmcsDQo+ICBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X3ZidXNfZHJhdyhzdHJ1
Y3QgdXNiX2dhZGdldCAqZywgdW5zaWduZWQgaW50IG1BKQ0KPiAgew0KPiAgCXN0cnVjdCBkd2Mz
CQkqZHdjID0gZ2FkZ2V0X3RvX2R3YyhnKTsNCj4gKwl1bnNpZ25lZCBsb25nCQlmbGFnczsNCj4g
IA0KPiAgCWlmIChkd2MtPnVzYjJfcGh5KQ0KPiAgCQlyZXR1cm4gdXNiX3BoeV9zZXRfcG93ZXIo
ZHdjLT51c2IyX3BoeSwgbUEpOw0KPiAgDQo+IC0JaWYgKCFkd2MtPnVzYl9wc3kpDQo+ICsJc3Bp
bl9sb2NrX2lycXNhdmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiArCWR3Yy0+Y3VycmVudF9saW1p
dCA9IG1BOw0KPiArCWlmICghZHdjLT51c2JfcHN5KSB7DQo+ICsJCXNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiArCQlkZXZfZGJnKGR3Yy0+ZGV2LCAiU3RvcmVk
IFZCVVMgZHJhdzogJXUgbUEgKHBvd2VyIHN1cHBseSBub3QgcmVhZHkpXG4iLCBtQSk7DQo+ICAJ
CXJldHVybiAtRU9QTk9UU1VQUDsNCj4gKwl9DQo+ICANCj4gLQlkd2MtPmN1cnJlbnRfbGltaXQg
PSBtQTsNCj4gIAlzY2hlZHVsZV93b3JrKCZkd2MtPnZidXNfZHJhd193b3JrKTsNCj4gKwlzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gIA0KPiAgCXJldHVybiAw
Ow0KPiAgfQ0KPiAtLSANCj4gMi4zNC4xDQo+IA0KDQpTbywgbm93IGlmIHZidXNfZHJhdygpIGlz
IGNhbGxlZCB3aXRob3V0IHBvd2VyIHN1cHBseSByZWdpc3RlcmVkLCB0aGUNCmNvbXBvc2l0ZSBm
cmFtZXdvcmsgd2lsbCBqdXN0IHJlcG9ydCAwbUEgYmVjYXVzZSB3ZSBkb24ndCBoYXZlIHRoZSBw
b3dlcg0Kc3VwcGx5IHlldD8gQmVzaWRlIGEgY291cGxlIG9mIGNvbW1lbnRzIGFib3ZlLCBpdCBs
b29rcyBmaW5lIHRvIG1lLg0KDQpUaGFua3MsDQpUaGluaA==

