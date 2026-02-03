Return-Path: <linux-usb+bounces-33019-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GUSK1JFgWnNFAMAu9opvQ
	(envelope-from <linux-usb+bounces-33019-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 01:46:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12814D31EA
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 01:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCE8D301411E
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 00:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925E7207A0B;
	Tue,  3 Feb 2026 00:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XOXgBh//";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iw5kRuN2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Xm9ELwz+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC11E1E49F;
	Tue,  3 Feb 2026 00:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770079530; cv=fail; b=hT/T0GseIgwGhEbkBbTqTAtWCTqgJIdgP7WNjwRG9ssbiu2Z3DypNAkeDsm4MGonR5Du6QYPUbmL/jxdqpSmyE1b0gqVp2T9cYKdOVau1lfKPxbSRVyTxHHbBo823rHC84VvI4z60oT4PFEFjjdY0r622kyBNiKYeSPOdUeEwx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770079530; c=relaxed/simple;
	bh=8MPM79eEfX3fcbRBIGy+S6ObpH9q+WWCOG6L6KnQmZM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TXIAiqRC7I+BZpG1mjYDUIpqtQgFvCdNn6w8zmUgxz0Rc5qZfBHF0p7oIF1spSotqn4KSQnkXWSyeM9pPIK+oYDJh09bkB7JwQfQU/LUNu2ICeF0CvLTdNo9irKHSveUdWfRrXyBKriWSFjihvVTYfy9Xd8hTnBVxKWbgwYUq3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XOXgBh//; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iw5kRuN2; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Xm9ELwz+ reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612Lsm6B4058942;
	Mon, 2 Feb 2026 16:45:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8MPM79eEfX3fcbRBIGy+S6ObpH9q+WWCOG6L6KnQmZM=; b=
	XOXgBh//4Bp5MG02x2Sf8yC1yUNY4BktmubAUyGq6YRtKQGgfUlRJtwICh2xoZTs
	u1qR8WerW1x6q9Y/8zetlSZuudLEVZfdZf+9MpMTfPutlXA3o/Xy3jYu/xegzrcf
	cBVZxtkH2Dq7ieoJxraxR7BnRTcn6myUSRkLhV7ifd7BxZ/8hnwWMqQbcmMS29BR
	/fvvl2Gs/F9ZvMF9Pf3JpkUDgfhAdKRauV29VtvmZqhk4bna+7Jb6+ejQN+LXJL0
	Fpi2XKENMZ9XJT+p5kkXTbOJwAXUTX/RW7uo7LbT7fAOfbfiZsmWHce3LbfFw1OW
	x4/+feGlbZo5ku7ukMEXwQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4c1h8hsk63-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 16:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1770079504; bh=8MPM79eEfX3fcbRBIGy+S6ObpH9q+WWCOG6L6KnQmZM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=iw5kRuN2Sz+/hTk1lCuCcwDOqc+MQ58+eeHOdJYs05gHCiNzXLngight9EfY+nV5h
	 x78DAsnQiFQNEKne6XQ/BsqXJ7hyIk2TRKaxogMdTC/5acKD30uDWZTqlUxJ2C5TgJ
	 y+YuhvwZi6/JHR8cqyUXdSXi8Lk/TWXLmWDgWxgRcFwJxGaymensbcqciiv8Tth/gG
	 hNEE4tPnckTo9gdDNQQyf8Z6v+ALnDVdjNpLy+9c464CUf8qYnHHEehad8/bpWxm2C
	 nymWhHMIwUVoR1b/dp3UpnIkr5zJMI+YlWEZXa2OtHybav935iwCKFkeyZlq42v0cD
	 xY2Su7/XD7jjg==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D2FFC402B2;
	Tue,  3 Feb 2026 00:45:04 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3F4D4A0070;
	Tue,  3 Feb 2026 00:45:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Xm9ELwz+;
	dkim-atps=neutral
Received: from CO1PR07CU001.outbound.protection.outlook.com (mail-co1pr07cu00103.outbound.protection.outlook.com [40.93.10.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 6222E401D9;
	Tue,  3 Feb 2026 00:45:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5fCsVXMGJw5APYRk3+s2u7oXiz7RuV0kmUVaC99cHoWvO613z0VqApxp/alkZjRGFycayDkm6r12137S2u2mMcA1UHtX10bh7KhYnLoBltRccN+BlzGwk0dFPVdnJ+zArljSaJ1CerIwj0datsaZ5s+fBpLLngD2VYN1BJ7L6GaFRCeIvWGZF7WaYujmBBF1PhUul7pMzCNrAIpwdVvYh/uDRvVsPV0o4Veb+z0mknNhg4t0HsdjXC+mvgbTMgOPg3A6K/kqTpTxSdorX/eRHCmfIdBW0pbyF8Ygo9UgOjIiOasX4LiJFCPZFVafAZNDgpkIw0H2OIWG62ANyTeaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MPM79eEfX3fcbRBIGy+S6ObpH9q+WWCOG6L6KnQmZM=;
 b=SwfD3MIw1YVVTZWlX8AnnP139eSmwjVRe9vEtAHuO/LBVe9q57p/CCnaetnABfYlPDI4RCearjh3MTW9WFURbKg5zmyXZ9e8+woI3EA5YIO4xptXk1L/NGJPMl6Khs6BNRiyGwwEJ7rxUVu58VuSdvgOQcikg4c4gpUpTS/ldlOahQ1YHDkAA3nKWUQMzFomYYBry5EFjAQjWMGYhpqIO/FG8wTndrNTblsBx2fpwNxvbHYSYlDhrtFxEVcGTI/px9t1VDz/dH0Zq0uJ45Z7OqB8G/zSw4kak8VCavwGUnHkFOzVwH6rIQAy7Of/6m5pPZnscEHx+yp5NcLJBlAxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MPM79eEfX3fcbRBIGy+S6ObpH9q+WWCOG6L6KnQmZM=;
 b=Xm9ELwz+hjF+NVW5CjjwkXAgFrJCsYC4vnKIpdbxpC7NhfydSpdShoIct54yLM74GNu+nRyUMQM7bcNaVbnbOgGVhNC9vGh2KEWxr2lsBgGD/W32iW4Wp8+iuZko9j9NOnW1XY/GozSdk7EQNgKkaZGuLZXqSTLeQRaTkrmNK40=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 3 Feb
 2026 00:44:57 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9542.009; Tue, 3 Feb 2026
 00:44:57 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frank Li <Frank.li@nxp.com>
CC: Xu Yang <xu.yang_2@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] usb: dwc3: introduce flatten model driver of i.MX Soc
Thread-Topic: [PATCH 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Thread-Index: AQHclC50Hm1F+24fW0iSvuy1L+8VR7VvjLqAgACXh4A=
Date: Tue, 3 Feb 2026 00:44:57 +0000
Message-ID: <20260203004453.rez3u2oiltciccfp@synopsys.com>
References:
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
 <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-3-c44a5e919380@nxp.com>
 <aYDF6UkzX+GkuN9r@lizhi-Precision-Tower-5810>
In-Reply-To: <aYDF6UkzX+GkuN9r@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ0PR12MB6989:EE_
x-ms-office365-filtering-correlation-id: 928b98ca-3173-41d9-16c4-08de62bd748a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?N2tNbmlSWlZyT3E2NU1TeVN3VlVoajIwMEl1MTBQRzFRWkI2TTk5ZnJaSU9z?=
 =?utf-8?B?OVh3VWorVVBsVENjMkQzT1hiUUp5WVA5ZDV6aVRjQU1RTUgvWHJnQjF4ZGFI?=
 =?utf-8?B?TllEUmJtdHVXS2V5S1V4NmJISmV4cFVTTW5xc2g3NHE0aUlQK01IVERoZnJ0?=
 =?utf-8?B?Ymx0cTYyT1lOcS9iNmo5R09GaWZMbHY2Q0VlTHBmMkU2c3FodkxwYytNaTAw?=
 =?utf-8?B?TjIyczg5QVVFSUZUOWVSNUExaEVMOVpvUHJJNkx4YjE1bUdiWHhpeU80NWhU?=
 =?utf-8?B?UEdKOExGYVhwUkl2dkY4U1Fwdjc2OUlZZnZ3RTdqRW9BajJ3b2VZWlIyWTcy?=
 =?utf-8?B?elBGQmRQeC9kY08vUytqcjFhN25qK0E2b3VoLzFncXFUYXV5ZkhWUVdEM0lw?=
 =?utf-8?B?QWpJaXVtNWFSZkZMVEtrb3BVS1dwcUQ2ajMwK0FSbWhmVXF1Y2YvT0pRcGZR?=
 =?utf-8?B?Qmd2RURaUHRGTVVrcnVYODRpWENMWXd1WVBveGtXTWt4RjVpMjFjZjNscDhH?=
 =?utf-8?B?ZEg5ZzBUNEhwNHBSVnlPa3h5NVN4QzlhaE42V1FoUmJhdzZmbWd0ekkzVnlN?=
 =?utf-8?B?TVAwcVVtNkRlSGU2Sk9JU0grTW50c1VxajFYOWZRbnRiR2d2c2JVcUNWTXFy?=
 =?utf-8?B?enhrdU5WMWxaSmdLbEIzSll1S0x4Mk9GSHhsMWV3R2sxd0VnaUgxZXJYRGRF?=
 =?utf-8?B?TzRTVTgzMkxFVStBZlBvS2lVbmVTRkpmY2dmN2luTXg5N3VUNnRETDQvdVpM?=
 =?utf-8?B?VlRSTVdLN0NjQ1pJUmQzdTRya2FPSW9jVUFPQ21Nb3kvRS9YVEZpTm5SL2M0?=
 =?utf-8?B?WmFnOEl3aFU1SGpIQTRPWTBlQmxoUElMOTVxNGYwdEJtVTlvekRxMDM1dVM3?=
 =?utf-8?B?TG5WVTQwa1cyS1FEb0RML2txWjZ6UnhjVzBtQTZLblA3SHJmSVlZd0M4OGQ1?=
 =?utf-8?B?cUQvLy85Y0FMWEQxU0ZDT1VvTXhzSndzZ2l5TnNzV3QrV08wT2dxNDdrczZ5?=
 =?utf-8?B?bnZSZ2EzVzhpNW9aNGdLQVdXdUtlelV2anM1V1ZEMWhkMCtBWmFqS1c2U00y?=
 =?utf-8?B?UHFJMnRTQ21RWDdDNzBlK0JWWXBMdGxwck1TUC9oQU1MWHc5S2Z0UzNHM3pL?=
 =?utf-8?B?VzlwU3NXN1NOZ0JiU21FaWZEU2hjVGEyL3hvdGF4ZE54OFE4djhFQ3NnVWFT?=
 =?utf-8?B?RW94dDFJYzJSYlAzTStac01rUnhnSzg0bGt1MG9rWXBCYWxReTRtUHphTGFC?=
 =?utf-8?B?dUt5L0U4ZnQrYm1wbDBtckU0RGUvRXZBcGpKK0M2ZzlmTnhPMFVlQnJOUXgv?=
 =?utf-8?B?ZDhOWkNaK2VjZVJzeE1lRFZNcDA5dmRUeHgwRDdDMkF0OVl4eUREakhIWXhY?=
 =?utf-8?B?U0h1SkFHS2JkckVxNkRBRkRkcS9STlR0MjdyVXlkcnpSNS9HdHBXRUhWZjZp?=
 =?utf-8?B?ZlVsQ3FnUTNhMk1ZcEtuVng5UFQ1bUIzZlNWSWVwRkNCYS9DUkw4TjFnTVMw?=
 =?utf-8?B?ajJvcTRZeG9NWXUyL08vVEdmMnBhejJyV1A2RURNZVdrejUxakpVY2tRVHlv?=
 =?utf-8?B?dEsxNjdqZExSUGovUmx4ZUNzR0krZ20vQlk3TUVvWkdFT1BSYlMyVmhyZm1P?=
 =?utf-8?B?WUFTRHBvRlpKYTEwYTRBV0Z2MlFLZW9MeFJ2ZlZqSXJOSXlXN2NvcXhOWWYz?=
 =?utf-8?B?SmxYQ0Y1WHFHZW1aR3diWVFTK2xzcHFQQ0tUVWdEK0o0SjJ3VFdjZHdqalM2?=
 =?utf-8?B?bGt2d2JQR0s1cFlsVER4R21mblJEL3g0S2lCZXBDa1dEckwxcEpGT09xZVFx?=
 =?utf-8?B?VkNEZlVNOUQwV3lpTVlQVmhuU1hZWEhiZVpwVkhtallqOUNMeGNCNSs0Qmlw?=
 =?utf-8?B?eExSVU03SWxSK29HS01NODRYa2tPNmhFL3QySlI2aGhJUW1nMzBlVUdvam1k?=
 =?utf-8?B?Q2pzeEZYUEFETlhmVEdJWUdGdnNuMUpyZWlaYTV6dGVNU0JueDdjbFhqUnhB?=
 =?utf-8?B?S3FIaHcvUUR0eVhIaE9kZzdUdDhCQ2svYjVDN1VCSEUxem1ZQzdWUWJsNktT?=
 =?utf-8?B?RTVNZzlaeEZ5Nk1DTlpNNzkwZFFWMk1wVXQ4YWRBSEJkUkE1czlPa1FSUyt4?=
 =?utf-8?B?eGRHc3dlYlBzR0piOUs1WER1WXhtc1Z6ZmdrMDBxNXQza1lQTHVzdGhHbUV0?=
 =?utf-8?Q?Z8iDS8Q4X2DnwjTmP7sEBPQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bmFvQVVtSW5PMVNOYUtadXdKY00xbXBibnFSNmswUFpxSUZsZDJPeGFPZXQv?=
 =?utf-8?B?blA0LzRrWEo0d1A3QzhCOHpYMWdoMXE2MWVaNGRQVmJUOGRJOE1pSUZRZW4z?=
 =?utf-8?B?T2lwTDcxV0dDUzRuV1BpLzRWZlJJc2FiRkJUU283eFNSTUY4dDdVQ2thWk1p?=
 =?utf-8?B?TklHcDJCaXgvaERYbUxzRy9FR0YxQ2piZXR6TEV1V2V2Z25lS21sb1NLOFZJ?=
 =?utf-8?B?OXQxK2FWLzdOWEgwaFBOWnA4ajhDeDJ4MXBYZTBYRk9OUSt3M0IvTTN1N1Ux?=
 =?utf-8?B?azdFZHRwUUhWeUFaZEhCLzhGMU1aWjhJaktDazRLMys5NklCT20rTGVMOGUz?=
 =?utf-8?B?Y0ZTa2s0UmNFSmV3N0lEUTUxeTl0c0FRNTNHUmhLSlpjbnlLcklJZk1TNEVm?=
 =?utf-8?B?SjVxTUVEL3dlQXAzS3UzbW1nTDd6d2d5MnZSQmpMb2J2OW9JTENzSnJjVHl4?=
 =?utf-8?B?L3A4S1pvSnJ6dGVTdlRRR3A3R24xS09MZEpZOGZBS3BsVmR5OTRzRzdRZzBN?=
 =?utf-8?B?NXBSOHRkd1ZNbm5GNnhwRmRvcDJrUXJtQUloeDM0SEF1cHJrbE1TTEE2OVA4?=
 =?utf-8?B?Zlh3aVVJbmVkb0ZCZndmNTdzY3p5eVlWaW5oTEpyM0hRS1hMblhhQ3F6NmlQ?=
 =?utf-8?B?U3g1SWxDSmNLR3Jqdm1wLy9NYWVIL0hMTGk4ODFVYjVBYUZUS2xiQ3hHalJP?=
 =?utf-8?B?Uk5Wdm5tMmtGWEdBQ0tRM1VJK1Q5ZmZsM1krVzhBZGpLQWRZVVo2MFlqdHZP?=
 =?utf-8?B?LytodVJwVnlhQmJUbnZRVVBnMDRLdHJIUE9UaEVwN29LRFNQN2RNSWJhU0pB?=
 =?utf-8?B?aGdiRllubm92Y2wxcmlxWmpUc3VEbUxseUxsd0tGa0kwZWN2VDdZQUowVjRJ?=
 =?utf-8?B?UU1PV3FNSkM0T1o5Rkx5T1FUODdaZ0xyU3NrNVZkSmtmUzRNZ05hdFVQd0pN?=
 =?utf-8?B?UmZ4OXRFYzFhT2VuM3NDaGV0NzdHS0R1RzhOdWpxMjNteVVwSWlmK1NEamRC?=
 =?utf-8?B?bzVIR0NKZW13cUk4cHR0OVdFL1RocUdlK1FNMjlzZERNSExOc3p0bTFrd2hX?=
 =?utf-8?B?UXQzS08wREl6MnB2WDltRkdFTzBkbTRXblFYaFZ4eG40bzRlQTlJSk9yN2ZT?=
 =?utf-8?B?NE9ldUQrQ1ZXMHk0bThQUTNNc3EzSU9PYWFucG1CRFg3V0hWQkhlY1hPSjFU?=
 =?utf-8?B?cG5LSEYvdng3K1dyNUR3RlBGWksyTlRzanNwazgzRG9pR0tvcVU1Y3FFY1ZG?=
 =?utf-8?B?TEFXVkxxYk1UTjJTQXhLRnUrdmRiM2lqVjFHbUJWaGljTW4xeVVTQ2ZJcWVJ?=
 =?utf-8?B?UlRRdkp2ZU8vejNYcmczeFJUa1FscTFoSDg5WjhBTEVuTjFSTzNzNDFYRXhG?=
 =?utf-8?B?Q0F0LzRiMk1Hb0ZiTXJyYm5HaGlSeklsNThEcWtCbXVvZncxUDhOWXArTjQr?=
 =?utf-8?B?dUl0VlNNbmJEWU4xWFRKeEgyUlJ0alM3amNKVkdNbVhxRG5PZ1RwRlNZRysx?=
 =?utf-8?B?cHB6K2pzQU9kVFBDRW40OFZqYURwcEo1bW84SU1DUXlYWkxSMEtrRmh6R091?=
 =?utf-8?B?aFVEcWd1cUgxTHFIQUJYRG91SW9tb001NFVPb3l0SHpjMlpXWnFsd3pNRHFQ?=
 =?utf-8?B?VTJ1UkxpMFJNa2xZSjE2eTNFSVZ1c2o0S3d4eEdzZG4wSW93OXJ2ems2akdW?=
 =?utf-8?B?YTIyMGJGeWRoMFhhSDJwWWNQMzNBRGViUmExK1dEcFJsNmdYcm5QOFBuZ2Vp?=
 =?utf-8?B?cFliWnFLNDhGSk80YUVFTFhVSFVXcHh1bm9QclBodXV2L21FcFh0c3NCMGhV?=
 =?utf-8?B?Ykx1L2dVMzRkUVNGWXN0TDVkem9GMmNHdVVBU1hzQlNScllZQjdEUml5Q3NO?=
 =?utf-8?B?akIyNVdFZnR6Z0dvdnRKdVYzS0tkTXZFL2FnZGpFaTMrc21wdnZ1RnR2SmJy?=
 =?utf-8?B?SmRKSUZ3akdqY2ZOZlhZdnJSV0czVDJFNFdORHBtK3l2TXQwbDdHMmRxcytr?=
 =?utf-8?B?TGNyNFdWQTFPLzJiLzFlSnRoa2wycXRmQnFMTmt2Z3hsYkVIc2NPb3NMbDVv?=
 =?utf-8?B?OCtWM0FkdUNjaWUycWpSZDNRL09KcTdXdmlXWVluSjRZZ0pPTGdZczlZMnZs?=
 =?utf-8?B?akdnUGpWNzJ4MzcrNm1aclNmcHNIdjZ3T1N4NlllVmsyMFNIRkxQMk45V0di?=
 =?utf-8?B?MXNBQXZFVVVWS0REd1YvbjBhSkpiZTJvKytoUVlhbURSdEp6Z2JKdktIbUI1?=
 =?utf-8?B?aFowdFNBNnJmTW5COUhsNGR4OU1jTHNtODMrY3NXbS9RRkRMbWRlZ1RDUlBF?=
 =?utf-8?B?OG5PY3BBbjhUakF2ZytaMlljWUk1SEJGT1djc2ZaMEtEc2Q4eGdMZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C508D4366088244859A709B5555B076@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W9mzJ9rys+dbX1Di9ZtkX4NsvK/HrvgJ1P3lsSI/5dEdxsAeSiWOC8G3PN8ULHov0LlGSwteYQ/28EFUbCzK2VQqSYV6hQt9aezN/0aBBFoUXoNC15w+VTcJjo3D0RB09vAkSh0lWSLhR+Roo/QsgNnjH+8Xm7IXz/IbkiUS9FGx3XZS9LHj5SCXSjRmHr9tLaRB3hDwN4ohSa6nK1lTwOpMErgH/aDutaz3a1dYtnMQCzF3gRP8uhkf3z+zKArEcdCIJl5epcWZpAVlFh6tshPZb/7ZCCgYiFnELxcuTLpgrr8p6ic2fgdAXJrPdkbpX1RE/nlvbCpTe+vYCvlj1KDlRWXpPqNx56r3BbHY0u8VBVllIVmdnqshslogluCmc7/+nX+/zuyGV1FElQ33zV8jZy3D+BiB3HZrBQSVWs9yl8RM/35e+XfCIFMX0bXl3fpaFxmxF+RVL5jD8xYZC4y4DQYpv/O42wwV0ZrhpmqQOycrwDwH/p4x5zJyKICVChmux6ucLGNHMFyNNjPuEwYg5DKvv6FHYOW9Sf/9/8+tXogb1O5enTu0SGSrHlw4TdtTDDuKDm+jvXriTcEnWWpP904c48cDKwISW9laJxOOlLFhJeowx1j4W+n2khQQhZAnfipjyy5jLkmnDSDMzA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928b98ca-3173-41d9-16c4-08de62bd748a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 00:44:57.6619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TwUyvLYIx96gknW6PKVaQZBltekr78sZqn70m8el3n9QV94oQ3do00d5feKtoVPWPoKRHd+jxkuV3AoJCyY3Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989
X-Proofpoint-ORIG-GUID: 8nOE5jsGdgP9ZEp16UdPgzgp3VcB5-bd
X-Proofpoint-GUID: 8nOE5jsGdgP9ZEp16UdPgzgp3VcB5-bd
X-Authority-Analysis: v=2.4 cv=Y4L1cxeN c=1 sm=1 tr=0 ts=69814511 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8AirrxEcAAAA:8 a=FPGbVDflkqIywSFyJRoA:9
 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDAwMyBTYWx0ZWRfX9EqNcxBQLTRa
 /0RYkXGD5kkpC6ZI8MjcDaiWXIbukX5QmhL7w9UCMllu7j6rOSCnS98gCCK+jdXmTi6r2u9OkBJ
 P0Jzh1bAtDV1KMpPZDc1sM63veHk4YqhaysFUJF12JarcSxm7XlUWyA4neXEYoyqOngFMjU9Ce6
 AtBcgdvu/ZWGYSp0w67umnKlPocGtFhhsNVaPq6RMfcfeGhM22EwDunCtVrw4JcdxbX4L4Px4LY
 xk3WM0IK+vjB5v17DShzeeEkeZim0a2/X4wa5IQg5+oQ/vpk1DA3UJTFV5DiXj101bkluxGl2Lg
 6VTjGJAkOeyruqqYHilIWqnl0QSgf/i5RMIxez7SWcMbejgqA0e6AQcP4tYup5cMgc1o9B7lSm+
 HCLRZ6gA9tcbmwQGFzOIkDR/YZYatuHJIx5i1Th/qMEvAkYjkeH+CywKEX3GRFBBNKkItp2uiyU
 bRzAUVoYi88XXOo3X2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1011 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602030003
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33019-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,synopsys.com:mid,synopsys.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,synopsys.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 12814D31EA
X-Rspamd-Action: no action

T24gTW9uLCBGZWIgMDIsIDIwMjYsIEZyYW5rIExpIHdyb3RlOg0KPiBPbiBNb24sIEZlYiAwMiwg
MjAyNiBhdCAwNjoyNzo0N1BNICswODAwLCBYdSBZYW5nIHdyb3RlOg0KPiA+IFRvIHN1cHBvcnQg
ZmxhdHRlbiBkd2MzIGRldmljZXRyZWUgbW9kZWwsIGludHJvZHVjZSBhIG5ldyBkcml2ZXIuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBZYW5nIDx4dS55YW5nXzJAbnhwLmNvbT4NCg0KQ2Fu
IHlvdSBpbmNsdWRlIGFkZGl0aW9uYWwgaW5mbyB0byBkZXNjcmliZSB3aHkgdGhpcyB3YXMgbmVl
ZGVkDQood3JpdHRlbiBpbiB5b3VyIGNvdmVyIGxldHRlcikuDQoNCkFsc28gbm90ZSBhbnkgbmV3
IGZlYXR1cmUgc3VwcG9ydGVkIGJ5IHRoaXMgZ2x1ZSB0aGF0J3Mgbm90IGN1cnJlbnRseQ0KYXZh
aWxhYmxlIGluIHRoZSBvbGQgZHJpdmVyLg0KDQpUaGFua3MsDQpUaGluaA0KDQoocHMuIEknbSB0
aGlua2luZyBvZiBjcmVhdGluZyBhIGxlZ2FjeV9nbHVlcyBkaXJlY3RvcnkgdG8gc3RhcnQgbW92
aW5nDQphbGwgdGhlIGxlZ2FjeSBnbHVlIGRyaXZlcnMgdGhlcmUp

