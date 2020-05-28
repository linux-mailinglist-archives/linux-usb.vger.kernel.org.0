Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6E21E6B4A
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 21:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406706AbgE1Tk7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 15:40:59 -0400
Received: from netrider.rowland.org ([192.131.102.5]:53401 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2406540AbgE1Tk7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 15:40:59 -0400
Received: (qmail 24354 invoked by uid 1000); 28 May 2020 15:40:57 -0400
Date:   Thu, 28 May 2020 15:40:57 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Oliver Neukum <oneukum@suse.com>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing
 WDM_IN_USE bit.
Message-ID: <20200528194057.GA21709@rowland.harvard.edu>
References: <1590090636.6470.12.camel@suse.com>
 <a72cbcc6-df68-2043-1580-a8b4e4053079@i-love.sakura.ne.jp>
 <1590134662.19681.12.camel@suse.com>
 <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
 <1590408381.2838.4.camel@suse.com>
 <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 28, 2020 at 09:03:43PM +0200, Andrey Konovalov wrote:

> Ah, so the problem is that when a process exits, it tries to close wdm
> fd first, which ends up calling wdm_flush(), which can't finish
> because the USB requests are not terminated before raw-gadget fd is
> closed, which is supposed to happen after wdm fd is closed. Is this
> correct? I wonder what will happen if a real device stays connected
> and ignores wdm requests.
> 
> I don't understand though, how using wait_event_interruptible() will
> shadow anything here.
> 
> Alan, Greg, is this acceptable behavior for a USB driver?

I don't understand what the problem is.  Can you explain in more general 
terms -- nothing specific to wdm or anything like that -- what you are 
concerned about?  Is this something that could happen to any gadget 
driver?  Or any USB class device driver?  Or does it only affect 
usespace components of raw-gadget drivers?

Alan Stern
