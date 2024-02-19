Return-Path: <linux-usb+bounces-6734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 300AC859E74
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 09:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B1E61F212FA
	for <lists+linux-usb@lfdr.de>; Mon, 19 Feb 2024 08:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC1420320;
	Mon, 19 Feb 2024 08:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Bby8fqP0"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2044.outbound.protection.outlook.com [40.107.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7138C2209A
	for <linux-usb@vger.kernel.org>; Mon, 19 Feb 2024 08:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708331815; cv=fail; b=sZRkBUWTdILSEKPyweE1huL+UeiOWxnXuvFZepEqD3DU7Vex7Cr4bzagHuqmR8v6NdAgER/9DLnSe+HaBTfAnPStVs5ZmeW5HOspyTopXZh86OnaWKXakY+geHZ1enST04XKLgL1S6Ix1MzuVZYkVJ7MW+d5pffkv3gxQhwwDew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708331815; c=relaxed/simple;
	bh=69RyQmN5c9IYdA9Idv2o7jtxrAvs7FUp9dry6BrMbPE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NidTY5evBGTusRTFj24WPA2oXa5imqL29+3OoynQef9nnNIrf1afiMvLFozVzvNUcmhTKGDnvZ0oE4TX9cK/hRvOcoBstX6OpZ1ZDJmjOwRlEiKQS2m5oTCOJUWI4aqqzJaFEBxHXipaFzFwFMy9l0NyEGJvs8KTCeF+7i/u/O8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Bby8fqP0; arc=fail smtp.client-ip=40.107.247.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cd+xXvnA76EB9xzsDx53u46/9cWRhbOuZIrlmHGEEh6UdbVJeBQPtv9vUTFR/Ydpn9n+x6ehHZEOcahvQUdG7o9lHwyRxfOPwPJVHNtMaUUjAoFqmNNaheES/oqy8b72rM+uA0rYPJC0NJvcNrFwgHa/n5p62T/xntpEPagYLHQqBlwiQJhjMvzWOQtg7YGmohrHCgK7IR3x9lXqwNuub2di8Ru0jA6qN91XBQ6+ELzD+uaTaOIgowQjz88WkK2XxhFB8wu/Qtlz3YIxyJc3n5Xr6txMxPp5WG6NuqAg4/X7aaQsWAZ1QwRL2mqR/Nj+PnL58av+pRJEBb7XJJOFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnozfTDaDHrMgp8BMz+FwVQ5NvZ3Q1O8h76Opf1XZ9Q=;
 b=RPRwQsbTdpKtQ67v8SaKeCA1RNnhn3URu/bO1kc2NLqp+XLQvFUR5qGGaiAnK1hVO8wl7/VDc3YKBhrPo+H9OaGJPYd4LR63FinXgioPPIbX0uAwYUlpJ1LF/onKNs4DdwIEm1tcF4bKZhaaqYWzI9ARHcMfRiPrMuO279M4clekKPfc965rRdQfpfD9Luraf8/+B7qg60zbZfAwVAZiHNRXVT7e2qlvzQpwyS93fukt2rnyXTRXTusfq4OFLyZQYkyaHkWSR9pOrd+iwspI1I/r13zOQHHLx1Ggi4I+Tdx7Kdy80F/DFmPmrxy2XMPItDVQHTEFmSEMqYFav1/J9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnozfTDaDHrMgp8BMz+FwVQ5NvZ3Q1O8h76Opf1XZ9Q=;
 b=Bby8fqP0JYlb910movNU+x6loE6EnsxlrxZrPemEZyxn4Lnv7ER5JnUPcM1MwtTHSgyLZNq67oC8MxShoIUXoshnpAU7C5K4VnUZSX+lwNTr2f5B8mfCL1rl8vNkwnWgqPcDKY5lMh2nCrrAAjjhYkFgWNQHt29X6YM83cr1CNA=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM0PR04MB7059.eurprd04.prod.outlook.com (2603:10a6:208:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Mon, 19 Feb
 2024 08:36:50 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7292.029; Mon, 19 Feb 2024
 08:36:50 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: =?iso-8859-2?Q?Ond=F8ej_Jirman?= <megi@xff.cz>
CC: "linux@roeck-us.net" <linux@roeck-us.net>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Jun Li
	<jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: typec: tcpm: reset counter when enter into
 unattached state after try role
Thread-Topic: [EXT] Re: [PATCH] usb: typec: tcpm: reset counter when enter
 into unattached state after try role
Thread-Index: AQHZ03iJxTdCLidINECJvoMPDcTmKrEE5imAgA1nOGA=
Date: Mon, 19 Feb 2024 08:36:50 +0000
Message-ID:
 <DU2PR04MB8822C9D65EBDE43845D369E48C512@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20230820151518.1403006-1-xu.yang_2@nxp.com>
 <odggrbbgjpardze76qiv57mw6tllisyu5sbrta37iadjzwamcv@qr3ubwnlzqqt>
In-Reply-To: <odggrbbgjpardze76qiv57mw6tllisyu5sbrta37iadjzwamcv@qr3ubwnlzqqt>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|AM0PR04MB7059:EE_
x-ms-office365-filtering-correlation-id: d69da308-be39-4cac-3fe7-08dc3125eb19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /gcCD7TlhWlllfoFMV5LMx8aDFuBCCIZouL4OGzcQNyhP01OeRbj+3SN27HSus3doBfBDk/MORxUovi2hp3bnejyNK/MzdrwSnDjCykinJkaHnQuE7yV1pPnlPbmIl6N/BCcG7Ch1Q/pIeK0LG++Lerb084muFc2qjY1+xogeFbcQNompAIdgX5y56oLiYMf13S4hgJg8TPN3+o8LgK8tQZQhfB9si7tAGLzyksiw9SfmldCQH8Q1R/9Yw1U13/TkIOP7GkYabmY3WWqpRP2c+3kgaXQi9Ah7Q514VICjtNJyKO/5jpaJVv837vBp/Wqj9nvJRXI0ZCtZUYnoOr8cbcxizlllD6ZuSPV4xOuZ0t7OzAR0wp29zevolUspnrKE5NX1YQI2Q0KV5URbSEEg7jEVqpNhK5aapD4msJjzBad/TZ8eZxoIvMU/sOzaQ6N2ztX7Nyt3YfJ2hxFbwdsrstU0/Vxwl55zxzOC36sf5JsYZGQUypKkRYKs9kXrUa2oCyz881yZuL95SGJ4Ryf8B1oM/J38gGXfyVkugVB11FNvsuw3CGqtI0x5xMC7OYDmYhyONRsEJxTsHaH3hjd2ZvuzJFOrokKc7uhGoDN3Vs3JiOvV65bXx+hVJNcW/cV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38070700009)(8676002)(26005)(41300700001)(66574015)(83380400001)(8936002)(64756008)(66476007)(66556008)(66946007)(4326008)(6916009)(76116006)(316002)(66446008)(52536014)(9686003)(478600001)(7696005)(71200400001)(54906003)(6506007)(33656002)(122000001)(38100700002)(86362001)(5660300002)(2906002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?+QLT9DEouCSFhBHd+mjw1n6EhQJqW7oMBnQIot1Uc3ofUzJDLdbJ+Yc7kz?=
 =?iso-8859-2?Q?1ph/vBYOt/bP1lwvOlJCctTsMyB8NRAjbfq+jKAsg+5Q9ZtWqUDVcbGpYD?=
 =?iso-8859-2?Q?/eXPoCnhCztWXVohO03MWfPObRnIHG0DRP7x1ATAR0oN28/SxKPElh4vsB?=
 =?iso-8859-2?Q?ZljaqWjFlcQtqRKX6dQtWePd+wlZFOblgZqvyH2ZUVpfWZB4Tgum96EBkx?=
 =?iso-8859-2?Q?4Mocc4k3u7UdD4egyQLoxo1mCdathvPMn+PTasENT3UuHvn3RDI/t8qNGV?=
 =?iso-8859-2?Q?i6Wu9eeHDijkG9DUEFimO1fdoHs0cyirIGCTV38HwvNaIqeZGCyXfwoTJ2?=
 =?iso-8859-2?Q?uHEH5UUXgdfYJdxpMN4mGWttNI9PtRBweAhEAh3rgABQX6y8DWnuyzvEKq?=
 =?iso-8859-2?Q?bYsZP4KihHZT5wpQS9Gte06m4KMZTZMSDyHCHjnJ1eEJsRsp8unCBZLUxE?=
 =?iso-8859-2?Q?JvTdi0Ew9K+GtWumEMvmXpRxiH5JPOK/yVw1wUzgjZ5+STel7iov0uG/+G?=
 =?iso-8859-2?Q?94m81kq8ouapUkZDGH2Zlm4xfzmefk/GNFDIT6FOOtvkNZaMhCjv3wLMWC?=
 =?iso-8859-2?Q?L+SfqH0wctu7imsEGD8wCkOHkktRIPTgklUrIyfQNvAEnmuXSExrrZMwe/?=
 =?iso-8859-2?Q?OYbJ/GlrUacVNlyliI51kip2HP3Hr5Hffu29OOuFtJoKCjsKdhv67TI/s1?=
 =?iso-8859-2?Q?uJrx/OCUDa7x/H/b74gRh5MKGhWC6CLYkn9b9aJ8gUuuTuwKwbSudZH+GS?=
 =?iso-8859-2?Q?/e6XmNcr2VXZkfn6LRkagHUBqypSacBSXEG0hEy4EhhoDHSPt7tJSbiI+Z?=
 =?iso-8859-2?Q?+vEOa2LDxDeCfVG0jJUJ07+8+RAigNAYPx+oWcHzd+MMWhKUczPWKBG5rJ?=
 =?iso-8859-2?Q?rYtEGFpfRG7b2rIaItWJTd98g1Fcue3VAQ70ILZyZWYcW9100ONJP7rHHA?=
 =?iso-8859-2?Q?Z5VtT0rPXg/nD0ZfS4tlnmNHahik95EvTNAyYyFin4oi4zsr3d0OULeZDC?=
 =?iso-8859-2?Q?uIGCUwLSOHShFc78u9hPmEN7SMx4scLVyJMhmxsjtRK9WFK7U7g5omFHr0?=
 =?iso-8859-2?Q?A9IP/H5o5FsjpIGpZolaMEEJRnVDSLOLUc3fo5X59zAR76ZyfFvsEVmx2u?=
 =?iso-8859-2?Q?8tk1Yhuu3BueEk/AXBFiv0+Nukv5G4XrKxaogzjCY0TYa0jKtg+M/XhUzj?=
 =?iso-8859-2?Q?Ia8SUzJxXHWCZ6U8Io9THk9Uy5HUXU7ErY5FGXXnOtfvkH+OoKOIpXjPI8?=
 =?iso-8859-2?Q?a+Y1BXi5BeRqQalrkfkIJF63vKc0low1HTPJjKsqI5qeRsC1roFPdJY802?=
 =?iso-8859-2?Q?WHcJjfnwWNlqALN4vazD0IVM2t6VuLcObq4+BJZSvk3oHgtx/FaBwT0/6d?=
 =?iso-8859-2?Q?OJVlPwbfQPUE3LOoz/oY4yRZOB5qjxTDjk+mRAIOZhB9Dq9kVl8L1K873B?=
 =?iso-8859-2?Q?nYwZ9j62eMWoj4HErpRR4rwwo5fRlL71ky3I3SDEmvp29mro8ABs2Tyf3B?=
 =?iso-8859-2?Q?xIY1pjA67mI4ieeUdhiYJ51Fj/be60rCVJIFOeICtS2u3nOYjNQovU/bJ0?=
 =?iso-8859-2?Q?mZvdNOuP4MKpCEGK4MytaEwVsTALKvETkRMcVij4NQQ8Auw8Bl6ZUl+DZF?=
 =?iso-8859-2?Q?yJzgcTNVKVtNs=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69da308-be39-4cac-3fe7-08dc3125eb19
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 08:36:50.7121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57lhnJZ3rlCePFnThCKACFoQNpM5VjtBUpMwJsUiI9lycJrk7icNEMmaihdZBzJ3lDb6KSe473zfkK6Vgoefrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7059

Hi Ond=F8ej,

>=20
> Hi,
>=20
> On Sun, Aug 20, 2023 at 11:15:18PM +0800, Xu Yang wrote:
> > The try_src_count and try_snk_count may still be 1 after enter into
> > unattached state. This may be caused by below case:
> >  - SNK_TRY->SNK_TRY_WAIT->SRC_TRYWAIT->SNK_UNATTACHED
> >  - SRC_TRY->SRC_TRY_WAIT->SNK_TRYWAIT->SNK_UNATTACHED
> >
> > The port->attached is not true at the end and tcpm_reset_port() will no=
t
> > be called. This will reset counter into for these cases, otherwise the =
tcpm
> > won't try role when new cable attached.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 5639b9a1e0bf..c9a186a8c58c 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -3719,6 +3719,9 @@ static void tcpm_detach(struct tcpm_port *port)
> >       if (tcpm_port_is_disconnected(port))
> >               port->hard_reset_count =3D 0;
> >
> > +     port->try_src_count =3D 0;
> > +     port->try_snk_count =3D 0;
>=20
> This patch breaks partner detection for USB type-c hubs and USB type-c do=
cks.

I guess the type-c port of hub is sink-only and the type-c port of dock
is DRP, right?

>=20
> Connecting an unpowered USB-C 4-port HUB:
>=20
> Before reverting this patch: (endless loop)
>=20
> [    0.657246] Setting usb_comm capable false
> [    0.661870] Setting voltage/current limit 0 mV 0 mA
> [    0.661880] polarity 0
> [    0.661883] Requesting mux state 0, usb-role 0, orientation 0
> [    0.663879] state change INVALID_STATE -> SNK_UNATTACHED [rev1 NONE_AM=
S]
> [    0.663891] CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED, polarity 0=
, disconnected]
> [    0.663897] 4-0022: registered
> [    0.663962] Setting usb_comm capable false
> [    0.669903] Setting voltage/current limit 0 mV 0 mA
> [    0.669914] polarity 0
> [    0.669917] Requesting mux state 0, usb-role 0, orientation 0
> [    0.672166] cc:=3D2
> [    0.679360] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 1=
00 ms [rev1 NONE_AMS]
> [    0.779554] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 10=
0 ms]
> [    0.779570] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [rev1 N=
ONE_AMS]
> [    0.779576] Start toggling
> [   12.957711] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, conn=
ected]
> [   12.957720] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> [   12.957729] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [=
rev1 NONE_AMS]
> [   13.157924] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
> [   13.157939] cc:=3D2
> [   13.167339] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev=
1 NONE_AMS]
> [   13.267545] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
> [   13.267561] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
> [   13.267566] cc:=3D3
> [   13.278148] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED=
 @ 100 ms [rev1 NONE_AMS]

