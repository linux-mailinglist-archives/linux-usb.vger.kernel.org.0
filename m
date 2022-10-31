Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D220E6132BE
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 10:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbiJaJat (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 05:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbiJaJas (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 05:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C29DEA2
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 02:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667208589;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=adeZcV5bQeJf8TMnWSAubv09JFdbgKL00xsMhzGx5CA=;
        b=cpqQ0CkgstDllONVD88aBqZae7kFkR3DoyMZ1fdoTHC74lWzbj7TcNSIeM8iafQogOqW38
        ZAZ6awpWxvUV/6g74GmOw4WWKyzwCsTbGfJJnD/LMzi396Yzljv3Ydf+KqsOwfq3IlSuOc
        VZNQ8wbv1nPZNU/I6wBSOb+L7U6ViJ0=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-3J4cRuEcM1GHcrUVb3NkyQ-1; Mon, 31 Oct 2022 05:29:48 -0400
X-MC-Unique: 3J4cRuEcM1GHcrUVb3NkyQ-1
Received: by mail-lj1-f200.google.com with SMTP id e15-20020a2e8ecf000000b00277113737fdso4554323ljl.17
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 02:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adeZcV5bQeJf8TMnWSAubv09JFdbgKL00xsMhzGx5CA=;
        b=g9IFCjZLjis0Uaw4sWWRbzRJVhpUoFaC1QTf9jovxWLqoVs8oMO/boAO0bzViAoMFI
         7AgUz/wU1TTfpMdMP2aMAeM1Lc9SKXQSJc9iUWFFcdz4DlXkdsui74Pw88m/Ke9bHH6K
         2tqXT5eVm2XceJx9QfOAURObadKlpiL2q5tEzsLZxcYDu5Tln9pC3tcKYBgezXZ2anuC
         etpndBJb7a8x4quTfu+5NqoDO1LzBR+HmcPi3lG6XlVq4S10smXa02irSENEGDFqNb9r
         4JXepkhGajLSrpvM4TCsGHw+7bRwOBo6+aJnmYtW6FXGWr+SWaIZIo3BZTYunlcLU/E3
         4mDQ==
X-Gm-Message-State: ACrzQf3T62Ao7Ip9ecxg9DKUAE6Qr12oLd7fWGkfQx5kzyQ2SpvMk6JW
        xrrKF+EbV5HyW4OkLKt+kz2RI+nQahCXWF/52stjde8xABjvNNrmJPT/jqfKRyYBlj9NjjmagUc
        YIKdse64rCdpzCyvHWFuLT6bvgx6zcjDl57JO
X-Received: by 2002:ac2:46c9:0:b0:4a4:47cc:fc9d with SMTP id p9-20020ac246c9000000b004a447ccfc9dmr5364379lfo.1.1667208586396;
        Mon, 31 Oct 2022 02:29:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6S0p/s8TdsNI4JUs/aUhh7RgPIdGjlxlTxHMA/QDu4+HNl+tNfInExD2i4LaG5JOJvWlDmj0hM+LqlqpzrbB8=
X-Received: by 2002:ac2:46c9:0:b0:4a4:47cc:fc9d with SMTP id
 p9-20020ac246c9000000b004a447ccfc9dmr5364376lfo.1.1667208586135; Mon, 31 Oct
 2022 02:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
 <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com>
 <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
 <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com> <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com>
In-Reply-To: <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 31 Oct 2022 09:30:47 +0000
Message-ID: <CAO-hwJJGAWkhZgGeLBruqCoskY5PBP-STs4kh-P6fBvpuSgpUw@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     Andreas Bergmeier <abergmeier@gmx.net>
Cc:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>, linux-leds@vger.kernel.org,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[adding linux-leds in Cc]

On Sat, Oct 29, 2022 at 9:21 AM Andreas Bergmeier <abergmeier@gmx.net> wrote:
>
> Sorry, another set of questions - seems like I am a bit dense.
>
> On Thu, 27 Oct 2022 at 11:44, Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> > It's just Logitech's common HID protocol. The advantage is that if
> > Logitech reuses the feature on a different hardware, we won't have to
> > implement anything new in the kernel.
> Started implementing some illumination code but will take a while
> until I figure out the driver I think.
>
> > But from where you are now, you should probably be able to implement
> > the basic on/off feature by looking at the function 0x1000 in the
> > hid-logitech-hidpp code:
> > - you need define a few macros for your functionality (the class, the
> > commands, the events)
> So my approach would be to identify the GLOW device and then at some
> later point create the
> illumination state and from there only handle common illumination.

For identifying the GLOW device you should be adding an id in the
table of hid-logitech-hidpp, with a driver data that tells the driver
to look for 0x1990.

>
> > - you need to add a hook in connect_event to register the led class
> > device that will hook on to the actual LED of the device
> I did read all the LED specs/headers that I could find and from what I
> have seen all you can currently do with this interface is control
> brightness. There seems to be no way of controlling the Color
> temperature, though.

Leds can be multicolor. See drivers/hid/hid-playstation.c for an example.

So I think you should be able to give a color to the LED that can be
controlled as a separate channel, different from the brightness. The
LEDs folks will know better.

> So either this then would have to be exposed as a special device or
> get handled entirely in userspace.
> The latter seems to work against "implementing illumination handling
> once in driver and reusing it".

I would rather have it handled as a standard LED class, a colored LED
one. There might be a special structure for colored LEDs, and if not
you should probably be able to use a multi-color led with just one
color channel.

>
> > [0] https://pwr-solaar.github.io/Solaar
> > [1] https://github.com/pwr-Solaar/Solaar/blob/master/docs/hidpp-documentation.txt
> Thanks. Never would have found the specs on my own.
> That said - I read x1990 spec and tried to access getIllumination from
> userspace.

Oh, good point, Nestor added that spec back in May :)
Thanks, Nestor!

> The spec seems a bit vague for my limited experience level.
> For example I have not yet figured out what the communication (bytes)
> difference between _getIllumination()_ and _illuminationChangedEvent_
> is.
> What seems to work is accessing events:
>
> So I tried:
> ```c
>
> #define LONG_REPORT_ID 0x11
>
>     struct hiddev_usage_ref_multi multi;
>     memset(&multi, 0, sizeof(multi));
>     multi.uref.report_type = HID_REPORT_TYPE_INPUT;
>     multi.uref.report_id = LONG_REPORT_ID;
>     multi.uref.field_index = 0x0;
>     multi.uref.usage_index = 0x03;
>     multi.uref.usage_code = 0xff430002;
>     multi.num_values = 1;
>
>     if (ioctl(fd, HIDIOCGUSAGES, &multi) < 0)
>     {
>         perror("HIDIOCGUSAGES getIllumination");
>         return -11;
>     }
>
>     printf("VALUE: %0x\n", multi.values[0]);
>
> ```
> Which seems to report the illumination state until I press another
> hardware button. So this seems to access the last event, which seems
> to be _illuminationChangedEvent_ in my case.
> No idea currently how to get _getIllumination_ to work.

IIRC, HIDIOCGUSAGES doesn't do anything with the device, you are
querying the kernel of its current state. Which explains why you are
not getting the current state, but the previous known state.

What you need to do, is actually emit a command to the device
(completely untested, of course):
---
#define APPLICATION_ID 0x06 // can be anything between 0x01  and 0xF,
0x1 being the ID from the kernel

#define HIDPP_1990_GET_ILLUMINATION 0x00
#define HIDPP_1990_SET_ILLUMINATION 0x10
#define ....

unsigned char cmd = HIDPP_1990_GET_ILLUMINATION | APPLICATION_ID;
unsigned char buf[20] = {0x11, 0xff, 0x04}; // HIDPP ID, DEVICE INDEX,
FEATURE INDEX in the feature table

buf[3] = cmd;
write(fd, buf, sizeof(buf));
memset(buf, sizeof(buf), 0);
while (buf[3] != cmd)
  read(fd, buf, sizeof(buf));

printf("VALUE: %0x\n", buf[4]);
---

It is important to set an application id so you can differentiate your
requests from the events (the application ID from an event is always
0).

With that in mind, you should now be able to understand why you had to
send {0x11, 0xff, 0x04, 0x10, 0x01} to set the illumination. And
again, for being sure you can get the feedback you should use 0x16 as
the fourth byte here, so you can detect your answer.

I hope it makes more sense now.

Cheers,
Benjamin

