Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 614251DDA84
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 00:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730742AbgEUWtU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 May 2020 18:49:20 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:49531 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730690AbgEUWtU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 May 2020 18:49:20 -0400
Received: from fsav101.sakura.ne.jp (fsav101.sakura.ne.jp [27.133.134.228])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04LMmxdW039884;
        Fri, 22 May 2020 07:48:59 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav101.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav101.sakura.ne.jp);
 Fri, 22 May 2020 07:48:59 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav101.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04LMmxtr039881
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Fri, 22 May 2020 07:48:59 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
To:     Oliver Neukum <oneukum@suse.com>, Greg KH <greg@kroah.com>
Cc:     Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org
References: <20200520233129.3704-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200521073323.GA2579717@kroah.com>
 <177cc23a-60a7-f5cd-09d6-57608727ea27@i-love.sakura.ne.jp>
 <1590090636.6470.12.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <a72cbcc6-df68-2043-1580-a8b4e4053079@i-love.sakura.ne.jp>
Date:   Fri, 22 May 2020 07:48:54 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1590090636.6470.12.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/05/22 4:50, Oliver Neukum wrote:
> interesting. Do you have a test case for these patches working?

No.

> 
>> 	wait_event(desc->wait,
>> 			/*
>> 			 * needs both flags. We cannot do with one
>> 			 * because resetting it would cause a race
>> 			 * with write() yet we need to signal
>> 			 * a disconnect
>> 			 */
>> 			!test_bit(WDM_IN_USE, &desc->flags) ||
>> 			test_bit(WDM_DISCONNECTING, &desc->flags));
>>
>> but wdm_write() is not calling wake_up(&desc->wait) after
>> clear_bit(WDM_IN_USE, &desc->flags) when usb_submit_urb() failed.
> 
> Yes, because desc->wlock is held. There can be nobody sleeping here.

Then, this patch is not needed. (But adding some comment is welcomed.)

> 
>>> And is this a bugfix?  For what?  Does it need to go to stable kernels?
>>
>> Potential bugfix. syzbot is reporting two bugs that hung at wdm_flush(),
>> but I think that this patch won't fix these bugs. Therefore, I don't think
>> this patch needs to go to stable kernels.
> 
> Do you have links for them?

It turned out that the second bug report is a duplicate of the first bug report.
The dashboard link for the first bug report is
https://syzkaller.appspot.com/bug?id=e7b761593b23eb50855b9ea31e3be5472b711186 .
