Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5933C0129
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2019 10:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbfI0I30 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 04:29:26 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38247 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725842AbfI0I3Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Sep 2019 04:29:25 -0400
Received: by mail-io1-f65.google.com with SMTP id u8so14175926iom.5
        for <linux-usb@vger.kernel.org>; Fri, 27 Sep 2019 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EDvQQGa2QjwV3TqYPc7JV+uiOfef2lIAs7Rasba1hSE=;
        b=b1AZJoVEiV3uzOhujF671uaPrHz0+4T/Tg32cWFlC1YA8TGRtc2/W+sBjPF4+cn6au
         KsCcEkhuRnhJEMX+ypi53r34utba5UHRFxXLpsjS+LJEA5mZzPIpvvzvsUl3sS14sypQ
         bdZIUPvCpsbOT3DJNcqkdxTYw2nKy5DAIWyu8UStPgkj7cgTEqgr2cNfyCyJ0dkbhWNA
         y6561iN2QIE7ZSy8AgtDNljCYLA70mCQsHjVZutMf9jrmTCqvokPYhOOBxqHd/PR4YBT
         IqOkIxpDgQbstcozaluXOwfyPsuteS5PSqHV0yBrUouKauHQWSH9WDh6gG3cKSHiQn1A
         skuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EDvQQGa2QjwV3TqYPc7JV+uiOfef2lIAs7Rasba1hSE=;
        b=YH2H95rjaFh0RQ5erw6B6OGPyGVdKMWjB+WMpYNGb9H2mbzvv6Ocq4fvP9pzd8yzy9
         rDMRzjtdhkCQsBI0IQh9/E+NIXfWMd+CwPK2RrrDbyJ6tYPqPnOfBXkR/xmw2cYOxK2Z
         SnU8M6XKchGCltsNFNWI/NsdcPxXGBYTQAwU+hw73b0P9V4vRK8j7iSt4VdYcQ9X5sPv
         nrBYvjNgDK7fktA9gW3Och0Rj06WpWJB2Nx76mR/+vcHDFeK7KF/3bbwIgmoqmHBQQGH
         ly7/PTSmN7jBUu4bxD59vNB9QM1fEJVu7RkAdOIVbPYh8iAPr34CsSq2y6HtUGtH/bmL
         /2rQ==
X-Gm-Message-State: APjAAAXq+PW6G17DW/YJXP1RHshvtVGgJB41e2czNl1ilwNqKwbyGyjl
        PzSESddTuO9MgTadfTGKdQz5e+mqW+I7G3cM1bE=
X-Google-Smtp-Source: APXvYqyAGTAhpXTHqZVYBpWnp6ZsEJ28qnJ9TOdYSuWQ7h4oSGbbAW/bVfeEdhyviLiep4uvVjmNJSwSIHFqeQH2Cvw=
X-Received: by 2002:a92:b743:: with SMTP id c3mr3545450ilm.237.1569572965041;
 Fri, 27 Sep 2019 01:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <1569484721-4424-1-git-send-email-pawell@cadence.com>
In-Reply-To: <1569484721-4424-1-git-send-email-pawell@cadence.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Fri, 27 Sep 2019 16:29:13 +0800
Message-ID: <CAL411-rXBNVEr67QTx0Jaj3bo5pbK__2wCihz+8T6Q7dumgZaA@mail.gmail.com>
Subject: Re: [PATCH v3 -next] usb: cdns3: Fix sheduling with locks held.
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        felipe.balbi@linux.intel.com, dan.carpenter@oracle.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 26, 2019 at 6:26 PM Pawel Laszczak <pawell@cadence.com> wrote:
>
> Patch fix issue in cdns3_ep0_feature_handle_device function.
>
> The function usleep_range can't be used there because this function is
> called with locks held and IRQs disabled in
> cdns3_device_thread_irq_handler().
>
> To resolve this issue patch replaces usleep_range with mdelay.
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
> ---
> v2: added Reported-by and Fixes tags
> v3: added version of the patch
> ---
>  drivers/usb/cdns3/ep0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
> index 44f652e8b5a2..0445da0a5a0c 100644
> --- a/drivers/usb/cdns3/ep0.c
> +++ b/drivers/usb/cdns3/ep0.c
> @@ -332,7 +332,7 @@ static int cdns3_ep0_feature_handle_device(struct cdns3_device *priv_dev,
>                          * for sending status stage.
>                          * This time should be less then 3ms.
>                          */
> -                       usleep_range(1000, 2000);
> +                       mdelay(1);
>                         cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
>                                                USB_CMD_STMODE |
>                                                USB_STS_TMODE_SEL(tmode - 1));
> --
> 2.17.1
>

Reviewed-by: Peter Chen <peter.chen@nxp.com>

Peter
