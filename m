Return-Path: <linux-usb+bounces-11377-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 881A690C04F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 02:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC1121F22B6B
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 00:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996144C6D;
	Tue, 18 Jun 2024 00:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UK/nv4kx";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UVZN9U6K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ohYJakei"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F4C17E9
	for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 00:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718670388; cv=fail; b=ayd8JxXhGdaTnKPGz3x/z3mu9JlCMVg03ChluNJrVsXy4U83wNsVHHhq0wxMrmhneIsFFfnQ+ez3l6UB585Gq0uPrD82fMEk5ganOeQ6+NO4hMv7biv6O6Tv5cJ21A//zQHeWDabfjPHRGcOCWGGb94ypaQSz55NqNN0wkx8AY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718670388; c=relaxed/simple;
	bh=/gsBmDwXUG+9lTV7Asx0xyaSDOE/4Lccshjwyr+xvEM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H8YMRdkcei9KKgSZT0xR0BETrBLpNQvrkjV8bjZpOTZyvVk/9rDunGvw4o2UCbmxwuWsv4CFqTB6+r184mvqf5yDq+8st48p8z1m62YL5uHnyqTSXoU08lM1rSaPvBkuinJYSMRjJC7v+gst9GpRHFmLYkPEf34ZGxFVb+a2cT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UK/nv4kx; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UVZN9U6K; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ohYJakei reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HIUkQA032191;
	Mon, 17 Jun 2024 17:26:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=/gsBmDwXUG+9lTV7Asx0xyaSDOE/4Lccshjwyr+xvEM=; b=
	UK/nv4kxk3fXFt7oEDucI6LhEI8joVmHZ9AVi+9cQz3dwyotdBnMUZjuTY5Eoh+M
	sUAABGgGu1FvsguWJU3JfSao+XQ3FLGtWeAp0ei53v5aCpUsDNYMJ+q4I2/S8lW5
	Yv8IHout7dfOL3RHtRCYLoo/4dpX9GileYtYOzRR0LMDhDMgywlM66bmb5+4Cf3W
	jNizIbEKQ/9Wki6ZrWhoeq7et1MPjlUys+G9RDu1ojl/CazNEiIc5G2Y0dna89VV
	ZIwF+CFPiMPU9K1BITlwwqI8AieB7qVsV83bX82fvLOOFej8XkhjObrvFF0yR6mj
	0ht/g3fbv3NK+jCwehs8sg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3ys9kdgmyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 17:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1718670381; bh=/gsBmDwXUG+9lTV7Asx0xyaSDOE/4Lccshjwyr+xvEM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=UVZN9U6KDn1ZZ9X5hw8bk8ELZqTQSsU7YqunFI3tab2Cpz3v/VqHA9qjKJBI2v0hh
	 g4/dgpK6kywUhp6TRz0O993xTRtSWMi2PcU/W+4wBEnlASd2HNKo+ntvJnxOst8+Al
	 Qwa0cNlkq5CjqFLd9NpNgdbn65clNNJfjCpr2B1s5rdC0yBxEADeTdAlOlbd9NvYCS
	 XSw9veXDFlQz1yZBd9o45ek2UoHh8iivZ33/WKRtIWt3LalfOtamB1GyYWJPkout8g
	 EO/Vm/9ZtUF7ua+4sb65Q2O+RrABSfuhFIiOHsSUJy9KinJj+1IH82tLeEq7HFQLqc
	 u5r6rwuGkApsA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F07BD40141;
	Tue, 18 Jun 2024 00:26:20 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A24DFA005F;
	Tue, 18 Jun 2024 00:26:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ohYJakei;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 19B9F40355;
	Tue, 18 Jun 2024 00:26:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JECNZlSuK/kp649HX4V0rLRvilKWGkS6HeU9FMOuOOAYbNWuk/89LehQLxfJ+b1PMRunGGpu4MGqKAQJZC93ld9beNhV5jvUXGctEDdS5BcMHlD2zKHu0bmgKh8bqhzJwJlVovPPOImdD5Gx9pWzLPtKQodFCblo8zKv8SQHn7chBwi4i6co9byjaI/T/mUFg/F/d7tAwbrQA/9MSVYR2D5xDuSCyc6uqVLCSSqFrCDRlZOp+OoGWlgsy8RUbXGMgxtwNZbjvTGAxUoWXqXy46wvrcttQlpUpLJmzRUR7Gm9UvmNfvMad8OqemKcMSzGXJH/uLHuzSV9UxS81xlQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gsBmDwXUG+9lTV7Asx0xyaSDOE/4Lccshjwyr+xvEM=;
 b=dDAqpkE6uaIHIFrXrohMjPoIyjqC05I8qq4StKkdPY0xYmoFoBl1iHnIkhP27HfzzX316lZGz08fQ0/VS4hO9TuYzMxR2W0LajqGp/Ljzo1cqTV8DBlsf6frngpGRIzPb79Dju9Z32hvkZb09mtKG6ayXo5mJjqmbgJ3Mj4LIOE+1ns2th9sfaSyMQj8VHdgE056oHSnXLWmX22Reb41HHshPo7DPd6YlTXGvm5Te+qM1gxPll5p11Od1oGaFNwDcssaZE+C2UFHwHcmF6LI89odEt5+o3e8TWz3/XgZ81/0D4QKIiyBcjxyR1MuAG/GEwtP+We6j0JVyuYYL+Q7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gsBmDwXUG+9lTV7Asx0xyaSDOE/4Lccshjwyr+xvEM=;
 b=ohYJakeiJSHP1zYt/DhakitOEyGzNXjYEiWC4AUeQKlKifW03+5omUWam8qFxV/TwVQQr+v6uu6sfunrdFDiA9UE2JR8WpsiUW5J+C0dFc2fHrePFS48sQ4ry8Fimyf0z5tYdpWj+DFXz7s5TeTiu0YqKPha1eKQpsqLn2gYmmU=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 00:26:16 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 00:26:16 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Topic: [PATCH] usb: dwc3: gadget: Inform system of suspended state
