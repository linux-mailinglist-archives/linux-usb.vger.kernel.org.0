Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BACAA2F46BE
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 09:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbhAMIn6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Jan 2021 03:43:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbhAMIn5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Jan 2021 03:43:57 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86235C061786
        for <linux-usb@vger.kernel.org>; Wed, 13 Jan 2021 00:43:17 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1kzbkI-0007Am-Jm; Wed, 13 Jan 2021 09:43:14 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1kzbkH-0007KO-AN; Wed, 13 Jan 2021 09:43:13 +0100
Date:   Wed, 13 Jan 2021 09:43:13 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Minas Harutyunyan <hminas@synopsys.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: dwc2: Add support for additional
 clock
Message-ID: <20210113084313.GD19063@pengutronix.de>
References: <1610386869.406608.2784732.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610386869.406608.2784732.nullmailer@robh.at.kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:41:46 up 41 days, 21:08, 80 users,  load average: 0.15, 0.12,
 0.10
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 11, 2021 at 11:41:09AM -0600, Rob Herring wrote:
> On Mon, 11 Jan 2021 16:13:36 +0100, Sascha Hauer wrote:
> > This adds support for an additional clock for the dwc2 core in case
> > there is another clock to the phy which must be enabled.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/usb/dwc2.yaml | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ff400000: clocks: [[4294967295]] is too short
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/dwc2.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ff400000: clock-names: ['otg'] is too short
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/dwc2.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/dwc2.example.dt.yaml: usb@101c0000: clocks: [[4294967295]] is too short

Ok, this can be fixed by adding a "minItems" property to clocks and
clock-names. Will do next round.

Anything more to say to this series?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
