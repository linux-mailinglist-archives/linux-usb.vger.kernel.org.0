Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 634E64C9787
	for <lists+linux-usb@lfdr.de>; Tue,  1 Mar 2022 22:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238504AbiCAVHB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Mar 2022 16:07:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236791AbiCAVHA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Mar 2022 16:07:00 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C36F7EA04
        for <linux-usb@vger.kernel.org>; Tue,  1 Mar 2022 13:06:18 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nP9hH-00025z-OI; Tue, 01 Mar 2022 22:06:15 +0100
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nP9hG-0007sl-H0; Tue, 01 Mar 2022 22:06:14 +0100
Date:   Tue, 1 Mar 2022 22:06:14 +0100
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 3/3] usb: dwc3: gadget: EP_DELAY_START is only handled
 for non isoc eps
Message-ID: <20220301210614.GH11577@pengutronix.de>
References: <20220228150843.870809-1-m.grzeschik@pengutronix.de>
 <20220228150843.870809-4-m.grzeschik@pengutronix.de>
 <3f2ae881-363f-c4de-5269-75b42f5320c7@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LiQwW4YX+w4axhAx"
Content-Disposition: inline
In-Reply-To: <3f2ae881-363f-c4de-5269-75b42f5320c7@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 22:02:48 up 81 days,  5:48, 75 users,  load average: 0.79, 0.41,
 0.24
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--LiQwW4YX+w4axhAx
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 01:12:37AM +0000, Thinh Nguyen wrote:
>Hi,
>
>Michael Grzeschik wrote:
>> Refactor the codepath for handling DWC3_EP_DELAY_START condition
>> only being checked on non isoc endpoints.
>
>The DWC3_EP_DELAY_START should still be applicable to isoc and End
>Transfer pending. While the End Transfer command is active, don't issue
>Start Transfer command.
>
>Previously I think we have a check for the isoc endpoint and
>DWC3_EP_DELAY_START because it was intended to check against the halt
>condition, but it was done incorrectly. (Note that isoc endpoint doesn't
>halt and there's no STALL handshake).
>
>This change should not be applied. If we're to apply the fix for isoc
>and delay start check, it should be done separately.

Right! I just realized that we indeed at least also have to check for
DWC3_EP_END_TRANSFER_PENDING flag on isoc transfers. Without that,
we would open up a race where we kick(update) transfers, that are
potentially to late for that current transfer.

So yes, please drop that patch. The other patches on the other hand are
fine I think.

Regards,
Michael

>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>> ---
>>  drivers/usb/dwc3/gadget.c | 22 +++++++++++-----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index b89dadaef4db9d..d09bd66f498a69 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -1901,17 +1901,6 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep =
*dep, struct dwc3_request *req)
>>  	if (dep->flags & DWC3_EP_WAIT_TRANSFER_COMPLETE)
>>  		return 0;
>>
>> -	/*
>> -	 * Start the transfer only after the END_TRANSFER is completed
>> -	 * and endpoint STALL is cleared.
>> -	 */
>> -	if ((dep->flags & DWC3_EP_END_TRANSFER_PENDING) ||
>> -	    (dep->flags & DWC3_EP_WEDGE) ||
>> -	    (dep->flags & DWC3_EP_STALL)) {
>> -		dep->flags |=3D DWC3_EP_DELAY_START;
>> -		return 0;
>> -	}
>> -
>>  	/*
>>  	 * NOTICE: Isochronous endpoints should NEVER be prestarted. We must
>>  	 * wait for a XferNotReady event so we will know what's the current
>> @@ -1927,6 +1916,17 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep =
*dep, struct dwc3_request *req)
>>
>>  			return 0;
>>  		}
>> +	} else {
>> +		/*
>> +		 * Start the transfer only after the END_TRANSFER is completed
>> +		 * and endpoint STALL is cleared.
>> +		 */
>> +		if ((dep->flags & DWC3_EP_END_TRANSFER_PENDING) ||
>> +		    (dep->flags & DWC3_EP_WEDGE) ||
>> +		    (dep->flags & DWC3_EP_STALL)) {
>> +			dep->flags |=3D DWC3_EP_DELAY_START;
>> +			return 0;
>> +		}
>>  	}
>>
>>  	__dwc3_gadget_kick_transfer(dep);
>

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--LiQwW4YX+w4axhAx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmIeisMACgkQC+njFXoe
LGSY+xAA0Y0fgG21qQMCoWZj3N2J4xAurn6B3P5VTc4lUxu9kdONLzobWCf3gRPE
TMsqARcvbjUo9nPIN5L33tVhRxX9SKonvTE3wRuJkUuGrJyI2+qcwLLdQVDZ8VNY
y3kJ6D3lnDJ6kYlY7BzqttHOm0zOPFNleQG6/9/ihUXaYQkXOR2kh+GfGXqMklzD
vVTszU5uFoYy1Di34wnP0zhy8p9+chj13fHGkKEV9T7lHyVJu/YWhjPsVa1YxkCi
27EnUYTIrqbkY/0zuhhVO5dgPsE0X5kEDIa+yzdjZTxNcoAuH5eiMqRNqW3HoY3N
Oe7XIHPtffqe1fTornK/PRidY2QXtJVsXizNE1Osx0HWhFfmyH6TYBauyXdXqno0
2M0nItc+oOqbf+VDMwJ2cJZi/7EyA7VB9m65KJZO1i15PbqgKCQI4ScYPfGUYDsD
78QJVUat7u8xKMSW3KtNSVe8rpreGWRfFgrkBXGUZoVvgu1KbhzM7bdVi3AzrH4y
386Tc4dx5QqMpd/EtXlTjojrI/RViizqXhDx/2wcvkCxXoK93gOlWiZppHmpYfsi
/YQ05r0TgIzC3MlXuTQm/0qOh9Jid9qxcWwfiiNzW7dfYUHu7KSSD91C1zaG+pCF
PN8iF/ztGEuEHZF+u4XC1lvSoXZcCeRbrsjxL3pGQ7eSe8AOA78=
=YQAz
-----END PGP SIGNATURE-----

--LiQwW4YX+w4axhAx--
