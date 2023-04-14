Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89D506E1CE0
	for <lists+linux-usb@lfdr.de>; Fri, 14 Apr 2023 09:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbjDNHBk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Apr 2023 03:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjDNHBj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Apr 2023 03:01:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361A9268B
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 00:01:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BDDD961591
        for <linux-usb@vger.kernel.org>; Fri, 14 Apr 2023 07:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1D9C433EF;
        Fri, 14 Apr 2023 07:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681455697;
        bh=q5vhTXi3u0lF4+bYdb5jw3bfZdrNKgeLstG8XUwZnb8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L3YTd2MDf5cxZia9JeHFS1Za2liFQfoafcGBIrwExa2FHRH8B6L9V+a452nC32J4h
         EYMftf1uftfGms8DrutVvDZeb6hrMBiySM22tnZfeLgVNhtgDGyNCG7Pdtu8BB81rl
         oAmcCf72PNVR5n9FtHzw5HWB3OT6karjfrrnty7UsvMuVQuNb7tFXzj0nXXfG/BGU9
         YKIAGH8nHdv5+8ANfm+S2nQgMgVuoaRZ62PKsGQuhS8jILbMpjkqiGjaMC7dx3+zcp
         YJ7vif+Fc6+TleKtGlJsxyHPFKeJwQNZ1zwDEpRZ8xR9f4IdiThLv0WfgCl6SvCBi/
         9Wsl8T0QDLmug==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pnDRG-00068Y-4p; Fri, 14 Apr 2023 09:01:42 +0200
Date:   Fri, 14 Apr 2023 09:01:42 +0200
From:   Johan Hovold <johan@kernel.org>
To:     qianfanguijin@163.com
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v1] drivers: usb: wwan: treat any error as a fatal error
Message-ID: <ZDj6Vhv6XHUADSFQ@hovoldconsulting.com>
References: <20230414055306.8805-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414055306.8805-1-qianfanguijin@163.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 14, 2023 at 01:53:06PM +0800, qianfanguijin@163.com wrote:
> From: qianfan Zhao <qianfanguijin@163.com>
> 
> Kernel print such flood message when the modem dead (the device is not
> disconnected but it doesn't response anything):
> 
> option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: -71 on endpoint 05.
> option1 ttyUSB1: usb_wwan_indat_callback: nonzero status: -71 on endpoint 05.
> ...
> 
> So treat any error that doesn't recognized as a fatal error and do not
> resubmit again.

This could potentially break setups that are currently able to recover
from intermittent errors. 

Try adding the missing known fatal ones as you suggested in your other
thread first.

There could still be an issue with -EPROTO (-71) error that would
require some kind of back-off or limit, but that would need to be
implemented in a more central place rather than in each and every usb
driver (as has been discussed in the past).

> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  drivers/usb/serial/usb_wwan.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/serial/usb_wwan.c b/drivers/usb/serial/usb_wwan.c
> index cb01283d4d15..daa3e2beff0f 100644
> --- a/drivers/usb/serial/usb_wwan.c
> +++ b/drivers/usb/serial/usb_wwan.c
> @@ -227,8 +227,7 @@ static void usb_wwan_indat_callback(struct urb *urb)
>  			__func__, status, endpoint);
>  
>  		/* don't resubmit on fatal errors */
> -		if (status == -ESHUTDOWN || status == -ENOENT)
> -			return;
> +		return;
>  	} else {
>  		if (urb->actual_length) {
>  			tty_insert_flip_string(&port->port, data,

Johan
