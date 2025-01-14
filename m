Return-Path: <linux-usb+bounces-19291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98806A0FE46
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 02:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FB3F3A6FED
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jan 2025 01:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5407081D;
	Tue, 14 Jan 2025 01:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="sNJrYJ2Z";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LXvHMNvU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="we24bWdM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE235964
	for <linux-usb@vger.kernel.org>; Tue, 14 Jan 2025 01:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736819450; cv=fail; b=c4WfnMDezC86AndWBJP08fyImBrUjlLKQ9O1C3gXYTZ673gulmZJjCcwTBib+hU1F+QA7XlbaMLokEMMSsCyUV1cPwiBuYBFDX7IyGQbhiY3fAdIcsz8EfCm8TcENMHbX2QNDdU5watUoiuDEMtWRbk2Oto6aZeFEKNkk0ao9NI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736819450; c=relaxed/simple;
	bh=ajyKnvQlTWv0cOLhFFZ+DuL1hcgwKqZFwFRXKUxKmLM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=t0nkalxXnTVfqoo9pRhWIL50tKs6dWw1DlUurt+O7lyX2ou3KanTS+qwLZphRzyl6phOJhu38od9LZzDHNvfjn96W6gPk37TWHW5MBKo3IsLx7cnuduuTTtzoQG2biaDJq25kT316ylP6yxbQG0p2Bxr7pyXV6fKCH6wN/NHkl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=sNJrYJ2Z; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LXvHMNvU; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=we24bWdM reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DMP06M003610;
	Mon, 13 Jan 2025 17:50:46 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfptdkimsnps; bh=KlcHJLBaJwhgyu96TxU
	AfxnvfDHNtDOsd3/ZLKXBixQ=; b=sNJrYJ2Zcjepo092NJdaBuAhpNdTu8gsMak
	aPvwezgzpXBDiEbGT9SJcO/FfI0pGEkKVeHqlzWUJUfaEH4ZXskW5tfBKJbS/Hzv
	3zQA1Dj0w7F6B10gby46gzBANNQEMMPI1KKKxurW5eeGh5VmT7dNmmw+kgPJ1cpj
	1f7+Mw+2toe8pNLjuZqAAaGI0LeeuokddXpFSibgx/LnMMEgMKfpaUZr4DThoqNe
	Ue5Qo7PxXkZBe7F+OE4uwehnKIhiR5W+q6Sv2E4HUJZmWDlNW5kQSp7zfB4FFTko
	cb25ojb0jIn161BNvA4lTnT4sC1EDl9OsaxHREJ4+bJyaf4qIXg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 445bku8pk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 17:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1736819445; bh=ajyKnvQlTWv0cOLhFFZ+DuL1hcgwKqZFwFRXKUxKmLM=;
	h=From:To:CC:Subject:Date:From;
	b=LXvHMNvUjCiWx1gaX3Pc/EuWQvZ7QVwUlX79jCP0Z0eI2ijwxgKYxfmIIgpmiGYA8
	 rMqJ7PQMNBgApp01h7KVd0Pee6MseiuS42tpzAzdVz0ehKpdAeQ2nrF1/KlKqNSyWs
	 ptApi/6zTEpjjJyRwqAala9wqT223NVTJqF7UIS9eY8dSRP9VFJsDPb98GHZNeT8cl
	 Cb91GlzEzhQ/I/31rpP75YOKZQ92aVy26oxDH05oqIkf7PodOkQMzFqbSjYxTJ81Re
	 75tSSxmieMOqzxnSG5r3GJpey+gY2wgfDgafqLrYFJ57PzJiWNTgN2SkVbtQSBEpxT
	 oiUVnQHhtIsJg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0CEF7401F8;
	Tue, 14 Jan 2025 01:50:44 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A7B02A0076;
	Tue, 14 Jan 2025 01:50:44 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=we24bWdM;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 06AB340A8E;
	Tue, 14 Jan 2025 01:50:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yb0cZLfrJGxYwYyD53k6A0SRdMqk3ka1fB5ZUaN75CjIcHFMFV+DjNm+CXirMSLK9JOwh1FKXTpvJj4bTlfmXEL4wz9mzvWyfhHH5jup9txXmuWOjj9qmrGYOW/u7vRH/9nL0GLHYc2w/z7xk8WSe9UJxZNzhUKTJ+076Rz3O67Ubu4MNqEP445evDEYaFxLY8l6PwEu2a3BChzN+muPDnPATXxZLmzjlqztP1dJ1t7iSPBCpDylXjB53SRq+EFJKR5T05tLZ1YJeRuBFvRkiYdpO4cTPX/c1Zy3NJd744tb1Ejt4zaCqf3q95OYqIwnMhydBTtSUpC4R58UrybT0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlcHJLBaJwhgyu96TxUAfxnvfDHNtDOsd3/ZLKXBixQ=;
 b=AvHKOM/KCsVroo/B+ykV6SkrHQSCHabq3PVo4Ek9b5JLtbHst39LPTrIR6m1kUsmkskBPRecUBTbN6tk1WEaJK89cuydENGOSJePEABSeI4R8a5LSHMbxmGYzaZkktxbbqBbhjgCHu2bsBtIfBPZsdzGMuKJFsdRDYapmpzYcaAeb9o7wQeaErh7/8lLlGDy8wJE0WcRjtDYKiZMVkZE79ryro+UD07IrbBGWbRYmy5JzwO3wq+jELUXEQrlNVFVAUw0441qlmV82eIPsy64Q9m9ZoTGIB2BonPC1djViwdNIl+RJsOAd5dv9jVmnUJJxbzQ0rQ5idEBnNQ4B34+Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlcHJLBaJwhgyu96TxUAfxnvfDHNtDOsd3/ZLKXBixQ=;
 b=we24bWdMTLB2TvwsT4rtBrMY1zsYQg3LLAVT4s68k03Mr8DKH/oHBosiZN9AQxicRJ+SNzVegXSBRvRDXjOkWx8sA9vuRD3tvAPQmYGmi13v6g4zOQDHEGp3uLOIiZLeT1VAm1iqC0FMnf+3MZBv5npZHjxXE1XSvgsa5b/079s=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB7254.namprd12.prod.outlook.com (2603:10b6:510:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 01:50:38 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 01:50:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: dwc3: gadget: Reinitiate stream for all host NoStream
 behavior
Thread-Topic: [PATCH] usb: dwc3: gadget: Reinitiate stream for all host
 NoStream behavior
Thread-Index: AQHbZia1urHlAiWN0UaEKbSwVE/uaQ==
Date: Tue, 14 Jan 2025 01:50:38 +0000
Message-ID:
 <b92ae94c86f01f165d5f178b7767898573b6dc75.1736819308.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB7254:EE_
x-ms-office365-filtering-correlation-id: 471bdb4d-3b45-49ea-d846-08dd343dd83c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NjfQz7ExgHWHGuZGsr81jpMffrQHXcE+WRpW7th2auJoVImi1VULq+mphz?=
 =?iso-8859-1?Q?WHQHKjTbB3UiGI1OKhysOLYawjMT3EPNp2K+tEYvXHV1hdwraPgxwIRxW3?=
 =?iso-8859-1?Q?i5MUqy/R/o03xjJ51P+0ZtB5sjKOR7dulShTyIxHOD3fjQxZbNMlh3IOpv?=
 =?iso-8859-1?Q?l/mtOU8UFoSsK1YDWT6Z4yNpFWTRG2j+LWDBdTAM4AtgoZT+mt2JmWWv/U?=
 =?iso-8859-1?Q?mImJcCe6I28HCL5DqR3BxUSTHnPvosJ4ycdoT/6iqhSSYZBd+27F82jBWq?=
 =?iso-8859-1?Q?tISERVP0msAXGUeHv0xJI4RayhAHqaLmC1ie0XNVZEDqJOntCQiG19MrxV?=
 =?iso-8859-1?Q?OgzFk90dSpJQ1/ECVqPwRJPc3MVMKjxaMeJyCVruW2gn8820HzKgE3BfaZ?=
 =?iso-8859-1?Q?41fAcKc88TK3yPyjwdlTV+a0jaGBF0R2mfyQYsbhQyUAXwVtBGWR/mncwo?=
 =?iso-8859-1?Q?BoQw5Rc68xsjca5yDjBZnvw1GjOLoyMaaWCu+cBHhRJxkjis9XeNM2zMac?=
 =?iso-8859-1?Q?FJnIS53q3kBi8R7B6F9t4HWjASPMzuBuiBP0ZaNE7UZmokGgRjEFpC47Yo?=
 =?iso-8859-1?Q?We4yhc987zCca8Ri6CJX/5yTxWryJsG9OfgQGpjsknp3XOUK/0uQAgotQK?=
 =?iso-8859-1?Q?nInU23bEqlcwZguqnFpIHBrqvZs+V0wTKQQv4dgjU4WphPq93itc2Kq3FK?=
 =?iso-8859-1?Q?MS2lQY3bPOwUkR17ln/ocT38JxRZS13faQ9YUj1gP6Kf/SQfFlaQ0fQaE5?=
 =?iso-8859-1?Q?lcSO705JIuI76XNbZze1EyJwEqj6ahXuwNk0gPwfyBSuKibP6easTdb9Tc?=
 =?iso-8859-1?Q?rOWIdGhZON5sjQAJv+Vxw3rLjmYF4jJBjrCga5YiTlssTSSlkTKkdU/E+q?=
 =?iso-8859-1?Q?DNBLdIwLh63DpQ565/3xvDwOGHK8Rt4ZHdS9Vx7NwWJW74m+ZUe4TNg7+Y?=
 =?iso-8859-1?Q?Te0V5Y+fTG3wZFU+JCK8IgTjEZdBOTOOR3fsPp8bSWP1/MgoEzV5WXHlq9?=
 =?iso-8859-1?Q?+KE1fp4upB9WT50EPSh+2ZCRRlEITtLjbydnJEAwuFj7uH+r0a5iehbWSM?=
 =?iso-8859-1?Q?jzRttJMLIxOWduqeBkZl+BK1yPv/G0WSMxPYQd7X7tF5NeDLI0lFNeCSVB?=
 =?iso-8859-1?Q?Qp1KUoSSyqGsvFp1v8aJB3Bd1hwXg9PUPY2Bi8ByWDuEm12hg+wG8Ua5sC?=
 =?iso-8859-1?Q?ve6+DEjRFzZxn2zWRVpgtqx7YLLgT3Ua/MWRX5hVcc+d4xBL9KCrIqyuT4?=
 =?iso-8859-1?Q?IzBlgqBHxuC2IADhNjsjkmDDz+EokBX5FK1paXOWBThWoKNMBwa7AYyMMX?=
 =?iso-8859-1?Q?gRHCkYf0AgCkjqnTmjCeDmXcbPXd/08PwrR8z/E43siRz6CmbQDxp4M+Z7?=
 =?iso-8859-1?Q?G2r2xSPeQ0Vb4GMtJaOaa926ezbhF68NmfOfbLorNpNYS0W8+5i9xEQ9Hi?=
 =?iso-8859-1?Q?j/zUld/VLRVn3cmonpSQXVbJBlGzm583Hov9OH9n/4+vEffG8fVLhmQAHd?=
 =?iso-8859-1?Q?MqWtN83tn8KYkDkkR88+GH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8TnlNHKnNmlOS6u1x0IUmhZ743d/ySbQ1DAnjqhepyZDESqiH8hVC2rR+d?=
 =?iso-8859-1?Q?QPELssFQPMpQGcOSZnRweinfC4VI9Mhv/skRPTQsk7Jxp8Ycb/jbyi1ivq?=
 =?iso-8859-1?Q?ZK5mnEfGqbmQAVURSZ0QH/QE/bXXsMDldmRbwtJRcYTcbfNhPVlw//pAFq?=
 =?iso-8859-1?Q?M5dHRZbBcgTU3b7DssgjTs3k9RIHsj165lVyhahOqD8BPsX6bVOyEh8PPw?=
 =?iso-8859-1?Q?1WCbQfTWQMhW3ZqV41N+xzRBKgqB7XwAnb5wxkAfw846kK4vEr8m1iW1C/?=
 =?iso-8859-1?Q?qtx6+djWzcDMV3gbF57zNxvjlLwgYzkJ5xUKh1dyQkyNbM8c0VikauPfR0?=
 =?iso-8859-1?Q?fGvMvcbTMwoGM5BvxGWG7FwYakFFNVu/xZXOXe+3SNKdM3sU07AVWqn8Fd?=
 =?iso-8859-1?Q?yeOVRKf7ZZXFADPaypDKmkqLtUfahLnVLJvId71mARvdpl9xUVhK5oWgZI?=
 =?iso-8859-1?Q?Ap7kYzywLqiUtjD6qrziXxhAxlTGKlX9w3LPGsp6RO/qEE/HIKpp662BoJ?=
 =?iso-8859-1?Q?0V8gdjo2VW1eqnJLUH5hHXaPgNeHUquh2O7gTOD1f3i2LO/h//dqH6ELjO?=
 =?iso-8859-1?Q?1VwpvAnPH67qiwmfA7ROjKDzla9vrGtnuGbSvvqBMmRD2Z66jsgAuLsFUR?=
 =?iso-8859-1?Q?TYsB7L8f1yuURMBecFIV7GCDRHYnBFU/MUetSdayR1ctfz0GY7CGm+s53k?=
 =?iso-8859-1?Q?zGeaBthslcqUlH4QkzzgO+UsVxu7LnMSTxxOSqAKDd+tnBr0HHaWEfqnxk?=
 =?iso-8859-1?Q?rtX71ZLHV/VSmS3jCv9FpKAa8s69k2x69ARsNrrCvhFvsLsifrGMdaDs8W?=
 =?iso-8859-1?Q?zx0NpLXJjolKPcfbxtzddCkPxKy9DHnSYoItlFHdOf5APAlnMLDXXs5a0n?=
 =?iso-8859-1?Q?LokbIj4PLbdxBAlJRuwL6BtRA/yUC6LbkoucuLyhTLcxt9thvmthrFl2Go?=
 =?iso-8859-1?Q?ceoO/UiwwVhGT4nf+uvLHKeRZ/kf7Yt+VldGUFNDJi2YEQ7GJU3AzKFtob?=
 =?iso-8859-1?Q?pMHvMlBrCaagKDD80zM4liRVIk3GqFkvT1kZS1PwGv761B3qpkWTnMYfrA?=
 =?iso-8859-1?Q?irsd73CO3+KDu+1Cs+Y7iDOcdzPb3QjwTMvQkGSKiNt7VGJF77RA2GOOI1?=
 =?iso-8859-1?Q?OYDHKBpLQlZlXzJIgVacHvTedJeHyGswk0DvyUCb5FjbYIGud0T6Al39+f?=
 =?iso-8859-1?Q?+lIIBuUl2DxfixYiUe3p5QsO2NxZEcV6r0RTbUd1uhqMRu9iFUYIQq/BWr?=
 =?iso-8859-1?Q?cc+jxpzlyms6zbzEE9+D9/VfYfY+BcHhunAjdQ4y067v/uhE1Pq5FGyOVA?=
 =?iso-8859-1?Q?kqMwWKyE4fIQ3c6EMQRZf5M9ZbwrVmoQmcRA16cuwoDRJCuR1zMPlbGgnR?=
 =?iso-8859-1?Q?rPEgAAZXHFglFsWfsM1hYHFaGT6z//ucVqRIlnA6PrknCoePhOTroURbTU?=
 =?iso-8859-1?Q?CBIEHBC7l3UM76ornyV3wRAdeaSRp8lWDmfgGKVbC4cD3FHkZ5Myct7VvF?=
 =?iso-8859-1?Q?LSrHZPMrSk0X2+j88dBHFuO+pZ7vEzEGRifetL/qN3FDYATABuWEpvYlfd?=
 =?iso-8859-1?Q?QkV87qBQUav2gwaR+CwJc4M96ZEmG45UkI9uln/0+5nYhfBq5pbMhrErhp?=
 =?iso-8859-1?Q?H7US6ri8X2Ap77AOCacPZebfGsRYu3wBpIXylRNLBPicy8W67FKQBwuA?=
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
	0L6AFFaN8sbJN5hzOkwixJC5oCUnq9ty3iWzXPHEt8JQ6RF9MENl+pYjTTMDQQTKqtJXZvPKAt+LmEZcRgdy8d34BeJHHRD5Uw3ruvQVSlNzBoeEDOP3BWqTlF4IeJ7/Vfi6vosUEP4AcS1Uamm9M+30/uaztR2RiM/kYJw0k6rYcj13bMVlaesXY9uAPyVMCzXs0FtSwd1B3jNL7jjhubGsbsrjmR8B5XI31FgHh9LgVZxbR2TP86+6vSV9Fy0Wbus+sR2Oy17PLIuGSEgrUvUw0xXCJnZRgR/PkNStVv9QzExC4WBuqk6pLPCdr/F5x5H5n/pGzy8c2VNG/7hm4sCY35vIV1cGXpmNiGqivp8kckgDzU4HNgBfc4s9Dg+opxv7Xo0hWpef59VGnYTl7Gr45rLUEpo5Sqjb1QlBQdB2ekKFejufFH6ogCzOMqI0kvB1Lxro8+c33akyOM0xAvf0EWAozi2Xek9JAlqJS9ttKyC+BUD+KPiMxuUdwhjh8CRXPAiPBT/IEpvDja6zXPCfymVQNqfbgA5ch/mXkxOW+eU0yiVEyz+WHctLxeFmKqFQ0sp98FITJhnzQOWKWO+kebidv1qFrl2H3/yzQkJK+IuSAXT4n6pI88UlH9kVJzTdSQAzTScAl0jwYulaTQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471bdb4d-3b45-49ea-d846-08dd343dd83c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 01:50:38.1416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e0kFVUI9JYkDdE2MslwttF/PcVztYy+ZJ9nTg3/Cn0+SkmzkAZhHcQWY9ooysowl0uarpglfqYQZs9doQ1B8LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7254
X-Authority-Analysis: v=2.4 cv=X82oKHTe c=1 sm=1 tr=0 ts=6785c2f6 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=aHFwvX23dDjJwSdtd7gA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: 57qEf2SYHJekXIvGbJ6rnYg3Y_CofPyb
X-Proofpoint-ORIG-GUID: 57qEf2SYHJekXIvGbJ6rnYg3Y_CofPyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 phishscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140012

There are too many different host behaviors when it comes to NoStream
handling, and not everyone follows the USB and xHCI spec. The DWC3
driver attempts to do some guess work to interop with different hosts,
but it can't cover everything. Let's keep it simple and treat every host
the same: just retry on NoStream after a 100ms of no response delay.
Note that some hosts cannot handle frequent retries. This may affect
performance on certain defective hosts, but NoStream is a rare
occurrence and interoperability is more important.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.h   |   3 +-
 drivers/usb/dwc3/gadget.c | 109 ++++++++++++++++++++------------------
 2 files changed, 59 insertions(+), 53 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 914fe79d08e8..ac7c730f81ac 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -743,6 +743,7 @@ struct dwc3_event_buffer {
  */
 struct dwc3_ep {
 	struct usb_ep		endpoint;
+	struct delayed_work	nostream_work;
 	struct list_head	cancelled_list;
 	struct list_head	pending_list;
 	struct list_head	started_list;
@@ -765,7 +766,7 @@ struct dwc3_ep {
 #define DWC3_EP_WAIT_TRANSFER_COMPLETE	BIT(7)
 #define DWC3_EP_IGNORE_NEXT_NOSTREAM	BIT(8)
 #define DWC3_EP_FORCE_RESTART_STREAM	BIT(9)
-#define DWC3_EP_FIRST_STREAM_PRIMED	BIT(10)
+#define DWC3_EP_STREAM_PRIMED		BIT(10)
 #define DWC3_EP_PENDING_CLEAR_STALL	BIT(11)
 #define DWC3_EP_TXFIFO_RESIZED		BIT(12)
 #define DWC3_EP_DELAY_STOP             BIT(13)
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 7270f092329a..d27af65eb08a 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -996,8 +996,7 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep,=
 unsigned int action)
=20
 			/*
 			 * All stream eps will reinitiate stream on NoStream
-			 * rejection until we can determine that the host can
-			 * prime after the first transfer.
+			 * rejection.
 			 *
 			 * However, if the controller is capable of
 			 * TXF_FLUSH_BYPASS, then IN direction endpoints will
@@ -3300,6 +3299,50 @@ static int dwc3_gadget_init_out_endpoint(struct dwc3=
_ep *dep)
 	return dwc3_alloc_trb_pool(dep);
 }
=20
+#define nostream_work_to_dep(w) (container_of(to_delayed_work(w), struct d=
wc3_ep, nostream_work))
+static void dwc3_nostream_work(struct work_struct *work)
+{
+	struct dwc3_ep	*dep =3D nostream_work_to_dep(work);
+	struct dwc3	*dwc =3D dep->dwc;
+	unsigned long   flags;
+
+	spin_lock_irqsave(&dwc->lock, flags);
+	if (dep->flags & DWC3_EP_STREAM_PRIMED)
+		goto out;
+
+	if ((dep->flags & DWC3_EP_IGNORE_NEXT_NOSTREAM) ||
+	    (!DWC3_MST_CAPABLE(&dwc->hwparams) &&
+	     !(dep->flags & DWC3_EP_WAIT_TRANSFER_COMPLETE)))
+		goto out;
+	/*
+	 * If the host rejects a stream due to no active stream, by the
+	 * USB and xHCI spec, the endpoint will be put back to idle
+	 * state. When the host is ready (buffer added/updated), it will
+	 * prime the endpoint to inform the usb device controller. This
+	 * triggers the device controller to issue ERDY to restart the
+	 * stream. However, some hosts don't follow this and keep the
+	 * endpoint in the idle state. No prime will come despite host
+	 * streams are updated, and the device controller will not be
+	 * triggered to generate ERDY to move the next stream data. To
+	 * workaround this and maintain compatibility with various
+	 * hosts, force to reinitiate the stream until the host is ready
+	 * instead of waiting for the host to prime the endpoint.
+	 */
+	if (DWC3_VER_IS_WITHIN(DWC32, 100A, ANY)) {
+		unsigned int cmd =3D DWC3_DGCMD_SET_ENDPOINT_PRIME;
+
+		dwc3_send_gadget_generic_command(dwc, cmd, dep->number);
+	} else {
+		dep->flags |=3D DWC3_EP_DELAY_START;
+		dwc3_stop_active_transfer(dep, true, true);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		return;
+	}
+out:
+	dep->flags &=3D ~DWC3_EP_IGNORE_NEXT_NOSTREAM;
+	spin_unlock_irqrestore(&dwc->lock, flags);
+}
+
 static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum)
 {
 	struct dwc3_ep			*dep;
@@ -3345,6 +3388,7 @@ static int dwc3_gadget_init_endpoint(struct dwc3 *dwc=
, u8 epnum)
 	INIT_LIST_HEAD(&dep->pending_list);
 	INIT_LIST_HEAD(&dep->started_list);
 	INIT_LIST_HEAD(&dep->cancelled_list);
+	INIT_DELAYED_WORK(&dep->nostream_work, dwc3_nostream_work);
=20
 	dwc3_debugfs_create_endpoint_dir(dep);
=20
@@ -3744,66 +3788,27 @@ static void dwc3_gadget_endpoint_command_complete(s=
truct dwc3_ep *dep,
 static void dwc3_gadget_endpoint_stream_event(struct dwc3_ep *dep,
 		const struct dwc3_event_depevt *event)
 {
-	struct dwc3 *dwc =3D dep->dwc;
-
 	if (event->status =3D=3D DEPEVT_STREAMEVT_FOUND) {
-		dep->flags |=3D DWC3_EP_FIRST_STREAM_PRIMED;
-		goto out;
+		cancel_delayed_work(&dep->nostream_work);
+		dep->flags |=3D DWC3_EP_STREAM_PRIMED;
+		dep->flags &=3D ~DWC3_EP_IGNORE_NEXT_NOSTREAM;
+		return;
 	}
=20
 	/* Note: NoStream rejection event param value is 0 and not 0xFFFF */
 	switch (event->parameters) {
 	case DEPEVT_STREAM_PRIME:
-		/*
-		 * If the host can properly transition the endpoint state from
-		 * idle to prime after a NoStream rejection, there's no need to
-		 * force restarting the endpoint to reinitiate the stream. To
-		 * simplify the check, assume the host follows the USB spec if
-		 * it primed the endpoint more than once.
-		 */
-		if (dep->flags & DWC3_EP_FORCE_RESTART_STREAM) {
-			if (dep->flags & DWC3_EP_FIRST_STREAM_PRIMED)
-				dep->flags &=3D ~DWC3_EP_FORCE_RESTART_STREAM;
-			else
-				dep->flags |=3D DWC3_EP_FIRST_STREAM_PRIMED;
-		}
-
+		cancel_delayed_work(&dep->nostream_work);
+		dep->flags |=3D DWC3_EP_STREAM_PRIMED;
+		dep->flags &=3D ~DWC3_EP_IGNORE_NEXT_NOSTREAM;
 		break;
 	case DEPEVT_STREAM_NOSTREAM:
-		if ((dep->flags & DWC3_EP_IGNORE_NEXT_NOSTREAM) ||
-		    !(dep->flags & DWC3_EP_FORCE_RESTART_STREAM) ||
-		    (!DWC3_MST_CAPABLE(&dwc->hwparams) &&
-		     !(dep->flags & DWC3_EP_WAIT_TRANSFER_COMPLETE)))
-			break;
-
-		/*
-		 * If the host rejects a stream due to no active stream, by the
-		 * USB and xHCI spec, the endpoint will be put back to idle
-		 * state. When the host is ready (buffer added/updated), it will
-		 * prime the endpoint to inform the usb device controller. This
-		 * triggers the device controller to issue ERDY to restart the
-		 * stream. However, some hosts don't follow this and keep the
-		 * endpoint in the idle state. No prime will come despite host
-		 * streams are updated, and the device controller will not be
-		 * triggered to generate ERDY to move the next stream data. To
-		 * workaround this and maintain compatibility with various
-		 * hosts, force to reinitiate the stream until the host is ready
-		 * instead of waiting for the host to prime the endpoint.
-		 */
-		if (DWC3_VER_IS_WITHIN(DWC32, 100A, ANY)) {
-			unsigned int cmd =3D DWC3_DGCMD_SET_ENDPOINT_PRIME;
-
-			dwc3_send_gadget_generic_command(dwc, cmd, dep->number);
-		} else {
-			dep->flags |=3D DWC3_EP_DELAY_START;
-			dwc3_stop_active_transfer(dep, true, true);
-			return;
-		}
+		dep->flags &=3D ~DWC3_EP_STREAM_PRIMED;
+		if (dep->flags & DWC3_EP_FORCE_RESTART_STREAM)
+			queue_delayed_work(system_wq, &dep->nostream_work,
+					   msecs_to_jiffies(100));
 		break;
 	}
-
-out:
-	dep->flags &=3D ~DWC3_EP_IGNORE_NEXT_NOSTREAM;
 }
=20
 static void dwc3_endpoint_interrupt(struct dwc3 *dwc,

base-commit: 26a6cc10f19a058c24cbe3be2a4a10048e66d9c9
--=20
2.28.0

