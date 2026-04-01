Return-Path: <linux-usb+bounces-35775-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGKrCr34zGnRYgYAu9opvQ
	(envelope-from <linux-usb+bounces-35775-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 12:51:41 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEF4378CEF
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 12:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 300713063209
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 10:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBE23F20F3;
	Wed,  1 Apr 2026 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aumovio.com header.i=@aumovio.com header.b="pK+w4mrP"
X-Original-To: linux-usb@vger.kernel.org
Received: from BEUP281CU002.outbound.protection.outlook.com (mail-germanynorthazon11010008.outbound.protection.outlook.com [52.101.169.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08EB35E930;
	Wed,  1 Apr 2026 10:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.169.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775040478; cv=fail; b=A6zhdiGRKUR44jx7gKME5BBozzSNzeljKZhM+rZHNUn3EseyooUVq4Z763oT6DcGpFtaM8RwYDQQswbBAzL8fjtJwwTlgZ/Ywjwrg+twYrPhhK3RjH4wAt9pLnXsczpEtBjOAVOubY26WHD5FxGxTF6yDeUP7IzVjYwQNFY9XHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775040478; c=relaxed/simple;
	bh=v/Y8JkAAnfisSWgC8XR2/Gwqh6Sus/OP4mb9C5UTDKo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hqHbwMZXqCXBromTTb7zVD6u24b+gsDfdOA/IjXv998+32XlEu9bgtT4Z6k9knic5/BJO2JVbcMqRdjhsp495Rzis5eHZG971KnPwntro+IXKIfmQnG5HFklK3HUzXgDljMDO2kiHjnItwVQXYbHkvX8sR45VeObiph23kZAVts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aumovio.com; spf=pass smtp.mailfrom=aumovio.com; dkim=pass (2048-bit key) header.d=aumovio.com header.i=@aumovio.com header.b=pK+w4mrP; arc=fail smtp.client-ip=52.101.169.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aumovio.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aumovio.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=clgYi2mUjR/uyb5JLHhkUJBMgFSz80ZUS8Iml49mr2VJgMJi+iQZEbdQ2tBhxogTP6yZarL94k4gST9iI4O3fJb1Xn0r9c77V67iZAsouXo36eNv8UNoEuo8ZC9aVBfRgRdUGOAV2DZu+XUQIIjrOtev7fw+76y/kceNxio7S/JxfBMgGQRFPAAmTUhWoJeL0kelEbKLlibDJiI+23prq4yQi7IjuxRQluG/hv0ec4ZuszMia3kOK4ZGl1foMKK3dIdZVZ+6v74wSVxEd/w0C7oi2tgWET3ll6ZRLbdzpk7AHjxMjddlNgEnuJYUQjI1/+haYdAsnJ0cjWKd+CSAsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/Y8JkAAnfisSWgC8XR2/Gwqh6Sus/OP4mb9C5UTDKo=;
 b=v2SSvG10R0LI1LmVwMYSGJ7x+q2LD646KEhl6jp/rAbhSz62BG2y1F7hVBQmPjDhL0YHp8INp/COiK/xVYcK6TehPSHsk7zW42QIG/sj4R1lhJeqYxa3ZcDTO6ahOXYYRuHS41unuHq1bBEmPnhHL6aM3a2DWrB3zbahhzf9KGCmmZL4F/kdsd0CcuImi6QQjwIefgA1kEvywaVgKpDtBZGQO8UCsUg7RHUIY0BdXPsHcpeNpcCPmT5BoKm4/6zglhrOx1r4ZMae7TC2+SzxwgDqDFoWxm0Ggmo6qiFYOiWU28rT0HMH7vStdCmty8mrv5xg7SewtaBwTo3QGlMl3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aumovio.com; dmarc=pass action=none header.from=aumovio.com;
 dkim=pass header.d=aumovio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aumovio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/Y8JkAAnfisSWgC8XR2/Gwqh6Sus/OP4mb9C5UTDKo=;
 b=pK+w4mrPL+ioHpCfXGHjsn4itRO7m73FtIMl/ACtFLtTLvcEQFazE9/6plaWouJUdGZP83FY4IbEGkt6a+q48e5qkvnj8mZ0nicPhb7duE/YJZOEL51p7sBj/ZcKOTvXs4zFMIIn+1s8es40AVWOal6SvPF2kmjztro81rHDp00oyfFFx3KIrGyWCXzWuRD/uMUHJBvko9yE+f7uInDO/r8PXiD/vi6vEGijNcbCMaMNSDw5u5AXrhDoNCc2weglPLaaiZwLm0h92Vgu54l69ZwWGrxD33vWStdKj9MExPOpiBqh2Wd8nR6Ik2yItlJ10qhzT4o904nvkBdqbrzEtQ==
Received: from FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:41::9) by
 FR6P281MB5818.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1bf::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Wed, 1 Apr 2026 10:47:54 +0000
Received: from FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e8ba:f0dd:af7a:ede8]) by FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM
 ([fe80::e8ba:f0dd:af7a:ede8%5]) with mapi id 15.20.9769.016; Wed, 1 Apr 2026
 10:47:54 +0000
