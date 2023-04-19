Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88ADB6E850C
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 00:37:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbjDSWhZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 18:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233405AbjDSWhX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 18:37:23 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E04206A42
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 15:36:49 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-32943f2063cso678115ab.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 15:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681943721; x=1684535721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyvwJe9Fsx2PBZqNFjXl3/bVQ0jkJfwQSwEUuVGvkHU=;
        b=T1u1HuR85wEEzjtfAtEGLBjdrsVw/s6CwwnGz9UYAwlhr6c0zJL2V8cWti3dYd/kLZ
         OiFLIIZy2M9XfLsPxFisypekKEyv11YdvCuwSClKB8SDDfQQe92FuSljTvQ33OjK6Skb
         obLpzmU7cNkH1+bF2o2Y18Poedr6juKEce/kK4CDHDnXE6k/cD+WRPbuUoQxSNH5J3U4
         1WA5vzGciiw23ok6krRFatrBIHSDh7vOdCUi2irbs2BT82ndsOwo1qo20AtS38CLbcXv
         q8zkREn6vCuR7BgwvRwJgcmihxEEYIwsD9zhpKMp/FF2XLKqsHhk0JQc0YdFDNEU9X9l
         78Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943721; x=1684535721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CyvwJe9Fsx2PBZqNFjXl3/bVQ0jkJfwQSwEUuVGvkHU=;
        b=e8KbqcJiL8p/B2Tpvcpd+SpnpB1nZYrCTkbKVfBBV8uGlbMDUz8eaZFJ+Jw9eB+38k
         cO+xNNtxb3sMAd0vPEc9P4f+uQfDUs8qVKzyAGxdFhuEltI77gsoo0CLatVY9zOWep7D
         FWsicc2WU+wkEgXxH8ChzxpOHnoRCNyAgltbx044gyApF+ALIIQhiGA1IgrR1xPwKQ7Q
         a4Jvbjw2O0IWgpDLNi6FJig8s4vxPqXsfZbU7vjqNh1aU/YV3MQS1sKxy7ldIvP2pMLF
         Q3ZW4HnaGA4w45EdPFXTpUGVMww3xXrpqxSeBVV5FxO8Sc35Pw1INjrf1ljIhAMOJ8EH
         lsoQ==
X-Gm-Message-State: AAQBX9dYlrDKNzyvrag+GqwBPNh9c1UkQvU/m5eIOcfQJimH6yhITqAg
        LVUENaCwJvmh0WntnAJ4LncsjDsu+7hR7gAdMvqNmKswSfnBCpLGdx56oA==
X-Google-Smtp-Source: AKy350YWJfWlXswF6U+X6BSvFyW/5HZv6G0Dw6FOrPjbeFgzmQGDpqy7k4V/QRUZhsrsS81jvzW2GagjAHeeHRrkLEo=
X-Received: by 2002:a92:da84:0:b0:32b:1536:f3e9 with SMTP id
 u4-20020a92da84000000b0032b1536f3e9mr1169500iln.18.1681943720688; Wed, 19 Apr
 2023 15:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com> <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com> <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com> <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <20230419001143.pdxflhzyecf4kvee@synopsys.com> <20230419001920.7gughc2sqwwx3a4e@synopsys.com>
 <CAMHf4WL4+onLbav5rWoGZLMxhwtZTu8adfoz_8b5Uh__hdKZHw@mail.gmail.com> <20230419215810.cak2565iqx74s755@synopsys.com>
In-Reply-To: <20230419215810.cak2565iqx74s755@synopsys.com>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Wed, 19 Apr 2023 15:35:09 -0700
Message-ID: <CAMHf4WKx5Z=LL6HmLWRM1FgZVAZdyPHBQirykODyeFW=ySyN_g@mail.gmail.com>
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

