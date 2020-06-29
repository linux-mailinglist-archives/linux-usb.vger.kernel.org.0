Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035C920D74F
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jun 2020 22:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732367AbgF2T2k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jun 2020 15:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732750AbgF2T1n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jun 2020 15:27:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0212C02A559
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2020 06:12:27 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jptaE-0004Bk-8O; Mon, 29 Jun 2020 15:12:26 +0200
Received: from mgr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1jptaC-0002as-UY; Mon, 29 Jun 2020 15:12:24 +0200
Date:   Mon, 29 Jun 2020 15:12:24 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: [PATCH v2 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Message-ID: <20200629131224.GI21325@pengutronix.de>
References: <20200624144907.9604-1-m.grzeschik@pengutronix.de>
 <20200624144907.9604-2-m.grzeschik@pengutronix.de>
 <fde48c28-3e9b-02f4-d0b0-5a34af3461e1@synopsys.com>
 <20200625114449.GF21325@pengutronix.de>
 <daa160c6-ce69-93c4-a6ec-f4044541db3c@synopsys.com>
 <f66f8231-b514-c63f-e8b2-2f7d4d67c8d8@synopsys.com>
 <6d5cb659-5aa0-298f-23b1-b1bc937ca844@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2+N3zU4ZlskbnZaJ"
Content-Disposition: inline
In-Reply-To: <6d5cb659-5aa0-298f-23b1-b1bc937ca844@synopsys.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:08:06 up 130 days, 20:38, 121 users,  load average: 0.12, 0.36,
 0.28
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--2+N3zU4ZlskbnZaJ
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 08:20:26PM +0000, Thinh Nguyen wrote:
>Thinh Nguyen wrote:
>> Thinh Nguyen wrote:
>>> Hi,
>>>
>>> Michael Grzeschik wrote:
>>>> Hi!
>>>>
>>>> On Wed, Jun 24, 2020 at 07:26:42PM +0000, Thinh Nguyen wrote:
>>>>> Michael Grzeschik wrote:
>>>>>> From: Michael Olbrich <m.olbrich@pengutronix.de>
>>>>>>
>>>>>> Currently __dwc3_gadget_start_isoc must be called very shortly after
>>>>>> XferNotReady. Otherwise the frame number is outdated and start trans=
fer
>>>>>> will fail, even with several retries.
>>>>> Did you try with the recent update for isoc? (e.i., after 5
>>>>> START_TRANSFER failures, the driver will issue END_TRANSFER to retry =
on
>>>>> the next XferNotReady event)
>>>>>
>>>>> Let me know if you still run into issues with that.
>>>> Yes. Without my patch I still see the issue. Event with the retry
>>>> machanism. It is even worse. I even missed one additional patch,
>>>> I had on top this one. See my note below.
>>> Ok. Can you clarify what issue you're seeing?

Yes. There are many missed xfer events, flooding the uvc gadget
function driver.

>>>>>> DSTS provides the lower 14 bit of the frame number. Use it in
>>>>>> combination
>>>>>> with the frame number provided by XferNotReady to guess the current
>>>>>> frame
>>>>>> number. This will succeed unless more than one 14 rollover has happe=
ned
>>>>>> since XferNotReady.
>>>>>>
>>>>>> Start transfer might still fail if the frame number is increased
>>>>>> immediately after DSTS is read. So retries are still needed.
>>>>>> Don't drop the current request if this happens. This way it is not
>>>>>> lost and
>>>>>> can be used immediately to try again with the next frame number.
>>>>>>
>>>>>> With this change, __dwc3_gadget_start_isoc is still not successfully
>>>>>> in all
>>>>>> cases bit it increases the acceptable delay after XferNotReady
>>>>>> significantly.
>>>>>>
>>>>>> Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
>>>>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>>>>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>>>>>
>>>>>> ---
>>>>>> v1 -> v2: - removed last_frame_number from struct
>>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - included rollover variable
>>>>>>
>>>>>>   =A0 drivers/usb/dwc3/gadget.c | 37 +++++++++++++++++++++++++------=
------
>>>>>>   =A0 1 file changed, 25 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>>>> index 421a0f73110a40b..0962ddd7fbf6ae6 100644
>>>>>> --- a/drivers/usb/dwc3/gadget.c
>>>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>>>> @@ -1276,7 +1276,7 @@ static void dwc3_prepare_trbs(struct dwc3_ep
>>>>>> *dep)
>>>>>>
>>>>>>   =A0 static void dwc3_gadget_ep_cleanup_cancelled_requests(struct
>>>>>> dwc3_ep *dep);
>>>>>>
>>>>>> -static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep)
>>>>>> +static int __dwc3_gadget_kick_transfer(struct dwc3_ep *dep, bool
>>>>>> keep_req)
>>>>> Any reason to have keep_req? With the recent changes, if
>>>>> dwc3_send_gadget_ep_cmd() returns -EAGAIN, then the controller driver
>>>>> won't give back the request.
>>>> Yes, we don't need the keep_req. I tried this and it worked without.
>>>> I will remove the parameter in v3.
>>>>
>>>>>>   =A0 {
>>>>>>   =A0=A0=A0=A0=A0 struct dwc3_gadget_ep_cmd_params params;
>>>>>>   =A0=A0=A0=A0=A0 struct dwc3_request=A0=A0=A0=A0=A0=A0=A0 *req;
>>>>>> @@ -1314,12 +1314,9 @@ static int __dwc3_gadget_kick_transfer(struct
>>>>>> dwc3_ep *dep)
>>>>>>   =A0=A0=A0=A0=A0 }
>>>>>>
>>>>>>   =A0=A0=A0=A0=A0 ret =3D dwc3_send_gadget_ep_cmd(dep, cmd, &params);
>>>>>> -=A0=A0=A0 if (ret < 0) {
>>>>>> +=A0=A0=A0 if (ret < 0 && (!keep_req || ret !=3D -EAGAIN)) {
>>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 struct dwc3_request *tmp;
>>>>>>
>>>>>> -=A0=A0=A0=A0=A0=A0=A0 if (ret =3D=3D -EAGAIN)
>>>>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return ret;
>>>>>> -
>>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 dwc3_stop_active_transfer(dep, true, t=
rue);
>>>>>>
>>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 list_for_each_entry_safe(req, tmp, &de=
p->started_list, list)
>>>>>> @@ -1335,7 +1332,7 @@ static int __dwc3_gadget_kick_transfer(struct
>>>>>> dwc3_ep *dep)
>>>>>>   =A0=A0=A0=A0=A0 if (dep->stream_capable && req->request.is_last)
>>>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->flags |=3D DWC3_EP_WAIT_TRANSFER_=
COMPLETE;
>>>>>>
>>>>>> -=A0=A0=A0 return 0;
>>>>>> +=A0=A0=A0 return ret;
>>>>>>   =A0 }
>>>>>>
>>>>>>   =A0 static int __dwc3_gadget_get_frame(struct dwc3 *dwc)
>>>>>> @@ -1458,7 +1455,7 @@ static int dwc3_gadget_start_isoc_quirk(struct
>>>>>> dwc3_ep *dep)
>>>>>>   =A0=A0=A0=A0=A0 dep->start_cmd_status =3D 0;
>>>>>>   =A0=A0=A0=A0=A0 dep->combo_num =3D 0;
>>>>>>
>>>>>> -=A0=A0=A0 return __dwc3_gadget_kick_transfer(dep);
>>>>>> +=A0=A0=A0 return __dwc3_gadget_kick_transfer(dep, false);
>>>>>>   =A0 }
>>>>>>
>>>>>>   =A0 static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
>>>>>> @@ -1481,9 +1478,25 @@ static int __dwc3_gadget_start_isoc(struct
>>>>>> dwc3_ep *dep)
>>>>>>   =A0=A0=A0=A0=A0 }
>>>>>>
>>>>>>   =A0=A0=A0=A0=A0 for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>>>>>> -=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3_ALIGN_FRAME(dep, i=
 + 1);
