Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EB4B6E729B
	for <lists+linux-usb@lfdr.de>; Wed, 19 Apr 2023 07:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbjDSF0Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Apr 2023 01:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbjDSF0Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Apr 2023 01:26:24 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6CE55B85
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 22:26:22 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-32b102ca487so18177495ab.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 22:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681881982; x=1684473982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ct3Na6M/xT5xpruNbmycXumlxBn9w5eid+GwUOWewnk=;
        b=3T54kjcdFkac8pEN4jedjpZXIy1QfnwFLQjWT0ZGVen34STS1jGIJQix5ZSkRNlpjN
         tHmFgE0JBye2JtXSYck+iiP6HgCYsDwG9KJVrYx69e3qfwlZTeaMt5PmcklavbjNn3DR
         MiusSj/P77BNE0YEquRMgo0IdQePoSa+ITA5YgJ4JMZUn8Ngh/5IeFWBYUqoijNYbhI1
         SD129+epW0aDHDArr1l2vi4zENYRiQtMIWQYu3yNeBLhjSY1zsXA+H5PqeY3FnGumF5c
         JkFMd1qivAeUidSFAd81edG1FdTBbUrLGzSXWvILIIUxqkBSVne3iS79nYU6eS5ArmW0
         i7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681881982; x=1684473982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ct3Na6M/xT5xpruNbmycXumlxBn9w5eid+GwUOWewnk=;
        b=J0pEZgV+Ds8Hgi2z/fu2gxWhLwCiLIMCAVPzk2LjvDBLUA3VAaBlU7TQvb1eOX4ApB
         H3fFx3cZMfHXGgWOaihF15uWHJ4ec4RaP85NN/Nw9SoaqWaAzhrkvjgG+NC4+c6aWICs
         PcIie2R4/5mEzBlbFlnM2gognUoGIcbuBOjJMLY/WBwTqbbNElmfPRk8ZgALtC6xVtbK
         dwM3lXTy9QVvykrMsUw1fZL2/a2RG3M1tyfb+5a0fhYVL4LhSGOZ3Esjf5xX3zJgfyKT
         VHWEpqGKO3Zd2OqzxZe8GxJ+jpvVk+NsFTf96+HCuei1a8M9p/qAsznrPfD1K1ZlQDCN
         uYeA==
X-Gm-Message-State: AAQBX9cd+KbE4sBRm0my2DYyRMPn72qTZ3C5dZjlOFxzPmVy8Tkb5SOg
        Cncv9Z3MkVQ5M65Kzhk1b55cxz2UYTSc0EMzFDQFEw==
X-Google-Smtp-Source: AKy350aen6YZYMq7ANSn/mFZWTH5RiZrUh72EcQirnbmHjSmo0mqMG2GyH8rwuyAs2eGZFPVHmV8POzzCCR/zkGoHng=
X-Received: by 2002:a92:cd50:0:b0:32a:e399:b984 with SMTP id
 v16-20020a92cd50000000b0032ae399b984mr10185708ilq.7.1681881982186; Tue, 18
 Apr 2023 22:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com> <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com> <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com> <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
In-Reply-To: <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Tue, 18 Apr 2023 22:26:11 -0700
Message-ID: <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
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

On Tue, Apr 18, 2023 at 6:07=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Apr 18, 2023 at 03:45:53PM -0700, Avichal Rakesh wrote:
> > I see, and I think I understand Greg's previous comment better as
> > well: The UVC driver isn't falling behind on the video stream, it is
> > falling behind the usb controller's monotonic isoc stream.
> >
> > From what I can see, this leaves us in an interesting place: UVC
> > allows the host to configure the camera's output resolution and fps,
> > which effectively controls how fast the camera is generating data.
> > This is at odds with the UVC gadget driver, which currently packs each
> > video frame into as few usb_requests as possible (using the full
> > available size in usb_requests). Effectively, the UVC gadget driver
> > attempts to use the "full" bandwidth of isoc transfers even when the
> > camera isn't generating data fast enough. For example, in my
> > observations: 1 video frame is ~22kB. At 30fps, this represents 1/30
> > of the amount of data the camera would generate in a second. This 22kB
> > is split into 8 usb_requests which is about 1/1000 the number of
> > requests UVC driver needs to generate per second to prevent isoc
> > failures (assuming 125us monotonic uframes). Assuming some fudge
> > factor from the simplifications in your explanation gives the uvc
> > driver some extra leeway with request queuing, we're still roughly two
> > order of magnitudes out of sync. Even with perfect 'complete'
> > callbacks and video frame encodings, an underrun seems inevitable.
> > Data is being generated at a far slower rate than it is being
> > transferred. Does this reasoning seem valid?
> >
> > Just as a test I'll try updating the UVC driver to consume 266
> > usb_requests per video frame (~1/30 of 8000), which should be enough
> > to keep the usb controller queue occupied for ~1/30s. Ideally, by the
> > time the controller queue is empty, the camera would have produced a
> > new frame. This doesn't solve the issue with latencies around callback
> > and an isoc failure might still happen, hopefully the failure
> > frequency is reduced because UVC queues enough requests per video
> > frame to not starve the controller's queue while waiting on a new
> > frame and the only way they go out of sync is from 'complete' callback
> > timings. I am assuming this has been tried before, but my LKML search
> > skills are failing and I can't find much on it.
>
> Note that there's nothing wrong with submitting a 0-length isochronous
> transfer.  If there's no data left but you still need to send
> _something_ in order to fill out the remaining slots in the controller's
> schedule, this is a good way to do it.
>
Oh, this is very good to know, thank you!! We just need to reach a
steady state of UVC queuing enough requests monotonically (even if
they are empty), and the usb controller calling the 'complete'
callback to give it more requests to queue. Although I wonder how the
host's UVC driver would interpret the zero length packets, if it would
even care.

I am unfortunately being pulled into some other work for the next few
days, but I will try out both: splitting one frame into many many
requests and just sending 0 length requests, and see what happens on
the host. Will report back with what I find. Any other insights are
welcome. I want to fix this problem for good if possible, and am happy
to try out whatever it takes!



--=20
- Avi.
