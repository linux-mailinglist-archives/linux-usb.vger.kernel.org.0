Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C6F6E729A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 07:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbjDSF0E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 01:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbjDSF0D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 01:26:03 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39EBD4697
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 22:26:01 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-329518648ebso35837915ab.0
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 22:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681881960; x=1684473960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0paobNwtYuqDPANXAYh493QunYtmV3R2JqkkvrTO69A=;
        b=UA6thhmEU5hXGdJp4M63+W9TrnfL6ApVny/IWUPWrJucHTNMpgFKFy/LD5y6ELAU+t
         vzYofotOEhp8OfBDk0B8wfxyCj9YQULNQBAUET4zWysKAk2QPNP/wF3avF/9BZ+y6rN3
         /UEJ1USLlRjgFo/Zt7pial04r77BS+iCJuJ7y5F9vqfiv3fUprC3VMBXc7rzJ3+5ASLu
         NEmg9YI+OUrEHjajyTo4vk/aVK1MF3tP2Y9gAHVFT6Rr8S6dAZ2WS21+k2sCgo3U0S1O
         q5rUg0U6z90cKhklodqC5XxpKnXWtjwhNgUygk+9Y2bR+a7AiJ+JFZgg5TXkv72WG36z
         MZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681881960; x=1684473960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0paobNwtYuqDPANXAYh493QunYtmV3R2JqkkvrTO69A=;
        b=ZeAaIzn+7Gx9BC56oXC5lFdALBPxXrbtIVUX8ljzYZSUJyMto5NDkmvLypUzkriLwT
         haWETYmoQ8ZgyRkYrP2M5TbPp2G9bfGEAndF/D8JsccqTpaqMNkTYY+NvOSvQb46pmuH
         YHHD4tVldRpdCD6Ry3mioZIGDaHZBWgyX7oaNP1DgNeg9VTeHHzWYDi3tie6+Xn2oaYi
         WTXwC4kPvuJw5gcH7delTcaWn7XEALjySYB3nqfZKYxV+/hQZSNd7bKn2dLPFye3GTI7
         kb/X9JFH5hOwbYTCfxUxghMoPaJns6mr4qbZPU4JBp05YcIQ5X/b+eoMQjtrr5Mb8AF/
         wW3w==
X-Gm-Message-State: AAQBX9c1vjXxFzOnjPdEZdHzeb9DyJKKbRfk9wK7e8qiYP5Grzt0SFM9
        1oYZ8AI+1Xtt62oieRTmPXOZ1NlRkZE3mP4KzDcK7fWl8EJibQGDkq4=
X-Google-Smtp-Source: AKy350Y/QLjBA62J1LINrJcNO5ZOvPUwlbnrcIKSgvCXqHXLzDNUUvl/0L5zpZB6eS3xaIxDPPyLIMIv1AhZcSiT4NE=
X-Received: by 2002:a05:6e02:78f:b0:328:c3ae:12c6 with SMTP id
 q15-20020a056e02078f00b00328c3ae12c6mr13876938ils.9.1681881960280; Tue, 18
 Apr 2023 22:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com> <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com> <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com> <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <20230419001143.pdxflhzyecf4kvee@synopsys.com> <20230419001920.7gughc2sqwwx3a4e@synopsys.com>
In-Reply-To: <20230419001920.7gughc2sqwwx3a4e@synopsys.com>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Tue, 18 Apr 2023 22:25:49 -0700
Message-ID: <CAMHf4WL4+onLbav5rWoGZLMxhwtZTu8adfoz_8b5Uh__hdKZHw@mail.gmail.com>
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

On Tue, Apr 18, 2023 at 5:19=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Wed, Apr 19, 2023, Thinh Nguyen wrote:
> > On Tue, Apr 18, 2023, Avichal Rakesh wrote:
> > > On Tue, Apr 18, 2023 at 12:40=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@s=
ynopsys.com> wrote:
> > > >
> > > > On Mon, Apr 17, 2023, Avichal Rakesh wrote:
> > > > > On Mon, Apr 17, 2023 at 7:49=E2=80=AFPM Thinh Nguyen <Thinh.Nguye=
n@synopsys.com> wrote:
> > > > > >
> > > > > > On Mon, Apr 17, 2023, Avichal Rakesh wrote:
> > > > > > >
> > > > > > > On 4/17/23 06:49, Greg KH wrote:
> > > > > > > > On Fri, Apr 14, 2023 at 02:03:02PM -0700, Avichal Rakesh wr=
ote:
> > > > > > > >
> > > > > > > >> This problem may be further exaggerated by the DWC3 contro=
ller driver
> > > > > > > >> (which is what my device has) not setting the IMI flag whe=
n
> > > > > > > >> no_interrupt flag is set
> > > > > > > >> (https://urldefense.com/v3/__https://lore.kernel.org/all/c=
ed336c84434571340c07994e3667a0ee284fefe.1666735451.git.Thinh.Nguyen@synopsy=
s.com/)?__;!!A4F2R9G_pg!fB0krUX6qsOXrBsOHzLstVFWqTLL9ncwGFXxlxK0eedLY_29Xdw=
jXRtbO-EWv1eX5okN1rOeBZspZ21KSb5b$
> > > > > > > >> UVC Gadget Driver sets the no_interrupt flag for ~3/4 of i=
ts queued
> > > > > > > >> usb_request, so an ISOC failure may not immediately interr=
upt the UVC
> > > > > > > >> gadget driver, leaving more time for the frame to finish e=
ncoding.
> > > > > > > >>
> > > > > > > >> I couldn't find any concrete error handling rules in the U=
VC specs, so
> > > > > > > >> I am not sure what the proper solution here is. To try out=
, I created
> > > > > > > >> a patch (attached below) that dequeues all queued usb_requ=
ests from
> > > > > > > >> the endpoint in case of an ISOC failure and clears the uvc=
 buffer
