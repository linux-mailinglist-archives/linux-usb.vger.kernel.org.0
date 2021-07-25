Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA9E23D4F8D
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jul 2021 20:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhGYSGk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Jul 2021 14:06:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhGYSGk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Jul 2021 14:06:40 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A03CC061757
        for <linux-usb@vger.kernel.org>; Sun, 25 Jul 2021 11:47:10 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id h9so8504640ljq.8
        for <linux-usb@vger.kernel.org>; Sun, 25 Jul 2021 11:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=dMobSfRHYbBWRl4NVdimPbb8fzSNZf3DH5Ga5CsdP9A=;
        b=kofqxs3IcH4r80Mh3VhgS17F6onJlEBLQsXvccZRkpAGoQj6UEXsEy2ywe5eGdREOy
         pavfTVf0qTu6CNMNihtymfWzlDuq60oLr4bb2l3p7cZojDlaafWY4Rz+X5qfYwy0IgaS
         +gRUnN+B3ArdxWFZxZQVwZY0bIRwaS6Al/gMdBw8RiQKA2lMVxta1lZhtAknSQFNUkYQ
         grej9h0SzYh5fntuFr/SZblKXy8ByyDlTqc1bUaOBFv0cCGmnAz81dAnY/zTBnT/WJX9
         U1shyXqlXjgKNxGM232HJ1iQH6pJZONt3IMU+/kX59qkfX5zJmjj7nJstIG2sl2vPWDS
         wPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=dMobSfRHYbBWRl4NVdimPbb8fzSNZf3DH5Ga5CsdP9A=;
        b=bSzQx4B2+ZWtNxUzo9NWetja61GWt4a6hxFuxrYAxsBX9VLrREE3xySGMzCsox+nCe
         EsgHnnQtn5lx3pS1pnLrLPgtSV8aeIEbyc4+MB3dpWD5wbNqSGdAMv2CAK+/Jo81yxYN
         cFrev3I30xrZ+YSiadVOcch9L9A2FJUtKQQTWkkB0op7OLPC+mBp0Qi6ZeTXDDdZIfri
         3yUNUZBIZgwJlWhdr294WXS8GIf1YnYLLER+80sRqJEusFz4uGCrVWgw+cgKagT7X4nL
         DXtVseSsalddequNqZf8gssUjcqb3N7O4wDE6LK+PJjmyeomlq3+8HmfntYKVZhCcFXO
         fhnA==
X-Gm-Message-State: AOAM530r+unW5WzSW3bUKaJbqvvq6eit283tE9l0knRPscWlJkhVhuha
        6K3qFU/V2Eh2XwnuoCXX3sAhVJEFiiba9ygkaAZRcw==
X-Google-Smtp-Source: ABdhPJyaQUhZXeVKxo2rypW+WiKWhPSHjT17vEfE2fB3aZvRU5bRyYzgAJDv7mKrN8A0xdfgcpRVPdM/qiIRUAAJeZ8=
X-Received: by 2002:a2e:8909:: with SMTP id d9mr9764014lji.65.1627238828055;
 Sun, 25 Jul 2021 11:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210723012835.1935471-1-rajatja@google.com> <YPpqJ6k5M3skTYdA@kroah.com>
 <CACK8Z6FXLY8p=15JbYp3x3QvTgeWhmrRb_ACyNr+tNe68MOstw@mail.gmail.com>
In-Reply-To: <CACK8Z6FXLY8p=15JbYp3x3QvTgeWhmrRb_ACyNr+tNe68MOstw@mail.gmail.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Sun, 25 Jul 2021 11:46:32 -0700
Message-ID: <CACK8Z6EdBYWG7nv0ViumA72NK4h2G0cW9d2rn3BbHFTrLqhU-g@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: For dev authorization changes, include the
 actual event in udev change notification
To:     Greg KH <gregkh@linuxfoundation.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <yehezkelshb@gmail.com>,
        "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" 
        <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rajat Jain <rajatxjain@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sorry, Had hit "Reply"" while responding, instead of "Reply All" - so
