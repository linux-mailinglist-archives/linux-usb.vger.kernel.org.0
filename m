Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA76721B13
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 01:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjFDX0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Jun 2023 19:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbjFDX0H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Jun 2023 19:26:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CCAEA8
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 16:26:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD63C601DA
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 23:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961CFC433D2;
        Sun,  4 Jun 2023 23:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685921165;
        bh=9mkcoXE0OoONtSCo8YbMkMzWMOe6QI1vae/yfzoJzuE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EwflGq9ea8ORsiOuYD1drgUrBt+phecC3PQoewP8iKtH/fKbHW3kbaX488KCEcrJ4
         TviOBWW4ulKpZJDmjgql0Yy7I01GCFXzb1YzrJZc3174GtbukYJLskSdIpJD+W4In9
         W//dOrA3dtYK8gmg2zg2yUb1Dw/ffOUuarJ+ZY/F3A1erbWjzr9wS7VIKq+asC/B9o
         j4tEkinWhiEFZ27dnVQiqpfRFlooEuEZlAdfxKm4oUXBHmRUy3MWyacnN3wcIbj6RI
         tEBRRoTac3chmLa3pmPIcC8TYgCQ2tM75XBliGAQ2IlDVZ1gskW0Ohz/ONJ9QWxilV
         OPWFgx7VBTqAg==
Date:   Mon, 5 Jun 2023 07:25:54 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH 2/3] usb: chipidea: imx: turn off vbus comparator when
 suspend
Message-ID: <20230604232554.GH258497@nchen-desktop>
References: <20230517081907.3410465-1-xu.yang_2@nxp.com>
 <20230517081907.3410465-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517081907.3410465-2-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-05-17 16:19:06, Xu Yang wrote:
> As we use bvalid for vbus wakeup source, to save power when
> suspend, turn off the vbus comparator for imx7d and imx8mm.
> 
> Below is this bit description from RM of iMX8MM
> "VBUS Valid Comparator Enable:
> 
> This signal controls the USB OTG PHY VBUS Valid comparator which
> indicates whether the voltage on the USB_OTG*_VBUS pin is below
> the VBUS Valid threshold. The VBUS Valid threshold is nominally
> 4.75V on this USB PHY. The VBUS Valid threshold can be adjusted
> using the USBNC_OTGn_PHY_CFG1[OTGTUNE0] bit field. Status of the
> VBUS Valid comparator, when it is enabled, is reported on the
> USBNC_OTGn_PHY_STATUS[VBUS_VLD] bit.
> When OTGDISABLE0 (USBNC_USB_OTGx_PHY_CFG2[10])is set to 1'b0 and
> DRVVBUS0 is set to 1'b1, the Bandgap circuitry and VBUS Valid
> comparator are powered, even in Suspend or Sleep mode.
> DRVVBUS0 should be reset to 1'b0 when the internal VBUS Valid comparator
> is not required, to reduce quiescent current in Suspend or Sleep mode.
>  - 0 The VBUS Valid comparator is disabled
>   - 1 The VBUS Valid comparator is enabled"
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 35 ++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index be939e77719d..9566022a2183 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -151,6 +151,7 @@ struct usbmisc_ops {
>  	int (*charger_detection)(struct imx_usbmisc_data *data);
>  	/* It's called when system resume from usb power lost */
>  	int (*power_lost_check)(struct imx_usbmisc_data *data);
> +	void (*vbus_comparator_on)(struct imx_usbmisc_data *data, bool on);
>  };
>  
>  struct imx_usbmisc {
> @@ -874,6 +875,33 @@ static int imx7d_charger_detection(struct imx_usbmisc_data *data)
>  	return ret;
>  }
>  
> +static void usbmisc_imx7d_vbus_comparator_on(struct imx_usbmisc_data *data,
> +					     bool on)
> +{
> +	unsigned long flags;
> +	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> +	u32 val;
> +
> +	if (data->hsic)
> +		return;
> +
> +	spin_lock_irqsave(&usbmisc->lock, flags);
> +	/*
> +	 * Disable VBUS valid comparator when in suspend mode,
> +	 * when OTG is disabled and DRVVBUS0 is asserted case
> +	 * the Bandgap circuitry and VBUS Valid comparator are
> +	 * still powered, even in Suspend or Sleep mode.
> +	 */
> +	val = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
> +	if (on)
> +		val |= MX7D_USB_OTG_PHY_CFG2_DRVVBUS0;
> +	else
> +		val &= ~MX7D_USB_OTG_PHY_CFG2_DRVVBUS0;
> +
> +	writel(val, usbmisc->base + MX7D_USB_OTG_PHY_CFG2);
> +	spin_unlock_irqrestore(&usbmisc->lock, flags);
> +}
> +
>  static int usbmisc_imx7ulp_init(struct imx_usbmisc_data *data)
>  {
>  	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
> @@ -1017,6 +1045,7 @@ static const struct usbmisc_ops imx7d_usbmisc_ops = {
>  	.set_wakeup = usbmisc_imx7d_set_wakeup,
>  	.charger_detection = imx7d_charger_detection,
>  	.power_lost_check = usbmisc_imx7d_power_lost_check,
> +	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
>  };
>  
>  static const struct usbmisc_ops imx7ulp_usbmisc_ops = {
> @@ -1131,6 +1160,9 @@ int imx_usbmisc_suspend(struct imx_usbmisc_data *data, bool wakeup)
>  
>  	usbmisc = dev_get_drvdata(data->dev);
>  
> +	if (usbmisc->ops->vbus_comparator_on)
> +		usbmisc->ops->vbus_comparator_on(data, false);
> +
>  	if (wakeup && usbmisc->ops->set_wakeup)
>  		ret = usbmisc->ops->set_wakeup(data, true);
>  	if (ret) {
> @@ -1184,6 +1216,9 @@ int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup)
>  		goto hsic_set_clk_fail;
>  	}
>  
> +	if (usbmisc->ops->vbus_comparator_on)
> +		usbmisc->ops->vbus_comparator_on(data, true);
> +
>  	return 0;
>  

Acked-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen
