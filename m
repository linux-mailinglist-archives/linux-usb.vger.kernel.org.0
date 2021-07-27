Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C8E3D7787
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 15:52:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhG0Nwe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 09:52:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:49908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232333AbhG0Nwb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Jul 2021 09:52:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB1B061A8D;
        Tue, 27 Jul 2021 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627393950;
        bh=SVGWo8lefozlvbQVZNZVNuOQIRO1i68bpTvZCWTJZGg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mnfkRfYQ8gbiehumgmhjEneZ+cfOz8vC9wtOldUlaLx8NmykQflItk8exm+g+uNOR
         hMQNYenTvJUj4/6niQ9UM87tleOlj2wFDxN4rHKYm+HcKERK3HARHpTJ0/wcp8YHoo
         iJMQTtcBw7GGWdEvfkevo/NX7T/01Bze32x9tSm8=
Date:   Tue, 27 Jul 2021 15:52:28 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Guido Kiener <Guido.Kiener@rohde-schwarz.com>
Cc:     "qiang.zhang@windriver.com" <qiang.zhang@windriver.com>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "dave penkler (dpenkler@gmail.com)" <dpenkler@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] USB: usbtmc: Fix RCU stall warning
Message-ID: <YQAPnP+1iPAYnXuJ@kroah.com>
References: <0d5e1ff1790a4fb4a807ea8f60cc76cc@rohde-schwarz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d5e1ff1790a4fb4a807ea8f60cc76cc@rohde-schwarz.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 23, 2021 at 08:39:26AM +0000, Guido Kiener wrote:
> > From: Qiang.zhang> 
> > rcu: INFO: rcu_preempt self-detected stall on CPU
> > rcu:    1-...!: (2 ticks this GP) idle=d92/1/0x4000000000000000
> >         softirq=25390/25392 fqs=3
> >         (t=12164 jiffies g=31645 q=43226)
> > rcu: rcu_preempt kthread starved for 12162 jiffies! g31645 f0x0
> >      RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
> > rcu:    Unless rcu_preempt kthread gets sufficient CPU time,
> >         OOM is now expected behavior.
> > rcu: RCU grace-period kthread stack dump:
> > task:rcu_preempt     state:R  running task
> > ...........
> > usbtmc 3-1:0.0: unknown status received: -71 usbtmc 3-1:0.0: unknown status
> > received: -71 usbtmc 3-1:0.0: unknown status received: -71 usbtmc 3-1:0.0:
> > unknown status received: -71 usbtmc 3-1:0.0: unknown status received: -71 usbtmc
> > 3-1:0.0: unknown status received: -71 usbtmc 3-1:0.0: unknown status received: -71
> > usbtmc 3-1:0.0: unknown status received: -71 usbtmc 3-1:0.0: usb_submit_urb
> > failed: -19
> > 
> > The function usbtmc_interrupt() resubmits urbs when the error status of an urb is -
> > EPROTO. In systems using the dummy_hcd usb controller this can result in endless
> > interrupt loops when the usbtmc device is disconnected from the host system.
> > 
> > Since host controller drivers already try to recover from transmission errors, there is
> > no need to resubmit the urb or try other solutions to repair the error situation.
> > 
> > In case of errors the INT pipe just stops to wait for further packets.
> > 
> > Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488
> > READ_STATUS_BYTE operation")
> > Cc: stable@vger.kernel.org
> > Reported-by: syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com
> > Signed-off-by: Qiang.zhang <qiang.zhang@windriver.com>
> > ---
> >  v1->v2:
> >  Add fixes and stable tags, modify description information.
> > 
> >  drivers/usb/class/usbtmc.c | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> > 
> > diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c index
> > 74d5a9c5238a..73f419adce61 100644
> > --- a/drivers/usb/class/usbtmc.c
> > +++ b/drivers/usb/class/usbtmc.c
> > @@ -2324,17 +2324,10 @@ static void usbtmc_interrupt(struct urb *urb)
> >  		dev_err(dev, "overflow with length %d, actual length is %d\n",
> >  			data->iin_wMaxPacketSize, urb->actual_length);
> >  		fallthrough;
> > -	case -ECONNRESET:
> > -	case -ENOENT:
> > -	case -ESHUTDOWN:
> > -	case -EILSEQ:
> > -	case -ETIME:
> > -	case -EPIPE:
> > +	default:
> >  		/* urb terminated, clean up */
> >  		dev_dbg(dev, "urb terminated, status: %d\n", status);
> >  		return;
> > -	default:
> > -		dev_err(dev, "unknown status received: %d\n", status);
> >  	}
> >  exit:
> >  	rv = usb_submit_urb(urb, GFP_ATOMIC);
> > --
> > 2.25.1
> 
> The patch looks good to me and is tested on my machine.
> 
> Ack-by: Guido Kiener <guido.kiener@rohde-schwarz.com>

"Acked-by:" in the future please :)
