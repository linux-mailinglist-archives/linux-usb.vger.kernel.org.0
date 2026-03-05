Return-Path: <linux-usb+bounces-34035-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEEFMc3dqGlmyAAAu9opvQ
	(envelope-from <linux-usb+bounces-34035-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 02:35:09 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEB5209E27
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 02:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C90B93051716
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 01:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E18246768;
	Thu,  5 Mar 2026 01:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="rXPN9r9D";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="eyJNGISl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qjS7bKPe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25742244687;
	Thu,  5 Mar 2026 01:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772674478; cv=fail; b=IsbPDDj3OoidXtU/skjjGxkon2G8Nh2eySQSqJFQC/Ht/OzDBIx3ypjwPLthpqHQAInmulSp5ea9XyhZhTlIQxVOkY+USeTf01465rJ8kkSrthvHmEBKMtzDiCcb0RiOSNtVpDG1UMugn+OJiL7uI4MMrBvz1CD9GPItLgJGHj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772674478; c=relaxed/simple;
	bh=vxUQJwyrK7kmreXeyY85f+6+GKJZHA7JP7fQpyZ/2ww=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F4s2/imB4hVX57j7gUQs3kDh0j9yphLaG8HDYPujXTCdZxOCWlGQV0YGU1luANZY58sEz1UEVKuRD/N38WIdHHtDO5qfIsfRGCpSHy2FcpEzIsJcijZ5KZqGN6fLXjkeZnxmqb7OOwYaoiiImV1go9W34X7u/jR8qsAiS1aNfpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=rXPN9r9D; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=eyJNGISl; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qjS7bKPe reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6250ijsd2783575;
	Wed, 4 Mar 2026 17:34:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=vxUQJwyrK7kmreXeyY85f+6+GKJZHA7JP7fQpyZ/2ww=; b=
	rXPN9r9DDFvSqU5o33IBwB+mU7z6UR/26vHnNFHeazBMdtNzjkwSEh0uOLA6Ra5G
	QiheOT55Uyfc3pMT9XCpxkVs76ReMHT/Ie6r3pntzIkXX5XwTUC1/rlcwp6t4m8l
	b+TVWVKBZlWb3a0o50uDYJOjXtTuq+7KmeVURlnRqqUq9Lw2Nyu/Pn06PDUD816u
	PUm/WJvPtCUB2NOKP5BXaCskVa4pKeDEfSx1Qu/Olu5CIzm5CKTqxKUvwf575IW8
	UabG0dgk2SuCPjz27NI2gr8O4ckEJBI8zhAux1dvxNu+fmMUc3tm2HTap6T8DcZX
	/w+tYl4mjuoawQaELmafvA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cptast3fb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 17:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1772674470; bh=vxUQJwyrK7kmreXeyY85f+6+GKJZHA7JP7fQpyZ/2ww=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=eyJNGISl2ZWhNKyyuxbN36LauC7WOmpKIL4GcxHVGnabPL967xw30ICX9NNSop9qQ
	 SK/HJMu+vmDPuH2DBrVkSvzpCm26avBnQiQTZBaXuKGuGdFwEaoPh5MJ0BfgFitWdV
	 4WyXi6ZyF6RSm+WBMntI8tqLSiKWZO5MCR2pPga71I2G2qnaCy7pL2MR1gms4Jji8T
	 iK8Itm+qXlg3p7YRK8trT0oiQPOGeZQV7cYL6Dj63F1EY5dgDDgTJz3/YK9SUVg1h2
	 K3bVq1dBrO084IScnoN//zHo+iEGN9HJ9JX4gZXaHtf5agmdyTD1//L23pWjkhvNjl
	 p+ak1rMLIONbw==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1BCC5402D7;
	Thu,  5 Mar 2026 01:34:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D090FA006D;
	Thu,  5 Mar 2026 01:34:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qjS7bKPe;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00106.outbound.protection.outlook.com [40.93.14.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C5275405C1;
	Thu,  5 Mar 2026 01:34:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ah7zy0BdqpZQaI2Fwa+hlzPVbWDuYPYjVvZbbTHfi4EqrWJdHHmQEUNmjxwR81r52jfr6ZQNSWr0vKsNPtnCiKvnmqT1mQcmlpOKSMgVIRNSmS1UtAWSbGTheSKZURbwghX+pyplJYUZk1hxI0qfIdC0lSbEqNoy7vM+FX3P0g5upIIsXWCDFjVZckMGpQsEOWF4Xyw6VVR6oZk26q7nMXGPGb8umfFuluz9ccVHrwUP+ilsJ/mg7VtaWhYZpKsFyKLgvsgwYxCi5H7XUmrGGCGRBK5vcehzgpktCpN0Yg27YBJnXUpt9mCBwEGIJSaKEpzCVgjQROR7KdQXnvAxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxUQJwyrK7kmreXeyY85f+6+GKJZHA7JP7fQpyZ/2ww=;
 b=N9mVs/P3VkhGTUqjYyyl9DssjY0SRiViYdV66MbgOfb5gUdPr5NZS7S9apvMBajB4pWtseuiy7t5Bi5lpr10O2esCmLjirCjxbjBrDWB5a9wjM0kcH8M84IY6XFZKzarCz8A9bAN3KSaxZXBCYHsWULy+sx6hqhiGTHTEHciDtOqIiqZxrZ1Zc7fTs312CuOhAR0cjxFSrgckvXLeVLjZJVJa/YFyAyo9bUrS8SvY/6f5PIdZobzmFRL7Psquu6eWZihGjR8jWuzIuu1FmXmXsgjULF+bKZyIkL6VSsElpobUF6rmsfRTGhlVTK9/V5qnJkAoY2YyT4ruHeBMJT4PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxUQJwyrK7kmreXeyY85f+6+GKJZHA7JP7fQpyZ/2ww=;
 b=qjS7bKPe36s+HczfF9vu8qQip/ip7cUiyFHqXpclGUlxoWzkMJ0gYB0Jc7auTuxx6Ugs17Zbs3UWyzjdZdMJMRTR+NA6qUW8KdSV4HTBtlB56MxQmOudqcEd9Tf19H2FZ/ZIHoABZmfg+Ytb2L3IQJIcRthPy8veERUQZC3AR3w=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH8PR12MB7304.namprd12.prod.outlook.com (2603:10b6:510:217::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 01:34:21 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 01:34:21 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] usb: dwc3: fix a typo 'HishSpeed'
Thread-Topic: [PATCH v2 2/2] usb: dwc3: fix a typo 'HishSpeed'
Thread-Index: AQHcq8tRQ24Cp/+G8kS4nNdJG/SvcbWfKMQA
Date: Thu, 5 Mar 2026 01:34:21 +0000
Message-ID: <20260305013416.mf3oxyoh24zh3ldt@synopsys.com>
References: <20260304113916.856841-1-xu.yang_2@nxp.com>
 <20260304113916.856841-2-xu.yang_2@nxp.com>
In-Reply-To: <20260304113916.856841-2-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH8PR12MB7304:EE_
x-ms-office365-filtering-correlation-id: 3e888198-515d-4c4b-d85a-08de7a57534a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 Ofk77Qm6QXuaXzw6W8IXimk46qExS2AvuovSeJBeGjYZqxI0HIe0O+XuKDcVsoDBWWF4399RL9sNMUiSfZd+wV3B93J7EpNrKQLHkVnqGj2VgzKQL1XLnMG7jwwfaMSveaAG2IqPeLQBZwDAU0GZmpvTJriKUvIIt6FbmR4blVRQU4mcPF10aJmwq4SjdIa+jWsZyc5ur6puTQIo8qhSMmrAxX0da+EnN3cXURqxvSfBGqcf0jVac+AkgkHOi275MtbA+a1cjK8pCeb2/I4K3DfHcDEZKMvQedZpEDGgIJKV6lay4HobQew+MemgdYdLmG5n4X+Wh8UhW1t3WBsY0eQQquEM8Ms9Z7YO9NTQGLmiFPEtDps79dHrH+ah9o1pb/q7gsjvZWalSVdKpJMsdsrjaX+JirkGQdPsUd278OMEct4RNYNam5q4cHEVDT2kj4fJiZPuyvai7vleafOFTfdSMGmSbfDt3sxpCmpCA9KTPFRbGwCd86OglDQ2Z3KMSFt4XwJMiCq4RlDf7vdFOAX7Eci5957kfdSZ728KEFMISHqPk21iNNazc1G5ymkTKcWFn/gVcWN+P+lEFhA+UOMfHunoZX5L1QHPtGW4URT7Odmn/XHWopniJh62c8WqWsUbnfo91krR2YXgQP7iZJpoeF8Sd7LdhPIVinmpM2gk9E/by+kOfthGPlEareEDIbfM+ykzmDyJjk+B88Q3VEOYxIFltiaLY/6b4mT6i7YXIgBV01RkmOluspYsCHzFjISKQMOnWwY2rkF+6CwvwG+om03tqvmlbgGkDQwQdhM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NXgvWEVVenM3Ky9FaFpicXFYWktGWU5zWVVLdzEvTndRaGpNaWREeE1tZUQz?=
 =?utf-8?B?Mmg0YVcyOEVIejFTQ3pwTkxTWUhlRjZndXd6STh6T01CcUpvb0R1UTRHRTRl?=
 =?utf-8?B?RG5GTXNEeFBMazFLT28rMjcvdFErUFUzM1hHejNma3d1VDFzUktMVFlWY3lq?=
 =?utf-8?B?YUp2K0ZSdW1SSm1jQTFvTXBQaSt0V2c1NzFZeHJvRmkxUTMvcDRDUGNJb2VV?=
 =?utf-8?B?NjRjTE1hM3hPZE5wdVhJcFBvQTFmVTl4bEdsTERkMU9zbUtHUnUxM2hvWnpM?=
 =?utf-8?B?d1llelJzVnZsbXRLMmQwTkF0KzFVb2ROUWtGYlhsL09lc0s3VzhxWnBQNitH?=
 =?utf-8?B?RUVBNjdnTlpzSStDTGMyWnVvczl4SVdEc0VPaEpuSnZKR2RLQUpjN0dhUTRo?=
 =?utf-8?B?ZS81RHA4RUFnR2MxczliOEFpOHlEMC81a08vWmM3NndxcEo0QlZmNWErVDZz?=
 =?utf-8?B?VU9ML2hCNFV4aTZYaVhqUmt4WVZLN0l6Z1IrM0dMckppeWtIak9qRENuV3pB?=
 =?utf-8?B?emRpYTAyZ2lBMmk4UW9ZcE1kOG9CdmNKYVp3emxGUGpLT2dXWGZCdzM1dHFs?=
 =?utf-8?B?aFFzMDlPTXBnU2tZc1BaWUlUbFhqdkxMNThzTWQ4TDRydUhwK0RKSjVFdVRU?=
 =?utf-8?B?RnNRcWZoM0pqTlJMdVIrYmgrMWpKWGZsaU9JTVpTODdPQkoxNnROa3hDQ2tB?=
 =?utf-8?B?UFc2SlhQRTM0NGdOa09ydWt5U0FLdTNJUlFseEt2Uys4dG9SUm1NSXVkZUFJ?=
 =?utf-8?B?ODAzK203dGR4cm15dTBRTWEyTDNOc2dFQjhBWXI4NjN4aW0zL2EzMmY5MjVO?=
 =?utf-8?B?MTV0dTBaQmYrL0VDUExUWHJMN2VNVWR4M0Z5ekN2UkRrQUpHYnA0VXFlUytP?=
 =?utf-8?B?WlV2bFIySm8xZFFUSzRVTTBNOVhnajVNNEFPNnlseXFPVno2RDh3VWltNWdi?=
 =?utf-8?B?WEs0SGI3ZWRwbm5zdlI5TVhYdlQvQTBKd3dQRTcwSS9MY2xhcnN6KzBKYkgv?=
 =?utf-8?B?VXVVTC9wbWhYN3MzNTFVQ3RybzZpWHZyVDlubVNJK2N1MUxOWFNTMGRHeERw?=
 =?utf-8?B?eS9ESGhKamhETWx1eFNnUWNvYkRCOUdiOFc4c0U0dDhVU0NKMDhQVllHSlQ2?=
 =?utf-8?B?VllDRTFsQTczbWZZT3VhcUlVZzBJYVFLREhweUpwVzhTNmpqUFdUR3k5RklJ?=
 =?utf-8?B?MFJtUVZQZnM0a1ZnSVNTZjBJM0cxSmcyNWF3RGg2RFYyRkJCYXY2ZFFyNXp0?=
 =?utf-8?B?NUFuMWtHMXVQV09pTjlwdTF6QkxJbTh2U21NOFluNUNSQTVJKzhSd3NET0N0?=
 =?utf-8?B?eS9uekkrNlVIeDEzVXJua091T3lldEZVSVVNblJUL0h4NmlVcUo4d0NqTzlu?=
 =?utf-8?B?Q0RHU1RaNUZsOHpCOHNrcldIREtiU1ZGWGpDeFRiY2NYTFZTbG9iT01OQW1C?=
 =?utf-8?B?Sjh2K3hOaU5IbzFyWWhpdTVnMk4yR3JDTGQxZTJpZmI4aHNhY1U4bXVFZk01?=
 =?utf-8?B?ZTVXVmJ4ZXJoK3JDZ2ZEaGlNVVA3SGdXbFQxOGVQOWIxODRqcFdjWlZmVlRY?=
 =?utf-8?B?Q2dTMnVac2hFNEg2YzltOEErYWc4dUxrcWpwVlFBUkdSYnlQdGJidmdXK1Vy?=
 =?utf-8?B?NFBpWGNSZnhRQ3VJeVpDNHpoWW9OK0FodkdBNGR0anJWYzdCRnhVeU9La2ZK?=
 =?utf-8?B?SERMaG1DNFRGUkVvN1E5M3NWYlorNG9FNDcrblQ3N3NNUHVMWHczYWx0NVlL?=
 =?utf-8?B?YWlDeGZ1L1NkeUhNZHRyVzVGNmQ4U1hXVEFmZy9ReFErZVdXc2FuMkFLTHRM?=
 =?utf-8?B?RTdaNTROMmpReTRBSGRaUkdVSy9CaDE3dUdWbmdnL2dTcC9aTWU1TEVuUlV5?=
 =?utf-8?B?bSt4QWpIOEJMRDl6SkhmMllLMm8rL1crTDFYSkVkMk11bytEdWh3WlNWSWNY?=
 =?utf-8?B?MVFOT3hjNXJRVTIyNi9pNU5LbDA1bkphU0tINDVJb0dVUENjclhHS3Z0VjhE?=
 =?utf-8?B?QVhGSnRyTWNQbmRqaUlyays1TktqTGU0bXkrRVYxSmJBYU4vWHlucmxZcC9m?=
 =?utf-8?B?WDFmVWtvaWFoaUV6K1pkSmh2dUlMdnltdE5iQ2UxZFVkazdBQU13NGh5Q2Ju?=
 =?utf-8?B?Tm9HVWpndlQ0Ly9kS0pZc2Njd3FMVUhWSk1tVFF6TU10M0xjR3VSWWU4K2xx?=
 =?utf-8?B?SjNlYU5PTVVLTG9YZHZHbXhqY1NXbVliQ3h4RnlycVBEYTlabUVjdGpBZGdX?=
 =?utf-8?B?c0ZUZ1ZrOHF1cHE3R290ODhSNlUyMzBTVXAwZDdHSnVpZzJ3Yk5oTFdqOENK?=
 =?utf-8?B?MFU0VmNOa3BKUTNDTkwxd01kdjVVOGRzbWIzT3ZEK1A0ajMzWlBsQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBCE45E76C5FC74B9A3761E21200801C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	RhjEQdfZwahffE8S5o+2rza/IYe02SWUEymV8R7YWvF2pC26LSy1mKGYRL3+HF9SMYijIKAgKHNcEI58cwFEguRk3e+B/x12vhovFvKth/gqDyTYyZn90Kd0D8d3+l35bmT+Fb2sdCl3c1RpO9N9BOKfAxtm1fAxqXnjr+nqG1k634QIFdMf85VjmVtTVdJnP2stYS2bqycdNKNZAOTcXUwUnmoSWocWtLtTKenx/kLX6kYexOWzBo36viHAR8TYnqv31a3pH06RHK7sshwSIpP+Qt6pRz7oVb4iHMpt0z6OH3GeaS+NcVe2LqFUjxP5ABZ0vD5bhYeImOwsc9HGAw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e65t4fjeb7whv00O/vLy+0wNN7xk5MDzxDzEbA95EwnKxhb3SGJ/baGvgRvqEdHJPMNEpcRHNj5MrWTiES8Iu2SK1DQy7/gRfDo+6DnPQJ62FgSOsqadQWGLleuDcyYLXACsu8ab7FAiZ4AYge/R7i9z4DTGVRuI01+xqp/LklnDLMleF52QDX6vFgph2S74Wx0I9+3mW+q4tHyEA32HhKkFMM9AHSmREMHoaO6y+S2J0eS90XVESW925PVFDdN+CBBgSwbzkVWyYSEUTW4+JzWReyg8VuHI73KYi8jGl0uhv7xQB0LtmwBMtI4TFsr6IrNo0rvWz7jEQeue2Xbt0ltA2aV/hztITT+hV4Z7LIvcaGi4z0Oj1wdczdXlPrJrINyTIxKBWdMWGvPK5SefnvO3dyVso/k1qewVHVhKhY/crC+HxjxeF20d6HeoT1EhxdW27iRTXTGVwci8/AvD5awdEChQmRRcXUqCWzXgFBm3+J/HWsRECiNKCKF3iGAOF3C9dHIJadSzX9u4stEuV3jX9FaIUJmI/2lnML/3IaZOOsn/y7ySKC529tijDRGh7kuM5a43pSRChwENihw/yGWS1YEyCm12UDtKnuB8oPLQFq4SJ4zs6Vc/K6htpH1WABmdcswd9n9WATGsdLJqWA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e888198-515d-4c4b-d85a-08de7a57534a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 01:34:21.0311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zkMslG0N01e315UgIJ1+Zoj9/RTyZ/nyreD85zV3lxS9DAFES/LC/8OlF3BefnsNdqANFUaqmVLzT+FIPuUvvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7304
X-Proofpoint-GUID: MPj7pbs1_SFwz5J5Rhu3XysgCMbZZl-Q
X-Proofpoint-ORIG-GUID: MPj7pbs1_SFwz5J5Rhu3XysgCMbZZl-Q
X-Authority-Analysis: v=2.4 cv=WrEm8Nfv c=1 sm=1 tr=0 ts=69a8dda6 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=8AirrxEcAAAA:8 a=jIQo8A4GAAAA:8 a=oRDR9aK1C-H591A9fi4A:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAxMSBTYWx0ZWRfXwOFwfIPAQewa
 J9XRLtN1nISCjCfXWaqhAWUKHwzm9DlT6Ian+0ffkYTp2PfHFh4t0+qy67AXyeaIJXvHIwuEVYN
 DtD1Xr989ybZgDUNdciKqYRkw1Lej40EYhdMDreoQtbBnrJiCbeQyvVWxg8TtSO0AgzFSJG96Zu
 odlEMG51qDMZrq7Csj5AqpCaaxYEnz94GrrL+OvpjgitYVslTdwrM/7w0T5GTWRQ1dCG5XMDHhx
 U1aMDWKVOutHVh7ruFGFTcVOLU7N+KlUQo4zcgN72FTdY9y4jkOI7qQShLFFHgTmnk0YFqmO0+5
 N4mFs+lJtPF9cJBjrC20vIe14HfhnnBqr9gcmmZCq6VeSjh17+fPiNqsHo+nX9WYt6vGN8Xfpky
 LIya/ZcJtkpMNnMfsKlhZWAvhSrr9PSkNcLUZ71D9O3V9/FXyEUuXeUozowhmAjDFJmaz5LNbb2
 YlHgzMcaoMeXIerN1gA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2602130000 definitions=main-2603050011
X-Rspamd-Queue-Id: 6EEB5209E27
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34035-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:dkim,synopsys.com:email,synopsys.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

T24gV2VkLCBNYXIgMDQsIDIwMjYsIFh1IFlhbmcgd3JvdGU6DQo+IEl0IHNob3VsZCBiZSAnSGln
aFNwZWVkJyBpbnN0ZWFkIG9mICdIaXNoU3BlZWQnLg0KPiANCj4gRml4ZXM6IGQyMWE3OTdhM2Vl
YiAoInVzYjogZHdjMzogY29yZTogYWRkIHN1cHBvcnQgZm9yIGRpc2FibGluZyBIaWdoLXNwZWVk
IHBhcmsgbW9kZSIpDQo+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAuY29t
Pg0KPiANCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+ICAtIGltcHJvdmUgY29tbWl0IG1lc3Nh
Z2UNCj4gIC0gYWRkIGZpeCB0YWcNCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCB8
IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmgNCj4gaW5kZXggN2FkYjhlNzRiZDg0Li40MWNmZWZiMzRhYmQgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5oDQo+IEBAIC0xMTUxLDcgKzExNTEsNyBAQCBzdHJ1Y3QgZHdjM19nbHVlX29wcyB7DQo+
ICAgKgkJCVZCVVMgd2l0aCBhbiBleHRlcm5hbCBzdXBwbHkuDQo+ICAgKiBAcGFya21vZGVfZGlz
YWJsZV9zc19xdWlyazogc2V0IGlmIHdlIG5lZWQgdG8gZGlzYWJsZSBhbGwgU3VwZXJTcGVlZA0K
PiAgICoJCQlpbnN0YW5jZXMgaW4gcGFyayBtb2RlLg0KPiAtICogQHBhcmttb2RlX2Rpc2FibGVf
aHNfcXVpcms6IHNldCBpZiB3ZSBuZWVkIHRvIGRpc2FibGUgYWxsIEhpc2hTcGVlZA0KPiArICog
QHBhcmttb2RlX2Rpc2FibGVfaHNfcXVpcms6IHNldCBpZiB3ZSBuZWVkIHRvIGRpc2FibGUgYWxs
IEhpZ2hTcGVlZA0KPiAgICoJCQlpbnN0YW5jZXMgaW4gcGFyayBtb2RlLg0KPiAgICogQGdmbGFk
al9yZWZjbGtfbHBtX3NlbDogc2V0IGlmIHdlIG5lZWQgdG8gZW5hYmxlIFNPRi9JVFAgY291bnRl
cg0KPiAgICogICAgICAgICAgICAgICAgICAgICAgICAgIHJ1bm5pbmcgYmFzZWQgb24gcmVmX2Ns
aw0KPiAtLSANCj4gMi4zNC4xDQo+IA0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5O
Z3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==

