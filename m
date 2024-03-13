Return-Path: <linux-usb+bounces-7921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F2D87A4C9
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC45E1C21CB3
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F90D1BDD9;
	Wed, 13 Mar 2024 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iV4U09KF";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QoWbGdJO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="tUxJHa7/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842171CD22
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321600; cv=fail; b=tWPjn/qbZ2IeYQpt9IVRR4GSSW4PYsIBLH+ngw2FhHD+aYVEEVkfpbxV2NUOOC1I8jdgTkR8YrUYozpd5iLihC9FqXswOnqFFYxbveNQmpf3TK1NLAaGqmkXQu+8MC9XYmbGbyeVWDFF3RmKCIsfG/pm6X2YqvOnwrkKKZB+/Rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321600; c=relaxed/simple;
	bh=jcZy3BTYwYOdzo0TrlMV6iZG138JNn3l7CDvsouVWwE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hr6ESHr/MHyf8LPG8/TZtubVKanELlCvAnvnw5C7/1lweIxlIjM+4Hd0VlM77LgVjZyy5W2cVbTayHerQOAVviiiW6/LUi1fycifYYknh70q//mxe6lQjVGpknLmoKxyRoI4FbT9Id5mR6BIA/OmopeOcN+7TGJ29atbbGvx//0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iV4U09KF; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QoWbGdJO; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=tUxJHa7/ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8Kbg5000787;
	Wed, 13 Mar 2024 02:19:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	pfptdkimsnps; bh=rGr1iWFne7Iedx2JWGFyd1IAgVwoPqTJz+sl6ipc1KI=; b=
	iV4U09KFlbveLmRNS5SJTrGxqj2IpH4crYTJcJ4TXWhrvhOXUj3nC+j0083udFCX
	mC/LF3+PLHkTKfmsj8WDGbLBuFaoLFpYUnub8p7aVFOgAuaVCteZ2M8EfWkljfB5
	JpT2ejh0QtGcstX+Jobnfv2ulNkUVRg4v2MJoU9lz07PKuIzHTS2PZ58gk0d7dHD
	K9owV27YAO5eEGyyb/OjcZ37QjMoBJtgUNN0kfU1jbguQNQnA63uk9NXTeEuXvLS
	4aTa7w94mmZcjecDrAYDLORfAiSvsliQP4GG1NIKZBQRs1LRBeLRAooN6ogMk/zg
	o1dDnkFTS4k3szpaw4QWkg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3wtugwugjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321596; bh=jcZy3BTYwYOdzo0TrlMV6iZG138JNn3l7CDvsouVWwE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QoWbGdJOAZC5611qnSYUYye481xqHSQEvzR1mfdri2nqvDpeqijZWKy1Q+fqVqUBI
	 OZNsiqn741DvkkHvsc+lvl6Ni4fZkccj0uvJAPk+lp2ehSR1lw5laKnPvBJD9eQK2G
	 M0ipl3aAw6Pl3DHUsqVBWLq7XgAPk/fCjBSmsz2mpPMoS4cfyRGeS8gb6kdGXed3UP
	 joMjbWQpTf1d1piRXgBPov5RMXHwt50sLKwjgHp225erptdw1QI+hK/TVVI7OBD3Y7
	 j9+IbzUteHEETk7fqxBG7xiuOaBhDfGvbmRHAhAzaq0X6YWNWuU5w6eZXvE+QSzsdb
	 Hqhz0FWPF7fpA==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5560640349;
	Wed, 13 Mar 2024 09:19:56 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 2E3B9A008E;
	Wed, 13 Mar 2024 09:19:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=tUxJHa7/;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 814EF40346;
	Wed, 13 Mar 2024 09:19:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTJUuqSnCV7Xau2LxY2vY8/FkCTdiEO3HodGTicvY5ZXNFjXbCSmTlsGYYfI1TtDtCmA1/IobXM1IM1/ss3poFwuyl7hpHckHbi2W/qn8K/aVaOPF+oA6waTieFciXlcMDHkskptOkat8GOpvZsJwoni0B2io718EMsz4KPjA1ElYhm0/GW1flNqNxdSkoSrCx7pXFeKlwXe8BqWuIrFqDMKk5uzGb0xw5fkbZtzg6lmEKPurUYp4dKqs5Iybi118RvrwhkH7wzWeuODqrPAOcaDsZwXFKEd83nWPp0sfU2goHRhDmu9unNEygwg/ijk65BFoD9KE3ZkNC5boQLHEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGr1iWFne7Iedx2JWGFyd1IAgVwoPqTJz+sl6ipc1KI=;
 b=a1MqrVjcPOWtCjxOScZS+FPQhDPjmDZ++rsCzsjjMtvAc34EGLKD8+6GciGJcAdvOdwzNxkXy0Yq1P4yOScVOfMlq1JCL5ajDFTHbHZPjE5S2AnFUb6nqRQrqiOLFIEcR0f61E8gZC+AKw1iy+nxAUyOWvFImBIkWOoYY006tURcAVooObFQw/ZTStoJbJAzPCa1R2R10ECdhCtG5iN6raR3NFBvUkbE5inPR2MsCjQBCjLIPirYu1OLG9DLPZUt21LJqWj/DIdcc6/d7MpB5ldSxHXou5eG4EtlE+KoqKC71S6aZmg35Cq3HqiidIUePo39ACH7vGMmysMjGo2wbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGr1iWFne7Iedx2JWGFyd1IAgVwoPqTJz+sl6ipc1KI=;
 b=tUxJHa7/wgmnKIzUbLcFwyaOc5Zr+SYzwBXookPYgAQ7kNjd3cqNEM0gFxbqt9Vb6Q0Ez8V+D6quBIe6rtRS9N43fl335JVuIdb96NeSOfUEK256jDmOfoy0KiCBNbD4yxDPu0BuyTIdGBLtWJH5jSOTw6l8EB0OQKMKFp0PXLo=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:19:53 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:19:53 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH 5/7] usb: dwc2: New bit definition in GPWRDN register
