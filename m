Return-Path: <linux-usb+bounces-17846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125C59D8DB6
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 22:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C676F285886
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2024 21:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B841BD51B;
	Mon, 25 Nov 2024 21:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XvF0Upxp";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ohae/KYy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gHwxlx2Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9FC1BBBE0
	for <linux-usb@vger.kernel.org>; Mon, 25 Nov 2024 21:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732569248; cv=fail; b=rFj7sS/alLdve2KF7lcKTiX3v8dGrIMycjoJhI+A3YNyjMcAY8YmkzmaG2LWPBOPq/wL/IqnY8Xqm1VIjHeMkw6UbJXC3/Wm+FBD6lUsPcVj5/wkxdZWGf5fXrx7F8NjHn1yBMrDdyKFkmuNc13SpIGQDmBbQVBG63XWK+YEyqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732569248; c=relaxed/simple;
	bh=uEwFAlVQ4wHXSaL4T9DaOmDZeZHOZDIylkuEqofqqlM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gR+rjNMgVc8CWKBSTEeMZFNaowfGWVh1A3hReet4X5PM6WnFKUfSZa6KLRgUcPXIlKw5M50nSISTOxKn7+FRHaGYK6D7obYpnqDq6RUewxgYrQwjjCVEKKwg8EPIynaBGoD7pMW6n4XIGvvsjrHb9uer7WkKA3/5pVVtgiiPkzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=XvF0Upxp; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Ohae/KYy; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gHwxlx2Z reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APGteos004931;
	Mon, 25 Nov 2024 13:14:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=uEwFAlVQ4wHXSaL4T9DaOmDZeZHOZDIylkuEqofqqlM=; b=
	XvF0UpxpNKNprmUbYu1i01ELb6RjJsyfR6OLv3BmAMshdaQduVWTkLXOx2t+mjGN
	GVldBysjXh8CIzhath7wSaP4P2m/miAn06yfAv+dWghtDy2tzdRz4GHmDLKweTrB
	0cswq3SbFaU5Z2lTHt/KqcPOt4P8NRqj3HZT6K7WkRHbKuK8+gY7PD7L0uDH9Gg5
	FHQo98pvUHvkM4LHnjxoUE1bGX5ZyDQWbTbicvA9JJPltRFL3R65Rzxl3+0H4V03
	PwhzUzLeUa4k+x0KOWUjlugZ/BRhO1CENSI5xguDhTdg1XZ5Hwr5cBe89RBYeSmn
	+BhcQReGfDgKHzfnA9RaXg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 433exta2yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 13:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1732569244; bh=uEwFAlVQ4wHXSaL4T9DaOmDZeZHOZDIylkuEqofqqlM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Ohae/KYy1ojkpIUSVARZ1ut8my3eN9yml256KvDsHArejn+6q1pBGwId+Z/fYf1Mo
	 fRsUM0fVFCc6l0aWQdWn/7E9CAlV/PudxSAl5oj913uFueNj0viJ9Nnc6LttH7pCUw
	 MqaJ5VbMBofy+lfAATAekayfrVfxVwwf1BMmr0X4NzZd1T9U9OdOWaYU195NNKxn26
	 NaqK7ZzqiOz0lh06dGMv7GLGNqiNho72YbOpZP6hbzsV88jZu+LIgg4aBfJtMke7P4
	 HxtHIsEkUMbTc3IpP3HbvfCHvil+34froWo2m1uyC+Xm2W3tI6n8FhaWDVk8gZlriH
	 YfUT/hPtP8RoQ==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0FA5E40114;
	Mon, 25 Nov 2024 21:14:04 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id C0E61A0077;
	Mon, 25 Nov 2024 21:14:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=gHwxlx2Z;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 2B95D40356;
	Mon, 25 Nov 2024 21:14:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXbVZf2XqjctvmaCZCB3iFigJU5j7jIoh+zoH48VwEDgEWu63SyM9xllBtPu437TT0NOMW0OMsSGo/zRNyzx0pxoXjxJFl2Dwek+HrWizGpLPIutThf2xqQzpT4wG0eeiiMP/gcBjFhmf9vVIgocNCDebiOSacnZUNrFz76My4PxRJ1RL6JyQj/v8e1+UYoehgsQDcM6YleWtpPAiUXr33WnuIu8I6qdq+AIKznQsZVuovYo47GFVwV5DsPAybdjandQWsEcll0C5P2SuUYkqjPRuLEVuSwqL2+LXXBSrtpOlb5IqGODZu8tMvwuJvJCp84/tlhTd/jNaNengDnp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEwFAlVQ4wHXSaL4T9DaOmDZeZHOZDIylkuEqofqqlM=;
 b=Ifvb+YqSq6NYW5OHQvL2xsrNl2U3+uxUJ3dB9BHk2cVyYzh7JEgAAKGQuM64YBNQYjEMu1dXWI0wsoKS9UkM+/2qlS9TYa8wLL0X6ZSVJgKSmVOFWynhCtH2KfFCiQWRh/XXyN8sDy/i7KSXlROeXU0wAUgsDj99XmyiDm5iNA0RWIraaITnWxa5imJJHlL3TVCQea45GcEI7m4PGNVtZ5u5adHPwY+KsT6+SNGiI26oqDXYCWDG4ldxld13nslKX1cOl5ZOv/c47u2MRxj4FZ+7eTd3YWqp+/OJ5LK/uxQLm3P7sLI15kVFa5SjZL3pbaMCSfaV94L89WuqhvbrUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEwFAlVQ4wHXSaL4T9DaOmDZeZHOZDIylkuEqofqqlM=;
 b=gHwxlx2ZrYMWJGpNCFx+kt4N8YEItpZHN8BNFjYQ2ChsAK/1O0yvxEC8gidqUF+bDl+cmwCiyHFCunJQD2yOxvTnK+1NocjaasRBgT28hYmCTCMeFdvjYZh5XOelpo1Nb5zYWu8spvp8MN6yscL+iOJzpo8XEfMV2cry9Cu474c=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SA1PR12MB7247.namprd12.prod.outlook.com (2603:10b6:806:2bb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 21:13:59 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::3d09:f15f:d888:33a8%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 21:13:58 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: =?utf-8?B?TWljaGHFgiBQZWNpbw==?= <michal.pecio@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "a1134123566@gmail.com" <a1134123566@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Inquiry about the f_tcm: Enhance UASP driver work
Thread-Topic: Inquiry about the f_tcm: Enhance UASP driver work
Thread-Index: AQHbO7xmD/jJAOa+EECV26D4vP1gsLLCkxUAgABd64CAAQ1ogIAA8SIAgAOW3AA=
Date: Mon, 25 Nov 2024 21:13:58 +0000
Message-ID: <20241125211356.vh2vso67obqf2hdj@synopsys.com>
References: <20241122022146.ykwhz4byhy645njg@synopsys.com>
 <20241122085755.29cebea1@foxbook>
 <20241123000209.5qowmsx3dxianl64@synopsys.com>
 <20241123152512.68853a5a@foxbook>
In-Reply-To: <20241123152512.68853a5a@foxbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SA1PR12MB7247:EE_
x-ms-office365-filtering-correlation-id: 4d7c839a-dff9-4411-e6b0-08dd0d961412
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|3613699012|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TTlJSW4rTEw3U2JEL2gzcE10eGcrT0ZxUXY2NlhJSnNHU0ErMGVtbWMvRlQ4?=
 =?utf-8?B?OVFva2RzZVdXWThQUTM4ZDlHRGFhS3VzeXVoV2hvZ21UWURYMmFIUHc3SGdT?=
 =?utf-8?B?bjFYS2FqTFlHeE9CblhZL1FYMklnNG9IZ21Xazdya3RKZ0t5ZnFrNzZmaFZt?=
 =?utf-8?B?OXJYSGJVT292RHRQMnFlMkRYOFNJcXdlTER6YlRVTndyRkJuc3NjTWo1azM5?=
 =?utf-8?B?U3N0cDBuSTVGQm9NYVF1Mjd6dlM0Q2FKRThCc2VDL3hiZ0lTcFJkK0dtSjNk?=
 =?utf-8?B?YlI3azFha2dUb2hOcWpKSlgzM3c1Ulh0M1Y3QnNzcS9wZ3NTRjVsU0E3bzlq?=
 =?utf-8?B?ZjZTc0xIS2I0TUhUOXlMZ2VMUXU1ZFY1MVl1TXFxdGFIZENlN0h0dmxHNE1p?=
 =?utf-8?B?MmwrOU9HZnErMFZ2Q1FIZGJFREI4eDZZTXlCUGlId1BGM0x6MEtiOVk0NWFB?=
 =?utf-8?B?dk56akRwcXRDY2tlOVZVVnBjdC9mMGJPZUtxRjYyeGYvY2FnMHFHQ2FNcTFD?=
 =?utf-8?B?eThNVWxzRnJvYlVSdklsd2JvNWxrcmtCYWozSC9CdGtqdTJwN0NRZHhnOTFv?=
 =?utf-8?B?eFdwaHo3N29zMEVHeldZSXVVdnZTZTQxSTBVdWc2S21EN3dldDFwcXBDeGZ6?=
 =?utf-8?B?V2FFMnp6ZkVJdHVXYUlHNWp0azkrekU4SFg3dm1pbk5XbmtZVWtkdktuWkRK?=
 =?utf-8?B?SmZHdGtBTElpSU03RE1lVlhDL1ltMzJlOUV5SE43SWdlSU5leVNHQXlzcnZR?=
 =?utf-8?B?QXdCRkdFejZyTFNxMFUzU2lJaVA5Z1RPazhKODVMNER5S21HUGlzb0RCRDhw?=
 =?utf-8?B?UVlwS1k1ZG1xcjNqclhRQ0FWRUJyTE8zdU9JMzVvWnFqbEhPWEJiM216b2U2?=
 =?utf-8?B?ZFRwbGR0R3Jzck5lTTNVYnYzeFpicFNhMWVidUJDRlNCRzN1WkQxYWNHWUQy?=
 =?utf-8?B?WkY0cVJ5NEJxcGt6UzEydUxOWjJyUkJWam9QVGVLcFkxUkdDZXZYbW1kQWRL?=
 =?utf-8?B?VTRzZkZ5bXNya285QWJCa1ByOGNPUUtuS0h5L1BYaVFuTUtaWU5LaHFiOEN6?=
 =?utf-8?B?SExIZ3ZhMXNHdUNCdDNRYVVBYnBCa0FRK05LbWlPK3RSckpmMlNBaTUwQ3RL?=
 =?utf-8?B?QlgzMTF1eWw3RklrVnp3Y1o5RXBxYXV5N2w3bkU3bHUzOHhtQjJIS2Z4c1Vk?=
 =?utf-8?B?UmZCaE81TXNIUnRpS1ZrRUpwTkwwbnorVVhaek9PTTFrcC9mNlpsK3htOXcy?=
 =?utf-8?B?aDlRekFFWkxvemJWM0t1MUtCb2VGYTE2S1BnZTB5bXFZUlIrMzg1UU90TVRX?=
 =?utf-8?B?b0xuSlUwbUtxSG5OUDdoR0dEa3VUNjNRZ05kOEFyRUVySy9mSE8yVHV5OGZv?=
 =?utf-8?B?MStScFl4YmU5Nzl6bWpjMjBuNy9yUkc3MktIZlFSRHJFU0xNcjBNa25CbVhK?=
 =?utf-8?B?RXZNbDNkSFNSSktaTVNad0dMTWdKTTdjYnNXODdnZGlsL2trUTdVR3UwNFRt?=
 =?utf-8?B?azQ4WWFYUnFGSmZYdi9WRDFhdUN2VUt3ZnhBa3lIdkNmSGdsYnJvalVJajRh?=
 =?utf-8?B?YXZSL0E5QlNETTBEZFZ4eVlsU3djZlU4MUJBay9LYVg5Rk8xZ0lsTDdscThF?=
 =?utf-8?B?T2h3YU14RjNqeXJoTkpENVJ2dlBJTkxRRnUrZlJMblFyNWpQSVBzQ3llaDJU?=
 =?utf-8?B?a0NBSnFHK1VGRThJWjZaSTVxaE5YWVRUTzRxUDRoOCtIZC9kSHkweE1ZOEl6?=
 =?utf-8?B?UUpwbWhTZk5jTytxYVlwU1NFSXVRQWxJS1I5aWJScVp3Tk1RSGdwZTJRVWsv?=
 =?utf-8?B?OGNNS2pRVjRhOWYzMGZ1R0YvOHN5dU5pd1JHVmQrWm1UUVZudXZybTFLVnZF?=
 =?utf-8?B?MFFzZUlsazRvYk0xQW9kSjU4K21oUFBFR0FxZjg4R3dDVmE1UzZjOW9KY0gy?=
 =?utf-8?Q?oOwQXp2kErh2T6X6hcOjN3VvfCV1N2MP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(3613699012)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UTFHOHlLQXpIU1dNSDc5cUozRWZPUmZ4YXNzdmp0S3VqUVdqY2lOU2diWG1q?=
 =?utf-8?B?aGptditOMlpXMDY5Q1NEOUJ2dkJKbEJIVlRTNEZGemJLUmhuejZZQmcrSjIw?=
 =?utf-8?B?YXMxQUVnVk1sRWpmdVFsWmhINXB0RnJjREZLZmhIQmtta2JuNGtzdmdSSEFw?=
 =?utf-8?B?MmhrZ3dEYnR5MU90elpDdDBNUE9IRTFUV0tPRGtRTkg0WHAyZm9ocUk5VEhR?=
 =?utf-8?B?OVltdjhHb3BEbld6Umt0dHBYUU1LT3J5V0tMRHBJVU85RkcrMXVub3Q2Y3hr?=
 =?utf-8?B?MHlUT2JMU3pxT3hyaWRYVEVxNnRIU05LSVNoTmhEVEdUL0tRTTBxTTJrYWNl?=
 =?utf-8?B?cXpPcm41QnFvMm1RSGZJVDRqMEZBUmMxKzFEYTJpS3NXanp4M2QyTzN0V2hz?=
 =?utf-8?B?MHlBNjhvOENXN0RmK2hldU9PaXN4WjJvTGtWdmxYbFlsWmJxMDArR282NkF2?=
 =?utf-8?B?MEwwSUNkQlZTdUt0bUFCblJFRnFmek1aQ0YyZDJNTjRiWHBKbDhCMWlLakwx?=
 =?utf-8?B?OWdZOWZGUE01eGRMbUlQVlgvVlB0NlFUOE01UUFvM0EvTEZtMkF4Zy9EN08w?=
 =?utf-8?B?ak9tYVBRdVBXZGtwdGZwTWRUeGd1ZGRzdlVpSzlNS0g2SXZubmlPMWpQeUla?=
 =?utf-8?B?YlNBN2JOSkRPOGZKTVl6emZhZ2hDYTgwLzdpK29IUlhNVjdDM1pZdXI0M3lX?=
 =?utf-8?B?M1pOWk91QlIxSXdJanoxeUwwcHVLTTQzOG5lNzVzYnhaMHcxQjVTQXgwbGE4?=
 =?utf-8?B?eTVURGQrTzFxaW9WNEpoYXE4S1JYUkNxYVZacW90SnF5UkxLYlRabWF5OTRp?=
 =?utf-8?B?UHhaMkJaM1p2bjcrekJtQjlZVnZ3WDdvZ2pZUjNGVU1PcktqRXFEdmFzbnlU?=
 =?utf-8?B?RGpjZi9hOXdmT1BvVUkweHEyMVVydEtyakprbG5IUDQ5U3R0Z2lMUWZQVXhY?=
 =?utf-8?B?MmdEUnMvS1ArVEpmODNtWmVFZHlpRFVNaDcvS056V0pTVW5hZFBLdngrSjI2?=
 =?utf-8?B?QmJsYzNVWDhzYkFTTlV0K3hUV05iQkgrVzl6eCt0TFRmdUpvcHl2OWh6Ni9V?=
 =?utf-8?B?Zno4WmFEcUp0eVMzazV4eGp1TEVGTktYRHBhZUpIZ1A1bmJKYmova0I0VnQx?=
 =?utf-8?B?UXVTeHlpMnk3RExBZWVmcWlxUWkxZk01TWpDZk1OWHNxY0JBY1pOYTZybytB?=
 =?utf-8?B?SUh2VSs5VWUybDVGUjhSU3dhTHcyNUIxSExncW15emxKV1RDcHZhdXNOcFdt?=
 =?utf-8?B?dVpOK09SMGFDUXhQeG1YTFNxOXppbTAwNVovbXNwVE9kcXp4WnBIa3I5Nk1D?=
 =?utf-8?B?aWNRVTM4V0ptdTlUcWpIVzF2eXNKZkNhdUZpTkV1L2ErSTJZT2hoNit6bUhp?=
 =?utf-8?B?TGFuaHVjbTYxOFN4Q1RuUjV0Z1c4Mm1YYnI1aFpOc0FYY3lPdjlBRzg0OUlk?=
 =?utf-8?B?cGdkMUVtMUx4OW1QRjh3K1ZjRUU5SDB6ZEpQRlZWWkU4ZGhtRWl0TDdpTkV5?=
 =?utf-8?B?VVN2ZlhOd1VBSWJCbHprbTBnZnp3N1ZCNnkyRHBtN3JRTGpJSk9UdElIbC8v?=
 =?utf-8?B?eDJJYmVCUGl4SitUWGpsTktJWDRKck9WY0JqLzBjV1pBeDcxS1FLdE40dTlO?=
 =?utf-8?B?NUs0UXVISWQwMkZiZVJwaWZ6N0FvRFE2SUFpd3BLSWt4bGJJNmJFVWNmQmpB?=
 =?utf-8?B?VnI4Mlo3L1pxVFc4ZHZyeUpzeWpFQWVFcWdGMWhUakdEOG5VVUw5Uk9qWVBL?=
 =?utf-8?B?YTNMRjF6bFhGc1hFVkdMUStVU0dLQS9EbUN6dWs5dDBSdktqWXZoZ1BKRSto?=
 =?utf-8?B?R045ejMrOTBDdUFSS21xK3RydWl0YkxGOXFQWXVVNGVTQVZPRnlaNExCRjdt?=
 =?utf-8?B?enp2QzF0dEtZcHRvVkxjVFRqLzhrL0tjTjdTTnVvQVo4ZHd0UWV0ZVBHT3dC?=
 =?utf-8?B?Y0ZZWmxpMGxlblpBOUIwbDVvUXRmTVg2VmpvTmZjeFcvMEZPZlJqZEhDUkJr?=
 =?utf-8?B?NU9yeHFoeldhcGgzdXZHSmhyUGxSeVkveHdBL0hhSnFVaS9pdzgxQjhralRH?=
 =?utf-8?B?a1hYS1VNemp0VWI2NmpSZC93N1FoOVBKVXhzeis4TGU1WkRRL2VvRUJzd0Qz?=
 =?utf-8?B?SE11azdYSXUxNGtqU1NQNXc5VUdCdk1DcnJGMjFVeHYyVTMwMHJJNFNEL1hu?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E128DE8F3F218E42ACC7EDC67932DEBF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CfJ3ji5xv2ZJTejWwW98oYmw/f4MFCWy20Bt6B2i5lHVhi/bJlX+fl8JVodsGZfyofCYpH2dY2f08g0ZE0VVJLB2aPSuBpJtSKqGrbtOk00J9JIlfuzbfNan1Gx3D7lEnABciXj3vXnONl7hOOvOhTJTMWrfKnT9WdEBfLiDLA4BfbkamWXqcOc2W0vqSyO6Lcg/jrbfEQOp9MFwaJqUzUwBAwj1zlwHF9r/bAqIiw4ESpeCQEyQJ53REdXUPbGFiamET84pJXIGACd2osTMXAms6pLvEQ8bjzzeAsRZLZlGuhWSjbJILr8+6GK4v3uK27cqYgsGThxU+mH5SvfojP6WM2htyaGFx6yfKYSFUo7TKg5nMvCBcPgr5cvbeAcCxNCX+MfAYM0aZf2EhZBnwcDc57jXgFVFmObVKqBOIiyfwAvVyZo54ON7puvUyRSzSTF6dfGr2GJV6gHoPtGEIreG3l0LMcoTEpyJ1TnLAesHX4gm/vX2e6r8qJcKEKfXyCNHKun7+Lx5JXuhec5Jxo9SgQcA4QESpjwKQ16B4eVO2AMjaorKf74armNvDlsPLkJjIns34rSYGyE+UK27YfG/JNyEfqUNdFS3enoFppK+NwXKMPkBw0QmDJESThfJAkzO8a+if/KSPHgmlOQAKQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7c839a-dff9-4411-e6b0-08dd0d961412
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 21:13:58.9241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ASrhkk/OeYAy0sGzu96qCNmV1x1++sd/GCfIAGV/Eu42UpX4cJSBfIiug4b5DR52V0gCVLbVU0FT+EsNftPdCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7247
X-Proofpoint-ORIG-GUID: 7AeJ7U3umROKOOiflRYiOvyYzvLHPJH0
X-Authority-Analysis: v=2.4 cv=Xcrbz555 c=1 sm=1 tr=0 ts=6744e89c cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VlfZXiiP6vEA:10 a=nEwiWwFL_bsA:10 a=qPHU084jO2kA:10 a=mCO9Vu09f6dvv_T3Mo8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 7AeJ7U3umROKOOiflRYiOvyYzvLHPJH0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 mlxscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=779 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 spamscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250176

T24gU2F0LCBOb3YgMjMsIDIwMjQsIE1pY2hhxYIgUGVjaW8gd3JvdGU6DQo+IE9uIFNhdCwgMjMg
Tm92IDIwMjQgMDA6MDI6MTAgKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiA+IExvbmcg
ZGVsYXlzIEkgaGF2ZSBzZWVuIG1haW5seSBvbiBzb21lIHVuZm9ydHVuYXRlIHBhaXJpbmdzIG9m
IEhDDQo+ID4gPiBhbmQgZGV2aWNlIChIVyBidWdzPykgd2hpY2ggdHJpZ2dlciB1bnVzdWFsIGVy
cm9yIGNvbmRpdGlvbnMgcG9vcmx5DQo+ID4gPiBoYW5kbGVkIGJ5IHhoY2lfaGNkLiBUcnkgd2l0
aCBkeW5hbWljIGRlYnVnIG9uDQo+ID4gPiBoYW5kbGVfdHJhbnNmZXJsZXNzX3R4X2V2ZW50KCks
IGlmIHlvdXIga2VybmVsIGlzIHJlY2VudCBlbm91Z2ggZm9yDQo+ID4gPiB0aGF0IHRvIGJlIGEg
c2VwYXJhdGUgZnVuY3Rpb24uICANCj4gPiANCj4gPiBObywgdGhpcyBkZWxheSBpcyBub3QgYSBI
VyBidWcuIFdoZW4gdGhlcmUncyB0cmFuc2FjdGlvbiBlcnJvciwgdGhlDQo+ID4geEhDSSBkcml2
ZXIgd2lsbCByZXNldCB0aGUgZW5kcG9pbnQuIFRoZSBwYWNrZXQgc2VxdWVuY2UgbnVtYmVyIGlz
DQo+ID4gcmVzZXQgYW5kIG91dCBvZiBzeW5jIHdpdGggdGhlIGRldmljZS4gVGhlIG5leHQgcGFj
a2V0IGNhbm5vdCBwcm9jZWVkDQo+ID4gdW50aWwgdGhlcmUncyBzb21lIHNvcnQgb2YgcmVjb3Zl
cnkuIFRoZXJlJ3Mgbm8gdXNiX2NsZWFyX2hhbHQoKSBvcg0KPiA+IHBvcnQgcmVzZXQgaW1tZWRp
YXRlbHkgYWZ0ZXIgYSAtRVBST1RPLiBUaGUgb25seSByZWNvdmVyeSAocG9ydA0KPiA+IHJlc2V0
KSB3aWxsIGhhcHBlbiBpcyBhZnRlciBhIHRpbWVvdXQuDQo+IA0KPiBJIHRoaW5rIHlvdSBhcmUg
cmlnaHQuIEkgdHJpZWQgdG8gcmVwcm8gYW5kIEkgZ290IHRoaXM6DQo+IA0KPiBbTm92MjMgMTQ6
MDFdIHhoY2ktcGNpLXJlbmVzYXMgMDAwMDowMzowMC4wOiBUcmFuc2ZlciBlcnJvciBmb3Igc2xv
dCAxIGVwIDYgb24gZW5kcG9pbnQNCj4gWyAgKzAuMDAwMzgwXSB4aGNpLXBjaS1yZW5lc2FzIDAw
MDA6MDM6MDAuMDogVHJhbnNmZXIgZXJyb3IgZm9yIHNsb3QgMSBlcCA2IG9uIGVuZHBvaW50DQo+
IFsgKzMwLjA5NjgyMF0gc2QgNjowOjA6MDogW3NkYl0gdGFnIzEgdWFzX2VoX2Fib3J0X2hhbmRs
ZXIgMCB1YXMtdGFnIDIgaW5mbGlnaHQ6IElOIA0KPiBbICArMC4wMDAwMDZdIHNkIDY6MDowOjA6
IFtzZGJdIHRhZyMxIENEQjogb3Bjb2RlPTB4MjggMjggMDAgMDIgZDAgMzAgMDggMDAgMDIgMDAg
MDANCj4gWyAgKzAuMDEyMDA5XSBzY3NpIGhvc3Q2OiB1YXNfZWhfZGV2aWNlX3Jlc2V0X2hhbmRs
ZXIgc3RhcnQNCj4gWyAgKzAuMTE0NjM0XSB1c2IgMTMtMjogcmVzZXQgU3VwZXJTcGVlZCBVU0Ig
ZGV2aWNlIG51bWJlciA2IHVzaW5nIHhoY2ktcGNpLXJlbmVzYXMNCj4gWyAgKzAuMDE3NjAzXSBz
Y3NpIGhvc3Q2OiB1YXNfZWhfZGV2aWNlX3Jlc2V0X2hhbmRsZXIgc3VjY2Vzcw0KPiBbICArMC4w
MDAwNzJdIHNkIDY6MDowOjA6IFtzZGJdIHRhZyMxIFVOS05PV04oMHgyMDAzKSBSZXN1bHQ6IGhv
c3RieXRlPTB4MDcgZHJpdmVyYnl0ZT1EUklWRVJfT0sgY21kX2FnZT0zMHMNCj4gWyAgKzAuMDAw
MDAzXSBzZCA2OjA6MDowOiBbc2RiXSB0YWcjMSBDREI6IG9wY29kZT0weDI4IDI4IDAwIDAyIGQw
IDMwIDA4IDAwIDAyIDAwIDAwDQo+IFsgICswLjAwMDAwMV0gSS9PIGVycm9yLCBkZXYgc2RiLCBz
ZWN0b3IgNDcxOTgyMTYgb3AgMHgwOihSRUFEKSBmbGFncyAweDgwNzAwIHBoeXNfc2VnIDY0IHBy
aW8gY2xhc3MgMA0KPiANCj4gSSB3aWxsIGtlZXAgaXQgcnVubmluZyBmb3IgYSBmZXcgbW9yZSBo
b3VycyBhbmQgaWYgdGhvc2UgdGltZW91dHMNCj4ga2VlcCBoYXBwZW5pbmcgSSB3aWxsIGhhdmUg
dG8gY29uY2x1ZGUgdGhhdCBJIHJlbWVtYmVyZWQgd3JvbmcuDQo+IA0KPiA+ID4gYmVmb3JlIHJl
c2V0dGluZywgYnV0IHRoZSB3aG9sZSBlbmRwb2ludCBpcyBzdG9wcGVkIGFuZCBub3RoaW5nDQo+
ID4gPiBtb3ZlcyBmb3J3YXJkLiBBdCBsZWFzdCB0aGF0J3MgdGhlIGltcHJlc3Npb24gSSBnb3Qs
IEkgd2FzIGxvb2tpbmcNCj4gPiA+IGF0IG90aGVyIHRoaW5ncy4NCj4gDQo+IEJ1dCBhIGNvbXBs
ZXRlbHkgc3RvcHBlZCBlbmRwb2ludCBpcyAqYWxzbyogcG9zc2libGUgaWYgeW91IGVuY291bnRl
cg0KPiBDT01QX0lOVkFMSURfU1RSRUFNX0lELiBJIHNlZSBpdCBhZnRlciBzb21lIGNvbW1hbmQg
ZXJyb3JzIG9uIHRoaXMgY2hpcDoNCj4gDQo+IDEzZmQ6NTkxMCBJbml0aW8gQ29ycG9yYXRpb24N
Cg0KU3VyZS4gSSBndWVzcyBJIGFsd2F5cyBhc3NvY2lhdGUgdGhlIC1FUFJPVE8gZXJyb3Igd2l0
aCB0cmFuc2FjdGlvbg0KZXJyb3IgdGhhdCBJIGZvcmdldCB0aGVyZSBhcmUgc29tZSBvdGhlciBl
cnJvciBjb25kaXRpb25zIHdpdGggdGhhdA0KZXJyb3IgY29kZSBhbHNvLg0KDQo+IA0KPiA+IFBl
cmhhcHMgdGhpcyBjYW4gYmUgZW5oYW5jZWQgaW4gdGhlIGZ1dHVyZSBpbiB0aGUgc3RvcmFnZSBj
bGFzcw0KPiA+IGRyaXZlciByZWdhcmRpbmcgLUVQUk9UTyByZWNvdmVyeS4NCj4gDQo+IEl0J3Mg
YSB1bml2ZXJzYWwgcHJvYmxlbSB3aXRoIHhoY2lfaGNkLCBpdCBhbHdheXMgcmVzZXRzIHRoZSBo
b3N0DQo+IHNlcXVlbmNlIHN0YXRlIG9uIGV2ZXJ5IGVycm9yLCB3aGljaCBpcyBhZ2FpbnN0IExp
bnV4IGNvbnZlbnRpb24sDQo+IHNvIG5vYm9keSBleHBlY3RzIGl0IGFuZCBub2JvZHkgaGFuZGxl
cyBpdC4gSXQncyBudXRzLg0KPiANCj4gT25lIHRoaW5nIEknbSBnb2luZyB0byB0cnkgaXMgcGF0
Y2ggaXQgdG8gc3RvcCBkb2luZyB0aGlzIGFuZCBzZWUNCj4gd2hhdCBoYXBwZW5zLg0KPiANCg0K
VGhlIHhIQyBjYW4gaGFsdCB0aGUgZW5kcG9pbnQgd2hlbiBpdCBzZWVzIGNlcnRhaW4gZXJyb3Iu
IFRoYXQncyB3aGF0DQpoYXBwZW5zIGhlcmUuIFRvIHJlY292ZXIgZnJvbSB0aGlzIGhhbHRlZCBz
dGF0ZSwgdGhlIGRyaXZlciBjYW4gZWl0aGVyDQp0cnkgdG8gc29mdCByZXNldCB0byByZXN1bWUg
b3IgZ2l2ZSB1cCBhbmQgcmVzZXQgdGhlIGVuZHBvaW50IGFuZCByZXR1cm4NCi1FUFJPVE8uIFdl
IGNhbid0IGF2b2lkIHRoZSByZXNldCBoZXJlLiBQZXJoYXBzIHdlIGNhbiBhc3NvY2lhdGUgdGhp
cw0KdHlwZSBvZiBlcnJvciBhcyAtRVBJUEUgaW5zdGVhZC4gSWYgbm90LCB3ZSBzaG91bGQgdXBk
YXRlIHRoZSBlcnJvciBjb2RlDQpkb2N1bWVudGF0aW9uIHVuZGVyIERvY3VtZW50YXRpb24vZHJp
dmVyLWFwaS91c2IvZXJyb3ItY29kZXMucnN0DQoNCkJSLA0KVGhpbmg=

