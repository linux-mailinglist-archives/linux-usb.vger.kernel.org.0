Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1541751BF1B
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 14:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238588AbiEEMVT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 08:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359369AbiEEMVR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 08:21:17 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034AF54FAE
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 05:17:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6FAD9CE2C79
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 12:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDFFC385A8;
        Thu,  5 May 2022 12:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651753054;
        bh=jJLAmWqRtuWSYV+n520sjPETPlkkDFbRsgF50I2xMd0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J+rKmrhEScr5yUnqoGiMyrllPMUhYI75H3uqkdTzZoti3/9Rh73ikqcNbQdLPFETf
         D/+1MunWAkHhivAYNH2qZUsFRxUHPYhmsdKKQrngiqp4BaeTlcJnFKmHOMGF3pL4ZV
         9U60BxEyhnmWm4czzJ3FVtEaav1eCgREJoICsQ6pClRvX79is6KR5WBYf/LaIgSx7i
         lec/3zk+2qgpUPiYrzKXD2Yg6Ak/dmsOO3ool/AjPunN+hZhg2vqtZZ4bDcW6VUEJQ
         9GW/tvdCBjHbScp156/TYJUp4j5X9lWZNyKOPsMx8Vdx15fuWS/RuSKxbypgeRITZY
         ZKhfOTrS1N8Zg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nmaQI-0006PW-PG; Thu, 05 May 2022 14:17:35 +0200
Date:   Thu, 5 May 2022 14:17:34 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Daniels Umanovskis <du@axentia.se>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: ftdi_sio: fix format specifier
Message-ID: <YnPAXkvS571jWrS2@hovoldconsulting.com>
References: <20220426123714.2000-1-du@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426123714.2000-1-du@axentia.se>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 26, 2022 at 12:37:35PM +0000, Daniels Umanovskis wrote:
> The latency is an unsigned int and should be printed as such
> 
> Signed-off-by: Daniels Umanovskis <du@axentia.se>
> ---
>  drivers/usb/serial/ftdi_sio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
> index 49c08f07c969..b440d338a895 100644
> --- a/drivers/usb/serial/ftdi_sio.c
> +++ b/drivers/usb/serial/ftdi_sio.c
> @@ -1671,7 +1671,7 @@ static ssize_t latency_timer_show(struct device *dev,
>  	if (priv->flags & ASYNC_LOW_LATENCY)
>  		return sprintf(buf, "1\n");
>  	else
> -		return sprintf(buf, "%i\n", priv->latency);
> +		return sprintf(buf, "%u\n", priv->latency);
>  }
>  
>  /* Write a new value of the latency timer, in units of milliseconds. */

While latency is indeed an unsigned int it only holds values in the
range 0..255.

Applied with an amended commit:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-next

Johan
