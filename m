Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1A8721B09
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 01:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232474AbjFDXR0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Jun 2023 19:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230378AbjFDXRZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Jun 2023 19:17:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B0BA9
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 16:17:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 52E2F60C7A
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 23:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E34EC433EF;
        Sun,  4 Jun 2023 23:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685920643;
        bh=lLXxhmHuTpdEgjdhdN6kOgGjwZKnjXgDZ9PMqOVOxGI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TlMd9+z3vTNafqIAYi30n98Uk81wQ3uVB68YECbeKRR4n72dR1smtw/VKusB7BpZp
         awaVyL2szpCSklWDSh6QaqDxxzkwQZE5M6QfZNv7hFIWHnejwo4nUfll0HqHSg7YRo
         K9hqVFIBmUh2qGOl7SPgLz5bPaPgou4x5miyGXunBPPh3KebkaYDvDjZw4353aDnO7
         F84M39eTtj0CTe5YaFjfSy2sF4RVSccz/KPtd+BZ4bc2qv5ER1nJMJW7zbgnjGSJx9
         BZKPxk6osau9bO7Kpbh3fzvuTq57dybRU0swqSdMLglTqNKsaK4pgtTLLU8nkIlXcm
         Tb5WtITAk5ssA==
Date:   Mon, 5 Jun 2023 07:17:11 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Shenwei Wang <shenwei.wang@nxp.com>
Cc:     Pawel Laszczak <pawell@cadence.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Roger Quadros <rogerq@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH] usb: cdns3: imx: Rework system PM to avoid duplicated
 operations
Message-ID: <20230604231711.GD258497@nchen-desktop>
References: <20230523184412.204582-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523184412.204582-1-shenwei.wang@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-05-23 13:44:12, Shenwei Wang wrote:
> The current implementation uses the same callbacks for system PM and
> runtime PM suspend/resume without any state checking. This can cause the
> clocks to be prepared/unprepared twice, leading to kernel warning issues.
> 
> This patch resolves the double prepare/unprepare issues by separating the
> runtime PM and system PM handling.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Reviewed-by: Frank Li <frank.li@nxp.com>
> ---
>  drivers/usb/cdns3/cdns3-imx.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
> index 59860d1753fd..1c6bc6036c15 100644
> --- a/drivers/usb/cdns3/cdns3-imx.c
> +++ b/drivers/usb/cdns3/cdns3-imx.c
> @@ -375,14 +375,22 @@ static inline bool cdns_imx_is_power_lost(struct cdns_imx *data)
>  		return false;
>  }
>  
> +static int __maybe_unused cdns_imx_system_suspend(struct device *dev)
> +{
> +	pm_runtime_put_sync(dev);
> +	return 0;
> +}
> +
>  static int __maybe_unused cdns_imx_system_resume(struct device *dev)
>  {
>  	struct cdns_imx *data = dev_get_drvdata(dev);
>  	int ret;
>  
> -	ret = cdns_imx_resume(dev);
> -	if (ret)
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Could not get runtime PM.\n");
>  		return ret;
> +	}
>  
>  	if (cdns_imx_is_power_lost(data)) {
>  		dev_dbg(dev, "resume from power lost\n");
> @@ -405,7 +413,7 @@ static int cdns_imx_platform_suspend(struct device *dev,
>  
>  static const struct dev_pm_ops cdns_imx_pm_ops = {
>  	SET_RUNTIME_PM_OPS(cdns_imx_suspend, cdns_imx_resume, NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(cdns_imx_suspend, cdns_imx_system_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(cdns_imx_system_suspend, cdns_imx_system_resume)
>  };
>  
>  static const struct of_device_id cdns_imx_of_match[] = {
> -- 
> 2.34.1
> 

Acked-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen
