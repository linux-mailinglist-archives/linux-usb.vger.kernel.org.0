Return-Path: <linux-usb+bounces-11794-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9ED91C7E8
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 23:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3607F1C2115D
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 21:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DB478C99;
	Fri, 28 Jun 2024 21:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="vn2qYDRa";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mWK0Ym2C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iMx23RDN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40291CF8D
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 21:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719609140; cv=fail; b=JBwpFWKn9M5KaBtRJHzWySHr8Hi1ers5BxEiLgV/fMrWG2REuFiFUDgJOItJIGFLuqi9B0bzC88gVvbJWkoY9F+IvR+U3nwD4KskMg8gzNeZmKsbDf199gS4qmdjBZ8VpudgiK6HcCRfYL/2INKDP29ZE7eYidYuYF47N5YxZ2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719609140; c=relaxed/simple;
	bh=DXm04FI37UCev9Spq8Ce8OHngSwcouUYHzfUcBMR60E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FL4FIAsHmC/L364v9M62YeUENEmm12TIEmBKRnlX7hzEdpmzyDAMPbWOOU7vQLsQqiCKeYeM0t0wFjQdwXqXTFvs6NXgnZkIvry+uh9BjUgW4hfVhs8awvVI4Qv8LRD6YnRDjDwtgcLO6vzqln6gmS2L7jwUATGaNR245UsYpWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=vn2qYDRa; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=mWK0Ym2C; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iMx23RDN reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SKQn4Z006935;
	Fri, 28 Jun 2024 14:12:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=DXm04FI37UCev9Spq8Ce8OHngSwcouUYHzfUcBMR60E=; b=
	vn2qYDRahjyY7RPr8nY3W98r0FYiruNim+0/xJ2eyg4mLGVDyNRUmoa2XUuNhaap
	ItUnpYRpMLOTzx80qEf1TPp++YvCvg5grrIY+bk0CpdpnJTGZ8eIyyZhvfNl7/zx
	U2r9utOxnf4vQJQROW8fGRREJW6wXBgDzfIq+1Oh9tEvyQ3QDnF8LUNW2PojZHOw
	D5P1k8V+1TnkaBLWKXCDehUYm/dEFb54ganI4FgrkKxksK0kzLTVXmCd4QLMywZS
	8apMTRmAHAyi2zK43zwp7fpKeI1UXFCvNwCzccolY6fGpvVgFaZQBklrewVSR3do
	puevVhtJsr0JpZ8ABHn4mw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 401txxabqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 14:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1719609104; bh=DXm04FI37UCev9Spq8Ce8OHngSwcouUYHzfUcBMR60E=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=mWK0Ym2CSMZXQYbZk4Ii++21SwXQaPjdn3qhyDU7fFZPA0pfhDXx/z2GiSLP/IZUi
	 F1tKTo0UGnNLxjQqWNWd5ZM6fQc/whsS/P/DgTxt0qNuJAt2i/GXun4KyprEK6YKlB
	 QIQLMvIbPa+bbxryiEg0HYlIwd9y3Yc8v1s5iPWkDct7MWHjENLVyAZXzqYYsKPVQ/
	 RnDlUY5apui/CrUg+85Qd3ICD3JvAMIZrAnUEtL8lI74zKtngs/1B+lu03Y7ozFsjs
	 ECF+ia+rUGXOcOXr5A2ddORk2vW2kGgtIjSg+G0BhVwHZ9PU3tsC4XjnYeLTBw8RKa
	 ss1/23eiBYy9w==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0733F40467;
	Fri, 28 Jun 2024 21:11:44 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C7CF0A007B;
	Fri, 28 Jun 2024 21:11:43 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=iMx23RDN;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0AE5540358;
	Fri, 28 Jun 2024 21:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmgdRRYEwc5nhzFGZrrfO2UPGMgxIZO0Dg0gjHiL880aG6rDAYct3J26mhDRbrmzzVNgDVtbvSKY0ffS6qjsYB5GI03WVFSaD7mZxKaaOR2xK7YLPyLsCRtnnlneFmxI8Tha+XoLxw6a1VrL6ir4hWRrhkcmbv/JW+8dkUor9pwkqOLcwBkXIJbSYbZzIe0hHlbviknfJGKWKwlvpTOanvozcVyQ0x7ojvWG5AAjPaXHKhmcjYl4kRDVTnkZ77UXDQeZ4oTabUKIEZkROJDewKjF9yvWnV2eDfISwYwtMIl+EvjdN8KEdNjh9ZErDkamPoBtUEbdrZkus+yysCdo7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXm04FI37UCev9Spq8Ce8OHngSwcouUYHzfUcBMR60E=;
 b=exGhR/qhtDJyOjwpI80cBON5XKWZPB5xCl4Dl1WKBZLmq8rbzpi5waX380il7eIpUwdV6lqyEFiY2mdN7B3d/Z5U7qLa6U8wVJ4TNX+9YaWIj+5xXci4mEi1eLEefYZXn/6CESRLtOB7pf+OfP9mdHRdFe8ZSi4XGvjryqQNdw0MSmSWomvKV7+WbLhOsiXzka4Jx1GNQe7dn2pt1KaLPB5BEd5gUnrDR/cIWo3qjjWXIeOWWop0f+v8lmJ1FsCzRifGeOZWr9OJXmmZ+amjkGSoTd+U25g+zdq/RvEla4iRmfyU4eqOPgO48iL2XtiW6uTJug4bLi72tV1140hlHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXm04FI37UCev9Spq8Ce8OHngSwcouUYHzfUcBMR60E=;
 b=iMx23RDN6YugsEYWJ6c1aCsUiPp/74pQsuJt6334C+UFqMjriuWi+gBzFiCI64haSXnMCe7bLh6at+4vRxoIwWj6xbHZf4pPekpDCHAyDK0dI3pLkGwZAURUciEEUPJ96pZeIzoJ5GgAaI9wbrKcZKJR54OU2vyvWD73uSijmbM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MN2PR12MB4062.namprd12.prod.outlook.com (2603:10b6:208:1d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 21:11:40 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 21:11:40 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Andrey Konovalov <andreyknvl@gmail.com>,
        Darrion Ramos
	<darrionramos@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Remote wake up in gadget drivers
Thread-Topic: Remote wake up in gadget drivers
Thread-Index: AQHayXF3l07gIjDGvUSBwoX5iP+0yLHdXSAAgAAhEACAAAIhAIAALFUA
Date: Fri, 28 Jun 2024 21:11:39 +0000
Message-ID: <20240628211140.va5ghcr65dl6g323@synopsys.com>
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
 <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>
 <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
 <CA+fCnZcrn1sr-sMbwk6i5RDMMh3q9TpBgkGAN+4cg4RaCo9S+g@mail.gmail.com>
 <28b478e2-4b17-483a-9584-0e6342677ef0@rowland.harvard.edu>
In-Reply-To: <28b478e2-4b17-483a-9584-0e6342677ef0@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MN2PR12MB4062:EE_
x-ms-office365-filtering-correlation-id: 93904e53-7cc2-450c-b9c9-08dc97b6e74a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SWFpY3B4RWZSS1lZeGhOR0gxc1llUEh5OW1md3p5RXA2eXF6aExMbVNUU3Q0?=
 =?utf-8?B?UGhCNUN1NWkxMElhazRuMVVsVlFtWTVvQ092WnNkbWtQQktQN29qMnlibFg4?=
 =?utf-8?B?RUZYOUJzcHdsOEZFOURJY1Q3RVNyQU1CVDRNTjYxdU5MNFpaZkwweGNMdUFo?=
 =?utf-8?B?QWIwMVVtclp6T243MG1DcFJWWUdwckVDTlROQnBBTWJJVFhpU0JHUkdVb2NJ?=
 =?utf-8?B?bE0vRitTMXg4RW5kSWRhOXpRL3lnUDFiWTNiRjR6WFFNOEp1OUd6MDJxRk9U?=
 =?utf-8?B?WTNsdlFZelI5WDBpMnJhKytoeUI2V1JnMG9FbjhXZFB4SnRqNmlMeHAzbHFD?=
 =?utf-8?B?K25tVVI4WnN4TlV1MDdhQjI2OVg0ekNTTHpkc1hBb09BTmh4ZmJpejRqQ0h1?=
 =?utf-8?B?a2lWY2pMKzBtMWlYczFNUWNiV05PZGdPdGZGSHpDaERRT2RhMTQwNXh5T2ls?=
 =?utf-8?B?WlEwTkJVZUZuS1ZWcGd2WHFLa2paQ05ueUZPbTcydnZ3WEtBdG1Fa09SWFNU?=
 =?utf-8?B?bWJzT3M2NVVUSHRmcjBuSE5NbGFaNGQ2aWZCeDdnZVNldkJTMElIRjFpVGNM?=
 =?utf-8?B?QmJ5dUlvVWt3VFYwL0IrcllhTW42bWNNeWlkNTdvOVBVYlZHNVlXaEp3WmdS?=
 =?utf-8?B?d2tKd2MwZ2VFOUJhR0I2SGE0RmpCTExHVUVueHNEOW5ETVloeDZQTk9Xd002?=
 =?utf-8?B?RjFSY25abG5WamIvMHc1bUhmNUVpaDhlR2srQzRDVTlSR2U0T3BNRnlqZElQ?=
 =?utf-8?B?V1BmRXpHT1Jaa3hqMXd1anBuUElrcThxU1FKRHlvbmowR2pGR3gzMWZjVTJ2?=
 =?utf-8?B?cVlBQ3g3VWVjQUk1Tm5rN0JnNW5mNXZLMXZhM0plSDdhdGp1Z2lpWHNTZkJa?=
 =?utf-8?B?N3ZhT2ZHdFRmODlBNVllV2h0TDJiWTVjR2s3VVZON0dYVVVjbm43TC9jNEgw?=
 =?utf-8?B?eXQ1bTc1djFpZHgrWlEvYjhQVlRVNFBHdkxOblJpNWhWa1FNQVdXcjUyU0Y5?=
 =?utf-8?B?NUpKc0p0eVNsN0Z1dXRxMkdDenp3bmJQY1dhWUFZMy9vZTZyZDNiYUQ1cjd1?=
 =?utf-8?B?dVZqd1k3TU1nK0pGY0ZVRHllV2NZUjlVeE5YTVpSMUFXOElkZXpQaC9QaGY1?=
 =?utf-8?B?STJWT3RPNDFhVXhkNDJ0Ymt6YzNrYTRjM3FzYmV2c0pkSUpxYXYyYmx3R0dl?=
 =?utf-8?B?MzROeHhDSmM4Y0puYldqZlFWOURWeVNtUFMydDZrSDdmVWIremlxYmR2SjJz?=
 =?utf-8?B?RjRDa2dtWDF4MXBKdmNFWDIvUytNei9Qa0VzRVhzaW5TV2pVVS9RUWVzUjJl?=
 =?utf-8?B?T3pldTZlMXphWGJNOFFXblFabW9LQ0VxQU5IMjBFdEhkWG5YWjlyT1ZPbEtP?=
 =?utf-8?B?MFR2RFNYRk0wc3lnSGRhNHA1SGJnY1hwelo4WThLd2Ztb0NoZm8vVUdPMEUx?=
 =?utf-8?B?MGxodXJDZGx2UnUreDgxU2NGSk01TG44U3FBeEorNEpiVFY1MEp2RVVYeWNa?=
 =?utf-8?B?L255dUc1dExsZlNQbzhjcDQxOHNOYjVPcTB3dmJpeGhESGYzSHA4anRQRlhk?=
 =?utf-8?B?V0ZPWmZlbXdhcFRqT2xqZm4rd2ZDOFczMlpram1HVm13R1FxL21mc25HV1lh?=
 =?utf-8?B?bm9XakJCbXNObG5FUzdoSXFJUDJXTnlSVFhpckZncHlyd1lNLytud3FZMHJW?=
 =?utf-8?B?V2Y5bCtEdUdHQk1aZnhXT1JkZ01Wdk9TcDVScFNmZVAyUUFwdWY5Z1RDcklu?=
 =?utf-8?B?U1ZYYXFoSENYTjNhVWxLQStLZG5ZTkhkaWcyVzdDWXlNSjU0cklZd24vRklr?=
 =?utf-8?B?T2pwbTVpdTB0NmVhNlhyay9IMHZyZ0lHUzV6bHdOMzFqNnNnZGZ4eVg0cmtB?=
 =?utf-8?B?VzVTUmxFSFZEY3pWa0hKMk4xYkx2T2J4bE00dXpoTEVINlE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RGZZaHNXc2dDTVphZDZOWnY2VGtvR211aHFaTldjSDVjWlZNbExGNS9oUVRJ?=
 =?utf-8?B?Q0hxcjNCRFprN0RTK2UvRmZWS2wyZmU2eUJpeU5WNzd6bmg4Y1ZWcEZmR0Mw?=
 =?utf-8?B?OXlRcmI0UjltdktlZ1I0TVRSTE5DNWZscGZ1VkNSa2hxcW1pUld6dFZ1VFVr?=
 =?utf-8?B?cUtKSmxKL3JBeFY5T01uY3hlYnZOeWZ1UHMyQ0xQdVJCb1VSZTJmTTVZYnll?=
 =?utf-8?B?NlZzaTlLd1pUK1BQUzJxWEU2UThaVHN5ZXRlQmNRUlp6aUZ2SXR2cXVJTFha?=
 =?utf-8?B?S0gxWHlsZlZrdTZzc0ZYZTdHS1U0R3dSeTJVOVN4Uk1oOWlQUGZMV1FoWDZ3?=
 =?utf-8?B?U055UU9WNjlUZXZ6RXBTUHBiSU1DdnROYlRTdjNOd2J6RlcyYjV2bHhPaDlp?=
 =?utf-8?B?cWYxUDlpcEYrQ2ZVd0VGckhRYm1NNmVvRzhvLzhJd2hRTUYxNm9Cb3BLRHAz?=
 =?utf-8?B?ZjVEendKdENKNEpPck5wVEF3cUFXK1d6ZTd5M29ZR2ZDcDNZVFBacE5oWjZ6?=
 =?utf-8?B?WlptRG1wbm12cGUwcFZkbjlyMzVKbi9lOWExM1grd2dydDlOVWFpZ09vdzRF?=
 =?utf-8?B?dHJTRUY1NmY3Vkd2RnpCWitqSFdOOVpZSk8rSmJaTDVna2s5MGZwVVc3ckVi?=
 =?utf-8?B?bW1VSndIRUZ5U2lFdCtGeG9SR1FBUGFMSVZaVEhHN2x1a2FoMVZZbk9nR0Y3?=
 =?utf-8?B?SEtoUDFlVUpPbk9YQ3ZQc0h6c2d6N1huL1BSeHkrUHcvMnA1U3VCNm0wdW9K?=
 =?utf-8?B?SXJhNElsWTJmdVNQbWFySXppdnpYN3k5NnhteHoyY2E4VGwxeFN6TG9Zc3NQ?=
 =?utf-8?B?MWRPSnQzeFpBYUR2VDRQY1R4dVlpaXVWcFRHWW52WHRnL0gyQ0g0S05VVGFL?=
 =?utf-8?B?VU16NlVhYk9QMGI1WkhmZ3g5a0JReUZ3aVk3MW9jVmlIUnJ5NDNMTi94dzdS?=
 =?utf-8?B?YjNPb0dkWEMrLzQxeW9OQTF2UnRrY296T2t6MHJ2YnM0b2hmNktPcjNVVXdj?=
 =?utf-8?B?Y1lDUHZ1T3BqZFB6L0pva2ZHRW1nY2VRRDN4RUtLQ1RMd045NlVlWFVZbm0v?=
 =?utf-8?B?aUV0dmpkUmJpUW40TVRRVnNhSXJwc0FqZTRtV1VUMXdYaGhCRFlvNmlWVHUx?=
 =?utf-8?B?RHJ2VzdIZnVwUXMwdWk1bzNxdVV2MG16d1V3VktYa3RHaEpUYVBrSDNHNHl0?=
 =?utf-8?B?aWZWTGcwNEJaSFpoV0tYaEt1Q0NadnRZbG9kN1V1UlZyNGNMZVpoL1U2TWd3?=
 =?utf-8?B?OVBNSFA4Y0hhSkR1ZjNKMnhiOUdQbTEyLzRySkRZejlqOWdnRzF5blBRZHMw?=
 =?utf-8?B?Z0tZamFCY3FwOWNoVFcrSVArK3dIblcwcWhzYVIrT1NIVk9ZRXNMWVdGRlJD?=
 =?utf-8?B?U1d5MTJZalNPUXJVaDFqQ3ZjVU1XWU9kR0xUcjVLU1diWVFIRkU2bks4cW4z?=
 =?utf-8?B?SWFpMmtRbDRMMzEvWmdXOUxZUStrQllFR1JoNVJPa3RpaHJRS2hMRE5TZjho?=
 =?utf-8?B?QWppMGxEdmhIM05BdWlTZFlvZFkzM3U0RGp5U3NSZnlqN0ZKMythVFVFVjJ6?=
 =?utf-8?B?MHl1YjB4WTJ3L3UrdFpSQTJiWUNOTzNGVUpscGoyT01KamY4eTN1a0E3d2cy?=
 =?utf-8?B?aVlQSHQ3dW85bVVidWc2ZUc3VzJWa1M3Ukh1K1VUb2tGczNaTVVRR0FGeVR5?=
 =?utf-8?B?bHNTVEsyaUdEVjNpNENQU2VEWVN5MWlUSmppS2RNUUtNN0NKUlIzUVp5MThF?=
 =?utf-8?B?UW9OeU5kMEhaRkl5VVdVZ2NLc2thRmlUSGR0amxuUEt2YkFGeU9rYzluMlUy?=
 =?utf-8?B?c0d3ZXJnM3ArNGVtZzBvdEwxYVluZVFYRE11R3cwTThUbmd2MXluTzdoY1px?=
 =?utf-8?B?VzRyREN6dlA1U05GeGFYaGMwWXp0MGxKZy81T3VtK2RleXA0TnZUcXgvT243?=
 =?utf-8?B?a0UvUVFXWHhTQTA1M1JoYnl2UStOTEU1dS90WElrb0JpUm12MkNqdFJuUVFj?=
 =?utf-8?B?TmUxY0p6S0VydDQ2Y1kxMlJIVmZQb3ZEcFJob2xGWjRGMjh5cTg2R2FhMEJv?=
 =?utf-8?B?Uzl5V1diYmVmYkxPUUh1cUt2UjdobGdkS1N0Yi9ubGZ4cWJpVE1vR3QyUjBL?=
 =?utf-8?Q?Du2RPi6E6cEnmWmAtydZsNWwl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96AEF88D6A299E4DACED6BBFE7E4217D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	brKPrhg0VNPRQkq107BuBJTpqqO5XMqi4qzGzUQ6IVllmdp4T/hoBkY3d6Giwina3v2aJ5vB2qdgSs5sIChlwvQyueAF24Z2H+7lh0/N0ut+QxpzN4IP074KChU7Tl4Frokzzj9AkuKMHtvOPyEVV6/Kj9E4EuZ28tBYAL0jYllKzdIjpKuutvX4YnPNp5s22StpNLGCaQhgjhbDC2voe1AB/4TsZ4QV4eLuGQzFudatNntRPUZ9SVbtyycoI3EUfvJQzIjImxAePGQluXA6FfVmDE23gJew9p8mrZKRfArQ1JdCAGTW60XjiW19GPCcb7ttAHwh8qurWdwFk4RRjcu1joLCZi2Gstzva/ca7sj7GNDq86cELufpzANcgbV9BEPjfC5IdUUEOzeTyFEyWCKKlo4SVbma+tLCRXtUTw58iTk/U0YzBl1HCc6J3ugJ4Edgd06JeWm5/uOxWF73yDEpOl2UPmpIowvsXlf9zcr4lZNWZHqao18BIrnIe31E1qvL5ZGLwgtancSeM78/yDj5x/mvGjsajtWcmcLiGnYcmk1JsyiUDoaj1NyUzI1msnR6/PHzi7Y18oLF6ethXL9w0/uAJaaJ1pq3bcHRzwzRnJjhNrvlk9XUX2KmyCSIkAc3D1+lmkWM3zszaA08Ow==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93904e53-7cc2-450c-b9c9-08dc97b6e74a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 21:11:39.9845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qWmnlNHls1S4V8GbS3fTFqPTUpZCSwSNN5cgFTusJXXHk9aTwRKJGEoGSP51vbnXJS9JPVP2tg176NDmSkaTiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4062
X-Proofpoint-GUID: r5oWUGxw8myuzVkeHjH-fdoyPBCv-_fJ
X-Proofpoint-ORIG-GUID: r5oWUGxw8myuzVkeHjH-fdoyPBCv-_fJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 mlxlogscore=610 bulkscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406280159

SGkgQWxhbiwNCg0KT24gRnJpLCBKdW4gMjgsIDIwMjQsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IA0K
PiBXaGlsZSB0aGUgd2FrZXVwX2NhcGFibGUgYW5kIHdha2V1cF9hcm1lZCBiaXRmbGFncyBhcmUg
ZGVmaW5lZCBpbiANCj4gbGludXgvdXNiL2dhZGdldC5oLCBpdCBkb2Vzbid0IGxvb2sgbGlrZSBh
bnkgb2YgdGhlIFVEQyBkcml2ZXJzIA0KPiBpbXBsZW1lbnQgdGhlbS4gIFNvIGl0IG1heSBub3Qg
YmUgcG9zc2libGUgdG8gc2VlIHdoZXRoZXIgdGhlIFVEQyANCj4gc3VwcG9ydHMgcmVtb3RlIHdh
a2V1cCAoYnV0IGl0IGFwcGVhcnMgdGhhdCBtb3N0IG9mIHRoZW0gZG8pLg0KPiANCg0KVGhlIGR3
YzMgZHJpdmVyIGhhbmRsZXMgdGhvc2UgYml0ZmxhZ3MuDQoNCkJSLA0KVGhpbmg=