it went only to Greg. Now added back everyone else.


On Fri, Jul 23, 2021 at 4:43 PM Rajat Jain <rajatja@google.com> wrote:
>
> Hello,
>
>
> On Fri, Jul 23, 2021 at 12:05 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Jul 22, 2021 at 06:28:34PM -0700, Rajat Jain wrote:
> > > For security, we would like to monitor and track when the
> > > thunderbolt devices are authorized and deauthorized. Currently
> > > the userspace gets a udev change notification when there is a
> > > change, but the state may have changed (again) by the time we
> > > look at the authorized attribute in sysfs. So an authorization
> > > event may go unnoticed. Thus make it easier by informing the
> > > actual change (authorized/deauthorized) in the udev change
> > > notification.
> >
> > We do have 72 columns to work with... :)
>
> Sorry, fixed now.
>
> >
> > >
> > > Signed-off-by: Rajat Jain <rajatja@google.com>
> > > ---
> > >  drivers/thunderbolt/switch.c | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> > > index 83b1ef3d5d03..5d3e9dcba44a 100644
> > > --- a/drivers/thunderbolt/switch.c
> > > +++ b/drivers/thunderbolt/switch.c
> > > @@ -1499,6 +1499,7 @@ static ssize_t authorized_show(struct device *dev,
> > >  static int disapprove_switch(struct device *dev, void *not_used)
> > >  {
> > >       struct tb_switch *sw;
> > > +     char *envp[] = { "AUTHORIZED=0", NULL };
> > >
> > >       sw = tb_to_switch(dev);
> > >       if (sw && sw->authorized) {
> > > @@ -1514,7 +1515,7 @@ static int disapprove_switch(struct device *dev, void *not_used)
> > >                       return ret;
> > >
> > >               sw->authorized = 0;
> > > -             kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
> > > +             kobject_uevent_env(&sw->dev.kobj, KOBJ_CHANGE, envp);
> > >       }
> > >
> > >       return 0;
> > > @@ -1523,6 +1524,8 @@ static int disapprove_switch(struct device *dev, void *not_used)
> > >  static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
> > >  {
> > >       int ret = -EINVAL;
> > > +     char envp_string[13];
> > > +     char *envp[] = { envp_string, NULL };
> > >
> > >       if (!mutex_trylock(&sw->tb->lock))
> > >               return restart_syscall();
> > > @@ -1560,7 +1563,8 @@ static int tb_switch_set_authorized(struct tb_switch *sw, unsigned int val)
> > >       if (!ret) {
> > >               sw->authorized = val;
> > >               /* Notify status change to the userspace */
> > > -             kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
> > > +             sprintf(envp_string, "AUTHORIZED=%u", val);
> > > +             kobject_uevent_env(&sw->dev.kobj, KOBJ_CHANGE, envp);
> >
> > So now "val" is a userspace visable value?  Is that documented anywhere
> > what it is and what are you going to do to ensure it never changes in
> > the future?
> >
> > Also this new value "field" should be documented somewhere as well,
> > otherwise how will any tool know it is there?
>
> Sorry I should have clarified and elaborated (now done in the new
> commit log). The field / value being exposed is that of the existing
> sysfs attribute "authorized"
> (/sys/bus/thunderbolt/devices/.../authorized), which is already
> documented. I made it clearer in the commit log now. I looked at other
> uses of kobject_uevent_env() and couldn't find examples of documenting
> the Udev environment in Documentation/.
>
> >
> > And what userspace tool will be looking for this?
>
> It will likely be a udev rule which will trigger a script when it see
> device authorization change event. Something like this:
> SUBSYSTEM=="thunderbolt", ACTION=="change", ENV{AUTHORIZED}=="1",
> RUN+="alert.sh"
>
> However, now that I say it, is it possible to check for such (kernel
> supplied) udev event environment key value pair, using
> udev_device_get_property_value()? If so, that makes it very easy for
> us, and the tool to use it would be Chromeos daemon called
> cros_healthd.
>
> Thanks,
>
> Rajat
>
> >
> > thanks,
> >
> > greg k-h
