Return-Path: <linux-usb+bounces-13176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC58949ED8
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 06:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E59B42871C5
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 04:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2D029CEC;
	Wed,  7 Aug 2024 04:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CWr/+l6J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEAF801
	for <linux-usb@vger.kernel.org>; Wed,  7 Aug 2024 04:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723005209; cv=none; b=m0pKeS3F1lendHKhGT7a7ociFjeYk0u1UCgwZqvIK6NBsJrk87U5k5Cndfb4aszsXkS6SSMVXidieDb74GaHdwQeHaQk3nkcnOvFUVHV9EndV04SKAQH7CuTwhPzPJyAN5K+qATyhVd+AoZLeeyyOVmlrCFalvHwFpcyIXT7nDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723005209; c=relaxed/simple;
	bh=2aMk1wCg0XtUavuN5wtGtXS3GBcoTm6iQL2je9pQ8uM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UA+ilkqUI7TJhmK9dn0pet1TqaSrqlqIhLmWcqDH60xkrBCtBEXsxbdGbl52c/7rBemAWlHUgwwr2LUE5qazxyO6rxy9neN7BFsiUaMbo9arn0DghRqeP6mjKYfSDEkO6HPk+G4cSuqNVAzw6JjAhGf87TD6/mgvZhuhh5bArR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CWr/+l6J; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5b9fe5ea355so25943a12.0
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2024 21:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723005205; x=1723610005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PchbWzNoWQ3x0Bdyu00GRTjqAVg+Qi0U7ExdbFMkY4k=;
        b=CWr/+l6JGl1EOlSxOXl5RpfwUR+UpBjFgJdPYiDoM77i9RFbSfn9+S08mhAraJT9pF
         j6MBIcvC7mtvDGnBqzqRE1McV9gPaWpPXktjOjscgct/+DW31V6YtBiU4TX8IwDGZhp/
         IKw2CkDgkOZSQVYj0B+1khb+Hrwfyy72mYDRCH4lkfSCrJnWCDoGUrG7hu06ueFHYGjg
         B+ugVK8Eb1D30Gpwq5DHdVb8PxrEnsH1FVHpupumLEicMrw36wyaESNGTCpV5pRGa9E1
         BEImmU9xd85yI7aTrWDAD8elGZ7PXGMaHNR02Os+WOOTjLF/wTqSYY+T5jtfI8SICJkA
         9XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723005205; x=1723610005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PchbWzNoWQ3x0Bdyu00GRTjqAVg+Qi0U7ExdbFMkY4k=;
        b=fzo9FcoT0ASXhffx5zCjsErGvtbs5BxN3DDc57RLOhCPhqsur+AI0zAusOwp4zltBR
         4GX4K/HA+StGZ2NVcchoqbzuk+hReMIfDUNBdDBuZ6A32MMKZhV6Rd9Lp/G0/hV+8zRF
         1wppYNzVSgZNYV3WVGe89WfDShuT2th0ynrbwI7eB9jjcUrEDpT6Srq5NFLv4ChAwgQv
         MiKTdo11V+yMWwNeuqO2dfh8RWwosPC+mhNe9q7363tdoIB9ySD5ssx4oBNFsq9UUQhf
         byMiSaaXNoxnp5gWIEMI7f4yO1Dq2pvujxUgLsPCf+tna+OaV9zw3uL8a/MQkwHgecza
         OkZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW36jk/9LIUWO6QZzvpn3oWEFmFVxZFloCahTgilaExGq1Cwn28ANhGXThOFfBUdfRWwK8PINhqcjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YySk9oTNY90E/NOuoLHrcuPxwAobb03pjPwBEU8QkRdAyqe0OHR
	CGkVxFRn03smuq3GkKD8xk/RxwetB9FEcqAzsywflzDqvxui3GVpUk5djNWYP9pTWvLwraszcF+
	ZBcV29P7NP6/NEcva+EsJl3M3/Qulx50+PiHM
