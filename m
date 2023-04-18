Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B50506E6F97
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 00:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232783AbjDRWqK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 18:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232681AbjDRWqJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 18:46:09 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F1640EE
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 15:46:06 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-63b60365f53so2606075b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 15:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681857965; x=1684449965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xfAbIgN/U4b51Vyx2uGeK+GxjPqBuI48QdEm6Ztx0M=;
        b=LHA50gMPtEPZinusW4mWS8sj3yWTq9uAmtPtZgFch5Bw42mtrw69BmutCKd6DTNLw/
         KG2ovs/rBWq9Ljl7LCMZSNKeXP5Stqm9ut1QrHQzWwyLNeBOoiA+8CZxiWGoIFZ8D2nS
         YxA5DJT4OQ2LoTFFxoqnd6UPzE+j2+h/pLBxHSL+N5tqnE+eSXJpZGcBXM/jAVqJkFFE
         eaBcVnrkPfTmTrBvoKYn8TISfI2mDX22VA2+XQFtUtxeJm/MWvjkYI/nFAgGNMYI/lPJ
         cf11hbVtbWf9lHc1MvtX5hxulZzts3MCnLjab6qDfTL3QZtakjw81JJPvRjJWy1tFAHV
         7MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681857965; x=1684449965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xfAbIgN/U4b51Vyx2uGeK+GxjPqBuI48QdEm6Ztx0M=;
        b=DqA2n3CN4S9Fh/47yozYMw/7QUIQA30nBm2dr4RIfcP+XAzPT2F2zX6Yz3Hryb4f4W
         Ci8yswOmh35MPBsH5Y2gJteqBc3trb8c8lj3f6HOI+Hdh2XCgGvC8gckWSEAo+GnmXr+
         MXLabPU+vfKBbhmQFLuVAnPqE0v/JYj9O++itgAHcqV/7vtZVelmKqVQ0+2J0O4ughnO
         WK0+kE+09/R3drzmqvHMR2BuGWFHW7y5xbw82NeR8mLh8lMrJIMQT/FAXJ4nPPhSLOPo
         N680NJ920lmjWw7np1H+ONfQ6snk2Tr/DJPwAHBPE47SM1FcU7QyQINyRY0yHBo/b22U
         hkiw==
X-Gm-Message-State: AAQBX9d3380vuD/PKyo97VOefKoMkg9MvYOwgU4Uuksjfb5FW97Jc0VD
        k7BTwPXOBb4Sko4J+Ejr2tKXV1dIVBPgdMTpHRhZRg==
X-Google-Smtp-Source: AKy350aS1iQ4vd3SPi2enExGTeCcQKqyAIHDgVIG+VxRnCYozcnKQP+5DYr3gUcWPt+CtJaNjrmHU+dtB/73Abk6a7I=
X-Received: by 2002:a05:6a00:2d99:b0:63d:25e7:fd24 with SMTP id
 fb25-20020a056a002d9900b0063d25e7fd24mr706898pfb.0.1681857965289; Tue, 18 Apr
 2023 15:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com> <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com> <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
