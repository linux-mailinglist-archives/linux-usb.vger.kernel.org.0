Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2FA62C8EE0
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 21:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729241AbgK3UQd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 15:16:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbgK3UQd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 15:16:33 -0500
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C865C0613CF
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 12:15:53 -0800 (PST)
Received: by mail-vk1-xa44.google.com with SMTP id j142so560226vkj.9
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 12:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=xTlvo57rVzwa2AORM191P0+ooDQG4FgWiJIBpMbnw0o=;
        b=hdzkRzEElWs7LSNv/JQ30ChmE+gutI+X4wf91LCn+VGRnCvT8g3mnLLSGimicqVten
         Blm2CyIzmOzqXBVTA4fiJ5V8aW3fhutGhS+PM9LquUM9UYXGThs/WPYwtJpmCmYSawdB
         W3bPjyWc3T1Al+4bSatIKFTKT5DXY/aCaEFhRD7XmC4tIwcpsYOcfuI6ZnQ9hFJkcMCD
         D7eHOe+drFHcMUhI3FE06kK/qpvd3QJcNWyt0cezgZjlSFgtbkmVaQusRQavjD4g8i8c
         uRBJPspc46/BEvz1Q4HF3LeB1UH+KB7np/nGWXRovkZl2Y7djLnfR7zEMcDMNJ3Bnu+O
         L8qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=xTlvo57rVzwa2AORM191P0+ooDQG4FgWiJIBpMbnw0o=;
        b=AuOJFjF6KVbbtuB7iKOWj1D1/TTN8YIeQogq8monbgVUE9jevupgapSCPKSI/aFFWm
         GzFnb598S+e29sSjEtV+1adXJEbvWOwrwk6ZMuBBix5X9xnsRLwwmId+xAPh0E52AQ4Y
         zmtZxJ2UjmX6VMr8aknukAm0iVEJhRC7MeWDXkTKIkirEOC/Qy63TKs1vYhhJYbfzY4A
         C0Rn0pN5IytlSnxHZJvitLptzc5RcessRFxcc0RDgaql81TSEnX/qVjhmqtpUO+VpMQK
         KlE1nzTlvR4THga9enj2DBoPapfwlDmk1viEmwugIB9+BUHG7Zt8DzXrDjnYd308OvDc
         7u2w==
X-Gm-Message-State: AOAM531dozMSYCCAR4Zws/j4YF4RUBhu+06ldvMvPz1pcxEzVLSK8nAU
        KXHgAch5WoUEosh2E3XYysLdcOQbFmfX68SCITE=
X-Google-Smtp-Source: ABdhPJw6cxcqoGHC5Sa0cv4ynWQMe6ZkZxR4SHCoJ6WRbpO60spYxaKqcJe8HoDMAUm1m4s0ly0NvgturjCsOcbnBMc=
X-Received: by 2002:a1f:9d04:: with SMTP id g4mr17838308vke.10.1606767352441;
 Mon, 30 Nov 2020 12:15:52 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:6ecb:0:0:0:0:0 with HTTP; Mon, 30 Nov 2020 12:15:51
 -0800 (PST)
In-Reply-To: <X8UMJ9a051tT1rbz@localhost>
References: <20200916015621.EFCDA374023F@freecalypso.org> <20200929101330.GQ24441@localhost>
 <CA+uuBqY83q+UiRsYxBckXvbtYf4sRxqB_8eXXPgEKAOqTwD=vg@mail.gmail.com>
 <20201005105722.GN5141@localhost> <CA+uuBqZ6JhCq1ydU-9A+en3QO=9zX9LuEJ8+P0YvEzUE+9sYoA@mail.gmail.com>
 <X8UMJ9a051tT1rbz@localhost>
From:   Mychaela Falconia <mychaela.falconia@gmail.com>
Date:   Mon, 30 Nov 2020 12:15:51 -0800
Message-ID: <CA+uuBqaUqkVQ0JCS-_OMT3tApxswHDFCpXjrPFzftn2VEGAjVg@mail.gmail.com>
Subject: Re: [PATCH 0/3] a family of FTDI-based devices that need ftdi_sio quirks
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

Thank you for finally taking the time to address the issue at hand.
Your generalized solution and your reimplementation of my DUART28C
quirk using your new tty port flag would indeed solve my immediate
problem of getting mainline Linux support for FreeCalypso DUART28C, so
I would be perfectly happy if your new patch series gets mainlined.

> I don't think we need to change the B0 handling. It will never be set
> unless explicitly requested by the user.

I originally thought that DTR & RTS assertion upon change from B0 to
Bxxx had to be suppressed because I thought that the initial termios
state of a completely cold ttyUSB port (created upon USB device plug-in
but never opened) had B0 in it - but now I see that this cold initial
state is B9600 rather than B0, so indeed you are right in that B0 can
only be set by users and thus can be ignored for purposes of
legacy-gunk-free custom hw like mine.

> I'm adding a new tty port flag that can be used to suppress the
> assertion of DTR/RTS to signal DTE readiness on open named NORDY.
> Eventually we can expose it through termios to match HUPCL that controls
> the behaviour on final close. For now I'm only adding a sysfs interface
> but that also allows control over these signals on first open.

I don't see how exposing this new flag via termios would be of any use
(it's a chicken and egg problem: one needs to open the tty device in
order to do termios ioctls on it, and if that initial open triggers
DTR/RTS hardware actions, then the end user is still screwed), but
making this flag accessible for setting and clearing via sysfs is a
good idea.

For hardware engineers like me who design and build their own boards
with the USB-serial chip fully embedded and who have their own custom
USB IDs, applying a driver quirk tied to that custom USB ID is still
the best solution in terms of ultimate friendliness to the lowly end
user of the finished hardware.  But for users who don't have the
luxury of a custom USB ID, i.e., users of a non-DTR-RTS-glitch-tolerant
RS-232 device connected to a standard PC COM port or via a generic
off-the-shelf USB to serial DE9M cable, being able to set the needed
quirk via sysfs can be a life saver.

> Your FTDI quirk now only needs to set this flag on probe to override the
> default behaviour. The end result with respect to your device should be
> the same except for B0, which is still handled as before.

LGTM,
Mychaela
