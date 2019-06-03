Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47730328C7
	for <lists+linux-usb@lfdr.de>; Mon,  3 Jun 2019 08:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbfFCGsk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Jun 2019 02:48:40 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34811 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfFCGsk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Jun 2019 02:48:40 -0400
Received: by mail-io1-f67.google.com with SMTP id k8so13425271iot.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Jun 2019 23:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NZhNwnEyiWDNWkAHoMrEkbw33EZ+o12dG5TIPikiYgM=;
        b=ppSLsflr1UYtGyl2j+1tXTPAldTqM5Hp5/Aoa+jgdf4PiymhKVUTwbVyKvVeVWordP
         oOLP73Z5Syw5CQAgugV9wIlH2P3oodo2q6ajknb1AbJ+WTdXfo1iRPpL23hHdExTkjHR
         SnK7adScl9Tyg4LDUf4S1KcdCOnSv34Mhws0B1V11gCWP4alC2inobuP3smj9MZVYEsa
         Ct3FLlsBudhQ/z7DnfTh/6z4Y4pzhw4XiTd2m+hiz60QA6MwV3GInuEEfRRIAstHV/k+
         B0cAatrh2Cnpg05507Hd1CCEG3W6OwC49JyABBohAvTRYDdSbaSeMm6ec1jL3q6q0XS3
         Berw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NZhNwnEyiWDNWkAHoMrEkbw33EZ+o12dG5TIPikiYgM=;
        b=OthI7T7k/77LJaPXXMlY7cMErjLnTyPKp4+4rXAdIMyWZT9TsAqcCXVvSMUMuIWwiw
         HphByTxw+1RLrvvRx6y1wOsnoUwLMN789ofO/kQAlThK4YPf69jdpgdmJD9O5cnsjuJm
         dWZng1br8jXEannhFldwjwqjl4PbGHVR+ZFrF6BjIqBOFZpCwAGLHUHZ13gciwIMJ/9r
         t4Hyfy+ZxfDZxWmAW2wN3wb6/UHcjvYsc0IWM8NbFWnwtiqCoPPZlcYbCXN9LId0QqoK
         Mh0nlmvnIWxPTdmDhaxsYem4lTEfsqtigqMObNlz6Q9o7Ty5GV2YdMtx4ctHqWgEEBWi
         toEA==
X-Gm-Message-State: APjAAAUbhp9HJhACy5cCF+v18KbYUHVT3y/FEcMuiHHymA1N3jAv3lNs
        ECBs7KYvEDvCF8V3QZxdHnWnjFE5YKsUJ4W+YtU=
X-Google-Smtp-Source: APXvYqwcgYqWP81nm7SIusaz7eJbwjT/l3unIlDuN/c3UQa5/hjhrvWY4QGgn4/3agmrbeTumrINtvdupCEzJD+kDrg=
X-Received: by 2002:a5d:9dc7:: with SMTP id 7mr1394797ioo.237.1559544519198;
 Sun, 02 Jun 2019 23:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190530085039.34557-1-peter.chen@nxp.com> <CAOMZO5Ci9KfZBeSp-ukNgOVwjxGYrz4-uftgBZsix_6Ybuw9Eg@mail.gmail.com>
In-Reply-To: <CAOMZO5Ci9KfZBeSp-ukNgOVwjxGYrz4-uftgBZsix_6Ybuw9Eg@mail.gmail.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Mon, 3 Jun 2019 14:48:28 +0800
Message-ID: <CAL411-roo+b77oGWKWFgAivuJTc4MsuAzWrznD87W=8iBmnrig@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] usb: chipidea: udc: workaround for endpoint
 conflict issue
To:     Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Peter Chen <peter.chen@nxp.com>,
        USB list <linux-usb@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Jun Li <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 30, 2019 at 10:14 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Peter,
>
> On Thu, May 30, 2019 at 5:50 AM Peter Chen <peter.chen@nxp.com> wrote:
> >
> > An endpoint conflict occurs when the USB is working in device mode
> > during an isochronous communication. When the endpointA IN direction
> > is an isochronous IN endpoint, and the host sends an IN token to
> > endpointA on another device, then the OUT transaction may be missed
> > regardless the OUT endpoint number. Generally, this occurs when the
> > device is connected to the host through a hub and other devices are
> > connected to the same hub.
> >
> > The affected OUT endpoint can be either control, bulk, isochronous, or
> > an interrupt endpoint. After the OUT endpoint is primed, if an IN token
> > to the same endpoint number on another device is received, then the OUT
> > endpoint may be unprimed (cannot be detected by software), which causes
> > this endpoint to no longer respond to the host OUT token, and thus, no
> > corresponding interrupt occurs.
> >
> > There is no good workaround for this issue, the only thing the software
> > could do is numbering isochronous IN from the highest endpoint since we
> > have observed most of device number endpoint from the lowest.
> >
> > Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > Cc: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
>
> Should this patch have Cc stable so that it gets applied for older kernels?
>
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index 829e947cabf5..21c1344bfc42 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -1622,6 +1622,28 @@ static int ci_udc_pullup(struct usb_gadget *_gadget, int is_on)
> >  static int ci_udc_start(struct usb_gadget *gadget,
> >                          struct usb_gadget_driver *driver);
> >  static int ci_udc_stop(struct usb_gadget *gadget);
> > +
> > +
>
> One blank line is enough.

Thanks, both.

Will be addressed at next version.

Peter
