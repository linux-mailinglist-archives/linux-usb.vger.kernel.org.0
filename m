Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACCF7798A3E
	for <lists+linux-usb@lfdr.de>; Fri,  8 Sep 2023 17:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244531AbjIHPy7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Sep 2023 11:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbjIHPy6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Sep 2023 11:54:58 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234011BC1
        for <linux-usb@vger.kernel.org>; Fri,  8 Sep 2023 08:54:54 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99c1c66876aso280797766b.2
        for <linux-usb@vger.kernel.org>; Fri, 08 Sep 2023 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1694188492; x=1694793292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAW2eAnwKpql55bSICYaR4XGw1QtPbIRnS2ZZ8yTGWo=;
        b=432Qq6e6S3mkeeJQudmSqzLAQoweZ0TySid+pg8QC9kBtB/16u96LSeeL5mVddJeqD
         /H1C27nWci7frov3/Rws5ES/LUrxkfrD4MFCFNqrSonOauMyLLLO3/iMvbDx8QbN5VV3
         zxcQ2pgnwaLqaAr+amMITtNyd9EVIoV7oTJwNgfpZz9Wa66jJ36GyCwHayN6Mz1elH7q
         dBfdJxPh0W9UDDXc4nB0DUpAK7QDIRatMdiLNaIjtNvi/RBIixmZ1T7plS7ubISz5l9N
         dkKo0je0ZoM0TWWV15LjrfHYofq5PJ1rKaYowpOIs/myrfvUc9EWKO0Ss7FkfhSs+w2z
         JKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694188492; x=1694793292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAW2eAnwKpql55bSICYaR4XGw1QtPbIRnS2ZZ8yTGWo=;
        b=dRGFtc88qO1/dHNQ2R51qjEO5vI45zlYVWspbM4YMM0RJRjsqQFVn5byZcuTXASN3S
         JMAcHnu7U4Vn5TX68Q3pVeHwtpxBbeZ7+yNAoTHlzZ3lmLmd3DnTJmo1fA9bAUSFGUPj
         BVxo7G4YqqoO2laHle6oAwA+ZDkbPrezZk3VLKz6639hrmhvSwCnT2nh1S0mYDKrgYja
         0Q8HNEiVQTrjqZpcMwIRpEDW5Mw/a8ipByW6C0X4Mrosj8c3HegvPegabiu6AdFXToIg
         JIXIFXKCqm9oziYpAGiCfLkOYUjPoWWVW30gWgOjr9QpkDM03ZcKP5Oo/2G3OKMMtYAc
         1hkw==
X-Gm-Message-State: AOJu0YwhV2vECxbq47QZO23VVHh3vKvMMoMvL1hFgmdJr9j0LSDfwGle
        NJ3cmcPK8/GpWZAljeJnMiLawrnw/bKThkTAOVmXbQ==
X-Google-Smtp-Source: AGHT+IHhp4OplVsciZa+ZZQHcLWT2VyKnOD/Lc86S03vJwPYc4BHkUa5ph7q1G2WBAJWKHsCaA9MDEI1Hw92yHrVreE=
X-Received: by 2002:a17:906:3111:b0:9a1:e941:6f49 with SMTP id
 17-20020a170906311100b009a1e9416f49mr2185740ejx.44.1694188492444; Fri, 08 Sep
 2023 08:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230615093406.80195-1-dan.scally@ideasonboard.com>
 <20230615171558.GK741@pendragon.ideasonboard.com> <dbf1e426-cf86-46c4-afb9-9d6983f0fb6d@google.com>
 <ZPXrceImaT9GevmA@pengutronix.de>
In-Reply-To: <ZPXrceImaT9GevmA@pengutronix.de>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Fri, 8 Sep 2023 23:54:40 +0800
Message-ID: <CAMHf4WJ6hBEzPUCOX8wbnGZ7pUuG1a+mwR3h=d6=kyyf9W7p+g@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: uvc: Move usb_ep_disable() to uvcg_video_enable()
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Apologies for the late reply, I have been out travelling.

