Return-Path: <linux-usb+bounces-19644-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6B7A19760
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 18:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C2A53A57C7
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 17:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8CF2153C4;
	Wed, 22 Jan 2025 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="JWAlLXP6"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E828D215179;
	Wed, 22 Jan 2025 17:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737566261; cv=fail; b=hRcC8Vyg8OFlA+NwamKTn6NFpMdR7O6duSKgqmRIvwqBLK0wYZcAfsp5g7OcAk2L4ERw0g2hb8hcM4xn8bIbAi5KR+VcjwDxLaiA2Ogx2ztRfD7HbS09CSqVIPSgm34FxQ1zOFCRhVb/JO5IbMszj+ylRXdfb0U8zIngjpo1oKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737566261; c=relaxed/simple;
	bh=CnlLS9gPIBn0bNLBketCPRF2Bi0f3lM/2QOOulGJKpA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jo2d4K+Mzkg0U2tH6F6ZKZjuFKHC3iGWH5W8ew9mMaKdOeE4aK8eCOM0B0brRL/r3bMYNo0mFt0hlokuveXZ9gWwAPPLeD16R77lhNWKCS3ZL+jI46JK6c7kC2Mj3wH/e4goMV3Fl9x2WlyM5fqL47uXRheMOUZ+VUjj/HOBdpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=JWAlLXP6; arc=fail smtp.client-ip=52.101.66.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMK8M+FwPQCcq0hpIrXX2sd6Uw/Q70p0sd96AI8dQYouQljwbN14OHyH+P2IdCSyP0QJxl+fqKDTBPk/XwFNWnDksp/j43HjWGtfpuEjN3ekkpNd500Zp4ZavzvSF8Dhea1+tArUEpHOx3BF4zGs409IA7cm7QZs9SmjQ31ciCJ/lvQR8nlcZCvK0dsLHozviROPOYLZcuh5lT54e7EjLbSUWDAFqvLPJ0cVkktKy+yhgbvY+EqWDDPTqqp28vM4gH9YVENJwjPurjzlis91D/5PGKNy4GO62J+xBXbhAVLFpsyFbNpspy7/GtzTd/ReKA1pUPUmOETIxvulYYO7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnlLS9gPIBn0bNLBketCPRF2Bi0f3lM/2QOOulGJKpA=;
 b=DGVBPRThym7HCHWHX7iaJh3awULhTORgP6DNXvIm24SfB1ma3IummgaFKqfdr/VilRzmfZ+mFpkBZoHUP79YFZ2zCdi478E99HVCUXBZbLau7olZ4xVbEQD7dvwq5T6uebNa9Mp0gBzTiTKh1eybIhmfuq/ElLtWMIiB3DoiOdj89Xu42VNI538ZLkKo7mE3/gMEEI6ZnZGTM96zrmJfctup2nAx6XQpgNPkAgSTjyv++9I/7B7JbvvXumN4S8TLW2ym6A91EkW/aKaaBZ4Jh/xO6fwE4Gcn0QoQbYiRQ9hQgZzWdCNMXfYYv/02JvFNFQHUZfJ2KkmEnqXzt8GQHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnlLS9gPIBn0bNLBketCPRF2Bi0f3lM/2QOOulGJKpA=;
 b=JWAlLXP60Vo+9O8HTxnrw1WSyYNOrFijHD1iikkanlbdCp56Jp4Wp6RRrrRJd5Umii4kY2Veqz8zcb5Uua2bkOCIR9zzTUzaLj+OYlf8+hBd/Ok/Tz1Iq40Ilp33cxHHo1iQ5We9RoUAn/CyEVbpoDYtCm/MBaM6OEd+8aVjV6Q=
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com (2603:10a6:10:1a0::11)
 by AS8PR06MB8133.eurprd06.prod.outlook.com (2603:10a6:20b:3c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 17:17:37 +0000
Received: from DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0]) by DBAPR06MB6901.eurprd06.prod.outlook.com
 ([fe80::3988:68ff:8fd1:7ea0%7]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 17:17:36 +0000
From: POPESCU Catalin <catalin.popescu@leica-geosystems.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "johan@kernel.org" <johan@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "m.felsch@pengutronix.de"
	<m.felsch@pengutronix.de>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH] usb: core: support interface node for simple USB devices
