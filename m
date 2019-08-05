Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99E838107D
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 05:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfHEDPY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Aug 2019 23:15:24 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:46672 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbfHEDPY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Aug 2019 23:15:24 -0400
Received: by mail-io1-f65.google.com with SMTP id i10so50972841iol.13
        for <linux-usb@vger.kernel.org>; Sun, 04 Aug 2019 20:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GJ0tc7VBe6LZjl3MApGpZezG7tFQp7r4DFSmg7vWQno=;
        b=dKpkClsIEqeZfcMjyxFZyb97l52G5I69ZDzIxmssksyFkUs4jnxbVAjbwodV27432r
         2c65PDTDKqHyMB8Qp7CpqxC+NvgmyWrt49eEuwBzMCLDIlMJ1fqiojzPMq52lms+5fyu
         mSScsrhkTDs7zbTVp2qN3fuQw/0HtJ25g4zYvehZWc5k4DDORvmwgC4BoshhkSadDsPZ
         qSPRFCtVsy6DqCYzTcNq+GEmUAPDc9ZR7rnrPcOM4JUiTk8Zif2zvGBQhGO5NbeGxNwH
         qb2qQuM3dgQxwW6hsgYmbwU2rptJXgy855bfm4HKKPrpiK+pt9jWl5EY1xQYJA8q259h
         X2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GJ0tc7VBe6LZjl3MApGpZezG7tFQp7r4DFSmg7vWQno=;
        b=EoUVPCtN04WMeK3NXEPnm8rm6xQfr71FwXQsqOrTUIZ9jqwbQ5BXXRqytV3Ibxqp7A
         cHIOdfFvj9+GDPaw2NBLH2ntS7yS+n+nj10dEQpP/qAC5WP17+J6zGt7yMQMsKwzfUAD
         31WejdiWZC0wvGl9DOrICuRJP5afzeF/vMJ0KLwtNbACz2V/oTkboux277CMUFKveQH3
         up9oM3US1IteeXd1YIlWMEE1poo9lihnFyLpZxXA3KOOg52qNaQ0Zb1wUuRP6+v5qD/x
         PU5brRRm15yoLPyFtzuEobbAfVPI4pgE/J1ORxjs/b56bA4QOoLJp8cNILRaNnX0n6bb
         WwlA==
X-Gm-Message-State: APjAAAXCtKafnvuhG+ZxgWyUNFX6vJkO4YHHn02P/O6vaBpYopJnlEjZ
        ukrdz2v8nziItusyIOpOwm475ea9LqLf5puPSjo=
X-Google-Smtp-Source: APXvYqybyMfE1pvQOJeUjbJFnZSE3uXBD8JV8vqbTEQzOQ5nUBtskCBf5sPBr76X3XE65oWLHDIrYq7yUgXj3/TMXzE=
X-Received: by 2002:a5e:8b43:: with SMTP id z3mr25413016iom.287.1564974923438;
 Sun, 04 Aug 2019 20:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190703071953.38082-1-jun.li@nxp.com> <20190703071953.38082-2-jun.li@nxp.com>
 <CAL411-oHEbC6Lkr-X=GBKbHhRfuoQsfMVnUKtUjC1c8wrf-k+Q@mail.gmail.com> <VE1PR04MB6528DEA1B84E9B85A8594E5089DA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB6528DEA1B84E9B85A8594E5089DA0@VE1PR04MB6528.eurprd04.prod.outlook.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Mon, 5 Aug 2019 11:15:12 +0800
Message-ID: <CAL411-o8pO=HQwRrgibpRsrfCBD0bqWaCM5imxtCVKTCdwa=ew@mail.gmail.com>
Subject: Re: [PATCH 2/5] usb: chipidea: add role switch class support
To:     Jun Li <jun.li@nxp.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> >
> > > USB role is fully controlled by usb role switch consumer(e.g. typec),
> > > usb port either at host mode, or at device connected mode, will not
> > > stay at USB_ROLE_NONE mode.
> > >
> >
> > Then, if the Type-C cable is disconnected from PC host, the controller driver can't be
> > notified?If that, how controller enters low power mode at this situation?
>
> The controller driver can be notified, but there are only role(host or device)
> Information, so in you mentioned case, controller driver will get the same
> input before and after disconnect from host, can't know detachment and
> enter low power mode accordingly, this is more like something internal
> handling under device role.
>

If the Type-C can't pass "gadget disconnect" event, you may handle it
at UDC driver itself, eg at ci_usb_role_switch_set. Otherwise, the gadget
class driver can't be notified disconnection, and the controller itself can't
enter LPM as well.

Peter

