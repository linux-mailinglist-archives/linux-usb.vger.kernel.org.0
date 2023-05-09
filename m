Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAE556FCDD5
	for <lists+linux-usb@lfdr.de>; Tue,  9 May 2023 20:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbjEISdW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 May 2023 14:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbjEISdV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 May 2023 14:33:21 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 117B21725
        for <linux-usb@vger.kernel.org>; Tue,  9 May 2023 11:33:20 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-965e93f915aso962638066b.2
        for <linux-usb@vger.kernel.org>; Tue, 09 May 2023 11:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683657198; x=1686249198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8K6D5uF3iovWX+GVuD5v2phhz5BCzB6JnBRvx8Nnqk0=;
        b=cVkx2Sor8vmg1LvG5eMw+N3HZLcpOkvIvrizbQQBboBCSgVfsNGvJNe+kqFXQuD3n9
         4otOBQye6YzpRW0G2CtwzLVLlQVxZbIa64rQ0QDSzt5tFRF7gCxA1q4C6CVfbhaIi4+E
         sEY7YEK6BM39WiQbWnOOPnwYFQh/LnbLEUJJBGGC+bxPAzkwh89Yl4otqWAVzWKt08TD
         f5CFCoP3BoU73UERmIF7dYaymOVSvn0+uFoIn8naiCMUoav1ZFWGiaz4tvxxNYsKfmDy
         TUCG1+qPeJ5pNrpD6qq1ya+d/Ry1/l8XQ4rLMLHlYiJ5YMsyB4NUUPZxsLdtpaGpBHCp
         4gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683657198; x=1686249198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8K6D5uF3iovWX+GVuD5v2phhz5BCzB6JnBRvx8Nnqk0=;
        b=IPezUJnkpEW6iSMcbRVtNB42hwI1gaasin6Gzp0ox8jwza1XG59rupdAX3T1+YPnKm
         eU5qK1rsbUYeghBF/BMed7nRXyVvKf/K0nao751GJvn2yxUS5d8F7RdgcMeGYq9SojPo
         epHAcOH3ocyD8iZDUlERGSF9rlAdGYN69tUewwIcW4/TsryBeTz3umvHpAoWVzFQEK7f
         1XLXVLzbWgx9WyTxbTEF4wzVddn9BtwxEtB2IDp0X5n2JCgZNTjy3g4ZXKtVxRIOlg5P
         f2HcNMbxWmN1ceWiyoDkqcYBrpoc/9Fal3ZUe5LO/XUde3HL9Sq0V1W9CKcbqSjV/HZR
         LOjg==
X-Gm-Message-State: AC+VfDwQ6sNf4hdZcb1+TgORg4tXH5oJjBoDb8AqArEHvBIrSWGuNLLf
        KbahW198CWCoApflosd30O323OD6bMXUgtYqSHpqkQ==
X-Google-Smtp-Source: ACHHUZ65P8JvZz+zsoCjZOSNPcYN9LUzy08zjnN7OkuP1qCDdTCpa+jA3tT4fiV9tjSshqTpbo1igDYdLjNkneSMzmA=
X-Received: by 2002:a17:907:6e04:b0:96a:3d:9854 with SMTP id
 sd4-20020a1709076e0400b0096a003d9854mr2039229ejc.2.1683657198426; Tue, 09 May
 2023 11:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230418024937.h6mipfdvdqomtz36@synopsys.com> <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com> <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com> <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
 <20230506125317.GD17474@pendragon.ideasonboard.com> <CAMHf4WLMAjigKypYho24TqeuWx6Y9-LWjq2cj_5ad31pqsKDzg@mail.gmail.com>
 <20230509002143.7x5zo6bohvn5dyb2@synopsys.com>
In-Reply-To: <20230509002143.7x5zo6bohvn5dyb2@synopsys.com>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Tue, 9 May 2023 11:33:06 -0700
Message-ID: <CAMHf4WLzx3Bj-TR1ZrqsW1tfY+WUtgTt8TVObOFnkNcx2Pc9kw@mail.gmail.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
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

On Mon, May 8, 2023 at 5:21=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Mon, May 08, 2023, Avichal Rakesh wrote:
> > On Sat, May 6, 2023 at 5:53=E2=80=AFAM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >
> > > > The first thing I tried was to split one video frame over 266 frame=
s, without
> > > > changing the number of requests allocated. And it works! However, a=
s Laurent
> > > > mentioned, it does add a fair amount of bookkeeping to split a vide=
o frame into
> > > > the required number of requests. I also hardcoded the number 266 fr=
om our
> > > > discussion, but I am not sure how to figure out that number dynamic=
ally. 266
> > > > also didn't work if the host started sending frames at more than 30=
fps :/, so
> > > > our dynamic calculation would need to take camera's real output fps=
 into
