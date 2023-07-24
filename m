Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21EAF75F97A
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 16:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjGXONJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 10:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231931AbjGXONF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 10:13:05 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id AD939E53
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 07:13:02 -0700 (PDT)
Received: (qmail 1848478 invoked by uid 1000); 24 Jul 2023 10:13:01 -0400
Date:   Mon, 24 Jul 2023 10:13:01 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     gregkh@linuxfoundation.org, liulongfang@huawei.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: hub: make sure stale buffers are not enumerated
Message-ID: <c4493483-be91-4a63-9a82-6ebc9a3123c0@rowland.harvard.edu>
References: <20230724124057.12975-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230724124057.12975-1-oneukum@suse.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 24, 2023 at 02:40:57PM +0200, Oliver Neukum wrote:
> Quoting Alan Stern on why we cannot just check errors:
> 
> The operation carried out here is deliberately unsafe (for full-speed
> devices).  It is made before we know the actual maxpacket size for ep0,
> and as a result it might return an error code even when it works okay.
> This shouldn't happen, but a lot of USB hardware is unreliable.
> 
> Therefore we must not ignore the result merely because r < 0.  If we do
> that, the kernel might stop working with some devices.
> 
> He is absolutely right. However, we must make sure that in case
> we read nothing or a short answer, the buffer contains nothing
> that can be misinterpreted as a valid answer.
> So we have to zero it before we use it for IO.
> 
> Reported-by: liulongfang <liulongfang@huawei.com>
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/core/hub.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index a739403a9e45..9772716925c3 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -4873,7 +4873,8 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  			}
>  
>  #define GET_DESCRIPTOR_BUFSIZE	64
> -			buf = kmalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
> +			/* zeroed so we don't operate on a stale buffer on errors */
> +			buf = kzalloc(GET_DESCRIPTOR_BUFSIZE, GFP_NOIO);
>  			if (!buf) {
>  				retval = -ENOMEM;
>  				continue;

There is no need for kzalloc.

The only accesses we do to buf (besides feeding it to usb_control_msg) 
are to read buf->bMaxPacketSize0 and buf->bDescriptorType.  The only 
field that actually needs to be initialized is bMaxPacketSize0, and the 
code already sets it to 0 before calling usb_control_msg.  Furthermore, 
we don't try to read bDescriptorType if bMaxPacketSize0 is invalid after 
the I/O operation.

I guess if you really want to be safe, you could do:

-			udev->descriptor.bMaxPacketSize0 =
-					buf->bMaxPacketSize0;
+			if (r == 0)
+				udev->descriptor.bMaxPacketSize0 =
+						buf->bMaxPacketSize0;

at line 4918.  But even that's not necessary, since the following call 
to hub_port_reset doesn't use udev->descriptor.bMaxPacketSize0, so it 
doesn't matter if that field contains garbage.

Alan Stern
