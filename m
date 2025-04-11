Return-Path: <linux-usb+bounces-22930-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4C1A8513C
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 03:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D233B4C09F6
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 01:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD7E277031;
	Fri, 11 Apr 2025 01:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EsweNVsk";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="OQcMyM2Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="oxswATwf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B29270EB9
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 01:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744334869; cv=fail; b=lLmtgMM6rqQKheQ1hPpgnH44txlKhdo69qzlu7w1iNS/jtmrLTKduUiU7MKwF2RJy9TDH9N9nmp3RNjAx4Oh0E9QfqsPodzA1pWDK1iY0u+dMYnj8Pffxoblg+38YlMUzPsHRbpXtDkfxRlSFrHVDjAfz8U/9ggx7wHqR3uPD2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744334869; c=relaxed/simple;
	bh=S1XuPAnyesa7xK+KwwH7PRwvyhd8AksVkhKwPY0xvv8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Dnx+RtxtzUmgFEtLRmnkpBkcYQD+KyD76TnXKADqDIHL4JNWBRibSL4iTN/0aPWqwRazHISsCgpKQjy9V26v93+72o0ZQY74VCNkfppM8k1qvYvyatSyW8nHs7pTSL38g0yRjtvXyC9RD/gBYeo7Hv3TKovfHoAGbwUiiKoTsiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=EsweNVsk; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=OQcMyM2Z; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=oxswATwf reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1MOAR014559;
	Thu, 10 Apr 2025 18:27:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=S1XuPAnyesa7xK+KwwH7PRwvyhd8AksVkhKwPY0xvv8=; b=
	EsweNVskLkRFJATgXMstsOiN/AKhecnhGG/HVi/t6gb+IAegnE/pSmWZ9g+AuqB4
	GjZ8N2TwYYzxzldBLE7TYms3dIcg+xeyoC/v7aLnBJlu96iwjMsz7gDuGOQF0WuT
	/mTAhMlZ5U0m3/+tIdXfnFBnbALjvGAz4QlYV5jt6u3AwW1HP4y8DeG6iw8zWCue
	epWA8tJBxPe5yokEs/d4erbHOS9v4hM9ZVQuTZIS8QK1imc704CVFxlXNyncUuvr
	Ph6rCZQZwop863cQrI4kg2HHytndbQW5FCJsZaq1aZtldcvVwPCwWl0Yt7HANxBu
	PZHjXj32wsOhIINp3gABTQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 45u3evqab6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 18:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1744334856; bh=S1XuPAnyesa7xK+KwwH7PRwvyhd8AksVkhKwPY0xvv8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=OQcMyM2Zb6WZmODRyK/ctTvrPaYB1XWjJePd/VG0cGjshM2ji+t1oM43XrGocy3Tn
	 FlsmaLbkwzG+6GkV7AxvrdZR1F27UUE8c4TlHSayVh2oR4M7JGTs1F/njVdbwPLCKh
	 w5r8dF0Sw0mX3ksaDHOIlktfHXQRTgOydqBfq1/LUH+liVlKUGNwpkmJppO8t3ZnvX
	 ySUxBPmcOic0X7x/GP90zBVoEJtP2/i7Fn6WkNt1Bp04YMEvrcwnZ+rhd+8RR677rv
	 KIvhfT6DDFSgs7mu7Rt38RBFCuP39LqC21hLP/0aCYhqbDkUCZzvlxXXMmUDio8dD/
	 Mml7oaI42Pyig==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CC37240114;
	Fri, 11 Apr 2025 01:27:35 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C22E5A0070;
	Fri, 11 Apr 2025 01:27:34 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=oxswATwf;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id DDB014021B;
	Fri, 11 Apr 2025 01:27:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nX5TZkHlu7CuumI08a/dPoyOAWZ6VvrEbQjp7GOop41O5ejjeAC8a6NQgkXo7lR6XVOkKC3HOc+oJpqBcc/fb9r+8NyRtOwJGlH4XjEV9bz+HQw/OKVnehopM78FZp+qmxCjSDPyzv16fYONeWGbiQAMnyk6udrcKEjjhVDOJ97swCimozI9z+yW4RYegg20P/u3VL7zbuDT0oWj6dH3wTp14xDUPnaq8SKkRcLGZRFAxcOybW2u30cuy4kBeDwnK/S4G1UsEWjXXwzVY/ZkVtT5Bui7uAxzV8rWBTiXhqPdCo+/QPPongTj6mj9NhRmTcpqDi6H/wLBlrvCWRc/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1XuPAnyesa7xK+KwwH7PRwvyhd8AksVkhKwPY0xvv8=;
 b=bWspbRg4paC9z3CVf65tpb5oAwJaiYLZrNcAxGo4Jw4tsm0l+xLeEcn8hLrXgpaNpLeZdYCk9SNxFgRClIa19og8lKsk6fYdhdaS8NZtjwQbD6jMKW5d5P9CgRov+sk7g9uc7v0NN1wbnLTuhXfQeuxpYIdeG/yVv1RQrG2p7uExkkA4bFluZs5IZDce+7mp2PPySmUTwNdDfyLuqSoRi7RTkaE9neYGk9dsXA3cF95TKTvGfZdY1Va/CVPegI7y5m3XtAz7CvDz64pc5+WkygE1dl52Qe0Vh/oax2DDW1BwmYUwpGt2q3b70wmR1rhYf5D8h6ogzJubXoGH2h7D4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1XuPAnyesa7xK+KwwH7PRwvyhd8AksVkhKwPY0xvv8=;
 b=oxswATwfbaN+G3e3HR0DyJIen51GTZ1LnD6z36fu0k4SPbmrMb0bSPFSu/Ve3fthATk3dlUdjXDHpZR4XUcwthq6WZRnTw3a7ZRzmo6BFde1wjLxMG+RGE0UgYQ8c0zGXPLSmavPPm4eWmSfsc6/lBrNq/GqhjXxgDyIfU2zvlc=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB8920.namprd12.prod.outlook.com (2603:10b6:806:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Fri, 11 Apr
 2025 01:27:30 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 01:27:29 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Frode Isaksen <fisaksen@baylibre.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Frode Isaksen <frode@meta.com>
Subject: Re: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Topic: [PATCH] usb: dwc3: ep0: prevent dwc3_request from being queued
 twice
Thread-Index:
 AQHbnyLuqf9Hu8uhE0ul0JwT/TVjubOPgwsAgADYZoCAAKFwAIABD9gAgAbixICAAIS9AIABJ6YAgAF/eICAAMoHAIAA3hSA
Date: Fri, 11 Apr 2025 01:27:29 +0000
Message-ID: <20250411012717.mbjeignuwpn633qw@synopsys.com>
References: <20250327141630.2085029-1-fisaksen@baylibre.com>
 <20250401234908.npkn5h3vdyefkvxr@synopsys.com>
 <26644fc1-98c1-4443-9809-b7e4d6cec2e3@baylibre.com>
 <20250402222128.2soczlkfwonz7r3p@synopsys.com>
 <cf51ea66-24b2-49f4-87ec-5165249d53c5@baylibre.com>
 <20250407234337.ejaghhulwqumbk3j@synopsys.com>
 <fa1b7d70-b40c-48cd-9dbe-61b6cf6f8d6d@baylibre.com>
 <20250409011652.kr2q7keumvykxser@synopsys.com>
 <20250410000921.6zffl57kpqbrw7rf@synopsys.com>
 <c4db0757-4a64-4622-86b7-ca6c78c3c670@baylibre.com>
In-Reply-To: <c4db0757-4a64-4622-86b7-ca6c78c3c670@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB8920:EE_
x-ms-office365-filtering-correlation-id: e6f5c4f2-e522-4b22-2131-08dd789806ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bzNEWjA2dHlNcGNkQ3N6VmN0SkdBWE1zSE1KejR0UzhjOE1KMTc3Zytlak5Z?=
 =?utf-8?B?QmU3L0VGK09YRC94WGk1S3dsdHlvZzdSeSsyR0hNeUxyN2pMTGU5cjN6YXNW?=
 =?utf-8?B?QkdIRDBmMFU1alIyZmJydFVQVThYQ29NY09IUmpDZmhFenBrb2czM3ZSZjFW?=
 =?utf-8?B?dE03T0lPSFlGWDBJYkc4ckxMai9xbWFKVmRqRGg2VDR1TUJiQU5KZU9VM0J4?=
 =?utf-8?B?SHdHRmRnQ1l5cE5DM1BnZk00NEhiSzdUakx1Y0l4MWRVWUZUMlV5Ui9tVTJa?=
 =?utf-8?B?QXU4Vk5xZG1jdHRvNi9VeklleTZGM1VSeVdHZWJUQkIxbU1zcVdtZmRiVm1O?=
 =?utf-8?B?eUdHdkJtRFhIZXhDU3Qrb1B4aU9Wcmw3TCs1UEZoNkN2QTQwWGE1eHZMejVt?=
 =?utf-8?B?bld1U0JZRGFCZkxLakM4ZFRjTWMvQXRjR2F2dTF1QlN1OGxEZkgwdVdubEpO?=
 =?utf-8?B?ZEo1YlhIbGVoSFhwZ2VTL2x6SWg1dGZWb29lVFRHZW56cEhoR2U4T3hRWkJk?=
 =?utf-8?B?NUtXNkIrVHNhYnh1N1VhVlBRU2lHOFY1SmhjcVlzd1NTM1llbFpXc0RibWda?=
 =?utf-8?B?L3BLc2xjZy9QSEdQenE4YitTSFIzUjJKTlh5S3I3ZkZqdHErVjZPa1Y3Mkl1?=
 =?utf-8?B?UlYzL2Z6SzF1L1RpZHJhcHQwOUVGcUJOc0RQRjNSUXJJTVhyUEk3SXRJYWJi?=
 =?utf-8?B?VUcvdXVTTlhUcU56VkcyWmNSTG5FSVJBYXA3RHhaS3IyTFR1YUFPRjFlSjFw?=
 =?utf-8?B?YWwyTWt1NXIwZ3lZSmJ1azVna016eHNZb3M0NTBXYm5qMW1md3RuY1BMaGlX?=
 =?utf-8?B?ckVBbmZmak5GTEZuc2JNNEFGWHF0L2FwNUZ4b2t4TjRmVDNJeERWWHMyQUdN?=
 =?utf-8?B?NXlLYXRpdlpyL3I5VVVvUzhPR1NzR1JvSkYzcmNhZzE3VDhYb1U4eFdTNENN?=
 =?utf-8?B?TEFUVHF5ejZwOTQzUlZCVklSZ3hLckxyVzhkRXBXTUhQNGgrSldKWnhqQjJR?=
 =?utf-8?B?YnIvSUlHaUFxcUlHU1QvR2J3ZmQ4ZVg1M0V2SUJqSTdtVVZDZzVndVMwdlZU?=
 =?utf-8?B?UVk0d0FPYWFKeXQxSGNEbk9xbkZPWnhQQmpIVFFXVmZhNXp2dUZmTE51NHFU?=
 =?utf-8?B?UHZiVlcvL3kwdmdzMDBmU2hzUmphR2JRYWNUVjNCR1NzU3JBZENyRlhtZnRW?=
 =?utf-8?B?dStHUUFPUGg1MXArUCtmWGJnbWkraXhmZlpCU3RNY0UxQXJLa1lCSWZFVTBC?=
 =?utf-8?B?L25qQlFad1lXakZMVWpjb0dDaW5NTnBReTJoVml6WlNPNk1KR25mZjdPNUFx?=
 =?utf-8?B?ejBBNHFFUEdEY3RFLzhkakZtMEZORnZMeEpCTnNnbVl0eDBhVWJOcVFQUEht?=
 =?utf-8?B?RFNhNEhIMm90TDJ3NEJHZGU3d2xtcjdaVEc2d3BOVHEwM0ozZE9vcG5rVm1p?=
 =?utf-8?B?Z2dwUVdTWTl4a3ZyTXdXQTBtanVZMzBENGQ3TDRmS2hhanVUeW5UMkQ3RkRU?=
 =?utf-8?B?V0dvamlldlBORkNkR1Jzc09xT3hKbTRMc3RiOHFuVERpM2Q0TGNPYWl0TENn?=
 =?utf-8?B?WXhOc0xNUjFWZFR5YXJnU1o0enBNYWZNRlc2enNQMVNnY0FCSUFLbUxadjhk?=
 =?utf-8?B?eXRETTBvdDJpazRPeXNFUnFVSEdwQWJNN0FyMWlmWnB4RlFDLzM1NlRkbUQz?=
 =?utf-8?B?WjZQcE5pOEdxWnQvMjBXVUFTMlladEJZSVhwYzc5eXBJZ1hkMko4SlBkaDBR?=
 =?utf-8?B?a1d1UitvUDY4RkREVVFEK2d6YmVyQ1JkNXova3N5dkloc0dqYmN0bXJpSFJD?=
 =?utf-8?B?TTRNT0ZLYlZaKzNIUnkzaDN0cFl0MHBUeVJRRXByWjZ0Y0JsWm50aWVWaWlx?=
 =?utf-8?B?cW1GZ3Bsa0ZRMjBueGhCK2I3eEZCcG4rY09sOXVnYkdsT0VKWGJ4UDRTYW9Y?=
 =?utf-8?B?dlN5LytiT3ZPd1J3TEprZGVRL1h3MERVRDEyelFweVdXTklpcFIzaUxqTm10?=
 =?utf-8?B?dC83aXA2U3FRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDRTNHVNemdEYWxHQnlhYVUwWlVLVXV1NllCbzlsTUhqek5oc3Avc2pjVXRG?=
 =?utf-8?B?LzRSU0FPNmRhdmxXUVVGOW8xTE16YlZySk02ZFVBK2hxSGNFOUZRUEw1WCt0?=
 =?utf-8?B?T1Y1VkZVejBkc3JMaStrUU05cy9IMEh6WGN2bW5zRE0xNzVHVytTaS9GQUkx?=
 =?utf-8?B?SE9jUFE0eTgwSk5pVVZwdGhmQ2tHNDV4NDhtZk1GR3dma0NKd0h1dFJ6Umdy?=
 =?utf-8?B?cVVRSGNzd0hmSTRvN1FoODN6bjRKd0tRd1BoVUdBL2x1Rm1BcHgzaUEvQklT?=
 =?utf-8?B?T0pTcmliVWpyelIrWGU4by9TL1JLTXVLblQ2b3p6TEJmVUgySUxoWXlYblBW?=
 =?utf-8?B?ZVE1MC92ZWpZcmM3bFBsR1diRXg4UUNjYUtqc1dIUFhxZzdBSU4vd3ArSnlm?=
 =?utf-8?B?djFhUVJINCtRWDJ2MUxQc3ZUcFVSdnY4dFFaeHUxdlRjQ1BYeHcxUmwxcitu?=
 =?utf-8?B?aWZEbTV5VTlmWHEwdTFDRjBjUGJBb013TFkwcktLVGFsc3pOeEdmMWViR29t?=
 =?utf-8?B?OFBnb3dMV1p5bjFtK25XNkVzcjVRalJMQnRaZ3VyZE9FZW5KT01sb20xR3BZ?=
 =?utf-8?B?Z2V4bGVaOEtDR2R5Tm13cXQvOHVvWTJ4bmtJZlI5RTFjb3VwYkNDMGoxVzFK?=
 =?utf-8?B?SHVUTlExZ1kyMHN6V0RXN0luMC8raW1MR0Y1eDBXUWduREszYWgrYzdKWVVC?=
 =?utf-8?B?Zjhzd2pxYnllSTNudHR4K2xDSWtxN2xZcy9WWGEvYnY2U20vem1TOGNnUjl6?=
 =?utf-8?B?UGFQRzhQcVR0a1RFWU9rR1Zwb2ZDY1hSS2U4cUhmVjVXcC9WZDJuRkd1VnEv?=
 =?utf-8?B?UWpMQVhVbjBwY0xzMk81ZEdORzZmdDc4NEZhWEdwdXJYTytEN3pkRTR3NEp4?=
 =?utf-8?B?a21xQWtmZWNOSk1zczJCTTBXUE9Ka2ZTQk51ZWR3NmN3R1JacnZzWVhpS2NH?=
 =?utf-8?B?ajQ2aE1PMURvR1JneEFMV2R0M3JMWlBLd1lqY0l0K2JoYWVnTHhoQ2Z0dSs1?=
 =?utf-8?B?TCtxUUZvZzh3Rnl5MWQxKzJ3WGtrYnZxNzJ0SmdRQXBhQThTaUFFNlQzK0VK?=
 =?utf-8?B?WmpPL3Jwbnl3clZKNllOMUVSWTAzbUNaOGRnb0ZsZm1BejBrUi81Mk5lc2FD?=
 =?utf-8?B?dDJOeDM1TWg5MG90R052N0tPNHAzVUNNNVg2MmJRbXpHSE1xYkU3YkVrMUdT?=
 =?utf-8?B?OUsrWXdXS2ZDSmdtYmI4OUxpdVY1RnBpNms1My9RYVBaSmYydEdDUkVwL2JN?=
 =?utf-8?B?azcySU4rd3FuaWp6eU15d0w1ejVsU0RkWjRDWXVnUlRTQXM3UGp0OHRPNlFJ?=
 =?utf-8?B?dlFqU0Z4aCtDNlBlVXMwQWtFTDc0aVN1RFJmbjJpRU9PVUdPeW83ZXh0U3NC?=
 =?utf-8?B?WWJSMUY0MlRiRnZ0c29xVEhqV1lRQ1NMREJCemI5dkhKR0xBYXpoS1B4WWRD?=
 =?utf-8?B?aUludzgwY2dHUXZhcE9tNElmZUhrcWJKdkpKQ2pQQ3NuOFZRWFNDU05SY2ZI?=
 =?utf-8?B?eXg5UlNxd01HM0tScnA1MVVMRk9hbXhBMVAvWHJ3SWdTWFVQMW1ENlF4Qm1N?=
 =?utf-8?B?Y3crbjc1NVlhMGw4M2lTTHc4UVRVTEhJZXJzZndhbVNMYmRNUDFxZjk1ellH?=
 =?utf-8?B?OE9TNlRuakRQRzJoYWU3ZmFyZUw0Q2xQS1FHUGJ2bWtmNjlabUhUcWpscTVZ?=
 =?utf-8?B?YVd2U2VhbU1yRmsxejFwd0xyR05ub2tkQzQ1TUliQXlDMkFKMUNSTUNFQXl1?=
 =?utf-8?B?a0pFQkF5QWxtRkJBNXl6TS8vM0Njcy91VGJNVThXWGZqbFc2bmFuRWFEM2lX?=
 =?utf-8?B?b1J1aTBSc0NIZVZ4Y1E4Nis3ay9sU0xPNnF5VXpDTEpjN2NOYXp1QUMxU2cx?=
 =?utf-8?B?T2VRUERTeVltODdaUERrNVJrQUx1ZXkyeGtWRkZ3YVZDYVNCZ0FvRzVBekhU?=
 =?utf-8?B?Z29SRzVMSTk5VHFmWXFmcEgxY3hlMldxMUNRSm9tc2lXdkwreUZ6TjVycDN5?=
 =?utf-8?B?bnJvMGpNTVRHbjJHV2g3NEhZS0xUc1JDMEtzaHpITWJaU0tKdy9QN3g2bXZ3?=
 =?utf-8?B?aStJMDVUQXJLYXpKS2lTbVdPV0VCc1VuUWFsbDRlSWo4Yk9QUWdTd1ZaeDJM?=
 =?utf-8?Q?OarI+0dOzcmMScoquqCAHrcVU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <250A4748C260F348B373075956F98B65@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fHVAJ0k5vWIeI8Rnvg8i/ExGcgJBnyi0q/KZILO87MZXfBYOBDnbMTl/YVtLCGrduLmXJ4mLnw6Pr+m+xUnmaQrdXakNyUkZ44uKIhl2hZYIPeKKvmzFfHDfDTd6Eg+08ZL0hYufAih7j9M48zvV23mdvKVC/9QbGq3I9VisHqUyh9oC/tvXpcd1J3hADByjkj4CjADjBQUV4mfuuuaTLdWehK6Gk9Xmsg5lekVXDx5VXdy5gmYUcpSPc91Mn7/jUASXp9a5T4ZlfpCgSHNssbYBNeRzgmfc79u+ORSpzb0neGqvyeSKg8iTmniQBQsVV245h8Mp2dKxUZQhvoTfstR1vA5doO9n5w1w6A9ff6KYPPTsr89TqU6jlcle+mPmprNHNahADL3KoeqI5pQp39CmQtWn8pimuXj7S9KZYhZYxXXGNncTNhLIVPYE8g2dB3iPZcWoQeJ3hti+XAcwNtCWoUl0cIQn+goKkKQM2n6CCSUReRs/xIOv4y5uIBh4u/L0eqljZG/YlQoIoBZDQW/+w6OSaxlQJH+RXuXP6sfxi8wmcyBofdRUSr3DNkelOmWAYi2dpSYj5YkxezMXeR8RWAMq47UVfd9Za7dyZac3ekBcN9Aw+3+H6LOAcAzuBXOuSVC6cweWGkpEoAGKKQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f5c4f2-e522-4b22-2131-08dd789806ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 01:27:29.8613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qPzWsoCt663wuFK0S3RWdIENKhq6ScOZEMqxsX8xY73l8s0uzb60G/lMCzmR3iKD1rdYtgZAzaLZS4zXnXfwMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8920
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=67f87008 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=qPHU084jO2kA:10 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=0kljlgOlZIP7e1eBpRsA:9 a=QEXdDO2ut3YA:10 a=kUyRy_6n9IIA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: W1RCLbG0kV3J5BzJfJbR_155L_kwLB63
X-Proofpoint-GUID: W1RCLbG0kV3J5BzJfJbR_155L_kwLB63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110009

T24gVGh1LCBBcHIgMTAsIDIwMjUsIEZyb2RlIElzYWtzZW4gd3JvdGU6DQo+IE9uIDQvMTAvMjUg
MjowOSBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIFdlZCwgQXByIDA5LCAyMDI1LCBU
aGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gPiBPbiBUdWUsIEFwciAwOCwgMjAyNSwgRnJvZGUgSXNh
a3NlbiB3cm90ZToNCj4gPiA+ID4gT24gNC84LzI1IDE6NDQgQU0sIFRoaW5oIE5ndXllbiB3cm90
ZToNCj4gPiA+ID4gPiBPbiBUaHUsIEFwciAwMywgMjAyNSwgRnJvZGUgSXNha3NlbiB3cm90ZToN
Cj4gPiA+ID4gPiA+IE9uIDQvMy8yNSAxMjoyMSBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
ID4gPiA+ID4gPiBPbiBXZWQsIEFwciAwMiwgMjAyNSwgRnJvZGUgSXNha3NlbiB3cm90ZToNCj4g
PiA+ID4gPiA+ID4gPiBPbiA0LzIvMjUgMTo0OSBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+
ID4gPiA+ID4gPiA+ID4gT24gVGh1LCBNYXIgMjcsIDIwMjUsIEZyb2RlIElzYWtzZW4gd3JvdGU6
DQo+ID4gPiA+ID4gPiA+ID4gPiA+IEZyb206IEZyb2RlIElzYWtzZW4gPGZyb2RlQG1ldGEuY29t
Pg0KPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gUHJldmVudCBkd2Mz
X3JlcXVlc3QgZnJvbSBiZWluZyBxdWV1ZWQgdHdpY2UsIGJ5IGNoZWNraW5nDQo+ID4gPiA+ID4g
PiA+ID4gPiA+IHJlcS0+c3RhdHVzLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiBTaW1pbGFyIHRvIGNv
bW1pdCBiMmI2ZDYwMTM2NWEgKCJ1c2I6IGR3YzM6IGdhZGdldDogcHJldmVudA0KPiA+ID4gPiA+
ID4gPiA+ID4gPiBkd2MzX3JlcXVlc3QgZnJvbSBiZWluZyBxdWV1ZWQgdHdpY2UiKSBmb3Igbm9u
LWVwMCBlbmRwb2ludHMuDQo+ID4gPiA+ID4gPiA+ID4gPiA+IENyYXNoIGxvZzoNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gbGlzdF9hZGQgZG91YmxlIGFkZDogbmV3PWZmZmZmZjg3YWIyYzc5NTAsIHBy
ZXY9ZmZmZmZmODdhYjJjNzk1MCwNCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICBuZXh0PWZmZmZm
Zjg3YWI0ODViNjAuDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGtlcm5lbCBCVUcgYXQgbGliL2xpc3Rf
ZGVidWcuYzozNSENCj4gPiA+ID4gPiA+ID4gPiA+ID4gQ2FsbCB0cmFjZToNCj4gPiA+ID4gPiA+
ID4gPiA+ID4gX19saXN0X2FkZF92YWxpZCsweDcwLzB4YzANCj4gPiA+ID4gPiA+ID4gPiA+ID4g
X19kd2MzX2dhZGdldF9lcDBfcXVldWUrMHg3MC8weDIyNA0KPiA+ID4gPiA+ID4gPiA+ID4gPiBk
d2MzX2VwMF9oYW5kbGVfc3RhdHVzKzB4MTE4LzB4MjAwDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGR3
YzNfZXAwX2luc3BlY3Rfc2V0dXArMHgxNDQvMHgzMmMNCj4gPiA+ID4gPiA+ID4gPiA+ID4gZHdj
M19lcDBfaW50ZXJydXB0KzB4YWMvMHgzNDANCj4gPiA+ID4gPiA+ID4gPiA+ID4gZHdjM19wcm9j
ZXNzX2V2ZW50X2VudHJ5KzB4OTAvMHg3MjQNCj4gPiA+ID4gPiA+ID4gPiA+ID4gZHdjM19wcm9j
ZXNzX2V2ZW50X2J1ZisweDdjLzB4MzNjDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGR3YzNfdGhyZWFk
X2ludGVycnVwdCsweDU4LzB4OGMNCj4gPiA+ID4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEZyb2RlIElzYWtzZW4gPGZyb2RlQG1ldGEuY29tPg0KPiA+
ID4gPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4gPiA+ID4gVGhpcyBidWcgd2FzIGRp
c2NvdmVyZWQsIHRlc3RlZCBhbmQgZml4ZWQgKG5vIG1vcmUgY3Jhc2hlcyBzZWVuKSBvbg0KPiA+
ID4gPiA+ID4gPiA+ID4gPiBNZXRhIFF1ZXN0IDMgZGV2aWNlLiBBbHNvIHRlc3RlZCBvbiBULkku
IEFNNjJ4IGJvYXJkLg0KPiA+ID4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4g
ICAgICBkcml2ZXJzL3VzYi9kd2MzL2VwMC5jICAgIHwgNSArKysrKw0KPiA+ID4gPiA+ID4gPiA+
ID4gPiAgICAgIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCAxICsNCj4gPiA+ID4gPiA+ID4g
PiA+ID4gICAgICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4g
PiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzMvZXAwLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jDQo+ID4gPiA+ID4gPiA+ID4gPiA+IGlu
ZGV4IDY2NmFjNDMyZjUyZC4uZTI2YzNhNjJkNDcwIDEwMDY0NA0KPiA+ID4gPiA+ID4gPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4gPiA+ID4gPiA+ID4gPiA+ID4gQEAgLTkxLDYgKzkx
LDExIEBAIHN0YXRpYyBpbnQgX19kd2MzX2dhZGdldF9lcDBfcXVldWUoc3RydWN0IGR3YzNfZXAg
KmRlcCwNCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICB7DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAg
ICAgCXN0cnVjdCBkd2MzCQkqZHdjID0gZGVwLT5kd2M7DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICsJ
aWYgKFdBUk4ocmVxLT5zdGF0dXMgPCBEV0MzX1JFUVVFU1RfU1RBVFVTX0NPTVBMRVRFRCwNCj4g
PiA+ID4gPiA+ID4gPiA+IExldCdzIG5vdCB1c2UgV0FSTi4gUGVyaGFwcyBkZXZfd2Fybj8NCj4g
PiA+ID4gPiA+ID4gPiBJIGNvcGllZCB0aGUgY29kaW5nIHN0eWxlIGZyb20gY29tbWl0IGIyYjZk
NjAxMzY1YSAoInVzYjogZHdjMzogZ2FkZ2V0Og0KPiA+ID4gPiA+ID4gPiA+IHByZXZlbnQNCj4g
PiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiBkd2MzX3JlcXVlc3QgZnJvbSBiZWluZyBx
dWV1ZWQgdHdpY2UiKSwgc28gbWF5YmUgYSBmb2xsb3ctdXAgcGF0Y2ggdG8gY2hhbmdlIGZyb20g
V0FSTiB0byBkZXZfd2FybiBmb3IgdGhlIHR3byBwYXRjaGVzID8NCj4gPiA+ID4gPiA+ID4gV2Ug
Y2FuIGp1c3QgdXNlIGRldl93YXJuIGhlcmUsIHdlIGRvbid0IG5lZWQgMiBzZXBhcmF0ZSBwYXRj
aGVzIGZvciB0aGlzDQo+ID4gPiA+ID4gPiA+IGNoYW5nZS4gVGhlIG90aGVyIHBsYWNlIGNhbiBi
ZSByZXdvcmtlZCBpbiBhIHNlcGFyYXRlIHBhdGNoLg0KPiA+ID4gPiA+ID4gT0sNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gKwkJCQkiJXM6IHJlcXVlc3QgJXBLIGFscmVhZHkgaW4gZmxpZ2h0XG4iLA0K
PiA+ID4gPiA+ID4gPiA+ID4gPiArCQkJCWRlcC0+bmFtZSwgJnJlcS0+cmVxdWVzdCkpDQo+ID4g
PiA+ID4gPiA+ID4gPiA+ICsJCXJldHVybiAtRUlOVkFMOw0KPiA+ID4gPiA+ID4gPiA+ID4gPiAr
DQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgCXJlcS0+cmVxdWVzdC5hY3R1YWwJPSAwOw0KPiA+
ID4gPiA+ID4gPiA+ID4gPiAgICAgIAlyZXEtPnJlcXVlc3Quc3RhdHVzCT0gLUVJTlBST0dSRVNT
Ow0KPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAgIAlyZXEtPmVwbnVtCQk9IGRlcC0+bnVtYmVyOw0K
PiA+ID4gPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQu
YyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPiA+ID4gPiA+ID4gPiA+ID4gaW5kZXgg
ODlhNGRjOGViZjk0Li5jMzQ0NDZkOGM1NGYgMTAwNjQ0DQo+ID4gPiA+ID4gPiA+ID4gPiA+IC0t
LSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPiA+ID4gPiA+ID4gPiA+ID4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiA+ID4gPiA+ID4gPiA+ID4gPiBAQCAtMzAwMiw2
ICszMDAyLDcgQEAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0X3N0YXJ0KHN0cnVjdCBkd2MzICpk
d2MpDQo+ID4gPiA+ID4gPiA+ID4gPiA+ICAgICAgCWR3Yy0+ZXAwX2JvdW5jZWQgPSBmYWxzZTsN
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAJZHdjLT5saW5rX3N0YXRlID0gRFdDM19MSU5LX1NU
QVRFX1NTX0RJUzsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAJZHdjLT5kZWxheWVkX3N0YXR1
cyA9IGZhbHNlOw0KPiA+ID4gPiA+ID4gPiA+ID4gPiArCWR3Yy0+ZXAwX3VzYl9yZXEuc3RhdHVz
ID0gRFdDM19SRVFVRVNUX1NUQVRVU19VTktOT1dOOw0KPiA+ID4gPiA+ID4gPiA+ID4gPiAgICAg
IAlkd2MzX2VwMF9vdXRfc3RhcnQoZHdjKTsNCj4gPiA+ID4gPiA+ID4gPiA+ID4gICAgICAJZHdj
M19nYWRnZXRfZW5hYmxlX2lycShkd2MpOw0KPiA+ID4gPiA+ID4gPiA+ID4gPiAtLSANCj4gPiA+
ID4gPiA+ID4gPiA+ID4gMi40OC4xDQo+ID4gPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4g
PiA+ID4gSSdtIHN0aWxsIG5vdCBjbGVhciBob3cgdGhpcyBjYW4gaGFwcGVuLiBBcmUgeW91IHRl
c3RpbmcgdGhpcyBhZ2FpbnN0DQo+ID4gPiA+ID4gPiA+ID4gPiBtYWlubGluZT8gQ2FuIHlvdSBw
cm92aWRlIHRoZSBkd2MzIHRyYWNlcG9pbnRzPw0KPiA+ID4gPiA+ID4gPiA+IEkgd2FzIG5vdCBh
YmxlIHRvIHJlcHJvZHVjZSB0aGlzIGxvY2FsbHkuIFdhcyBzZWVuIG9uIDUuMTAsIHRlc3RlZCBv
biA2LjENCj4gPiA+ID4gPiA+ID4gPiBhbmQgNi42Lg0KPiA+ID4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+ID4gPiBXaXRob3V0IHVuZGVyc3RhbmRpbmcgaG93IHRoaXMgY2FuIGhhcHBlbiBhbmQgd2h5
IGl0IGlzIG5lZWRlZCwgd2UNCj4gPiA+ID4gPiA+ID4gc2hvdWxkIG5vdCBqdXN0IGFwcGx5IHRo
aXMuIEtlcm5lbCB2NS4xMCwgdjYuMSwgYW5kIHY2LjYgYXJlIHJlYWxseSBvbGQuDQo+ID4gPiA+
ID4gPiA+IFdlIGhhdmUgYSBsb3Qgb2YgZml4ZXMgc2luY2UgdGhlbi4gUGxlYXNlIHNlZSBpZiB0
aGlzIGlzIHJlcHJvZHVjaWJsZQ0KPiA+ID4gPiA+ID4gPiB1c2luZyBtYWlubGluZS4NCj4gPiA+
ID4gPiA+IFdlIGhhdmUgYXBwbGllZCBhbGwgcmVsZXZhbnQgcGF0Y2hlcyBmcm9tIG1haW5saW5l
IHRvIGVwMC5jLCBpbiBvcmRlciB0byB0cnkNCj4gPiA+ID4gPiA+IHRvIGZpeCB0aGlzIGNyYXNo
Og0KPiA+ID4gPiA+IFdoYXQgY2F1c2VzIHRoZSBjcmFzaD8gSSdtIHN0aWxsIG5vdCBjbGVhciB3
aGV0aGVyIHlvdSB3ZXJlIGFibGUgdG8NCj4gPiA+ID4gPiByZXByb2R1Y2VkIHRoaXMgb24gbWFp
bmxpbmUsIG9yIGFueSBvZiB0aGUgbmV3IHN0YWJsZSB0cmVlLg0KPiA+IDxzbmlwPg0KPiA+IA0K
PiA+ID4gPiBJIHdhcyBub3QgYWJsZSB0byByZXByb2R1Y2UgdGhpcyBidWcgbG9jYWxseSBpbiBh
bnkgdmVyc2lvbi4NCj4gPiBTb3JyeSwgSSB0b3RhbGx5IG1pc3NlZCB0aGlzIHJlc3BvbnNlLi4u
DQo+ID4gDQo+ID4gPHNuaXA+DQo+ID4gDQo+ID4gPiA+IFRoZXJlIHdlcmUgZmlyc3QgYSBXQVJO
SU5HOg0KPiA+ID4gPiANCj4gPiA+ID4gPDQ+WyAzNDEuODYwMTA5XSBXQVJOSU5HOiBDUFU6IDAg
UElEOiA4NTQ4IGF0IGRyaXZlcnMvdXNiL2R3YzMvZXAwLmM6MTA3Nw0KPiA+ID4gPiBkd2MzX2Vw
MF9pbnRlcnJ1cHQrMHgxZTgvMHgzNDANCj4gPiA+ID4gDQo+ID4gPiA+IEhlcmU6DQo+ID4gPiA+
IA0KPiA+ID4gPiBzdGF0aWMgdm9pZCBfX2R3YzNfZXAwX2RvX2NvbnRyb2xfc3RhdHVzKHN0cnVj
dCBkd2MzICpkd2MsIHN0cnVjdCBkd2MzX2VwDQo+ID4gPiA+ICpkZXApIHsgV0FSTl9PTihkd2Mz
X2VwMF9zdGFydF9jb250cm9sX3N0YXR1cyhkZXApKTsgfSBhbmQgdGhlbiB0aGUgY3Jhc2g6DQo+
ID4gPiA+IA0KPiA+ID4gPiA8Mz5bIDM1MS42NzQ0MThdIGxpc3RfYWRkIGRvdWJsZSBhZGQ6IG5l
dz1mZmZmZmY4N2FiMmM3OTUwLA0KPiA+ID4gPiBwcmV2PWZmZmZmZjg3YWIyYzc5NTAsIG5leHQ9
ZmZmZmZmODdhYjQ4NWI2MC4NCj4gPiA+ID4gDQo+ID4gPiA+IDw2PlsgMzUxLjY3NDQzN10gLS0t
LS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+ID4gPiA+IA0KPiA+ID4gPiA8Mj5b
IDM1MS42NzQ0MzldIGtlcm5lbCBCVUcgYXQgbGliL2xpc3RfZGVidWcuYzozNSENCj4gPiA+ID4g
DQo+ID4gPiA+IDwwPlsgMzUxLjY3NDQ0N10gSW50ZXJuYWwgZXJyb3I6IE9vcHMgLSBCVUc6IDAg
WyMxXSBQUkVFTVBUIFNNUA0KPiA+ID4gPiANCj4gPiA+ID4gPDY+WyAzNTEuNjc1MDQ3XSBDYWxs
IHRyYWNlOg0KPiA+ID4gPiANCj4gPiA+ID4gPDY+WyAzNTEuNjc1MDUyXSBfX2xpc3RfYWRkX3Zh
bGlkKzB4NzAvMHhjMA0KPiA+ID4gPiANCj4gPiA+ID4gPDY+WyAzNTEuNjc1MDYwXSBfX2R3YzNf
Z2FkZ2V0X2VwMF9xdWV1ZSsweDcwLzB4MjI0DQo+ID4gPiA+IA0KPiA+ID4gPiA8Nj5bIDM1MS42
NzUwNjRdIGR3YzNfZXAwX2hhbmRsZV9zdGF0dXMrMHgxMTgvMHgyMDANCj4gPiA+ID4gDQo+ID4g
PiA+IDw2PlsgMzUxLjY3NTA2OF0gZHdjM19lcDBfaW5zcGVjdF9zZXR1cCsweDE0NC8weDMyYw0K
PiA+ID4gPiANCj4gPiA+ID4gPDY+WyAzNTEuNjc1MDczXSBkd2MzX2VwMF9pbnRlcnJ1cHQrMHhh
Yy8weDM0MA0KPiA+ID4gPiANCj4gPiA+ID4gPDY+WyAzNTEuNjc1MDc4XSBkd2MzX3Byb2Nlc3Nf
ZXZlbnRfZW50cnkrMHg5MC8weDcyNA0KPiA+ID4gPiANCj4gPiA+ID4gPDY+WyAzNTEuNjc1MDgy
XSBkd2MzX3Byb2Nlc3NfZXZlbnRfYnVmKzB4N2MvMHgzM2MNCj4gPiA+ID4gDQo+ID4gPiA+IDw2
PlsgMzUxLjY3NTA4Nl0gZHdjM190aHJlYWRfaW50ZXJydXB0KzB4NTgvMHg4Yw0KPiA+ID4gPiAN
Cj4gPiA+ID4gPDY+WyAzNTEuNjc1MDkyXSBpcnFfdGhyZWFkX2ZuKzB4NTQvMHhkNA0KPiA+ID4g
PiANCj4gPiA+ID4gVGhpcyBpcyBhbGwgSSBoYXZlLi4NCj4gPiA+ID4gDQo+ID4gPiBIbS4uLiB3
aGljaCBrZXJuZWwgdmVyc2lvbiB3YXMgdGhpcyByZXByb2R1Y2VkPw0KPiA+ID4gDQo+ID4gPiBB
cmUgeW91IHVzaW5nIHRoZSB1c2IgY29tcG9zaXRlIGZyYW1ld29yaz8gVGhlIGNvbnRyb2wgdHJh
bnNmZXJzIGFyZQ0KPiA+ID4gZHJpdmVuIGJ5IHRoZSBob3N0LCBhbmQgdGhlIHVzYiBnYWRnZXQg
Y29tcG9zaXRlIGZyYW1ld29yayBzaG91bGQgbm90DQo+ID4gPiBoaXQgc2NlbmFyaW9zIGxpa2Ug
dGhpcy4NCj4gPiA+IA0KPiA+ID4gQ2FuIHlvdSBjYXB0dXJlIHRoZSB0cmFjZXBvaW50cyogZm9y
IGR3YzM/DQo+ID4gPiBbKl0gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZG9j
cy5rZXJuZWwub3JnL2RyaXZlci1hcGkvdXNiL2R3YzMuaHRtbCpyZXBvcnRpbmctYnVnc19fO0l3
ISFBNEYyUjlHX3BnIWE5OWVEeW9MUkFuOGJNZ242TDloWnIxZTBEdjIxNHhGLXdNR0tndzhqLW43
OGlkM3pSbU1ocGZHXzBzTllhOWdIZ3FnT3J0cXBiMnI2V1BPM2VSNDJsWkwkDQo+ID4gSWdub3Jl
IHRoaXMgcmVxdWVzdCBzaW5jZSB5b3UgY2FuJ3QgcmVwcm9kdWNlIHRoaXMgYnVnLiBCdXQgY2Fu
IHlvdSBoZWxwDQo+ID4gYW5zd2VyIHRoZSBxdWVzdGlvbiBhYm92ZSBhYm91dCB3aGV0aGVyIHlv
dSB1c2VkIHRoZSB1c2IgY29tcG9zaXRlDQo+ID4gZnJhbWV3b3JrPw0KPiA+IA0KPiA+IFRoYW5r
cywNCj4gPiBUaGluaA0KPiANCj4gWWVzLCBJIHRoaW5rcyBpdCdzIHVzaW5nIHRoZSBjb21wb3Np
dGUgZnJhbWV3b3JrLCBhcyB0aGVyZSBhcmUgdHdvDQo+IGludGVyZmFjZXMgWFJTUCBhbmQgQURC
Lg0KPiANCg0KT2suLi4gaXQncyB1bmZvcnR1bmF0ZSB0aGF0IHdlIGNhbid0IHJlcHJvZHVjZSB0
aGlzLg0KDQpCYXNlIG9uIHlvdXIgY2hhbmdlIGluIF9fZHdjM19nYWRnZXRfc3RhcnQgZm9yIHRo
aXM6DQorCWR3Yy0+ZXAwX3VzYl9yZXEuc3RhdHVzID0gRFdDM19SRVFVRVNUX1NUQVRVU19VTktO
T1dOOw0KDQpJIHN1c3BlY3QgdGhlIHByb2JsZW0gb2NjdXJzIGR1cmluZyBiaW5kL3VuYmluZCB3
aGVyZQ0Kc29mdC1kaXNjb25uZWN0L2Nvbm5lY3Qgb2NjdXJzLiBXZSBoYXZlIGEgbG90IG9mIGZp
eGVzIHRvIGR3YzMgc2luY2UgdGhlDQprZXJuZWwgNS4xMCByZWxhdGVkIHRvIHNvZnQtZGlzY29u
bmVjdCBoYW5kbGluZyB0aGF0IG1heSBoYXZlIHJlc29sdmVkDQp0aGUgaXNzdWUgeW91IHJlcG9y
dGVkLg0KDQpXZSBzaG91bGQgbm90IGp1c3Qgb3ZlcnJpZGUgdGhlIHJlcXVlc3Qgc3RhdHVzIGFu
ZCBpZ25vcmUgdGhlIGVwMCBxdWV1ZS4NClRoZSBjb250cm9sIHRyYW5zZmVyIHN0YXRlIGZyb20g
dGhlIGRyaXZlciBtYXkgbm90IGJlIG1hdGNoaW5nIHdpdGggdGhlDQpjb250cm9sbGVyLCB0aGlu
Z3MgbWF5IGFscmVhZHkgYmUgYnJva2VuIGhlcmUuDQoNCklmIHlvdSBydW4gaW50byB0aGlzIGlz
c3VlIGFnYWluLCB3ZSBjYW4gdGFrZSBhIGxvb2sgYW5kIHByb3Blcmx5DQpyZXNvbHZlIGl0LiBC
dXQgSSBkb24ndCB0aGluayB3ZSBzaG91bGQgaGFuZGxlIGl0IHRoaXMgd2F5Lg0KDQpUaGFua3Ms
DQpUaGluaA==