Based on my assumption, the DRP port is presenting Rp-default termination o=
n CC line again,
then tcpc should report CC change due to a connection is established in 100=
 ms. However, this
CC change is not reported here. This leads to state from SRC_TRYWAIT to SRC=
_TRYWAIT_UNATTACHED
rather SRC_TRYWAIT_DEBOUNCE.

Below log is a normal case.

---
[  149.954434] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connec=
ted]
[  149.954447] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[  149.954452] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [re=
v1 NONE_AMS]
[  150.154543] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
[  150.154554] cc:=3D2
[  150.154859] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [rev1 =
NONE_AMS]
[  150.254881] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
[  150.254893] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
[  150.254896] cc:=3D3
[  150.255200] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED @=
 100 ms [rev1 NONE_AMS]
[  150.257288] CC1: 0 -> 0, CC2: 2 -> 2 [state SRC_TRYWAIT, polarity 0, con=
nected]
[  150.257295] state change SRC_TRYWAIT -> SRC_TRYWAIT_DEBOUNCE [rev1 NONE_=
AMS]
[  150.257300] pending state change SRC_TRYWAIT_DEBOUNCE -> SRC_ATTACHED @ =
200 ms [rev1 NONE_AMS]
[  150.457319] state change SRC_TRYWAIT_DEBOUNCE -> SRC_ATTACHED [delayed 2=
00 ms]
[  150.457329] cc:=3D3
[  150.457606] polarity 1
[  150.458314] Requesting mux state 1, usb-role 1, orientation 2
[  150.460722] vbus:=3D1 charge=3D0
---

So the issue may be why that CC change is not reported?

Please refer to USB Type-C Specification
Figure 4-17 Connection State Diagram: DRP with Accessory and Try.SNK Suppor=
t

Thanks,
Xu Yang

> [   13.378347] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [delaye=
d 100 ms]
> [   13.378364] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED [rev=
1 NONE_AMS]
> [   13.378373] Start toggling
> [   13.387019] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS]
> [   13.462597] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, conn=
ected]
> [   13.462606] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> [   13.462613] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [=
rev1 NONE_AMS]
> [   13.662808] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
> [   13.662827] cc:=3D2


