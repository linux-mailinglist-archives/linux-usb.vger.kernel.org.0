Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4D81E6703
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 18:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404817AbgE1QDN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 12:03:13 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:53608 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404723AbgE1QDM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 12:03:12 -0400
Received: from fsav304.sakura.ne.jp (fsav304.sakura.ne.jp [153.120.85.135])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04SG39iD001921;
        Fri, 29 May 2020 01:03:10 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav304.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav304.sakura.ne.jp);
 Fri, 29 May 2020 01:03:09 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav304.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04SG39ei001892
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Fri, 29 May 2020 01:03:09 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Oliver Neukum <oneukum@suse.com>, Greg KH <greg@kroah.com>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <20200520233129.3704-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200521073323.GA2579717@kroah.com>
 <177cc23a-60a7-f5cd-09d6-57608727ea27@i-love.sakura.ne.jp>
 <1590090636.6470.12.camel@suse.com>
 <a72cbcc6-df68-2043-1580-a8b4e4053079@i-love.sakura.ne.jp>
 <1590134662.19681.12.camel@suse.com>
 <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
 <1590408381.2838.4.camel@suse.com>
 <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
Date:   Fri, 29 May 2020 01:03:09 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/05/29 0:18, Andrey Konovalov wrote:
>> I might have found what is wrong.
>>
>> My understanding is that a process using /dev/raw-gadget is responsible for
>> reacting to every USB request. I don't know whether /dev/raw-gadget already
>> provides callback for aborting the in-flight USB requests (in order to resume
>> wdm_flush()) when /dev/raw-gadget is closed (due to explicit close() syscall or
>> implicit exit_files() from do_exit() upon SIGKILL). I assume /dev/raw-gadget
>> already provides such callback in the following paragraphs.
> 
> raw-gadget should kill all unfishished USB requests when the file is closed.

I see. But

> 
>>
>> Since the reproducer is opening both /dev/raw-gadget (which is char-10-62) and
>> /dev/cdc-wdm0 (which is char-180-0), it seems that the kernel is falling into
>> deadlock condition due to the need to close both files when the reproducer is
>> killed. My guess is that since that process is stuck at wdm_flush() (due to
>> explicit close() syscall or implicit exit_files() from do_exit() upon SIGKILL),
>> that process cannot react to USB requests which are needed for resuming wdm_flush().
>> Unexpectedly blocking a process which is responsible for reacting to USB requests
>> will look as if it is a broken hardware.
> 
> Hm, so wdm_flush() is unable to finish unless an expected USB request
> is received from the device? This is a bug in the wdm driver then.

this specific bug report is caused by being unable to close /dev/cdc-wdm0
due to /dev/raw-gadget API usage bug in the userspace process. In other words,
this bug report should be closed with "#syz invalid" like a bug report at
https://syzkaller.appspot.com/bug?id=287aa8708bc940d0ca1645223c53dd4c2d203be6
which unexpectedly did ioctl(FIFREEZE) without corresponding ioctl(FITHAW).

> Should we use wait_event_interruptible() instead of wait_event() in
> wdm_flush()?

That only shadows this kind of bug reports, by not using TASK_UNINTERRUPTIBLE.

The problem that the userspace process which is responsible for closing
/dev/raw-gadget gets stuck at wdm_flush() unless interrupted by a signal
when closing /dev/cdc-wdm0 is remaining. I think that a process should not
open /dev/raw-gadget and /dev/cdc-wdm0 at the same time.

