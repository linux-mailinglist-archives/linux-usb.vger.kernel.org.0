Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 336642E26F0
	for <lists+linux-usb@lfdr.de>; Thu, 24 Dec 2020 13:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgLXMu7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Dec 2020 07:50:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbgLXMu7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Dec 2020 07:50:59 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A630AC061794
        for <linux-usb@vger.kernel.org>; Thu, 24 Dec 2020 04:50:18 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id n3so2403967pjm.1
        for <linux-usb@vger.kernel.org>; Thu, 24 Dec 2020 04:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=v7dDiVFBVgQHE86Gpduk2CdCxiD8gNoRw8x02unj1q4=;
        b=ZeUmJ3BV3Th0Vi8SJj/B02jVX9O8OHnnhZn2ThqYWlWQ6VuqMmmVgnJ/iDPOdHvkYp
         njcHgw8yNR3oxs+Lll7tszHMCBXL3X+C2GhOrbrlOuCytcXyGTFsafBippVCLnhwNDia
         eX/qEglzssM551mjmMOns50/gBH8g6kUWF3WECfTk461g0S6PCkVGCheE4RfbX06bids
         /RbLlo2rlChrjvqBMz4TkMDTlOYVmMmtJIyxoNj9Ft2b5gG8q/Jlb0taRWDelTgMKysp
         WpGukpSvxJfTqa3wPWKj0pNHbj0RNoPi1s16RAbYe8Y0YPgBCFZXiHYv1+YJgLTp8wb1
         v7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=v7dDiVFBVgQHE86Gpduk2CdCxiD8gNoRw8x02unj1q4=;
        b=OVUEkq4C+HPPsvIssbIS/13HVJJlHeRqlkICCa/FXqVxcOKzjPJSyzTXQzsJY5VWNR
         USXMvbT00vqXHX1cBbSRoID5+l7a9Z0o1d5moFFuTTuP1wwpzQzM5Z2w7EOzhkS87mZT
         qqLITg1x2DSMZjkztxQ1N7uAGD9MtahrZSJTaTozKUUHROBRMzYDD5vq6Fp26MopP8MT
         BRiNbT/FExGHwmFfHcdjgdC9ymh6EB1naBeIP3dj4lxgDVmMVc+IogVLGrczVA9SNO7M
         2g3eQgO/43jhWNrs+IOj/op1pcxx3jnWM61DRiXwtdSkeP3cd2hXgDEkxsDLcI9xRhKy
         SIuw==
X-Gm-Message-State: AOAM530k9AsiZ/KnSsoPpOjusqNuan0FRHo/JJjrW5UtZlqczBOXpZ+u
        8OuRyQOecFl7X772YhPvTSFFUUjiEY4=
X-Google-Smtp-Source: ABdhPJy8cZZ029H70fPxAE3TCIhZ0MdYjLWN3qrYEsshna1J77DVdxLQC6OLMCQqnG6VIaKKK7kPuQ==
X-Received: by 2002:a17:90a:a2e:: with SMTP id o43mr4192471pjo.59.1608814217991;
        Thu, 24 Dec 2020 04:50:17 -0800 (PST)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
        by smtp.gmail.com with ESMTPSA id iq3sm2913301pjb.57.2020.12.24.04.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 04:50:17 -0800 (PST)
Received: from localhost (localhost [IPv6:::1])
        by localhost.lan (Postfix) with ESMTPSA id DE2049010FD;
        Thu, 24 Dec 2020 12:50:12 +0000 (GMT)
Date:   Thu, 24 Dec 2020 12:50:12 +0000
From:   Vincent Pelletier <plr.vincent@gmail.com>
To:     <linux-usb@vger.kernel.org>,
        Minas Harutyunyan <hminas@synopsys.com>
Subject: dwc2 gadget rejecting new AIO transfer when bus is suspended
Message-ID: <20201224125012.4df1d26c@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I am writing a functionfs-based gadget, using the raspberry pi zero.
Depending on the time my userland process takes between the moment the
UDC is bound to the gadget and the moment it submits AIO transfers, it
either works as expected or results in immediate transfer completion
with status -11 (-EAGAIN).

