Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A77C7514A51
	for <lists+linux-usb@lfdr.de>; Fri, 29 Apr 2022 15:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359713AbiD2NSF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 Apr 2022 09:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbiD2NSE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 Apr 2022 09:18:04 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90EEC6F20
        for <linux-usb@vger.kernel.org>; Fri, 29 Apr 2022 06:14:46 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id p189so4610290wmp.3
        for <linux-usb@vger.kernel.org>; Fri, 29 Apr 2022 06:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E2IokFAYZvJQSN7NHO1G8+W0iXTmZ5AnRwqosR6Aavk=;
        b=kEjGl0uioQa0JNRlNoet1ZeU5pxph/wlK1V/eeI2r5YWvYNElEz7x7kzzUkP0sd8Or
         u24T6Cq8Hy0DUaWIogNHz6XdY0WRIfreaKq5dqLOhSrCVuKKcLSejnss3g5EFFFh2CST
         9D68xKeupnnprPeW3WDY7vbAIiDw4YgsAJd/ru06efOug5SteazHZRMFQ8oJIYaEXGgE
         rvKPEn94az9EJskDj3pAq7aVmEPWFTx8/L7VkmFXbF9lxh4JR8wVResj/6Cc5SIneWJ+
         GqOPQgCedYV4oQZZ2o+HOrD6EDjbsjIzHaERMvoXDCzgi3mEmKhj/p8Jzi75Tal2QgS6
         Hsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E2IokFAYZvJQSN7NHO1G8+W0iXTmZ5AnRwqosR6Aavk=;
        b=idTVefdxGVd8Rd16sFoUXYKkIQNLCy1HozxPT7poa4GWk+qWOaw7t+I7dUoltAZN21
         jYEcljaojrdemOb2pRFWD/88vztP7EB4QcUsu7KuBsM/lSAaq9r8a98sdzpT6bhO5HmF
         +1JJ0Tl9dYQDN3vy6VbrgC6U0WFT26K95EIA4N+NMR5fCtHwekvJfIyqAhIZEO/2VkXL
         cp02Fw+/fJWiC7X8dD4m+OeF/MxZA4toHF6BoL4iaBanA596+FJ6RmVQ7EaUlUnITlGC
         eJiN0N5H+BQ9ixx9gG/zfuARkVD2XF/NLLEaNzFvq5bsVIApz7XP5q2jdZTCVYYSvlEM
         q9Rw==
X-Gm-Message-State: AOAM533fhs5owqZoow5oQnYggXFh41GyX2aisMculI1yQ6+TGMADm4ab
        1QXHsvA0vVyWnQgGFIUfMBXZY8qIt29rni2sJXNXhq4VpNg=
X-Google-Smtp-Source: ABdhPJy0xfGAZsXsTqdhTJktoof4yMEcXibwVwsl2Cy5gNvCXM+9MBeh7J03kFmwDl1KYp9eDW5FoOoArJxIBFaSFOg=
X-Received: by 2002:a05:600c:1f0e:b0:392:8b04:9b26 with SMTP id
 bd14-20020a05600c1f0e00b003928b049b26mr3161690wmb.106.1651238085270; Fri, 29
 Apr 2022 06:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <CADscph1F4dgDTazbm=hNLNmBo+FMV=fdDsP-oqgJ30SeOhMApg@mail.gmail.com>
In-Reply-To: <CADscph1F4dgDTazbm=hNLNmBo+FMV=fdDsP-oqgJ30SeOhMApg@mail.gmail.com>
From:   Daniel Martin <consume.noise@gmail.com>
Date:   Fri, 29 Apr 2022 15:14:33 +0200
Message-ID: <CADscph0g90ZwvT6nT-+tjuMGduHjHby14hUzuyihJO6sZ=t_cQ@mail.gmail.com>
Subject: Re: [BUG REPORT] usb: dwc3: Bug: Rock Pi 4 as gadget not working
 without intervention
To:     linux-usb@vger.kernel.org
Cc:     Thinh.Nguyen@synopsys.com
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

CCing Thinh, as I saw his patches for dwc3/soft_connect, which I'm
(ab)using in my workaround.

On Fri, 22 Apr 2022 at 15:45, Daniel Martin <consume.noise@gmail.com> wrote:
> I've got:
> - a Rock Pi 4 https://wiki.radxa.com/Rockpi4
> - it has a type A port for otg (Ouch!)
> - it has an otg switch to set host or device mode (locked at device mode)
> - kernel v5.17.3
> - dt overlay to set dr_mode=peripheral
>
> What I want:
> - use the Rock Pi 4 as gadget device
> - providing storage, whereof the target can boot from
>
> What works:
> - if the target is up, it'll see the gadget if I enable it (ls
> /sys/class/udc > .../UDC)
>
> What doesn't work:
> - if the target is up, just plug in the usb cable (new full-speed
> device, device descriptor read/64 error -71, ...)
> - boot from the gadget
>
> So, I was willing to capture trace events for plugging in the usb
> cable, but there're none. Though, trace events work in general as I
> get them, when I enable the gadget (target is up and write to UDC).

regdump doesn't change either, when plugging or unplugging the cable.


To hack around the problem I'm doing this atm:
-----8<-----
#!/usr/bin/env bash

set -e

UDC_NAME=$(ls /sys/class/udc)
UDC_CLS_D="/sys/class/udc/$UDC_NAME"
UDC_DBG_D="/sys/kernel/debug/usb/$UDC_NAME"

link_prev=""

while true; do
    link_cur=$(< $UDC_DBG_D/link_state)  # XXX: link state from debugfs

    if [ "$link_prev" == "$link_cur" ]; then
        echo -n "."
    else
        echo -en "\n$link_cur"
    fi

    if [ "$link_cur" == "SS.Disabled" ]; then
        echo connect > $UDC_CLS_D/soft_connect
    elif [ "$link_cur" == "Disconnected" ]; then
        echo disconnect > $UDC_CLS_D/soft_connect
    # elif [ "$link_cur" == "U0" ]; then
    #   echo "up and running
    fi

    link_prev=$link_cur
    sleep 1
done
----->8-----

Relying on a state from debugfs doesn't look right. Though, I havn't
found any other source.

> Anything else I could try? Or could this even be a hardware limitation?

Thanks, Daniel
