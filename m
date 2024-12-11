Return-Path: <linux-usb+bounces-18337-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B3D9EC0C8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D10ED188427C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2615DB65C;
	Wed, 11 Dec 2024 00:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rGV7hynB";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="bUsLZr7h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="T2VbB3kf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0C62451C9
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877150; cv=fail; b=hyvO8EPufHQGMZOPO3nlqWsRlscD0D3L2Xao8lVtP0jics1+7mAeMkxdvu9LQ7mX3F4hC98CcRip+b4ujk+ITvNwArgFkMW+q3GSe97h4k+1RQLyO0TOcJ7zwgp8v1rn8aqYjNzxeyDCxS3FVFcf6d7TC7ZMwY0zIZA5caVnJbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877150; c=relaxed/simple;
	bh=FomZa8pYUDsO3wYxLs/kVqaIMPcbI4bVVXblAspuwJU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bX9BslzWo2SFlEUogWN5YAZ7IPSV+fM4lmHEGKj/ahqHE8Ay2Ik6/yYs6VGHCEE27YNAwsTPDxadrJqcUs6ZBH+O0uvGmSVc2IYmFFxoICYvJUoFDxd6fqGi8jJgEdJAfQ7XFc6uoie4J13gOzGn8ggtwQF+Kiac6lgZvy4CKTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rGV7hynB; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=bUsLZr7h; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=T2VbB3kf reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAM1fN8017231;
	Tue, 10 Dec 2024 16:32:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=8n6r/mx0km7e6fzyNwSa167DGRNIm87bm3eRiND/UvQ=; b=rGV7hynBG5D2
	cna+AtQRauqGTn+81odtS8pKr+Y0IHFItKeg55ehMDYEkyBYv2xVRXyrZ0ug2n/u
	jztQrPCooif0YrDTP0OCUBpSxMPp217oNbPc5cqDoKvJql+hIvvMesrqCW0rBLvb
	bgRwqBhl3Yg5I+7ptC9+J3Nd/TfoVlTF+WM+Khb0v+Uf1zCSoQgxuwLweIAdvJAS
	HtbP3a+Xse7v2uPRpeUidxiK9Vgm5B7dPSeHh7zSKuka3BiaF4T3BkOjGzVoMPpW
	xeM8u4L0SrEgOqLnPxPYK0BUBbIRL3z9hrAKZGi1284P9bZa7sT9uBl31NTyO8TH
	s2tEcIrd5w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cp60t0xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877143; bh=FomZa8pYUDsO3wYxLs/kVqaIMPcbI4bVVXblAspuwJU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=bUsLZr7hyjQwoZkagBSCX6wUuF39hTK0LTrnqqvGHATEpFijKJXuc8mera4G/GBBK
	 qR3bgipTBO9F5AT1xXEWHQbSlIRNXoUEZ+OxIXhXC+illDJZ5VAwX2SqoIyGiQZrgz
	 lT1E2+EH5RaxcsLyUcqPwcT1BF3sntG6QuoJXEoF4nZN0CD65+0Eb7nju50LqufOEp
	 N1RG11BdoYn9CdK3UMJY81p0EoKNe+aXRZQyAV4Qsx4TwFDffzkbyY2sGWSW5s6h7x
	 dSLNHeSWgKK4oIyqTm68py1VatvFdiPnCH7G0DcbYfgncuPznEIFh5pVSoJwOGPtmC
	 6TnDJT/cc1wEw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 236B540126;
	Wed, 11 Dec 2024 00:32:23 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D708AA0082;
	Wed, 11 Dec 2024 00:32:22 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=T2VbB3kf;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8C81F4052F;
	Wed, 11 Dec 2024 00:32:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R40UNO2s66iArrw9CqYrtE+w3Ff8FJ/tFFRXcVh0REjnUq3XbRsDCoAjQXUNpBR+XadLEO75TYCoaWIBBrP9OFQz5rdhHPyVpBP9TiIMPBU8J8Z8PRLDYHiwfKGz+KfJczwDmn5OK8sd9ZYoKPgxaPh+ZUTqI5o2qZwmB6q5pPCGTh4MI+L+CxQCfqBA7bWI45w7Oj7XwdFaCjkQTlRLBJA7SeBSXKiamGCjVj8ohRDHTWLvPNGbxmx0lzcE+HD+EDmQXv3/L4AsJyl0ohmdI0zOQ8PIroJDegoByfX80tk9Q9Yf5Mpc9eA1z63RQa0Urbk+MOgYs1YWzBeIHCHwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8n6r/mx0km7e6fzyNwSa167DGRNIm87bm3eRiND/UvQ=;
 b=advPoxhV9znZ2HhCZMSJ3b7PQMz9e5v5mTnt/YNnLF1v122tj+ovfkyfnfp+sR8iGB2X+D5KxHtxcPDvL5Ojid2f9hMpz8Wi+NNeWIv34ZAwVP1l1DsKJQo1ShW4MeRawbl3AdBD0A9e83h/mlzk31cFRu/WAzMtTc/syhW97OPsIv9+qhNf4wkcM1smif0Fq1HCX2DHay9MQ8bJRI0WkxYQAlTgmUamYD69xVe+u0p0e1TOZVE/2Xszwh/+JrHHPaa7aTf0XgBWJo1ciOUJTJOZTP85LDHhqNEoU9TOFf7WWiQUS+U6i2UO3ufX5oxI3XMZ9LzzGQiTZapIEQtP+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8n6r/mx0km7e6fzyNwSa167DGRNIm87bm3eRiND/UvQ=;
 b=T2VbB3kfK1uOnGKSrU8cohEV8Bc6COS5PXvJLmlxqR+EyorVUqyIiB6V0L/TBTuufB+Ye4j8J9eCti83CMW94yeaw0rxEGXeTSNAxOX630J4HyrP1VlLfr6PKvtwQRykpHJoTyqf/NoZBYFFpv9qnD96GfXyfhvw99zfU+rGcyk=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB7691.namprd12.prod.outlook.com (2603:10b6:610:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 00:32:19 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:32:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 08/28] usb: gadget: f_tcm: Increase bMaxBurst
