Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2934B50D8C0
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 07:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241224AbiDYFWD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 01:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbiDYFWC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 01:22:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89AD02E9EE;
        Sun, 24 Apr 2022 22:18:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F2D396116D;
        Mon, 25 Apr 2022 05:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6FEC385A7;
        Mon, 25 Apr 2022 05:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650863938;
        bh=sGRPAM6q1dJjdfyun9Eq2a1CRwS9s1UjJtDSW1rNewY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VsN9DgXbg2oegJcrqcW1rRopEJqBioPo7KmHANUhJfUsY+JVPYsdjARBaEjofW83Z
         ZI8NQFKjKZabgPsoG3oCZ4PIdZahX/uDzhF4JblSuAx61t9MfqBo62f3xa95gdMTV8
         DfhymszbsoFIfcanbbCskzOW34yAbxa3tJJHpPrY=
Date:   Mon, 25 Apr 2022 07:18:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ethan Yang <ipis.yang@gmail.com>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, gchiang@sierrawireless.com,
        Ethan Yang <etyang@sierrawireless.com>
Subject: Re: [PATCH v2] add support for Sierra Wireless EM7590 0xc080 and
 0xc081 compositions.
Message-ID: <YmYvPXeqQzyms91m@kroah.com>
References: <20220425034204.4345-1-etyang@sierrawireless.com>
 <20220425035520.4717-1-etyang@sierrawireless.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425035520.4717-1-etyang@sierrawireless.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 25, 2022 at 11:55:20AM +0800, Ethan Yang wrote:
> add support for Sierra Wireless EM7590 0xc080 and 0xc081
> 
> Signed-off-by: Ethan Yang <etyang@sierrawireless.com>
> ---
>  drivers/usb/serial/qcserial.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
> index c18bf8164bc2..586ef5551e76 100644
> --- a/drivers/usb/serial/qcserial.c
> +++ b/drivers/usb/serial/qcserial.c
> @@ -166,6 +166,8 @@ static const struct usb_device_id id_table[] = {
>  	{DEVICE_SWI(0x1199, 0x9090)},	/* Sierra Wireless EM7565 QDL */
>  	{DEVICE_SWI(0x1199, 0x9091)},	/* Sierra Wireless EM7565 */
>  	{DEVICE_SWI(0x1199, 0x90d2)},	/* Sierra Wireless EM9191 QDL */
> +	{DEVICE_SWI(0x1199, 0xc080)},	/* Sierra Wireless EM7590 QDL */
> +	{DEVICE_SWI(0x1199, 0xc081)},	/* Sierra Wireless EM7590 */
>  	{DEVICE_SWI(0x413c, 0x81a2)},	/* Dell Wireless 5806 Gobi(TM) 4G LTE Mobile Broadband Card */
>  	{DEVICE_SWI(0x413c, 0x81a3)},	/* Dell Wireless 5570 HSPA+ (42Mbps) Mobile Broadband Card */
>  	{DEVICE_SWI(0x413c, 0x81a4)},	/* Dell Wireless 5570e HSPA+ (42Mbps) Mobile Broadband Card */
> -- 
> 2.17.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
