Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E713951DA
	for <lists+linux-usb@lfdr.de>; Sun, 30 May 2021 17:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhE3P7I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 May 2021 11:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhE3P7F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 May 2021 11:59:05 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D67C061760
        for <linux-usb@vger.kernel.org>; Sun, 30 May 2021 08:57:26 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 131so11726171ljj.3
        for <linux-usb@vger.kernel.org>; Sun, 30 May 2021 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uciXgExvgDGmeSVjHRfhHkv/aEHcvkYvt+AyzxPOXVc=;
        b=GtQK4msAGbrd9tpNKa+La2OQRbh5ZHBqY9EvJNYwYgq08/EjHatp9gdmzLtHMCK0h8
         2sUUGExzYzBUVa9SvsITwKqnWXRkroMlRzQ1X1LdaDQnxVTfP56UIzsJ5v0Fqqb/8BLs
         38Wsftn5W9CkbZPMM9cYoemCT2YPFVDVb7wUpGVpU5H2vmg1hU5ijlOdQ7t0cN0Yy8gY
         kyvMSmD6HLJM2TyuX9JPVHujWG7Jzoa3G9GxR3p7oFAbAJytc5e1Y9IEPSjAJtWxvPdu
         ER6e8FUvMFMcQddOp2ZvES8d7e+lTIJykhllFiy961K6hAkPrFBF+XEBycGFAPrOgnYN
         VJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uciXgExvgDGmeSVjHRfhHkv/aEHcvkYvt+AyzxPOXVc=;
        b=jXuRU+i1aF2Lu5sA9NlHTXv3bzziL4COHjx/lBWukUnH5qyfRs9r/EFIdHEvOAJh/O
         0m6MgKt3wq6HFJy/E1zqSFcfEUaRsTRScNwlKWRVsuL/olOk/6yHbWlaBiw1Df0FrcEY
         9jOD2L+tw8f/3NEMliZ3n53dU6SRuB6Ia+YSYZ2oBfZokKll9A3mP6aGeCmjeUTlJuxd
         Yv5k4EkDY0/pFPNuM313RCTdhFOlEIWdxu6QZyHxeVc2wGnWjA3lm7PooqWVQ/9uSvuz
         ZmCCLaf9lwDR/2nph1W+VSb/xGl9WGUvBkZdBlgDRnBSaAGyrwV+RIFOgS7Ygy5rV7lo
         UHSA==
X-Gm-Message-State: AOAM530poTvr8mdBX7jBnmnHMmK21u1XaETaKwKd6UOhRTeo2AZwzLX7
        0OxJ2PEGPYelXxc+sH7JoA//mi/mneW9S0SHS7E=
X-Google-Smtp-Source: ABdhPJznu8UyQaN7G4PTjnuU+aO+cw3rRoPNcFdAhfwaT/4eAxts1NfyPofcB5cqLj3sJRJoZn1znhSVBwMnrlM/ZWw=
X-Received: by 2002:a2e:824c:: with SMTP id j12mr13674727ljh.490.1622390243614;
 Sun, 30 May 2021 08:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAHS3B0EzL7zeKGjm=kvEq7VgDc-7hZNgOm-z5zPgFwVg0uQe-Q@mail.gmail.com>
 <YLOZLvWESErIePs3@hovoldconsulting.com>
In-Reply-To: <YLOZLvWESErIePs3@hovoldconsulting.com>
From:   Eero Lehtinen <debiangamer2@gmail.com>
Date:   Sun, 30 May 2021 18:57:12 +0300
Message-ID: <CAHS3B0E7tqHvF2-jsJZfPWYc6f9HLDDsvepDbqy1rboXOHFegQ@mail.gmail.com>
Subject: Re: [PATCH] media: rtl28xxu: add type-detection instrumentation
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

