Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D2222EBF7
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 14:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgG0MV2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 08:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgG0MV1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 08:21:27 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6170C061794
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 05:21:27 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id z10so230110ooi.10
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 05:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cKl9wH3ozqqpJTIt/IjccYMf+/q0iSRZmm3fxklxSkc=;
        b=tx7NILK7yxaiSxHHiMoZxv3+qZNy3D2bZudvsh5Oftl/WXVc4nquDGydzcKPxm1GGr
         iKhryB0u248LgvHZXC4IuO00mNv+WLbrCbDzoYRKcPV7KMzh4/Q352/bifixZHAv0s76
         LQAWM5+EhxeUfElmQNUC5VMMr3lOC0hBZFoCYDP9hsyWpevOo6ckBlZDe3FYptSyJm85
         v/oVWqD6tiQNqxUWaFVL2RqqerFPM2av21pOT/XiO/b9t4ix54jkqSrLF+HbbfLT/Eog
         YgxWGlS9GqyfpyMqJ6wjDI2MTHjfu4FB0bOXpsmEZWK78DM0UWcutAWpZOuoDe0KIWJb
         hLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cKl9wH3ozqqpJTIt/IjccYMf+/q0iSRZmm3fxklxSkc=;
        b=pyb/Bg4mMK+TkoAi4PFaPofEhF5k/YN2M3V4HRvypj60CZg5Wybne03BxsZrlaF5RM
         FkzmPzWhXbm4zyJU+M8/Lomtl1cimTjg0+CoX/tobKEeSM/rwglUSgSyLyR78q3OX8Hb
         9WgXQm4AUgmoMfo+rtBb3uV31xLV/uo09zB+s8FFJUe2bbCpCEFKSSJY4MaKjJaPLJAK
         rjTYlgT+MbvNlk8qWycPMOMWswwBTNEU8OyvU/cS4nRn8QMN1WVD79Am31r6GmucsLba
         zY6S7pGLMEQ566vYhY118tzKMzfuv+YOm9aq0MY+ZsOGCquKRWoOY1J09nPcOqRukT9P
         i6jg==
X-Gm-Message-State: AOAM532mH1yApjyApbfZnb3yJkTuFogZB/tAsQlrVILizBtn+vKNjix2
        3li+/N7xLm0R9YBiQe5stOwLrNasOE97CCImePHXvZX/drU=
X-Google-Smtp-Source: ABdhPJw8GqRnQKT3pvzFWoc/sPGSC/01YVHyawr2eXcQR6jMH7X4lGoVNWCmmebfC0W64NWHjZVVOXFIjHJiudMUrd8=
X-Received: by 2002:a4a:d62c:: with SMTP id n12mr12236306oon.38.1595852487099;
 Mon, 27 Jul 2020 05:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <79D67DF9-2A12-40DE-AFF7-4FF68193AD1C@me.com> <6194f859-aa61-90fa-043e-1df02b01bacb@ivitera.com>
In-Reply-To: <6194f859-aa61-90fa-043e-1df02b01bacb@ivitera.com>
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date:   Mon, 27 Jul 2020 15:21:04 +0300
Message-ID: <CAB=otbTrnYfFOhF8ZNzbOwb1_ky3v2j7iBzDEguV=8O9XFRGUQ@mail.gmail.com>
Subject: Re: usb:gadget:f_uac2: EP OUT is adaptive instead of async
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     harrison conroy <harrisonconroy@me.com>,
        Linux USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 25, 2020 at 1:24 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>
>
> Dne 22. 07. 20 v 17:25 harrison conroy napsal(a):
> > Hi Ruslan,
> >
> > I am working on a project that involves using an RPi 4 as a USB Gadget
> > and we have run into the feedback endpoint issue causing Windows 10 to
> > not recognize it as a USB audio device. Do you have any updates on this
> > patch for the community? Any help would be greatly appreciated.
>
> As a temporary workaround you can change the EP OUT type from
> USB_ENDPOINT_SYNC_ASYNC to USB_ENDPOINT_SYNC_ADAPTIVE.
>
> Or you can add implicit feedback flag to the EP IN. Win10 should handle
> implicit feedback OK, unlike Win7. Unfortunately linux still requires an
> explicit quirk for the implicit feedback
> https://www.spinics.net/lists/alsa-devel/msg111824.html . Yet it is
> still a workaround because IMO the existing EP IN is in fact not async
> but adaptive, clocked by the USB frames.
>

There is a commit which I've sent earlier this month which is a part
of Win10 enumeration solution:
https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/commit/?h=next&id=a9cf8715180b18c62addbfe6f6267b8101903119

For the rest of the solution (feedback endpoint implementation) I'm
refreshing patches on top of this, and expect to submit them very soon

Thanks,
Ruslan
