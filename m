Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87CA088314
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2019 21:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406374AbfHITAl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Aug 2019 15:00:41 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:55396 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726634AbfHITAl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Aug 2019 15:00:41 -0400
Received: (qmail 5162 invoked by uid 2102); 9 Aug 2019 15:00:40 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 9 Aug 2019 15:00:40 -0400
Date:   Fri, 9 Aug 2019 15:00:40 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Prashant Malani <pmalani@chromium.org>
cc:     syzbot <syzbot+22ae4e3b9fcc8a5c153a@syzkaller.appspotmail.com>,
        <andreyknvl@google.com>, <gregkh@linuxfoundation.org>,
        <gustavo@embeddedor.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: use-after-free Read in usb_kill_urb
In-Reply-To: <CACeCKafa5OkV=Mj0sBvr_oQeT5HBe9CRcT1g7BKqzECXv7ODvg@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1908091459450.1630-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 9 Aug 2019, Prashant Malani wrote:

> Hi,
> 
> I'm trying to get up to speed on USB kernel code. Sounds like
> dev->intf should have been set to NULL for the error path in
> ld_usb_probe() ?

Why should it?

After all, dev gets deallocated at the end of ld_usb_probe(), where 
ld_usb_delete() is called.  Who cares what value is stored in 
deallocated memory?

Alan Stern