>>>>>> +=A0=A0=A0=A0=A0=A0=A0 /*
>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * frame_number is set from XferNotReady an=
d may be already
>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * out of date. DSTS only provides the lowe=
r 14 bit of the
>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * current frame number. So add the upper t=
wo bits of
>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * frame_number and handle a possible rollo=
ver.
>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * This will provide the correct frame_numb=
er unless more than
>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 * rollover has happened since XferNotReady.
>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0 */
>>>>>> +=A0=A0=A0=A0=A0=A0=A0 u32 frame =3D __dwc3_gadget_get_frame(dwc);
>>>>>> +=A0=A0=A0=A0=A0=A0=A0 bool rollover =3D frame < (dep->frame_number =
& 0x3fff);
>>>>>> +
>>>>>> +=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D (dep->frame_number & ~0=
x3fff) | frame;
>>>>>> +=A0=A0=A0=A0=A0=A0=A0 if (rollover)
>>>>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number +=3D BIT(14);
>>>>>> +
>>>>>> +=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC3_ALIGN_FRAME(dep, 1=
);
>>>> This is not enough, we have to add i into the alignment to ensure
>>>> that the stream is not failing:
>>>>
>>>>   =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D DWC=
3_ALIGN_FRAME(dep, i + 2);
>>>>
>>>> I am even thiking to move the frame number calculation into the
>>>> DWC3_DEPCMD_STARTTRANSFER code path of dwc3_send_gadget_ep_cmd. But th=
is
>>>> will break the dwc3_gadget_start_isoc_quirk function. What do you thin=
k?
>>> You shouldn't be keep calling __dwc3_gadget_get_frame() in a loop. You
>>> should do all these calculation to get the current frame_number only
>>> once before entering the retry loop.
>>>
>>> The issue here is we don't know when the XferNotReady event will be
>>> handled, which may be too late and multiple uframe had gone by. But once
>>> the event is being handled, it shouldn't take much time at all. That
>>> means __dwc3_gadget_get_frame() will return the same value.
>>>
>>> So, we need something like this:
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index f66ff7fd87a9..1cd73c2dbe71 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -1709,6 +1709,8 @@ static int dwc3_gadget_start_isoc_quirk(struct
>>> dwc3_ep *dep)
>>>    =A0static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
>>>    =A0{
>>>    =A0=A0=A0=A0=A0=A0=A0 struct dwc3 *dwc =3D dep->dwc;
>>> +=A0=A0=A0=A0=A0=A0 u32 current_frame;
>>> +=A0=A0=A0=A0=A0=A0 bool rollover;
>>>    =A0=A0=A0=A0=A0=A0=A0 int ret;
>>>    =A0=A0=A0=A0=A0=A0=A0 int i;
>>>
>>> @@ -1725,6 +1727,13 @@ static int __dwc3_gadget_start_isoc(struct
>>> dwc3_ep *dep)
>>>    =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 return dwc3_gadget_start_isoc_quirk(dep);
>>>    =A0=A0=A0=A0=A0=A0=A0 }
>>>
>>> +=A0=A0=A0=A0=A0=A0 current_frame =3D __dwc3_gadget_get_frame(dwc);
>>> +=A0=A0=A0=A0=A0=A0 rollover =3D current_frame < (dep->frame_number & 0=
x3fff);
>>> +
>>> +=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D (dep->frame_number & ~0x3f=
ff) | current_frame;
>>> +=A0=A0=A0=A0=A0=A0=A0 if (rollover)
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number +=3D BIT(14);
>>> +
>>>    =A0=A0=A0=A0=A0=A0=A0 for (i =3D 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
>>>    =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dep->frame_number =3D =
DWC3_ALIGN_FRAME(dep, i + 1);
>>>
>>>
>>> (Please create a macro for 0x3fff mask)
>>>
>> Forgot a couple of notes:
>>
>> 1) If bInterval is greater than 14, don't attempt to get current frame
>> from DSTS and ignore this mechanism.
>> 2) The rollover check needs to account for number of uframes per
>> interval. If the difference is less than an interval length, then no
>> need to update dep->frame_number.
>>
>
>Ignore number 2), DWC3_ALIGN_FRAME() should take care of that...

