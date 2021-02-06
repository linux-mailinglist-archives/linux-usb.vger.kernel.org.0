Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD613119CA
	for <lists+linux-usb@lfdr.de>; Sat,  6 Feb 2021 04:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232417AbhBFDTN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 22:19:13 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:58278 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbhBFDJ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Feb 2021 22:09:58 -0500
Received: from fsav302.sakura.ne.jp (fsav302.sakura.ne.jp [153.120.85.133])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 11618cL6038810;
        Sat, 6 Feb 2021 10:08:38 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav302.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp);
 Sat, 06 Feb 2021 10:08:38 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav302.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 11618b7b038807
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Sat, 6 Feb 2021 10:08:38 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] usb: usbip: fix error handling of kthread_get_run()
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     Hillf Danton <hdanton@sina.com>, linux-usb@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
References: <000000000000414db905b6e9bae8@google.com>
 <20210205135707.4574-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <6b2b9f7c-a412-0f52-3373-bc58d1e95ad9@linuxfoundation.org>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <ee936421-66ea-c6a7-fa1e-d4077ab28ed0@i-love.sakura.ne.jp>
Date:   Sat, 6 Feb 2021 10:08:34 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6b2b9f7c-a412-0f52-3373-bc58d1e95ad9@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/02/06 1:27, Shuah Khan wrote:
> Good find. For this fix to be complete, you will have to add checks
> for kthread_get_run() NULL return in attach_store() and
> usbip_sockfd_store() routines in stub_dev.c and vudc_sysfs.c

Initially I thought that the cleaner fix is to get kthread_create() out of kthread_get_run()
( the drivers/usb/usbip/vhci_sysfs.c portion in
https://syzkaller.appspot.com/x/patch.diff?x=16c3c090d00000 ) so that we can undo
kthread_create() via kthread_stop(). But I found that such fix makes little sense because
it is possible that SIGKILL is delivered between vhci_rx_loop() and vhci_tx_loop() have
started and before leaving attach_store().

Since the code prior to "staging/usbip: convert to kthread" was already capable of surviving
such race condition, this patch should be already good enough for sending to stable kernels.
Of course, since kthread_create() may return -ENOMEM without being SIGKILLed, we could update
attach_store() to report kthread_get_run() failure to the caller, but that will be a separate
patch. This patch alone avoids the crash although there is a hung task problem similar to
https://syzkaller.appspot.com/bug?id=5677eeeb83e5d47ef2b04e9bd68f5ff4c7e572ab remains
( https://syzkaller.appspot.com/text?tag=CrashReport&x=17aa3f78d00000 ). The cause of hung
task is currently unknown; maybe too much printk() messages.
