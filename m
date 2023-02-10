Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A08EF691650
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 02:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbjBJBmA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Feb 2023 20:42:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjBJBl7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Feb 2023 20:41:59 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB97C26CFA
        for <linux-usb@vger.kernel.org>; Thu,  9 Feb 2023 17:41:55 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id g2so4669531ybk.8
        for <linux-usb@vger.kernel.org>; Thu, 09 Feb 2023 17:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=skydio.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y6h2zNJyEy4BK2N7DKGUmCGRPsFJSXQ8ei+VKDm25n4=;
        b=1GHoUshUodDYFMmo6qwlXjsrs5PbyNzCkmEmjOmPbRcWwNWF0UMmqbK590gT6PlhOd
         dQCKPFDYo6txkq6wscnp+slKpYJAoO5ccGFQMmfE6LJThygL1kTKH/Hda8C7cSFDDXHv
         U5VC1eJfU0vKio+FzMcIDufg9Vp3perskBv/7TA22THs+CIOAZN6AiRMYm5F8MobSy5x
         uGU7p7ILQzIF62fZ5R6Uqg/CNg5D6uE7+41FT83CLRVllA2zqWAjTAVdXUA6DBED//pU
         auZP9hsBxHrUn/eBjT3buuPRjY3kteFWOjiI2c2dq2mFltE4M6YeYxOseMM/Pgc2CtWe
         FBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6h2zNJyEy4BK2N7DKGUmCGRPsFJSXQ8ei+VKDm25n4=;
        b=fKaVJgZN3DRDF6T4y0H9rWitx01vrJLEekZpKXG/qd+9AgU6GCocvz8XX4GA5infiX
         XRrPve5inT8sw6C7Z2hP7eJ3n8jPKtC/lbbXQzqcOwiWsKhO9MTwM7HQ+NOziggll5XI
         V+z2zLt9ris/B+gE8qct7QpWFS3RjsySv1c6bJppJxQEGFuXBmK2tack85hX1xMZeEfI
         Y7G8R8pvwsUKcH6TxOI6Brbbyh+40aBN7OoxP1J4059jMLCczMS8ECeqohXQGP7uSEgo
         3ON4Tcv2z+QNfT1bQjVkJfKJy5aohYzO1kDkz2MLvcheq98fHBn4O0jkMHunF8HEjyjY
         KGkA==
X-Gm-Message-State: AO0yUKWiD8qrkbSeWvw1jEZPNCPepSl6uSgRXQXY9L0P4fh9ywfOCJ8t
        vXoY8XwKZwaLH59ph3GtXo48MW4KBSNdlJcSJxbpKw==
X-Google-Smtp-Source: AK7set+am83adW+pjNp25DuRKIrKM5ikSNDwiZTGcGtu3kir+R+uxybn3oPDk6g5Ro/gsHRr3PfkQUn5rfT9lhAPiMI=
X-Received: by 2002:a25:8911:0:b0:801:4e03:49a0 with SMTP id
 e17-20020a258911000000b008014e0349a0mr1320787ybl.317.1675993314149; Thu, 09
 Feb 2023 17:41:54 -0800 (PST)
MIME-Version: 1.0
References: <CAMKO5Cs69cN+RZNvszobqpHwNNsPFafAaSUxg63sWhSGPXcjyw@mail.gmail.com>
 <20230209081136.GA31049@hu-jackp-lv.qualcomm.com>
In-Reply-To: <20230209081136.GA31049@hu-jackp-lv.qualcomm.com>
From:   Jerry Zhang <jerry@skydio.com>
Date:   Thu, 9 Feb 2023 17:41:43 -0800
Message-ID: <CAMKO5CvCbABxEauXiojEPLK6q8543wm2SBsLisMEZ2b_-Gkx1w@mail.gmail.com>
Subject: Re: dwc3 stuck in U3 state on USB3-only link
To:     Jack Pham <quic_jackp@quicinc.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org,
        Alex Mallery <alex.mallery@skydio.com>,
        quic_wcheng@quicinc.com, quic_ppratap@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,T_SPF_PERMERROR autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the detailed responses
