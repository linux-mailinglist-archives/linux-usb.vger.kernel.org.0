Return-Path: <linux-usb+bounces-19463-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 547B7A14694
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2025 00:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962BC188C828
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2025 23:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581581F3FFC;
	Thu, 16 Jan 2025 23:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QZL8ywaU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="UPa2fTuO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YvoFxInb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356D01F3FD5;
	Thu, 16 Jan 2025 23:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737070541; cv=fail; b=OCnvHvk3pkHecZEjgZrupgfvpWZtrDMKHfENm4L2CrxFy1xBOJiOqcfMbQMzCtvA9MMfVFlqGXYFg25ehEdysQsQiilksbz2dfNw1a/6mtMwl6NoxCnclN9KbyJgM/PCP9RAtmILpTA34ymxZsZCLOtCvGj8vXXgCFvtrleMavo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737070541; c=relaxed/simple;
	bh=Mw3cAuAudoJqMZrSSUxIgoacwQFUeFgwDTQ8OiyO0D0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J891V6oMFn8rHH8xyaw1jxJAhk/VlSvgtcnC85NG6L4JKglgdeTwVYKO1D38G6AyApl02N7nM3AAra8IXluklai8pfx0K+pUGSMxLvPzg0obNF7xjYUrhq3EznnX20LUtwW3I0H03X5QkDjP2N494b7fP/by7KU4Tq0pzX+IbJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QZL8ywaU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=UPa2fTuO; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=YvoFxInb reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GKqjvj013197;
	Thu, 16 Jan 2025 15:35:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=Mw3cAuAudoJqMZrSSUxIgoacwQFUeFgwDTQ8OiyO0D0=; b=
	QZL8ywaUvS8Zsl06W+piGl8vvq3Y3IgZ9Au1YlucCqKSI6rgsjhC7JgUQNWqTcFB
	5qAUC3Fg3bRCuW8cGSUGMLfKYTzGB8gcUGxWYKfr0TMH7Ez5z+qO/AGtQ5Axm+3a
	oAZUJq+Geweo16hs+LZi1PWR0RZoO63b39GjzoQN/PNRbSGXQWHAxVMULIWS8sND
	fXTTNlJvGDPSP7vFzjg6lgheBTn57TuWlW0itGZuVYteQmgMWG3K5H+hA1mOkdNf
	R2XlvIgntXEAivlJLY7q3RRnt+SYI7fI3u+3LK0zGiIUcXvuzZwZ8Ie0WaNoflcH
	aIZykrI3UUuHM2ouPqq3Sg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 446y3evb8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 15:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1737070525; bh=Mw3cAuAudoJqMZrSSUxIgoacwQFUeFgwDTQ8OiyO0D0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=UPa2fTuOHcQC5Rs41KNhNIalhGC7Lffe1mkzEVsyE7mPtWrEywkWdqnPWn+NNJpzo
	 P9KJyq5tn5FioK+wu7SeFvAGQoC0mE5Y+vTeCjo90U/aokQphXNexWZoM0zNwVuO13
	 6GLRg/uGcI8D62krC4ghTdy8wh65wW6SiTNFQlmeC+c+ellNe6ZGHCM+tHEJj4GKUV
	 hRBLpty3Nk2dG85apVVotghXQEaXgZrK9P09Qig9u59SB8W9QcSm0lVeXj5YBy+c7b
	 ut2nMXisXc3ZHGhaqoT8lN/F39Ed8il33coQ9Op8lTwmSlDl5ZMC7036d+snu1Poym
	 7zUwQFe1pIWiQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E291B40105;
	Thu, 16 Jan 2025 23:35:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6E87EA00B1;
	Thu, 16 Jan 2025 23:35:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=YvoFxInb;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C081940126;
	Thu, 16 Jan 2025 23:35:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjQ2OVLk/2kZn8Lp+QZ9dUYMZ58ynjvqZPoUrfm7TkbFxcs5xRogmdGa7TiWG21sFieLzYcicrh1YWGsj2du6sa7LWPUJ9SWxrGVy5RxqJOlmuW+Cj5rdSmhHLDvLhBdHuyweHwKfd8xH5XDfR6ajqYs4U0Kj9MkF8Spo7p6b1I+Crva70qbEaZLooARuwNgLCEU3qP7q+P2nPPAMQay82V8j+8NBXDdKrGM6AndaCyLmK2iwjjiFcddB6BkHGiMKGgemAi6a9ikuz10ynZYzj+AhMXBrqR+9abtIgk2G5Z3tsJUL7CG3mpCtKlKicNfvWz7XaW0j1Zho+pe4YQ8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mw3cAuAudoJqMZrSSUxIgoacwQFUeFgwDTQ8OiyO0D0=;
 b=e9AG9UKzAUMW7e7lj+b+jsmoEw1fnJTwK6FwgGNa/jGSPRV/HuW1YSkMsJw9DNa55ZIJWKxqCnDQ3TubTsegFHv7FkYTWKnANvq/4T9bNFD1uX6S44l2sMSUto6gRbJUkvYddZ/shodgH5b/SkoP8AJb7lzSc4Hgs0rE/pQ1Q9/wei3bSNc73UzYJL9JWaYe69viUxURbg1f6GLPoBoG1aHuuoRd5OGrmXLS4lbI/WIFM4LinJ7IAJp4B0Yw4RnC6G8Af/MUIT81MVIlzDSBrpal+06i1vad5nnEiI9LcWPoHBWiHSsb1QNM1zhGhtTk68ZxXo54/vd0ArRKftY0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mw3cAuAudoJqMZrSSUxIgoacwQFUeFgwDTQ8OiyO0D0=;
 b=YvoFxInb6m+eUYakyGHtRI7WrgPhp+Y1Y2/0JK0QMnBk6leJLxNhNyiCzHNHvVUSltY0hDUy2vUzr96FV7ESiCOQpvwrWvESE9fkpymFnT2EECq10TL9rkS5WP+C0QJuJNLY+VH/9qC5Rvnm5R7hUYTgu2FYrk2uj5ul9wTcva8=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CY8PR12MB7513.namprd12.prod.outlook.com (2603:10b6:930:91::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 23:35:20 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8335.017; Thu, 16 Jan 2025
 23:35:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1 2/3] usb: dwc3: gadget: Add support for
 snps,reserved-endpoints property
