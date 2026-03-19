Return-Path: <linux-usb+bounces-35216-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNQiJ8uIvGlk0AIAu9opvQ
	(envelope-from <linux-usb+bounces-35216-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 00:37:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD382D439B
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 00:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5A78300728A
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 23:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FA04035D3;
	Thu, 19 Mar 2026 23:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZDE/wRBy";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NdR31pYs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jzRLFGlV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFCC375AC4
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 23:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773963314; cv=fail; b=pdeZGpCKCp5duBLYlX6IBiZfIDfXDzODRSCZkfCPM8Xf0ByeakQolS/LqJ+v+Mf/8/7vstXTrrROpdvXN8XiVK7ud5bjpin7hPii+p2rAMZQUYf1SHEAfcgwJclsAb0kBT5wRtpT4+C9wBppXalKn+8HKZwMz+WRHUlYre3jPuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773963314; c=relaxed/simple;
	bh=OC53WsegWGHcz1Ot0/X7m2ytZBpzE9XZH9LyZhxbe6s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KdDHTA6j/wh71lm31v7DS7oZhjLsM+MHWt5Njbh+NsE9FIz4c5hRYZlDrBsSFZdFqQ7OhxaJQJVfLj2eku/sdLtIJ5GSyKK2jtI21dQdb6qjrs0EUjjyOxW4jjxlJpGvtLYsTUa/E2W5rzbG6kMRkOzl2uZH1Dv8ONzqVDXCc4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZDE/wRBy; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NdR31pYs; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jzRLFGlV reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JL0tYm1411408;
	Thu, 19 Mar 2026 16:34:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=OC53WsegWGHcz1Ot0/X7m2ytZBpzE9XZH9LyZhxbe6s=; b=
	ZDE/wRBy83VXU+wy+uKtXvG3ABGHqEXMnl00hrVLCOybzbX7SOYfZEa9VlzjZfbS
	6qiAc6VoPrcpf0hpruO1tOyyUmXgM3cUvBuW2k3dN8Qy5p+1Qsclq2q31jkf7RTu
	S8Spuh0mTrealSF0RzJoAoWnmAKbt7TfgGOvM/fDCyKaxbxWUaEAzT8e+abi3F4n
	0EFAMVFanaX5XI5qaA1ucSjyrvK7FRLb0OFztCELn6sMUSgwS9fZmklpGA4fEo62
	g7U2TuhmhTwILbQUoAnOdoCQ6N9s/hul1QIBPa9Ajst0dDTTnL7AWxkUGX2HrigU
	SL7mB4v2skReYu3LZvCGZw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4d0msft14f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 16:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773963281; bh=OC53WsegWGHcz1Ot0/X7m2ytZBpzE9XZH9LyZhxbe6s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=NdR31pYsZCeRzQSVUl86ElIY+ZGOCigejS2iV6wzNW8+v7K34Tidt5HRQbptpX/GF
	 VN6r1u5+QQLpSZQBW7BiIOhYkA3IcZpAuS1J61uvyF5AaF7in9X5flx+dD7I+GtpIM
	 Oya68sfUfCQP/hIOL1843jJbizwZ/rCdIcK9SLipuv0cgnT9bUQmB/W11fLv2PlnmB
	 g0NtBKCI1Ra5dLzuxaaQVC0q4/RHJnowNloiNg1SYfVXwoUV2xe3RGG9J1cL9h4LGb
	 Uz0jI/vZpu0YiibeCSDzhR2ZaV3VhhF/iFRlMEb2szFodKhCZpu/xalGQsesOZWGIi
	 rssYLIPJmQmAw==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1B00940143;
	Thu, 19 Mar 2026 23:34:40 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 89B63A005E;
	Thu, 19 Mar 2026 23:34:39 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=jzRLFGlV;
	dkim-atps=neutral
Received: from CO1PR08CU001.outbound.protection.outlook.com (mail-co1pr08cu00102.outbound.protection.outlook.com [40.93.10.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 61FFF2200D2;
	Thu, 19 Mar 2026 23:34:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtKu1u/EoLUls4Al3ucI3OURMpn3ZkBmAolV+XA8rm20SiZCjI7G8lyB//eX3gpBSQlLPLk42V3HXTVnOUVlVfq98YCQmcT6wRoNP1vEuludJpKHRSg1ZaNhpDFr5DTOmA+IFGR4IdBwY5m8ES6oaRJjHE4yv63syN6vQf/IOW0moFvgQyoILGoKsAGY8isnTzxAFMiiOYNdMuBMFM3ZheEu6qd1R307QTsdkRtkPswoWFtB/GHTPifK9NbrbtxS2lfQiGihZobLOmQPW7eoBxTX5Vs4/Vh4DsBOJSOUiDzDW4gBauhT42ZKwkZXLS7SiTAgLQj07FjXJk8SLq312A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OC53WsegWGHcz1Ot0/X7m2ytZBpzE9XZH9LyZhxbe6s=;
 b=ZoX3V5q+YY5JneHaS/CmCGYOftw/XtEw3Iutw4ogk0jcvxrGrXQ7tW7UOEhh0T7b19xbGce62MZrWxmc/8TDPDEU3VqZ6A0fVLRHjje8PSl0ZXBBeB27JvJRzXv/AnKA2eFnRUNr8mLQI1qQ6qbV3ZEwrnOy39awVkZPmBlKT1VP4eKU+RVWhKZ95MB95NvFwAzVJQYMqZV9iS7r0fHBzq0Lg3ZRFr7kSLtY5uC+xLj5r+t7IpYHQ3JLVfv+7JnKWNH7PpQ9twh+KF2bfJUo4YdgLCtNv4Oh8ll7fwQ/4AzAEwj0LMuDNTyfZOEBDDXDLZResdahr2qqN7i8zHYt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OC53WsegWGHcz1Ot0/X7m2ytZBpzE9XZH9LyZhxbe6s=;
 b=jzRLFGlV4BvFpPbdBWwJ7EVHEL7njDcj2E5T98WULGoqabkG292Wwoo6Pbe9d6S5KtjSBjJbv8LmN3hggdKlLiZj4nvUfjDLNTge4NCSmzM03U4u00xCdCnvsfxFsQ5W2vh+FWwVqCRMljS9bBtC+DE0nqARWmePPxNZSBeKAX0=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB6038.namprd12.prod.outlook.com (2603:10b6:8:ab::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.14; Thu, 19 Mar
 2026 23:34:34 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 23:34:34 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
CC: Alan Stern <stern@rowland.harvard.edu>,
        Michal Pecio <michal.pecio@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        =?utf-8?B?QmrDuHJuIE1vcms=?= <bjorn@mork.no>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Thread-Topic: correctly handling EPROTO
Thread-Index:
 AQHcsij3bm/3l4J2S0+poPtO9iFJorWq8pYAgAAa5gCAATtij4AATvwAgAB6AQCAAEFHAIAD0b0AgAARygCAAAy8gIAALjgAgAAhdYCAAT4QAIAAHoaAgAAczoCAAQmZAIAAg+gAgABA74CAAEf5gIAAcOWAgAD5y4A=
Date: Thu, 19 Mar 2026 23:34:34 +0000
Message-ID: <20260319233433.la5kpv5a4lpkyvue@synopsys.com>
References: <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <4a35e3dc-620a-4596-9bf3-783865f29e8f@rowland.harvard.edu>
 <903fa309-775c-4562-bbf2-01ef8ac88cc7@linux.intel.com>
In-Reply-To: <903fa309-775c-4562-bbf2-01ef8ac88cc7@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB6038:EE_
x-ms-office365-filtering-correlation-id: e3f04cd3-7f11-4a5f-aa56-08de86101412
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 CuCU3OHGm5UMdcwdcuO2/gP54WbKg6Z+w4THDjx17WhUJVdvP+redJLSzATlmDqwMQ+mkKdzTP8ZP3eJIV/vOoKF5X4CLzohN+rS+sOPL4K8iVg7pyHg9QguWAug7MCcLbrduW+e9KRonhEmmyvAT8JUA+GEawbiJeg06aHZHpxiRYUO1oKH7kVAPf+p5JyqaJ7ytNNfE9etHHprOvZ799kQLvNPvi2dc55OMlwkkzKQ0SkHiz4tknP9iqGdiFrNZPnVyuJtOwF+A513a6EfiLtwxdSiHI3Eu4fYmpO9FlchEYoPUQkqSi35nMuur42RK3n7FnHDc2dMao7NVh6RhNRWLBWataHVJK+JzgCxJti8XSjtntCNTeVlI7IpPZTzWg/cXVCUmiJABlF91MSTXHOHUWbcuxQ2Rx0vmLnGFr8ihFlgADCUPvntVbEzxRYEKeFqjbHUI7oA8kGjbxbRDoMpgKFTNfZh2CNSyy2HtaZWGI0ubCo8Hi+jRYqxOzyRlqOyFNbROcy++4JQnHZ0aZ8G2CGY5s7yDB+qIuYMMMf5oSI/SrWO06pG5gd6oIdzkTGfILde8YKzWSn/thDdAHvQxEk13W2CS3+0BK8N4qeC/QHPQOC+BSpQMmEPkPef7iWNXqwl4Tp05nXYcim4BruTFCYr6R2tn4MxNcf0ZPlpNHNeqKKtTZsu3flCQ/qEguP+bWl2m/hE20kibpqhQJDBMrdGIx0YgEJedazTW8YCQYoP81hDUrGM7EkAVyrUIzLlzKjcvqiJky4rGlDirWrcC9GQDti3ZzwAJU8CNwA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bU0xaDZ3T0t4KzJwV0JQOGtja1dNWjNuWjBHc3NSN0t0eG96aWtXTmVhNmJM?=
 =?utf-8?B?SlM4WnBVUDlQY2plTi8wREhRSjhDYTZsRlJ1YWZlV1FxOWg0cmVoeTY5eEQr?=
 =?utf-8?B?NzNzMmljbndjVmRFWXVrQnZCMkFPRjBlQkdERFhwdWsrcEl5U2JkTklHbVp6?=
 =?utf-8?B?VjNoaFA5cms3TmVYUVl4SkZreFFxWENIdGEyaEc4d2tBOFRjR1lIVkhVSTZ5?=
 =?utf-8?B?U0pUNUlJd1VRcmJwcm54cWV4SHR2YzVoSkMrb2t3VHJJTlJSZHZFS2ZnZGY0?=
 =?utf-8?B?eW8rOFRBTlgxalM0NkxmT3Y4OEJ0N3RkOWh2M2lQWmlGZ0UwK01oRGU5YlBy?=
 =?utf-8?B?WmwzeDRQaXJCN0VRejdrWTRWNmEwWVp6Nks2ci9qVzNkeUVsVXpWcmd0YzZu?=
 =?utf-8?B?T1M5d1lzMUdzM0taMUtFL2R0YldhL05aQVY3MTlnK1RoWGMvVjlOSGVSVWhv?=
 =?utf-8?B?Y3p5QlUvWkFXQUN2dnpBUi9yZi83c29JZHV6WnhHa1dJTS92NExWVk9pRndv?=
 =?utf-8?B?aFN0U0JsVnNiWFgrenRHSnZMVEdWM01TMkszQ2N3bXMxZDFKUlNPSnZpM3Zq?=
 =?utf-8?B?TUdTaU11VE40L3BrekdvUjBmSTkzQnQyVGpWSlAySjFmL2ptMWprYmswOGZs?=
 =?utf-8?B?TzJ5bHhzc1RxMlJUbnlWWkp5T2Q0aVA4MVk1WW5PZC8vM0tOTkFJVWNnNldm?=
 =?utf-8?B?clU1KzUvSC91Y0IyaFEwUER3NnhJWkEvQWxDak04dUFWeWJSUTg5dmk5eCtF?=
 =?utf-8?B?YXNEcmxXRnFzWG11OW5RVElqZXNuUWRCTlR0WHlJaVZSbHJ1aWd5UHVYOVZv?=
 =?utf-8?B?bXlxT0xnc1RiT3JpWmpvMmlaZEFkYzBmMk96Ym9GVUhrbVBxUmcyUUcxdWxB?=
 =?utf-8?B?dEVBMGhiK0hmSWcxcG1wRkNqNHBmYnlaTDVpN3JFQlp4TWU5WDRpUFBrR0dm?=
 =?utf-8?B?U3YxY3NSTHlDeXRBN3JQWWdkT0UvNXhCdHUwb09SQVMveDZtU0V0aG81Mzhu?=
 =?utf-8?B?Q05NQkRTdXVDb2ptaDBIbXV6Y0E1aFdGamlqMW5JS3JTWUFONGkvMldaSmkr?=
 =?utf-8?B?MmJ1MGRRMWdFVlhzZllneFpyeS91ZFNRZ3RjT255WHptSmlzWDNBZHo4bVh0?=
 =?utf-8?B?a1BVT0F4c3NJck5hNithMmVyZlVJUHZpM25NREtNQnJwTlJNMkx5bUFKZS8r?=
 =?utf-8?B?MUtid1U1RlY5STY3OCtBeXVVVjFGTVZOaERXTGpyOEhTUGV4MllzeGhYZGtB?=
 =?utf-8?B?Wmtnam1PNjJCbXlFb2NDc2NCemlkSzU0MmI3RTBNZ1o3VmhxR053dDN5NGwv?=
 =?utf-8?B?aEUrRTF0RTY4U1dVUUl1Y28wQVU1djNCSUg4WENSL0dhZmJheHNybk1lTzNW?=
 =?utf-8?B?QVEyZlh6VnlIRi8yMmFkRWZOUC83clM0QWhhQ3lRa0hrVHNkaTI0KzBPY0Jx?=
 =?utf-8?B?bzR1L0RWL2Y1TFlQeVNRbzd1RnZITkNrZlNldHVEN2hQbGJya0ViRW53WjVt?=
 =?utf-8?B?bm1KSjdOZzZDQ1dSZVBHcWxtcnA3SkZ5S3RQVmtQTEJzTVRqa0dHU2F3cENG?=
 =?utf-8?B?Vlc2NEZ4UENydVVTb2E2VC9kM1gwNzJPQ0V1K3g3NnBqZ3p4bzREcnpWTE1y?=
 =?utf-8?B?c3NNSVBkZXZVOHdma21hYzBYeDkrQWl6S1I5UkczR01SWFYxK2ZjejNLYnpl?=
 =?utf-8?B?SCtoRWdtaXJJVWZFMkpFdWU0K3J2cWhsZmp0K0FVTVZuMFhCTVZqY290QUpV?=
 =?utf-8?B?cm90YlVnZS9FR0VXbi9uS2tHdm5aRHlaNjVuUzJkTXdMeC9qSy9rTzU5SXF5?=
 =?utf-8?B?eGJ2VVBwZXlLUTB4Z2pBYTkxUmFkRVRmdTE4WUQ3d1lnMlBBQytYQU9XWkw0?=
 =?utf-8?B?U3B1TjV2WmVMLy9oak96OGs3UE8zMVYwSXZGbHJPVk9OT3ZBMm9VMFlDZjNr?=
 =?utf-8?B?ODMwcitEUlFNN2MrWlFNc0dtVGZNYUNNcmxNOGhveDVuTW91bDV6RER0VFlO?=
 =?utf-8?B?Q1JtVVJTWG1MUktqNld3akEyN1ZqVVNkdkZ4VVFYZkpCVGluSktQcHd2NzhJ?=
 =?utf-8?B?Qm1GZytna09IL3YwL3Q1bVhEamVsZFhUK0tSV0lwbkpnUXJWWXR1alpVNDRM?=
 =?utf-8?B?Y0tFWmlZb3RIdWFZbDVteWlNeVY1dTAzZlljSXNyTG45VXpOSTlOVFU0UXJt?=
 =?utf-8?B?WnBPckFrQVdYUElOdEY0RUJMcmJyZEk5MmpCZldxcWJnWkkyMytrY0ZBd1I5?=
 =?utf-8?B?QzNCSXZRekg0V2pUVW80TFlYMi81bGF0OUgrbGJneWhJQTZicnJOWG5CUUpw?=
 =?utf-8?B?VDlieEo2ZDgxeTJMcFpKMnVycXpHWHlyZEc5MVBnUEp6VDQ1YUE1QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE1CE859867C8E49975FFE48D1B0FC11@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	GnJzBspc/asGvQyKb0sQJDhyzy15j1xffyvLDd7kayyc7AI/gp1TZDjEMPgDkfJzT/50J2bzbe7PTPDvsBZq1NzbU8Ky23OEC87AHZMvu8Zh9rKsULu/l4+DfHNqMLZHnmnhZbsCVx1+BlzXK1SZ01N4stLnUn14WWTsz8A62L5UXtOmfKw/0pb9v88OH0yVpTLIxaZD2+u3WdZidlN5FVdWWjIbIQOAwjLwrUuXR27sO8S44GxgMr6kW4Dbp8kazCr8rjiSWQRRck6cH/dGxSHY1Izbe544qsVDHPWtP0x97rYlIi2hS9QJZHR70YJKPtniQUnt3BhOahu1315ykw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NjHV8LmIZRqYx/M/jDRkE4Z/WFt2jlKYw+VlVucE69NruhdgGa/cldOAzLTqhFehjnPfY75VCsfbaELIPi9yfzVv0fwHMmLr9S7XBvKm3DJwRnowaglZM6jFSGrxha3c2mfcYZmbsdSxJmcZOOtVL5sKhiHV2ZRNlF5ItDa73d+jy5r1K10AMCUJToz8SY+QokRy0wOstkvv/CEZfaD65y3NphRS85O2UaSuBQgURzDvG6pr7Ecr33FQgGqbaUNz60vZjamUWVDYANatDnX52cFQ4/IJ87AQbOkI5yFcIJpowL77Pi2yDNRwTO2pjUfkqSTV7/dHi7VMOwMP/6i9pIiH6mSJWF3DM+E1fJzOq3G6xi//g85dBwHoq/y3fUl0OIw7H3joOXu2QKM567GaZ/mMvTefawJI3UBG77QfqHwoJDqQl62TSzI70M1AOxxTEB8Jleh0FK30gINiJMWSs0lFUn69A9486Fbqgaa6LxZnl2Nwfs94dJtRhRScAbSySC2jiM81eqt1w1AMjFrAdr7qrInCONTe6lcYWHQndF62T39IWyjrxjbRMVkPvhbCassH43IQU1lsGHpAJg/L+J5Z8kXrdjHvi98xp64eTcwask4zADONHq/WF81eAAHAmkmGdHg8bLyJIGU3I39aDw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f04cd3-7f11-4a5f-aa56-08de86101412
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 23:34:34.7079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YRDzW2VYTsbFSzUxqIthVE/NBlHv7MzQv4tPPKOVVaMbKzODKfHAHIp359F6FfiagdK+IW4UugOlAqyb1ir3CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6038
X-Proofpoint-GUID: rWcAT_BIpXeDnJfg_eWzmNVyNlaNM3Xw
X-Proofpoint-ORIG-GUID: rWcAT_BIpXeDnJfg_eWzmNVyNlaNM3Xw
X-Authority-Analysis: v=2.4 cv=S9DUAYsP c=1 sm=1 tr=0 ts=69bc8811 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=cHn7Tg6WTgcLWgFqh_0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDE5MCBTYWx0ZWRfX+swW+3yM8uPJ
 0bbRCpZ2IGAgTbnPXHVKFzXMVzuGg0PrHTgQ8RFFsPq1Zmy7ENc9tOEVK5Z5EXicEC4Olj2JSFh
 MtJeB/wHCw0nTciRSafgL/bZpwY3moc1pioqUub0FuuyavcuEndgRxj/fOEX/rArc+J915zMfE+
 h+wcH6b6UScyC7MyK26yB3AptymRbeXb3bJozznbHVF/bGONQ9ZjUyg79VVaVyiGM4/WlM5VLGY
 BAdACknr/exGqk8Y4hjnNq6n/YQFB3STSZqGh6Kj7s0S50+dpt5mJKW+yX/xN5KqwLTauupDEZM
 zGnukRGaq1Gmc2XlXnO+JYARZJTPalrAa0w48GzZ0rx6RiarpQZ3bh6GPoGavWR/x6QbjQ/5NAU
 z98kJoPgaIgHc59M58EJYkMXCaivswQAApuI1ga/+5jFSyIjcS7kUZ6IeOL3vF8BhE6PhglvAiB
 KwS5UNl24Y9oHLsUAiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603190190
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[synopsys.com:s=pfptdkimsnps,synopsys.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35216-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,synopsys.com:dkim,synopsys.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[synopsys.com:s=selector1];
	FREEMAIL_CC(0.00)[rowland.harvard.edu,gmail.com,suse.com,synopsys.com,mork.no,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[synopsys.com:+,synopsys.com:-];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	FROM_NEQ_ENVFROM(0.00)[Thinh.Nguyen@synopsys.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[synopsys.com,quarantine];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AAD382D439B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMTksIDIwMjYsIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IE9uIDMvMTkvMjYg
MDM6NTYsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IA0KPiA+IEp1c3QgdG8gYmUgY2xlYXIsIGFyZSB5
b3Ugc2F5aW5nIHRoZXJlJ3Mgbm8gd2F5IGZvciBhbiB4SEMgdG8gcmVzdGFydCBhDQo+ID4gKGhv
c3Qtc2lkZSkgaGFsdGVkIG5vbi1TdXBlclNwZWVkIGVuZHBvaW50IHdpdGhvdXQgc2V0dGluZyB0
aGUgdG9nZ2xlDQo+ID4gYmFjayB0byAwPw0KPiANCj4gVGhlcmUgaXMuDQo+IEEgcmVzZXQgZW5k
cG9pbnQgY29tbWFuZCB3aXRoIGEgVFNQIGZsYWcgKHRyYW5zZmVyIHN0YXRlIHByZXNlcnZlKQ0K
PiBjbGVhciB0aGUgaG9zdCBzaWRlIGhhbHQgYW5kIHByZXNlcnZlIHRoZSB0b2dnbGUgc3RhdGUu
DQo+IA0KPiBJdCdzIHVzZWQgZm9yIHNvZnQtcmV0cnkgcHVycG9zZXMsIHJldHJ5aW5nIGEgdHJh
bnNmZXIgYWZ0ZXINCj4gYSB0cmFuc2FjdGlvbiBlcnJvci4gVGhpcyBpcyBhbHNvIHRoZSBvbmx5
IHVzZS1jYXNlIGRlc2NyaWJlZCBpbiB4SENJIHNwZWNpZmljYXRpb24uDQoNCldoZW4gdGhlIHho
Y2kgZ2l2ZXMgYmFjayB0aGUgVVJCIHdpdGggLUVQUk9UTywgdGhhdCdzIHdoZW4gaXQgZ2l2ZXMg
dXANCnNvZnQtcmV0cnlpbmcuIFRoZSBUUkJzIGNvcnJlc3BvbmRpbmcgdG8gdGhlIFVSQiBhcmUg
ZG9uZS4gT25jZSB0aGUNClVSQiBpcyBnaXZlbiBiYWNrLCBzZW5kaW5nIG5ldyBvbmVzIHNob3Vs
ZCBub3QgcmV2aXZlIG9yIGNvbnRpbnVlIHRoZQ0KcHJldmlvdXMgVFJCcy4NCg0KPiANCj4gVW5j
bGVhciB3aGF0IGhhcHBlbnMgaWYgd2UgY2xlYXIgdGhlIGhvc3Qgc2lkZSBoYWx0LCBwcmVzZXJ2
aW5nIHRoZSB0b2dnbGUsIGFuZA0KPiB0aGVuIGFzayBob3N0IHRvIG1vdmUgdG8gdGhlIG5leHQg
VVJCDQoNCkZvciBidWxrLCBpZiB3ZSdyZSB0cnlpbmcgdG8gcHJlc2VydmUgdGhlIHRvZ2dsZSwg
d2UgY2FuJ3QgbW92ZSBvbg0KdW5sZXNzIHRoZSBzb2Z0IHJldHJ5IHN1Y2NlZWQgYW5kIHRoZSB0
cmFuc2ZlciBjb21wbGV0ZWQgcmlnaHQ/DQoNCkJSLA0KVGhpbmgNCg0KPiANCj4gQ291bGQgYmUg
d29ydGggZ2l2aW5nIHBlb3BsZSBhIHdheSB0byB0cnkgaXQgb3V0IHNvbWVob3cuDQo+IE1heWJl
IG9wdGlvbiB0byBlbmFibGUgaXQgdmlhIGRlYnVnZnMsIG1heWJlIGEgcXVpcmssIG9yIGV2ZW50
IGp1c3QgcHJvdmlkZSBhIHBhdGNoLg0KPiBTZWUgaG93IGRpZmZlcmVudCB4SEMgaG9zdHMgYmVo
YXZlDQo+IA0KPiAtTWF0aGlhcw0KPiANCj4g

