Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 257C879A0DB
	for <lists+linux-usb@lfdr.de>; Mon, 11 Sep 2023 02:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjIKAuL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Sep 2023 20:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjIKAuL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Sep 2023 20:50:11 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2214194
        for <linux-usb@vger.kernel.org>; Sun, 10 Sep 2023 17:50:05 -0700 (PDT)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfV7r-00019w-25; Mon, 11 Sep 2023 02:50:03 +0200
Received: from mgr by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1qfV7p-00FBR0-IY; Mon, 11 Sep 2023 02:50:01 +0200
Date:   Mon, 11 Sep 2023 02:50:01 +0200
From:   Michael Grzeschik <mgr@pengutronix.de>
To:     Avichal Rakesh <arakesh@google.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Message-ID: <ZP5kOcuKykSY8ycr@pengutronix.de>
References: <20230615093406.80195-1-dan.scally@ideasonboard.com>
 <20230615171558.GK741@pendragon.ideasonboard.com>
 <dbf1e426-cf86-46c4-afb9-9d6983f0fb6d@google.com>
 <ZPXrceImaT9GevmA@pengutronix.de>
 <CAMHf4WJ6hBEzPUCOX8wbnGZ7pUuG1a+mwR3h=d6=kyyf9W7p+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eykuep+YTpOiRHUq"
Content-Disposition: inline
In-Reply-To: <CAMHf4WJ6hBEzPUCOX8wbnGZ7pUuG1a+mwR3h=d6=kyyf9W7p+g@mail.gmail.com>
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
Subject: Re: [PATCH] usb: gadget: uvc: Move usb_ep_disable() to
 uvcg_video_enable()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.whiteo.stw.pengutronix.de)
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--eykuep+YTpOiRHUq
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avichal

On Fri, Sep 08, 2023 at 11:54:40PM +0800, Avichal Rakesh wrote:
>Apologies for the late reply, I have been out travelling.
>On Mon, Sep 4, 2023 at 10:36=E2=80=AFPM Michael Grzeschik <mgr@pengutronix=
=2Ede> wrote:
>> Cc'ing: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>
>> On Wed, Aug 30, 2023 at 01:38:23PM -0700, Avichal Rakesh wrote:
>> >On 6/15/23 10:15, Laurent Pinchart wrote:
>> >> On Thu, Jun 15, 2023 at 10:34:06AM +0100, Daniel Scally wrote:
>> >>> Currently the UVC Gadget's .set_alt() callback disables the USB
>> >>> endpoint, following which a V4L2 event is queued that closes
>> >>> down the workqueue. This ordering results in repeated calls to
>> >>> usb_ep_queue() from the workqueue whilst usb_ep_disable() is
>> >>> running - behaviour that the documentation for usb_ep_disable()
>> >>> specifically prohibits.
>> >>>
>> >>> Move the call to usb_ep_disable() until after cancel_work_sync(),
>> >>> which will guarantee the endpoint is no longer in use when
>> >>> usb_ep_disable() is called.
>> >>>
>> >>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>> >>> ---
>> >>>  drivers/usb/gadget/function/f_uvc.c     | 3 ---
>> >>>  drivers/usb/gadget/function/uvc_video.c | 4 ++++
>> >>>  2 files changed, 4 insertions(+), 3 deletions(-)
>> >>>
>> >>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadge=
t/function/f_uvc.c
>> >>> index 5e919fb65833..4b91bd572a83 100644
>> >>> --- a/drivers/usb/gadget/function/f_uvc.c
>> >>> +++ b/drivers/usb/gadget/function/f_uvc.c
>> >>> @@ -337,9 +337,6 @@ uvc_function_set_alt(struct usb_function *f, uns=
igned interface, unsigned alt)
>> >>>             if (uvc->state !=3D UVC_STATE_STREAMING)
>> >>>                     return 0;
>> >>>
>> >>> -           if (uvc->video.ep)
>> >>> -                   usb_ep_disable(uvc->video.ep);
>> >>> -
>> >>>             memset(&v4l2_event, 0, sizeof(v4l2_event));
>> >>>             v4l2_event.type =3D UVC_EVENT_STREAMOFF;
>> >>>             v4l2_event_queue(&uvc->vdev, &v4l2_event);
>> >>
>> >> If we don't disable the endpoint here, should we return
>> >> USB_GADGET_DELAYED_STATUS here (and call uvc_function_setup_continue()
>> >> in uvc_v4l2_streamoff()) or is that not needed ? The uvc->state updat=
ed
>> >> should then possibly be moved to uvc_v4l2_streamoff() (checking if th=
is
>> >> would cause any race condition would also be a nice bonus :-)).
>> >>
>> >
>> >Hey all,
>> >
>> >First off, apologies for reviving an old thread. We've also been seeing=
 the
