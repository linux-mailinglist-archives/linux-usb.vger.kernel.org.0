Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9802C24F3BC
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 10:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725977AbgHXIOm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 04:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgHXIOk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 04:14:40 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42FACC061573
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 01:14:40 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id b17so6937251wru.2
        for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2020 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=64g1Q7AZWdsO3D5S6qaCtbVA6/9fWnLGBi0ctFzWUzY=;
        b=t9HZTtVswLsys3ECXl7sLXTj6WW4EfN/+NlfRYMwuHV33YhAtMPmb4mMYLRANtPXii
         avQO8fp2OTQyF4/bQv9/YeRuJljvJl1kiKLBCRAHTrvJ6ILuf00plzvJkGM13j4OJQ2L
         bIjhF7sw0P+oJrmgs0259v8QP7F2CQS2SNlVB+DySTgLf9yuYN0YihT1X6eLnLi7QKIu
         amb6TR9BoUFvXhBco+vhMTUybYP7FQ/2ysBSwMNqDyGEocQLkrAg1MhI8LLO/QyGkODp
         Z3UkpscR0PsxJNpdlXduDnE0ebmwvCi/tAup0BmHAKx8mNp+ULZt2uTnS4zAgzJ3/MUu
         SgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=64g1Q7AZWdsO3D5S6qaCtbVA6/9fWnLGBi0ctFzWUzY=;
        b=mTyVFXw+7AUq8fnkTMs14CHAsJ5kYKBHK//gFAHFrq3+3q6VCtNktoik9gdW3ny78w
         p9PZtoPTcH1SG5OGLz681/5VwqhkNdiV1maId3xddeee6oeXCLq8kjwEhMGaQj02asiW
         JpkjsJpOk6em4iDQ/Xxew08FoftZcqS0gTbKlGQFPL0RPf9ggHlyE3Vziy31sCuQG9+h
         7VDxF8tRA2/V2wNL2B4SBPFXj5I3Wm2DwFfy/KadiU/wGfsbPb5FdxBN1Dt8tHWyn7m4
         HzFlH+IL8JBO/DAbeErWF9hW9+D4xZpKUsmT76UP83533m7ZiigFifaQg7phm3fZO3Z+
         yOKg==
X-Gm-Message-State: AOAM531TwqysfMV7JdvIJe7gHziVWMZUlmBkmLW2hQcZOTnTXvcUmhGw
        QQEjjQo4h//MiG8Par17gXdssQ==
X-Google-Smtp-Source: ABdhPJybCtQlTlDscuRB4vJUYTuaZX3Jh57pmfzFzQa/+eqUvw+fghCMxnYejaCjezhiY5LGEtJJtA==
X-Received: by 2002:a5d:5551:: with SMTP id g17mr4642448wrw.396.1598256878874;
        Mon, 24 Aug 2020 01:14:38 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o66sm24290460wmb.27.2020.08.24.01.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 01:14:37 -0700 (PDT)
References: <20200713160522.19345-1-dan@dlrobertson.com> <20200713160522.19345-2-dan@dlrobertson.com> <1jy2maekzf.fsf@starbuckisacylon.baylibre.com> <20200820184437.GA4528@nessie>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Dan Robertson <dan@dlrobertson.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, aouledameur@baylibre.com
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
In-reply-to: <20200820184437.GA4528@nessie>
Date:   Mon, 24 Aug 2020 10:14:37 +0200
Message-ID: <1ja6yk4g0i.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Thu 20 Aug 2020 at 20:44, Dan Robertson <dan@dlrobertson.com> wrote:

