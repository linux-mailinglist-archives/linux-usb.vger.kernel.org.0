Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2481BF402
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 11:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgD3JS3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 05:18:29 -0400
Received: from mx2.suse.de ([195.135.220.15]:52408 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbgD3JS3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Apr 2020 05:18:29 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 6D2E0ABC7;
        Thu, 30 Apr 2020 09:18:26 +0000 (UTC)
Message-ID: <1588238283.16510.11.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in usblp_bulk_read
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+be5b5f86a162a6c281e6@syzkaller.appspotmail.com>,
        andreyknvl@google.com, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, zaitcev@redhat.com
Date:   Thu, 30 Apr 2020 11:18:03 +0200
In-Reply-To: <00000000000046503905a3cec366@google.com>
References: <00000000000046503905a3cec366@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 21.04.2020, 08:35 -0700 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=126f75d7e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
> dashboard link: https://syzkaller.appspot.com/bug?extid=be5b5f86a162a6c281e6
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> 
> Unfortunately, I don't have any reproducer for this crash yet.
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+be5b5f86a162a6c281e6@syzkaller.appspotmail.com
> 
> usblp0: nonzero read bulk status received: -71

OK, we have this report and nobody understands it. If I may summarize:

1. We do not conclusively know how the URB was submitted
2. We are clear about which memory was freed and accessed
3. We agree that the URB should have been unlinked

Do we agree on what we agree on?

Theories:

A. There is a race that would allow disconnect() and resume() to run
concurrently

B. There is a race in usblp which affects 'used'

C. There is a bug in the virtual driver that can make unlinking an URB
fail

What do you think? How to investigate this further and is it worth it?
Do we have documentation on what KASAN does?

	Regards
		Oliver

