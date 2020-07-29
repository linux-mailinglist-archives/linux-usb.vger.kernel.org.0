Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31428231F28
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 15:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2NWN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 09:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG2NWN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 09:22:13 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 217BEC061794
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2020 06:22:13 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id z3so9125870ilh.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2020 06:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UCWyTb1UTyujoVaF6C3YpPKXd4JjrUv7/CB4E1zkf9w=;
        b=hKZrJADiVsm/IX/0/KeAKFW2lQUV7eHmkEUjKrW/O+KZ7kcJaEMn7TLakTNMIysjpx
         yNfxAf/UojmnXDuwarQCxQ5RmAbX5RLbF8TqjM8qw3AR1qygkhNH/kEg9/PfEktbRMWh
         nXjgl1BDNfkOSGvVBiI9SAlyaggS1CTf9XvKAt0Vvp2FIcIbmv03XHwN5fPEP428S4MS
         anTuaJmTPrsQz5h5hdPubCT4gCK1wP9wfeHVLR2Ox8/lJvy6qOSLJl4bh7YI3b5T/rM5
         j0t0GGLTEKOkksIU1vxNX3R6/Ut1Bqp8Av8HAZy4KP4+hsD+QU3ReKc+33q5C58NeotD
         0m0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UCWyTb1UTyujoVaF6C3YpPKXd4JjrUv7/CB4E1zkf9w=;
        b=A70MV6MNYnKs+3qDStyd1w8TLn5KCI/R3OUiwy0+Oj+729be7pBQVqeok4VF07gbKU
         zz5jFXg57qUd1jqy9imiX6l/YU1Hqsza9CihfnV7O7NJZflpuce0viJ5z6v0rmSfH3+R
         Xa1fLlMUdZSgujP3YoesHK7K0GIdU0auxfI5+yTm9l3RxeM2b8CpqsE7jMuRtNFoxz/o
         hnuGtkh6bYsS4PBDsteEhMPPMvuh31vaMM4aSjpacU+n2zIqiQC73mm/BPqGcHrX+f0S
         HyxNPQ80fpAiSdRe/WAwfzk/YwJUQSNiHSBpb5L9KztJM9OnUhJLok3w2cz4dn2D8exW
         WN5Q==
X-Gm-Message-State: AOAM5304LXdCztUTEFQPcKJJlT0Bcjz9qEzveI8T3jL96cu9BI9Y5kml
        vMgfCiC/g6yuv6pxuoQCEINve7aD+njv6WzM2FY=
X-Google-Smtp-Source: ABdhPJwz7AwbZaKcZG+071c5rlaimIUQzDi2+r2Ez7FbdmfHJm8QOAG5+VtfNRLP9LQef44ZP+WkP1quHRkUEA8ghk0=
X-Received: by 2002:a92:d607:: with SMTP id w7mr3268612ilm.149.1596028932333;
 Wed, 29 Jul 2020 06:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAO3ALPyB1JDvvC27JGgAoTuHh0w+897tPhmTKX9PQWBFCrrnbQ@mail.gmail.com>
In-Reply-To: <CAO3ALPyB1JDvvC27JGgAoTuHh0w+897tPhmTKX9PQWBFCrrnbQ@mail.gmail.com>
From:   "Oliver O'Halloran" <oohall@gmail.com>
Date:   Wed, 29 Jul 2020 23:22:01 +1000
Message-ID: <CAOSf1CEkHLamLXK3HOAZ+w0K=2hTOjn=x5KpDdmRZ4BXVy+P2A@mail.gmail.com>
Subject: Re: ASMedia ASM2142 USB host controller tries to DMA to address zero
 when doing bulk reads from multiple devices
To:     Forest Crossman <cyrozap@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 21, 2020 at 3:51 PM Forest Crossman <cyrozap@gmail.com> wrote:
>
> Hello, again!
>
> After fixing the issue in my previous thread using this patch[1], I
> decided to do some stress-testing of the controller to make sure it
> could handle my intended workloads and that there were no further DMA
> address issues that would need to be fixed. Unfortunately, it looks
> like there's still more work to be done: when I try to do long bulk
> reads from multiple devices simultaneously, eventually the host
> controller sends a DMA write to address zero, which then triggers EEH
> in my POWER9 system, causing the controller card to get hotplug-reset,
> which of course kills the disk-reading processes. For more details on
> the EEH errors, you can see my kernel's EEH message log[2].

Take the logged address with a grain of salt. If an error occurs while
translating the DMA address the PHB logs all zeros as the "DMA
Address" because it only keeps around the bits that it needs to fetch
the next level of the TCE table. The EEH dump says the error is due to
a TCE permission mis-match so odds the ASmedia controller is writing
to an address that's already been DMA unmapped, hence the logged
address being zeros.

Sorry, I probably should have mentioned that quirk in the last mail.

> The results of the various tests I performed are listed below.
>
> Test results (all failures are due to DMA writes to address zero, all
> hubs are USB 3.0/3.1 Gen1 only, and all disks are accessed via the
> usb-storage driver):
> - Reading simultaneously from two or more disks behind a hub connected
> to one port on the host controller:
>   - FAIL after 20-50 GB of data transferred for each device.
> - Reading simultaneously from two disks, each connected directly to
> one port on the host controller:
>   - FAIL after about 800 GB of data transferred for each device.
> - Reading from one disk behind a hub connected to one port on the host
> controller:
>   - OK for at least 2.7 TB of data transferred (I didn't test the
> whole 8 TB disk).
> - Writing simultaneously to two FL2000 dongles (using osmo-fl2k's
> "fl2k_test"), each connected directly to one port on the host
> controller:
>   - OK, was able to write several dozen terabytes to each device over
> the course of a little over 21 hours.
>
> Seeing how simultaneous writes to multiple devices and reads from
> single devices both seem to work fine, I assume that means this is
> being caused by some race condition in the host controller firmware
> when it responds to multiple read requests.

Most likely. It's possible it's a platform specific race with DMA
map/unmap too, but I think we would be seeing similar issues with
other devices if it was.

> I also assume we're not
> going to be able to convince ASMedia to both fix the bug in their
> firmware and release the details on how to flash it from Linux, so I
> guess we'll just have to figure out how to make the driver talk to the
> controller in a way that avoids triggering the bad DMA write. As
> before, I decided to try a little kernel hacking of my own before
> sending this email, and tried separately enabling the
> XHCI_BROKEN_STREAMS and XHCI_ASMEDIA_MODIFY_FLOWCONTROL quirks in an
> attempt to fix this. As you might expect since you're reading this
> message, neither of those quirks fixed the issue, nor did they even
> make the transfers last any longer before failing.
>
> So now I've reached the limits of my understanding, and I need some
> help devising a fix. If anyone has any comments to that effect, or any
> questions about my hardware configuration, testing methodology, etc.,
> please don't hesitate to air them. Also, if anyone needs me to perform
> additional tests, or collect more log information, I'd be happy to do
> that as well.

I started writing a tool a while ago to use the internal trace bus to
log incoming TLPs. Something like that might allow you to get a better
idea what the faulting access pattern is, but you would still need to
find a way to mitigate the issue. I'm not all that familiar with USB3
so I'm not much help on that front.
