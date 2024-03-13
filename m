Return-Path: <linux-usb+bounces-7925-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302E187A4DB
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3327282E53
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D7F224DE;
	Wed, 13 Mar 2024 09:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="h7tApe6c";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="W6E9Y/2v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="X8DOzCmE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AF7225DF
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321692; cv=fail; b=mOFtJtp2ujWrkz5o+Oly81sKv50sd7Lb+Cz715BosZVt/T5AuW/LDLKaQHLLySH14eiHK+y4oU0EqEnpx8m9HKlpJH2Ndi3WPC3Of3LweiwpyJd2YGymb72HIIke6/KNJT1XR/3NE92A+TkLHHYjhCQiFedekXQOTew/HY9Jh8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321692; c=relaxed/simple;
	bh=FGlnUBbjpFoRy6QfW6ND6I9WErjZK2hrGOAU7mznKQk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oocoSZT+fhj+LrD3B7TDmK9uXUyZWfrxvPInXnyQImpmkqbFsgRExWfk5q6Wq9Gk+QpbeDCdnfca+wDyXYjivYQytjUfsl571dgHPzIMjoHWJUS7ZseYHFmIC9Di3y3D1NQD2ZPHYqz5X44elhj9eKaW4CrN5c5sSptqffAILtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=h7tApe6c; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=W6E9Y/2v; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=X8DOzCmE reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8Kc6o020319;
	Wed, 13 Mar 2024 02:21:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pfptdkimsnps; bh=qxKC
	aLasG/P97h8QqM/UeV7vmZPaQoHgWEH5P+k8fH4=; b=h7tApe6cBjXeGbEb1TG3
	eL2njrjv7MYSbUU96yZNA/vvxtwckiR8cMXAEO19LaNGmyrReFr36cR26QKpq618
	+zXNMN4ahRnlJVOiBrd6EFjKPcWhAN6gvT6TEDlwBqx7VfEepzVVTEJr/VkDGz4W
	ITSgOIGSrxxhp0MhN7e0Q+PaHy+vhODLae2iQRfIS479VRsNAJZvlELfbUn9cU8y
	ARnXlZEouKyrsxwfzpqyg+3Fs1MVqa9cUlc0Y/N3AatGE3wHYqvr35gJVvjJlL0f
	f47xvHRJnoI0yDzhyePr8UmcVv2uXU3xYC6q9UJBj+P0u8KARq2nn5mzj3Qd7qGx
	Ow==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3wtugwkggn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321685; bh=FGlnUBbjpFoRy6QfW6ND6I9WErjZK2hrGOAU7mznKQk=;
	h=From:To:CC:Subject:Date:From;
	b=W6E9Y/2vMMJOhe+bfKQA13OdTeaNQUBIEYVxPy4+k0uAlCayM9lhrfAkiivUQaBkz
	 5JGruy+NnZvmyN+MuODlB8rVteRtWInRjMGzPK4T+kGbEzE1hc4C72hbxFYSmAf/Xx
	 cgwZNrfNIRnZR1QNQEx5zt5xMimj5cuSQP48VRq2i6hC0wUbr0uXVN+8g9A+Sn4xru
	 VLpT0RNTrtUIzTvBvzDDBL/LcFkgmb7rIoYOL2MnnwdmOrqyNATpsLlKJyTIsg3cBy
	 2DK1sfcfB7/c9nKhnYLetCCj7HHZrqqeKWL5hvPB5zjv0O5MRGuD+3Urf3idmEd/xX
	 UwtMxb1HGAJ8g==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C8B604035E;
	Wed, 13 Mar 2024 09:21:25 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 9AF7AA005F;
	Wed, 13 Mar 2024 09:21:25 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=X8DOzCmE;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 72D3840364;
	Wed, 13 Mar 2024 09:21:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOJnug3zXbSZE/awQHSj927ZV4LvtcLkhuq3FI1OsA+VH0my8MoMhNda6Pqfz5HNOsXdiDDBTdg0YVH10MZaTyB6G5HbU2kIGVk4ysrQD+xRWcy9cIb81OWL3Jn+sHL6ZBLZiJhz6igPvo/LP5Dw50pxs7GXoxdrgyiqiEGhS9Ts9tGn1uFK3DrLbW0Kq78csGewGwZMC1Gt6TWY6oHy281YkimC4OUBxsyK5Cy7HXKN6zcuECkxwN6cLWJZhSJMkV4CYiF3DMPUxALqziTEEHw5vfzEDSnWZAFp8dtCa8/XyjLa0Qu+uMVg8/pkojESN5impfwSnqoxNmBUZohA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxKCaLasG/P97h8QqM/UeV7vmZPaQoHgWEH5P+k8fH4=;
 b=XKUydsEcmcoccjZPL1x6VGtxZ+Gp03F2uMQXBl2H7gcyZLdUA3HB565BELlE6w8eTChvI9TQoePBX3Xu9Dem14L2t5w/RnHdAlf5PPkmElUEpZh0LbM+nwAbX2ADe+MBzFQr9jWJLI5MzZkxjUiNIAhxpgrn4djK/vs+2MdBGYDc+puQpH2ICaINhv6fIrc7aaBgcEgDaTN7g6tJ0day9HT0o6LWWDzaX6qlzN3ymqjnxBK7ezzdCK96NPFlBIcxIIPghpFgb5l6CbpeIQnxrrkyuBNEZMPyCwiyF8JxLDxxAdL/Ne8x4zF0cy5y60Up6fJfd0INObG7rrl57Dgbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxKCaLasG/P97h8QqM/UeV7vmZPaQoHgWEH5P+k8fH4=;
 b=X8DOzCmEdvT70UhCyyjFxU5tB+YFH8+necBbgWzoNAzsz07UNq87LktSljqcYiAcKHHDEVQS5tKByjzsniG9eruuY/CdrofXUiiJYGsr5uJHXVVcQlkh7R0rbrwqXlWR70vlV8RzCEWgdKpVyBt+lrGdUuNQHPe9J/3Fq4Orpcg=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:21:22 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:21:22 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: [PATCH] usb: dwc2: host: Fix remote wakeup from hibernation
