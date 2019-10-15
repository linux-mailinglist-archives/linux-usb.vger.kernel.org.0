Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BECACD7FA4
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2019 21:10:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389340AbfJOTKj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 15:10:39 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52805 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389321AbfJOTKi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 15:10:38 -0400
Received: by mail-wm1-f66.google.com with SMTP id r19so244789wmh.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 12:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/jU7rRfSR7KZ0wkNZhhrrk0hyXdThNXa68z+mg8n0M8=;
        b=RCa9rQrzpy8SAsQE5duWX/nt8SV5/lYLyb4rmtngMuny+yGmQ677vb3xAtvnG2gzOJ
         qTeueCYoh0SoMQSUKK1kJavs2zUek0inwGXAjDQlDwuxw1o0EyvK1tvJrAcxwhs3Kza5
         DqY8lZHrLkPZT+PA/voin9xX84EfFzHAZVe9AOuyxT2rkCpneyDkrCI6ntV8rfXFbSHa
         g3xLeu5hlPrweq80yZZwjmNqMUHJsRVmY+HHRHMeZd0/1Xg5pxJOgFjkvp8qO0jvZOAO
         y6en+qnPuHWVuzGPnlYFqvMP/HsDCMfR2BagtwpV5pm5XTGg6oJB/swb4Z/MaS+f3q2X
         tVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/jU7rRfSR7KZ0wkNZhhrrk0hyXdThNXa68z+mg8n0M8=;
        b=UoRxm5UgHjKF/mLQGk1oaB2VqIefSq7cWeuca7AYqa287qQqxjwKnNmazJSmJ/lYeQ
         0snQ955Qkd0sObgMDG+jNneIbDb+vgh7cUkeWHaGAKzaHvgVSGqgKw0msPs2AUKPq8Y+
         e76o3FgR8KukqI5p+6jd2ZHnvE+TGUOD0+SzPg7//aES2xPtWlDAFlUqJbqsL9u6kYpP
         9heCmmPp3ax9Xv1o7Mg6WRePhlcY2JjVK4URDhK5djalqy+jUNGympBULHoNariWj2OJ
         bIArtikpU7j+nryvAs/SI7ydH1BjlxCK4UkfCUDt/do1QYsRivS0f9FDKbIFv2QJcqPG
         Ci+w==
X-Gm-Message-State: APjAAAXRu6OvRv3iGVpnuEftcY69lDCck/7nN9GWmW05xla77MDZEB4C
        /7ovdyJBPy6vVQPIrzSXj7xpGCDOHyRV3fhsI6hwVw==
X-Google-Smtp-Source: APXvYqxSK3jyA7hIvHp5hYpw5AaY3TZQxvucfVqV+CwKk4CEjD7RgKLUxjtFuNQIonxMqyw0jKkMO1Z1gCVlpbMPx+I=
X-Received: by 2002:a05:600c:2388:: with SMTP id m8mr46558wma.173.1571166635181;
 Tue, 15 Oct 2019 12:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20191002231617.3670-1-john.stultz@linaro.org> <20191002231617.3670-4-john.stultz@linaro.org>
 <9e86bb7b-5dd2-760e-c324-fe1c1ee41868@ti.com>
In-Reply-To: <9e86bb7b-5dd2-760e-c324-fe1c1ee41868@ti.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 15 Oct 2019 12:10:22 -0700
Message-ID: <CALAqxLUVd5Eo_9tuP9aQUpNT0gnewBv8Dpvsj8UT3MucmzCJVQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 3/3] usb: dwc3: Registering a role switch in the DRD code.
To:     Roger Quadros <rogerq@ti.com>
Cc:     lkml <linux-kernel@vger.kernel.org>, Yu Chen <chenyu56@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 15, 2019 at 1:25 AM Roger Quadros <rogerq@ti.com> wrote:
> On 03/10/2019 02:16, John Stultz wrote:
> > @@ -487,7 +539,28 @@ int dwc3_drd_init(struct dwc3 *dwc)
> >       if (IS_ERR(dwc->edev))
> >               return PTR_ERR(dwc->edev);
> >
> > -     if (dwc->edev) {
> > +     if (device_property_read_bool(dwc->dev, "usb-role-switch")) {
>
> I think we should use role switch unconditionally and get rid of the
> debugfs role status/change mechanism.
>
> > +             struct usb_role_switch_desc dwc3_role_switch = {0};
> > +             u32 mode;
> > +
> > +             if (device_property_read_bool(dwc->dev,
> > +                                           "role-switch-default-host")) {
> > +                     dwc->role_switch_default_mode = USB_DR_MODE_HOST;
> > +                     mode = DWC3_GCTL_PRTCAP_HOST;
> > +             } else {
> > +                     dwc->role_switch_default_mode = USB_DR_MODE_PERIPHERAL;
> > +                     mode = DWC3_GCTL_PRTCAP_DEVICE;
> > +             }
> > +             dwc3_role_switch.fwnode = dev_fwnode(dwc->dev);
> > +             dwc3_role_switch.set = dwc3_usb_role_switch_set;
> > +             dwc3_role_switch.get = dwc3_usb_role_switch_get;
> > +             dwc->role_sw = usb_role_switch_register(dwc->dev,
> > +                                                     &dwc3_role_switch);
> > +             if (IS_ERR(dwc->role_sw))
> > +                     return PTR_ERR(dwc->role_sw);
> > +
> > +             dwc3_set_mode(dwc, mode);
> > +     } else if (dwc->edev) {
>
> Role switch should exist regardless if dwc->edev is present or not.

Does that risk duplicative mode sets when things change (via the
dwc3_drd_notifier and dwc3_usb_role_switch_set calls?).

thanks
-john