Thread-Topic: [PATCH 5/7] usb: dwc2: New bit definition in GPWRDN register
Thread-Index: AQHadSebTSuUMsJdWkeKj0XlT3h/yQ==
Date: Wed, 13 Mar 2024 09:19:52 +0000
Message-ID: 
 <56d05a4f5750aaa58d8c5bab7705814942a985bd.1708948356.git.Minas.Harutyunyan@synopsys.com>
References: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
In-Reply-To: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: d6c647df-30b7-4330-9802-08dc433ebdc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Q1rJvpbgmrNvDblsDT2YmXdP+/iSDpzzI/VpGqdd5Bp6iXuG1yLlX6f4gNoNr5+rQR9IG/iLoLYSSCxTMt4zC+v9Ld+K9ypDg/q4t2mReon34WW+MO+Fi5TGwhU/G+g4LpOg0UbNcBPU8+/J8RdP/OI7DC0He6YrYnhco9H4TrZwGgkk4nBkWwUcjuhOU9J0Z0euQtLOTMHs66GDzU8+kMqv+3Iew9Th+k7dQHHwvxnbST1p7MQeO5r6+LgANxo518lAma3jUmZjsugbdZ9LLjore/s9DgMhbZwc8CCG3pZQdRTRB7CLEz6fGLZ0oq2nPEmYNr4oOIz/oFnOrdTwygB2/q5BtNfAWqB52hMICQbYG4dWWp9/XE7flgAh1idlLggQrbL7udI6tyzcueHqkcfLQku5qaJsB6UZN7W4IKqW3hIVAXhzXkAfmdBWlfnMWymnXl0/8uxu7TCOvf83MD7SUckBofzK3/Q6hmN7c5mMeACI3otpvuN4kwXr+R1U+w/5yNbFvaZ9n6KetHc1O67UmF4R/I1rrKFN/6oJgT4Qr9oZ6w+d9jWJ0QgKkLyBqwI7x5rqhmhoZit4wHfGGdK2Fxg4K1uh/ykdHJd3XeXLX9W1Yza2dKhC+J9m5oSqXjJ2M+SpFlK5vh5WiXuMW38uv2E/E8GY6ZibkP+VxxvRqXyofZUM4oXDKP+W+tv52hnxvVismYDGBVtTG4xHwA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?r+S9t2vpLldqAmkr017u6mOtLAwqj2GTQLKneg0WccamMM6n+IcDmZN+SW?=
 =?iso-8859-1?Q?X/ClmmH7SyEntXpZ4Z0E0r4VaX1xJPXvQee7ZrhmH/n7jQC5zp1sBFfOJ6?=
 =?iso-8859-1?Q?nSWhg/Yq3c2a3rChSxDCFPpBZPB5wblU25f/4JA00qgguc0ySy/afmeqLz?=
 =?iso-8859-1?Q?njZdycRhVNcQQbj5kGp22On0xThbXufxRGL4BDrvrbywol7IRRf/PwDA1q?=
 =?iso-8859-1?Q?gk/t/GQ+92ZC+mjsvUX7L6fAiwRkOF8jQuH4fcRloPb/PU3fp+hbc9TtuJ?=
 =?iso-8859-1?Q?iP40cXtksmNArGTiiQOOtB9tpDIEdvTLheTsX8rZDC4UtDop/noYjzbQ8t?=
 =?iso-8859-1?Q?/HU6fnFrihgIePQ5w5pN3KxIHx00QCHvNgbBpG0O+48PYkoPP+9y+21yVB?=
 =?iso-8859-1?Q?O6wnuL1NGvs2qDDWvI+4tUrXpbwSu7+giXLh2FhmS7OCB0TpwzFWFbyf+Q?=
 =?iso-8859-1?Q?wRjV0Mbvoh5zcConeYjD318P41yRzkBDNa09yELFLocfo7bzAc1qacBci+?=
 =?iso-8859-1?Q?dNhvzLgxSgDwEGWPqeOKJKcLtiiMWNvdM+nwzMV2FzzC4ym/BcHY1TCWYo?=
 =?iso-8859-1?Q?aV0mCrcuxnhkjRnB+I51nueY5IEiNIIQYnyrU8QykYffGx+wwE5WPdmNg0?=
 =?iso-8859-1?Q?iTuEL/Us8wfqS8F6BgQx6QnW/oqwuxaNqWBUdO/r8sIm0v+rCsdtWo/KCS?=
 =?iso-8859-1?Q?vJMatgSeMP7ZmaQEMRtxfDKe+BXqROsgZPKvW2l9cQ72YB5vWr6crsrd7s?=
 =?iso-8859-1?Q?z2GrVICrSNxmxefFhCeAoyvYfkxYN7kxBVyLDBlxoTJAfJSfwtjyn5/YeK?=
 =?iso-8859-1?Q?i5chbs+arlr24mHlGQcGCGtXWclVUXLGbnAzsGexcQi2FYeDDC2gxJ39O9?=
 =?iso-8859-1?Q?TVbPDi8jvh4xCvIuc+qmPfBLCCD0OBv8QMO6S/mTrO2s4KC5TGQ2aOO+xt?=
 =?iso-8859-1?Q?4reWkNWsSvR8960VEPXi+Dzixu3t7viUil1Pbpre3Um7VOTQbWQDHDAe0Q?=
 =?iso-8859-1?Q?TZjIyMTyCZMED73NL14ibmmL0NnC7V3Hn/Hx9jyQAo8S/CI0RhadjXKbrl?=
 =?iso-8859-1?Q?yvq7uBVQ8e5jbM1CcFv8JAYYxR0UhNDkP7CDT26i/sPL9j1wPZWGlEPOLb?=
 =?iso-8859-1?Q?rqjeOksEGD7rjpF6MtevuaDTsAPu6S0USzK87Ul1CROSifJE58yf33CVTb?=
 =?iso-8859-1?Q?wh63c4SU6y3h7SbObBih8SV2zdPlGV/7HNsPWLN2nMMJRB/ZAsZu+8mzGl?=
 =?iso-8859-1?Q?RdAXw/B/Va1whJ7LkcMEc6+hV9fs8oBroNhj+qmAjH4VCgVc1Z/d+eA9iV?=
 =?iso-8859-1?Q?uDwBzoFOpcdhLbVBoYWW1lcacd+FcX/0u0j5v6hMPVYfmxGlfywqI/c9Cm?=
 =?iso-8859-1?Q?nFWAojjCfau9k2b1723C+7AEQSdXCWM3ODIz0LaOPZU8NpfN3vm+kQmtm9?=
 =?iso-8859-1?Q?0oKcqfbgYUog/uhKxdjFaNtyluxA5y3meuPPFsiNtgfFukCF5KIfWWodgA?=
 =?iso-8859-1?Q?PsymcJXj+6Hj87uYcDccpr19PWJc5HSu35WoNKFkL2THbYTIcCjh5abD7b?=
 =?iso-8859-1?Q?/SzwvfdzhgYNwgZYOrGnD1N2YvAr5KkG0ssbm7zhJc8DKGGk+e4bEpBsbX?=
 =?iso-8859-1?Q?8YWP/XAugn3bUXaZN8hAa0YOoT8j9uMuI834s6cGL1c1inDcP1UHaf4w?=
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
	IlM3L4ul2laqgLsoE2/Uzzjy2FaK2HuX9ras/cJJf4Sl/OlPZfnTZUtL6je/bAGmW0lH+T3HmIem6gaARGmFHNUNIoumRH+KJ61Q6owonSOE2k7Iprg+r2IBYXrZvn3QUQ+6d5ZpeGO6DHvSNUJKa/8yLSOezgrf1iVuAO7smfCJj5Rxw8WSpXmYUVN43Wgpfi9xAqfzTJNrDaMr71oHm4DNrJrVxWiHjlDAPS6tsPRoXCCvUDLszP4leFw0TP3BdyWZWhk/k0nXTMkPvtPCBYk4ch0TpvBA1D5K0YWKldzjsDzUu8um24lHeSWmdK/TXmf753bdtZJgYeFofKAVoIWNjOCOsf4P+PFUTr60D3/zAXyq3l4Hv0MLAp5qCDF9/yTVEA5yvqctSpTCzqowJxxpU18hakmx8M8qtHZR1yhzPUyM+MfLw7WIjkDetx1mrDO/R8jMQUyUaBpMpkF+8gr9kgILoRWluLaPLwFnpltB2/89glwc54EzYVBiL7gV2ZInQ/Lh9xy7mRe924CRg3w3LjNatZYrNN+/rJvqBQ5xHapgNw/3OVPEO7/4MSUpBTFZHI77bOglhIWTLi15gSF4TWN8sq2FmyA5p3flTDet2mmbG/NkCiiHn3C1zC1mtdwgd7m1vW+eTG3gXEnxDw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c647df-30b7-4330-9802-08dc433ebdc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:19:52.9904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CxAFD4MnORN8b0agHXJHQDn55KbeTZ+KF/LTJiIXQEj8TZ6lv1tw7HAsK5SWul6iqBK82hI3c9v2Eh6G4n9A6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-ORIG-GUID: L2u1e7j-bX0yk1QIvTDTxFp3_Xlb7c4Q
X-Proofpoint-GUID: L2u1e7j-bX0yk1QIvTDTxFp3_Xlb7c4Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403130068

Added new bit ULPI_LATCH_EN_DURING_HIB_ENTRY in GPWRDN register.
This bit applicable HSOTG cores v5.00 or higher.
Affects Hibernation Entry and Exit sequence (for both Host and Device)
when using ULPI PHY.

Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/hw.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc2/hw.h b/drivers/usb/dwc2/hw.h
index c1d5d46c33e3..5e449393b0d7 100644
--- a/drivers/usb/dwc2/hw.h
+++ b/drivers/usb/dwc2/hw.h
@@ -333,6 +333,8 @@
 #define GLPMCFG_LPMCAP			BIT(0)
=20
 #define GPWRDN				HSOTG_REG(0x0058)
+
+#define GPWRDN_ULPI_LATCH_EN_DURING_HIB_ENTRY	BIT(29)
 #define GPWRDN_MULT_VAL_ID_BC_MASK	(0x1f << 24)
 #define GPWRDN_MULT_VAL_ID_BC_SHIFT	24
 #define GPWRDN_ADP_INT			BIT(23)
--=20
2.41.0

