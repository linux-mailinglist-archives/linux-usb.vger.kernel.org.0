Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9562A20EF16
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 09:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730636AbgF3HNn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Jun 2020 03:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730635AbgF3HNm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Jun 2020 03:13:42 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49EF2C061755
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 00:13:42 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqASZ-0001cC-Hs; Tue, 30 Jun 2020 09:13:39 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jqASX-0006cH-AW; Tue, 30 Jun 2020 09:13:37 +0200
Date:   Tue, 30 Jun 2020 09:13:37 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: [PATCH v3 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Message-ID: <20200630071337.GJ21325@pengutronix.de>
References: <20200629132206.3914-1-m.grzeschik@pengutronix.de>
 <20200629132206.3914-2-m.grzeschik@pengutronix.de>
 <20d3ff88-b4df-91e7-aaa6-ec05917c32ab@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="H6o9R95t2FPeZmf3"
Content-Disposition: inline
In-Reply-To: <20d3ff88-b4df-91e7-aaa6-ec05917c32ab@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:51:05 up 131 days, 14:21, 120 users,  load average: 0.20, 0.18,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--H6o9R95t2FPeZmf3
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2020 at 09:20:02PM +0000, Thinh Nguyen wrote:
>Hi,
>
>Michael Grzeschik wrote:
>> From: Michael Olbrich <m.olbrich@pengutronix.de>
>>
>> Currently __dwc3_gadget_start_isoc must be called very shortly after
>> XferNotReady. Otherwise the frame number is outdated and start transfer
>> will fail, even with several retries.
>>
>> DSTS provides the lower 14 bit of the frame number. Use it in combination
>> with the frame number provided by XferNotReady to guess the current frame
>> number. This will succeed unless more than one 14 rollover has happened
>> since XferNotReady.
>>
>> Start transfer might still fail if the frame number is increased
>> immediately after DSTS is read. So retries are still needed.
>> Don't drop the current request if this happens. This way it is not lost =
and
>> can be used immediately to try again with the next frame number.
>>
>> With this change, __dwc3_gadget_start_isoc is still not successfully in =
all
>> cases bit it increases the acceptable delay after XferNotReady
>> significantly.
>>
>> Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v1 -> v2: - removed last_frame_number from struct
>>            - included rollover variable
>> v2 -> v3: - moved the calculation before the retry loop
>>            - skipping the calculation if bInterval > 14
>>
>>   drivers/usb/dwc3/gadget.c | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 8de6f10d335e1c0..7ad85a7d06f70bf 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -1463,6 +1463,7 @@ static int dwc3_gadget_start_isoc_quirk(struct dwc=
3_ep *dep)
>>
>>   static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
>>   {
>> +	const struct usb_endpoint_descriptor *desc =3D dep->endpoint.desc;
>>   	struct dwc3 *dwc =3D dep->dwc;
>>   	int ret;
>>   	int i;
>> @@ -1480,6 +1481,24 @@ static int __dwc3_gadget_start_isoc(struct dwc3_e=
p *dep)
>>   			return dwc3_gadget_start_isoc_quirk(dep);
>>   	}
>>
>> +	if (desc->bInterval <=3D 14) {
>> +		u32 frame =3D __dwc3_gadget_get_frame(dwc);
>> +		bool rollover =3D frame < (dep->frame_number & 0x3fff);
>> +
>> +		/*
>> +		 * frame_number is set from XferNotReady and may be already
>> +		 * out of date. DSTS only provides the lower 14 bit of the
>> +		 * current frame number. So add the upper two bits of
>> +		 * frame_number and handle a possible rollover.
>> +		 * This will provide the correct frame_number unless more than
>> +		 * rollover has happened since XferNotReady.
>> +		 */
>> +
>> +		dep->frame_number =3D (dep->frame_number & ~0x3fff) | frame;
>> +		if (rollover)
>> +			dep->frame_number +=3D BIT(14);
>> +	}
>> +
>>   	for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>>   		dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i + 1);
>>
>
>I think it's cleaner to create a mask for 0x3fff, but I can see how it
>can arguably clearer for not using a macro also. It's fine to me either wa=
y.

