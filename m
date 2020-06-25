Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C930A209DAD
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 13:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404321AbgFYLow (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 07:44:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbgFYLow (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 07:44:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C50C2C061573
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2020 04:44:51 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1joQJG-0003QF-6w; Thu, 25 Jun 2020 13:44:50 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1joQJF-00057s-Gh; Thu, 25 Jun 2020 13:44:49 +0200
Date:   Thu, 25 Jun 2020 13:44:49 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: [PATCH v2 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Message-ID: <20200625114449.GF21325@pengutronix.de>
References: <20200624144907.9604-1-m.grzeschik@pengutronix.de>
 <20200624144907.9604-2-m.grzeschik@pengutronix.de>
 <fde48c28-3e9b-02f4-d0b0-5a34af3461e1@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aPOcx+xoD6gZZHnz"
Content-Disposition: inline
In-Reply-To: <fde48c28-3e9b-02f4-d0b0-5a34af3461e1@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:31:28 up 126 days, 19:01, 108 users,  load average: 0.12, 0.12,
 0.13
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--aPOcx+xoD6gZZHnz
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Jun 24, 2020 at 07:26:42PM +0000, Thinh Nguyen wrote:
>Michael Grzeschik wrote:
>> From: Michael Olbrich <m.olbrich@pengutronix.de>
>>
>> Currently __dwc3_gadget_start_isoc must be called very shortly after
>> XferNotReady. Otherwise the frame number is outdated and start transfer
>> will fail, even with several retries.
>
>Did you try with the recent update for isoc? (e.i., after 5
>START_TRANSFER failures, the driver will issue END_TRANSFER to retry on
>the next XferNotReady event)
>
>Let me know if you still run into issues with that.

Yes. Without my patch I still see the issue. Event with the retry
machanism. It is even worse. I even missed one additional patch,
I had on top this one. See my note below.

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
>>
>>   drivers/usb/dwc3/gadget.c | 37 +++++++++++++++++++++++++------------
>>   1 file changed, 25 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 421a0f73110a40b..0962ddd7fbf6ae6 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -1276,7 +1276,7 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
>>
>>   static void dwc3_gadget_ep_cleanup_cancelled_requests(struct dwc3_ep *=
dep);
>>
>> -static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
>> +static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep, bool keep_r=
eq)
>
>Any reason to have keep_req? With the recent changes, if
>dwc3_send_gadget_ep_cmd() returns -EAGAIN, then the controller driver
>won't give back the request.

Yes, we don't need the keep_req. I tried this and it worked without.
I will remove the parameter in v3.

>>   {
>>   	struct dwc3_gadget_ep_cmd_params params;
>>   	struct dwc3_request		*req;
>> @@ -1314,12 +1314,9 @@ static int __dwc3_gadget_kick_transfer(struct dwc=
3_ep *dep)
>>   	}
>>
>>   	ret =3D dwc3_send_gadget_ep_cmd(dep, cmd, &params);
>> -	if (ret < 0) {
>> +	if (ret < 0 && (!keep_req || ret !=3D -EAGAIN)) {
>>   		struct dwc3_request *tmp;
>>
>> -		if (ret =3D=3D -EAGAIN)
>> -			return ret;
>> -
>>   		dwc3_stop_active_transfer(dep, true, true);
>>
>>   		list_for_each_entry_safe(req, tmp, &dep->started_list, list)
>> @@ -1335,7 +1332,7 @@ static int __dwc3_gadget_kick_transfer(struct dwc3=
_ep *dep)
>>   	if (dep->stream_capable && req->request.is_last)
>>   		dep->flags |=3D DWC3_EP_WAIT_TRANSFER_COMPLETE;
>>
>> -	return 0;
>> +	return ret;
>>   }
>>
>>   static int __dwc3_gadget_get_frame(struct dwc3 *dwc)
>> @@ -1458,7 +1455,7 @@ static int dwc3_gadget_start_isoc_quirk(struct dwc=
3_ep *dep)
>>   	dep->start_cmd_status =3D 0;
>>   	dep->combo_num =3D 0;
>>
>> -	return __dwc3_gadget_kick_transfer(dep);
>> +	return __dwc3_gadget_kick_transfer(dep, false);
>>   }
>>
>>   static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
>> @@ -1481,9 +1478,25 @@ static int __dwc3_gadget_start_isoc(struct dwc3_e=
p *dep)
>>   	}
>>
>>   	for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>> -		dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i + 1);
>> +		/*
>> +		 * frame_number is set from XferNotReady and may be already
>> +		 * out of date. DSTS only provides the lower 14 bit of the
>> +		 * current frame number. So add the upper two bits of
>> +		 * frame_number and handle a possible rollover.
>> +		 * This will provide the correct frame_number unless more than
>> +		 * rollover has happened since XferNotReady.
>> +		 */
>> +		u32 frame =3D __dwc3_gadget_get_frame(dwc);
>> +		bool rollover =3D frame < (dep->frame_number & 0x3fff);
>> +
>> +		dep->frame_number =3D (dep->frame_number & ~0x3fff) | frame;
>> +		if (rollover)
>> +			dep->frame_number +=3D BIT(14);
>> +
>> +		dep->frame_number =3D DWC3_ALIGN_FRAME(dep, 1);