Thread-Topic: [PATCH v3 08/28] usb: gadget: f_tcm: Increase bMaxBurst
Thread-Index: AQHbS2QilL41oIyArE2Gkp8gHuzGIg==
Date: Wed, 11 Dec 2024 00:32:19 +0000
Message-ID:
 <9d6265db4d138e542f281988362bc4392b034d43.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB7691:EE_
x-ms-office365-filtering-correlation-id: 642e1116-0710-4eeb-a4b6-08dd197b4576
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ch3LBR4j+mge4mqrlmAwLw/WWO6AGHPZYr9UIIOHj2j3W/S/uKj5Dya0tL?=
 =?iso-8859-1?Q?PWbMqv/FfzrmvE0KSQV3fOtuLxxLQjtLZQoYQ0EdpoPUomRX2DevGiGLIq?=
 =?iso-8859-1?Q?eM1MRUbnNrm8i1lRYAU/+ry1uXUtQRl2eobB9TPbnaUQfQ22TdusD7fAvA?=
 =?iso-8859-1?Q?7fWfF7ZWyKkV3dspvsocLTabMIyCmxytU+a+J8+319vwKTXgRjHtSU8HGy?=
 =?iso-8859-1?Q?6IHcXUppJHstgjHZE8AwAdcumTB6C7w3Qjzw6V/Jeqt6u7fjz8DF/oCSbt?=
 =?iso-8859-1?Q?Ou6GvR3VUZCZA3l0edMfjB5kgBx/7MyE6mhP13lRU/0Gymfq9EtI1vkhOi?=
 =?iso-8859-1?Q?ThQixBgF5QpkfJ/3Lw+K5/bi+wNyQjz/xGqhJ+EDIOnIYcS7E0zUYf/Dq0?=
 =?iso-8859-1?Q?etFPtEd9qIz76NtOqGjkg/h40NAvC6tcg+ukGUZPEzvzIM40U8RgWm4abV?=
 =?iso-8859-1?Q?MMvSUtXPsFUBzOvhD3m6z/MXupfcV1N5sMFifAM51NcUgRR91WOi2lfpUy?=
 =?iso-8859-1?Q?HFmkJvwDWGbhJXwBzWe0+P+W7si4N3ubWvMgbLrmD+kD0XDIRwfVqwgKQx?=
 =?iso-8859-1?Q?frik/JCRopWoqJDRr9Hg6OgQZmFYOGKdBzSUw3+QKr3fDBsbKyrnY7B2Ps?=
 =?iso-8859-1?Q?6SZlGoNiCn0ZULCc7dUAxRXdvMhyX7wDZN3XCZuVrP5SmuiLurRhn23KEx?=
 =?iso-8859-1?Q?Ju7uMrexHsWPOrWljaoyiKwZjNbiwcbfHlE3axVIuqmRwiv6Ba28WX7jaI?=
 =?iso-8859-1?Q?FKYc1wwRIUnY1/cYGMqQPzz32KdO5jY2UVMNXTw6mhHRF6SKGehYb+XMWx?=
 =?iso-8859-1?Q?kXC4ogwatJamjSfdZ7tlSJXEGP460OadkVAyXOVeOZnuBl8jvsm2Is18UZ?=
 =?iso-8859-1?Q?DEdpSu8Ck5PbHg/nPI6hH6PUXKZTelMTLaiIj7wV/61ctYTCyMud7Zs0VP?=
 =?iso-8859-1?Q?K8noSJw05fAZNhYoHQtGFOPk5Cjfrjt4FN2OvZCNAvLkx+ChOnJ7ajLgQa?=
 =?iso-8859-1?Q?SFaJHNUZnYVynlnDXyoJ3cOs5RVFAZdplaeUAZ2ue5jWgevxYrowbG/+lN?=
 =?iso-8859-1?Q?VYl1TrE5/5JbnkMBgVy2mmCJ00vhe8aEPF7aPvLovfcw2MOHKjk0upErEQ?=
 =?iso-8859-1?Q?KVC8hMCE74VmzK3CYYhChm00jFeXHgBayKG5NbhkV9FZWMFDwymBAwRqgu?=
 =?iso-8859-1?Q?md6E0NzVHXiN674JaiAsTtbpycc4iyql4X+yu4hr4t6LK8nKpWFspYq6gr?=
 =?iso-8859-1?Q?K8MQEHflJNXEa4bL03W9PtaBqOy+MJsH6qt5ZY++PHhIRzgahIJCYZffln?=
 =?iso-8859-1?Q?Hhi883I9NOYFUAhD/uEDA9HT2ycZp7k9RJ4snA0N/edvPMgOfznbvwdPF2?=
 =?iso-8859-1?Q?aA6GxkXLOEsCKBD0Q9llckMGOuQHEbt96Q1py/rG2B+ntoqxIxRpQU6l9j?=
 =?iso-8859-1?Q?yW7GWfjFCHTFdajUuG5G4Dt4ysWnoMqG775fUA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XvsbFcorvPpWxKHYxAlFfC4Ae8uAyufzyNns9tpeP981I7BSU4VcxosL0C?=
 =?iso-8859-1?Q?k7pA50qR+i6/KJXRziolPMvQps/04OvlNMugc18+bIuJkLWeBOYJP9+FtM?=
 =?iso-8859-1?Q?hm0vx0bThXYVac4fqSZ7nP5EW45nSNpFEbYVpOsiL3EFCs4i+SC6SXFCiL?=
 =?iso-8859-1?Q?4yGn0y/wS8KURyiqCmqOLFbNY4tUQBqZhld/KG/J+zdMleV1GqxmOYCBGm?=
 =?iso-8859-1?Q?6VgqH0daNAu3PgP1cuJq9X+eBqjhfQBYea7VyQ7wY3keD4i6X1thqFpTlD?=
 =?iso-8859-1?Q?RtUjkA0DYuq7a66IWJ6lRLlx6Hc8NQC+KV8BHXrbeezyHcFK5jyaPrh/D1?=
 =?iso-8859-1?Q?3FrhDUtt5UZZKJkEu/bDOgiLslNMUI7ge+s0O0juuZIB+UY2Vceigh9AsJ?=
 =?iso-8859-1?Q?FWDcSRCM9eUAa8bIQlE+/LxSmOdR3LZ2CkhEvqnN3MolS1QkFe/6shJ9nG?=
 =?iso-8859-1?Q?lj7ZwPNrnkZF+bSVUMgsPeYl9YGfGfLf0TZZjQhygiCHpPeVN9VJzwYvfH?=
 =?iso-8859-1?Q?VJ+wR7z45Jaa6x0IDdNo7vbWxq/x0QiUv0DE0AX8/BUdw9o2qu/21biHIf?=
 =?iso-8859-1?Q?+UPYiVkC6WjFP+67rDrokQVRyNoDHcTtT3AFF7J/9jxVb3vyXJ6LN1UOi1?=
 =?iso-8859-1?Q?/D2gg+EFjYrIUut59sR6vvfB+2Ia36QnpGovlLugGKfAQXV9xBZahsuLx/?=
 =?iso-8859-1?Q?0Ucbp1heTQImt4wzMUYxwgaNRJ54V+gf5NQ4dV1t278EjSY09rub+82o/t?=
 =?iso-8859-1?Q?TcYnelQ8ouK28UibZVc7F2gz0m/FstkhW2Z7ZZFbMmSJIMBhDt+II1PXf9?=
 =?iso-8859-1?Q?d/jczFMN8j4pYub7NwSmuzaPLFyt3V2N0bO3napU8rmAbw7Qe/suz4exdC?=
 =?iso-8859-1?Q?TFaEkT3ABKdw6Ai4y3XhxKvQF2HhI/mmD6kv2RA/CFHm63ZyTemZK7cQH2?=
 =?iso-8859-1?Q?y2Q27HPa77pUmzH2/1gMOKWu5UGoOhAzzYIfyXDK7kZM/n01s2vr271gIU?=
 =?iso-8859-1?Q?RpKqFR9ov7LUFHUa09Mn6e9glPWRYpDuUfl7uqB4QPGejspvyHkhdNjbdM?=
 =?iso-8859-1?Q?LvMOlNfrd3NEQNyDTXqJWLjzc/Zi/a3MKOH9fMLZXarrG8rKkY5IgHvyTa?=
 =?iso-8859-1?Q?FziOQYyHmwcco6dIH+0+y4LNag88lWMzRLKjAPucq1Pm5x4vtGcqmUWdgA?=
 =?iso-8859-1?Q?JC7e/JLPI82mMeC22Ry0oUg0MrICiZMVej2+5+FVR9tmvTsn0GMl9n+RBQ?=
 =?iso-8859-1?Q?o0DiEhQoEApqkfONBbfeHs8GXwcTAIpFepzXCA3JV2ZZBW4DY/eWm0PZhW?=
 =?iso-8859-1?Q?5STHjiWYf3cPg27RT9Yr5s8V+cUFP31pEnr2vWIgAdDbtwkMbuDKaw3FmE?=
 =?iso-8859-1?Q?fqtMV4TKPAjb6u8aj2VDqcTbQ9Cb2OXD34XLLnT+32FOXo29QwAruMzA3z?=
 =?iso-8859-1?Q?JVOp7ca/77QTPE4rC4a+epUqXIrYjFAkilgVVFNQ42CkI5djN5NR11VNH5?=
 =?iso-8859-1?Q?g6Cjur9wg8Vpr0eoKlgwmReaOfUDYM3QFfVKhxtEFPIudlYk+RL9imLFk9?=
 =?iso-8859-1?Q?L/zbGzcgZZzxXfO8/SFuPauUjYSvTCnCxC1+Bp4nsrpl1PRsgd+z3xbPLj?=
 =?iso-8859-1?Q?SaA1v9xofwm6O+e1+wDpmV2sFmhcrk6KhyyzDqc7q6Jy+WgLeaq+xnWw?=
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
	sGyK4qF//1QrwwTLcPdf62MoIguDviySQaePQZSzsxCOSKgpWxVSx+Uxq2i1ijpgXD+RVTLBNJEbtYS/i1bwWJ2hcHudN+LwG+UEOFuMhHkaMXGMQC1z48hHPJl/GkDIhnDOcxaVdRCgwN8b74uoNoxjjlhDrrOUpC25D+f0zriGmUD4O0UQzStu6CwnawNcrn3ZfnL9hLcounXXbx+XGLLDeD9eMQ6ccMk7lQWLDfAJlVM39TDO9+6s3/LV/FJoZBlScJ/di0Rv1lNLjIF5hftKsyW1I20cv9WVms0vWKDsIjljmCZjLojiAMDF6zQkXh1ynbuTTK9kLGcqgVcM6AvMy66ibRrJNChew22eR8cpdwAK3O3cQ+tD8HKtfF5JqiRdyNc2T3IkyifKA7hluH3akVXTk5EvcPjDYXwuZpbnHgH3eOHf0uoyBnaZUwB7S+QVxHLLLt2BOj6RUiADLfUog0tKtJcw7ZABZ5lelFhJzekIULX3gVVcQTogOD/X+Rd2w37eqVwFo5KA20yXmzsSf3braBkeqxrZhJV94qqJ76uWSds7bNdfwTHGQDczyBrc3q0kZ2kBOAbDnP5VNC3wVaI5N7klB7TMCknjE9DdF27SclwmdY140Z2LvQc2KfapNwAHNRt1e6vLExC/UQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642e1116-0710-4eeb-a4b6-08dd197b4576
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:32:19.3279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q/WMuUo+f70BZznufch+xVKfcgC072XIja2IUktdBxa09qYitp5EdXzwVtOAphKvqmsP0hrbtxljOIQkqR+tLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7691
X-Authority-Analysis: v=2.4 cv=Z9YWHGRA c=1 sm=1 tr=0 ts=6758dd98 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=MxBP6jBeIhJ25oVtBTAA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: PiVbKDDQE5teq-EqR5JkW39rJDj4ocGC
X-Proofpoint-GUID: PiVbKDDQE5teq-EqR5JkW39rJDj4ocGC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