X-Google-Smtp-Source: AGHT+IERqcKVmfgf12AYaclzjRwXVBCyQhVDHFDvFf4sHaR9upjrrxmbdLsqhdnHKPsK7lj9VRQjWgYV6v490ma/ZVA=
X-Received: by 2002:a05:6402:35d4:b0:5aa:19b1:ffc7 with SMTP id
 4fb4d7f45d1cf-5bba2837dccmr114205a12.2.1723005205095; Tue, 06 Aug 2024
 21:33:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240804084612.2561230-1-kyletso@google.com> <20240806232836.52rkn7u3g5uiotn3@synopsys.com>
In-Reply-To: <20240806232836.52rkn7u3g5uiotn3@synopsys.com>
From: Kyle Tso <kyletso@google.com>
Date: Wed, 7 Aug 2024 12:33:08 +0800
Message-ID: <CAGZ6i=1v6+Jt3Jecd3euNnumVK781U9DQvRz7cHWnxi8Ga6W=g@mail.gmail.com>
Subject: Re: [PATCH v3] usb: dwc3: Runtime get and put usb power_supply handle
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "raychi@google.com" <raychi@google.com>, 
	"badhri@google.com" <badhri@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "royluo@google.com" <royluo@google.com>, 
	"bvanassche@acm.org" <bvanassche@acm.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 7:29=E2=80=AFAM Thinh Nguyen <Thinh.Nguyen@synopsys.=
com> wrote:
>
> On Sun, Aug 04, 2024, Kyle Tso wrote:
> > It is possible that the usb power_supply is registered after the probe
>
> Should we defer the dwc3 probe until the power_supply is registered
> then?
>

We can do that, but getting the power_supply reference just before
using the power_supply APIs is safer because we don't risk waiting for
the registration of the usb power_supply. If vbus_draw is being called
but the usb power_supply is still not ready, just let it fail without
doing anything (only print the error logs). The usb gadget function
still works. And once the usb power_supply is ready, the vbus_draw
will be fine in following usb state changes.

Moreover, all drivers using power_supply_get_by_name in the source
tree adopt this way. IMO it should be okay.

> > of dwc3. In this case, trying to get the usb power_supply during the
> > probe will fail and there is no chance to try again. Also the usb
> > power_supply might be unregistered at anytime so that the handle of it
>
> This is problematic... If the power_supply is unregistered, the device
> is no longer usable.
>
> > in dwc3 would become invalid. To fix this, get the handle right before
> > calling to power_supply functions and put it afterward.
>
> Shouldn't the life-cycle of the dwc3 match with the power_supply? How
> can we maintain function without the proper power_supply?
>
> BR,
> Thinh
>

usb power_supply is controlled by "another" driver which can be
unloaded without notifying other drivers using it (such as dwc3).
Unless there is a notification mechanism for the (un)registration of
the power_supply class, getting/putting the reference right
before/after calling the power_supply api is the best we can do for
now.

Kyle