From: "Andreea.Popescu@aumovio.com" <Andreea.Popescu@aumovio.com>
To: Xu Yang <xu.yang_2@nxp.com>
CC: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: chipidea: udc: reject non-control requests while
 controller is suspended
Thread-Topic: [PATCH] usb: chipidea: udc: reject non-control requests while
 controller is suspended
Thread-Index: AQHcwQg5wVeiN+sx6EGbnG0btBxBJbXJ310AgAAmhcA=
Date: Wed, 1 Apr 2026 10:47:54 +0000
Message-ID:
 <FRYP281MB2618B5E8484BD399A6B3085AEA50A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
References:
 <FRYP281MB261885D9851351180B1EC037EA53A@FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM>
 <yel7zijkcua3cdn646fadp2pebatkbt4vracrpsbcdtmpahzxn@dhiapuctxbfe>
In-Reply-To: <yel7zijkcua3cdn646fadp2pebatkbt4vracrpsbcdtmpahzxn@dhiapuctxbfe>
Accept-Language: ro-RO, en-US
Content-Language: ro-RO
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_Enabled=True;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_SiteId=3bd97919-57c3-48d3-9e9a-8e4c01614a8f;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_SetDate=2026-04-01T10:47:53.345Z;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_Name=Recipients
 Have Full
 Control;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_ContentBits=1;MSIP_Label_7e753c2c-bb14-4786-921b-97c6a6fc424f_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aumovio.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRYP281MB2618:EE_|FR6P281MB5818:EE_
