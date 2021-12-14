Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48F73474973
	for <lists+linux-usb@lfdr.de>; Tue, 14 Dec 2021 18:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbhLNRbZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Dec 2021 12:31:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbhLNRbY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Dec 2021 12:31:24 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4207C061574
        for <linux-usb@vger.kernel.org>; Tue, 14 Dec 2021 09:31:24 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id s139so28013785oie.13
        for <linux-usb@vger.kernel.org>; Tue, 14 Dec 2021 09:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R7v5ssMTRzcSSVAu3JTNzmbTIOH3nuwD0CpYbl1UTfQ=;
        b=K7KsxY0qxZWcuAUY7iZIJhOgxBeO4KItXMni4G5np2REtj2jFdXbotwzO80l2MIz4Q
         8bx7wxPxzkkx/EL0XImMm23qQPBh8afpiyb8BL6qUcilGK6TGMi06KHIZKeert5sZMuc
         ncdBstU0WRxK69k8f5lrwbagyk59jli6e4hqIf2HrnmIMvWOCMI7uUcOzh5Gn0smGxz5
         bnclqu3ygHu9M/ZFdkJQ5S7vEV7Fn9rwwKpzkXm6oMoY4a1/rNamcqH0R79+hQ42diGG
         hSQri7DQUonLe+6yPuFWLHQsti5aQ96gBWd1uqgWznVLet0+42QC/Qw/rRnPEk/XkoxU
         7FQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R7v5ssMTRzcSSVAu3JTNzmbTIOH3nuwD0CpYbl1UTfQ=;
        b=jIIIAO1aGcAytq8YZ0uGSUVS5BKbKB9n3WutKN7iLrXPuZ8768mNMxJ1KoYF3281Bb
         rJEKZwp/SsyF3lmT1Y2NoNX8h+xaV3vx80Yokcm8HlM1+rW1kRI2J7DBPhSB3RfIMfNV
         B0s1TmCtgMTuZw24XR0JTaKxWL9EzavCSvNF4k78YUSDx9qbs2WApMS665eXkeFHUsAU
         AQkyxdUvNeW9lDejBKako2WsilnJSv++hhS+1zo7PEgtHKXtpegNu2T3MJsiXd0iwVdY
         yXBOqEEiLj91K9Ix4eVs/gH80FUXoEJikHXGdwej1PeuO5lEs8CvvqTT9auIpjwRHMgk
         r/WA==
X-Gm-Message-State: AOAM533csW3IDhqJTB7+XF4soWkCWKgg+qRSWq1sME8jC9YgJIywPXNT
        HjnzvfTZIEw53K5PQnWBdDK6x1FxRknVr3xqpHKj8tAd7lK0aA==
X-Google-Smtp-Source: ABdhPJwycA4PYRPAHUpCcnyOVN+7qylz06LghkFZvsNTRPgHufKW3/wtIhRk8Fr78ullPlp+Ab/sU6HCc8mJXzcmM8E=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr5312677oiu.159.1639503083507;
 Tue, 14 Dec 2021 09:31:23 -0800 (PST)
MIME-Version: 1.0
References: <81f48bdb-c97b-2f7c-293e-941ec44ee941@kernel.org>
 <5e8cbce0-3260-2971-484f-fc73a3b2bd28@synopsys.com> <0fe0ad93-1f17-5e88-e381-94544ac75185@kernel.org>
 <7ffb5888-2001-8de9-7104-db66797b2112@kernel.org> <6551e530-90a4-7c68-d097-7ffbeafbb400@synopsys.com>
 <f73dc0d1-45ef-985a-a3d1-bfe740a734e0@kernel.org> <eef16aee-a706-9b46-047b-edc825abe7a4@kernel.org>
