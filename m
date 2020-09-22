Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3167F273BC3
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 09:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729884AbgIVH0T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 03:26:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:35776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729748AbgIVH0S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 03:26:18 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E454F21548;
        Tue, 22 Sep 2020 07:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600759578;
        bh=6W0XkHx2K/Vd9wq6GmgFfBTc3at6ccIg1XLMoqvY3qc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QmVAUH0/9egqBVNOJ85nxBMSUC7nRGN08l2BQ/26gRHcqOoXUd9TMu1Klp9I2U5v5
         SZ9EfDFUdR21GmYVgwjkspxCgXsPtuF7vNjZCFl+RiNgyUYyRN4YvX+rDiijMGU0cf
         aMYt5RonC5JJkAORGjImLh6hKua323T5+dOqTGfE=
Date:   Tue, 22 Sep 2020 09:26:39 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     syzbot <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com>,
        Brooke Basile <brookebasile@gmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        USB list <linux-usb@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: INFO: trying to register non-static key in ath9k_htc_rxep
Message-ID: <20200922072639.GA1578565@kroah.com>
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com>
 <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 08:49:39AM +0200, Dmitry Vyukov wrote:
> On Tue, Sep 22, 2020 at 8:21 AM syzbot
> <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> >
> > Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
> >
> > Tested on:
> >
> > commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
> > git tree:       upstream
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
> > dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
> > compiler:       gcc (GCC) 10.1.0-syz 20200507
> >
> > Note: testing is done by a robot and is best-effort only.
> 
> Hi Brooke,
> 
> As far as I understand, UBS is currently completely broken on upstream
> HEAD, so testing any USB bugs on upstream HEAD will lead to false
> positive results only.

Broken in what way?  I don't see any bug reports here...

thanks,

greg k-h