On Wed, Apr 19, 2023 at 2:58=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Tue, Apr 18, 2023, Avichal Rakesh wrote:
> > On Tue, Apr 18, 2023 at 5:19=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Wed, Apr 19, 2023, Thinh Nguyen wrote:
> > > > On Tue, Apr 18, 2023, Avichal Rakesh wrote:
> > > > > On Tue, Apr 18, 2023 at 12:40=E2=80=AFPM Thinh Nguyen <Thinh.Nguy=
en@synopsys.com> wrote:
> > > > > >
> > > > > > On Mon, Apr 17, 2023, Avichal Rakesh wrote:
> > > > > > > On Mon, Apr 17, 2023 at 7:49=E2=80=AFPM Thinh Nguyen <Thinh.N=
guyen@synopsys.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, Apr 17, 2023, Avichal Rakesh wrote:
> > > > > > > > >
> > > > > > > > > On 4/17/23 06:49, Greg KH wrote:
> > > > > > > > > > On Fri, Apr 14, 2023 at 02:03:02PM -0700, Avichal Rakes=
h wrote:
> > > > > > > > > >
> > > > > > > > > >> This problem may be further exaggerated by the DWC3 co=
ntroller driver
> > > > > > > > > >> (which is what my device has) not setting the IMI flag=
 when
> > > > > > > > > >> no_interrupt flag is set
> > > > > > > > > >> (https://urldefense.com/v3/__https://lore.kernel.org/a=
ll/ced336c84434571340c07994e3667a0ee284fefe.1666735451.git.Thinh.Nguyen@syn=
opsys.com/)?__;!!A4F2R9G_pg!fB0krUX6qsOXrBsOHzLstVFWqTLL9ncwGFXxlxK0eedLY_2=
9XdwjXRtbO-EWv1eX5okN1rOeBZspZ21KSb5b$
> > > > > > > > > >> UVC Gadget Driver sets the no_interrupt flag for ~3/4 =
of its queued
> > > > > > > > > >> usb_request, so an ISOC failure may not immediately in=
terrupt the UVC
> > > > > > > > > >> gadget driver, leaving more time for the frame to fini=
sh encoding.
> > > > > > > > > >>
> > > > > > > > > >> I couldn't find any concrete error handling rules in t=
he UVC specs, so
> > > > > > > > > >> I am not sure what the proper solution here is. To try=
 out, I created
> > > > > > > > > >> a patch (attached below) that dequeues all queued usb_=
requests from
> > > > > > > > > >> the endpoint in case of an ISOC failure and clears the=
 uvc buffer
> > > > > > > > > >> queue. This eliminated the partial frames with no perc=
eivable frame
> > > > > > > > > >> drops.
> > > > > > > > > >>
> > > > > > > > > >> So my questions here are:
> > > > > > > > > >> 1. Is this a known issue, and if so are there workarou=
nds for it?
> > > > > > > > > >> 2. If the answer to above is "No", does the explanatio=
n and mitigation
> > > > > > > > > >> seem reasonable?
> > > > > > > > > >>
> > > > > > > > > >> Patch follows (mostly for illustration, I can formaliz=
e it if
> > > > > > > > > >> needed!). It adds a new 'req_inflight' list to track q=
ueued
> > > > > > > > > >> usb_requests that have not been given back to the gadg=
et driver and
> > > > > > > > > >> drops all the queued requests in case of an ISOC failu=
re. The other
> > > > > > > > > >> changes are for the extra bookkeeping required to hand=
le dropping all
> > > > > > > > > >> frames. I haven't been able to confirm it, but as far =
as I can tell
> > > > > > > > > >> the issue exists at ToT as well.
> > > > > > > > > >>
> > > > > > > >
> > > > > > > > Perhaps this conversation with Jeff may explain the issues =
you observed:
> > > > > > > > https://urldefense.com/v3/__https://lore.kernel.org/all/202=
21021164349.fft4yqnxuztsqdeu@synopsys.com/__;!!A4F2R9G_pg!eK3VyAq7vX70vA-WJ=
LA6_bPMbZFx0n33wH39JItHzwCNVqKSkN2aG0izF0GZPWqYxkgL-fNinWlIW71HbGGC$
> > > > > > > >
> > > > > > > > To summarized the long conversation, the UVC needs to maint=
ain a
> > > > > > > > constant queue of usb requests. Each request is scheduled f=
or a specific
> > > > > > > > interval. If the UVC couldn't keep up feeding requests to t=
he
> > > > > > > > controller, then we will have stale requests and missed iso=
c.
> > > > > > > >
> > > > > > > > From the discussion and review, the UVC couldn't queue requ=
ests fast
> > > > > > > > enough. The problem is exacerbated when you reduce the inte=
rrupt
> > > > > > > > frequency with no_interrupt setting. The dwc3 driver has so=
me basic
> > > > > > > > mechanism to detect for underrun by checking if the queue i=
s empty, but
> > > > > > > > that's not enough to workaround it.
> > > > > > > >
> > > > > > > > Your suggestion to dequeue the request would mean the contr=
oller driver
> > > > > > > > will reschedule the isoc transfer again, which reschedule t=
he next
> > > > > > > > request for a new interval (potentially avoid being stale).=
 That's fine,
