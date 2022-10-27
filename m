Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF1E60F3EA
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 11:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234633AbiJ0Jo0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 05:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234541AbiJ0JoY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 05:44:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F5580E89
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 02:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666863862;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aM4QuF976N05lEsuNDx0BNaVkblZ/olKIyI4M2g0MzU=;
        b=AE47fJ47UCVux9Ybrf0WHOPyCE6Uy5271S5h9KpxXtFzRpqoRPxMP4rsRLg6W+5fPGXip5
        MbkyJR/IvToFhjppZQsKEBLGf3aQ8+ftYOGAHQFD6KeT6HLmjIUwAfSDpOqmGcwDZeLx/3
        jM35PZEnWlBRcjAO+ygtbgD7jszrehE=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-0dJ8Z5BeP5uwOV_GNeR4Ng-1; Thu, 27 Oct 2022 05:44:21 -0400
X-MC-Unique: 0dJ8Z5BeP5uwOV_GNeR4Ng-1
Received: by mail-lj1-f200.google.com with SMTP id q5-20020a2e84c5000000b0025ec9ff93c8so460869ljh.15
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 02:44:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aM4QuF976N05lEsuNDx0BNaVkblZ/olKIyI4M2g0MzU=;
        b=LTLZeD+ACSspWVJmG3tuK60uxo4dGSpw9lxMCAKcXzmezQuWbOWhm4H+Yq3+RtKzUH
         fDWuzPpWBq+KLjKtvPlafvRLH0l0WFhOrWvKeEebQfixe37prsdy2Yjm/Ag3d1mg3tEt
         8sz4Oa+258MbnGyEeJaF0zuTHcGU2JTGqSy8/rL2ecyrl4x4KKPhDeOvVq++8Alkiv2O
         OaFYRtJ5gJhmitVAYeAVQCpJSSItK2am5HeirkZGWfPKnv1myzlbAPm40v7iHCUP4uGz
         NyfRmjM/5udpjHOrVLNbqdcSbH8HM6WPez3OmeAybVs+SRVK4xuMPPMOQKv191wv/RJq
         Gk/w==
X-Gm-Message-State: ACrzQf2oAVu/fy34TeZDEcMOyrB4aq8z+KEBOovMeFsxjkolDZWa4kxt
        73rE/noV8JfaG5cPJwHwNQRF8hq6owm0en+ll20Z57w1K62zyMbBgbmmuKaRZfcYQqMRl4chMao
        cbp+khLvkZ8SnApgcTl69QXqRqfE+aZOwbuSB
X-Received: by 2002:ac2:46c9:0:b0:4a4:47cc:fc9d with SMTP id p9-20020ac246c9000000b004a447ccfc9dmr18965742lfo.1.1666863859547;
        Thu, 27 Oct 2022 02:44:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ia9VD0BXXQnfaTo7gLq0/x0CdVTJa8k7krh6J3MXXWNynz6DezEzWrmNTCuGVp8Xf5fEbJUGPvrIndfXOYR0=
X-Received: by 2002:ac2:46c9:0:b0:4a4:47cc:fc9d with SMTP id
 p9-20020ac246c9000000b004a447ccfc9dmr18965738lfo.1.1666863859276; Thu, 27 Oct
 2022 02:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
 <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com> <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
In-Reply-To: <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 27 Oct 2022 10:45:13 +0100
Message-ID: <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     Andreas Bergmeier <abergmeier@gmx.net>
Cc:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 26, 2022 at 9:50 PM Andreas Bergmeier <abergmeier@gmx.net> wrote:
>
> On Tue, 25 Oct 2022 at 09:46, Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> > Depending on how the device presents itself, we might have to use
> > hid-logitech-hidpp, not hid-lg FWIW.
> Ah, indeed it seems to be a hidpp device.

\o/

> I so far wrote code to interact with the device using hidraw and
> hiddev. What are the implications of a hidpp device?

It's just Logitech's common HID protocol. The advantage is that if
Logitech reuses the feature on a different hardware, we won't have to
implement anything new in the kernel.