>> >"no resource for ep2in" warning from dwc3 controller, followed by the U=
VC gadget
>> >not streaming any frames, when there is a quick STREAMOFF->STREAMON seq=
uence.
>> >
>> >It looks like this is the same root cause as what Dan mentioned in
>> >https://lore.kernel.org/20230531085544.253363-1-dan.scally@ideasonboard=
=2Ecom/
>> >and this patch seems to solve. (Thank you Dan, for posting the stacktra=
ce in
>> >that email thread! I had been banging my head for a couple of days befo=
re
>> >thinking of looking up the exact stack :|)
>> >
>> >IIUC, this stems from workqueue not fully shutting down by the time the=
 usb
>> >endpoint is disabled and we need stronger guarantees that the workqueue=
 pumping
>> >usb_requests doesn't accidentally queue usb_requests _after_ we've disa=
bled
>> >the streaming endpoint on the usb controller.
>> >
>> >Attached is a patch that attempts to address the concerns raised here a=
nd sets
>> >up some stronger timing and memory guarantees.
>> >
>> >So here are the list of changes over what Dan had already started:
>> >
>> > - Return USB_GADGET_DELAYED_STATUS from set_alt. This is to ensure the=
re are no
>> >   more control transfers while we're waiting on the workqueue to wind =
down.
>> >
>> > - Move updating uvc->state to uvc_v4l2_streamoff as Laurent suggested.
>> >   This ensures that setting uvc->state to STREAMING or CONNECTED
>> >   happens as a result of streamoff and streamon events which makes thi=
ngs
>> >   easier to reason about.
>> >
>> > - Guard video_pump with uvc->state so the thread can be stopped by set=
ting
>> >   uvc->state to anything other than UVC_STATE_STREAMING. This effectiv=
ely makes
>> >   uvc->state a flag for the video_pump loop to exit. This is the same =
flag that
>> >   the complete callback uses to restart the workqueue, so all interact=
ions
>> >   with the controller are effectively guarded by the same flag now.
>> >
>> > - Set uvc->state to UVC_STATE_CONNECTED before winding down the work q=
ueue.
>> >   Now that all usb logic is guarded by the same flag, setting the flag=
 should
>> >   stop all usb packet queuing once current execution finishes.
>> >
>> > - Add some memory guarantees in uvcg_video_enable(). At the moment, we=
 don't
>> >   really consider the fact that usb_ep_dequeue is async, which means t=
hat the
>> >   usb_requests may not have been returned to the gadget before we start
>> >   deallocating them. With this patch, we wait until all usb_requests h=
ave been
>> >   returned to us before deallocating them (this adds a little bit of
>> >   bookkeeping, but nothing too complicated).
>>
>> I am currently trying to solve that by preparing a patch that is
>> fixing the use of the requests when deallocating them. Since currently
>> the uvc_gadget is also running into wild use after free issues because
>> of exactly that async dequeue and dealloc situation.
>
>Do you already have a patch up for this? It seems my LKML-fu is
>failing and I can't seem to find the thread. If you aren't too deep
>into the patch, can you take a look at the request counting mechanism
>added in my patch? If you have a (somewhat) consistent repro of the
>use-after-dealloc issue, runnin it through the whole patch would be
>very appreciated! It is supposed to fix the exact problem you've
>described.

I just send out v1:

