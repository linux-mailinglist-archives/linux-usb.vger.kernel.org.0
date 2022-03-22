Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 167474E46E4
	for <lists+linux-usb@lfdr.de>; Tue, 22 Mar 2022 20:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbiCVTsO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Mar 2022 15:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiCVTsN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Mar 2022 15:48:13 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C83CF3ED09
        for <linux-usb@vger.kernel.org>; Tue, 22 Mar 2022 12:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=J2hpHWDxPiDnMCgtmnoOUt8ohMP+nePE3ppMXs/1DtU=; b=LJHsq7N5Bgb6qXi/uKl2Wb10yj
        S8JutEpGAqvQESD89FGSCfcSB6uwWNsMWVl4g74nb9FkATMHdqFsG9mUHJFFkRQKW+sp6XQ3PqAQf
        d8gf3iSPzkb3joTN8ec4Mlog5FMxycoGqL9I96GjqB3xVrcvZVTpTzDtB2rTtL+S2DWccOJkVKzyH
        HCYuA/ZE2sE8QDPgq9zcWgyTOTyqZNVfKkHEICvC2xjTnWu8lmow3+NOGZ4GaH0shGDo3i9u5KbnB
        KSmnOfo+d9ol8i8/5w/e0tb4UX15uTW6+Ds1NUjMywr1VcBONF8v28nmZL8SZfQVvg/iTlv7hl5+I
        5tEK+tCg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nWkSh-003Y7g-KZ; Tue, 22 Mar 2022 19:46:35 +0000
Message-ID: <ade1902f-f18c-6495-de09-7bbeb8c825b1@infradead.org>
Date:   Tue, 22 Mar 2022 12:46:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] phy: core: Add documentation of phy operation order
Content-Language: en-US
To:     Jules Maselbas <jmaselbas@kalray.eu>, linux-usb@vger.kernel.org
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>
References: <20220322143011.16580-1-jmaselbas@kalray.eu>
 <20220322143011.16580-2-jmaselbas@kalray.eu>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220322143011.16580-2-jmaselbas@kalray.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi--

On 3/22/22 07:30, Jules Maselbas wrote:
> Add documentation on phy function usage: init function must be
> called before power_on; power_off must be called before exit.
> 
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> CC: Ahmad Fatoum <a.fatoum@pengutronix.de>
> CC: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
> ---
>  drivers/phy/phy-core.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 91e28d6ce450..ed10cbb24b08 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -229,6 +229,17 @@ void phy_pm_runtime_forbid(struct phy *phy)
>  }
>  EXPORT_SYMBOL_GPL(phy_pm_runtime_forbid);
>  
> +/**
> + * phy_init - phy internal initialization before phy operation
> + * @phy: the phy returned by phy_get()
> + *
> + * Used to allow phy's driver to perform phy internal initialization,
> + * such as PLL block powering, clock initialization or anything that's
> + * is required by the phy to perform the start of operation.
> + * Must be called before phy_power_on().
> + *
> + * Returns: 0 if successful, an negative error code otherwise

    * Return: %0 if successful, a negative error code otherwise

(in all 4 functions)

> + */
>  int phy_init(struct phy *phy)

-- 
~Randy
