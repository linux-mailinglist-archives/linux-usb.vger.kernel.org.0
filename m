Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD426FBB86
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 01:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbjEHXtY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 May 2023 19:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjEHXtX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 May 2023 19:49:23 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8DD972B7
        for <linux-usb@vger.kernel.org>; Mon,  8 May 2023 16:49:21 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50db7f0a1b4so311199a12.3
        for <linux-usb@vger.kernel.org>; Mon, 08 May 2023 16:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683589760; x=1686181760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WCjRWad0x/rOwokq+XFzj9N91Oo+YXYDlAZvly+I00=;
        b=sgux41zKecHf1RQyPAiwoN1U+GVzOaONK6Mz9nA9sDCPHqPNaO3Mp3D8oXEHalJeqJ
         syQFws2fdSWZWe6mD4/z+5mbBcOKzDKzEkj+YkFSkUJIfkCZ/qp1V0mQNA3suBjc0R3r
         hEvlPcxp1XrxMcFqM0LCukQnPEP4GR/03RXTwJ00nfzyNzFnKqEqg6AEhYtVm9oUyHfO
         1MVFr6Heg+XnH4WEFFvvOWMBHjhbklMFt5fXDSaL1giGMzRmi4a/nexM6Uf/QSQS/Pzi
         1VSi/a+N1YwweLmVRqoON7XWmeKVPawRZARuML6+HHK/kbw3nUmRIFgzhLGUtbd9j6J7
         vMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683589760; x=1686181760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WCjRWad0x/rOwokq+XFzj9N91Oo+YXYDlAZvly+I00=;
        b=itKMFbE84Mcn4eDdCnXvGi5/7eHgXQViq/IzLwxvghT3sdAlx+rEPNeMyfT9IsohuK
         5UeixESimiXDr9MkLneYNFV4BMpdinTb4g1tjGPjB5MJeIPreSHm5YVOlBSYDXVIM5so
         rgkg/It8mOMLH/38DU66FN6em1yk6lk1ZTLtN87XZTRhADNmOC8skssL9pfU4HHAcOEo
         ifd/HUoK/YhbyeIFaRYw1I4L08xpryigYMWSGce7AN1g8ttNx+daLvHmeX2+614eeQx7
         7OzMxVMTVjDc79Rw2lmeOtRJf3SkR040RhspXsWg1QpMNtM4NfMFOoT+O2iyoCvqdHtb
         ycuw==
X-Gm-Message-State: AC+VfDym5oSEPtFPrEfiw0yGFycMFolfS7IAgSNBLuJYcafJkIUGD1wv
        RfCoabbPwK0L3A1Z+Vs4QB0BXQ3LWZaMYsru6ttcOg==
X-Google-Smtp-Source: ACHHUZ6srTcRW/ur389z38BaUQX39fNejMNWfSTITpuSSMYRgWHDsba8qBzwkNnsrJ/rWXOxw+MbC824p7d+vFOUxjI=
X-Received: by 2002:a17:906:9755:b0:94a:a0d7:b7bc with SMTP id
 o21-20020a170906975500b0094aa0d7b7bcmr11643496ejy.10.1683589760116; Mon, 08
 May 2023 16:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <ZD1ObUuy8deAvupf@kroah.com> <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com> <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com> <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com> <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
 <20230506125317.GD17474@pendragon.ideasonboard.com>
In-Reply-To: <20230506125317.GD17474@pendragon.ideasonboard.com>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Mon, 8 May 2023 16:49:08 -0700
Message-ID: <CAMHf4WLMAjigKypYho24TqeuWx6Y9-LWjq2cj_5ad31pqsKDzg@mail.gmail.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 6, 2023 at 5:53=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> > The first thing I tried was to split one video frame over 266 frames, w=
ithout
> > changing the number of requests allocated. And it works! However, as La=
urent
> > mentioned, it does add a fair amount of bookkeeping to split a video fr=
ame into
> > the required number of requests. I also hardcoded the number 266 from o=
ur
> > discussion, but I am not sure how to figure out that number dynamically=
. 266
> > also didn't work if the host started sending frames at more than 30fps =
:/, so
> > our dynamic calculation would need to take camera's real output fps int=
o
> > account, which as far as I can tell is not known to the UVC driver.
>
> It would probably need to monitor how full the request queue is, and
> adapt the number of bytes it queues in each request accordingly. That's
> indeed quite a bit of work, for little gain compared to the option you
> describe below.
>
Agreed, especially if the hosts already handle 0 length packets.
As long as the usb controllers can keep up, the burst approach seems
more reasonable.