x-ms-office365-filtering-correlation-id: e7251e02-9e5c-4fc6-6c8f-08de8fdc210f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 dSR/SUVxnHSdeZb94c/mWXdjU6ZDOzBJd1uBongUOQ4EDtxBI1NVhkDRwHDumIoptepgID28dfjtEPBvNSQP2cK3SATpv0WGZkKMj3BS7d9Q+QnpRerWfmalRyJPZ6exfjrFyxOlUXXeCMLYJ8ESSUMeecBn2AZYbDE5SzHlmVephbzQorQxj2CxJcWBgwxjGYwOG6VFDfVr52mz4/66vuJ69TpkiKUJQHbpmom4VuOT58DIAEI9vkj99Vi6eO+QImouWvjYdr+RwdXsuPIXhQfjiYEVasQQuRw4rhU19E6C6hbqxJts68xwpi9d/1/uUqELQb079lrTvvV8UC61qoWtHa+poCjg1sV0lfNudWLc4MnJVGdvpP6NwEzHxgiB0y3p0M+o2PqTzRbhWgPKiRqSA+WPtbg0fFdIaWE1cTIG1WeK537a9v2sjRY2h8fULopICgjQwn7ekcF1E9QNzVbvJSXJvE7g+TLyx1NpLzRkJdP5yCfw+XsbUM/NveovR6kBmljfaz0u29yXvYws7qXJQGm0AaLvG6AQiqhZLtB0Mwv92PzP4o27K2rTD0/hT8TmpwCq/VjU5hpJDfJa02587bXg+uSDFd6f6VTWxZ9/DZBW3/fJmajud42V7jyK9ly/TtVi2zueZX2FmZ5FdnsoXby0ZlizR9tZTUPZQn/5Zrk3Mlzo8USp+Axn4xSOw9CS61r5yNdVz7kvTaq+CvO1NGLkQuhJn9GyMge17PdL27FqjcimCbI/xqGPW+BgJ4c508olKlyxLYWJGIXACXC5wjjBXMuUrmKWB3odk8M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRYP281MB2618.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eGF0c3Vzb3dIU255bklqTlBVSzFuV0tEQ00zRlFKU1dCc1BKaEtoVUpEN3ZE?=
 =?utf-8?B?RXRjZjhMY25GYnBHelhvNE1GeWU0VFFDS1liMDNKN0hIQXgrb2FhdVdNT1Nv?=
 =?utf-8?B?SWpGTk1OSGRwdU9SK0JaUG9PRzNlS3QrRXdtelhiQW4xeERKOHlJYjUyQW5p?=
 =?utf-8?B?U1BtQ0N3WWUzaVRGR2xuRGRIQjFCM1NndkVpSHQ3ZGdPV3FMMW5TUEJmYzh1?=
 =?utf-8?B?K2xDRDJmaVhDZTcvcGhVVWhtdFFrQXhqTFhWb1BzYytJRVBWQkFkL1lQL3VW?=
 =?utf-8?B?cmtrYlZLcytnNEdPU0htU2tWbUVLV3J6SnAyOXRxaldZK0JETUJCV3diSGNB?=
 =?utf-8?B?WkNNTzd1d0dLdVJYSXFsQ3lhaHl1NE9MNVMzUS93SktGcUZDdFo5SEdnbWxF?=
 =?utf-8?B?R3NOTXpTK0hHcmp0RmFCaTVpN2cwcVZuVzVyZ3BXZnVCN3NTSVBqSlpFZFhI?=
 =?utf-8?B?OVU3TURyMm4wTGxtTVc4SVlRYkJIVHRVdmNFTGlrYjBReG1UeFNSVEpWZENU?=
 =?utf-8?B?by9RQ1UvY3VaRGhZdkhTWk1PTlhVdEhUNElxdmhJQlUrclpXc1FOV1R5WVhw?=
 =?utf-8?B?ZW9wT2p2aUJnNnJKUWw4ZktMT1U3YklOTFEyMnNnVWpLemVNQ1ZwU1o3cXNM?=
 =?utf-8?B?d0NWblYzc3B6TjZ2clZLNlFDb0FnZ1YzQXFDRG1yMkNJSXdUY1RCdHlLYVRS?=
 =?utf-8?B?UTB4N003Q2tzUHBVVCt0MHh0UG5oUVRVV2hsSXNaYmZWRVVoOEs0bWFOQU8r?=
 =?utf-8?B?QWxrUWd5dDh0Z1BrVllBdnBaeVhwcTNHaEtNcWxlUTd4Y1kyeGFGcGtMaExC?=
 =?utf-8?B?cjFad08yUHA1WnBDaDhQT21SWk15dU10VEE3VWVvVG1LTzlLcEdwaFN4WkhV?=
 =?utf-8?B?Smg0UXhweVM3QjdJbUJqQkcyTm1kdDcwajVKemF3c0RxbXZ3SnlQT2VoVUx4?=
 =?utf-8?B?SFRzQTFKaVZnU0V2eTcvTk85OGJXMkdwNGN4YVJ6ckM2RWNBWlpTakRMYTRC?=
 =?utf-8?B?V29VaHUwc0ExNDhGV3lwczFET3JzcXEyT0o3b1BWQ3NnaGhUSHVub1dNaFQ5?=
 =?utf-8?B?QjMyaHNPQ0c3Y0lOV2lBMFREd3FISmJMVEFJUlFaOGZObjU2alZZakIyRGNG?=
 =?utf-8?B?MmlWRWtEbVdlUWdqZDZHZk1NVkJBVG50eXlIYUNvYlNWS0ZBczM0Q1hZMDFQ?=
 =?utf-8?B?YVYzR2JKVUptQTVBWHk1aXlzZXFlb3V1SEJjdGx6Z3VzL1J6b2dzcHFKUXhk?=
 =?utf-8?B?U1lObHkxT3FxQjZMQ3NhRmxibktFdzFjYzVVakF2Q1c1dUJRSzFpMTMrSkw4?=
 =?utf-8?B?R20wV1k1SGc3T2pqTW1oQ3NMZnZHMFlVbjJSNG1XdG9CMEVVYnZLQUhTYWIr?=
 =?utf-8?B?K2lpcUtzSURyNnYwUTVlRXYrRGkycldFSmJXZ0NFVThYMUFxTjdrTklneVFq?=
 =?utf-8?B?b0YzeEVkbUlMOENDczJ0bjBJMGkvYnpBaU5hUDRtd3NMQlcwbm9mS3JITm9j?=
 =?utf-8?B?T3RiUFYyd25RTkpxQ3BJd0FZLzFtMHdCMCtCNmdJU0ZmcWt5cjQ3ZDhDRXVq?=
 =?utf-8?B?RkMzSWhQbzUvK1dqenRZb0plZjBneEQ2azYrYlFHdE1PSzFLOUNBM0tOTXVY?=
 =?utf-8?B?a09yTGNVTm50OFgrcG9ldFlKWk00alFuVkI3eXQwQVd3Yjd3QW9wdyszcWtk?=
 =?utf-8?B?b1Fybnd1Q25NWWliS3BzSWM4ZEQrcXk5V09BQWxBbDRMYU1XUmMzMHJ2K0FO?=
 =?utf-8?B?djNRVURjNzV1MDhaZ0dsWXR1bTh6ZE1UWTB2SDBiR2JTSU9WMUZXSjRESmIz?=
 =?utf-8?B?SlNsdHVGNlNuUHpWOUN0ZVhnT1NhU2puMy9UdEpxczBIa1pTNmQzaTVteTRN?=
 =?utf-8?B?QXlOQ0Zpci9zVzRnNUViSlRHa3I5S0UxL0doRDNOMThIbmFwb1VjWGpWRWdk?=
 =?utf-8?B?b2dwOUdOS1B4TU5zNVV2dEVkcmRNK2M5d0lDeE1NUmlEc01OVVpjdmJlZHl3?=
 =?utf-8?B?Ym5tYjlQWnBrMHJTVlJzY3FnWlpzN1J1dm5kM21HMTltc3VFVEl0Y21jMCtL?=
 =?utf-8?B?MmNCV1E1UTFvRGhSL1FiT3lCRW9nYkFLOWxHZHo1S0JqNDFTOGlvRlg5OTV0?=
 =?utf-8?B?N21zVWpUN2U2Zi9BVHNoZnVuKzN2ZjNxZ3FnZE9SQXJmMzFBKzlQREg2b01S?=
 =?utf-8?B?ejdheG1aeW1Lb0dSMkZTN2FGc01tNWdydXJkeXEvbWV0Z0RRY2tkUUIvamQ5?=
 =?utf-8?B?TnpsMkFmNStxTlFsbVRVN1J4TWNuYVBVU2JQRW1GclBHYzJvOVJtRFRDaHdx?=
 =?utf-8?B?dUJ5OENYaEh1WVk4dTljb3djekJZd3AzU1FsWTg0ZU5jUndWam1TUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e7251e02-9e5c-4fc6-6c8f-08de8fdc210f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 10:47:54.2796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bd97919-57c3-48d3-9e9a-8e4c01614a8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EIjipgGrZkO6cZnVYFTFymX3ac+ngQB8GAZ84IDBTtL6UmzAMMKRs2xKwn0zFclrhxs8/9FnPXfD/2CtXei2LHqZ+68t1sCb+b1LqAGwPe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB5818
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	FROM_DN_EQ_ADDR(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[aumovio.com,quarantine];
	R_DKIM_ALLOW(-0.20)[aumovio.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35775-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:email,aumovio.com:dkim,aumovio.com:email]
X-Rspamd-Queue-Id: BCEF4378CEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBNYXIgMzEsIDIwMjYgYXQgMTI6MjE6NDVQTSArMDAwMCwgQW5kcmVlYS5Qb3Blc2N1
QGF1bW92aW8uY29tIHdyb3RlOg0KPj4gV2hlbiBMaW51eCBydW50aW1lIFBNIGF1dG9zdXNwZW5k
cyBhIENoaXBJZGVhIFVEQyB0aGF0IGlzIHN0aWxsDQo+PiBlbnVtZXJhdGVkIGJ5IHRoZSBob3N0
LCB0aGUgZHJpdmVyIGdhdGVzIHRoZSBQSFkgY2xvY2tzIGFuZCBtYXJrcw0KPj4gdGhlIGNvbnRy
b2xsZXIgYXMgc3VzcGVuZGVkIChjaS0+aW5fbHBtID0gMSkgYnV0IGRlbGliZXJhdGVseSBsZWF2
ZXMNCj4+IGdhZGdldC5zcGVlZCB1bmNoYW5nZWQgc28gdXBwZXItbGF5ZXIgZ2FkZ2V0IGRyaXZl
cnMgZG8gbm90IHNlZSBhDQo+PiBzcHVyaW91cyBkaXNjb25uZWN0Lg0KPg0KPkl0J3Mgc3RyYW5n
ZSB0aGF0IGNoaXBpZGVhIFVEQyB3aWxsIHJ1bnRpbWUgc3VzcGVuZCBldmVuIGl0J3MgYWxyZWFk
eQ0KPmVudW1lcmF0ZWQgYnkgdGhlIGhvc3QuIEFGQUlLLCB0aGUgdWRjIGRyaXZlciB3aWxsIGNh
bGwgcG1fcnVudGltZV9nZXRfc3luYygpDQo+aW4gY2lfaGRyY19nYWRnZXRfY29ubmVjdChpc19h
Y3RpdmUgPSB0cnVlKSwgc28gaXQgd2lsbCBiZSBpbiBydW50aW1lIGFjdGl2ZQ0KPnN0YXRlIGFs
bCB0aGUgdGltZSB1bmxlc3MgYSBleHBsaWNpdCBwbV9ydW50aW1lX3B1dC9fYXV0b3N1c3BlbmQo
KSBpcyBjYWxsZWQNCj5pbiBzb21ld2hlcmUuDQo+DQo+V291bGQgeW91IHNoYXJlIG1vcmUgZGV0
YWlscyBob3cgZGV2aWNlIGNvbnRyb2xsZXIgZ28gdG8gcnVudGltZSBzdXNwZW5kZWQ/DQo+VGhh
bmtzLA0KPlh1IFlhbmcNClRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHRha2luZyB0aGUgdGltZSBh
bmQgcG9pbnRpbmcgdGhpcy4gSXQgbWFkZSBtZSByZWFsaXplIGEgdmVyeSBpbXBvcnRhbnQgZGlz
dGluY3Rpb24uIEkgYW0gdXNpbmcgYW4gSS5NWCBib2FyZCwgZHVlIHRvIHRoaXMgSSB3aWxsIHNw
bGl0IG15IGFuc3dlciwgc28geW91IGNhbiBkZWNpZGUgaWYgaXQncyBzdGlsbCB3b3J0aCB3aGF0
IEkgYW0gcHJvcG9zaW5nIG9yIHlvdSBjYW4ganVzdCByZWplY3QgaXQuIEVpdGhlciB3YXksIEkg
YW0gbW9zdCBncmF0ZWZ1bC4NClN0aWxsIGFwcGxpY2FibGUgdG8gNi4xOSBtYWlubGluZToNCmVw
X3F1ZXVlIHJldHVybmluZyAwIGZvciBVU0JfU1BFRURfVU5LTk9XTjogSSBiZWxpZXZlIHRoZXJl
IG1pZ2h0IGJlIHRoZSBmb2xsb3dpbmcgd2luZG93OiBfZ2FkZ2V0X3N0b3BfYWN0aXZpdHkoKSBz
ZXRzIGdhZGdldC5zcGVlZCA9IFVTQl9TUEVFRF9VTktOT1dOLCBidXQgZXBfcXVldWUgaXMgY2Fs
bGVkIGJlZm9yZSB0aGF0IGNvbXBsZXRlcyBmcm9tIGEgY29uY3VycmVudCBjb250ZXh0LiBUaGUg
cmV0dXJuIDAgaXMgbWlzbGVhZGluZyBhbmQgc2hvdWxkIGJlIC1FU0hVVERPV04uDQpJLk1YIHNw
ZWNpZmljOiBPbiBpLk1YIFNvQ3MgdGhlIGNoaXBpZGVhIGNvbnRyb2xsZXIgc2l0cyBpbnNpZGUg
YSBwb3dlciBkb21haW4gbWFuYWdlZCBieSBpbXgtYmxrLWN0cmwgb3IgdGhlIEdQQy4gV2hlbiB0
aGF0IHBhcmVudCBkb21haW4gaXMgc2h1dCBkb3duIGJ5IHRoZSBwbGF0Zm9ybSBQTSBmcmFtZXdv
cmssIHBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCgpIGlzIGNhbGxlZCBvbiB0aGUgY2hpcGlkZWEg
ZGV2aWNlLCBieXBhc3NpbmcgdXNhZ2VfY291bnQgZW50aXJlbHkgYW5kIGludm9raW5nIGNpX3J1
bnRpbWVfc3VzcGVuZCDihpIgY2lfY29udHJvbGxlcl9zdXNwZW5kIOKGkiBjaS0+aW5fbHBtID0g
dHJ1ZS4gVGhpcyBoYXBwZW5zIHdoaWxlIFZCVVMgaXMgc3RpbGwgcHJlc2VudCBhbmQgdGhlIGdh
ZGdldCBpcyBlbnVtZXJhdGVkLiBUaGlzIGlzIHRoZSBhY3R1YWwgcGF0aCBJIG9ic2VydmVkIGFu
ZCBpdCBpcyBwbGF0Zm9ybS1zcGVjaWZpYywgbm90IGEgZ2VuZXJhbCBjaGlwaWRlYSBtYWlubGlu
ZSBpc3N1ZS4gRHVlIHRvIHRoaXMsIHBsZWFzZSBkaXNyZWdhcmQgdGhlIHByb3Bvc2VkIGNoYW5n
ZSB3aXRoIF9lcF9xdWV1ZSBndWFyZCBvbiBjaS0+aW5fbHBtDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCkRlIGxhOiBYdSBZYW5nIDx4dS55YW5nXzJAbnhwLmNv
bT4NClRyaW1pczogbWllcmN1cmksIDEgYXByaWxpZSAyMDI2IDExOjIyDQpDxIN0cmU6IFBvcGVz
Y3UsIEFuZHJlZWENCkNjOiBQZXRlciBDaGVuOyBHcmVnIEtyb2FoLUhhcnRtYW47IGxpbnV4LXVz
YkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1YmllY3Q6
IFJlOiBbUEFUQ0hdIHVzYjogY2hpcGlkZWE6IHVkYzogcmVqZWN0IG5vbi1jb250cm9sIHJlcXVl
c3RzIHdoaWxlIGNvbnRyb2xsZXIgaXMgc3VzcGVuZGVkDQoNCk9uIFR1ZSwgTWFyIDMxLCAyMDI2
IGF0IDEyOjIxOjQ1UE0gKzAwMDAsIEFuZHJlZWEuUG9wZXNjdUBhdW1vdmlvLmNvbSB3cm90ZToN
Cj4gV2hlbiBMaW51eCBydW50aW1lIFBNIGF1dG9zdXNwZW5kcyBhIENoaXBJZGVhIFVEQyB0aGF0
IGlzIHN0aWxsDQo+IGVudW1lcmF0ZWQgYnkgdGhlIGhvc3QsIHRoZSBkcml2ZXIgZ2F0ZXMgdGhl
IFBIWSBjbG9ja3MgYW5kIG1hcmtzDQo+IHRoZSBjb250cm9sbGVyIGFzIHN1c3BlbmRlZCAoY2kt
PmluX2xwbSA9IDEpIGJ1dCBkZWxpYmVyYXRlbHkgbGVhdmVzDQo+IGdhZGdldC5zcGVlZCB1bmNo
YW5nZWQgc28gdXBwZXItbGF5ZXIgZ2FkZ2V0IGRyaXZlcnMgZG8gbm90IHNlZSBhDQo+IHNwdXJp
b3VzIGRpc2Nvbm5lY3QuDQoNCkl0J3Mgc3RyYW5nZSB0aGF0IGNoaXBpZGVhIFVEQyB3aWxsIHJ1
bnRpbWUgc3VzcGVuZCBldmVuIGl0J3MgYWxyZWFkeQ0KZW51bWVyYXRlZCBieSB0aGUgaG9zdC4g
QUZBSUssIHRoZSB1ZGMgZHJpdmVyIHdpbGwgY2FsbCBwbV9ydW50aW1lX2dldF9zeW5jKCkNCmlu
IGNpX2hkcmNfZ2FkZ2V0X2Nvbm5lY3QoaXNfYWN0aXZlID0gdHJ1ZSksIHNvIGl0IHdpbGwgYmUg
aW4gcnVudGltZSBhY3RpdmUNCnN0YXRlIGFsbCB0aGUgdGltZSB1bmxlc3MgYSBleHBsaWNpdCBw
bV9ydW50aW1lX3B1dC9fYXV0b3N1c3BlbmQoKSBpcyBjYWxsZWQNCmluIHNvbWV3aGVyZS4NCg0K
V291bGQgeW91IHNoYXJlIG1vcmUgZGV0YWlscyBob3cgZGV2aWNlIGNvbnRyb2xsZXIgZ28gdG8g
cnVudGltZSBzdXNwZW5kZWQ/DQoNClRoYW5rcywNClh1IFlhbmcNCg==

