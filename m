Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 140D956B9FA
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jul 2022 14:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238004AbiGHMpQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jul 2022 08:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237638AbiGHMpP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jul 2022 08:45:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD28326C2
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 05:45:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 39DFAB8263A
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 12:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D9EC341C0;
        Fri,  8 Jul 2022 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1657284311;
        bh=28HQJMXDVcFg8H9iyuhT99UTasGxw7V7a9Ci28zF+mI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PK0GlmH/bP71avB4NeVJL3RVFPlmNbGXVc9qlt3uhLmOiGV0o/agSTXRLuVwN3mnL
         QaxjIiCB98ELz/qV4Xfw9zvOmvCdhZ7XXiNYOtgHfZadOfYdiJXIw5JqBYc9a7/ehH
         fhWP/9jz9EDVAeSKMHR6PdK8WK7geejO12zDl4UI=
Date:   Fri, 8 Jul 2022 14:45:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 1/2] usb: dwc3: gadget: refactor dwc3_repare_one_trb
Message-ID: <Ysgm1fc8Of9PhV7d@kroah.com>
References: <20220704141812.1532306-1-m.grzeschik@pengutronix.de>
 <20220704141812.1532306-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704141812.1532306-2-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 04, 2022 at 04:18:11PM +0200, Michael Grzeschik wrote:
> The function __dwc3_prepare_one_trb has many parameters. Since it is
> only used in dwc3_prepare_one_trb there is no point in keeping the
> function. We merge both functions and get rid of the big list of
> parameters.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
> v1 -> v2: - new patch
> 
>  drivers/usb/dwc3/gadget.c | 92 +++++++++++++++++----------------------
>  1 file changed, 40 insertions(+), 52 deletions(-)

Much nicer, thanks!

