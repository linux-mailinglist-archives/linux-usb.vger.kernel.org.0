Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAEC51AB42E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Apr 2020 01:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389206AbgDOXWz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 19:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388747AbgDOXWx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Apr 2020 19:22:53 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C3FC061A0C
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2020 16:22:51 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id g32so703859pgb.6
        for <linux-usb@vger.kernel.org>; Wed, 15 Apr 2020 16:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ATe+eiqGDE3IF6h82rHq0wcgK/VWp13N5v2Mw7nBsOc=;
        b=eJuGkw5yQfUFcJCtRyp4X0bcseJKj7ei5WbZ5rXyeZZ/hhZu9dMnuoiiNif9eIHcNH
         OHxCR0ii1J6zEj9eVotIEhMpVoxKAyCUy5vH7tVALOGscbaGPjDAs6y8vFGd/OsIeKVK
         b8JuqzcR/CKIh2JnXaxvcscAdRkTvbmI4IWiWml0x5P0orvQkTBELu70+a5lYFGBMama
         A61Vztm9Q76N02lcuFdtgszvoVHyYzRgeEJsv7mxq274PnDfm0clFMlRnN/PHaiykGIq
         hAD62+6OUd4zfHCLYrF5rs37E86VyetMNL47EmYA2i4RVW4Q8Wj0dgg1iHbvlNHngA8B
         l1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ATe+eiqGDE3IF6h82rHq0wcgK/VWp13N5v2Mw7nBsOc=;
        b=HVahb8E91Wp9ebD/vOQhOxuTVV/OVNfAGafUD1iyYbZ93o1UfX4Pc0/vlu/m0t6E41
         FeFBysz8mnIjmyOuHrgdCYG+iyUKA1sijmHx0aXDMXyzFrFhXEz3X1VaMKGy+AgD+cP8
         fK3+JMQnRrVbNuDVbbuGNI2PPep58HmEV5H9ChOD8GkBoj+wsnnhNaONV1ehc0BPnm0s
         9DbJUOCA20BBVw0FvOzHOGvcSjmifKrtbGfX5sq3LaeyO40Psx49MO8dBmsVjH8FcO+H
         9vhOOy34hKA4dcUTZUXWJ3HKi2OYKXuSbjqXazdELp5i+vIxQCm5nJUuf4AzEVMx9yaY
         nkAA==
X-Gm-Message-State: AGi0PuZ1rrYivGRk50nRvWgLtk/ehvRtD5d4oL+wovIku1901OmbJcXC
        koB7NGJnXTNGX75XNFFxtaw=
X-Google-Smtp-Source: APiQypLnA07svnyRZV2taw8OmdLuzpWZTNQmX00g6EMTYgEoW4RLddMi/KBMHsWM9ADjxZTSQJEhKw==
X-Received: by 2002:aa7:9a43:: with SMTP id x3mr13852383pfj.266.1586992970620;
        Wed, 15 Apr 2020 16:22:50 -0700 (PDT)
Received: from EliteBook ([75.167.104.59])
        by smtp.gmail.com with ESMTPSA id f64sm15602256pfb.72.2020.04.15.16.22.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2020 16:22:50 -0700 (PDT)
Date:   Wed, 15 Apr 2020 16:22:47 -0700
From:   Paul Zimmerman <pauldzim@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Peter Chen <peter.chen@nxp.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: No disconnection event for suspended device at v5.6
Message-ID: <20200415162247.04012028@EliteBook>
In-Reply-To: <Pine.LNX.4.44L0.2004151352250.6539-100000@netrider.rowland.org>
References: <20200415103232.GA5609@b29397-desktop>
        <Pine.LNX.4.44L0.2004151352250.6539-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On Wed, 15 Apr 2020 15:40:31 -0400 (EDT) Alan Stern <stern@rowland.harvard.edu> wrote:

> On Wed, 15 Apr 2020, Peter Chen wrote:
> 
> > Hi Alan,
> > 
> > With commit e5d078af8e5f ("USB: hub: Don't record a connect-change event
> > during reset-resume"),  
> 
> For those who care, this is commit 8099f58f1ecd in the upstream kernel.
> 
> >  the disconnection event for the suspended device
> > (eg, removable hub with no device connected, auto-suspended mouse) at
> > roothub can't occur due to no hub->change_bits is set. Below is the
> > debug message:
> > 
> > 	imx_usb 30b20000.usb: at imx_controller_resume
> > 	usbmisc_imx 30b20200.usbmisc: wakeup int
> > 	ci_hdrc ci_hdrc.1: at ci_controller_resume
> > 	usb usb1: usb wakeup-resume
> > 	usb usb1: usb auto-resume
> > 	ci_hdrc ci_hdrc.1: resume root hub
> > 	hub 1-0:1.0: hub_resume
> > 	ci_hdrc ci_hdrc.1: GetStatus port:1 status 1c00100a 14
> > 	e0 PEC CSC
> > 	usb usb1-port1: status 0100 change 0003
> > 	hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
> > 	hub 1-0:1.0: hub_suspend
> > 	usb usb1: bus auto-suspend, wakeup 1
> > 	ci_hdrc ci_hdrc.1: suspend root hub
> > 	ci_hdrc ci_hdrc.1: at ci_runtime_suspend
> > 	imx_usb 30b20000.usb: at imx_controller_suspend  
> 
> You know, I had a nagging feeling when I wrote that patch that there 
> was some scenario it didn't take into account.  This is it -- a device 
> getting disconnected while the its parent hub is in runtime suspend.
> 
> Okay, clearly that commit needs to be reverted.  Luckily, the commit's 
> Changelog indicates that there is an alternate way of achieving the 
> same goal.  The patch below contains both the revert and the new fix.  
> Please let me know if it works.
> 
> Paul, I trust this new patch won't mess up your Bluetooth adapter.  It 
> should still clear the hub->change_bits entry before the hub workqueue 
> thread wakes up.
> 
> Alan Stern
> 
> Index: usb-devel/drivers/usb/core/hub.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/hub.c
> +++ usb-devel/drivers/usb/core/hub.c
> @@ -1219,6 +1219,11 @@ static void hub_activate(struct usb_hub
>  #ifdef CONFIG_PM
>  			udev->reset_resume = 1;
>  #endif
> +			/* Don't set the change_bits when the device
> +			 * was powered off.
> +			 */
> +			if (test_bit(port1, hub->power_bits))
> +				set_bit(port1, hub->change_bits);
>  
>  		} else {
>  			/* The power session is gone; tell hub_wq */
> @@ -3084,6 +3089,15 @@ static int check_port_resume_type(struct
>  		if (portchange & USB_PORT_STAT_C_ENABLE)
>  			usb_clear_port_feature(hub->hdev, port1,
>  					USB_PORT_FEAT_C_ENABLE);
> +
> +		/*
> +		 * Whatever made this reset-resume necessary may have
> +		 * turned on the port1 bit in hub->change_bits.  But after
> +		 * a successful reset-resume we want the bit to be clear;
> +		 * if it was on it would indicate that something happened
> +		 * following the reset-resume.
> +		 */
> +		clear_bit(port1, hub->change_bits);
>  	}
>  
>  	return status;
> 

Unfortunately, my testing on this is somewhat inconclusive. I updated
to the latest Linus kernel, then did about a half-dozen suspend/resume
cycles to verify it was still working. Then I applied the patch and
rebooted into the new kernel. At first I thought it was OK, but after
about 5 or 6 suspend/resume cycles, the bluetooth stopped working (the
desktop bluetooth manager in Linux Mint froze when I opened it). Another
suspend/resume cycle brought it back to life, but after a couple more
cycles it froze again.

But looking at the dmesg log, there were no errors concerning the
bluetooth adapter. With the original failure, it would show errors
before or during the firmware update of the bluetooth adapter, but
now, the firmware update seemed to complete OK. And to top it off,
after a reboot, I am no longer able to make it fail. I did more than
a dozen suspend/resume cycles and have not seen any further failures.

So, make of that what you will :)

Thanks,
Paul
