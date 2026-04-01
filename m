Return-Path: <linux-usb+bounces-35764-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOSKB7HAzGkWWgYAu9opvQ
	(envelope-from <linux-usb+bounces-35764-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 08:52:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6723756D5
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 08:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 987B43008D3C
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 06:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8347C33B96A;
	Wed,  1 Apr 2026 06:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aumovio.com header.i=@aumovio.com header.b="JFJQOB8R"
X-Original-To: linux-usb@vger.kernel.org
Received: from FR5P281CU006.outbound.protection.outlook.com (mail-germanywestcentralazon11012012.outbound.protection.outlook.com [40.107.149.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C78E26C3BD;
	Wed,  1 Apr 2026 06:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.149.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775025929; cv=fail; b=QiY8gkxn7WKzMrMmuDQWfhsXuY75+kFrpqj5V2MPzSZ9VNG0Yq6l5GhFKLFXZb9X6QI37E+yvXmK3OhVkSmMRjERGOh9G0pZEFYLbIZi3o5R4kdBpi+PTx4YLGPcxwhc+xKG9ac8edTzujSA/cPuFsfO3pEEgTcIx/FHLAxMvGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775025929; c=relaxed/simple;
	bh=1w//mjsQuNxiCFuqJcV7KW5QQfouebM40MD0yBViDxQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uwXo0QTjpseUBKVLePRKWgmyrEGs/DGISOIEsZzMIwjb+qpAAEscgkEtHQ47whd+GMaKUiAazOt1y5JNLhYgs50YPuYC+Yk8irkfVhOb57ms5p+ePZPZQkNoauKfGFJwVbwZz1dbQOS5JFmZfwoBwWDMGPqnDH47L3T2ZErYmcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aumovio.com; spf=pass smtp.mailfrom=aumovio.com; dkim=pass (2048-bit key) header.d=aumovio.com header.i=@aumovio.com header.b=JFJQOB8R; arc=fail smtp.client-ip=40.107.149.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aumovio.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aumovio.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZs/xEDnphuLFhmUvSe099POvHKFJU9McV5jGlODPI4FX3GFWbucRgaaNJ8pYPS/pSvvVUKHWrvVWrXOW2tSdlJXf6eVeH67kb3m9T1hLqglPJyCdYuY1oaoTkTq/oVucGMxiPVOVTHKgPhcBhzwCIQ04NCa68LzwAkQJiN9V1pxlIeDipzCvWEt86s/uFevFhaqBEOZsiZsZn4r2xfBEMOudOhKG8amxZeINObtsRhQJpBlOE3SiKieG+Ax4hC7Ed21S5sM+e8NL/MQBjPq/5H9Xko0ccRgsm8b5DQ8s3wXj0Qe1SVJ9DgO1Dt7NKKa9loVvgBCLPhWZkHCERfF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1w//mjsQuNxiCFuqJcV7KW5QQfouebM40MD0yBViDxQ=;
 b=oyGguB0IerJj9WiCTDyrCVnHZLD4gi2rAj/UlorTBhectW4VzuXT7cO2jkToEgPQ2RUcPgo5vD5piGtxyQcSQM9lf/gL85d/rtT85z8JD//j0XPQzFoiTHlgJcp6EnHhElTzpjXYWBpfMyRRHeBKX8LRU4NLN+NKg1TyyigSuc0LL/PAGpORRi4Tyky+wNoJIiKQNx4eZXNIgK08SFeM7HRLOZaduF+x/3G6uDmtsXLLKwDmqXsjhFAY94vDQv4x9OgTscBiFs7cmi9RSuaN3Bqjk2NY09gVAxf5ZO0ltu7UMSuxfOpOmZxinXG0wahUdTpbkWV8do36NYnWXvseLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aumovio.com; dmarc=pass action=none header.from=aumovio.com;
 dkim=pass header.d=aumovio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aumovio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1w//mjsQuNxiCFuqJcV7KW5QQfouebM40MD0yBViDxQ=;
 b=JFJQOB8RLe0enRdK+ntQCOBGQptJ/8xVM8k+9QSKj9gMkWb6/q7/uMA+cxZCQeohWkYIKThk+qIWy5e240AabLeHilzBkg4IhxDOZV6CYMm5sjH0KtmXkylXn7vODbdCPJGeRpixlEfGuZa/hIH4zyYOjxTcHYCP+/8UHtvnm5eMCELfdCHvc61LlQprzx07gSFzv73nJQz6ncipEoLMzZxV1V9adegTRX/geMEQRw19PrI1GThNN61HCFpawXLakHXG6IihlqjPavGyfWNfnhhbE/1yIw7I2u+nz5RF1U0ImuctcnVZR/gZF9iqPTaLG6+G2xhkjlU11xbjzUAhlg==
Received: from FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:41::9) by
 BE1P281MB1812.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:41::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Wed, 1 Apr 2026 06:45:24 +0000
Received: from FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e8ba:f0dd:af7a:ede8]) by FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e8ba:f0dd:af7a:ede8%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 06:45:24 +0000
From: "Andreea.Popescu@aumovio.com" <Andreea.Popescu@aumovio.com>
To: Alan Stern <stern@rowland.harvard.edu>
CC: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: chipidea: udc: reject non-control requests while
 controller is suspended