Thread-Topic: [PATCH] usb: core: support interface node for simple USB devices
Thread-Index: AQHbbNQz5nuTuJgNwkO47mkrPRQBtLMi0G8AgAA494A=
Date: Wed, 22 Jan 2025 17:17:36 +0000
Message-ID: <312dc0e4-a024-40e4-9aba-ae9074b58086@leica-geosystems.com>
References: <20250122134732.2318554-1-catalin.popescu@leica-geosystems.com>
 <2025012200-activist-disprove-808a@gregkh>
In-Reply-To: <2025012200-activist-disprove-808a@gregkh>
Accept-Language: en-CH, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBAPR06MB6901:EE_|AS8PR06MB8133:EE_
x-ms-office365-filtering-correlation-id: 06109776-629f-4180-3f14-08dd3b08aa86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?djZPK245UTNJS1ZLK29NWm1wcDdMVVh3OVNNRWV5LzNjcHpxb0VOclcrZDhn?=
 =?utf-8?B?NDZON0s4UHU3TVc4WjM3a1R4RUdlcEg1M0h4ZHh1NDkveERxVHBocUR1bjFN?=
 =?utf-8?B?V1lxbEZuS05nU2pzeEJCcjNYTFFnTU1iLzgrTlViVGFDWTI0eG1OSGRLdUVx?=
 =?utf-8?B?UERYVjVGSlNSM0xoMi9ZMVlRZ2lQVTRlR0luY2NESkRMTWMvcGN4b2RSbTd1?=
 =?utf-8?B?aFFtanFIZFp5cWZJRGV4T1VRRnlMSnB5cjVxSmpFank5akxoYTc5WTMyMEJp?=
 =?utf-8?B?Y2R5REt5V1ZjdHZOR3BaelI5L3NLS1lnWnZDbm9xSGRTdnkrNzlIK1QzN1NJ?=
 =?utf-8?B?dXpvbWdxUkFvbWJoMHU4MHlUaFRRLytuZStxY1dINXhoT2c3djJ6NzBCSDM1?=
 =?utf-8?B?eDVsd3YxTHdTTldwODZIRSs2aHhJRlpKS0pUOWgxTTBJREk1WVNHSGxHejQ5?=
 =?utf-8?B?Z0VpcE5ZOE5VZGo0V1prUWdseU93ampUTVljSjNlYXVLZVd6Mm1xYk12N3U2?=
 =?utf-8?B?ZGdTcEliQzZBZ1V1c3l5V0NiOUM4RUFjSEM0SW9mZlBUc3IvU1diaVdvWXB5?=
 =?utf-8?B?ejVlcmZLSlB1WVlWcUNXWWxzQVNEZ3BBanR1UGgwdFllVVl4ZDZDbTA0d1Vy?=
 =?utf-8?B?UUhkQ1F6a05ldisreFBCa2RjUEN0SFRmR1hkK1N3ZGpsQ0ttZUVxSGtCMTAv?=
 =?utf-8?B?TUVhenFRU0lEVHlzZVFYeTVneEdUN2lBU3MzdHhqZ2Z6UXN1QVNMcm5LSEU0?=
 =?utf-8?B?M2NkYklFZEVFL2I2djVGa0piZW8zOEdTTm90Z1FmWGp0VHM2UmRBV0VTNG15?=
 =?utf-8?B?Q0tzSHp4cWxrS055bUxzb1ZGdUw2ZUxWS2N4QXlJUzhMWGVNcVU2dTJmeS9C?=
 =?utf-8?B?aWtLZGo0K0NqNE1PclAyNjgvZG1rZjNOQU9jVDdCNXIvQTc1ZUZXK3JKY2Iw?=
 =?utf-8?B?dXZSTmZKdUlUdGNkOU8vbHduQitQMTgzdHV4UHdYT1RVQ2NSeU84Y2d4Nm13?=
 =?utf-8?B?OEVRcG5IeWIzR3RuaWVtNzJ2eHVFd0NZNGtsUE9QcysxaGJaUTRzeFk0dUd4?=
 =?utf-8?B?Z1o2cVphVTNvSDdtWnpNTWVLQ2xkeG0wcjRkN2JGYVJYWDNjRXBSdkpJY2lp?=
 =?utf-8?B?VXcrUEdrMmhqVU9HSFdXRXhCQTc4Qlg3VlZ1WXRlSmtIeHh1Mldva05sTHhm?=
 =?utf-8?B?STY3QzczY2pXTFZhZHMzVTg4b2tucExOa0t1ZU03SFpjQXpGQjdqcW9BcnlU?=
 =?utf-8?B?TDZqMjlyU2xpZmNCZGVBNkZxZ3NtQWZsbDhQaW5ZZUxKblhWWlhIcjlvR0h3?=
 =?utf-8?B?N1dCS1FzSlN2NjUxemlQZW00NWg1ZVlKUWgrb01JeVphS1FUL1FTaDJCbnYv?=
 =?utf-8?B?TmpKaGo4ZVdLYVB6bW80V2VwY0RBNkZleEg1ZTE5ZVZJZzNwMkxrbktSN0VT?=
 =?utf-8?B?VXNKbjRsNlZKNTVFakh0WXJkZ0FWRDlCNWxVTmY3MkJKMFE4SXppVjUzbkJN?=
 =?utf-8?B?aG1uWUNTNU54V2FFb29CRW5TK0p0anVqc2ROUTJZRDhIQVUzcmdESTZpM0kx?=
 =?utf-8?B?Z0F5RHFjZmxEWUZJOFhaMFJ2cUZoR3UwT1pWamdwTU1wK1Rtcm9EVmp0SjFS?=
 =?utf-8?B?TVF3UURyVC8vZ3RVZ1lOS1U3VjJEVUF5SGdveXB3QVEzbU1sVDhhVXovS1ht?=
 =?utf-8?B?d2U5cVJiRHczcEFYMFZVOTBLVElKa3JOb2pZQ21OMlRPSVFlRXJ0WXBueWZC?=
 =?utf-8?B?dzlGV0hPeW13d3VBSG9uRVR1UDZheFB4anVyYkZ5YU45dUxyWmF3NUhSaHJp?=
 =?utf-8?B?M1VBc3dZMUhoY1RYSURnbHFaeXU1UU5TQWFuYzNGSGRhRFBlMkk3WUtzaVF3?=
 =?utf-8?B?czdyYXhrNlVBL3ZhU1ZiVTgxd1czZVVpYm9UbElrbVNkVXhMTTlZMTM4Q1Nw?=
 =?utf-8?Q?OCMInSAHi31v+NAcMS0j4Fnh4ZXd7hpo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR06MB6901.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2JyVWlEbUFCNlZ3U2JUdDFDWkxXYlo0RjQ4WUdpRnhVanNEeHBOU3NkbWVv?=
 =?utf-8?B?SVBMM215ajlhY1VLaUNacjBINGlnZGRvVkVEUzM3RzlVdVloY1hrdm16bTZV?=
 =?utf-8?B?b1VTTDR0cnpnTS85d0V1SFRkdk1MOTMzS2RMaGZQWGRRelJ1aFYvMmcrL0hL?=
 =?utf-8?B?SFVHREFVSC90OUFwOVJMeDdlUU9hdWdDb1BwL3VUeGorYTR4QjBib3J5YWcw?=
 =?utf-8?B?c2hVaGxDbjhyMkI0dVptVVlHcnNPZ1Z1dHZYR1MrOUd3ZUFsYkFiQXI0am1G?=
 =?utf-8?B?OUJXNjRzT1pzcWxDc3dGWG9vQzZWK0JRK2RSYktkNktvdU8yV0RMay9HS1Ex?=
 =?utf-8?B?eDBuYlYxenR0UUo2cE96cEZIdXBCSCtkVnJpS3RxVGNBT2xZLzk1S1diU1Vr?=
 =?utf-8?B?YUx5bEhjM0Q3QkluUlJFVlJtaUJlTFM4V0JyOGRLMCtDcU9JcHNoMkNwNzJK?=
 =?utf-8?B?dXdtTThtdjIvTmdZV0ZHV0pYbWgvV3B0TnRLWWZjWUpZRlRBN2hxUDM2VkJP?=
 =?utf-8?B?a1dvaHhZVnptbHR3SElqRGxhci9jWEtJMm5NYWJBLzJRdHU4SFI4NlZnY3RK?=
 =?utf-8?B?anp0a05BVk1nSnZveU9HdndyMGlad0dDd1hUd1BPTUFuQ2hSaHc3ZFY4VERE?=
 =?utf-8?B?UjhTVGVPcTNFV0pRT1poWGtMNTVDSTFPejZvaHYweFlKc2lSU0RIM0FTVU05?=
 =?utf-8?B?K2w5b2ZmRjhSK1M2WEhNUC9TYjdRT0Zzcnh1TFYrUVc2TEdvY3d2V3k5dWpF?=
 =?utf-8?B?TFYxaGZLN1F5VXl0UkpjcTlwdjEvSDYzKzZaN1FHQjZkR0h4SVRQSTJIMXhv?=
 =?utf-8?B?Q2w0azI2L21DRTN5TUhkRlREQ3VyaWNidU5nSGpiNmQwSTB2VWt0VjlOekt5?=
 =?utf-8?B?endaV2dFeEtaeU1HQVo5UzdJMnpzMVpsd3NnUkxlU0JxTHlES0h6Y25EUCta?=
 =?utf-8?B?czFpcmh1czcwS2VCZnBoL0RHYU4yWWV1YWQ5dTdMVWFxaXpndzdTSm16Z3JM?=
 =?utf-8?B?U1hWVnM0d1lPZDZxbW52QVhLQ1JFSnhNdHhPaDBuUGZHZFJEVVM2NXRYWmdN?=
 =?utf-8?B?WlFacktvbGFsYkdVMGltZXZRNlVsOUd3ZzVLaVNXbmoxYklIWDExSk9idzVx?=
 =?utf-8?B?WmtxS2NkMGdRSXdEVHlaTy9YRHZucG9RVTh1Y2lNZjZ0NDg3YUlVSEpIUWlz?=
 =?utf-8?B?QXlraXpnVEErellyNmx3SUhHWXV6MmhycmJtbmcrT1BtOERtSk0rWFVBeTNY?=
 =?utf-8?B?SDhtdlhPMDlEeUhsSEZKT3hMc3hYblEvS2RpMVNHWmZSWXRjdENjR1psSWJq?=
 =?utf-8?B?V3pXbUQ2OTRZdVhWelEzR1dnVk00VEd5NmtNbUs0UkdHK09LOE9wVmJoZ0tP?=
 =?utf-8?B?WkhUN1c3Nk54NS9SVVAvdlV3S0p4c2J5cHd0SVRIU2RFckU0MDBIdldhdzBB?=
 =?utf-8?B?QXV2NmNuK0YxMWpaZmsyWUVraHdqazQxb1ZRbHVuenZDQWI2K25LcjVySkU0?=
 =?utf-8?B?VHZrWWMwMGV4T2ZCMk5EcVJsM3hTN2lQWWxzTy9adlBkdmRkS0ttTVFrTWRU?=
 =?utf-8?B?L3VxcHM4REVmcmlGUG1JYUhOOUIraXpjY0N0Z3R2Yzc1RFhYbDAxVlZnU0xs?=
 =?utf-8?B?UXlpbjlpUHN1U1VLUVpVdU1Mam1adkh1YkhoUlJPMU82OXR2VU5IUGVoa0Y1?=
 =?utf-8?B?a0swNmdyVWtPekkrY3FIRVJWd1FVUkZ0RG4yV0VXWXlIeDF0MFBOcXlSQy9R?=
 =?utf-8?B?SFo2OVNzd1c0V1J2cmZRVzhOTzR6MDBQMkFHRFNQRGxMWTl3SHQvUzBtU21r?=
 =?utf-8?B?V1orcnBrNFcwc2ZWYm1SWlhGQlljQk9SWjNySjFja29zOVR1d1JEUGh2aEVZ?=
 =?utf-8?B?bUVYU1p4NHpyeU83OVRmcmI3NjdjT01BczZVVWJrbmFkeHpFMWU4WkdrY2s3?=
 =?utf-8?B?dWJhVlRNNnY2S2ZTdDlkYkdpQWh2T2NNRS9SQjg4cG5jK1lDTVR2dWk2OTlM?=
 =?utf-8?B?ZzhreDdNYXJyZUFTdityRkFzOTZxMldqSUZkVDBUZmFLeHBUU1YvRzUvM1lk?=
 =?utf-8?B?aG55dDFjRXgvbkhyY1E1YlVVS2hpeXREVlJ3UXBNQWJxK2lJQlpvNUI3T3FE?=
 =?utf-8?B?UjVnVHpEU1ZsQWJzblJhTTRoNk9ZbDdobjNmaWR6cWFjY2EraVlwMkhvVm1k?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C792FBEC130BDD49B7469C13148CDC7C@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBAPR06MB6901.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06109776-629f-4180-3f14-08dd3b08aa86
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 17:17:36.2861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BNXQPxeRjOeALyWUMDm/iOx9tf4RwtphcqJkOObjXe5q1dykWPP0XJmfu+iioCQGJmRcfwkxauT31MD/BFpHSH280/5W/GeEH0dx9H3y2ZA23sIMFHoFg772A54ONEg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8133

