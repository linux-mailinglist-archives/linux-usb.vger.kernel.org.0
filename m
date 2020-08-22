Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56C024E92E
	for <lists+linux-usb@lfdr.de>; Sat, 22 Aug 2020 20:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgHVSCg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Aug 2020 14:02:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbgHVSCf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Aug 2020 14:02:35 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2588EC061573
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2020 11:02:35 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id m34so2524478pgl.11
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2020 11:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Z1rjGHQ7FHp41iM5QVhuNm4VchpoAYic+PxeEOffWjs=;
        b=CwpPubFfom872QZ32UBsHj2mR0UOe+5olOHPZzdKvOfUIVSyi/oS9TfeYHzQVc4F31
         rlbSOERoNSDzkpWYdnQ5oJNa32z3+tT2LeTuVmd2yNB5CAroffMZOLgaDebZZupILhFU
         A2Ij3o5lUKlOxBtY1WAXkdO0UVkJB3S50HEASW/ccrIjnIAG+dt+zLxCp2FW8+cuLwYH
         8UcNUkkmuZj4VE7rRwqcF23p5ed5q9eUhvn8tVGFqXm9zFvOHDOlP6z02mPrJMpgdw9F
         FwZFI3JJ/7QEU64/ChfdiYls+yPdz+3pJZJQGQfoa4qUlVGmqcsytlgbu9RpR17pTDJm
         q+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Z1rjGHQ7FHp41iM5QVhuNm4VchpoAYic+PxeEOffWjs=;
        b=mUxc+P5STCMdIW5U3ZAhFycJLNMbpVfBXVj1rDAMJcfE1Ti/V40sqeKdc/ZIuEuXLA
         gXLvC7Ur67J7UTfGQlKXJEc4DAwhdFz7rPi2FPQYwvG86CvdjCWbd92rb75lw9PLNUed
         5E/5cMIBZskb2KC5VP49DoV6h2o4aY5WUHIExT40G4L9t5HANV5q4gyPDRjGeTOZYreb
         K4k3IVO/gtWnYEnKaWYE5MKUp16dTAIA1RtDXdle8/TIrdzswS9NV9UqbZLCa/yqM6eH
         XNZHsGBJsOT1mH1aQf5lH/CEJoxXvGdmM8yCzIVf7Hkmt3rkPmCAGL7JE751PsY3XXi/
         WJfA==
X-Gm-Message-State: AOAM532sxNlSBp4VZGtiZXSZEbbEKcGJyO3a3ZqOGaa1w9NzAHrTnKPw
        7mFWMp/3Ev5TxdaM0NjrJH57/JIpLEvj3x0RaBglaUamxS00Rw==
X-Google-Smtp-Source: ABdhPJxU3EvJi1KCg+aM6zPY+SksPA6oSQgQAYGlqftdzuBLuzSjqMgrgAhqxhFievtzOTYgG8Tn5EnOJpbpVPaDg3k=
X-Received: by 2002:a05:6a00:2247:: with SMTP id i7mr6901058pfu.217.1598119354321;
 Sat, 22 Aug 2020 11:02:34 -0700 (PDT)
MIME-Version: 1.0
From:   yunhua li <yunhual@gmail.com>
Date:   Sat, 22 Aug 2020 11:02:16 -0700
Message-ID: <CAMqbrUhE-D3QoeUkr=FnTks_a+KRxLpScghMefEZp9GHD55E_Q@mail.gmail.com>
Subject: XCHI bulk transaction latency, data lost, NAK stats
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello all
For USB Bulk transaction,
1. If there are NAK, and retransmit happens on a physical layer, does
XHCI provide any statistical counter, e.g. how many retries for that
URB, how can I get those counters or enable it for that TRB?
2. If Data is lost, XHCI have to resend URB request?  how long it will
take before it resend URB request?  Is that a configurable timeout on
XHCI spec?

The following are some  background of my question.
I have a XHCI USB Host controller, there are 4 ports. I only connect
one port to a USB 3.0 camera.  and running program keep reading data
from device, guvcview -d /dev/video0,
the camera keeps sending 30 frames/second, normal within each frame,
XHCI driver sends URB request -> Device response URB, response time is
about 10 ~ 200ms.
Some times, the response time takes 20 000 ~ 200 000 ms, as a result,
the image gets corrupted.
From the USB device(Camera) firmware debugging tool, I can see that
the Device actually did submit DMA in time, when this big latency
happens firmware will complain, DMA buffer overflow.
looks software works correctly on both sides.
I'm trying to understand why the latency is not consistent?

3. I have 4 USB ports on the XHCI host controller, but only 1 device
connects,  does other 3 empty port take any USB bandwidth?  is there
anything related to bandwidth allocation I should look at it?
4. anything related PCIe I should look at? I enabled PCIe error
reporting, No error found?

Thanks.

Regards
Yunhua
