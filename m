Return-Path: <linux-usb+bounces-24015-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06820AB9342
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 02:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8798017B45E
	for <lists+linux-usb@lfdr.de>; Fri, 16 May 2025 00:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142EC8F6C;
	Fri, 16 May 2025 00:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="uiUnCdGT";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JZYw/59I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ozXQV4ND"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9384228EA
	for <linux-usb@vger.kernel.org>; Fri, 16 May 2025 00:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747356060; cv=fail; b=ZJvaSpCU4w9EHccb3xzLMRM1Hb9yZngGpYyXp9csmjKxLlJivjoFIZLxcQxnv+pAiePIB1h1tifHOEI3Yl4cVD7692WVRECAHzihW7Dwyf5UVMWk1rGo0TZ84jYyn0ZeCCh/jjOEIJq5q9nBtQ1uiO1kU5o3TKTux3b3a8Mqmf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747356060; c=relaxed/simple;
	bh=D1p/M/tpt8TrM+cgxjBNwk4fAiAW3OfyP3cR0BmeOUU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZrA0X3AvTWchMFbAmMWmpg2OgTJznioYqTbYxYIfXjMR8YOFQPj6vtgSUAkTzN/WcMnrAgY2DewFCxqpSFeHUFb28ucK+eIISItjmFXVmAfQxwWrmwn52e7B1w0048P85udbjqwOs7Rf8VuZlnpt7VM+bnar4dcuSG2UppW1xB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=uiUnCdGT; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JZYw/59I; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ozXQV4ND reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G0HrU8026128;
	Thu, 15 May 2025 17:40:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=D1p/M/tpt8TrM+cgxjBNwk4fAiAW3OfyP3cR0BmeOUU=; b=
	uiUnCdGT/D/YcT48hbXFNWu6PnSm+TyjooYhz5L5G6w/EAGSNa7jzcJN6w9aCx2C
	jMsRUnFQXwlCP0ecrbW1mFZxRoCunj1SXtS39MjPjJAigOgmreioioPxoBv7R6Fw
	9SzNmV90doxPGFb8rNkdj473fklNTWlM8j9p7fI/zjVjmZtPf0HAT87cI4wBUn5I
	rNHIN40EYOUXvJxBwbYAAkoiKmjQcVHeRY4rJQARJ1+Lpy0J1NW4JToTEQ2zXBU6
	RYguiu4K7ZV/ivdIklzrGFdnY1o2CzeQBJuYMx0S5/lvK7WKYhFZD2JjsRyagWVR
	fGzGXWuaQPK3eoXmDF+dLA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 46mbe58ua6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 17:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1747356022; bh=D1p/M/tpt8TrM+cgxjBNwk4fAiAW3OfyP3cR0BmeOUU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=JZYw/59IARBWzT1q5r4RhFMOeAOSvqlhhbvEUqzDgbBoH7m3D/DmluxHc+7HZw/G8
	 3jI8AKeaUW2rGA0z9yE66U8nxLDyPPGYsDIb9Em7z2c1uBhZklQvAadmzsrJSOnwDk
	 TtX8UalTUPnIWGtrcAYxI86mll78y3gP4forAqsifbdgBhnFRDDY4BW8MWVuGMUl5e
	 BWxVr+gSWugY9Oo95Lx1hmVzhH1YOoeFq2IDURQe77wn08VZpZdqxCdo1xdnl0bWUI
	 iyQhkxeL/kC+eA86E3lI9ct7yMROXseeC1ovwdEPTbAAvmjbqvLwRPPkVfcvQBaqeW
	 KcqtH9u2QExgQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BA68240235;
	Fri, 16 May 2025 00:40:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 02CFDA00A8;
	Fri, 16 May 2025 00:40:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=ozXQV4ND;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8A6B7404CE;
	Fri, 16 May 2025 00:40:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2BQW4EKwf/NevGJQAYnpueH4gkvI/No2gFxwttGfa/e1Jxde1IdaQAZ3RU/ZG0/5S2yJmNIkzz5i6KsZFwVUedS6RtA5/o/YH0+NDAnjzUp/AKOt5GCLn342/P7qmOwxmUpcPwXMGyU6Zn+qIBpg0FJuNbYY1+ArvbOUSXmsn7lHOAfbCe/8uxTp8jKUe+6CO71BRXJYGUmaVEmages8P28KkrgBdLANEA3AuUo98EpCfIJdCvtJ+44d4LV/XfhJPNtMi8PvHmJmqBSrWLEvXN6oKhgofWXqCXm4KHgc3cBp0+9KBDFuXZ2IwTSiBxu4m3x6D9Yt9laZAVdYnRkEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1p/M/tpt8TrM+cgxjBNwk4fAiAW3OfyP3cR0BmeOUU=;
 b=SKUyLoPoZ8gkiwFHf/cCAUxKEKyH5awRlZV7Q6c7EQE2nRJnlNKkH5sZgi90qhxkfI5pdXUVutqOK1Pr7/q7w89XJIt7Nez7IygDKAa/lkINX8ZQipph+qJ1h6KxUrSDOpTpM3qcGh9rfnAWCxbZIv7Muf2O+l/dWc1e6ObFPpSdv2ZCxVKu1blIGT3a5E0ocC7qlx6D8qBx/KMD/VoQlpB1kyZyHRzpGyQqnVPWSWW9ac7+BBOJT8cikufm597ukTI44lLA26BDILDcif8IxxMuVqxghVXfNSJZeKDHR96SwD3l0BH2D6IaSVlZCxY+InFBQJILfbm8CXwGngCd7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1p/M/tpt8TrM+cgxjBNwk4fAiAW3OfyP3cR0BmeOUU=;
 b=ozXQV4NDSMCLOjTxRyPON/8x72vBBsb0EyisMjxLC6ViFnQ8KOgPrDg3bPocohZ7z+4P3hYtIEqSh7xWJamK3poPLRh+52zXasO8DBJdM0rnxd6DazwmqLhCwwO5O/Yh11M4uxmQVFSpuKrm09I6cVKTxNLs7e/nmz7soY7MxxM=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by MN0PR12MB5763.namprd12.prod.outlook.com (2603:10b6:208:376::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Fri, 16 May
 2025 00:40:15 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%6]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 00:40:15 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Amardeep Rai
	<amardeep.rai@intel.com>,
        Kannappan R <r.kannappan@intel.com>
