Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B301E6D70
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 23:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407564AbgE1VRF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 17:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407473AbgE1VRB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 17:17:01 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD60C08C5C6
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 14:17:01 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id f7so1204453ejq.6
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=cn1mHaca1pWPIbpDyEDw+k1HPtCEUzvmOkTgZBkrGPI=;
        b=FjpabXv+ge2BYaoQonkw0ro+9+QVeuy2pn+Bqaz25vxAgvJ0KYxsIgvqBuImDgy25U
         IBMfBkeFxBDd63uQnJY8Y80GAnVnTv+fWi1W5kaVgndnz/wKz4aZl8uxCHATzoj+9FJ4
         XeQTM9siRp383ficziPVgciySfbUBs9xXbg4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=cn1mHaca1pWPIbpDyEDw+k1HPtCEUzvmOkTgZBkrGPI=;
        b=JYAr2TnOK1EVkBJWv1V74a1XRk2ScBd8pwt9qTNLKH7B+tfkAx15awSDrQDUhXJJkt
         ASPUc9JiPZoLVEfTbBrURRsNNAxaR7nCHjGqHZFxe2JPpoSBYga6bATCCHkuATR2D1Hv
         5mff5ccFo++c2b8+dAIr4tXsrssKqbc8E2fIleRucQR5NcLe7ue2DG8aPVE/5cZ+qitP
         bcf3zaL6wyKnyvUJrDS8HX2zcKCzHu3B+lG6VXbTXcyWULD1VlbMt0pKeJT4uzrkJ735
         4auduyATPHfbEmLapI9H9sKnVaIk8u3+r0/e6aGu17ONkTwkbXqTH+dfd5G12btbB+l5
         MM8g==
X-Gm-Message-State: AOAM533L1v73HO7uU7OuirWDjwgSX6SUAAgqqyjiAg6WQyrZNqkCZd5z
        h/89EYKfSab+qPxySyz/Tvf6kurIwJI=
X-Google-Smtp-Source: ABdhPJyIJAqM7g3kF4k7FsskCNTvhcrEU1Bb2PLorv+HApYH3Z0VCe4HU2vCWCEvqIQmmnEVYo9DCg==
X-Received: by 2002:a17:906:b2c6:: with SMTP id cf6mr4902473ejb.210.1590700619514;
        Thu, 28 May 2020 14:16:59 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id ef13sm5956012ejb.24.2020.05.28.14.16.58
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 14:16:58 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id x1so1474778ejd.8
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 14:16:58 -0700 (PDT)
X-Received: by 2002:a17:906:3041:: with SMTP id d1mr5028045ejd.7.1590700617924;
 Thu, 28 May 2020 14:16:57 -0700 (PDT)
MIME-Version: 1.0
From:   Alexandru M Stan <amstan@chromium.org>
Date:   Thu, 28 May 2020 14:16:21 -0700
X-Gmail-Original-Message-ID: <CAHNYxRzH3F7r4A3hOJYWw8fwoSLBESyyN7XQ4HYfw1Y3qoNbJg@mail.gmail.com>
Message-ID: <CAHNYxRzH3F7r4A3hOJYWw8fwoSLBESyyN7XQ4HYfw1Y3qoNbJg@mail.gmail.com>
Subject: Splitting 1 USB port between 2 devices
To:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Evan Green <evgreen@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I'm currently helping to design the hardware for yet another chromebook.

The particular SOC (and most other alternatives BTH) we're using has a
limited amount of USB controllers available, usually just 1. Being a
chromebook we have quite a few needs for USB though: 2 type C ports,
pogo pins for a connected keyboard, 2 cameras, a type A port. We're
probably going to have an internal hub no matter what, but it looks
like even a 4 port hub might not be enough, going to yet a bigger hub
(which might not be as power efficient) is not ideal, chaining hubs
that are builtin is also meh.

I noticed that some of our cameras use the USB3.0 lines only. Other
cameras, since they're lower resolution ones use only USB2.0. I
wondered what would happen if the 2 types of cameras were to share a
port, since none of the data lines are common between them.

I've built a little contraption to test this. It seems to work as
intended. Both usb cameras seem to enumerate, I can even stream from
both at the same time with no problem. A macbook seems to also kind of
work (I can't stream from both for some reason, but i can open either
I want). I can upload detailed lsusb outputs if needed.

My question here is: is this legal as far as Linux is concerned? Can 2
devices be enumerated under one physical port (even though we're
talking about separate usb2.0 and 3.0 bus topologies).

It seems to work so far with our linux 5.4 chrome os fork (which as
far as I know is identical to 5.4 LTS for matters concerning usb). But
the question is would this keep working?

Is there any weird port reset interaction that might be annoying here?
I wouldn't want a reset on the usb 2.0 device to affect the 3.0
device.

Is there any other higher level port management going on in linux,
where there might be plans to keep track of things, but it's not piped
enough to see it affect (negatively) this use case.

If this is ok, was something like this ever done before?

Bonus, maybe unrelated, question: I've wondered in the past if it's
legal to route 2.0 and 3.0 lines through different paths.

For example, imagine I had one of each:
 * 2+3.0 controller
 * 2+3.0 device (eg a 3.0 type A port)
 * 2.0 device (older usb device)

Would it be legal to use only a 2.0 hub, with the 3.0 data lines for
the 3.0 device bypassing the hub. This would be cheaper than having a
fully fledged 2+3.0 hub with the second port's 3.0 data lines wasted.

Thanks,
Alexandru Stan (amstan)
