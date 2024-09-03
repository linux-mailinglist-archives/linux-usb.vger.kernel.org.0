Return-Path: <linux-usb+bounces-14542-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D21969B50
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 13:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDE0C1F2408C
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 11:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701351A42A1;
	Tue,  3 Sep 2024 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hidglobal.com header.i=@hidglobal.com header.b="iigifBVP"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010056.outbound.protection.outlook.com [52.101.69.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22091A0BF4
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725362086; cv=fail; b=C3qUxnVirOYllVB49bZLR7V+EEfLXxJJtPBNqtjT4aeS+5sXsgEbYqXj0ZoDht9l6yy/pGxJG6W/ocuFo9eJLmZWkOLgl7dakwFlG+SY263db6yffvir5gweEx38MvjDA0kEquCztU8Bdh2Dyr21wNisrDmuMNlUvMuaUQ2Luvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725362086; c=relaxed/simple;
	bh=CZEuMUXLU9mjFeIfe7FGjXzMYzCoRUy2hJ2GRzGJEdw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fbrDqaU/c7SNTuihsYMovRfD6A7qs02EBbMhjtfnAa3C52PHZSwHAGuCLrGbDeUymhlKN69fWyTqBaw2mwrHw2F/8aBO+BYWeuC3m39Yk+4ugXG6RsVImm0HtUTBRX6CzyRyPsNi6u+oZEBsCYTiT79j4V5SSOZA7WT6lB2gOVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hidglobal.com; spf=pass smtp.mailfrom=hidglobal.com; dkim=pass (2048-bit key) header.d=hidglobal.com header.i=@hidglobal.com header.b=iigifBVP; arc=fail smtp.client-ip=52.101.69.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hidglobal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hidglobal.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LkcaIIgEAHzyBzGM7tWv1rrH9I/jcGpWq+3JSLInWt8ify4tFLKtCVOHLZ9p+hY9zM4vAgkymvWAGTJs6bgIQmq94gC+xusKeYVoh27mOMBCwWlH9r8eBgdbu3dhsUiGGXKhTPE6Q+qQ06SJ3nlu2Z4ymf6lFOtQzez+uUyo9CvVwfsBMzviHkrst7reo/YtCLQCGa2sOuCo7amVQ1e9dnVRmooj//Oo+1LhJc1ysKtxsuSePdq/Tyuk6vNm7md/6CJFO3Gv9cv5sf4u0ima4E9eIZwBKPwLo9yYMXrpd2w3p/WPLoo73LAs5dCd7Bn2NvRHHCRW5/IqfTKZbZaVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZEuMUXLU9mjFeIfe7FGjXzMYzCoRUy2hJ2GRzGJEdw=;
 b=Df0oGDCyDq6kPOGJ8/c2fGIs4bcJkaMmUs5oepi2HrZkIWMJHjQHOQeeJwBj8KHuuCJC/J6iUlyCwKfuXs6WEOMNPvCM/64Idx6jpklwdHR/1q4jwevl5uXMcyW6CWLciPbar587nzmN/nwUPu67ICnBbwhlqlaqzvZbASMJGlME7wRmQGYXp9e9WKSBh3aIrN6Yez9++Ch09HFo7pVq56o+76qoLU4XZLf+RQZ1kanN1NnzxhYnSunuvY/+CZqa4RTkztQnIu8qWCWhThx1S+6RodoECLE3cWGTvfUvfokBOf3F0w2VVzxdyGyoViMZeOxcC7T6BOs34CzxuJfzBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hidglobal.com; dmarc=pass action=none
 header.from=hidglobal.com; dkim=pass header.d=hidglobal.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hidglobal.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZEuMUXLU9mjFeIfe7FGjXzMYzCoRUy2hJ2GRzGJEdw=;
 b=iigifBVPGnKARCJunG8maXFyPd8gxytzYDWd0n72oXoqpZRMQMMjKa6DEfY0s7y4IDuUScscGRA5J4+w32iqvFxaLZUqcqFkE2O6r439FIITRm3fyvZpA0GslZGbdUqb7oQrBghjn+pbN8701sEoknVzjN2G6gIT+JZmLAcWYcWSpcW+MPFR/xDE/QpJ3feUNfMybq4aiWjNHWSWnjhRBLws/G6zUSxX4c7+zkgOvRLIQWMVFPq81fNAoir6nkkbRfp9k8HL2bUD4cKr+MAem4I8L0fmA+ApNlBhfIk+jf+wapVplLZbDUfnYnlaq0r2/bkSlx3t6F+O+kOVMLGt6A==
Received: from AS8PR05MB8485.eurprd05.prod.outlook.com (2603:10a6:20b:3cb::12)
 by AS8PR05MB7720.eurprd05.prod.outlook.com (2603:10a6:20b:258::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 3 Sep
 2024 11:14:40 +0000
Received: from AS8PR05MB8485.eurprd05.prod.outlook.com
 ([fe80::465f:2e65:bd01:4957]) by AS8PR05MB8485.eurprd05.prod.outlook.com
 ([fe80::465f:2e65:bd01:4957%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 11:14:40 +0000
From: "Vrastil, Michal" <michal.vrastil@hidglobal.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH] usb: gadget: composite: fix OS descriptors w_value logic
Thread-Topic: [PATCH] usb: gadget: composite: fix OS descriptors w_value logic
Thread-Index: Adr95P3kevuPv1sqS4ueTeDDoI+Z7QADSBVw
Date: Tue, 3 Sep 2024 11:14:39 +0000
Message-ID:
 <AS8PR05MB848522189AE458978C5F231490932@AS8PR05MB8485.eurprd05.prod.outlook.com>
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
x-ms-traffictypediagnostic: AS8PR05MB8485:EE_|AS8PR05MB7720:EE_
x-ms-office365-filtering-correlation-id: eedf46c4-39d1-4f3a-27f0-08dccc099a83
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?a670iPlLSMK3lZiNpmfGWPznn7v7mU81opOreD1kOjHyGrs0jS/4+CgfaK?=
 =?iso-8859-1?Q?L7LfvSx6W8y5xSQK3296JHom3R7nKWhJb4QDbuD+2k5qpNr73dx3S8FWN2?=
 =?iso-8859-1?Q?GB1lV+RjuEuk5ohW0tZFuGEED/6KvmX51qDCnpzRa27mR7LnJjyk3y73+w?=
 =?iso-8859-1?Q?gG1s7keWQ6YOxaPUJGL6MH4SzDjwANjcRA0g7B/uEW4R4BdzbIkOSvGpdy?=
 =?iso-8859-1?Q?aDcmaRbI9L8YQVnFYa1ZooJX3ZRs/kiw5ZhARtyLLtAu2cTuhppnth2FBB?=
 =?iso-8859-1?Q?isFZE1h5Ff5PCAEAgEVnsDfopcWhuH6JDEfCYDMSAwBu13c1D4DQ9AnRNZ?=
 =?iso-8859-1?Q?8xgy6uPtNEMnBRIl+FZqEWLc4Jm6djHJHQskIZG2mRPOwvI/Nl2jyTB7Ak?=
 =?iso-8859-1?Q?rKx03pvxLtmYLz4MsXAlrtg5HZBgcoSKXemV8bpA6tGWtQJN9nqLDCZAwF?=
 =?iso-8859-1?Q?D25N6OzTzXZ1+q3RGOW4srJ9UpS7W0k/ccVcKkmd9QQMpq1/cw3ShvY1t6?=
 =?iso-8859-1?Q?vKzlPaUTUgbxSrF7VBAnrSuoMbsLLnZGdgYwsWLwbQANWvzm/WMfGUGUo+?=
 =?iso-8859-1?Q?hOyirALv+IpNjyHbhtDKw9a0QFnSVDWDUSy4aL4rXxFeUrlFbviqZ+yZdt?=
 =?iso-8859-1?Q?jtWkVuz7dmQofBSt+B1fbOi/I4aU1gSlDtZVCwu7k9rPk/tMWWtNMfMGf2?=
 =?iso-8859-1?Q?0aNQ2232+VFBXs14yT8wQDaWeydf456JB68ab+j0N7f/ALq3mnJMf8QBHO?=
 =?iso-8859-1?Q?UqkVMqE7CPZBNRwX51HO8sSd9HsXsRZ8wCp+3Omxr6E0zbJz4tLRHcU6CY?=
 =?iso-8859-1?Q?AJH8XoQB/KZOL0MGAy16h3dgh2u8jc2/ZW80Ov0OTMmfRvM6/5QhDWQ5mT?=
 =?iso-8859-1?Q?9LeEOBa4VcSSdgqU+W8GCl9p11bKbkmj/YOmguv3XF8DxaBVquJbnoR3mC?=
 =?iso-8859-1?Q?Cg1h4V4fewfYSnUSZg3TQOcmZf3yTZFJVvJ9TpI5wh2+ztaulYIMciPVZp?=
 =?iso-8859-1?Q?1d7ROo8Lcwt0JvUtEudKW6nNAPQVVDobRCjquKKV5hRePC8Crso7chR0Pq?=
 =?iso-8859-1?Q?fXthZG46tJS6pQe/0jG3tN6fdDtt/rSaYlWC5gB4MVya6i+rsnDabgye0e?=
 =?iso-8859-1?Q?WeiCoKx/u+XWRFxguiLzbOHoEFEn4M68aPWDg6UYM+tHp6AgnbwISx1cbc?=
 =?iso-8859-1?Q?Xm4FdGqEAqlnF7jbxM2WbjG5iUIScaERCgTpE4Dc7pc2V+u8fpABZzTOjR?=
 =?iso-8859-1?Q?7Ag+Fc8Z9oYvitLpd0BHasz1rbDgYFqhlNmfr7KH1Dsez6pnt/WBIW9ESp?=
 =?iso-8859-1?Q?y6RJOHyTweL69vzPuxgSVJBVdZp4LWeYMH0JPDK1r+zMGTUPmy0pmAOsTc?=
 =?iso-8859-1?Q?sKtgbP9Sktv5jknAjrV70wGl7oPvtmLUJozPNKYWsCR6EV8xguyiLh1mX2?=
 =?iso-8859-1?Q?LjmwdeGkR6dCKCjgE/UN01UOsPA9Te5Gueosow=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR05MB8485.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?oxSHmTsiwNQ/m4a3nLEb0d/yxpwgwyBDRL4dmJduNDCfNbvJjGguTdda8O?=
 =?iso-8859-1?Q?vCdehbL2zoCNSDX0Bp6dcd8Mduc1K0SQdcBpBzBHunKo/g2m9LZXdJ0TsA?=
 =?iso-8859-1?Q?HqrV66FVgn8DB0dynhLOptbf1Un1AjSVEOOs29bruZbfSwh0xeW+rf7DsY?=
 =?iso-8859-1?Q?wSkx+X5uNLkPFYH1XiBzMIruaX4H2YtFAkjuWrBCU8KM17BqTyjB8K0IH3?=
 =?iso-8859-1?Q?QKKaeLYT6A7REt7F7d6jPq4pLm4YAD+pHsIXfVKVK7IAhy/pgg/kVv/XhL?=
 =?iso-8859-1?Q?AOWzP3IJQ9znOehg23ufqg2dKe2Xbtitj2mrhZMuO2rNrUexFJHF8JV+5o?=
 =?iso-8859-1?Q?pS6ob5c3Z4//L0PPXopVAgxCqPmICVhQMShfgm5putO7Vft49z0VgU6QyI?=
 =?iso-8859-1?Q?ZvpWLIT5wcBlIsipQf0vyzhAyfPi/xgd+ravwx3XBmn89aCcf2o8BZ5ShI?=
 =?iso-8859-1?Q?9NE1OxMvqcH0HJU2iB48v+y4yHeOfQiGv/7hnY2+LMTcff189pjcyDl+MK?=
 =?iso-8859-1?Q?+oy9e/MbkwQnHIb1LHpYV77GpBKdGV5I+13XvTMLhjsklcEV7y+DgTJNjS?=
 =?iso-8859-1?Q?Il2JS2V39bJEJK2+w6uE3LSoPNCIrJYxd1DjGCnnPdxeapLcwgTMMN8qw/?=
 =?iso-8859-1?Q?721qN8vUOQOrVY0nQ3N+uiWSs2UVgI8zkCLdDgJOq2b3mNB31eAkuHua/7?=
 =?iso-8859-1?Q?IPBKPzp1NdXZ+lxbVG9f02qK+RKrNYgB3lev+kZbWcviWcGpxSSeGVng8/?=
 =?iso-8859-1?Q?qo3cXXTGL8yKNOWRxJvi0ZHb4TVLPdlxnlBujr3jfpdc6QDeXN+meslvfA?=
 =?iso-8859-1?Q?YYNQE/LAS4xJzawpZNZ5rTIxcXXYXWNBPqXkgNnSNURoSFCOz0rMORXBfH?=
 =?iso-8859-1?Q?Fv5VC0fnIz0U9XOJ/Ah/gFX5kSDzy/MCJ+F34QrzgsYz74UEkzQeRoC9ED?=
 =?iso-8859-1?Q?NG838NjW2WpxOf9M3DjGDo9xZj9tvzeqnwSEGfX7If94w+epcndqKwLxrh?=
 =?iso-8859-1?Q?1jA9O2ccuRiD81pwBxpry4pF+qx1Si06uScMDYRJd74esnq8x+2a+z+Irt?=
 =?iso-8859-1?Q?u2sguL5G592RG7JCG4khjamD3E6WnzghHm9RUK69JDoBKylTZASOhyn046?=
 =?iso-8859-1?Q?ruNZ2rSIXg+b6NMmmY8R3qq/D6JCl9bNBbxB0psDrIJH4IjDO6KWWnmdge?=
 =?iso-8859-1?Q?DKEktZpySSsppV2W6ULGJ/TyUMlXDv08OBuulrJ8owNWx8luJ2VFcoS4oh?=
 =?iso-8859-1?Q?0bjFWaoMoce2AuZdt79rgD2vTGS/qB0uY6NhHhBnIrwEMqu0HAIP32nGlM?=
 =?iso-8859-1?Q?RVodi+rk5iDh9vvkohYS6JEs9nNO1sWABxSbykf4jTIJ5U6yDdakOZlhGa?=
 =?iso-8859-1?Q?LVx2/BDVGzjT5SNNLwgmED5PCmNa0+lfa8DwizOa1g9vtuXBghlRN+ZTeL?=
 =?iso-8859-1?Q?y67Yevo9ouHujkOPgo1lcC9edj+dWEgnJApU9AEX1WBvRQDSsCDOPX0Gcy?=
 =?iso-8859-1?Q?FSomfG1NkKYNrsi9WHIR45Koga9A0eCDqvztdHaGjFDF6le2C2vEyWU37q?=
 =?iso-8859-1?Q?+PzcOA3JV+pRFQj1CKB+yOiW1r+WbQAKGm+9CY8pVpW+lvK7kfT6LKbd52?=
 =?iso-8859-1?Q?4bjHDJfXJwe5zII8sfrOm64c0KBcAKpNlkGIhCO4d3+NFW2PgMtTdFZA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eedf46c4-39d1-4f3a-27f0-08dccc099a83
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 11:14:39.8362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0bdc1c9-5148-4f86-ac40-edd976e1814c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: weprGYPLMC58sMNJ5d0Q6U8V9xnEnDLJ77T3jsDgmlL/c5wKGGToZQa///Ay86G3mxNoog4hZh5YaZ6R2OQXUpQwnDnO62YWdZyrWBO7HGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR05MB7720

From 118f8c8b72d633c0daa65e564e48cbf4964977ab Mon Sep 17 00:00:00 2001
From: Michal Vrastil <michal.vrastil@hidglobal.com>
Date: Tue, 3 Sep 2024 10:55:15 +0200
Subject: [PATCH] Revert "usb: gadget: composite: fix OS descriptors w_value
logic"

This reverts commit ec6ce7075ef879b91a8710829016005dc8170f17.

Fix install of WinUSB dsriver using OS descriptors. Without the fix the dri=
vers are not installed correctly
and the property 'DeviceInterfaceGUID' is missing on host side.

The original change was based on assumption that the interface number is in=
 the high byte of wValue but it is in the low byte, instead.
Unfortunately, the fix is based on MS documentation which is also wrong.

The actual USB request for OS descriptors (using USB analyzer) looks like:

Offset=A0 0=A0=A0 1=A0=A0 2=A0=A0 3=A0=A0 4=A0=A0 5=A0=A0 6=A0=A0 7
0x000=A0=A0 C1=A0 A1=A0 02=A0 00=A0 05=A0 00=A0 0A=A0 00

C1: bmRequestType (device to host, vendor, interface)
A1: nas magic number
0002: wValue (2: nas interface)
0005: wIndex (5: get extended property i.e. nas interface GUID)
008E: wLength (142)

The fix was tested on Windows 10 and Windows 11.

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
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 buf[5] =3D =
0x01;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 switch (ctr=
l->bRequestType & USB_RECIP_MASK) {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 case USB_RE=
CIP_DEVICE:
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (w_index !=3D 0x4 || (w_value & 0xf=
f))
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (w_index !=3D 0x4 || (w_value >> 8))
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 break;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 buf[6] =3D w_index;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Number of ext compat interfaces */
@@ -1941,9 +1941,9 @@ composite_setup(struct usb_gadget *gadget, const stru=
ct usb_ctrlrequest *ctrl)
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 break;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 case USB_RE=
CIP_INTERFACE:
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (w_index !=3D 0x5 || (w_value & 0xf=
f))
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (w_index !=3D 0x5 || (w_value >> 8))
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 break;
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interface =3D w_value >> 8;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interface =3D w_value & 0xFF;
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (interface >=3D MAX_CONFIG_INTERFAC=
ES ||
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0!os_desc_cfg->interface[in=
terface])
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 break;
--=20
2.43.0


