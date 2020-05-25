Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F861E0F8B
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 15:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390745AbgEYNdG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 09:33:06 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:61288 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388794AbgEYNdF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 May 2020 09:33:05 -0400
Received: from fsav301.sakura.ne.jp (fsav301.sakura.ne.jp [153.120.85.132])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04PDWgrl096514;
        Mon, 25 May 2020 22:32:42 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav301.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp);
 Mon, 25 May 2020 22:32:42 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04PDWgn4096507
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Mon, 25 May 2020 22:32:42 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg KH <greg@kroah.com>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org
References: <20200520233129.3704-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200521073323.GA2579717@kroah.com>
 <177cc23a-60a7-f5cd-09d6-57608727ea27@i-love.sakura.ne.jp>
 <1590090636.6470.12.camel@suse.com>
 <a72cbcc6-df68-2043-1580-a8b4e4053079@i-love.sakura.ne.jp>
 <1590134662.19681.12.camel@suse.com>
 <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
 <1590408381.2838.4.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
Date:   Mon, 25 May 2020 22:32:38 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1590408381.2838.4.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/05/25 21:06, Oliver Neukum wrote:
> Am Freitag, den 22.05.2020, 17:26 +0900 schrieb Tetsuo Handa:
>> On 2020/05/22 17:04, Oliver Neukum wrote:
>>> May I ask you to redo the patch with comments added stating
>>> that the wake up is done for the sake of wdm_flush(), change
>>> the description and add the link to syzkaller?
>>
>> You can take over this patch. syzbot tried this patch on 2020/02/11 01:23 at
>> https://syzkaller.appspot.com/bug?id=e7b761593b23eb50855b9ea31e3be5472b711186 ,
>> but this patch did not solve the problem syzbot has found. Thus, I don't add
>> a link to syzkaller...
> 
> Hi,
> 
> this is odd. I looked at the driver and it looks to me like
> pre/post_reset() is the only other place that touches WDM_IN_USE.
> And it does so correctly. Any idea what could be wrong?

I haven't understood the root cause of this problem. You were in the thread at
https://groups.google.com/forum/#!msg/syzkaller-bugs/q3QMjt_t83c/GqP58GaTAQAJ .
My patch was made from that thread (which simply makes sure to call wake_up_all()
when clearing WDM_IN_USE bit) apart from the root cause of this problem.