> > > > account, which as far as I can tell is not known to the UVC driver.
> > >
> > > It would probably need to monitor how full the request queue is, and
> > > adapt the number of bytes it queues in each request accordingly. That=
's
> > > indeed quite a bit of work, for little gain compared to the option yo=
u
> > > describe below.
> > >
> > Agreed, especially if the hosts already handle 0 length packets.
> > As long as the usb controllers can keep up, the burst approach seems
> > more reasonable.
> >
> > > > With those issues I tried what Laurent called the "burst" approach
> > > > (attached below), i.e. send the video frames in as few packets as p=
ossible,
> > > > and then queue up 0 length packets to keep the ISOC queue happy. Th=
is approach
> > > > works perfectly as far as I can tell. Locally I tried with a Linux,=
 Window,
> > > > and MacOS host with no frame drops or ISOC failures on any of them!
> > > >
> > > > In the current patch, UVC gadget driver keeps the ISOC cadence by e=
ffectively
> > > > maintaining a back-pressure on the USB controller (at least to the =
best of its
> > > > capabilities). Any usb_request available to the UVC gadget gets imm=
ediately
> > > > queued back to the USB controller. If a video frame is available, t=
he frame is
> > > > encoded, if not, the length is set to 0. The idea being that the ho=
st's polling
> > > > and the controller's 'complete' callback will result in a somewhat =
consistent
> > > > cadence for the uvc driver after the initial burst of packets.
> > > >
> > > > However this does mean that at worst, the new video frames are up t=
o 63
> > > > usb_requests behind, but assuming a 125us per usb_request, that amo=
unts to ~8ms
> > > > latency at the worst, which seems acceptable?
> > >
> > > There's a trade off between latency and the risk of underruns. We cou=
ld
> > > decrease the number of queued requests to lower the latency, as long =
as
> > > we ensure the margin is high enough to avoid underruns in higher load
> > > conditions. We could also do so only when queuing 0-size requests, an=
d
> > > queue the data in burst mode with a higher number of requests.
> >
> > Would 8ms of latency be considered significant? Unless the host asks
> > for >125fps,
> > that amounts to less than a frame of latency, so frames should not be d=
ropped
> > by the host for being "late". Admittedly, I don't know enough about UVC=
 usage to
> > say if 8ms (at worst) will be problematic for certain usages. The
> > hosts don't seem to
> > have any issues when streaming at <=3D60fps.
> >
>
> Do you only queue a single burst at a time? We don't have to queue all
> 63 0-length requests as a single "burst" right? We can queue multiple
> smaller bursts of 0-length requests. This way, the UVC driver can be
> interrupted more often, reducing the video data latency if it arrives
> earlier. This keeps the total number of queued requests smaller while
> ensuring that the controller isn't starved of requests (as long as this
> smaller burst accounts for the system latency). The tradeoff here is
> just the UVC gadget driver needs to handle request completion a little
> more often. However, we are less likely to be underrun no matter the
> video's fps.

The patch does currently queue all 64 0-length packets from the start,
and then relies on completion callbacks to maintain a steady state. It
still sets the `no_interrupt` flag, so the completion callback
interrupts every ~16th request (at worst) which is the same as before.
Ideally, the UVC driver never sits on a video frame for longer than 16
requests, but it does keep the controller queue as full as it can,
which means the video frame could be stuck behind a bunch of 0-length
packets and could hypothetically be sent faster if we were to be
smarter with queuing the 0-length requests. I say hypothetically,
because I have been unable to capture any latency differences with and
without the patch.

I've been trying to think of some way to account for system latency
and only queue a smaller set of 0 length packets, but most of them
boil down to "hope we have enough requests queued". It would be
helpful if we could pin some numbers down that can be relied on by the
gadget driver. For example: Can 125us per request be safely assumed;
or is there a way to get information about how long a usb_request will
last for? It would be very helpful if there was a way to query the
controller's active queue, but I couldn't really find anything in the
APIs. We can't really rely on the complete callbacks because of the
"no_interrupt" flag. I'll try out some things, and get back. If you
have any ideas, I would love to hear them too!

Thank you!
Avi.
