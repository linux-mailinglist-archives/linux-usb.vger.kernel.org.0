Return-Path: <linux-usb+bounces-15257-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF497CFE2
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 04:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 489FCB214BC
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 02:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3DEAB663;
	Fri, 20 Sep 2024 02:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hidglobal.com header.i=@hidglobal.com header.b="W6AOEjzL"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAAF8F6C
	for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2024 02:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726799201; cv=fail; b=Q9GN4USruYfdMmlQKVBn5gFo0a2tDpa3t/4ZDX0yvaV2woHXKRBD21N7gFMaSSMpCAzqq7RE/YdgbvC7+UkGPv9AfRa5YNPCytkearnSeX7PxDtG90elbMfPGXbZS/PO+isoPYpjmUMFYanmJPkI58NJNV2usALKls26I71zVd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726799201; c=relaxed/simple;
	bh=LuwKLJB2yu3C8VITAbo424dh9AdEuTvhR1r+eObBDgk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RbrnS6OoeNBbZfzYeHjeEvu9eWsYZaVkoEtEmI4nTdD8zpQOrGpYgsqbOTCKjlOuyz7DQB/cLw/2DpwnMRcdLiWiea8W1l60GPtUcoq7e23fOyr4PWintpu159T1LnYO2/Tvrar/OEsV8vHSTODrZxIyx9GCAlYSZLALtLWUovo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hidglobal.com; spf=pass smtp.mailfrom=hidglobal.com; dkim=pass (2048-bit key) header.d=hidglobal.com header.i=@hidglobal.com header.b=W6AOEjzL; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hidglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hidglobal.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToZJtTJdjD6ZWL6mRzHBoYehaMXxvi1aQYHTmTsojQ9lMIbruIsIGahzqzmviyhnvdgauhJvaULBUYVBwsO2J9Ygicq92kesTCRxsQPy/BE0ixSCoezYWSnDttkMa8bfmx97mxvp2HcC0rrzCtIXIqDgGT0ALHeL2Hq85vmK1cp+orV8YtDAFIESBSB2ImK8l+oT36Wysaj+oZ6chQTECtrBIhegHWDKp9tl7VRnjKtEQ9T7WcIIzz8LcJP8kcppGI62XPEqvVai7ljzytkt3XUx/w70H83M4Cx7OJ2CDSwKXZVkerwAZPTvDTySs4yOhefForR5WbJ+52OotHCSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuwKLJB2yu3C8VITAbo424dh9AdEuTvhR1r+eObBDgk=;
 b=OmsXksXHklnUXNmszyUxgmTQee99pA++2k+Y1S3Ht4O3XtPuLa9a6NgfBPyh2op5D9X3Zo/dEAN6nHjJ903vazGnILC6KWKATKVEqz6lhCVzcoZqFBV3VvfpxtMrvIqmU8m2Qglo+UOCaf0BN83i2n2Fi0sLOorXS9q/gUOgZo+Ho03D2yfDesnm6ck9B0LIaoBFS5Mnf5VJE72OFwuZET4MnYLUTBQvTtvU9b0lGHtDVsRI6kGzv/8TVG/fegtV7BhzXQiRwcbSt3oS5hiM/Dg/wIHgeKlL75vxOsM+ndTdW/C5ipHbvt3XJwULZ4BHsu6EIxOfPUDVzr6W320h9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hidglobal.com; dmarc=pass action=none
 header.from=hidglobal.com; dkim=pass header.d=hidglobal.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hidglobal.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuwKLJB2yu3C8VITAbo424dh9AdEuTvhR1r+eObBDgk=;
 b=W6AOEjzLZKJwtY1+E4hR9FsxnKxGzQJpWDLUA1rcFX29xS4t8Vpyq199VnaO6JGUS0Hayz9VCB0An/dcpaobKZHL+r3FTOU/j09bLIWwX70FGP94p8WIzjpak1UtlUdwcq0WHOKduMUifBYicWQJiHg2NT2HKWVMkrf7RMN4V+LO9Bkqpa/mkY+QDKiGiQWBLp2+2wZAhmK+dJUw2ICtmyd4DsJH93Ixc0cQiu6YhGo9GfZiTx17ZI+OjkzYouSPYUhKXlY/S+xAd797KmgKFSvZBVocFySf3P3Tjc+LjL2ZKf2NFzlFRjfDgrScZLSfLluZsfO4rugIUowWUqF0YA==
