Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6820552B01
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 08:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345490AbiFUGfW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 02:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235008AbiFUGfV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 02:35:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392A612D0B
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 23:35:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CB54F60F5F
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 06:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94C9C3411D;
        Tue, 21 Jun 2022 06:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1655793319;
        bh=yov2uPNFO5XL7IOBxlN6Wi9K9OxSUdcV523N05Wop70=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Q+6zre2t1VJz0puvg53RlUcRpWJydmS0k7pSSk05LqWtaChlot0rSWzI4LDjDit88
         4ZUFjPr7MObJpe/B9H49HoUOFCWj+DyExdxB86JUkUe0AIAqzuwVAx9oLMdAnNSUoK
         B6CvYO6BJ4/Zv7+Flbv7MFwrcop0g52hdsvm1o+M=
Date:   Tue, 21 Jun 2022 08:35:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hyunwoo Kim <imv4bel@gmail.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-q: Fix
 ehci_submit_single_step_set_feature annotation typo
Message-ID: <YrFmoyW3q2CPLpok@kroah.com>
References: <20220620213621.GA694104@ubuntu>
 <YrFfmEeaxbbhxK0p@kroah.com>
 <20220621062925.GA698414@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621062925.GA698414@ubuntu>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 20, 2022 at 11:29:25PM -0700, Hyunwoo Kim wrote:
> >From 3ba1bf7eb8e672fcd5be65080a265d3428d1303a Mon Sep 17 00:00:00 2001
> From: Hyunwoo Kim <imv4bel@gmail.com>
> Date: Mon, 20 Jun 2022 14:30:10 -0700
> Subject: [PATCH] usb: host: ehci-q: Fix ehci_submit_single_step_set_feature annotation typo

This shouldn't be in the body of the email, try using 'git send-email'
instead.

> 
> I found the "argument" typo.
> It seems that "argument" is more correct than "arguement".

That is much better, thanks.

> 
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> ---
>  drivers/usb/host/ehci-q.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
> index 1163af6fad77..807e64991e3e 100644
> --- a/drivers/usb/host/ehci-q.c
> +++ b/drivers/usb/host/ehci-q.c
> @@ -1162,7 +1162,7 @@ submit_async (
>   * This is done in two parts: first SETUP req for GetDesc is sent then
>   * 15 seconds later, the IN stage for GetDesc starts to req data from dev
>   *
> - * is_setup : i/p arguement decides which of the two stage needs to be
> + * is_setup : i/p argument decides which of the two stage needs to be
>   * performed; TRUE - SETUP and FALSE - IN+STATUS
>   * Returns 0 if success
>   */
> --
> 2.25.1
> 
> Dear Greg,
> 
> I'm sending the patch back because the greg email bot emailed me.
> I don't think there was anything wrong with the patch format.
> Did I receive an email saying my patch was in the wrong format because 
> my patch was a minor typo fix and the description was too short?


This looks better, but can you resend this without the above header in
the body and then we can apply it.

thanks,

greg k-h
