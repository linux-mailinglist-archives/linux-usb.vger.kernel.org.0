Return-Path: <linux-usb+bounces-32718-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ar9GoBDd2n+dgEAu9opvQ
	(envelope-from <linux-usb+bounces-32718-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 11:35:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E06C587118
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 11:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63F0E303AA9E
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 10:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7333009D4;
	Mon, 26 Jan 2026 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="O6ayv0zX"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023125.outbound.protection.outlook.com [40.107.162.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0193E313547;
	Mon, 26 Jan 2026 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769423567; cv=fail; b=beKSXgL7llaEbazu+ojqdzSlTzvG9/ijqqK2MojLLSol9GtwnPawx0rF8MtivdoGbuXbuMITRvfSeQpjJHT3dSLXsTsfukZcscT+I6Rgvx5xf/JfHdTtfy3Z8MAA5Gd9h71qPehSlVLR/LyFQJKZKYF3eaV4j/kgGRv9R9tTi6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769423567; c=relaxed/simple;
	bh=/LHhPchcJMYwgI/CKgn+pfq8LoT5wrLD+kf1nDBnEpI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WpSGqd0t8fwhiB8LtJ913KEvdaihfS3yBpsRlFVzd2nc9dlRhmLckvOdCFtvpUuR/2YiDotOxuhUrUpaeVcBdQtdEp0jIo6X5eCYAzLjAMckiJxuQwrK37dDBn4V3T1KIo1FW73Z2OuW79OJN9H4CYSS934r5m6wl/9JMSH+61I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=O6ayv0zX; arc=fail smtp.client-ip=40.107.162.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0S/MrDVndLcU6nqhoW219WNbxkzZBgigV3KphcPS4YX2fPS+gsJhaolcQwxGBsCfpQstbNdF/r5gXJaX8+N0fdk68JOGzCRslgMfhXX1mAiFG6jHVZezwcnGVtqzKF+nP/h1MbjBLP6D/qD0kNQ96ta4JNqdO7ciRkmJt/SaAijviAWK2XRaUI1ZfINjctYcysfoY9lLxO9+uK+a3Ks76Bus3USbXMwVpRPQDmT73dv5jblXCtQLyDfSIyWz+FkSTncgl/pv5EoUZg52vhkexhayWaphV1quPckTPiZ2Z49yELMsDW+asp3zr2Fe7wMSZ9OsM9vA7usbXoxbwyk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LHhPchcJMYwgI/CKgn+pfq8LoT5wrLD+kf1nDBnEpI=;
 b=jZiELuJ/PlMYlROec0zWQnL5/xfZuvofFHOGqRYKPkJMn9kUEhIrdYbUGESGUAVXV8npiWrb5Tthkw4YdqL2meyWpzcjNEBJwiXsLbC+7U6ob3ayDkI3DKpn9zbMwWZNLUoKHvVcSrKioqP5U51W5Np9TjVDOXezCt/Kxi1MNg3MAg+e5miYND7wFXsp3mtml+K/H1AXuqBhBcFD4pvt6wbXDAsRmU4avBPlHtvLm+LZLl/+/5WU8i9BCDmIn01J70BF4O6O9RmmhUZpLC5LQY0BA2GW8BRwq91k2OnOGlk/JHsnMcFO8LkP/OPAuFKEPjqskEYwdTRKZob67qFLsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LHhPchcJMYwgI/CKgn+pfq8LoT5wrLD+kf1nDBnEpI=;
 b=O6ayv0zXOxpx7Hexu/dkX/CmlcQ4agBWE0byM74r6jLbGkV9JxHPFLkiBh64TCalFgmPOB9GDUddngCxbWenMlUWRZnc0mjWs62LArk/q3WMkejW+sPcVl90ybXfQjv3Lxpn1hyj4m+R01RkcpWUzPmGc8KNXCMkSGDT1gQGoSj8lDQcWPvW/19/oeqPwCskt4UKigBTgueooGmXREmOw3jSSwjwyEfbx6jZEzd0ldjyQsaojGDmaYyA0XAJqxlO/k6KwD7nLEltXmJcGTVqzswxmWA0iux+gPk4OGbupsOr0lYASjFofQMVOfZCrd5kEYFdTwftQAv+A7JCzHlyOg==
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:425::22)
 by AS4P195MB1768.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:51b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 10:32:40 +0000
Received: from DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::a5a9:5513:e1a:f50f]) by DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
 ([fe80::a5a9:5513:e1a:f50f%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 10:32:40 +0000
From: Jan Remmet <J.Remmet@phytec.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [PATCH v2] usb: typec: hd3ss3220: Enable VBUS based on role state
Thread-Topic: [PATCH v2] usb: typec: hd3ss3220: Enable VBUS based on role
 state
Thread-Index: AQHcjIQD4/HxHZiKCk+ldDwHVKR9w7VkG+UAgAAQ6ICAABhcAA==
Date: Mon, 26 Jan 2026 10:32:40 +0000
Message-ID: <29eedf1f-7dcd-497d-a569-488d7cfb69c9@phytec.de>
References: <20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de>
 <2026012343-rockfish-candle-d3d9@gregkh>
 <4d1e6908-daa2-4322-8c00-055b4c1022bc@phytec.de>
 <2026012641-material-guiding-444d@gregkh>
In-Reply-To: <2026012641-material-guiding-444d@gregkh>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P195MB2325:EE_|AS4P195MB1768:EE_
x-ms-office365-filtering-correlation-id: fab3d202-4217-4add-451e-08de5cc63bad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZTdtenBtaVJrVkt2endNVHVCWmxNTlVtbXlOVFk0ejNJR1dYa2tEbnRGTUVT?=
 =?utf-8?B?a2lKOGZKUHhFdFI4M3pWYVMrMGtHVmRtVDJtL3pWdWFsN3Erd2piMURVeS8v?=
 =?utf-8?B?TEdFMEJoTEtNanRiVGVGbU1ZenB0ZHJFdDhkcGNKbWtiR2RwbWJiUDhYbVNV?=
 =?utf-8?B?bG9XdFlpSE5vS29DRVBxWE85T3VldHdHOG9sVUlrZm1aVWFQT2I5ZUJrVzN2?=
 =?utf-8?B?WWl3d3NpSHFxY2FoYWJoMnBkaFhoV1JJTHgrWXhsTE1YSGVyUzg4eEw1THlU?=
 =?utf-8?B?T0JSRTRKanE1ZFBYQTBuQXQ3UHVDMUpFdDloQm9mZlUvak00U25VcUJFV094?=
 =?utf-8?B?WGFtR3Q1WHFmVW9SUUowdnhOZkhycEpLZjVVUmVHQ2NRUGJIbmJSd2lSWVEv?=
 =?utf-8?B?Vnp2RjFGdFJ3eURtdFlteVk0R3VBb3NXSlBHZWYxclZucWFnRERoWDZYYy9h?=
 =?utf-8?B?eXBhV1lLMXZNdkFtaTVqdU4zcUpPTkcwRENDYUZzSVJFUVN3U0ttYU0xZDJX?=
 =?utf-8?B?VHhJOU9zSGwxczZMc1FZUkpTYU15WWpybDlyQ1VJakxVSEQ0cjBwYURJNjZx?=
 =?utf-8?B?ZEpORzd0VWZDS3JPVzBFc1luTFFWdmpROUtIekdSbnFYZzlBQjNQUGE5S2Qr?=
 =?utf-8?B?OHV3dGN0RDRZRWtRMFJJSTJqMHV6SmpYNFpRbzZ2c0JzalZQb2NYZFpJVGxj?=
 =?utf-8?B?dDVYb0pqT1pTblI1SlRrWVFsVjd4TXBXeC9iQ1hHb2NhWDBCUlhUVkt0M0tD?=
 =?utf-8?B?MTlRRFZQVUo1UkE0K1Fva3pVenE3R3lyUmN0SG1veG14NE83U2FRcTRVMkdP?=
 =?utf-8?B?enJ5WklVWEZwL0haUnF5YzRuZnNBUFpNVkdOLzl0WW9aR0w4V0dHZjdvc2Iw?=
 =?utf-8?B?Wm9NNENqSkQ2RFZmOUxtSVdHQTI5VDFNNkhoZEN0SkwrT05YTEpwcTFSVVRZ?=
 =?utf-8?B?bXc2SlJOWnZRZFV5Ty9ZOGxRSUhObWtEVytGQXhnYmFVOG03TVJUcU80a1Z5?=
 =?utf-8?B?dVp5SjVDU2FpbkgzeXR6Q3hYVWR2SFAwMW5xQWVEcjdDQ25YdWs5WVoyNGIv?=
 =?utf-8?B?L1grQTIvNXZPSTIyTmlwY0JWZTlxOG5Vc3BwRW5IT0hNdVJhTVVlZ2plQkRJ?=
 =?utf-8?B?NHFidVpMYVEwRkZ2MEVtVzNNOUpNRi81RnV6TFk2VmI4a1B5MFRxWkxmTUdS?=
 =?utf-8?B?NWduV0FJWVJuVGtBeitpLzdEZnVoODlZNDRSbElWTXNiajJ2RWJkU21CTEJY?=
 =?utf-8?B?YlRzaFFRRTlPbmY2RGpPaS9wdmFFc2ZNcXVWM3lNcFN0WnNyM0ZSSVR6cTFv?=
 =?utf-8?B?eW5hQlNpck1WZi9tWjVoL2tVRU9xcjNVZ1hLbjU2WFpTOEk1cW10WW0xNFBT?=
 =?utf-8?B?THlEa2VyaHFNMUpQRlI1Q29wOVpLdzh4ZVgzdE5VcUpYM2ZQTFdLVHNEczlK?=
 =?utf-8?B?d3hjVmZWdFJiak1OeW9IOWo1Uzhha2JlcGJVamcrT2FlbkkrN2ZmNXVyWFNT?=
 =?utf-8?B?WjFZVTVmWm1XMlMxcys3dWtTRmZPc000NVN5dDBnUGRldkkzQnZpV0dKSjRu?=
 =?utf-8?B?ZERFelc1SkNyWmU0dlVJV3JON0R1a2tvRE9sY1hQT1BwME4rMmc2RGZTbU5F?=
 =?utf-8?B?VmhCNXQ5dVZ1M2dNWW5neDVYZXVrTEZqR0hHT0dEODBMa3E5ekVjK0dCODNI?=
 =?utf-8?B?SjNpcEt3aHQrbmxhNGZ2MGR6Y0JrdWNvUWZzR0tIYmNrV1hRckkxR2dvNkxY?=
 =?utf-8?B?aFROUG9sV1ZwVDR4NlFRa080RlpBaTBnZnVrZCtzZ081ZXZtUldEV2pxNENw?=
 =?utf-8?B?RG5uVjMzakJYNmdqSVg2d2w2MHI1cFd1RjR5SmlrNklrUHVCNEZQdUo3K3Y4?=
 =?utf-8?B?YUhoVGtDWGRWeHRHbnp0dDJrcnIwS3dQYUtUM0N0cXBqTDJoWEpVVlZIY2Ro?=
 =?utf-8?B?czB3bHJ2Uzl3UW5xRlF6aGhUdHo4THhSNkNvMU51MHk5a0pRU1ZoZFhMTGV5?=
 =?utf-8?B?ckIxY0RsblA5L0F0TTlhYVZxdm8ydzFaT3hvMzlSVEZFZXBEWlVGTEs0eXJY?=
 =?utf-8?B?RGRlVUhMdlhpaHUzUTFaOHIrZ1I5S3FOaUZKbERvWms0dHQyc2YxZnJhdnpL?=
 =?utf-8?B?cnRXUVc0aTRmcmM2bEpucjNOTUFVUm9kUk9SbFhBRnJGQ1liWFZWd25sdWEv?=
 =?utf-8?Q?/XT3mwo2AXKhmwUWFcY/1bQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0P195MB2325.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WnhWN2FxcHV6b2xMditKVGhEeWJ6N1ptWldCbUdPNmJkZDlwZGZncGR6SXlw?=
 =?utf-8?B?YUtvOTlPR1ArenFvbCtnekN4VGtwUGNpTG5iandMbm9OVnY4dEtqOXZBVGdC?=
 =?utf-8?B?QVJPNDZTZTB3aTFxMC9FODNyWjd0dFNBazMzTVhmVWVweHZYcmkxYSsxRGhX?=
 =?utf-8?B?b2Z5WnVTckpsMWJ3WmNJM283UDZMT3c0L0UxVjFiN2RFMUphb2V4TmxBanJ0?=
 =?utf-8?B?akxBRWJmKzdaL1lyTTZmL1JCNGNSYkwxVURHQjhzQWZuTndLWmwrU2dqeFhR?=
 =?utf-8?B?a2p2RmtncjYyb00rWUVaU056V2NTYzVDaGVLY1hGTzFXc1NGQ1VsRWl3YkQr?=
 =?utf-8?B?V3NsK3RodlorbXd0MDhYaFUxQlJGK3dYQzFtNWRCY24xVVNsZW5UK0hYZ1NW?=
 =?utf-8?B?Y1JKMlJwNlk1WUhjcVV4Y3FOa3NCM2tnaVhkN2t5Nm90MCtFbHRBczdSY0R2?=
 =?utf-8?B?Y2IxeUxLTkdKdjJQbE1oTEJ5YU1GUmsrTEtTbkk0VStGTzFIanNnZGlIZFRx?=
 =?utf-8?B?aFRJVXlyQnhFWWx0SnFYZkh5R3lIY0IwdzRHYTVtTU45RXpLWlUvN3U3TVdZ?=
 =?utf-8?B?YzhtVW1LS1k2OFdDTG1aYlFpSWxUelFIVEUzYTdMU203QlpZUDhLVlRoMVhU?=
 =?utf-8?B?ODFNYmpudy9kNmlvbno2T2NmaGdWUmV2UDJ3WlVJcUxNSGFWdmZVOCtubnln?=
 =?utf-8?B?Vm1Rb3BsYTF0dGZ0Z0dJY0VlNm05Y0lsRm5ocG9JaGZLTzRRU3U0RzBFNGVG?=
 =?utf-8?B?Q2l6eDBTblNzL3BTOXgxZTY3SzFWazZNUStJS0ZpTXorZlphMElqNWNSNldn?=
 =?utf-8?B?Mkw0Y2pGeFl4OWVuaFQrRi83TEwzKzB1Y2hVNVNIS2kyQjI2RDRITVRjcHZp?=
 =?utf-8?B?SVpoOHBwUllsYlV1bm5Ock11MnkrL2NZSTlkQlJSMnM2TnpPOWVZK1BMaUxU?=
 =?utf-8?B?L2Z3RUhpbTdBM1ZiUDlxb01KY0huclJBNVV1eTRKWEZ5NDg1Q1o2aFIzeG1x?=
 =?utf-8?B?Slo0NFd3VXN4V21KRk1nNXJEa1BDVmNWQW1ZSmZUdGMvMGVWNmc2UVNMTWZX?=
 =?utf-8?B?Uk9MajVudmppdEh0VGxiWTRTTUpCd1BGem1VVjVySnl3djlpZ2Y2a1F3TFU2?=
 =?utf-8?B?OW5vN2tXTlJ3WEhiTXpxQ1R3RkROdVVTVmQ3ZEE2MTBUVGNHMnhGSEV4aTB1?=
 =?utf-8?B?ZXBrRUpiMm83dzBXNWtpWUEvcysvZ3VacVpUR3h5VmI5aEUyalRiZU1qV01r?=
 =?utf-8?B?ZVhKT01lWVJXTWlRWktFNzNqOThVTVRWZ1JYeWs5NHlzL2pvSkR3OHNWZmxq?=
 =?utf-8?B?Z1hHK3BDV3RDMzVyZnFxZGpsbkpsY0JjdFhUSDVpVkpCcmNtR3c5RHhJUFI2?=
 =?utf-8?B?NS9qQ0hJaVZPY1UvbytmT0R2Mm9OVm9Ka1B0Q0Q2RFVVVnRtZlBibUdsNlBN?=
 =?utf-8?B?WEJubUVWSUdnY2V6NlFDZXg5aEp2ODRXQ0dWdUMyVkdWZlcvd3dYVkpDL2Rk?=
 =?utf-8?B?MTlKQXZDVXRMbGpxdk1DRmNYeE1mNWhoZlFyYVpNMnRORkJPZUxLRHlSaUZz?=
 =?utf-8?B?OHFwUHZlNDI4VXpiMkVPVnhrQ0pMTldLaUxJL0ZMa2VidW1qbVpVdHZkcXE1?=
 =?utf-8?B?M2tkaFJqSHZobmpwNzd6bXYyVFVoZ3hFU1d6dUNhYUJLYVZvWk9CTWdXaHMv?=
 =?utf-8?B?cENaN0c2WG5lQ0NmMGQ5SThiNkNzZEFMYmJDUkFnUXVuSnhvckZrNGFFT2VN?=
 =?utf-8?B?ZXI4KzlqeEtIWktkSzRGRlR3NjUzd044ODRVTVFYYjVaZGQ4QzlvcmlxTlNt?=
 =?utf-8?B?NlMrZFVrU0Z2WmZKcy9vdzZId1AyU0lVZHlaMldQYnptNGQ1cXUwTWRGNUhj?=
 =?utf-8?B?VTJUYXRueW9KZmU2aE1jYnBJZm1GbW0zUGpOZGdOZVlpWHo5QksyM1JMQ2Mw?=
 =?utf-8?B?UXlubVovVG0rMUo3V3ExRUtCMFl0L2ZlTmZoTVQyWDRiUUJqN2NxZTdjNFZo?=
 =?utf-8?B?TXMrRTlrV2s2eGF6TFJsOHdQbW1aSzJpNUQxbk9GcVNxcXdWSWhKR252d2RQ?=
 =?utf-8?B?aFlJMVo5blVLRnUyMVZQV1JCWXdRRHdyeHM5VTREZSszcFJLTkFPWU9ZMTVE?=
 =?utf-8?B?QTM5RlN6SVRrMkdYbXBBU1hDWHVzenZBK3EyaEdNaTcya3lka1c3eFFwbzNm?=
 =?utf-8?B?T0t5cFFVT1kzcFc1N3JpNy9reXlrR1BxKzBNTnplOVFUL3d4UmZadnl6eVND?=
 =?utf-8?B?RnhHUFpTa3lOSkNnWlVSQzlkc1A5SVdtQVU4V25Mb3FvV1pwb09zV2s0d2lx?=
 =?utf-8?B?eXpVWHBkM05INElYZVZQZzFWOGlMNy85eEFuVWo4YWVCZU9KSGEzUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7CBF66436D8F294C812AA04A60E6E210@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P195MB2325.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fab3d202-4217-4add-451e-08de5cc63bad
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2026 10:32:40.7347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9nlylrM/atrXM9EBN4vDHc3tEVCfY8I6cGMVGMLM1sfXeWJIzvKmLnEQu7KN4wCqflo6yvN9RQOLSpJ+UmVe8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P195MB1768
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[phytec.de,quarantine];
	R_DKIM_ALLOW(-0.20)[phytec.de:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32718-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[J.Remmet@phytec.de,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[phytec.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[phytec.de:mid,phytec.de:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E06C587118
X-Rspamd-Action: no action

QW0gMjYuMDEuMjYgdW0gMTA6MDUgc2NocmllYiBHcmVnIEtyb2FoLUhhcnRtYW46DQo+IE9uIE1v
biwgSmFuIDI2LCAyMDI2IGF0IDA4OjA0OjU4QU0gKzAwMDAsIEphbiBSZW1tZXQgd3JvdGU6DQo+
PiBBbSAyMy4wMS4yNiB1bSAxNzoxOSBzY2hyaWViIEdyZWcgS3JvYWgtSGFydG1hbjoNCj4+PiBE
b2VzIG5vdCBhcHBseSBhZ2FpbnN0IG15IHRyZWUsIHdoYXQgZGlkIHlvdSBtYWtlIGl0IGFnYWlu
c3Q/ICBDYW4geW91DQo+Pj4gcmVkbyB0aGlzIGFnYWluc3QgbGludXgtbmV4dCBhbmQgcmVzZW5k
Pw0KPj4NCj4+IFRoaXMgaXMgc3RyYW5nZS4gSSBjcmVhdGVkIGl0IGFnYWluc3QgOTQ0YWFjYjY4
YmFmIChzb21ldGhpbmcgYWZ0ZXINCj4+IHY2LjE5LXJjNSkuIEkgY2FuIGNsZWFubHkgcmViYXNl
IGl0IHRvIG5leHQtMjAyNjAxMjMgd2l0aG91dCBjaGFuZ2VzLg0KPj4gRG8gSSBtaXNzIHNvbWV0
aGluZz8NCj4gDQo+IFByb2JhYmx5IG90aGVyIGNoYW5nZXMgdG8gdGhpcyBmaWxlIHNpbmNlIHRo
ZW4/ICBsaW51eC1uZXh0IHdpbGwgaW5jbHVkZQ0KPiB0aGUgVVNCIGRldmVsb3BtZW50IHRyZWUg
dGhhdCBoYXMgdGhlIHdvcmsgb2YgZXZlcnlvbmUgZWxzZSBpbiBpdCB0aGF0DQo+IHdpbGwgZ28g
aW50byB0aGUgbmV4dCByZWxlYXNlLg0KDQpJIHNhdyBvbiB1c2ItbmV4dCBteSB2MSBpcyBhbHJl
YWR5IGFwcGxpZWQuIEFmdGVyIHJlbW92aW5nIGl0LCBpdCANCmFwcGxpZXMgd2VsbC4gU29ycnkg
Zm9yIHRoZSBsYXRlIGNoYW5nZSBvbiB0aGlzIHBhdGNoLg0KDQpKYW4NCj4gDQo+IFRyeSByZWJh
c2luZyBhbmQgc2VlIHdoYXQgaGFwcGVucyA6KQ0KPiANCj4gdGhhbmtzLA0KPiANCj4gZ3JlZyBr
LWgNCg0KDQo=