Thread-Topic: [PATCH] usb: chipidea: udc: reject non-control requests while
 controller is suspended
Thread-Index: AQHcwQg5wVeiN+sx6EGbnG0btBxBJbXIxxIAgAD6tKk=
Date: Wed, 1 Apr 2026 06:45:24 +0000
Message-ID:
 <FRYP281MB2618D382481440BFDFAEB2FCEA50A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
References:
 <FRYP281MB261885D9851351180B1EC037EA53A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
 <04f515ee-2213-4489-9734-d871e0d3d682@rowland.harvard.edu>
In-Reply-To: <04f515ee-2213-4489-9734-d871e0d3d682@rowland.harvard.edu>
Accept-Language: ro-RO, en-US
Content-Language: ro-RO
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_Enabled=True;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_SiteId=3bd97919-57c3-48d3-9e9a-8e4c01614a8f;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_SetDate=2026-04-01T06:45:23.362Z;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_Name=Recipients
 Have Full
 Control;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_ContentBits=1;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aumovio.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRYP281MB2618:EE_|BE1P281MB1812:EE_
x-ms-office365-filtering-correlation-id: ca7574a5-7588-4cb1-bca7-08de8fba40a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 JcN0S6cELyIbuC6Wqt8fnwvq+uICpAVPMG1rWEj1kOXJZjOXzuBcKVi90clyGT9EyYdgjHlD0qDZ2mMJEBqGNXK++70VoxdWcRFsifEGjyniAys1cCMsCQeT4xhOjdtwKucczAytepyPovLiJVucob2D1wR1U988dNepWLBceubVQoDAV00Ofzn7dxxck9FHdkAsPWqbSwlJTO2R210zq16J4ctMVYPITU4pbLdWuQRy3h4dENyOGVyYg6aU4IgkueHdJrp5pTcQuKLosOInnYqYs/7JJ0eRFMbwKWbXiB5rWzVUDBAm+8zo69ND7rjodttxqWOSte4EAWx/IuMYpFiEt27/RCqhdJxNkEQ2WrVR8w3+sd5QTTif+qrNEeNtLZGNu+zH0thiOuYbayq/UGzBxiVrP8byP4NrAD+cJ0y7YX7MVqsyeNtZ1FkwzufJbOGBH3NO2e/tRzogAVqPGKNgc978nmjOBaMKTEqkClmCZXoXcRl27tygfCDN6FK1nUD9PpdJzFWOESPkIhDcmOLmi7YVI4ppZaoevstQqwHqRhLu4m66Y9GvWNoL5zgUIjUyXC5g0eo16aBe/mTvPx14Wew3XP2Mfgd3qOUbjIEpiXr11zEGNheHuXZPvoRc5zaj64uo3Gpq+Z/QtT2k5WyD3VtdrnPJBCx9w25tyWoDVj8uBVdk+q00BGw2gemkkLp6lwNiFB5OJ85ttF4ArnWn1zi+oAICSGNyxngDV2Ra7y9S+FgNYliyG4rHoLjj
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VVVqL2Jlc0NzOHk2UFU5Sm5sVHArT0ljeFRQWS82T2ZHeEtxVmxLNkprbkEr?=
 =?utf-8?B?S05LR05LYlR1cVZsdWlpdERwckh6T28zdEZIZXhEWlpNenY0NXBaMk1yWmcw?=
 =?utf-8?B?bGdPNlFDSDIrMmJsbGNYVytGakw0Y0lwQ09NOTFkSzZGTDg4Z2wrVXhMb0tq?=
 =?utf-8?B?Z3NjRElDV044Z1hBMkttQ3JFWUdDMWlGaHhxdHV3SFhVZHgyRGxrRmlISkFy?=
 =?utf-8?B?bFdUcWtjNmJGTDRqOHhEdWdPbEZ1TS9NenA2OVEvSjA5UFFBZldTQy9OK29v?=
 =?utf-8?B?TlFmemdrZUpIaXVDUGVZYnpIWmZwMVJiSnhBbVB5aTdFVzZyV1pNeGQwOXk5?=
 =?utf-8?B?YnAyVFprb2s0TW1sRExEMC9PVzRpdTNHdzZneVRZaWVzdW1xRmQrcTFxWnE5?=
 =?utf-8?B?b1NzWWFER3NNN0RZZmhDYnNTdnNYMXFHWm9QOGoxSHM1M1d4cjZoUUFuSytl?=
 =?utf-8?B?YXJHU2kyeG9Eay9sUzk1c2k2dUlQSTlrL00vSC9ZRldYRjlPVURva2hoYTVi?=
 =?utf-8?B?eWZtSDE5NW4xZ0tRckk1RE40amZDM29kWFUvaHFyMFhPRDlxVGtUY2Rha0pK?=
 =?utf-8?B?NUdXVmRwdTBqWWswMlR1TENpQVZxZVQ5S0xENUtyeXBxOVIzWjg2SVVyZ0N3?=
 =?utf-8?B?cGhzLy9NSHpjdHBSc055WUpZZGZQUmUxTkxEZEZub0NDYkFZamNxUUtSR0lR?=
 =?utf-8?B?N2Y1cDZTd21uMTZ4UC90VE9QMlJzcWpkM0hQL2pFN3ZRdTE3WlZaQkltdXFj?=
 =?utf-8?B?VEdSTzZDakJpcmJ1cU1ycFpSQ1lKOCszUHFrcE5WQnBBdG9CcG9kME5TWmRN?=
 =?utf-8?B?OCtzbE1nUmF4UjcxcTJ3Vm5lbmFlakVWSzczTWhsTG5QOStxYlZqUGFDL1Ix?=
 =?utf-8?B?NGx4UmlLcno0TElKblpYRFg3aWlDZnY1bTdlaGZjMmlabmVXU1NDQlZkUXVF?=
 =?utf-8?B?U01pWFJvQmVXTXRqWkF0eDJuTS9RUUxSTExzOVUrckRESEl6ZlgvNVFrYTJs?=
 =?utf-8?B?MVNHZm5lRGszQjhwWjNhQTdEemoza3Via3BQTExocWZ5dWZsVUxuNTZwZEhz?=
 =?utf-8?B?Y21pbzFuUDdVV1dxM2xibSszUkZWYjR2ODFBZUhGM1pzL2V3UnZkWkNFWFhs?=
 =?utf-8?B?OWE0YzdNdjVVdGt6R0JYUEVnRDNHT0ZSV25ISnFCSWsrNmhUbWVBRllJcFF3?=
 =?utf-8?B?dVR3MXFjdGd0OXVNNm5mVHNxaStZZmxmbllETXA3RmkzNFBKd2NJaTVrSVNk?=
 =?utf-8?B?RHhJRXUrTDFQK1pQMFo2cThZa1ZlbDJNMUVoL3N6WmNMb01iK0crZ1d6RlNh?=
 =?utf-8?B?aWRXOFdtelZkYi85aDR4UkhUalBmR2dzcHRMRFVrRjQyQTNMOUhacDZmY3My?=
 =?utf-8?B?QndwcmF1bGV3OHE3NSsyUGpvOFJXbmNtMmJpbzB2TXV5YnI3d3pNUGRxb0tm?=
 =?utf-8?B?V1duUGN5TFNSUldHMnNEb0VxWE1EcXlVNXg2cDRyNW5IV3A3Q1RhMUdvZlZ6?=
 =?utf-8?B?YWNnOGZJWUttb0JGL1AxSlByaGw0ajU0YnZRWFIxMzhBb0d0L1EzM21PUVlk?=
 =?utf-8?B?R2gwbTJEWjc0dHFFRDVpTFFWU212bFRScnkyQ29YQkZuZFVDTEFZWkxTV1k1?=
 =?utf-8?B?RGo4bGFyMEY1NVA2cnVxckdGYVR6cWhzV0k5QmhGam1HWXNieFZOR1VRT3Yr?=
 =?utf-8?B?V1N5ZHRDUHpFT1hRelVLTGFRY3gxaXBuQmF3RWh3V1MyT1kya2lhVFo2ZEpQ?=
 =?utf-8?B?SUVGU1FkMUpEWFRHdGVreUI1TWczVmtBV0UzYlBQMnA4WDE1NjREUktxOUZs?=
 =?utf-8?B?cFJRSXlpRXJXSjA1T2VBS05SK3BRVTdkZGZvb1ZqNWtzVHAvaHZDRXVCSDdo?=
 =?utf-8?B?ZWsrUyttRGZQUXJROVU3UGIvdk9QZnRFL2tZWS8xd1NObHlianNGS1JDNkRY?=
 =?utf-8?B?d1RLZkZBcGJQaHpuQ2lOaFB5VUh1QTdpSEQ0NERQamtGWFRnUzFXRDBDUnlX?=
 =?utf-8?B?SHRMbWhRaVNBTkpDOTVrZ0JXV0NacXoyZUFoZnJzbjZKSkdaNTFGdGU5U1pB?=
 =?utf-8?B?WGJOR2ZpUjVrd2xTV2xlRjVWbUtIRkQ0dFZEWGtQbHZON2FCa01UMU8zRVhU?=
 =?utf-8?B?Szl5Y2h3U2lEVlllZXdCd3RxYlNzc3kzenhab2owYmJUcytPN2NJemxQT1hM?=
 =?utf-8?B?VmdMMXVHSWQwNkxrWERzQmppaE9hMjVQODA1MFU1cXdCZTg3d20xV2lwY0w4?=
 =?utf-8?B?YnptdlNTd0w1cTVKVkFMa0QzbnJ2cHo1a2lESkkvV0hQenBHU0VQQ0FwSVhV?=
 =?utf-8?B?SCtPZUNjRHBnY3dteHBtR0NMT1AxazRvM3MzZmZ5VlVVbFhzd3l0Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aumovio.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7574a5-7588-4cb1-bca7-08de8fba40a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 06:45:24.4285
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bd97919-57c3-48d3-9e9a-8e4c01614a8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZbqwhtlx71MY8ZgzKhZUEk8GBQZqqS0WnWxq7LYI7i61G+77zlC0AjEnXsR+H+b4Y5MhsMvQBrUZBrX7EFRgxxLGML/AiY1/FKg2A5pcRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB1812
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	FROM_DN_EQ_ADDR(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[aumovio.com,quarantine];
	R_DKIM_ALLOW(-0.20)[aumovio.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35764-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Andreea.Popescu@aumovio.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[aumovio.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aumovio-internal.com:url,td.next:url,aumovio.com:dkim,aumovio.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: 6A6723756D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMzEsIDIwMjYgYXQgMTI6MjE6NDVQTSArMDAwMCwgQW5kcmVlYS5Qb3Blc2N1
QGF1bW92aW8uY29tIHdyb3RlOg0KPj4gV2hlbiBMaW51eCBydW50aW1lIFBNIGF1dG9zdXNwZW5k
cyBhIENoaXBJZGVhIFVEQyB0aGF0IGlzIHN0aWxsDQo+PiBlbnVtZXJhdGVkIGJ5IHRoZSBob3N0
LCB0aGUgZHJpdmVyIGdhdGVzIHRoZSBQSFkgY2xvY2tzIGFuZCBtYXJrcw0KPj4gdGhlIGNvbnRy
b2xsZXIgYXMgc3VzcGVuZGVkIChjaS0+aW5fbHBtID0gMSkgYnV0IGRlbGliZXJhdGVseSBsZWF2
ZXMNCj4+IGdhZGdldC5zcGVlZCB1bmNoYW5nZWQgc28gdXBwZXItbGF5ZXIgZ2FkZ2V0IGRyaXZl
cnMgZG8gbm90IHNlZSBhDQo+PiBzcHVyaW91cyBkaXNjb25uZWN0Lg0KPj4NCj4+IFRoZSBwcm9i
bGVtIGlzIHRoYXQgdGhvc2Ugc2FtZSBkcml2ZXJzIG1heSBjb250aW51ZSB0byBjYWxsDQo+PiB1
c2JfZXBfcXVldWUoKSBkdXJpbmcgdGhlIGF1dG9zdXNwZW5kIHdpbmRvdy4gIF9oYXJkd2FyZV9l
bnF1ZXVlKCkNCj4+IHNpbGVudGx5IGFkZHMgdGhlIHJlcXVlc3QgdG8gdGhlIGVuZHBvaW50IHF1
ZXVlIGFuZCByZXR1cm5zIDAsIGJ1dA0KPj4gaHdfZXBfcHJpbWUoKSBjYW5ub3Qgc3VjY2VlZCB3
aXRoIGdhdGVkIGNsb2Nrcywgc28gdGhlIGNvbXBsZXRpb24NCj4+IGludGVycnVwdCBuZXZlciBm
aXJlcy4gIFRoZSByZXF1ZXN0IOKAlCBhbmQgaXRzIGJhY2tpbmcgYnVmZmVyIOKAlCBpcw0KPj4g
cGVybWFuZW50bHkgbG9zdC4gIFRoZSBjYWxsZXIgc2VlcyBhIHN1Y2Nlc3NmdWwgcmV0dXJuIGFu
ZCBuZXZlcg0KPj4gZnJlZXMgdGhlIGJ1ZmZlci4NCj5Xb24ndCB0aGUgcmVxdWVzdCBjb21wbGV0
ZSBub3JtYWxseSBhZnRlciB0aGUgZ2FkZ2V0IGlzIHJlc3VtZWQsIG9yDQo+YWJub3JtYWxseSBh
ZnRlciBhIHJlc2V0LCBkaXNjb25uZWN0LCBvciBzaHV0ZG93bj8gIEVpdGhlciB3YXksIGl0DQo+
d291bGRuJ3QgYmUgbG9zdCBwZXJtYW5lbnRseS4NCj4NCj5BbGFuIFN0ZXJuDQpUaGFuayB5b3Ug
dmVyeSBtdWNoIGZvciB0aGUgcmV2aWV3IQ0KT24gImNvbXBsZXRlIG5vcm1hbGx5IGFmdGVyIHJl
c3VtZSI6DQpUaGlzIHdvdWxkIGJlIHRydWUgb25seSBpZiB0aGUgcnVudGltZS1yZXN1bWUgcGF0
aCByZXByaW1lZCB0aGUgcGVuZGluZyBlbmRwb2ludHMuIEl0IGRvZXMgbm90LiBjaV9jb250cm9s
bGVyX3Jlc3VtZSgpIGNsZWFycyBQT1JUU0NfUEhDRCBhbmQgY2ktPmluX2xwbSwgcmVzdG9yaW5n
IHRoZSBQSFksIGJ1dCBpdCBwZXJmb3JtcyBubyBlbmRwb2ludCByZXByaW1pbmcuIFRoZSBURCB0
aGF0IHdhcyBlbnF1ZXVlZCBkdXJpbmcgdGhlIHN1c3BlbmRlZCB3aW5kb3cgaGFzIGl0cyBETUEg
bm9kZSBsaW5rZWQgaW4gaHdlcC0+cWgucXVldWUgYW5kIHRoZSBRSCdzIHRkLm5leHQgaXMgd3Jp
dHRlbiwgYnV0IHRoZSBPUF9FTkRQVFBSSU1FIHdyaXRlIGluc2lkZSBod19lcF9wcmltZSgpIHdh
cyBhIG5vLW9wIGFnYWluc3QgZ2F0ZWQgY2xvY2tzLiBBZnRlciByZXN1bWUgdGhlIGNvbnRyb2xs
ZXIgaGFzIG5vIGtub3dsZWRnZSBvZiB0aGF0IFREIOKAlCB0aGUgRU5EUFRQUklNRS9FTkRQVFNU
QVQgYml0cyBhcmUgY2xlYW4g4oCUIHNvIGl0IG5ldmVyIHByb2Nlc3NlcyBpdC4gVGhlIHJlcXVl
c3QgaXMgbm90IHBpY2tlZCB1cCBhdXRvbWF0aWNhbGx5Lg0KQSBzdWJzZXF1ZW50IHJlcXVlc3Qg
b24gdGhlIHNhbWUgZW5kcG9pbnQgd291bGQgYmUgYXBwZW5kZWQgdG8gdGhlIGV4aXN0aW5nIFRE
IGNoYWluIHZpYSB0aGUgIm5vbi1lbXB0eSBxdWV1ZSIgYnJhbmNoIG9mIF9oYXJkd2FyZV9lbnF1
ZXVlKCksIHdoaWNoIGRvZXMgbm90IGlzc3VlIGEgZnJlc2ggcHJpbWUgZWl0aGVyOyBpdCByZWxp
ZXMgb24gdGhlIGhhcmR3YXJlIGFscmVhZHkgYmVpbmcgYWN0aXZlIG9uIHRoYXQgZW5kcG9pbnQu
IFNpbmNlIHRoZSBmaXJzdCBwcmltZSB3YXMgbG9zdCwgdGhhdCBjaGFpbiBuZXZlciBiZWNvbWVz
IGFjdGl2ZS4NCg0KT24gImFibm9ybWFsbHkgYWZ0ZXIgcmVzZXQvZGlzY29ubmVjdC9zaHV0ZG93
biI6DQpDb3JyZWN0OiBfZ2FkZ2V0X3N0b3BfYWN0aXZpdHkoKSDihpIgX2VwX251a2UoKSB3b3Vs
ZCBkcmFpbiB0aGUgcXVldWVzLiBIb3dldmVyIHRoZSB0YXJnZXQgZGVwbG95bWVudCBpcyBhIGZp
eGVkIGVtYmVkZGVkIHRvcG9sb2d5OiB0aGUgVVNCIGNhYmxlIGlzIHBlcm1hbmVudGx5IHdpcmVk
IGJldHdlZW4gdGhlIGRldmljZSBhbmQgdGhlIGhvc3QsIG5vIHBoeXNpY2FsIGRpc2Nvbm5lY3Qg
b2NjdXJzLiBUaGUgZ2FkZ2V0IGZ1bmN0aW9uIGNhcnJpZXMgYSBjb250aW51b3VzIGRhdGEgc3Ry
ZWFtIChhIHRyYW5zcG9ydC1sYXllciBwcm90b2NvbCB0aGF0IGdlbmVyYXRlcyBiYWNrZ3JvdW5k
IHRyYWZmaWMg4oCUIGtlZXBhbGl2ZXMsIEFDS3Mg4oCUIGV2ZW4gZHVyaW5nIG90aGVyd2lzZS1p
ZGxlIHBlcmlvZHMpLiBJbiB0aGlzIGVudmlyb25tZW50IHJ1bnRpbWUgUE0gYXV0b3N1c3BlbmQg
ZmlyZXMgb24gdGhlIDItc2Vjb25kIGlkbGUgdGltZW91dCwgdGhlIGhvc3QgY29udGludWVzIHRv
IHRyaWdnZXIgdXBwZXItbGF5ZXIgc3VibWlzc2lvbnMsIGFuZCB0aGUgY29ubmVjdGlvbiBydW5z
IHVuaW50ZXJydXB0ZWQgZm9yIGhvdXJzLiBXaXRob3V0IGFuIGV4cGxpY2l0IGRpc2Nvbm5lY3Qg
b3IgcmVzZXQgdGhlcmUgaXMgbm8gbmF0dXJhbCBjbGVhbnVwIHBhdGgsIHNvIHRoZSBzdHJhbmRl
ZCByZXF1ZXN0cyBhY2N1bXVsYXRlIGZvciB0aGUgbGlmZXRpbWUgb2YgdGhlIHNlc3Npb24uDQpU
aGUgZml4IHJldHVybnMgLUVTSFVURE9XTiBpbW1lZGlhdGVseSwgd2hpY2ggaXMgdGhlIHNhbWUg
c3RhdHVzIF9lcF9udWtlKCkgc2V0cy4gVGhlIGNhbGxlciB0cmVhdHMgaXQgYXMgYSBjb21wbGV0
ZWQtd2l0aC1lcnJvciByZXF1ZXN0LCBmcmVlcyB0aGUgYnVmZmVyLCBhbmQgZG9lcyBub3QgcmUt
cXVldWUg4oCUIG1hdGNoaW5nIHRoZSBiZWhhdmlvdXIgdGhhdCB3b3VsZCBvY2N1ciBpZiB0aGUg
ZGV2aWNlIGhhZCBhY3R1YWxseSBkaXNjb25uZWN0ZWQuDQoNCkNvbmNyZXRlIGV4YW1wbGUg4oCU
IHVzYl9kaWFnX3dyaXRlKCkgdHJhbnNtaXQgcGF0aCBkdXJpbmcgYXV0b3N1c3BlbmQ6DQpUaGUg
ZGV2aWNlIGV4cG9zZXMgYSBVU0IgZGlhZ25vc3RpYyBpbnRlcmZhY2UgKGZfZGlhZykuIEEgZGlh
Z25vc3RpYyBzZXNzaW9uIGlzIHJ1bm5pbmcgYmV0d2VlbiB0aGUgZGV2aWNlJ3MgZGlhZ25vc3Rp
YyBkYWVtb24gYW5kIHRoZSBob3N0LXNpZGUgdG9vbC4gVGhlIGNvbnRyb2xsZXIgYXV0b3N1c3Bl
bmRzIGFmdGVyIDIgc2Vjb25kcyBvZiBpZGxlIGFjdGl2aXR5LiBTaG9ydGx5IGFmdGVyLCB0aGUg
ZGlhZ25vc3RpYyBjb3JlIGdlbmVyYXRlcyBhIGxvZyBwYWNrZXQg4oCUIGZvciBleGFtcGxlIGEg
cmVzcG9uc2UgdG8gYSBwZW5kaW5nIHJlcXVlc3Qg4oCUIGFuZCBjYWxscyB1c2JfZGlhZ193cml0
ZSgpLg0KVGhlIGNhbGwgc2VxdWVuY2UgaW5zaWRlIHVzYl9kaWFnX3dyaXRlKCkgaW4gZl9kaWFn
LmMgd2l0aG91dCB0aGUgcGF0Y2g6DQpjaV9ydW50aW1lX3N1c3BlbmQoKSBoYXMgYWxyZWFkeSBm
aXJlZDogUE9SVFNDX1BIQ0Qgc2V0LCBjaS0+aW5fbHBtID0gMSwgZ2FkZ2V0LnNwZWVkIHN0aWxs
IFVTQl9TUEVFRF9ISUdILg0KdXNiX2RpYWdfd3JpdGUoKSBjaGVja3MgIWN0eHQtPmNvbmZpZ3Vy
ZWQgfHwgIWN0eHQtPmluIOKAlCBib3RoIGFyZSB2YWxpZCBzaW5jZSB0aGUgZ2FkZ2V0IGRpZCBu
b3QgZGlzY29ubmVjdC4gUHJvY2VlZHMuDQpEZXF1ZXVlcyBhIHVzYl9yZXF1ZXN0IGZyb20gY3R4
dC0+d3JpdGVfcG9vbCwgc2V0cyByZXEtPmJ1ZiA9IGRfcmVxLT5idWYgYW5kIGNhbGxzIGtyZWZf
Z2V0KCZjdHh0LT5rcmVmKS4NCmN0eHQtPmRwa3RzX3RvbGFwdG9wX3BlbmRpbmcrKyDigJQgcGVu
ZGluZyBjb3VudGVyIGluY3JlbWVudGVkLg0KdXNiX2VwX3F1ZXVlKGluLCByZXEsIEdGUF9BVE9N
SUMpIOKGkiBlcF9xdWV1ZSgpIOKGkiBfZXBfcXVldWUoKSDihpIgX2hhcmR3YXJlX2VucXVldWUo
KS4gaHdfZXBfcHJpbWUoKSB3cml0ZXMgRU5EUFRQUklNRSBhZ2FpbnN0IGdhdGVkIGNsb2NrcyDi
gJQgbm8tb3AuIFJldHVybnMgMC4NCnVzYl9lcF9xdWV1ZSByZXR1cm5zIDAuIFRoZSBlcnJvci1y
ZWNvdmVyeSBicmFuY2ggKGxpc3RfYWRkX3RhaWwgYmFjayB0byB3cml0ZV9wb29sLCBkcGt0c190
b2xhcHRvcF9wZW5kaW5nLS0sIGtyZWZfcHV0KSBpcyBub3QgdGFrZW4uIHVzYl9kaWFnX3dyaXRl
KCkgcmV0dXJucyAwLg0KVGhlIGNvbXBsZXRlIGNhbGxiYWNrIChkaWFnX3dyaXRlX2NvbXBsZXRl
KSBuZXZlciBmaXJlcyBiZWNhdXNlIHRoZSBoYXJkd2FyZSBuZXZlciBwcm9jZXNzZWQgdGhlIFRE
LiBDb25zZXF1ZW5jZXM6DQpyZXEgaXMgcGVybWFuZW50bHkgcmVtb3ZlZCBmcm9tIHdyaXRlX3Bv
b2wuIEFmdGVyIGEgaGFuZGZ1bCBvZiBhdXRvc3VzcGVuZCBjeWNsZXMsIHdyaXRlX3Bvb2wgaXMg
ZXhoYXVzdGVkIGFuZCBldmVyeSBzdWJzZXF1ZW50IHVzYl9kaWFnX3dyaXRlKCkgcmV0dXJucyAt
RUFHQUlOLg0Ka3JlZl9nZXQgY2FsbGVkIGJ1dCBrcmVmX3B1dCBpbiB0aGUgY29tcGxldGUgY2Fs
bGJhY2sgbmV2ZXIgY2FsbGVkIOKAlCBkaWFnX2NvbnRleHQgcmVmZXJlbmNlIGNvdW50IGlzIHVu
YmFsYW5jZWQuDQpkcGt0c190b2xhcHRvcF9wZW5kaW5nIGlzIHBlcm1hbmVudGx5IGluY3JlbWVu
dGVkIOKAlCBjb3VudGVyIGRyaWZ0cy4NCmRfcmVxLT5idWYgKHRoZSBkaWFnbm9zdGljIGJ1ZmZl
ciBhbGxvY2F0ZWQgYnkgdGhlIGRpYWcgY29yZSkgaXMgbmV2ZXIgcmV0dXJuZWQgdmlhIHRoZSBj
b21wbGV0aW9uIGNhbGxiYWNrIOKAlCB0aGUgZGlhZyBjb3JlJ3MgYnVmZmVyIHBvb2wgZHJhaW5z
Lg0KVGhlIGRpYWdub3N0aWMgc2Vzc2lvbiBzdGFsbHMgc2lsZW50bHk6IHRoZSBob3N0IHRvb2wg
c3RvcHMgcmVjZWl2aW5nIHJlc3BvbnNlcywgd2l0aCBubyBlcnJvciBpbmRpY2F0aW9uIG9uIGVp
dGhlciBzaWRlLg0KDQpXaXRoIHRoZSBwYXRjaCwgc3RlcCA1IHJldHVybnMgLUVTSFVURE9XTiBp
bnN0ZWFkIG9mIDAuIFRoZSBlcnJvciBwYXRoIGluIHVzYl9kaWFnX3dyaXRlKCkgZXhlY3V0ZXM6
IHJlcSBpcyByZXR1cm5lZCB0byB3cml0ZV9wb29sLCBkcGt0c190b2xhcHRvcF9wZW5kaW5nIGlz
IGRlY3JlbWVudGVkLCBrcmVmX3B1dCBpcyBjYWxsZWQsIGFuZCAtRUlPIGlzIHJldHVybmVkIHRv
IHRoZSBkaWFnIGNvcmUuIFRoZSBkaWFnIGNvcmUgY2FuIHJldHJ5IHRoZSB3cml0ZSBhZnRlciBy
dW50aW1lIHJlc3VtZSwgd3JpdGVfcG9vbCByZW1haW5zIGludGFjdCwgYW5kIHRoZSBkaWFnbm9z
dGljIHNlc3Npb24gc3Vydml2ZXMgdGhlIGF1dG9zdXNwZW5kIGN5Y2xlLg0KDQoNCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRGUgbGE6IEFsYW4gU3Rlcm4gPHN0
ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHU+DQpUcmltaXM6IG1hcsibaSwgMzEgbWFydGllIDIwMjYg
MTg6MzkNCkPEg3RyZTogUG9wZXNjdSwgQW5kcmVlYQ0KQ2M6IFBldGVyIENoZW47IEdyZWcgS3Jv
YWgtSGFydG1hbjsgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZw0KU3ViaWVjdDogUmU6IFtQQVRDSF0gdXNiOiBjaGlwaWRlYTogdWRjOiByZWpl
Y3Qgbm9uLWNvbnRyb2wgcmVxdWVzdHMgd2hpbGUgY29udHJvbGxlciBpcyBzdXNwZW5kZWQNCg0K
Q0FVVElPTjogVGhpcyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gRG8gbm90IGNsaWNrIG9yIG9wZW4g
YW55IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cg
dGhhdCB0aGUgY29udGVudCBpcyBzYWZlLiAoaHR0cDovL2xpbmtzLmF1bW92aW8taW50ZXJuYWwu
Y29tL21haWxjaGVjaykNCg0KDQpPbiBUdWUsIE1hciAzMSwgMjAyNiBhdCAxMjoyMTo0NVBNICsw
MDAwLCBBbmRyZWVhLlBvcGVzY3VAYXVtb3Zpby5jb20gd3JvdGU6DQo+IFdoZW4gTGludXggcnVu
dGltZSBQTSBhdXRvc3VzcGVuZHMgYSBDaGlwSWRlYSBVREMgdGhhdCBpcyBzdGlsbA0KPiBlbnVt
ZXJhdGVkIGJ5IHRoZSBob3N0LCB0aGUgZHJpdmVyIGdhdGVzIHRoZSBQSFkgY2xvY2tzIGFuZCBt
YXJrcw0KPiB0aGUgY29udHJvbGxlciBhcyBzdXNwZW5kZWQgKGNpLT5pbl9scG0gPSAxKSBidXQg
ZGVsaWJlcmF0ZWx5IGxlYXZlcw0KPiBnYWRnZXQuc3BlZWQgdW5jaGFuZ2VkIHNvIHVwcGVyLWxh
eWVyIGdhZGdldCBkcml2ZXJzIGRvIG5vdCBzZWUgYQ0KPiBzcHVyaW91cyBkaXNjb25uZWN0Lg0K
Pg0KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRob3NlIHNhbWUgZHJpdmVycyBtYXkgY29udGludWUg
dG8gY2FsbA0KPiB1c2JfZXBfcXVldWUoKSBkdXJpbmcgdGhlIGF1dG9zdXNwZW5kIHdpbmRvdy4g
IF9oYXJkd2FyZV9lbnF1ZXVlKCkNCj4gc2lsZW50bHkgYWRkcyB0aGUgcmVxdWVzdCB0byB0aGUg
ZW5kcG9pbnQgcXVldWUgYW5kIHJldHVybnMgMCwgYnV0DQo+IGh3X2VwX3ByaW1lKCkgY2Fubm90
IHN1Y2NlZWQgd2l0aCBnYXRlZCBjbG9ja3MsIHNvIHRoZSBjb21wbGV0aW9uDQo+IGludGVycnVw
dCBuZXZlciBmaXJlcy4gIFRoZSByZXF1ZXN0IOKAlCBhbmQgaXRzIGJhY2tpbmcgYnVmZmVyIOKA
lCBpcw0KPiBwZXJtYW5lbnRseSBsb3N0LiAgVGhlIGNhbGxlciBzZWVzIGEgc3VjY2Vzc2Z1bCBy
ZXR1cm4gYW5kIG5ldmVyDQo+IGZyZWVzIHRoZSBidWZmZXIuDQoNCldvbid0IHRoZSByZXF1ZXN0
IGNvbXBsZXRlIG5vcm1hbGx5IGFmdGVyIHRoZSBnYWRnZXQgaXMgcmVzdW1lZCwgb3INCmFibm9y
bWFsbHkgYWZ0ZXIgYSByZXNldCwgZGlzY29ubmVjdCwgb3Igc2h1dGRvd24/ICBFaXRoZXIgd2F5
LCBpdA0Kd291bGRuJ3QgYmUgbG9zdCBwZXJtYW5lbnRseS4NCg0KQWxhbiBTdGVybg0K