> > > > > > > >> queue. This eliminated the partial frames with no perceiva=
ble frame
> > > > > > > >> drops.
> > > > > > > >>
> > > > > > > >> So my questions here are:
> > > > > > > >> 1. Is this a known issue, and if so are there workarounds =
for it?
> > > > > > > >> 2. If the answer to above is "No", does the explanation an=
d mitigation
> > > > > > > >> seem reasonable?
> > > > > > > >>
> > > > > > > >> Patch follows (mostly for illustration, I can formalize it=
 if
> > > > > > > >> needed!). It adds a new 'req_inflight' list to track queue=
d
> > > > > > > >> usb_requests that have not been given back to the gadget d=
river and
> > > > > > > >> drops all the queued requests in case of an ISOC failure. =
The other
> > > > > > > >> changes are for the extra bookkeeping required to handle d=
ropping all
> > > > > > > >> frames. I haven't been able to confirm it, but as far as I=
 can tell
> > > > > > > >> the issue exists at ToT as well.
> > > > > > > >>
> > > > > >
> > > > > > Perhaps this conversation with Jeff may explain the issues you =
observed:
> > > > > > https://urldefense.com/v3/__https://lore.kernel.org/all/2022102=
1164349.fft4yqnxuztsqdeu@synopsys.com/__;!!A4F2R9G_pg!eK3VyAq7vX70vA-WJLA6_=
bPMbZFx0n33wH39JItHzwCNVqKSkN2aG0izF0GZPWqYxkgL-fNinWlIW71HbGGC$
> > > > > >
> > > > > > To summarized the long conversation, the UVC needs to maintain =
a
> > > > > > constant queue of usb requests. Each request is scheduled for a=
 specific
> > > > > > interval. If the UVC couldn't keep up feeding requests to the
> > > > > > controller, then we will have stale requests and missed isoc.
> > > > > >
> > > > > > From the discussion and review, the UVC couldn't queue requests=
 fast
> > > > > > enough. The problem is exacerbated when you reduce the interrup=
t
> > > > > > frequency with no_interrupt setting. The dwc3 driver has some b=
asic
> > > > > > mechanism to detect for underrun by checking if the queue is em=
pty, but
> > > > > > that's not enough to workaround it.
> > > > > >
> > > > > > Your suggestion to dequeue the request would mean the controlle=
r driver
> > > > > > will reschedule the isoc transfer again, which reschedule the n=
ext
> > > > > > request for a new interval (potentially avoid being stale). Tha=
t's fine,
> > > > > > but that may not be a great solution because we're still playin=
g catch
> > > > > > up and the missed isoc already happened.
> > > > > >
> > > > > > You may try to do the followings to mitigate this issue:
> > > > > > 1) Make sure UVC to only queuing rate is constant. Perhaps queu=
e dummy
> > > > > >    requests in between time gaps if need be?
> > > > > >
> > > > > This is extremely helpful, thank you! I have a somewhat basic
> > > > > question: For an isoc request, is its "freshness" determined from=
 the
> > > > > time at which usb_ep_queue is called, or from the time at which t=
he
> > > > > previous request was transferred to the host? If the "freshness" =
is
> > > > > determined from the time 'usb_ep_request' was called, I wonder if=
 the