> Li Jun
>
> >
> > Peter
> >
> > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > ---
> > >  drivers/usb/chipidea/ci.h   |   2 +
> > >  drivers/usb/chipidea/core.c | 125
> > > ++++++++++++++++++++++++++++++++++----------
> > >  drivers/usb/chipidea/otg.c  |  13 +++++
> > >  3 files changed, 111 insertions(+), 29 deletions(-)
> > >
> > > diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> > > index 82b86cd..5e2f0bc 100644
> > > --- a/drivers/usb/chipidea/ci.h
> > > +++ b/drivers/usb/chipidea/ci.h
> > > @@ -212,6 +212,7 @@ struct ci_hdrc {
> > >         ktime_t                         hr_timeouts[NUM_OTG_FSM_TIMERS];
> > >         unsigned                        enabled_otg_timer_bits;
> > >         enum otg_fsm_timer              next_otg_timer;
> > > +       struct usb_role_switch          *role_switch;
> > >         struct work_struct              work;
> > >         struct workqueue_struct         *wq;
> > >
> > > @@ -244,6 +245,7 @@ struct ci_hdrc {
> > >         struct dentry                   *debugfs;
> > >         bool                            id_event;
> > >         bool                            b_sess_valid_event;
> > > +       bool                            role_switch_event;
> > >         bool                            imx28_write_fix;
> > >         bool                            supports_runtime_pm;
> > >         bool                            in_lpm;
> > > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > > index bc24c5b..1bcf6f6 100644
> > > --- a/drivers/usb/chipidea/core.c
> > > +++ b/drivers/usb/chipidea/core.c
> > > @@ -587,6 +587,47 @@ static irqreturn_t ci_irq(int irq, void *data)
> > >         return ret;
> > >  }
> > >
> > > +static int ci_usb_role_switch_set(struct device *dev, enum usb_role
> > > +role) {
> > > +       struct ci_hdrc *ci = dev_get_drvdata(dev);
> > > +       unsigned long flags;
> > > +
> > > +       if (ci->role == role || role == USB_ROLE_NONE)
> > > +               return 0;
> > > +
> > > +       spin_lock_irqsave(&ci->lock, flags);
> > > +       ci->role_switch_event = true;
> > > +       if (ci->role == USB_ROLE_NONE) {
> > > +               if (role == USB_ROLE_DEVICE)
> > > +                       ci->role = USB_ROLE_HOST;
> > > +               else
> > > +                       ci->role = USB_ROLE_DEVICE;
> > > +       }
> > > +       spin_unlock_irqrestore(&ci->lock, flags);
> > > +
> > > +       ci_otg_queue_work(ci);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static enum usb_role ci_usb_role_switch_get(struct device *dev) {
> > > +       struct ci_hdrc *ci = dev_get_drvdata(dev);
> > > +       unsigned long flags;
> > > +       enum usb_role role;
> > > +
> > > +       spin_lock_irqsave(&ci->lock, flags);
> > > +       role = ci->role;
> > > +       spin_unlock_irqrestore(&ci->lock, flags);
> > > +
> > > +       return role;
> > > +}
> > > +
> > > +static struct usb_role_switch_desc ci_role_switch = {
> > > +       .set = ci_usb_role_switch_set,
> > > +       .get = ci_usb_role_switch_get, };
> > > +
> > >  static int ci_cable_notifier(struct notifier_block *nb, unsigned long event,
> > >                              void *ptr)  { @@ -689,6 +730,9 @@ static
> > > int ci_get_platdata(struct device *dev,
> > >         if (of_find_property(dev->of_node, "non-zero-ttctrl-ttha", NULL))
> > >                 platdata->flags |= CI_HDRC_SET_NON_ZERO_TTHA;
> > >
> > > +       if (device_property_read_bool(dev, "usb-role-switch"))
> > > +               ci_role_switch.fwnode = dev->fwnode;
> > > +
> > >         ext_id = ERR_PTR(-ENODEV);
> > >         ext_vbus = ERR_PTR(-ENODEV);
> > >         if (of_property_read_bool(dev->of_node, "extcon")) { @@ -908,6
> > > +952,43 @@ static const struct attribute_group ci_attr_group = {
> > >         .attrs = ci_attrs,
> > >  };
> > >
> > > +static int ci_start_initial_role(struct ci_hdrc *ci) {
> > > +       int ret = 0;
> > > +
> > > +       if (ci->roles[USB_ROLE_HOST] && ci->roles[USB_ROLE_DEVICE]) {
> > > +               if (ci->is_otg) {
> > > +                       ci->role = ci_otg_role(ci);
> > > +                       /* Enable ID change irq */
> > > +                       hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
> > > +               } else {
> > > +                       /*
> > > +                        * If the controller is not OTG capable, but support
> > > +                        * role switch, the defalt role is gadget, and the
> > > +                        * user can switch it through debugfs.
> > > +                        */
> > > +                       ci->role = USB_ROLE_DEVICE;
> > > +               }
> > > +       } else {
> > > +               ci->role = ci->roles[USB_ROLE_HOST]
> > > +                       ? USB_ROLE_HOST
> > > +                       : USB_ROLE_DEVICE;
> > > +       }
> > > +
> > > +       if (!ci_otg_is_fsm_mode(ci)) {
> > > +               /* only update vbus status for peripheral */
> > > +               if (ci->role == USB_ROLE_DEVICE)
> > > +                       ci_handle_vbus_change(ci);
> > > +
> > > +               ret = ci_role_start(ci, ci->role);
> > > +               if (ret)
> > > +                       dev_err(ci->dev, "can't start %s role\n",
> > > +                                               ci_role(ci)->name);
> > > +       }
> > > +
> > > +       return ret;
> > > +}
> > > +
> > >  static int ci_hdrc_probe(struct platform_device *pdev)  {
> > >         struct device   *dev = &pdev->dev;
> > > @@ -1051,36 +1132,10 @@ static int ci_hdrc_probe(struct platform_device *pdev)
> > >                 }
> > >         }
> > >
> > > -       if (ci->roles[USB_ROLE_HOST] && ci->roles[USB_ROLE_DEVICE]) {
> > > -               if (ci->is_otg) {
> > > -                       ci->role = ci_otg_role(ci);
> > > -                       /* Enable ID change irq */
> > > -                       hw_write_otgsc(ci, OTGSC_IDIE, OTGSC_IDIE);
> > > -               } else {
> > > -                       /*
> > > -                        * If the controller is not OTG capable, but support
> > > -                        * role switch, the defalt role is gadget, and the
> > > -                        * user can switch it through debugfs.
> > > -                        */
> > > -                       ci->role = USB_ROLE_DEVICE;
> > > -               }
> > > -       } else {
> > > -               ci->role = ci->roles[USB_ROLE_HOST]
> > > -                       ? USB_ROLE_HOST
> > > -                       : USB_ROLE_DEVICE;
> > > -       }
> > > -
> > > -       if (!ci_otg_is_fsm_mode(ci)) {
> > > -               /* only update vbus status for peripheral */
> > > -               if (ci->role == USB_ROLE_DEVICE)
> > > -                       ci_handle_vbus_change(ci);
> > > -
> > > -               ret = ci_role_start(ci, ci->role);
> > > -               if (ret) {
> > > -                       dev_err(dev, "can't start %s role\n",
> > > -                                               ci_role(ci)->name);
> > > +       if (!ci_role_switch.fwnode) {
> > > +               ret = ci_start_initial_role(ci);
> > > +               if (ret)
> > >                         goto stop;
> > > -               }
> > >         }
> > >
> > >         ret = devm_request_irq(dev, ci->irq, ci_irq, IRQF_SHARED, @@
> > > -1092,6 +1147,15 @@ static int ci_hdrc_probe(struct platform_device *pdev)
> > >         if (ret)
> > >                 goto stop;
> > >
> > > +       if (ci_role_switch.fwnode) {
> > > +               ci->role_switch = usb_role_switch_register(dev,
> > > +                                       &ci_role_switch);
> > > +               if (IS_ERR(ci->role_switch)) {
> > > +                       ret = PTR_ERR(ci->role_switch);
> > > +                       goto stop;
> > > +               }
> > > +       }
> > > +
> > >         if (ci->supports_runtime_pm) {
> > >                 pm_runtime_set_active(&pdev->dev);
> > >                 pm_runtime_enable(&pdev->dev); @@ -1133,6 +1197,9 @@
> > > static int ci_hdrc_remove(struct platform_device *pdev)  {
> > >         struct ci_hdrc *ci = platform_get_drvdata(pdev);
> > >
> > > +       if (ci->role_switch)
> > > +               usb_role_switch_unregister(ci->role_switch);
> > > +
> > >         if (ci->supports_runtime_pm) {
> > >                 pm_runtime_get_sync(&pdev->dev);
> > >                 pm_runtime_disable(&pdev->dev); diff --git
> > > a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c index
> > > 5bde0b5..0a22855 100644
> > > --- a/drivers/usb/chipidea/otg.c
> > > +++ b/drivers/usb/chipidea/otg.c
> > > @@ -214,6 +214,19 @@ static void ci_otg_work(struct work_struct *work)
> > >                 ci_handle_vbus_change(ci);
> > >         }
> > >
> > > +       if (ci->role_switch_event) {
> > > +               ci->role_switch_event = false;
> > > +
> > > +               if (ci->role == USB_ROLE_DEVICE) {
> > > +                       usb_gadget_vbus_disconnect(&ci->gadget);
> > > +                       ci_role_start(ci, USB_ROLE_HOST);
> > > +               } else if (ci->role == USB_ROLE_HOST) {
> > > +                       ci_role_stop(ci);
> > > +                       usb_gadget_vbus_connect(&ci->gadget);
> > > +                       ci->role = USB_ROLE_DEVICE;
> > > +               }
> > > +       }
> > > +
> > >         pm_runtime_put_sync(ci->dev);
> > >
> > >         enable_irq(ci->irq);
> > > --
> > > 2.7.4
> > >