T24gMjIvMDEvMjAyNSAxNDo1MywgR3JlZyBLSCB3cm90ZToNCj4gVGhpcyBlbWFpbCBpcyBub3Qg
ZnJvbSBIZXhhZ29u4oCZcyBPZmZpY2UgMzY1IGluc3RhbmNlLiBQbGVhc2UgYmUgY2FyZWZ1bCB3
aGlsZSBjbGlja2luZyBsaW5rcywgb3BlbmluZyBhdHRhY2htZW50cywgb3IgcmVwbHlpbmcgdG8g
dGhpcyBlbWFpbC4NCj4NCj4NCj4gT24gV2VkLCBKYW4gMjIsIDIwMjUgYXQgMDI6NDc6MzJQTSAr
MDEwMCwgQ2F0YWxpbiBQb3Blc2N1IHdyb3RlOg0KPj4gQSBzaW1wbGUgdXNiIGRldmljZSBoYXMg
YSBzaW5nbGUgY29uZmlndXJhdGlvbiBhbmQgYSBzaW5nbGUgaW50ZXJmYWNlDQo+PiBhbmQgaXMg
Y29uc2lkZXJlZCBhcyBhICJjb21iaW5lZCBub2RlIiB3aGVuIGRlZmluZWQgaW4gdGhlIGRldmlj
ZXRyZWUuDQo+PiBJZiBhdmFpbGFibGUsIGl0cyBpbnRlcmZhY2Ugbm9kZSBpcyBzaW1wbHkgaWdu
b3JlZCB3aGljaCBpcyBhIHByb2JsZW0NCj4+IHdoZW5ldmVyIHRoZSBpbnRlcmZhY2Ugbm9kZSBo
YXMgc3Vibm9kZXMuIFRvIHByZXZlbnQgdGhhdCBmcm9tIGhhcHBlbmluZw0KPj4gZmlyc3QgY2hl
Y2sgZm9yIGFueSBzdWJub2RlIGFuZCBpZ25vcmUgdGhlIGludGVyZmFjZSBub2RlIG9ubHkgaWYg
bm8NCj4+IHN1Ym5vZGUgd2FzIGZvdW5kLg0KPj4NCj4+IEV4YW1wbGU6IEZUREkgY2hpcCBGVDIz
NFhEIHRoYXQgaGFzIG9ubHkgb25lIFVBUlQgaW50ZXJmYWNlIHdoaWNoIGlzDQo+PiBiZWluZyB1
c2VkIGFzIGEgc2VyZGV2IGJ5IG90aGVyIGRyaXZlci4NCj4+DQo+PiBkZXZpY2VAMSB7DQo+PiAg
ICAgICAgY29tcGF0aWJsZSA9ICJ1c2I0MDMsNjAxNSI7DQo+PiAgICAgICAgcmVnID0gPDE+Ow0K
Pj4NCj4+ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsNCj4+ICAgICAgICAjc2l6ZS1jZWxs
cyA9IDwwPjsNCj4+DQo+PiAgICAgICAgaW50ZXJmYWNlQDAgew0KPj4gICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJ1c2JpZjQwMyw2MDE1LmNvbmZpZzEuMCI7DQo+PiAgICAgICAgICAgICAg
ICByZWcgPSA8MCAxPjsNCj4+DQo+PiAgICAgICAgICAgICAgICBibHVldG9vdGggew0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm54cCw4OHc4OTg3LWJ0IjsNCj4+ICAg
ICAgICAgICAgICAgIH07DQo+PiAgICAgICAgfTsNCj4+IH07DQo+IHNlcmRldiBjYW4gbm90IHVz
ZSB1c2Itc2VyaWFsIGRldmljZXMgZHVlIHRvIHRoZSBsYWNrIG9mIGhvdHBsdWdnaW5nLCBzbw0K
PiB3aHkgaXMgdGhpcyBhbiBpc3N1ZT8gIEkgdGhvdWdodCB0aGF0IGp1c3Qgd291bGQgbm90IHdv
cmsuDQoNCldlbGwsIEkgY2FuIHNheSB0aGF0IG9uIDYuMTIuMCBpdCdzIHdvcmtpbmcgOg0KDQpb
wqDCoMKgIDAuOTI5NDkzXSB1c2IgMS0xOiBuZXcgZnVsbC1zcGVlZCBVU0IgZGV2aWNlIG51bWJl
ciAyIHVzaW5nIHhoY2ktaGNkDQpbwqDCoMKgIDUuOTA2NTc0XSB1c2Jjb3JlOiByZWdpc3RlcmVk
IG5ldyBpbnRlcmZhY2UgZHJpdmVyIGZ0ZGlfc2lvDQpbwqDCoMKgIDUuOTA2NjMyXSB1c2JzZXJp
YWw6IFVTQiBTZXJpYWwgc3VwcG9ydCByZWdpc3RlcmVkIGZvciBGVERJIFVTQiANClNlcmlhbCBE
ZXZpY2UNClvCoMKgwqAgNS45MDY3MjddIGZ0ZGlfc2lvIDEtMToxLjA6IEZUREkgVVNCIFNlcmlh
bCBEZXZpY2UgY29udmVydGVyIGRldGVjdGVkDQpbwqDCoMKgIDUuOTA2ODQyXSB1c2IgMS0xOiBE
ZXRlY3RlZCBGVC1YDQpbwqDCoMKgIDUuOTA3ODA5XSBzZXJpYWwgc2VyaWFsMDogdHR5IHBvcnQg
dHR5VVNCMCByZWdpc3RlcmVkDQpbwqDCoMKgIDUuOTA3ODMyXSB1c2IgMS0xOiBGVERJIFVTQiBT
ZXJpYWwgRGV2aWNlIGNvbnZlcnRlciBub3cgYXR0YWNoZWQgdG8gDQp0dHlVU0IwDQpbwqDCoMKg
IDUuOTE4NjQ5XSBidG54cHVhcnQgc2VyaWFsMC0wOiBzdXBwbHkgdmNjIG5vdCBmb3VuZCwgdXNp
bmcgZHVtbXkgDQpyZWd1bGF0b3INCg0KPT0+IHVucGx1ZyBGVERJIGZyb20gVVNCIGJ1cw0KDQpb
wqAgMTA5LjQxMDQwOV0gdXNiIDEtMTogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgMg0K
W8KgIDEwOS40MzI1NTZdIGZ0ZGlfc2lvIHR0eVVTQjA6IEZUREkgVVNCIFNlcmlhbCBEZXZpY2Ug
Y29udmVydGVyIG5vdyANCmRpc2Nvbm5lY3RlZCBmcm9tIHR0eVVTQjANClvCoCAxMDkuNDMyNjM0
XSBmdGRpX3NpbyAxLTE6MS4wOiBkZXZpY2UgZGlzY29ubmVjdGVkDQoNCj09PiBwbHVnIGJhY2sg
RlRESQ0KDQpbwqAgMTUwLjQwMzM3OF0gdXNiIDEtMTogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmlj
ZSBudW1iZXIgMyB1c2luZyB4aGNpLWhjZA0KW8KgIDE1MC41NTM3OTRdIGZ0ZGlfc2lvIDEtMTox
LjA6IEZUREkgVVNCIFNlcmlhbCBEZXZpY2UgY29udmVydGVyIGRldGVjdGVkDQpbwqAgMTUwLjU1
MzkyMF0gdXNiIDEtMTogRGV0ZWN0ZWQgRlQtWA0KW8KgIDE1MC41NTQ3MThdIHNlcmlhbCBzZXJp
YWwwOiB0dHkgcG9ydCB0dHlVU0IwIHJlZ2lzdGVyZWQNClvCoCAxNTAuNTU0NzMxXSB1c2IgMS0x
OiBGVERJIFVTQiBTZXJpYWwgRGV2aWNlIGNvbnZlcnRlciBub3cgYXR0YWNoZWQgdG8gDQp0dHlV
U0IwDQpbwqAgMTUwLjU1NDk3Nl0gYnRueHB1YXJ0IHNlcmlhbDAtMDogc3VwcGx5IHZjYyBub3Qg
Zm91bmQsIHVzaW5nIGR1bW15IA0KcmVndWxhdG9yDQoNCmJ0bnhwdWFydCBpcyBiYXNpY2FsbHkg
dGhlIGJsdWV0b290aCBkcml2ZXIgdGhhdCdzIGJlaGluZCB0aGUgRlRESSBhbmQgDQp1c2VzIHR0
eVVTQjAgdG8gY29tbXVuaWNhdGUgd2l0aCB0aGUgYmx1ZXRvb3RoIGNoaXAuDQpJIGNhbiBjb25m
aXJtIHRoYXQgYWZ0ZXIgdW5wbHVnL3BsdWcgdGhlIGNvbW11bmljYXRpb24gd2l0aCB0aGUgDQpi
bHVldG9vdGggY2hpcCBpcyBwZXJmZWN0bHkgd29ya2luZy4NCg0KQlIsDQpDYXRhbGluDQoNCj4g
Y29uZnVzZWQsDQo+DQo+IGdyZWcgay1oDQoNCg0K