> > > > > > > > but that may not be a great solution because we're still pl=
aying catch
> > > > > > > > up and the missed isoc already happened.
> > > > > > > >
> > > > > > > > You may try to do the followings to mitigate this issue:
> > > > > > > > 1) Make sure UVC to only queuing rate is constant. Perhaps =
queue dummy
> > > > > > > >    requests in between time gaps if need be?
> > > > > > > >
> > > > > > > This is extremely helpful, thank you! I have a somewhat basic
> > > > > > > question: For an isoc request, is its "freshness" determined =
from the
> > > > > > > time at which usb_ep_queue is called, or from the time at whi=
ch the
> > > > > > > previous request was transferred to the host? If the "freshne=
ss" is
> > > > > > > determined from the time 'usb_ep_request' was called, I wonde=
r if the
> > > > > > > "underrun" is artificial because UVC Gadget driver pumps all =
free
> > > > > > > usb_requests at once, and then waits around doing nothing whi=
le the
> > > > > > > usb_requests get stale in the controller's queue. In this cas=
e, just
> > > > > > > slowing the encode loop to wait a little before queuing more =
requests
> > > > > > > should do effectively what you suggest above?
> > > > > > >
> > > > > >
> > > > > > Here's a simplified version of how it works:
> > > > > > (Note that I'll be talking/using usb request as if it's TRBs an=
d also
> > > > > > ignore SG. I will also only focus about the current handling of=
 the
> > > > > > gadget driver and dwc3 driver.)
> > > > >
> > > > > I appreciate you taking the time to explain this. This is very
> > > > > enlightening, thank you!
> > > > >
> > > > > >
> > > > > > The controller tracks the current uframe. For isoc endpoint, wh=
en you
> > > > > > call usb_ep_queue(), the controller doesn't consume the request=
 right
> > > > > > away. The request is scheduled for a specific interval. For UVC=
, an
> > > > > > interval is a single uframe (125us). As the current uframe keep=
s
> > > > > > incrementing, each request on a queue is consumed. If there's n=
o request
> > > > > > available for the current uframe, the next queued request is co=
nsidered
> > > > > > stale or expired. This case is considered underrun.
> > > > > >
> > > > > > "freshness" means the request is scheduled for a future uframe.=
 "stale"
> > > > > > means the request is queued for a past uframe. Isoc data is tim=
e
> > > > > > sensitive. So if the data isn't gone out at a specific time, th=
en it's
> > > > > > dropped.
> > > > > >
> > > > > > The problem with many gadget drivers that use isoc endpoint is =
that they
> > > > > > only queue more requests when they get notified that the previo=
us set of
> > > > > > requests are completed. This creates time gaps which can starve=
 the
> > > > > > controller of more requests.
> > > > > >
> > > > > > We have some basic mechanism in dwc3 to reschedule new requests=
 when