> How is hidpp exposed to userspace?

It's not exposed to userspace. It's all kernel internal, or used by
userspace applications like solaar[0] through hidraw

> From a search it seems like there are very few userspace programs that
> handle hidpp on Linux.

IIRC you have solaar, and fwupd.

>
> > And to answer the question "how to map the device to input
> > "primitives".", it all depends on how the device exports itself.
> All information that I have gathered so far is on
> https://github.com/abergmeier/litra_glow_linux.

great thanks.

>
> The output of `hidpp-list-features /dev/hidraw0` is:
> ```
> Logi Litra Glow (046d:c900) is a HID++ 4.2 device
> Feature 0x01: [0x0001] Feature set
> Feature 0x02: [0x0003] Device FW version
> Feature 0x03: [0x0005] Device name
> Feature 0x04: [0x1990] ?
> Feature 0x05: [0x1eb0] ? (hidden)
> Feature 0x06: [0x00c2] DFUcontrol 3 (hidden)
> ```
> Is it possible that Feature 0x04 is the protocol for sending changes
> to the device?

AFAICT, given the dumps on your github project, this is very much the case:
Events and commands are starting with "11 ff 04" meaning:
- 11: report id (HID++ protocol)
- ff: device index (0xff in case of a USB connected device, but could
be different when used over a wireless receiver.)
- 04: feature index 04, which is defined as 0x1990 in the internal
Logitech specification.

> All the payload that is sent to the device has a 0x04 directly in
> front of the instructions.
> As an example, for turning the light on you send raw bytes: [0x11,
> 0xff, 0x04, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
> 0x10 seems to indicate setting the on state.

You seem to be correct :)
This 4rth byte is the command index. 0x00 is sent by the device on
events, and then the command is supposed to be the command index
(0x10, 0x20, 0x30, etc...) with the program index. So to not confuse
other userspace programs, you should use something like 0x11 or 0x12
(0x01 is used by the kernel FWIW)

>
> > > To recap there are 5 hardware buttons and 3 states:
> > > - State: "Color temperature in range [u, x]" Button: up
> > > - State: "Color temperature in range [u, x]" Button: down
> > > - State/Button On/Off
> > > - State "Brightness in range [y, z]" Button: up
> > > - State "Brightness in range [y, z]" Button: down
> >
> > FWIW, you should be able to use hid-recorder[0] (as root) to record
> > traces of the events, and to parse them on the fly. Also, if you
> > provide us the output, we can replay the traces locally as if we
> > virtually plugged in the device.
>
> See the GitHub repo - there are already initial recordings.
>
> > FWIW, if the first byte you have to send to control the LED is 0x10,
> > 0x11 or 0x12 then this is a HID++ device that needs to go in
> > hid-logitech-hidpp and a lot of groundwork is already done in the
> > kernel for it.
> I am trying to get up to speed with hidpp - but I am not there yet.
> Do you have any hints on what code to read specifically since
> logitech-hidpp is a bit long...

You have some public documentation at [1].

But from where you are now, you should probably be able to implement
the basic on/off feature by looking at the function 0x1000 in the
hid-logitech-hidpp code:
- you need define a few macros for your functionality (the class, the
commands, the events)
- you need to add a hook in connect_event to register the led class
device that will hook on to the actual LED of the device
- you need to also add a hook in hidpp_raw_hidpp_event for when a
button is emitted by the device.

Then you can either directly control the LED from the kernel, or let
userspace deal with it (and probably have some form of hybrid solution
where the kernel directly controls the LED, but also notifies user
space through regular buttons, but you can allow control of the LED
through the LED class).

Note that the kernel doesn't do a full enumeration of the device
features, so you need to register the device as a new class, in the
supported device ids.

>
> Thanks for the feedback so far
>

No worries.

Cheers,
Benjamin

[0] https://pwr-solaar.github.io/Solaar
[1] https://github.com/pwr-Solaar/Solaar/blob/master/docs/hidpp-documentation.txt

