Return-Path: <linux-usb+bounces-35514-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCXjNidHxWkU8wQAu9opvQ
	(envelope-from <linux-usb+bounces-35514-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 15:48:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F0E33700C
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 15:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4DD330A84A7
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 14:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4DD3FF8A7;
	Thu, 26 Mar 2026 14:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Vsp3XGSi"
X-Original-To: linux-usb@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazolkn19012066.outbound.protection.outlook.com [52.103.14.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919673FF89B;
	Thu, 26 Mar 2026 14:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.14.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535868; cv=fail; b=CF0JAcx4cQ6Wfi7lkV21ie/+iV0xONRqKrYrUu4AwRQAxACwTKUq0apJNFMgaUAflobGi28a/c01+IgqvOSr0TwcZH0qDsdXkBjrsbPRxarJOPfTI8WWhF2KVarWe6VuwV8Vcmli/RPMLfXJyr/CrgyVj1w/sN6NgkwcHV9wRZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535868; c=relaxed/simple;
	bh=CHGEBJKSDvnjNNBjnEoCAp9lyVUPrPSqhsAuTb5PrH4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VWUOKRtMvOzeo+0Fp9tJjmZU/PkAtQXq3wU1n3nXz74IQ8bTSy2ke6BJvtllgoy27S5QrIVtlERNzHyAb9h7Qb9GQVJ7IeForPBnpczlJ52iBX/FYo0x1tHV192VO+EEFPOq9Tdj6m1GQWtdAyG0A8sNWvAkdHT996iY6ArX91E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Vsp3XGSi; arc=fail smtp.client-ip=52.103.14.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pF/LG5n2N5/gB4GvqgBh1eYPJrGR5j9m3oZejmon/B90Eypzsa6B9Dh+2w39Xtqoa21cUa2qHILhzvFjKUB5Uw85Q2+KjPwS9Bg5kUKkMkQSkPGXD/SHG7GNk5cA88ofuQ4ABfKU1KV72hQ8YC0yZsyhj6Qa9ennBUOgVsBbQTSGvPVKjfxuFEj3MUUO0FWXPOXBFXVgfzFY5BORt9y7jlawg0vStE6utoY5BKfjpLVwI4sGHXUtXcO/K53qMTpXHU9oenfyx4m/yopYVOdpu+4VjYSa8igajYzmHdBMRU8NbZxthBf7EW8uiETNjp8ns9jNc/1aFIU9LdtA8z6O0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wrjshMc9XOnXIdijcesginwmGDY+hkSxIYAFmWGN28=;
 b=S5PoHN9cOaDqfq3cYiENho9Mt9jxhgg3HZLnE/VDcEkdm4nllYZ48mR8bi/nDlOwzRR2u2gPwoedySqThcN+mYsRIu2e1rqoCB0JA05WqTCVYx3wlCnf3Rg4D8vLrsNYcQTRtVqnakFwl4u/HitK8un10UYtEfR2YHjG+4FSLb76p8q+orUM6jAQYWMEF0Oa+KW0fhCcgWSttmFIm/TeUcCoPMv5RXNm748YD8vn4mCDfyfOSoxUqpO9UqDrEaiodLAwCUDdSNHmVueGJG7ELOvr1SMbxWWIF4D+pMn/QT8+dgiYG0n4mS0Fa9fY+x78II8BngYJIp3zNjVq5PSVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wrjshMc9XOnXIdijcesginwmGDY+hkSxIYAFmWGN28=;
 b=Vsp3XGSiN7+82RBN8pPLssRjWlc3I2zS5nL3CBz3DsqjE34NZN/ZcUSUjpTixmXCDNA+mO0/rlnxFdxn5TgeNVI4qDi9xRL6gB6AadRlFwCFbq7u7zkhYhn5YP+esh78GPzgLEWhBlSOVpCR+hCsE9+g/BtkcVMPOHQoBt4FoIllYU6HseBsLTeQDF3alC50Mxfrecr6pNb0Zcj9UtQf9YWSBBuCJlXQSv67r+YJ2omu1fUJcV1zDA4BuLOSNkyKud1zxKrScL5DrBEZSMRysoBGd/pkiP9b1krOEyMg1dixbh78y0AjR299QHSWd+mlDtwnnYZ3BQl5LwWn6SvXPw==
Received: from DS2PR07MB11812.namprd07.prod.outlook.com (2603:10b6:8:333::15)
 by PH7PR07MB9801.namprd07.prod.outlook.com (2603:10b6:510:2a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Thu, 26 Mar
 2026 14:37:42 +0000
Received: from DS2PR07MB11812.namprd07.prod.outlook.com
 ([fe80::5afc:2f45:80f1:2df8]) by DS2PR07MB11812.namprd07.prod.outlook.com
 ([fe80::5afc:2f45:80f1:2df8%5]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 14:37:42 +0000
From: =?koi8-r?B?8tnWz9cg5qPEz9I=?= <symansel@outlook.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Oliver Neukum <oneukum@suse.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] USB: cdc-acm: Add support for second ACM channel on more
 Nokia phones
Thread-Topic: [PATCH] USB: cdc-acm: Add support for second ACM channel on more
 Nokia phones
Thread-Index: AQHcvSmtNVqOtDr9V062LtReL51Ojw==
Date: Thu, 26 Mar 2026 14:37:41 +0000
Message-ID: <a8008c91-52c1-4a5c-ac96-dd45f109c68c@outlook.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-imapappendstamp: DS2PR07MB11812.namprd07.prod.outlook.com
 (15.20.9745.022)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS2PR07MB11812:EE_|PH7PR07MB9801:EE_
x-ms-office365-filtering-correlation-id: f2b92e4f-e623-4840-5ac3-08de8b453ca9
x-ms-exchange-slblob-mailprops:
 02NmSoc12Dc6c3c4/rztiZGf6bH6e/ZC0JG8exP1+Q/A3QQPyUL+ylo/g3TT9LkXVZUKjhscKin/nVKY/W6bypejtDBGtimKXH4rsx5RBDMI0uRsU20PIC+jqNdWQLkNjE1cZBpxCSacXWzUYf4OHTmAhXi8X7/fR4jCNMF1poGnzIR2aRgWuflzteIbxVSKNERt6bT9w0aoPdcME3cAa0JsRB/T35r4zxxiq3fNvQbJQG8gV0z3hlxEVstbs4IjFN6alJfdArFYQuOfalPQv/+Vn8WzjPXg+PmgyzPF6PMtiJJ1fB6Divy8eDkQVa2iJHKQeH6Zqu0TGmF2Tr7Sk45YroSsBLYjTr1ajFUM10jS/LqjRuDZNYhsKmoykn59qv8MOtDOGBbrzcDZaMYAUjtSuW1E7Qx2xvB7th5KtfGzVd12J3AQtuqVKzkRzlbaveZc5QXpVcshXphmovWg9JLhKPJpUZMWPsig243ajB8sKi2fgwLBOUGjmXigli3EmEh12REd1TKNCKfr2DDu4EqEfBw3G3u/rVORaOXCRKiCEcilEt6Jmv9Qk+cK5pFCJ9m7KEgj11DswSY9fko1Oy6alWEGdvTgl/J8XxXUpAh3nmHbOFYZ6c90cEePMsvd7YMQt2+RCPo8GbGFoh4NOkBHrQkwb0eh3SGXn/mbh9JVA4meihQHYFjDLlqowMWM9SKVrhP3gU1mzew5HUJj0H39/xral0NzI1Y0lQpJoW+hPDpYJfgyGzwjRWZxBSnf
x-microsoft-antispam:
 BCL:0;ARA:14566002|24071999003|15030799006|15080799012|19110799012|31061999003|8062599012|55001999003|8060799015|22091999003|461199028|39105399006|20031999003|24121999003|40105399003|102099032|44111999012|440099028|3412199025|3430499032;
x-microsoft-antispam-message-info:
 =?koi8-r?Q?8PjDPMyvnHBzUoWi1zdL4Wea2GdzvM/EF/Xc+3TkY2e6zOqcdJCFMTe0jenLWl?=
 =?koi8-r?Q?BKOw21KgyAZkeUCRmK/qut0lxi6k9NJvdSgxoJAlFX9wgCGx0G6ei570Mq0Lun?=
 =?koi8-r?Q?4nMWnL0c691MLJumTgUn1gD9UBdnoWUKf/g9be3VW6pnptFL28TwQ4us+T6jDb?=
 =?koi8-r?Q?st/OfHNkufb0XzTIxK5BQdpk399xjSLf1izzkO/oPzxF2ucpPPDuLVj6iBZ1De?=
 =?koi8-r?Q?0jjR46H/YkRlbhOxYQCM8P5csGDxyimrzceU3cnFdSv44kYD7Opy+wmt3JtIX6?=
 =?koi8-r?Q?mLiXz5thABJ7NLMsINgkcXAvX+YOrINT0NaHykozhrt6dW4Afy3/ylkJXftdzN?=
 =?koi8-r?Q?6mhp24bhLS3jkQivlW8CgIh+y8B7Mh2s0OzVUFuDsuIFpgSM7j2XSVe32ZwEG/?=
 =?koi8-r?Q?vZoHePUKE3IOUFYljD3TVr4s45Iq3tJnuKoo6aDxGY7j32LbxDfdmPMQK8jH/X?=
 =?koi8-r?Q?XYk+fIZ6IUQDZ84+cMoatSBa3tneEB5aylcxlRdyF6sxDC4joChcy8ANabzYBR?=
 =?koi8-r?Q?v5517KpB2LcXHeYWKANT4uZT+jvGAFFgV/OtJR/rZ+HMaLpmEYjq8wBNeSIQ4L?=
 =?koi8-r?Q?XnYwvN2L3fKKPONF4U6/qxQjwf+yxOpBkCkmegxbOYUTG6FvH46ou6VEUXmo3/?=
 =?koi8-r?Q?68Jcaj4ZdA9z5X5vZTKtFWflN8qsiL2QbctBjeSyT2oCbEt7X0wlDMGz3OCLq0?=
 =?koi8-r?Q?urjeuGILovZJOBHEXKowYqn5uQKpp7t16QgMP1E6tXtdSjIv6Vp0cC0D4TzVgX?=
 =?koi8-r?Q?1h6GGmTOziUBGvMFeX0rwAvJ8WQLSlNqbpZKCajRXa8VcEXUu4OBG6WTyodP0w?=
 =?koi8-r?Q?rGfoUiqz+BWRDg+8fCR8J9XTenEmKWqeVXk5FMB44GCCdQeaGO+R5lCmUEBjNB?=
 =?koi8-r?Q?T4wg7bf20cDTFGvtqwkO+Kg7xztjgDS9yhxaNU1VPUVNXFzI5pi10MiaCQ+45d?=
 =?koi8-r?Q?PINzlkKIpCCnqv73I7NBTkGvVPClKQQVtJBXH+OAHukVdwkMZcEm2Idm9rZ7M5?=
 =?koi8-r?Q?m7e0D+3y4opwXdZwB0pE95SUtmeASJZwyvBI4Zf3yaR+f9mx3Qb77/jmduRpNp?=
 =?koi8-r?Q?HnRk5cdTVy7yvhA1SxzjlRF7v3IssmM4rUTh?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?koi8-r?Q?S9YAxUraTlTWssdgRmEjRPNSnHMLwvdVkDZClzGJJ5QIyl5VSZQ+kkpINMVWt+?=
 =?koi8-r?Q?445DctkHoGxgCCepgmx7sQMDYR6DuwhggqLeIKs14ldIrfvmoh7TjsMoe9JhM9?=
 =?koi8-r?Q?IPL8ydBKPT0GPkKKqxKlRBCYYntITLLA0b1RAdM56vrQghixF68oghZwxEpgQT?=
 =?koi8-r?Q?eGWCmqlfFrB2z2DcQPIgm1Jyl9ZFYlSL/O44Eu6a++hh4R1Q++QWxDwSufRn/j?=
 =?koi8-r?Q?hzVmLIRx/mBpdvO9fkLxMZShBvKz/aokkKeZHTylmtYOmaMD6BgxahRhwNScj3?=
 =?koi8-r?Q?3n0q2oFtCipydeg2JUWmECl2/O1t2LLb4r9uqp6UWju2JqSvQlDPls9lWjR3OD?=
 =?koi8-r?Q?jzbcVO9ZccHguE9UdIKlCFmdnpxh8wzt9uOzYENSFXN4THGTEto2b779dlrV6k?=
 =?koi8-r?Q?+Rn0UZgUtgyxiZcVRKEJWJsr3t6FHOYhRpHXNL9K+6cWFtjHVW98sBPbCzXeXJ?=
 =?koi8-r?Q?2JM+fEL9/sSeVhzOcZ0XETJImCyh+hAb4bCKGs3jg2heSTiqX7MzGd56B5Y2ZW?=
 =?koi8-r?Q?Ve4iKNbiBQeEJEWXCpTnz1msn3RKWlHfGXy3G6RwU/zA8uE+JBASyNKQnfsm7q?=
 =?koi8-r?Q?ny2NwlFNsOCeBUFXmMO2+YivDQrqMmHdCdtRvzDSJhjbERIxTjgy+YcODkz5aN?=
 =?koi8-r?Q?7w7TlMzseHvKUvAc9ItN9ZHEqDor4tVpPAxCn3r4WEXKsWnRsA2HDG9zlayF8W?=
 =?koi8-r?Q?biiIbvW4onk4B/EfXU0wTAyxd7dobcrCHB8cf1pbOe9XkojoDIjJJ3/c0PySSw?=
 =?koi8-r?Q?MMe/yAlq9Abi1qJgDfzet5tL/VRHV8DA3sMaYsR1vUB+Y1WhLBlWMvJpLo1KP9?=
 =?koi8-r?Q?gG3YmHE0zWcyB8FZqG5DCJdweRvnwsoqOQ5c1KMTBbAQDoccZHGwnlZAlJiHzu?=
 =?koi8-r?Q?0qXBe2cyhXzegPtaE3W3qMlxx3EbFRuB2bakUmSUStLxVySzyvgiOipWgA5adV?=
 =?koi8-r?Q?MKhRUyiSdeDEZQ51IqcXETOqY9YcZ0pC3d1MylWOKbqczvMzTXXl4mUfRcO4l8?=
 =?koi8-r?Q?WFE1H605kCNkURMM2KbFrIVkxPxEtGgKZniHjQ3XL33VZ3KKSdYArygava+tdO?=
 =?koi8-r?Q?/9FCATDxRIu1qn9sun9h89J0CouKLyzsdyBdTXD0TXWItimYtB4WOIpVW4WIz+?=
 =?koi8-r?Q?ookeqFo7VE/mKIAPeajWfx8Zh+dSVQ/e1qI/HdqYzhsKf18iQ7dO1AIGnMSy+8?=
 =?koi8-r?Q?lF2ZEi8Qo/ErOjfx21GcUZxi4r28eGw+ktMGkLECNa3VtMR/dum0lmfsC30Spd?=
 =?koi8-r?Q?CqnSFb9Wmrc9JivLL5QfqDrYrbBEp1Gh8Q90BaWX+3QwAi9syB4SsKpMe3v8wr?=
 =?koi8-r?Q?/M5Jt54KHiV0z/MKlCPTF3y1jc34B7iNOFnhruXI8cIOGufXaPDFDVmoqlbpYQ?=
 =?koi8-r?Q?iV1+k9BKeiAjiAfq3LsZkUgTQBlQZHQrdwzcUqCGX8LPMc?=
Content-Type: text/plain; charset="koi8-r"
Content-ID:
 <B0EA0AF4127BA944A619D561A97BF450@sct-15-20-9412-4-msonline-outlook-13ed7.templateTenant>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS2PR07MB11812.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b92e4f-e623-4840-5ac3-08de8b453ca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 14:37:41.9863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR07MB9801
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35514-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	DKIM_TRACE(0.00)[outlook.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[symansel@outlook.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 47F0E33700C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Nokia Series60 phones, second ACM channel is used by phone=0A=
applications to communicate with PC. It reports "vendor-specific=0A=
protocol" so kernel does not expose it as tty by default.=0A=
=0A=
This patch extends the whitelist with all S60v3.x and S60v5.x phones,=0A=
supported by official "Nokia PC Suite" driver for Windows. Device IDs=0A=
are taken from its installation configuration file. Older S60v2.x and=0A=
S60v1.x devices were not added because I have no hardware to test.=0A=
=0A=
Signed-off-by: Ansel Hayashi <symansel@outlook.com>=0A=
---=0A=
 drivers/usb/class/cdc-acm.c | 77 ++++++++++++++++++++++++++++++++++++-=0A=
 1 file changed, 76 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c=0A=
index 7ede29d4c7c1..5f72fe972ec8 100644=0A=
--- a/drivers/usb/class/cdc-acm.c=0A=
+++ b/drivers/usb/class/cdc-acm.c=0A=
@@ -1870,7 +1870,9 @@ static const struct usb_device_id acm_ids[] =3D {=0A=
 	 * information below. The second is 'vendor-specific' but=0A=
 	 * is treated as a serial device at the S60 end, so we want=0A=
 	 * to expose it on Linux too. */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0421), }, /* Nokia 3230 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x042D), }, /* Nokia 3250 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x043F), }, /* Nokia 5500 Sport */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x04D8), }, /* Nokia 5500 Sport */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x04C9), }, /* Nokia E50 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0419), }, /* Nokia E60 */=0A=