Thread-Topic: [PATCH] usb: dwc2: host: Fix remote wakeup from hibernation
Thread-Index: AQHadSfQ4/HptMo640Ocp1o/MfS2Nw==
Date: Wed, 13 Mar 2024 09:21:21 +0000
Message-ID: 
 <99385ec55ce73445b6fbd0f471c9bd40eb1c9b9e.1708939799.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: 2e2ca0c1-e126-4869-4f56-08dc433ef2bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FhjiaiyVPHzQKVgkQaNcu+VgP3DRVbtoZ3SUOfZsru9qZPF33110Jsp79229Fsg3PUVHpeA7BuF9yYuwv3k3+K9Q9ELH8tVoe92O1Ao08IlLDU7IGwqw1yuOA+M/IBp7lcC3yib9GHcuuZW4JUt78z1Ps1kiyZ/J6ojgIfmdhnFbKqUWNxNor/KU/1qBgiO9Vc6uZWZ+ec4h8Ck0cmuzbU0kvyU+BFx1wS2k2stb6QXB4tuxLldBSxEBe0hpKfvB4goPy6bmhykrWkpgA/4JzKm+OKdfUIlJdt8RAsCM8GG9Aj+2cXc4d39+O78yNwrs2XvP1+51rVqgFHiOVLVUz679WSWFVQcY1hV0GVPWIUxjMHoi/MIHrkII7/OqVOuPts9IGJOoYvepiSwiBPMuDtUqfmgu+s3PbTAB0Qs7oLqI1aqCOognQCsLH2HleLTIpuiiUHERPQ/TcEHS3NYRRCXcQT/xTatUBUIoxXOIbYwl8+mM1nrx6O8EqTcH/D+LqJwGNnsRr00RhBnjqhWwRxZWZtbPSox4AReW6bgV8wJjFVZ566H0Tg08NuGUkN896bGwTrMjmtKXrnM5asTtzMCSb4UPtxEcMIdHu6HganB3nRZyC6uywnItLwvu9fWuZYkuSKMOMGxSW+Y45KhRZjoOER0ymQAAI2V7ErtQcOsEG4jwzfegzzqkdXPyMEecaiNzUQ5WYkLJbXmZjQ4shzkWjKScjf0A0gbKBhdulhc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?JdirTgKLJ5PeXXs5zoGIp3BbYYT0wo1eErDzcabjxSDSEusslr435UAH6G?=
 =?iso-8859-1?Q?aiVmcUzEGGPs7hLyj5n7hWOr+5cj4BtE+/+hhqt/3kez6qCsODrYWHLdOb?=
 =?iso-8859-1?Q?K1YkOn5LW48CUZm8aRrK4nYu5V0KrpU8FgtFNoDSYenwnwsv5e9Irhn9LV?=
 =?iso-8859-1?Q?Xr1uhtxN/RVL5ldtkY0tJjy/8CCjp2cXJMHV+uEiXqzvPa4GwuGQcaPzG8?=
 =?iso-8859-1?Q?LJfqKpeCF/QgxI+VZaK3Nskl33+d6fPopxSUhZj1JJpjCGwz3a1EC3KZKP?=
 =?iso-8859-1?Q?VOdX8WIC6RI0OKE0HCgvDOWBUxPnTP/GxrSy6cmjN7Gm0MucXAQ4OZtuny?=
 =?iso-8859-1?Q?mUjVgaqV7q7ZaapDGLags6ABEIrMo6OCrQdSMSRVptJuUGY+Ll68ro6dFq?=
 =?iso-8859-1?Q?ooqUFaCutaxvrClkAmIwXuC7tQkHCjHYjzbA7OXkBhf4L5/TFnodaxv6us?=
 =?iso-8859-1?Q?Os1xXJ1H2wecW2M2JOfR6UGdpHSLBNmEZzeXU2+ehh/vlLzo4OoPOLdKnc?=
 =?iso-8859-1?Q?lPrUyIoBZYMWquza0FvvacsQcIX1cbqOA04J8m2auFEhIP5uischXvfWlB?=
 =?iso-8859-1?Q?YliEZfB+jeqwhKfEzupG9rK2fHT4Tus9eO5BDmPkh1XSUUdtgrA2bhVUWn?=
 =?iso-8859-1?Q?bUNb7NumLmGEq0AgZFHkFtADLK1/Jw8HeGEq9rMlnL/J8/GRv0A/oznnfu?=
 =?iso-8859-1?Q?iveP5xLGns0fTP5CCK4MQpIkyth7u6ienHLtA9FoNFAjC2wYUCmKs6xaBY?=
 =?iso-8859-1?Q?YIl7DGRjvk6NMUDmGVkbS29VSH79hDOQB1jpl+CPUt55WxmHvrJ1nJdF4t?=
 =?iso-8859-1?Q?G7bvIjs0yDUbzunonlj0I0XXsJ/rqKduW3cdLYeU/4i0w/Bbs2aAObNnMO?=
 =?iso-8859-1?Q?+fWg2Q6C3EGI/wJY1qZBuLx4eN+nmKRb3/22tAKMvAq9RVOLZRCrfmK1ai?=
 =?iso-8859-1?Q?0XayZV2C4Ga2x8dXuM3Agvh9OgRjeF9LDVw3HkJzxF9ljaIP7zB7bEnZXH?=
 =?iso-8859-1?Q?LnAXgP/4x1fDMZr/cHcrCmPrkwTuXW56cuzOd8GWqpWXypjL/GXtCVfKaL?=
 =?iso-8859-1?Q?+58vGz+bFheAinrOeDwwaGBCx4+WH3qGCo4vupEqwY5aj4bT3aJnmdw+uF?=
 =?iso-8859-1?Q?MFLbAZAe/1YIfSkANBH2t5q+zbYV7+vzNzE4hfOu0Nl1sm6qPeexwEFXMR?=
 =?iso-8859-1?Q?MYCrxGR6bV20qJ1jcNjVhP4XNz46I2Zm6bM069l6DhxJXYFfCqWU/6um0x?=
 =?iso-8859-1?Q?aDCVWEDWnCIBrQOiN1qJp/n/DNFj7dYX4Nwu0Nyz2L/6oYb5z3vORkMs2M?=
 =?iso-8859-1?Q?FOYdKtQCFKkn1pQ/AMD7pKd/cABVCjfp7BbD8epPzGZL85dQ45CGkgsmfo?=
 =?iso-8859-1?Q?9GE49PNHw6nVYPI5MxQo7DUqj1dnmt8j0MOPz70o5CZZgzhEuZg2MNL0zu?=
 =?iso-8859-1?Q?eOVx5Qg0OLPEW0qPT5zmEoTTByyjrS+linB7ydh2fjsvMc+T5r9OrMH2EO?=
 =?iso-8859-1?Q?6jB6riMytLspaqC6VGh3BkVgf3gad6krqgpyWHlXB0hj9ZefcsGU2WskUi?=
 =?iso-8859-1?Q?pS/09/Aj6fiV5C/jLcVRPPBo+1qbDGkOG7qmISO0fN09cpF9GuUOVdFgUn?=
 =?iso-8859-1?Q?5parfNkP2d+WBDhlsrKeRoYhZYrQFKbje9fr9iluWaU7QhQDZjdDyGyA?=
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
	HnaAQ5PfITxbSdTDPNC5L8A2g59LAks3S4j1lag50w3coXUS2fEaAToz9C8V4ZdehxHbdQ+IDEnQ7A86C6isgCc6pxCI2fryg5GNnZSIp5szUlQjtCukyeqNjS9rt4LqGuMV9c3FW1rNz/Zucc4Z3S4PckfERT9l+QoNZ+4pkycKQPP92yguUBhBZfCVsxRSkyeizfDTsxf5EletDYWAWdTKQlWQyhEHT2DC0Y3R20+24/2ycdqI07Yt8zD3NFRwyXTdxe7GP1p/4fWzbufu6bRoiI1OWBp8qQTlO6IF5ibktaMr8eR32xfc6K5faIC1VqZTUK8Vjdg1YRtgbcWIX1dPfJAYWZt9Mkae0QmRc3adelvNe+h6mnmU9oHIFgxUg8Bbq2Hlvn7Y/riW2rQivJ5QC78Xwce8qr69d86oImwe9g3Ly/AxnbTUvsAifOjgGbM/zS1yMQRGzt37qiClASVq4hLs7VqjFM1cXl0w5mS9RUbOelqjieZniDCmw85pF/VynFTyUlS2QJQDUOUAyZiXY+e5nr9s/g07GUZKeH3hB0amch/IHRoxx+7oDw9YmzlCLzbJ6D41zcyzREXPSY7XY7uqlaaTXu0YB2GjNNDZcP8syIOmwRQy55f9kfQG1oYzb0z5FIKAL+gbiwAHoQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2ca0c1-e126-4869-4f56-08dc433ef2bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:21:21.8934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X3hCpwkX5x+u4JVUG9gtMP+3DgI5YwrMsZ2tpD9AQ2I2E+CcV4bh2TAyfkOCd20+7ZCKwkSwpMVKhJV6ukIqrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-GUID: 9Oae13PEk5TnZckJ9JFwBhhshgwABlP5
