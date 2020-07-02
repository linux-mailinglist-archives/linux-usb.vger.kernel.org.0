Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA3F1212EFE
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 23:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgGBVos (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 17:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgGBVor (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 17:44:47 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C01FC08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 14:44:47 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id 18so25242371otv.6
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 14:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nCIcwwzcNmOiChMR7VCvrwnKak/viYEkjvBy8u4+DMQ=;
        b=OqCMbL8CsKZSFofKQdJYc7rkFtUwhkdSssqAf/uut1p8p+QHLZM+SW5NerXbmhrkeJ
         0Ol9A0N2QrjZxwiTmNyIqLBeiC7oHEVX8RDyF0Wag9MvE76nMKSMbyNZCQvgDuNDVTZp
         g7fn4/q2tYqxZtyBKSGbL6TbktJpKxEe8Y5X4Uv5j1Enhx9+EEQmtJYYkQaOLVQ7R7Af
         P2M+HADKNQI2fNaUY50xlZEijGHKLIquLVYHwbaYd9NuEDt+6MMAwjuMF7m59oHzeZHR
         G4iA2YU5fR+ms4Q9/8nPwgQg0um1zUImiVDXVNZEuJ6fdpTWwJsq4Tbv/CCCexMhCX44
         Urvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nCIcwwzcNmOiChMR7VCvrwnKak/viYEkjvBy8u4+DMQ=;
        b=iZGAXtpj7OeI8CcDE4a9Dna/elXn0PQeSQM2dDoUQGoW16ROmI1Xh1Rru0oQ1kNgQO
         g9gPAzRGDXepDJywplk+mqCoMoSANxFHj4x0N8yh3e8NmzG74QQJOTwXwzP7FfmOBVr7
         cuuZ0olapwyU0xk5kP15VtYeeLaJZjxBgf0JkVuHur3Yi8/mCl5pAPpC6InvhV+qkHm6
         8Xav+f7vMv6s4jHS8U5BJrq3eqnU1s2/EI89NTwIdrR3C3gxCVuVVXprRBA0KnSPn7V6
         aV9ATCER/cIw/CTRvF5YNv+NvKky2ZAtg5hrbp1NIQ651tK/UjjlsDNSxDxNXDWYohpI
         89UA==
X-Gm-Message-State: AOAM530NRxbrZxC7csbeK2fMZ/w4iMBOg/I25z6LRC5NJdECGE/LpXV7
        0mLX2lBhzOUwd/2gNatAfKSjrV/eH3dgnfxD3x33WA==
X-Google-Smtp-Source: ABdhPJxbBGw51JgE7GUdatiCnFa5SPSWoxHnxNvo2ms6WD2+F8lWkWNgnXWiiZRMa8WVyspaZgs/Q89ydvLq5yWytVk=
X-Received: by 2002:a9d:7303:: with SMTP id e3mr22118216otk.221.1593726286901;
 Thu, 02 Jul 2020 14:44:46 -0700 (PDT)
MIME-Version: 1.0
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 2 Jul 2020 14:44:36 -0700
Message-ID: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com>
Subject: dwc3 inconsistent gadget connection state?
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Yang Fei <fei.yang@intel.com>,
        Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Linux USB List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey Felipe,

  I've been tripping over an issue on my HiKey960 where with the usb-c
gadget cable connected, the gadget code doesn't consistently seem to
initialize properly. I had rarely seen this behavior previously, but
more recently it has become more frequent and annoying.

Usually, unplugging and replugging the USB-C cable would get things
working again (but that's not helpful in test labs).

I annotated a bunch of code trying to understand what was going on and
I narrowed down the difference in the good and bad case to a dwc3
reset interrupts happening after usb_gadget_probe_driver() completes.
In the good case, we see the reset interrupts, and in the failed case
we don't.

[   16.491953] JDB: usb_gadget_probe_driver
[   16.495938] JDB: udc_bind_to_driver
[   16.499555] JDB: dwc3_gadget_start irq: 65 revision: 1429417994
[   16.503803] JDB: __dwc3_gadget_ep_enable
[   16.507791] JDB: __dwc3_gadget_ep_enable
[   16.511715] JDB: dwc3_gadget_enable_irq
[   16.515582] JDB: usb_udc_connect_control
[   16.519510] JDB: usb_gadget_connect
<in the bad case, this is all we see, the gadget device doesn't come up>
[   16.811010] JDB: dwc3_gadget_interrupt
[   16.814783] JDB: dwc3_gadget_reset_interrupt
[   16.819047] JDB: dwc3_reset_gadget
[   16.823935] JDB: dwc3_gadget_interrupt
[   16.827686] JDB: __dwc3_gadget_ep_enable
[   16.831611] JDB: __dwc3_gadget_ep_enable
[   16.994477] JDB: dwc3_gadget_interrupt
[   16.998246] JDB: dwc3_gadget_reset_interrupt
[   17.002519] JDB: dwc3_reset_gadget
[   17.005922] JDB: usb_gadget_udc_reset
[   17.062422] JDB: usb_gadget_set_state  state: 5
[   17.067069] JDB: dwc3_gadget_interrupt
[   17.070823] JDB: __dwc3_gadget_ep_enable
[   17.074745] JDB: __dwc3_gadget_ep_enable
[   17.170898] JDB: usb_gadget_set_state  state: 6
[   17.195605] JDB: usb_gadget_set_state  state: 7
[   17.200179] JDB: __dwc3_gadget_ep_enable
[   17.204118] JDB: __dwc3_gadget_ep_enable
[   17.208057] JDB: usb_gadget_vbus_draw
[   17.211721] JDB: usb_gadget_set_state  state: 7
<in the good case everything is happy here>


This sounds a bit like the issue in the comment here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/dwc3/gadget.c?h=v5.8-rc3#n3143

However, I've tried calling dwc3_gadget_reset_interrupt() and
dwc3_reset_gadget() at the tail end of dwc3_gadget_start() but that
doesn't seem to help.

I was curious if you or anyone else had any thoughts on how to debug
this further?

thanks
-john
