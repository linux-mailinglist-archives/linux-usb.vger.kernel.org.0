Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D80786229
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 14:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732475AbfHHMq5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 08:46:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:50750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732239AbfHHMq5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Aug 2019 08:46:57 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA5FA2171F;
        Thu,  8 Aug 2019 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565268416;
        bh=K4KvFbUOjG4sKLOZlXNsxRufBtA9Jpgu03DPyml6ddU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DHc3hfWr4bSGlQa/A+RlbktFUpzSLW9GPuQTZz+6DFTeL0IPl6c3JKu4pGx2SI7Kg
         sf/8g3CF0hFbFXstDKmpYfiw8U2q1QD71McN3tHjxydMbjjGjNXwUZ1SBOy9BMhNAy
         Zn6q81aHbBGVhGcalPXQPTnpnUYNokYiD7ymf3K8=
Date:   Thu, 8 Aug 2019 14:46:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     syzbot <syzbot+45b2f40f0778cfa7634e@syzkaller.appspotmail.com>,
        Michael Hund <mhund@ld-didactic.de>
Cc:     akpm@linux-foundation.org, andreyknvl@google.com, cai@lca.pw,
        keescook@chromium.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Subject: Re: BUG: bad usercopy in ld_usb_read
Message-ID: <20190808124654.GB32144@kroah.com>
References: <0000000000005c056c058f9a5437@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0000000000005c056c058f9a5437@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 08, 2019 at 05:38:06AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=13aeaece600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> dashboard link: https://syzkaller.appspot.com/bug?extid=45b2f40f0778cfa7634e
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> 
> Unfortunately, I don't have any reproducer for this crash yet.
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+45b2f40f0778cfa7634e@syzkaller.appspotmail.com
> 
> ldusb 6-1:0.124: Read buffer overflow, -131383996186150 bytes dropped

That's a funny number :)

Nice overflow found, I see you are now starting to fuzz the char device
nodes of usb drivers...

Michael, care to fix this up?

thanks,

greg k-h
