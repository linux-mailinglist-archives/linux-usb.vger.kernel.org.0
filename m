Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9215B6B3C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 20:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388830AbfIRS5Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 14:57:25 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:54466 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2387662AbfIRS5Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Sep 2019 14:57:25 -0400
Received: (qmail 7301 invoked by uid 2102); 18 Sep 2019 14:57:24 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 18 Sep 2019 14:57:24 -0400
Date:   Wed, 18 Sep 2019 14:57:24 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <gregkh@linuxfoundation.org>,
        <kai.heng.feng@canonical.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <mans@mansr.com>, <oneukum@suse.com>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: general protection fault in usb_set_interface
In-Reply-To: <00000000000001595b0592c41731@google.com>
Message-ID: <Pine.LNX.4.44L0.1909181454300.1507-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 17 Sep 2019, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> WARNING in sysfs_remove_group
> 
> ------------[ cut here ]------------
> sysfs group 'power' not found for kobject 'radio0'

Andrey:

Is there any way to tell syzbot to run the reproducer but with only one 
device instance (that is, only one dummy-hcd bus)?

Or can you a new, modified reproducer that will do this?

Alan Stern

