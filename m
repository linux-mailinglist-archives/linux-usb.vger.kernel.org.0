Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1A7278C69
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 17:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728976AbgIYPV3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 11:21:29 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:61687 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbgIYPV2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 11:21:28 -0400
Received: from fsav403.sakura.ne.jp (fsav403.sakura.ne.jp [133.242.250.102])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 08PFL8Au004245;
        Sat, 26 Sep 2020 00:21:08 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav403.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp);
 Sat, 26 Sep 2020 00:21:08 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 08PFL2Dd004226
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Sat, 26 Sep 2020 00:21:08 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [RFC] fixes for hangs and error reporting in CDC_WDM
To:     Greg KH <greg@kroah.com>, Oliver Neukum <oneukum@suse.com>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
References: <20200922112126.16919-1-oneukum@suse.com>
 <20200925151103.GB3173449@kroah.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <22e1b8f3-947a-6f15-a788-d639cbabde5c@i-love.sakura.ne.jp>
Date:   Sat, 26 Sep 2020 00:20:57 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200925151103.GB3173449@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/09/26 0:11, Greg KH wrote:
> On Tue, Sep 22, 2020 at 01:21:19PM +0200, Oliver Neukum wrote:
>> Stress testing has shown that CDC-WDM has some issues with hangs
>> and error reporting
>>
>> 1. wakeups are not correctly handled in multhreaded environments
>> 2. unresponsive hardware is not handled
>> 3. errors are not correctly reported. This needs flush() to be
>> implemented.
>>
>> This version makes wdm_flush() use interruptible sleep.
>>
>> For easier review all squashed together:
>>
> 
> I have like 3 or 4 different "RFC" series here from you for this driver,
> which one is the "newest"?

https://lkml.kernel.org/r/20200923092136.14824-1-oneukum@suse.com

is the newest series from Oliver. But

https://lkml.kernel.org/r/b27841ab-a88c-13e2-a66f-6df7af1f46b4@i-love.sakura.ne.jp

is the squashed version with updated comments and deduplicated code.

> 
> And can you send a series that isn't RFC so that I can know you feel it
> is good enough to be merged?

Do you want this fix as a series of patches (the former link)?
Since I think that the changeset should be atomically applied, I posted the latter link.

