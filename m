Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E94A724E9F0
	for <lists+linux-usb@lfdr.de>; Sat, 22 Aug 2020 23:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgHVVLU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Aug 2020 17:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgHVVLS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Aug 2020 17:11:18 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBBFC061573
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2020 14:03:18 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id r4so2436088pls.2
        for <linux-usb@vger.kernel.org>; Sat, 22 Aug 2020 14:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l7gMdYZNYHXjHp1noV56GGci5GkJK8LMJSK7LEkgtmw=;
        b=jSUnOQ82bSdZw/nymHozRlKs/LPDyANWuXKrru1h4OKkEbXGW8QrVtoUWfG/b8hZW8
         LmNy3iCbnYfofiSnfoPVcrFE4UADU64GVRCUr3+NXdcJHoxRh3yxACpcmbRbYOE6V+e/
         yXksWpAdoQPd0cW8fYkvJhGZ24Ai4C1+s4mNWycjIWYbbGs4enayvAKaxY0DtyzfNHzH
         rWbq1CcCcp/suayxlncWAnD1KAOvEaksLjx1/oyxqhspwBx3wvnXEE1FiL3QW1Ourt95
         uIVq1FtGBsUuq3o8RiW8I0SgxSMK0saNWaeHTjBPAirK1OkS1toYCF90BFYB/WpySScF
         q11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l7gMdYZNYHXjHp1noV56GGci5GkJK8LMJSK7LEkgtmw=;
        b=QIOycG4uZ/4Hb3JWOQoZBBSd3QH6nz8j2xkb46Fi9pSomA/E5k4cBJXh6aLr/ES1kZ
         sqMZIuCgbfB1xSXt4okvGv73Q7k5ZvY47PODPu46D00hD6ZoxJcbg20shj4tEx9TY9j1
         s9knTMpT+XyWg4PO4/915n8G8KUCRtB6HLjn6t72EZwYGb++YcgLOmBrsitL8yw+bhWE
         wW2RBMfsfb62HH/71NQ95EixVBwpXQay6l5+syZhCmx/Mq0kdbdHDzEjSaostPjDyPAM
         uY6E72kxev3qE+QFQoECB0rh+C2E4lnG5gc0nVdkK0ay1v5cycPTuqS42JHP5vmSzXAG
         ylvg==
X-Gm-Message-State: AOAM5335m0BDeAeTuaT6H8S1DoToEjbJnOZTXhEUrqTOc5UysfVZECUj
        8RAXAucTzCoSYZecBJQUSLM3GxT0kuLVi/aMR2GKnnnUu5zTTw==
X-Google-Smtp-Source: ABdhPJxofM6y7L9l1aUwowtc1xBM4g2ysz+6zo9TuaC7uqMMwmrx44ItxrZH/YgT3PBS9UivKga02W6jETaU4Pr0ZI0=
X-Received: by 2002:a17:90b:238d:: with SMTP id mr13mr6727202pjb.132.1598130194197;
 Sat, 22 Aug 2020 14:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAMqbrUhE-D3QoeUkr=FnTks_a+KRxLpScghMefEZp9GHD55E_Q@mail.gmail.com>
 <20200822200107.GA288350@rowland.harvard.edu> <CAMqbrUiRfk7uy+oPwwsvjL+CZNGEFGonGRx5LMGyQ7UTwrPA8A@mail.gmail.com>
 <20200822204107.GC288350@rowland.harvard.edu>
In-Reply-To: <20200822204107.GC288350@rowland.harvard.edu>
From:   yunhua li <yunhual@gmail.com>
Date:   Sat, 22 Aug 2020 14:03:02 -0700
Message-ID: <CAMqbrUhtoZxg--Gp0un=sKYBWfmtmNMYR+8rvyRHxdKsjWY73w@mail.gmail.com>
Subject: Re: XCHI bulk transaction latency, data lost, NAK stats
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks, Alan, your answers are really helpful.
one more question:
> It depends on what other devices are attached to the USB bus.  They may
> or may not require some reserved bandwidth.
Is there any tool/method I can dump reserved or allocated bandwidth
info of each  USB device?

Thanks
Yunhua

On Sat, Aug 22, 2020 at 1:41 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Sat, Aug 22, 2020 at 01:35:28PM -0700, yunhua li wrote:
> > HI Alan Thanks for your response.
> > > What is the communication speed of the camera?  480 Mb/s (USB-2), 5000
> > Mb/s (USB-3) or something else?  And how much data does the camera send
> > for each frame?
> > It is 5000Mb/s (USB 3.0),  each video frame is about 2880000, 30 fps.
>
> So at 500 MB/s, and with less than 5 MB/frame, the expected transfer
> time for each frame is under 10 ms.  30 frames per second should be
> fine.
>
> > > 20 - 200 seconds?  That's an awfully long latency.  Much longer than you
> > would expect from random fuctuations; it indicates that something is
> > going badly wrong.
> > Sorry it is 0.02 ~ 0.2 seconds delay,  when image got corrupted,
>
> Okay, that's more like what one might expect.
>
> > > It depends on what other devices are attached to the USB bus.  They may
> > or may not require some reserved bandwidth.
> > There is no other USB device connected to the system.
> > if no other USB device, and no  Isochronous transaction, Bulk
> > transaction (This camera) should be able to use all bandwidth, am I
> > correct?
>
> Yes, that's right.
>
> Alan Stern
