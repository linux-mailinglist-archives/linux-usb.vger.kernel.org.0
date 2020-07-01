Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6942103CC
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 08:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgGAGUq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 02:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726746AbgGAGUq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 02:20:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38297C061755
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 23:20:46 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqW6s-0005fo-HR; Wed, 01 Jul 2020 08:20:42 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqW6q-0004yQ-Ej; Wed, 01 Jul 2020 08:20:40 +0200
Date:   Wed, 1 Jul 2020 08:20:40 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: [PATCH v3 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Message-ID: <20200701062040.GM21325@pengutronix.de>
References: <20200629132206.3914-1-m.grzeschik@pengutronix.de>
 <20200629132206.3914-2-m.grzeschik@pengutronix.de>
 <20d3ff88-b4df-91e7-aaa6-ec05917c32ab@synopsys.com>
 <20200630071337.GJ21325@pengutronix.de>
 <CAL411-p19PX+utRb=x-pfBqXPjpHz54BO5OzdZVAuLQKjKxH5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tuifNR376H9qoyoc"
Content-Disposition: inline
In-Reply-To: <CAL411-p19PX+utRb=x-pfBqXPjpHz54BO5OzdZVAuLQKjKxH5A@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:17:02 up 132 days, 13:47, 104 users,  load average: 0.08, 0.16,
 0.26
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--tuifNR376H9qoyoc
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, Jul 01, 2020 at 10:26:56AM +0800, Peter Chen wrote:
>On Tue, Jun 30, 2020 at 3:15 PM Michael Grzeschik <mgr@pengutronix.de> wro=
te:
>>
>> On Mon, Jun 29, 2020 at 09:20:02PM +0000, Thinh Nguyen wrote:
>> >Hi,
>> >
>> >Michael Grzeschik wrote:
>> >> From: Michael Olbrich <m.olbrich@pengutronix.de>
>> >>
>> >> Currently __dwc3_gadget_start_isoc must be called very shortly after
>> >> XferNotReady. Otherwise the frame number is outdated and start transf=
er
>> >> will fail, even with several retries.
>> >>
>> >> DSTS provides the lower 14 bit of the frame number. Use it in combina=
tion
>> >> with the frame number provided by XferNotReady to guess the current f=
rame
>> >> number. This will succeed unless more than one 14 rollover has happen=
ed
>> >> since XferNotReady.
>> >>
>> >> Start transfer might still fail if the frame number is increased
>> >> immediately after DSTS is read. So retries are still needed.
>> >> Don't drop the current request if this happens. This way it is not lo=
st and
>> >> can be used immediately to try again with the next frame number.
>> >>
>> >> With this change, __dwc3_gadget_start_isoc is still not successfully =
in all
>> >> cases bit it increases the acceptable delay after XferNotReady
>> >> significantly.
>> >>
>> >> Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
>> >> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>> >> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> >>
>> >> ---
>> >> v1 -> v2: - removed last_frame_number from struct
>> >>            - included rollover variable
>> >> v2 -> v3: - moved the calculation before the retry loop
>> >>            - skipping the calculation if bInterval > 14
>> >>
>> >>   drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
>> >>   1 file changed, 19 insertions(+)
>> >>
>> >> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> >> index 8de6f10d335e1c0..7ad85a7d06f70bf 100644
>> >> --- a/drivers/usb/dwc3/gadget.c
>> >> +++ b/drivers/usb/dwc3/gadget.c
>> >> @@ -1463,6 +1463,7 @@ static int dwc3_gadget_start_isoc_quirk(struct =
dwc3_ep *dep)
>> >>
>> >>   static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
>> >>   {
>> >> +    const struct usb_endpoint_descriptor *desc =3D dep->endpoint.des=
c;
>> >>      struct dwc3 *dwc =3D dep->dwc;
>> >>      int ret;
>> >>      int i;
>> >> @@ -1480,6 +1481,24 @@ static int __dwc3_gadget_start_isoc(struct dwc=
3_ep *dep)
>> >>                      return dwc3_gadget_start_isoc_quirk(dep);
>> >>      }
>> >>
>> >> +    if (desc->bInterval <=3D 14) {
>> >> +            u32 frame =3D __dwc3_gadget_get_frame(dwc);
>> >> +            bool rollover =3D frame < (dep->frame_number & 0x3fff);
>> >> +
>> >> +            /*
>> >> +             * frame_number is set from XferNotReady and may be alre=
ady
>> >> +             * out of date. DSTS only provides the lower 14 bit of t=
he
>> >> +             * current frame number. So add the upper two bits of
>> >> +             * frame_number and handle a possible rollover.
>> >> +             * This will provide the correct frame_number unless mor=
e than
>> >> +             * rollover has happened since XferNotReady.
>> >> +             */
>> >> +
>> >> +            dep->frame_number =3D (dep->frame_number & ~0x3fff) | fr=
ame;
>> >> +            if (rollover)
>> >> +                    dep->frame_number +=3D BIT(14);
>> >> +    }
>> >> +
>> >>      for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>> >>              dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i + 1);
>> >>
>> >
>> >I think it's cleaner to create a mask for 0x3fff, but I can see how it
>> >can arguably clearer for not using a macro also. It's fine to me either=
 way.