Currently the default bMaxBurst is 0. Set default bMaxBurst to 15 (i.e.
16 bursts) to Data IN and OUT endpoints to improve performance. It
should be fine for a controller that supports less than 16 bursts. It
should be able to negotiate properly with the host at packet level for
the end of burst.

If the controller can't handle a burst of 16, and high performance isn't
important, the user can use BOT protocol from mass_storage gadget driver
instead.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/f_tcm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/funct=
ion/f_tcm.c
index 4fd56ae056a3..1c93f07daa7b 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1724,7 +1724,7 @@ static struct usb_endpoint_descriptor uasp_ss_bi_desc=
 =3D {
 static struct usb_ss_ep_comp_descriptor uasp_bi_ep_comp_desc =3D {
 	.bLength =3D		sizeof(uasp_bi_ep_comp_desc),
 	.bDescriptorType =3D	USB_DT_SS_ENDPOINT_COMP,
-	.bMaxBurst =3D		0,
+	.bMaxBurst =3D		15,
 	.bmAttributes =3D		UASP_SS_EP_COMP_LOG_STREAMS,
 	.wBytesPerInterval =3D	0,
 };
@@ -1732,7 +1732,7 @@ static struct usb_ss_ep_comp_descriptor uasp_bi_ep_co=
mp_desc =3D {
 static struct usb_ss_ep_comp_descriptor bot_bi_ep_comp_desc =3D {
 	.bLength =3D		sizeof(bot_bi_ep_comp_desc),
 	.bDescriptorType =3D	USB_DT_SS_ENDPOINT_COMP,
-	.bMaxBurst =3D		0,
+	.bMaxBurst =3D		15,
 };
=20
 static struct usb_endpoint_descriptor uasp_bo_desc =3D {
@@ -1767,12 +1767,14 @@ static struct usb_endpoint_descriptor uasp_ss_bo_de=
sc =3D {
 static struct usb_ss_ep_comp_descriptor uasp_bo_ep_comp_desc =3D {
 	.bLength =3D		sizeof(uasp_bo_ep_comp_desc),
 	.bDescriptorType =3D	USB_DT_SS_ENDPOINT_COMP,
+	.bMaxBurst =3D		15,
 	.bmAttributes =3D		UASP_SS_EP_COMP_LOG_STREAMS,
 };
=20
 static struct usb_ss_ep_comp_descriptor bot_bo_ep_comp_desc =3D {
 	.bLength =3D		sizeof(bot_bo_ep_comp_desc),
 	.bDescriptorType =3D	USB_DT_SS_ENDPOINT_COMP,
+	.bMaxBurst =3D		15,
 };
=20
 static struct usb_endpoint_descriptor uasp_status_desc =3D {
--=20
2.28.0

