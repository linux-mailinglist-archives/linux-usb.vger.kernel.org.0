Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEF2254628
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 15:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgH0NmS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 09:42:18 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:59934 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727926AbgH0Njw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Aug 2020 09:39:52 -0400
Received: from fsav403.sakura.ne.jp (fsav403.sakura.ne.jp [133.242.250.102])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 07RDdpG4020615;
        Thu, 27 Aug 2020 22:39:51 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav403.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp);
 Thu, 27 Aug 2020 22:39:50 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 07RDdolC020602
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Thu, 27 Aug 2020 22:39:50 +0900 (JST)
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
 <9a57e64d-4f83-9df8-dcfb-f907d5983935@i-love.sakura.ne.jp>
 <1597231141.28022.7.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <0b6cce17-57ff-0cad-4a47-0bb1224b253c@i-love.sakura.ne.jp>
Date:   Thu, 27 Aug 2020 22:39:45 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597231141.28022.7.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/08/12 20:19, Oliver Neukum wrote:
> Am Mittwoch, den 12.08.2020, 19:09 +0900 schrieb Tetsuo Handa:
>> On 2020/08/12 17:02, Oliver Neukum wrote:
>>> Am Mittwoch, den 12.08.2020, 08:26 +0900 schrieb Tetsuo Handa:
>>>> syzbot is reporting hung task at wdm_flush() [1], for there is a circular
>>>> dependency that wdm_flush() from flip_close() for /dev/cdc-wdm0 forever
>>>> waits for /dev/raw-gadget to be closed while close() for /dev/raw-gadget
>>>> cannot be called unless close() for /dev/cdc-wdm0 completes.
>>>>
>>>> It turned out that wdm_flush() is broken in multiple aspects.
>>>
>>> Sorry,
>>>
>>> this seems to be a miscommunication. I was under the impression that
>>> you were testing patches. I will push them upstream. You
>>> cannot just remove flush() without impairing error handling.
>>
>> Then, will you check
>>
>>   https://lore.kernel.org/linux-usb/254939d4-f3a1-8c7e-94e5-9862c02774fa@i-love.sakura.ne.jp/
>>
>> and
>>
>>   https://lore.kernel.org/linux-usb/c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp/
>>
>> before pushing upstream?
> 
> Hi,
> 
> sure, yes, thank you for the pointers. I shall post an RFC in a few
> minutes.

Oliver, are you there? Did you get my comment at
https://lkml.kernel.org/r/ee0af733-903f-8e8f-8027-b5490a37032f@i-love.sakura.ne.jp ?

I think that we cannot avoid impairing error handling unless we change wdm_write()
to wait for response with some timeout.