> > > > > "underrun" is artificial because UVC Gadget driver pumps all free
> > > > > usb_requests at once, and then waits around doing nothing while t=
he
> > > > > usb_requests get stale in the controller's queue. In this case, j=
ust
> > > > > slowing the encode loop to wait a little before queuing more requ=
ests
> > > > > should do effectively what you suggest above?
> > > > >
> > > >
> > > > Here's a simplified version of how it works:
> > > > (Note that I'll be talking/using usb request as if it's TRBs and al=
so
> > > > ignore SG. I will also only focus about the current handling of the
> > > > gadget driver and dwc3 driver.)
> > >
> > > I appreciate you taking the time to explain this. This is very
> > > enlightening, thank you!
> > >
> > > >
> > > > The controller tracks the current uframe. For isoc endpoint, when y=
ou
> > > > call usb_ep_queue(), the controller doesn't consume the request rig=
ht
> > > > away. The request is scheduled for a specific interval. For UVC, an
> > > > interval is a single uframe (125us). As the current uframe keeps
> > > > incrementing, each request on a queue is consumed. If there's no re=
quest
> > > > available for the current uframe, the next queued request is consid=
ered
> > > > stale or expired. This case is considered underrun.
> > > >
> > > > "freshness" means the request is scheduled for a future uframe. "st=
ale"
> > > > means the request is queued for a past uframe. Isoc data is time
> > > > sensitive. So if the data isn't gone out at a specific time, then i=
t's
> > > > dropped.
> > > >
> > > > The problem with many gadget drivers that use isoc endpoint is that=
 they
> > > > only queue more requests when they get notified that the previous s=
et of
> > > > requests are completed. This creates time gaps which can starve the
> > > > controller of more requests.
> > > >
> > > > We have some basic mechanism in dwc3 to reschedule new requests whe=
n
> > > > there's missed isoc and the queue is empty for UVC. However that's =
not
> > > > enough. The time the controller consumes the request and the time t=
he
> > > > driver handles the interrupt is different. The driver may not know =
that
> > > > queue is empty until it's already too late. The gadget driver just =
needs
> > > > to make sure to keep the request queue to at least X amount of requ=
ests.
> > > > Note that 125us is relatively fast.
> > >
> > > I see, and I think I understand Greg's previous comment better as
> > > well: The UVC driver isn't falling behind on the video stream, it is
> > > falling behind the usb controller's monotonic isoc stream.
> > >
> > > From what I can see, this leaves us in an interesting place: UVC
> > > allows the host to configure the camera's output resolution and fps,
> > > which effectively controls how fast the camera is generating data.
> > > This is at odds with the UVC gadget driver, which currently packs eac=
h
> > > video frame into as few usb_requests as possible (using the full
> >
> > Hm... I would spread the data to more requests and not put all the eggs
> > in one basket. It shouldn't be an issue with dwc3 controller, but some
> > hosts aren't the greatest when handling isoc at high transfer rate.
> >
> > > available size in usb_requests). Effectively, the UVC gadget driver
> > > attempts to use the "full" bandwidth of isoc transfers even when the
> > > camera isn't generating data fast enough. For example, in my
> > > observations: 1 video frame is ~22kB. At 30fps, this represents 1/30
> > > of the amount of data the camera would generate in a second. This 22k=
B
> > > is split into 8 usb_requests which is about 1/1000 the number of
> > > requests UVC driver needs to generate per second to prevent isoc
> > > failures (assuming 125us monotonic uframes). Assuming some fudge
> > > factor from the simplifications in your explanation gives the uvc
> > > driver some extra leeway with request queuing, we're still roughly tw=
o
> > > order of magnitudes out of sync. Even with perfect 'complete'
> > > callbacks and video frame encodings, an underrun seems inevitable.
> > > Data is being generated at a far slower rate than it is being
> > > transferred. Does this reasoning seem valid?
> > >
> > > Just as a test I'll try updating the UVC driver to consume 266
> > > usb_requests per video frame (~1/30 of 8000), which should be enough
> > > to keep the usb controller queue occupied for ~1/30s. Ideally, by the
> > > time the controller queue is empty, the camera would have produced a
> >
> > You mean queue 266 requests at once? This may work. There should be a
> > large enough time gap so that the dwc3 driver can properly detect an
> > empty queue to be able to reschedule new requests for the next video
> > frame.
>
> That's a lot of requests to allocate. Can't you just make sure to notify
> the gadget driver more often to requeue requests and don't set
> no_interrupt as often?

Oh yes, I am hoping UVC gadget driver and the usb controller can reach
a steady state of pumping out requests with less than 266 requests
allocated. I will play around and see how many requests it takes to
reach the steady state. I think the encode loop can maintain the isoc
deadlines as long as there are free requests available.

>
> >
> > > new frame. This doesn't solve the issue with latencies around callbac=
k
> > > and an isoc failure might still happen, hopefully the failure
> > > frequency is reduced because UVC queues enough requests per video
> > > frame to not starve the controller's queue while waiting on a new
> > > frame and the only way they go out of sync is from 'complete' callbac=
k
> > > timings. I am assuming this has been tried before, but my LKML search
> > > skills are failing and I can't find much on it.
> > >
> > > >
>
> BR,
> Thinh



--=20
- Avi.
