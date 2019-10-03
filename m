Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE804C9BA6
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 12:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbfJCKFH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 06:05:07 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39312 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbfJCKFH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 06:05:07 -0400
Received: by mail-qk1-f196.google.com with SMTP id 4so1732487qki.6
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2019 03:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XWiMJwqzT8oQE1dGfRwDaY6r1DsXYglQOBVzUqA8/w8=;
        b=qMXgfIBEws2sS0qW6uaGhnWNDmBMgaDsfvPMwN8oxSu0kIAtRjDxUnvV5qE6IaQK/z
         WS/Sq2y8+wYpblBZUA12mNHTZbfnUadl5aMsNSXkbWuOWJsqafeOwVM6PVOvD8vqbjNh
         WHWqzYBzZ8cvoIG1e+pOuO+3EXEMoInOYdQrb366GC230SXMJBU5cx58zo8Z5fuMcdhr
         MVTnJNWNFkOX+ePgVviLb0wZwPq49NyX+5JmBvwzYr9vpPIrsZ1bTSk9arBdYUWs+9g2
         g9ynU96h3K7dh6M95/fjczcKjC1EUQKwhfELqSkIzNNz0xNl+kDyZ1cZjbJrLmXaieBI
         Z0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XWiMJwqzT8oQE1dGfRwDaY6r1DsXYglQOBVzUqA8/w8=;
        b=Voql0731dP9GdX06PSXAL5ESMMOhjZwN6kwbekuF6fazQt0P5gF3IlRlM5NmMGYGp2
         z5RSpvG0Id7e0HjsJfl2rBoDjSEqlWjhmKq1rh42BZpkY/UqhblbaleuvrEx5/19n38M
         RAVsjHpc32iM2PbdSqynf2eARK3XPnIqxyfnRECrmM3q0mKCkJZpua16wEAfzh/mU7Ew
         AiqgdujBnFVD9cCUvEtPZXzb0OAgBDsY4u2tVJinaYYaAmoHi2GdaHyTvm3djVqOBbQz
         7JhiYo6nhEVXFxgcWz6ne2qfNcMthVOBQ6pw8abppcP3dDPR0dJjcIz3Xq+MfH0x9lpk
         ZSMA==
X-Gm-Message-State: APjAAAVomhnZ7zcnhB1GFnlXwsUl+H1beio//Ga6/e7nXhmVn1GPcggl
        2wjeW370lB0Pc3/Su9uhETB90bBhV6fjsxbBq5pS1Q==
X-Google-Smtp-Source: APXvYqzLN9WhEfYla8VI/XUEc/9tqZZw6y4Qk84UuA4On4Aoz/4gv8XTirE38rgkp0EobKHsJ0n3nOWwvfvN9tBxIUQ=
X-Received: by 2002:a05:620a:7ca:: with SMTP id 10mr3512606qkb.410.1570097105389;
 Thu, 03 Oct 2019 03:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190920032437.242187-1-kyletso@google.com> <bd03390e-35fb-2885-d026-b8df58f02283@redhat.com>
In-Reply-To: <bd03390e-35fb-2885-d026-b8df58f02283@redhat.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Thu, 3 Oct 2019 18:04:48 +0800
Message-ID: <CAGZ6i=1mid0Cq2EtWTJHwRzPxXZJnLtTWwYL2QS0vZHNR9mJqQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] tcpm: AMS and Collision Avoidance
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hans

Could you append the TCPM log?

On Thu, Oct 3, 2019 at 5:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Kyle,
>
> On 20-09-2019 05:24, Kyle Tso wrote:
> > *** BLURB HERE ***
> >
> > Kyle Tso (2):
> >    usb: typec: tcpm: AMS and Collision Avoidance
> >    usb: typec: tcpm: AMS for PD2.0
>
> I've finally gotten a chance to test this on one of my own devices
> which uses the tcpm framework for its Type-c port.
>
> I am afraid that this series breaks DP altmode support,
> specifically, the dp_altmode_configure() function no longer
> seems to get called, leading to no pin-assignment being
> selected by default and DP thus not working.
>
> So sorry, but I have to NACK this series since it causes
> regressions.
>
> It might be easiest if you can get yourself some hardware
> which supports DP altmode and uses the fusb302 Type-C
> controller (which unlike your controller is actually
> supported by the mainline kernel).
>
> 2 devices which have this are the original (version 1)
> of the GPD win and the GPD pocket. Since the version
> is not always clearly marked, make sure you get one which
> has a X7-Z8750 CPU, those are the version 1 models, you
> can still get these e.g. here:
>
> https://www.geekbuying.com/item/GPD-Pocket-7-Inch-Tablet-PC-Intel-Atom-X7-Z8750-8GB-128GB-375711.html
> https://www.geekbuying.com/item/GPD-Win-Intel-Z8750-Windows-10-4GB-64GB-Gamepad-Tablet-PC---Black-378018.html
>
> These 2 devices still need 2 minor patches to hookup the DP
> support, I have just finished these 2 patches up and I'm
> submitting them upstream today, I will Cc you on these.
>
> If you combine these with one of the many DP-charging pass-through
> + USB-3 out + HDMI out dongles, e.g.:
> https://www.aliexpress.com/item/32953320909.html
>
> And then after plugging in do:
>
> cat /sys/class/typec/port0-partner/port0-partner.0/displayport/pin_assignment
>
> This should print:
>
> C [D]
>
> But when I add your patches into the mix it prints just:
>
> C D
>
> And these debug pr_err calls never happen:
>
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 7845df030b72..d14f94078dd9 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -106,6 +106,7 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
>                 break;
>         }
>
> +       pr_err("dp_altmode_configure pin_assign %08x conf %08x\n", pin_assign, DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
>         /* Determining the initial pin assignment. */
>         if (!DP_CONF_GET_PIN_ASSIGN(dp->data.conf)) {
>                 /* Is USB together with DP preferred */
> @@ -115,6 +116,8 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
>                 else if (pin_assign & DP_PIN_ASSIGN_DP_ONLY_MASK)
>                         pin_assign &= DP_PIN_ASSIGN_DP_ONLY_MASK;
>
> +               pr_err("dp_altmode_configure masked pin_assign %08x\n", pin_assign);
> +
>                 if (!pin_assign)
>                         return -EINVAL;
>
>
> Regards,
>
> Hans
>
