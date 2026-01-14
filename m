Return-Path: <linux-usb+bounces-32358-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8816FD2191E
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 23:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E046300818C
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 22:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B631E3AEF44;
	Wed, 14 Jan 2026 22:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iN9qFHou";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="KDeRTrqj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VcoaeIjw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3299B389452;
	Wed, 14 Jan 2026 22:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768429853; cv=fail; b=P9MfWmUQUO3drcVWsr6/icUD9te/Grc1nVst7Faquenl5IQ5mAg6Vzr0zbNCYV1iTfb8a7JN1A54l0vNdIZfUKNx+x0ybYKOOM8uD/fqH9I7Wjq+aaNZjm5xSnsHHVdZca8M9JRtV08o4m3bgRLh91jwQEG6LfG0/gVg+20SzCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768429853; c=relaxed/simple;
	bh=YkpbTNtnvHLam+5xaKFfUdggpEbitac1gqAZuE9FJO8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uCxnkdlSL9F+3u/A1LZm5GL0rHcmeMipOV6jZWOSplN43DzuzwQprRRHNFngO19LDZcpHnTiNQT5Xq2/UQqAIIWVvPjuhggGv9t2aDC4FnNUmZxNn+X9UHAUVs9ztgDtMVH06W6MO4xTSSbTQl4Ou013TMf5WLF87/4Hd1XQAXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iN9qFHou; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=KDeRTrqj; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=VcoaeIjw reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EIvVqR1290755;
	Wed, 14 Jan 2026 14:30:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=YkpbTNtnvHLam+5xaKFfUdggpEbitac1gqAZuE9FJO8=; b=
	iN9qFHouXJhQWvTCWpzet6YZU2MGUYnrKKkp3WzpuSpOXGYk8Kq7Sfqfn7w/kdgU
	fd8m7gdVEyH0Vi3MNjAcfwAwLkL3QQUm8+QPswB/fPvYKgxal143KavFmgFevSJr
	mnMaebupF885mXIcAmMSVS0LhHtoA3srRWGZBTASjx3uFvUWUKpY6dBCztFj3fGa
	LelW0F/wQIaXZN0Q3V+WkxSo2wdl1f4nv3c6hMm8bmLTZKZL3KBHNcSoBfIfdYbT
	MQ5m/rqenYEy8GQyOw7PVCRIqVlIv3T21GSfrOIZQf6wg4F+OExLp6TdkMG0VJkU
	xu5U2pRiwYw4kpyCASCong==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4bpgvns1gt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 14:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1768429825; bh=YkpbTNtnvHLam+5xaKFfUdggpEbitac1gqAZuE9FJO8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KDeRTrqjMnqKgvSNWyw9SOLuNi7gQuon8khSq4RHz16WA7lJraZdPjx8fOx/4Ihnf
	 N3RKmn04BOhjJdrTnC0Eayy0yNnzFREQgdaPxfbPX+Uk0MPT8e18VqNtcybP7MYYzS
	 ydD36LYMbqX3sQXkGNkTYXprnT8PvI5VJ/MHvDXfbSmFLTN2/PyfMCloWICNZM7lK+
	 EpMFYjknmM4bi+BctQRemelGpOwyvq1vBxrSLdPljmb47PBLVpLFUgLzRmQcOx5Ixm
	 bqHICNY4hwu6jqMPh+4SZucY215pVGZcjDdovHnomTGtLQkzu1paDSNFF8BjNlRcDz
	 RyoBoy/2cWLGQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 08F6540357;
	Wed, 14 Jan 2026 22:30:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A90E0A006F;
	Wed, 14 Jan 2026 22:30:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=VcoaeIjw;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00103.outbound.protection.outlook.com [40.93.13.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 443932200B6;
	Wed, 14 Jan 2026 22:30:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtvbChsguA9b4IFQsKhR9kH2YKra48e3GuSoAYhpI3ZtSLM3EaMr8qjX9huEMa2Y5Hxk1xTLFy5S8IaPzHLOoA3HgPhx8SNY9eqCB79S6Qii2AmF5qVY/rKHU9cu/QzChMFWwhMiXpVH3S49kGsbAeJGAy+a+mSshMjEEuFKQFRu/dzRuZ3mb0ynLAfRtAgILcf8OVTtSqxb8ZbCGkjJaRJWw/4dwxmRV2EQINAma+/lTSBkCoe+71Ygzc3bkWBFx04wnBJe92YMGfCZO6tmPtUIs2tnubIHXkLb/RiD1+uNfNZ/7cvd5Jpy6DB2KKD832HNdwkcVfJbfhI/TF4RWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkpbTNtnvHLam+5xaKFfUdggpEbitac1gqAZuE9FJO8=;
 b=FmYoEpwCsDG9QhEeo9OgiwabqJu14pw8OHM93UX7iBiW3x2q4JP2pUC+0/vIlqSQugcgb2tlxBYScRwQLPd/3Cis0JIk2wB2504T8whJ0D9rxvRZRBj+wu660K+0MkDTG+Nyuh/vOZMxr/jrm0uQTqWUMC04GsHZ+JtJYtvLurMFA2kvGGc6eS3vu3KikQ4W9LmKlV35ETlkbonnT9ZrCDSmFWEIp/k6adN9W0TcX3H6PzyAW4ZOVFWFtYHWZziCFoY/UW9K6F1H7TGn09Owom9k1JvFNgRsPVyq+Rr26PdAu+Kr6vjbde1w+6ILH2CPXZiwViW/oHVrw26lB3gVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkpbTNtnvHLam+5xaKFfUdggpEbitac1gqAZuE9FJO8=;
 b=VcoaeIjwkgipzIRJ8BerEiCCGTJQWiDvHPIj/EHe3tW1JaGj2ZXqQ3hMYf0z2+Xi7ofYCY52t5L6R7jzPytKxma59gN2+b0DnItnpcrxxqI1hc0eKadLJV+50nDOv+S/5pO1Xo4RyGnP3o/OqO44WslGqoOcS6VQ2nbgERgEwzY=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB8728.namprd12.prod.outlook.com (2603:10b6:610:171::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 22:30:20 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 22:30:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Thread-Topic: [PATCH v4 3/3] usb: dwc3: Log dwc3 address in traces
Thread-Index: AQHchT2wbJQWlMamnk2JtLup9X7IcrVRizMAgAC0/4A=
Date: Wed, 14 Jan 2026 22:30:19 +0000
Message-ID: <20260114223009.abnwgsnn2i36v3sf@synopsys.com>
References: <20260114100748.2950103-1-prashanth.k@oss.qualcomm.com>
 <20260114100748.2950103-4-prashanth.k@oss.qualcomm.com>
 <2026011406-coyness-latter-aee4@gregkh>
In-Reply-To: <2026011406-coyness-latter-aee4@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB8728:EE_
x-ms-office365-filtering-correlation-id: 6281ef14-7d88-4139-b8c5-08de53bc7ffe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RUVhT0sxRERDNkMycFZLbnNwU1lVc1dlVzFZTkJ5RXNlY01BVFFvZzFiOXJQ?=
 =?utf-8?B?UVlVdENjMmlmaDAwMnM0dTB0bFdnZzZ1TGxjZ2cwRGFvWURMYmxwR294SWRK?=
 =?utf-8?B?a3dDYzZPdTN3TExoM3ZiMitnS1BCbWFQTDM1Zy8vNUlzK3llZVAweEx0TTJF?=
 =?utf-8?B?OUlsTlAvbXc1K3lZWDg3NGgwWXVrdmxtMDBheHBVMHlScVpLaTBWa0FVL0d2?=
 =?utf-8?B?OVNrVDlBU2JSalI3STR6d05LNEpQVGdKeXNNTUxXU0dhTjNxVUdUbC9aRjhT?=
 =?utf-8?B?aG5ieUZpdEtzSTU2elJUUEczQm1PRVdZaURzOEhXR1loTk9FM1h4dDZ3b0l2?=
 =?utf-8?B?N0VkdWRVK2xEQ0dlWlloaUtPQllkR0MyVStaVUs4VHo0OUhjcmpnRkZDUnZ6?=
 =?utf-8?B?NTZwNnFYVitxODFldkk4K2FHbjRyVmhYRDZhNk51SHlWekg1WXRkU3pnaDBt?=
 =?utf-8?B?THIvcmEzcDY5K1NRQWc5TTUyZnJhR3pJUEFhdk5HZWV6emsxaWZ6SStPdzF0?=
 =?utf-8?B?RWg5MGh3eUlodWdzTXRyWFo2UHlKeVRhamVYRmdNaVRaQVFFNXJaK0grYnBE?=
 =?utf-8?B?YTZEb1JUOEwxNHEzaWNFN2x2SGpwbFkwbDdsZFplTm1Cd2U5bnhHMXFBb0lq?=
 =?utf-8?B?YUZGUy8zUy9qeDdpNENjTXV5SWdtc2hPaEQ4Z1ZTaithWEg1ZVVaV1FJZ3VO?=
 =?utf-8?B?OEpscjhXbnNRY3pFOXN3RS9pTUNlQzNXK2djdTU5K1RFMGFwdi93QnZ5ODRW?=
 =?utf-8?B?cjlGbEN4RFJ6TlI2RnpIVjFvVm9LTldZbDd5WUJVSXA2ZENJcjdJQ240NVdO?=
 =?utf-8?B?WjNjb1RlWDNHMm5vdU9TRk9LdDVJblF6Y0NPU3EyamlpUE5BUUZVSXRjbFhx?=
 =?utf-8?B?TGF5b2Zkb1l4ZUJaaUdqUGVhSUZJWkZ3ZE16MGVaVmJSeTJVU3ZFdlhoaU1T?=
 =?utf-8?B?Z1JQZm0vSkcySXcxdzB1QWVpMVBMRHdyV2JTdEhMZ1VYOCszY2N1SXovWWlY?=
 =?utf-8?B?QWRjT0hPL3N1clVIWDRhMnBMZFJOUVQzUHFObFFWcFI5M1J1b1JLbWNEZW9k?=
 =?utf-8?B?L1p2cXFRa2RZMVRDNnBRSHJtVVcvM0hnN0lsMFZZM0xWZm5VdGFyc09EMUZU?=
 =?utf-8?B?YVRlZ2hkbXZsZTFETDlHaEw0SzF4TDNZYVE1UUwzUlh3cWVTKzlzOXZMUFZu?=
 =?utf-8?B?cG5tVXNjZmNlN2ZZZ3JHbDBhT2tISmtobjJXOWp5TFVuZHN3eUpza3d2RXBw?=
 =?utf-8?B?OEF0NFdPdjdSZDZjaWFERGsvK3NIRjBOVGJzVHA0dExIcmZna09neVJTWExl?=
 =?utf-8?B?MWNYOWlGbDVOTlR6MTZUeThoS0NyaFlzYUhwL1pWajJSZVM1MGtFTFZMNGg4?=
 =?utf-8?B?cmpvWTROVEZmcEtPWVIyTGFsU2xIL2VFdm5mV1hjMTJ4K1ZXWVhGOXVJSE1o?=
 =?utf-8?B?eDB4ZkxwR1FwUW1HS0VyTzI5TVVYZkJWKzZYbElQa29ybXh1dDdnL0J5NnVo?=
 =?utf-8?B?TmsxVzJYOTJhZnd1L1N3SC9RL3BPVG5rc0hWOFF5WjZnYjRrd2VVSlJRallX?=
 =?utf-8?B?T1RJN3N3Y0NBYm5rNUxTRGJBYWFUcW5hNzNKRHkvWndSYTRlNEprVWh3dHZ4?=
 =?utf-8?B?OEdHVmhSZTlyc1I3SWRwUzZ4a0pMWGtJYXRYNDdaTGx1d21pOE5FN2Fncmgy?=
 =?utf-8?B?RFcvUXFqMmFQSzQ4SXVYOTcrVWdTYVRITXlqODVTV1Z3dzZhcWNUMUpkaUVB?=
 =?utf-8?B?Y0lIbnQ0QmtqdjJ3V1pKMEMrNWxNanBrckNwcDBHUzJmVFNmbmRhbTBlV1U5?=
 =?utf-8?B?bndoTDRVSGRoL3psdTd1dk5HWWd3SWxTYk53M3Q5dmtscGV5Q1BjdTBsK1Ni?=
 =?utf-8?B?T2x4K2RDcEVLOTh5bU5YcDVzLzVjYjdZa0xLVVEyNlJtU0J2T2pyaFNaVjlq?=
 =?utf-8?B?QnZhMlRtMDJUZ3Y4eUVpL0JiN0d6K3lVeFZvMXZCSW5ETUxVVE1ZSmpjR2o4?=
 =?utf-8?B?VGNMZUFTZGNiVjRvZDlqTTQ1SlZ2a1JmSXJGSkxORXhWSW9UVit3aUg0c0Y5?=
 =?utf-8?B?TXBTSG9aQk0xT2ZZN3Rac0FZSXVkWFJSM1Y0czYxclZiQVpteGE1eFJ5VU1x?=
 =?utf-8?B?OGFFMHZ1dUM5c2thbEE4MFQrZkRGRS9oSS9CVHNaMkh6ZS9HaFhZVjFCZ3J6?=
 =?utf-8?Q?36S8XnlM1ikbX9tT7JGhT8E=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V1R0KysxOWQrZjRic00zb2lVMnA1N2hYZUVCME9pVXlYcG11V0hvZjdlc1dp?=
 =?utf-8?B?OWJFem9NMmRnT21PWTVESTZUYkhQSUpSQjhxQlgvZDMzSlY0ZzhEd09rMHRw?=
 =?utf-8?B?MlR4bVNYZG10Q1N1cXEyaTZFaWZoZWxwbm9ZdDNvOEJiZzQ5OUp0cWhzN09H?=
 =?utf-8?B?emVyczdQaldGRTQ4WG81T21JOUs4Y2tkeUxVbzQ0bVA3MTg2UXJSN29vZko4?=
 =?utf-8?B?RTdTOXphR0pEdHNQbFBqMEptdko3bGFRUWFIb0UxV0xKUjNjNlN1SDBDSUdz?=
 =?utf-8?B?SjdOamlhbURmRDljNFdwS2UzaHJNZVJHRTVGOGJvUUVnYUtLQXVYdWNZdUVL?=
 =?utf-8?B?OVNOMDViSlRvRStuQkpyaDREVlFLK0VQclFNUnF1b3l6WmE3UlBEN3FoVk9I?=
 =?utf-8?B?NUxqMkR2QzZtZ1Z0U0Y5ZHdYRmVneVlzakROcW9xNkRmL3FrRXhRMzdHUkx1?=
 =?utf-8?B?QzRrOGRIdktvb1EvZDJubnJGM0U5ejRtbXcyNUQ3ell1SE1YWnNLR3RlT3U5?=
 =?utf-8?B?NEcwSWxqZzliTkF0OS95ZXpORUljSW93Y0Myd2tDYi9NTDhsRHZwWnVPRDBm?=
 =?utf-8?B?VUIrQ0RsV3lKR1JLTXRoYk9VcnBOcVVnR2FTbERaN2tSSkR6VDdCN3NoQklI?=
 =?utf-8?B?NjFNL0tPVmpXdkw2SVFLUGxJbDB3aWtBUlhpU3N3Z2NHOE1ZM2V6WElRTHBt?=
 =?utf-8?B?Q3RodDRNZWVmMHNsb3N4VC95SURJblBCUUtJNGVBUDErWEhWdnZwRFF2N0hs?=
 =?utf-8?B?M2ZCT1lZTzNLVnQydHJKYVRadzJDQ2IraGJqeW9tVVRZbWdKNExvajNSbE1t?=
 =?utf-8?B?dzNmTTVabGFhWWFwd1RoVGdBcE95dkpkRHU0anUwWnNEcTNiTC9LM0RXZ2Mr?=
 =?utf-8?B?WHhXWnJCUGhPakNhYmpnaEU3Vml4OEFtMkdCSXlYeWdYWW1Ob3VXNEVLcmg1?=
 =?utf-8?B?T0ZCMDhGTUVNRVpxQ2lPK21GZ2VWYXJXaFp5U1RyTUlHd21weXdKVXI3Q1NB?=
 =?utf-8?B?KzJSL2VmOVRVa1JhWFpVUmlLaXErTmNUYithekdvQ3VySGUwanlNTTZOdjhK?=
 =?utf-8?B?Lzl5VzVmZmZQOUVTMms3UXJ3YXRPS3pveXpJOFNIWUdrQVhGaHNCUEI0SFgz?=
 =?utf-8?B?bnlFZERKTitodDVoUmUvRGxoUzJ1NldPbUdXMlRFNlVoeXI1RTE5Z2Z3QTBv?=
 =?utf-8?B?dzBQdlJlaWoyanUxQk5GRC9yZjB5LzRFeThqc3c3Z001WU1taHI5T3VWUnM3?=
 =?utf-8?B?UWtycEtPUjNUL3BBcFJvdHo2ZXRvSm9pSHdzNTVvYjNGbUc5L00zc1lscWUw?=
 =?utf-8?B?aUQwQWJCOXpDdmpkRmU0VEpJWHMxVjQ5dnBYSDVQRGN0cmlvRGExK2VlT0VV?=
 =?utf-8?B?OVgza0xTM1NNUkVVKy9HdVV3NWFNOHc1VGJxQ3VodnhMV2Z5TzVpbkk0dEJI?=
 =?utf-8?B?LzRRNjJiR2wya2d4SVNTS0NUcjJJdjlOLzRYRHR6SjFzWTNrRU1JS2E0VkZ3?=
 =?utf-8?B?M3Nnc240NUpPVHB4R1lUSWw0ZlZ2TmdaZTNuT1EyR3BMTjNOV0tqSmZmcVM3?=
 =?utf-8?B?OHVYdlJPOUFiaU9kS0Q0Rmtick9MTlRlL0tGZmJoQ3dyRnZMcFFLbTY1Y3gw?=
 =?utf-8?B?UGNsRFI3NEIzRXRJQ2N6eFU4MlVmZFVVVUxKUXpVOFo5UUtBTWhKM28vQ01u?=
 =?utf-8?B?THVzNmM0NEt5TWpHWG90TnljSjFKaTVnYVhQVS8xSG8yWmxzSGc4RXZXL2ps?=
 =?utf-8?B?Rllaa3BzTEJZK0htbkkxSjFDRHkyNVhwU2gvUjVFZmxOdnhybUpWeENDQkND?=
 =?utf-8?B?eUZkOXZab0MrQWRtdmVmYmJSampTS1A5RkM3OE8zNEVkR1ZtV25UcStjWEVt?=
 =?utf-8?B?OWZmNXpCWFJ4MzNOdzNMa29kQTgwMUp3cTYwV0RaOWZLeHo3YlVjc3FVWUUw?=
 =?utf-8?B?V0tBU3plQlZCTEthQkRNS09oKzFqVHAwZ3I4ZE1UM2xZODRNazFCQUI3T2hx?=
 =?utf-8?B?RVNFT1E1Y0pzdEMwZkVWKzJzMjRKKy90ZjZESGw0SjQ0OGJaekdtZUl4ak1E?=
 =?utf-8?B?b3owNHFyN1pzR0ZkRWFhY0srdU5iN2NOUVZtWlFNVGtCU2ZSTDRiRWErWkxP?=
 =?utf-8?B?QTE5d1JHMGJjYW9naHh3ZkE4S3BJSnlGc1U2S3lxZjJFTU5OVVArQ05YWXhE?=
 =?utf-8?B?ckhhL0padFk3Q2VMSGZ4QXlqTkh4YU53UHE2YTlaUVRIcUtrVmthYnhjSkM5?=
 =?utf-8?B?c0dMYjlaZ2NGY0ZxM3VvcndKZE9ydU52VFRBb21NZW9la29MZTdiQjg2Ui8r?=
 =?utf-8?B?K2Y2NW5RNXFZMWVIV0ViOUVlTHlBQ0ZQbkQyMDZqMWM4RWEySEY2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <953624B2741D3341A6085A4BE50B30D9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vkU3b3aC8iGuR0LKYgROUP4GvS4ZBSqcC7mX34THt7NOVXw7rRRqT1BaMkKGhEI00NrV4WyNUtMpzd87Je3wf1RlAC57wrjtWH6P0AermpC1Ll8QPuMcbSL7CP2/eqPq4xPiNFesnFHVqvzY+AHfxz7xsuXq4z2/PpLGcNiKQd9NYYk4+GmfsNlwKcku82Y+dVCmYP09AN9wvaVqUVUlMJWUcZrdf4McyWYiyZKFYfZ0SVcr4J+R1HganDq/JxF8fgOPpCOq74Jg06k34A+cLErWVrvdOohIkI1YOEO5VLWsIhobVvvOto4iMHMGxlcA7GFCidO6/pCDhMURF7Hc9XJm3qiiw2PsftbqTIJEkgzSeYkCMr7AtD8aX9VJi6MLXipx5CTX3zEEvnUuNSDpYc9tu/w1RdGetZVUz+zA2Kwpi15+dqwIY9YauFcqzCt0dc0bcMddEWHyTWY5uOPhQKtVZ8bTrUN7hx7KR6gc46MJ8CuNIcYAQlgHVGh+GC/3TJodKpTJQo/P9r41Fj8oWIWX/09wjdk1Nw88DlnvfUfWOQvZlh8OFnT6MUFod7GMPnCwix8DEgNRsB5X9ggt30o1Ux1NXTSRrUO4+myP8Uh9+Q6oq7VGqEOXQRckhvxhlPHaKkZvfqO5U15IjyF/AA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6281ef14-7d88-4139-b8c5-08de53bc7ffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 22:30:19.8892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hBnO5O70a8pf11b9eeJax4GTq4OSQUtV2OW7JRwcW27gKTgFaT8ajIlkJKtmy4Wl1I6n0p5BZGPKPjWA5GuQ7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8728
X-Authority-Analysis: v=2.4 cv=NojcssdJ c=1 sm=1 tr=0 ts=69681901 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fEVKEfBvkhtXCfY4Wr8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: wr2T9OeFsuQxFq2zTYMxHuGZX8sZWHyS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE4NSBTYWx0ZWRfX5zFUwyPZkf8c
 PKE8J4k8Iv2RAc/d6d5gw+SDVFjE6qdH6WJp56ySYaS5URz1wDHUYpUbB9wiPWnBM91+J3dfEMN
 vhLVB6ujdql0CJZoYvM4tVVWL7bGPsfOT/YzTPURwm0cnE7FdsgdLPcqHOAav9tuIU4nBmzq8gZ
 F0fiTsZYMmZI6nj6WsHhkoIFODHBD2+24krfGlYgLEEO90lM+Y0jCrcNZ2R8UKhlRK29SqKU2Ez
 QAXv9hQ1P91xkJmcVH6BJqmwtSslI4IWERoHgC8Y8iHcS64LB2ztR79X8b0y5gL8YdsiMKLFFG7
 BZL7WUJpQpm+cmDL0EFX0m4pCIQAz/wavHBKv9s1UO6lJxjRudNVBsV1YiHwiBgWacGKP+wapr/
 ZLBLwWuQSFob2G7DoL68uEDzMQKMGZ0lOKLCvJciNHQK2o+tul1FtvkCFC6pGGBDDHX0EO0mZM0
 pAGfOQaq1s9OQ3UNqew==
X-Proofpoint-GUID: wr2T9OeFsuQxFq2zTYMxHuGZX8sZWHyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2512120000 definitions=main-2601140185

T24gV2VkLCBKYW4gMTQsIDIwMjYsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gT24gV2Vk
LCBKYW4gMTQsIDIwMjYgYXQgMDM6Mzc6NDhQTSArMDUzMCwgUHJhc2hhbnRoIEsgd3JvdGU6DQo+
ID4gV2hlbiBtdWx0aXBsZSBEV0MzIGNvbnRyb2xsZXJzIGFyZSBiZWluZyB1c2VkLCB0cmFjZSBl
dmVudHMgZnJvbQ0KPiA+IGRpZmZlcmVudCBpbnN0YW5jZXMgZ2V0IG1peGVkIHVwIG1ha2luZyBk
ZWJ1Z2dpbmcgZGlmZmljdWx0IGFzDQo+ID4gdGhlcmUncyBubyB3YXkgdG8gZGlzdGluZ3Vpc2gg
d2hpY2ggaW5zdGFuY2UgZ2VuZXJhdGVkIHRoZSB0cmFjZS4NCj4gPiANCj4gPiBVc2UgdGhlIHJl
Z2lzdGVyIGJhc2UgYWRkcmVzcyBvZiBkd2MzIGNvbnRyb2xsZXIgYW5kIGFwcGVuZCBpdCB0bw0K
PiA+IHRyYWNlIGV2ZW50cywgc28gdGhhdCB0aGUgc291cmNlIGluc3RhbmNlIGlzIGNsZWFybHkg
aWRlbnRpZmlhYmxlLg0KPiA+IA0KPiA+IEV4YW1wbGUgdHJhY2Ugb3V0cHV0LA0KPiA+IGJlZm9y
ZSAtPiAgZHdjM19ldmVudDogZXZlbnQgKDAwMDAwMTAxKTogUmVzZXQgW1UwXQ0KPiA+IGFmdGVy
ICAtPiAgZHdjM19ldmVudDogMGE2MDAwMDA6IGV2ZW50ICgwMDAwMDEwMSk6IFJlc2V0IFtVMF0N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBQcmFzaGFudGggSyA8cHJhc2hhbnRoLmtAb3NzLnF1
YWxjb21tLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgICB8ICA1
ICsrLQ0KPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgIHwgIDIgKw0KPiA+ICBkcml2ZXJz
L3VzYi9kd2MzL2VwMC5jICAgIHwgIDIgKy0NCj4gPiAgZHJpdmVycy91c2IvZHdjMy9nYWRnZXQu
YyB8ICAyICstDQo+ID4gIGRyaXZlcnMvdXNiL2R3YzMvaW8uaCAgICAgfCAgNCArLQ0KPiA+ICBk
cml2ZXJzL3VzYi9kd2MzL3RyYWNlLmggIHwgODggKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tDQo+ID4gIDYgZmlsZXMgY2hhbmdlZCwgNjUgaW5zZXJ0aW9ucygrKSwgMzgg
ZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPiBpbmRleCA2NzBhOWQ0YmZmZjIuLjEy
NTYxNjQ4OWUwNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ID4gQEAgLTE1OCw3ICsxNTgsNyBAQCB2
b2lkIGR3YzNfc2V0X3BydGNhcChzdHJ1Y3QgZHdjMyAqZHdjLCB1MzIgbW9kZSwgYm9vbCBpZ25v
cmVfc3VzcGh5KQ0KPiA+ICAJZHdjM193cml0ZWwoZHdjLCBEV0MzX0dDVEwsIHJlZyk7DQo+ID4g
IA0KPiA+ICAJZHdjLT5jdXJyZW50X2RyX3JvbGUgPSBtb2RlOw0KPiA+IC0JdHJhY2VfZHdjM19z
ZXRfcHJ0Y2FwKG1vZGUpOw0KPiA+ICsJdHJhY2VfZHdjM19zZXRfcHJ0Y2FwKGR3YywgbW9kZSk7
DQo+ID4gIH0NCj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwoZHdjM19zZXRfcHJ0Y2FwKTsNCj4gPiAg
DQo+ID4gQEAgLTIxOTMsNiArMjE5Myw5IEBAIGludCBkd2MzX2NvcmVfcHJvYmUoY29uc3Qgc3Ry
dWN0IGR3YzNfcHJvYmVfZGF0YSAqZGF0YSkNCj4gPiAgCWR3Y19yZXMgPSAqcmVzOw0KPiA+ICAJ
ZHdjX3Jlcy5zdGFydCArPSBEV0MzX0dMT0JBTFNfUkVHU19TVEFSVDsNCj4gPiAgDQo+ID4gKwkv
KiBTdG9yZSB0aGUgYmFzZSByZWdpc3RlciBhZGRyZXNzIGZvciB1c2luZyBpdCBpbiB0cmFjZXMg
bGF0ZXIgKi8NCj4gPiArCWR3Yy0+YWRkcmVzcyA9ICh1MzIpcmVzLT5zdGFydDsNCj4gDQo+IEFu
ZCBzaG91bGRuJ3QgdGhpcyBiZSBkd2NfcmVzLnN0YXJ0PyAgV2h5IGlnbm9yZQ0KPiBEV0MzX0dM
T0JBTFNfUkVHU19TVEFSVD8NCg0KTm8uIFRoYXQncyB3aGVyZSB0aGUgZ2xvYmFsIHJlZ2lzdGVy
cyBzdGFydC4gVGhlIGJhc2UgYWRkcmVzcyBvZiBkd2MzDQpkb2Vzbid0IHN0YXJ0IGF0IHRoZSBn
bG9iYWwgcmVnaXN0ZXJzIG9mZnNldC4NCg0KPiANCj4gQW5kIGJlY2F1c2Ugb2YgdGhhdCwgc2hv
dWxkbid0IHRoaXMgZ28gYmVsb3c6DQoNCk5vLiBTZWUgYWJvdmUuDQoNCj4gDQo+ID4gKw0KPiA+
ICAJaWYgKGRldi0+b2Zfbm9kZSkgew0KPiA+ICAJCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcGFyZW50
ID0gb2ZfZ2V0X3BhcmVudChkZXYtPm9mX25vZGUpOw0KPiANCj4gVGhhdCBpZiBzdGF0ZW1lbnQs
IHdoaWNoIHdpbGwgY2hhbmdlIHRoZSByZWFsIHJlc291cmNlIHN0YXJ0IHJhbmdlDQo+IHZhbHVl
Pw0KPiANCg0KQlIsDQpUaGluaA==

