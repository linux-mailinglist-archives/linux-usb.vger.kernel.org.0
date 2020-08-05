Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD03F23C524
	for <lists+linux-usb@lfdr.de>; Wed,  5 Aug 2020 07:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgHEFdJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Aug 2020 01:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgHEFdJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Aug 2020 01:33:09 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87210C06174A
        for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2020 22:33:08 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id j7so22171977oij.9
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2020 22:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PJh9idvhnYQu6+tHMsdjbpUMLjsbhkJrYBowuz2U7ew=;
        b=VTNnHYzjcWpfKHEC0qnERLwRNAb3exZOQtSkHkZLl5RsU5L+uIu8VWcqKV/tvuqqgd
         hGsrCUgVZKq1d1UxhA4jHeHNi8MP9aFSxKnTA3zTeAdfqvj3XcthlXllZAvq3VqbyW8/
         gMcChaCbrTDFighbVIYvSPcEK42uS2/kn8cnRiWRek9GKsMxJzU9tbwI7vgtbOWm0Jxu
         JwWaas5dhgiSQyljhb99Zr+MTVGJhcmsltG0u3KEOmS9znYrFU8vSBITlv0xUu1tFwkf
         D+H65ZEehba4ur8v9Ghce3aLuHL8xQlJ7rIA3oDhiDBK0upZ3B6BQr+48qED9nhbsMF6
         wGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PJh9idvhnYQu6+tHMsdjbpUMLjsbhkJrYBowuz2U7ew=;
        b=VsJO5qnmZIqAATLX/XooK8Bykw8HMNcPGU1kSTCIR9EOsLoCDV2ckvXKTujJE+mNxW
         mnNVVjxm7KJymA9xSVReFw98zVCWblY8JFobieTi2ZlhD7iKOtmva+VH4s/hDpwZp0fb
         kHKvpzAC+IlNdu53IDhbPwBmS7opJTCbdhnuH8xYsBl2ADqIaEWFJcuqm1MP/XiATViH
         6iV+D+B+zolSStQOPWEZh3vS0xp5Z3qJR2LwZvPSlJMouID9ltO4DiqbFG/jBd/ZIHgO
         nrT9fHV6W/NIY3cWJmo2KjeUL2w3wy45GD8oxvVxOPwopNBjzPyCmV1L3cllD4c2qSaw
         imEQ==
X-Gm-Message-State: AOAM530m1jAf9U0ZvBtw8i9HaBArHzVFpgni9KPfpCLg3dXG7Gymm49V
        JM6eJiLscDlO7GR0pqi1pGTzDClB+eXmw/6VrHCKTQ==
X-Google-Smtp-Source: ABdhPJwwDq+gQJc4l2FSWDtEGHBjXEMEtV032PLCkcrbKSG+f9HrltjfmQ8CiEel6sFRDWO6vHlyR6f20PdhhPsu8wY=
X-Received: by 2002:aca:1117:: with SMTP id 23mr1468870oir.97.1596605587860;
 Tue, 04 Aug 2020 22:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com>
 <CALAqxLXjByaYaNweqGiSyArJ=1J-D7bSm+sndCtH_wf7h2avTA@mail.gmail.com> <BYAPR02MB4933A269D7CFAF7AC540CCC7A76A0@BYAPR02MB4933.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4933A269D7CFAF7AC540CCC7A76A0@BYAPR02MB4933.namprd02.prod.outlook.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 4 Aug 2020 22:32:56 -0700
Message-ID: <CALAqxLWHgmJjoqxMqcs9Veco8Cf_cZZH0EG9DyLnLpyEyu77Lg@mail.gmail.com>
Subject: Re: dwc3 inconsistent gadget connection state?
To:     Anurag Kumar Vulisha <anuragku@xilinx.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Yang Fei <fei.yang@intel.com>,
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

On Fri, Jul 3, 2020 at 12:57 AM Anurag Kumar Vulisha
<anuragku@xilinx.com> wrote:
> >On Thu, Jul 2, 2020 at 2:44 PM John Stultz <john.stultz@linaro.org> wrote:
> >The one consistent difference between the working and not working case I
> >saw was the DWC3_DSTS_COREIDLE bit in the DWC3_DSTS register.
> >
> >It seems when we get to gadget_start()/pullup() if the DSTS_COREIDLE bit
> >isn't on we won't get the reset irq.
> >
> >I added a simple timeout loop to pullup() similar to the DSTS_DEVCTRLHLT
> >loop, but in the failure mode it always times out with COREIDLE not being set.
> >
> >Searching around hasn't provided any info on what COREIDLE actually means,
> >so I'm a bit in the dark.  Any clues?
> >
> DSTS.CoreIdle bit indicates that the core processed all the RXFIFO data, updated the
> Descriptors and is in idle state.
> From your previous mail I understood that the USB-C connection is configured for
> USB 2.0 only. Since you are facing issue with reset, can u please try setting the
> USB2PHYCFG. XCVRDLY bit. Enabling this bit adds an extra 2.5us delay after the
> controller sending command to configure the ULPI transceiver to HS mode and
> controller driving TxValid to 0,  for sending a HS chirp signal. Please check if this
> workaround works for you.

Hey Anurag!
  Sorry for the slow response! I finally took a bit more time to chase
this issue today, and tried your suggestion above. Unfortunately
adding the XCVRDLY bit to the USB2PHYCFG register doesn't seem to
help. I see the same behavior either way. Thanks for the suggestion
though!

I can consistently detect the problem when the COREIDLE bit isn't set
after the dwc3_ep0_out_start() call in __dwc3_gadget_start():
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/dwc3/gadget.c?h=v5.8#n2130

When it gets stuck off, the COREIDLE bit doesn't seem to ever come
back while the cable is plugged in.
Since unplugging and replugging the cable does seem to unstick this,
and since I can consistently detect when the problem has occured, I
tweaked the code so we would return a error (and that error would be
handled in the calling dwc3_gadget_start() code.  However, the device
then tries to initialize over and over, but the COREIDLE is still
stuck off. So I tried a few times to see if I could reset via
dwc3_reset_gadget(), but that doesn't seem to actually do anything
that unsticks the core. Then I tried to mimic something similar to the
softreset code but that just ends up getting the code stuck elsewhere
(i see hard hangs and rcu warnings, but not sure where it goes awry).
So not much luck...

Is there some recommendation for how to best reset the hardware from
the gadget.c code? Or is there a better place to try to detect this
COREIDLE stuck-off state and do something about it?

thanks
-john
