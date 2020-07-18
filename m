Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DA0224E37
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jul 2020 00:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgGRW5W convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 18 Jul 2020 18:57:22 -0400
Received: from sender4-op-o17.zoho.com ([136.143.188.17]:17769 "EHLO
        sender4-op-o17.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgGRW5W (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Jul 2020 18:57:22 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1595113028; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=k9UoHNlzwkdtf0Mjmdng6nBhrMSL160T5NP72dKlMbxhG4UT3ypej7bkwxmesiMR0Uk2G9KMPW2s7CVvrMvNQ6e5t0AYhEObzQ6tZ5hU8yTK+Ag4kzfaNt/sCnQHw4I+cgQEGvm2U0Vxsf+OkSEhedJnYIOReEdtC4LG2GPw80c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1595113028; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=lyGInogPye2qCZtSAptPACNiTAvz7ary0Fijaw+mmho=; 
        b=Vv6KVKD4AM9rtmJPDGn/n0z0hApM0y9eVbHM+DxsxQ38F/G024+QdRgkcOuLFbysP1ZdNqzr3l1ybIT9MeRiHSc17I0SxvTPZ7rjHqkWOiCovEWvSmBNZpqZyHXJc2+b0phV3xyqkWE56YzwShSXSOXl+VHDR02OufgrqMYa1+g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        spf=pass  smtp.mailfrom=dan@dlrobertson.com;
        dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from gothmog.test (pool-108-28-30-30.washdc.fios.verizon.net [108.28.30.30]) by mx.zohomail.com
        with SMTPS id 1595113024776755.2426526892198; Sat, 18 Jul 2020 15:57:04 -0700 (PDT)
Date:   Sat, 18 Jul 2020 18:57:02 -0400
From:   Dan Robertson <dan@dlrobertson.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Message-ID: <20200718225702.GB9969@gothmog.test>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
 <d9c2c755-452d-62bd-f792-1d84b76ceea4@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <d9c2c755-452d-62bd-f792-1d84b76ceea4@baylibre.com>
X-ZohoMailClient: External
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 18, 2020 at 10:47:55AM +0200, Neil Armstrong wrote:
> Hi,
> 
> Le 13/07/2020 à 18:05, Dan Robertson a écrit :
> > The reset is a shared reset line, but reset_control_reset is still used
> > and reset_control_deassert is not guaranteed to have been called before
> > the first reset_control_assert call. When suspending the following
> > warning may be seen:
> > 
> > WARNING: CPU: 1 PID: 5530 at drivers/reset/core.c:355 reset_control_assert+0x184/0x19c
> > Hardware name: Hardkernel ODROID-N2 (DT)
> > [..]
> > pc : reset_control_assert+0x184/0x19c
> > lr : dwc3_meson_g12a_suspend+0x68/0x7c
> > [..]
> > Call trace:
> >  reset_control_assert+0x184/0x19c
> >  dwc3_meson_g12a_suspend+0x68/0x7c
> >  platform_pm_suspend+0x28/0x54
> >  __device_suspend+0x590/0xabc
> >  dpm_suspend+0x104/0x404
> >  dpm_suspend_start+0x84/0x1bc
> >  suspend_devices_and_enter+0xc4/0x4fc
> >  pm_suspend+0x198/0x2d4
> > 
> > Fixes: 6d9fa35a347a87 ("usb: dwc3: meson-g12a: get the reset as shared")
> > Signed-off-by: Dan Robertson <dan@dlrobertson.com>
> > ---
> >  drivers/usb/dwc3/dwc3-meson-g12a.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> > index 1f7f4d88ed9d..88b75b5a039c 100644
> > --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> > +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> > @@ -737,13 +737,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
> >  		goto err_disable_clks;
> >  	}
> >  
> > -	ret = reset_control_reset(priv->reset);
> > +	ret = reset_control_deassert(priv->reset);
> >  	if (ret)
> > -		goto err_disable_clks;
> > +		goto err_assert_reset;
> >  
> >  	ret = dwc3_meson_g12a_get_phys(priv);
> >  	if (ret)
> > -		goto err_disable_clks;
> > +		goto err_assert_reset;
> >  
> >  	ret = priv->drvdata->setup_regmaps(priv, base);
> >  	if (ret)
> > @@ -752,7 +752,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
> >  	if (priv->vbus) {
> >  		ret = regulator_enable(priv->vbus);
> >  		if (ret)
> > -			goto err_disable_clks;
> > +			goto err_assert_reset;
> >  	}
> >  
> >  	/* Get dr_mode */
> > @@ -765,13 +765,13 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
> >  
> >  	ret = priv->drvdata->usb_init(priv);
> >  	if (ret)
> > -		goto err_disable_clks;
> > +		goto err_assert_reset;
> >  
> >  	/* Init PHYs */
> >  	for (i = 0 ; i < PHY_COUNT ; ++i) {
> >  		ret = phy_init(priv->phys[i]);
> >  		if (ret)
> > -			goto err_disable_clks;
> > +			goto err_assert_reset;
> >  	}
> >  
> >  	/* Set PHY Power */
> > @@ -809,6 +809,9 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
> >  	for (i = 0 ; i < PHY_COUNT ; ++i)
> >  		phy_exit(priv->phys[i]);
> >  
> > +err_assert_reset:
> > +	reset_control_assert(priv->reset);
> > +
> >  err_disable_clks:
> >  	clk_bulk_disable_unprepare(priv->drvdata->num_clks,
> >  				   priv->drvdata->clks);
> > 
> 
> 
> This should do the trick, I'll need to check first if it doesn't break the GXL/GXM
> support first.

Awesome. Let me know if you find anything.

Cheers,

 - Dan