On Thu, Feb 9, 2023 at 12:11 AM Jack Pham <quic_jackp@quicinc.com> wrote:
>
> Hi Jerry,
>
> On Wed, Feb 08, 2023 at 07:27:04PM -0800, Jerry Zhang wrote:
> > We have a custom board with two linux systems connected by USB 3 wires
> > only, vbus and USB2 are omitted for space savings. This has pretty
> > much worked as the controllers are independent, except for the
> > following bug:
> >
> > - When the host system (tegra xhci host driver) reboots, the device
> > (msm-dwc3) enters the U3 state and never leaves it, even after the
> > host powers back up.
> > - Also if the device system happens to finish booting before the host,
> > the same thing happens, dwc3 gets stuck in U3 and never enumerates.
>
> In both of these scenarios when the host is momentarily offline, what
> is state of the superspeed signal lines?  Specifically, does the host
> remove terminations from its SSTX lines?
I haven't been able to verify but assuming the generic behavior is for
those terminations to be removed if the host is powered off or held in
reset, then that's probably what's happening here.
As I'll mention below, the issue is reproducible with a generic linux
desktop, hence why I'm somewhat confident our host isn't doing
anything weird.
>
> > I'm able to get these messages from the dwc3 driver when the host reboots
> >
> > [   34.549834] msm-dwc3 a600000.ssusb: msm_dwc3_pwr_irq received
> > [   34.555749] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler irq_stat=28100C
> > [   34.562902] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler link
> > state = 0x0006
> > [   34.570319] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler:
> > unexpected PWR_EVNT, irq_stat=281000
> > [   34.663734] msm-dwc3 a600000.ssusb: msm_dwc3_pwr_irq received
> > [   34.669644] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler irq_stat=2C1004
> > [   34.676698] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler:
> > unexpected PWR_EVNT, irq_stat=2C1000
> > [   34.686082] dwc3 a600000.dwc3: dwc3_gadget_suspend_interrupt Entry to 3
> > [   34.692919] dwc3 a600000.dwc3: Notify controller from
> > dwc3_gadget_vbus_draw. mA = 2
> > [   34.700777] msm-dwc3 a600000.ssusb:
> > DWC3_CONTROLLER_SET_CURRENT_DRAW_EVENT received
> > [   34.708648] dwc3 a600000.dwc3: Notify OTG from dwc3_gadget_suspend_interrupt
> > [   34.715888] msm-dwc3 a600000.ssusb: DWC3_CONTROLLER_NOTIFY_OTG_EVENT received
>
> (BTW I notice from these msm-dwc3 logs you must be using a Qualcomm SoC
> with a downstream kernel.  Though I think the issue is generic enough to
> debug with the upstream dwc3 gadget, if it does turn out to be some
> vendor-specific behavior then I would ask you to contact us directly for
> more focused support.)
Yep the issue can be reproduced with a QRB5165 devkit plugged into a
linux desktop using a cable with USB2 snipped. dwc3-msm in our kernel
is identical to that in
https://git.codelinaro.org/clo/la/kernel/msm-5.4.git.
>
> If possible please enable dwc3 tracing events as we might be able to see
> more info about the specific events that occur when the host reboots.
I did this by mounting tracefs and echo 1 > events/dwc3/enable and it
produces a trace file, however the events end the end of the trace
looks like
          <idle>-0       [006] d.s5   140.648282: dwc3_gadget_ep_cmd:
ep1in: cmd 'Update Transfer' [30007] params 00000000 00000000 00000000
--> status: Successful
          <idle>-0       [000] dnh1   140.736735: dwc3_readl: addr
00000000f7508d19 value 00000004
          <idle>-0       [000] dnh1   140.736739: dwc3_readl: addr
00000000967e799a value 00001000
          <idle>-0       [000] dnh1   140.736741: dwc3_writel: addr
00000000967e799a value 80001000
          <idle>-0       [000] dnh1   140.736743: dwc3_writel: addr
00000000f7508d19 value 00000004
  kworker/u17:10-767     [002] d..1   140.736770: dwc3_event: event
(00030601): End-Of-Frame [U3]
  kworker/u17:10-767     [002] dn.1   140.781424: dwc3_readl: addr
00000000967e799a value 80001000
  kworker/u17:10-767     [002] dn.1   140.781426: dwc3_writel: addr
00000000967e799a value 00001000

