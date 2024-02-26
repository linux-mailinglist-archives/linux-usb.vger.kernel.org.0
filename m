Return-Path: <linux-usb+bounces-7034-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9100B86684C
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 03:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3FED1F21BD8
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 02:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A01EEDE;
	Mon, 26 Feb 2024 02:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="G2OAFJ1g"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2089.outbound.protection.outlook.com [40.107.7.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C84DF4D
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 02:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708915468; cv=fail; b=PmlW5BxJTMRsmEkbYoEQWmhMlxWwpJ+gowRamW+DBd2GEwc7KpYyoKLm3i7ORWJ6KmDoMjnWjATZRy8Xk6KpzsLV2ss4puP33JEp6zMZuWzfYu/YBYIX0gNfzKZsNfEvxt5HUjNieRPeohZWBd+W9gITgudRTykmcHNcvUg5Qmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708915468; c=relaxed/simple;
	bh=3BUV+9nmoJf96lRajHsSvNtCXJ7sToEvF5UyyOiBsVs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D521pFthE69Bj15sESR0CJJ5mmwYl/BsuLKGFKBDNH+R9wiFHhmSI5jHf0b9s9/LN2GXfxZQMa0V8yTc4rl06cHSFmiWiRJRHvwH91A2pDsBpGcpjSy8mZdzHNryqqcCa5cGfw3ii1d7V7ZlBkNnNDyGtEKJXjm52ZlhwKm/kU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=G2OAFJ1g; arc=fail smtp.client-ip=40.107.7.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFrjqn8G1TSU+GD4WMmZzCqL5+mlt6KzM3fdyeMtahB2H87PSo5TDwOoBe+tQPWNS8iwOIdvMcV8Ks/n5ooGa/UaoKSeO0vGlPpcGZjk33mR3Ur5EceH/yyuAUxPLZ4jSAEpZ/FAfudoceb2zu8ji56AJcvFVLQfKs6CbAt/j70g/IFoHwPynN6kKMAHD4Er06mlURBeQowtQytBX5KhiKzSKvU1GAm3Oe42bZaK4XXDXpIyfxCPUBxS8Iq9ZE5/q07pZt5uMiD2/vuDJ8UvHThikSbgzQ3os6ibUsIsNNCDN1rqbyVscHMOJ/K87ae2dyL5273DNzxsHPoF7pEolQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jWWVNWcrDSEe4+WnkHQAl0tUhyZt7f4jRkAR/7Waag=;
 b=K1aSeR9Hoijmm/HD6mXSyoHfWWLMgz4izJK/AHWEuZy25nqOt7TmE6L0Kctb73CPk6j7+crkxHGFrPTjgtOrfZLn1uW+CtA9DQ3J1zk40Q6pzvDFTGSiqWgrmoebDKrnC2hyId7kI2ITBIgOUp1gWhI0tnSzcmWEpPpc9yN82LUfYrPhr3iLVmwApS3f3L7s0Zv0uFa1/MlJt9YeNAmnZ2DwcuKqn9YlzGhGWbNGMqZ0OawzYvMnUhJYv7MrFJ1Kj4+cIQYNzxDaVjhy/4lXmauEu4fJM1Y12EZoBrn8FU1KYuFSAksGexXYBT8Hasp3mw8K9/r5gObUtpmaAKfYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jWWVNWcrDSEe4+WnkHQAl0tUhyZt7f4jRkAR/7Waag=;
 b=G2OAFJ1g3hJMDYUs6KSKLy000xZ70aNoWhaqRXgZFNHHN5/BMuwjW4r+qZbbZ/SwXgkG3O4K7lLeBDHvPj3VZKcvefHqQ1jucgaLxwDEHFWKop6G7ae1SpLu3VUFbtxC+W2APifMVM1Q2nvRy769EnmNBW7W+bAb7aDcvftHCMo=
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAXPR04MB9278.eurprd04.prod.outlook.com (2603:10a6:102:2b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 02:44:22 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 02:44:21 +0000
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
Thread-Index: AQHZ03iJxTdCLidINECJvoMPDcTmKrEE5imAgA1nOGCAB7KhgIADCWCA
Date: Mon, 26 Feb 2024 02:44:21 +0000
Message-ID:
 <DU2PR04MB8822D2EFFD69F1D57872D5428C5A2@DU2PR04MB8822.eurprd04.prod.outlook.com>
References: <20230820151518.1403006-1-xu.yang_2@nxp.com>
 <odggrbbgjpardze76qiv57mw6tllisyu5sbrta37iadjzwamcv@qr3ubwnlzqqt>
 <DU2PR04MB8822C9D65EBDE43845D369E48C512@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <fgrfpifljfg64uz6vck6viooqy4zhd2f5xi6e52m6jsh6vt3wi@6c4nlklkgbe7>
In-Reply-To: <fgrfpifljfg64uz6vck6viooqy4zhd2f5xi6e52m6jsh6vt3wi@6c4nlklkgbe7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|PAXPR04MB9278:EE_
x-ms-office365-filtering-correlation-id: 9cab616b-1b0d-4783-9dbc-08dc3674d607
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 udmvRvlRhsN5kvi5dStBLwhj7f2HNSinwmilF6BdWR3+j3fiYsh9JudBMXAMyRmI2JSHof4x+B9FJ1EgEjwclt8+aYD10j+B2I3Fxkn4Z/AQWHnSuWdYEpt2kPT5R/EM3AafgAm2PTYzaQAepIjOo4SP9Rs7dw7ftdG9GmSzmMacfce0/1LbZ9d7mh9v8zzZj45bDg2JFMZ0TIG8CM2jXsB+WgV2yEXPAwM117EcUmAG8yNbWdmQWa8Lx9/oO9bA8wxigicFcfxPrblojfn8HLImGADKOokQlKKbOgylG95fGDE+cU6KPpKBqcnjyJfoNta6hUHnUABGI0+xNekTBv0mEVE0nedWb73UlurM8gPUFdKD+Q/26IO19rojjwRt6QcG6b4MbJV4W9gdNc8nB3XZnSZFxLCHD0LL9tqxLD4+uiWCTwIG89EtxCThcawRfhiH+uxdABen1Dw/llVkvAtKxHFy2np6rYnaAbbkCl9jpJwWGklneNcUDkYy8Z0kXUM0UPpn+ABTxDQ0VHJI1WIJCcIYs+hHE5DIDC+ZKvtL7cY0L+ss0TSl7N94S06d6Qx914L+M07CfNNM1TuJcKc6FG7X7yR5YHkgXK2hzHhaLCuwSOP2hdBtap7JR12RkRsb+NMB5br/SaCGZEq7+Ae6ZLtga/A47b0ZxtHJ59PKpT3gIBCvXUKpS83wAEO1NStLTnWPX+yEybnV82B41Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?toBZtCpzQ7EBqEayLPm0HLt2LCsOrjt4QLSpZUZGulTN5KNJJ1PrAW8DN5?=
 =?iso-8859-2?Q?kym55uwZMw+3/lPxhrQ+M97YE+twQOmx+TRE5mEdzC7q2ecNKsTiZJSIPK?=
 =?iso-8859-2?Q?a0zwqiD0rkQt2HdXVt+F5plTJaCLLXR3jBMNa1PXPQ7nhoW0WIcba6c2Bc?=
 =?iso-8859-2?Q?8Sm/2Zdbuq5rbKSp/b2BpMPju3GsRigTvKvYQlX3PDXT95euzh8k4y89Xz?=
 =?iso-8859-2?Q?vX1YpCV1cqKHP2moWJZB6c8/YkuOKoWRXi2/A85li7T6oDIUAL7BMEtPz8?=
 =?iso-8859-2?Q?mrFknLm9sDRsNh2YOzEBougGEOmNEWdwDcyfnsn/6d8GEx00nTMr/wRco2?=
 =?iso-8859-2?Q?cBK8t7hiSPdmvQQZPQ6+H8quBlaf+yVLqEykl0dj1RP0uUAvwDJfL463ak?=
 =?iso-8859-2?Q?qqFGug+aHLlbAfV2CpLVa10j4OdddvaP3I0ZtebS8TxyxONQ9XCoR8hB2a?=
 =?iso-8859-2?Q?mjpeUfdnWslBuCX3pAlF10fGB9u8g+Ji3gCHc+4vsRcQYcvd68A7CZSW9/?=
 =?iso-8859-2?Q?LrZkw4ngoDMm2zMC+FdXbXgUQnLxsGEwqRsgWAYS4wNxwbxv8IMeBm+XwO?=
 =?iso-8859-2?Q?zTkLhBkDQU6NBnA6sJ7g/YGrldUEHb7cFeE1R0Gje21zHrrX2Bf5tvEPen?=
 =?iso-8859-2?Q?+h70WIrFtS2tPqHbwpMKXzBkHqIc01HyAAP4moE4E19oJlIL3KsiAfAfWH?=
 =?iso-8859-2?Q?D3z6iQWACBpZhCcwem1P/q9xKochY3G3LIwG+MbwilgtDft+5oPVugrK7S?=
 =?iso-8859-2?Q?XbyPM0lS3XWUhA+2JsBP8mQuCPRyId2OfnTki3OD695kHvN4kb0WmkJiNQ?=
 =?iso-8859-2?Q?saGw/hwNZ4nTvS13Yao7ETDP+WXX1FdvbTwTtg+pFdoS92s2GS9dG0nIrt?=
 =?iso-8859-2?Q?iUoAfx+hO1nO82Vl/nEVBssFb3DwLKQ/sT3BzgQu50V2sY9NqGff8T4Dgc?=
 =?iso-8859-2?Q?vcx2Ol9YdJk8kxFdt3+VO0Z4ER4UrxeLMEry3wlnacY+PJP8Nlx1Eka1JW?=
 =?iso-8859-2?Q?Yxbqq0+WGTYHiSmCL34jxQFJeTx+M1yOqqK9oKNwWdq8Nd3kkbjV60qox5?=
 =?iso-8859-2?Q?+BVaPt+056TEcOyhIFQ47xOD4VRaQJh1C7y70lq85pLlNiquU2R1rpMiLt?=
 =?iso-8859-2?Q?rEYwTVuV9GVS0LcGVYAnYPL4y3glasEIoZx5mKEHvOp0cZyl7Vftln0pVB?=
 =?iso-8859-2?Q?8l9e+DJ4vwl56K087M5UY8mKB8vRumx0GQFx2HEuNJ0b03vJIz7MM6mRst?=
 =?iso-8859-2?Q?pUm79mNSuxlDfAsRNnk3LoK3PQVsvfedMzbRf+1Kofn0BVpntQOhMdNFGq?=
 =?iso-8859-2?Q?3cRk+tsdMiUPtnOu5Ghqu67hGKP08bUTcEs3sSGLI2ePpBpAoYjISI+fjG?=
 =?iso-8859-2?Q?LITCPEfdyJe71z4SJwKsHQhATJnj7zvCb0TKzWFSTcAoVQkiTR3n9YEz9U?=
 =?iso-8859-2?Q?zVGBxo5W7HEL0dfwIXYGthtHyf6sMWiPekP2sCQiOZYnckWsl50Kcsr9F4?=
 =?iso-8859-2?Q?G1vGSchm8ILcZ+IEgu/BKFA1BgsJa1mQmOybPvXbCBE6lbIZCSxmBcRtbt?=
 =?iso-8859-2?Q?CXaikJkZTNNUhrRVDzwM0aogKzSt96mpUQXgECpXCce++oi51AR7dDkBQl?=
 =?iso-8859-2?Q?rb2t3HtzxhObc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cab616b-1b0d-4783-9dbc-08dc3674d607
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 02:44:21.4420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5lbKBjARe3l/5pp4GIkr5m3QDWQWZkhWxZ8kZCQ8Dwry0bcWqQJ2cxjAqeUcWUjK6waK4Icsojzf61pT7UvvNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9278

Hi Ond=F8ej,

>
> Hi Xu,
>
> On Mon, Feb 19, 2024 at 08:36:50AM +0000, Xu Yang wrote:
> > Hi Ond=F8ej,
> >
> > >
> > > Hi,
> > >
> > > On Sun, Aug 20, 2023 at 11:15:18PM +0800, Xu Yang wrote:
> > > > The try_src_count and try_snk_count may still be 1 after enter into
> > > > unattached state. This may be caused by below case:
> > > >  - SNK_TRY->SNK_TRY_WAIT->SRC_TRYWAIT->SNK_UNATTACHED
> > > >  - SRC_TRY->SRC_TRY_WAIT->SNK_TRYWAIT->SNK_UNATTACHED
> > > >
> > > > The port->attached is not true at the end and tcpm_reset_port() wil=
l not
> > > > be called. This will reset counter into for these cases, otherwise =
the tcpm
> > > > won't try role when new cable attached.
> > > >
> > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > > ---
> > > >  drivers/usb/typec/tcpm/tcpm.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm=
/tcpm.c
> > > > index 5639b9a1e0bf..c9a186a8c58c 100644
> > > > --- a/drivers/usb/typec/tcpm/tcpm.c
> > > > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > > > @@ -3719,6 +3719,9 @@ static void tcpm_detach(struct tcpm_port *por=
t)
> > > >       if (tcpm_port_is_disconnected(port))
> > > >               port->hard_reset_count =3D 0;
> > > >
> > > > +     port->try_src_count =3D 0;
> > > > +     port->try_snk_count =3D 0;
> > >
> > > This patch breaks partner detection for USB type-c hubs and USB type-=
c docks.
> >
> > I guess the type-c port of hub is sink-only and the type-c port of dock
> > is DRP, right?
>
> The hub is sink-only, yes.
>
> > >
> > > Connecting an unpowered USB-C 4-port HUB:
> > >
> > > Before reverting this patch: (endless loop)
> > >
> > > [   12.957711] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, =
connected]
> > > [   12.957720] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AM=
S]
> > > [   12.957729] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 =
ms [rev1 NONE_AMS]
> > > [   13.157924] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 m=
s]
> > > [   13.157939] cc:=3D2
> > > [   13.167339] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms =
[rev1 NONE_AMS]
> > > [   13.267545] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
> > > [   13.267561] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AM=
S]
> > > [   13.267566] cc:=3D3
> > > [   13.278148] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTA=
CHED @ 100 ms [rev1 NONE_AMS]
> >
> > Based on my assumption, the DRP port is presenting Rp-default terminati=
on on CC line again,
> > then tcpc should report CC change due to a connection is established in=
 100 ms. However, this
