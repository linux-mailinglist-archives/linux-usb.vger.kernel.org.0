Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46212463DC4
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 19:26:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245472AbhK3S3W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 13:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245421AbhK3S3Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 13:29:16 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074F0C061574
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 10:25:57 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so18922091pjb.5
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 10:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+XFZ/7apSqciTB8SgeOq+7j0rBhN15yTLitgOUm6lVc=;
        b=DaGNx4Oz4i4/FVePzIqdHdPZoCfYs+wrri/n8wQJJVwK3YSnoTV715bkaKjd/WMgZ2
         SbgLDJd96iVdq4NuunS35/rMR3+AgaqAHh6Yyj+XlQ+Z7jdO0x59F7kwMcBguEpqkIi1
         Qy5Th8i+1MwvBepn2QzmUqi73Zm4CtY1ZM1pw8tlorBRgooOyEVNbP9KE42uDGS1KmnG
         TrW+LrE37TIsHFOc2oX8uhueiFaFC3WMCj/vAOk7LsO/jJjP2OSCIzrmCpYlTlFyRVN9
         IzPQa3OUNl+tHEY/fDtYHuKnPRuuQqN5Ye0xupoC7nOwMeqAJnGGk8j0URCqv1q2H9mx
         Xkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+XFZ/7apSqciTB8SgeOq+7j0rBhN15yTLitgOUm6lVc=;
        b=YNqj4Nb2ahn/JlZfIp+YwObWxKcWOFxzCABUmu0V+fp1k1lIkeVlABaEZsCSWFMTDA
         8yMUjk4Oo1yqdrvY8cZz4h/xWcvoSVbl2zbHrvFT10RORhlfqsfWJfSsYDZ1OrMDWM3f
         fl0Nc7c825PPfpN23OLxjSVkyaLG+hgM4WJZNHIJL1zbB90Ea/3iVMBhPQmwRciufXWB
         VTBnZcT+op9xsHkr/AwuZajrGxvFrydHrVMib8M5fMPoXIp4iZ6TdKo8Kr/WqlIDw54j
         umA5xJS6CQsdfuZSZ9qPr3l+4cMSIQqxD1hkW/bkWVJNWColRBf/lEc5h2Tw5dMBw3gR
         5now==
X-Gm-Message-State: AOAM531tYlYSaeIVDXZ3Aj96+zM1Go1McYakPSg9CXiQrPOW7li9os7i
        QSNEiKzXMHY1z7VyWGghg0Sx6DNmqASj0X7/UzY=
X-Google-Smtp-Source: ABdhPJwrr1PrYfY7gDzdCOsrqtgVWXs1FdjLmMOYVwRGqxYoA9q4EWkqQInM8HpNdkCuYYa0hluBrltvdatgZzDtbhs=
X-Received: by 2002:a17:902:f2c2:b0:141:9ce8:930f with SMTP id
 h2-20020a170902f2c200b001419ce8930fmr814735plc.68.1638296756551; Tue, 30 Nov
 2021 10:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
 <20211125073733.74902-3-mika.westerberg@linux.intel.com> <20211126200150.GA21796@wunner.de>
 <YaRy6+3rwJx6YcKn@lahna>
In-Reply-To: <YaRy6+3rwJx6YcKn@lahna>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Tue, 30 Nov 2021 20:25:40 +0200
Message-ID: <CA+CmpXug9u2kVgLOgk2WaipQOMWjihYo2OwU61ghopUG1_iHhw@mail.gmail.com>
Subject: Re: [PATCH 2/6] thunderbolt: Tear down existing tunnels when resuming
 from hibernate
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Lukas Wunner <lukas@wunner.de>,
        USB list <linux-usb@vger.kernel.org>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andreas Noever <andreas.noever@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 29, 2021 at 8:30 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Fri, Nov 26, 2021 at 09:01:50PM +0100, Lukas Wunner wrote:
> > On Thu, Nov 25, 2021 at 10:37:29AM +0300, Mika Westerberg wrote:
> > > If the boot firmware implements connection manager of its own it may not
> > > create the paths in the same way or order we do. For example it may
> > > create first PCIe tunnel and the USB3 tunnel. When we restore our

the -> then?

> > > tunnels (first de-activating them) we may be doing that over completely
> > > different tunnel and that leaves them possible non-functional. For this

tunnel -> tunnels? possible -> possibly?

> > > reason we re-use the tunnel discovery functionality and find out all the
> > > existing tunnels, and tear them down. Once that is done we can restore
> > > our tunnels.
> >
> > Hm, what if the system is running from a Thunderbolt-attached drive?
> > Will the mount points survive tearing down and re-establishing the
> > tunnels to that drive?
>
> Yes, they should. PCI is waiting for the TBT to resume so it should not
> notice this, and all the data is at point still synced out to the disks.

But the user will notice the screen flashing, probably?
Maybe we can continue using the already established tunnels after
discovering them?
Is this because the FW might not support the same set of functionality?