cat /sys/kernel/debug/dynamic_debug/control | grep rtl28xxu.c
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1791
[dvb_usb_rtl28xxu]rtl2832u_rc_query =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1694
[dvb_usb_rtl28xxu]rtl2831u_rc_query =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1616
[dvb_usb_rtl28xxu]rtl28xxu_frontend_ctrl =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1592
[dvb_usb_rtl28xxu]rtl28xxu_frontend_ctrl =_ "fe=%d onoff=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1570
[dvb_usb_rtl28xxu]rtl2832u_power_ctrl =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1520
[dvb_usb_rtl28xxu]rtl2832u_power_ctrl =_ "onoff=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1512
[dvb_usb_rtl28xxu]rtl2831u_power_ctrl =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1490
[dvb_usb_rtl28xxu]rtl2831u_power_ctrl =_ "WR SYS0=%02x
GPIO_OUT_VAL=%02x\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1471
[dvb_usb_rtl28xxu]rtl2831u_power_ctrl =_ "RD SYS0=%02x
GPIO_OUT_VAL=%02x\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1459
[dvb_usb_rtl28xxu]rtl2831u_power_ctrl =_ "onoff=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1450
[dvb_usb_rtl28xxu]rtl28xxu_init =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1425
[dvb_usb_rtl28xxu]rtl28xxu_init =_ "\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1403
[dvb_usb_rtl28xxu]rtl28xxu_tuner_detach =_ "\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1382
[dvb_usb_rtl28xxu]rtl2832u_tuner_attach =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1377
[dvb_usb_rtl28xxu]rtl2832u_tuner_attach =_ "no SDR for tuner=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1187
[dvb_usb_rtl28xxu]rtl2832u_tuner_attach =_ "\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1152
[dvb_usb_rtl28xxu]rtl2831u_tuner_attach =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1122
[dvb_usb_rtl28xxu]rtl2831u_tuner_attach =_ "\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1070
[dvb_usb_rtl28xxu]rtl28xxu_frontend_detach =_ "\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:1042
[dvb_usb_rtl28xxu]rtl2832u_frontend_attach =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:894
[dvb_usb_rtl28xxu]rtl2832u_frontend_attach =_ "\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:869
[dvb_usb_rtl28xxu]rtl2832u_frontend_callback =_ "component=%d cmd=%d
arg=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:842
[dvb_usb_rtl28xxu]rtl2832u_tua9001_tuner_callback =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:809
[dvb_usb_rtl28xxu]rtl2832u_tua9001_tuner_callback =_ "cmd=%d
arg=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:799
[dvb_usb_rtl28xxu]rtl2832u_fc0012_tuner_callback =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:774
[dvb_usb_rtl28xxu]rtl2832u_fc0012_tuner_callback =_ "cmd=%d
arg=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:729
[dvb_usb_rtl28xxu]rtl2831u_frontend_attach =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:686
[dvb_usb_rtl28xxu]rtl2831u_frontend_attach =_ "\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:648
[dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:640
[dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "chip_id=%u\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:620
[dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:598
[dvb_usb_rtl28xxu]rtl2832u_read_config =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:584
[dvb_usb_rtl28xxu]rtl2832u_read_config =_ "Si2168 found\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:575
[dvb_usb_rtl28xxu]rtl2832u_read_config =_ "CXD2837ER found\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:568
[dvb_usb_rtl28xxu]rtl2832u_read_config =_ "MN88473 found\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:561
[dvb_usb_rtl28xxu]rtl2832u_read_config =_ "MN88472 found\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:527
[dvb_usb_rtl28xxu]rtl2832u_read_config =_ "tuner=%s\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:378
[dvb_usb_rtl28xxu]rtl2832u_read_config =_ "\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:346
[dvb_usb_rtl28xxu]rtl2831u_read_config =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:342
[dvb_usb_rtl28xxu]rtl2831u_read_config =_ "tuner=%s\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:280
[dvb_usb_rtl28xxu]rtl2831u_read_config =_ "\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:59
[dvb_usb_rtl28xxu]rtl28xxu_ctrl_msg =_ "failed=%d\012"
drivers/media/usb/dvb-usb-v2/rtl28xxu.c:45
[dvb_usb_rtl28xxu]rtl28xxu_ctrl_msg =_ "%s: %02x %02x %02x %02x %02x
%02x %02x %02x %s %*ph\012"

On Sun, May 30, 2021 at 4:54 PM Johan Hovold <johan@kernel.org> wrote:
>
> On Sun, May 30, 2021 at 03:23:36PM +0300, Eero Lehtinen wrote:
> > Hi,
> >
> > I tested Johans latest patch and my dvb-t stick can find the channel
> > list but not to tune to them. It uses the mxl5005s driver again with
> > repeating mxl5005s I2C write failed messages:
> >
> > [   23.276076] mxl5005s I2C reset failed
> > [   23.296082] mxl5005s I2C write failed
> > [   23.316041] mxl5005s I2C write failed
> > [   23.336061] mxl5005s I2C write failed
> > [   23.336100] usb 1-1: Frontend requested software zigzag, but didn't
> > set the frequency step size
> > [   23.356096] mxl5005s I2C reset failed
> > [   23.376226] mxl5005s I2C write failed
> > [   23.396084] mxl5005s I2C write failed
> > [   23.416082] mxl5005s I2C write failed
>
> It was just an instrumentation patch to gather more information. Can you
> post the logs from when probing/using the device with that patch in
> place?
>
> Specifically, look for the "rtl28xxu_identify_state" entries, but please
> include the full log in case there are more hints in there.
>
> Also, please keep me and Alan on CC (along with the list) so that we get
> your replies directly. The list can be a bit slow at forwarding at
> times.
>
> Johan