> > CC change is not reported here. This leads to state from SRC_TRYWAIT to=
 SRC_TRYWAIT_UNATTACHED
> > rather SRC_TRYWAIT_DEBOUNCE.
> >
> > Below log is a normal case.
> >
> > ---
> > [  149.954434] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, co=
nnected]
> > [  149.954447] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> > [  149.954452] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms=
 [rev1 NONE_AMS]
> > [  150.154543] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
> > [  150.154554] cc:=3D2
> > [  150.154859] pending state change SNK_TRY -> SNK_TRY_WAIT @ 100 ms [r=
ev1 NONE_AMS]
> > [  150.254881] state change SNK_TRY -> SNK_TRY_WAIT [delayed 100 ms]
> > [  150.254893] state change SNK_TRY_WAIT -> SRC_TRYWAIT [rev1 NONE_AMS]
> > [  150.254896] cc:=3D3
> > [  150.255200] pending state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACH=
ED @ 100 ms [rev1 NONE_AMS]
> > [  150.257288] CC1: 0 -> 0, CC2: 2 -> 2 [state SRC_TRYWAIT, polarity 0,=
 connected]
> > [  150.257295] state change SRC_TRYWAIT -> SRC_TRYWAIT_DEBOUNCE [rev1 N=
ONE_AMS]
> > [  150.257300] pending state change SRC_TRYWAIT_DEBOUNCE -> SRC_ATTACHE=
D @ 200 ms [rev1 NONE_AMS]
> > [  150.457319] state change SRC_TRYWAIT_DEBOUNCE -> SRC_ATTACHED [delay=
ed 200 ms]
> > [  150.457329] cc:=3D3
> > [  150.457606] polarity 1
> > [  150.458314] Requesting mux state 1, usb-role 1, orientation 2
> > [  150.460722] vbus:=3D1 charge=3D0
> > ---
> >
> > So the issue may be why that CC change is not reported?
>
> But there is no change. Your log has:
>
>   CC1: 0 -> 0, CC2: 2 -> 2 [state SRC_TRYWAIT, polarity 0, connected]
>
> How to interpret this? This is with fusb302 driver. The driver has bunch =
of

