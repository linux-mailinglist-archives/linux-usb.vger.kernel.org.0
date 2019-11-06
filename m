Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C89BF15DB
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 13:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729986AbfKFMLN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 07:11:13 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33771 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727652AbfKFMLL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 07:11:11 -0500
Received: by mail-pg1-f195.google.com with SMTP id h27so63655pgn.0
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2019 04:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OEfw9cUz4TGuYkw6SKbOhoFYIK/OUoQLEjTHKdEArNo=;
        b=fA5EbDNNhUthKOfKfplHC/PC0ChmTlyF6fmMfBqXTprs8uRNto83kgWHVaS8OcRM4W
         PtnjGw4M/cfDVmAxqRXwpd9NczmkNfCR37ozIcvmzjr2X7cO2UFEL7KmJr+1+50w8OjU
         deNOf/rey23zka2vXis+c7yrfKPew7KFRjLXr7utYeN+7YLjLv3xfKMui7FXPmInxp/Q
         On2Dmvnc8TxwkGGjUYMsGTbXWJpqBe1KM6zzzWXxpNxOUDyLK+56AnnOV0rLPQxLnKQ9
         JbtS51kREKMexDTmZi4Ud4Dr9+BEtsSps39PGQA4C0wJ75PHunHRLAaUHKEGvanZURbg
         jlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OEfw9cUz4TGuYkw6SKbOhoFYIK/OUoQLEjTHKdEArNo=;
        b=i+1Fzq5x6yFaok/6wsOykUPu//Z9SDcxEF3tHJJSw2DgEc5IKrw2jSusQW2oxSHmtr
         wRnKcTsuszzUK17CNvd+WxXAvsPbgUs2HNcZR4anGvv+oHbagyEVUWd2KyZaKMUmFls7
         IhQfrWQWRnItnoKMDjJGJcAEWPgNrppwJSP9Gl3dowcr+jxp3HALpkOCnCIdIUPrSkDs
         wTtXjax+zBCA5E6LByIoNa7iHNejwGVAemW5fduiryDIdRIQ6/BeuiPQCo19sCJpVXsl
         gZbt/lM54eoAH/kgZwquzHjlGWIKTr3lWrP5QmUR4YfyJHt33Dp/d8/FqHToNKSyPwIK
         JI7A==
X-Gm-Message-State: APjAAAVXhWYOp86MGOmFc4GtkxH6vXYAgyqtJEcnyO8zwcfbIaeD3E25
        VY1DvBzUGUgbCmB6yopcGsiEQVRrbTEemsuvdHzA3w==
X-Google-Smtp-Source: APXvYqzNvoD7XYantgXwZkOZmcI65fkzmHQsoQLeCP54fkmsPfBgPqY9pqxrRXZplYktB1mgJjiBj6ZvU0+bmxy5IWI=
X-Received: by 2002:aa7:9ad0:: with SMTP id x16mr2953838pfp.51.1573042268452;
 Wed, 06 Nov 2019 04:11:08 -0800 (PST)
MIME-Version: 1.0
References: <00000000000042d60805933945b5@google.com> <20191105233652.21033-1-tranmanphong@gmail.com>
In-Reply-To: <20191105233652.21033-1-tranmanphong@gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 6 Nov 2019 13:10:56 +0100
Message-ID: <CAAeHK+zKShqnZ=R8KQvVjsfOkAGrWW5jbsXRUnuEY8k4XN3+Fw@mail.gmail.com>
Subject: Re: [PATCH] usb: appledisplay: fix use-after-free in bl_get_brightness
To:     Phong Tran <tranmanphong@gmail.com>
Cc:     syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com, 2pi@mok.nu,
        alex.theissen@me.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 6, 2019 at 12:37 AM Phong Tran <tranmanphong@gmail.com> wrote:
>
> In context of USB disconnect, the delaywork trigger and calling
> appledisplay_bl_get_brightness() and the msgdata was freed.
>
> add the checking return value of usb_control_msg() and only update the
> data while the retval is valid.
>
> Reported-by: syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
> Reported-and-tested-by:
> syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
>
> https://groups.google.com/d/msg/syzkaller-bugs/dRmkh2UYusY/l2a6Mg3FAQAJ

Hi Phong,

FYI, when testing patches with the usb-fuzzer instance, you need to
provide the same kernel commit id as the one where the bug was
triggered. Please see here for details:

>
> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> ---
>  drivers/usb/misc/appledisplay.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
> index ac92725458b5..3e3dfa5a3954 100644
> --- a/drivers/usb/misc/appledisplay.c
> +++ b/drivers/usb/misc/appledisplay.c
> @@ -164,7 +164,8 @@ static int appledisplay_bl_get_brightness(struct backlight_device *bd)
>                 0,
>                 pdata->msgdata, 2,
>                 ACD_USB_TIMEOUT);
> -       brightness = pdata->msgdata[1];
> +       if (retval >= 0)
> +               brightness = pdata->msgdata[1];
>         mutex_unlock(&pdata->sysfslock);
>
>         if (retval < 0)
> --
> 2.20.1
>