X-Proofpoint-ORIG-GUID: 9Oae13PEk5TnZckJ9JFwBhhshgwABlP5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403130068

Starting from core v4.30a changed order of programming
GPWRDN_PMUACTV to 0 in case of exit from hibernation on
remote wakeup signaling from device.

Fixes: c5c403dc4336 ("usb: dwc2: Add host/device hibernation functions")
CC: stable@vger.kernel.org
Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/core.h |  1 +
 drivers/usb/dwc2/hcd.c  | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index c92a1da46a01..2f999023ffa3 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1086,6 +1086,7 @@ struct dwc2_hsotg {
 	bool needs_byte_swap;
=20
 	/* DWC OTG HW Release versions */
+#define DWC2_CORE_REV_4_30a	0x4f54430a
 #define DWC2_CORE_REV_2_71a	0x4f54271a
 #define DWC2_CORE_REV_2_72a     0x4f54272a
 #define DWC2_CORE_REV_2_80a	0x4f54280a
diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 35c7a4df8e71..3b955b314199 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5610,10 +5610,12 @@ int dwc2_host_exit_hibernation(struct dwc2_hsotg *h=
sotg, int rem_wakeup,
 	dwc2_writel(hsotg, hr->hcfg, HCFG);
=20
 	/* De-assert Wakeup Logic */
-	gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
-	gpwrdn &=3D ~GPWRDN_PMUACTV;
-	dwc2_writel(hsotg, gpwrdn, GPWRDN);
-	udelay(10);
+	if (!(rem_wakeup && hsotg->hw_params.snpsid >=3D DWC2_CORE_REV_4_30a)) {
+		gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
+		gpwrdn &=3D ~GPWRDN_PMUACTV;
+		dwc2_writel(hsotg, gpwrdn, GPWRDN);
+		udelay(10);
+	}
=20
 	hprt0 =3D hr->hprt0;
 	hprt0 |=3D HPRT0_PWR;
@@ -5638,6 +5640,13 @@ int dwc2_host_exit_hibernation(struct dwc2_hsotg *hs=
otg, int rem_wakeup,
 		hprt0 |=3D HPRT0_RES;
 		dwc2_writel(hsotg, hprt0, HPRT0);
=20
+		/* De-assert Wakeup Logic */
+		if ((rem_wakeup && hsotg->hw_params.snpsid >=3D DWC2_CORE_REV_4_30a)) {
+			gpwrdn =3D dwc2_readl(hsotg, GPWRDN);
+			gpwrdn &=3D ~GPWRDN_PMUACTV;
+			dwc2_writel(hsotg, gpwrdn, GPWRDN);
+			udelay(10);
+		}
 		/* Wait for Resume time and then program HPRT again */
 		mdelay(100);
 		hprt0 &=3D ~HPRT0_RES;

base-commit: 539f317ea7321225be4508975fa6dfbe2281cff9
--=20
2.41.0

