Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A80246E84F3
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 00:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbjDSW3g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 18:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233750AbjDSW3O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 18:29:14 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16BD2C175
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 15:27:54 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3296292e623so1911495ab.2
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 15:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681943204; x=1684535204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydUticq/xEHupBT/c1dLodeEZF53tT4z6+HSr21oriM=;
        b=IKQnFZZliHq/4zb3hjHQLGgJpA/8cOxkor/QpXM0+FfUYkft6jlUze6cdG/VxG/AkV
         vZONXv/r8z0/Fc1hgv0jUSu5VKM5cPcOZlqbvR/aPm6mgbcHKgcog1XzRdCxXNJRsxTu
         xmuIedAtP/Eam3/60WCFMyhCKPj/IOp6ZwgH9YiLfenraAS8gtyQoUquYTei8pcbbZ3B
         1kgjYehNivm796e+bkfSmr6g/FGAycKW3KL5r6coU8CQRUK/+bkG22bOVqQ16qbbb1VE
         fX3Yc70IPVk6ah7eaxoqCKTARqOs10AHy+ibOv4sW8BcqN5uBjDUFC8lcgjC64oo+TE5
         nh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943204; x=1684535204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydUticq/xEHupBT/c1dLodeEZF53tT4z6+HSr21oriM=;
        b=UKEGOMt/VP/HHQ+e+PBvYCMKbm5FAxvCrcZAWrcW2ZV25kwn3FtVNI6ogEg5yS8xfX
         y2dpg/XT6wWbp+4Rw1R1RBR3AjG8AWNcXP8mt5F1U8i0TD/rXgTSsL93P9g9D5/9eEIP
         MtkRZTgUVUov7sasgV+Vjdq8r6x/G4TjxzEIAIG/X9DDEGyfQ39gyy6RNpAqIWCPSg2c
         VUxZWJl5Tz1vsVVF20bSmyMOtJTVKL2DZTIipOlh/zuo/TSy+gXrwg9S4yzfCMIOXitx
         0DdS38d9GhkAfq8/ft9xuUefxpvb+LBy5y/ZaLqixEVzqT7obm3yvPra1iwUmaK/EWRl
         a6rg==
X-Gm-Message-State: AAQBX9dlpnrc00S7MO84bxZ8ywJhQl95vb8fSkXYWh5Z0dTd+asUni8J
        EjYjFja9hFWy46Mo858bVBTn0oLmJmVm7bzo9FAr2g==
X-Google-Smtp-Source: AKy350ZilBlRZKaIWiw8l8rqj1m+T01zQeDzYQx5LSadAhTpAwMnL7YIffFEnKb8rp1i5inkHsdI4hZ4EkNRgbkPDSU=
X-Received: by 2002:a92:c749:0:b0:328:95cc:e296 with SMTP id
 y9-20020a92c749000000b0032895cce296mr1243833ilp.2.1681943204498; Wed, 19 Apr
 2023 15:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com> <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com> <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com> <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com> <20230419214931.ckjgowyqyzqs2x4j@synopsys.com>