In-Reply-To: <eef16aee-a706-9b46-047b-edc825abe7a4@kernel.org>
From:   Dinh Nguyen <dinh.linux@gmail.com>
Date:   Tue, 14 Dec 2021 11:31:12 -0600
Message-ID: <CADhT+wccrybsjRCdrH2h+SorKKCGFJs+oh-YhtfXgcM0a1k4mw@mail.gmail.com>
Subject: Re: usb: dwc2: USB on Agilex platform broken after commit 50fb0c128b6e
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 14, 2021 at 10:50 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
>
>
>
> On 12/14/21 9:50 AM, Dinh Nguyen wrote:
> >
> >
> > On 12/14/21 12:13 AM, Minas Harutyunyan wrote:
> >> Hi Dinh,
> >>
> >> On 12/14/2021 12:40 AM, Dinh Nguyen wrote:
> >>>
> >>>
> >>> On 12/13/21 10:13 AM, Dinh Nguyen wrote:
> >>>> Hi Minas,
> >>>>
> >>>> Thanks for replying!
> >>>>
> >>>> On 12/13/21 3:47 AM, Minas Harutyunyan wrote:
> >>>>> Hi Dinh,
> >>>>>
> >>>>> On 12/9/2021 1:44 AM, Dinh Nguyen wrote:
> >>>>>> Hi Arthur,
> >>>>>>
> >>>>>> The usb driver is getting this error:
> >>>>>>
> >>>>>> [    1.539856] Hardware name: SoCFPGA Agilex SoCDK (DT)
> >>>>>> [    1.544799] Call trace:
> >>>>>> [    1.547233]  dump_backtrace+0x0/0x1c0
> >>>>>> [    1.550897]  show_stack+0x18/0x68
> >>>>>> [    1.554202]  dump_stack+0xd8/0x134
> >>>>>> [    1.557597]  __report_bad_irq+0x38/0xf0
> >>>>>> [    1.561423]  note_interrupt+0x31c/0x3e8
> >>>>>> [    1.565244]  handle_irq_event_percpu+0x60/0x90
> >>>>>> [    1.569671]  handle_irq_event+0x48/0xe0
> >>>>>> [    1.573491]  handle_fasteoi_irq+0xb0/0x138
> >>>>>> [    1.577574]  generic_handle_irq+0x30/0x48
> >>>>>> [    1.581567]  __handle_domain_irq+0x60/0xb8
> >>>>>> [    1.585646]  gic_handle_irq+0xb4/0xd0
> >>>>>> [    1.589300]  el1_irq+0xb8/0x150
> >>>>>> [    1.592428]  arch_cpu_idle+0x18/0x28
> >>>>>> [    1.595992]  default_idle_call+0x24/0x5c
> >>>>>> [    1.599899]  do_idle+0x1f4/0x290
> >>>>>> [    1.603118]  cpu_startup_entry+0x28/0x68
> >>>>>> [    1.607026]  rest_init+0xd8/0xe8
> >>>>>> [    1.610242]  arch_call_rest_init+0x10/0x1c
> >>>>>> [    1.614329]  start_kernel+0x50c/0x544
> >>>>>> [    1.617980] handlers:
> >>>>>> [    1.620241] [<00000000ae601aac>] dwc2_handle_common_intr
> >>>>>> [    1.625541] [<00000000255d793a>] dwc2_hsotg_irq
> >>>>>> [    1.630056] [<000000000bc68ab4>] usb_hcd_irq
> >>>>>> [    1.634312] Disabling IRQ #33
> >>>>>>
> >>>>>> After a git-bisect, the result is this commit:
> >>>>>>
> >>>>>>
> >>>>>> commit 50fb0c128b6e8df62200ba85c05ecd6b1396476d
> >>>>>> Author: Artur Petrosyan<Arthur.Petrosyan@synopsys.com>
> >>>>>> Date:   Tue Apr 13 11:37:15 2021 +0400
> >>>>>>
> >>>>>>        usb: dwc2: Add clock gating entering flow by system suspend
> >>>>>>        If not hibernation nor partial power down are supported,
> >>>>>>        clock gating is used to save power.
> >>>>>>        Adds a new flow of entering clock gating when PC is
> >>>>>>        suspended.
> >>>>>>        Signed-off-by: Artur Petrosyan<Arthur.Petrosyan@synopsys.com>
> >>>>>> Link:https://urldefense.com/v3/__https://lore.kernel.org/r/20210413073716.30C13A0094@mailhost.synopsys.com__;!!A4F2R9G_pg!IjGS70cMXB9miMnPdcoGriUpDvARm7ScwrlQXAiH9qN-ZnpcaiM_gD-KWp___MVyvEPm_djJ$
> >>>>>>
> >>>>>>
> >>>>>>        Signed-off-by: Greg Kroah-Hartman<gregkh@linuxfoundation.org>
> >>>>>>
> >>>>>> The DWC2 USB version on the Agilex platform is
> >>>>>> 0x4F54330A
> >>>>>>
> >>>>> Could you please provide HW configuration registers values
> >>>>> (GHWCFG1-4).
> >>>>>
> >>>>
> >>>> [    0.987779] dwc2 ffb00000.usb: GHWCFG1    @0xFFFF800012940044 :
> >>>> 0x00000000
> >>>> [    0.994644] dwc2 ffb00000.usb: GHWCFG2    @0xFFFF800012940048 :
> >>>> 0x238FFC90
> >>>> [    1.001498] dwc2 ffb00000.usb: GHWCFG3    @0xFFFF80001294004C :
> >>>> 0x1F8002E8
> >>>> [    1.008350] dwc2 ffb00000.usb: GHWCFG4    @0xFFFF800012940050 :
> >>>> 0xFE0F0020
> >>>>
> >>>>
> >>>> I did a little debugging, and noticed that the GINTSTS_PRTINT is
> >>>> firing, so the dwc2_handle_common_intr() is getting called
> >>>> continuously. There's doesn't seem to be way to handle the
> >>>> GINTSTS_PRTINT bit, because there's a check for device_mode().
> >>>>
> >>>
> >>> It looks like the LPMMode bit is disabled in the GHWCFG3. Could that be
> >>> the reason why?
> >>>
> >>> Dinh
> >>
> >> Could you please disable clock gating by adding to
> >> dwc2_set_default_params() function follow line:
> >> p->no_clock_gating = true;
> >> like in dwc2_set_s3c6400_params() function.
> >>
> >
> > That did not fix the issue. However, if I remove the line:
> >
> > +               /* After entering suspend, hardware is not accessible */
> > +               clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
> >
> > Then the issue gets fixed.
> >
>
> I don't see _dwc2_hcd_resume() getting called.
>

This fixes it:

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 13c779a28e94..f63a27d11fac 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -4399,11 +4399,12 @@ static int _dwc2_hcd_suspend(struct usb_hcd *hcd)
                 * If not hibernation nor partial power down are supported,
                 * clock gating is used to save power.
                 */
-               if (!hsotg->params.no_clock_gating)
+               if (!hsotg->params.no_clock_gating) {
                        dwc2_host_enter_clock_gating(hsotg);

-               /* After entering suspend, hardware is not accessible */
-               clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
+                       /* After entering suspend, hardware is not accessible */
+                       clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
+               }
                break;
        default:
                goto skip_power_saving;
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index d300ae3d9274..9102fe8f6021 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -440,6 +440,7 @@ static void dwc2_set_default_params(struct
dwc2_hsotg *hsotg)
                p->g_np_tx_fifo_size = 1024;
                dwc2_set_param_tx_fifo_sizes(hsotg);
        }
+       p->no_clock_gating = true;
 }