These seem to be data events from the end of the connection, and I
don't see any events related to suspend or power state.
> > I think the main thing I'm looking for is validating my existing
> > understanding and confirming a few things I suspect, but am not sure
> > of due to unfamiliarity with the details of the USB3 spec:
> >
> > - iiuc USB3 power management and states should actually be independent
> > from both vbus and usb2 lines as all the negotiation happens with LFPS
> > over the USB3 wires.
>
> Yes, but in the corner scenario above with the host going offline, you
> might be in a situation in which the device abrutly exits its U0 state
> due to a perceived disconnection or lack of communication on the SS
> pins.  It might be that the LTSSM could have transitioned to SS.Disabled
> state--in which case one of the only ways out of that state is, to quote
> from the USB3.2 spec (7.5.1.1.2 Exit from eSS.Disabled):
>
>   "An upstream port shall transition to Rx.Detect only when VBUS
>    transitions to valid or a USB 2.0 bus reset is detected."
>
> But since you don't have VBUS nor usb2 lines connected, it's possible
> the controller could have gotten stuck here and not have a way out.
>
> :) there is a reason that spec compliant USB3.x implementations must
> also provide D+/D- connectivity; not only for backwards compatibility
> but also for these sorts of fallback scenarios.
Understood, we knew we were getting into sketchy territory with this
but we're actually port splitting on the host side and using that USB2
slot for a different device, which helps us avoid the need for a hub.
For embedded systems with a fixed topology, this strategy has a lot of
advantages if we can get it working.
>
> > - I see that entry to U3 requires an LFPS message, but in this case
> > the host wouldn't have been able to send a message as it is powering
> > off. Is the device also capable of entering U3 due to timeouts and is
> > it expected to enter U3 in this situation?
>
> In this case since it's obviously not a U3 entry due to LFPS, the only
> other interpretation of the dwc3's U3 link state is that it is a
> HS/FS/LS Suspend/L2 state.  This can occur simply by not having activity
> on D+/D- lines.
>
> > - Similarly I've seen that exiting from U3 requires an LFPS message.
> > My expectation is that the host would wake up all devices on the bus
> > with LFPS messages shortly after bootup, and either this isn't
> > happening, or the device is failing to receive or process the message.
> > If the entry to U3 is expected, how is it then expected to exit U3?
>
> I think what might have happened is that when the host rebooted, the
> device must have abruptly exited U0 and went into eSS.Disabled; at that
> point the dwc3 controller "falls back" into USB2 mode but since D+/D-
> are not connected, it is then perceived as entering USB2 suspend.
> Being in eSS.Disabled could explain why it doesn't respond to further
> LFPS signaling from the host.
>
> You'd somehow need to get the controller to go back into Rx.Detect.
> Since you don't have a way to do USB2 reset on D+/D-, you may need to at
> least simulate a VBUS toggle, or forcefully reset the dwc3 controller.
>
> With the QCOM HW there is a register that can do this.  Please refer to
> dwc3_qcom_vbus_override_enable() in dwc3-qcom.c for the upstream
> implementation.
The equivalent of this is already being called in dwc3-msm.c as
dwc3_override_vbus_status, except for missing the SW_SESSVLD_SEL flag,
but I added that and I didn't notice any difference. I'm assuming
dwc3-msm and dwc3-qcom are different implementations targeting the
same device?

I did manage to finally find a quirk that seems promising though. I
see in dwc-msm that resume_work is skipped if the enable_bus_suspend
bit is not set

     case DWC3_CONTROLLER_NOTIFY_OTG_EVENT:
         dev_err(mdwc->dev, "DWC3_CONTROLLER_NOTIFY_OTG_EVENT received\n");
         if (dwc->enable_bus_suspend) {
             mdwc->suspend = dwc->b_suspend;
             queue_work(mdwc->dwc3_wq, &mdwc->resume_work);
         }
         break;

and indeed we don't have it set so I tried enabling
snps,bus-suspend-enable. Now the log looks a bit different:

[  140.600806] msm-dwc3 a600000.ssusb: msm_dwc3_pwr_irq received
[  140.606720] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler irq_stat=28100C
[  140.613873] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler link
state = 0x0006
[  140.621291] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler:
unexpected PWR_EVNT, irq_stat=281000
[  140.714729] msm-dwc3 a600000.ssusb: msm_dwc3_pwr_irq received
[  140.720635] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler irq_stat=2C1004
[  140.727688] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler:
unexpected PWR_EVNT, irq_stat=2C1000
[  140.736782] dwc3 a600000.dwc3: dwc3_gadget_suspend_interrupt Entry to 3
[  140.743600] dwc3 a600000.dwc3: Notify controller from
dwc3_gadget_vbus_draw. mA = 2
[  140.751465] msm-dwc3 a600000.ssusb:
DWC3_CONTROLLER_SET_CURRENT_DRAW_EVENT received
[  140.759335] dwc3 a600000.dwc3: Notify OTG from dwc3_gadget_suspend_interrupt
[  140.766575] msm-dwc3 a600000.ssusb: DWC3_CONTROLLER_NOTIFY_OTG_EVENT received
[  140.773906] msm-dwc3 a600000.ssusb:
DWC3_CONTROLLER_NOTIFY_OTG_EVENT processing
[  140.781433] msm-dwc3 a600000.ssusb: dwc3_resume_work: dwc3 resume work
[  140.788182] msm-dwc3 a600000.ssusb: peripheral state
[  140.793307] msm-dwc3 a600000.ssusb: BPER bsv && susp
[  141.296798] msm-dwc3 a600000.ssusb: DWC3-msm runtime idle
[  142.048465] msm-dwc3 a600000.ssusb: DWC3-msm runtime suspend
[  142.054800] msm-dwc3 a600000.ssusb: DWC3 in low power mode

is the log when the host first powers off.

[  166.306367] msm-dwc3 a600000.ssusb: msm_dwc3_pwr_irq received
[  166.312277] msm-dwc3 a600000.ssusb: USB Resume start
[  166.317484] msm-dwc3 a600000.ssusb: msm_dwc3_pwr_irq_thread
[  166.323235] msm-dwc3 a600000.ssusb: dwc3_resume_work: dwc3 resume work
[  166.330001] msm-dwc3 a600000.ssusb: dwc3_msm_resume: exiting lpm
[  166.336493] msm-dwc3 a600000.ssusb: dwc3_msm_resume: truly resuming ss phy
[  166.343649] msm-dwc3 a600000.ssusb: DWC3 exited from low power mode
[  166.350125] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler irq_stat=3C1020
[  166.357237] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler:
handling PWR_EVNT_LPM_OUT_L2_MASK
[  166.366020] msm-dwc3 a600000.ssusb: dwc3_pwr_event_handler:
unexpected PWR_EVNT, irq_stat=3C1000
[  166.375094] msm-dwc3 a600000.ssusb: dwc3_resume_work: dwc3 resuming
[  166.381580] msm-dwc3 a600000.ssusb: peripheral_suspend state

and we get these messages when the host powers back up. I can verify
that the timing of these changes depending on how long the host is
held in reset, so it's definitely detecting the host here rather than
hitting some time based event. All these events look correct though as
it claims to be resuming, however there still isn't enumeration and
the link state still is in U3. The last line still claims to be in the
suspend state and this is probably what's preventing the resume from
completing. Looking through the code it seems like it depends on the
B_SESS_VLD  bit

     if (!test_bit(B_SESS_VLD, &mdwc->inputs)) {
         dev_err(mdwc->dev, "BSUSP: !bsv\n");
         mdwc->drd_state = DRD_STATE_IDLE;
         cancel_delayed_work_sync(&mdwc->sdp_check);
         dwc3_otg_start_peripheral(mdwc, 0);

so somehow this if statement isn't triggering. Does this seem like the
right track?
>
> > I've also tried relevant looking quirks on the gadget side including
> > ssp-u3-u0-quirk, u2exit_lfps_quirk, disable_scramble_quirk. I don't
> > see a way to explicitly prevent the controller from entering U3 mode,
> > is this possible with a register setting?
> >
> > Would appreciate any thoughts. If I haven't misunderstood anything,
> > the next step would probably be to find a beagle 5000 analyzer and
> > track down the LFPS messages.
>
> I this is still a good idea, if at least to see what's happening on the
> signal lines at a lower level.  Would be great if it could show the
> state of terminatination when the host is rebooting.
Unfortunately we don't have one on hand so this will probably be a
last resort if none of the other paths pan out.
>
> Hope that helps,
> Jack