This mask is used on many usb controllers and
everyone is defining their own.

drivers/usb/gadget/udc/mv_udc.h
34:#define USB_FRINDEX_MASKS	0x3fff

drivers/usb/gadget/udc/fsl_usb2_udc.h
116:#define	USB_FRINDEX_MASKS			0x3fff


Even other drivers using the mask without defining it:

drivers/usb/misc/ftdi-elan.c
2224:	hc_fminterval &=3D 0x3fff;
2313:				   ((9 *hc_fminterval) / 10) & 0x3fff);

drivers/usb/chipidea/udc.c
1634:	ret =3D hw_read(ci, OP_FRINDEX, 0x3fff);

drivers/usb/dwc3/gadget.c
1406:		test_frame_number =3D dep->frame_number & 0x3fff;
1453:	dep->frame_number &=3D 0x3fff;

drivers/usb/host/ohci-hcd.c
557:		ohci->fminterval =3D val & 0x3fff;

drivers/usb/host/xhci-ring.c
3980:	start_frame &=3D 0x3fff;

drivers/usb/host/ohci-dbg.c
635:			rdata & 0x3fff);
641:			rdata & 0x3fff);
647:			rdata & 0x3fff);

drivers/usb/host/u132-hcd.c
1535:	       ((9 * fi) / 10) & 0x3fff);
1605:		u132->hc_fminterval =3D temp & 0x3fff;

drivers/usb/host/ohci.h
701:	ohci_writel (ohci, ((9 * fi) / 10) & 0x3fff,

I could write a patch changing them all or at least
make a common gadget define.

What could be a common place for that?

On device level only it could be include/linux/usb/gadget.h
On whole usb level this could be include/uapi/linux/usb/ch9.h

Ideas?

>For both patches in this series:
>Reviewed-by: Thinh Nguyen <thinhn@synopsys.com>
>
>Thanks,
>Thinh

Thanks!
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--H6o9R95t2FPeZmf3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAl765h0ACgkQC+njFXoe
LGQ3fA/+NDwO0EdmeXLvVqZF8Zp6HvDzPxfWWP7uKLZ0kxq1k31VhtyahKqwWu+U
DSAmzTChakrJ8XZHk3e28W7ErTShBBChEIXVBtphT9Et+oUYLsNSzNMLwUJYH+V8
KvedbX2IFe23kgxe9JuM+IIf/WzVzdavVzrrPY+EEMelCk25VLQ2OUSbfPaVMl1C
fex680SbcAqEO90VaNNaOrkSDX9tdU2cneTBdiVKGP23BHwT+HEfRncsy89IK4Qc
F6gDI7qrENQ+AyByy2FtqbfNUkfdA3kkuZg6HKHWOaW7EYBrwJKcXwL6zoXWCkSs
v3NYQZ2fFre+HagWpBqmk6AA+5idmPS2LSMwKZKPpgjZlbSlA2m/jENhYnIN3MoR
JRB3lxHXeu9rAM7380Z63crY+0CRu1xY5kb8eSt4EKjW8adv1ZaGMdWDp3qI91B+
ZVaMk7iMV9fT9itfLqd1uiyIgmS5m3MebT1hn1TdE1+gYMzVfzAs2B2lvjbqMtTF
XZZYDthPCT8p5h44oOipa7/OEoqKLvdRExcBjm/TFquK+8aPrvRcioo5PKP8RxU8
MflDcWWAd7hmnA8dxrJk31lL+DwuVVSp3r1l9LAvuGvkkrNbH5+WRWf5iK5cbQLq
yDtYJmA7J2Ep83P7KV/pHWL2VWpi10GxKcqB7T64V0rmTtMMe+M=
=7IFX
-----END PGP SIGNATURE-----

--H6o9R95t2FPeZmf3--