Subject: Re: [PATCH 24/24] xhci: Add host support for eUSB2 double isochronous
 bandwidth devices
Thread-Topic: [PATCH 24/24] xhci: Add host support for eUSB2 double
 isochronous bandwidth devices
Thread-Index: AQHbxaGFPsYlUyA4m0aA1RSkmDivRbPUZzcAgAADqwA=
Date: Fri, 16 May 2025 00:40:14 +0000
Message-ID: <20250516004008.lzd7yhsagz63oxmf@synopsys.com>
References: <20250515135621.335595-1-mathias.nyman@linux.intel.com>
 <20250515135621.335595-25-mathias.nyman@linux.intel.com>
 <20250516002700.cags7zapbshy7ri7@synopsys.com>
In-Reply-To: <20250516002700.cags7zapbshy7ri7@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|MN0PR12MB5763:EE_
x-ms-office365-filtering-correlation-id: c142f400-c337-441a-597d-08dd9412396f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?azg4RTVmOUVNZExvLzNIa3ZhcS9wZDlFekUvd1hOMmtiLzR4U2gyeTJEZEll?=
 =?utf-8?B?QlJrTFNvU1ZyRjQzWEF3bjd1RHRvMy8vVDVkbTBDQ215YXM4RmdheVIzZW9H?=
 =?utf-8?B?cSsrSVdzeXVuRkdkcUxYNzhra05GMS9jdzBGSGo3YnM0Si9YV3J5eXduZng4?=
 =?utf-8?B?TTdtQmhKai9oUTFFYjE2YzQwTzJuRm5sMTZwOGRCbzAwQ2EzVWRUZ3RYTzFR?=
 =?utf-8?B?YlBPVkRDakRZQ0F1a2I1TzFLZ1d3T1JGN2d6NERqTnhCTjFEVk1tSit0aTcz?=
 =?utf-8?B?KzdZVGJXMXRQd0p0WjNBNU9lVmRGY2hLTFdKdWhrM1ljcmFORnBMRkJYdUUy?=
 =?utf-8?B?amM3WWhlS3FBR1RYeFhHM2hCOHZVcldpdTlsS1Fab3V3Q0pzVUg5WE92VTlT?=
 =?utf-8?B?ZTRjSDhzaGk2bGszaUkrNnZvVGVWeHdzVE8vdEszdTFiaWdCTDBHUGpOamta?=
 =?utf-8?B?MUFHa1hrNUMyaW40Z2l5MDhLYlZDNjhDdlUwbkxGcXFVbE5JWFZoZkZMdi9w?=
 =?utf-8?B?SGttN2FqdTdTVTdtZm9XV2pFN1NiRGd4cGR0bDAvWkN3aVVQSGpuQ0dNK1pN?=
 =?utf-8?B?WEhwZmVSK200dTU3ZFNGN3NCMTdINTA3TWxxZFRscXN1WDdsTVdnajNvWm1q?=
 =?utf-8?B?SndDV3ArVEZ3R0QzYmFUVkNRRFJESUpheG1sZkpVcFZpMFdjeXplbTlpdnJJ?=
 =?utf-8?B?VEp2T0VYUXd6MW5TSTFzL0NSZ1BLUmQxYTdnc05HdHRDTThXN1NZaHA4UlFK?=
 =?utf-8?B?M1F0N3IvczFxVHVNVmFYWjRsanRYU1NjYTA5ZDRoOXBOaTZCMkVITk9SSGhR?=
 =?utf-8?B?S0JoSkxqUUs5bWZNUmRwNUpwK0dRLzRGSSt4VURjc3FKK3NtTDl5KzZJOXl6?=
 =?utf-8?B?TisxRHdPc1ozcWd0L2d0MHBjSXdFdEcyRE9pSlNPNzloYklhcUlZMFNSNkhp?=
 =?utf-8?B?VlQzK0dZR2ZJU1AwcnZTTnBoL0U3U1RGSklIc1BRaEhRSm5mWk1aTHdYOUtP?=
 =?utf-8?B?aW10dDZSRmljdEc0cDc3Qi9jVUtPYlhmbnFHcXhaTjdhRTBNelV1UThmZ0lQ?=
 =?utf-8?B?cm9xTyt1ZzZLU1pOWUkxekcyMFZrUnRrb3ZYZEx6TWJQRGlvU25zeXhsdFp6?=
 =?utf-8?B?MjhWQ3psZTdvMDNHZzMrUlAxeXZnRDhwOXluSVJMWklzUjdycjBEMXY4U0sw?=
 =?utf-8?B?Smx5RnNQbXBIYlBWNXphcDNzT1ZVY0JIWXdzTkRGVXAzbG5EaW42TWNTd29C?=
 =?utf-8?B?clovKzArTk81LzAxa29wWXRBYTZxTlAyZm05Ykt1b055RjVreFQxQjJOeGJl?=
 =?utf-8?B?YXBrT2JqckZmcmR2T3VOUW9Tbi9hMXFQZWxxQjhJUTZpNjlPbHZYYmxvNTJw?=
 =?utf-8?B?c2RpZ1BmM25WUmNyODUrU3JEKzBxTE1RWFhiUFFrZTVoc0t4NUNMSlU5Sjdq?=
 =?utf-8?B?ZFYzT2hxMWcyRVBBamJIUldZYTRiQUhzakgxdVJGMzdSODcyRHc4THk4Vmda?=
 =?utf-8?B?dkd5N2lwSEc0VGRjVzYvUnMrUkRBS2EvVWRQbjhaSnpSamppNm4vbVB4Ym9j?=
 =?utf-8?B?V0RqYzVoTHFjZWlNTS9Xd2hMVzhSV1pmWVhPVmlJUHVZRTh6TGhMcVI0cUo1?=
 =?utf-8?B?NklZVExieHlOR0FQNS85cHFZUWovZWx0Syt6MVdFMktENEl0UHJib3c4MDY2?=
 =?utf-8?B?aWRkY1JjMTRpTzY0b2ZyOW42NDVDcmtwZ1NkalZaN1BrQ0hlYWNGQ0hVRUhQ?=
 =?utf-8?B?R0dCTTNnK3RTRVZGVWJmZTVXamd1bnI2dVd0N0svbnkyRUNnZVRIZ3R6amEy?=
 =?utf-8?B?RldsbVJMT3lUQ2NRdnQxaFZKUThWSkNLc1d4UStkbXkvcWZNekJUTFFreGJv?=
 =?utf-8?B?VlBDNGpuUUZJWGFwVlQxbnE1RSsvMlMrL3BjNVNLNnphM0JiU1o0ZXZMMFNi?=
 =?utf-8?B?djg1UnZodDNSUU9hN0dNV3llbmJQOU9NN1JWbDN3aFkrWTVNTGFjM1dKNWFl?=
 =?utf-8?B?NUd4bXZmTVl3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SzNVRERKMXVBRThMc2NTMmlBNW9LNXp1aDArVStzOWdEUnpjSWZqdDNvVjJR?=
 =?utf-8?B?ek1xVlgyM2ExazBwa2MxYi80WHN1dGM2ZHkyMGVQc2tNc1p1MGl1RXg5SU41?=
 =?utf-8?B?ay83U2NyTHlnL3Z0RUYrQnJmbU83R2JxeUtxZG1oMlZ4aVg1cjUzMWM5TWo3?=
 =?utf-8?B?WDEvWnoxNFJQN2k3TWVqZ1dZbjk4MUVYQWZYTXFPcU1heFFCci9sNDVsR3Ny?=
 =?utf-8?B?Nzlody80a0k5dDZlcmVaTWt1THcxeXptMzdzS3pYYzJiQVBQaXI5WU9yL3E2?=
 =?utf-8?B?VW8xNkJvV3ZZZmNJajlxYmIxbkRCWHVDRFFVYkxZQ1JnZDNLTGttWDdFb0lo?=
 =?utf-8?B?YzFJdnBRUDRMUzkvSDF2L055WGxmYk5aOGxwUFVFanNRSHNtdFNuUWRyenl6?=
 =?utf-8?B?M21DVkxsRUtMbjNsVmdCMFg5Z3ZQTFYvazlYYW5BMkpjSVlhaHFUZFZmNlVF?=
 =?utf-8?B?dW94K21INVg1ZzZwWGRzbm14cXJVeit0Y21Bb0YyaW9aM2IrdEpJQzhoZE9C?=
 =?utf-8?B?UXozU1kyL1grdW44eFIzT0JiU0ljZjg2QVF3MU90QnJZYVBuVDJCK1p6Ym9p?=
 =?utf-8?B?R1R1TmxDOWNya29jdjA3MUtZTzg2VmRDODBkL3RUM1ZtNDlGTjVIMkpDNjh3?=
 =?utf-8?B?NmRiRlBqZ2xSVnhnN050VW5ZQU1TOEZlNTR6b0t3K2g0Vyt5R3NZZStqeUpt?=
 =?utf-8?B?bUQ4QS9PcXc2c1NadlpacEU3UnhTMFdYN2pBWWt5UkNMNU5UdE9LaGxmZGFU?=
 =?utf-8?B?OFBGbmxYbmhEREc4M1RCRWhwMmpoYXRLYWlIYVdISDlZT0pIT2RnSGFSa1Nj?=
 =?utf-8?B?b3Y4dWQ4L0dhWDdVdHY0T1BwRFVQQ28zcjJVTUtkUHZLR2dhMnk0cFI1MTdV?=
 =?utf-8?B?cG9yMHJlU0J0eEpQY2VyOGlwWGlSZng2YVBUMTRmYW5DSkRIRllHVDk3Uy9S?=
 =?utf-8?B?dXIxcm9OMGNKY0ZGVXZCRUhsdmp4Rzd6dVlnZ2FNdDVqZEJTTUlMUFhyb1lD?=
 =?utf-8?B?Z2ZrbGdWOGtRYVp1UXBFNmU2ZDdnYmdIc1k3M0tiQUt4RW9TaTUwbGhiRklZ?=
 =?utf-8?B?elltSnBOS1lVazZ3MC9HdnBWalJueWcxNkVsZjdUWVhPdVJjbWRzSXBMS2RY?=
 =?utf-8?B?Mm8xZTRhQ2tyajBkMVYraks2dEFjc1NCOFZQdm5mV3RwK3Q3ck81T2N1SlZQ?=
 =?utf-8?B?b2UvenZid0lZN25aYmF6c0FlWC9wbW5GUlVWcURtRUdQNHgybDJieGlHQm1F?=
 =?utf-8?B?Q1FpT2FNNkdBMHp5d1IxTUc5VU8rN2IwT2I1eWV5UzFjRm52NzNqQ1BPbklD?=
 =?utf-8?B?Uk9YUEtBYzN3M0h3UmZqdnhGSFFTUzBnZG1Pb0g3Vnl1ZU93L2N6Ti9WdGJH?=
 =?utf-8?B?cHNkMVAzYWZSNWxMK0VJM3ZBdWlwUUh6SnhMZmIvT3RFMGljdHhUQ3pITmNY?=
 =?utf-8?B?OFBaRWNodkpQZUNOWG56M0l0SnhrR3JoVnFDTG9JN2dIOXZwT1VZYjJuNnJ3?=
 =?utf-8?B?eG92dnBFcmVkakJzd3NCdStxeE1sV01oaGpPSUNlTDVjbXpBMitFemZNUGc0?=
 =?utf-8?B?RXpRUk1wVVU5UVNRb3ZkWFRtS1ZFWWtYQXRrYTVTMVA2d3pnakMwZmhtMTZ2?=
 =?utf-8?B?YnR4Q1ltNUwrNFlDVEQ4RHFRbmNiUWpGcEZCd1ZMclZxbGFEVkdwb3ArSHFC?=
 =?utf-8?B?UUhTNzdsZGRlNXFTcXhyVXpKNzRiSE9LMDdLQm45Y3h6WkJBcEdOQ0diSUk1?=
 =?utf-8?B?SXhYeGo0a0RNMy9hcTBBMCttejJOWHZjMDFMaGJsNXhQWE05SDZMUlZqQTEz?=
 =?utf-8?B?emUya2NpVDV4MC9IZnNVZnlHNG14QUFiSUpBVlJPVk84cWdzbmxMRlJDMFRr?=
 =?utf-8?B?RnVGcEF3N3V2N3QxeDAxUTdUSDV6aU1VQTE3Y1FidkNCM3pWOE1FUDk4di9y?=
 =?utf-8?B?MFMya3J0YjhOaVNPZUU5RnBVSnMzWDlWWlowaUhBbUFnVkNrQVBlV1VSTmFE?=
 =?utf-8?B?REVaUmF3TzNWTlorV3JmYml0RkJJa1RsWHJvN2RIMHRRckVPK0pzbEo3VnQw?=
 =?utf-8?B?UzBkcjdnTjN1Q1ZGOE9MblhyOVB6VkQwWmptUHY3UzI2UFpNZUpCVy91eDk5?=
 =?utf-8?Q?HRabADoXtLCFctuN15gSUif9c?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B39965492387F2478D8052DE95AC1791@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BRUHDAbaEBD/Th62wA3uglzmTR0AfjzqHk4ZLP3WeHYnFOWUBswn5DIUpKSiPDsTRiGNEB6jGs4cWsZ4NJ9Alk6uhAadnxMAvHpkh5u0X7+1NyEda4SjE0RA4YYXo26jFh8FpNUV1v3PRT1LMhH+aueUVAL5f9ekDHfZiPJtj7OFYcHv1cV8EtNSs+6z7pFBJ1HM7dlwcN6SJLmad1Tw1XrA1y/dytpe7BVcqNxL+HCByCuBoJIMmRSeXBpn1yHYutoRHclCvL14XgGGEWN+H7csxGtJ8XKuq271WThMfCN5P1bal3ELJYUEWi1YWmvNThD6fq6GjDuziawARAo7hWU/+BI8w5cjeD8X9HApPj4hbFlViryeEzy4lRYsBXXqOGWqdf/cZp2L8DvjosygfqFFYa1fBJMrh3saFvb21uo3SGdAqk3BMWqu9NTHOgm63xlIWRgJuOXD3eBYKtAEPgr+goV+Xm5lZkdTDAF6AbL5FtEHSLMpqDT9PwBSO8hnXhRB18I+La5g+IlwJ24IIrczJB2n2qqEhJzpbBqQDQvtZhD9JL6IhG3grKqU4FURdB0phTnxYApJ9Hc5+r7sPgO5CsRJX2gBqFa1i+MqdRsj7IOs5t5fn6zJGjGiwl29pqyOEjJoYv7wNQNw/oO+SQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c142f400-c337-441a-597d-08dd9412396f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 00:40:14.9981
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgZvYpHgEiULkmxBNNY6hWdyoWrqCwo1JV05XI1RhhDnZ33FtB2knSoxTijmUfAt/q9ISSxNj2hL2VlJiUfWhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5763
X-Authority-Analysis: v=2.4 cv=GYEXnRXL c=1 sm=1 tr=0 ts=68268977 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qPHU084jO2kA:10 a=QyXUC8HyAAAA:8 a=Pagun-SiY6__ML9z8p8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAwMyBTYWx0ZWRfXy7JJGcZZB/Ab
 EQKcD98NiY3BNS6j7o14mxo/Na/cN4c0OqU2MqrTc0q+WP5XQeRdDDbLwT8fFMmfkMCrWWMPLK1
 mrvC+8Vw1VqY+vif9rUyOBDu1mvqW02yAXKw4LQ733qozVCy1C0F9FVsNAfP4KPnMFuUDk0MCoK
 oXpV712la1DBuJvl6SVOJKnpH6GnlZeANy6PZhHPB0/4ZOKn6lg1+wCAl3eWgvhYL8mt88bLaR+
 2oi4GbaFfwPq6bc0SLbJjtLRsIdBTXIDA6FfmVschGdvGd5Kksf75p+oHu/R1ltiAKzPduwVTiE
 BOZSR5J+UiGt1OAlQqSUnaTVdmduOeez1xMtyjv0Y25+iAKgR3XMe3aEd55BOFCpV6RfVIFPpBK
 mtL8hVVLRPdwEAkwxPtRiuV+fDbkO+IP046p4WRFogz55UwyhZ6mh1K7RCRG3nRymcwAK46p
