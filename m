Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E6E721B14
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 01:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232152AbjFDX1w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Jun 2023 19:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbjFDX1u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Jun 2023 19:27:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C19CE
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 16:27:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0E44D60A6F
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 23:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD176C4339B;
        Sun,  4 Jun 2023 23:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685921268;
        bh=R7Rx/ZguoQCrNQxswL3WcHatw0SXMuks6ZHa37NUiaQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mMON494YyipSLrv+54XAoF/rR9VRhOp2YIpDafDBsdOYcyzzQO0eZtrwRGleunC3B
         R/t5oc6rCPqlhGtjjJ3XHmnSlsqshet7OSOyRZwvOtplMPNp0Op9jL8vRIStJZgJF0
         6BnNJkwnMbek6SNqvXdFDKIpGreNeCCVY0eIMb6nb8iH4ISK+7THVr0N8sXOLshQYh
         M2S/anmrGmN7XzzoBOHWgWcCM4juXnx+v7ycWJrZDTAtAZMCtIXd74zyh9ndsluUAL
         GOBSkivtc5oAXG+QYTevO5/fy3ZXd5djNArnzDhRAu6HhrzY/aIZwtUlKJAiSCLONm
         vbsYjiN/kDmnA==
Date:   Mon, 5 Jun 2023 07:27:38 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH 3/3] usb: chipidea: imx: add missing USB PHY DPDM wakeup
 setting
Message-ID: <20230604232738.GI258497@nchen-desktop>
References: <20230517081907.3410465-1-xu.yang_2@nxp.com>
 <20230517081907.3410465-3-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517081907.3410465-3-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-05-17 16:19:07, Xu Yang wrote:
> USB PHY DPDM wakeup bit is enabled by default, when USB wakeup
> is not required(/sys/.../wakeup is disabled), this bit should be
> disabled, otherwise we will have unexpected wakeup if do USB device
> connect/disconnect while system sleep.
> This bit can be enabled for both host and device mode.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index 9566022a2183..9ee9621e2ccc 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -134,7 +134,7 @@
>  #define TXVREFTUNE0_MASK		(0xf << 20)
>  
>  #define MX6_USB_OTG_WAKEUP_BITS (MX6_BM_WAKEUP_ENABLE | MX6_BM_VBUS_WAKEUP | \
> -				 MX6_BM_ID_WAKEUP)
> +				 MX6_BM_ID_WAKEUP | MX6SX_BM_DPDM_WAKEUP_EN)

Acked-by: Peter Chen <peter.chen@kernel.org>

-- 

Thanks,
Peter Chen