> > > > > > there's missed isoc and the queue is empty for UVC. However tha=
t's not
> > > > > > enough. The time the controller consumes the request and the ti=
me the
> > > > > > driver handles the interrupt is different. The driver may not k=
now that
> > > > > > queue is empty until it's already too late. The gadget driver j=
ust needs
> > > > > > to make sure to keep the request queue to at least X amount of =
requests.
> > > > > > Note that 125us is relatively fast.
> > > > >
> > > > > I see, and I think I understand Greg's previous comment better as
> > > > > well: The UVC driver isn't falling behind on the video stream, it=
 is
> > > > > falling behind the usb controller's monotonic isoc stream.
> > > > >
> > > > > From what I can see, this leaves us in an interesting place: UVC
> > > > > allows the host to configure the camera's output resolution and f=
ps,
> > > > > which effectively controls how fast the camera is generating data=
.
> > > > > This is at odds with the UVC gadget driver, which currently packs=
 each
> > > > > video frame into as few usb_requests as possible (using the full
> > > >
> > > > Hm... I would spread the data to more requests and not put all the =
eggs
> > > > in one basket. It shouldn't be an issue with dwc3 controller, but s=
ome
> > > > hosts aren't the greatest when handling isoc at high transfer rate.
> > > >
> > > > > available size in usb_requests). Effectively, the UVC gadget driv=
er
> > > > > attempts to use the "full" bandwidth of isoc transfers even when =
the
> > > > > camera isn't generating data fast enough. For example, in my
> > > > > observations: 1 video frame is ~22kB. At 30fps, this represents 1=
/30
> > > > > of the amount of data the camera would generate in a second. This=
 22kB
> > > > > is split into 8 usb_requests which is about 1/1000 the number of
> > > > > requests UVC driver needs to generate per second to prevent isoc
> > > > > failures (assuming 125us monotonic uframes). Assuming some fudge
> > > > > factor from the simplifications in your explanation gives the uvc
> > > > > driver some extra leeway with request queuing, we're still roughl=
y two
> > > > > order of magnitudes out of sync. Even with perfect 'complete'
> > > > > callbacks and video frame encodings, an underrun seems inevitable=
.
> > > > > Data is being generated at a far slower rate than it is being
> > > > > transferred. Does this reasoning seem valid?
> > > > >
> > > > > Just as a test I'll try updating the UVC driver to consume 266
> > > > > usb_requests per video frame (~1/30 of 8000), which should be eno=
ugh
> > > > > to keep the usb controller queue occupied for ~1/30s. Ideally, by=
 the
> > > > > time the controller queue is empty, the camera would have produce=
d a
> > > >
> > > > You mean queue 266 requests at once? This may work. There should be=
 a
> > > > large enough time gap so that the dwc3 driver can properly detect a=
n
> > > > empty queue to be able to reschedule new requests for the next vide=
o
> > > > frame.
> > >
> > > That's a lot of requests to allocate. Can't you just make sure to not=
ify
> > > the gadget driver more often to requeue requests and don't set
> > > no_interrupt as often?
> >
> > Oh yes, I am hoping UVC gadget driver and the usb controller can reach
> > a steady state of pumping out requests with less than 266 requests
> > allocated. I will play around and see how many requests it takes to
> > reach the steady state. I think the encode loop can maintain the isoc
> > deadlines as long as there are free requests available.
> >
>
> You need to measure the worst latency of your setup interrupt handling
> and how long it takes to prepare and queue the requests. We know that
> each request should complete and interrupt after 125us. Taking into
> account of all the latency, you can see how many requests you must
> maintain in the queue at all time. E.g., if you maintain at least 8
> requests in a queue, you have roughly 8*125us of leeway to queue the
> next request.
>
Right, that makes sense! I also wonder if queueing in larger batches
would trigger the rescheduling logic you mentioned more often. If we
only queue in batches of 8 requests, and wait for all of them to come
back, the request queue might be empty for long enough for dwc3 to
realize that the next request should be rescheduled. Adding it to my
'to-test' list

- Avi.
