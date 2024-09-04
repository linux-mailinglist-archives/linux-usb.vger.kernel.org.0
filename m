Return-Path: <linux-usb+bounces-14649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7628696C1A4
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 17:02:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDF5A1F2A75C
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 15:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F771DCB06;
	Wed,  4 Sep 2024 15:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hidglobal.com header.i=@hidglobal.com header.b="U9ffxvqt"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013001.outbound.protection.outlook.com [52.101.67.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1F91DC753
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725462111; cv=fail; b=BxyzSemHdSXHdweMDgFkj7f9KXpKRMQ+9WKp3xUCmmMIN20JlyYGf9GpyD10YAKlrURuKTA6sV9p8H4GbqP0nUw8k3wJYMHCqX3aRwH7ErCP+rCKK7BO55GoEp7LB+rOYi5D+7+1FT/HcBW9H1xuRTrxmSQH2xywdWr7XXVPRps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725462111; c=relaxed/simple;
	bh=kNeqOlFSt1TtlKh8+AeI7WcgbcQq7+LSg2gALPKfT9g=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nmmaGKmJKpzMxFORlm5SfmgcByVMabEw/q6zu9kButOsxA0r7Dkfj4HxExac40ZZzb00zNj0gZZFSHA3wMLoY8Bs6r3fpNpq4N0kdqjLsJgeFIwGSYuNcw8L0yiw7lkoR3twQCW4Rz/OZPm2YTayipAotnhIOEijVM2V2NdLstM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hidglobal.com; spf=pass smtp.mailfrom=hidglobal.com; dkim=pass (2048-bit key) header.d=hidglobal.com header.i=@hidglobal.com header.b=U9ffxvqt; arc=fail smtp.client-ip=52.101.67.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hidglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hidglobal.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=givD+Wtl/RUgY+LpnfZ/e8U7/30PFNuY1qkhUx6UeMXzDIoT235dFOSAXUZrsSt23enE7hKf8h/pQMyzTeDYhueTNxUbOk7/gNq5u5yvTt6rT5f2qbaWUL2qNm0nvrvgxrG3kkZLOsOF4EZkzsbFCQCSY2CIokIiTuSbzMBWkuWHRDgY2umVQqDg1ryXTYeoc2OanyGoJQrL3bjf3wjEymG21XBqqcswhVcl+vqnfxEeyMDhq/lLLsjy2ttQ2jlbjn3a3LyX9N9Qkrdu4uUCp5Qph2Aor+ifiU/0p4IGJNBtKpIkNYPQbbnro2TOjD/D6umfm3PGpOWccGqd9k54Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrYAcofQimcB1fhkG28Z7Siq/A2t7HTpJjt4HrWiGAI=;
 b=L6zZOEXHCKsXkb4Bd78X34cAgaKukUQHpg9JJIiOfjUd6lycgyZI8xSkZ2Gr0QxKrTCMycc3DD7FKvGAMV9JmNHjSQap426gr7ujrfk9rq9MAjUhkJwMQVxxP8DRzcXPPoUKKOXv4QR2dIldjfV2aAC1EgiDx+XBQju7UgVqlRPWyO9ZjbBqsEmpliOnNu8ozsL0bQo/MEd39zKxLd5BvVzocgSewb4blRlnvwIuXBcbK9N2+BB8lh8xVQ0p5hEt2xjMiDLAp/SY03BORVQ59YPPjNpX1CcP7ukJzNtxQzyAWbu5/kZPxopZGTH1d1g70y9gcUiRzw/QNKZ3YNtw7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hidglobal.com; dmarc=pass action=none
 header.from=hidglobal.com; dkim=pass header.d=hidglobal.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hidglobal.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrYAcofQimcB1fhkG28Z7Siq/A2t7HTpJjt4HrWiGAI=;
 b=U9ffxvqtiFpvLGitWmPru8xNlFRwvlRgvZ1jlTYyunKnEydF0CcDQ5RbN5NG1fWFP3iUjWRyxbe4hAoTCjdZV6fcesjZs+eODxvb5YmezjCqms5cab4CQE277g/+D9ZWyVG5i+/L+9oAZtU/ltRWgYgMcMQG17zqGnNNu1P19TBoiKaz3+dQxZF5RoN5uLd/9y+Cxvq1xmcMKAw7JIzdEvItBgWRhirZ/Gzbzj/BSPvKCybTuS10JXu9zxYJvrOU6WfBOnuonDGurHy1BRUE9oDsK7o9kgjIfpm7Pit3Sej+UyF3yEfDe49oXdLXLIkSZ5g2JsTDbMxxwuuy3g5qhw==
Received: from AS8PR05MB8485.eurprd05.prod.outlook.com (2603:10a6:20b:3cb::12)
 by AS8PR05MB8584.eurprd05.prod.outlook.com (2603:10a6:20b:3ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 15:01:39 +0000
Received: from AS8PR05MB8485.eurprd05.prod.outlook.com
 ([fe80::465f:2e65:bd01:4957]) by AS8PR05MB8485.eurprd05.prod.outlook.com
 ([fe80::465f:2e65:bd01:4957%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 15:01:39 +0000
From: "Vrastil, Michal" <michal.vrastil@hidglobal.com>
To: "stable@kernel.org" <stable@kernel.org>, "balbi@kernel.org"
	<balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] Revert "usb: gadget: composite: fix OS descriptors w_value
Thread-Topic: [PATCH] Revert "usb: gadget: composite: fix OS descriptors
 w_value
Thread-Index: AQHa/ttYqxbhHhDYREmJ6xqh2EfPhQ==
Date: Wed, 4 Sep 2024 15:01:39 +0000
Message-ID:
 <AS8PR05MB84851190CC1941157ED33D7D909C2@AS8PR05MB8485.eurprd05.prod.outlook.com>
References:
 <AS8PR05MB84857AB3DC49395AEC7C235990932@AS8PR05MB8485.eurprd05.prod.outlook.com>
In-Reply-To:
 <AS8PR05MB84857AB3DC49395AEC7C235990932@AS8PR05MB8485.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hidglobal.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR05MB8485:EE_|AS8PR05MB8584:EE_
x-ms-office365-filtering-correlation-id: 9e195cdf-8c60-479c-8a90-08dcccf27ab8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tgnEcOAydrz938wcKWSWChhUX1/msV9oE+SQbpAF07bxKmhX0zmaBL+8brWD?=
 =?us-ascii?Q?nANWvB27uXYd8Hw++aiXRSrvrmm1wTDj0O24Scp7TsJZr5yA7r5S5gfcvd4a?=
 =?us-ascii?Q?B6cnPORa0B6rNKacu+PGYvTpehWk2XJtrD14x2ddW/Q38aPq/PxY5iWlgFWe?=
 =?us-ascii?Q?2G5ylJKu4WE+7m+Y1YrupoYO3zM2hFY+6hD4CbBdHMlqIbQSxWy4tk/jXZd2?=
 =?us-ascii?Q?H+XYvOgVXyxLAeLwiR528SDfjz6XnbX/gENQJmnSOm28Sy15UzDAut8+mBly?=
 =?us-ascii?Q?cvVXanmPyc6dzaETBrr4XwHQRpIwlQtDsmihIVEjw1Op/jg2zbImj2t4ghgp?=
 =?us-ascii?Q?uVvEuzA37uufFPV5u33pIc67Ro2yDvbzLpFszjSsAICuZZQbh6l9yDhQxrkK?=
 =?us-ascii?Q?twWoLC5yPImCpvDZUlHw3cOrWDBp6agUxla7iJI4mviyxWpoZcLCXM5q7I2r?=
 =?us-ascii?Q?walA2cf8DKgdms4amdgoTxC09Bl1wnCavqidaCS4cQXqcE1a0bNPppOwD9h1?=
 =?us-ascii?Q?oazRji5/avlr3APfikW+sm4EnhxAILhLbQv9b2pzHiRhj3nmJdbZKtSgLCSN?=
 =?us-ascii?Q?29K4jycot7gkZMQTNiluJp5SR+Ikrn/58bxZitoEvunWXmJgDuXi7awR5rdA?=
 =?us-ascii?Q?5FCLLrBTZVpx0wxQtLcdhrldJ/Ynu4fpnTq2UjDDeztw0Fuq+EICCrEwhFNT?=
 =?us-ascii?Q?Hl08g19ib9lkZA36zu6CN87lR9xAfw9ftAxNyFjODB6ua4sUvJt5faFIt+hG?=
 =?us-ascii?Q?UIjZbo7A9DyHTqCF2riodfU+A3VlmBRUwtw1hbsoRS1aUHLpRrPDGpGAHCHp?=
 =?us-ascii?Q?KOA7XaYzgCexZnUeuaIOUlWf/uJvrZ+pD83vIrrNBsswR+f4usM7zBe/5MEY?=
 =?us-ascii?Q?b3jCBFo8V+sQ6wJlMKuMRNGi4mSSa6wp+Mne0opLpF1Qu2dQvXrDdKvbkYVf?=
 =?us-ascii?Q?HjKg2xISJx6DzmPpR9lIXVi9mV0RUIbkOuW/8kKYRj83mdQeayc5AmEc0Zxt?=
 =?us-ascii?Q?QfJ0BpwDs41EAxPaHhRb4N1WcT/0MRlHuPfRFEyF2Rn+qHYoQHRuCigf9jUJ?=
 =?us-ascii?Q?Vg1PtpKfmA+SugIx6JKzvwqmyndM5jD4rpRddqW9Uiiqc/47DHFHZ8O/VxEk?=
 =?us-ascii?Q?S4xEP8Cn+Rdeb0gZ1A1oe2FBukyBJir0DK60kug95Yoj5+5zFZIEdeFfULd7?=
 =?us-ascii?Q?YbbazUcgfC3g0RGKe9eLNRUnCVAjK5ZK9T5JgLUuZ/Qa/DczEvUtY898bcMZ?=
 =?us-ascii?Q?KRdHPKYWjPHDoarahwYmTy5rfa/WRIXErxCguH+IEDvfnSOSrx/dyxBB0PqC?=
 =?us-ascii?Q?Cx/bzWEMfdwI2fVP8x92DS79xUzxUiEVvZxMbSbHbj/OMNx3eog7ttvejSGl?=
 =?us-ascii?Q?b8AE7rm+bqycRSB+ynNQi1dgYvhtpM+S5He6UlxrEN4p8INGIA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR05MB8485.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Z1g6JPPLg6I99cfqD1K5KpC+xOXKcYqr70dDMQfwOzxGQDZ8M0nFKrPXM8hZ?=
 =?us-ascii?Q?O4yDKRPwxhR9n2q8lgiZzaAE7sXfQ369sbpWj/iROYHiSfti4Ha5zDhW2s4R?=
 =?us-ascii?Q?F9Ax18zdtBAdNQDWG9k0HKBHKzgsB91+NXyTPZu5CQ0mahTQVzVSb8ww3jK7?=
 =?us-ascii?Q?j1o1pGhgCzaFopzGNmcCpYyhFus5pIPJaI0Xb77scSnDnWAoNNYrvpml4QZJ?=
 =?us-ascii?Q?WxMt1QKQBcRjUBVoBYRTg/RcyIYTo8FA6HHUWQtKk+hPEVzNkjiASMhXbrDg?=
 =?us-ascii?Q?2KqaonzTo58KebXHYIxGeADcDdyKT9J/b1d0yRw658yCIlXV7LYBg9Tt7i3G?=
 =?us-ascii?Q?eYq9qEQNaW6zy2NgcyaeUYSUQ5ThhxWQZf0h1SMWlhO7HufPddxPkz05jKiw?=
 =?us-ascii?Q?AP12fn9Ri+RIWQSLSZuOWIw+vbrcbbtJljcTxl5/Q4K699KADwgwBu/v3Dym?=
 =?us-ascii?Q?fJ4qPiVC2dlZGlJ0RGdYZRxdHjthLXbCBYnHoBBT53yKbfIv1EEyrftk33Rz?=
 =?us-ascii?Q?3qc8igPIvzVYnVM2L9A3JDJXzR/DN6NLvHhGxAQqcbhLkxkh6WA47AfqxKAD?=
 =?us-ascii?Q?rEN76Fxe4cqmlNpSnKnNnG7agOnqzSzfybpEf3zzSI+zS9jPB0tWJ/pr7FIx?=
 =?us-ascii?Q?l6XyUr5xfdqeXwqg+GVnsz7fsCPNCWvGMDF/zpfK/jGrtuM/i5ewxW0LcC9C?=
 =?us-ascii?Q?jXx3ydqGwzTnUXfj5n7NOjHwFs/6nUMWMML0HsKpx2Nz46XHnW7sYVdIiX+i?=
 =?us-ascii?Q?2Lqjg8a80Y0KLJEJK1QrhM3ztUCoINWwIa7tzIxAczwSJqdJd/c1zidHWFL4?=
 =?us-ascii?Q?/O+eok0GGGtLph5LnokTQ9zvKSgb3D/smY9AUtZJDgdGOmxJ5a91whkXy2O8?=
 =?us-ascii?Q?mb9+nJtPp1x71ndLmkMW61yFc3j6yAAwdaqv37SUpFsWElm98vhicw9P8gIT?=
 =?us-ascii?Q?ifZD+CCTgjLTFmGYfT0Nb6E91tnNFmSeQxlHVWvqqRY0qM9lUzLqEfOmbv4s?=
 =?us-ascii?Q?CfJncgXMT1k3ebI6I90bn8PIpmLMEfOfMyFVzVbPMAQThgMg9qNOs3QvBlWF?=
 =?us-ascii?Q?/Neunlsfz96jXl12PtZn+D008+3YxwObFnJBdejiiNlgKziXK2PFyY/t9SY+?=
 =?us-ascii?Q?Gr365K0XMqdBm6Wjo5UiA08aWLgMs2mUEEtmJANIIJAwAyko4gHVg5k+0BIw?=
 =?us-ascii?Q?Qpjw2i6gdCti7gb7vCazEQmUwDIocl6A9YfPWZt0ZEOas6xFbinr03g8bdrk?=
 =?us-ascii?Q?XeTidRFMbi5AMJmwHth8hnveE/XIiAH1Zp4hzmPz2w+M1NHch2Gp8tCV2FlL?=
 =?us-ascii?Q?objJokQ0Jpp0jCEmr0/wcp7j+VVcMeFBqUWhplfO6FqhASrcbJMnDhYK7kHa?=
 =?us-ascii?Q?Itj6CBRtOLlB6ccHA8yVOYvSf/XXJq0rhd3FM1JPJfYwh4kMpX+3X4BIX1eG?=
 =?us-ascii?Q?eTk1xN2edlBimteaVo57fdUOAOQ5UQ4pakLvvVKujkiWauA9lheXOw092U8Y?=
 =?us-ascii?Q?HlJ5vfilk3Afz8XbGGc+AJSWoUshs2C1c2MAaKtsvBtO4yg1GPjcRuYefCWv?=
 =?us-ascii?Q?+OPdOwEUsxeLUHR1kxZ7TUrMATuwcN5TaoayCe4DL1d5+WkP8FTAvLSV4cv2?=
 =?us-ascii?Q?Fg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: hidglobal.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR05MB8485.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e195cdf-8c60-479c-8a90-08dcccf27ab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2024 15:01:39.2575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0bdc1c9-5148-4f86-ac40-edd976e1814c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6n6fnwquMjD4my5PsYclzEHu7Ofa6hj/XA4JaRRri9sTu2m6HtAOCYnplUuVPKFv8tgdPsjZesKCW+OxZzcWb6oZ1N3dKRnnA7FKU2yjuWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR05MB8584

This reverts commit ec6ce7075ef879b91a8710829016005dc8170f17.

Fix install of WinUSB dsriver using OS descriptors.
Without the fix the drivers is not installed correctly
and the property 'DeviceInterfaceGUID' is missing on host side.

The original change was based on assumption that the interface number
is in the high byte of wValue but it is in the low byte, instead.
Unfortunately, the fix is based on MS documentation which is also wrong.

The actual USB request for OS descriptors (using USB analyzer) looks
like:

Offset  0   1   2   3   4   5   6   7
0x000   C1  A1  02  00  05  00  0A  00

C1: bmRequestType (device to host, vendor, interface)
A1: nas magic number
0002: wValue (2: nas interface)
0005: wIndex (5: get extended property i.e. nas interface GUID)
008E: wLength (142)

The fix was tested on Windows 10 and Windows 11.

Fixes: ec6ce70 ("usb: gadget: composite: fix OS descriptors w_value logic")
Signed-off-by: Michal Vrastil <michal.vrastil@hidglobal.com>
---
 drivers/usb/gadget/composite.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.=
c
index 17ae3b394469..a3106b179562 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1925,7 +1925,7 @@ composite_setup(struct usb_gadget *gadget, const stru=
ct usb_ctrlrequest *ctrl)
 			buf[5] =3D 0x01;
 			switch (ctrl->bRequestType & USB_RECIP_MASK) {
 			case USB_RECIP_DEVICE:
-				if (w_index !=3D 0x4 || (w_value & 0xff))
+				if (w_index !=3D 0x4 || (w_value >> 8))
 					break;
 				buf[6] =3D w_index;
 				/* Number of ext compat interfaces */
@@ -1941,9 +1941,9 @@ composite_setup(struct usb_gadget *gadget, const stru=
ct usb_ctrlrequest *ctrl)
 				}
 				break;
 			case USB_RECIP_INTERFACE:
-				if (w_index !=3D 0x5 || (w_value & 0xff))
+				if (w_index !=3D 0x5 || (w_value >> 8))
 					break;
-				interface =3D w_value >> 8;
+				interface =3D w_value & 0xFF;
 				if (interface >=3D MAX_CONFIG_INTERFACES ||
 				    !os_desc_cfg->interface[interface])
 					break;
--=20
2.43.0