This is not enough, we have to add i into the alignment to ensure
that the stream is not failing:

                dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i + 2);

I am even thiking to move the frame number calculation into the
DWC3_DEPCMD_STARTTRANSFER code path of dwc3_send_gadget_ep_cmd. But this
will break the dwc3_gadget_start_isoc_quirk function. What do you think?

>>
>> -		ret =3D __dwc3_gadget_kick_transfer(dep);
>> +		ret =3D __dwc3_gadget_kick_transfer(dep,
>> +				i + 1 < DWC3_ISOC_MAX_RETRIES);
>>   		if (ret !=3D -EAGAIN)
>>   			break;
>>   	}
>> @@ -1567,7 +1580,7 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *=
dep, struct dwc3_request *req)
>>   		}
>>   	}
>>
>> -	return __dwc3_gadget_kick_transfer(dep);
>> +	return __dwc3_gadget_kick_transfer(dep, false);
>>   }
>>
>>   static int dwc3_gadget_ep_queue(struct usb_ep *ep, struct usb_request =
*request,
>> @@ -2719,7 +2732,7 @@ static bool dwc3_gadget_endpoint_trbs_complete(str=
uct dwc3_ep *dep,
>>   	if (status =3D=3D -EXDEV && list_empty(&dep->started_list))
>>   		dwc3_stop_active_transfer(dep, true, true);
>>   	else if (dwc3_gadget_ep_should_continue(dep))
>> -		if (__dwc3_gadget_kick_transfer(dep) =3D=3D 0)
>> +		if (__dwc3_gadget_kick_transfer(dep, false) =3D=3D 0)
>>   			no_started_trb =3D false;
>>
>>   out:
>> @@ -2904,7 +2917,7 @@ static void dwc3_endpoint_interrupt(struct dwc3 *d=
wc,
>>   			dwc3_gadget_ep_cleanup_cancelled_requests(dep);
>>   			if ((dep->flags & DWC3_EP_DELAY_START) &&
>>   			    !usb_endpoint_xfer_isoc(dep->endpoint.desc))
>> -				__dwc3_gadget_kick_transfer(dep);
>> +				__dwc3_gadget_kick_transfer(dep, false);
>>
>>   			dep->flags &=3D ~DWC3_EP_DELAY_START;
>>   		}

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--aPOcx+xoD6gZZHnz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAl70ji4ACgkQC+njFXoe
LGRc+hAAxIJLqdEg1DWEcR0Js/7kK5IDaOjeIpnMW8YgiwmT0BwePEshL2bu/Tfp
Y0YLPlF3qAUiCMgACpliuh27KBqZa//qLkIY/UZ2HeeS4PQyEOfZ47zbeEOHvAz5
2RVjk/nVhPfnFKn3OK/vRRRM0FJOhSD+IT7JNvUrnAVM7cNwJs2F91BnwDTANGA+
bUnmH0hXkmi/97P8XgIU/1CMn11ME/j4/0O8COp3TVN4hrbqOi4c/NPb4cF98OHT
GBVusJ6WXdSvX3VxF4lS9jYw2yBA/3gETIlzqNGdmvzNcd7G0SmcQOE+xAaKKERJ
oMqTTBkeUeOjL7BnguPhJ3zU4xMNOPKn0NiA/7LnrMXmkWRL8ELsB5bFBX+O2K59
dreS8s1hFYG9rnWI2sD/4ZLrPJxNeB6il8nppTLp7yTlRFXP3c70Dp7gMZ64prMN
23sIL8/FzcoJgSwJa0euW0058aG2kpwZIUIW7KiTqgREv1Jbfyrqz4fPNfDBqBDw
wqXDBMVJopq7DpWrbGSTblIZkfpwYSz7fKBicTqy1eATLMX3c9OtQEX5UqGbNf+Y
+SpRqhMgPlLQgouaS3wjKepLQIQx1ijWPrw/AuHCHFQGVSV7TK6lS8qjfpsbNHkA
8ij3+1IL0mFbymKpoJlYXZ9O7rBuc/PZ9SrF8OfjApdYvusA8ms=
=rJpI
-----END PGP SIGNATURE-----

--aPOcx+xoD6gZZHnz--
