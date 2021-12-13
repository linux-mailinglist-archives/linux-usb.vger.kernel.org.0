Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21095472F79
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 15:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239508AbhLMOiQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 09:38:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236562AbhLMOiP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Dec 2021 09:38:15 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DBBC061574
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 06:38:14 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so17582568otg.4
        for <linux-usb@vger.kernel.org>; Mon, 13 Dec 2021 06:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=6YCRdp3WDVn522bC0t2ebxRO4H0sMaIeHWNZPzdjGHE=;
        b=IVpkEkyer3czHUeXLW9IFvhK3XMcxAMZzqTnsvI4vNmD8c/59lOAsiD95yCFByRd3g
         k5d7aQwNRuINVPiT8X9kNoezedqOtTdqLSX9ozDtMpKymlRYSZaT6QAeXp9OtNJZssP6
         WWSOoIdGDBN3QCxfq9VxutgE9+UjKHTA6+nk+vfrXv82gaMRiE8AQi5eEd+d5vJy7bRz
         /lkY88qe7TvjpZoCv/xz+x15ggnG0wjehvjZXO0QdgDhq26d66ESLwo5j4AvpBNXp803
         Cd15jPMYHNfHBWzMKpiiOU+R2BFYxxEaV2JlngVSbAFnNjG8Zazw3ElQODQNip+AA9JA
         g6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=6YCRdp3WDVn522bC0t2ebxRO4H0sMaIeHWNZPzdjGHE=;
        b=0mTphh78V0DL/7molWwFjYTPe3Pwn0NMuEdJNM6yzOiNncCI5qW1gTD5Uqaa2tukSI
         bGSG6gPh/ccYNRJShPo+r3u2LRTF0hKnqNiLFFJYSoKEG5VzeM07BW3sm2PXy52/231B
         eiHdFhiby2xEUiuj7Hd6F1rbVBtgJoBmY/n4lCY+bhR6HyyTRBKcT6FL0nITn4+QaRJ5
         dmJNOnN+xOD0dNeniYxCvL+M7MTOIbbTwKQ0EIwbMXvBhBW39ZLLFisg+TbDWh2DQlv5
         hHdenFQI2H3sLQp5eli3vbpk9ufb3NhixIHujQEwaqpxC8izi2AuZveea8IwGIutIK6S
         Naxg==
X-Gm-Message-State: AOAM530dbk1Ysn5/10JY7y6hv/ipYZS1VL6jkLLSX/nnOwys029vn2T7
        NNLT2BhEuaLJLn1q2LGXY9872XrD26NuudlFKJf6w6ld
X-Google-Smtp-Source: ABdhPJy9XRG6Mp0NCYQlco/XNfCU+LdIv17U/ymvLdPTU0IqWNWYV0pN7/xZWNiagTdoxXw0kgxG/hy5GQtPFcOYSg8=
X-Received: by 2002:a05:6830:1f3a:: with SMTP id e26mr25690850oth.233.1639406293985;
 Mon, 13 Dec 2021 06:38:13 -0800 (PST)
MIME-Version: 1.0
References: <20211211183650.12183-1-marcelo.jimenez@gmail.com>
 <d406fd08-39d9-42db-f01c-2eccf5b0be00@norrbonn.se> <CACjc_5pHbLStniQnOVLDW5iLbKn8ovePuQsFFqeEnQPSSYxJoQ@mail.gmail.com>
In-Reply-To: <CACjc_5pHbLStniQnOVLDW5iLbKn8ovePuQsFFqeEnQPSSYxJoQ@mail.gmail.com>
From:   Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Date:   Mon, 13 Dec 2021 11:37:47 -0300
Message-ID: <CACjc_5oDMJYphYMcj8YukTrQLuQmAow9CBMGD=u_21va2d4+eA@mail.gmail.com>
Subject: Fwd: [PATCH] usb: gadget: atmel: Revert regression in USB Gadget (atmel_usba_udc)
To:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Resending to the list, due to gmail html rejection, sorry for that.

---------- Forwarded message ---------
From: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Date: Mon, Dec 13, 2021 at 11:31 AM
Subject: Re: [PATCH] usb: gadget: atmel: Revert regression in USB
Gadget (atmel_usba_udc)
To: Jonas Bonn <jonas@norrbonn.se>
Cc: <regressions@lists.linux.dev>, Nicolas Ferre
<nicolas.ferre@microchip.com>, Alexandre Belloni
<alexandre.belloni@bootlin.com>, Ludovic Desroches
<ludovic.desroches@microchip.com>,
<linux-arm-kernel@lists.infradead.org>, Cristian Birsan
<cristian.birsan@microchip.com>, <linux-usb@vger.kernel.org>, Greg
Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
<balbi@kernel.org>, Sergio Tanzilli <tanzilli@acmesystems.it>


Hi Jonas,

Thank you for the quick response, I really appreciate it.

On Mon, Dec 13, 2021 at 7:02 AM Jonas Bonn <jonas@norrbonn.se> wrote:
>
>
> Given that the patch that you want to revert is almost 3 years old, it's
> a bit of a stretch to call this a regression.  I suspect that a cleaner
> way forward is to introduce some kind of quirk for your board.


Well, the board is basically the MPU, so if there is a hardware
problem it would mean that it is a problem with the on chip
peripheral.

>
> I have a self-powered board where the USB suspend sequence works and
> device add/remove works fine.  So fundamentally, I suspect that the
> driver is ok.


Maybe you have VBUS sensing enabled in your board. As I reported
before, the VBUS sensing is not an option in this board. Nonetheless,
the code in the kernel suggests that VBUS sensing is optional, since
the presence of a VBUS sensing pin is explicitly tested in it.

I have not read the full USB spec, but if this is a fundamentally not
resolvable problem, maybe we could have a configuration option,
runtime or compile time, to enable or disable SUSPEND state, assuming
that there is no problem with the original patch.

In my particular application, it is more important to detect the
disconnection, so that we can reconnect, than to enter SUSPEND.
Whenever USB is not necessary, it will not be connected, so the energy
saved will be very little in my case.

My intention with this patch is also to provide a quick fix for anyone
facing this problem, reverting is not necessarily the best long term
solution, especially if the code is found to be correct. But assuming
the chip USB controller has no design flaws, and assuming it should be
possible to do without VBUS sensing, then the present code should be
missing some detail.

>
> With all that said, I'm not immediately in a position to run tests on my
> SAMA5D2 board right now and the kernel on that board is 5.2.  I'm not
> sure when we we would notice that USB suspend stopped working because
> there is no kernel maintenance planned for that board, as far as I know;
> someday, however, that work might happen and the lack of working USB
> suspend will be a regression in and of itself.


I can test it with the AT91SAM9G25 processor and I can also get a
SAMA5D27 board to test with.

>
> Thanks,
> Jonas


Best regards,
Marcelo.
