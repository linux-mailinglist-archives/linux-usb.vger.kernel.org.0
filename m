Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACA07774DD
	for <lists+linux-usb@lfdr.de>; Thu, 10 Aug 2023 11:46:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234827AbjHJJqP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Aug 2023 05:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234793AbjHJJqN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Aug 2023 05:46:13 -0400
Received: from h2.cmg1.smtp.forpsi.com (h2.cmg1.smtp.forpsi.com [81.2.195.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BBEF1724
        for <linux-usb@vger.kernel.org>; Thu, 10 Aug 2023 02:46:09 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id U2F3qgec1Pm6CU2F5qEljw; Thu, 10 Aug 2023 11:46:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691660767; bh=o4XBNbolrssQcSw9sxbyihwgl/F+LSXsGKmTucPYTu0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=aLVkcPP0jGpWWNlhCjnKUlT2YAFsccrhyikmuPsfG+LW4pE5mMwPmjsIWMqm+n8AW
         eInzA/AAZ1cGk/ZblaVuLeiTfYtjbnXm5CB6b5qHxKaOTOWz6Ibv1OVjKGpdnK9VTj
         mWsHE1Kw4LUy5w4/xedOhUlnM3vls/anFkwYD34RRdPMUi8ituA9k2jRW+721HqfJ1
         Lk+0FDBhBg6TuF6uV4aJwr5HXpGWhd6/rPt+DeNZ9DsFruFr0hcdRCUJIZD1DBReja
         AIUJKjmYqkyJQmoHnnbyve8BjWBjDKuqHUnJW1rQhVeAvjtuloQRmy19dcYLYzLGe4
         ISCF8/ZlSeLrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691660767; bh=o4XBNbolrssQcSw9sxbyihwgl/F+LSXsGKmTucPYTu0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=aLVkcPP0jGpWWNlhCjnKUlT2YAFsccrhyikmuPsfG+LW4pE5mMwPmjsIWMqm+n8AW
         eInzA/AAZ1cGk/ZblaVuLeiTfYtjbnXm5CB6b5qHxKaOTOWz6Ibv1OVjKGpdnK9VTj
         mWsHE1Kw4LUy5w4/xedOhUlnM3vls/anFkwYD34RRdPMUi8ituA9k2jRW+721HqfJ1
         Lk+0FDBhBg6TuF6uV4aJwr5HXpGWhd6/rPt+DeNZ9DsFruFr0hcdRCUJIZD1DBReja
         AIUJKjmYqkyJQmoHnnbyve8BjWBjDKuqHUnJW1rQhVeAvjtuloQRmy19dcYLYzLGe4
         ISCF8/ZlSeLrg==
Date:   Thu, 10 Aug 2023 11:46:05 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH -next] usb: dwc3: dwc3-octeon: remove unnecessary
 platform_set_drvdata()
Message-ID: <ZNSx3Qv8ypMbOkho@lenoch>
References: <20230810015117.3085574-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810015117.3085574-1-yangyingliang@huawei.com>
X-CMAE-Envelope: MS4wfDZ3Sa/RFJxGnt7/9zmhr5tRaD4xG6riXJ8LBzFLJ/GDnrV05htwkENAfUclPWS94/6VlADcfzI/JOoqT+YPUAieXyeijdAt7wcFXe3lVcaAmuXU+sUl
 3fm9twBd3oG5dEns+Ih31SKnD4GAZV9zzKBbwPQXBx1f74NYmesplauPqy9fqoxFWNIV0jJO1RrFAbdOVgHQX/vbwTeTD34w+GVIt8RmUwk4FldKaYT6ew1C
 scJxp1P2IzSpkKRZzwq9CC+Ohler2U5GKbp/59kh2kpMvJGWWYisM5+UfpjuK366
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 10, 2023 at 09:51:17AM +0800, Yang Yingliang wrote:
> Remove unnecessary platform_set_drvdata(..., NULL) in ->remove(),
> the driver_data will be cleared in device_unbind_cleanup() after
> calling ->remove() in driver call code.

Isn't the same true also for dwc3-imx8mp, dwc3-keystone and dwc3-am62.c?

> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/usb/dwc3/dwc3-octeon.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
> index 6b6581057345..356347780c15 100644
> --- a/drivers/usb/dwc3/dwc3-octeon.c
> +++ b/drivers/usb/dwc3/dwc3-octeon.c
> @@ -517,7 +517,6 @@ static void dwc3_octeon_remove(struct platform_device *pdev)
>  	struct dwc3_octeon *octeon = platform_get_drvdata(pdev);
>  
>  	of_platform_depopulate(octeon->dev);
> -	platform_set_drvdata(pdev, NULL);
>  }
>  
>  static const struct of_device_id dwc3_octeon_of_match[] = {
> -- 
> 2.25.1
