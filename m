Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A773CFD30
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 17:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfD3PuM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 11:50:12 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:56469 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726061AbfD3PuL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 11:50:11 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 7F833581;
        Tue, 30 Apr 2019 11:50:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 30 Apr 2019 11:50:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=Ka2lC0fzN77DodlXYYV3lz1zRFB
        CP1FnsPu7ZLb1emw=; b=h0lrshccUp92VOV8cTUkafQlL3gF8O+uFxhkNin14U8
        kgWPQY/jLWIHIoH9OV6wPrMBhCqU0AGHYMbOeOwQd8cJrinXL9SKcHSgQTyy3tjA
        eyTR1en+rM6XTwMUnE5YbFdr81bynNZjGpAALBl9TxnDDkRXRbzQXuj2P4Lz7bJb
        HHKEOVo54MR3HDvTA6t2JMqxQDOA3pLz0yU8QmiTfqQgZpFN3Gi+Ob/dDqX/aP7a
        HS+gH3YPMRyeNehcaRp+cHFofxyXptAIsNATFAXjJ+RbnlDK5L6KBiOxxxE7N8af
        Kq7Jf8zX0+hw91BxdcmACf21mWmthbdEbwy5EpYa+ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ka2lC0
        fzN77DodlXYYV3lz1zRFBCP1FnsPu7ZLb1emw=; b=6qvv9l877BSmrp9CzTh+zm
        bwKQRdTA2lIcid9jldDfpkVZBRRT+F1GBbLqqM3EGwP71RP3dTDjB4s85LhuvG+z
        bZDWAt9LJAV/RavMaKUUKdUQiCStVuBh5ftOhtuHbmjXheGd7K64ZqVTBp05j9t9
        tdyJpxJpoOHU5DGPWOqK2YohzGnqtiGNFLoDhK07F5/Bq4Ka5ED7Y7XSWiOB6WnD
        zsyUTbcpWoPzYPgeOt48134qlXDZcT7n6JuTXEbHGCT9gN/L71ZyOU49RwvA+DIs
        ip91tmjfbE8jKXhfJJDj71jQ7PwTrc/9UoKumkWxTx2jm5AZr2N1rKh/iZK0Jkbg
        ==
X-ME-Sender: <xms:sW7IXBM7KWn--CbJGVmvuGkOLW1Gjxu_8yfC1WtR1Sc3-3nwUKn3LQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieehgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenuc
    fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucffohhmrghinhepghhithhhuhgsrd
    gtohhmpdgrphhpshhpohhtrdgtohhmnecukfhppeekfedrkeeirdekledruddtjeenucfr
    rghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptd
X-ME-Proxy: <xmx:sW7IXCO_nSNF7nF79r7uguB0814e-1XHl3IH10oy7s-4BE-3oWkp6w>
    <xmx:sW7IXJkXdmmdmtVxJldsF88-dkiLNfeQRFI8yKpeXgN2zxE0ebT9BQ>
    <xmx:sW7IXAtVbGbkCss6KgdXl7AOQQ-3yyNS76NqzSBwxcu9oxGcw4NpTw>
    <xmx:sm7IXCGsNoL07s4DpeiE-FwB5hHWypCo8kY6MFPAawpPYpLYD6I4WA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id F0F58E48A7;
        Tue, 30 Apr 2019 11:50:08 -0400 (EDT)
Date:   Tue, 30 Apr 2019 17:50:05 +0200
From:   Greg KH <greg@kroah.com>
To:     syzbot <syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com>
Cc:     andreyknvl@google.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: WARNING: Detected a wedged cx25840 chip; the device will not
 work.
Message-ID: <20190430155005.GA20649@kroah.com>
References: <00000000000048aa750587c052ef@google.com>
 <20190430153516.GA23459@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430153516.GA23459@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 30, 2019 at 05:35:16PM +0200, Greg KH wrote:
> On Tue, Apr 30, 2019 at 07:36:07AM -0700, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following crash on:
> > 
> > HEAD commit:    9a33b369 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=12df67c3200000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
> > dashboard link: https://syzkaller.appspot.com/bug?extid=170a86bf206dd2c6217e
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108a28f3200000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=145d8a2d200000
> > 
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+170a86bf206dd2c6217e@syzkaller.appspotmail.com
> > 
> > usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> > pvrusb2: Hardware description: Gotview USB 2.0 DVD 2
> > pvrusb2: Invalid write control endpoint
> > usb 1-1: USB disconnect, device number 2
> > pvrusb2: Invalid write control endpoint
> > pvrusb2: WARNING: Detected a wedged cx25840 chip; the device will not work.
> > pvrusb2: WARNING: Try power cycling the pvrusb2 device.
> > pvrusb2: WARNING: Disabling further access to the device to prevent other
> > foul-ups.
> > pvrusb2: Device being rendered inoperable
> > cx25840 0-0044: Unable to detect h/w, assuming cx23887
> > cx25840 0-0044: cx23887 A/V decoder found @ 0x88 (pvrusb2_a)
> > pvrusb2: Attached sub-driver cx25840
> > pvrusb2: Attempted to execute control transfer when device not ok
> > pvrusb2: Attempted to execute control transfer when device not ok
> 
> As the driver said, power cycle your device, it crashed :)
> 
> Seriously, I think your script detection failed here, sorry.

Ah, same issue as the other "WARNING" message, sorry for the noise.