> >
> > dwc3_gadet_vbus_draw might be in interrupt context. Create a kthread
> > worker beforehand and use it to process the "might-sleep"
> > power_supply_put ASAP after the property set.
> >
> > Fixes: 6f0764b5adea ("usb: dwc3: add a power supply for current control=
")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Kyle Tso <kyletso@google.com>
> > ---
> > v2 -> v3:
> > - Only move power_supply_put to a work. Still call _get_by_name and
> >   _set_property in dwc3_gadget_vbus_draw.
> > - Create a kthread_worker to handle the work
> >
> > v1 -> v2:
> > - move power_supply_put out of interrupt context
> >
> >  drivers/usb/dwc3/core.c   | 29 ++++++++++++----------------
> >  drivers/usb/dwc3/core.h   |  6 ++++--
> >  drivers/usb/dwc3/gadget.c | 40 +++++++++++++++++++++++++++++++++++----
> >  3 files changed, 52 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index 734de2a8bd21..82c8376330d7 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -1631,8 +1631,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >       u8                      tx_thr_num_pkt_prd =3D 0;
> >       u8                      tx_max_burst_prd =3D 0;
> >       u8                      tx_fifo_resize_max_num;
> > -     const char              *usb_psy_name;
> > -     int                     ret;
> >
> >       /* default to highest possible threshold */
> >       lpm_nyet_threshold =3D 0xf;
> > @@ -1667,12 +1665,7 @@ static void dwc3_get_properties(struct dwc3 *dwc=
)
> >
> >       dwc->sys_wakeup =3D device_may_wakeup(dwc->sysdev);
> >
> > -     ret =3D device_property_read_string(dev, "usb-psy-name", &usb_psy=
_name);
> > -     if (ret >=3D 0) {
> > -             dwc->usb_psy =3D power_supply_get_by_name(usb_psy_name);
> > -             if (!dwc->usb_psy)
> > -                     dev_err(dev, "couldn't get usb power supply\n");
> > -     }
> > +     device_property_read_string(dev, "usb-psy-name", &dwc->usb_psy_na=
me);
> >
> >       dwc->has_lpm_erratum =3D device_property_read_bool(dev,
> >                               "snps,has-lpm-erratum");
> > @@ -2132,19 +2125,24 @@ static int dwc3_probe(struct platform_device *p=
dev)
> >
> >       dwc3_get_software_properties(dwc);
> >
> > +     dwc->worker =3D kthread_create_worker(0, "dwc3-worker");
> > +     if (IS_ERR(dwc->worker))
> > +             return PTR_ERR(dwc->worker);
> > +     sched_set_fifo(dwc->worker->task);
> > +
> >       dwc->reset =3D devm_reset_control_array_get_optional_shared(dev);
> >       if (IS_ERR(dwc->reset)) {
> >               ret =3D PTR_ERR(dwc->reset);
> > -             goto err_put_psy;
> > +             goto err_destroy_worker;
> >       }
> >
> >       ret =3D dwc3_get_clocks(dwc);
> >       if (ret)
> > -             goto err_put_psy;
> > +             goto err_destroy_worker;
> >
> >       ret =3D reset_control_deassert(dwc->reset);
> >       if (ret)
> > -             goto err_put_psy;
> > +             goto err_destroy_worker;
> >
> >       ret =3D dwc3_clk_enable(dwc);
> >       if (ret)
> > @@ -2245,9 +2243,8 @@ static int dwc3_probe(struct platform_device *pde=
v)
> >       dwc3_clk_disable(dwc);
> >  err_assert_reset:
> >       reset_control_assert(dwc->reset);
> > -err_put_psy:
> > -     if (dwc->usb_psy)
> > -             power_supply_put(dwc->usb_psy);
> > +err_destroy_worker:
> > +     kthread_destroy_worker(dwc->worker);
> >
> >       return ret;
> >  }
> > @@ -2258,6 +2255,7 @@ static void dwc3_remove(struct platform_device *p=
dev)
> >
> >       pm_runtime_get_sync(&pdev->dev);
> >
> > +     kthread_destroy_worker(dwc->worker);
> >       dwc3_core_exit_mode(dwc);
> >       dwc3_debugfs_exit(dwc);
> >
> > @@ -2276,9 +2274,6 @@ static void dwc3_remove(struct platform_device *p=
dev)
> >       pm_runtime_set_suspended(&pdev->dev);
> >
> >       dwc3_free_event_buffers(dwc);
> > -
> > -     if (dwc->usb_psy)
> > -             power_supply_put(dwc->usb_psy);
> >  }
> >
> >  #ifdef CONFIG_PM
> > diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> > index 1e561fd8b86e..3fc58204db6e 100644
> > --- a/drivers/usb/dwc3/core.h
> > +++ b/drivers/usb/dwc3/core.h
> > @@ -993,6 +993,7 @@ struct dwc3_scratchpad_array {
> >  /**
> >   * struct dwc3 - representation of our controller
> >   * @drd_work: workqueue used for role swapping
> > + * @worker: dedicated kthread worker
> >   * @ep0_trb: trb which is used for the ctrl_req
> >   * @bounce: address of bounce buffer
> >   * @setup_buf: used while precessing STD USB requests
> > @@ -1045,7 +1046,7 @@ struct dwc3_scratchpad_array {
> >   * @role_sw: usb_role_switch handle
> >   * @role_switch_default_mode: default operation mode of controller whi=
le
> >   *                   usb role is USB_ROLE_NONE.
> > - * @usb_psy: pointer to power supply interface.
> > + * @usb_psy_name: name of the usb power supply interface
> >   * @usb2_phy: pointer to USB2 PHY
> >   * @usb3_phy: pointer to USB3 PHY
> >   * @usb2_generic_phy: pointer to array of USB2 PHYs
> > @@ -1163,6 +1164,7 @@ struct dwc3_scratchpad_array {
> >   */
> >  struct dwc3 {
> >       struct work_struct      drd_work;
> > +     struct kthread_worker   *worker;
> >       struct dwc3_trb         *ep0_trb;
> >       void                    *bounce;
> >       u8                      *setup_buf;
> > @@ -1223,7 +1225,7 @@ struct dwc3 {
> >       struct usb_role_switch  *role_sw;
> >       enum usb_dr_mode        role_switch_default_mode;
> >
> > -     struct power_supply     *usb_psy;
> > +     const char              *usb_psy_name;
> >
> >       u32                     fladj;
> >       u32                     ref_clk_per;
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> > index 89fc690fdf34..1ff583281eff 100644
> > --- a/drivers/usb/dwc3/gadget.c
> > +++ b/drivers/usb/dwc3/gadget.c
> > @@ -30,6 +30,11 @@
> >  #define DWC3_ALIGN_FRAME(d, n)       (((d)->frame_number + ((d)->inter=
val * (n))) \
> >                                       & ~((d)->interval - 1))
> >
> > +struct dwc3_psy_put {
> > +     struct kthread_work work;
> > +     struct power_supply *psy;
> > +};
> > +
> >  /**
> >   * dwc3_gadget_set_test_mode - enables usb2 test modes
> >   * @dwc: pointer to our context structure
> > @@ -3047,22 +3052,49 @@ static void dwc3_gadget_set_ssp_rate(struct usb=
_gadget *g,
> >       spin_unlock_irqrestore(&dwc->lock, flags);
> >  }
> >
> > +static void dwc3_gadget_psy_put(struct kthread_work *work)
> > +{
> > +     struct dwc3_psy_put     *psy_put =3D container_of(work, struct dw=
c3_psy_put, work);
> > +
> > +     power_supply_put(psy_put->psy);
> > +     kfree(psy_put);
> > +}
> > +
> >  static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA=
)
> >  {
> > -     struct dwc3             *dwc =3D gadget_to_dwc(g);
> > +     struct dwc3                     *dwc =3D gadget_to_dwc(g);
> > +     struct power_supply             *usb_psy;
> >       union power_supply_propval      val =3D {0};
> > +     struct dwc3_psy_put             *psy_put;
> >       int                             ret;
> >
> >       if (dwc->usb2_phy)
> >               return usb_phy_set_power(dwc->usb2_phy, mA);
> >
> > -     if (!dwc->usb_psy)
> > +     if (!dwc->usb_psy_name)
> >               return -EOPNOTSUPP;
> >
> > +     usb_psy =3D power_supply_get_by_name(dwc->usb_psy_name);
> > +     if (!usb_psy) {
> > +             dev_err(dwc->dev, "couldn't get usb power supply\n");
> > +             return -ENODEV;
> > +     }
> > +
> >       val.intval =3D 1000 * mA;
> > -     ret =3D power_supply_set_property(dwc->usb_psy, POWER_SUPPLY_PROP=
_INPUT_CURRENT_LIMIT, &val);
> > +     ret =3D power_supply_set_property(usb_psy, POWER_SUPPLY_PROP_INPU=
T_CURRENT_LIMIT, &val);
> > +     if (ret < 0) {
> > +             dev_err(dwc->dev, "failed to set power supply property\n"=
);
> > +             return ret;
> > +     }
> >
> > -     return ret;
> > +     psy_put =3D kzalloc(sizeof(*psy_put), GFP_ATOMIC);
> > +     if (!psy_put)
> > +             return -ENOMEM;
> > +     kthread_init_work(&psy_put->work, dwc3_gadget_psy_put);
> > +     psy_put->psy =3D usb_psy;
> > +     kthread_queue_work(dwc->worker, &psy_put->work);
> > +
> > +     return 0;
> >  }
> >
> >  /**
> > --
> > 2.46.0.rc2.264.g509ed76dc8-goog
> >

