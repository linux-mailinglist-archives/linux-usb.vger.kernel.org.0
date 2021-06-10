Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47833A2A79
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 13:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhFJLmQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 07:42:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:51586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229895AbhFJLmQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 07:42:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D2DD613F1;
        Thu, 10 Jun 2021 11:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623325205;
        bh=J/TMPQPc2oy/61QfiWgtxOtG5ZrbpyV6/x5377ocPv8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NyIG+rBA3zghE+fSM9RMGz58WOVZ9gP+d0ryBNZk9/JZBc1xpOzNy8W1C9GCqvVvL
         BKBlyQWL1GzDlYvvt0UJOViV/4xEqik+p3b3inXOBEriHYGnaQZt6VbYDAkvqa4bxR
         xF+I4ezBKz3ESDntYnBo1SILDUU52/QFb104u2O0=
Date:   Thu, 10 Jun 2021 13:40:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     kun peng <kunpeng0891@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: usb3.0: dwc3: isoc: missisoc while setting the USB transfer UVC
 data
Message-ID: <YMH6EoMvt9V9EkuJ@kroah.com>
References: <CAJa5FiHh3oWGt3qMRWTBRorENhsKNODTRd+0meK2qpYnMk6U8g@mail.gmail.com>
 <87v96m119n.fsf@kernel.org>
 <CAJa5FiGTsM3+QS-+9P=8EZbNxZm+MqpPM3P4KU+=nD4KeA-qew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJa5FiGTsM3+QS-+9P=8EZbNxZm+MqpPM3P4KU+=nD4KeA-qew@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 10, 2021 at 07:33:43PM +0800, kun peng wrote:
> On Thu, Jun 10, 2021 at 6:07 PM Felipe Balbi <balbi@kernel.org> wrote:
> >
> > Hi,
> >
> > kun peng <kunpeng0891@gmail.com> writes:
> > > Hi ， I'm using the 4*A53 with DWC3 USB controller, my hardware to work
> > > like a USB camera and so make use of the USB 3.0 UVC gadget driver。
> > > usb3.0 isoc transfer with  missisoc -18，larger maxburst is set, the
> > > more -18 appears。
> > > but from trace info, the trb has been put in advance。
> > >
> > > test setting:
> > > dwc3 driver version：5.12
> > > PC： potplayer
> > >
> > > maxpacket : 3072
> > > maxburst : 15
> > > interval : 1
> > > UVC_NUM_REQUESTS: 8
> >
> > sorry, you're running 4.14.74 kernel. That's far too old for this forum
> > to help you. Try reproducing with the latest v5.13-rc kernel.
> >
> > --
> > balbi
> 
> thanks for your reply.
> 
> my kernel is 4.14, but usb and uvc related driver has been update to
> 5.12.0 linux main line.

That will not work, you have to update the whole kernel at once, drivers
can not be picked and choosen from different kernel trees and expect to
work at all, sorry.

Please try 5.12 or as Felipe said, the latest 5.13-rc release and let us
know if that works or not.

thanks,

greg k-h
