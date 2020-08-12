Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4E3A242894
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 13:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgHLLTJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 07:19:09 -0400
Received: from mx2.suse.de ([195.135.220.15]:52154 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbgHLLTJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Aug 2020 07:19:09 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id EF3DEB6BF;
        Wed, 12 Aug 2020 11:19:28 +0000 (UTC)
Message-ID: <1597231141.28022.7.camel@suse.com>
Subject: Re: [PATCH] USB: cdc-wdm: Remove unsafe wdm_flush().
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-usb@vger.kernel.org,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>
Date:   Wed, 12 Aug 2020 13:19:01 +0200
In-Reply-To: <9a57e64d-4f83-9df8-dcfb-f907d5983935@i-love.sakura.ne.jp>
References: <1597188375-4787-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
         <1597219371.28022.6.camel@suse.com>
         <9a57e64d-4f83-9df8-dcfb-f907d5983935@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 12.08.2020, 19:09 +0900 schrieb Tetsuo Handa:
> On 2020/08/12 17:02, Oliver Neukum wrote:
> > Am Mittwoch, den 12.08.2020, 08:26 +0900 schrieb Tetsuo Handa:
> > > syzbot is reporting hung task at wdm_flush() [1], for there is a circular
> > > dependency that wdm_flush() from flip_close() for /dev/cdc-wdm0 forever
> > > waits for /dev/raw-gadget to be closed while close() for /dev/raw-gadget
> > > cannot be called unless close() for /dev/cdc-wdm0 completes.
> > > 
> > > It turned out that wdm_flush() is broken in multiple aspects.
> > 
> > Sorry,
> > 
> > this seems to be a miscommunication. I was under the impression that
> > you were testing patches. I will push them upstream. You
> > cannot just remove flush() without impairing error handling.
> 
> Then, will you check
> 
>   https://lore.kernel.org/linux-usb/254939d4-f3a1-8c7e-94e5-9862c02774fa@i-love.sakura.ne.jp/
> 
> and
> 
>   https://lore.kernel.org/linux-usb/c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp/
> 
> before pushing upstream?

Hi,

sure, yes, thank you for the pointers. I shall post an RFC in a few
minutes.

	Regards
		Oliver

