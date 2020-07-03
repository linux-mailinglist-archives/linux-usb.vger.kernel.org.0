Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCB6C2133F9
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 08:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgGCGQK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 02:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgGCGQK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 02:16:10 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12EB0C08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 23:16:10 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id c25so8324964otf.7
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 23:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5oJGVsNDOmgeEp8ItsLjhcVVDamnaAyg5U7tumkU5kM=;
        b=sCwTDhzUbqNGBRJNcDMFVI6vZ6mCapv/AiDCwc8bWEtzDDeLkXrImBvN8iDHk09scQ
         DAMrF6waj+6vTSRnzHxjr0ZHXZPlggXpgZs1TOsMQ+OWKdGISalDTH+r/vTQdy2gkAZq
         BFgyaFrmR6FDvPttJrrNPTG22yHTBlOeSrjViDRgQAEHmScr6vWxMqmZkSVlHdEaVAiy
         /YWWHh+LCpxvDJxFAujCKzqNoviWtcA7g52SyFkZTooaBK4KMs+0D43DubmE8ZzpG1Tn
         VXK3OjjZx86c7yCD2nTyQgivSLx5tiFHrf/z5wzm8Zn+QtsUCbEyeh5j72OZqnQ0pacK
         O0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5oJGVsNDOmgeEp8ItsLjhcVVDamnaAyg5U7tumkU5kM=;
        b=fvGfuoHvXYtaqfLR426o7wO+sOO0F8b2oHbpFBxrSsnTwFFYyyRknwXf6UUApw1sZ8
         whI8/yFR/EkeZobrVAcC89q0G1017hmqbdekVxoLdfMrILWgNV2GxvWZbkzpAQ1JIL58
         SSkvDno/f+FGCuiauGXWIlmT29lUYsRllv8wMc3GArkOYHEu76Y6s6wwivL7WUcObh4a
         Fz1LOJTp6A0RkdZ4utkHy6z72JMJmbj1SZCKOZ3+2Cwdihib/coejlzclT3Cw1N/6hv8
         G6OmIWlTtEFoH/XKN0gR7yhu/axNanK0fkefJLlmyOjouCWXvKKptmjcK2/+PyFVIi5l
         EoZg==
X-Gm-Message-State: AOAM532rapZohvSNE0CcwRoKFnj8GWgLFuxjQ848rLzibHa3v1V25bRI
        JsoZxOba+gTmVEydTxheCADhrX9Ml+MB2O+ILEFr/w==
X-Google-Smtp-Source: ABdhPJywFh47c+iGpTThEIT8FLdys0uBMlkKBP3RTr9CDbxTYYZ82LOHhq8eMokcMepkbwwcWBXZEGds++YR2c4l568=
X-Received: by 2002:a05:6830:1e13:: with SMTP id s19mr31260230otr.102.1593756969412;
 Thu, 02 Jul 2020 23:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com>
In-Reply-To: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 2 Jul 2020 23:15:58 -0700
Message-ID: <CALAqxLXjByaYaNweqGiSyArJ=1J-D7bSm+sndCtH_wf7h2avTA@mail.gmail.com>
Subject: Re: dwc3 inconsistent gadget connection state?
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Yang Fei <fei.yang@intel.com>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Jun Li <lijun.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 2, 2020 at 2:44 PM John Stultz <john.stultz@linaro.org> wrote:
>
>   I've been tripping over an issue on my HiKey960 where with the usb-c
> gadget cable connected, the gadget code doesn't consistently seem to
> initialize properly. I had rarely seen this behavior previously, but
> more recently it has become more frequent and annoying.
>
> Usually, unplugging and replugging the USB-C cable would get things
> working again (but that's not helpful in test labs).
>
> I annotated a bunch of code trying to understand what was going on and
> I narrowed down the difference in the good and bad case to a dwc3
> reset interrupts happening after usb_gadget_probe_driver() completes.
> In the good case, we see the reset interrupts, and in the failed case
> we don't.

So I've kept digging around on this, and started dumping registers at
the end of dwc3_gadget_start() and then dwc3_gadget_pullup() as that
still is called shortly after in both cases.

The one consistent difference between the working and not working case
I saw was the DWC3_DSTS_COREIDLE bit in the DWC3_DSTS register.

It seems when we get to gadget_start()/pullup() if the DSTS_COREIDLE
bit isn't on we won't get the reset irq.

I added a simple timeout loop to pullup() similar to the
DSTS_DEVCTRLHLT loop, but in the failure mode it always times out with
COREIDLE not being set.

Searching around hasn't provided any info on what COREIDLE actually
means, so I'm a bit in the dark.  Any clues?

thanks
-john
