Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21BD06EE336
	for <lists+linux-usb@lfdr.de>; Tue, 25 Apr 2023 15:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbjDYNhx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 09:37:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233986AbjDYNhv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 09:37:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846281A5
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 06:37:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2022B62E7A
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 13:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31524C4339B;
        Tue, 25 Apr 2023 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1682429869;
        bh=iNRf6XUpm3V0E/+8BiTGDHP3+ZU7ECf7q4M3o9j0YJA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HiPKMh+oPR+x2zp/9JvFX2/bh4HfrrikIE0OE2pN/BKslt3d5rwgxLZYaQ1lJkrYZ
         LVzhybQUIql4MKr5vFSnO6ZS1RX12Chp+C9RMvZZzmaNNFLy/+nxgtMYg8v6Iq3rV+
         MsbbdakJRNrDyhZH1I4x09ocmTtCCIt6aSh19uoY=
Date:   Tue, 25 Apr 2023 15:37:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Konrad =?iso-8859-1?Q?Gr=E4fe?= <k.graefe@gateware.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: u_ether: Fix host MAC address case
Message-ID: <2023042534-thing-shamrock-88c1@gregkh>
References: <94afd6e0-7300-e8f4-d52e-c21acec04f5b@gateware.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94afd6e0-7300-e8f4-d52e-c21acec04f5b@gateware.de>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 25, 2023 at 03:15:08PM +0200, Konrad Gräfe wrote:
> 
> As the CDC-ECM specification states the host MAC address must be sent to
> the host as an uppercase hexadecimal string:
>     The Unicode character is chosen from the set of values 30h through
>     39h and 41h through 46h (0-9 and A-F).
> 
> However, snprintf(.., "%pm", ..) generates a lowercase MAC address
> string. While most host drivers are tolerant to this, UsbNcm.sys on
> Windows 10 is not. Instead it uses a different MAC address with all
> bytes set to zero including and after the first byte containing a
> lowercase letter. On Windows 11 Microsoft fixed it, but apparently they
> did not backport the fix.
> 
> This change fixes the issue by upper-casing the MAC to comply with the
> specification.
> 
> Signed-off-by: Konrad Gräfe <k.graefe@gateware.de>
> ---
>  drivers/usb/gadget/function/u_ether.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index 6956ad8ba8dd..250734e090fc 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -958,6 +958,7 @@ EXPORT_SYMBOL_GPL(gether_get_host_addr);
>  int gether_get_host_addr_cdc(struct net_device *net, char *host_addr, int len)
>  {
>  	struct eth_dev *dev;
> +	int i, slen;
>  
>  	if (len < 13)
>  		return -EINVAL;
> @@ -965,7 +966,13 @@ int gether_get_host_addr_cdc(struct net_device *net, char *host_addr, int len)
>  	dev = netdev_priv(net);
>  	snprintf(host_addr, len, "%pm", dev->host_mac);
>  
> -	return strlen(host_addr);
> +
> +	slen = strlen(host_addr);
> +
> +	for (i = 0; i < slen; i++)
> +		host_addr[i] = toupper(host_addr[i]);
> +
> +	return slen;
>  }
>  EXPORT_SYMBOL_GPL(gether_get_host_addr_cdc);
>  
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
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