Thread-Index: 
 AQHatbfXThCMnoxt4kuSB1VpY3Td2rG2ym4AgABJugCAASgMAIABAuCAgACmR4CAAPbwAIAAVn2AgACkcgCAARl9gIAFTzcAgAKm3ACAAIuQgIAHQ1YAgAAK/wA=
Date: Tue, 18 Jun 2024 00:26:16 +0000
Message-ID: <20240618002546.hsabtxmyp2qzlkey@synopsys.com>
References: <023d03d8-ef52-41e5-be9b-d75be49c615c@topic.nl>
 <20240606002805.bziyz3y4bcysdysv@synopsys.com>
 <d4322992-8aa4-4eb7-b7f6-63b1b706ad7a@topic.nl>
 <20240606202127.6gdk6v3jevrmoyzk@synopsys.com>
 <a630f365-7a7b-46e9-b5a4-9b150f31d74f@topic.nl>
 <20240607225731.2d24p4as4x7mrfaf@synopsys.com>
 <9eb64562-cbaf-4abb-95d8-5792d46bd63d@topic.nl>
 <20240613003204.beip3nbdl7h6zvsq@synopsys.com>
 <2e64b7a2-8d36-4bd4-8c53-2207c8a011f2@topic.nl>
 <20240617234624.bitqpa3brkgil6tj@synopsys.com>