On Mon, Sep 4, 2023 at 10:36=E2=80=AFPM Michael Grzeschik <mgr@pengutronix.=
de> wrote:
>
> Hi Avichal
>
> Cc'ing: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>
> On Wed, Aug 30, 2023 at 01:38:23PM -0700, Avichal Rakesh wrote:
> >On 6/15/23 10:15, Laurent Pinchart wrote:
> >> On Thu, Jun 15, 2023 at 10:34:06AM +0100, Daniel Scally wrote:
> >>> Currently the UVC Gadget's .set_alt() callback disables the USB
> >>> endpoint, following which a V4L2 event is queued that closes
> >>> down the workqueue. This ordering results in repeated calls to
> >>> usb_ep_queue() from the workqueue whilst usb_ep_disable() is
> >>> running - behaviour that the documentation for usb_ep_disable()
> >>> specifically prohibits.
> >>>
> >>> Move the call to usb_ep_disable() until after cancel_work_sync(),
> >>> which will guarantee the endpoint is no longer in use when
> >>> usb_ep_disable() is called.
> >>>
> >>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >>> ---
> >>>  drivers/usb/gadget/function/f_uvc.c     | 3 ---
> >>>  drivers/usb/gadget/function/uvc_video.c | 4 ++++
> >>>  2 files changed, 4 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget=
/function/f_uvc.c
> >>> index 5e919fb65833..4b91bd572a83 100644
> >>> --- a/drivers/usb/gadget/function/f_uvc.c
> >>> +++ b/drivers/usb/gadget/function/f_uvc.c
> >>> @@ -337,9 +337,6 @@ uvc_function_set_alt(struct usb_function *f, unsi=
gned interface, unsigned alt)
> >>>             if (uvc->state !=3D UVC_STATE_STREAMING)
> >>>                     return 0;
> >>>
> >>> -           if (uvc->video.ep)
> >>> -                   usb_ep_disable(uvc->video.ep);
> >>> -
> >>>             memset(&v4l2_event, 0, sizeof(v4l2_event));
> >>>             v4l2_event.type =3D UVC_EVENT_STREAMOFF;
> >>>             v4l2_event_queue(&uvc->vdev, &v4l2_event);
> >>
> >> If we don't disable the endpoint here, should we return
> >> USB_GADGET_DELAYED_STATUS here (and call uvc_function_setup_continue()
> >> in uvc_v4l2_streamoff()) or is that not needed ? The uvc->state update=
d
> >> should then possibly be moved to uvc_v4l2_streamoff() (checking if thi=
s
> >> would cause any race condition would also be a nice bonus :-)).
> >>
> >
> >Hey all,
> >
> >First off, apologies for reviving an old thread. We've also been seeing =
the
> >"no resource for ep2in" warning from dwc3 controller, followed by the UV=
C gadget
> >not streaming any frames, when there is a quick STREAMOFF->STREAMON sequ=
ence.
> >
> >It looks like this is the same root cause as what Dan mentioned in
> >https://lore.kernel.org/20230531085544.253363-1-dan.scally@ideasonboard.=
com/
> >and this patch seems to solve. (Thank you Dan, for posting the stacktrac=
e in
> >that email thread! I had been banging my head for a couple of days befor=
e
> >thinking of looking up the exact stack :|)
> >
> >IIUC, this stems from workqueue not fully shutting down by the time the =
usb
> >endpoint is disabled and we need stronger guarantees that the workqueue =
pumping
> >usb_requests doesn't accidentally queue usb_requests _after_ we've disab=
led
> >the streaming endpoint on the usb controller.
> >
> >Attached is a patch that attempts to address the concerns raised here an=
d sets
> >up some stronger timing and memory guarantees.
> >
> >So here are the list of changes over what Dan had already started:
> >
> > - Return USB_GADGET_DELAYED_STATUS from set_alt. This is to ensure ther=
e are no
> >   more control transfers while we're waiting on the workqueue to wind d=
own.
> >
> > - Move updating uvc->state to uvc_v4l2_streamoff as Laurent suggested.
> >   This ensures that setting uvc->state to STREAMING or CONNECTED
> >   happens as a result of streamoff and streamon events which makes thin=
gs
> >   easier to reason about.
> >
> > - Guard video_pump with uvc->state so the thread can be stopped by sett=
ing
> >   uvc->state to anything other than UVC_STATE_STREAMING. This effective=
ly makes
> >   uvc->state a flag for the video_pump loop to exit. This is the same f=
lag that
> >   the complete callback uses to restart the workqueue, so all interacti=
ons
> >   with the controller are effectively guarded by the same flag now.
> >
> > - Set uvc->state to UVC_STATE_CONNECTED before winding down the work qu=
eue.
> >   Now that all usb logic is guarded by the same flag, setting the flag =
should
> >   stop all usb packet queuing once current execution finishes.
> >
> > - Add some memory guarantees in uvcg_video_enable(). At the moment, we =
don't
> >   really consider the fact that usb_ep_dequeue is async, which means th=
at the
> >   usb_requests may not have been returned to the gadget before we start
> >   deallocating them. With this patch, we wait until all usb_requests ha=
ve been
> >   returned to us before deallocating them (this adds a little bit of
> >   bookkeeping, but nothing too complicated).
>
> I am currently trying to solve that by preparing a patch that is
> fixing the use of the requests when deallocating them. Since currently
> the uvc_gadget is also running into wild use after free issues because
> of exactly that async dequeue and dealloc situation.

Do you already have a patch up for this? It seems my LKML-fu is
failing and I can't seem to find the thread. If you aren't too deep
into the patch, can you take a look at the request counting mechanism
added in my patch? If you have a (somewhat) consistent repro of the
use-after-dealloc issue, runnin it through the whole patch would be
very appreciated! It is supposed to fix the exact problem you've
described.

> IMHO it should be
> save to call dealloc after calling dequeue. Which is probably true for
> other usb device controller driver other then dwc3.

Perhaps Thinh or someone better versed in Gadget API can chime in on
this, but as it stands usb_ep_dequeue specifically says that it is
async, and gadget drivers must wait on the complete callbacks to
regain ownership of the usb_request. Until the API change is made, UVC
should adhere to the current API?

>
> For some background. The dwc3 is putting the requests into a cancelled li=
st
> that will be cleared by the interrupt handler and that is dequeuing them
> instead. In between the dequeue call and the interrupt call the uvc layer=
 could
> dealloc the request which leads the interrupt handler to dequeue an
> already freed request.

This roughly tracks with what I gleaned from skimming the DWC3 code as
well. In local tests the complete calls were always timely and I never
actually ran into the situation where UVC deallocated an unowned
request, but as someone (I think it was Alan?)  said in a previous
thread: technically possible just means it will happen eventually

Please do review/test the patch. I'll send out a formal patch on
Monday once I am back, but would love to have some early eyes take a
look in case there is something obvious I missed.

Thank you.

- Avi
