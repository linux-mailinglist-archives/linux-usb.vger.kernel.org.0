Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 219684FEF24
	for <lists+linux-usb@lfdr.de>; Wed, 13 Apr 2022 08:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbiDMGE6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Apr 2022 02:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbiDMGEu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 13 Apr 2022 02:04:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993C8522DA
        for <linux-usb@vger.kernel.org>; Tue, 12 Apr 2022 23:02:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1CFFE61C77
        for <linux-usb@vger.kernel.org>; Wed, 13 Apr 2022 06:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1539C385A3;
        Wed, 13 Apr 2022 06:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649829747;
        bh=HvrUsmz71cLj1divu5+NeKrK0QccgLx3LKBNNoPFmqY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IS7lC7N/coBra+4TEgAvwz0NGNcPYY06a6Aj7vRVJ/P0ZTjZ78RBVoXicQaqe6zuV
         kQxUI7ozwL+lBiDN4rxqsKsRgsNoJPrKTh53Z6NuSc7NKJsmmonos0NIV1CWUTrTqf
         MzJbiNtFjnBAqF4BontGHIkwvcpXmHHE4nlVzaVJdhnf3T5ItKrNfEjJLNjsKEeh6l
         oAfUTrBrloqCAVyUPoYRO91/X9e9ytB/CYtP4kp+pYWtCQXvHC0v+Fy9gU/ant2Ulx
         B4GQkYlVAiJVF+9FaAJf77+qnfxkaQmxpHpC01PpXMSUFVph18pIfAY66YbLa0OFj7
         TmzZ8KPfKtIgg==
Date:   Wed, 13 Apr 2022 11:32:23 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jules Maselbas <jmaselbas@kalray.eu>
Cc:     linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND v3 2/3] phy: core: Update documentation syntax
Message-ID: <YlZnb2dJjaroDfyu@matsya>
References: <20220407102108.24211-1-jmaselbas@kalray.eu>
 <20220407102108.24211-3-jmaselbas@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407102108.24211-3-jmaselbas@kalray.eu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07-04-22, 12:21, Jules Maselbas wrote:
> Update the syntax used by the documentation of phy operation functions.
> This is to unify the syntax with the newly added documentation.

Is there any reason for using this sytax, is it documented somewhere..?
How does this syntax help?

> 
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
> ---
> v2: new patch
> v3: no change
> 
>  drivers/phy/phy-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index d1817a0f2d09..d11b517e283a 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -467,7 +467,7 @@ EXPORT_SYMBOL_GPL(phy_reset);
>   * runtime, which are otherwise lost after host controller reset and cannot
>   * be applied in phy_init() or phy_power_on().
>   *
> - * Returns: 0 if successful, an negative error code otherwise
> + * Return: %0 if successful, a negative error code otherwise
>   */
>  int phy_calibrate(struct phy *phy)
>  {
> @@ -493,7 +493,7 @@ EXPORT_SYMBOL_GPL(phy_calibrate);
>   * on the phy. The configuration will be applied on the current phy
>   * mode, that can be changed using phy_set_mode().
>   *
> - * Returns: 0 if successful, an negative error code otherwise
> + * Return: %0 if successful, a negative error code otherwise
>   */
>  int phy_configure(struct phy *phy, union phy_configure_opts *opts)
>  {
> @@ -527,7 +527,7 @@ EXPORT_SYMBOL_GPL(phy_configure);
>   * PHY, so calling it as many times as deemed fit will have no side
>   * effect.
>   *
> - * Returns: 0 if successful, an negative error code otherwise
> + * Return: %0 if successful, a negative error code otherwise
>   */
>  int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
>  		 union phy_configure_opts *opts)
> -- 
> 2.17.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
~Vinod