Received: from AS8PR05MB10129.eurprd05.prod.outlook.com
 (2603:10a6:20b:613::16) by DU2PR05MB10688.eurprd05.prod.outlook.com
 (2603:10a6:10:49a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 02:26:33 +0000
Received: from AS8PR05MB10129.eurprd05.prod.outlook.com
 ([fe80::5e4b:699c:6250:8022]) by AS8PR05MB10129.eurprd05.prod.outlook.com
 ([fe80::5e4b:699c:6250:8022%6]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 02:26:33 +0000
From: "Vodicka, Michal" <michal.vodicka@hidglobal.com>
To: Peter Korsgaard <peter@korsgaard.com>
CC: "balbi@kernel.org" <balbi@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "Vrastil, Michal"
	<michal.vrastil@hidglobal.com>, "stable@kernel.org" <stable@kernel.org>
Subject: RE: [EXT] Re: [PATCH] Revert "usb: gadget: composite: fix OS
 descriptors w_value
Thread-Topic: [EXT] Re: [PATCH] Revert "usb: gadget: composite: fix OS
 descriptors w_value
Thread-Index: AQHbA+aNCId6JjTJskmVJ1TZT1+WnrJV3meAgAoWnRA=
Date: Fri, 20 Sep 2024 02:26:33 +0000
Message-ID:
 <AS8PR05MB101290D2EDA43A47B9E52DCE68A6C2@AS8PR05MB10129.eurprd05.prod.outlook.com>
References:
 <AS8PR05MB10129E57ED13CF18746FC4BE18A9B2@AS8PR05MB10129.eurprd05.prod.outlook.com>
 <5f8cdcac-6927-429a-8ef5-0891c90e8efd@korsgaard.com>
In-Reply-To: <5f8cdcac-6927-429a-8ef5-0891c90e8efd@korsgaard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hidglobal.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR05MB10129:EE_|DU2PR05MB10688:EE_
x-ms-office365-filtering-correlation-id: e95bfb86-4542-4622-29fe-08dcd91ba4df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RWhrZzhIZ2lFVUxHcDZaZ3UrV1I2Sm1aaW5iZ2hzK1dkeFpwbTlGenlkclBL?=
 =?utf-8?B?NDZGT1MwS0ZpNHZ1WGUzb2ZpY2hzbitQbllpZWdtbE0rRG81Mm1iV2FUdm5R?=
 =?utf-8?B?NEZ5WmFjbGFvQlB1V0FjcCtxQXdHV0RiRXM4QW5QS2dKa0szOWFTMVJtaVJ4?=
 =?utf-8?B?dmtleUNhTWFhWUZTT3FVQmxiRnRpVFFDTks5NVIwc1J3ekQ3SHA1aDVvVkcv?=
 =?utf-8?B?cmJOMDVpeDN0ZC81UDFjQnREeG5jK2NtdXdIVmZLamFSUnhZaE1ueXJxUHhR?=
 =?utf-8?B?U3QxR1prMzZlVnFPZE5IeTgxMnNITHZIR0grZEdweER2NDNKWEZJOFRVeTRP?=
 =?utf-8?B?cm5YSW9vQTFzUkY1dVRXK3lhWFFBLzNyTWtMUzhKdWVLNy80UjR0VnRES2I4?=
 =?utf-8?B?ZWJnaU8rcTlGZkhia0x2RWpvQ1gxREpxb2VZbUVHaHhycncwRWZCb0xKN0JE?=
 =?utf-8?B?UGNlMDNGa2lUYlBaSnFRUERtdU4wT2t3ZUF1c0lDU2pTTko3UWRJMlNiakQ2?=
 =?utf-8?B?K09oWFBvWVVGK1g0dzdkMVcyTSsxaUc4WFFIRUhUOXdmSzM1U2NkbFo1ZXp5?=
 =?utf-8?B?RUlPcHhsbnVocmRDWEg4eFpPTmRqaDhEeTdJSWFPeENTaWhSaFFpSzZwOThT?=
 =?utf-8?B?ald0c1QrR1MrYWozZW81T2xDWStxSjFlNG1aZUFKK1pFSUo2QzJmRWlkTXIy?=
 =?utf-8?B?cWhGVFVFenJ2Z284MS8xM2VEVVVvZEpWRm1TdDZvVGE3bXRnNlp0SUt1cUNS?=
 =?utf-8?B?aFR1dHd0em96eUFHMTNsT2VOeUxtV0pvdm1tNjd2UVVhT2RsM1VNdnJocVJo?=
 =?utf-8?B?RXlSVWZLOHV0T3V5MUN5U2paR1BUUWQwUWdaUlJWdVp3Q1Y1ajJnWjRlOXRl?=
 =?utf-8?B?QjNDUnlCTm1VUk9QSjFoTWJ6Mk1rZ3dWdzZBeTRnY0F5dnpoVWgzeHh0OVJT?=
 =?utf-8?B?YXZKQ3VydkNJcE1yQTlQNy8rMUcvZTUwVi96cEpFZ2thOERXUkkrTlB6NmdD?=
 =?utf-8?B?Z1R4UGt4MTNUZmJSRTRwbWdnVnQvaHRERy83RWxaTC9vQmdrWW13aG10MUQr?=
 =?utf-8?B?NGpwdTQ5ZFBZMzhQeDRQR0dHRzdzSWVUWEpMbzViZjY1ZmJBWnZTNFltWjB4?=
 =?utf-8?B?U1gzU3B0czBDK3V6bXJ1RlZzbEdqNkVDY2dnRFVnNzBndjBYR0VmMXVpZVFE?=
 =?utf-8?B?VzJYRWQ4T2pHNWdCVE05d0NSTkVrVW5VblZDZktoaU1tZ1BMWGpVTGxSRlhS?=
 =?utf-8?B?MVBIMHZVRXFPTEpXSnVtbHNqZjRJQUpxclh2NStEMTYxcjNMcEJnVFFRNTZQ?=
 =?utf-8?B?RkM0Q0NMYXRYenBpZFlHN3kydXVqaGowQ0pDVUlqYjZSalJNYzYvSUpFUVVN?=
 =?utf-8?B?aWRlSVlGRnNydGlYa3oreTJWQTMvUFlvU2NQRXhtdHpud2Z3NnRmcWFUQXdo?=
 =?utf-8?B?ZWZSQnZGQXBpTXg3VWV3OWZkT3hPeDUwRyt4WkNFSFpiWUFMZkN6bk5qV2dG?=
 =?utf-8?B?a1ljOGNYNDhVYUhaT0xxcm1iUzUyVFRPTXJxc3ZmV3FkL0k0TEZVNEhJV0FQ?=
 =?utf-8?B?Y3RJak1sTzd1WFIyWXA3VVI0R2tWTTBzTHJLUlhZMVQxci8yODFrTTU1YWtR?=
 =?utf-8?B?VnBOck9Jd1RCZ1JCYUltVlJiNjFXMFRjdytwczZTQStzNTdwR2t1a3VOTmZU?=
 =?utf-8?B?UU5lbWtEVlRkaU1wOVJ6QXZ5VGdWMUozc0hBZk9xQk9iUzRWZERLZmRaanVh?=
 =?utf-8?B?cWdmTEcxMWpLSWtsMHNWcHk1WVN2M3gyRWZmR1VmR2IvVGFRRFg1Q0Zlc1JO?=
 =?utf-8?B?RXc1UkhOenhVUEFjeUVYMGlFZ2p2dmtJd3FRa09lclJnRE1FSmY1MGpLS0FN?=
 =?utf-8?B?UTM0QS9PTXYwRi9YMklndnNmMGZ0WjJGV2MvNzZROUowQVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR05MB10129.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWt6bEQ0Vm9TSDhxS3U4WG1ZbVdTYnNLcTBQN3FUeVIzSWJtWHVCcTZ6eHBQ?=
 =?utf-8?B?WGJKSkRqSURrRC90NW1zNFFoRWNEWEtrQlRxOWEvRjI1Rmg5UnFsRThBZGxr?=
 =?utf-8?B?eklpT3RPaUg2aW91UUtmMy8rdzZidk01dGpOV3plak1oNlV3bTF4NGNpcE9y?=
 =?utf-8?B?OU1Rd0NGQzhwZXU5NEd1UjJWZzB6TnRaU2lHdWV5ZVkzL0RwckJoYnlqbVlD?=
 =?utf-8?B?Mk8zU3R0U0paTUJxaUMwc2orYkVjMlU2d1NxOUdaWjNSaE1FU1V4Y1dqTE9X?=
 =?utf-8?B?WUZwTUlYWXNSWEpLWjRHMGlxK0lUaTRyTStNRzBFYm0vNU1hWWh1SlhzRm0w?=
 =?utf-8?B?SjJMRVhWSjdobnRKVzJQd2o2elkvL05FRHkwckhSVWpFNkJKSjFOVEZ3d3o1?=
 =?utf-8?B?ZTdOWDNMelJVeHdzcVVvZkNtcFpyeHhTS2NRVEVWNDg3anNZMXNQTWRiRzZ1?=
 =?utf-8?B?dXp4TEtNUmNXSjY5TXNadmNBSGJEYnZMR2tGdlNQWnVYOGVGQVQ4Q3U0NW1T?=
 =?utf-8?B?cTdFWUsxZVY0clkyUWE0S0hIWnZrMzR2YTJiUjJZanI0U0FTUnFWQXRoclgx?=
 =?utf-8?B?b0pzNk1pZDFVRlF1czFpWGxSTTVtbHEyQUNRMjUzbjhONTJDSndIbDVzcFFu?=
 =?utf-8?B?MlpPV0RVWGl6dUg0M0F2K21XZU5WVEgwNG1Bdm5RNTZNVlZoTEFBMk4zSkRx?=
 =?utf-8?B?K2QyczNIQ2VlbjJuNDl1UEpBUmsrRTlOa2kydkU4Ry83RHBCeWJTNVdrUU9y?=
 =?utf-8?B?UGxwbTV0cStxWnlrY3ZKWkNrRG1UVDhTVzdKanp6UjJta1EwandjRGZIRXI3?=
 =?utf-8?B?YTdWMGptSGpvaGQxV25SalRXcjdmNEdlQWgrN1Q1USswZVRLTUtoK0lsdFJP?=
 =?utf-8?B?aUJjTzRiVUEyeCtNZFRuSkF1UDZoakFqWVc2b0NKeWliSkNlVk5IMThzdnU5?=
 =?utf-8?B?WUNKbUs3Q3FuR1plbXJnMWQ0UzRxWkxqZnNmTzRnSjdJTEg3MlQ2TEhiY21y?=
 =?utf-8?B?czhrL3Iwc2duRmtCaWF0KzdsTVF6TU44YkNhaXZqcjRBTURjVEJVZjdiL3gx?=
 =?utf-8?B?Q3NIWm9nTjRLOFJGQ2xPSStHQmlQSXk3Qm5XTzBOOHBRc013dnZEamlPN3RD?=
 =?utf-8?B?eDdIeGFZR2tnYVhvMi9KSjZLUTI5QmZoM3U0MUZOTWhNQXpUc0RQZ1U1bUlG?=
 =?utf-8?B?V0ZRNXJOb1loMEVGTTRrb2lLTUF5NlJwVTlhMi9mTFpTWjFyeWgzTndmWmpJ?=
 =?utf-8?B?eDNyZUVXdHlmK1RseGJWVTM5TmRGZ0NCOWhOZE9DbjJTb2E5d2xxOFRWSnNZ?=
 =?utf-8?B?Y0c1QmNiWmlGVFJMc0lGdHdjUlViL1dUZnpiRFpRaUJrSC9lWlFkWkFBN0RW?=
 =?utf-8?B?c04yWWg1SXhpWi9HYnYxeURYL0FCMGtTZU52YmJ4ZlltWFZMVW92S0RMZ3NG?=
 =?utf-8?B?NDR5NGZHZWMranNMS2ZYenBMeExSWHlYb2l2TXc3djhQblYwQlJKTThWSXhx?=
 =?utf-8?B?eHNXS0JORGhlV1hUMlZiRUVScWpCTG9xSnVET25wOXFWOWduQW1LM05UKzZ4?=
 =?utf-8?B?STdncFJsbUcyZEFncVFvYUZLOE8zT3lMaDJRZzVhVDhwVWQ4Z3lyWmh0Syt0?=
 =?utf-8?B?OGxsNWVtWXlTZmYzd1cxRTROREoxcWRhUjY5OEsrdDJ4SXExaTlnNENtNmpX?=
 =?utf-8?B?WDFtZURCa2RjWGtTSkZjaTM4ajI0eExQcWdISTVnVlVVbFdUQktoSGdBMnZa?=
 =?utf-8?B?akt5ZFVQZWRZTXdWNGQzRU41WUpsSkNIRTdCMTkrVFdkKy8wSWZCNWJiTVJZ?=
 =?utf-8?B?YmJBdkZHYkxMaFpmK3orRmxhOHMyeWsyUDNpL2lGRGN1MFE3NEx4c1JmQ08z?=
 =?utf-8?B?STV3Y3B5N0U3M0tiU0RzYlZYK3M4UnIwKzFYM1d4WE1hSGROWjQ1Qm5jcTZo?=
 =?utf-8?B?WW9XY2F1WDF6MFUwRmt6NU1uUlExT2xUd29vL2NkNzZHbVBRTjhBZTlQWHlp?=
 =?utf-8?B?R1lRc0FIQzNiZG1SaUx4UWMwakQzcDFmMGZHdC9hWHZLN0wrcFpGZUlIL3FT?=
 =?utf-8?B?VDlnVkVFb3lIMzRYQzV4SnEwSEkwcEZFZEUzWWNqUFBHbTA0V2pIdVZTWElL?=
 =?utf-8?B?QXlGWVNhNVVvSlpKVXVvQ21NVndpTFdzT0pJV3BJUXBDUWxVVXdlcVozNFZx?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hidglobal.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR05MB10129.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e95bfb86-4542-4622-29fe-08dcd91ba4df
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2024 02:26:33.2961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0bdc1c9-5148-4f86-ac40-edd976e1814c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ATbFGobSATQUhnFPG9rgbAFTaX6M4ItxESEiQIKF4CqR4QGwC/I0eHBG6p4mY8/d8YMKALAqH4W64afZkNhnmslSSmnulMa7XM3Na1lMVSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR05MB10688

PiBPSywgYW5ub3lpbmcuIEkgYW0gdHJhdmVsaW5nIGZvciBjb25mZXJlbmNlcyB0aGlzL25leHQg
d2VlayBzbyBJIGNhbm5vdCB2ZXJpZnkgaGVyZSwgYnV0IHByZXN1bWFibHkgeW91IGFyZSBjb3Jy
ZWN0LiBEbyB5b3UgcGVyaGFwcyBoYXZlIGEgbW9yZSBjb21wbGV0ZSBjYXB0dXJlIHlvdSBjYW4g
c2hhcmU/DQoNClN1cmUuIEZpcnN0LCBnZXQgTVNPUyBmZWF0dXJlIGRlc2NyaXB0b3I6DQoNClNF
VFVQIHBhY2tldCByZXF1ZXN0aW5nIGhlYWRlcjoNCkMwIEExIDAwIDAwIDA0IDAwIDEwIDAwDQoN
CkRhdGEgSU4gcmVzcG9uc2U6DQoyOCAwMCAwMCAwMCAwMCAwMSAwNCAwMA0KMDEgMDAgMDAgMDAg
MDAgMDAgMDAgMDANCg0KU0VUVVAgcGFja2V0IHJlcXVlc3RpbmcgZnVsbCBkZXNjcmlwdG9yOg0K
QzAgQTEgMDAgMDAgMDQgMDAgMjggMDANCg0KREFUQSBJTiByZXNwb25zZToNCjI4IDAwIDAwIDAw
IDAwIDAxIDA0IDAwIA0KMDEgMDAgMDAgMDAgMDAgMDAgMDAgMDANCjAyIDAxIDU3IDQ5IDRFIDU1
IDUzIDQyIC4uV0lOVVNCDQowMCAwMCAwMCAwMCAwMCAwMCAwMCAwMA0KMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDANCg0KVGhpcyBpcyB3SW5kZXggNCBhbmQgZGV2aWNlIHJlcXVlc3QuIFRoZXJlIGlz
IG5vIHByb2JsZW0gYXMgaW50ZXJmYWNlL3dWYWx1ZSBpcyAwLg0KDQpOb3cgdGhlIHByb3BlcnR5
Og0KDQpTRVRVUCBwYWNrZXQgcmVxdWVzdGluZyBoZWFkZXI6DQpDMSBBMSAwMiAwMCAwNSAwMCAw
QSAwMA0KDQpEQVRBIElOIHJlc3BvbnNlOg0KOEUgMDAgMDAgMDAgMDAgMDEgMDUgMDANCjAxIDAw
DQoNClNFVFVQIHBhY2tldCByZXF1ZXN0aW5nIGZ1bGwgZGVzY3JpcHRvcjoNCkMxIEExIDAyIDAw
IDA1IDAwIDhFIDAwDQoNCkRBVEEgSU4gcmVzcG9uc2UgKDMgcGFja2V0cyk6DQowMCAwMCAyOCAw
MCA0NCAwMCA2NSAwMCAgLi4oLkQuZS4NCjc2IDAwIDY5IDAwIDYzIDAwIDY1IDAwICB2LmkuYy5l
Lg0KNDkgMDAgNkUgMDAgNzQgMDAgNjUgMDAgIEkubi50LmUuDQo3MiAwMCA2NiAwMCA2MSAwMCA2
MyAwMCAgci5mLmEuYy4NCjY1IDAwIDQ3IDAwIDU1IDAwIDQ5IDAwICBlLkcuVS5JLg0KNDQgMDAg
MDAgMDAgNEUgMDAgMDAgMDAgIEQuLi5OLi4uDQoNCjdCIDAwIDQzIDAwIDQ2IDAwIDM0IDAwDQoz
OSAwMCAzMyAwMCA0NSAwMCAzMSAwMA0KNDEgMDAgMkQgMDAgNDEgMDAgMzIgMDANCjM3IDAwIDMy
IDAwIDJEIDAwIDM0IDAwDQozMiAwMCAzMiAwMCA0MiAwMCAyRCAwMA0KNDEgMDAgMzMgMDAgMzYg
MDAgMzQgMDANCjJEIDAwIDM5IDAwIDM2IDAwIDM3IDAwDQo0MiAwMCAzNCAwMCAzOSAwMCA0MiAw
MA0KDQozMiAwMCAzNiAwMCA0MiAwMCAzNSAwMA0KMzcgMDAgN0QgMDAgMDAgMDANCg0KSSBvbWl0
dGVkIEFDU0lJIHZhbHVlIGZvciBvdXIgaW50ZXJmYWNlIEdVSUQgYXMgaXQgaXMgbm90IGltcG9y
dGFudCBoZXJlLiANCg0KVGhlIGltcG9ydGFudCBwYXJ0IGlzIHdJbmRleCA1IChyZXF1ZXN0IG51
bWJlciksIGRldmljZSByZXF1ZXN0ICgweEMxKSBhbmQgb3VyIGludGVyZmFjZSBudW1iZXIgMiBh
dCBvZmZzZXQgMiB3aGljaCBpcyBMT1cgYnl0ZSBvZiB3VmFsdWUuIFRoZXJlIGlzIHRoZSBwcm9i
bGVtLiBDYXB0dXJlZCBhdCBXaW4xMCAyM0gyIGJ1dCBpdCBiZWhhdmVzIHRoZSBzYW1lIHdheSBh
dCBsZWFzdCAyIHllYXJzLCBwcm9iYWJseSBhbHdheXMuDQoNCj4gSXQncyBiZWVuIGEgd2hpbGUs
IGJ1dCBJIGJlbGlldmUgV2luZG93cyAxMC4gSW4gdGhlIGVuZCBJIGVuZGVkIHVwIHNodWZmbGlu
ZyB0aGUgaW50ZXJmYWNlcyBhcm91bmQgc28gdGhlIG9uZSB3aXRoIHRoZSBNU09TIGRlc2NyaXB0
b3JzIHdhcyBpbnRlcmZhY2UgMCBmb3IgYmV0dGVyIGNvbXBhdGliaWxpdHksIHNvIGl0IGlzIHBv
c3NpYmxlIHRoYXQgc29tZXRoaW5nIHdlbnQgd3Jvbmcgd2l0aCBteSBpbnRlcmZhY2UgIT0gMCB0
ZXN0cy4NCg0KSXQgd291bGQgYmUgaW50ZXJlc3RpbmcgaWYgeW91IGNhbiByZXByb2R1Y2UgaXQg
YnV0IEkgcHJlc3VtZSBpdCB3YXMgYSBkaWZmZXJlbnQgcHJvYmxlbS4gSSB0ZXN0ZWQgaXQgYXQg
bXkgb2xkIFdpbjcgbWFjaGluZSBhbmQgaXQgYmVoYXZlcyB0aGUgc2FtZSB3YXkgYXMgYXQgV2lu
MTAvMTEgaS5lLiBpbnRlcmZhY2UgbnVtYmVyIGlzIGluIHRoZSBsb3cgYnl0ZS4gQWxzbywgTGlu
dXggaW1wbGVtZW50YXRpb24gaGFkIGl0IGNvcnJlY3RseSBmb3IgYSBsb25nIHRpbWUgYW5kIG1h
eWJlIHNvbWVib2R5IGRpZCBpdCBmb3IgYSByZWFzb24gZXZlbiB3aGVuIE1TIGRvY3VtZW50YXRp
b24gY2xhaW1zIG9wcG9zaXRlLg0KDQo+IElmIHNvLCB0aGVuIEkgYW0gZmluZSB3aXRoIHJldmVy
dGluZywgYnV0IHdlIHNob3VsZCBwcm9iYWJseSBhZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgdGhh
dCB0aGUgZG9jdW1lbnRhdGlvbiBpcyB3cm9uZy4NCg0KWWVzLiBOb3RlIHRoZSBkb2N1bWVudGF0
aW9uIGlzIGZyb20gMjAwNyB3aGljaCBpcyBiZWZvcmUgV2luNyByZWxlYXNlIHdoZXJlIGl0IHdh
cyB1c2VkIGZvciB0aGUgZmlyc3QgdGltZS4NCg0KTWljaGFsDQo=

