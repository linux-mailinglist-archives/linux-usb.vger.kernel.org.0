Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A83C74BAA8D
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 21:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245631AbiBQUDi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 15:03:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245628AbiBQUDh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 15:03:37 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5844644772
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 12:03:22 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id f13so3090953ilq.5
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 12:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eK4HWWlMNe7V+4+xf9TaRG40zb7CYODfs56c/J1pWCQ=;
        b=PJHDdC+mSfGb8p8HYUMcVB8nZRKKd91n1HGA7cHHM/tHLmwyl0w6qtEZZokNHdz4uj
         V0XGyLpMoQMAYIOnNiJZwxl3EMUUFelyA17GIOQ1mojDwIZmS5aYtmvnAZOSCHIwt65q
         Dl3URqslwytTq6h8yLp+UM+O64KdVVkXQQqIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eK4HWWlMNe7V+4+xf9TaRG40zb7CYODfs56c/J1pWCQ=;
        b=00K3lyXpIFR3vdJNM6hzUNRQFbMdr7tcSPTC6+lEWXIhOW5Jfxbj614QnlxP80ZG4H
         8UJkDxeZu+43iIksfRtQt9iLu5hKQyxPIn+SpRhUVJ/PpazRyyH3SKe4bUN3FPYnf1RM
         +HKBgFc63/dj6FxjO/cBrogfo/lixY5ipDgyde5/ApAN6qpzDV7DbSq6cjbA6HynhnT/
         cuoSM+3y6QEMYD0/F/wBZSp/FuMr30UdaEwVsSAIgCVpmbSny1fM/qw7Ke95ucmArA9X
         uzzNdfJ3Wpi/BK890qcqQMlm6t5F+WLq0UftyHbZZbNonmeqVTC77vVrruiY6c3UInMj
         Tylg==
X-Gm-Message-State: AOAM532+KUOdm6oE6tEAOC3fPlG19bZQ33zJP0aEeWe+vEvFSqwgPERX
        n6hwN/IGlK0DtUGcIVFVlv13lPW19B2G3QfVmcWvhg==
X-Google-Smtp-Source: ABdhPJzzl03JJ+295duFHG+BzUPDMhMLBSxMOSZwPT5p+6iRF4sWzfUAF88H6Wh3eKaZ63csB48CX/9Gekciov5hxkI=
X-Received: by 2002:a92:cdaf:0:b0:2ba:671e:123c with SMTP id
 g15-20020a92cdaf000000b002ba671e123cmr3037890ild.242.1645128201470; Thu, 17
 Feb 2022 12:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20220217131044.26983-1-oneukum@suse.com>
In-Reply-To: <20220217131044.26983-1-oneukum@suse.com>
From:   Grant Grundler <grundler@chromium.org>
Date:   Thu, 17 Feb 2022 12:03:10 -0800
Message-ID: <CANEJEGt=JZzPCnqGiKLZhXkm9or8yZTT7KXgEsSbWa22aAmrFQ@mail.gmail.com>
Subject: Re: [PATCH] sr9700: sanity check for packet length
To:     Oliver Neukum <oneukum@suse.com>
Cc:     David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Grant Grundler <grundler@chromium.org>,
        Andrew Lunn <andrew@lunn.ch>, jgg@ziepe.ca,
        linux-usb@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        netdev <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 17, 2022 at 5:10 AM Oliver Neukum <oneukum@suse.com> wrote:
>
> A malicious device can leak heap data to user space
> providing bogus frame lengths. Introduce a sanity check.
>
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Reviewed-by: Grant Grundler <grundler@chromium.org>

> ---
>  drivers/net/usb/sr9700.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/usb/sr9700.c b/drivers/net/usb/sr9700.c
> index b658510cc9a4..5a53e63d33a6 100644
> --- a/drivers/net/usb/sr9700.c
> +++ b/drivers/net/usb/sr9700.c
> @@ -413,7 +413,7 @@ static int sr9700_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
>                 /* ignore the CRC length */
>                 len = (skb->data[1] | (skb->data[2] << 8)) - 4;
>
> -               if (len > ETH_FRAME_LEN)
> +               if (len > ETH_FRAME_LEN || len > skb->len)

good catch.

>                         return 0;
>
>                 /* the last packet of current skb */
> --
> 2.34.1
>