> On Wed, Aug 19, 2020 at 05:03:32PM +0200, Jerome Brunet wrote:
>> 
>> On Mon 13 Jul 2020 at 18:05, Dan Robertson <dan@dlrobertson.com> wrote:
>> 
>> > The reset is a shared reset line, but reset_control_reset is still used
>> > and reset_control_deassert is not guaranteed to have been called before
>> > the first reset_control_assert call. When suspending the following
>> > warning may be seen:
>> 
>> And now the same type of warning maybe seen on boot. This is
>> happening for me on the libretech-cc (s905x - gxl).
>> 
>> [    1.863469] ------------[ cut here ]------------
>> [    1.867914] WARNING: CPU: 1 PID: 16 at drivers/reset/core.c:309 reset_control_reset+0x130/0x150
>> [    1.876525] Modules linked in:
>> [    1.879548] CPU: 1 PID: 16 Comm: kworker/1:0 Not tainted 5.9.0-rc1-00167-ga2e4e3a34775 #64
>> [    1.887737] Hardware name: Libre Computer AML-S905X-CC V2 (DT)
>> [    1.893525] Workqueue: events deferred_probe_work_func
>> [    1.898607] pstate: 80000005 (Nzcv daif -PAN -UAO BTYPE=--)
>> [    1.904126] pc : reset_control_reset+0x130/0x150
>> [    1.908700] lr : phy_meson_gxl_usb2_init+0x24/0x70
>> [    1.913439] sp : ffff8000123ebad0
>> [    1.916717] x29: ffff8000123ebad0 x28: 0000000000000000 
>> [    1.921978] x27: ffff00007c4b1ac8 x26: ffff00007c4b1ab0 
>> [    1.927239] x25: ffff00007fc149b0 x24: ffff00007c4b1ab0 
>> [    1.932500] x23: ffff00007cd03800 x22: ffff800011fb9000 
>> [    1.937761] x21: ffff00007c60db08 x20: ffff00007c468a80 
>> [    1.943023] x19: ffff00007c466b00 x18: ffffffffffffffff 
>> [    1.948284] x17: 0000000000000000 x16: 000000000000000e 
>> [    1.953545] x15: ffff800011fb9948 x14: ffffffffffffffff 
>> [    1.958806] x13: ffffffff00000000 x12: ffffffffffffffff 
>> [    1.964068] x11: 0000000000000020 x10: 7f7f7f7f7f7f7f7f 
>> [    1.969329] x9 : 78676f2c32617274 x8 : 0000000000000000 
>> [    1.974590] x7 : ffffffffffffffff x6 : 0000000000000000 
>> [    1.979851] x5 : 0000000000000000 x4 : 0000000000000000 
>> [    1.985112] x3 : 0000000000000000 x2 : ffff8000107aa370 
>> [    1.990374] x1 : 0000000000000001 x0 : 0000000000000001 
>> [    1.995636] Call trace:
>> [    1.998054]  reset_control_reset+0x130/0x150
>> [    2.002279]  phy_meson_gxl_usb2_init+0x24/0x70
>> [    2.006677]  phy_init+0x78/0xd0
>> [    2.009784]  dwc3_meson_g12a_probe+0x2c8/0x560
>> [    2.014182]  platform_drv_probe+0x58/0xa8
>> [    2.018149]  really_probe+0x114/0x3d8
>> [    2.021770]  driver_probe_device+0x5c/0xb8
>> [    2.025824]  __device_attach_driver+0x98/0xb8
>> [    2.030138]  bus_for_each_drv+0x74/0xd8
>> [    2.033933]  __device_attach+0xec/0x148
>> [    2.037726]  device_initial_probe+0x24/0x30
>> [    2.041868]  bus_probe_device+0x9c/0xa8
>> [    2.045663]  deferred_probe_work_func+0x7c/0xb8
>> [    2.050150]  process_one_work+0x1f0/0x4b0
>> [    2.054115]  worker_thread+0x210/0x480
>> [    2.057824]  kthread+0x158/0x160
>> [    2.061017]  ret_from_fork+0x10/0x18
>> [    2.064550] ---[ end trace 94d737efe593c6f6 ]---
>> [    2.069158] phy phy-d0078000.phy.0: phy init failed --> -22
>> [    2.074858] dwc3-meson-g12a: probe of d0078080.usb failed with error -22
>> 
>> This breaks USB on this device. reverting the change brings it back.
>> 
>> Looking at the reset framework code, I don't think drivers sharing the
>> same reset line should mix using reset_control_reset() VS
>> reset_control_assert()/reset_control_deassert()
>> 
>
> Thanks for finding this. I was only able to test on the Odroid N2
>
>> >
>> > WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_assert+0x184/0x19c
>> > Hardware name: Hardkernel ODROID-N2 (DT)
>> > [..]
>> > pc : reset_control_assert+0x184/0x19c
>> > lr : dwc3_meson_g12a_suspend+0x68/0x7c
>> > [..]
>> > Call trace:
>> >  reset_control_assert+0x184/0x19c
>> >  dwc3_meson_g12a_suspend+0x68/0x7c
>> >  platform_pm_suspend+0x28/0x54
>> >  __device_suspend+0x590/0xabc
>> >  dpm_suspend+0x104/0x404
>> >  dpm_suspend_start+0x84/0x1bc
>> >  suspend_devices_and_enter+0xc4/0x4fc
>> >  pm_suspend+0x198/0x2d4
>> >
>> > Fixes: 6d9fa35a347a87 ("usb: dwc3: meson-g12a: get the reset as shared")
>> > Signed-off-by: Dan Robertson <dan@dlrobertson.com>
>> > ---
>> >  drivers/usb/dwc3/dwc3-meson-g12a.c | 15 +++++++++------
>> >  1 file changed, 9 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
>> > index 1f7f4d88ed9d..88b75b5a039c 100644
>> > --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
>> > +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
>> > @@ -737,13 +737,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>> >  		goto err_disable_clks;
>> >  	}
>> >  
>> > -	ret = reset_control_reset(priv->reset);
>> > +	ret = reset_control_deassert(priv->reset);
>> 
>> The change introduced here is significant. If the reset is not initially
>> asserted, it never will be before the life of the device.
>> 
>> This means that Linux will have to deal which whatever state is left by the
>> bootloader. This looks sketchy ...
>> 
>> I think the safer way solve the problem here would be to keep using
>> reset_control_reset() and introduce a new API in the reset
>> framework to decrement the reset line "triggered_count"
>> (reset_control_clear() ??)
>
> I have very limited experience with reset controls, but phy_meson_gxl_usb2_init
> calls reset_control_reset on a shared reset line, which should not be done
> according to the reset control docs. Would removing the use of reset_control_reset,
> or using reset_control_(de)assert in phy_meson_gxl_usb2_init also resolve the
> issue?

 As pointed out before, using the deassert() in probe does not provide
 any guarantee that a reset will actually be trigerred on the
 device. Reset are deasserted on boot on these chips so it actually
 likely to never be triggered.
 This defeats the purpose of using resets in our case.

