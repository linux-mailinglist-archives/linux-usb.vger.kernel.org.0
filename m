Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7716E85B8
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 01:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbjDSXMp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 19:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbjDSXMn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 19:12:43 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2EE4E7
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 16:12:40 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7637c5ed865so43786539f.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Apr 2023 16:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681945960; x=1684537960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fVDYF3NDgDycd4FsVye4XR1cjSjCyj6lMGuP06K8z4=;
        b=FpNZ7ghNLWGc8AMWWpNNDr2OYe8ACdynezoBga1fg0TxRjukXGlPd9uci4Pz3PNzlG
         Z9+B6RqqOWswULABtxDdHiP6P2PuDFKXfr4d6/I7/Pjyxb1QB68wGwlRWymERZr4nb1m
         lp5a1evWAr0grcebklxkTYSV7TAbxIliC3WSxBO9XlC7LxUlDSc82X2qxNqJBp3s2TNU
         GdudjIAtISmCVzAvFXnFSkgQm9oAPl1UUcYIkwGrcTsu4ZunaBaD6ig4DUBE/NnxINe7
         3DjqrQhyqPW7sKCtNWzYMxiDljYPnxcs8kPDxKn0mEWNFqLEhiydA55t1kCJmPg+G0Bv
         YvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681945960; x=1684537960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fVDYF3NDgDycd4FsVye4XR1cjSjCyj6lMGuP06K8z4=;
        b=USYApmsXyvFIwTRuQHpbKBz7SMw13styjBGaEn+8mUrHBmHMkHT7KSh+a3U15AHnnC
         Ard6b6cOzk6o89pDLRKWB9PBWx2NvkFVvTMsxdf29UB3OEfYFuOqtyE2n5freGUCVM9q
         gHDVcQovMxyJd7wotMikwzj5ccc7+LdYOfTGgNSc13PYxFEQmxdyWKkzcudwpDHSq3RC
         KL4HfpLGODfj89ZgqsI5CVfmvJH7585Vkhciu3VTxBwE4hQqQykZ9FTbbPGsW/axuiz+
         krh1M1v1IGMeljrJSY+vKzr5UZegKTDOdxkyVYyWE57GFQy+KQPe+Qw/C470P03IcByE
         TzNg==
X-Gm-Message-State: AAQBX9dT7ZknI5HDjGouY3DlyST8teSVD6OIjT9pmu7ts3d28KTqslJD
        vfIFsVYuJWdXhFAE7KbdfdBecJamm26+FGCqHBp6Rw==
X-Google-Smtp-Source: AKy350ZaXoYEIwBJm9kBloGCODgX8v+e4CQrruXNXSpsvw2l+EVzBDXf4/4Z6igJ8BYuz3vSrTVe7SiIqYOTeRaFHaM=
X-Received: by 2002:a5e:8809:0:b0:760:eca3:e70 with SMTP id
 l9-20020a5e8809000000b00760eca30e70mr1317872ioj.6.1681945960155; Wed, 19 Apr
 2023 16:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <ZD1ObUuy8deAvupf@kroah.com> <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com> <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com> <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230419214931.ckjgowyqyzqs2x4j@synopsys.com> <CAMHf4WJOPGdcL9-rZcSgUgXSkzrqMqa1H8CdpsM=EH8rqNMuUQ@mail.gmail.com>
 <20230419223835.drmyqjhwx6cc4htg@synopsys.com>
In-Reply-To: <20230419223835.drmyqjhwx6cc4htg@synopsys.com>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Wed, 19 Apr 2023 16:12:29 -0700
Message-ID: <CAMHf4WKO3kA=rT7m_AqyGBhs3PhSf2F0Ha-rQ=bQgEL2PJnTBA@mail.gmail.com>
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

On Wed, Apr 19, 2023 at 3:38=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Wed, Apr 19, 2023, Avichal Rakesh wrote:
> > On Wed, Apr 19, 2023 at 2:49=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@syno=
psys.com> wrote:
> > >
> > > On Tue, Apr 18, 2023, Avichal Rakesh wrote:
> > > > On Tue, Apr 18, 2023 at 6:07=E2=80=AFPM Alan Stern <stern@rowland.h=
arvard.edu> wrote:
> > > > >
> > > > > On Tue, Apr 18, 2023 at 03:45:53PM -0700, Avichal Rakesh wrote:
> > > > > > I see, and I think I understand Greg's previous comment better =
as
> > > > > > well: The UVC driver isn't falling behind on the video stream, =
it is
> > > > > > falling behind the usb controller's monotonic isoc stream.
> > > > > >
> > > > > > From what I can see, this leaves us in an interesting place: UV=
C
> > > > > > allows the host to configure the camera's output resolution and=
 fps,
