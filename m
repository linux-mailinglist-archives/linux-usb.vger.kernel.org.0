Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C593A50B8F3
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 15:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448146AbiDVNsf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 09:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448143AbiDVNse (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 09:48:34 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D914160B
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 06:45:40 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id h25so5103792wrc.13
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 06:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=BUMLILxNftZqspzb94OSbewRurd5TjphKB9ZCuAblV0=;
        b=PpMCGA0C0K0/xYVFwTNCN6nFejzJUsIIWyDNY/FZgXnC3Do8i17251u6U088Xu7t+I
         Z6LPXGOy9YT1gTMuGWogQN700opJGfalZ8762N5Xf2fAYfdbiMaFib2Ul7jOvzapt/+6
         CUXifmBTZpuFb4Hb5aO7OV0l8WoOcHVCB0TGqetTLa0q7c9/tMdnMDRCixaxSb1hylpz
         LthBCVf5FRdMUZA6cHTWDdp6Tn3fCenNDI3h8jAkcRpRDb98qJzEcTZIwIl9ngSlEit1
         ycvD4SDVmzAi2O3SHQrBk1yO/6xUEoA/9Ysk4t2tWzAU0XC5RJfGoy23b76XQAQiZLA+
         GzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=BUMLILxNftZqspzb94OSbewRurd5TjphKB9ZCuAblV0=;
        b=nCbk0m0dEQaTuutS8E47bt1xkkp2t+iXqQqy8t376foRI2b31Mt2O+cHfG/k8R9cRf
         kWCQ5/yhEZqfNA+jceL/tGLM8euoGwTDwY9MDbKARYo6W/YWoY2351hxYTZ99jVo8nOW
         MGXKsL2p2/fnqrlM0AhYV0X3acQ4Q3OfSee4+hcIFSV9a3BbWTDsHJB1a8F7S3uq6LxP
         9AL1BT6Awg8HEk1ZkO/QP+B8JKlBzlu2VG6DPlamm4D83LTB/NEsah7f58B6w4uMKxKZ
         r0maE7VECMC1jinv52gR4f3JWMblO9vbXgbkMPd6F0EedkLczR2wWXEsHooWBOagABHh
         RBUg==
X-Gm-Message-State: AOAM533dL9tH2LrZH1krr+TXabTqxDRTRUHUxVL5YNvJJUUtDV2ghjUQ
        4TdqlHRJO5o80E5/ZIAg+wYlHUp5XycGnoJ0u9A=
X-Google-Smtp-Source: ABdhPJxhJ6XIgMZkykX0q6LKkg+XqIf6yV5QWjqHpjhh958/VnhHu75oSVQ3eWd7ZsZk7QkaX9LAkD8AB+WnADOHMu8=
X-Received: by 2002:a5d:6b0b:0:b0:1ef:d826:723a with SMTP id
 v11-20020a5d6b0b000000b001efd826723amr3871820wrw.420.1650635139265; Fri, 22
 Apr 2022 06:45:39 -0700 (PDT)
MIME-Version: 1.0
From:   Daniel Martin <consume.noise@gmail.com>
Date:   Fri, 22 Apr 2022 15:45:27 +0200
Message-ID: <CADscph1F4dgDTazbm=hNLNmBo+FMV=fdDsP-oqgJ30SeOhMApg@mail.gmail.com>
Subject: [BUG REPORT] usb: dwc3: Bug: Rock Pi 4 as gadget not working without intervention
To:     felipe.balbi@linux.intel.com
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi there.

I've got:
- a Rock Pi 4 https://wiki.radxa.com/Rockpi4
- it has a type A port for otg (Ouch!)
- it has an otg switch to set host or device mode (locked at device mode)
- kernel v5.17.3
- dt overlay to set dr_mode=peripheral

What I want:
- use the Rock Pi 4 as gadget device
- providing storage, whereof the target can boot from

What works:
- if the target is up, it'll see the gadget if I enable it (ls
/sys/class/udc > .../UDC)

What doesn't work:
- if the target is up, just plug in the usb cable (new full-speed
device, device descriptor read/64 error -71, ...)
- boot from the gadget

So, I was willing to capture trace events for plugging in the usb
cable, but there're none. Though, trace events work in general as I
get them, when I enable the gadget (target is up and write to UDC).

Anything else I could try? Or could this even be a hardware limitation?


Thanks,
    Daniel

PS: I hope that wasn't to briefly.