In-Reply-To: <20240617234624.bitqpa3brkgil6tj@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|PH7PR12MB6858:EE_
x-ms-office365-filtering-correlation-id: 103b36ad-357c-4d27-1874-08dc8f2d445e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|376011|366013|38070700015;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZnZsSDRwTUo4OEhNbTRwSGgrL2hBTUkreXAzcTk3cytTTk9zbFBCelBaQTZY?=
 =?utf-8?B?aGhqaGJXaHlLRGoyS2x3WWpSbyt5OXdVa29WWkhJL2srb3FBZVYvcWVHUFp6?=
 =?utf-8?B?aHk3Q3gxL2k3cWtoSVlWUWJaekQ0d05lOGtzVC9oNzVnZUlKdm13czFyZWNv?=
 =?utf-8?B?amRURU5MSVQ0SXFVbFEwaTZWRFBUZ0F0LzkxdDBQTUlaUmgvRDdjZFVVWERV?=
 =?utf-8?B?cGZiSUhKR2tyWU5yN3hhZ0RLU3BkcFVBTjVFa2FsQll1STM1ZjdYUDRiUW1q?=
 =?utf-8?B?UEZUazNhZGxKMWtxbzZ1ZGYvQWFYdWE0M1hpanVwQ2tHZUJKbHJsNXZ0dGNq?=
 =?utf-8?B?ZE5FWnhKU0F1Z1lFeXdNUzhOanlpNk9JZkt5c3d4dTFoWTE3UjQzVXlkTFAy?=
 =?utf-8?B?QzV6SW1xcDBIb0xTUHY0UFR4UHVYSVpuNXNFVmZSU09GYXJNcm95WDdKUWZL?=
 =?utf-8?B?ZlhnSlNtbGEwRVBOL0l3M3FHMWNCU0ZITnVDb1ZxQXhKMWNJNDBFelQrT1Jj?=
 =?utf-8?B?akl0WDZKR2pRbW9uNUlVeXNWMUIxSEpvUUpyOEl2UURhcEdUeFB0aWtZMUhm?=
 =?utf-8?B?bGNuUHRxVVV2R25XZlA0cnhXTE1XUm85ekRRM1luNG0yVjh1Tm9lTWU2M0lE?=
 =?utf-8?B?cTV6N0c2THNJNTV2Z1ZxV0VtY2VnNjRtZFJ2NFh3UWgzY2ZUdEdqbFBySUJ1?=
 =?utf-8?B?VEtFNEs2TkhoWlBJM2tneTF2MVo0K2FxWmhPWjA1VTBPSHFLRC9TcUhaOWFZ?=
 =?utf-8?B?SENxZEJzUkg2dWJZUTFrdjVteS9KSzRYN2FiMnZ3TWRpNldPb3NvN1BhdXNK?=
 =?utf-8?B?T3ZNTENUaXQrU0xBUlZnSkd2NW1lZHNoUzJXUjNoNmFsUThtQ2hwa1VzRUVw?=
 =?utf-8?B?UGFXZE14UkFzdWcvNVdseVN0clBod1NmaTBRcVdYKzlZYWFteW5DUlRjSVo0?=
 =?utf-8?B?VzFvT2lqbXY0SU0yRWpQOHdBSGNkL2VKQkRwdVhhMzdzeTFNR2YrV1VPSUph?=
 =?utf-8?B?VXFnOTRYY09PcHBsT3JOQlg3WW9rSVJETi9nb0tJWlAvVnlyUlFMcTBoRGZ5?=
 =?utf-8?B?QjZaV204ZWdnUldZbkhnSUFMYURFZ0ZzYVNSSmJKNHZCeG1OYk1nbXF0Y1JF?=
 =?utf-8?B?d2MrVzZzeDRjZ1V1U0lSd1BQL3k0elBkVU5wOE9Bb3dWMjB5R0k1T3hXYzJi?=
 =?utf-8?B?NlFMNHliaGwvVmxwZHVFeXV2QmJpcjBaSXZjWGU5ZzM3QVRISjljV0lUTXFy?=
 =?utf-8?B?WldiMHcvWGdzcGx6dm5XTGdtYVpDWHJaMDl0eTVGRGVJdmRoekNKOVlDQzVM?=
 =?utf-8?B?UDdpcWY2YWdVUmRKSW9SU3lOenZPK3VtQzEvVEtlTFR4T3MraFdHNldZZUVV?=
 =?utf-8?B?R1RjaEVFRnBFVjd1SkhvMGdBZnFuVDdUQXU1MXRpU1Mwdkh2SlVRcVlhK1Ar?=
 =?utf-8?B?b2Vyc0F5K0pFYit5Y0dKUmg5a1pKNGpyaUxjL0NjVnpiVDJubkh0YVhoeFZm?=
 =?utf-8?B?b0dJRVBVSEVjc1BZdncwNENuZURTTThWWmMzN3FENlVPNjNZYlkrV2U4WWVv?=
 =?utf-8?B?bW1QU2Z1bkw1WjA1UExtZjBIN3RUVVdGY2lmMXpoWStXKzlXZ3orTGJGRFdL?=
 =?utf-8?B?QW5pL05RaytxdlRubUNBSEZuWlg5T0RONEtxSndyM2huSEFqRjkxQUJ2c3hl?=
 =?utf-8?B?eGFVZC95RFY1c1RJajNNankrL3FZQmdBM3lXc3h1QlRKTjJ4WmdxQjVLWXB5?=
 =?utf-8?B?T2VCb24rV0pvUlc0Z1RhNkUzazV5NXJXcHp0SzJTSXplVG1nZGtwY0YrdXBi?=
 =?utf-8?Q?BG0o+Z3UTZ1yFScnKtJlonh0wSvlARh2aGnnE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WDhYbWdYbzlLdEhrN0RPcXJiejdMWThrbWt2YzhoODMySEIvNm5xdjBuUzJR?=
 =?utf-8?B?a3QvY1ZpVkQvM216MzIwYUVzMWpKQVUxd3hJNThBREplK0VEVWY1UG5kQWcr?=
 =?utf-8?B?MlUwNXdkRkZFc281S3pBVVNpeDNhZ3BYYjI0SCtCOFBvTGw0L0dYRHY4cHph?=
 =?utf-8?B?SWpYb29SMmdXWDN2TjhRT1ZVZ1Z0NUhmMFdNM2x3Vkwza3F6VlUzK3oxR2Fp?=
 =?utf-8?B?Q3NWakgycy9yQ0Y1SFk4RGhDZ3FZR2grRmhScUttcURHaXdjYW5nVmZMZ1l3?=
 =?utf-8?B?L1FsVENuM0RrQ2JCTWRZMlprWmQzblB0NXVIT2FjZHRlODhHd2xDT0tqRGJh?=
 =?utf-8?B?d3lyOTFBbGh6aDM1TFljRFpTUWozVXhWUzZsZHNKQnZxYTZNcEJmYVVkSnZ1?=
 =?utf-8?B?WllVKzBRYTNTd3o3RjMrRWpKb3JtOHQ0OXFyZXhTd3YwZWFRUWNzZm9vWS9h?=
 =?utf-8?B?YW5YcmUvcm1nSmIwdTVWK3E1VEJFdkxocXJYQ21LZi94ZGY4OUkzWkN4dDRk?=
 =?utf-8?B?Q0hpdXpib2h2QjQzdXV6cWo2eFpQZU03ZWw0dUlOei93clZieGpxaDNtVWhQ?=
 =?utf-8?B?anAzcUZsbDVyZGhzNjhxdU9jbjIva2YzVFVtNDErdlk5aEZTVFZFMVFZbnVF?=
 =?utf-8?B?d0tlTDB2VHhLZ2c4aHJ0ajNzV09GLzlDWmxDYmp6N25tMkJjb3J2TGZ0am1z?=
 =?utf-8?B?bkExcFlQbXFTa1FzS3VTMWg2ME9BNlJzbXNsb0pYMzdRUDlzYk1qdFFCUWh4?=
 =?utf-8?B?VmxZOU5KVXJqSDZNVlhaWGRMTU1kdlplZkp3TXhUdHdPYWxidi80ZG80MmhB?=
 =?utf-8?B?aGhsdVJHclpWcE1Sc3hERFZqb0NUWUpLaThoNEYzZDM2RmoyNzhZeHNOSXFN?=
 =?utf-8?B?aTZwMUJxak9HQll4UVEwakloUTMxQVBKV1BoL25TSEo0NFBjMWRuU0w0S3I2?=
 =?utf-8?B?Y3ZzaEkwdXhCbm8vRE1Fa0JSbjdvUUtySW1uR1czTExYOVRDOEN1b1NIRjJ1?=
 =?utf-8?B?WUhCb0VKRk5hT00rd0pjcU1NWDZGU1FOUW45Y0dxa05PUEM5cmtBdTRNV0FH?=
 =?utf-8?B?QytPc3dlcXRIOXF3eGdNbGw5dEdrY1pjVmtBQVFhVnMxVzBXRkx5bWd2ZjJz?=
 =?utf-8?B?RTRTb0ljajMwNFQ3NXZjNzNDaUV1Ukl5VVJqQWR4OWFGVW5SbDdwZUtieG1H?=
 =?utf-8?B?bldSd2IvQVFVcUh3eW1tdmtsTTZiRk9oVlN0cTA1TGMyeHh4ajluUWhBMlhn?=
 =?utf-8?B?SGJIUDN3N2RuQ3pWK1ZoZEF6Q1lCaVlna0U5bXoxRjFTOWVWa05lT2c2bUdh?=
 =?utf-8?B?aXNNZC9aTnkxOGllNGluOFptZGE3T0ZFZ09wRXlnelRRcmpQaGRkRzRLWXhR?=
 =?utf-8?B?a081R2pSaFhzaEpHRWFQV21sd2RMMmdxa0F2a0FHUytoejg1MWpEMHFQSTBE?=
 =?utf-8?B?M3RJWEw0NnlZa29oczA3RStOekZpNXF0elhwWFAxbHd3dmZwWG1tNTBLVW93?=
 =?utf-8?B?VVVIVml4T3FCY0Q5WkhtVjRNZTB1UmFrb2tnNWwvS0ROZW01VEtFMElSQXZh?=
 =?utf-8?B?K3NmdE1LMUg3ZVVCRmhIUzMxNVdsTXVuZUxQTkhUMkx1UGxweDdyRlpqREZM?=
 =?utf-8?B?Vk5aL2x5eU85MDlId1NHYzkwL2s4S2J3WkZaYmhtbzFRQkhSaThlbnZrb0Vn?=
 =?utf-8?B?YWJpS0JBQ3ZkUlNWNm8zQTBzVUtZYWxWenoyS2lWKzErazkwZm1BQUdMTXow?=
 =?utf-8?B?QnRrcDZhdnh6bmQ5QVIwYzd3d0daTUo5eWdraGVDQzFhdjJDU1JkVTcycTc2?=
 =?utf-8?B?ZExwRE1oTk1GTnViQTJjcUY0Tmk3eWNlTXJ6bTFEaGd6QkJEZ01PUERFdUZX?=
 =?utf-8?B?YStmTDE4TVNDS0gvUHJneCtQbmxzYVNjdkY5ZklvTkFmayt5d2dTY1hPdWhD?=
 =?utf-8?B?OHQ2djNxZHVjM3JXaGE1Skk2K2IraVljS3RBdkVnNFNuS1lhRWUwM1dUcWxE?=
 =?utf-8?B?OEZKMlhKclRMRzIzQ0dvNnF4TjdXY3dWNE9nbFk3UmIzK1NLNjBSdll0UkFQ?=
 =?utf-8?B?TTJndWNWYlVLQ2RsaXJTcnZ6NXhDbi9XSUx6YW5Uank0dE1leUtLbFB4MDIr?=
 =?utf-8?Q?gugqkqcY1YSRnpTC59H8b9QHB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A80212AD4F4A494193466DA67DA4F0CD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fC0OFigIsKwvfwe0fuTYTns23hzOI0yE1kFdd6MYlX7W8Wyq451v3SBG6xqlyyLVw7fhBKumuYiaB7ciM3vExxq9XVeIKUElAZgs4jbxrJRzAuy9tqtvsSI5lXTSxIyKmNUP8lGppWV82qaiJwnL4ayrJP8VfRHE3ehSodwT1A4cG07dPdC2whE0MamxC6AOezq8Mp9A9Z/OqFzPKkUDnXwwuEam4ouBT9rr327+d1Q/bFT333CCQ0pAMrMGuXpqliozWYdtsiRLz+n+0F8THT/eowIvpg63eXhmFbWtItq0Raa0U7G0otE+n8Sf03/rzKddj7D2v2EVloLr6M9JkoL3BVBw6bpcr4Ae5/uR3hRQgCbCuJmMD1fj497At6wmcZY0gSPuVHpghLVPSTWZmdBBVB9joPEvZfUVfojxPaLqLvQhREYdtJquTuRKOpaCIESSFiGYBRH+y5uZLAWwF84Rz1KxLup+p+O0BlDjeqxyfdDvnkwmrvxfL5tlA/72BVSC5GoOt8+WrlF3ucX+PT+zMUSdhuDC6ix2ToEwlANp+mpLM0TnW7wL20QQMyR+GNsiW3CI/h7WXRJZaC1FNq/zbtc/takqW64JksIXtI6vYhdd5ZtXQS0APpcpXd/hThnfj/MkQ9M6wPD4WqScNw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103b36ad-357c-4d27-1874-08dc8f2d445e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 00:26:16.2639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bqltVYGLL/eGGZnEo59aNAvDHm6V38bsNCb6LPwI387DSH7WR8Ayz901V4ixqhpRuziFonxuToTZxawatgd1Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6858