All right, I added the following changes to v3 before running
the retry loop.

        if (desc->bInterval <=3D 14) {
                u32 current_frame =3D __dwc3_gadget_get_frame(dwc);
                bool rollover =3D current_frame < (dep->frame_number & 0x3f=
ff);

                dep->frame_number =3D (dep->frame_number & ~0x3fff) | curre=
nt_frame;
                if (rollover)
                dep->frame_number +=3D BIT(14);
                        dep->frame_number +=3D BIT(14);
        }

Regards,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--2+N3zU4ZlskbnZaJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAl756LUACgkQC+njFXoe
LGSZeQ//a1dhHLRXnMDLV3HKdZ6zg9LlVbdbDR9S3b/l1STQtZQuKh2Dl+lKa95P
YfIkVhoYz5bh5WIv6wQ3fwKhVu3lqmn0DFloug9EvLP413uMS295xluk62DsbD0v
ns0jJFshkh1f4Dd9htUbYV0SrcD/Eq3rpMP/u6OfPwe1pRs4pZXuJjD763EonsT7
Jy6cU6IA6DpY+uApnMTqks95vFA+9g4vQGt76tRXbSBQlcbVeOERC24JI0ZaRuc3
UFNdibJ1uS93Voc8NSc1PManwxdkFhjuUmWnU04ek4p84H3XUQGa+tjmAOo7LRUB
Fk20IGmo8xdcuKhDLpaJjmrKsU8iXYbU54opCmHL0erb1Gv22RqEuXS+sUfvlt1I
vro/6ZQtXQZYmdLC6rLbVzKXGgNoiDYOOGZyZeI0HBvhBYAEd+dTCbbbBebTrJk5
6mIc3+R9p91IFWaDUh/B6hSGR5IQYKr8YMkFIeNL4XmJo7lXTJgQnGn6nSmFG301
mkR/PcnQrjoUz0ic1Fz1KhmXmnn+keMbr3akyambzRiMY4+elyKFHCh+9GENvkBS
qGaKyzU1cePt1ZY7slmu2mOkJlMXT/canaH7bIyNgQRMzUswQd/J6Zl9lQZhJhmj
X2JivB6DRjAMYHr2AKxYzTvD9vdxTBg/nbXeA8jg5hzmfTGOZS0=
=2wmL
-----END PGP SIGNATURE-----

--2+N3zU4ZlskbnZaJ--