> > > > > > which effectively controls how fast the camera is generating da=
ta.
> > > > > > This is at odds with the UVC gadget driver, which currently pac=
ks each
> > > > > > video frame into as few usb_requests as possible (using the ful=
l
> > > > > > available size in usb_requests). Effectively, the UVC gadget dr=
iver
> > > > > > attempts to use the "full" bandwidth of isoc transfers even whe=
n the
> > > > > > camera isn't generating data fast enough. For example, in my
> > > > > > observations: 1 video frame is ~22kB. At 30fps, this represents=
 1/30
> > > > > > of the amount of data the camera would generate in a second. Th=
is 22kB
> > > > > > is split into 8 usb_requests which is about 1/1000 the number o=
f
> > > > > > requests UVC driver needs to generate per second to prevent iso=
c
> > > > > > failures (assuming 125us monotonic uframes). Assuming some fudg=
e
> > > > > > factor from the simplifications in your explanation gives the u=
vc
> > > > > > driver some extra leeway with request queuing, we're still roug=
hly two
> > > > > > order of magnitudes out of sync. Even with perfect 'complete'
> > > > > > callbacks and video frame encodings, an underrun seems inevitab=
le.
> > > > > > Data is being generated at a far slower rate than it is being
> > > > > > transferred. Does this reasoning seem valid?
> > > > > >
> > > > > > Just as a test I'll try updating the UVC driver to consume 266
> > > > > > usb_requests per video frame (~1/30 of 8000), which should be e=
nough
> > > > > > to keep the usb controller queue occupied for ~1/30s. Ideally, =
by the
> > > > > > time the controller queue is empty, the camera would have produ=
ced a
> > > > > > new frame. This doesn't solve the issue with latencies around c=
allback
> > > > > > and an isoc failure might still happen, hopefully the failure
> > > > > > frequency is reduced because UVC queues enough requests per vid=
eo
> > > > > > frame to not starve the controller's queue while waiting on a n=
ew
> > > > > > frame and the only way they go out of sync is from 'complete' c=
allback
> > > > > > timings. I am assuming this has been tried before, but my LKML =
search
> > > > > > skills are failing and I can't find much on it.
> > > > >
> > > > > Note that there's nothing wrong with submitting a 0-length isochr=
onous
> > > > > transfer.  If there's no data left but you still need to send
> > > > > _something_ in order to fill out the remaining slots in the contr=
oller's
> > > > > schedule, this is a good way to do it.
> > > > >
> > > > Oh, this is very good to know, thank you!! We just need to reach a
> > > > steady state of UVC queuing enough requests monotonically (even if
> > > > they are empty), and the usb controller calling the 'complete'
> > > > callback to give it more requests to queue. Although I wonder how t=
he
> > > > host's UVC driver would interpret the zero length packets, if it wo=
uld
> > > > even care.
> > >
> > > By the usb spec, for IN direction, if there's no data available and t=
he
> > > host requests for data, then the device will send a zero-length data
> > > packet. This is what the dwc3 controller will do. So regardless wheth=
er
> > > you prepare and queue a 0-length request or not, the host will receiv=
e
> > > it.
> > >
> > If this is the case: the usb controller sends a 0 length packet to the
> > host when uvc gadget driver doesn't queue anything, what stops the
> > controller from assuming that the usb_request queued by a gadget
> > driver is always for the next available uframe, and not for one in the
> > past? This is effectively the "always reschedule" suggestion you made
> > before but as a default instead of specific to uvc. Are there cases
> > where we would want to tell the gadget driver that it fell behind?
> > Apologies if I am missing something fundamental here, it feels like I
> > am :(.
>
> No, the controller doesn't assume that. It won't queue for the future
> uframe if it's stale. The UVC gadget driver will need to keep feeding
> requests until it catches up to the current uframe. Remember that the
> isoc data is time sensitive, if it's not gone out at a specific uframe,
> then it's dropped.
>
> The controller driver can end the current isoc stream and reschedule new
> requests for the future uframe so that they won't be considered "stale".
>
Oh I see, the hardware/controller doesn't make that assumption, and to
mimic that behavior the driver will have to detect empty queues and
reschedule requests which runs into its own timing issues with the
callbacks. I think I understand!

- Avi.