X-Proofpoint-GUID: arW_aSlKK19dPBdLCn812NJlyX1tWyT8
X-Proofpoint-ORIG-GUID: arW_aSlKK19dPBdLCn812NJlyX1tWyT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_11,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 mlxscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=999 classifier=spam
 authscore=0 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160003

T24gVGh1LCBNYXkgMTUsIDIwMjUsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gT24gVGh1LCBNYXkg
MTUsIDIwMjUsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+ID4gRnJvbTogQW1hcmRlZXAgUmFpIDxh
bWFyZGVlcC5yYWlAaW50ZWwuY29tPg0KPiA+IA0KPiA+IERldGVjdCBlVVNCMiBkb3VibGUgaXNv
YyBidyBjYXBhYmxlIGhvc3RzIGFuZCBkZXZpY2VzLCBhbmQgc2V0IHRoZSBwcm9wZXINCj4gPiB4
aGNpIGVuZHBvaW50IGNvbnRleHQgdmFsdWVzIHN1Y2ggYXMgJ011bHQnLCAnTWF4IEJ1cnN0IFNp
emUnLCBhbmQgJ01heA0KPiA+IEVTSVQgUGF5bG9hZCcgdG8gZW5hYmxlIHRoZSBkb3VibGUgaXNv
Y2hyb25vdXMgYmFuZHdpZHRoIGVuZHBvaW50cy4NCj4gPiANCj4gPiBJbnRlbCB4SEMgdXNlcyB0
aGUgZW5kcG9pbnQgY29udGV4dCAnTXVsdCcgZmllbGQgZm9yIGVVU0IyIGlzb2MNCj4gPiBlbmRw
b2ludHMgZXZlbiBpZiBob3N0cyBzdXBwb3J0aW5nIExhcmdlIEVTSVQgUGF5bG9hZCBDYXBhYmls
aXR5IHNob3VsZA0KPiA+IG5vcm1hbGx5IGlnbm9yZSB0aGUgbXVsdCBmaWVsZC4NCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBBbWFyZGVlcCBSYWkgPGFtYXJkZWVwLnJhaUBpbnRlbC5jb20+DQo+
ID4gQ28tZGV2ZWxvcGVkLWJ5OiBLYW5uYXBwYW4gUiA8ci5rYW5uYXBwYW5AaW50ZWwuY29tPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IEthbm5hcHBhbiBSIDxyLmthbm5hcHBhbkBpbnRlbC5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogTWF0aGlhcyBOeW1hbiA8bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1jYXBzLmggfCAgMiAr
Kw0KPiA+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktbWVtLmMgIHwgNjIgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tDQo+ID4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1yaW5nLmMg
fCAgNiArKy0tDQo+ID4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS5jICAgICAgfCAxNyArKysrKysr
KystDQo+ID4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS5oICAgICAgfCAxOSArKysrKysrKysrKw0K
PiA+ICA1IGZpbGVzIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0K
PiA+IA0KPiANCj4gDQo+IDxzbmlwPg0KPiANCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS5oIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmgNCj4gPiBpbmRleCA0OTg4
N2EzMDNlNDMuLmUwYzUyMzhjOTMyNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0
L3hoY2kuaA0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5oDQo+ID4gQEAgLTE3MzUs
NiArMTczNSwyMyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgeGhjaV9oYXNfb25lX3Jvb3RodWIoc3Ry
dWN0IHhoY2lfaGNkICp4aGNpKQ0KPiA+ICAJICAgICAgICgheGhjaS0+dXNiMl9yaHViLm51bV9w
b3J0cyB8fCAheGhjaS0+dXNiM19yaHViLm51bV9wb3J0cyk7DQo+ID4gIH0NCj4gPiAgDQo+ID4g
Ky8qDQo+ID4gKyAqIFVTQiAyLjAgc3BlY2lmaWNhdGlvbiwgY2hhcHRlciA1LjYuNCBJc29jaHJv
bm91cyBUcmFuc2ZlciBCdXMgQWNjZXNzDQo+ID4gKyAqIENvbnN0cmFpbnQuIEEgaGlnaCBzcGVl
ZCBlbmRwb2ludCBjYW4gbW92ZSB1cCB0byAzMDcyIGJ5dGVzIHBlciBtaWNyb2ZyYW1lDQo+ID4g
KyAqIChvciAxOTJNYi9zKS4NCj4gPiArICovDQo+ID4gKyNkZWZpbmUgTUFYX0lTT0NfWEZFUl9T
SVpFX0hTICAzMDcyDQo+ID4gKw0KPiA+ICtzdGF0aWMgaW5saW5lIGJvb2wgeGhjaV9ldXNiMl9p
c19pc29jX2J3X2RvdWJsZShzdHJ1Y3QgdXNiX2RldmljZSAqdWRldiwNCj4gPiArCQkJCQkJc3Ry
dWN0IHVzYl9ob3N0X2VuZHBvaW50ICplcCkNCj4gPiArew0KPiA+ICsJcmV0dXJuIGxlMTZfdG9f
Y3B1KHVkZXYtPmRlc2NyaXB0b3IuYmNkVVNCKSA9PSAweDIyMCAmJg0KPiA+ICsJCXVzYl9lbmRw
b2ludF94ZmVyX2lzb2MoJmVwLT5kZXNjKSAmJg0KPiA+ICsJCWxlMTZfdG9fY3B1KGVwLT5kZXNj
LndNYXhQYWNrZXRTaXplKSA9PSAwICYmDQo+ID4gKwkJbGUzMl90b19jcHUoZXAtPmV1c2IyX2lz
b2NfZXBfY29tcC5kd0J5dGVzUGVySW50ZXJ2YWwpID4NCj4gPiArCQlNQVhfSVNPQ19YRkVSX1NJ
WkVfSFM7DQo+IA0KPiBTaG91bGRuJ3QgdGhpcyBjaGVjayBmb3IgaXNvYyBJTiBkaXJlY3Rpb24g
b25seT8NCj4gDQo+IERvIHdlIG5lZWQgdG8gY2hlY2sgZm9yIGNvbm5lY3RlZCBzcGVlZD8NCj4g
DQo+IEFsc28sIHdoeSBhcmUgd2UgY2hlY2tpbmcgZXVzYjJfaXNvY19lcF9jb21wLmR3Qnl0ZXNQ
ZXJJbnRlcnZhbCA+DQo+IE1BWF9JU09DX1hGRVJfU0laRV9IUyB0byBkZXRlcm1pbmUgaWYgaXQn
cyBkb3VibGUgaXNvYz8NCj4gDQo+IEluIHhoY2lfZ2V0X21heF9lc2l0X3BheWxvYWQsIHlvdSB1
c2UgdGhpcyBjaGVjayB0byBkZXRlcm1pbmUgd2hldGhlciB0bw0KPiB1c2UgZHdCeXRlc1Blcklu
dGVydmFsOg0KPiANCj4gCS8qIEhpZ2ggc3BlZWQgZXVzYjIgZG91YmxlIGlzb2MgYncgd2l0aCBv
dmVyIDMwNzIgYnl0ZXMgcGVyIGVzaXQgKi8NCj4gCWlmICh4aGNpX2V1c2IyX2lzX2lzb2NfYndf
ZG91YmxlKHVkZXYsIGVwKSkNCj4gCQlyZXR1cm4gbGUzMl90b19jcHUoZXAtPmV1c2IyX2lzb2Nf
ZXBfY29tcC5kd0J5dGVzUGVySW50ZXJ2YWwpOw0KPiANCj4gU2hvdWxkbid0IHdlIGp1c3QgdXNl
IHRoZSBkd0J5dGVzUGVySW50ZXJ2YWwgaWYgaXQgaXMgdmFsaWQ/IE90aGVyd2lzZQ0KPiB0aGVy
ZSBjYW4gYmUgYSBjYXNlIHdoZXJlIGR3Qnl0ZXNQZXJJbnRlcnZhbCBpcyBzZXQgYmVsb3cgdGhl
DQo+IE1BWF9JU09DX1hGRVJfU0laRV9IUyBhbmQgYnJlYWsgdGhpcyBjaGVjay4NCj4gDQoNCkFj
dHVhbGx5IHNwZWMgaW5kaWNhdGVzIHRoZSBkd0J5dGVzUGVySW50ZXJ2YWwgdmFsdWUgbXVzdCBi
ZSBiZXR3ZWVuDQozMDczIGFuZCA2MTQ0IGZvciBldXNiMiBkb3VibGUgaXNvYy4gRm9yIGVVU0Iy
djIsIHRoaXMgdmFsdWUgY2FuIGJlDQpsZXNzLg0KDQpCUiwNClRoaW5o