X-Proofpoint-GUID: RDaXZA9MkSVs3IZVPMuBiAkJQCTjahG9
X-Proofpoint-ORIG-GUID: RDaXZA9MkSVs3IZVPMuBiAkJQCTjahG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxlogscore=817
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180001

T24gTW9uLCBKdW4gMTcsIDIwMjQsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gVGh1LCBKdW4g
MTMsIDIwMjQsIE1pa2UgTG9vaWptYW5zIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBXYWl0LCBJIHRo
b3VnaHQgdGhlIGhvc3QgaW5pdGlhdGVkIHRoZSB1c2Igc3VzcGVuZC4gRGlkIHlvdSB0cmlnZ2Vy
IHVzYg0KPiA+ID4gc3VzcGVuZCBieSBwdXR0aW5nIHRoZSBob3N0IGluIHN1c3BlbmQ/IE9yIGRv
ZXMgdGhlIHN1c3BlbmQgZXZlbnQgb25seQ0KPiA+ID4gY29tZSB3aGVuIHlvdSBwZXJmb3JtIGEg
ZGlzY29ubmVjdD8NCj4gPiANCj4gPiBBbGwgSSBkbyBpcyB1bnBsdWcgdGhlIGNhYmxlLiBUaGUg
aG9zdCAoUEMgcnVubmluZyBVYnVudHUgMjIpIGRvZXNuJ3QgZWplY3QNCj4gPiBvciBzdXNwZW5k
IG9yIGFueXRoaW5nIGxpa2UgdGhhdC4NCj4gPiANCj4gDQo+IFRoaXMgaXMgYSB2ZXJ5IHR5cGlj
YWwgY29ubmVjdC9kaXNjb25uZWN0IGZsb3cuIEknbSBzdXJwcmlzZWQgdGhhdCBpdCdzDQo+IG5v
dCBjYXVnaHQgb24geW91ciBwbGF0Zm9ybSBiZWZvcmUuIFdoYXQncyB0aGUgY29tcGF0aWJsZSBz
dHJpbmcgZm9yDQo+IHlvdXIgcGxhdGZvcm0/DQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBDYW4g
eW91IGNvbmZpcm0gaWYgdGhlIHN1c3BlbmQgZXZlbnQgd2FzIHRoZXJlIGJlZm9yZSB5b3UgZGlz
Y29ubmVjdCB0aGUNCj4gPiA+IGRldmljZT8NCj4gPiANCj4gPiBEaXNjb25uZWN0aW5nIHRoZSBj
YWJsZSBpcyB3aGF0IGxlYWRzIHRvIHRoZSAic3VzcGVuZCIgZXZlbnQuDQo+ID4gDQo+IA0KPiBD
YW4geW91IHRyeSB0aGlzOg0KPiANCj4gSXQncyBhIHNpbXBsZSB3b3JrYXJvdW5kLCBidXQgbWF5
IG5vdCBjYXRjaCB0aGUgaXNzdWUgd2hpbGUgb3BlcmF0aW5nIGluDQo+IEZ1bGxzcGVlZC4NCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2Iv
ZHdjMy9nYWRnZXQuYw0KPiBpbmRleCA4OWZjNjkwZmRmMzQuLjg5NGNhMTA0NDI4MSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiArKysgYi9kcml2ZXJzL3VzYi9k
d2MzL2dhZGdldC5jDQo+IEBAIC00MzM5LDYgKzQzMzksMTggQEAgc3RhdGljIHZvaWQgZHdjM19n
YWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gIHsNCj4gIAllbnVt
IGR3YzNfbGlua19zdGF0ZSBuZXh0ID0gZXZ0aW5mbyAmIERXQzNfTElOS19TVEFURV9NQVNLOw0K
PiAgDQo+ICsJaWYgKG5leHQgPT0gRFdDM19MSU5LX1NUQVRFX1UzKSB7DQo+ICsJCXU4IHNwZWVk
Ow0KPiArCQl1MzIgcmVnOw0KPiArDQo+ICsJCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBE
V0MzX0RTVFMpOw0KPiArCQlzcGVlZCA9IHJlZyAmIERXQzNfRFNUU19DT05ORUNUU1BEOw0KPiAr
CQlpZiAoZHdjLT5zcGVlZCAhPSBzcGVlZCkgew0KDQpNaW5vciB0d2VhayB0byB0aGlzIGNvbmRp
dGlvbiB0byB0aGlzIGluc3RlYWQ6DQoJCWlmIChkd2MtPmdhZGdldC0+c3BlZWQgIT0gVVNCX1NQ
RUVEX1VOS05PV04gJiYNCgkJICAgIGR3Yy0+c3BlZWQgIT0gc3BlZWQpIHsNCg0KPiArCQkJZHdj
M19nYWRnZXRfZGlzY29ubmVjdF9pbnRlcnJ1cHQoZHdjKTsNCj4gKwkJCXJldHVybjsNCj4gKwkJ
fQ0KPiArCX0NCj4gKw0KPiAgCWlmICghZHdjLT5zdXNwZW5kZWQgJiYgbmV4dCA9PSBEV0MzX0xJ
TktfU1RBVEVfVTMpIHsNCj4gIAkJZHdjLT5zdXNwZW5kZWQgPSB0cnVlOw0KPiAgCQlkd2MzX3N1
c3BlbmRfZ2FkZ2V0KGR3Yyk7DQo+IA0KPiANCj4gT3RoZXJ3aXNlLCB0aGVyZSdzIG5vIG90aGVy
IFNXIHdvcmthcm91bmQgdGhhdCBJIGNhbiB0aGluayBvZi4NCj4gDQoNClRoYW5rcywNClRoaW5o

