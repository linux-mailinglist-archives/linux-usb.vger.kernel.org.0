Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63ACD6A0CF1
	for <lists+linux-usb@lfdr.de>; Thu, 23 Feb 2023 16:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbjBWPbT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Feb 2023 10:31:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbjBWPbS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Feb 2023 10:31:18 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D601992
        for <linux-usb@vger.kernel.org>; Thu, 23 Feb 2023 07:31:17 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id u14so9413576ple.7
        for <linux-usb@vger.kernel.org>; Thu, 23 Feb 2023 07:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RlUD2I8qnCEhr1yKXjLaGDMX7c9FUILAMvMdBO5sh04=;
        b=PsUN6Ig1WLeszukoDXwSBGuw3FEDH9XJjeVzBloQuL369tReMy8h30bFnkiWbEpQg2
         g72zQF29XpJUm0yU81rvyASaGNBpmohSwRM44bKgupaMGT7dSRG9lJtA07fLtjZDg+El
         8310hfnm/4gmYhJsRCbKYeHHT/5sodrGWRPXlYwc8iB6pDGB5jnUBwviJGDGiROwVf1v
         FD5CpKYA8lobK9jLEguLseuHALyG6ZN5lNuZvtOz5WfVtc7JDRd8RSlG3eAU6fWnVYjH
         07JfWaomZtid4RnVOi9bGH1fb7pgBePhvLKJ0YN23fhSHUNyJZxbF4G4DYZ+4SnSptsY
         oBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlUD2I8qnCEhr1yKXjLaGDMX7c9FUILAMvMdBO5sh04=;
        b=uBYelMIEtO9R9DAQis8/AJoH0tNQShcZ3AaHYmVq4MRZIhXFXrw4NsilvzLKOEhuOX
         fre1PUdaUyS42J1pc5ylgDd1l5+gX9sc6nrhrYapWJ2hsQlphCM9JwVLKob4I/UUnS/J
         d6ax8yoZfsBoWT1EoC9qmvd8TMp9Nib02j7lDY6x5XFl9aKe+sv9kIr/ximwa5bdQ27X
         6c8bcM9SjTuQZ5rKIQgMMBVCKv34Q4cujO3tEO9i6x6fXGcIXeY+83n578Du+LYJe8Lx
         KUkHkaPqF/GhmR3i8OE7imufbJCRvaCu010yk/cHoH6BZRuVWD8yuG3sULve+wZhZKek
         ldrw==
X-Gm-Message-State: AO0yUKU/+6kxGv/omdi6aYz7hkgm/2DZmiHcEh1xxFDShVdHxP8OvgZ/
        gB7YZwEYN4T1RpW/ADyuABnARnL9kq/BX/TILiY0kF41T74=
X-Google-Smtp-Source: AK7set+92+JPbq2HRYrMVNVGOx9NbyUffogUld+qAeIcg6A+BilyFiJqpBzcFqbjdS2E/N0yy8VVeIeRasom2Yi3b28=
X-Received: by 2002:a17:903:1d1:b0:19a:9375:186a with SMTP id
 e17-20020a17090301d100b0019a9375186amr1944999plh.5.1677166276792; Thu, 23 Feb
 2023 07:31:16 -0800 (PST)
MIME-Version: 1.0
References: <CA+JN8xMXu=sVQ2nyR9SgF25fquCZhH43wdsnuvfjDu+yGRv2yA@mail.gmail.com>
 <b13655bf-4a04-bece-71e4-698bfec83e2d@linux.intel.com>
In-Reply-To: <b13655bf-4a04-bece-71e4-698bfec83e2d@linux.intel.com>
From:   Seth Bollinger <seth.boll@gmail.com>
Date:   Thu, 23 Feb 2023 09:31:05 -0600
Message-ID: <CA+JN8xOOyU8yLJrxnKPwAMhQFKE70rTi=aLa3Adt7Og4dfPRVg@mail.gmail.com>
Subject: Re: HC died
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, sethb@digi.com
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

> > We're experiencing a problem with our devices in the field where our
> > customers attach problematic USB devices that are causing the xhci
> > host controller to shut down with the "HC died; cleaning up" message.
>
> Is this seen only on some specific xHC host controller?

I don't think so.  We've seen this on pcie attached asmedia 3142 and
NXP ls1012a/ls1046a SOC controllers (which I think are dwc3 IP).
Strangely the timing seems to be much easier to reproduce on the pcie
attached asm3142.

> > I've narrowed this down to a timeout of the address device TRB on the
> > command ring (currently 5 seconds).  It sometimes takes our hardware
> > 9.6 to complete this TRB.  When the driver is trying to stop the cmd
> > ring, the controller is busy for an additional 4.6 seconds.  This
> > results in the "HC died" message and shutdown of the host controller.
> >
> > If I bump the command ring timeout beyond the max TRB completion time,
> > the host controller continues to be responsive and doesn't need to be
> > shut down.
> >
> > My knowledge of how the usb protocol should handle this problem isn't
> > strong enough to know if there is a better solution than simply
> > increasing the command ring default timeout.
>
> Are these problematic devices USB 2 or USB 3 devices?

Both.

> You could try playing with the Address device command BSR (block set
> address request) flag and see if helps.
> Xhci has two ways to get a slot from the Enabled to the Addressed state.
>
> option 1: move slot from Enabled state to Addressed in one go:
> Enabled --(Addr dev cmd, BSR=0)--> Addressed
>
> option 2: move from Enabled state via Default state to Addressed state:
> Enabled --(Addr dev cmd, BSR=1)--> Default --(Addr dev cmd, BSR=0)--> Addressed
>
> I think the usb core "old_scheme_first" module parameter will end up doing this.

Apologies for taking so long to respond to this as I've been a little
busy this week.

I tried setting old_scheme_first and this didn't have any effect.
Here's the kernel log without my patch to track command ring TRB
completion times (as well as extra debug disabled).

kernel: usb 3-2.1: new high-speed USB device number 4 using xhci_hcd
kernel: usb 3-2.1: New USB device found, idVendor=058f,
idProduct=6387, bcdDevice= 1.03
kernel: usb 3-2.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
kernel: usb 3-2.1: Product: Mass Storage
kernel: usb 3-2.1: Manufacturer: Generic
kernel: usb 3-2.1: SerialNumber: B1EC2EB2
kernel: usb 3-2.1: USB disconnect, device number 4
kernel: usb 3-2.1: new high-speed USB device number 5 using xhci_hcd
kernel: xhci_hcd 0002:01:00.0: Abort failed to stop command ring: -110
kernel: xhci_hcd 0002:01:00.0: xHCI host controller not responding, assume dead
kernel: xhci_hcd 0002:01:00.0: HC died; cleaning up
kernel: xhci_hcd 0002:01:00.0: Timeout while waiting for setup device command
kernel: usb 3-1: USB disconnect, device number 2
kernel: usb 3-2: USB disconnect, device number 3
kernel: usb 4-1: USB disconnect, device number 2
kernel: usb 4-2: USB disconnect, device number 3
kernel: usb 3-2.1: device not accepting address 5, error -108
kernel: usb 3-2-port1: couldn't allocate usb_device

If I push XHCI_CMD_DEFAULT_TIMEOUT beyond 9.6 seconds, the HC will
continue to function normally.

From a quick web search, I can see that other people are experiencing
the same issue.  None of those threads offer any solutions.  Many seem
to revolve around disabling usb power management, and this did not
help in our case.

I wish I could gain some insight on how the hardware is handling this edge case.

> -Mathias
>
