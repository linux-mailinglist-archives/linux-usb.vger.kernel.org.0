Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 746864E5111
	for <lists+linux-usb@lfdr.de>; Wed, 23 Mar 2022 12:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243761AbiCWLPQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Mar 2022 07:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234132AbiCWLPP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Mar 2022 07:15:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67991A384
        for <linux-usb@vger.kernel.org>; Wed, 23 Mar 2022 04:13:45 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <a.fatoum@pengutronix.de>)
        id 1nWyvw-0000S3-7H; Wed, 23 Mar 2022 12:13:44 +0100
Message-ID: <1dba9024-6c48-03da-5d1e-70c05a87c4a8@pengutronix.de>
Date:   Wed, 23 Mar 2022 12:13:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 3/3] phy: core: Warn when phy_power_on is called before
 phy_init
Content-Language: en-US
To:     Jules Maselbas <jmaselbas@kalray.eu>, linux-usb@vger.kernel.org
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20220323110708.8254-1-jmaselbas@kalray.eu>
 <20220323110708.8254-4-jmaselbas@kalray.eu>
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20220323110708.8254-4-jmaselbas@kalray.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Jules,

On 23.03.22 12:07, Jules Maselbas wrote:
> A warning when the order of phy operation is mixed up by drivers,
> this is an atempt to make the phy usage more uniform across (usb)
> drivers.

Thanks for picking up this suggestion.

> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>
> Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
> Cc: Minas Harutyunyan <hminas@synopsys.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> ---
> change in v2:
>   - no changes
> 
>  drivers/phy/phy-core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index cbdad65d2caa..0cb4da62577e 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -252,6 +252,9 @@ int phy_init(struct phy *phy)
>  		return ret;
>  	ret = 0; /* Override possible ret == -ENOTSUPP */
>  
> +	if (phy->power_count > phy->init_count)

This needs to be moved into the critical section below.

> +		dev_warn(&phy->dev, "phy_power_on was called before phy_init\n");

I am wondering how often would this be triggered for e.g. a PHY that's being
runtime suspended. But the warning being obnoxious is the point of the patch,
so perhaps it's ok to not make it into a dev_warn_once. 

> +
>  	mutex_lock(&phy->mutex);
>  	if (phy->init_count == 0 && phy->ops->init) {
>  		ret = phy->ops->init(phy);


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