Thread-Topic: [PATCH v1 2/3] usb: dwc3: gadget: Add support for
 snps,reserved-endpoints property
Thread-Index: AQHbaC0cpC84VeNkokazhZuYFimpJ7MaDjKA
Date: Thu, 16 Jan 2025 23:35:19 +0000
Message-ID: <20250116233507.sifqs5u3rixoz4lw@synopsys.com>
References: <20250116154117.148915-1-andriy.shevchenko@linux.intel.com>
 <20250116154117.148915-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250116154117.148915-3-andriy.shevchenko@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CY8PR12MB7513:EE_
x-ms-office365-filtering-correlation-id: 6d579369-e4fe-45d8-34a6-08dd368670a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TGlJWFBkdkJhTk9PUVF6WEZSKzYxSHBjbkEwRUdjcG1vZjRkeGJJNzlNU0dl?=
 =?utf-8?B?M1YyWWZTSmNvY0RZK3E2VHpQNFRsWUZYcWNIZUFhditpWHhsS0wzbjAvNmND?=
 =?utf-8?B?RTdBdE03c0pKTEVvMXN4NXYxZ1Y0WTA3bktyeHdVSXFvM3kzWTlpRzErWGRz?=
 =?utf-8?B?YjhNUVI2VHNhYkE0d1dVeUF1bDdqdm1Kd0RmTVRnRHhMOXVlZ09CeXBEb1lO?=
 =?utf-8?B?MEQ5aXRidm05WlNaYTl1eVdxbVJRWC80M0E1UzhzSGdSMU1OdUhVT0VrcnBH?=
 =?utf-8?B?QXFKRHJEb3RLeEhudVo0aW5JcVMwb20rZDVjeUtUdU91bUhPVHFtWmtWbml6?=
 =?utf-8?B?Z3J1NW92SHFXU2F6WmJCZ0xXR0p6WlB3VUliSENiRllNemluYkdUcTBEaHBR?=
 =?utf-8?B?Tm5sbnZiNXBRZGJtSERrMXNLMnlpTlR1SWhHWEk5SDR1L0djKytIOHIvWStl?=
 =?utf-8?B?SElFVmhYU0gvQ1M0b1NVN3llUmVsUmxLZlRxVmNKSExBSUhGQXFMVG1EbkpV?=
 =?utf-8?B?WWV0L0VLSEJEK255TnpaMUVib3c5aDRuUDY5YjhOL3VTTWZiSVdGaVZLVHBh?=
 =?utf-8?B?YzhJOU1MRzRET1ZvQmY2Qm1ndjU3RVlENDl4OHpTTm9ONnQreXN1QmxkMXVo?=
 =?utf-8?B?aGY2Y2ZTVnBFY2lkaVNzaFBBSnpza3UrNTBQYmJWZFlYSDNOenpaRWNUWGFj?=
 =?utf-8?B?TW9nc040Vkp5cVNMcmlyWVlzUUprZzZidjhZQU5uaGlzTXprbWdSWmF4MHhS?=
 =?utf-8?B?d3hIRW52VXJuNEdrUFJTNG1FdmhybitnNFpiVFdHU3hGVVdHSjlyQUppNDZ6?=
 =?utf-8?B?aWl0MWVPck9qMnEwRExiQ1lpMUh6NmhnSDkzRGVQMnRwcGRkc0ZMS0Z1UDhs?=
 =?utf-8?B?bXY4WXVZa2FlL3A2L2pyZUZnUXVXRlN3ZFU0LzR1WjNNNzBuRW4xdEs3dW14?=
 =?utf-8?B?V3pabnRIdE8yeUZ5VjRLeDNvSFRPRWpzMXpiTnV2NU9sVmFkdTg2QWdlSG5l?=
 =?utf-8?B?K1l1MjJsaXYxZ2NGcDVCaWpTNEluKzYvcmJDaHJmcG1jN3FFYXBRS0JSQzg3?=
 =?utf-8?B?eWZWU0l3T2poMlNZaElPeWlmbTY3QmVEeFQwTVlsSStvSkI0S0M1eGhiVHp4?=
 =?utf-8?B?NzVqbFRWeWdhZ2ptVFN5cXpHL2Q1Vk1KMHRuNGR5U25nQ1NtNzB3ZHhpRlNR?=
 =?utf-8?B?R04yOHBZZHZGTUgzQ0Q3UXd5TUF2OTl6cHk1NzkyK0tid0ZHemhvc29ka0px?=
 =?utf-8?B?RDdDVWJydGlIcFlWb1I4UTR5U2JRTDN6aFVSdlN6eThVbDBHMkpXS3drK2l4?=
 =?utf-8?B?NVVycWpaVDN5OWR4OUhkeDdEWG5HZzVSS05RQWYyRWo1MmlkWnY5THB2UUtv?=
 =?utf-8?B?RWwzemVjSmk4Z0hyZ084SVBrMHJqbTRGenUxMEpBclV5U2ozNmNHelVvVXZK?=
 =?utf-8?B?c0ROUmdtanZTZFJFRWVEY25mTjIrYmdXcmRxM212RzhTQW9PV2NDcFpxME1X?=
 =?utf-8?B?TGY5UFRmc3dyRVZaejNOeC9ja3pFWG5WVmtpc3J0anJkaHZrTlo2S211T2xq?=
 =?utf-8?B?a0UwNDdCaFlHRFNFSUJtOXJESnN4QlJteHIwU2p3NExHQ3dmRzMyWDdWamlx?=
 =?utf-8?B?bkw0eko5ZmNGMUJXZ2JrUlQrMDFPOGdtNkpvMVJIVWJIa1BRS3hIMUFEVlNs?=
 =?utf-8?B?UmhMQzlybSt6VUxmTjh6MHcvd056SmNSWWpQZFRtTW1oYUdlTWZxazhyTzg1?=
 =?utf-8?B?V29EL3lTMVZ5VDNnZ3ZOQmtGdk9uMHdwVkY3S0VYTFpXWnhCUWNGcmFQQlFl?=
 =?utf-8?B?UmZ3YU5Va2N1RERjcWxQU01MYjh5NUU5bmF3SlJUdVhiY3ZnWUIxMlphWFNI?=
 =?utf-8?B?azFuMlI0M3loZkRpY0RnWkpBMC9YdUNKOWhzbkdpVG9ZaFZRUnJ1a1NGaGow?=
 =?utf-8?Q?EDidIgJCLXAoKKwkBJkRfk6bxavM+qam?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEJFZ05ORDRvV3FraStwK2pFSDZQbWlKczllSG12UGZ4aStYdHljWGNMYXd3?=
 =?utf-8?B?T1NnMzNJbWRPOC9uQTAzalFOT3VvZXlQMlJQa0Fmd21zcjVxNU8xSkczc1gz?=
 =?utf-8?B?Qm94OFN1R1pYeGprcUZZZzBEencvVXZxZklnUmxHOU14TlJWNzJFTXhXZVVu?=
 =?utf-8?B?SHpzT3pwS3VPV2FBUmRjRFZvcUxCYlZiYXJQTnlZRDlHNGc0NGhaZDFMRlBT?=
 =?utf-8?B?R05aVEVtL2lBcFpZUkwyWlRvZGJYL0JhTGllQU15cnlVSTJvdzV4OWlsVVkv?=
 =?utf-8?B?YVJzeStabEphZngrVHgyVDJ6cTZwSEtUL3RiUExjdTB0MlEyTXEyMXd3UTFL?=
 =?utf-8?B?dkJPTWFMWWRsTWh6U2Y3dm8vYTFEQTdVNDlpMllGWWFoanUxTnlIamVwWHE3?=
 =?utf-8?B?dTZETk1YTENhMlMzcXUwck53eHR5UGFQSWZCczlTczdiNkpFRTFCNFF4WkF5?=
 =?utf-8?B?aTdZdVBqYTBZZHErb2lIOE45bWFiSk1sUnJ1ZmdnWXlpZHpiVXNwQ29yU212?=
 =?utf-8?B?NEI0YW12OTIxcElqNmNubk9ZbjNLZUlKWDg2amdRWlJ5dzg3d21HMVZLU1BN?=
 =?utf-8?B?SVZOaU5MNklCNzlBcERtK2hMbHh4b0xFWlU1U2hYdm5QYTBkMlpOc3doSWk3?=
 =?utf-8?B?dUxMZHozb2JKZTh3c2pBblZDbC96d1RKbnJEZ3VvQzBBS2JIL3lEbnVzMzZQ?=
 =?utf-8?B?cWpKK3NLOXh5YVBpTFZlbm5MRXVaU2VBMzdzVUlXOEFTY0JJL3lONlpkYVF6?=
 =?utf-8?B?dndYZFdXSkZHQ2dqRVcrcVpBVEJnUis4VVF1ck90eUVSdnBYL0hpaWc0eEpK?=
 =?utf-8?B?cHBUYWRzSXV3dCt1K1l5VmRQOFFmL2pDMDQzdE5mZVVqVGF4Q21iUkhNRTI0?=
 =?utf-8?B?VGVTSlRFRGlFOFBEUnhMajFKMEdrd0tSeThWMzhLeE4yT21mYVYrY3FwWVNP?=
 =?utf-8?B?alZacDhvRk9xSm8wVHJLdXBSK3pQVkowR2xsNWhvOHA1Sk9Mb2NWMEFGSDYv?=
 =?utf-8?B?QzUreGt6MmZ6TVR0THV6VjBHWVNqVUx0Ti9kYy96Rjd1VW11TW9hazYwUzQ3?=
 =?utf-8?B?ZzVTbkhoQjVvb3R1M1F4UEN3OWw3bHlvNVB2STEvOUlMRG9xam9YZTZQVFhT?=
 =?utf-8?B?MEl6Nm9jT0NzTWNOeGdDeGZycEhpbmVDMXUzVkhvRnNDc1FaVGJmT2swYWVi?=
 =?utf-8?B?NjBpNTR3c05aVDFIdkkzZFFjckVFVHBDQVZwQ1hLL1AvWGgzYkYwWC9NQWFk?=
 =?utf-8?B?YkNrZFFyNSs4QXpXeTFEKzJPcS8xcHZFZ05EclJGaTIyOUpDZkxIRTVJV2s3?=
 =?utf-8?B?N1hhUWFRcWgySWNBNUljLzVESkQweVB6YjRWUUdsRE15d2tqeFNneE1ZMkJZ?=
 =?utf-8?B?bHVTTUZtY3lXOEVEL1A2cDRlcVZtc2RkVDl3cnBpWCsrdEJTbXowVGs4VlVB?=
 =?utf-8?B?Sk1rNGcxdFdVbmhna2JBWjZDMnFNZUkzNlowblV4aEhYT01yM09BV3VQOU56?=
 =?utf-8?B?czlJRDdFVUZsRDArQ1NjaUYvT1VlZFk2OUpyM3BpWmhudlNLYUJCQjRLczVM?=
 =?utf-8?B?Nm1VbU9kd3YwbDFVWWR2ejNaM1RFaTlUSTlFZ05qNHVwdklYZEJhRll1ZmRl?=
 =?utf-8?B?Wm56RkhIb2ZnRGVxVDY4eWZaZG0xOHRwUkg4UFZjRHdqRExTeWhaaFc0bEdI?=
 =?utf-8?B?VTAvSDU2UDduTHRPalROeEp6UmxBbmM0QklRSStLUFhPbWNRTmFzcFBJRWtF?=
 =?utf-8?B?bHJ3N2lkdm1jOXl0dXVkelhGV0J3KzRGYnZCK1MyeG5JRnk0M256TTBoN2FK?=
 =?utf-8?B?d21iN0kvd3Z0ekFnaGNmODBPK1oxcEYxakpUUFd0cEJrbjZmVHhBUngrdFlE?=
 =?utf-8?B?bVJKbEF0OGpSRFFIZkNtc09jVTFUU28xbzB2TW9VVzFQSVd2TENVaXlVU09w?=
 =?utf-8?B?QVlDYWRIUm9DTFJpeHZqSFMzWEhLVXg4Z3pHN0kydnZpNStkd1hxMTFVMXMw?=
 =?utf-8?B?YjFudDAxdThLTm5rTDh4eDZMakUwU21waDUrcEV1WGdqY1A5K3RaSjJZaUFi?=
 =?utf-8?B?R28xTHNNTXAvSjQ0c0hFa25zQ2pMd0pSRjJheGFRa1JmalhlMVExbXZwaWx0?=
 =?utf-8?Q?MmnViYmhWFcOqe1hKrzO80gzu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6810F07BF5E0742AB4EFD5650A025BB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kJliiTg71nDSDHb9DusDU2liYq4vYgyGqj5fhghWdn3tZ79pqTIrEfwHI4whTDIMZwk8lIPHtXDtADmBvfS2alZ23Jmi0aLipUrQfZCj7vMVM9vYI0XRyxwnY/fY9lchNgWD+dMpdfcf7UDcCCmmeSCWDL17jh8EBMZx/etaUVEzC64pvw6lOMCIMS4+pY9qJznDn+1jontsHHCOaBCXZdvG6bNVxgRhatnM5FHdoRH81cpvbrR7tKCOF2Po36pVo3QEs+pah1hu9OnzJsM5ly/QTudYEnNjIUJuUmEeQiNsyRe08wU0ul7WumPzxmEB5Pu3HqRXkmnJNFfKb2paAhJ18oPnscsSYeNtcXK5SUnUkhLHKd7z1NmsAhtY+s0V/YuIq7v/7fzi7MbZh0hfcBPBS8FSQVc+9vWq2FRzXq1MA9b2TddxgsHmRSbh0WWqQzPJmiSF2kDmKT2CwJeAlOWCgeqgVCCUWyvdRkpdkk7dJ9oYTKDuri7EmIzisP1QwNwa9h7mqr44j9T5mU5lUHKcG0ZaECEW8jW9UC1fY/8Po2ogLLFbSLX9EeNwKwwYFayK7ixdJdEknR8y1eKtJl9esMB+a3R1dqZm9JMBziGnjglzY3QGPOuNjfP1a9G21JjvVeg35bvmBA+TBxVxmg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d579369-e4fe-45d8-34a6-08dd368670a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 23:35:19.9187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1Td4wg/IOmwtWQjK0eMJunP6dUFq0O9FZ4bk2Uvfgd7gmWezZzvhKsw+6VBOmm3IQj87r4cCB6mdqeHHwgwSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7513