In-Reply-To: <20230419214931.ckjgowyqyzqs2x4j@synopsys.com>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Wed, 19 Apr 2023 15:26:33 -0700
Message-ID: <CAMHf4WJOPGdcL9-rZcSgUgXSkzrqMqa1H8CdpsM=EH8rqNMuUQ@mail.gmail.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg KH <gregkh@linuxfoundation.org>,
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
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 19, 2023 at 2:49=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Tue, Apr 18, 2023, Avichal Rakesh wrote:
> > On Tue, Apr 18, 2023 at 6:07=E2=80=AFPM Alan Stern <stern@rowland.harva=
rd.edu> wrote:
> > >
> > > On Tue, Apr 18, 2023 at 03:45:53PM -0700, Avichal Rakesh wrote:
> > > > I see, and I think I understand Greg's previous comment better as
> > > > well: The UVC driver isn't falling behind on the video stream, it i=
s
> > > > falling behind the usb controller's monotonic isoc stream.
> > > >
> > > > From what I can see, this leaves us in an interesting place: UVC
> > > > allows the host to configure the camera's output resolution and fps=
,
> > > > which effectively controls how fast the camera is generating data.
> > > > This is at odds with the UVC gadget driver, which currently packs e=
ach
> > > > video frame into as few usb_requests as possible (using the full
> > > > available size in usb_requests). Effectively, the UVC gadget driver
> > > > attempts to use the "full" bandwidth of isoc transfers even when th=
e
> > > > camera isn't generating data fast enough. For example, in my
> > > > observations: 1 video frame is ~22kB. At 30fps, this represents 1/3=
0
> > > > of the amount of data the camera would generate in a second. This 2=
2kB
> > > > is split into 8 usb_requests which is about 1/1000 the number of
> > > > requests UVC driver needs to generate per second to prevent isoc
> > > > failures (assuming 125us monotonic uframes). Assuming some fudge
> > > > factor from the simplifications in your explanation gives the uvc
> > > > driver some extra leeway with request queuing, we're still roughly =
two
> > > > order of magnitudes out of sync. Even with perfect 'complete'
> > > > callbacks and video frame encodings, an underrun seems inevitable.
> > > > Data is being generated at a far slower rate than it is being
> > > > transferred. Does this reasoning seem valid?
> > > >
> > > > Just as a test I'll try updating the UVC driver to consume 266
> > > > usb_requests per video frame (~1/30 of 8000), which should be enoug=
h
> > > > to keep the usb controller queue occupied for ~1/30s. Ideally, by t=
he
> > > > time the controller queue is empty, the camera would have produced =
a
> > > > new frame. This doesn't solve the issue with latencies around callb=
ack
> > > > and an isoc failure might still happen, hopefully the failure
> > > > frequency is reduced because UVC queues enough requests per video
> > > > frame to not starve the controller's queue while waiting on a new
> > > > frame and the only way they go out of sync is from 'complete' callb=
ack
> > > > timings. I am assuming this has been tried before, but my LKML sear=
ch
> > > > skills are failing and I can't find much on it.
> > >
> > > Note that there's nothing wrong with submitting a 0-length isochronou=
s
> > > transfer.  If there's no data left but you still need to send
> > > _something_ in order to fill out the remaining slots in the controlle=
r's
> > > schedule, this is a good way to do it.
> > >
> > Oh, this is very good to know, thank you!! We just need to reach a
> > steady state of UVC queuing enough requests monotonically (even if
> > they are empty), and the usb controller calling the 'complete'
> > callback to give it more requests to queue. Although I wonder how the
> > host's UVC driver would interpret the zero length packets, if it would
> > even care.
>
> By the usb spec, for IN direction, if there's no data available and the
> host requests for data, then the device will send a zero-length data
> packet. This is what the dwc3 controller will do. So regardless whether
> you prepare and queue a 0-length request or not, the host will receive
> it.
>
If this is the case: the usb controller sends a 0 length packet to the
host when uvc gadget driver doesn't queue anything, what stops the
controller from assuming that the usb_request queued by a gadget
driver is always for the next available uframe, and not for one in the
past? This is effectively the "always reschedule" suggestion you made
before but as a default instead of specific to uvc. Are there cases
where we would want to tell the gadget driver that it fell behind?
Apologies if I am missing something fundamental here, it feels like I
am :(.
> >
> > I am unfortunately being pulled into some other work for the next few
> > days, but I will try out both: splitting one frame into many many
> > requests and just sending 0 length requests, and see what happens on
> > the host. Will report back with what I find. Any other insights are
> > welcome. I want to fix this problem for good if possible, and am happy
> > to try out whatever it takes!
>
> That would be great. Thanks.

- Avi.
