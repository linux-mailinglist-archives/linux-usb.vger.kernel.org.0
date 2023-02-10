Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05556691A6A
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 09:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbjBJIzT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 03:55:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231649AbjBJIzR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 03:55:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95E18661F
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 00:55:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5E8B261D07
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 08:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493C8C433EF;
        Fri, 10 Feb 2023 08:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676019315;
        bh=yNgfgtSmvw60Z9I2WPizvnxFmzneg5/LUvXNSaskAU4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V6VYxevc/n03VfoUBe11DgcAju7u23qNTasZcc1KiUqiNeYGcXG0q3wkQKbQaeIv8
         PwO96bxT8nj56D2oklSxXeCig6cINyiek9M5BmroZqmjYJNXmv/Fx1wvXvGNtQ7nr4
         cO3prN7z0Ni7HxkqGjRaJRRjZchIZVsgXnF8vrM9NkqKF5AhzU6wEf1aYQnhAkaDiW
         cySSsXiSIMghh5Hurm5BvSYTiJ5vqNdgWgMuKlzXnzLUxS32jJZCmkNFsS27KUnFP5
         cMHDnM0bNfjn356KfOYERwx6ubSQr4qcwZytXGWPuFoONICtBi1viOs037j8Evy5hH
         s8lThfkNAcGxQ==
Date:   Fri, 10 Feb 2023 16:55:05 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH v2 1/3] usb: chipdea: core: don't return -EINVAL if
 request role is the same with current role
Message-ID: <20230210085505.GC1991028@nchen-desktop>
References: <20221130081231.3127369-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130081231.3127369-1-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22-11-30 16:12:29, Xu Yang wrote:
> It should not return -EINVAL if the request role is the same with current
> role, return non-error and without do anything instead.
> 
> Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> ---
> changes since v1:
> - no change
> ---
>  drivers/usb/chipidea/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 484b1cd23431..fcb175b22188 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -984,9 +984,12 @@ static ssize_t role_store(struct device *dev,
>  			     strlen(ci->roles[role]->name)))
>  			break;
>  
> -	if (role == CI_ROLE_END || role == ci->role)
> +	if (role == CI_ROLE_END)
>  		return -EINVAL;
>  
> +	if (role == ci->role)
> +		return n;
> +
>  	pm_runtime_get_sync(dev);
>  	disable_irq(ci->irq);
>  	ci_role_stop(ci);
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