X-Proofpoint-GUID: kJMC9u7C-9b1yXiE-O-WB6zH7wtC94Gk
X-Authority-Analysis: v=2.4 cv=AL8pzSHq c=1 sm=1 tr=0 ts=678997be cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdSt8ZQiCzkA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=QyXUC8HyAAAA:8 a=V_F7U33gUq_sjmd5_OIA:9 a=QEXdDO2ut3YA:10 a=hTeOFwfijxPXlg8sCIKb:22
X-Proofpoint-ORIG-GUID: kJMC9u7C-9b1yXiE-O-WB6zH7wtC94Gk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501160174

T24gVGh1LCBKYW4gMTYsIDIwMjUsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToNCj4gVGhlIHNucHMs
cmVzZXJ2ZWQtZW5kcG9pbnRzIHByb3BlcnR5IGxpc3RzIHRoZSByZXNlcnZlZCBlbmRwb2ludHMN
Cj4gdGhhdCBzaG91bGRuJ3QgYmUgdXNlZCBmb3Igbm9ybWFsIHRyYW5zZmVycy4gQWRkIHN1cHBv
cnQgZm9yIHRoYXQNCj4gdG8gdGhlIGRyaXZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHkg
U2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIv
ZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBpbmRleCAzMWE2NTRjNmYxNWIuLjNmODA2ZmI4
YjYxYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiArKysgYi9k
cml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IEBAIC0zMzQ5LDE0ICszMzQ5LDUwIEBAIHN0YXRp
YyBpbnQgZHdjM19nYWRnZXRfaW5pdF9lbmRwb2ludChzdHJ1Y3QgZHdjMyAqZHdjLCB1OCBlcG51
bSkNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gIA0KPiArc3RhdGljIGludCBkd2MzX2dhZGdldF9w
YXJzZV9yZXNlcnZlZF9lbmRwb2ludHMoc3RydWN0IGR3YzMgKmR3YywgdTggKmVwcywgc2l6ZV90
IGNvdW50KQ0KPiArew0KPiArCWNvbnN0IGNoYXIgKnByb3BuYW1lID0gInNucHMscmVzZXJ2ZWQt
ZW5kcG9pbnRzIjsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJcmV0ID0gZGV2aWNlX3Byb3BlcnR5
X2NvdW50X3U4KGR3Yy0+ZGV2LCBwcm9wbmFtZSk7DQo+ICsJaWYgKHJldCA8IDApDQo+ICsJCXJl
dHVybiAwOw0KPiArCWlmIChyZXQgPT0gMCkNCj4gKwkJcmV0dXJuIDA7DQoNCkp1c3QgdXNlIGlm
IChyZXQgPD0gMCkgcmV0dXJuIDAuDQoNCj4gKwlpZiAocmV0ID4gY291bnQpIHsNCj4gKwkJZGV2
X2Vycihkd2MtPmRldiwgInRvbyBtYW55IGVudHJpZXMgaW4gJXNcbiIsIHByb3BuYW1lKTsNCj4g
KwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+ICsJY291bnQgPSByZXQ7DQo+ICsJcmV0
ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdThfYXJyYXkoZHdjLT5kZXYsIHByb3BuYW1lLCBlcHMs
IGNvdW50KTsNCj4gKwlpZiAocmV0KQ0KPiArCQlkZXZfZXJyKGR3Yy0+ZGV2LCAiZmFpbGVkIHRv
IHJlYWQgJXNcbiIsIHByb3BuYW1lKTsNCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsN
Cj4gIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfaW5pdF9lbmRwb2ludHMoc3RydWN0IGR3YzMgKmR3
YywgdTggdG90YWwpDQo+ICB7DQo+ICAJdTgJCQkJZXBudW07DQo+ICsJdTggZXBzW0RXQzNfRU5E
UE9JTlRTX05VTV07DQoNClBsZWFzZSBrZWVwIGNvbnNpc3RlbnQgYWxpZ25tZW50Lg0KDQo+ICsJ
dTggY291bnQsIG51bTsNCg0KUGxlYXNlIGtlZXAgZGVjbGFyYXRpb24gaW4gc2VwYXJhdGUgbGlu
ZXMgaGVyZS4NCg0KPiArCWludCByZXQ7DQo+ICANCj4gIAlJTklUX0xJU1RfSEVBRCgmZHdjLT5n
YWRnZXQtPmVwX2xpc3QpOw0KPiAgDQo+ICsJcmV0ID0gZHdjM19nYWRnZXRfcGFyc2VfcmVzZXJ2
ZWRfZW5kcG9pbnRzKGR3YywgZXBzLCBBUlJBWV9TSVpFKGVwcykpOw0KPiArCWlmIChyZXQgPCAw
KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCWNvdW50ID0gcmV0Ow0KPiArDQo+ICAJZm9yIChlcG51
bSA9IDA7IGVwbnVtIDwgdG90YWw7IGVwbnVtKyspIHsNCj4gLQkJaW50CQkJcmV0Ow0KPiArCQlm
b3IgKG51bSA9IDA7IG51bSA8IGNvdW50OyBudW0rKykgew0KPiArCQkJaWYgKGVwbnVtID09IGVw
c1tudW1dKQ0KPiArCQkJCWJyZWFrOw0KPiArCQl9DQo+ICsJCWlmIChudW0gPCBjb3VudCkNCj4g
KwkJCWNvbnRpbnVlOw0KDQpZb3UgY2FuIHByb2JhYmx5IHJld3JpdGUgdGhpcyBsb2dpYyBiZXR0
ZXIuDQoNCj4gIA0KPiAgCQlyZXQgPSBkd2MzX2dhZGdldF9pbml0X2VuZHBvaW50KGR3YywgZXBu
dW0pOw0KPiAgCQlpZiAocmV0KQ0KPiAtLSANCj4gMi40My4wLnJjMS4xMzM2LmczNmI1MjU1YTAz
YWMNCj4gDQoNCkJSLA0KVGhpbmg=

