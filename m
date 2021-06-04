Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCC739BB7E
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 17:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhFDPOm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 11:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhFDPOm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Jun 2021 11:14:42 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 956E3C061766
        for <linux-usb@vger.kernel.org>; Fri,  4 Jun 2021 08:12:55 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id m18so9682617wrv.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Jun 2021 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=MDeGfSOld04qEQUDmCqC+elxeKhTaZfQS1sxhyZdy0Y=;
        b=d5MDz4Zcs9bzXxzzD6J6cD5EERCnWZkQiBtJR5sSos112Wxg0vjLR/3rJhzlGG3Yax
         XEjP2GMX2gXwgxvVbWkfdSD3cmrnencbp5mtxnYQpq+8c7yyG7Hpx3UWr0RKFdjGTXe/
         FnlW4x86W1l/I5Eb7Hmx74h9Gr/fs+zhuDxwkV4rQlWdko8pt+d6l5gtzogqaNv8txZ6
         /9HRqo7iImdMUDw+2K6y+hsM6smVmOOqEQaVkwKJpgEj57jJgLD+PzjRGJoiT+IYfVxr
         zu+avRfVJKF8JATHMUwXQzDCTMtorPLPrXjo8hBpOsUhggsjgNskOPyQyt0YIGw3LZeV
         /gdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=MDeGfSOld04qEQUDmCqC+elxeKhTaZfQS1sxhyZdy0Y=;
        b=nKxTJ4TTS5tnkmJI8QkvZm+B9UYLq2bQ4/ruN7PFktorLlwoHh6bevyHyG8uHgf+t0
         ML2JKn1GvTouUJzYNmluqK/C4Nw6ZTsei7nfxFigPi1CxPcAb+sd5FjHdwBDTyxI0Kka
         +5MTnng+0fKHuKzGJso+XP9uz7Y0Zs0KTBOj5TheUjjWPbG4FgDZGLxRqZ43Ea3Lw5hs
         UTSOl2XP120Qqhk/vhQTUUD9rBbOGQp4fdADmWhYpt7XVj1TVh/hloWdZ+2mEqufxzt/
         gGv5FjwsiRVi3v5SQYt0Hq/Pf3UfMtSSRzDqgPkNVmyFVl60AwmAxfnAAtoQp1k1c1Zt
         3xiQ==
X-Gm-Message-State: AOAM531Hr1n3jTYOTX9VhqTu2I/xxR93KfrR30BGx5dFx9JyASC1lIN9
        ZOY7k2CACwjGxMQeNIDbvxxE9A==
X-Google-Smtp-Source: ABdhPJxOOBkqtmSGRq5uBC35IeEVOExCMPn+wThxkwQOhppV58DDG+bt3IdDk6y9AOOuq35kRbLKrQ==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr4420402wrt.133.1622819574228;
        Fri, 04 Jun 2021 08:12:54 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id z19sm8247865wmf.31.2021.06.04.08.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:12:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 04 Jun 2021 16:12:52 +0100
Message-Id: <CBUXIZOCOIXC.3V1ERV326ST89@arch-thunder>
Cc:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -next] usb: isp1760: Fix meaningless check in
 isp1763_run()
From:   "Rui Miguel Silva" <rui.silva@linaro.org>
To:     "tongtiangen" <tongtiangen@huawei.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
References: <20210601100311.70200-1-tongtiangen@huawei.com>
 <YLjAweuyJXzDn9pe@kroah.com>
 <bb426fd3-ec56-ec95-0c6a-092627d547b6@huawei.com>
In-Reply-To: <bb426fd3-ec56-ec95-0c6a-092627d547b6@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
Managed to test this and looks good. Everything is working as
expected.

On Fri Jun 4, 2021 at 3:09 AM WEST, tongtiangen wrote:
> On 2021/6/3 19:45, Greg Kroah-Hartman wrote:
> > On Tue, Jun 01, 2021 at 06:03:11PM +0800, Tong Tiangen wrote:
> >> There's a meaningless check in isp1763_run. According to the
> >> similar implement in isp1760_run, the proper check should remove
> >> retval =3D 0;

however I think a more descriptive changelog instead of comparing to
similar function would be better, maybe something around:

"Remove attribution to retval before check, which make it completely
meaningless, and does't check what it was supposed: the return
value of the timed function to set up configuration flag."

> >>
> >> Fixes: 60d789f3bfbb ("usb: isp1760: add support for isp1763")
> >> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

With changelog changed you can add:
Tested-by: Rui Miguel Silva <rui.silva@linaro.org>
Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

------
Cheers,
     Rui

> >> ---
> >>   drivers/usb/isp1760/isp1760-hcd.c | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/i=
sp1760-hcd.c
> >> index 016a54ea76f4..27168b4a4ef2 100644
> >> --- a/drivers/usb/isp1760/isp1760-hcd.c
> >> +++ b/drivers/usb/isp1760/isp1760-hcd.c
> >> @@ -1648,7 +1648,6 @@ static int isp1763_run(struct usb_hcd *hcd)
> >>   	down_write(&ehci_cf_port_reset_rwsem);
> >>   	retval =3D isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
> >>   	up_write(&ehci_cf_port_reset_rwsem);
> >> -	retval =3D 0;
> >>   	if (retval)
> >>   		return retval;
> >>  =20
> >> --=20
> >> 2.18.0.huawei.25
> >>
> > Did you test this change to verify that the driver still works properly=
?
> > You are now checking something that never was checked before...
> >
> > thanks,
> >
> > greg k-h
> > .
> Sorry,  this fix was not send to Rui.
>  From the point of view of code logic, there should be a problem here. I=
=20
> don't have the actual hardware to verify whether it works properly. Rui=
=20
> may know if the patch affects the original workflow.
>
> thanks
> .
> >



