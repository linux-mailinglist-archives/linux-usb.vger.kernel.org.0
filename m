Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65AD912FB0E
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2020 18:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbgACRBp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jan 2020 12:01:45 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:34964 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727769AbgACRBp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jan 2020 12:01:45 -0500
Received: (qmail 5214 invoked by uid 2102); 3 Jan 2020 12:01:44 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 3 Jan 2020 12:01:44 -0500
Date:   Fri, 3 Jan 2020 12:01:44 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     andreyknvl@google.com,
        syzbot <syzbot+10e5f68920f13587ab12@syzkaller.appspotmail.com>
cc:     gregkh@linuxfoundation.org, <gustavo@embeddedor.com>,
        <ingrassia@epigenesys.com>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (2)
In-Reply-To: <000000000000d29687059b3f32aa@google.com>
Message-ID: <Pine.LNX.4.44L0.2001031159280.1560-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 3 Jan 2020, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger  
> crash:
> 
> Reported-and-tested-by:  
> syzbot+10e5f68920f13587ab12@syzkaller.appspotmail.com
> 
> Tested on:
> 
> commit:         ecdf2214 usb: gadget: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b06a019075333661
> dashboard link: https://syzkaller.appspot.com/bug?extid=10e5f68920f13587ab12
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=177f06e1e00000
> 
> Note: testing is done by a robot and is best-effort only.

Andrey:

Clearly something strange is going on here.  First, the patch should 
not have changed the behavior; all it did was add some log messages.  
Second, I don't see how the warning could have been triggered at all -- 
it seems to be complaining that 2 != 2.

Does the reproducer really work?

Alan Stern

