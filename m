Return-Path: <linux-usb+bounces-30505-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1E6C5AE27
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 02:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 481974E3033
	for <lists+linux-usb@lfdr.de>; Fri, 14 Nov 2025 01:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C23D22D4DC;
	Fri, 14 Nov 2025 01:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="NdEPQiyd";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WDvoRTNW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Lrz2aUML"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFB41DB95E;
	Fri, 14 Nov 2025 01:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763082899; cv=fail; b=CuOx3vhEmKan7FRk7RqSXn5DGdLkO92vhQdBEZ0Q3u8jMj+/RfSWm049wlLXvUi4/b0JtIJL2a2OIG8mqgaT5SOkDO8LD5rfIcgEgbkwBsgHJdEq0P0ijPYZ/eBJquTuCUklNtGnT5wtJ3eju2zq9ttKfVJGAbzrDmr4zRqIad0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763082899; c=relaxed/simple;
	bh=JOvgODcHANCvbCfhXwKzhHWkkLqjAMBner9JvyNsSxM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ADjjREBYxAtS9XrgjJLKX224KmrB4DomHXcMYPM5NGiKab3eDBN083VSJxm5jNFzzFulx6+imjnmjBB1aFQUaJQje6ykrjfIbb6M1EHn5SP1cFHbnVInox5gNVDAnuiH0ZI6FUQOL4iFqnKz58NRXj+PgdpO2bEiD9ZM5pHk4cU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=NdEPQiyd; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WDvoRTNW; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Lrz2aUML reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMYl3Q2495417;
	Thu, 13 Nov 2025 16:04:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=JOvgODcHANCvbCfhXwKzhHWkkLqjAMBner9JvyNsSxM=; b=
	NdEPQiyd2/3hX8zOIboVCol5ILrcCwSkY8VdmS+JdIbcVtcDMMquK5WmVFRInU14
	SwjVUPv9F4JOmqwX/AslTZ3DXRESrASOp9GrYy6umh6uu5WsjFZmSxi5RWjt3sVV
	tk2sGbBkb6RxIodeDcZmHeDjgkAzrqL7oaMebokKMOc/kRiEnkWg1EREopHq9Fyy
	4PsY8J4RJZsGSk5RwiU7q/i8aA8eZv1Pvdexbz8W7Xqw8vTxF1PtIY02BKyIi6Qx
	LrhVgVFCd5wr90Irmz077qq/2CR9jJOnSxoHhi6zSRrrkeRSMlKEvjx/nLuovKdv
	pw/70t3mpFh4sDNHgX0N3A==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4adr8f0997-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Nov 2025 16:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1763078673; bh=JOvgODcHANCvbCfhXwKzhHWkkLqjAMBner9JvyNsSxM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=WDvoRTNWzrNO1ZrD039QnqyLf9oPSoIww+W3TIR6sY7Hciu8n+EHpdeBaeGoVd291
	 vfU9tE3taTO1riQSIpv9SIVecQ3MPsZrspW/OhwBjIqpRf5qGa0W6xkkzmrhvhg5Js
	 3xO2oOXC51TZcspJAlqaJSQeMO8h8uXM0dfDrEBmCDcKLe5eFVdwOTJS2CeWh4zB5N
	 VwvAGa+pSN64B4WGYa50xKn5hQ8UGvZ9sqj+HyNMtlgnvoERYSZK5pMl06KtMlbNcT
	 s37ybMCNxY0MwRuY7A+E/aPeD2yrM01Qn9s0tgiTqVgu3p7HxcgFCcQiveMsvcWuUG
	 gXsBzBYKVH8BA==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 11CC24034A;
	Fri, 14 Nov 2025 00:04:33 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C7594A006F;
	Fri, 14 Nov 2025 00:04:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=Lrz2aUML;
	dkim-atps=neutral