>
>> That way, if all device using the reset line go to suspend, the line will
>> be "reset-able" again by the first device coming out of suspend ?
>> 
>> Philip, would you be ok with such new API ?
>> 
>> In the meantime, I think this change should be reverted. A warning on
>> suspend seems less critical than a regression breaking USB completly.
>
> The reset_control_(de)assert() calls could also be removed from the
> suspend/resume calls for now.

If it is not causing issue, why not.

>
>> >  	if (ret)
>> > -		goto err_disable_clks;
>> > +		goto err_assert_reset;
>> >  
>> >  	ret = dwc3_meson_g12a_get_phys(priv);
>> >  	if (ret)
>> > -		goto err_disable_clks;
>> > +		goto err_assert_reset;
>> >  
>> >  	ret = priv->drvdata->setup_regmaps(priv, base);
>> >  	if (ret)
>> > @@ -752,7 +752,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>> >  	if (priv->vbus) {
>> >  		ret = regulator_enable(priv->vbus);
>> >  		if (ret)
>> > -			goto err_disable_clks;
>> > +			goto err_assert_reset;
>> >  	}
>> >  
>> >  	/* Get dr_mode */
>> > @@ -765,13 +765,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>> >  
>> >  	ret = priv->drvdata->usb_init(priv);
>> >  	if (ret)
>> > -		goto err_disable_clks;
>> > +		goto err_assert_reset;
>> >  
>> >  	/* Init PHYs */
>> >  	for (i = 0 ; i < PHY_COUNT ; ++i) {
>> >  		ret = phy_init(priv->phys[i]);
>> >  		if (ret)
>> > -			goto err_disable_clks;
>> > +			goto err_assert_reset;
>> >  	}
>> >  
>> >  	/* Set PHY Power */
>> > @@ -809,6 +809,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
>> >  	for (i = 0 ; i < PHY_COUNT ; ++i)
>> >  		phy_exit(priv->phys[i]);
>> >  
>> > +err_assert_reset:
>> > +	reset_control_assert(priv->reset);
>> > +
>> >  err_disable_clks:
>> >  	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
>> >  				   priv->drvdata->clks);
>> >
>> >
>> > _______________________________________________
>> > linux-amlogic mailing list
>> > linux-amlogic@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/linux-amlogic
>> 

