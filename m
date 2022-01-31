Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42EEE4A4696
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 13:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350321AbiAaMIY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 07:08:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42066 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348589AbiAaMIX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jan 2022 07:08:23 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37B1A1447;
        Mon, 31 Jan 2022 13:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643630902;
        bh=kaRsVkB1+7z0WcrrsLTdBvp2uSOeWAAVTT81ejB2M6E=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=DojEyCRZDnKj/bHn6/kRm6VXWZME6ztUm9QbQkbMnV4funFK70/2+yBu4Je/NKCl+
         lHL3aygQMSSKRc/qfxBmZyDNnbKmcMbqtCKWI64yf8rvRw7e29g1k3CGlxupazQGfu
         a0rAmO4uU+jLKOIbGL3/fdy6tALtkaclSbwrjrDQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220126183138.GB6506@pengutronix.de>
References: <164154749753.1224575.16682991529695492259@Monstersaurus> <20220126132249.2133168-1-m.grzeschik@pengutronix.de> <YfFyM9Dadim3t88s@rowland.harvard.edu> <20220126183138.GB6506@pengutronix.de>
Subject: Re: [PATCH] dummy_hcd: add isoc support
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de, nicolas@ndufresne.ca
To:     Alan Stern <stern@rowland.harvard.edu>,
        Michael Grzeschik <mgr@pengutronix.de>
Date:   Mon, 31 Jan 2022 12:08:20 +0000
Message-ID: <164363090018.533872.2376373763275566038@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael, Alan,

Quoting Michael Grzeschik (2022-01-26 18:31:38)
> On Wed, Jan 26, 2022 at 11:09:23AM -0500, Alan Stern wrote:
> >On Wed, Jan 26, 2022 at 02:22:49PM +0100, Michael Grzeschik wrote:
> >> With this patch, the dummy_hcd gains first support for isoc transfers.
> >> It will complete the whole urb with all packages.
> >
> >"packets", not "packages".
>=20
> Right.
>=20
> >>  Even if the gadget
> >> side did not enqueue any request, the urb will be handled.
> >>
> >> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> >
> >I don't like this idea.  If support for isochronous transfers is added,
> >it should be done correctly.  That is, the implementation should support
> >scheduling of transfers, periodic bandwidth reservation, high-bandwidth
> >transfers, and so on.
> >
> >The whole point of dummy-hcd is to emulate a real host controller as
> >closely as possible.  Real isochronous transfers do not complete all at
> >once.

Being able to at least test uvc-gadget in a virtual environment would
already be a big benefit. As this is emulation, not simulation is it
essential that an exact mapping of the hardware is in place?

Is there anything we can do to support the progression of this
development?

I.e. could we support this method first with a=20
  WARN_ONCE("This does not fully emulate Isochronous support");


That would allow infrastructure to be built up that uses this
functionality, which would then in turn feed back into providing a means
to actually test the improvements to the isochronous support on top.


> I agree, that whole isoc support needs proper improvement.
>=20
> I could/should have added RFC to the patch. As the whole intention of
> this code, for now, is to validate the gadget/uvc configfs patchseries
> mentioned in the the comments.
>=20
> With this patch, it is at least possible to get the gadget running on
> dummy_hcd and try out the "non-isoc dependent" parts, that are actually
> changed, in the mentioned series.
>=20
> The validation of the payload path, actually using the mentioned isoc
> endpoints, is left to the developer who implements the missing parts
> you mentioned above.
>=20
> Michael
>=20
> --=20
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
