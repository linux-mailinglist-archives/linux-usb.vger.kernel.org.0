Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B76D24EC6D
	for <lists+linux-usb@lfdr.de>; Sun, 23 Aug 2020 11:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726542AbgHWJ0l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Aug 2020 05:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgHWJ0k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Aug 2020 05:26:40 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C382EC061574
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2020 02:26:39 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id r19so2498415qvw.11
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2020 02:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s1sYF8go7qkIJfXgsFM0jG5g2kLGG3UutjF1ASPDx3Y=;
        b=ePgC16u/C5fV3JjKJ4mqDBjBKX7rE8F5HKEV6aigJmB/MT0dpC6RU3uQWbhAfk9tUp
         RCR7HIz1aGfyaWYfV3GYIthDlOREgyLhCneg+gG//QsMKzs3fAzx+vysXc9j4vsXQOrt
         AbkVzaoQHcRTZHsieukpuWTyIr5I+Xd15gqNmwG/AqciZW/DLPSxu8sSVPnLDWlGBHHD
         VHAWW5VLQGH6HQ20FmLfJcODHQuHT1SSbllPBfD8cKutqH3Lki5oRx19oMGJpXVIH12A
         xq/5H9ylhHxH+F5YsJtY5387XcOHxSohttYGk7ZRlN2dwZiilN/axFky6oj1IQUmV2VI
         Nyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s1sYF8go7qkIJfXgsFM0jG5g2kLGG3UutjF1ASPDx3Y=;
        b=SDFTX24Q32XRuS0+h8j25ZJdZg3lxGpObc7a3551ky5qlwNge7HlFLii9y2WrII2gJ
         Jzhi+SqKcJC3ki0DKYArLRupsXKVkqm/7hM3Tu+9QqY3iYL9NVNIAAbfUo5dTkIv+L93
         lgEGlkmOWediWXyCw/M3o2VYsyr0nWcTRvPM5KP7nFtW0ojX0tZEeYnDFiRd4wXMoqFU
         pyv6uwE8dSMpW9fe1YU6XWXt2xEHIXpDGZZ1tIuYTEQvNnAlS8wTktSGSFEctRXOKd1t
         w4AppN8VRYcTRjrr2U3iL20IAZeARMgLWHbYSy9E9Nh/9wPnxkYRBrPmNtbtW/vZ8Wnl
         mGBA==
X-Gm-Message-State: AOAM53273eDspUWZDTCQwkO7vsCN8BUVQ2o2GbyJCGnVKKI14u79NSwB
        zn60KT7MbSNj9DgRmYeqSXBwopei0rTqBuBt6IEi6b8b7DfB0A==
X-Google-Smtp-Source: ABdhPJyRzSGIRnG9KdFdUSjw7nF3cpcCtQH1Pk0Y2ZVnelPepWNaPSLGOZB1ugjQ9FrlSgcpZPWH4jpnNU6VoPO2oTw=
X-Received: by 2002:a0c:cc94:: with SMTP id f20mr472014qvl.159.1598174798398;
 Sun, 23 Aug 2020 02:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200823082042.20816-1-himadrispandya@gmail.com>
In-Reply-To: <20200823082042.20816-1-himadrispandya@gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Sun, 23 Aug 2020 11:26:27 +0200
Message-ID: <CACT4Y+Y1TpqYowNXj+OTcQwH-7T4n6PtPPa4gDWkV-np5KhKAQ@mail.gmail.com>
Subject: Re: [PATCH] net: usb: Fix uninit-was-stored issue in asix_read_cmd()
To:     Himadri Pandya <himadrispandya@gmail.com>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 23, 2020 at 10:21 AM Himadri Pandya
<himadrispandya@gmail.com> wrote:
>
> Initialize the buffer before passing it to usb_read_cmd() function(s) to
> fix the uninit-was-stored issue in asix_read_cmd().
>
> Fixes: KMSAN: kernel-infoleak in raw_ioctl
> Reported by: syzbot+a7e220df5a81d1ab400e@syzkaller.appspotmail.com
>
> Signed-off-by: Himadri Pandya <himadrispandya@gmail.com>
> ---
>  drivers/net/usb/asix_common.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/usb/asix_common.c b/drivers/net/usb/asix_common.c
> index e39f41efda3e..a67ea1971b78 100644
> --- a/drivers/net/usb/asix_common.c
> +++ b/drivers/net/usb/asix_common.c
> @@ -17,6 +17,8 @@ int asix_read_cmd(struct usbnet *dev, u8 cmd, u16 value, u16 index,
>
>         BUG_ON(!dev);
>
> +       memset(data, 0, size);

Hi Himadri,

I think the proper fix is to check
usbnet_read_cmd/usbnet_read_cmd_nopm return value instead.
Memsetting data helps to fix the warning at hand, but the device did
not send these 0's and we use them as if the device did send them.

Perhaps we need a separate helper function (of a bool flag) that will
fail on incomplete reads. Maybe even in the common USB layer because I
think we've seen this type of bug lots of times and I guess there are
dozens more.


>         if (!in_pm)
>                 fn = usbnet_read_cmd;
>         else
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20200823082042.20816-1-himadrispandya%40gmail.com.
