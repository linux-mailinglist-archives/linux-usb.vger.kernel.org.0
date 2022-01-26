Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC70549D1B6
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 19:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235523AbiAZSbm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jan 2022 13:31:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231779AbiAZSbm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jan 2022 13:31:42 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D73C06161C
        for <linux-usb@vger.kernel.org>; Wed, 26 Jan 2022 10:31:41 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nCn51-0003Kn-GI; Wed, 26 Jan 2022 19:31:39 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nCn50-0005Ay-3G; Wed, 26 Jan 2022 19:31:38 +0100
Date:   Wed, 26 Jan 2022 19:31:38 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     kieran.bingham@ideasonboard.com, linux-usb@vger.kernel.org,
        balbi@kernel.org, paul.elder@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca
Subject: Re: [PATCH] dummy_hcd: add isoc support
Message-ID: <20220126183138.GB6506@pengutronix.de>
References: <164154749753.1224575.16682991529695492259@Monstersaurus>
 <20220126132249.2133168-1-m.grzeschik@pengutronix.de>
 <YfFyM9Dadim3t88s@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline
In-Reply-To: <YfFyM9Dadim3t88s@rowland.harvard.edu>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 19:25:00 up 47 days,  3:10, 67 users,  load average: 0.13, 0.09,
 0.10
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 11:09:23AM -0500, Alan Stern wrote:
>On Wed, Jan 26, 2022 at 02:22:49PM +0100, Michael Grzeschik wrote:
>> With this patch, the dummy_hcd gains first support for isoc transfers.
>> It will complete the whole urb with all packages.
>
>"packets", not "packages".

Right.

>>  Even if the gadget
>> side did not enqueue any request, the urb will be handled.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>
>I don't like this idea.  If support for isochronous transfers is added,
>it should be done correctly.  That is, the implementation should support
>scheduling of transfers, periodic bandwidth reservation, high-bandwidth
>transfers, and so on.
>
>The whole point of dummy-hcd is to emulate a real host controller as
>closely as possible.  Real isochronous transfers do not complete all at
>once.

I agree, that whole isoc support needs proper improvement.

I could/should have added RFC to the patch. As the whole intention of
this code, for now, is to validate the gadget/uvc configfs patchseries
mentioned in the the comments.

With this patch, it is at least possible to get the gadget running on
dummy_hcd and try out the "non-isoc dependent" parts, that are actually
changed, in the mentioned series.

The validation of the payload path, actually using the mentioned isoc
endpoints, is left to the developer who implements the missing parts
you mentioned above.

Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmHxk4YACgkQC+njFXoe
LGQm9g/+P+PNtCcMwI9lbY/qpjyjuBzYOBg50kLJCBK0w8dFSu6sY2jkq/ZjAJRx
xXXrfLC1LVtnQPUsmm+d9JDtA4cao2Idd0MI/MDuULngCNXf5oG77hw/ln7ZpSyd
Pxxf8z4rMi97+/p4vhLdToyTV4Wlx4feVD3xFizcnhJkNIlI7++RZy1Uv+IzDx5H
siQxBjwSaXZlgAlBxbGVDeYdP6+cjG3V+rGR5zuz0c5VZuWzn8sThNwomsvV4s2/
LMLxIX+J0GgookxKixJgcOmTzHRCReOeMrxOivjfF5s6Pd1565DxfR20SUwurUDY
uO+lKqSMHz9DxXU6BH7kaKquyXR+bM0ufaC1ykpZTU1IQtxys8zdCXdgaX9GX5E6
urFD7dFQDU34VvqQehU8oSpLwac9s2UvrJeBvkjOxxMgBHy/Q4UZsyUkgKn2BhNf
2k8QjsoN45CPx8L2kw7MSziCU2kOKfNDhLquV2354CnMkWqX0oUtsxJvUvNLN635
FHkeYmyfET23YS+9O1PxHjNRWZZZjX98A6CHY2NVEFx5oDNWkK89z8kBYjvCaY3N
Z+8ektuweiDHrOeT/trzIDmc72wZg78jLBZktoUafHvq0/Nq7y+JOOsAI4FStFSB
+hNozHSGIRq7GEFO/UAqi1AFEyGEm4/uwIUBtdSgSnX1MdueVqM=
=veNB
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
