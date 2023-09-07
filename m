Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF78797DA3
	for <lists+linux-usb@lfdr.de>; Thu,  7 Sep 2023 23:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233735AbjIGVAM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Sep 2023 17:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjIGVAL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Sep 2023 17:00:11 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 081941990
        for <linux-usb@vger.kernel.org>; Thu,  7 Sep 2023 14:00:08 -0700 (PDT)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qeM6f-0003mx-5w; Thu, 07 Sep 2023 23:00:06 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qeM6e-009Sbe-2F; Thu, 07 Sep 2023 23:00:04 +0200
Date:   Thu, 7 Sep 2023 23:00:04 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Message-ID: <ZPo51EUtBgH+qw44@pengutronix.de>
References: <20230831221242.GC20651@pengutronix.de>
 <20230901013118.iqpegkklfswdkoqc@synopsys.com>
 <ZPULnRSVgd5S3Cao@pengutronix.de>
 <20230906004144.4igr4akglxxqahc3@synopsys.com>
 <ZPgnwlOV1XP82kAY@pengutronix.de>
 <20230906230510.vi7d4wnjeiapgtyk@synopsys.com>
 <20230906230900.tmyhlxomrhsm3kna@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eeEWcrWDtQ+LJLkG"
Content-Disposition: inline
In-Reply-To: <20230906230900.tmyhlxomrhsm3kna@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:2:b01:1d::c5
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Subject: Re: DWC3-Gadget: Flickering with ISOC Streaming (UVC) while
 multiplier set on Superspeed
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.whiteo.stw.pengutronix.de)
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--eeEWcrWDtQ+LJLkG
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Thinh

Thanks for the update!

On Wed, Sep 06, 2023 at 11:09:03PM +0000, Thinh Nguyen wrote:
>On Wed, Sep 06, 2023, Thinh Nguyen wrote:
>> On Wed, Sep 06, 2023, Michael Grzeschik wrote:
>> >
>> > > 2) Burst setting
>> > > 	I think this is self-explainatory. Large data request needs
>> > > 	higher burst.
>> >
>> > I will have to find out if the burst setting can be changed on the
>> > rk3568 somehow. This sounds very likely.
>> >
>>
>> The dwc3 driver checks the endpoint descriptor from the UVC function
>> driver to setup the burst. So just setup the max 16 bursts (or 15 in the
>> descriptor). The dwc3 controller supports that. Whether the host would
>> do 16 bursts is another thing. Note that there's no "mult" setting for
>> SuperSpeed.
>
>Clarification: no mult setting for the dwc3 controller when operate in
>SuperSpeed.

I was somehow mistaken by the wording "burst setting" and thought of the
axi-bus burst setting to the controller instead of the usb3 maxburst
setting as you ment actually.

However. This is usefull input anyway. I never thought of maximizing the
burst and packagesize and let the host side make the decision.
But we will probably will eat up a lot of usb bandwidth by doing so.

Before your note I was somehow mistaken that the maxpacket and maxburst
size had to correlate with the actually transfered data we queue into
the hardware per request.

>> I recall that UVC tries to pack a lot of data in a single request. All
>> the while some intervals it would send 0-length data because of idle
>> time. I would spread to more requests with a little less data to give
>> the host a little more breathing room and bandwidth.

The higher load per request is due to the fact that the uvc gadget is
using the multiplier, maxpacket and maxburst parameters for the size
calculation of the request.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/usb/gadget/function/uvc_video.c#n331

Since it is clear now that those parameters are not necessary coupled
it makes total sense to split the requests into smaller chunks.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--eeEWcrWDtQ+LJLkG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmT6OdAACgkQC+njFXoe
LGQ8BxAAomTiIT4C5/43fDVR1hRIcHA8PMuhTvws5qejhYz1KBBWTL9rwNBdSsaD
x/dpqEJg7qe8Sk8kMF4BIXkyp56r9prs206vdjqzKePDJm0T+UVaFVrkuGAuZgXp
QEHvLywCkLu/qK3Y2m/IpD0s4BMpRcmn1RWjS+Rn81VMU34qN2lD2bqngq22VyTV
rakqRz1KCpWnroqnM1JS8/9JKgIlIXv5aLd4EBZJ+Rjsc1b6nodrLT9JwFLKbXgZ
DjaArfLkRuZ3+S4sUbQz3rjbF+CtJ1CprfdYGoADN9XdxXUPhidDYnyVa4V1eM40
MSq//M1q9N7eUhv6737XjClrZ9JaGx+bopp24b65Vgr5LSA/XnxQdQEe14ReGFtu
y9mxnyhTvujdDfoeSU/5Yebdr7hZX/iQsMIyIJTHhpwW+juAtx5pAHnrO8ToPg1F
8YGqUrQoyXAcNOdDrrmX94NdEpRLENKnnOnzi+U24YFDOhP6ziWgnsu/20PyFQCu
0W2+yIz07H4L0jlwRV4sBJe0os331DJb3JR0HI1vgrkEcNAcaGt6LmjP0Xr64Kms
fRkz9NHwoHr7zFYcOkd6t9FfCqLwHha084oL+4kdCof6/5RA+OQK+ejHIqtnCjvc
A6ZxlLxhovv8OoV4X6R6O2pVQBEroblLUYb6gsqUU+aoDgciW6c=
=gcY+
-----END PGP SIGNATURE-----

--eeEWcrWDtQ+LJLkG--
