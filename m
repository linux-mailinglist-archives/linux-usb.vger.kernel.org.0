Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8224824280D
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 12:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgHLKJ0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Aug 2020 06:09:26 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:58793 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbgHLKJ0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Aug 2020 06:09:26 -0400
Received: from fsav106.sakura.ne.jp (fsav106.sakura.ne.jp [27.133.134.233])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 07CA9OdC032456;
        Wed, 12 Aug 2020 19:09:24 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav106.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp);
 Wed, 12 Aug 2020 19:09:24 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 07CA9Od3032446
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Wed, 12 Aug 2020 19:09:24 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Remove unsafe wdm_flush().
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-usb@vger.kernel.org,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>
References: <1597188375-4787-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
 <1597219371.28022.6.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <9a57e64d-4f83-9df8-dcfb-f907d5983935@i-love.sakura.ne.jp>
Date:   Wed, 12 Aug 2020 19:09:21 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597219371.28022.6.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/08/12 17:02, Oliver Neukum wrote:
> Am Mittwoch, den 12.08.2020, 08:26 +0900 schrieb Tetsuo Handa:
>> syzbot is reporting hung task at wdm_flush() [1], for there is a circular
>> dependency that wdm_flush() from flip_close() for /dev/cdc-wdm0 forever
>> waits for /dev/raw-gadget to be closed while close() for /dev/raw-gadget
>> cannot be called unless close() for /dev/cdc-wdm0 completes.
>>
>> It turned out that wdm_flush() is broken in multiple aspects.
> 
> Sorry,
> 
> this seems to be a miscommunication. I was under the impression that
> you were testing patches. I will push them upstream. You
> cannot just remove flush() without impairing error handling.

Then, will you check

  https://lore.kernel.org/linux-usb/254939d4-f3a1-8c7e-94e5-9862c02774fa@i-love.sakura.ne.jp/

and

  https://lore.kernel.org/linux-usb/c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp/

before pushing upstream?

> 
> 	Regards
> 		Oliver
> 
> 
> Nacked-by: Oliver Neukum <oneukum@suse.com>
> 