In-Reply-To: <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Tue, 18 Apr 2023 15:45:53 -0700
Message-ID: <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 18, 2023 at 12:40=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsy=
s.com> wrote:
>
> On Mon, Apr 17, 2023, Avichal Rakesh wrote:
> > On Mon, Apr 17, 2023 at 7:49=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Mon, Apr 17, 2023, Avichal Rakesh wrote:
> > > >
> > > > On 4/17/23 06:49, Greg KH wrote:
> > > > > On Fri, Apr 14, 2023 at 02:03:02PM -0700, Avichal Rakesh wrote:
> > > > >
> > > > >> This problem may be further exaggerated by the DWC3 controller d=
river
> > > > >> (which is what my device has) not setting the IMI flag when
> > > > >> no_interrupt flag is set
> > > > >> (https://urldefense.com/v3/__https://lore.kernel.org/all/ced336c=
84434571340c07994e3667a0ee284fefe.1666735451.git.Thinh.Nguyen@synopsys.com/=
)?__;!!A4F2R9G_pg!fB0krUX6qsOXrBsOHzLstVFWqTLL9ncwGFXxlxK0eedLY_29XdwjXRtbO=
-EWv1eX5okN1rOeBZspZ21KSb5b$
> > > > >> UVC Gadget Driver sets the no_interrupt flag for ~3/4 of its que=
ued
> > > > >> usb_request, so an ISOC failure may not immediately interrupt th=
e UVC
> > > > >> gadget driver, leaving more time for the frame to finish encodin=
g.
> > > > >>
> > > > >> I couldn't find any concrete error handling rules in the UVC spe=
cs, so
> > > > >> I am not sure what the proper solution here is. To try out, I cr=
eated
> > > > >> a patch (attached below) that dequeues all queued usb_requests f=
rom
> > > > >> the endpoint in case of an ISOC failure and clears the uvc buffe=
r
> > > > >> queue. This eliminated the partial frames with no perceivable fr=
ame
> > > > >> drops.
> > > > >>
> > > > >> So my questions here are:
> > > > >> 1. Is this a known issue, and if so are there workarounds for it=
?
> > > > >> 2. If the answer to above is "No", does the explanation and miti=
gation
> > > > >> seem reasonable?
> > > > >>
> > > > >> Patch follows (mostly for illustration, I can formalize it if
> > > > >> needed!). It adds a new 'req_inflight' list to track queued
> > > > >> usb_requests that have not been given back to the gadget driver =
and
> > > > >> drops all the queued requests in case of an ISOC failure. The ot=
her
> > > > >> changes are for the extra bookkeeping required to handle droppin=
g all
> > > > >> frames. I haven't been able to confirm it, but as far as I can t=
ell
> > > > >> the issue exists at ToT as well.
> > > > >>
> > >
> > > Perhaps this conversation with Jeff may explain the issues you observ=
ed:
> > > https://urldefense.com/v3/__https://lore.kernel.org/all/2022102116434=
9.fft4yqnxuztsqdeu@synopsys.com/__;!!A4F2R9G_pg!eK3VyAq7vX70vA-WJLA6_bPMbZF=
x0n33wH39JItHzwCNVqKSkN2aG0izF0GZPWqYxkgL-fNinWlIW71HbGGC$
> > >
> > > To summarized the long conversation, the UVC needs to maintain a
> > > constant queue of usb requests. Each request is scheduled for a speci=
fic
> > > interval. If the UVC couldn't keep up feeding requests to the
> > > controller, then we will have stale requests and missed isoc.
> > >
> > > From the discussion and review, the UVC couldn't queue requests fast
> > > enough. The problem is exacerbated when you reduce the interrupt
> > > frequency with no_interrupt setting. The dwc3 driver has some basic
> > > mechanism to detect for underrun by checking if the queue is empty, b=
ut
> > > that's not enough to workaround it.
> > >
> > > Your suggestion to dequeue the request would mean the controller driv=
er
> > > will reschedule the isoc transfer again, which reschedule the next
> > > request for a new interval (potentially avoid being stale). That's fi=
ne,
> > > but that may not be a great solution because we're still playing catc=
h
> > > up and the missed isoc already happened.
> > >
> > > You may try to do the followings to mitigate this issue:
> > > 1) Make sure UVC to only queuing rate is constant. Perhaps queue dumm=
y
> > >    requests in between time gaps if need be?
> > >
> > This is extremely helpful, thank you! I have a somewhat basic
> > question: For an isoc request, is its "freshness" determined from the
> > time at which usb_ep_queue is called, or from the time at which the
> > previous request was transferred to the host? If the "freshness" is
> > determined from the time 'usb_ep_request' was called, I wonder if the
> > "underrun" is artificial because UVC Gadget driver pumps all free
> > usb_requests at once, and then waits around doing nothing while the
> > usb_requests get stale in the controller's queue. In this case, just
> > slowing the encode loop to wait a little before queuing more requests
> > should do effectively what you suggest above?
> >
>
> Here's a simplified version of how it works:
> (Note that I'll be talking/using usb request as if it's TRBs and also
> ignore SG. I will also only focus about the current handling of the
> gadget driver and dwc3 driver.)