> > With those issues I tried what Laurent called the "burst" approach
> > (attached below), i.e. send the video frames in as few packets as possi=
ble,
> > and then queue up 0 length packets to keep the ISOC queue happy. This a=
pproach
> > works perfectly as far as I can tell. Locally I tried with a Linux, Win=
dow,
> > and MacOS host with no frame drops or ISOC failures on any of them!
> >
> > In the current patch, UVC gadget driver keeps the ISOC cadence by effec=
tively
> > maintaining a back-pressure on the USB controller (at least to the best=
 of its
> > capabilities). Any usb_request available to the UVC gadget gets immedia=
tely
> > queued back to the USB controller. If a video frame is available, the f=
rame is
> > encoded, if not, the length is set to 0. The idea being that the host's=
 polling
> > and the controller's 'complete' callback will result in a somewhat cons=
istent
> > cadence for the uvc driver after the initial burst of packets.
> >
> > However this does mean that at worst, the new video frames are up to 63
> > usb_requests behind, but assuming a 125us per usb_request, that amounts=
 to ~8ms
> > latency at the worst, which seems acceptable?
>
> There's a trade off between latency and the risk of underruns. We could
> decrease the number of queued requests to lower the latency, as long as
> we ensure the margin is high enough to avoid underruns in higher load
> conditions. We could also do so only when queuing 0-size requests, and
> queue the data in burst mode with a higher number of requests.

Would 8ms of latency be considered significant? Unless the host asks
for >125fps,
that amounts to less than a frame of latency, so frames should not be dropp=
ed
by the host for being "late". Admittedly, I don't know enough about UVC usa=
ge to
say if 8ms (at worst) will be problematic for certain usages. The
hosts don't seem to
have any issues when streaming at <=3D60fps.

> > Another concern I had was about how the back-pressure might affect othe=
r USB
> > controllers. DWC3 doesn't seem to be sweating and in local testing I sa=
w no
> > EXDEVs or frame drops other than when the stream was being transitioned=
 from
> > one configuration to another, but I don't know how this interaction mig=
ht go for
> > other USB controllers. Would you have any insights into non-DWC3 contro=
llers,
> > and if they might be negatively affected by having up to 64 requests qu=
eued at
> > once?
>
> Dan, do I recall correctly you have tested uvc-gadget with dwc2 too ?
> Could you test the patch below ? Testing with musb would be nice too.
>
> > Here's the patch, it doesn't currently handle bulk transfers, but I can=
 upload a
> > formal patch with it if this approach seems acceptable!
> >
> > ---
> >  drivers/usb/gadget/function/uvc_video.c | 24 ++++++++++++++++--------
> >  1 file changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadg=
et/function/uvc_video.c
> > index dd1c6b2ca7c6..d7ad278709d4 100644
> > --- a/drivers/usb/gadget/function/uvc_video.c
> > +++ b/drivers/usb/gadget/function/uvc_video.c
> > @@ -386,6 +386,7 @@ static void uvcg_video_pump(struct work_struct *wor=
k)
> >       struct uvc_buffer *buf;
> >       unsigned long flags;
> >       int ret;
> > +     bool buf_int;
> >
> >       while (video->ep->enabled) {
> >               /*
> > @@ -408,20 +409,29 @@ static void uvcg_video_pump(struct work_struct *w=
ork)
> >                */
> >               spin_lock_irqsave(&queue->irqlock, flags);
> >               buf =3D uvcg_queue_head(queue);
> > -             if (buf =3D=3D NULL) {
> > +
> > +             if (buf !=3D NULL) {
> > +                     // Encode video frame if we have one.
>
> C-style comments please.
>
Addressed this comment and uploaded a formal patch:
https://lore.kernel.org/20230508231103.1621375-1-arakesh@google.com/
It is basically this patch with an extra flag to ensure that we don't
spam a bulk endpoint with 0-length requests.

I wrote a script to detect abrupt size changes in uvc frames on the
host. In my two hours of testing with the above patch, I've recorded
only one "short" frame.
```
[616677.453290] usb 1-6: frame 1 stats: 0/31/31 packets, 0/0/0 pts
(!early !initial), 30/31 scr, last pts/stc/sof 0/4055830784/1298
[617701.585256] usb 1-6: frame 30594 stats: 0/1/1 packets, 0/0/0 pts
(!early !initial), 0/1 scr, last pts/stc/sof 0/1677462368/2636
[617701.621240] usb 1-6: frame 30596 stats: 0/32/32 packets, 0/0/0 pts
(!early !initial), 31/32 scr, last pts/stc/sof 0/1679244656/2933
```
First log is when streaming starts (abrupt change from 0 to 31).
Frame 30594 had only 1 packet for some reason  (I couldn't capture
gadget logs at the time :/), but the stream recovered after one
skipped frame.

Will leave the script running overnight, and report back if there's
anything significant there.

- Avi.
