Return-Path: <linux-usb+bounces-35943-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL+WDJK+z2nd0AYAu9opvQ
	(envelope-from <linux-usb+bounces-35943-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 15:20:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D6B394613
	for <lists+linux-usb@lfdr.de>; Fri, 03 Apr 2026 15:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F2C5302BDC1
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2026 13:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5BC3914F4;
	Fri,  3 Apr 2026 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="dIdkhUyD"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19011003.outbound.protection.outlook.com [52.103.1.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034E7221FBD;
	Fri,  3 Apr 2026 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.1.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222410; cv=fail; b=TS+03uuTh6M2MH8S4haheASg8+6pPsF/98YTvnwOEMdltLdkaiHemV3vvqCpM4Vefk1KqKM8i8MqmuLQcROYH5Sfl8afsvrI51QJm86qtxCgUeZyD9ZfwGlzBAztUfdwIFyrRk8j33AaXfcirUHv78OcDeOP5NgkW9fcVZrmcV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222410; c=relaxed/simple;
	bh=8NiuL4k/E/52LsTDr8zydBWtX/gBIhvrW8HRkYPjn80=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kCTCLd8fNRJ6F298LurT8D9dA4BPnHjSFXWea1quikVeH1PHIC7385ANjkUwCKPP88716Q5B0pryOZIPf/9biaYEqz6LlSmLprY9DwGywkXl06iAEE/I7OXJXwslWZ6z7fVQNUjU3illnI2g1WO7NOvfBTg87CJ16A/LCrotJv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=dIdkhUyD; arc=fail smtp.client-ip=52.103.1.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxNmxpGQPllX1zlJmqBL2va1+vKz46GQcglMS4fKhjNxrFOmGjIXuUgn/OdUHLLaNxkWVPB2x9kv8024BLdGY05dHW87D/0Pp4JGKDLui8nfzda5QVeNVaFnRmgO4hDylwhx5dgm9EN6sX8DoRexQ5vEC17kKJo0lVbbaoS2q8EjjSTO2DpsmSgYxsDzm7muvOMUiqEDJ+ZZhyPhkGc/0hf40PcueOiq669MYgNiB52SQXy/0uUNjeTr2qULvj2yHd+GuTR5Bl8AxlwsdW3WbjhPi+AlnBLElrFlWbtUeoVKYzxMUGp5kuyHIKZgZ/HSWyyXVrg/GwWW1x4TsBgP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NiuL4k/E/52LsTDr8zydBWtX/gBIhvrW8HRkYPjn80=;
 b=LZyustAijb5L5ljd86QBBwiYZV25ZyisHmTmWCN6iEkgfuj5K4Uy4JS0iC80kbyuuMQulfWCjaDJccpCDH8rLycVLAA6xWzNbmXx5Z4bZlT4SQk1skDrTNxhvkQksUc+ZoG1CUzFKlqZpf5yimEA+1F/DBStkkaNweR9CFpACXnTKSzwcmKy/4dWQbbfTSlJ7bI0reLsXwEwA0T5Um99gyXJsbL9pjxMQdlbpbZ2CaF+WGT1P0Pp3pwaXyhNXoafQ9TFbRe7XQMje54D/y8fGdV1rdjNaJRFZ17edXfK+aEwdjFc+TSd0Vv7rrSzEBrFdROSAZJmfZzQotSprBsNxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NiuL4k/E/52LsTDr8zydBWtX/gBIhvrW8HRkYPjn80=;
 b=dIdkhUyDEIhLlfFoB8HXmAiVh+aSPBburHZ8NpvkXkLBnHklIWbW0WW2g4JGC2kFX2vor8aG0c2z7PDkMEuRDwK8B7kHZFom6g8o3SU8GjRzH0p/LIcnhG1cOe3HVm2Ujhi0FnCpLLl3u/QVZB2VpQvrgRHOoSaoFruCo8BY3j3k46sl2oXIxXx6t8AXtxRCStRWEq0MUg0/qR0V7GnNNUVU0fVzpHBEQEliv9cOYLUuWjep173bhAiixd4OXMr57/SR239L7ergGYc5RJR3I5oMyKqEmRRowpg5MjDWSw+RcDLc295XORgHC2NAiKD/EbdRP3bdXM2A3HoPZG2Wnw==
Received: from DS2PR07MB11812.namprd07.prod.outlook.com (2603:10b6:8:333::15)
 by MW4PR07MB8489.namprd07.prod.outlook.com (2603:10b6:303:ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Fri, 3 Apr
 2026 13:20:05 +0000
Received: from DS2PR07MB11812.namprd07.prod.outlook.com
 ([fe80::5afc:2f45:80f1:2df8]) by DS2PR07MB11812.namprd07.prod.outlook.com
 ([fe80::5afc:2f45:80f1:2df8%5]) with mapi id 15.20.9769.014; Fri, 3 Apr 2026
 13:20:05 +0000
From: =?koi8-r?B?8tnWz9cg5qPEz9I=?= <symansel@outlook.com>
To: Oliver Neukum <oneukum@suse.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: cdc-acm: Add support for second ACM channel on more
 Nokia phones
Thread-Topic: [PATCH] USB: cdc-acm: Add support for second ACM channel on more
 Nokia phones
Thread-Index: AQHcvSmtNVqOtDr9V062LtReL51Oj7XG3sAAgAawtYA=
Date: Fri, 3 Apr 2026 13:20:05 +0000
Message-ID: <7dcc9837-52e8-4760-b710-403d464f908f@outlook.com>
References: <a8008c91-52c1-4a5c-ac96-dd45f109c68c@outlook.com>
 <7ae48e14-0228-4bd9-91df-306dcd12896c@suse.com>
In-Reply-To: <7ae48e14-0228-4bd9-91df-306dcd12896c@suse.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-imapappendstamp: DS2PR07MB11812.namprd07.prod.outlook.com
 (15.20.9769.009)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS2PR07MB11812:EE_|MW4PR07MB8489:EE_
x-ms-office365-filtering-correlation-id: 3dca837e-95d5-47cc-609c-08de9183b896
x-ms-exchange-slblob-mailprops:
 7qh87CJt6y2KqegnoS4V+KljWAyhwvUzYZpbXd614Wp8KMYdMv1uKUf8Jim7zoOL+n8iIzyt4GOBpFm1d2W5hEsYGMIGkrCQNAUmHUAPSBjLrDF2Aie7wanTQ70hPTaVAbkWJhbJYDeSnWmGewIiIXZ028nA35qtFOzzA3bKS8ulppBIyiieT708LlA7YvV8W9zIzjGUYVv2bpSPL2l2nD/Cap32V7OUARfR6BpeOzCbi0eWf2irjcSS/wcWPLRPdsSIOLMmD/0aI1fnXVRFDWLpI8HFE8XfdQDSqaU5e4G3pLJjqmKCEH5DHpxT/RJ8bESu7JREhdJAQ2gCri068zK7e+DVurY+Y4Z9k05I/kpFHq8vITKAIyXXbCOJy6sQP3ECXyC2Y0Is/mEt43I1tmVp4F5wAYxZq8KyX6VtcAkYtmuyJrCtcz7l36SSXNaOZ2BmbUZhUJBeW1CNi8DPYsGcIRQ/wed28flFW2SxeVYo7GI2rVCBsHETPGUpd2AClxqQL5D5uFnKkbAjTKR2P+RyGUI15JS8vBImQdWPOKh2QK/1IFbXqPpilYnbkelgCKjMV2BVS83H5ze+hxVmbw/o6bZu8RDODerr2v4xwnoxgBHhZa0TlkGIT/m1TsogOFF/2+rNWHdMytF81nZJeWFvlsWJBQbmTQD8Dq0/VOVg2X8Hl6onUVUBUA8zfn6dKSJ1/BJ648wBXLJkIzsIYK1Us5MTeHsERbcvtsexda31ZqDoV+9ColEKl/J795dM
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799015|22091999003|24121999003|19110799012|51005399006|15080799012|15030799006|461199028|12121999013|31061999003|8062599012|3430499032|40105399003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?koi8-r?Q?UOQUhvwdtz96R1cPkpEzGC9c4R9udYLoG0lhFRgVRJuUaQ7c43+jjq9VIsLj7Q?=
 =?koi8-r?Q?tdujp+N9k9OQjU1lSl3QykPe94UgM+0YrGbjkwLsGwdPADA+hClNqKbi0WS/b4?=
 =?koi8-r?Q?mLwo6nAbHrcwf2sQuqFLSi5Lk9hWfg5hXQgsR8UgGXB7IP2UfjpfVqUbx+VoqS?=
 =?koi8-r?Q?g7KPD3cueUuRcymFaiYAA7UAPxHSquTdYX6rSh52DxP3e52c6xMT6oAvqSQq2p?=
 =?koi8-r?Q?4SOYRHGR9P4+NWz574hi7PmH6KUkog8X+Wzq1AeA1051EFngGmXkf2s09UqHof?=
 =?koi8-r?Q?4nu60CTPq7g3Pki3faOCZ/H3y9SUNZFTBEQANvEJMTO+3wvMc5PNu4Dwp8Sjsd?=
 =?koi8-r?Q?vUe8gfnblABZfRJu1Q331AgCvNBw7nIuHyCHYmxx5ckONaU704g143N7LUz8ZH?=
 =?koi8-r?Q?KNf5K2X7uYNoNCilpLb8HRGHuPpXD6tRszrqbHVSc5HNyeQiNNSfHYaZnMb5kl?=
 =?koi8-r?Q?30S2mppnEq/ajhnm0Wm68K+0j5ohSLtXAtj4nR7ovowo17TWVFw7B1OdZxltic?=
 =?koi8-r?Q?aQMoQ5aICtuP6w8hHEXSXsYMr8pqKMHRCHidrgb5ePGUDFU3SOazFEzdfsvN+h?=
 =?koi8-r?Q?tkek7UrkK+KBaBH3w1B1xToTXjyZYAfzOdxc18EBd6dAshelYdd1RlEIph0/2c?=
 =?koi8-r?Q?p11SptZNnod8VxtLHsWfNyuVnZ3Y2FQJ5FZbMi169TLPVtnRkB7x08Zlrmve4u?=
 =?koi8-r?Q?9CUJqIBnc/fTL0JmIlv/r8VM+IvbfnaQbc0PC+V4lgqIyq7ylhcTOwatksCVxf?=
 =?koi8-r?Q?3K51W71FtOn8MaLoqVw45tZWJ1GYlR7H+t5WE00HWnyia2ohqow+OM7WK/IeN1?=
 =?koi8-r?Q?HbS81mu4iJp055Cvgw8arSJHRr7zbIJt6oPTYYjdO1rGle6SsViD8GIH8xOQdx?=
 =?koi8-r?Q?tZxg/WU/uqdji15mjrVJuRSX88xPVnHPiTDPlBDFBVfLJRLzMb1CEVQxCR5BEo?=
 =?koi8-r?Q?vc29LUU6GNLptFRPhwJxcVcB/277G5Tqkd7HIMQi1mEPkF/WFJCuCA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?koi8-r?Q?iadx9ZvtgpkvRVCTotW5HCyRXatKjxBRQnBUoGdJ99/5+0tYS1jyT99jKNVVQB?=
 =?koi8-r?Q?674GJ4ZBp17Zvid8FilX4NJmtNuDfmOvZBX7BLN4vGtAS/BNkruAl+17pxjmR3?=
 =?koi8-r?Q?4ji38PZq7DL0meacYgIc1pddFn8Cr3xgkmZU5+z0DKNF93mLFHfBh4JNpv/eNd?=
 =?koi8-r?Q?ANibtFY8wiBPN75b/tw3DpWW2TteRiaNs5Xz50sW8Szo46UhgRyu0K/O6WQdgv?=
 =?koi8-r?Q?VhT4/Er06zIjAYlULUEF04g2UYvrLP27wik7x/2EApG5cPV0+mj5nX5hT1UgXa?=
 =?koi8-r?Q?2v1vQMASaAzOtWSMrgVSd6Fa1NsPLDfLcCdK1OAKe/ikbftBIxQ8rtoTjKTu/u?=
 =?koi8-r?Q?2pr487MUtuXQUxNGR8F9MpyKfQad8G3EgzokrleaGSnO+rpzer3vjkKCFvCD3v?=
 =?koi8-r?Q?c/aQcaMoO0UM5s3vmEQU3H1U4/simm1hk2OFX4wTKG8iWlWVMYCGY0KkWRIHpe?=
 =?koi8-r?Q?TaJrBy4KbBd7i+xC2j0vWBEcVmiqMhNvWl2vFuw39WztxXphI3YQpRUG2so2UU?=
 =?koi8-r?Q?b7wYRCI5slx2P3VWxdCipJwYdNQgDQ07NeEgMdS0rV6vlojek8lV8JIOnS2CuE?=
 =?koi8-r?Q?gLAsNI7UkdRm5NYXgEChxSbtLGtjVaRJBaly8NONU+kCKaBX7Z36G/xoZQtGxs?=
 =?koi8-r?Q?aWWcw7oLb052zmaUSix7N3vF1D+eqyQLXfFBZ8mKdApQEVBOe8/k87qxtGtpl1?=
 =?koi8-r?Q?eyGLMDVrVptrFXbKjbqVqYTmucO/nPUhswOfiIDDXkuKS+p/ZRyhdYWFqrndj3?=
 =?koi8-r?Q?8m4eGg2cCVJtscEV1/jgMyIBwlvn9bO1ykJ8NXDmDKjWEx5iKFkbM5TTy8vMiy?=
 =?koi8-r?Q?+tD5YnaunapkhPtbE+p7RZsUUaiAAbeLdmIIcn9jTlFxRq2kpBbGxqyMhh/SHl?=
 =?koi8-r?Q?z0k8OQqDfMB536/BStBLE7Y2DsDLXpatsEuBukLwDtSCcRkffgcV5Jw8C9gqzJ?=
 =?koi8-r?Q?GX9kZ2HGg0wWL5rshCNVwiDLdEf678dXGytI/e6bpUJD3t9QcbCJg4bcctZngA?=
 =?koi8-r?Q?hk11os97a5Dm5FHT3dxs0NaMGe5dOL5t4kFBNsEQr/t5LYXYNJ6t1vvY/3pqY+?=
 =?koi8-r?Q?wsx5eCFE+q7gD5IbJBHjQ7z67WEe/Os23B+lQFd0A9HyGujP0cXRKxkEy53fM2?=
 =?koi8-r?Q?WdzVlvasPu3H/WTyN6mfabhPApFze/SuRdZ8I1ZOmAu9G39mJIhLffgE114hzt?=
 =?koi8-r?Q?LghJ7HzQRYwgoRJldHSdV9Sv6DgpQPd3oUBTbgYUGGWi/grykXO4IwmMQGqedK?=
 =?koi8-r?Q?xlLBVO8W8oSi0s0ePJpgpmgzF2R9fSqzH4+UtwXPkuhtni2bGnRBYAt6Wbh52F?=
 =?koi8-r?Q?r3Vz5zvhDRdJfaThZTgSuegcM3c2H/p62UgLBfP23L0DdXopwSX9Fb+1swuHcv?=
 =?koi8-r?Q?xWnA=3D=3D?=
Content-Type: text/plain; charset="koi8-r"
Content-ID:
 <B060A298EA65334295606DEDE06C699B@sct-15-20-9412-4-msonline-outlook-13ed7.templateTenant>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dca837e-95d5-47cc-609c-08de9183b896
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 13:20:05.6300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR07MB8489
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35943-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[symansel@outlook.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:dkim,outlook.com:mid]
X-Rspamd-Queue-Id: B0D6B394613
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

30.03.2026 13:04, Oliver Neukum =D0=C9=DB=C5=D4:=0A=
> Hi Fyodor,=0A=
> =0A=
> On 26.03.26 15:37, =F2=D9=D6=CF=D7 =E6=A3=C4=CF=D2 wrote:=0A=
> =0A=
>> This patch extends the whitelist with all S60v3.x and S60v5.x phones,=0A=
>> supported by official "Nokia PC Suite" driver for Windows. Device IDs=0A=
>> are taken from its installation configuration file. Older S60v2.x and=0A=
>> S60v1.x devices were not added because I have no hardware to test.=0A=
> =0A=
> Thank you for doing this and testing the patch. One nit.=0A=
> This has two IDs for the same model. This looks like a typo, even=0A=
> if it is real. Could you add a comment to such entries?=0A=
> =0A=
> =9A=9A=9A=9ARegards=0A=
> =9A=9A=9A=9A=9A=9A=9A Oliver=0A=
> =0A=
=0A=
Hello Oliver,=0A=
=0A=
Thank you for your response.=0A=
=0A=
Nokia phones have two kinds of model names: "commercial" (for example, "X3-=
02") and "type identifier" (my X3-02 is "RM-639"). There are cases when dif=
ferent phones (with different RM codes) were released under one commercial =
name. They look and work very similarly, but may have difference in memory =
amount, radio bands, SIM operator lock, region-specific SARs, etc. For exam=
ple, T-Mobile branded Lumia 710 is "RM-809", but "global version" has code =
"RM-803".=0A=
=0A=
Different RM-models have different incompatible firmwares. They also have d=
ifferent USB PIDs. That's why there are multiple lines with same model name=
.=0A=
=0A=
I specified only the commercial model names in my patch, because my source =
of information (the driver configuration) does not provide the RM codes.=0A=

