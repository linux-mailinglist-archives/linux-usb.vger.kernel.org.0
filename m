Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB9087597
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 11:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406171AbfHIJSW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 05:18:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:45376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406167AbfHIJSV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 9 Aug 2019 05:18:21 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 53BA421783;
        Fri,  9 Aug 2019 09:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565342300;
        bh=vDFk0iDv4uhF/mh6uYPLsEe3xs+segrrcnOWuXxQKms=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=guBuS1ZbRdjlgZXkIRMxo5T/SU/GeSbZSxdnKSL6erjXVJ68Ixg5GfFw48ZcAQDUJ
         vTZF38S2BSeNjyyySFS+ew1qhyVgLU9/0UnNyatr/Z0JcgoD0Fmx/FRLRvGYhvhSGK
         go/RU2KVvB6UqqPtB9Y439Cv67wUAgDcPXYyT1DU=
Date:   Fri, 9 Aug 2019 10:55:45 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     syzbot <syzbot+45b2f40f0778cfa7634e@syzkaller.appspotmail.com>,
        Michael Hund <mhund@ld-didactic.de>, akpm@linux-foundation.org,
        andreyknvl@google.com, cai@lca.pw, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Subject: Re: BUG: bad usercopy in ld_usb_read
Message-ID: <20190809085545.GB21320@kroah.com>
References: <0000000000005c056c058f9a5437@google.com>
 <20190808124654.GB32144@kroah.com>
 <201908081604.D1203D408@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201908081604.D1203D408@keescook>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 08, 2019 at 04:06:32PM -0700, Kees Cook wrote:
> On Thu, Aug 08, 2019 at 02:46:54PM +0200, Greg KH wrote:
> > On Thu, Aug 08, 2019 at 05:38:06AM -0700, syzbot wrote:
> > > Hello,
> > > 
> > > syzbot found the following crash on:
> > > 
> > > HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=13aeaece600000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=45b2f40f0778cfa7634e
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > 
> > > Unfortunately, I don't have any reproducer for this crash yet.
> > > 
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+45b2f40f0778cfa7634e@syzkaller.appspotmail.com
> > > 
> > > ldusb 6-1:0.124: Read buffer overflow, -131383996186150 bytes dropped
> > 
> > That's a funny number :)
> > 
> > Nice overflow found, I see you are now starting to fuzz the char device
> > nodes of usb drivers...
> > 
> > Michael, care to fix this up?
> 
> This looks like the length in the read-from-device buffer is unchecked:
> 
>         /* actual_buffer contains actual_length + interrupt_in_buffer */
>         actual_buffer = (size_t *)(dev->ring_buffer + dev->ring_tail * (sizeof(size_t)+dev->interrupt_in_endpoint_size));
>         bytes_to_read = min(count, *actual_buffer);
>         if (bytes_to_read < *actual_buffer)
>                 dev_warn(&dev->intf->dev, "Read buffer overflow, %zd bytes dropped\n",
>                          *actual_buffer-bytes_to_read);
> 
>         /* copy one interrupt_in_buffer from ring_buffer into userspace */
>         if (copy_to_user(buffer, actual_buffer+1, bytes_to_read)) {
>                 retval = -EFAULT;
>                 goto unlock_exit;
>         }
> 
> I assume what's stored at actual_buffer is bogus and needs validation
> somewhere before it's actually used. (If not here, maybe where ever the
> write into the buffer originally happens?)

I think it should be verified here, as that's when it is parsed.  The
data is written to the buffer in ld_usb_interrupt_in_callback() but it
does not "know" how to parse it at that location.

thanks,

greg k-h
