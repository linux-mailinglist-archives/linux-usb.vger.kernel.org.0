Return-Path: <linux-usb+bounces-30506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF03C5AEEB
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 02:38:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B8D78343F16
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 01:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE71257843;
	Fri, 14 Nov 2025 01:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qimZ9ld8";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NCDjN/Oe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="J9u9/f1H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550452940D;
	Fri, 14 Nov 2025 01:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763084284; cv=fail; b=fRI5yQ+ENSuN4AkM07g5BF4enIEOsT9rNmS9nxs66wRFmQaRb3XRm9rd9R9SN11vX1KcRQ3L4lL158YG6Z3v0yyk0gsZUeG5+68gMRUk019RAknzAOCbqMcy+wKVPqGyjLODcJJwqtJwhPeOV+1TqbO60OFAr4gvMZ5yc9w3ViY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763084284; c=relaxed/simple;
	bh=MueS+tw+uYfVbYRGyHK55ZeWw8uM2kdtoJmXETqEHuU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=abBYciAdGcCBVjgxgZmSzm9cWcSSD69xP7ihi04ALCd06gr84r48VHu6B5y5gPHdTuhxxIW3FvG1AD1IjI7ywWztjvsM5RV5QImsmrh46HQD2MogHX6USqAN3Qab0PBj77aLifmdQA3Sl4H2q+gpN5fXvxOqQcMQV0BkdWAuP3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qimZ9ld8; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NCDjN/Oe; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=J9u9/f1H reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMYl392495417;
	Thu, 13 Nov 2025 16:03:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=MueS+tw+uYfVbYRGyHK55ZeWw8uM2kdtoJmXETqEHuU=; b=
	qimZ9ld8k5tke9cQrqgJoWN7Z0wpAMHIwpLxGPq27VbX5yIitLxvMKmftFfvJUt/
	NJSZgt4AXvilqm89los1UhW7+BRM1vbqL3vTMvEB5gfbNpcaNxBHDrEBIY9dF9rD
	75cJR00CUZMbwgyw0d9iroSzTmnNhodN6sHLefPkEJFu/275DbWP/WCzFXbamNDM
	lkIdEdF7XwGDzZiH39ozr1mt1Q8r5e25ZBLVISW/62Sf1MH9SFnb5j8/mGEe7SVJ
	MY76pH3sgtIsRllOUxDGBlzuHd/ML/XBFuUNpAeFzxwwhHqjmHQ2yPt2AMRBktN+
	FjudSSaFebOoCHiCn1xV0g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4adr8f091w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 16:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1763078583; bh=MueS+tw+uYfVbYRGyHK55ZeWw8uM2kdtoJmXETqEHuU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NCDjN/Oej05mUCUHkoLC4PBPwWkM9LvuUnQUXKURhnGns4eJStFWa3HCZ1pHOabJa
	 /0+m/J09WtMx9ToRRW3TC9c9KEHKuZpzxFwkCtOJvUZtbO2torEPQziDrbOTX55baF
	 7Wc6Wg6hk9QMARMZ4FYq5cjSEZfO30IThe4ts2r4XQBeuAiM6gH5J1PdUVOy8LepJO
	 cR1SDg6pczLNpZUtoJuMKAe/xjyJmcwB9u17a8zqLETJSTfZ2fkPwgYlADQTKJLSGv
	 ScW9kIMLuCG1H/WyBv+YJQ98Km21T1R92/RzutWkAWOniwJcFoOLEJbl301iZO/fF6
	 oIdWBGALaukVg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 824E840540;
	Fri, 14 Nov 2025 00:03:02 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 3FD65A007B;
	Fri, 14 Nov 2025 00:03:02 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=J9u9/f1H;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00105.outbound.protection.outlook.com [40.93.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 4DBC822020C;
	Fri, 14 Nov 2025 00:03:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOXeGLsgEE9vWsinZ2C40ZSRBQH4wDr5tHFAn4pAbCdfnhLBTQO6Vn1GApFPh/85a8paFP1e6RrW6LH8Stjz6KW6bHeBrKQjIyx4/tfxLcduDwcXTEz4N6KYp3Z0Hbz8gduvOYGzEmDEa09APdPInY6GCLlXMkT8Njj+7OOnPvnqZDYxHJamF8F+hUpY9q4NcdwmHOsWj6FEI3LGPjtDYiYydpslEmyGRLTHh16lojAOyI6QatntPslc4ZI1fWm+Yh3VBZdMXnRpJ1BKsG8q5WLhBF9YHU4dxKIM5RJHR+at1/KEOFAsrHcUQ7qCQtTRXopGTyTiw3odkioEyzVF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MueS+tw+uYfVbYRGyHK55ZeWw8uM2kdtoJmXETqEHuU=;
 b=IFTelY/wnHPYAv+YoS1g1q8UuqLoObnsIJ8eFlrKKs9KhA9JHO7q8OUiOHEZcrk9ORFuIO3CBkSScnr+dkyLfGeh8V/y8NWu/DW3YW8FKFnnlBv0gSN9qYWmk+YqosNRiKhCvjJXqxrJkHJP1ckLml3sqo+axFJzD8jJTvF912LsoW5gdgQ3pYa+2w+ldSC54DqIuiAtVwuyn6kjty/63hJa4eDQuL6HyUidS2O7Gqm71z43/oStlhY+imwQXjrKo7IWGGBzCvbv7uJRjtdQ6gvDbso8+NASXyzir9fMlmE3jgfXB1qNZdrs9i8EbkqIIq/E2JtZ1Ut9Ad492/ajfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MueS+tw+uYfVbYRGyHK55ZeWw8uM2kdtoJmXETqEHuU=;
 b=J9u9/f1HYtJm4OQYtOOgluBRHNt5fGwybASRLYoXKufHdKsy1DfroF0ApVZR32UuH0Cutq3wUlgsKmyFB6JqnUHx3uwRUHUSqLBug0yZMib3EwFNk5Q1fa6x8o5t+JAJECA75dSweAr5tSPBBJVag4yIyfdqz1ByZTPxA65TWmo=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA4PR12MB9809.namprd12.prod.outlook.com (2603:10b6:208:54f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 00:02:58 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 00:02:58 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: "adrianhoyin.ng@altera.com" <adrianhoyin.ng@altera.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "dinguyen@kernel.org" <dinguyen@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] usb: dwc3: of-simple: Add support for Agilex5 SoCFPGA
Thread-Topic: [PATCH 3/4] usb: dwc3: of-simple: Add support for Agilex5
 SoCFPGA
Thread-Index: AQHcUtNmqaEaMwVSyEa97K5KFlBk0LTxTmmA
Date: Fri, 14 Nov 2025 00:02:58 +0000
Message-ID: <20251114000257.52ahtqht7ax4o37l@synopsys.com>
References: <cover.1762839776.git.adrianhoyin.ng@altera.com>
 <6281ebd197c36d7bf7fcd3b2b5781ffda22e0f93.1762839776.git.adrianhoyin.ng@altera.com>
In-Reply-To:
 <6281ebd197c36d7bf7fcd3b2b5781ffda22e0f93.1762839776.git.adrianhoyin.ng@altera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA4PR12MB9809:EE_
x-ms-office365-filtering-correlation-id: a4899be0-7ffa-46f4-1e01-08de23112b94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?TldsNktvVXYxNFVRcjMvcmZXOTNBcTc1c3VEbklaU2ZWbk5zc3ByQUw3cXhI?=
 =?utf-8?B?Vi9Md3hKam9IeGpRWFUzV0JGNzNvd1RURC9tOUxpclZ0MlFZVnVldlZ2aTNE?=
 =?utf-8?B?eFA5bEJKZmhiZEZNTWdxOWdWN1kxV0NzbVBDMVJPTXFMZzZOd25sekg1cThk?=
 =?utf-8?B?RzN4NExFNmJPK0pkQXN4c1VhdFBTUC9wbXd4V0kvL0podDR4Qm9vL2VEbUJ3?=
 =?utf-8?B?SitOVVhFMVhNUlgvM2JGRG53WTNMdm1ySXc3NlRTR3BCSTdmRjBzSWExc2Jl?=
 =?utf-8?B?NlJzNTloTUpSaVFPYk5UUXFtSTZlZU1lRVNWUFF3TEJOd2FqcWhsd0ZsZFF6?=
 =?utf-8?B?c1VsUTlzZ0xiTy9hdElWUk1VNjhybW9acDN5U0NyczdJNkowYkowbTNYUE9Q?=
 =?utf-8?B?N0hOL0VUL25FM05XWEwzdkVrNzhuUzk1NTFyRTU1K1hYYnczcDBEOWhQbmJq?=
 =?utf-8?B?VSthNXV6LzN4KzdyWjBmMHVKZ0EySmVjVm5ERnpBcGNjRFE3eGh5dEEvVVBy?=
 =?utf-8?B?Mkczdi9HVTBvQ1JzYVpXVGh1WE1nMm11R29FZzE2SlYrdXlqMmk1T0ozczBs?=
 =?utf-8?B?alM5bzdzWHJ3bXlXWWlOOExHMjg5UDRUaGh4TTVXNGJsVnZrdWg1L0dicW1Q?=
 =?utf-8?B?aGVURStaR3FCdTNOU2RucXRyUzVBNmZERkJFMVVkMitvcXZmR1NHTW11R3kw?=
 =?utf-8?B?c2tVRkJqaXBrNUp4cnl5RHlLL3BiL1ZZQ1U4TlRIK0F0aG0rd1QzRlFRUndZ?=
 =?utf-8?B?eE9ZK3dWb1U0WWE4R2NsQXlSaGtBMmlnTTZHTU1OeXgyTmtMM1RsbTQzN3Yr?=
 =?utf-8?B?RlhGUnFTQnhvS0I5a09kU3NZYk5ONHlESlRpK01takFrZU9oL2FJR0ZSb0Ur?=
 =?utf-8?B?TEJaRndUakE4MW13TC9QdHBmbUJYYklFRVBTdm93VWkwdWNIY1g5d3pvQ2lq?=
 =?utf-8?B?WGVvdHVzbkFHVWFnTVAwQ1A4aVFxOEErOW5ZTnNkUWVJcWNhbEFCbTBFcnpJ?=
 =?utf-8?B?ZnZxaEhmMDlINllYK3Zvc2ptRklTRzBCTUFwZWJJdTZHOTVvVmNOZlc1alNC?=
 =?utf-8?B?NjdBbW11S0drYXZMTVU4MlRXcWVqckJxbWU2NlBhWGNJYzFwTTNmQXZNQ3RW?=
 =?utf-8?B?SW9JMXlqYUY4TzRML1FsWTY5ZGNrRlZpL1ZjU1ozNE5NSjFzbmhLdDluUjdX?=
 =?utf-8?B?QXp0Yi83MU0vOEdTMkljM0VQL01ONVhNb0dKaGtzSnVUQkliaHhSM2xvRzl5?=
 =?utf-8?B?U0k2eFp6TThUa29hTFR0cUdPM2JRczhnSHJFaFBWejlZT3ZwbmZ5Z3pSNWNs?=
 =?utf-8?B?eTM2bFVVUFEvVGUwVUdwN2hNbkRvZVh6Z21lWTE0QWk2MGtRVHQvZC9wQlpv?=
 =?utf-8?B?alA2SnEyWlhDVmMyMUh2TlZWbWlyUHEzSU1lalljN3RTK05xNjA3aVM2Ykdu?=
 =?utf-8?B?RTRDdkNsbUN6Y0N6WjRMZ3FkaEZsb0lld1dZNFN4KzNMMHQydmJOL0RJOWRo?=
 =?utf-8?B?dXROYmZ3eFpDWWw1NXZVZFRKc0RweENHUkZRRXFVOEdVcGZjUENvVFBFTFB6?=
 =?utf-8?B?ZXdmd2JjcExqMVhFWHcyNTVRQlRFZHAvNnhhbWlDNXBCR1RNZndDRXllSXZh?=
 =?utf-8?B?a0pjOS80WTFNajZOOFkyY2VRMmpzOUtiWDRGTFhsekZNenhFUFVSU3NkRFVn?=
 =?utf-8?B?MnNpRjB4SU14YW1QR0ZQMitWRTh0VHJhOTNWaHgzclJJVkF1OGZocUhBaWc1?=
 =?utf-8?B?VDcxR2RGNWZHY2MvbkhZZVRlODVOZlpTQ1pWRzZsS2pobHh6V1ZxZVBucWhn?=
 =?utf-8?B?Z3Nac3N4TTA2RlFkTzFaZ3hUdVgvMVgvdXd2emNoakFmMlYrNm8rcUhxbyt4?=
 =?utf-8?B?WmlWYmJvaVBzeElBM3JIbTc0aWczY2p4UHRYbDRXRGtXLzFBbkhuNjdENHVr?=
 =?utf-8?B?ODdOdy9nRDN0eGFBakNRQWh6N05xVFNKSndBTCtwSk4vamNwUTN0Z2RKeEh4?=
 =?utf-8?B?TWFuOHNVbFBIU0N4SDZjVHVySzRiR0pNNzRsODM3YWFyRFFyL21udG04eURh?=
 =?utf-8?Q?fgHS1V?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SE13MEdneEZDWnBRVTdxNzBNekxubStrUzJUMTZMZEZXamljYThnY1RQdTJu?=
 =?utf-8?B?VWZ0Zm9oZ0lYSmZSeTQwa0RRanZPd1M3S010ZzN5dmkvYXhJRmdFNU1hOC84?=
 =?utf-8?B?NzBuajF6cE55NmJOTWxxbUhUemRqZEovU3FDUHk4ZjBrSlEwN0JOckVCQlVv?=
 =?utf-8?B?MU9ENDVibHEreVd1Y0JrRC9qZ3FYVDFTemticjcycHNYVEpFaHl1TkpPOW9W?=
 =?utf-8?B?Z3VJZmRBQzAyNUMvZkpZTlhkOXIwZ3E2K2szdERhMjlwUzJTZVVYWUtvMmxV?=
 =?utf-8?B?OEtoZzQ0T2JxZm9OZzB2dnZzbTJYYmVjNDhlTnZmZldyTjZJdVJjdUR1UWpK?=
 =?utf-8?B?TE1PazhqMzJNNlJlUkpFWlBpWVBwSFJuYlhRYVZLb3RXSC9xY0JIUVdaQlJu?=
 =?utf-8?B?ZGt0L3puczl6RWROMnVLcS9BVk94THdoZFFYb3hjRTNZNmVPdVpKOFk3VFVY?=
 =?utf-8?B?eGdXWm4rdktiQ2NkcEo4cGFYS054b1RCZDNuU0UrenNTU2dsWkgvdGQ4WVk4?=
 =?utf-8?B?WEpTbE9JL0tRck1UUVBUL29BeGZUaldOVGJRVHdvR0lWTnJWNnlaWmxQdVFv?=
 =?utf-8?B?dmtLYjNUUzZrbjJvaUtyNjdFL05OaHN3TlE2R0dPLzAvbXZqOHk4NzUxekgv?=
 =?utf-8?B?MWtRaXVEOVR1VEpHUTJvY3BWSmRKcitGaWFzbS80dGpmTFdKMG51bUVYNnVz?=
 =?utf-8?B?VURSbGtMMkh5dDJ0MU1QbGJRbFFKc3FKMmc3WFMwR0g5WEp1NnlKQitCellw?=
 =?utf-8?B?V3JTak9iSzZRVUdTekdRUmNYc3EwUDhmaGRRaW1uZ2dKUEVNRTNtYlpGU0pG?=
 =?utf-8?B?WlYydlc4YTE1WW52clRtNG0rNXJaaktGd2h0NEM5aEpLQmJ2em1xV2tCcGJI?=
 =?utf-8?B?dWpqSXFQQWlQdm9zdDJmVXYvS2NvcFdLYUFnSGx0dW1GTWNETC9xR2VjZXVV?=
 =?utf-8?B?elhoMTRWM0J2TXNFbVlvQUlkM3ZYdXR2ekJQQkJVMnNUbW9QaGMrY2xMQlVB?=
 =?utf-8?B?ZFl6ZzFBanZpNk5JdVh0bEFNTTkwMVhQeFlUUXdQd0E3dml3YjJ1cjIzb29K?=
 =?utf-8?B?N2FSS3czRmVqeGdmVENvUEs4SkM0aHFNOUx0dUhtbXpUbTBhTVdPUXhqNmRT?=
 =?utf-8?B?emxpRHUwVkJ4a0JXQTNXMWhaSDBtKzJkU3RLUVE3R1l4Z0FlT2YzM2RXTzlO?=
 =?utf-8?B?blpxNERXWElGY1VqamFzZUdISTJVVHJKancrTmN2MVpLRTFGZHF5V2tibTU0?=
 =?utf-8?B?M2wvbGJmblUrQllYbUM3a2dCazY0OEdqQkVKcitCdSsvaUoyQ2hOSEN5eXFF?=
 =?utf-8?B?U1Z1dzQrMWlldE13REJhaUVpVVREYW1JRXNRWDYwTm5ONU1TQWc4dUhBLzdi?=
 =?utf-8?B?STN5MzEyUnlzSE9YeFlJTGQwWGVXVUhWNWluZ2ZkQkZNQmJMdWJOM0V2YzE2?=
 =?utf-8?B?VlVHdEgvaWUzS1g5RnlYbTc1REx5M0pDWmdWaWR5NGVIdlJkeTNoUzV3NFZL?=
 =?utf-8?B?YzB0TXhkdjBpZlhudHk0OThZYTQxUVVFbmZQQkFGaENtOEdmSE9BRXNUNlVi?=
 =?utf-8?B?VEdGUXkvNURyWGNNZ0sydDdybW1pRG5UTlViOGd5RmpkOWNSRlRIWlcwbmtK?=
 =?utf-8?B?MC83V3g2OU9ybjQxNHpISkFlWlhwMEEvMFR2UERuczFJcllKUHBNTU5PY0l2?=
 =?utf-8?B?TTJ4ZTlmZEtJdGJXZkowQStOL3hBRjVyZU1kQ2dlYktORUN5dmR3S09yMnM0?=
 =?utf-8?B?eUh2a3JzV0JTUFE2RmpBbytYcWY1ZUpmS25UU0hMTnpxSHJ3R3dqQlZZeXNX?=
 =?utf-8?B?ZFlJTGozUnJ2eC8zbkIrS05zL1l5QWprOE9CSUlpVTRwM2dQU2NnTmVIR0Zv?=
 =?utf-8?B?UE5oamxuOGZIM0pXeEdKOWF2d3FjZldTL0thdTJ6b2UwbFQ2U1pkOTBHSHNw?=
 =?utf-8?B?b3Jyc2pOMjhKcCtwQmtVUWNyRExjY1JtNGZGZEZ1OVQyN3d3WW9JdTZxclZH?=
 =?utf-8?B?ZEJ3MWhVQXlyWkF2ejZXcStYeXlzaFBUdW5MOU5mMlhod2pwU05abGY5cWMy?=
 =?utf-8?B?czZsT2xrS3RqOXhLb1A4RjR6M0JXeTZGdmI1RVhreEhZTWNDdHErT1huSnB2?=
 =?utf-8?B?TmtXRWhwTWhsQVRSSmljSGcxOEFaaHhzN3F5NTRPbS9PUWJwdzhieG1oa1V0?=
 =?utf-8?B?Z0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <218C156DF60EE74D9032DDEB6A91C1EC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JN4ILkGxJ5dbl1Mg7QFn6Mlxk4gfcwXlhEUWPrKxTHnIThuXvhbpy4UZHI8wzpUnWQehnukjtPhFGHozqq8XJSZX6RHhOBH72KsSyUzs0fsMnIxNYQE9XiajbycDDqNv91DV5o+aFxit56oJ6X1i24WeBoJ0867aY1uQdBfz7tRGo8X4crjUP/gI7ugpetWr7BOQ0dCCr0Vb5Bgaly3ah0g2lfSooZQeZPYRX1W9kMCfX76KoFek6WiFnK0Av6kmOhX4i52HW5X6T7y7AgZ0N7uybkYB/7l2Xukwo2fhi5H9fXXof4aT5A4h6PzfMne0TmauKghuLV6gvV39SQScF375vDmZB6LBVYH7lshPlX62gaN2aZzVZZVZvBohuHr+QZT8ansdZ1t63JmnCJA5BhVGtYi+qc2SZ62047iYwLHYvhTFQsvtSZX3plVMe7H6EmILcZ9enD0EvZaZrS3r0+0lpi0Dj7d1c1F7j9wAPJwdgw34GiZTk4YVkUt7WF0z37+AoR5Vhu67sbwPKN1StU0ZTjrRZip2RdpSnTwCCj6fmIZQ8E8o8ASFY/14drwqKES6KMTdCbbpvHvQOsgKA4PMqZ5mxZHiC7Xm2MyFjFpskjnkemHBfY/wcAfNGDJa3ZTV/JFKzDy/mowEgs2Mtw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4899be0-7ffa-46f4-1e01-08de23112b94
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 00:02:58.5503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CVUg8eW9n47Xkhu2MUV4Ak77+rlfRQEUr90vcWxhtkruZIDyoElAeV6gSEDrrBrB1DLGCKHX2FNZE6FFmp/8/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9809
X-Proofpoint-ORIG-GUID: d5gEKogoL50VAoAM4_KDTb0YrNNuo6Bc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4OCBTYWx0ZWRfX42o+ATTF+Ikv
 eiSmGL37PX+54mTR13T8PM5h4b8GSYRrSEhF8q479WvVk3SFTrjyIegCAxYYsR1SNE+6tEyRpLe
 /VeQ4stdW6CdcYmnTVFcq1e48CZ5HIv3r3T5mz82NPQxYYLJ4UAXwzWltS2tt02Snbb7/G6cKF/
 3r4vLyoIUApypKHKVlRcNt+DdRTdP2fZZqz5UDtfNgxkFQuo7TULnOfihze9szXZjuB2Zaomowm
 6PgSAT1BG6Wx1c08b1DMwz8Z9YJ9rfcfCdcAHvXBd0QQ/WMtxe8NFt4l1DgyEk6xQcmSclazFcj
 W+VTRMieR3tWySNGv79MCZ3OrR92pYaus+ruVgLOg/HHY3lIY8qhA/eKW8SzccgK2uYU6wGZHK8
 doAgdeDFKlUIjTLEd8WgujXH82+7mA==
X-Proofpoint-GUID: d5gEKogoL50VAoAM4_KDTb0YrNNuo6Bc
X-Authority-Analysis: v=2.4 cv=W+01lBWk c=1 sm=1 tr=0 ts=691671b7 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yBYpec10AAAA:8 a=zK4bXoEZBYrDSPMl7iAA:9
 a=QEXdDO2ut3YA:10 a=zbxmTX4fiVD2UiCe4Dha:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511130188

T24gVHVlLCBOb3YgMTEsIDIwMjUsIGFkcmlhbmhveWluLm5nQGFsdGVyYS5jb20gd3JvdGU6DQo+
IEZyb206IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbmhveWluLm5nQGFsdGVyYS5jb20+DQo+IA0K
PiBBZGQgdGhlIGNvbXBhdGlibGUgc3RyaW5nICJhbHRyLGFnaWxleDUtZHdjMyIgdG8gdGhlDQo+
IGR3YzMtb2Ytc2ltcGxlIGRyaXZlciBtYXRjaCB0YWJsZSB0byBlbmFibGUgc3VwcG9ydCBmb3Ig
dGhlIERXQzMNCj4gY29udHJvbGxlciBvbiBBZ2lsZXg1IFNvQ0ZQR0EgcGxhdGZvcm0uDQo+IA0K
PiBUaGUgRFdDMyBjb250cm9sbGVyIG9uIEFnaWxleDUgaXMgaW5zdGFudGlhdGVkIGFzIGEgY2hp
bGQgbm9kZQ0KPiB1bmRlciB0aGUgRFdDMyBzaW1wbGUgZ2x1ZSBsYXllci4gVGhlIHNpbXBsZSBn
bHVlIGxheWVyIGlzIHN1ZmZpY2llbnQNCj4gZm9yIEFnaWxleDUgYXMgbm8gcGxhdGZvcm0tc3Bl
Y2lmaWMgaW5pdGlhbGl6YXRpb24gb3IgY3VzdG9tIGNvbnRyb2wNCj4gbG9naWMgaXMgcmVxdWly
ZWQuDQo+IA0KDQpBcyBub3RlZCBieSBLcnp5c3p0b2YgS296bG93c2tpLCB1c2UgdGhlIG5ldyBm
bGF0dGVuIG1vZGVsIGFuZA0KZHdjMy1nZW5lcmljLXBsYXQgZHJpdmVyLg0KDQpCUiwNClRoaW5o
DQoNCj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIE5nIEhvIFlpbiA8YWRyaWFuaG95aW4ubmdAYWx0
ZXJhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtb2Ytc2ltcGxlLmMgfCAx
ICsNCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1vZi1zaW1wbGUuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1vZi1zaW1wbGUuYw0KPiBpbmRleCBhNDk1NGEyMWJlOTMuLjUyZjllZTIzNmExZSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9kd2MzLW9mLXNpbXBsZS5jDQo+ICsrKyBiL2RyaXZl
cnMvdXNiL2R3YzMvZHdjMy1vZi1zaW1wbGUuYw0KPiBAQCAtMTc0LDYgKzE3NCw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9mX2R3YzNfc2ltcGxlX21hdGNoW10gPSB7DQo+
ICAJeyAuY29tcGF0aWJsZSA9ICJoaXNpbGljb24saGkzNjcwLWR3YzMiIH0sDQo+ICAJeyAuY29t
cGF0aWJsZSA9ICJoaXNpbGljb24saGkzNzk4bXYyMDAtZHdjMyIgfSwNCj4gIAl7IC5jb21wYXRp
YmxlID0gImludGVsLGtlZW1iYXktZHdjMyIgfSwNCj4gKwl7IC5jb21wYXRpYmxlID0gImFsdHIs
YWdpbGV4NS1kd2MzIiB9LA0KPiAgCXsgLyogU2VudGluZWwgKi8gfQ0KPiAgfTsNCj4gIE1PRFVM
RV9ERVZJQ0VfVEFCTEUob2YsIG9mX2R3YzNfc2ltcGxlX21hdGNoKTsNCj4gLS0gDQo+IDIuNDku
R0lUDQo+IA==

