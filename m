Return-Path: <linux-usb+bounces-27182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2176BB31581
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 12:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 611C83B4DBF
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 10:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7642F3C2B;
	Fri, 22 Aug 2025 10:30:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211C92F39DC
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858617; cv=none; b=S7LFHW/S0wTVueFEE9+Wnb9gzCkIxwjLaSnxTy5wKtvK3M4naENwGBkFEY1AgrxohVTf0zNzrLeB9mFOp5HgymWs+RcATD/mLgX4pm0d1sKaQnOm70DAVADpgHKyKJO0IUI9Q7DSszS0+PHeIU7mpfiMeesvSNqUm48gSxVef+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858617; c=relaxed/simple;
	bh=N2MIGbNyxlDN+r9SnBla5fY5nVigW9XgjuVc2XXDEzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvdFO/CSQ4q8k1VgSTK0i1T51aXu8mNpRzP4wWATsjS7CK/Xi5V9e5m1xgfNkd41CPM5xkVQ24Dd0kWrYvNMoVvfK8BTA7MZxAlnak+eASPWufPGi6H3+FSQtmMtzOflyB0XO6M7OPbhWhesAGTdYK9dcWWqyTdUsxktLJ4UXGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1upP26-0006C3-2R; Fri, 22 Aug 2025 12:30:06 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1upP25-001Ysi-2H;
	Fri, 22 Aug 2025 12:30:05 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1upP25-00A6R0-1o;
	Fri, 22 Aug 2025 12:30:05 +0200
Date: Fri, 22 Aug 2025 12:30:05 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v3 3/4] dt-bindings: usb: microchip,usb2514: add support
 for port vbus-supply
Message-ID: <20250822103005.c7ba7dclbgdadyw7@pengutronix.de>
References: <20250821-v6-16-topic-usb-onboard-dev-v3-0-6d2b38a5d818@pengutronix.de>
 <20250821-v6-16-topic-usb-onboard-dev-v3-3-6d2b38a5d818@pengutronix.de>
 <20250822-maize-elk-of-growth-2a30bb@kuoka>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-maize-elk-of-growth-2a30bb@kuoka>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

On 25-08-22, Krzysztof Kozlowski wrote:
> On Thu, Aug 21, 2025 at 06:31:57PM +0200, Marco Felsch wrote:
> > Some PCB designs don't connect the USB hub port power control GPIO and
> > instead make use of a host controllable regulator. Add support for this
> > use-case by introducing portX-vbus-supply property.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/usb/microchip,usb2514.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
> > index 4e3901efed3fcd4fbbd8cb777f9df4fcadf2ca00..ac1e5f1a5ea2e66c61ce92154385952b15e78e55 100644
> > --- a/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
> > +++ b/Documentation/devicetree/bindings/usb/microchip,usb2514.yaml
> > @@ -49,6 +49,12 @@ patternProperties:
> >      $ref: /schemas/usb/usb-device.yaml
> >      additionalProperties: true
> >  
> > +  "^port[1-7]-vbus-supply$":
> > +    type: object
> > +    description:
> > +      Regulator controlling the USB VBUS on portX. Only required if the host
> > +      controls the portX VBUS.
> 
> Your commit msg should briefly describe status of previous discussion:
> why Rob's comment was not applied. Otherwise we repeat: this looks like
> property of specific port.

I answered Rob on my v1 but got no feedback. My v2 caused an issue found
by Rob's test bot. Therefore I thought he is okay and applied the
patchset for testing.

At least to me it's unclear when Rob's test bot is executed.

> The binding does not list ports now, but lists hard-wired devices, so my
> question is now: is this per hard-wired device or per port (even if port
> is hot-pluggable)?

Sorry but I don't get you. The binding lists the regulators required to
enable/disable the hub downstream port VBUS. These regulators are
controlled by an external party e.g. the CPU instead of the USB hub
itself. The connection from the CPU to the regulator which controlls the
+5V usb-connector pin is hard-wired, yes.

Regards,
  Marco