@@ -1891,12 +1893,28 @@ static const struct usb_device_id acm_ids[] =3D {=
=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x04B2), }, /* Nokia 5700 XpressMusic */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0134), }, /* Nokia 6110 Navigator (China) */=
=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x046E), }, /* Nokia 6110 Navigator */=0A=
-	{ NOKIA_PCSUITE_ACM_INFO(0x002f), }, /* Nokia 6120 classic &  */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x002f), }, /* Nokia 6120 classic */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0088), }, /* Nokia 6121 classic */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x00fc), }, /* Nokia 6124 classic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0288), }, /* Nokia 6720 classic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x011D), }, /* Nokia 6720 classic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x023D), }, /* Nokia 6730 classic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x01B6), }, /* Nokia 6790 Surge */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0057), }, /* FOMA NM705i */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0168), }, /* FOMA NM706i */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x04A1), }, /* Nokia 6290 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x04A5), }, /* Nokia 6290 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x03C5), }, /* Nokia 5250 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x057B), }, /* Nokia 5230 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0388), }, /* Nokia 5232 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x057F), }, /* Nokia 5232 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0348), }, /* Nokia 5233 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x03BE), }, /* Nokia 5235 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x02A1), }, /* Nokia 6788i */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0042), }, /* Nokia E51 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x00b0), }, /* Nokia E66 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x00ab), }, /* Nokia E71 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x01A2), }, /* Nokia E71 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0481), }, /* Nokia N76 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0007), }, /* Nokia N81 & N81 8GB */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0071), }, /* Nokia N82 */=0A=
@@ -1904,28 +1922,85 @@ static const struct usb_device_id acm_ids[] =3D {=
=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0070), }, /* Nokia N95 8GB  */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0099), }, /* Nokia 6210 Navigator, RM-367 */=
=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0128), }, /* Nokia 6210 Navigator, RM-419 */=
=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x012C), }, /* Nokia 6210 Navigator */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x008f), }, /* Nokia 6220 Classic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0124), }, /* Nokia 6220 Classic */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x00a0), }, /* Nokia 6650 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0294), }, /* Nokia 6650 Fold */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x01CC), }, /* Nokia 6710 Navigator */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x029A), }, /* Nokia 6710 Navigator */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x007b), }, /* Nokia N78 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0094), }, /* Nokia N85 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x003a), }, /* Nokia N96 & N96-3  */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x00e9), }, /* Nokia 5320 XpressMusic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x010C), }, /* Nokia 5320 XpressMusic */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0108), }, /* Nokia 5320 XpressMusic 2G */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x01f5), }, /* Nokia N97, RM-505 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x02e3), }, /* Nokia 5230, RM-588 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x02e7), }, /* Nokia 5230 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x034C), }, /* Nokia 5230 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0325), }, /* Nokia 5230 Nuron */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0178), }, /* Nokia E63 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x010e), }, /* Nokia E75 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x02d9), }, /* Nokia 6760 Slide */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x01d0), }, /* Nokia E52 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0223), }, /* Nokia E72 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0374), }, /* Nokia E73 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0275), }, /* Nokia X6 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0279), }, /* Nokia X6 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x027D), }, /* Nokia X6 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x026c), }, /* Nokia N97 Mini */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0154), }, /* Nokia 5800 XpressMusic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0138), }, /* Nokia 5800 XpressMusic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0158), }, /* Nokia 5800 XpressMusic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x02F6), }, /* Nokia 5800 XpressMusic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x02E9), }, /* Nokia 5802 XpressMusic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x022A), }, /* Nokia 5530 XpressMusic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x011C), }, /* Nokia 5630 XpressMusic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x01A9), }, /* Nokia 5730 XpressMusic */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x014B), }, /* Nokia 5730 XpressMusic */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x04ce), }, /* Nokia E90 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x01d4), }, /* Nokia E55 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0302), }, /* Nokia N8 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x0335), }, /* Nokia E7 */=0A=
 	{ NOKIA_PCSUITE_ACM_INFO(0x03cd), }, /* Nokia C7 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x05AB), }, /* Nokia X7 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x03B1), }, /* Nokia T7 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x058E), }, /* Nokia Oro */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0187), }, /* Nokia N79 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0216), }, /* Nokia N86 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0380), }, /* Nokia E5-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x038B), }, /* Nokia E5-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x038F), }, /* Nokia E5-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0565), }, /* Nokia E5-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0569), }, /* Nokia E5-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x05DD), }, /* Nokia C5-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0592), }, /* Nokia C5-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0596), }, /* Nokia C5-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x03F3), }, /* Nokia C5-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x03A7), }, /* Nokia C5-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x03B4), }, /* Nokia C5-01 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x03E6), }, /* Nokia C5-03 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x051D), }, /* Nokia C5-03 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0520), }, /* Nokia C5-04 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x05E1), }, /* Nokia C5-05 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x05E5), }, /* Nokia C5-06 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0312), }, /* Nokia C6-01 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x03B8), }, /* Nokia X5-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0378), }, /* Nokia X5-01 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0432), }, /* Nokia N90 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0472), }, /* Nokia E70 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x02FB), }, /* Nokia E63 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x032B), }, /* Nokia C6-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x032F), }, /* Nokia E6-00 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x05C0), }, /* Nokia 500 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x03F5), }, /* Nokia 600 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x05B3), }, /* Nokia 603 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x02DF), }, /* Nokia 700 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x05A0), }, /* Nokia 701 */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0538), }, /* Nokia 702T */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x0574), }, /* Nokia 801T */=0A=
+	{ NOKIA_PCSUITE_ACM_INFO(0x05D1), }, /* Nokia 808 */=0A=
 	{ SAMSUNG_PCSUITE_ACM_INFO(0x6651), }, /* Samsung GTi8510 (INNOV8) */=0A=
 =0A=
 	/* Support for Owen devices */=0A=
-- =0A=
2.53.0=0A=