>>
>> This mask is used on many usb controllers and
>> everyone is defining their own.
>>
>> drivers/usb/gadget/udc/mv_udc.h
>> 34:#define USB_FRINDEX_MASKS    0x3fff
>>
>> drivers/usb/gadget/udc/fsl_usb2_udc.h
>> 116:#define     USB_FRINDEX_MASKS                       0x3fff
>>
>>
>> Even other drivers using the mask without defining it:
>>
>> drivers/usb/misc/ftdi-elan.c
>> 2224:   hc_fminterval &=3D 0x3fff;
>> 2313:                              ((9 *hc_fminterval) / 10) & 0x3fff);
>>
>> drivers/usb/chipidea/udc.c
>> 1634:   ret =3D hw_read(ci, OP_FRINDEX, 0x3fff);
>
>Hi Michael,
>
>I can't find the above code for chipidea, where did you get?

I was greping my usb-wip stack where I have an extra
Patch for the get_frame callback implementation
of the chipidea/udc.c. I think I will have to post it.

>The frame index value register is a standard EHCI register,
>but for UDC, it is not a common register. UDC design is varied
>for vendors.

Good to know. Is there any measure to find out if it is
there? I would add that limitation to the above mentioned patch.

Thanks,
Michael

>>
>> drivers/usb/dwc3/gadget.c
>> 1406:           test_frame_number =3D dep->frame_number & 0x3fff;
>> 1453:   dep->frame_number &=3D 0x3fff;
>>
>> drivers/usb/host/ohci-hcd.c
>> 557:            ohci->fminterval =3D val & 0x3fff;
>>
>> drivers/usb/host/xhci-ring.c
>> 3980:   start_frame &=3D 0x3fff;
>>
>> drivers/usb/host/ohci-dbg.c
>> 635:                    rdata & 0x3fff);
>> 641:                    rdata & 0x3fff);
>> 647:                    rdata & 0x3fff);
>>
>> drivers/usb/host/u132-hcd.c
>> 1535:          ((9 * fi) / 10) & 0x3fff);
>> 1605:           u132->hc_fminterval =3D temp & 0x3fff;
>>
>> drivers/usb/host/ohci.h
>> 701:    ohci_writel (ohci, ((9 * fi) / 10) & 0x3fff,
>>
>> I could write a patch changing them all or at least
>> make a common gadget define.
>>
>> What could be a common place for that?
>>
>> On device level only it could be include/linux/usb/gadget.h
>> On whole usb level this could be include/uapi/linux/usb/ch9.h
>>
>> Ideas?
>>
>> >For both patches in this series:
>> >Reviewed-by: Thinh Nguyen <thinhn@synopsys.com>
>> >
>> >Thanks,
>> >Thinh
>>
>> Thanks!
>> Michael
>>
>> --
>> Pengutronix e.K.                           |                            =
 |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/ =
 |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0   =
 |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555=
 |
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--tuifNR376H9qoyoc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAl78KzUACgkQC+njFXoe
LGTjvg/+JVPMF52LmThCiEu7ivuTdyT0thDBYjiq6u7O+hZpKQeuCyfGcJsNz8BP
IYzF1e3BncWJzyySYa9AS+mlhgLlQg91wpyL42xWrs4c58Kwx7CpyVVbrmc41/4t
ho4YJpf9mARIy/GulbLAx/qqdqUeKH77nrMba29AvjY/ddhkJ//9hwZB1cpmzpQP
V9MqjwYKUSnokAnOPoI5IqvxB9oSu7BADNSVC6FhDlCDbkbZP4k7jYwbAxtXye4r
U0gSelf+a9CN7fntGcXOMq5ErMYUyqFceL5+3Dlg5kCx3S0EMEJUZe0CIK6t4mDX
iFowH02TNT9QL2waT1m44ylny/vtUxRUVtKaxo6Lxfsii0gY1DvnVPH3ZbM+DQnz
NDh2Xm4iGZhmdic1wkWIMz2Un+Y9uq724FpFMDn/q40L26NF1R4d+220Gsu2Kzwp
jEFJDuTJSGvfWotJ3anwyU/XkUXg4SNCVwkcmDywwXo+5cyRHKhIUlfFWIxPxFKd
zx1LIdm6wG8TNQy1aScfxS7SmMjls9Ljlov11DZV3MeVJrd2PdwwH+8qYahr8fRV
5YQ8K+tpzUqEFkeseYzpwLOpQn5uyNRm5XPCFGclwJ/wlHz0Nn4VSjEGEFZp/rJT
d3+NU6Xz5uCIbkjh6I87SHwQN8bURkXfs9vOAAihhEULtLnFjQI=
=s5lw
-----END PGP SIGNATURE-----

--tuifNR376H9qoyoc--
