Return-Path: <linux-usb+bounces-31087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B4122C9A00A
	for <lists+linux-usb@lfdr.de>; Tue, 02 Dec 2025 05:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C22F9344B2F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Dec 2025 04:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D025A2F5339;
	Tue,  2 Dec 2025 04:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JTo9dyPY";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QrMcJUyI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="naJyi1T8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6BD281369
	for <linux-usb@vger.kernel.org>; Tue,  2 Dec 2025 04:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764649412; cv=fail; b=kyzoUtO+DCVdcqYGLyGGPrZXEaTB7akKbBMZADLBfe4A42gFF/tI+SKTT+tCu9vq6ynobP21paxJYvYbHhWFC7nW6jz1eXdbMRQZRh6wJdBSlhjGE4WnM1ICU2z2nhy5tHlhS4LlUlAws82DBGeh6ycFzn2DPRVADQHJISjq8A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764649412; c=relaxed/simple;
	bh=UqtOBRY5tLKxQjzKs2LjQt5s9oifkmaw9cSz6dGo0pM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gVZPFPQKFnMVBU71pJ2vDzdcqXM4BFV5Ip8J/cA+Tanuv2GoD36x08YQZT9Wstu8h/kUByM13sqF5LHSqjqc0YUNZdkKTUwoXxksB5kfnKnxoDV0izVvD3phX225qSh6QSALIPrGXTyFFJ0eblOaXiuY0SxyOv5TgrY9EOXEhMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JTo9dyPY; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QrMcJUyI; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=naJyi1T8 reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B23ZDaG231381;
	Mon, 1 Dec 2025 20:23:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=UqtOBRY5tLKxQjzKs2LjQt5s9oifkmaw9cSz6dGo0pM=; b=
	JTo9dyPY5jS/ukgaAUX+ADsAavqtO17ezIZUE/101RHXXtf/TkiVoeRovp+HDZYI
	fFyXWqSLqRUjI5JyIk17sRmzvGE1UZ7apj8Im9Icc37PrbEdSbWsqAt9RIXW2S4j
	NcOeBKxX8E3bsd1INNlp01aWMb7rBG+2+h/dYBO/p6jdleWMWk2MvDJe2Rl5K1wY
	u6+0WN3b4xbsyDoCjuLm6aIb/16HyXog4npoWmCcDvPr7l3pCkJtCKJFl0P7i3+c
	Orp0X7AxecbDNKQwfKhFQMTyJlnDF1+Yq8V9U9ppM6vZpeEIMbkTyqjuxJ/R4jo0
	OSW4TSrNZo7VyI2043YzwQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4as7ygv6af-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 20:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1764649399; bh=UqtOBRY5tLKxQjzKs2LjQt5s9oifkmaw9cSz6dGo0pM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QrMcJUyIcM3O+ggg8Kgv3Nmo+GkfYOmEeqIjQ/OlBybZTsD4I258ZMli5fITMKGzv
	 f7HK/W0W57UgMGlyVZApoRcFVEWF3BaairEmQIOATfUFZhSLSVXRXJ2oprX4x9JUIQ
	 zByND7Oq5zWBYp0e7JTAf7Jk4R4QjSQXmWYkww04VzbIKoniNlXAiwk9gIVr8EpLZp
	 keFMdfBdC64axlM0NVfnM4yeuqd34s4ZVkRVpL0C1NMpfPj3PdC9bvnZhnIWGtbaXW
	 ypI9J6b7WPdZmbG5KllOCRM+R4gHa/p8wS6X2BIuOTbppUyMRtLXZ2FIyqQdVHG1rm
	 qGNPeOewtp0TA==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 38813401F0;
	Tue,  2 Dec 2025 04:23:19 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id DE153A005A;
	Tue,  2 Dec 2025 04:23:18 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=naJyi1T8;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00302.outbound.protection.outlook.com [40.93.13.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4FAD240585;
	Tue,  2 Dec 2025 04:23:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZ6lY8IaHmr9F0eSS+jSI75r/+uUAyFkP7mjsK/q+E2ItEbAtEPOZiXzZYh+p79FRlUb+5A3I5s4txOWXTUM5CQ9BDi6Ze1TEe+yYPRbr+rvxWTYY58iniVWCIT3WULfDfNBjhOEFKkljt/zqhYCG6r4en/vKrUqKOeZVs78idCleirgnamuUclKO22mCsOcQ+XJM3CH0hgZHoRwMm9AAu79aV54f5ynDkrWFHNwh4Q2iOJG3BFfBF3A9yPSue1P8SCMGkXS/AdQ4mBSsgiy7kk0XyR4+4kH0IDEOXLBYm+T9SKWjUU+v4iuOtK6IwelThbnuUObtPlGd/ezw2nHbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqtOBRY5tLKxQjzKs2LjQt5s9oifkmaw9cSz6dGo0pM=;
 b=sJ7G+qGH22Q710keteMEB0z4Or4e7LTBbKM+e+hSFWeL+xRUJURxi2OOO1IIo2Hzg6SRc1EHaeo2GOfu0BvjY3XZTEeXhAwpdoQGZ5YVSw2cm8vEyAzzZBJI71Yjlwu/33YxrCkwGhV6XD3CGLMXX/Un82jGNVDLuK56kww6AT8/vHlm27I0dV0mSALCVVny30xL2oUJQ1RauqT8Uyq8s8zUKVrsF5kn7PahmQVqJklY4GghyWy/pmq4ofwdTTFF1DBxmFlWNhN+HLopZ0LIBHz2UnoqrWl2UnQM5kT3S0wAqJAfSbx3iKqj5LTqCzBY4XMULmOfLEd+gg+oOdHciw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqtOBRY5tLKxQjzKs2LjQt5s9oifkmaw9cSz6dGo0pM=;
 b=naJyi1T8sSsW4v3Pz7Vs8+a3zQCLvvG583bFZlQKc7HRIk+2ZNPzWU/CFGCeANFmU3I2WKBmgQcFoaA+XT6MAQMbmF2ga+Xfpvkpg2++6u4YoHcG8JtCK+FVnrQkUYA793+4BbI0jnNZTYIUcrTMJ7TAaKYrI7qEF9B9jgOeIK0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB7247.namprd12.prod.outlook.com (2603:10b6:806:2bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 04:23:13 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 04:23:13 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Angelo Dureghello <angelo@kernel-space.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: testusb: epipe errors on test 9 and 10
Thread-Topic: testusb: epipe errors on test 9 and 10
Thread-Index:
 AQHcX3S6n+P1FBV5tkmmOEks6ZvKjbUHbd4AgAC3i4CAABC3gIAADd0AgAUxsYCAAD2OAIAAFI+A
Date: Tue, 2 Dec 2025 04:23:13 +0000
Message-ID: <20251202042305.wl2uvxoe55ay5vxw@synopsys.com>
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
 <d8aa2f1e-fc44-4bb9-8245-d6ac76047dc3@kernel-space.org>
 <9776c9fb-8fed-4e79-b312-0b1a872911b8@rowland.harvard.edu>
 <bcc4f76a-985b-4932-a455-b4fedcafcd97@rowland.harvard.edu>
 <20251201232911.s5diakt3w7ztzjv2@synopsys.com>
 <82bc662b-70c6-46f8-acc7-3a666965d13e@rowland.harvard.edu>
In-Reply-To: <82bc662b-70c6-46f8-acc7-3a666965d13e@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB7247:EE_
x-ms-office365-filtering-correlation-id: 9d2c6b79-bb2f-4384-2848-08de315a8210
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bWZtU0dSQ3VEaHFzN1NPMGFrZVlyZE5OUFJ1Y0NyMVNGbmpyaDgvMXVIcFQ3?=
 =?utf-8?B?WmdoTXQzNkRjZU1iWjFEK2RwNm9mUERPZDVTaXVWU29PNU9sdDZqc2NCYUdk?=
 =?utf-8?B?aUsyNTdlT3dZVDc4L2ZON0NLOVJ3Y2NEZzBUblN6bGFHanhvUGdhY0J3Smta?=
 =?utf-8?B?eUMrOUZPRlJYNjFVa3VrMmJGNS9jQnorWWYyWGZLeDJqTHFDaFhreERWUkg5?=
 =?utf-8?B?SUhNTTFrR2M4d09GYURLUmdDZHc5dVhsRFJDL0hhR3pBdVhmWFd6ajlUU1Vy?=
 =?utf-8?B?V0gyUitGQTdZeHdSNjlZNk1uWCtibU1pMU9lOHdVdUwxVm96dzVqZ0NyejV5?=
 =?utf-8?B?YUxXejFGYlViL2l1SjZrc0doekxKdDFyOG9Bbm5xNkpoN0QrZXdsc3diR1hR?=
 =?utf-8?B?RE82YXIrdXJ0WFZVbjhDYjMxbENTSTBEUndBVm9vSGgyazNQR0NDOGc3dUU1?=
 =?utf-8?B?NmdWRy9qekhDUC9YSXpqeHMzS1VxMG1XbEE3c0ovQ3c1bUhhS3NLZXZTWUwv?=
 =?utf-8?B?U0szWjB1Z294RENYeEVMaFplbkRwZE1Ubjc4U1ZPdEZ6NlRUeDhtNGJPOXYy?=
 =?utf-8?B?Q3R5Vzk2b09PM0xtUmU3cnZpSnFnL2tJTVFVdnFvYk9oR1poNjVpVmlYNHlQ?=
 =?utf-8?B?S0hya3JqaWtzdzhlaUhXZ1UyK2xtb2RKWEFuYnFZbXZZRi9KY2JIOHFMWS9a?=
 =?utf-8?B?NnVod0YrTjhjWTA2OVd2TEdNa2swaWI2WTJDSGp1ckNDUE9rc21uZytMOGp3?=
 =?utf-8?B?RzZXVGljMFcrV3h2K3JNTmVJOGNQL0VIZU4xaHF3RGlXTzY2alJPb05XTWxN?=
 =?utf-8?B?bVZuYVBrMWNSVlRlV2kvci9maGdnU1BHVWJkMzArQUkyaTRtNWZ1dHBoUFVK?=
 =?utf-8?B?WWdycm85ZmZFR1poUHJMWDFGOGpLUWxMTTNqK2FRU0hXTzF4NS9LcXlseHpa?=
 =?utf-8?B?U2FnOW1yTFkvYjAyWnRJSC85bXNMYUZYQldIbUxDYWtkQmZteGw1UEJ0eUNO?=
 =?utf-8?B?dzJmT1pndGpKTW9tL3c3dTE1d3BMRU5yM2JsMjh3TWYxWnhzOTJ6TlB0b1U4?=
 =?utf-8?B?eUZvRDBrSi9SUlF5bXU4WTZIWmZaOTlFRkdLcHk3K0JHeVQrVE02UzQ1Y0U2?=
 =?utf-8?B?VVNyamdyQksrQVJUYjFpY0dpSjZsTlZYbHM0d3hYOGp2c3NOZzFRL2FzRnlO?=
 =?utf-8?B?cFpDWitvRDh5bWhDYkh0SDlBanhIeEpSNmhxaFlwcjA5T1g2dGd5QkxQSHEw?=
 =?utf-8?B?czdLZTJWQlA1QjFuVVRCK2lJbGVGN1N2TS9Fdko1MUZrclJibm80M29hUjhh?=
 =?utf-8?B?amNSL1p4NGFLTU1uQlAyZmEyNG1EcGZHQW1zd2hqTFRKUWpKOXhrZXBYM29D?=
 =?utf-8?B?YUdvV2MvdU1nZ2c4LzJ1NUU0dWk5MUZleXpiS281Zy85MUs0M0MxZGZNSGZP?=
 =?utf-8?B?Z1lXYmwxU213cXVXWGtKL1lIcTRNNWFuMGpCWnpxRFA2YUFFN2RkNVZuUFBE?=
 =?utf-8?B?VUJSSXdvL0t1WTZ5UExoV2Nqc1l0ZzQ1WnJvMTl2LzZyaUVheHFpc2RVNlpp?=
 =?utf-8?B?TWU2Z3NXb0Q4bzk1cDUwTlNUbDZZV0x0ZlVYSUFXQ0pSLys1WXBuYUZISThw?=
 =?utf-8?B?V0dub0VvZ0Vlb3BsT3MybXkrUURGbGsyTUFveml3N0hKSjFaOXZ5L05qZHhx?=
 =?utf-8?B?clRLL2FRTDhScmJvVW9ZcjJYc1ZxM2Y2MjU3L1N2SFMrWTBJb3pKeXZwaXEv?=
 =?utf-8?B?VytQazdQYzlMYnJKM0tnZWphRE9ycVBkWndXM2ZtNklZbkRRVGg3WUxTZXRE?=
 =?utf-8?B?ejFnL1Myb0dBbWJGZ1VWTHo5SUJ6WHIzbmhuZkR2MkMrRERuelpHSVM1eDlS?=
 =?utf-8?B?OHhRaUNUTVVTRDZ1eUMxLy9jblg1L3djSitNNEFiOGcyV2NYWXYxT3RWb1RM?=
 =?utf-8?B?RXhwUTVnWkZvaTlmOVB0RG1wNUtvaDhwMVp6UEFOSFNreCtwK04vZDJQZU51?=
 =?utf-8?B?QStOVTUxajR0ZzU4VTd5MXlrak1POHloeTFXay9LbXV6OWE1bUJMWmNVR2VV?=
 =?utf-8?Q?4BEHh2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzJRVWx6b2Evb3JWaDBta2QvTUp5Q2gyOEFmSndTSlJKVjFTbEFSN3oyRWFE?=
 =?utf-8?B?bHpheFM0SDB1VWxDYnR1NG0rZlo3dmtyTjhvUjNtVGVxamJSR2hIeUZtNXJ3?=
 =?utf-8?B?ZXFxbXZNczRJYnJKblRxOUFrYkdKeU9UdTd3b2VQUmw0YVdJVmJ6OHhGMzg1?=
 =?utf-8?B?dXlCeVhGN2xBQVNqejFBbzNxSjV2azBubExiVi9LNjZQdXcvUVdoaTJiTVhC?=
 =?utf-8?B?TDVEdCswcGNFVjZuTlBoeFNNMXJZejFsWXV5c1pQQ0RQYmxmQ2pCcW4vWEUv?=
 =?utf-8?B?M1BET1dsc1Q0Ly9HVm8vZWtXSFRONVFhcGlLdlFINmlsMXBETVpMbHprS2lt?=
 =?utf-8?B?dnoyOVU4YTZPcWVmYk9ILzlSakRpeUhjQXVXcm9ydlVqaFJMYmxYRHZRbnNB?=
 =?utf-8?B?U2QwL3VFWXpaMTI4a21pRVJ5UXg3VGowZXQxZGtEeUpFdDFxTE9LeUhOSVIx?=
 =?utf-8?B?RkhxTUJGbVk1b2FQTFA2dzdkaGJtYUs4eHJPKzdPdWFPN1NUWEYrUlBUSkN6?=
 =?utf-8?B?ZHMvMUZsVlNqQm9adWRFeEtoaWRnM3ErRVJRdUZ3Rmg3bGNueHR6U0d5SU1F?=
 =?utf-8?B?OHcyeDVoWnhHbzgzTUJkZ1huSEZLdzNtT3RlbnBHM3dBbUFpV3lsekVlcHhK?=
 =?utf-8?B?dmdNRlhlSWlHdDJGRXd0ekkyaVlaUHhHc2dEbll1S1RFbUprclcrcENZQkc2?=
 =?utf-8?B?bHNPSWUzYi9KZTZZSm1yV2tzSzJ4c0NHVEJGWmZVYU15MjdjQ1hURmE5UXRv?=
 =?utf-8?B?N1BnWnV4Nk5rOGZmeEdMSjBRR25UTUk5SzhiaFlHNVFsQXA5VDV3RGlXTmJO?=
 =?utf-8?B?b1B0NWt2bzVkSDhyMDBiVUdCa0Q4YVBESWFQc3BnSmNnL3VkOTlMRWx4R1g5?=
 =?utf-8?B?ZnE2Ykh6MXhUeTlQcFNzTWxNMHJMeU9MK2EzTkJqbk1Nb25QMGdrU0hqOEFK?=
 =?utf-8?B?OUd4amV6ZFdmaTVxNWlxRHdveHo0K1o3cHlZbzNMYXpMWkhRL1RzaDBhdS9q?=
 =?utf-8?B?SFZ0dUZwZGZkbnR2YXY2aVZOSlhpMUh3Z0xLTlU2SU12RzRKTURROGJPUjdB?=
 =?utf-8?B?c2JhQkRMTFlENHJJVlV0em5hTnRUeTBadGs3bmtZN3p6eVUvdkhVSzJjQ1JC?=
 =?utf-8?B?dWN5UExhWkZwTWdEZ3hrK1RWQ3VseWlNa3ZTUmQwWWRSb3ZyQml0UHFPRE9S?=
 =?utf-8?B?YWVjVWVXeVIwNDhWVWJBUmpqQzczeXJIZ1hxSGt0OFI0VEhLQ084MkdEZHlw?=
 =?utf-8?B?NnM5TWJ0b2d2dExkcGx3c3R2cE9ESW5Pcmw3OTM1TlVLUFhQZEUvUUxJUWVU?=
 =?utf-8?B?RjFKM25takl4OXg4SFFXTlNvbjhtQ0dlNWxyZUlUTTF4V2dHbE5lMVI4ajNy?=
 =?utf-8?B?VzF6SEM1ZzA5bDJadHlxRmw1Qk1FZVdSaEtxRUVhNDFpeCtNTW5tSlJVWWd5?=
 =?utf-8?B?ODc4S3R6bkVRTFpWMjYyMjZ6RUNiaTY3RUxuUVZyejdJU3gvTTRzQTQyWEd6?=
 =?utf-8?B?OFNjL1VXYXZtdlk5b3Izb2VPSm15ZEpGOUtyb2p6RE1pczZWczlGbElyc0ty?=
 =?utf-8?B?S1FzT2x4RVIzUVBOVXlNZ0FnSUFxOGJPUjBxc1hzVnBCK0txS2w3WkZHWEJD?=
 =?utf-8?B?QUNwWjZ5aDRzUzNKaDJTdVZDTXcwYW1ySjVjckNMb0x6eU1YWE9yOEJnbytF?=
 =?utf-8?B?TjJrZE14bTM2N3JYdGVIL2Q2TysvMTNQNGx4b1JjYUR3QVZYelBOSEhpbGw2?=
 =?utf-8?B?Y0Jta1FwQnVYQ3ZmK0N1UUVmNWdTMjIxRXhsanRwZjhTdG1SL0YybDNGM2hu?=
 =?utf-8?B?eXNsMUZCSHlnYmppTGE1dnMwQitJUTVtY3R4bTAvK3BPTXAxNXg5ZHNmb1l3?=
 =?utf-8?B?ZnJFTC9tMU82RFBEdVJSS01qUlJYRzNIZjdUU3lNZUpabExFcnZEdU9GVUFX?=
 =?utf-8?B?Yy84YzNLNXFjNXFLVVRKbGc1Q1NucFNiVWJxdFJpSFdqMi8rclFyalFUcDZQ?=
 =?utf-8?B?UnVBZVVmWnE2b2Y2eFAyMGpxektzdkhWYUVaMWVIQUVXNzlEOVZya1M0Tk04?=
 =?utf-8?B?YVJ2anFxajNoS3lvaWw0QlBOL1dqdlR5OWNEbDZMVzFXZVloVllCMUk3UGxq?=
 =?utf-8?B?NVNDUURSNDhOUlJ0NjRocElPbi9yYTZUQjlLc0d2cytCODlLdTZzazFLcW41?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EB1FEC9551E95E4AB5E644668A022C75@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rsEMxnFsLzOZP2pGjLG1qTXjGdOC/G8OOINNvsD5kTssmmhjG3/KazfZBCakdxppjUDnjsz8k36Q2D1gV2FMpLhr5WkIHcChs6p8ytoB2TR25h7vKMhmAGF4ilAuFsiSYQ7Pdm9zNKnO4FT7CHs4HIxKAIJCFZdufhOoWR6YuVdig8jBx6bOmtuRPNpJBEWgpeOuzey4qXq/v1bpFOdvsr8W+cDHu/lUREHtZk6KpWy/wxVITRP7UacAwhyaeof8Tl8pU9DozPRDZDV4kud8T5IdsBr55gnbxlgZq99LMtUh6CaJCXd0XmMKyI2CCqg1L2cyDXKHoicMmjb7Ja4ua8lDk8xamTb1KUwHAAYG+tsHGDpKvDE4K4RPav+H9tgCjKvTbr6mDRp9Pn4qxaE/Xz0jacbDfF/bPZKcUyerw8b384GyDJnITNV+tH5cJiMoqvYPTbQDO602UqrZZTbT/Lf3qVIOyfbvLftA4kraRUWwviwCUHrpXDO9M1tZkZHPELjVwVwOQ9r0V9dhplILo8wDqe+gHu82D5P5/kyNgnO64QKCSYdWnuEEPlwmlOePCviev58WPu0hD1VoYMk8EL34SMeM72cMTOZlkt5Ij69CSVtzXtrVCPeiEoGUiEsC8eLwINj9NEVi7wu1JvssXA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2c6b79-bb2f-4384-2848-08de315a8210
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 04:23:13.1541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KfndJ/P4gjXxmGOSnLyMDQm6UvwJW81dpGf3vuXJz+9SViW1lhPGAAC9mAzi3g4EAhNBL8WiMTEd85eJlDrkDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7247
X-Proofpoint-ORIG-GUID: 8l65u9mBgk7RklkhFtXUAs6DV6DiPpnO
X-Authority-Analysis: v=2.4 cv=AvrjHe9P c=1 sm=1 tr=0 ts=692e69b8 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=o9hbFUtHCZPa0_sei78A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 8l65u9mBgk7RklkhFtXUAs6DV6DiPpnO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDAzMiBTYWx0ZWRfX2RfPWEdGGuLd
 sb1aFa5w1s70uGIQjuji+0WZkum8PN+ZYHLptpZyFdIGHnGVDUE9LsxmBVOX9Yvw+7fqIkDZ6Ak
 k2gqT0PxG/pYlJ2EBpgsAoT9m7/UhScW0jO8idTB5weiBB1wwvrmwsf8nmX8WDjYPeQc9J9Rxwg
 eRH0hI0f9DXKXkjsm26L91shnTYnDMzmNyfXFntgQTUdJF9fuZCJgH5JYn/E53PQXzW+nVur01j
 dbvE3ZbhbTDKyLrasKD6AqDPpqg2zrR3oc1lfJGu72G4bZ2n5gZXtgE9d/Odn4K0FKmPlYSTnBZ
 Sc2s5F+3cB9drPlhjIGwbLi+CC//zb3C7qB8S1RskOd+VMrc4avmxkaaL9gIqjJgwHyVjfHkwn7
 T81KuqWe/4oYW+5fkPwA1dHMANsccA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512020032

T24gTW9uLCBEZWMgMDEsIDIwMjUsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIE1vbiwgRGVjIDAx
LCAyMDI1IGF0IDExOjI5OjE0UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBG
cmksIE5vdiAyOCwgMjAyNSwgQWxhbiBTdGVybiB3cm90ZToNCj4gPiA+IFRoaXMgd2FzIHdyb25n
OyBJIGhhZCBmb3Jnb3R0ZW4gdGhhdCBHZXQtU3RhdHVzIHJlcXVlc3RzIGFyZSBtb3N0bHkgDQo+
ID4gPiBoYW5kbGVkIGJ5IHRoZSBVREMgZHJpdmVyLCBub3QgYnkgdGhlIGdhZGdldCBkcml2ZXJz
LiAgSW4geW91ciBjYXNlLCBJIA0KPiA+ID4gZ3Vlc3MgdGhhdCdzIGR3YzM/DQo+ID4gPiANCj4g
PiA+IEluIHRoZSBjdXJyZW50IGtlcm5lbCwgdGhlc2UgcmVxdWVzdHMgYXJlIGhhbmRsZWQgaW4g
DQo+ID4gPiBkcml2ZXJzL3VzYi9kd2MzL2VwMC5jOmR3YzNfZXAwX2hhbmRsZV9zdGF0dXMoKS4g
IFRoZSBwcm9ibGVtIGlzIHRoYXQgDQo+ID4gPiB0aGlzIHJvdXRpbmUgZG9lc24ndCBoYW5kbGUg
R2V0LUludGVyZmFjZS1TdGF0dXMgcmVxdWVzdHMgYXQgYWxsOyANCj4gPiA+IGluc3RlYWQgaXQg
cGFzc2VzIHRoZW0gdGhyb3VnaCB0byB0aGUgY29tcG9zaXRlIGNvcmUsIHdoaWNoIGRvZXNuJ3Qg
DQo+ID4gPiBoYW5kbGUgbWFueSBvZiB0aGVtIGVpdGhlci4gIE90aGVyIFVEQyBkcml2ZXJzIGRv
IGEgYmV0dGVyIGpvYi4NCj4gPiA+IA0KPiA+ID4gRml4aW5nIHRoaXMgc2hvdWxkIGJlIHByZXR0
eSBlYXN5LCBidXQgSSdtIG5vdCBub3QgYW4gZXhwZXJ0IG9uIGR3YzMuDQo+ID4gPiBUaGUgbWFp
bnRhaW5lciwgVGhpbmggTmd1eWVuLCB3aWxsIGtub3cgd2hhdCB0byBkby4NCj4gPiA+IA0KPiA+
IA0KPiA+IFRoaXMgaXMgYSBrbm93biBpc3N1ZS4gT2Z0ZW4sIGhvc3RzIGRvbid0IHNlbmQgQ2xl
YXJGZWF0dXJlKGhhbHRfZXApDQo+ID4gdW5sZXNzIHRoZXJlJ3MgYSBwcm9ibGVtIHdpdGggYSB0
cmFuc2Zlci4gQmFjayB0aGVuLCBJIGhhZCBpbXBsZW1lbnRlZA0KPiA+IHN1Y2ggdGhhdCBDbGVh
ckZlYXR1cmUgcmVxdWVzdCB3b3VsZCB0cmlnZ2VyIGEgZGVxdWV1ZSBvdXRzdGFuZGluZw0KPiA+
IHJlcXVlc3RzIGZyb20gZHdjMy4gSXQgd2FzIHRvIGludGVyLW9wIHdpdGggV2luZG93cyBkcml2
ZXJzIGZvciB0aGVpcg0KPiA+IGhhbmRsaW5nIG9mIHRyYW5zYWN0aW9uIGVycm9ycy4gVGhpcyB3
YXMgdGhlIHdyb25nIHdheSB0byBnbyBhYm91dCBpdC4gSQ0KPiA+IHJlY2FsbCBhZnRlciBkaXNj
dXNzaW9uIHdpdGggQWxhbiBhbmQgcmV2aWV3aW5nIGZ1cnRoZXIgdGhhdCB0aGUNCj4gPiByZWNv
dmVyeSBtZWNoYW5pc20gV2luZG93cyBVQVNQIGRyaXZlciB1c2VzIHdhcyBmb3JjaW5nIGFuIG92
ZXJsYXBwaW5nDQo+ID4gY29tbWFuZCBmYWlsdXJlIHRvIHRyaWdnZXIgdGhlIGZ1bmN0aW9uIGRy
aXZlciB0byBkZXF1ZXVlIHJlcXVlc3RzIChub3QNCj4gPiBjb21pbmcgZnJvbSBDbGVhckZlYXR1
cmUgYW5kIGR3YzMpLg0KPiANCj4gQXJlIHdlIHRhbGtpbmcgYWJvdXQgdGhlIHNhbWUgdGhpbmc/
ICBDbGVhci1GZWF0dXJlIGlzIGRpZmZlcmVudCBmcm9tIA0KPiBHZXQtSW50ZXJmYWNlLVN0YXR1
cy4NCj4gDQoNCkFoLi4uIEkganVzdCBzYXcgdGhlIHN1YmplY3QgbGluZSB0ZXN0dXNiIC1FUElQ
RSBhbmQgYXNzdW1lZCB0aGF0IGl0J3MNCnJlbGF0ZWQgdG8gQ2xlYXJGZWF0dXJlKGhhbHRfZXAp
Li4NCg0KVGhlIEdldC1JbnRlcmZhY2UtU3RhdHVzIHNob3VsZCBiZSBoYW5kLW9mZiBhbmQgaGFu
ZGxlZCBieSBnemVybyByaWdodD8NClRoZSBnYWRnZXQgZHJpdmVyIGtub3dzIGFib3V0IHRoZSBz
dGF0dXMgb2YgdGhlIGludGVyZmFjZSwgbm90IFVEQw0KZHJpdmVyLg0KDQpCUiwNClRoaW5o

