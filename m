Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D953173BDA7
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jun 2023 19:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjFWRRH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jun 2023 13:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbjFWRRF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jun 2023 13:17:05 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A2A812129
        for <linux-usb@vger.kernel.org>; Fri, 23 Jun 2023 10:16:57 -0700 (PDT)
Received: (qmail 756795 invoked by uid 1000); 23 Jun 2023 13:16:56 -0400
Date:   Fri, 23 Jun 2023 13:16:56 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [syzbot] [usb?] WARNING in usbnet_start_xmit/usb_submit_urb
Message-ID: <7330e6c0-eb73-499e-8699-dc1754d90cad@rowland.harvard.edu>
References: <000000000000a56e9105d0cec021@google.com>
 <000000000000e298cd05fecc07d4@google.com>
 <0f685f2f-06df-4cf2-9387-34f5e3c8b7b7@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f685f2f-06df-4cf2-9387-34f5e3c8b7b7@rowland.harvard.edu>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver:

I just noticed you had posted a patch to fix this same problem:
https://lore.kernel.org/linux-usb/291da1b9-9f71-0f99-45f4-a25a259c8d6d@suse.com/

Do you want to submit your patch or would you prefer that I submit the 
patch below?

Alan Stern

On Fri, Jun 23, 2023 at 11:23:53AM -0400, Alan Stern wrote:
> On Fri, Jun 23, 2023 at 06:32:22AM -0700, syzbot wrote:
> > syzbot has bisected this issue to:
> > 
> > commit 45bf39f8df7f05efb83b302c65ae3b9bc92b7065
> > Author: Alan Stern <stern@rowland.harvard.edu>
> > Date:   Tue Jan 31 20:49:04 2023 +0000
> > 
> >     USB: core: Don't hold device lock while reading the "descriptors" sysfs file
> > 
> > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=124b5877280000
> > start commit:   692b7dc87ca6 Merge tag 'hyperv-fixes-signed-20230619' of g..
> > git tree:       upstream
> > final oops:     https://syzkaller.appspot.com/x/report.txt?x=114b5877280000
> > console output: https://syzkaller.appspot.com/x/log.txt?x=164b5877280000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=2cbd298d0aff1140
> > dashboard link: https://syzkaller.appspot.com/bug?extid=63ee658b9a100ffadbe2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1760094b280000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1359cdf3280000
> > 
> > Reported-by: syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com
> > Fixes: 45bf39f8df7f ("USB: core: Don't hold device lock while reading the "descriptors" sysfs file")
> > 
> > For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> The bisection result is wrong, but the issue still needs to be fixed.
> 
> Alan Stern
> 
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v6.4-rc7
> 
> Index: usb-devel/drivers/net/usb/usbnet.c
> ===================================================================
> --- usb-devel.orig/drivers/net/usb/usbnet.c
> +++ usb-devel/drivers/net/usb/usbnet.c
> @@ -1775,6 +1775,9 @@ usbnet_probe (struct usb_interface *udev
>  	} else if (!info->in || !info->out)
>  		status = usbnet_get_endpoints (dev, udev);
>  	else {
> +		u8		ep_addrs[3] = {
> +			info->in + USB_DIR_IN, info->out + USB_DIR_OUT, 0};
> +
>  		dev->in = usb_rcvbulkpipe (xdev, info->in);
>  		dev->out = usb_sndbulkpipe (xdev, info->out);
>  		if (!(info->flags & FLAG_NO_SETINT))
> @@ -1784,6 +1787,8 @@ usbnet_probe (struct usb_interface *udev
>  		else
>  			status = 0;
>  
> +		if (status == 0 && !usb_check_bulk_endpoints(udev, ep_addrs))
> +			status = -EINVAL;
>  	}
>  	if (status >= 0 && dev->status)
>  		status = init_status (dev, udev);
