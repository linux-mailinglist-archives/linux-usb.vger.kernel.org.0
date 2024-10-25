Return-Path: <linux-usb+bounces-16725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3619B123D
	for <lists+linux-usb@lfdr.de>; Sat, 26 Oct 2024 00:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D5641F22410
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2024 22:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AF11CEE98;
	Fri, 25 Oct 2024 22:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zuehlke.com header.i=@zuehlke.com header.b="fw/6vuWZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11020094.outbound.protection.outlook.com [52.101.188.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4A4217F2C
	for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2024 22:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729893745; cv=fail; b=Ch9CX7O/CoJkdGO6X3nS+FeuM4en6x/fYWkhA9e0Pk48vDTQYRD2238v8zIVCsfAItl86iFkOrc5H2KviuTvCWbkoQO58pYJsViPlDXRB43XtxBBxUAfE5yZ5cBDGasuUBCFnql78ZCOiDnLxi78YtOQ6a3v/5PVMuihsIncYn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729893745; c=relaxed/simple;
	bh=SdTWWvHiWHzCXU37A2clCrvmNWKk04VNP433v2eo79s=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BcQTMgM1qqpxAH2dA7CPefkcCKiPlQlc3aqvUD7LBBgtRuPwoXw7nRp8FWkz6YlU88QOTzk6jH9pFOyjZZ36H8By2HIeWZQp7rK6X6XnC5aQhq0DhePQsZQ52VHlGLHbdszWmsftNVeojoKiP5jwdsze/Zjvs9d/3FZraxCuFAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zuehlke.com; spf=pass smtp.mailfrom=zuehlke.com; dkim=pass (1024-bit key) header.d=zuehlke.com header.i=@zuehlke.com header.b=fw/6vuWZ; arc=fail smtp.client-ip=52.101.188.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zuehlke.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zuehlke.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJYNexrYJxpHWNbtXOqr/7URAtcinDIb2e/1Usd1/1Tp+EZxPwsq0JyMWkrJg74Q5c79RGw7V2o6Gsd0Tuo/3ZrI5oBPgZDF61HxvkGkogFRr6aIz36WqrrHAxP4U5snxNr0KH6/9rb3/zjhV8aD5aasiA6YqqDiAeP4RVOpwygc/EOKTud06AvgBeFplJ2t/bI2VEOjHfRxy/q4eY3mOYLZtFLsxXKDHpRrTnJXjp11D/VIIWYhC5utzXOEV3/H0Vju7ef40YxaRJ/B7xA1MYGGSt+dRD5HbdyPj3VxZ4201XwyJZG1bRbysnmYlDla4ZhSpQYT9aPMXrpBS2dKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdTWWvHiWHzCXU37A2clCrvmNWKk04VNP433v2eo79s=;
 b=pRFGh/hqrgiJ+7omHB8kuO4Uya7pkSyPOp9/TY7c5BASXisrSAuCZaiwP7gYO3BkyGswdDgibj6hN2pAfuGK36qWu4jGlvNang3i16eCSekwECLLkZ8Tzdn1OM1hhWCpmhg4C9SFJEXYQb/ggfrTvuQ/6+x9G++1NjOqUtoksLAhO0zEaVmC4clySR/n/RYsOgpo4zpoYShJpoZh962r+IeVjl5MtsaU6LlFUX6WQiAicTaJUdIn0IRaKOeUF8EMtThIWf0JMFBmEPfJ9X3YFobRqLvckM/Z9ewQoG3smBHd2/OzzhseS15xsB/3xWcjdCTXkWqqC2bJUDyE4/KusA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zuehlke.com; dmarc=pass action=none header.from=zuehlke.com;
 dkim=pass header.d=zuehlke.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zuehlke.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdTWWvHiWHzCXU37A2clCrvmNWKk04VNP433v2eo79s=;
 b=fw/6vuWZ8Sx0YFvyv6lXazF8AkoXJrPEvUGgp14lPK4pUhK19dmTO2GuP2SSaYz5rOoW21Gs/8jeihC+eXUWGHf8VBxFWvew2TjN7xZG98+aG+uM5i3yf38sB8OsmSNIY3QLUq1r3FmF+1JOAP97I7qvrVSKwX+Sj1gQGAk+eNw=
