Return-Path: <linux-usb+bounces-30025-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B115C2EB96
	for <lists+linux-usb@lfdr.de>; Tue, 04 Nov 2025 02:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC9A33A6F0D
	for <lists+linux-usb@lfdr.de>; Tue,  4 Nov 2025 01:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA35E1946DF;
	Tue,  4 Nov 2025 01:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="b9l1wE1D";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lgkTXeyS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KSi5xYSR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4358D61FFE
	for <linux-usb@vger.kernel.org>; Tue,  4 Nov 2025 01:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762218994; cv=fail; b=nL8LFqu464gGp18HZW/7yVjWkjrs+Og31BqxWT6XI5gf5VhOTa8j7cxkpIBGF0YWTevgErestHj4wttI/90qWqScqfV3HWRrpBBNIAxdAeBYihlBQXF+hnahk533I2ex/5hCFCu1WOvK/FeERMgn6Vyosh127GtkQqeBwxnp/Dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762218994; c=relaxed/simple;
	bh=Pev/UqQowJMkHbB7l5r+Aw1delXkS6/7B0a0KelT4BE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BPZZXYuSiI+8P42m6JAOLLYHCAt+l/OKbBn0enadmggMhcdm6r0s68WGFFPi6VgELzz3J5d0YFRFg8N7Bmn5NQjhtB3BzpWkV40VU63EzJMhUksUO3BpM+k8b7V9s48cBFX3ojd0qlZ8FXg9a36ezMCiYE8dlDLH8RdKLE2KfKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=b9l1wE1D; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lgkTXeyS; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KSi5xYSR reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3JXgCr146218;
	Mon, 3 Nov 2025 17:16:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Pev/UqQowJMkHbB7l5r+Aw1delXkS6/7B0a0KelT4BE=; b=
	b9l1wE1Dhs2uKx6pPRhQSHrpRKlH86bdx3M9dvEDLDOhH119hvkaUZrkSuRn7SvU
	Rwg3W80Js30WGPiRUJmm5bKXPFI/s4TUoWS/vRSWYG2EpsnC5/SK0oLQFv9m8MFF
	V9x16yvygx144EOlUwUIQoN7gh/ztsR82FKGiUKKLNkw4223tmYrmZ4qr//LP7LC
	K8NmHZdSkmN6lBIT6E0tu6bIug+d10+n/cAkgDtxgYYcPZYq5YF/URVoRCQ5XfjG
	URuVhvo+ZbY7hLA3/C/QLMRY8djhH/nUacp25uh0DOyjIFT1haHVNDXK1ycIvOY2
	TMHuca9fXU4FPCzXx2Swtg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4a72nms27c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 17:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1762218975; bh=Pev/UqQowJMkHbB7l5r+Aw1delXkS6/7B0a0KelT4BE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lgkTXeySwfllTblnebcuiNtb0AeiEW0RMLWqC1wXyPdjHIEbR3B21XR/vZdZFzKMF
	 9pLs82SxceRKXfiyXEBPb6NABVIGJoiVqaYAwgjbqG84ENHFlTTpBrrb8jDZmCZo+2
	 6+fBEI0Pr7aKN7+/jaKUjVEmKVw2Mh0aiMaL5ARdUIpxp4xo52keBFSV4tbHyWl8Oi
	 mjNv1X9Kf8R07dXfI/cmDCe4gVrurj1zm+Z87le2gA2RnB8yjELry0TeHo+kJm8MDM
	 jqYJEroQjwadZuvKuuhjijXGqbu0KCzekSCRHKBMRomQupOyF+2U+SL10dMoMNc1aW
	 Xq4qV/9OmN4lA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ED90940540;
	Tue,  4 Nov 2025 01:16:14 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3FE70A006F;
	Tue,  4 Nov 2025 01:16:14 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=KSi5xYSR;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00406.outbound.protection.outlook.com [40.93.13.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C066140054;
	Tue,  4 Nov 2025 01:16:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByBYo/fqk8dNb/iXs7ZA/4+oceMxz/VXeyKQSiKqh0MESEJoN6q1GfilfRe0suC8YKwKCK84NUnNiOWSPN0Ib43toG6SYIZciIAuJLC6uaBzukg2ockGRJ0t9tifnMvv+iBHpJnc+VmMFIGgn+pUAPh0hIEYo0DUTL+VZWtIplcumYJ+Vpsu8UKPA7gh5CB4o2OFqGpIh9qrDYscI7RJONZ2fIhnPmzFe4U0zdoKYOl/fn3JDmjO+h32sQfoMpgpZNwOGgo73hmk3Win24ar/HPtsPB800L/gL9Ec4pKs8F+CU4FR0VoCzGDhShSTwnpsAocONklWX6+9J/FAmYjTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pev/UqQowJMkHbB7l5r+Aw1delXkS6/7B0a0KelT4BE=;
 b=MhVvNlLgyVaIlheNIw6+22h/JbZY/tHedu1IdW3kCVZ9bYVe2hhWs70hc8z1bZVeOiNZ0V9in8quTO3IIdhSMihdLpTBal9bi9xzq1GKfrlPz5XolIMwpSrsYcJlonoLMV7kSUsgkgsAG8QugLFrz1/1xJdTtYAngTO0tJpaHLydhd1IRlCIgq0SLQaRxx3XC8id2/1R3e7jsIm0OcF0HtQpNP8VgLJtcM2zUup6ZPy7hHgbQ7wcr52mCR0QXo8Sye19ZsuRSaGDuM65+wAycTQvbd9BgbuFygC6kalVuj9vHPrmZsUYrz0fVcG4i68HNUuenAu7EZH5fE2Mlrdzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pev/UqQowJMkHbB7l5r+Aw1delXkS6/7B0a0KelT4BE=;
 b=KSi5xYSRwVZEK4UWHJVmA0MA31aGwQIbsiCYMbV/E5Uod60WsK1oICNgGB4Udml66pJAHAm8Xs9x8qcQHn4xlb6crICUxvYUick9PYQxEwIvEFTaUzoXmcc2K8ZL4SWkrdPtV3QdSacB3qvYX/YejRp2UdXvN9kwhSxyHobIbEQ=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 01:16:10 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 01:16:10 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Li Haifeng <omycle@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "Felipe.Balbi@microsoft.com" <Felipe.Balbi@microsoft.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Issue with DWC3 Gadget Driver: Stall After Transmitting Only 2KB
 Using Scatter-Gather and TRB Chaining
Thread-Topic: Issue with DWC3 Gadget Driver: Stall After Transmitting Only 2KB
 Using Scatter-Gather and TRB Chaining
Thread-Index: AQHcSXrPEz2q12AfYEm0nk8jz4+djrTab0eAgAA0aICAAjhGgIADpW6AgAE82IA=
Date: Tue, 4 Nov 2025 01:16:10 +0000
Message-ID: <20251104011607.jixamckrfphh3ktx@synopsys.com>
References:
 <CAFNq8R7q-GvFgwRKewzG=ZwkbxEfhKjEsxHWXQ0q8BsSSDFcnQ@mail.gmail.com>
 <2025103049-suing-renewably-fd67@gregkh>
 <CAFNq8R6uZSS3+nWXkR8XERjMRGTC_4_47UKm_N=P8Um5ySLAtg@mail.gmail.com>
 <20251031224113.4ml474v6fuiytkcf@synopsys.com>
 <CAFNq8R6tk2VVpsmG-5dS0UPWRQF3TgVH-nhJ+6bbR1yYSS3UAQ@mail.gmail.com>
In-Reply-To:
 <CAFNq8R6tk2VVpsmG-5dS0UPWRQF3TgVH-nhJ+6bbR1yYSS3UAQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|BY5PR12MB4226:EE_
x-ms-office365-filtering-correlation-id: bea3160b-edbb-4fac-4ca0-08de1b3fbd38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aFpJTVRiSlNXZ1RGbnZoeEVnWE9HR3FBT2swVXltS0UvWkhGdFZKaVlsNlBo?=
 =?utf-8?B?eG5nVjlIZHV2SDNPOVhHaEw1QlMreS92QjErV0YyZWZnWVNQVElScENrQUxu?=
 =?utf-8?B?b01sbmp6UHFBc01FMFhGVVpLSmk5QXBTaXp5ZTRpYnVuMFphWUNrVmZHdkl5?=
 =?utf-8?B?dWQrSVZKTTF6N1krMTdQVTJzejdSRkNZTXNWdWdZd3h6dmxqQ0gzK04xMUdE?=
 =?utf-8?B?Q1QwQ1NlVE9RSG9sQUJNVEczaHVQelc2OVM4SGpFQmIyc0Fvb2dBbVBjYUt1?=
 =?utf-8?B?YnZqaGlISHM4UUl4M2x2T293NzBnU2pBcmhpV3RDWndrSjQwOUpTajJLM0NR?=
 =?utf-8?B?WnJsYU9ESUR6VDNyOXgvYnJhU0xHSVBhQWdaYk1pbDJBNTNWanZUenR3cVpR?=
 =?utf-8?B?NldNQjFhUUl0dHNYcGpjVVdEU2ZROE5GOHZBREZWMEJlakUzSDJaTEU5a3FP?=
 =?utf-8?B?YkFRcVFJSzhZQ25zR3daaVRFRzUydEZlWFJSNDZZOEFtdk1ocjd5RFUxb2U2?=
 =?utf-8?B?bWpmbFJnRDRNSm5uU3hQSURJcXhGNzJoaW5sZnhFQW82SXN4M292MjZRU1FN?=
 =?utf-8?B?ZkZaY0czVUJ6UXVPM2pSRzRCREtMVmszS3NReXVxeU4vakZ4WEdBMnRYck9l?=
 =?utf-8?B?RWhLVk1mbWYxb1B3SUxrUkx1WUhtM2lIdjVrN1BuNEtxcUVVd0RnSlVKeDNu?=
 =?utf-8?B?Wk9UcUpzSWthbndUaDZPanN0TmZ2b1RTU01DdUNaZUtuSjBYZW5wd2RDa2VN?=
 =?utf-8?B?c3RyN2hvM3RIbFU1TkZCcWREZmJtSkc2V1Z1cjBNM2dnNWlQQUlPWjQ1MTk2?=
 =?utf-8?B?cTA4TVU2OW1QalVnMnRZeC9CY0N2REZxeFg3UVNQVnU0dTlFSVdxcEtnUDFY?=
 =?utf-8?B?NW42NkdRQmh0akxYVUF2QmpkcDVYNjVWc1ZDa3VhbWZ4cjdST1djQXZ1SjFO?=
 =?utf-8?B?Z3VMallLZXNhYXNmM2swUGRNQ1k0SnlncG9xbFEvRDdPbXpmMmVURGlrcGRH?=
 =?utf-8?B?bzk1eWp1ankwcjV6SmkzRkJDUzhnWHlVeFJVajdaRTEyMlRhY2FIUnpOb090?=
 =?utf-8?B?enRUQ1pWYVYzZ3FyYkNVNVRtdDRNS2hndU1HdzlwQzYyOHZFei9XT1JYeEtF?=
 =?utf-8?B?TDRTUmtEUHhJME1sM0dxSHNWWThVdVZsQWxZeStoOGl1ekhXZVU2emJtWUl2?=
 =?utf-8?B?ak5vR1Y3cjVzT0Vzbkgyd3ErdmdCdU53YkNWRHFndkFGRTh6MEZUNHhTd1V6?=
 =?utf-8?B?RFh3WEppT05MenEzbytWZkw2MGhQVHpKampxVWFTcUdKR1BrUGhFUWwwbGdO?=
 =?utf-8?B?cDRHOGRFRGxUdmw0NmlMc2d3VFpZMmpxR1hKdDg5RUN6bjZFTm4xUHRJbFZz?=
 =?utf-8?B?ZkZ3OWJ4aTc4U1pZZVNQYWJUZW5BTit6ZlJ1OWw5SG8yaTdvYVBiaDlsOTBn?=
 =?utf-8?B?VU0vblNQRWtXazlNK0p5Y0Ryd3QxQzkzSHdyeWZabHMydVFqb1J3OE9xNXFr?=
 =?utf-8?B?c1pOZktrcDUrZXA4QXYvYmlXdm5QQ013b3dMRE9HSFZZWDQrZ09jenk3d1Rs?=
 =?utf-8?B?MDB5NzJ0Rlp2THJ2L1VjZlVmUkdldGFnUDF4a281UWNsaUlwTFNFUVNNOE1B?=
 =?utf-8?B?SXVSSGZscmVseTZqcXU1VlpHWllXR0p3RlRDZkU1UFhZMnByU1ptMUFrMTBT?=
 =?utf-8?B?aE9kMGI5TGhLaERJdWxOSTF6MDdueXlMRzVaQytFT2VaU0prdEJxclBaMi82?=
 =?utf-8?B?ZkRnaXNxMjFMM1BRbTd5UThrVDdLUUNMbDNNM250Z1JRaVRqM2NqUUtnQVhC?=
 =?utf-8?B?Rm9XNFBrenBhTlliZXpBVmw2NkhqcG0wSzR3V3dpWnh3bTgxVmtySVF1V1JE?=
 =?utf-8?B?YmFYUWVaN1Q4dVl6ZU81VXgwaW9sVEpXR1BMT3NFb1ZBY2NUSWlCM25hVDBy?=
 =?utf-8?B?OWE0MDF4eDE1a0V1cjd3VHFKakR4b1I4Sld1ZWdseVhQS2ttWmJKNmZSVkt4?=
 =?utf-8?B?Z0wvZEVQa1VTT1BPUldISG1ML1dBWGJJU2szUXRXU3dwOUc4alBod0hCdFdF?=
 =?utf-8?Q?tLJKi3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T3JmRXMzc1FibFVwNW5Kd00wQ0tydENISlg2aW8rbFFtZVBrL0wzSWdDK25B?=
 =?utf-8?B?eG92NnpGcTMvM0FaUTBLSVk2THJnL1d3d1Z5N0JrRWV4empZdmJQQmJCVnVH?=
 =?utf-8?B?eUlUMDB0ZjJlalVjcXNkR04reVh1NlpJT05pVWo3OHZJK2E4ZitQOGN1eHRs?=
 =?utf-8?B?TnM2NW5XNmJTTStxUnByRUNiSjVhdXJoTFdodmhDbDl1a2M0UU9KTjRHU2wr?=
 =?utf-8?B?STBoRU9XVUU0VnZzNy9UM2U5T2VUdGNQZ2NUbnI0MHZ6YW84SnNKdmdlK1hv?=
 =?utf-8?B?NkJ4R3luTFBrUU1uY3dsRUw0QVVUZHhaMkFNMFJ3VTNMMzRnVVdRWjBRMGds?=
 =?utf-8?B?THlvbkVQZ0Rtd1FFZWVxdDhEaHZTeUZIT0lTc2N3R2M0bjlBVzVLSm5VQ0c4?=
 =?utf-8?B?d0lycDRiZkVvbU5XLy9RVVFVbXRPU3ZUeWh3MjZGRzNHdjkwaW1hbzJPYjVF?=
 =?utf-8?B?eVRJbTdkRjFURFhMVWF3MjhweGp5ZGZubWE3Qy95dk8xeStzTkdNRUVaVGsv?=
 =?utf-8?B?SXhUajhGdmJqSW9kT05HRHI4ajRKRWpaWVdZazljK1NOanpvSE9YaVZtYUdk?=
 =?utf-8?B?ZDQvQ1RMU3pNR0lZOVRGdGpGZm9TSDNVdE1NbDB0UHI5UTVHclRSNytKWDcx?=
 =?utf-8?B?dUpJL0lLNHF1WHp5ZFNnMGZEbUdQcDlVZEZBNHZ5bHU5R3VXZHZ0UXBQMzN2?=
 =?utf-8?B?MFV5MUU2aTdMT3EwQ2JLLysrKzlRaXpvSm42a2xLT1FKUlA4SWNBbzlqcXJ2?=
 =?utf-8?B?NVhOTHFyUnhaUUZIejBKTzhWQ2daeU1GdmlpUStiUnRSaTNoZlViZWpTL1pp?=
 =?utf-8?B?bndYajBmYlo1NUQ1RnN1T3NBeDlRbVpETXNMWktXcUxEdVgxWGVQZktPeHJY?=
 =?utf-8?B?TnRPZzdMQkJKUlk5S1gvV3JodFQzc1JyOElZWmYxcTRsaWNtN0wzcEZHekw1?=
 =?utf-8?B?a0JaMnJwOS94S1hOTGV0TjUwcDdhOERKaHNlOC8vbWlIUUFENmthcnJPNXUz?=
 =?utf-8?B?WmlZcHQrck9wWHVGVFZIek5iNEx6SW0waS9BZmxGSmROeVNySXdyRktGbGdI?=
 =?utf-8?B?bjlDVE1JcC9wZFJzaUs3YlZzaW0rNU5VRlBpVWZMSy9hNWNFVFR6S2V6Y2NI?=
 =?utf-8?B?OFhzSFM4QysvNEwzdmhVWXd1bzc1YUNTbHFoZ0dKTVZjejl5Z09zRjJyUW15?=
 =?utf-8?B?QkpBYk9XYUFHVVNBWjloR3AwVVB5TUVuK3c3VkduSmhCYkxZUVlGRkRDR2kv?=
 =?utf-8?B?SjZJZy9QSHZVRExpQTltTytUeVFxV0lhYkttS0h4d1o0em1RRnh3K24zNkpH?=
 =?utf-8?B?ZHJ2V1pndS9nSlByaGQ2Vk15c2hQSk5LMlJJVnhSZk80elFRdTd3VGh4Z3Mr?=
 =?utf-8?B?R2xQY1dLcG52R0UrRUpUbTZCY29pN2lsK0EyRVFTcXJHUjdpYnNYWGJVSnY0?=
 =?utf-8?B?Z2dtbmRiWGh2WTlaRXNvQmhrK0M1SzZiM2NFT3ljY2JkaTJHVnp4YlJ4YVl6?=
 =?utf-8?B?ejlqTkhYTHlNM0FlMzdWOGZKaG5VeDdybnJhSEtvZjB5TktsVk1jVy9sVHIv?=
 =?utf-8?B?K1ZUM0tqbnNhV2xVV0lnWEtXTW1XZnIzbVZDQ3JKeWxCTFRjZE1NOUtlRUNq?=
 =?utf-8?B?YTVqZ3V3bXFsQlEwbGlaSCs5djRqRHZLTTQySkJlSW5PcWdqVW9DSnAzYi9B?=
 =?utf-8?B?UnkvSzBFazAxRHNkSHppN0gwSXI0ZXRjcmlBY1dWazVMQmU3elA5OGFWVmFI?=
 =?utf-8?B?YjU4cnRRUE9TM2QydWhUMkJwdGxNNWpBVXZ4ck1XN2tNOHpER2s0a0Q5T1pY?=
 =?utf-8?B?SFdrclpUN21tanlVT2sxblhlZlQ4VlE3Tzd4NmpoUG5GdWtKWXJLRkdKOVdE?=
 =?utf-8?B?Z1MxakdZaHhhMyswUmxmdXhBbmtqb0dkUnpsOTBubGM5ZEE5SUlWcFQwK002?=
 =?utf-8?B?dGp1TmdqbGtRRmt1OVA4NkhVUVczdFAwUEZPbW9DSURaa1FpQk1pL3VqQXJE?=
 =?utf-8?B?S1lOQTM5QmFqcUIvZHQxa01FSy80NjY5TnhrbGpFR3FQeVZIZmhGYmxrdlg5?=
 =?utf-8?B?Wk5Gb0dKeUQvWjl1T1U1QXBpa0Ntak8vdGErQmc2eGk0WkVvcU5pYll3TFQy?=
 =?utf-8?Q?g/2tcvQxoijexU5Jh3I+3/0QY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2858769797CAD5488BBBDB34C324B16A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SS+X3HsZWSMCne53YqBFy99RS1kXH6247MQP+hLmNhqLJdlVMT8XunZC4qbn+r2wMINSw3jEfBKPrs+ApTmmYeYz0paMXmoUuoNziy9xyU3g1F77+Rg5iCw0QkFuKr1umAXjHswi+G4YSJVfpYBTuisYxF26FCPDGX5GUBLva3/Dynk/KKfcF7MPCzjxzBaPO/UCITk1+GCXACBbjUe+Bs5vYsfzMuPnYq+RdBFN7MXB+1i6U7ZlUNaFrPtd47cQdwUeCqZUID6EpZvy7gkHZ7T0B5PyEBcSoRCyXI3XGlujSE45S2cwLpyUXtsW3A88hBGHQWEZuKxxy7d91lL9f82cQ77dsl68n/zc9xUiaDs/dLsVuhqHpKdeKXo17auuV4SeN9pTweDlcHORmQHR36ZR8CG8CIGAAKw2PDU+Le7FcD2jqAoy/yIGp175sxyIoJ5E9mwdUNWsq5ztehYz/6F1sJHZ2evevh62YiBqVl6NWERwbqpVuYKcYdHPypB4MNwk36qPXNyQUnqWFBglyzCXFjf8AoJvIGzQM6oNSg+y8Dyz4vJu9fVxaJdmsHXMGipASt4ete5L1GajToJJoEnKfQJT6WtgYnbWBuc4aCWL+6wuwPqXr/v8i6M1ATdsZFDrBBz7MNM5FfRTynISSw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bea3160b-edbb-4fac-4ca0-08de1b3fbd38
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 01:16:10.4473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDBSqIbbZvKe5LugLblfkS+fb3//OLh2nFqfnaq5PqNmHVbvf6MTKwoIF4eT2k0nqnhUciWhCi+TIBIo13x7dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226
X-Proofpoint-GUID: 8jLfrwYnKuVjdyreCQVhG5_HHyMVsXr6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDAwOSBTYWx0ZWRfX2fPs428saF1C
 chARfE2nKmX6WwEuRYOGxbjwuXxeRIGUcUge8Qsfe8tDiyoCSN3XTPFl6Tl1Q8/4ZzNxdABuqLj
 DxkYtzrx6K2CLrLX9Yz1BHg1mTtZbLFbsCsbXJNJzVNs+A6scw5/tty58nkadbvrV5vbBBE6Oku
 hs75TJPE6XGBuI+NrjHHuhSHqvHMbis6B9ZILsXPbOfBzDZqp2Vc5gGTY4nmi0zLo7dokHXrNtC
 syq3u4p2TFwu+tFRt/XaMTyGdJHiY5pp/GXF58msaLf2IXBLRnNLKrq/YJcPX01vOqGzxeqh1Gk
 sRgbcG2HU4P5T6HIGx/pdKd/BIF9U3B8t+zyHL5FSM0LFKcQZHUTDUBQosX43xRWVWKJJ8mSjTP
 WMkCZtcExEavOO3PBcmLa54HBRs4fQ==
X-Authority-Analysis: v=2.4 cv=LoifC3dc c=1 sm=1 tr=0 ts=690953df cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0JPAi_ymC3KnaxXyGNgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 8jLfrwYnKuVjdyreCQVhG5_HHyMVsXr6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511040009

T24gTW9uLCBOb3YgMDMsIDIwMjUsIExpIEhhaWZlbmcgd3JvdGU6DQo+IERlYXIgVGhpbmgsDQo+
IA0KPiBUaGFuayB5b3UgZm9yIHlvdXIgZGV0YWlsZWQgYW5hbHlzaXMgYW5kIHN1Z2dlc3Rpb25z
Lg0KPiANCj4gVXNpbmcgYSBsb2dpYyBhbmFseXplciwgSSBkaWQgbm90IG9ic2VydmUgYW55IE5S
RFkgb3IgZmxvdyBjb250cm9sDQo+IGV2ZW50cyBvbiB0aGUgZGV2aWNlIHNpZGUgZm9yIHRoZSBj
b3JyZXNwb25kaW5nIGVuZHBvaW50LiBJIHJldmlld2VkDQo+IHRoZSBoYW5kbGluZyBsb2dpYyBp
biB0aGUgVVNCIEVDTSBob3N0IG1vZHVsZSBmcm9tIHRoZSBsYXRlc3QgTGludXgNCj4ga2VybmVs
LiBJdCBhbGxvY2F0ZXMgdGhlIHJlY2VpdmUgYnVmZmVyIGJhc2VkIG9uIHdNYXhTZWdtZW50U2l6
ZSwNCj4gd2hpY2ggaXMgMTUxNCBieXRlcywgc28gaWYgdGhlIGRhdGEgc2VudCBmcm9tIHRoZSBk
ZXZpY2UgZXhjZWVkcyB0aGlzDQo+IHZhbHVlIChhcyB0aGUgcHJldmlvdXMgMktCIHNpemUgZGlk
KSwgdGhlIGhvc3QncyBiZWhhdmlvciBtaWdodCBiZWNvbWUNCj4gYWJub3JtYWwuIEkgd2lsbCBj
b25kdWN0IGFuIGV4cGVyaW1lbnQgdG8gb2JzZXJ2ZSB0aGlzIHBoZW5vbWVub24uDQo+IA0KPiBX
aGF0IHB1enpsZXMgbWUgaXMgd2h5IHRoZSBkZXZpY2UncyBlbmRwb2ludCBkb2VzIG5vdCBnZW5l
cmF0ZSBhbiBOUkRZDQo+IGV2ZW50IGluIHRoaXMgc2NlbmFyaW8uDQo+IA0KDQpUaGUgaG9zdCBk
cml2ZXMgdGhlIGRldmljZS4gVGhlIGRldmljZSB3b3VsZCByZXNwb25kIHdpdGggTlJEWSBpZiB0
aGUNCmhvc3QgcmVxdWVzdHMgZm9yIGRhdGEuIElmIG5vdCwgdGhlbiBwcm9iYWJseSBob3N0IGRp
ZG4ndCByZXF1ZXN0IGZvcg0KaXQuIFlvdSBzaG91bGQgYmUgYWJsZSB0byBjb25maXJtIHRoYXQg
aW4gdGhlIFVTQiB0cmFmZmljIHRyYWNlLiBUaGlzIGlzDQpjb3JyZXNwb25kIHRvIHdoYXQgeW91
IG5vdGVkIHRoYXQgaG9zdCBwcmVwYXJlZCBhbmQgbGlrZWx5IHJlcXVlc3RlZA0KMTUxNCBieXRl
cyBvbmx5LiBUaGVyZSdzIGEgbWlzbWF0Y2ggaW4gdGhlIGNvbW11bmljYXRpb24gYXQgdGhlIGdh
ZGdldA0KZHJpdmVyIHByb3RvY29sLiBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhlIEV0aGVybmV0
IHByb3RvY29sLCBjaGVjaw0KdGhhdC4gVGhlIGRldmljZSBzaG91bGQgbm90IHNlbmQgbW9yZSB0
aGFuIHdoYXQgdGhlIGhvc3QgYXNrcyBmb3IuDQoNCkJSLA0KVGhpbmg=

