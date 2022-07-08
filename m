Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1409956B9F0
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jul 2022 14:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237622AbiGHMph (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jul 2022 08:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237638AbiGHMpg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jul 2022 08:45:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2532659277
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 05:45:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C9783B826A6
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 12:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A02C341C0;
        Fri,  8 Jul 2022 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1657284333;
        bh=4+tU0po0K5bi+AuXMoqQmUKjo+tjw2nPFZTMJWjQAlE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vGkRJx2SS2UEivEb7y1aAcQYQWdqihRBU4WQ+BkgZs7LHFB3OaFDbuLjZ8B6mbc0D
         krOwT9WaU5Bry5gPm/tLH+EzTcguqh5JUfVvASmnspYtIBr/bvG/rEpGPyw8e9m/ee
         KBxbbIjsz2kxjqwHdJwd2qXgIp7zGJvrq0LftiZc=
Date:   Fri, 8 Jul 2022 14:45:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 2/2] usb: dwc3: gadget: fix high speed multiplier
 setting
Message-ID: <Ysgm6nD02TKEYJeq@kroah.com>
References: <20220704141812.1532306-1-m.grzeschik@pengutronix.de>
 <20220704141812.1532306-3-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704141812.1532306-3-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 04, 2022 at 04:18:12PM +0200, Michael Grzeschik wrote:
> For High-Speed Transfers the prepare_one_trb function is calculating the
> multiplier setting for the trb based on the length parameter of the trb
> currently prepared. This assumption is wrong. For trbs with a sg list,
> the length of the actual request has to be taken instead.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
> v1 -> v2: - added refactor patch before this patch
>           - using req->request.length as condition value

Does this need to be backported to older kernels or is it ok for
5.20-rc1?

thanks,

greg k-h
