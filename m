Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5002164F3
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 05:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgGGD4V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 23:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgGGD4V (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 23:56:21 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42426C061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 20:56:21 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id t4so15994694oij.9
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 20:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dx43ajhLjESyCXf5IxKZ59xjiCbdqQbAPcW0/8Og+YE=;
        b=SHEQ695czCyxi92BjesXE+7X8G9ruQia2GI50J3AF1hsD1ti7UDL0anlB1z3/rBTFj
         +vaWgzSNGGOnv8sfLhwL8gp/cJDEjePWrOudvnFb0L6ptLpCThQ7SaO2W/dh8ogsEVNF
         DXLGE7LPsyWEIQAZ8TldhFPIMcq12AcOITZUkQoqVJDWjFOE4+MYyUlXJ5gErSR+T7ni
         PIQC5FwjlInTkwpT7lwLyC5HTAaRklDnE/hqwuWZLdJbzG6LNMFX58GCQZ6Q2Nao+Q7V
         zKlR0gCzjyaYttBnwSkz+erH8mwmgLB6lch9DX+aHH7zYON+PDj0Y+ydpyQZmrwYsBR5
         Azzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dx43ajhLjESyCXf5IxKZ59xjiCbdqQbAPcW0/8Og+YE=;
        b=BSOmEMkU2qj/L/U0pb2aly78t8TFDmtPOht3VTbLuJNXQlGg+ojN/ec3IVo8g3SMVV
         hT7DV3Si90LE2bqPKI0JksYN20Ge1DzTIkfCI9HfYyov4gLuDUMb4WM29hgegUPvP3Ba
         MUVJifjKN6Kp7rop6iZs+v+Wm4672fxAfBfNt42SISaRpXEvtzTkNq/Nw2sAx/hBhbiX
         4A7tpWgXw1kW/7HmdRoIDnICI3vpYhuvJeYDc55mTD/d4SlyWCgCTLmcPiBSzcBrhIn3
         I3JWsEbqHIe3zScexTpIrx4XLAHn5cHzZ9DtJTw1GnwHH7HQN4WlocuSxkJWBAwHS31E
         Z44Q==
X-Gm-Message-State: AOAM532E+BTk9O/qtyJjOPyv10I48K90udgBYZHt5vOpds+WW6KH7ge0
        g4JS9BA8EHuW245rpmhVel5lD1coQtI0mbfXfPvyhA==
X-Google-Smtp-Source: ABdhPJzapC4Filrj9vnVZ5vbU6QG6qqgVvRY6gZlppzk3oqvFj5GEl43s0L+AK/QGRJR+IpeZfpsLtk8xABHA5nsQjo=
X-Received: by 2002:aca:b5c3:: with SMTP id e186mr1970574oif.10.1594094180570;
 Mon, 06 Jul 2020 20:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLWAvvHGo1RYef1fJ_k65WqHAPCDhLfehO6_j_f8E2jB7Q@mail.gmail.com>
 <87o8ow7wka.fsf@kernel.org> <CALAqxLVPOzD6FD9qJRJjTYai_zL_YzpCkPecWyE-KhTmEHNJYA@mail.gmail.com>
 <87lfjz73cd.fsf@kernel.org>
In-Reply-To: <87lfjz73cd.fsf@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 6 Jul 2020 20:56:08 -0700
Message-ID: <CALAqxLWMJikHCzxcna08UPFdf=frm5=2z3BB-FDrzy7MbrHF6g@mail.gmail.com>
Subject: Re: dwc3 inconsistent gadget connection state?
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

On Sat, Jul 4, 2020 at 7:38 AM Felipe Balbi <balbi@kernel.org> wrote:
> John Stultz <john.stultz@linaro.org> writes:
> > On Fri, Jul 3, 2020 at 2:54 AM Felipe Balbi <balbi@kernel.org> wrote:
> >> John Stultz <john.stultz@linaro.org> writes:
> >> > I was curious if you or anyone else had any thoughts on how to debug
> >> > this further?
> >>
> >> Try enabling dwc3 tracepoints and collecting working and failing
> >> cases. If I were to guess, I would say there's a small race condition
> >> between setting pullup and the transceiver sending the VBUS_VALID signal
> >> to dwc3.
> >
> > Trace logs attached. Let me know if you have any further ideas!
>
> You can see from failure case that we never got a Reset event. This
> happens, for instance, when dwc3 doesn't know that VBUS is above
> VBUS_VALID threshold (4.4V). When the problem happens, I'm assuming USB
> is completely dead, meaning that keeping the cable connected for longer
> won't change anything, right?

Correct. The only way to get it working is to unplug and replug the
cable (sometimes more than once).

> In that case, could you dump DWC3 registers (there's a debugfs interface
> for that)? I'm mostly interested in the PHY registers, both USB2 and
> USB3. Check if the PHYs are suspended in the error case.

Here's a diff of the regdump in bad and good cases:
--- regdump.bad 2020-07-07 03:44:46.799514793 +0000
+++ regdump.good        2020-07-07 03:44:44.723534198 +0000
@@ -24,7 +24,7 @@
 GHWPARAMS7 = 0x04881e8d
 GDBGFIFOSPACE = 0x00420000
 GDBGLTSSM = 0x41090440
-GDBGBMU = 0xa0b08000
+GDBGBMU = 0x20300000
 GPRTBIMAP_HS0 = 0x00000000
 GPRTBIMAP_HS1 = 0x00000000
 GPRTBIMAP_FS0 = 0x00000000
@@ -162,29 +162,29 @@
 GEVNTSIZ(0) = 0x00001000
 GEVNTCOUNT(0) = 0x00000000
 GHWPARAMS8 = 0x00000fea
-DCFG = 0x00120804
-DCTL = 0x80f00000
+DCFG = 0x0052082c
+DCTL = 0x8cf00a00
 DEVTEN = 0x00001217
-DSTS = 0x00000000
+DSTS = 0x00820000
 DGCMDPAR = 0x00000000
 DGCMD = 0x00000000
-DALEPENA = 0x00000003
+DALEPENA = 0x0000000f
 DEPCMDPAR2(0) = 0x00000000
-DEPCMDPAR1(0) = 0x17a8e000
+DEPCMDPAR1(0) = 0x15935000
 DEPCMDPAR0(0) = 0x00000002
 DEPCMD(0) = 0x00000006
 DEPCMDPAR2(1) = 0x00000000
-DEPCMDPAR1(1) = 0x02000500
-DEPCMDPAR0(1) = 0x00001000
-DEPCMD(1) = 0x00000001
+DEPCMDPAR1(1) = 0x15935000
+DEPCMDPAR0(1) = 0x00000002
+DEPCMD(1) = 0x00010006
 DEPCMDPAR2(2) = 0x00000000
 DEPCMDPAR1(2) = 0x00000000
-DEPCMDPAR0(2) = 0x00000001
-DEPCMD(2) = 0x00030002
+DEPCMDPAR0(2) = 0x00000000
+DEPCMD(2) = 0x00020007
 DEPCMDPAR2(3) = 0x00000000
 DEPCMDPAR1(3) = 0x00000000
-DEPCMDPAR0(3) = 0x00000001
-DEPCMD(3) = 0x00040002
+DEPCMDPAR0(3) = 0x00000000
+DEPCMD(3) = 0x00030007
 DEPCMDPAR2(4) = 0x00000000
 DEPCMDPAR1(4) = 0x00000000
 DEPCMDPAR0(4) = 0x00000001


> If they are, try enabling the quirk flags that disable suspend for the
> PHYs (check binding documentation). If that helps, then discuss with
> your Silicon Validation guys what are the requirements when it comes to
> suspend. Some PHYs are inherently quirky and need some of the quirky
> flags dwc3 provides.
>
> Note that disabling suspend completely is a pretty large hammer that
> should only be used if nothing else helps. Some PHYs are happy with a
> simple delay of U1/U2/U3 entry but, again, check with your Silicon
> Validation folks, likely they have already gone through this during chip
> characterization.

Unfortunately I don't have any access to silicon validation folks.
There is already a number of the quirk bindings in use, but I'll
tinker around with them a bit to see if it causes any behavior change.

Thanks so much for the ideas and feedback! Much appreciated!
-john
