Return-Path: <linux-usb+bounces-2160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAF67D647B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 10:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57EFE281B06
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 08:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C61C1C69C;
	Wed, 25 Oct 2023 08:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="hDa4ol86"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D947D1C68A
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 08:05:39 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019C612A
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1698221137; x=1729757137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gQjWmDR06k0noMKt1cCCHlKOhpVphHAxm5FFcQ166ok=;
  b=hDa4ol86kbfGgq09ShiWLjG5ngN7EPEeV94jmsZxUHYYypyLKzsAWDJK
   SWPBUVeGcUbab4/L0QN6bBBjgrw/LmpMFsdJRUQgVj96MQeyLKygPT4HG
   jjjgWvVu7tmXsgeCTEvL1YR0i2CV+qdL2oGT5p4iAZ0nSVKS9OcNytfID
   qK1MTvE8c8Yt/icOcA1i+lAt+/pX0VcHH2tCu/wrw6L9TFupABEPPYcjY
   RjSyMhaHw3g9gUK1U4mPeuRVza8En3tJeEP1CyaUlE+hn1v+VJ87LFg9K
   AMPN4eDPT1+jSCbwc+VRuFikXLYQnvJvbR2guXmlJExTBpWkyd1WE9/7T
   Q==;
X-IronPort-AV: E=Sophos;i="6.03,250,1694728800"; 
   d="scan'208";a="33642011"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 25 Oct 2023 10:05:35 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0126828007F;
	Wed, 25 Oct 2023 10:05:34 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/1] usb: dwc3: let role switch handle initial state
Date: Wed, 25 Oct 2023 10:05:38 +0200
Message-ID: <2176034.Icojqenx9y@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231020224330.e4tddtcer3uv2eb7@synopsys.com>
References: <20231017055726.904133-1-alexander.stein@ew.tq-group.com> <20231020224330.e4tddtcer3uv2eb7@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

Am Samstag, 21. Oktober 2023, 00:43:39 CEST schrieb Thinh Nguyen:
> Hi,
>=20
> On Tue, Oct 17, 2023, Alexander Stein wrote:
>=20
> > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> >=20
> > When we have a role switch device attached, we should not configure our
> > initial role. Leave this up to the role switch device, that should
> > detect and signal the initial role.
> >=20
> > This fixes situations where a Type-A plug is connected already when the
> > driver is loaded but the default role is set to none or device. In this
> > case only an disconnect / reconnect gets the correct mode.
>=20
>=20
> If the default role is none, why isn't there a notification to update
> the role on initialization from the connector? The current role should
> not be none.

dwc->role_switch_default_mode can only be none if the DT is misconfigured,=
=20
e.g. role-switch-default-mode =3D "";

Calls to usb_role_switch_set_role() from usb role switch drivers will not=20
affect dwc->role_switch_default_mode.
I'm wondering if checking for a misconfigured DT is sensible. But this will=
 be=20
detected by 'make dtbs_check'.

Best regards,
Alexander

>=20
> BR,
> Thinh
>=20
>=20
> >=20
> > Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > I couldn't find any information whether USB role switch drivers are
> > supposed to call usb_role_switch_set_role() during their probe.
> > But this seems sensible, otherwise the actual/initial state is unknown.
> >=20
> >=20
> >  drivers/usb/dwc3/drd.c | 13 +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> >=20
> >=20
> > diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> > index 039bf241769af..1c2e504a5d8ba 100644
> > --- a/drivers/usb/dwc3/drd.c
> > +++ b/drivers/usb/dwc3/drd.c
> > @@ -496,15 +496,8 @@ static enum usb_role dwc3_usb_role_switch_get(stru=
ct
> > usb_role_switch *sw)
>=20
> >  static int dwc3_setup_role_switch(struct dwc3 *dwc)
> >  {
> > =20
> >  	struct usb_role_switch_desc dwc3_role_switch =3D {NULL};
> >=20
> > -	u32 mode;
> >=20
> > =20
> > =20
> >  	dwc->role_switch_default_mode =3D
> >  	usb_get_role_switch_default_mode(dwc->dev);
>=20
> > -	if (dwc->role_switch_default_mode =3D=3D USB_DR_MODE_HOST) {
> > -		mode =3D DWC3_GCTL_PRTCAP_HOST;
> > -	} else {
> > -		dwc->role_switch_default_mode =3D USB_DR_MODE_PERIPHERAL;
> > -		mode =3D DWC3_GCTL_PRTCAP_DEVICE;
> > -	}
> >=20
> > =20
> > =20
> >  	dwc3_role_switch.fwnode =3D dev_fwnode(dwc->dev);
> >  	dwc3_role_switch.set =3D dwc3_usb_role_switch_set;
> >=20
> > @@ -526,7 +519,11 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
> >=20
> >  		}
> >  =09
> >  	}
> > =20
> > =20
> >=20
> > -	dwc3_set_mode(dwc, mode);
> > +	/*
> > +	 * usb_role_switch should implement initial detection and call
> > +	 * dwc3_usb_role_switch_set to get the state machine running
> > +	 */
> > +
> >=20
> >  	return 0;
> > =20
> >  }
> >  #else
> >=20
> > --=20
> > 2.34.1


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



