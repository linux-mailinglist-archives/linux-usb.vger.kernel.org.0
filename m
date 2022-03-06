Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515B44CEBCE
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 14:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbiCFN6R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 08:58:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbiCFN6Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 08:58:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B2123BE9
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 05:57:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D446AB80E88
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 13:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0413BC340EC;
        Sun,  6 Mar 2022 13:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1646575040;
        bh=/jaMnA9gEr2PHz5SHjyGjFkhdrgpJn4FkADnGh8FrVs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bH4JcaXsB590LkDKsDp1p3BaA2s1+GFgMFayg2vULvydjbRCk+gYVG0r8PSxpOD4e
         YNmfRMbhiwY0EowhZsqXooo19ZYdHyQtxl2rx8exoXSzhDJCsBvk4PsyOb6uMiiV16
         dbhneNAiAzcCAhuSPG1KUPNy+Pkp2jj2C3GDFVxs=
Date:   Sun, 6 Mar 2022 14:57:17 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v3] usb: dwc3: gadget: move cmd_endtransfer to extra
 function
Message-ID: <YiS9vZWoONJKTbpL@kroah.com>
References: <d2cba6f5-6de8-f5f6-f639-9f4a384d1f77@synopsys.com>
 <20220305005356.1400365-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220305005356.1400365-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Mar 05, 2022 at 01:53:56AM +0100, Michael Grzeschik wrote:
> This patch adds the extra function __dwc3_stop_active_transfer to
> consolidate the same codepath.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> 
> ---
> v1 -> v2: - renamed the function to __dwc3_stop_active_transfer
>           - added function description
> v2 -> v3: - fixed spelling and removed extra line
> 	  - make __dwc3_stop_active_transfer return ret
> 	  - use ret in __dwc3_gadget_start_isoc

So is this v3 of a single patch in this series, or the whole series?

I'm totally confused, please resend the whole, updated series, as v4
please.

thanks,

greg k-h