I appreciate you taking the time to explain this. This is very
enlightening, thank you!

>
> The controller tracks the current uframe. For isoc endpoint, when you
> call usb_ep_queue(), the controller doesn't consume the request right
> away. The request is scheduled for a specific interval. For UVC, an
> interval is a single uframe (125us). As the current uframe keeps
> incrementing, each request on a queue is consumed. If there's no request
> available for the current uframe, the next queued request is considered
> stale or expired. This case is considered underrun.
>
> "freshness" means the request is scheduled for a future uframe. "stale"
> means the request is queued for a past uframe. Isoc data is time
> sensitive. So if the data isn't gone out at a specific time, then it's
> dropped.
>
> The problem with many gadget drivers that use isoc endpoint is that they
> only queue more requests when they get notified that the previous set of
> requests are completed. This creates time gaps which can starve the
> controller of more requests.
>
> We have some basic mechanism in dwc3 to reschedule new requests when
> there's missed isoc and the queue is empty for UVC. However that's not
> enough. The time the controller consumes the request and the time the
> driver handles the interrupt is different. The driver may not know that
> queue is empty until it's already too late. The gadget driver just needs
> to make sure to keep the request queue to at least X amount of requests.
> Note that 125us is relatively fast.

I see, and I think I understand Greg's previous comment better as
well: The UVC driver isn't falling behind on the video stream, it is
falling behind the usb controller's monotonic isoc stream.

From what I can see, this leaves us in an interesting place: UVC
allows the host to configure the camera's output resolution and fps,
which effectively controls how fast the camera is generating data.
This is at odds with the UVC gadget driver, which currently packs each
video frame into as few usb_requests as possible (using the full
available size in usb_requests). Effectively, the UVC gadget driver
attempts to use the "full" bandwidth of isoc transfers even when the
camera isn't generating data fast enough. For example, in my
observations: 1 video frame is ~22kB. At 30fps, this represents 1/30
of the amount of data the camera would generate in a second. This 22kB
is split into 8 usb_requests which is about 1/1000 the number of
requests UVC driver needs to generate per second to prevent isoc
failures (assuming 125us monotonic uframes). Assuming some fudge
factor from the simplifications in your explanation gives the uvc
driver some extra leeway with request queuing, we're still roughly two
order of magnitudes out of sync. Even with perfect 'complete'
callbacks and video frame encodings, an underrun seems inevitable.
Data is being generated at a far slower rate than it is being
transferred. Does this reasoning seem valid?

Just as a test I'll try updating the UVC driver to consume 266
usb_requests per video frame (~1/30 of 8000), which should be enough
to keep the usb controller queue occupied for ~1/30s. Ideally, by the
time the controller queue is empty, the camera would have produced a
new frame. This doesn't solve the issue with latencies around callback
and an isoc failure might still happen, hopefully the failure
frequency is reduced because UVC queues enough requests per video
frame to not starve the controller's queue while waiting on a new
frame and the only way they go out of sync is from 'complete' callback
timings. I am assuming this has been tried before, but my LKML search
skills are failing and I can't find much on it.

>
> Note that this talking point is assuming that the UVC host behaving
> properly and poll for data every uframe. If not, it's a different issue.
>
> > > 2) Enhance dwc3 to detect underrun from UVC on request queue. ie. If =
the
> > >    queue is empty and a new request is queue, reschedule the isoc tra=
nsfer.
> > >    This will break some other devices if time guarantee is required. =
So
> > >    perhaps an additional flag is needed for this change of behavior.
> > >
> >
> > I am not as familiar with the DWC3, but just to clarify: Is your
> > suggestion to reschedule the stale requests if the controller's send
> > queue is empty (underrun) and the UVC gadget driver queues a new
> > request? Depending on how many stale requests there are, would that
> > run the risk of timing out the new request as well?
> >
>
> No, rescheduling here means all the queued requests will be scheduled
> for a new future uframe. But also note that the queue empty check is
> insufficient as explained above. So this would only mitigate the issue.
>

This makes a lot more sense after your explanation, thank you!

- Avi.
