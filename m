Return-Path: <linux-usb+bounces-12859-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DB3945096
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 18:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43AC4B27040
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 16:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F001B3F38;
	Thu,  1 Aug 2024 16:30:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBED1B3F36
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722529800; cv=none; b=RSYy2q31nfm8MwDmeXcHwosim6TYyjplXaQRqhmuTPUD2Q7+l0ezqqNstwyEqvR3SlsmM/GG/6ZhPBhAXvOywODr9WXsokPrmla4v4xR3uwypfQTpp/4Q1Owj7a5zu6oz7OJxfs/DFIaDXX3KQv9e4MWOfdt0J6rhbM38jgxPtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722529800; c=relaxed/simple;
	bh=h1e3D1sl9LoR/xsWC6N2KZaZxOo4VbuUNcen5+mppT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0mQp+eX/LZmJgNI6XTlBaaq8HpO7O+SK0tSMh4pSP+rutaTnAFisORK/pHi7BeRXQWp0pygkijfhKUJHl+BHGHQgDg5k33HVM6HVVFlKc6U2qQ/RoyT7DgTZsMtoEigojp3F+5rOdqhx9pJTxCv8kS20ypNcFoOshzrlN8Mjlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1sZYgW-0002Iv-5T; Thu, 01 Aug 2024 18:29:48 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1sZYgV-003oGV-2j; Thu, 01 Aug 2024 18:29:47 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1sZYgU-00D2cg-2w;
	Thu, 01 Aug 2024 18:29:46 +0200
Date: Thu, 1 Aug 2024 18:29:46 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robh@kernel.org,
	conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
	linux-usb@vger.kernel.org, imx@lists.linux.dev,
	kernel@pengutronix.de, krzk+dt@kernel.org, shawnguo@kernel.org,
	andersson@kernel.org, linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: gpio-sbu-mux: Add an entry for
 PTN36043
Message-ID: <20240801162946.l423ue5ihfcxfiia@pengutronix.de>
References: <20240801064907.3818939-1-xu.yang_2@nxp.com>
 <3akk6hydu6iguqik3ek2pb67knihnjcepyxtbsnnasq74ikpsg@7txsek3mx5rp>
 <20240801141501.yt6ytrf2gzmravwx@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801141501.yt6ytrf2gzmravwx@hippo>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hi,

On 24-08-01, Xu Yang wrote:
> On Thu, Aug 01, 2024 at 02:49:33PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Aug 01, 2024 at 02:49:05PM GMT, Xu Yang wrote:
> > > Add a compatible entry for the NXP PTN36043 GPIO-based mux hardware
> > > used for connecting, disconnecting and switching orientation of
> > > the SuperSpeed lines in USB Type-C applications.
> > > 
> > > PTN36043 datasheet: https://www.nxp.com/docs/en/data-sheet/PTN36043A.pdf
> > > 
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > 
> > > ---
> > > Changes in v2:
> > >  - add Acked-by tag
> > >  - s/SBU/SuperSpeed in commit message
> > > ---
> > >  Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > index 8a5f837eff94..152849f744c1 100644
> > > --- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
> > > @@ -20,6 +20,7 @@ properties:
> > >      items:
> > >        - enum:
> > >            - nxp,cbdtu02043
> > > +          - nxp,ptn36043
> > 
> > PTN36043 isn't an SBU mux, so it is incorrect to declare that it is
> > compatible with the "gpio-sbu-mux".
> 
> Well, so I should create a compatible such as "gpio-ss-mux" and make some
> changes on the driver, right?

You're aware that I already sent patches regarding this topic:

https://lore.kernel.org/all/20230504-b4-v6-3-topic-boards-imx8mp-evk-dual-role-usb-v2-0-3889b1b2050c@pengutronix.de

Regards,
  Marco

> 
> Thanks,
> Xu Yang
> 
> > 
> > >            - onnn,fsusb43l10x
> > >            - pericom,pi3usb102
> > >            - ti,tmuxhs4212
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> 

