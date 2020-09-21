Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 008FA2728E6
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 16:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbgIUOs3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 10:48:29 -0400
Received: from netrider.rowland.org ([192.131.102.5]:60547 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727761AbgIUOs2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 10:48:28 -0400
Received: (qmail 1214902 invoked by uid 1000); 21 Sep 2020 10:48:27 -0400
Date:   Mon, 21 Sep 2020 10:48:27 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Yasushi Asano <yazzep@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        erosca@de.adit-jv.com, andrew_gabbasov@mentor.com,
        jim_baxter@mentor.com, wnatsume@jp.adit-jv.com,
        nnishiguchi@jp.adit-jv.com, yasano@jp.adit-jv.com
Subject: Re: [PATCH] Re: [PATCH v3] USB: hub.c: decrease the number of
 attempts of enumeration scheme
Message-ID: <20200921144827.GC1213381@rowland.harvard.edu>
References: <20200920192114.GB1190206@rowland.harvard.edu>
 <20200921140342.3813-1-yazzep@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921140342.3813-1-yazzep@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 21, 2020 at 11:03:42PM +0900, Yasushi Asano wrote:
> From: Yasushi Asano <yasano@jp.adit-jv.com>
> 
> Dear Alan
> 
> Thank you very much for providing the patch.
> I really appreciate your kindness.
> 
> When I added a pseudo error code and checked it,
> the for statement of the "operation" in the new scheme
> runs unconditionally three times. Therefore It doesn't
> seem to meet the requirements (30seconds).
> 
> After applying your patch, I added a patch that can
> change the loop number of "operation" as shown below,
> and it worked fine in the pseudo error environment.
> Is this modification acceptable?

Ah, I missed that change.  Yes, this is the right approach.

> If it is good, I'll add this patch and test it.
> Since the PET tool is only in the customer,
> I will ask the customer to test it. I will report the
> result when I receive the results.
> 
> Signed-off-by: Yasushi Asano <yasano@jp.adit-jv.com>
> ---
>  drivers/usb/core/hub.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 61effd5..2f07f7c 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2709,12 +2709,14 @@ static unsigned hub_is_wusb(struct usb_hub *hub)
>  #define PORT_RESET_TRIES	2
>  #define SET_ADDRESS_TRIES	1
>  #define GET_DESCRIPTOR_TRIES	1
> +#define GET_DESCRIPTOR_OPERATIONS	1
>  #define PORT_INIT_TRIES		5
>  
>  #else
>  #define PORT_RESET_TRIES	5
>  #define SET_ADDRESS_TRIES	2
>  #define GET_DESCRIPTOR_TRIES	2
> +#define GET_DESCRIPTOR_OPERATIONS	3
>  #define PORT_INIT_TRIES		4
>  #endif	/* CONFIG_USB_FEW_INIT_RETRIES */
>  
> @@ -4699,7 +4701,7 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  			 * 255 is for WUSB devices, we actually need to use
>  			 * 512 (WUSB1.0[4.8.1]).
>  			 */
> -			for (operations = 0; operations < 3; ++operations) {
> +			for (operations = 0; operations < GET_DESCRIPTOR_OPERATIONS; ++operations) {
>  				buf->bMaxPacketSize0 = 0;
>  				r = usb_control_msg(udev, usb_rcvaddr0pipe(),
>  					USB_REQ_GET_DESCRIPTOR, USB_DIR_IN,

Okay.  I will merge your change into my patch.

Alan Stern
