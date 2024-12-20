Return-Path: <linux-usb+bounces-18689-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 102BD9F8A1D
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 03:32:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A51C0188E3B5
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 02:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31B322331;
	Fri, 20 Dec 2024 02:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lkUevUru";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="jVPNI2bi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="qZQjg4tm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F5133086;
	Fri, 20 Dec 2024 02:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734661913; cv=fail; b=DnxZS6aQW9ZNvM3lcHnuhxf5aD67PyKRNLxL4NLgmm9jlr74O8qK16Z7tZAwk0fI5LUcdvfLAarHc6bGnJivDQEKRSr2shs0iY+63Mdq77/B4QPy+Aepf6Oazb0jiGdq+K8I4YA47IIvsnynZx7xqu421SlKr/bYmOGysbzpx70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734661913; c=relaxed/simple;
	bh=nNKxhwBXtkQ90WEyeT8eV4Fa3wwaDY3dCk+HOYxqAzg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g6RiGlFIGItUcf0viF7kX70J3w6yJm9yMXqdF3drR4Ybna63zviLo7SofrhnagWWf4kOoadXViXtKYcYJB43PJwaVps3crG4gEU7MlEKTi2rsYDiaQrrTZPL0alkGmam4pVffRs0ja6lguAnqfBY6cyls4Yp8JeaG/oCI1K6i9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=lkUevUru; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=jVPNI2bi; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=qZQjg4tm reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK26mv1011794;
	Thu, 19 Dec 2024 18:31:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=nNKxhwBXtkQ90WEyeT8eV4Fa3wwaDY3dCk+HOYxqAzg=; b=
	lkUevUruAo+kZIUHuQtHR9RCMjYykfwEe6P6DXYsWu0e831qxJITtu/LSRBETUyD
	46tBmO/nVizDAOvWU3CBqbdkvzGeyvPox6L98iP23oQpOlz+OfTw78l6hOB+vQMv
	kYlkBXZBDU9TsIr/VHY4Zj9mcetUMJELxfyOcuP9QPPSB99cDYrtcsfZbUiwzZc3
	AKiifq7i/HUIkMNsJjJuV9GQm0pVHYVqA+e3NKlgvP7xhTqzwyEPRuQoJKUj26ym
	cXvJ9reDPII5olGevObWYTVsbHhv/iU0yQezORw1MWQtuXw/JgasADXYirc+aT2N
	7O0WTwvr0d9k+gN8z+o91g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43mrvg9yne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 18:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1734661888; bh=nNKxhwBXtkQ90WEyeT8eV4Fa3wwaDY3dCk+HOYxqAzg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jVPNI2bii6DXva7OHV9yieAsuSToGzeusfSBz9OC6R/hdU6NuoCwjR9KFpMx9CU3x
	 Uv/dgCyEh8tK0gchs4bK29Wt5vGRJtdqi1XrNoMkboz2aVaSEJvvbDJnYdq4p+UB2e
	 9dKPIIfxm8T/MpUNAU00/v7ncs0ElNDw/GIUhFGkYgNSUGNRR95F3AvSE5CjRS4b24
	 uh62fcXTr0rnOyf7sb/F48uKlIKDHwd7EocXxeOpuLQXhAsZG8L1fYihHhg9o5HYgL
	 AtBCuuPvlNmZRd7glAMMjNCVvPzVwhXC1FpgXC0vvQEBk3V5ZAX6/fuDjt5VFYdZa0
	 YVqodagv5wHDw==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 51BDC40126;
	Fri, 20 Dec 2024 02:31:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C4813A009F;
	Fri, 20 Dec 2024 02:31:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=qZQjg4tm;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2263A405AD;
	Fri, 20 Dec 2024 02:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pp5z+NtqGdJo4+oeD1oEC3U3A+YcdE/nXEklJF/dKEnh+F3HT4ZYyeN7vzKdKZkfgnfVomM1WcaW7oy4d6NVhAjOvHHyW0fFa0jrwt0sQNmPkCSMef3Q8Ws9hCRaN0lTWVIENp2RWEITXUrNXXsUdM+7Ufm6zY3nZowbrMBrQT6xEj20yZHg86Np1DSwJ6RxLGwfQgRBJZoW8ndk7PQZMg8KXF4FS8MGSMfn4lnQJVT1ofxwtxD9W0sInu+dyadx+AmebRO+iXWjY2/KZJKDLJZuHEU0C+DYWp7wyDMUjNn0wG6LVPcwU9B0W1LQbI+N/KglyxnDYQgRDpIFkW2usw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNKxhwBXtkQ90WEyeT8eV4Fa3wwaDY3dCk+HOYxqAzg=;
 b=CfsNEezNyne3FycSLS41PqCcBV5jcoP37/UNaP7v6/O14s1evBm1veAsQFKYzHSu4Mglld/CuZZZW1I//umtucDtzhBJ14YHbbc0mtwkydDMzVLUUwHjRgXJKbcwuAnJWvKMhRICEuKnCr3pF9dCDUtmQ235+N9lgj4/rQ+24Z2I2gAEWH0iad1nqvVrwKkSkJrIQfm/5/RSi2vTnCREWPbe4UrHXOhfEyX2EOTlPM0gnbEHUyaQ0ZgHjbW1YyV0UIW/ZCICPJNRS5xJUXTobDIHLcOUEJI/B9JE/YIN6o9egGavDtP3Q/MkBfF574H3WiiSC7HUvKdd7OjG5fsaIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNKxhwBXtkQ90WEyeT8eV4Fa3wwaDY3dCk+HOYxqAzg=;
 b=qZQjg4tm9yJQsAZQFfHYLvxW52E35Gz8BkDR2jvXE9rQpOJe6obqzuZdIrcvSuXxhxAe5Lv/hvz+aaInblNWuOa8+pXZLyOuplTu05TKbOMx+g4MOo8JgXFVhkS+StaB7WcJ1QS4KjV2kfFayJfBBaGTLs140lvk3/xd2eq+9hI=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by CH3PR12MB7715.namprd12.prod.outlook.com (2603:10b6:610:151::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 02:31:20 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 02:31:20 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "oe-kbuild@lists.linux.dev" <oe-kbuild@lists.linux.dev>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        "lkp@intel.com" <lkp@intel.com>,
        "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Homura Akemi <a1134123566@gmail.com>
Subject: Re: [PATCH v3 24/28] usb: gadget: f_tcm: Check overlapped command
Thread-Topic: [PATCH v3 24/28] usb: gadget: f_tcm: Check overlapped command
Thread-Index: AQHbS2RdbqcIeOJElUCGpUAsYUcPKbLtoleAgADVUIA=
Date: Fri, 20 Dec 2024 02:31:20 +0000
Message-ID: <20241220023105.ruvvhqbzd3m37ce4@synopsys.com>
References:
 <6bffc2903d0cd1e7c7afca837053a48e883d8903.1733876548.git.Thinh.Nguyen@synopsys.com>
 <d9f6af01-7a20-45aa-b6f1-380711aaec92@stanley.mountain>
In-Reply-To: <d9f6af01-7a20-45aa-b6f1-380711aaec92@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|CH3PR12MB7715:EE_
x-ms-office365-filtering-correlation-id: dc749186-8d8c-4d05-b1e7-08dd209e6383
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?K05veC82bGFicUszR1libGtpZ1RaOS9TRHl2bmFhUVhQTklCTXhuV3FpTk5t?=
 =?utf-8?B?dXRzN0kzVE5idW5ONUNmN0xYcEJVNENzdEtiUXdVd1lJTkVMaVY3NHIwUWJV?=
 =?utf-8?B?NE91a0JteStzYlZZZjlzNENhbWxCN2o3SERUZGg5SWlCbGoyT0Q2enhNWGVO?=
 =?utf-8?B?Rll0bi9WS0Z4M3lCeTZkSHhjUFJ5ejF5eWJXSHVGclBVSGFiakNNazYyeDZs?=
 =?utf-8?B?bzdpeE5xcjRlbmR1Tm4wZGpoREl2OXRuN09hdWdpSnlKOGZDcnFReGREcmNV?=
 =?utf-8?B?MkNrM094TytSQWV4cERHWnpCZ2xPQ1ZzdEJqRi8zZUwxemQ2OXlCT01PYXo3?=
 =?utf-8?B?eGdFQ0Rwa1Y1K01BYTJUekNsaVhRcjRYYkFHeGR6UXhvYndJRk91RFFaaUtq?=
 =?utf-8?B?d0h2TTczMTd3ZzhVRWVEUW5yTSthMXIzZFQ2OHM1QmgrZjFWRUkzejFhVkt4?=
 =?utf-8?B?cXo1b044c2ZrU2RZSCs3V01mMkpLaldSdlhHMkVOam51a0hGdzNTY3U2alZL?=
 =?utf-8?B?TFdOcXlKZTQ2aXhES2FEeER0c29qVHJjWFI5ZHByZE1SMnQyUjRWTXU3MFdo?=
 =?utf-8?B?aTZDKzcvdjJzZlZIKy9IRXdwc1pyOW5CTEcvWnR4RWZ0bzA5QWtEVDNuYUhh?=
 =?utf-8?B?Z3I0ajkwbWhZaWNNOVJjQS9MeXViaUZxNEtWRjdXc1Irc1pTOGhuUmRLQk0x?=
 =?utf-8?B?cWdpT09Yb1Rvb0pRUXNMeFpWSVZ0QW5xMjUraGJYeE9wTXlZWEpEVk8xOW1U?=
 =?utf-8?B?SE9NVWlXUlM2MFlaWFQ1L1VLY0NKRnhrMDFwclVFYW1GeGd3VEdRTVEwUW1q?=
 =?utf-8?B?bWtiTHZwTW5FWVR0WXFPenNZcWxteEFJU0ovZmJmNmp6V0ZUQzk3WFk2S3FO?=
 =?utf-8?B?ODNyTjkyV28xQzJmU1gzdlNBcWJ6ejJlaVJ2c0JqUytoTWd5ZXZqZDlyLzIr?=
 =?utf-8?B?NUNJM1FybHByMlJrby9jdWx0M0ZFNU9xNW91NEJxM25BVGFZZ1ZsQlhuaUh5?=
 =?utf-8?B?TFdlNzBibXN3d0EyRzA2bGFwRTBQTWZhV1g0alhzUjdpc2p5bHNiVC9ldG1s?=
 =?utf-8?B?YkRsdGdrZFdacHNJcnR2UXNhcVdxdGUyM0Q1K1ZyVFR0TGZ6UmFEM1VmdFhp?=
 =?utf-8?B?N1hOQkdhUytGa3JHOVdPaTRsOS83cjJGN3diVDloOEhaNUtqcUV5TVN2Wkpx?=
 =?utf-8?B?MzNjQXhnRWFlT3VmUjNibUlaNmhqejJQczVhbWdrc1Nrb3FZUWpEZ2E2cFFQ?=
 =?utf-8?B?aXRoVEVSb0R1SlBQNlcwc2lGV0trc0hveXBoV3dtN1pnZlA2VExyeVBOZVp5?=
 =?utf-8?B?RHhzOVhJVExmVVZXUmVDajdoQXVDaHJIVjRuZEhYeE4vYXRhREpCOGJKZU9F?=
 =?utf-8?B?NUNDU3lSOFR2VDQzUTF1WHBOMW1yUFhLTkxyNTd4eUxaQUozall3MmJrUjE1?=
 =?utf-8?B?SEhsZFg3eUx4SkFadVhTOTQ4M0xqdEVOVnAvVjBZbjM4aGJwdkJyMHlTb2Ny?=
 =?utf-8?B?Z3pHdWpzVzBwUlJ2NzM3dVJNWUhNS3NsbytpVW9Wb0ZtMWh2VHlnN2l2VkJ3?=
 =?utf-8?B?RmkvYXVoOHRsYlBTeCttWm1JcjNad0huNmRCWlFZb0VFUy9wR3JsRDdqeE9N?=
 =?utf-8?B?Y0E0RjlWNFNVWU5FUWx3RXA2UERzMWlCa3U2Q1FHM2JxSVVqemxOdVRab0tk?=
 =?utf-8?B?dVVQNzM2aHVIR3AwNUJaZEN5d0VXNzVRNmt6QUk4SzNSRzI0QkZ3NEF2WlhK?=
 =?utf-8?B?TWlVc3ZNSHJabjgxdG9WWWlPVThadnVMWXpwMm1ZdUJscHI3c0E4YmxVeHhh?=
 =?utf-8?B?ZW9vektOYVlrejVRemg1YnYyVWhURytabzVBNGkxbE5jMzR6djZSN1FKTTBP?=
 =?utf-8?B?R1FqUUZkKzNuNm50NlNQYkZUbC9YaithQ284Y252cjJUWVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TnRWc0JjZnVnSVdRRFEyZURwdHVVbzlrTG1hSmlCaC9aY2ZtUi9vUFVtS2I1?=
 =?utf-8?B?SHlmYk1nVXRhN2txYmJObnFqVzlYK09TM1N0STlZU1pjMThhNUhVMUtHNVlS?=
 =?utf-8?B?WlhRL2laQkVzU3VHaWVNQURVaUcwV3A0ekVtVmNjVW1SVEJzMjhEVlZLVEI1?=
 =?utf-8?B?T3NpTEVBalFmVUw3TjlNL1ZFOXEzb2ttdS9Wc2E3ZS9uTEE5cGZiekNZOExk?=
 =?utf-8?B?NE9vcVZzUzdOeVErSGlIT2ZSNXVmRWQyY1VMeVdDQjVyK1d1eTVZcEVkN2w4?=
 =?utf-8?B?OGJhdE5EUjZkdzFseFNYd3RFcys0ZnZXL1NvMytwNWNZcWRmUnIxMDQ5ZTVa?=
 =?utf-8?B?MXdHRFVPTmh1QU1EOGVtVjJZT0VFQ1lLbTRLc1o0QTdrRTF3dStJZVNKOUlB?=
 =?utf-8?B?bmpLU0dZN29aSVlyQ01TaTEwTFV5ZFZINWEzREJqeER6U25Gbk9ZSWhEeFhC?=
 =?utf-8?B?eW5ZNEwxTlJrWTh2c3ZXa0ZBZGpwR2xWR1BDOTd1bW1haU9pNElvOXVHMVgy?=
 =?utf-8?B?T3JPYW5wa3UyOXh0WDdMaUk3WVlVaEZzT2RiTkxObU4zbm5tK0dLSXdSUUw2?=
 =?utf-8?B?b1VwUEFNKzZvdzhyWk4xK2p1cjJWOWpQK2NTekxSR2w3Ym5KSXhWK0Nya3g2?=
 =?utf-8?B?SENRa0hqSC84VnJJaHB0OTJONnFkRDlhTmlmbk9iMVU4eWdreE9GbjVvRHlG?=
 =?utf-8?B?cWVZM25nMDY0VXVDVms4bDBPUHFad2tXSnlvY1liRWFSUlA4RDVlQnV5RElS?=
 =?utf-8?B?N2NlV3JmMmNrRXJpTlh5Q3MwcmJyMHdOcFNQWURIR3M3Vk9ha0NjTmQxb1RW?=
 =?utf-8?B?REIyeFRBamJxS2lBQ0R1K2NRUXhHVGRmVVRoZ2VwQWJ2Z2srTGx4V2RsYUhN?=
 =?utf-8?B?ekpySHZkTWZmS0swazFTanA0akQwUHljKzhpTGtMd0dxWjNGeC9EN3Rsdnpt?=
 =?utf-8?B?MUhOcHRlcURoSjlZeW9GdS84OGJSTktGUU9kcHNNT0x1T0R2NlBTNEtlVGNu?=
 =?utf-8?B?K0x4QzZ2UGxKQlNRcStrMlBRaW9zZ3dCZFRvd2d6eUpodWllU2tSR2Y1Y2dG?=
 =?utf-8?B?Q0dKWmdyK1FpZm8rT09uSGVCSnpVWk00LzBBekhkVkVhZkZXbG1MRE52d0h6?=
 =?utf-8?B?UldWZG5QaWd4K1BtVVJYR2lQOGIzYWVjTUlCQVFzdUNWQ2NSemFyTytjdDJI?=
 =?utf-8?B?Z2ZvdkJQWDRCNlFMUGZ3dmhheWV6bVZzajBaUEhWcnZRZmxDNVN5RDhEaW1Q?=
 =?utf-8?B?NWdOMlBNUGRjOHNjcjVFcm9ZVkdjcEl5TWRHTjZ1eFpBRWFpR0JCSTR0UE9p?=
 =?utf-8?B?eThOS3VLNjYwTEptRHJmNFhzUng3eWhEeTVqYWo5ZWpUWTlDMEYyTG9TbkIr?=
 =?utf-8?B?Q2FnOUd5UWFNdy9aREVETWpLdUdna2VsUlE2NTZDaGNyeXVwa0NrMHBOS2JF?=
 =?utf-8?B?TDhmVWMvTVAxS21BalF0M2JEU0F6UnJwSXc3ZUdSK244Szc0WnFEbU96MEkw?=
 =?utf-8?B?cTUwNHB6YURRUzY4ejZQK3RVbG9BemNJR255ZzlqTi90MEFmWXZQWHAwZk1N?=
 =?utf-8?B?dkF3a3JxYlh0QUlnYmcrb0x3ZXFJU05TWkN0ZE5Fc0YzWVdtay94eklDQmM3?=
 =?utf-8?B?dnJWRHpPV2c3ZTZEL3pMZ3N4TmlRV01UMVVoZVRZNUpVbE02Sm45T0hjdU85?=
 =?utf-8?B?WlF4UmEwcHVBemdsa3hRckpiSnN0elE4ZlFwNFZBbGRuTXN5MitCYU5tSnJn?=
 =?utf-8?B?Ni9BMzN5c1d1eUJVSlI0eFl2TjVMY29iU3E1d2FmL29pZTFwK0xMV2x5Zm01?=
 =?utf-8?B?TS8vWTVGUFBRNFlKcGRMM2hVSE1EVWNadFpGN3psWXErYjMvUUdXa1g1cGZB?=
 =?utf-8?B?RWR0SzQyNnVhV1FNdGZtTFlDOEZTdzExQ3J1aEgyT1BrazZxc2twTFlRU0Rw?=
 =?utf-8?B?WkVLUFZvZzVWR2JJZDZreUxLRm1qSWMzbkdnRkdzZUdsR0lmV1FVUUxOVzl6?=
 =?utf-8?B?RlJjRGtkWHVtUHBhMFdIT0U4YVRlWmJGa3NGMEpDdjMrTTM4YWp3S0FPY3Z5?=
 =?utf-8?B?TnhwZWNqTGhCcTFSZU9hV1YrVjREQkhVcXcwanZaRG1neXRDTjNMa1p2ZWJk?=
 =?utf-8?Q?fdRhPOztLcjPv9/Dr5pPJ/O7G?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE1D70ABDBDC5942848ABC3348ED7571@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XpXG01etxXH2bm4zBZ3FFCDqvf5XU8K4pRQLc4RRU37eCyOIpzmvIFlDdxlJP6+ME4vNhzb7aLyi5xpTQkGATDif6xrsWe58bSSPviunAlaK8654ETE8HogUFDVV7dWvxS8rw0+raz7VYKzLMatDX5z910nxgLa1Gx/JW69N3Xq5pXHd/p9TF+hIwA8OT9NryoAkMosNB0vVXuMoAGl1az67jFiEyTRIvfKIvN1YsDJi6HugEXHHRfrs8GbXckf+sbhBY29hCL5HMwGxyH0m12wfmNs8bBGj/uRVusAXeJYmcbr9bSdD2q6vQ8FYa7oEGHiyMU8F2N4v2VpMGtEnmpd1Rf2G179lBXrT23d4wvxDh3GgxyPWBMPgFWmADb5IjP0OJwKLvwMhuGF9Ct9Xv8o102EQDAAa8mYIW84/TJT1EaZRWb9ab5q2oo3gm2k+Q1nrGwYHXNmmPNk+FB+r8uJKTz8qaMYznp5RsQ/7HBLSUVsitoKN8NaBn5GfZeI8t3bC05nXRuzidp0GzVk03vlKv8rkNdxb0VAG3o0Bidcg5W+phAO0icE36SX0muBV4Rnbzcpu5sWIzDJJ7aZXCgQEGUWe/KfF6YbWr+O0+6IdUb9wfrJgwDOAaCr73xtfuq1HOUnouc4RhI3xhx8R0Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc749186-8d8c-4d05-b1e7-08dd209e6383
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 02:31:20.2959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1BwijvCy5VdO8bBafjWBZ/KsDXamUhIBisGK6YIcP+bY+6H8HxlOowgv7pJ6yc8hTjUEx/1WBWQVyQxuFEunsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7715
X-Authority-Analysis: v=2.4 cv=NYsc13D4 c=1 sm=1 tr=0 ts=6764d701 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RZcAm9yDv7YA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=jIQo8A4GAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=qtex-_OctNUtf67OyecA:9 a=QEXdDO2ut3YA:10 a=Lf5xNeLK5dgiOs8hzIjU:22 a=mmqRlSCDY2ywfjPLJ4af:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lC4Aj5PwuxAlUxZOQi26IQ-YYlVQGPsJ
X-Proofpoint-GUID: lC4Aj5PwuxAlUxZOQi26IQ-YYlVQGPsJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=999 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200020

T24gVGh1LCBEZWMgMTksIDIwMjQsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IEhpIFRoaW5oLA0K
PiANCj4ga2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1aWxkIHdhcm5p
bmdzOg0KPiANCj4gdXJsOiAgICBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9n
aXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGludXgvY29tbWl0cy9UaGluaC1OZ3V5ZW4vdXNiLWdh
ZGdldC1mX3RjbS1Eb24tdC1mcmVlLWNvbW1hbmQtaW1tZWRpYXRlbHkvMjAyNDEyMTEtMDkyMzE3
X187ISFBNEYyUjlHX3BnIVlLZVFhOEptSmFLSEFhazFYelVPMHNMV2dpcG5WUzl2Q0dyNFBpWmI4
VEVNd1lBbmFNRzRYVlNaM2Flb0NWLTU0RF82WVg2eWx4ajkzLU5ZQ01VMDRGaUNVMHhYJCANCj4g
YmFzZTogICBkOGQ5MzZjNTEzODg0NDJmNzY5YTgxZTUxMmI1MDVkY2Y4N2M2YTUxDQo+IHBhdGNo
IGxpbms6ICAgIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVs
Lm9yZy9yLzZiZmZjMjkwM2QwY2QxZTdjN2FmY2E4MzcwNTNhNDhlODgzZDg5MDMuMTczMzg3NjU0
OC5naXQuVGhpbmguTmd1eWVuKjQwc3lub3BzeXMuY29tX187SlEhIUE0RjJSOUdfcGchWUtlUWE4
Sm1KYUtIQWFrMVh6VU8wc0xXZ2lwblZTOXZDR3I0UGlaYjhURU13WUFuYU1HNFhWU1ozYWVvQ1Yt
NTREXzZZWDZ5bHhqOTMtTllDTVUwNEJHQ3lWQWckIA0KPiBwYXRjaCBzdWJqZWN0OiBbUEFUQ0gg
djMgMjQvMjhdIHVzYjogZ2FkZ2V0OiBmX3RjbTogQ2hlY2sgb3ZlcmxhcHBlZCBjb21tYW5kDQo+
IGNvbmZpZzogbmlvczItcmFuZGNvbmZpZy1yMDcxLTIwMjQxMjE5IChodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjQx
MjE5LzIwMjQxMjE5MjEzMi5YQjE2U2lsTS1sa3BAaW50ZWwuY29tL2NvbmZpZ19fOyEhQTRGMlI5
R19wZyFZS2VRYThKbUphS0hBYWsxWHpVTzBzTFdnaXBuVlM5dkNHcjRQaVpiOFRFTXdZQW5hTUc0
WFZTWjNhZW9DVi01NERfNllYNnlseGo5My1OWUNNVTA0SnVqUmotciQgKQ0KPiBjb21waWxlcjog
bmlvczItbGludXgtZ2NjIChHQ0MpIDE0LjIuMA0KPiANCj4gSWYgeW91IGZpeCB0aGUgaXNzdWUg
aW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcgdmVyc2lvbiBv
Zg0KPiB0aGUgc2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzDQo+
IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiB8IFJl
cG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+DQo+IHwg
Q2xvc2VzOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI0MTIxOTIxMzIuWEIxNlNpbE0tbGtwQGludGVsLmNvbS9fXzshIUE0RjJSOUdfcGch
WUtlUWE4Sm1KYUtIQWFrMVh6VU8wc0xXZ2lwblZTOXZDR3I0UGlaYjhURU13WUFuYU1HNFhWU1oz
YWVvQ1YtNTREXzZZWDZ5bHhqOTMtTllDTVUwNEZXVWtLamokIA0KPiANCj4gc21hdGNoIHdhcm5p
bmdzOg0KPiBkcml2ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl90Y20uYzoxMzA4IHVzYmdfY21k
X3dvcmsoKSBlcnJvcjogd2UgcHJldmlvdXNseSBhc3N1bWVkICdhY3RpdmVfY21kJyBjb3VsZCBi
ZSBudWxsIChzZWUgbGluZSAxMjY1KQ0KPiANCj4gdmltICsvYWN0aXZlX2NtZCArMTMwOCBkcml2
ZXJzL3VzYi9nYWRnZXQvZnVuY3Rpb24vZl90Y20uYw0KPiANCj4gMjg3YjNkMTE1ZTUzNTEgVGhp
bmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyMjcgIHN0YXRpYyB2b2lkIHVzYmdfY21k
X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAyODdiM2QxMTVlNTM1MSBUaGluaCBO
Z3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTIyOCAgew0KPiAyODdiM2QxMTVlNTM1MSBUaGlu
aCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTIyOSAgCXN0cnVjdCB1c2JnX2NtZCAqY21k
ID0gY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCB1c2JnX2NtZCwgd29yayk7DQo+IDI4N2IzZDEx
NWU1MzUxIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjMwICANCj4gMjg3YjNk
MTE1ZTUzNTEgVGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyMzEgIAkvKg0KPiAy
ODdiM2QxMTVlNTM1MSBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTIzMiAgCSAq
IEZhaWx1cmUgaXMgZGV0ZWN0ZWQgYnkgZl90Y20gaGVyZS4gU2tpcCBzdWJtaXR0aW5nIHRoZSBj
b21tYW5kIHRvIHRoZQ0KPiAyODdiM2QxMTVlNTM1MSBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAy
NC0xMi0xMSAgMTIzMyAgCSAqIHRhcmdldCBjb3JlIGlmIHdlIGFscmVhZHkga25vdyB0aGUgZmFp
bGluZyByZXNwb25zZSBhbmQgc2VuZCB0aGUgdXNiDQo+IDI4N2IzZDExNWU1MzUxIFRoaW5oIE5n
dXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjM0ICAJICogcmVzcG9uc2UgdG8gdGhlIGhvc3Qg
ZGlyZWN0bHkuDQo+IDI4N2IzZDExNWU1MzUxIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEy
LTExICAxMjM1ICAJICovDQo+IDI4N2IzZDExNWU1MzUxIFRoaW5oIE5ndXllbiAgICAgICAgICAy
MDI0LTEyLTExICAxMjM2ICAJaWYgKGNtZC0+dG1yX3JzcCAhPSBSQ19SRVNQT05TRV9VTktOT1dO
KQ0KPiAyODdiM2QxMTVlNTM1MSBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTIz
NyAgCQlnb3RvIHNraXA7DQo+IDI4N2IzZDExNWU1MzUxIFRoaW5oIE5ndXllbiAgICAgICAgICAy
MDI0LTEyLTExICAxMjM4ICANCj4gMjg3YjNkMTE1ZTUzNTEgVGhpbmggTmd1eWVuICAgICAgICAg
IDIwMjQtMTItMTEgIDEyMzkgIAlpZiAoY21kLT50bXJfZnVuYykNCj4gMjg3YjNkMTE1ZTUzNTEg
VGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyNDAgIAkJdXNiZ19zdWJtaXRfdG1y
KGNtZCk7DQo+IDI4N2IzZDExNWU1MzUxIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTEx
ICAxMjQxICAJZWxzZQ0KPiAyODdiM2QxMTVlNTM1MSBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAy
NC0xMi0xMSAgMTI0MiAgCQl1c2JnX3N1Ym1pdF9jbWQoY21kKTsNCj4gMjg3YjNkMTE1ZTUzNTEg
VGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyNDMgIA0KPiAyODdiM2QxMTVlNTM1
MSBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI0NCAgCXJldHVybjsNCj4gMjg3
YjNkMTE1ZTUzNTEgVGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyNDUgIA0KPiAy
ODdiM2QxMTVlNTM1MSBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI0NiAgc2tp
cDoNCj4gNzczNWMxMGM3NGQ5MDMgVGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEy
NDcgIAlpZiAoY21kLT50bXJfcnNwID09IFJDX09WRVJMQVBQRURfVEFHKSB7DQo+IDc3MzVjMTBj
NzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjQ4ICAJCXN0cnVjdCBm
X3VhcyAqZnUgPSBjbWQtPmZ1Ow0KPiA3NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAg
ICAgMjAyNC0xMi0xMSAgMTI0OSAgCQlzdHJ1Y3Qgc2Vfc2Vzc2lvbiAqc2Vfc2VzczsNCj4gNzcz
NWMxMGM3NGQ5MDMgVGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyNTAgIAkJc3Ry
dWN0IHVhc19zdHJlYW0gKnN0cmVhbSA9IE5VTEw7DQo+IDc3MzVjMTBjNzRkOTAzIFRoaW5oIE5n
dXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjUxICAJCXN0cnVjdCBobGlzdF9ub2RlICp0bXA7
DQo+IDc3MzVjMTBjNzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjUy
ICAJCXN0cnVjdCB1c2JnX2NtZCAqYWN0aXZlX2NtZCA9IE5VTEw7DQo+IDc3MzVjMTBjNzRkOTAz
IFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjUzICANCj4gNzczNWMxMGM3NGQ5
MDMgVGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyNTQgIAkJc2Vfc2VzcyA9IGNt
ZC0+ZnUtPnRwZy0+dHBnX25leHVzLT50dm5fc2Vfc2VzczsNCj4gNzczNWMxMGM3NGQ5MDMgVGhp
bmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyNTUgIA0KPiA3NzM1YzEwYzc0ZDkwMyBU
aGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI1NiAgCQloYXNoX2Zvcl9lYWNoX3Bv
c3NpYmxlX3NhZmUoZnUtPnN0cmVhbV9oYXNoLCBzdHJlYW0sIHRtcCwgbm9kZSwgY21kLT50YWcp
IHsNCj4gNzczNWMxMGM3NGQ5MDMgVGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEy
NTcgIAkJCWludCBpID0gc3RyZWFtIC0gJmZ1LT5zdHJlYW1bMF07DQo+IDc3MzVjMTBjNzRkOTAz
IFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjU4ICANCj4gNzczNWMxMGM3NGQ5
MDMgVGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyNTkgIAkJCWFjdGl2ZV9jbWQg
PSAmKChzdHJ1Y3QgdXNiZ19jbWQgKilzZV9zZXNzLT5zZXNzX2NtZF9tYXApW2ldOw0KPiA3NzM1
YzEwYzc0ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI2MCAgCQkJaWYg
KGFjdGl2ZV9jbWQtPnRhZyA9PSBjbWQtPnRhZykNCj4gNzczNWMxMGM3NGQ5MDMgVGhpbmggTmd1
eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyNjEgIAkJCQlicmVhazsNCj4gNzczNWMxMGM3NGQ5
MDMgVGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyNjIgIAkJfQ0KPiA3NzM1YzEw
Yzc0ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI2MyAgDQo+IDc3MzVj
MTBjNzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjY0ICAJCS8qIFNh
bml0eSBjaGVjayAqLw0KPiA3NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAy
NC0xMi0xMSBAMTI2NSAgCQlpZiAoIXN0cmVhbSB8fCAoYWN0aXZlX2NtZCAmJiBhY3RpdmVfY21k
LT50YWcgIT0gY21kLT50YWcpKSB7DQo+IA0KPiBUZXN0aW5nIGZvciAhc3RyZWFtIGlzIHN1ZmZp
Y2llbnQuICBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byB3cml0ZSB0aGlzDQoNCkp1c3QgdGVz
dGluZyBmb3IgIXN0cmVhbSBpcyBzdWZmaWNpZW50IHRvIGtub3cgd2hldGhlciBhY3RpdmVfY21k
IGlzDQpOVUxMLCBidXQgd2Ugc3RpbGwgbmVlZCB0byBjaGVjayBmb3IgbWF0Y2hpbmcgdGFnIGFs
c28uDQoNCj4gYXM6DQo+IAlpZiAoIXN0cmVhbSB8fCAhYWN0aXZlX2NtZCB8fCBhY3RpdmVfY21k
LT50YWcgIT0gY21kLT50YWcpKSB7DQoNClBlcmhhcHMgd2UgY2FuIGp1c3QgZG8gdGhpczoNCg0K
CWlmICghYWN0aXZlX2NtZCB8fCBhY3RpdmVfY21kLT50YWcgIT0gY21kLT50YWcpKSB7DQoNCklm
IGFjdGl2ZV9jbWQgaXMgTlVMTCwgdGhlbiB0aGUgc3RyZWFtIHZhcmlhYmxlIG11c3QgYWxzbyBi
ZSBOVUxMLiBUaGlzDQptYXkgbm90IGJlIG9idmlvdXMuDQoNCj4gDQo+IDc3MzVjMTBjNzRkOTAz
IFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjY2ICAJCQl1c2JnX3N1Ym1pdF9j
b21tYW5kKGNtZC0+ZnUsIGNtZC0+cmVxKTsNCj4gNzczNWMxMGM3NGQ5MDMgVGhpbmggTmd1eWVu
ICAgICAgICAgIDIwMjQtMTItMTEgIDEyNjcgIAkJCXJldHVybjsNCj4gNzczNWMxMGM3NGQ5MDMg
VGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyNjggIAkJfQ0KPiA3NzM1YzEwYzc0
ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI2OSAgDQo+IDc3MzVjMTBj
NzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjcwICAJCXJlaW5pdF9j
b21wbGV0aW9uKCZzdHJlYW0tPmNtZF9jb21wbGV0aW9uKTsNCj4gNzczNWMxMGM3NGQ5MDMgVGhp
bmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyNzEgIA0KPiA3NzM1YzEwYzc0ZDkwMyBU
aGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI3MiAgCQkvKg0KPiA3NzM1YzEwYzc0
ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI3MyAgCQkgKiBBIFVBU1Ag
Y29tbWFuZCBjb25zaXN0cyBvZiB0aGUgY29tbWFuZCwgZGF0YSwgYW5kIHN0YXR1cw0KPiA3NzM1
YzEwYzc0ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI3NCAgCQkgKiBz
dGFnZXMsIGVhY2ggb3BlcmF0aW5nIHNlcXVlbnRpYWxseSBmcm9tIGRpZmZlcmVudCBlbmRwb2lu
dHMuDQo+IDc3MzVjMTBjNzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAx
Mjc1ICAJCSAqDQo+IDc3MzVjMTBjNzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEy
LTExICAxMjc2ICAJCSAqIEVhY2ggVVNCIGVuZHBvaW50IG9wZXJhdGVzIGluZGVwZW5kZW50bHks
IGFuZCBkZXBlbmRpbmcgb24NCj4gNzczNWMxMGM3NGQ5MDMgVGhpbmggTmd1eWVuICAgICAgICAg
IDIwMjQtMTItMTEgIDEyNzcgIAkJICogaGFyZHdhcmUgaW1wbGVtZW50YXRpb24sIGEgY29tcGxl
dGlvbiBjYWxsYmFjayBmb3IgYSB0cmFuc2Zlcg0KPiA3NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5
ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI3OCAgCQkgKiBmcm9tIG9uZSBlbmRwb2ludCBtYXkg
bm90IHJlZmxlY3QgdGhlIG9yZGVyIG9mIGNvbXBsZXRpb24gb24NCj4gNzczNWMxMGM3NGQ5MDMg
VGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyNzkgIAkJICogdGhlIHdpcmUuIFRo
aXMgaXMgcGFydGljdWxhcmx5IHRydWUgZm9yIGRldmljZXMgd2l0aA0KPiA3NzM1YzEwYzc0ZDkw
MyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI4MCAgCQkgKiBlbmRwb2ludHMg
dGhhdCBoYXZlIGluZGVwZW5kZW50IGludGVycnVwdHMgYW5kIGV2ZW50IGJ1ZmZlcnMuDQo+IDc3
MzVjMTBjNzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjgxICAJCSAq
DQo+IDc3MzVjMTBjNzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjgy
ICAJCSAqIFRoZSBkcml2ZXIgbXVzdCBzdGlsbCBkZXRlY3QgbWlzYmVoYXZpbmcgaG9zdHMgYW5k
IHJlc3BvbmQNCj4gNzczNWMxMGM3NGQ5MDMgVGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTIt
MTEgIDEyODMgIAkJICogd2l0aCBhbiBvdmVybGFwIHN0YXR1cy4gVG8gcmVkdWNlIGZhbHNlIG92
ZXJsYXAgZmFpbHVyZXMsDQo+IDc3MzVjMTBjNzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAy
MDI0LTEyLTExICAxMjg0ICAJCSAqIGFsbG93IHRoZSBhY3RpdmUgYW5kIG1hdGNoaW5nIHN0cmVh
bSBJRCBhIGJyaWVmIDFtcyB0bw0KPiA3NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAg
ICAgMjAyNC0xMi0xMSAgMTI4NSAgCQkgKiBjb21wbGV0ZSBiZWZvcmUgcmVzcG9uZGluZyB3aXRo
IGFuIG92ZXJsYXAgY29tbWFuZCBmYWlsdXJlLg0KPiA3NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5
ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI4NiAgCQkgKiBPdmVybGFwIGZhaWx1cmUgc2hvdWxk
IGJlIHJhcmUuDQo+IDc3MzVjMTBjNzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEy
LTExICAxMjg3ICAJCSAqLw0KPiA3NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAgICAg
MjAyNC0xMi0xMSAgMTI4OCAgCQl3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJnN0cmVhbS0+
Y21kX2NvbXBsZXRpb24sIG1zZWNzX3RvX2ppZmZpZXMoMSkpOw0KPiA3NzM1YzEwYzc0ZDkwMyBU
aGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI4OSAgDQo+IDc3MzVjMTBjNzRkOTAz
IFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjkwICAJCS8qIElmIHRoZSBwcmV2
aW91cyBzdHJlYW0gaXMgY29tcGxldGVkLCByZXRyeSB0aGUgY29tbWFuZC4gKi8NCj4gNzczNWMx
MGM3NGQ5MDMgVGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyOTEgIAkJaWYgKCFo
YXNoX2hhc2hlZCgmc3RyZWFtLT5ub2RlKSkgew0KPiA3NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5
ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI5MiAgCQkJdXNiZ19zdWJtaXRfY29tbWFuZChjbWQt
PmZ1LCBjbWQtPnJlcSk7DQo+IDc3MzVjMTBjNzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAy
MDI0LTEyLTExICAxMjkzICAJCQlyZXR1cm47DQo+IDc3MzVjMTBjNzRkOTAzIFRoaW5oIE5ndXll
biAgICAgICAgICAyMDI0LTEyLTExICAxMjk0ICAJCX0NCj4gNzczNWMxMGM3NGQ5MDMgVGhpbmgg
Tmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEyOTUgIA0KPiA3NzM1YzEwYzc0ZDkwMyBUaGlu
aCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI5NiAgCQkvKg0KPiA3NzM1YzEwYzc0ZDkw
MyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTI5NyAgCQkgKiBUaGUgY29tbWFu
ZCBpc24ndCBzdWJtaXR0ZWQgdG8gdGhlIHRhcmdldCBjb3JlLCBzbyB3ZSdyZSBzYWZlDQo+IDc3
MzVjMTBjNzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjk4ICAJCSAq
IHRvIHJlbW92ZSB0aGUgYml0bWFwIGluZGV4IGZyb20gdGhlIHNlc3Npb24gdGFnIHBvb2wuDQo+
IDc3MzVjMTBjNzRkOTAzIFRoaW5oIE5ndXllbiAgICAgICAgICAyMDI0LTEyLTExICAxMjk5ICAJ
CSAqLw0KPiA3NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAg
MTMwMCAgCQlzYml0bWFwX3F1ZXVlX2NsZWFyKCZzZV9zZXNzLT5zZXNzX3RhZ19wb29sLA0KPiA3
NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTMwMSAgCQkJ
CSAgICBjbWQtPnNlX2NtZC5tYXBfdGFnLA0KPiA3NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5ZW4g
ICAgICAgICAgMjAyNC0xMi0xMSAgMTMwMiAgCQkJCSAgICBjbWQtPnNlX2NtZC5tYXBfY3B1KTsN
Cj4gNzczNWMxMGM3NGQ5MDMgVGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQtMTItMTEgIDEzMDMg
IA0KPiA3NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAgMTMw
NCAgCQkvKg0KPiA3NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0x
MSAgMTMwNSAgCQkgKiBPdmVybGFwIGNvbW1hbmQgdGFnIGRldGVjdGVkLiBDYW5jZWwgYW55IHBl
bmRpbmcgdHJhbnNmZXIgb2YNCj4gNzczNWMxMGM3NGQ5MDMgVGhpbmggTmd1eWVuICAgICAgICAg
IDIwMjQtMTItMTEgIDEzMDYgIAkJICogdGhlIGNvbW1hbmQgc3VibWl0dGVkIHRvIHRhcmdldCBj
b3JlLg0KPiA3NzM1YzEwYzc0ZDkwMyBUaGluaCBOZ3V5ZW4gICAgICAgICAgMjAyNC0xMi0xMSAg
MTMwNyAgCQkgKi8NCj4gNzczNWMxMGM3NGQ5MDMgVGhpbmggTmd1eWVuICAgICAgICAgIDIwMjQt
MTItMTEgQDEzMDggIAkJYWN0aXZlX2NtZC0+dG1yX3JzcCA9IFJDX09WRVJMQVBQRURfVEFHOw0K
PiANCj4gVGhlIGluY29uc2lzdGVudCBOVUxMIGNoZWNrIHRyaWdnZXJzIGEgd2FybmluZyBoZXJl
Lg0KPiANCg0KV2UgYWxyZWFkeSBjaGVjayBmb3IgIXN0cmVhbSBwcmlvciwgc28gSSBkaWRuJ3Qg
Y2hlY2sgZm9yIGFjdGl2ZV9jbWQNCmhlcmUuIFRoaXMgaXMgbW9yZSBvZiBhIGNvbnNpc3RlbmN5
IGlzc3VlLiBJZiBwb3NzaWJsZSBhbmQgaWYgbmVlZGVkLCB3ZQ0KY2FuIG1ha2UgdGhpcyBtb3Jl
IGNvbnNpc3RlbnQgYWZ0ZXIgdGhlIG1lcmdlPw0KDQpUaGFua3MsDQpUaGluaA==