Received: from ZR1P278MB1022.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5c::8) by
 ZR0P278MB0960.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.24; Fri, 25 Oct 2024 22:02:13 +0000
Received: from ZR1P278MB1022.CHEP278.PROD.OUTLOOK.COM
 ([fe80::c887:bd2f:4c91:3d13]) by ZR1P278MB1022.CHEP278.PROD.OUTLOOK.COM
 ([fe80::c887:bd2f:4c91:3d13%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 22:02:13 +0000
From: =?iso-8859-1?Q?Facklam=2C_Oliv=E9r?= <oliver.facklam@zuehlke.com>
To: "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"biju.das@bp.renesas.com" <biju.das@bp.renesas.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: usb: typec: hd3ss3220: request on how to test & submit a patch
Thread-Topic: usb: typec: hd3ss3220: request on how to test & submit a patch
Thread-Index: AQHbJyi/WCP+Mntp2k6VYcyiP+sjJg==
Date: Fri, 25 Oct 2024 22:02:13 +0000
Message-ID:
 <ZR1P278MB1022FF5D5D123ED7C07774A79F4F2@ZR1P278MB1022.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-processedbytemplafy: true
templafy-owa-emailsignature-processed: true
templafy-owa-emailsignature-version: 1.0.0.11
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zuehlke.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR1P278MB1022:EE_|ZR0P278MB0960:EE_
x-ms-office365-filtering-correlation-id: 5c0e434d-412b-4867-d2bd-08dcf540aea5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ucTWE2fJ5J+6TEuCgM8Xn0u1TWg63EOHVLCZu3ULzNEtk+az3Bapx1wWH6?=
 =?iso-8859-1?Q?lhJw9lgyk5wnnL3lOIizRROThBi9L/PhdgnlaUqObQWVBSrGxJpxJ0H5by?=
 =?iso-8859-1?Q?63rm8oqG5ZXLK5HN9Inj/UEILV4NUM4XNSHTV8p7gDChiKZj6kDLmn5BHg?=
 =?iso-8859-1?Q?gaCut0+XNN4PO+Qr5xp0j/WTJLFOM1OB9UxzaXhPiRhcUBHo8o3CtSNuqg?=
 =?iso-8859-1?Q?5jeMncpcDzTS+jjIB6jdOLy0OZ2HkBC5C0jJK3T5SO6Nj3TbvQc1gkiYb0?=
 =?iso-8859-1?Q?OMhCkUjku23yRRuQmX3GjCal77PIwUC7SbmtdnsxZo6Ua12kxNQU+Byu0k?=
 =?iso-8859-1?Q?3WZdALGXgzboAq/qeyta4EnA1m3vMkCvQP4XpDxFf9SAW4uIpb9oQQ+mr5?=
 =?iso-8859-1?Q?sTOFJwqlWEYTT3yQZa/qGz+tHBkUojUJNteiyqQPqwCLkrCXhXsyy3ozN/?=
 =?iso-8859-1?Q?pNbNIp4qJfRY5XvUqnmdV03Pz6SL6ygZsg0JoSxtcNBp7r5JZwNChPPLYm?=
 =?iso-8859-1?Q?ci47DRKUwtXNdMChmd3tnHxGy4EiZapJmnHrFKgRY4ZPq8WNRtoT8sdWsY?=
 =?iso-8859-1?Q?quER6z6ZP/choqmUABDRD9a5Wb9nydqRo6O37es2TNB9wIbeKGtzITLuO4?=
 =?iso-8859-1?Q?iUdHM3cJ7xnd+vAiTNK8RnXECSS8u/08fVtlgSw1dC1OxIHlHwhJITFYNR?=
 =?iso-8859-1?Q?25Zz3iHUfyuHGz9YQhgZC2DAJMmqct9QmShYC1Q5s2a4k2jp14JB+ilrma?=
 =?iso-8859-1?Q?OfZR7L1EvWEGxNc8a5OsNhCs2Lq0/9gYMaWwWqieq19+1tZkULMHAeHhq/?=
 =?iso-8859-1?Q?1+lSagQ2zNnhHQYP43PpsZiP5zzFX4CpgaY5WBSwvUcbwi2w0+uSzbJeRd?=
 =?iso-8859-1?Q?hb+hwoC96SzkI4B8SvH914w3oSZMY00CYPMXzPTJzjgkij1QbWPrUISdz2?=
 =?iso-8859-1?Q?m45HEkNIK2Ck/SCfZhPM/J3vN+LT9xdmcwD2HzkjoI6gL2U/MaOjiMmvMw?=
 =?iso-8859-1?Q?1KI+t4338Th5/uRw6IMaEMCw9vO78ATYWasYdrQiDHuefR7A4JfKmbvTr8?=
 =?iso-8859-1?Q?iGHYCMEd975RFxKrJgtS1XeYr/zHET6OIbMcdyvhezQKDk1Z97aL7MavWX?=
 =?iso-8859-1?Q?GW+6fQi/nHnEPgJ/KH2VjLuQKxeko28wUWhRh7ud814aJZ5zVoDsa1O9Y4?=
 =?iso-8859-1?Q?sh9k2kpBuxNGIrfg9lI2R+eggn6/1k36CLavtVwLOIO6Do1HZgWeGsIrsH?=
 =?iso-8859-1?Q?Fu0frn0R1APIVldDKCfehfdAgW8+nHdk0EVmIj/Gw41bw7nXUdQgUSvIf+?=
 =?iso-8859-1?Q?QiXTIhOeBBcSSCuLVcLlv09BabZgfWoXh8ae28r8Dz+Aa/ykeoCzNAujAB?=
 =?iso-8859-1?Q?TeG98DYNzFCe+5PGKwjBEhKEXi+QAOm0f+esFaH/7+kvbfbsEwVHIppz6D?=
 =?iso-8859-1?Q?nCFDOd+vqX7Mg+Ow?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR1P278MB1022.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pTQYNjU38n3mwD3fX4/6fk10okfSbwcqRPzeqs4xRQXV85fP9x8GmDBiqk?=
 =?iso-8859-1?Q?KHU3im7l30keHIVZIDUdzjWdfb+5wDoC9sdsvorhBZvYiE1Sdodm5czh6+?=
 =?iso-8859-1?Q?FOBuIHjOGSPKVVGVmTXBpNKjBRkmIU5vtf/AtxiAOmGn0D6lQD5dAuIpnP?=
 =?iso-8859-1?Q?pmYVBj7eR/gKR7eZC/w9nYmv0MSPqE6DjcDPJ+YcXot7KuQn4NXPBLEl0p?=
 =?iso-8859-1?Q?SEl2SVIcLf4PGUiscJiM/xS7hGBk/LAh8udnPUChPsD5avIfOtCmnUNKHc?=
 =?iso-8859-1?Q?cKfllcvB0/HcevjM8vdAEmh5R8wTUPrudTXf8xUb4ngUzD4IqKyNz2nt6b?=
 =?iso-8859-1?Q?votp5Zybd4hzsNpipDDDnnMkdrntpPW4YDnpD/ja2zbS27TGV4W8KO/CCs?=
 =?iso-8859-1?Q?PqPitnO6o7NcMm2/cX09AdHBRTzO3Ma51zWTrVcF4NPdCmpur88d5nPN3r?=
 =?iso-8859-1?Q?/rtOeMKtuhl9xAl5Lyb+x3SsrTYNeaq+1xhrc6Eq9Je4CypASyU6/VRrrj?=
 =?iso-8859-1?Q?WnTdeU6NL5wDhr8w5S833x5dZSuRR8Ud0o2isrexmnD5tmRRgUBq0+kNso?=
 =?iso-8859-1?Q?f/rxJqSLjMIpgu7Q0zm7W8Fz8SjMYe3ooAtOqGuQeu+cLx+X6OFDav+oWA?=
 =?iso-8859-1?Q?tXeF6+odpxBJ3I9ZVQQVdN7iK7QtlzP5XoAQrtmiHqAW0fbkHRwse3rKQ4?=
 =?iso-8859-1?Q?Hty6XocgsPa/8Ovf/u50nPZobUSJFzWAy/YaTLY+UAmBwu/UQ5snwPN5a9?=
 =?iso-8859-1?Q?3D+eaNc+ar556HLwXG428SfaTvQzFvb6I1F8z7c8dgwPyyTKSQoSz5Va2k?=
 =?iso-8859-1?Q?70M0PPuurGU0DaOx52f+MEI0WPB/+1b/24sFJhSwmtPlplzs82Axw6OQOS?=
 =?iso-8859-1?Q?e6JzjqEleDvXvqntBStU220V4dlz2X3QVe4pTSh/tyS/VKaUf0DqM9kSVf?=
 =?iso-8859-1?Q?YoZIB1byJZLdN5XGXpxdgpDKqYhKgQhfcL6CkIfHGOVEgst9ysYSynqIwM?=
 =?iso-8859-1?Q?HVtlD9GtBSIvZPjLLaAD6xM9j+91JH/sQG378A4iSIvhTE+SV9KLlOPDRm?=
 =?iso-8859-1?Q?zL0g3c8ugShbKmaL1AOsBXW89080knTSODrubrg9jsrjpGJbM/6iLdmc/o?=
 =?iso-8859-1?Q?VjKyVpJRuUomYJ2UGMarTsREYuuGmfDcnt2ESAOC+8Dpvs1Q6Yu0XJeiWZ?=
 =?iso-8859-1?Q?NFMBtRTi1KBy8VdVfUod+OcoXOLBer7QraX7a12Z/qIgrBxolbDVsnsLBc?=
 =?iso-8859-1?Q?19OlNPl6h0sCwOa0iXnwVlqxBNMKbmIi2I9vza/Xuxnw/dt3WOOZ+7+urD?=
 =?iso-8859-1?Q?bwVvm94q9MGSSEr51ayEdQ/0P2IB/mx3XRj25cbCapPYb8I/J8EkXr5Skz?=
 =?iso-8859-1?Q?2dp1ETFIiSmo/0qPCPdS9eTUUPTdUaNK+dYht+Qn4P2+h0ZVK5b4j8wtuh?=
 =?iso-8859-1?Q?+3cDpWm6ADwhPE3xnegs++Rc/iHPkiWE7GjDCRAD4wZDSdU5vU97uDZDaF?=
 =?iso-8859-1?Q?QMcs5yTMU/7WC2Zgz2SE23r3t25qD5VPISLlWG3wjoNk0VVsXFwxgYcLb0?=
 =?iso-8859-1?Q?A8fZsDinCs+9TpTX1FW68aoxvPWzn93c9YurTLq0d1Aggwsj12quT9BPwq?=
 =?iso-8859-1?Q?BVhylPZehEXozF70IwXt9PJqI/GHme088q/e/fx6MGFWxENn2IWyL699Ip?=
 =?iso-8859-1?Q?k6XmnldnPwGkljIMLtOLCSeTgsrx8nC41TkfCrzv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: zuehlke.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR1P278MB1022.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0e434d-412b-4867-d2bd-08dcf540aea5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 22:02:13.6218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ccce7f5e-a35f-4bc3-8e63-b2215e7d14f9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tsFmeReMgU8p8TSrb25vY9pcd31NjV2Ok2fI+Qyg9vRg7DNvUTIHiU25J+wTC6j/dswMh6VeZqjE2Kv6WEshItRjjSSClOuKmtq5cRUK1AY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0960

Dear linux-usb mailing list,=0A=
=0A=
I've been working recently on a small patch series for the TI HD3SS3220 Typ=
e-C controller, adding a couple of features.=0A=
I was thinking about submitting this patch here. =0A=
=0A=
However I developed my commits against version 5.15.71 of the linux-imx ker=
nel from Variscite [1].=0A=
While I can rebase my changes onto main, I unfortunately haven't managed to=
 get the mainline kernel to boot on the hardware I have at my disposal, so =
I wouldn't be able to test those changes.=0A=
=0A=
From your experience, what is the best way to tackle this situation? Does a=
nyone have this controller available for testing purposes?=0A=
=0A=
[1] - https://github.com/varigit/linux-imx/tree/lf-5.15.y_var01=0A=
=0A=
Thanks=0A=
Best regards,=0A=
Oliver Facklam=0A=
=0A=
PS: sorry about double-sending, my first attempt contained HTML...=

