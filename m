Return-Path: <linux-usb+bounces-33467-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHa8ADlzlmlqfQIAu9opvQ
	(envelope-from <linux-usb+bounces-33467-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 03:19:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA3215BAD5
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 03:19:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 258F8302E0D8
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 02:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E773261B80;
	Thu, 19 Feb 2026 02:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KgautjEg";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="klZ7/wEN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DVrsGefG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51B8248883;
	Thu, 19 Feb 2026 02:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771467223; cv=fail; b=hnuQp2XkdQ220qdpg+zdTiOkq1U7biecfZOHvJ38Y4vuPimspOpaTU3yi3ErW630XpHFbTXuvvadd3eLoucPBmmrXAeApjUXvpbqxwpO5kCgcP6gjK4ONjHTcUs5xOeCOTPeavO6MCPUwtsPJxb0x16D2YWfFQAQkAxa2f45so8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771467223; c=relaxed/simple;
	bh=4HFv+2lDnAJawPuMSruH4Xjh5vWKJn5mfcOuzS6mqU4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s+XiWGMOWMNCR3WybFQPH/ylZFZ/dV8rVJIDd/IJGyShFj5V8Brfxvk1QvZKZc+RKEPOhC5RyzI8mtoYwu0TIRI+LkbsneVY36fExshAky0885fqopVXIwyLz7bkvMly9V70eG6mvk5WtLArnlVuCI3kYvJuoP2JgyY47HMqEmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KgautjEg; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=klZ7/wEN; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DVrsGefG reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J1B5hC958160;
	Wed, 18 Feb 2026 18:13:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=4HFv+2lDnAJawPuMSruH4Xjh5vWKJn5mfcOuzS6mqU4=; b=
	KgautjEginqx+SOy3a1UfAqkhIGrHznQt/UPoly3F9ZpurzFQ39xymYOG+U1dYdg
	Vvl0Y+074lGegrt8r6dTBKoV4AzRwyln5T2r8lXNeI+fOvtjusn5URhQ5XP+xmYe
	Ql5//4ThQPbNGoYnBJuRc0/qEqVWLZ6laEcdNSHltzT3PDQAcAnH8FHL0gsRwACa
	0vb/qe1meEu661a8z2fb3fId+BgvW4ID7M4EmrgPgl3aD9G1LwGAruTHYU3nsgaK
	cyPjcBWO7xqNJIV8JoDswqgZcTX9U0eK6xakr+v//mo9b/FtIRG2Z2rPphgYxRsb
	AddsctTmZ21AnFQScv/x7Q==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4cdh9kjjxd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 18:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1771467204; bh=4HFv+2lDnAJawPuMSruH4Xjh5vWKJn5mfcOuzS6mqU4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=klZ7/wENlehspuGoNvxsspLulYGXAhvP+j78nv3nEQPBJW0K/hHtovjbDzykLIhDp
	 m6DYdrSd9a6Rkr4DFlRyUP0b/uVm+O1YNuWlP0kq6tpLLjFqJPap65ncbw2c67Zo+S
	 w3w5Zvpi7f71N1goKiQXtt29ARxYSR08dF1OqzhpN7tCXExhNZD4FQqg9ZE4xbewc8
	 pBy4s8Xj4b/mAxwN1NFoF5+4uRx0nVgGGrlzjIlKdsTcEgOcfBoyH5ax+OTZ6Zu8Yd
	 k2/FfqDeAkLJonASyRcJJLt4HUE5qUuqeDrNM8K/RyUXRrDsatfMHYW8V0uEiNO1lq
	 sev3lx662IU3Q==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E88C1401CD;
	Thu, 19 Feb 2026 02:13:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 78A94A006B;
	Thu, 19 Feb 2026 02:13:21 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DVrsGefG;
	dkim-atps=neutral
Received: from BL0PR07CU001.outbound.protection.outlook.com (mail-bl0pr07cu00105.outbound.protection.outlook.com [40.93.4.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A99EB2200C0;
	Thu, 19 Feb 2026 02:13:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAvY/FSyy6RTi5rdTfy2wsAiy9gcR5IXLBQcAObkElcUiqVdBhDEuzcvKHvH4Uxu8ywPdSruQYJz/ojfB+wPopf1M6IQOE4GX0olV5j4n58grBb8VjZwzXhuqbQSgWwzSeivGmWDnD3I2+LyXvpyBFn7m6kgQh8sGLgMaoniMsk2yOsprMFbyUhpFcWH+8ukqjdrkXx7sfOIcPPSlZJ6Iv/MVL3H95aCfxhGgTky0gFagQ/yFgbW8EuyU2frlTZ2CWy2NXH+IERX9Hg5ADZDhjjHG8BstHvhI4XqBgp5ikYJN2IoKumoI9YNtXn1OAWRGybbT78QUyb/Dd5vBcFlug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HFv+2lDnAJawPuMSruH4Xjh5vWKJn5mfcOuzS6mqU4=;
 b=K3oT1qHAs0+xhCJSk1PrIL3O7SHjusrJUzDgbbhm3Ii1TNfFkQ/1GLgaQUfHg5XjJeqhjZ3gwlTM3CNEem20bOn8Wqr/hVstcURpMYQ0S9yWorm3n9EJ5NOLyggqh6o0WLz3KLxbPgpXVKvtnZ/NScP3yMQsZMnN0KGx4KZyh7G3Cy9sL7M3Krw8l6LHff5qgdyzm0x2SUGLyIqAG5wlZPdVL2VOM39nKTGfrVIgT/HGs7qY9HC14rcGlxcpgYsd84XZCj9r3ltOuxEKabSODMjME5amI0eNgtqd6tg26L3GL3s4ZYo2oPAnCHntaYZpIL0lRCZwZZr7+nSBouuBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HFv+2lDnAJawPuMSruH4Xjh5vWKJn5mfcOuzS6mqU4=;
 b=DVrsGefG+3dXPD7ECiL+sLVwQB5DSHBAGZUCqOJyjaD2Fe/q6QGzbGQvdTAQvRfmEwU5uoMzSQMROnVLiYCRDiC4xyLIbvyeSRHVF2kdAnpIttT3+b7tffQkVaU3FGfeh/tLtUPMswi5Q63GH/4no3AJeaVAe0EnZNUgg/yY0XI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA1PR12MB7567.namprd12.prod.outlook.com (2603:10b6:208:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 02:13:12 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 02:13:12 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "andrzej.p@samsung.com" <andrzej.p@samsung.com>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "chenyufeng@iie.ac.cn" <chenyufeng@iie.ac.cn>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "nab@linux-iscsi.org" <nab@linux-iscsi.org>
Subject: Re: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in
 nexus handling
Thread-Topic: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in
 nexus handling
Thread-Index: AQHcn4Wvu8qf06pbZEWeYsPWKDmbZbWH7g+AgAAjfwCAAS35AIAABQAAgAAHAwA=
Date: Thu, 19 Feb 2026 02:13:12 +0000
Message-ID: <20260219021310.e5aycj3h5rijq45w@synopsys.com>
References: <20260219012929.u6btnnmqvbyujz5f@synopsys.com>
 <20260219014804.14705-1-jiashengjiangcool@gmail.com>
In-Reply-To: <20260219014804.14705-1-jiashengjiangcool@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA1PR12MB7567:EE_
x-ms-office365-filtering-correlation-id: fe2389d1-0b37-43e0-c948-08de6f5c6ee3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?U2FQTFdNVWRWSUM1bEtSMzl2YXNFMXNRZ3FEellpRjNJSzVzLzduMDZ1MUVS?=
 =?utf-8?B?RmpHb0RJR0JRUE5UNHExK3h5QitFQk5nUmhMT1d4MklxbDhQRzRjemljZ0di?=
 =?utf-8?B?OEdJeDAvdXpVUlpNdWg2OWQ1Rkl4VHZkNjFBMDFkL2ZuTDBqbFMzck83WWFh?=
 =?utf-8?B?d3BLVEswWXQ0cTNnK3dRdmtwZE1BN21HZ0VyQk5VSzN4K3BuVnFpQ1dXZ1lq?=
 =?utf-8?B?OExQdTQvN1JuNE5VQis3U0N4ZnlsemJFVXBDRUFLUU0zandENFBPanl3eHRQ?=
 =?utf-8?B?dzNuczJoZGxKclhhcjh6OVBmRng1NTRRall5aWVTWmlUS3JBZi9YUDNBbUlT?=
 =?utf-8?B?VENkV0JKS0JmUjZUS1dKSW8veVRPc0tEZ1oyVyt4dHorZ20vM2pTSk1zb2ZE?=
 =?utf-8?B?SERMaURySCtvaVpFQ0tBNmJnZUQ3TnMrZjNCMW51aWUxMW9EZnRRSVdPTkM5?=
 =?utf-8?B?ckZXbUUyU0tWTUJaUUNZWi9HTFl4RXdRN2Qya0RGSzZGMGFDRmpqYll2cTIy?=
 =?utf-8?B?RnJZQ3poWFVnK29wQ0dBb0tpeTZsRjhCSjIxUHhlZ0s4bE8xUTZxNG1NNnlD?=
 =?utf-8?B?ZGMvbEFzajAzaVBteUlHNzVRalpldXpSa0ZoT0J0RmJvWTlmN2ZnbVBLQ0JP?=
 =?utf-8?B?Qm1DaUhQNUtnYnQ1Q0NxMERtR1V1dEhVcm9yNjEzQzNsbEpxeUticXBpV1JI?=
 =?utf-8?B?SWp4bTdiNG0vWklmclNCR2Z3eXJlaGhmbUpLSEdGRWlGaUdkc3RtTnRDOUx3?=
 =?utf-8?B?Nno3dEorWVFYZkpjOG5TQXBBb0tyNVhzL3dEeHMxaFh2WUEvekdkUG9hWSs2?=
 =?utf-8?B?Z2M5NGxBdVRodmxYN0JUSGdQYVk4V3ZXYjljM3lZaDA4L0U4OXYzSjNvR3Rt?=
 =?utf-8?B?MyszY1dLeUoreThRdjhJN1JuMWg2TnorY1hXRGlYeGMwd3FGUTdOaTdWVU1S?=
 =?utf-8?B?b0RHY2YrUXY2WEhhYWdZOTFwRGkxV0dkK2dIWEdNMzB2STFMWkY5SnJ2MTBP?=
 =?utf-8?B?VjA0Tm9zSTR1aFBxSlFpNzgxNWFpUStOenhhZ0Z1Ui81bnlHYjIyQnJPS1hx?=
 =?utf-8?B?VXQxbUVyZmlleGJQcXBlV3ZybmkySHZnemRaVVZEV0x6NWhRdmVwQVBCd1Rs?=
 =?utf-8?B?U0JlQjRHNnlLZkJTdDQ5c0RvSlBVK1U5Y0x3RDhyKzlZdlltZlJkMFU0bEhJ?=
 =?utf-8?B?Z29YZFJNL2kvTEtkQmloN3pxbG9rUFAweU9HY3p2WFlaY0NTeTlJbUpSY1Jt?=
 =?utf-8?B?S0JLQXFLZXlPSDErZG5qYVBhWENrZjVuOEFGWnpLY0l2R3NzZ3hQQnVmcDV1?=
 =?utf-8?B?YWdoL1p6NW9QWFFXeGlSd251QWswcFBaeEZzeDRGWmxNZXpTVTRIdGhYZ2Vx?=
 =?utf-8?B?dC9nQVpyNHR3UXU1bXJxWWRRNCtQcVRQaThVT0NEMFliN0JZd0o1NmkxUTFT?=
 =?utf-8?B?WENJWjc2UUVmUnRHTkhUM0x5RmtpWUpKd1dHSkd3WG1FaUVqL2E0OXJKQ0pk?=
 =?utf-8?B?ZGIxcmFRazdkVmhpbnRrYStNeXlvaHQ3d1FoZWRKZHNQWXVzMVNCYVEzWlho?=
 =?utf-8?B?SGs0RGJsVmg2VjlPdFV6MUNtSGlUamdScm5xZHdyeDVrbFFoeElabFpuK1c4?=
 =?utf-8?B?NWhuSWd6RnFHQlVLMllDVndYSXBqeWJlekhST0tXRHY0WnFLTWlFK1IxVUNE?=
 =?utf-8?B?RzJKcllQKzRSTTBQanNzTEdZeHF4Ym5LQ2U4Zk8wZmQzT1FwYnQ1M0ZscWRu?=
 =?utf-8?B?NEVaaFh6NzZyYU85OU9LS3FDUzJ3b292NGdBTldad3NFTTl2bnJlYmxaWWNQ?=
 =?utf-8?B?a0VlaWxmUzVIbmdjcjBzTWVWbjV6VzcvUk81RXdsL2xkR3pIWnhGR2Rkam5P?=
 =?utf-8?B?d0hpbXRjUjVac3pJMHZtRWozK1dpRjNxWDNtTkFOS0Z5QnRBZ2N1ZytTbndB?=
 =?utf-8?B?ZGVmUmJ2RW40NmE5VDYxNkcwQSttM1dUeHpKbHJkYXZXMS9Pb3EvNDhKOUY5?=
 =?utf-8?B?aFNVaW11cVA4dE5TNTQvOWRzYndyQjJKNmZ4U01HU0R6cC9uNmM5N0JzOGVl?=
 =?utf-8?B?U1J1RHdKckVKTEhpY05POE9teE5COUtKOThUbG5jclFMa1paL1lPM1FNdktS?=
 =?utf-8?B?SHB4YVlLdkN5S25XMjJoY3hpa0ZxNkI5TVh1OGxOZHo3czlSRXZVQmI2ZHhh?=
 =?utf-8?Q?EN6wH4f3pxWbExE6Tbc0HGM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TW9hQm5qeHV4RkVYMDNjQlhCeGFmQVFpTnRaL0RiL2Y3UmlhSVNWR1FIQy8x?=
 =?utf-8?B?OWEvVFp3RWJySmJtNmxzMkcyK00vUUFhQkNCV1oraVkrRjNFRkZPSjdrMG43?=
 =?utf-8?B?ZlFMMkU4eS9NRzljelVqQ0NRWVRvNGR2cEdmMkVvMEUwa2JZUWorWjhDUkxv?=
 =?utf-8?B?ckNjTktwdXR3Y1pCZlhWZDZ5SXdVVmN1Yzh3ZTRkSDJPQUw4b0EyUWVjaE5V?=
 =?utf-8?B?L0pYazRzWWJ0enZTdlpNK3dMbUI2akZ2cnluWGJWdzN0VUh2ZmxTQTFSMkFU?=
 =?utf-8?B?bXZsREVpT0VIcmNFajJoWlJaN2ZMMmJVZ2JRQlNVbnBNbzRUcmRmZTFJWHFJ?=
 =?utf-8?B?d2pBUjBGN1h6QVJtSk5MRnJnbk0wQWZxNUoxci9IQ2daR1dGYVNwcjNCQ0lM?=
 =?utf-8?B?eXlaTEpHYUwvTjZmZlpQc0lJM2VkK1RrZzZlZW1wbEhvaWJJM1NaeVJWVnVX?=
 =?utf-8?B?MWp5Ry83ZWhlQkFIanRFWGswZlI4cUdPTktDWjI1OHhJbDdTYkxYTmNKRHF1?=
 =?utf-8?B?Ynd1eTJHWjR2RTk0amRicWljSHVIT1JsV1Y2REYwQTlNVnAvd0lPMmkxazZD?=
 =?utf-8?B?VHJRbFJ1S3hOZjlyWDQ4b0hFb21JTEsrSUc4cklXS2xpaU9UV2VYb2NQcVZp?=
 =?utf-8?B?ODMwdHowUlZvcTgxRFNiQjJMUnE4K3B5WngyUXFQVGpsaWErUWVLRFhzRkdH?=
 =?utf-8?B?bmt0NHBFYkRDVWtIdnloZUIzUXdQdHI3dE5RcWx2UHF5Q2RyRnh2Z3Z1UW1s?=
 =?utf-8?B?WXNsZVlFdVRseldBQTlzWklVeWUreFlacDdNQWFDSlE3U3JWT3FHWnhkaTJs?=
 =?utf-8?B?Ym85MTRacWI5SEwyMDJWY3Q2MWcyQnRwV2o2Q2JxdFJXUC9WWkJkbmdOMlVu?=
 =?utf-8?B?THoxVmk1dnNPVWFRL05MNEc2UTFTeTk1Z1BlY3BSa1F0cUpGbzltU1pIMUw3?=
 =?utf-8?B?YkpjL3J2S2hyWitGY2FrY3FhNXMrNDZwQVIvMFo0TkpCdklQSjhveVFqU2tl?=
 =?utf-8?B?UlV0VjREcFlJVzVDYkFnWVI5SkZjMklrSGNNT2xvWWtEUkgvZDk4Qko3dU1i?=
 =?utf-8?B?V3lJRW5KRW1UZG5LcEZPUzlUbzNTK3ozSVUvY3huR1lQMC9PNldKeHFBZHhp?=
 =?utf-8?B?MitLR1dTYVNSdUpWNGZXaVVsMXoyMm5yL1A3VGo4bEJpTjV3OU1JUE90R3FW?=
 =?utf-8?B?ZDFBUEdjUUlaSFpSNVJGdXRUazgwS0ZjdGVEZXZnaEVyTUtIVlBxeUVhM1ZO?=
 =?utf-8?B?bnY3T1ZqUmpMZUxjbTMxZzdmclFtSFZESkxSN3hpajJRZ2lCcGZ2QnhXTDE4?=
 =?utf-8?B?RldLbE8wcWV2bW9KTzJGOEQzZ0I0aHN0dmh4UGs2ZzVLTEQyMzA3SE15M25K?=
 =?utf-8?B?UXFCVER2eW5BQzFXTzk3NzhIemtCVndiZmNnK2NUa29MMmxQam5ndk9QQjdW?=
 =?utf-8?B?bXRHMStHODljNlVIYW8wZWNFZkZoL09PYjdMMEFFV2oyeWU5MFlGVEFRZWNH?=
 =?utf-8?B?QXRtL1hDS0E2dzNNbldVa2RPclRUV2NMN1gvQWF5eHZ4SzFDTWJTRXBtWU1F?=
 =?utf-8?B?NjdGNzk3SElHdkdGdmRXUzZoRXp4bFl1NGJkOVQzRVBrSFFBZU44ZkpEa1c0?=
 =?utf-8?B?OEZhczlTNVpqcFNRaElQWHdYNnVzNkJlbU9MaWFXU3RFdEs5a3ZGYlJaSGtD?=
 =?utf-8?B?T0dUaUtIcEJhVWRyTzJ2MWY5Vzc3MWwydDZvQkJGS2VVRWQ5bk9DMWRRN2dQ?=
 =?utf-8?B?Rzk3NzBrdkszZ2J5YlJtZ01vd0RHNVJSZ3NUblRMZU9EYlRHVkdHZXNjZytq?=
 =?utf-8?B?UTRaWXFMWWw0V1pCNmE2VUhubWNjVldUdURGamJUS1c4OFVjZHA0bGtnbmht?=
 =?utf-8?B?MWd6YWxDaDVFSkNDK0lhT1FIMUFJR3hUbThITXR1OE8wclFSK29RaWNWamRr?=
 =?utf-8?B?OHFjeTVBTDQzK1pwblVvR0UyMUxnSnF6MnlMRzFtSnVvYUpnWnNCb0ovOEJu?=
 =?utf-8?B?ek5xQjN4V2tnaUxYSzlQVVkzOC9NbkM5VkVJWURXYVJzUC9VZmlwb0M4d3BV?=
 =?utf-8?B?QVE2dFlsOUJqanlaUjZxM09GOVd3MmRHbS9OVWh0dmFVZ2psNUc0ZS9TUDhH?=
 =?utf-8?B?QlRIamRoblhueStxSEZsTVN3c3U4YjY5WUpqNUxIZkpSSTlYMm9LQ2VwZ0pt?=
 =?utf-8?B?ajNkK2xpaDNGb1lkS1lTV0VrcjBiZ3NOMGI4cDBuaHFPRDBSMWhEQmZFUXVv?=
 =?utf-8?B?TEhoUE9lNHhia29ETXZaWEpsUVMzQ3F3dDhFOXh6MXNwWUprVWVobXZGdlgy?=
 =?utf-8?B?Q3dtZkU3Tno0MEVmaUlNSGNsamhlRnM0aFd3UDJIQjRRdURQblRJdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <489AEE1ED4084E48A557683145012BA7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0mVsHH5gZ1wODr8fzIADtkOrpzGtlWrRKr+/jnStySuCs0jIqjiwIfF/dGMJ3GtWCOdCtNRajUlYBUN1CAWeZIPlDDvTwjmZRcvL+Qp+PU19n87r8mdwKDZW5r5C77WXrjLWRHt3UG1JevDCjZ+4dD8bcPw3CWkGdDGLdYPrFZgwD+2+sgA+QPkQL4hYwOxSGVVsdLT8exAdoPBFhaqyg4qUrEzN1FwH29Owjcc6PwUPcr6dQBbf+/BR9qAG7DzmX7tZh2KDEhMTWhBN/7D+KiczXsXHRzUZy8sttvzPFrcDeG7iLUpujdctwuPWwN4w7FccfYhmUNI2eB6g3tMvrTKHROY7wkoI7Vfa5KSsg7LnI08jqShr7s63ketcTchfH79MEyc21eHRpwltg5CW8tYLBdmoiLHdu6v9JX/G6pdz6Tvm7yHZjUdAXz8KjKh7HRfQsl4qgdufnPV8b6HepKiexlXDEtq2+2qXqVoSz7s2gcG+bN5I3Zhji31AlrDERLDpmY03SFDLO64Il3LywRAnWA/8ULKIUF8M9yA+fT3fv6cprZruorLj+hhHoysA8HoLZqi02TYtvfItlVvCt36+NVhfjw9myzgGG6eqVgMOaEfC0t/uEnQM/y7VP9IZ2jigxRHJjocK9R78blYV5g==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2389d1-0b37-43e0-c948-08de6f5c6ee3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 02:13:12.0804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y42OgCQhNkBM+KPVXio8VWe3ocJmoU9FjV1hX6UT3wKkP5CMDPHeMtBjBaCxkbBilH9qW0ttga+/afnW4qCrbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7567
X-Authority-Analysis: v=2.4 cv=U4KfzOru c=1 sm=1 tr=0 ts=699671c4 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=Wz0lWbTZgulkd9khk64A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: DPIj-Lb9CkcZsv7G8ryMBRI7ubuUCsym
X-Proofpoint-GUID: DPIj-Lb9CkcZsv7G8ryMBRI7ubuUCsym
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDAxOCBTYWx0ZWRfX2ORuhgEntGi/
 Azjqksq+ZMHEnTINMcN2Co5kYqakTDUotAmmbeEGTLj680Q0/MZpWvQN4gNf7L0ud6YNP95T+tT
 b5FrzTHh+gPPF8Ji/Mjw6W9fbLh+D0q8MnF/OamkjFBm8K1DRmZy1/aJtG+YIkxfzWLUDIV08td
 Z63bgM3pXkC9kCHlo+bSHH/ae1EJ/3MdXw2Lpb0WNt7og200llzTa5RcSyUaOGRsRH8ynR86C7l
 oBJ/sn2vtOSJPoJMYf4tfCv/ESiy3vNlXBcFk1yvMed8QAdViqahNrpqyOWa9beL+bE0DauXxvm
 jnXH7SrVQ7Rwm/Br0FlMkro5qCeeFldWTZYl6MrpUDGfVPWit339oRl83y45H5Tj95TBeRKcPAS
 W/6KICGOI0+Meq/dxDtKy+kfyrUP0j38eVl4sJ21sMEaMxuccphPEWOZwb/IuuvnABC0nzoKVco
 hSVjRXupiCg73XTxxfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_05,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2601150000 definitions=main-2602190018
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33467-lists,linux-usb=lfdr.de];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[synopsys.com:mid,synopsys.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 6DA3215BAD5
X-Rspamd-Action: no action

T24gVGh1LCBGZWIgMTksIDIwMjYsIEppYXNoZW5nIEppYW5nIHdyb3RlOg0KPiBPbiBUaHUsIDE5
IEZlYiAyMDI2IDAxOjMwOjE2ICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gT24gV2Vk
LCBGZWIgMTgsIDIwMjYsIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3Igd3JvdGU6DQo+ID4+IE9u
IDIwMjYtMDItMTggMDU6MjI6MjEgWyswMDAwXSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+PiA+
ID4gRml4ZXM6IDA4YTFjYjBmNjVmZCAoInVzYjogZ2FkZ2V0OiB0Y206IGZhY3RvciBvdXQgZl90
Y20iKQ0KPiA+PiA+ID4gU2lnbmVkLW9mZi1ieTogSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5namlh
bmdjb29sQGdtYWlsLmNvbT4NCj4gPj4g4oCmDQo+ID4+ID4gV2hpbGUgdGhlIHBhdGNoIGl0c2Vs
ZiBpcyBmaW5lLCB3ZSBzaG91bGQgcHJldmVudCB0aGlzIHNpdHVhdGlvbiBmcm9tDQo+ID4+ID4g
b2NjdXJyaW5nIGluIHRoZSBmaXJzdCBwbGFjZS4gVGhhdCBpcywgd2Ugc2hvdWxkIGVuZm9yY2Ug
dGhlIGNvbmZpZw0KPiA+PiA+IGRlcGVuZGVuY3kgYW5kIHByZXZlbnQgdGhlIHVzZXJzIGZyb20g
cmVtb3ZpbmcgdGhlIG5leHVzIGlmIHRoZSBnYWRnZXQNCj4gPj4gPiBkcml2ZXIgaXMgYm91bmQu
IExpa2V3aXNlLCB3ZSBzaG91bGQgcHJldmVudCB0aGUgZ2FkZ2V0IGRyaXZlciBmcm9tDQo+ID4+
ID4gYmluZGluZyBpZiBubyBuZXh1cyBpcyBlc3RhYmxpc2hlZC4NCj4gPj4gDQo+ID4+IElzIHRo
aXMgYW4gYWN0dWFsIHByb2JsZW0gb3IganVzdCBzb21ldGhpbmcgdGhhdCBsb29rcyBsaWtlIGl0
IGNvdWxkDQo+ID4+IGhhcHBlbj8gTXkgbWVtb3J5IGlzIHRoYXQgdGhlIHRjbSBob2xkcyBhIHJl
ZmVyZW5jZSBvbiBpdCBhbmQgdGhlDQo+ID4+IHJlZmVyZW5jZWQgY29tbWl0IGp1c3Qgc3BsaXQv
bW92ZWQgIHRoZSBjb2RlLiBTbyBpZiBpdCBpcyBhIHByb2JsZW0gdGhlbg0KPiA+PiBpdCBzaG91
bGQgaGF2ZSBiZWVuIHRoZXJlIGxvbmdlciB0aGFuIHRoYXQuDQo+ID4+IA0KPiA+IA0KPiA+IExv
b2tzIGxpa2Ugd2Ugb25seSBob2xkIHRoZSByZWZlcmVuY2UgdG8gdGhlIHNlc3Npb24gY21kcywg
YW5kIHdlIHRyYWNrDQo+ID4gdGhlIHRwZ19wb3J0X2NvdW50IGlmIHRoZXJlJ3MgYW4gZXN0YWJs
aXNoZWQgbGluay4gQnV0IHdlIGRvbid0IGd1YXJkIG9yDQo+ID4gZGVhY3RpdmF0ZSB0aGUgZl90
Y20gdXNiIGZ1bmN0aW9uIHdoZW4gd2UgdW5yZWdpc3RlciB0aGUgdGNtIGFuZCByZW1vdmUNCj4g
PiB0aGUgbmV4dXMuIEFzIGZhciBhcyB0aGUgaG9zdCBjYW4gdGVsbCwgdGhlIGRldmljZSBpcyBz
dGlsbCBjb25uZWN0ZWQNCj4gPiBhbmQgdGhlIGZ1bmN0aW9uIGlzIHN0aWxsIGFjdGl2ZS4NCj4g
PiANCj4gPiBUaGlzIGV4aXN0cyBzaW5jZSB0aGUgYmVnaW5uaW5nLiBUaGUgRml4ZXMgdGFnIHNo
b3VsZCBoYXZlIHBvaW50ZWQgdG8NCj4gPiBjNTI2NjFkNjBmNjMgKCJ1c2ItZ2FkZ2V0OiBJbml0
aWFsIG1lcmdlIG9mIHRhcmdldCBtb2R1bGUgZm9yIFVBU1AgKyBCT1QiKQ0KPiA+IA0KPiA+IFdl
IGNhbiBndWFyZCBhZ2FpbnN0IHVubGlua2luZyB0aGUgcG9ydCB3aGlsZSB0aGUgZ2FkZ2V0X2Ry
aXZlciBpcyBib3VuZA0KPiA+IG9yIHdlIGNhbiBqdXN0IGRlYWN0aXZhdGUgdGhlIHVzYiBmdW5j
dGlvbiB3aGVuIHRoYXQgaGFwcGVucy4gVGhlIGxhdHRlcg0KPiA+IGlzIHByb2JhYmx5IGEgYmV0
dGVyIG9wdGlvbi4NCj4gPiANCj4gPiBCUiwNCj4gPiBUaGluaA0KPiANCj4gVGhhbmtzIGZvciB0
aGUgY2xhcmlmaWNhdGlvbi4NCj4gDQo+IEkgdW5kZXJzdGFuZCB5b3VyIHBvaW50IGFib3V0ICJU
aGUgbGF0dGVyIiBvcHRpb246IHdlIHNob3VsZCBkZWFjdGl2YXRlDQo+IHRoZSBVU0IgZnVuY3Rp
b24gd2hlbiB0aGUgbmV4dXMgaXMgZHJvcHBlZCB0byBzdG9wIG5ldyB0cmFmZmljIGZyb20gdGhl
DQo+IGhvc3QuDQo+IA0KPiBIb3dldmVyLCBldmVuIGlmIHdlIGltcGxlbWVudCB0aGUgZGVhY3Rp
dmF0aW9uIGxvZ2ljIGluDQo+IHRjbV91c2JnX2Ryb3BfbmV4dXMsIHRoZXJlIGNvdWxkIHN0aWxs
IGJlIGEgcmFjZSBjb25kaXRpb24gd2hlcmUgcGVuZGluZw0KPiB3b3JrIGl0ZW1zIChlLmcuLCBi
b3RfY21kX3dvcmspIGFyZSBhbHJlYWR5IHNjaGVkdWxlZCBidXQgaGF2ZW4ndCBleGVjdXRlZA0K
PiB5ZXQuDQoNClllcywgd2UnZCBuZWVkIHRvIHN5bmMgYW5kIGNhbmNlbCB0aGVtIHByb3Blcmx5
Lg0KDQo+IA0KPiBUaGVyZWZvcmUsIEkgYmVsaWV2ZSB0aGUgaWYgKCF0dl9uZXh1cykgY2hlY2tz
IGluIHRoaXMgcGF0Y2ggYXJlIHN0aWxsDQo+IG5lY2Vzc2FyeSBhcyBhIHNhZmVndWFyZCB0byBk
cmFpbiBwZW5kaW5nIHJlcXVlc3RzIHNhZmVseSB3aXRob3V0DQo+IGNyYXNoaW5nLg0KPiANCj4g
TXkgUHJvcG9zYWw6DQo+IENhbiB3ZSBwcm9jZWVkIHdpdGggdGhpcyBwYXRjaCAoYWRkaW5nIHRo
ZSBOVUxMIGNoZWNrcyBhbmQgZml4aW5nIHRoZQ0KPiBGaXhlcyB0YWcpIHRvIGNsb3NlIHRoZSBp
bW1lZGlhdGUgcGFuaWM/IFRoZSBhcmNoaXRlY3R1cmFsIGNoYW5nZSB0bw0KPiBkZWFjdGl2YXRl
IHRoZSBmdW5jdGlvbiBjb3VsZCB0aGVuIGJlIGhhbmRsZWQgaW4gYSBzZXBhcmF0ZSBmb2xsb3ct
dXANCj4gcGF0Y2gsIGFzIGl0IG1pZ2h0IHJlcXVpcmUgbW9yZSBleHRlbnNpdmUgdGVzdGluZy4N
Cj4gDQo+IERvZXMgdGhhdCBzb3VuZCByZWFzb25hYmxlIHRvIHlvdT8NCg0KU291bmRzIHJlYXNv
bmFibGUgdG8gbWUuIEFzIEkgbm90ZWQgcHJldmlvdXNseSwgdGhpcyBwYXRjaCBpdHNlbGYgaXMN
CmZpbmUuIEhvd2V2ZXIsIHBsZWFzZSB1cGRhdGUgeW91ciAiRml4ZXMiIHRhZyB0byBwb2ludCB0
byB0aGUgY29ycmVjdA0KY29tbWl0LiBZb3Ugc2hvdWxkIGFsc28gYWRkIENjIHN0YWJsZS4NCg0K
VGhhbmtzLA0KVGhpbmg=

