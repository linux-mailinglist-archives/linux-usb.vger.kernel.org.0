Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55319357283
	for <lists+linux-usb@lfdr.de>; Wed,  7 Apr 2021 18:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354418AbhDGQ5L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Apr 2021 12:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23097 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1354421AbhDGQ5J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Apr 2021 12:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617814619;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=84pa1HvUTGdh6/hpUONI0z4OQ3atAIhX+iUH4vkqrWs=;
        b=cozJH0u15AKsV7M/zmAC9ZPOM5vNa4JgYD1NDmIXtMIZR1iwQcVqO0jwbY7dBIGV4Fqaha
        RI7koIow5yTjgwXrGtzGIlXDscvB1mo0vqC+Lg3LEXp18IdZRmPnf2q1b+aFTOLrQUPwWi
        5exaeZRCYeSK1I0Cd3TGQL3L6G54K3A=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-biQin64KPUeZSFR0tkq76Q-1; Wed, 07 Apr 2021 12:56:54 -0400
X-MC-Unique: biQin64KPUeZSFR0tkq76Q-1
Received: by mail-pf1-f200.google.com with SMTP id j18so3161781pfn.18
        for <linux-usb@vger.kernel.org>; Wed, 07 Apr 2021 09:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=84pa1HvUTGdh6/hpUONI0z4OQ3atAIhX+iUH4vkqrWs=;
        b=Bf/Wgq+DWAPVGzV9rhqPKHeSjrNz9QoqHHQpnc3pptOvp6m4AxtOazROcc9CX55S2M
         Exg8B+9TzUec3LFgm4avzoNsSHscaaqWHjPb0XW3DWpeRbe/56W9+2SisTAw/fNdQ/zY
         ip4G0O+/ff+elHHQO4Hg75WFLU0pidyQtBHpgLj2+RGYu8IeLLPvmgy/bb9TwdEBHacK
         zQXN8Pe9zlDcmD/7dTqmchfNMTVHWAoT2K693EabDn5mZuN8/AMv818qFm6BZLOGl+SY
         1xMSOCVlnC7IeYff0dwkK/SrRpkvSxuAUFtkGMl4sCP30UIIY7qk5vEFn/hn4zli9juY
         FlEw==
X-Gm-Message-State: AOAM532oo0WMU8CMdTbXnz5+x941K3+Bk66pvzfvDe+m2XmslvuaBC1o
        iU1/bs5tzmXju041wMP4BNarBZG4KPa2/8AsmPhp1eTnLHKaBODv+84OLOg2+fKn/fPfaCu96A7
        rSTBJdCCZHBLEdD+yl0MPn4Zra20EnPIT0RWq
X-Received: by 2002:a65:6881:: with SMTP id e1mr4248954pgt.147.1617814613434;
        Wed, 07 Apr 2021 09:56:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx98k9H/YT9dpeZJC8wWkahRBQ2regNea2V8x7a8NKVUZWNGQLYWWHNVbHaypJVRA8LM26YNJhsCcE7MVs8wM=
X-Received: by 2002:a65:6881:: with SMTP id e1mr4248931pgt.147.1617814613117;
 Wed, 07 Apr 2021 09:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210326143458.508959-1-lee.jones@linaro.org> <20210326143458.508959-8-lee.jones@linaro.org>
In-Reply-To: <20210326143458.508959-8-lee.jones@linaro.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 7 Apr 2021 18:56:42 +0200
Message-ID: <CAO-hwJLD9bUJAx6E4HF9VGu20Ddyo=ZyZ=DdSWj__Gp9rG486w@mail.gmail.com>
Subject: Re: [PATCH 06/25] HID: usbhid: Repair a formatting issue in a struct description
To:     Lee Jones <lee.jones@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, message to <vojtech@ucw.cz>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 26, 2021 at 3:35 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/hid/usbhid/usbkbd.c:66: warning: bad line:                 should be on
>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: message to <vojtech@ucw.cz>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/hid/usbhid/usbkbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
> index d5b7a696a68c5..d0c640be8a885 100644
> --- a/drivers/hid/usbhid/usbkbd.c
> +++ b/drivers/hid/usbhid/usbkbd.c
> @@ -63,7 +63,7 @@ static const unsigned char usb_kbd_keycode[256] = {
>   *             new key is pressed or a key that was pressed is released.
>   * @led:       URB for sending LEDs (e.g. numlock, ...)
>   * @newleds:   data that will be sent with the @led URB representing which LEDs
> -               should be on
> + *             should be on

nitpick: checkpatch complains about spaces before tabs here.

I amended locally and will push the fixed version.

Cheers,
Benjamin

>   * @name:      Name of the keyboard. @dev's name field points to this buffer
>   * @phys:      Physical path of the keyboard. @dev's phys field points to this
>   *             buffer
> --
> 2.27.0
>