https://lore.kernel.org/linux-usb/20230911002451.2860049-1-m.grzeschik@peng=
utronix.de/

My patches did go back and forth between changes in the uvc-gadget
driver and the device-controller driver. My latest version was including
calling free_request from the complete handler. I found that option
while looking into the uac2 gadget code. It took away a lot of
pain while trying to fix the issue in the dwc3 gadget driver.

>> IMHO it should be
>> save to call dealloc after calling dequeue. Which is probably true for
>> other usb device controller driver other then dwc3.
>
>Perhaps Thinh or someone better versed in Gadget API can chime in on
>this, but as it stands usb_ep_dequeue specifically says that it is
>async, and gadget drivers must wait on the complete callbacks to
>regain ownership of the usb_request. Until the API change is made, UVC
>should adhere to the current API?

Since you mention that usb_ep_dequeue is async I am very confident
that it is safe to free the request in the completion handler.

Although we could cleanup and improve the uvc_video_free_requests
function itself. But with the patches I have here the use
after free was gone so far. So they should be good so far.

>> For some background. The dwc3 is putting the requests into a cancelled l=
ist
>> that will be cleared by the interrupt handler and that is dequeuing them
>> instead. In between the dequeue call and the interrupt call the uvc laye=
r could
>> dealloc the request which leads the interrupt handler to dequeue an
>> already freed request.
>
>This roughly tracks with what I gleaned from skimming the DWC3 code as
>well. In local tests the complete calls were always timely and I never
>actually ran into the situation where UVC deallocated an unowned
>request, but as someone (I think it was Alan?)  said in a previous
>thread: technically possible just means it will happen eventually
>
>Please do review/test the patch. I'll send out a formal patch on
>Monday once I am back, but would love to have some early eyes take a
>look in case there is something obvious I missed.

First I tested your patch with my sketchy setup where I more then once
run into the use after free condition. But with the patch this was not
gone.

I also looked over the patch. As what I saw this is a possible
alternative to my patches. The changes are doing some similar things.
But the code is changing to many things at once. Please split the code
up into more logical chunks. Perhaps you could try to rebase it on
my patches. And start from there.

Thanks,
Michael

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--eykuep+YTpOiRHUq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElXvEUs6VPX6mDPT8C+njFXoeLGQFAmT+ZDYACgkQC+njFXoe
LGQGqhAAk0L7VASKdNom5YwvKetV/nCubzjQ5MfRp94C+ic6DgsAgBtaAF/MeASi
rgaw5FJWH7TuRWsAo3YHzbwLPqAyfauoYIOPzWaCEjEcqP8vY/aEkSMsQ3cmD23J
NJnxtNBg358sZqWozgDVrfqKHKmPZyUfRV1lTLF1hvuh95l3qj1AXbhUCCWzUM3f
7+Nnba+TWQXFucSfPgzCzfv5435aE75JLcNF5NdZ9x8MPFs6atpGtv1J2CcmWTn6
gaPnGUFjfFew1fdMvXb2MmA/bXtDKflOnINKwxBiJj4r6CBM5Katjz3j9TpBZbXa
Il1qBrZO8SZUcRCvhAY4wM1jOp9LX7L4z5EG+5mW60B7wMG0oZzxOUF3DoVVTKcP
R++uHyQa21Hga8LFOQxlVAvU41MFdKUMSrmzS0CYldcmdfHLXWJ/w7jEX0h1IbBa
zmdX+s1huI9Pz7zPPWj39shMr8YxtW3QUv8fQVCfVqSrWyihzbxZuWIsCJe4QTJe
5pag4EMySjw0K4t9VC0bi5nLWxDvAqGFY0zKm9vdbCtGFTrkXXVoHApPNIA06gWO
gykeptZGgT0g1BRM232sXzYqmfswTzDEwhNNxEwc1fCpDR7PemRIoL17W31mFzlG
wP4x7xhFp80OJNaIoiqLS+iJU/WvgIfe/Ps89JFUIrERrX6ndjA=
=6d03
-----END PGP SIGNATURE-----

--eykuep+YTpOiRHUq--
