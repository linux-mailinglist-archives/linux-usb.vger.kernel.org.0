Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BACC209E13
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 14:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404416AbgFYME1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 08:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404222AbgFYME1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 08:04:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB7ABC061573
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2020 05:04:26 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1joQcD-0005bl-85; Thu, 25 Jun 2020 14:04:25 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1joQcC-0007Hs-5C; Thu, 25 Jun 2020 14:04:24 +0200
Date:   Thu, 25 Jun 2020 14:04:24 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [PATCH v2 2/2] usb: dwc3: gadget: when the started list is empty
 stop the active xfer
Message-ID: <20200625120424.GG21325@pengutronix.de>
References: <20200624144907.9604-1-m.grzeschik@pengutronix.de>
 <20200624144907.9604-3-m.grzeschik@pengutronix.de>
 <da8703b4-035d-ba47-e8a5-5c4dd5005b45@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2eauhx3HRLXw1WRo"
Content-Disposition: inline
In-Reply-To: <da8703b4-035d-ba47-e8a5-5c4dd5005b45@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:03:42 up 126 days, 19:34, 117 users,  load average: 0.10, 0.23,
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


--2eauhx3HRLXw1WRo
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 07:43:44PM +0000, Thinh Nguyen wrote:
>Hi,
>
>Michael Grzeschik wrote:
>> When we have nothing left to be queued after handling the last trb
>> we have to stop the current transfer. This way we can ensure that
>> the next request will be queued with an new and valid timestamp
>> and will not directly run into an missed xfer.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v1 -> v2: - This Patch replaces the following patch by Michael Olbrich:
>>              usb: dwc3: gadget: restart the transfer if a isoc request i=
s queued too late
>>
>>   drivers/usb/dwc3/gadget.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 0962ddd7fbf6ae6..b2b8b911ac79b39 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -2729,7 +2729,10 @@ static bool dwc3_gadget_endpoint_trbs_complete(st=
ruct dwc3_ep *dep,
>>   	if (dep->flags & DWC3_EP_END_TRANSFER_PENDING)
>>   		goto out;
>>
>> -	if (status =3D=3D -EXDEV && list_empty(&dep->started_list))
>> +	if ((status =3D=3D -EXDEV && list_empty(&dep->started_list)) ||
>> +		(usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
>> +			list_empty(&dep->started_list) &&
>> +			list_empty(&dep->pending_list)))
>
>The -EXDEV check is also for isoc, maybe rearrange this for easier read:
>if (usb_endpoint_xfer_isoc(dep->endpoint.desc) &&
> =A0=A0=A0 list_empty(&dep->started_list) &&
> =A0=A0=A0 (list_empty(&dep->pending_list) || status =3D=3D -EXDEV))

Right, I will change it in v3.

>>   		dwc3_stop_active_transfer(dep, true, true);
>>   	else if (dwc3_gadget_ep_should_continue(dep))
>>   		if (__dwc3_gadget_kick_transfer(dep, false) =3D=3D 0)

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--2eauhx3HRLXw1WRo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAl70ksQACgkQC+njFXoe
LGSBiA/+JLdIcVl7SkIf713BSP+EJM2cHQRNSS8c236qNGqFiV4SrBWvzSUmNGn/
ZMsH++QdedSjxWsAk8S1ihs2D6bwFovJDgVyPFadTHzGe/uZh9e4tmCLDHMedIth
HOkU24u1nYP5g/79tq3xWAfiQFo4Owu+/tZ7/R2YaqynIMD00nNslWr8RwUqYVAT
koeiAD8a4t8oWa/WO5h73PpUObJVvp8MMhsChgFtXdBehOunmgsfiznt9uqMiLLv
tSrATY3XfEawFJG+S9FryzBlmnICurFnpc6i3hfp2Ep26D5oXHHTN3pjby9DJAnW
siQHRRnX4HBpHGJArwV1i03UFVx2btaS+FHFIkeHYO3tNW6H3Vwcm96DC8LXMwzq
cKEcSDgfV2HnkIHHxiK5EoPJadQfl5axFdFwUp8vOAbw1k45DClrrJYcKFoSypik
mz7mnmG9vtUWjZMkulflBkUEynYZ1S3chDm/6emqkCAfQLCL9Q7O01ZZNk2T9mGN
ugAh9x031NZOFRU1+2P4Ir6LFeqw+UScrzqGU2LZSBjhg50KdqWkRXQTiINE7W/s
uAIpCZKhBtp4XkePlqAsFSM1V8PS+tjq2s7pAVwGAJVF4mW0CxnmYXB27jSgne/f
86ZeP+sSinmBM6i88zfrQivtN+h0lKPvNHiJayRQ3cV6fD88elw=
=IAlx
-----END PGP SIGNATURE-----

--2eauhx3HRLXw1WRo--
