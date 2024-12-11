Return-Path: <linux-usb+bounces-18338-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF289EC0C9
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 01:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48FDC1885685
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 00:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D402CA4E;
	Wed, 11 Dec 2024 00:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hgq6FsHF";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="FSWy/D5G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DZ4vxpjK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17352451C9
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 00:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733877155; cv=fail; b=mVC2BYUFla9U1czFUzLld9lJBIPGrWzfELK5jEjP1mMxexlINfS/MV/TEJtrXcdip7asTbuqLp4GwdTclERjSAA5M0ROzUCJk7t2/Is9dSe9AOb1OQMRFLo3d69R9KX8V4cvqr7if+7iOdAhOHuZkmx1k0VNuHqrmc6kOg7N75o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733877155; c=relaxed/simple;
	bh=pCTnluXH8X/nAedQpZNaEhVdpwZlzP2rLzlqt3Lwaho=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NfkodsBHu3dbkqh08TDuM0fLRWS4AF2tv38B5V+BbkjficgO/rCD8wJw8Bebtt4hxcFePITwnQmRkkOBiDfuWPc+XdzpkjhcTR8zFCcEUFOTFwuLv1EVbF3mYp+kckcIP/NZ/ROOmACaZKWjBxwUM2OIQ1xb+2EzRRRhEm7ilVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=hgq6FsHF; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=FSWy/D5G; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DZ4vxpjK reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BANH7Fe010895;
	Tue, 10 Dec 2024 16:32:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=szdedxmjUuejSVMaIMLf4gX5MKRYaYrMHU+5CvdM8ow=; b=hgq6FsHFWEDS
	6jjMXL6+G6QtQecHO7iwl9arj7axuu3G8RbG3/1pxc8AL3GOGy6vSGyo6g+s2i41
	WxOi2BuHX1asE2F9xLLq4ffgKc93I/J1Mcw9Z0Y/xB15QJQwCUR2IIS0g0OZzAhO
	Ew9m7NzFbvP+D3E8ERgYpcOzpe8Hi1yUYaxMpRGSw3UpbJBy0pqeXgJoJnVk3DH4
	nksvbqjILF1gEh5lc0ZGcPB23eyBnhk9WLIkzwiin4TyuIMo2aR89dhxE2fk143s
	LtB038JQIMj0Z1y/GkR+pWfy4fczHZITXO6yPbXIWXhOBoeSJp6yuZXOp2iLrpom
	ktVbmf02Kw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43cpgb9pvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 16:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1733877148; bh=pCTnluXH8X/nAedQpZNaEhVdpwZlzP2rLzlqt3Lwaho=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=FSWy/D5GoT12X7gWZZnrdYBNQdnF7/zH9sHsHvZy80H5rhnBDxyQQDy50XgwK8716
	 W1W3+mkeNfxXFMAsyzIHtmDVe2/cF1eABonoUuvxcxV2GgFUlHGgZHCq5k5B6E73T7
	 rtQ7yBKinc6VV2l70Qqfu2NwN42XFuB5xaDwZosY/SwOfLTTcykVIiyvhpnQY8ke7a
	 hNX6M+YXH+FLXCSw6R4ZYJmRZ68qNuij+5vGxgFT6DNYpKeAJP2btqm5ALPLtOf/oR
	 9hHCgHUtngCaRAbEgxhWSzn5xKa8CGZPFvss1hZ8+alo0bSTDntpDgeIuSQw5GYi31
	 bjc816lEJBbHA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 208474012B;
	Wed, 11 Dec 2024 00:32:28 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E804AA0078;
	Wed, 11 Dec 2024 00:32:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DZ4vxpjK;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id BF9264052F;
	Wed, 11 Dec 2024 00:32:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gM3gSih8NjzEXr6upWcuWXouVS5sN3AxOc8cu2xhzIcfyuADVZ4JIgKH6PFJLQmxFjfH0i6yyKEVNK7lQ4+2pcndssX5/4SNa+MhewzSiC6CvsbiSRxaVR9vB6CENa7E2vw8dTi75jxHz9Yzg0HCtJlrTgSMMBBkRciv6YA5ss7xwptnXLtRzLcQ62s78jfBh2GUjdY2cTUgLnJAfNy3T64ryjaP44P81lKyQTuSN+dY4FaItYuSztsO9y5b4DQi1rvFlUPtr0rWgPamD/5o2K2yiC9qKHYUFYgIm/kG8rCq00RhJpgOLnp4azzntBGOJtC2DrEAwm7n1+IPzErkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szdedxmjUuejSVMaIMLf4gX5MKRYaYrMHU+5CvdM8ow=;
 b=DS+TVtB2iOP4ePnontexGnjXOM7UuO1Z4sJ1Qlk1/oAqJT+raNcF1YnPdplEJpz8w8zVI8o1455dZ3TWb1qBER0CZvW8zB0AmwynRZ7mrnw97ccQ2mZDgF/U/A82B9KBnURoLkgW0yDcxFRVzzliUjq/8mGnE0uWhiasS2qks63orxz0rrOVoa6IUNoWRmxruk35WiZpf0Ci625RPJChU628l5kpyHfC6bs+znEWTB1tkIrfTSCRx9dwL6JP5ppSzGD7P4N/MIyJ0iRuaXhJWlPJZ8aQaAo3ERquEtjWLt6x/Tr5CyzhESv3EBe47dgJ17y1nodVKqibeyVMqSRuoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szdedxmjUuejSVMaIMLf4gX5MKRYaYrMHU+5CvdM8ow=;
 b=DZ4vxpjKYTJ9oJ6v5YNFgAYtsPZkDJw39Tz8QoeVfHk1OLS8kBHPh41xZgie3d4T/kQMoNujO56pPsJh4Go65Hdmsnk+zVr8eXzw1vmy0BcUoSC9g7UzJE/JNXy2DCzP/GrH8opZrTV/kiSE9sPp0Sq8ZwhH+UQeO/BlHtM0cww=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB7691.namprd12.prod.outlook.com (2603:10b6:610:151::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 00:32:25 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 00:32:25 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi
	<a1134123566@gmail.com>
Subject: [PATCH v3 09/28] usb: gadget: f_tcm: Limit number of sessions
Thread-Topic: [PATCH v3 09/28] usb: gadget: f_tcm: Limit number of sessions
Thread-Index: AQHbS2QmIZTMASfAAEuZKNgHPLwsEA==
Date: Wed, 11 Dec 2024 00:32:25 +0000
Message-ID:
 <017016ffcab2f3c284d863fc42483b83dbd21b35.1733876548.git.Thinh.Nguyen@synopsys.com>
References: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1733876548.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB7691:EE_
x-ms-office365-filtering-correlation-id: 6576b3ad-1d0b-4fec-b8dc-08dd197b4913
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?uMH6K96pHAcOFQAl1DjuUh7ZNI/3BMiJSHnStTzeF3ukI6peOKhLot5vjh?=
 =?iso-8859-1?Q?JIhtZ1iY2yuV7xNgUGPdR5i9mtz9kbFGerUgAbXfZzqNixCl4yuZYmIeZk?=
 =?iso-8859-1?Q?yqFqhfRPZF+O+HCdHGD/x4+0kBV91ozYGKngQzVbNDLrUMvEYevvVIutAy?=
 =?iso-8859-1?Q?CQTYzJ+4bSwZEs4OLXEC+mF94JN+K+lx2/Z2Pmr+sTTNIivn+PEi43Otcy?=
 =?iso-8859-1?Q?Z7XNShD/je4y6qU8VYrD9Qu117CNLANd9l5YOD5ax7K0FwxWw9+XVqWG5V?=
 =?iso-8859-1?Q?aIe5VgzAASjZ3LxL360R55J0aZuLEFTKI4aec4zLYL9OzOSgXnI05D+yJ/?=
 =?iso-8859-1?Q?m/38ijpMLD1GBWI9uEH103qjD4DgT9X/IJGDZn53wZWr3ACwHU6AUm2OYW?=
 =?iso-8859-1?Q?V5SRDmjfEXofeVdN4BrfkTUcu7BQKyWrcUz6cH4AMsgmh03etI1pz+xl4d?=
 =?iso-8859-1?Q?S29IToOHV92RgHIf+XW63Rxc7i3gEt5sVMw7/goL6/mid/fNY/VYy4ekNK?=
 =?iso-8859-1?Q?8b1fB01RdvTPVviFsFto/TDa+QRFjTVaDGuzOvIpycNJyChUHd7buHI3oD?=
 =?iso-8859-1?Q?WThu/uESfxsLkt2DczmkIB/JXEKD5SKDpnhJb5fr5HRMGcoCkekkCWAvrP?=
 =?iso-8859-1?Q?wTdRt+4Irj4/MPPHrooK8j/IjiJQ5J6sQ8mFdOhJnaBUCNwHVFkiTeTRd/?=
 =?iso-8859-1?Q?eY16xyz4FmiZGKWZcIvW1WtIRGBqQEGaBSJJXzrOEr6kp8mQo3ORFLgsQB?=
 =?iso-8859-1?Q?fwckncJtiFmslaYmWVky2gqC2FqnXq2CHsL6q5N3pb95BR4zL+7dkq2APv?=
 =?iso-8859-1?Q?J1svDSwG3k+VNrfXb08KMVN/aWyYnlf/XDs5q6dLxpnLN8YlpYNIKNqQTp?=
 =?iso-8859-1?Q?aT1sq70ueHQyuSq1E1KhV+p8a17d/jsoDkDxeFd0yj8WVzG947AHt6CAMr?=
 =?iso-8859-1?Q?+c76pa4U0sZXsqIcVvQdtH6NaPw9NNUX+gp7Z/ZiPOSj8p4laGy20KNrQK?=
 =?iso-8859-1?Q?DsSnpHunITHWUnw8eE51mtijwPVShV77c05z8TMXCpvmD2dmrVEX1Xuosm?=
 =?iso-8859-1?Q?DM1hsV0ZjxHeJu93y1UGfFC0Ob+UO7fYTxy6NUb8/3baQh9FDHs++94rKc?=
 =?iso-8859-1?Q?OGqRYzQkwzFgH/qXzbs594wiIJ4uetqHfOXCAZH+V95ic6KRfA6QIUowP+?=
 =?iso-8859-1?Q?TQf/CDhrcTn1klRJTRmRxoB/76QW28vcgz5jEIfVcn4vtI6FqVbPFT/P7o?=
 =?iso-8859-1?Q?mbxwlJGU5kHp6w41WQpaOUCBAi2p3Ix8wHYCmUEFlA5v8PFbiB13BKi8qa?=
 =?iso-8859-1?Q?SOXrJ4fZjcd9panoj8TXCxmYqDfkNHhAV6KAZYX2wXDYpaVs4MGwWBY4yy?=
 =?iso-8859-1?Q?hcm7fGrGSzYAkISlMkqoHppBpCEcnjGqllSM+d/DNkSVK5ON/EFdSuB81v?=
 =?iso-8859-1?Q?AvCrhUGvVUefyh2bXkPhUh4rXKw/s8Ta0TFxFQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?v6S/qhJ0rjh0vx8NvLZlzwTZB93SpWh5yKE3VqF6oHnvkiqCgsRZQKSw72?=
 =?iso-8859-1?Q?fMl8RynEhMYMpIl+g9cXPhuam9JaT+W3YasZ/5OiIJCogiNKgYPBfYq0pP?=
 =?iso-8859-1?Q?ZhLsLihwMMHg4+mGdmqFMU94NW4Y6Tv8NsfJFh7CEkYVU1lx339lL1LV/1?=
 =?iso-8859-1?Q?aXnF+6OdexdsQpaREyEnYn0gArx3hsn6IZaosHIKcfxxv1Birzjys83+3Q?=
 =?iso-8859-1?Q?c0koCdbmtNWRuRsLdF2uaoca2XI/Bceb/drueP5ci+zKpwVonITRQytUeO?=
 =?iso-8859-1?Q?JEHjdNFeGOW2yhwrvlEvLNjB+/uk0X176t8xDiGivskGEJYvHhAfmw9ENk?=
 =?iso-8859-1?Q?gm5EnPZ2EXCynLrz68KClEhEhzDx7c/QdYHSs933dmTDO6b0EjZN4ILeNx?=
 =?iso-8859-1?Q?4Xe22ue8KiXCJFYnbqOYQKERFQdteAnPiDOfB7Oz0l05jBD+zxj5C2eZd4?=
 =?iso-8859-1?Q?qryTD6VMBvL/IjekKouXy0wMsfCANKzFtcg3G+9n+HqhfD0fGU3viXc3Q7?=
 =?iso-8859-1?Q?eKur3w8kjNhNRC1xgWRHZg316KXRHsJdyuh3InkfD7+yoEZa3kYcUctmlA?=
 =?iso-8859-1?Q?6jHKsW4qNAOtmCNoyHFJjZWf3EiXn4y+i6WLWGvpYErHXxh5mku9FWonFl?=
 =?iso-8859-1?Q?Lv5mNmGRRMNgdgAxVHDy82RvuOEJOueCSG4sM3dCS2D5sKaZ82JCZd5ysu?=
 =?iso-8859-1?Q?6sd8fk/zBTw1CPBR/xSimttt0617pMHbtllnxLTGvUCb8Y9JiugmB2I8un?=
 =?iso-8859-1?Q?SH9I9YkRnSKqJqcj+KhhRiOmiO960uFw7P7RvmKkS0vXBsDzXijT+aDAGF?=
 =?iso-8859-1?Q?qDm/Rksh8WAzoSXzy1bSLRihNrhus6QYqwIawpF2dhhbJmw/fFongkaSYG?=
 =?iso-8859-1?Q?SA2CWR2VTZXOO4Cnrwd2ab2rx7t8rte8SCE4ET6PekrNIV/+HBZ8+VkQkV?=
 =?iso-8859-1?Q?E32cantwXPIWKyHzx0PRHkt8MWlywshuLQjZlph+i0eYwdc4zdVTVy8Tcp?=
 =?iso-8859-1?Q?9uN6Lvkn2lbXopzrx79bxL0dS/1Wz+BifGm0DYzMTxjBCfX4QGjdDp33Tr?=
 =?iso-8859-1?Q?Z67uHKucfO30vgN8HUSRfq8ok6oTbOAqCvE53/H2YhCOv0nTV90/FZkwCC?=
 =?iso-8859-1?Q?hdz/fPVobzqrw/OHayYUvUOJT8LaftfW4MAZL/XOxCREvPPRgXbprAuH42?=
 =?iso-8859-1?Q?fBExT11UsAwJCv0ohoVe3PFI/sAQxgqxvZHobR9S3hO1vtRP5aCzxikoIy?=
 =?iso-8859-1?Q?iKNSNRNTzXMxNtrk7nEikZ0cTLWX8IfxmR+x4g6yL1m7v9MbJKks0+d/U2?=
 =?iso-8859-1?Q?gCNkH3FVgDlbjHHzr7R7njcods1E53HOiuPtgT7aBSHLDtQiu45iJpUBfs?=
 =?iso-8859-1?Q?mYTno1XtkOMxv5bynsr4Q9+J7qmmH5YpB2GSzeUVl1x7PrqJ5436k9tcP6?=
 =?iso-8859-1?Q?d8s4OK6q+jNqFOJev4Fyzp13i2wZIucS5hE+8PdeC7qzpPp0MHEMSsyona?=
 =?iso-8859-1?Q?5BYlLYBOaqaw32+0PIsmd6c7XHtXgMNwQOKFk6iz+CsLDlJ4X8tpu5S0N1?=
 =?iso-8859-1?Q?ecBlIen5+evuT3K4kOhP/IYGjf4nrPmq2z4dgCMOk1FoDtfoAEuoj0B87k?=
 =?iso-8859-1?Q?fRJ7GOP8iB3ipZ7zQOI+BadME8myKTPQkWBNViSEsq/Z27l+eYKNPNGw?=
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
	quOpA+KYyj47BNMUtRdhaukPjePBIhYBu6h+piEZBUGDn8vUpXxvjQZ3wGqzn5rDAXhH8ifL6b+t+umrF+a6A5NNIvhzBwUcxdJ4yRflNO+0LFzLF0sfCZqEVrEI7J5XhWKvqFu6cShS3EZUO+PXYXaqCKXztO9tPjSQi3Y8pL0AjcyQ2a237RvozUrsBcvu2Sm2J8smABRvRa5JBhHQISf2MxchEKssOnsbKoJy5Qp6UGEWlF5cWD5wEuQNX2wElKFGn9MggDyJnntUbacBs84wQLpeITBbqiofdGpjeF2v7bKiV6dSp5je4vwDKkBm9eyr0tLkhbVOwuNj2QdfNgtTcJpNSY8kQM2Bg6qAYdnWX5dWTWHhzOIRp+ega+vO9VbTzgLGgpePtHAl2TWmHcYesIBE2ruy7AslPnXB3ow5v9v+tMDAmEIWslLT7DiT/a/2vLBc6NXfvgL2OHpGgJh1Qdnvd9Nj5X5eianBcA0AwpfMnjT8Ycb7APDmewtjZU/CVXHP6oYy7kZhL4qOK3yyP5gUhh3dKOPrwJFhyVQV9tCUqQfpNbLh0/yFVzTe9qkkNkPO+yskMiihYWyvNOwruPWx39VrOUoCzfSweZKA5hznNaxBOyN/ZmjCW8CBNBJUzix8fw/XJQLD6EhOoA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6576b3ad-1d0b-4fec-b8dc-08dd197b4913
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 00:32:25.3613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uz9bIAiEgHZ2WB3rTcMb9kgGIhDsgAdx2qWPySeArRHtMW5RfZFk4x7HduBA41sDO/mTg/oAtbEBkpgaPy7GtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7691
X-Authority-Analysis: v=2.4 cv=d+8PyQjE c=1 sm=1 tr=0 ts=6758dd9c cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=NGJHf6JGuNThF3Jh-kMA:9 a=wPNLvfGTeEIA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-GUID: x2ozNDHjCCnuWMB5ZqGYNsOqnInl9OwP
X-Proofpoint-ORIG-GUID: x2ozNDHjCCnuWMB5ZqGYNsOqnInl9OwP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412110002

Only allocate up to UASP_SS_EP_COMP_NUM_STREAMS number of session tags.
We should not be using more than UASP_SS_EP_COMP_NUM_STREAMS of tags due
to the number of commands limit we imposed. Each command uses a unique
tag. Any more than that is unnecessary. By limiting it, we can detect an
issue in our driver immediately should we run out of session tags.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/gadget/function/tcm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/functio=
n/tcm.h
index 6cb05dcd19ff..385bc2cdefb6 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -24,7 +24,7 @@ enum {
 #define USB_G_ALT_INT_BBB       0
 #define USB_G_ALT_INT_UAS       1
=20
-#define USB_G_DEFAULT_SESSION_TAGS	128
+#define USB_G_DEFAULT_SESSION_TAGS	UASP_SS_EP_COMP_NUM_STREAMS
=20
 struct tcm_usbg_nexus {
 	struct se_session *tvn_se_sess;
--=20
2.28.0

