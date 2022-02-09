Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922A14AE963
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 06:38:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbiBIFiY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 00:38:24 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234689AbiBIFfl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 00:35:41 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2147AC02B5DF
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 21:35:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BDBD361599
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 05:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C936C340E7;
        Wed,  9 Feb 2022 05:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644384916;
        bh=LG65VMxKxNDbqS9602sbJaOISOYTNkjiJdcMp75HfY4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iF1d2J0i13GuSrcSsiXSyINgsjfukd128KC5qYm3mKuGjA//xg6HJFufXUN/eIlb8
         02DVOOehvchkKCubOMi0ZmaPYONl/PE6ouqas2a5QUD7iszSFc264lG+y6mLcMaiSE
         dvwMX3cfhNEFLYliXWNMt7nzToiEIEdSBKq9qFr4=
Date:   Wed, 9 Feb 2022 06:35:13 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: common: usb-otg-fsm: drop unreachable code in
 otg_statemachine()
Message-ID: <YgNSkY/Hd811Vhu1@kroah.com>
References: <5c923258-67c3-bae1-80d1-87a187202a4c@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c923258-67c3-bae1-80d1-87a187202a4c@omp.ru>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 08, 2022 at 11:32:28PM +0300, Sergey Shtylyov wrote:
> The *switch* statement in otg_statemachine() does handle all possible OTG
> states explicitly, so the *default* label is unreachable.
> 
> Found by Linux Verification Center (linuxtesting.org) with the SVACE static
> analysis tool.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---
> This patch is against the 'usb-next' branch of Greg KH's 'usb.git' repo.
> Peter Chen's 'usb.git' repo seems outdated, so I chose to ignore it...
> 
>  drivers/usb/common/usb-otg-fsm.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> Index: usb/drivers/usb/common/usb-otg-fsm.c
> ===================================================================
> --- usb.orig/drivers/usb/common/usb-otg-fsm.c
> +++ usb/drivers/usb/common/usb-otg-fsm.c
> @@ -440,8 +440,6 @@ int otg_statemachine(struct otg_fsm *fsm
>  		if (fsm->id || fsm->a_bus_drop || fsm->a_clr_err)
>  			otg_set_state(fsm, OTG_STATE_A_WAIT_VFALL);
>  		break;
> -	default:
> -		break;
>  	}
>  	mutex_unlock(&fsm->lock);
>  

There is nothing wrong with leaving lines like this in the code to
handle any potential bugs.

Why do you think it needs to be removed?  What benefit does this patch
have?
