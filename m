Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3A8C5AE8E3
	for <lists+linux-usb@lfdr.de>; Tue,  6 Sep 2022 14:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbiIFM5h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Sep 2022 08:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbiIFM5g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Sep 2022 08:57:36 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71E71C2
        for <linux-usb@vger.kernel.org>; Tue,  6 Sep 2022 05:57:35 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AD2663F1A5
        for <linux-usb@vger.kernel.org>; Tue,  6 Sep 2022 12:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1662469052;
        bh=ZeMz6vTV3Lb+O6ntJe36FQ693bLtRnNCDnuRRDRkmJ0=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=pwSAfISoJOLtn1Bq7qOy0dEzbbLI3DuIzvvxFVd+/Dg/+6yoSsr8c6BZ5MskSSn+C
         UWqat1E9+F/1FP3TVHsFmnHqhg6vaWUNkj7rwUnagy1556aIof/Y/E5cbiWDJb41xb
         64F+A9+6sWuvJ4rFJhOdwSS8QaNMeFVzMH+s1ryP4THQ7ji3JhcZGsdY28mkbD5zNa
         +sUqzvEl8IVOZmc8S6REwXMJ83nNOCzkk5fHThZ5ye6C6vhkUEMvTZXYyQYrGDoj9U
         5ZbMMKqIuGstEsGJvq5CnLfWmbPs2X3GKmhOxpIcdv7p3zrNi2V5PWNDRSBopnA2wK
         g3LlHP3BZeOkw==
Received: by mail-wm1-f72.google.com with SMTP id c64-20020a1c3543000000b003a61987ffb3so6253976wma.6
        for <linux-usb@vger.kernel.org>; Tue, 06 Sep 2022 05:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ZeMz6vTV3Lb+O6ntJe36FQ693bLtRnNCDnuRRDRkmJ0=;
        b=5FMcmlQ5X6toCfSw3p8r9TQ46M0Ro1K0BWOKjEBJlV5cgU4boWeBHeGHmlL9Lkh8Ib
         boNT/UmEQZDSEqH4xNsJ+Dt1ZYboKj909irukt8u3ZDCykKIxOEie+SEi3/PSL5YAAmO
         269HM0UzXOywLHgNfxlQDGAkATDNxtzoCu3tUkpWaIY/V30jPbaZNUrfkPXRnMK3URmt
         jj76l+nKwp2xBqD0V+wf01enOVElap88D2mSWZeTudv0B5gU59d/VvUzcXDFoE40BIYD
         KK6cmWX+MHPvLXMOt3Ehe8mbP7rYdeC0vZlJPS1p1iqUisqHKCewR0urp0Tzt62H5S0C
         N2Pw==
X-Gm-Message-State: ACgBeo219M/Ne9TmhPtyH+NEGW+lEQ6260uyNyaYvuDO+i99qtkY5c23
        O2O4hi1UfsYwE3Zjt0wdtShu4XdnBfucWL+Dp3cisHn4xxoAKByZutwEetLGc51Fr2ocE8Whb5N
        mKKtndwrnFOjyyqasa1RukKKktQta5YlocZdBWJCwNoaxLVkkLNUy1A==
X-Received: by 2002:a05:600c:1f11:b0:3a5:3df9:4859 with SMTP id bd17-20020a05600c1f1100b003a53df94859mr13322117wmb.175.1662469052342;
        Tue, 06 Sep 2022 05:57:32 -0700 (PDT)
X-Google-Smtp-Source: AA6agR65rWPT4NVP08yn563SnrAJ/I0xVzrfQgfTxoESTNMcEcebJlUJ23IE046tww33H8VYNhfbpKWUqYOa+yUYjMw=
X-Received: by 2002:a05:600c:1f11:b0:3a5:3df9:4859 with SMTP id
 bd17-20020a05600c1f1100b003a53df94859mr13322100wmb.175.1662469052047; Tue, 06
 Sep 2022 05:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220905065622.1573811-1-kai.heng.feng@canonical.com>
 <YxWgGKIAvsxwSz85@black.fi.intel.com> <CAAd53p4iV=ne5bDGZ6FxE9bBUVoFh=eXF9_oMPvPzjVj=UVoog@mail.gmail.com>
 <YxWqSYDWe0NitSkL@black.fi.intel.com> <CAAd53p6bSmTPavjA0v6tybc6=HrwiDn0JGzXwVOG_m5EVw1p1w@mail.gmail.com>
 <YxYXH5dqKqPANeVX@black.fi.intel.com>
In-Reply-To: <YxYXH5dqKqPANeVX@black.fi.intel.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Tue, 6 Sep 2022 20:57:20 +0800
Message-ID: <CAAd53p5tYG=mAR-RSr1g_iznmmcCy1QpthG5vQzr99AP4QLJyg@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Resume PCIe bridges after switch is found on
 AMD USB4 controller
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, sanju.mehta@amd.com,
        mario.limonciello@amd.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 5, 2022 at 11:34 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Mon, Sep 05, 2022 at 11:21:36PM +0800, Kai-Heng Feng wrote:
> > > Hmm, so you see the actual hotplug but the tunneled PCIe link may not be
> > > detected? Does the PCIe "Card Present" (or Data Link Layer Active)
> > > status change at all or is it always 0?
> >
> > It changes only after tb_switch_add() is called.
>
> I doubt tb_switch_add() does anything but instead it is the established
> PCIe tunnel that then shows up as it toggles the Card Present bit or so.
> But that should also trigger PME if the root port is in D3 so you should
> see this wake if everything works accordingly (unless I'm missing
> something).

You are right. Sometimes it may still fail to detect hotplugged device
right after tb_switch_add().
At which point PCIe tunnels are established? Is it after tb_scan_port()?

I found that it's cleaner to wakeup hotplug ports via iterating device
link consumers at the end of tb_scan_port().

According to your commit b2be2b05cf3b1c7b499d3b05decdcc524879fea7
("thunderbolt: Create device links from ACPI description"), it states
"The _DSD can be added to tunneled USB3 and PCIe ports, and is needed to
make sure the USB4 NHI is resumed before any of the tunneled ports so
the protocol tunnels get established properly before the actual port
itself is resumed. Othwerwise the USB/PCI core find the link may not be
established and starts tearing down the device stack."

So isn't waking them up a logical thing to do here?

>
> So if you do this:
>
> 1. Boot the system up, nothing connected
> 2. Plug in the TBT/USB4 device but do not authorize the PCIe tunnel
> 3. Wait for the TBT/USB4 domain to enter sleep (runtime suspend)
> 4. Authorize the PCIe tunnel
>
>   # echo 1 > .../authorized
>
> The established PCIe tunnel should trigger PME and the root port then
> should be able to detect the PCIe link. Can you add full dmesg with
> "thunderbolt.dyndbg=+p" in the command line to the bug?

dmesg attached. Unfortunately there's no PME.

Kai-Heng