When try sink fails (note: cc:=3D2 in this period), the tcpm will change to=
 SRC_TRYWAIT
state and it will pull up CC to Rp-default (cc:=3D3). Since the partner is =
a sink-only port,
I think the type-c chip will sense a connection is established. Therefore, =
a CC change
event is reported by type-c chip. I'm not sure the behaviors of fusb302 chi=
p when set
cc:=3D3. If it does not generate interrupt for this change, then tcpm may t=
hink the partner
has been disconnected and move the state to SRC_TRYWAIT_UNATTACHED. Maybe i=
t's a
real hw issue or the event is masked by sw.

Is this dock also failed to connect other sink-only devices?

> gates to not report cc status when it doesn't change:
>
> https://elixir.bootlin.com/linux/latest/source/
> drivers%2Fusb%2Ftypec%2Ftcpm%2Ffusb302.c%23L1215&data=3D05%7C02%7Cxu.yang=
_2%40nxp.com%7C836aa20d8f9549e9
> 636008dc34ea9e0f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63844342947=
2475922%7CUnknown%7CTWFpbGZ
> sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C0%7C%7C%7C&sdata=3DbCXr5obX2B
> hKh5ZZt7CZHQ6OLhJ7JFgSPkW7f49NKfs%3D&reserved=3D0
>
> in several places where tcpm_cc_change is called. Not sure what is the
> expectation of TCPM state machine, whether it always expects tcpm_cc_chan=
ge()
> call after it calls set_cc callback, or what exactly.

I think the tcpm_cc_change() will be called only when a real CC change happ=
ens
on the CC line. It's irrelevant to whether tcpm_set_cc() is called or not.

Thanks,
Xu Yang

>
> kind regards,
>         o.
>
> > Please refer to USB Type-C Specification
> > Figure 4-17 Connection State Diagram: DRP with Accessory and Try.SNK Su=
pport
> >
> > Thanks,
> > Xu Yang
> >
> > > [   13.378347] state change SRC_TRYWAIT -> SRC_TRYWAIT_UNATTACHED [de=
layed 100 ms]
> > > [   13.378364] state change SRC_TRYWAIT_UNATTACHED -> SNK_UNATTACHED =
[rev1 NONE_AMS]
> > > [   13.378373] Start toggling
> > > [   13.387019] state change SNK_UNATTACHED -> TOGGLING [rev1 NONE_AMS=
]
> > > [   13.462597] CC1: 0 -> 0, CC2: 2 -> 2 [state TOGGLING, polarity 0, =
connected]
> > > [   13.462606] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AM=
S]
> > > [   13.462613] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 =
ms [rev1 NONE_AMS]
> > > [   13.662808] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 m=
s]
> > > [   13.662827] cc:=3D2
> >

