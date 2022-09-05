Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7685B5ACCC8
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 09:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235980AbiIEH3h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 03:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237238AbiIEH2A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 03:28:00 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BE3267C
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 00:26:43 -0700 (PDT)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C68843F466
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1662362801;
        bh=ThEpzsYAWPQ+vR3sDdfrBp9HRNSWWVxORABQ85lL8jw=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=TFhNx7lJO9eK+vUyOGCquUQg6dC0NTczO8KQeutShvjeM8fCkOcih76XU2dbGjDp9
         1MNqEHvhH9FUnO1tpuVXhCylMmrc7FZNaNR3Nb+fA55VzQIjuRGqENEoGUvlfGUBpA
         63dR5FA5VFPMumAN3KtLsrL6vp18MHKvlF+ytOqqSjfMBw91TCwrAobnxPrr/TsRA+
         GW+m9cyt0XkigCPqdL4VXn4kV1dUHClREdw+X2utrne9GIxqCKS1F+A0J+hFyvyL6D
         UfZAXjpjWntF2Q1JBy3x+tISmsLp+T7jbyt9u6NsePU8oVgnoZjanriovKgh++Araj
         FQoWc9047St1g==
Received: by mail-wm1-f70.google.com with SMTP id c64-20020a1c3543000000b003a61987ffb3so5000404wma.6
        for <linux-usb@vger.kernel.org>; Mon, 05 Sep 2022 00:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ThEpzsYAWPQ+vR3sDdfrBp9HRNSWWVxORABQ85lL8jw=;
        b=f3YVaIDitxEdteQ1nzuxoc5tmLHovMR/Ecf0LlRuknsZ/lbaPpbS2+vgTUKUP4wsZF
         mbMBUnJS+pgsqYslWrqROFNWCfvTjG0yvYLx7/sY0acxJ+hq6dX4quzQEVW51ETy+D+0
         xqL4oB7fo2jPqs03ETFVQZbfegTo0AeDVUQAsmNbo+9HYiy08iN5pp8OAcElbnN34zfr
         rbupG9SqiW6oCf65AqW8kKpl0BJxbNHz73RiYM4Ra9MJ3m7TtO8y23FZmsppZDtAOfWZ
         Bjxwsg6bySGr1YAsTB0X8RUWzUX3acKdJTjxKMePaaocCfkf4N55ZV2jq44yCg44lsI/
         cNCQ==
X-Gm-Message-State: ACgBeo0M0KxvrUsNLh6K51X1qIHfnkFDKWgQM70jh7bVdiZl2p+Gs6Ov
        B7PXymQsp+OqwDCSd+jf1V0bhid1U4pXDR01YQcdi8YFtOtXPDopNjp8Ke/ypeiEh/VvO68BXKs
        YgNW17pLSPYXAfScADYk2gtJjg0msBafiFGiW16JtKT60zA+zd36KsA==
X-Received: by 2002:a05:6000:2c5:b0:225:618e:1708 with SMTP id o5-20020a05600002c500b00225618e1708mr24710037wry.510.1662362800179;
        Mon, 05 Sep 2022 00:26:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5DNgFlxvyoZfpOOUELTnOafjMuqQXkJ0hW4QhgYWzp8crxxH1IY+naMUchHq1loiOEaiVzWAi+X0elo/b3/Oc=
X-Received: by 2002:a05:6000:2c5:b0:225:618e:1708 with SMTP id
 o5-20020a05600002c500b00225618e1708mr24710018wry.510.1662362799922; Mon, 05
 Sep 2022 00:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220905065622.1573811-1-kai.heng.feng@canonical.com> <YxWgGKIAvsxwSz85@black.fi.intel.com>
In-Reply-To: <YxWgGKIAvsxwSz85@black.fi.intel.com>
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Mon, 5 Sep 2022 15:26:28 +0800
Message-ID: <CAAd53p4iV=ne5bDGZ6FxE9bBUVoFh=eXF9_oMPvPzjVj=UVoog@mail.gmail.com>
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

Hi Mika,

On Mon, Sep 5, 2022 at 3:06 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Mon, Sep 05, 2022 at 02:56:22PM +0800, Kai-Heng Feng wrote:
> > AMD USB4 can not detect external PCIe devices like external NVMe when
> > it's hotplugged, because card/link are not up:
> >
> > pcieport 0000:00:04.1: pciehp: pciehp_check_link_active: lnk_status = 1101
>
> I think the correct solution is then to block them from runtime
> suspending entirely.

Do you mean disable runtime suspend completely? Or just block runtime
suspend for a period?

>
> > Use `lspci` to resume pciehp bridges can find external devices.
> >
> > A long delay before checking card/link presence doesn't help, either.
> > The only way to make the hotplug work is to enable pciehp interrupt and
> > check card presence after the TB switch is added.
> >
> > Since the topology of USB4 and its PCIe bridges are siblings, hardcode
> > the bridge ID so TBT driver can wake them up to check presence.
>
> Let's not add PCI things into TBT driver unless absolutely necessary.

OK. It's getting harder as different components are intertwined
together on new hardwares...

>
> At least on Intel hardware the PCIe hotplug is signaled by SCI when the
> root port is in D3, I wonder if AMD has something similar.

Yes those root ports are resumed to D0 when something is plugged. They
however fail to detect any externel PCIe devices.

Kai-Heng