Enabling dynamic debug, I see the
  dev_dbg(hs->dev, "%s: submit request only in active state\n",
line being output when this issue occurs (see log extract at the end of
this email - note the 4 seconds gap between GINTSTS_ErlySusp - whatever
that means - and io happening and being rejected).

While I am sure there are hardware-dependent reasons to reject these
transfers, and while I can shift processing around to reduce this
delay and (apparently) reliably avoid this error, I think it is making
using this UDC rather hard: if my understanding is correct, this is a
race between userland and the bus. If the HCI suspends the bus first, I
cannot even submit buffers to be ready to receive some future OUT
transfer, but if the userland submits these buffers before suspension
then they are accepted - even if they get filled hours later.
In my case, the IN transfer is on an interrupt endpoint, so I also
think it would make more sense for the UDC to accept it: then, data is
ready for whenever the host wakes the bus and polls for interrupt
transfers.

Being a very occasional kernel contributor, have no immediate idea on
how both sides could be conciliated, so this is more a "I noticed that
it could be more convenient if..." than a proper bug report.

Checking the dwc3 I do not identify such EAGAIN in its io submission
code, and I did not (yet ?) trigger such error on my Intel Edison.

Dec 24 12:29:19 sushi kernel: [218828.497937] dwc2 20980000.usb: ep0 state:1
Dec 24 12:29:19 sushi kernel: [218828.497948] dwc2 20980000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84028000
Dec 24 12:29:19 sushi kernel: [218828.497959] dwc2 20980000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80008000
Dec 24 12:29:19 sushi kernel: [218828.497984] dwc2 20980000.usb: dwc2_hsotg_irq: 04048028 00040000 (d0bc3cc4) retry 8
Dec 24 12:29:19 sushi kernel: [218828.497996] dwc2 20980000.usb: dwc2_hsotg_irq: daint=00000001
Dec 24 12:29:19 sushi kernel: [218828.498008] dwc2 20980000.usb: dwc2_hsotg_epint: ep0(in) DxEPINT=0x00000001
Dec 24 12:29:19 sushi kernel: [218828.498022] dwc2 20980000.usb: dwc2_hsotg_epint: XferCompl: DxEPCTL=0x00008000, DXEPTSIZ=00000000
Dec 24 12:29:19 sushi kernel: [218828.498034] dwc2 20980000.usb: dwc2_hsotg_complete_in: adjusting size done 0 => 36
Dec 24 12:29:19 sushi kernel: [218828.498046] dwc2 20980000.usb: req->length:36 req->actual:36 req->zero:1
Dec 24 12:29:19 sushi kernel: [218828.498056] dwc2 20980000.usb: Receiving zero-length packet on ep0
Dec 24 12:29:19 sushi kernel: [218828.498078] dwc2 20980000.usb: dwc2_hsotg_irq: 04088028 00080000 (d0bc3cc4) retry 8
Dec 24 12:29:19 sushi kernel: [218828.498089] dwc2 20980000.usb: dwc2_hsotg_irq: daint=00010000
Dec 24 12:29:19 sushi kernel: [218828.498101] dwc2 20980000.usb: dwc2_hsotg_epint: ep0(out) DxEPINT=0x00000001
Dec 24 12:29:19 sushi kernel: [218828.498113] dwc2 20980000.usb: dwc2_hsotg_epint: XferCompl: DxEPCTL=0x00028000, DXEPTSIZ=20000000
Dec 24 12:29:19 sushi kernel: [218828.498122] dwc2 20980000.usb: zlp packet received
Dec 24 12:29:19 sushi kernel: [218828.498138] dwc2 20980000.usb: complete: ep 42dd5aad ep0, req 29f392ab, 0 => 5c316413
Dec 24 12:29:19 sushi kernel: [218828.498152] dwc2 20980000.usb: dwc2_hsotg_enqueue_setup: queueing setup request
Dec 24 12:29:19 sushi kernel: [218828.498169] dwc2 20980000.usb: ep0: req 8e14c7b2: 8@d91bfc39, noi=0, zero=0, snok=0
Dec 24 12:29:19 sushi kernel: [218828.498186] dwc2 20980000.usb: dwc2_hsotg_start_req: DxEPCTL=0x00028000, ep 0, dir out
Dec 24 12:29:19 sushi kernel: [218828.498198] dwc2 20980000.usb: ureq->length:8 ureq->actual:0
Dec 24 12:29:19 sushi kernel: [218828.498212] dwc2 20980000.usb: dwc2_hsotg_start_req: 1@8/8, 0x00080008 => 0x00000b10
Dec 24 12:29:19 sushi kernel: [218828.498225] dwc2 20980000.usb: dwc2_hsotg_start_req: 0x54ab8a20 => 0x00000b14
Dec 24 12:29:19 sushi kernel: [218828.498235] dwc2 20980000.usb: ep0 state:0
Dec 24 12:29:19 sushi kernel: [218828.498245] dwc2 20980000.usb: dwc2_hsotg_start_req: DxEPCTL=0x80028000
Dec 24 12:29:19 sushi kernel: [218828.498256] dwc2 20980000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80028000
Dec 24 12:29:22 sushi kernel: [218830.967016] dwc2 20980000.usb: dwc2_hsotg_irq: 04008428 00000400 (d0bc3cc4) retry 8
Dec 24 12:29:22 sushi kernel: [218830.967035] dwc2 20980000.usb: GINTSTS_ErlySusp
Dec 24 12:29:22 sushi kernel: [218830.970039] dwc2 20980000.usb: dwc2_hsotg_irq: 04008028 00000000 (d0bc3cc4) retry 8
Dec 24 12:29:25 sushi kernel: [218834.485152] dwc2 20980000.usb: ep1out: req 91851ac5: 10240@e55aa59c, noi=0, zero=0, snok=0
Dec 24 12:29:25 sushi kernel: [218834.485172] dwc2 20980000.usb: dwc2_hsotg_ep_queue: submit request only in active state
Dec 24 12:29:25 sushi kernel: [218834.485261] dwc2 20980000.usb: ep1out: req 91851ac5: 10240@e55aa59c, noi=0, zero=0, snok=0
Dec 24 12:29:25 sushi kernel: [218834.485273] dwc2 20980000.usb: dwc2_hsotg_ep_queue: submit request only in active state
Dec 24 12:29:25 sushi kernel: [218834.515516] dwc2 20980000.usb: ep2in: req 91851ac5: 2@8925e53a, noi=0, zero=0, snok=0
Dec 24 12:29:25 sushi kernel: [218834.515536] dwc2 20980000.usb: dwc2_hsotg_ep_queue: submit request only in active state
Dec 24 12:29:31 sushi kernel: [218840.337809] dwc2 20980000.usb: dwc2_hsotg_pullup: is_on: 0 op_state: 3
Dec 24 12:29:31 sushi kernel: [218840.337844] dwc2 20980000.usb: complete: ep 42dd5aad ep0, req 8e14c7b2, -108 => 97e9bd28
Dec 24 12:29:31 sushi kernel: [218840.337865] dwc2 20980000.usb: dwc2_hsotg_complete_setup: failed -108

Regards,
-- 
Vincent Pelletier
