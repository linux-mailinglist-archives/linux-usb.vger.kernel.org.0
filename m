Return-Path: <linux-usb+bounces-4159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE37581303B
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 13:33:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33D231F2216B
	for <lists+linux-usb@lfdr.de>; Thu, 14 Dec 2023 12:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865464B5C1;
	Thu, 14 Dec 2023 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="GxVpibA9"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2081.outbound.protection.outlook.com [40.107.14.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A28115
	for <linux-usb@vger.kernel.org>; Thu, 14 Dec 2023 04:33:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kniTqacUqomL3/8ub6p5FLgB2tt/qSwjVfJnw/UXe3sOsW4+MJttwurqNbhyRHikRDVdDvna88+D5cxyBELM6jeQvOohdyHqVSWz+ihpPWyWIQ0enkUiK6R5bWUuNzQ25/ve8XWkFCTtisCilvGOJy7jSwWcuKsB5q57qWyw023l+sxcJrpObrL/AJSxNmASqngNg/KREOEB1rNlhXzdSh1hpod5uk8B/PuPzaQmeHKHcmuWtPaY5dJePRCOf2itcfp8zvQFdwDueYsLOAWoHzOnIOy+caHrXOO1iZJsAxfixhiGRuW2yTrosIgKcRfU1jT0suA4DQg3vO00AN0o+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXWsLczehPTXnI9MHCRZbnhxgdhpirqlgC8sj5ZWEJY=;
 b=UyPi1wASotppvJEFoFJv1AqkcmuoS1GOWOIa1ihdWtUKwuj7Zodh5724TAgtBuib6bv6PmoVWLKo6DvwsIw7mwuAuIfHa4376ngARf0crW4PLiAdA5xGHbUC0gjXBpCupYPB0PdMu0DZozGVfwly43ezuY899kzPQE/xAnajDvFSMKb/2dzEe31TQ1h7AVrAj3vbWjs7fbKCc9W6D5h+A5rSnr8t1KpTa5/ALKIflaGQVgH9Jw3P96CIsINj896tiNlncO63DJenFBbEdM/pGiOhcu9LtoLCGTJaufhvdTg9SKY9gYd1W9r/hsJwaMV24banlTkMHAK3aqv/0J1r6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXWsLczehPTXnI9MHCRZbnhxgdhpirqlgC8sj5ZWEJY=;
 b=GxVpibA9zU5n09+lpk8tu/KRaO9rhA94+TyY92MV15ekh6OHqRcsrTwh+OR9qsz26CJJBI7nm4MmA+b/ny3It9DRIsuKAE6l0ATkCGO+zabd/3Txg1Iw7QBrCFUn4rzXAclcAjlMBjkPurh9pg427xXfBSUYqeCcyYI4Oug0U+Q=
Received: from VI1PR04MB5152.eurprd04.prod.outlook.com (2603:10a6:803:5b::13)
 by PR3PR04MB7244.eurprd04.prod.outlook.com (2603:10a6:102:8e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 12:33:43 +0000
Received: from VI1PR04MB5152.eurprd04.prod.outlook.com
 ([fe80::577e:f2c6:9d67:f89f]) by VI1PR04MB5152.eurprd04.prod.outlook.com
 ([fe80::577e:f2c6:9d67:f89f%7]) with mapi id 15.20.7068.033; Thu, 14 Dec 2023
 12:33:43 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "peter.chen@kernel.org" <peter.chen@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
	"luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, Jun Li
	<jun.li@nxp.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH 1/3] usb: chipidea: ci_hdrc_imx: add wakeup
 clock and keep it always on
Thread-Topic: [EXT] Re: [PATCH 1/3] usb: chipidea: ci_hdrc_imx: add wakeup
 clock and keep it always on
Thread-Index: AQHaLn+O22Tby76XpkWFYVqD5JJvN7CorXIAgAAHW3A=
Date: Thu, 14 Dec 2023 12:33:42 +0000
Message-ID:
 <VI1PR04MB5152789243EC6EA15B535B1E8C8CA@VI1PR04MB5152.eurprd04.prod.outlook.com>
References: <20231214112622.2412321-1-xu.yang_2@nxp.com>
 <2023121447-consent-decent-7c69@gregkh>
In-Reply-To: <2023121447-consent-decent-7c69@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5152:EE_|PR3PR04MB7244:EE_
x-ms-office365-filtering-correlation-id: 2e8470ac-df4a-40e9-371d-08dbfca0e888
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Q+bOyfesb949JOgxHEYfR+Q2YtF8aBJg9P6WaFW+j6FMlNQ4PqFNU1RvjeqlBmZxMyyGsmBC+uNIB3buAdR11b/0WlY39z6QMzIzneAv5nfA4kMAkoS/HhuFEayU0ERHUrdX6pEv4aSB1eLz/AcbP7ZTLb46cL41+iPB3BnYaPl7ap531WHqf3Z0qLm1ZWfEYjfx1dEXo4YE7tVMJ4xElEilNhwCzXEt2nzCJMQj3mfOXRsuLMgdpIShq5IDZzfPUYasha71uvQmW1Ghev3d/Uu35PzR5xMlpJB4MCWLmAhBPkI45XwtxGpOQZggxsPH3i47wrLtoZg7VLWX2/zuMfcw04j1YkACKWHlicKlcFRiodsFsJnYlKxufhpmxXZWWIY9YW6qSk7Kcx9V4a7KmV8uIiwBpinduw862F6Ck7S5KmDn2t6DSqCRPxWQWqbEpf77iYQGFkuKOpzIFCZDOgazpJDgBWhMDUGskaGk+pREDeWSrcvwTjYMrK/Xu0jclk9Zpsm62cj204VsWl4yv+fuw2iOgcNNJ7hqQ7bGAD/XMkRkhGXlgqX0Bcr6Zj/x4yW7vxnO0REQPTobtoj49y6/RFyOezX+ZG7JP761imEmlKpPprSvJef7g7PiLIG6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5152.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39860400002)(376002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(9686003)(26005)(122000001)(38100700002)(8936002)(8676002)(52536014)(4326008)(316002)(5660300002)(4744005)(2906002)(478600001)(6506007)(7696005)(66556008)(76116006)(6916009)(54906003)(64756008)(66446008)(66476007)(66946007)(71200400001)(41300700001)(38070700009)(86362001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qGPodvK+bxaLnXgmHG5jyLrztXKw1lW/VrRgOE2lmpKBxIBIKrFgB8DMKzL6?=
 =?us-ascii?Q?XPJWIhjbim5d8CK9Re8fWncHcU9cVmczJpy7XAryntDzDIRkVpDeJ787UrUR?=
 =?us-ascii?Q?nY/+gGuA0CTUxckxHak7x5+zy7+IwxiYrQ5rhVXps9Q2V0+7n0jb9EtcWPrJ?=
 =?us-ascii?Q?6MbGD18FKhQ606KwbR7T0dxp08a2SMu8VoahckIMe7NJV1W4PaLLSDpjgjmr?=
 =?us-ascii?Q?NqicgjTJPrFFCPBCO4M9lsLpNNxr3ft8uKCMKJ/9bBT4gjAbtAouTcd7can5?=
 =?us-ascii?Q?QuIL+0BnraQtaHzTyDSrgnkCn4GCZNxH2ABFOJh5r8sOYPNqIO8BmoHhEAvP?=
 =?us-ascii?Q?llEhGuZ15uTNNfuhw7XyWL7jq/ctlHKKXBa2zBByNXngpomn4H8xaHEFTxJn?=
 =?us-ascii?Q?YbCtFjH73Lo0aKKb+FU8WQA5Hjtia3MY5mepu5v+UbhJe2rNVMY70VhwPWpR?=
 =?us-ascii?Q?leyJ7wuNKMj7yClWblWg1L40OU/u7lSaX4GZNkBywZlG8MUebxZIo9zG+yCr?=
 =?us-ascii?Q?+TSTFpHOzQ7aWs2y+mLthmYAU7QMaQRbzaIrx+EAQrQZcYCXuGlovjxFG8+R?=
 =?us-ascii?Q?UbNOxzvTZKkhoUlDy9dAz+yq0tpi0zkZF5hP6El7cxK6EYhjxT5mvAF/guzU?=
 =?us-ascii?Q?fAGm6BDrmCx/zA3i4mHpAt9QDDOwVrA8ZykAcp8pxUhxAL8REvyWqCZ4lRiL?=
 =?us-ascii?Q?aA/zpPQCfVEICwwLIZFsZYseSfwP2kJpQ49FuQ/vl6GSStE2GXkip4gnt0pM?=
 =?us-ascii?Q?lvB3okMKDyh3w5bSkV7HvdjVi/ECzVnK1LNQRZ8QFgBqGfDZtb9Q4CvMSchS?=
 =?us-ascii?Q?5y6LZSABljvb0X8Hv56g7zmP6ZjV6sJaKCul1jNHDCSmEnSNUgcfC/gpavCA?=
 =?us-ascii?Q?DnTficGDsYJ1PFEFcYsCru/xOhQ9VOFIpkEq4BosSqpyM737/AkRHd5HKgAI?=
 =?us-ascii?Q?o5Xv7ftrnahiG99eWMCFG8SJ1iV01UolpUrZaLuj+qrJ/AUpNh+mKC5O9fsW?=
 =?us-ascii?Q?q0sNHHKKmxorV9YkAuiUqQ0mDMz93g7xzLUWWtxDTIt3qN565ZIQ3uHgnH/6?=
 =?us-ascii?Q?J9763AE/tRAo7Lk3wv1Mor0eoudYguG5minUMdc7cydxNI1S/T3da7KEpv3f?=
 =?us-ascii?Q?CCAJNoPJBDYORg4IND5Lo6+Fb+wkHp2I3fzH0VKOUfPrxDE8KdcKpTw0izuJ?=
 =?us-ascii?Q?LmvPTHaqCcuvLqyHcw7k+kHUWjcN+VfI8lsV5UAD0tEqMXqD3iUlPJJQUrry?=
 =?us-ascii?Q?dM0NXDB7ecGaU7PkfLaReLkRBYdXcSaiALsP6f9+NhSY2rX+aOek3J+zowr4?=
 =?us-ascii?Q?dba0Bm6UEBppb7Li8kcF6XHdlBgN04Piqxb2EHqRnhaKcS/Gt1hgNPttbglS?=
 =?us-ascii?Q?4QPvMyI8saxzvSQmsuhGKl/FK1fJFpB7LUtWS9zrDiH0ReK6kBPLc3kuWs6d?=
 =?us-ascii?Q?X1rMuGcSjdlViIlefdD+oNpT5uRrMCEArFhFyPX3p+fMWon51uYG49niMsFr?=
 =?us-ascii?Q?HMNEYXD3ZFsxcRlIOiqcIyME8gONxBOwSeNP5MaVUYwKuZvtcgFAotE9d9Mc?=
 =?us-ascii?Q?5oOz76tKL5LB38t6S9MS/vhYU/dj71477vNpdyAO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5152.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8470ac-df4a-40e9-371d-08dbfca0e888
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 12:33:42.8892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GHvSOIqjVrUMhDl5tHbrYuqEZGLjbcZrsLe7Ju/93TrwL6Sis9x4t/OWOKS8eF+VU+jaP4M4z8b8cna3RDXs6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7244

Hi Greg,

>=20
> On Thu, Dec 14, 2023 at 07:26:20PM +0800, Xu Yang wrote:
> > Some platform using ChipIdea IP  may keep 32KHz wakeup clock always
> > on without usb driver intervention. And some may need driver to handle
> > this clock. This patch will get wakeup clock and keep it always on to
> > make controller work correctlly.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/ci_hdrc_imx.c | 22 +++++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> >
>=20
> Why do I have 2 different copies of this series?  Please fix up and send
> a v2 and describe what changed...

Sorry for this, I forgot to add some maillists. I should add RESEND in the =
title.
Will send v2 later.

Thanks,
Xu Yang

>=20
> thanks,
>=20
> greg k-h

