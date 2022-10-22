Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE116608C63
	for <lists+linux-usb@lfdr.de>; Sat, 22 Oct 2022 13:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbiJVLOo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Oct 2022 07:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbiJVLOX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Oct 2022 07:14:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A9617D2B2
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 03:36:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5F58C60BC8
        for <linux-usb@vger.kernel.org>; Sat, 22 Oct 2022 10:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DCDC433C1;
        Sat, 22 Oct 2022 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1666435001;
        bh=a1K4lfceUJRrwHu7orqSLG2j27RvMee8Q1qJRc1BtGQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Or5Mny8f7ZdtHCy8u13o1QcQBUhfEGO+BroFngQrkmvjpQ2iz4dn4ARKOTzpwmuo+
         76ew2WIF4V5reWrlk3dyufZtKcUonfY5g1aURpX8/U9C2a5ijr/qKQ6bKVa2ijOr+A
         hlA8/4k0wDltOzOGrKS+jywyjVTvM90C9BBDt8Co=
Date:   Sat, 22 Oct 2022 12:36:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Xu Yang <xu.yang.nxp@gmail.com>, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v2 1/4] usb: chipidea: usbmisc_imx: Fix i.MX53 clock sel
 masks
Message-ID: <Y1PHtvVAT5/ND+Zs@kroah.com>
References: <20221018103725.2580679-1-s.hauer@pengutronix.de>
 <20221018103725.2580679-2-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018103725.2580679-2-s.hauer@pengutronix.de>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 18, 2022 at 12:37:22PM +0200, Sascha Hauer wrote:
> According to the reference manual the masks for the
> MX53_USB_CTRL_1_H*_XCVR_CLK_SEL bits are 0x3, not 0x11 (which were
> probably meant as 0b11).
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Reviewed-by: Xu Yang <xu.yang_2@nxp.com>
> Link: https://lore.kernel.org/r/20221011082924.884123-2-s.hauer@pengutronix.de
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/usb/chipidea/usbmisc_imx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

What commit id does this fix?

Should it go to stable kernels?

Same for all of the other patches in this series, please fix up with
that information and resend.

thanks,

greg k-h
