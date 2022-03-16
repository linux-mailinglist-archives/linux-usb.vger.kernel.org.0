Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFE1F4DB6F7
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 18:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344921AbiCPRSW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 13:18:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239155AbiCPRSV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 13:18:21 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 983485A5B6
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 10:17:06 -0700 (PDT)
Received: (qmail 1768709 invoked by uid 1000); 16 Mar 2022 13:17:05 -0400
Date:   Wed, 16 Mar 2022 13:17:05 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 9/9] usb: rework usb_maxpacket() using
 usb_pipe_endpoint()
Message-ID: <YjIbkR7njaFX7NKi@rowland.harvard.edu>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220316161935.2049-1-mailhol.vincent@wanadoo.fr>
 <20220316161935.2049-10-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316161935.2049-10-mailhol.vincent@wanadoo.fr>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 17, 2022 at 01:19:35AM +0900, Vincent Mailhol wrote:
> Rework the body of usb_maxpacket() in order not to reinvent the wheel
> and just rely on the usb_pipe_endpoint() helper function instead.
> 
> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> ---
>  include/linux/usb.h | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 8127782aa7a1..653d34ff0999 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -1971,19 +1971,7 @@ usb_pipe_endpoint(struct usb_device *dev, unsigned int pipe)
>  
>  static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)
>  {
> -	struct usb_host_endpoint	*ep;
> -	unsigned			epnum = usb_pipeendpoint(pipe);
> -
> -	if (usb_pipeout(pipe))
> -		ep = udev->ep_out[epnum];
> -	else
> -		ep = udev->ep_in[epnum];
> -
> -	if (!ep)
> -		return 0;
> -
> -	/* NOTE:  only 0x07ff bits are for packet size... */
> -	return usb_endpoint_maxp(&ep->desc);
> +	return usb_endpoint_maxp(&usb_pipe_endpoint(udev, pipe)->desc);

The original code was careful to handle the case where ep was a NULL 
pointer.  What will your routine do if usb_pipe_endpoint(udev, pipe) 
returns NULL?

Alan Stern

>  }
>  
>  /* translate USB error codes to codes user space understands */
> -- 
> 2.34.1
> 
