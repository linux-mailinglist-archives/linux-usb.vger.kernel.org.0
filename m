Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50EE235F8A
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 16:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728398AbfFEOsM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 10:48:12 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45527 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbfFEOsM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jun 2019 10:48:12 -0400
Received: by mail-lj1-f193.google.com with SMTP id m23so1597116lje.12
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2019 07:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KRKqCcJkJjhU1mnyKVRgvukXjIdmsxJhBRIKCeb21V8=;
        b=lMfvhE2MN5MzIzQzIS2EpGkekKhNf/1b1FjFg1hngq3lsKTREYBct0sdWuGYv13ZHM
         BEnkeIZpY4bOuFbi9P+5aLxAba9k3X3Wtru/3oO0nm22yubOu0OazdJfiEKIX9Xh4rjC
         NkP9WwD799fS5R/8gSUYuBcujBnBokE7y8PeM5/2FKSwZ5i84cn23aWnmcQn0t0PsZ7p
         8z/sNFncRelepYWPqIQ+ODYmiu9rBxbJAQUsV5tigS7i6nlHQLpnPGy5pgEnsH3u8czf
         tgWJdpiQHjy6E3flLVZ051vJWleOyAE+p4cZIFwhX16Xmvdt1QgInQ+NN1kJiAar5S+Z
         BcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KRKqCcJkJjhU1mnyKVRgvukXjIdmsxJhBRIKCeb21V8=;
        b=QDcg6eBxqv+R5WMWrc9eggvFH+zzke8wXZAJL7NBEdWIRgapsR6bMeN0NSf5P+nqYj
         0k11WBCbT2KdRToXTj2Zn6jAos50HfWYeqxbrddpMnmAp01nmfIoBlm6Ut1C8JIp+MRV
         DeZQjIXLWJehAXjgbIGjf3+AFrUEPZW924NZJNmSFbEAtPMjCUPTTtM3HcfEjpoPJ5Gz
         opmf1VxHby3zwevwmjrNQppB7juPny2V6mXW/xuMXqfJm7JeO8Bv5WKTAEUERFTpFRw8
         gS2BuF4pLT4xPvuUxjCJSbsO+F8MXQCeejl+Ou0UK8WKd50sK0Mz/87NMXB8Z5pPzHa+
         e1BQ==
X-Gm-Message-State: APjAAAWRJCYM6aILR2cKD1KOuPQa7YeBBAnFn59PIEJIivXZfP1ej6DC
        Tz/KV2hl0R5nvth77J9sbuBMg60mjgf7H/HVD5M=
X-Google-Smtp-Source: APXvYqzM04/j6r4MYqvWbpgYvZujJNxPDx9kmGbL6MbH7Iybs5ZzhOFR8PWJLQQQH4+fxc+eD+51dO0DCitcYXFkhzQ=
X-Received: by 2002:a2e:7f15:: with SMTP id a21mr3512524ljd.51.1559746089717;
 Wed, 05 Jun 2019 07:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190605130723.9184-1-festevam@gmail.com> <20190605142133.GB8803@kroah.com>
In-Reply-To: <20190605142133.GB8803@kroah.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 5 Jun 2019 11:47:59 -0300
Message-ID: <CAOMZO5BmbgcPYqJK47+mtjkMLPR9XjwdCQ4V+qjOnjg1g+nZrw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: chipidea: Use dev_err() instead of pr_err()
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Peter Chen <Peter.Chen@nxp.com>, Johan Hovold <johan@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Wed, Jun 5, 2019 at 11:21 AM Greg KH <gregkh@linuxfoundation.org> wrote:

> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index 27749ace2d93..92132b35b7fd 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -523,8 +523,9 @@ int hw_device_reset(struct ci_hdrc *ci)
> >       hw_write(ci, OP_USBMODE, USBMODE_SLOM, USBMODE_SLOM);
> >
> >       if (hw_read(ci, OP_USBMODE, USBMODE_CM) != USBMODE_CM_DC) {
> > -             pr_err("cannot enter in %s device mode", ci_role(ci)->name);
> > -             pr_err("lpm = %i", ci->hw_bank.lpm);
> > +             dev_err(ci->dev, "cannot enter in %s mode\n",
>
> You changed the string text, why?

I mentioned this string change in the commit log.

Originally we could have the following error message:

cannot enter in host device mode

This "host device" message looks strange, so that's why I removed the
"device" string.

If you prefer, I can split it in three patches (add newline, remove
'device' string, change to dev_err).

Thanks
