Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65F17721B12
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jun 2023 01:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjFDXZ3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Jun 2023 19:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjFDXZ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Jun 2023 19:25:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE07A8
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 16:25:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 184B960A38
        for <linux-usb@vger.kernel.org>; Sun,  4 Jun 2023 23:25:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0327FC433EF;
        Sun,  4 Jun 2023 23:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685921126;
        bh=cJuv8OK4exxC7lhKRaKG4/dNqEiTgdIZYHbTTqrYr3o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hY8N6P2oltf8E7GuO6fGlRfk9LgBXyG9YQoezmzrQszWofwE/lLw3A9VEzyfwEhzL
         Y+LLJb0S2cZCw/Ky95ZywwSaM/WzQvImcIiswsB3tEe0szKY3up+xUpgDMy6o2IUY/
         gh+7OJ3pMwAw5qydQD18EO9S2gJ0yHi7acIURkjarTqLB22cpoAUPElDfu09yQiomW
         iN/s74+NyBRlUVRro/cvd5vNnpmyiAKhENo73kaUX/gtvCd8ZELH8gB/JWYYENANGW
         wGC0PWr0Nob7MRJQRoZCJhyQWMqHwFcKG8QQHSz63mmzfJhWGtL+V2uveSlqO0WV3g
         HS11ClPqeNlWg==
Date:   Mon, 5 Jun 2023 07:25:16 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH 1/3] usb: chipidea: imx: remove one duplicated reg define
Message-ID: <20230604232516.GG258497@nchen-desktop>
References: <20230517081907.3410465-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517081907.3410465-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-05-17 16:19:05, Xu Yang wrote:
> Remove one duplicated definition of MX7D_USB_OTG_PHY_CFG1.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> index c57c1a71a513..be939e77719d 100644
> --- a/drivers/usb/chipidea/usbmisc_imx.c
> +++ b/drivers/usb/chipidea/usbmisc_imx.c
> @@ -113,7 +113,6 @@
>  #define MX7D_USBNC_USB_CTRL2_DP_DM_MASK			(BIT(12) | BIT(13) | \
>  							BIT(14) | BIT(15))
>  
> -#define MX7D_USB_OTG_PHY_CFG1		0x30
>  #define MX7D_USB_OTG_PHY_CFG2_CHRG_CHRGSEL	BIT(0)
>  #define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATDETENB0	BIT(1)
>  #define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATSRCENB0	BIT(2)
> -- 
> 2.34.1
> 

Acked-by: Peter Chen <peter.chen@kenrel.org>

-- 

Thanks,
Peter Chen