Received: from CY3PR08CU001.outbound.protection.outlook.com (mail-cy3pr08cu00102.outbound.protection.outlook.com [40.93.6.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5F5C54028D;
	Fri, 14 Nov 2025 00:04:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNajalb3UrguOJHp2MIdjgRDAu1Xp5vTBgeK/JrO9rwZRxnln9/bydPULE4jeyomcZQC+XqzolXaul84LfTrrPxpyfW9RZhqNxa4dVR3lcH8IGWbhamVrjeMIakqYlqp7vPx1IxHlnN3zFBm2WwUD3a12HoUYe3bFTzaK8tFebuCrLe1AQ1qfQKxFTlM6W7KvlksbhWPU6cGUNBufJ1La5CwXcbaJlqXYnJxY0Y0JteiNBPaiAWhIzs3S2ZiUkh9YB2RaM4h12I2kBsikGaLOTsDv3RRUuUCpeAlE+k4fPQNoBHESZ3DMDEtlshltvidmSbPpdxLFMHZyNN+vrKrwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOvgODcHANCvbCfhXwKzhHWkkLqjAMBner9JvyNsSxM=;
 b=DuSd3R78JkRFUcOKMohsQZzNLG4QuVDEeqPOaPryd8yAhQRn4Wnw5l4YZjB/wWHTUiPBXEEJIcCwmQHYyS89OaKwaOd0oqktFxYjh3Ta0XQhdj1U5J8RLwalUIj5V0uchHhR5ngQqnTVDjjtHnnQPyVSL2HQwK1hOYlwPn917/3ABS7xY0o2zSYNsRqYkiq2OjGPP7Sxs9SGkeUydMPVLB0CFLfZ2/Nxw2hkUGIJgTUupXLPSLcqo0xYp/q+qTR9b8CPldZao0AGav4xar7ko0BE6EuIprT6Wfe5N1B95Wz0ZaaJJpID/L/zDSpjycFIYKYtt3zmRYYgrKJb/8ytAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOvgODcHANCvbCfhXwKzhHWkkLqjAMBner9JvyNsSxM=;
 b=Lrz2aUMLZNbVAzdLb7tTaVimk6ZO85GnTK92aXTjvd80QM+r+P+JZoBMBDn/PrA4SIsUINZjDVgCfwND7SFqzYEIs0KvsrIW3vT0FGJK6XznPL3CMfLhzffBFNQ0eVlOaz6QUN3NdbFoTyLjm8jQSxN9eFUc70U7dMDJjn5x8xo=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by IA4PR12MB9809.namprd12.prod.outlook.com (2603:10b6:208:54f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 00:04:29 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%5]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 00:04:29 +0000
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
Subject: Re: [PATCH 4/4] usb: dwc3: add support for configurable DMA
 addressable bits
Thread-Topic: [PATCH 4/4] usb: dwc3: add support for configurable DMA
 addressable bits
Thread-Index: AQHcUtNn4H2cr87VnUmVv0nSywj9FLTxTteA
Date: Fri, 14 Nov 2025 00:04:29 +0000
Message-ID: <20251114000429.sy3p53urp6x6ijfv@synopsys.com>
References: <cover.1762839776.git.adrianhoyin.ng@altera.com>
 <c69076470c19fc03d92fc04cdb10960873bc2bc0.1762839776.git.adrianhoyin.ng@altera.com>
In-Reply-To:
 <c69076470c19fc03d92fc04cdb10960873bc2bc0.1762839776.git.adrianhoyin.ng@altera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|IA4PR12MB9809:EE_
x-ms-office365-filtering-correlation-id: 1b2996e2-8798-472e-e045-08de231161e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?YVd0RTE3R3FSa3ZhemhvOGprZ0JCd0psMENJYWdyM0toRGl6RXI2bGVSN1lN?=
 =?utf-8?B?K2tMU09rVWhCd0pVV3VjQnpBdFJjWkxtOFNGRHhBdng2NmlUWk9sWFlRbGxP?=
 =?utf-8?B?S2t3dFA3dk9xOUFpOE5HS0FDdVpVVnlNUDVrc0VVNHMyMkF5aGV2SDFmcG9I?=
 =?utf-8?B?RitFMWFlZUpCcXZCUVBKN3R5OFQ3OHduRll3R2k2VmVUUjhwUEMza3BoUnc1?=
 =?utf-8?B?VDQ2OW1BUjNoZUVHQzE1WjJnSUlUY2p3clJDZnlJZ3ljZEZ4RmZWbUJFQWls?=
 =?utf-8?B?dW1XWVpBWGdKOHdiQ1FKaFUxaXlNdjZEVWdxNTBLWW5PemFsRWl0VmZHR20z?=
 =?utf-8?B?VXhhNVRIcFlYblQ0RG5BdTVnWnNWWVU5YlZjUWpOVXN1bWMzcGFCazlBWGJv?=
 =?utf-8?B?K3VPenVmUEFreU8raGp5ejR5MlQwT09MUWFQb3dQNk1xK2JmM2FUc2ZDOWxU?=
 =?utf-8?B?Q2tzckErNnowVXh0a1dSVEZEenNOeFFDdW43NXFTTkFmbzk2TkhiaXRvVU1P?=
 =?utf-8?B?QTE2aDJMUzJtZnZGSFNjR1AwUThrVFUrejU2Y1dPWjVkU0pvSFVTYkVON0Jn?=
 =?utf-8?B?UkFvOEVFMjNUbENaQWZENURBWU83THQ0R1o2WEpucnRrQTdnUzNkNm5odCtC?=
 =?utf-8?B?N3Y0anRqcFdlTDNVak5xeW9jb0pSSHgxTm1mWGd0M2dHSDEzdkZRclovS1Rw?=
 =?utf-8?B?M2VKUlgxdUhVRllqcEh3QXFscTdobElYOVIzZ3NQLzcvd0RGVUxSaTlBV3l1?=
 =?utf-8?B?OXI4bldhN21Jb1VSUHFSdG0rS1ArYWpURWZZL254VzB3TngyVlJ6dGxBaFRU?=
 =?utf-8?B?OHZVSTVZeTQycnZmQnFNQ2RRNGFzV1VhMGRCVXROMlVoazk0cEh1UmFvR1FO?=
 =?utf-8?B?cjhITVIxV1MycVpibzhKUlNLejlYMkZwdTFBNjdxb09QRVlkdmptekk0aGgx?=
 =?utf-8?B?SUVKNmFSQWV0aDNTbG1SckhObE4xL2kwQ2JzTkZ2LzJKOW1STTM5YktlT0pa?=
 =?utf-8?B?S1RQOEl4TjNqcUl6eU1KNEVacCtvbWdxZTc3Zld0dnpHaVhRMnduSmJuZ2wv?=
 =?utf-8?B?cjY5ajlGQ1VxSHBOT0V0ZnNBc0Y0R2xlQldpa250R1pCK2puMTdJMko0ZDdJ?=
 =?utf-8?B?eGVDQTZ0NEtwU0RTbm4ybFZUdGZhNkVFRmlJU1RzOW50L28rWXpaS2dWbTE0?=
 =?utf-8?B?Slg4KzZ5NURUcFdmMCs4eTdCQVNhcmhkcTluQ3FuM1IyL09CV3BUd2VZUjhX?=
 =?utf-8?B?WU4rTjNSOUYrUGtCRU1wUUpmYWdvY2dDbzhFK3ptUkE2UDE0Y2kxa283QlJr?=
 =?utf-8?B?VzN5NHExV1JVd0c4RUxJdlU3b1U5MU5td014NmpPdllUS3huR3BLd1c5bWZM?=
 =?utf-8?B?TXlBQnl6azNpaU1aM1lTZm5JWGgwNk91a3Z6aHJDRW9razZVTEdRNC8wZEdT?=
 =?utf-8?B?V1BVNCtTbTBsK0lGWWRCaGNrc1I1SmlGRytIWm1CcGZYVld5NHhwUUhMMS8x?=
 =?utf-8?B?SlFVZkI2RFFqNVNESitZaEJLR2lTQ3lRdDRjTE1mNWtaQVU0MWhjaXJ5c0dF?=
 =?utf-8?B?S0xrUjV4MllPS1ZKTWVzYU55b0dOTE1IUUl3SWxmeGZwK29LZkdjOGhrYys5?=
 =?utf-8?B?VldaZHRvNzdvQlc0bzRBeVMyODJMQnBzWWhrYXpYVE9RT3JaMUJ4TmtnQmVF?=
 =?utf-8?B?WnNZWVk3NHljK1BxVm9TV1FobnZYM0ROVUNBN2JaS3V0UGJJUnJ0QmtlN1Zo?=
 =?utf-8?B?cnR0R0JGa2l6S2NGcjE4bTVYa3dEdlB2ZWtKekwxV2lraUlFSnMvcUJTQk5J?=
 =?utf-8?B?cUN4VC85d1BzNDNhVjBUSjBLeHFDOHBnNTFaNGczQlNYS0J6cnNpVURCNE9n?=
 =?utf-8?B?aFU5bTZyTjRaRWsvdFB5eEh5dWZuOGFnQlplQU1JVE5Gd3I0ZDBCM1oyTnFN?=
 =?utf-8?B?LzhRUGJkbjRRM2FTVlNOT1RFNTk5L1ViWm5XK3k1ZTM1SHd1REFPRkdMMzdC?=
 =?utf-8?B?Zzhjb3JEUS9DQUJhR1lmRE1VT2RUZUNTc28yamR3amx5eDQ0NittczNQUCtk?=
 =?utf-8?Q?4hfcIN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bWV0R3pZUU9NcXhjQ1pMRHUvc1Z6VHNVK3VDYlBVbnZTY0IrdG1CV05ITVdr?=
 =?utf-8?B?bWptOThodXA1THp0RENGbjZrdk1oQXZ5Ni8xUVBpd1ZoSlFhbW9wWjNpT3VJ?=
 =?utf-8?B?MkZXbUJyZ2lJOVVPQWJ0czFIVGNROUU0dVpsMXAxanRKYlpyeEtEYjNCbTNp?=
 =?utf-8?B?QjhvUkZaV3JvSWUrSy9DZmdTMnl3cjE3dExpSGRjTFRkbmtQYmtwZmE1dE9R?=
 =?utf-8?B?WXZHQjJyWStwMzBRc2FUSnlrRGdxWCtPbUU3aU95ZGgvT3BKOWk2aDZPYjlZ?=
 =?utf-8?B?M1hhVjQ4UDZ3RGplZU5ZU1lpMmpIU0ZaTlZ6NTNPWjFlNEpGWnJ4aG55bUVq?=
 =?utf-8?B?NTcyWXVWdks3Q1Zab2FXMnQxYS93bGZMZnREOGhpaGhETXYzUFY3RlFuUUVS?=
 =?utf-8?B?ZVhDUXhyR3laKzFsbndhbDRnaE1kSFBrU01DTXd1OFNyME1LZWxjMkNQUEVD?=
 =?utf-8?B?Y1FtdXZ0dVhrVlEvQ0RjREVuMS9MNXhwWG9Rb1VQZVowVHloRjBpd2NLUDlX?=
 =?utf-8?B?RVlPNGZhMUhRcWsvZS8vWVRQcStERThxRnl6bGFNeXFsQ0FiOFZ1WWpsNzFM?=
 =?utf-8?B?MmVVdUZ1Q0tZcy8rSmJ0YTBQMFVOTFFOS0U4RkhqN1luMlowMWdPRWhGQ2g5?=
 =?utf-8?B?OVhtZFh2MWx1dDVIaUk2eUsrMVlHK0gvZFNlNmNrYThzb0ljNk9CQlBmSFhI?=
 =?utf-8?B?c3c4R1R2bEVycmVzSzN0OGhyZnRoTW9PUTF6QU9UNmU2elBCbFpHaTRNYjhS?=
 =?utf-8?B?UTRCWDRBdHM2OVM3bnFQZnp4a0MvWC9jZHdLbGNJVVNFUVFDaURvNkRqZWtS?=
 =?utf-8?B?SU84b2tuNWRzc0dITHVkbGpTZW4wUVZ2MXlLMUFzMmc0bTdtN0dYMHBuV2l4?=
 =?utf-8?B?cnUzejQwM0E5V1F3R1YrT05OOE5LSGdUMVFTTzhZQ0lkV0d4TUxhbHdXMnNx?=
 =?utf-8?B?N1lJd05PYWZXWCtDZmZmMVlHTjhmRTQ0RlNaZDgxN2JVM1p3QU9pTXhOMkl2?=
 =?utf-8?B?OE9rWjVKKzRlRlBWRXBESitYR0wrKzNCTEs1b1MySmt5alh2d1J2VDAray80?=
 =?utf-8?B?dzlMTTZ0WHlNYmIzNzJWSlF4d2t6UzUxdWhWbG8wS1NHRnpuUzZvSXh2SmJJ?=
 =?utf-8?B?MStpQzZySE96cEpZbkhnMENYbmhiRFdiRUdPVjZuYStyVlZtRURWUzNMa28z?=
 =?utf-8?B?Y2JDVDlNUnRLL2YvQ285UXRGNU5VWE9Ock1RSkpWUGYwR0pzMmNscEUzY1p5?=
 =?utf-8?B?NmNJdE42d2RtcENCajRReDVIRkxGcnRxeGVWQkVQSU5ydTZ6MEN3NXpuL3or?=
 =?utf-8?B?eUsyVmM4WDl2MWVKaDhIbVAvYUpYS2RobEFQVW1XL0sxVkNIeHhoRFJJOTM1?=
 =?utf-8?B?VkV0Nmhod3BtKzhiTVJqUCtBekJxVkdGYzhZdXZjQkx6NDYvQlNrZDdlZWxT?=
 =?utf-8?B?Zm1QUE5LL2lMTDAzS3FTRzErc0xkcHQ4a2VTQ2hMeXExQjdGRXRrYjR3eklJ?=
 =?utf-8?B?SzJIZndYbW5zbWdEZW5CVzF1TWdBZ0ltTmpKMVRxNVdyNms1SlhLUTBTOTRh?=
 =?utf-8?B?M2ZQRFdvKzUvVnYvc2JveUJPOFBLajhESzNqUENjRnFyTTBsRS9OWHNXcFBp?=
 =?utf-8?B?NE9HYldRSlg3dU1BeDFwOFpsb0pPc3c5ZU95ZDNOdVllZHNFNjZHMWV4RzVy?=
 =?utf-8?B?L0xyd25aeGNFMXhINldzSWtlQ0pJWTJybHZGd3B2djZmclZmdllyUUlhZWM2?=
 =?utf-8?B?RmduZEpPR3ZKUzhCUkRsR0VBN0FzYy96SXNZejJGaTRUbGNhYURJYlJyY1pm?=
 =?utf-8?B?aVl6TWVhWUpuQ1lDeUxiTjNSU2MyZmxSdnNMbWlvMjVoaWR6eC9pWi8vZkwz?=
 =?utf-8?B?YmpoV3VTRmI5WUZqK3VZS3NiaXZORmEwQVc0bWJuSWJIWU9GRzUxVDFoQVFG?=
 =?utf-8?B?M0NvRnpSc0JiakNYUjBGUFBmZnA0VjRIOGVPVG5vc09yeFdBZjBYTk0rTTkw?=
 =?utf-8?B?VVg5NFhWdjVVMHFBdHdXQUxSUUtXd3J5OTEybGpjMjhHUGdwaVpWUlZTMkpP?=
 =?utf-8?B?bzFxWjNMQ2Z0M29qV0NPUnorWThNa2J5NHc1Rk1aaVRRQnFWbVhtUkhmUXJl?=
 =?utf-8?B?ZzMzRnZaUmxjMWpPbVl3dkUrOEwwUWhjMHRnWTNNeVlIeG1HT1FEc1REMGRl?=
 =?utf-8?B?THc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <884A5F100346114584A539A5B85C077E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	i3C42J17Y+jo3fInMGAYT69TqVMvGBSn4KnNl6eWuMSNrCcZCMoW1U6AFMotoPt4lv5kauKYewguLx0++Z1b7586OfxiZ7nLKHdlIpAQhXewDJZbFL3mR+/IKL8/IdU7QtOSN7aBjVsD/c8WvbsOf4JC2x63rLf/Ei2647PBZIXaOmj3Uw6blg6+8WyzdtguTPFzEApyxn5wA9dViYhwyDpIdGRQjgNP8v7SSpxEbK8jqbUQZalnmZug+pQmEGRivBGvYBiHYl2GARiSfJJcqEZIBJPepAQaUT4wBUV9qppUytztdhAH76Sv5xxBXU5oZlvPUMgzs1RZw3+RYRxw2tLkFnc6Dn3T/qAvSbKWS0s5qUa4RrUEhzdMppQQvGvA2v2SjrlIZnB4d+s+Gnvxlx6HmY9PFx4jCyXR1LNbFRV8fGK+jSyx1v6XJlPW9qVPfqKtZvdloEeHzqJxb2XyT++ogW8HM8gtZOv4z9gtooTodXn14z2Ma6O7L1Mz5QxEBQjvleo0rOoLxqI19MV5N1n3wZqf0OlWGuUFQ/USmOx24n9Dpsu1e8vx5uiXkJQOvDpyGDstvPXscVgCm9gJhn2afC21VQ970JLQH2rNIy3tWCCJD7biVxcxVkzKlFutg5TAcY+aEQltDD0b0pRNJg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2996e2-8798-472e-e045-08de231161e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2025 00:04:29.6855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RU4FZW8nIyn8xS9KJ3Xq56ipdO8bYTsV1JDDMbc3z8SLTVbVWy109QeDcHKxxExUkx7ZlWFte5retp7a5vqHNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9809
X-Proofpoint-ORIG-GUID: piAgx67BdqIr_DRpP2mAbK1xfc5zCZOg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE5MCBTYWx0ZWRfX8H4z0BzAZtNm
 9N8X5pYwP5D9jUyLa5PknA5nEk8s+UD0yQqD979gB5RbQfiA7Dkxm777qBKtc3VFzPk8wjeqSM2
 mlcgYK7v7o1odra1rCKKRA2U6hlYiWkPeX51HNyRDJ0Zra1yt5hhyjZaanq+Yhm52yvw/Nwm/lY
 Yy4I+Ru2c3x1a/m7KQhM2JOMQNWuqnQL5Wgnf2Ezn44aQZG89BKG4gEtU6F1ofTqHKrGXfVBcFd
 0J+x9R3/no392EgH74SrBhSPqXCQQ5N7sbVvUoFiaPOlNsgrJKZp1QzvI9cP4D0j1R7Q5CECO5Z
 v3RDyKy1hnRECAiyMPBSeBw9Pn2q6Smr7FkeJUjraD/OMpNAp5YWuhi12G4v472nPPeloRVHXnD
 rAYKiBmtZw7WMGQVhAV58mNQE5+WnQ==
X-Proofpoint-GUID: piAgx67BdqIr_DRpP2mAbK1xfc5zCZOg
X-Authority-Analysis: v=2.4 cv=W+01lBWk c=1 sm=1 tr=0 ts=69167212 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yBYpec10AAAA:8 a=7Kx0G_pHveOwMdtVJMAA:9
 a=QEXdDO2ut3YA:10 a=zbxmTX4fiVD2UiCe4Dha:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2511130190

T24gVHVlLCBOb3YgMTEsIDIwMjUsIGFkcmlhbmhveWluLm5nQGFsdGVyYS5jb20gd3JvdGU6DQo+
IEZyb206IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbmhveWluLm5nQGFsdGVyYS5jb20+DQo+IA0K
PiBBZGQgc3VwcG9ydCBmb3IgY29uZmlndXJpbmcgdGhlIERNQSBhZGRyZXNzYWJsZSBiaXQgd2lk
dGggaW4gdGhlDQo+IFN5bm9wc3lzIERlc2lnbldhcmUgVVNCMyAoRFdDMykgY29yZSBkcml2ZXIu
DQo+IA0KPiBBbHRlcmEgQWdpbGV4NSBzdXBwb3J0cyBvbmx5IDQwLWJpdCBETUEgYWRkcmVzc2lu
Zy4gU2V0dGluZyBhbiBpbmNvcnJlY3QNCj4gRE1BIG1hc2sgKHN1Y2ggYXMgdGhlIGRlZmF1bHQg
NjQtYml0KSBjYW4gbGVhZCB0byBhZGRyZXNzIHRydW5jYXRpb24gb3INCj4gdHJhbnNsYXRpb24g
ZmF1bHRzIHdoZW4gdGhlIFNNTVUgaXMgZW5hYmxlZC4NCj4gDQo+IFRoaXMgY29tbWl0IGludHJv
ZHVjZXMgYSBuZXcgZmllbGQsIGRtYV9hZGRyZXNzYWJsZV9iaXRzLCBpbiB0aGUgZHdjMw0KPiBz
dHJ1Y3R1cmUgdG8gdHJhY2sgdGhlIHBsYXRmb3Jt4oCZcyBzdXBwb3J0ZWQgRE1BIHdpZHRoLiBU
aGUgZGVmYXVsdCB2YWx1ZQ0KPiBpcyBzZXQgdG8gNjQgYml0cywgYnV0IGZvciBBZ2lsZXg1IHBs
YXRmb3JtcyAoYWx0cixhZ2lsZXg1LWR3YzMpLCB0aGUNCj4gdmFsdWUgaXMgb3ZlcnJpZGRlbiB0
byA0MCBiaXRzLiBUaGlzIGZpZWxkIGlzIHRoZW4gdXNlZCB3aGVuIHNldHRpbmcgdGhlDQo+IERN
QSBtYXNrIHRvIGVuc3VyZSBjb21wYXRpYmlsaXR5IHdpdGggdGhlIHN5c3RlbeKAmXMgYWN0dWFs
IGFkZHJlc3MgYnVzDQo+IGNhcGFiaWxpdGllcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFkcmlh
biBOZyBIbyBZaW4gPGFkcmlhbmhveWluLm5nQGFsdGVyYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmMgfCA5ICsrKysrKysrLQ0KPiAgZHJpdmVycy91c2IvZHdjMy9jb3Jl
LmggfCAzICsrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRleCBhZTE0MGMzNTYyOTUuLjIwZTY1NTM2NDEzNSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTIxNzksNiArMjE3OSw5IEBAIGludCBkd2MzX2NvcmVfcHJv
YmUoY29uc3Qgc3RydWN0IGR3YzNfcHJvYmVfZGF0YSAqZGF0YSkNCj4gIAlkd2MtPnhoY2lfcmVz
b3VyY2VzWzBdLmZsYWdzID0gcmVzLT5mbGFnczsNCj4gIAlkd2MtPnhoY2lfcmVzb3VyY2VzWzBd
Lm5hbWUgPSByZXMtPm5hbWU7DQo+ICANCj4gKwkvKiBJbml0aWFsaXplIGRtYSBhZGRyZXNzYWJs
ZSBiaXQgdG8gNjQgYml0cyBhcyBkZWZhdWx0ICovDQo+ICsJZHdjLT5kbWFfYWRkcmVzc2FibGVf
Yml0cyA9IDY0Ow0KDQpUaGlzIHNob3VsZCBiZSBhIGR3YzMgcHJvcGVydHkgdGhhdCBjYW4gYmUg
cGFzc2VkIGJ5IHRoZSBnbHVlLg0KDQo+ICsNCj4gIAkvKg0KPiAgCSAqIFJlcXVlc3QgbWVtb3J5
IHJlZ2lvbiBidXQgZXhjbHVkZSB4SENJIHJlZ3MsDQo+ICAJICogc2luY2UgaXQgd2lsbCBiZSBy
ZXF1ZXN0ZWQgYnkgdGhlIHhoY2ktcGxhdCBkcml2ZXIuDQo+IEBAIC0yMTk0LDYgKzIxOTcsOSBA
QCBpbnQgZHdjM19jb3JlX3Byb2JlKGNvbnN0IHN0cnVjdCBkd2MzX3Byb2JlX2RhdGEgKmRhdGEp
DQo+ICAJCQlkd2NfcmVzLnN0YXJ0ICs9IERXQzNfUlRLX1JURF9HTE9CQUxTX1JFR1NfU1RBUlQ7
DQo+ICAJCX0NCj4gIA0KPiArCQlpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUocGFyZW50LCAi
YWx0cixhZ2lsZXg1LWR3YzMiKSkNCg0KQXZvaWQgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoKSBp
biB0aGUgY29yZS4gRG8gdGhpcyBpbiB0aGUgZ2x1ZS4NCg0KPiArCQkJZHdjLT5kbWFfYWRkcmVz
c2FibGVfYml0cyA9IDQwOw0KPiArDQo+ICAJCW9mX25vZGVfcHV0KHBhcmVudCk7DQo+ICAJfQ0K
PiAgDQo+IEBAIC0yMjQzLDcgKzIyNDksOCBAQCBpbnQgZHdjM19jb3JlX3Byb2JlKGNvbnN0IHN0
cnVjdCBkd2MzX3Byb2JlX2RhdGEgKmRhdGEpDQo+ICANCj4gIAlpZiAoIWR3Yy0+c3lzZGV2X2lz
X3BhcmVudCAmJg0KPiAgCSAgICBEV0MzX0dIV1BBUkFNUzBfQVdJRFRIKGR3Yy0+aHdwYXJhbXMu
aHdwYXJhbXMwKSA9PSA2NCkgew0KPiAtCQlyZXQgPSBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50
KGR3Yy0+c3lzZGV2LCBETUFfQklUX01BU0soNjQpKTsNCj4gKwkJcmV0ID0gZG1hX3NldF9tYXNr
X2FuZF9jb2hlcmVudChkd2MtPnN5c2RldiwNCj4gKwkJCQkJCURNQV9CSVRfTUFTSyhkd2MtPmRt
YV9hZGRyZXNzYWJsZV9iaXRzKSk7DQo+ICAJCWlmIChyZXQpDQo+ICAJCQlnb3RvIGVycl9kaXNh
YmxlX2Nsa3M7DQo+ICAJfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgg
Yi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiBpbmRleCBhNWZjOTJjNGZmYTMuLmRkYzQyYzg4
ZGE5MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJp
dmVycy91c2IvZHdjMy9jb3JlLmgNCj4gQEAgLTExODAsNiArMTE4MCw4IEBAIHN0cnVjdCBkd2Mz
X2dsdWVfb3BzIHsNCj4gICAqIEB3YWtldXBfcGVuZGluZ19mdW5jczogSW5kaWNhdGVzIHdoZXRo
ZXIgYW55IGludGVyZmFjZSBoYXMgcmVxdWVzdGVkIGZvcg0KPiAgICoJCQkgZnVuY3Rpb24gd2Fr
ZXVwIGluIGJpdG1hcCBmb3JtYXQgd2hlcmUgYml0IHBvc2l0aW9uDQo+ICAgKgkJCSByZXByZXNl
bnRzIGludGVyZmFjZV9pZC4NCj4gKyAqIEBkbWFfYWRkcmVzc2FibGVfYml0czogc2V0IGlmIHdl
IG5lZWQgdG8gY29uZmlndXJlIGEgZGlmZmVyZW50DQo+ICsgKgkJCWRtYS1iaXQtbWFzayBvdGhl
ciB0aGFuIDY0IGJpdHMuDQo+ICAgKi8NCj4gIHN0cnVjdCBkd2MzIHsNCj4gIAlzdHJ1Y3Qgd29y
a19zdHJ1Y3QJZHJkX3dvcms7DQo+IEBAIC0xNDE0LDYgKzE0MTYsNyBAQCBzdHJ1Y3QgZHdjMyB7
DQo+ICAJc3RydWN0IGRlbnRyeQkJKmRlYnVnX3Jvb3Q7DQo+ICAJdTMyCQkJZ3NidXNjZmcwX3Jl
cWluZm87DQo+ICAJdTMyCQkJd2FrZXVwX3BlbmRpbmdfZnVuY3M7DQo+ICsJdTMyCQkJZG1hX2Fk
ZHJlc3NhYmxlX2JpdHM7DQo+ICB9Ow0KPiAgDQo+ICAjZGVmaW5lIElOQ1JYX0JVUlNUX01PREUg
MA0KPiAtLSANCj4gMi40OS5HSVQNCj4gDQoNCkJSLA0KVGhpbmg=

