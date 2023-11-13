Return-Path: <linux-usb+bounces-2842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 889377EA459
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 21:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E6AA1F225E1
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 20:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8994C24208;
	Mon, 13 Nov 2023 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8744922F09;
	Mon, 13 Nov 2023 20:08:19 +0000 (UTC)
X-Greylist: delayed 18527 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 13 Nov 2023 12:08:17 PST
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0327C173D;
	Mon, 13 Nov 2023 12:08:16 -0800 (PST)
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A464F1F8F7;
	Mon, 13 Nov 2023 21:08:14 +0100 (CET)
Date: Mon, 13 Nov 2023 21:08:10 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Conor Dooley <conor@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: microchip,usb5744: Add second
 supply
Message-ID: <ZVKCKop2zxI5FvCv@francesco-nb.int.toradex.com>
References: <20231113145921.30104-1-francesco@dolcini.it>
 <20231113145921.30104-2-francesco@dolcini.it>
 <20231113-jargon-manliness-584f34a5cf85@squawk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231113-jargon-manliness-584f34a5cf85@squawk>

Hello Conor,
thanks for the review.

On Mon, Nov 13, 2023 at 07:55:20PM +0000, Conor Dooley wrote:
> On Mon, Nov 13, 2023 at 03:59:20PM +0100, Francesco Dolcini wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > The USB5744 has two power supplies one for 3V3 and one for 1V2. Add the
> > second supply to the USB5744 DT binding.
> > 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  .../devicetree/bindings/usb/microchip,usb5744.yaml         | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> > index ff3a1707ef57..6d4cfd943f58 100644
> > --- a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> > +++ b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
> > @@ -36,7 +36,11 @@ properties:
> >  
> >    vdd-supply:
> >      description:
> > -      VDD power supply to the hub
> > +      3V3 power supply to the hub
> > +
> > +  vdd2-supply:
> > +    description:
> > +      1V2 power supply to the hub
> 
> How about v1p2-supply?

The reason for vdd2 is this

/*
 * Use generic names, as the actual names might differ between hubs. If a new
 * hub requires more than the currently supported supplies, add a new one here.
 */
static const char * const supply_names[] = {
	"vdd",
	"vdd2",
};

from drivers/usb/misc/onboard_usb_hub.c.

Francesco


