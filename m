Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E285301273
	for <lists+linux-usb@lfdr.de>; Sat, 23 Jan 2021 03:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbhAWC6s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Jan 2021 21:58:48 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:53738 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbhAWC6r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Jan 2021 21:58:47 -0500
Received: from fsav101.sakura.ne.jp (fsav101.sakura.ne.jp [27.133.134.228])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 10N2vwmD044071;
        Sat, 23 Jan 2021 11:57:58 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav101.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav101.sakura.ne.jp);
 Sat, 23 Jan 2021 11:57:58 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav101.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 10N2vrV3043952
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Sat, 23 Jan 2021 11:57:58 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: circular submissions in cdc-wdm and how to break them on
 disconnect
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
References: <3dfe07c7ad08d4dfd7eac7bd54e6b821319abe90.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <fc789f07-9b29-a86b-5527-ac6f5b3ef2dd@i-love.sakura.ne.jp>
Date:   Sat, 23 Jan 2021 11:57:50 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <3dfe07c7ad08d4dfd7eac7bd54e6b821319abe90.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/01/22 0:30, Oliver Neukum wrote:
> Hi,
> 
> you have moved kill_urbs() below
> 
>         cancel_work_sync(&desc->rxwork);
>         cancel_work_sync(&desc->service_outs_intr);
> 
> to close a race, as
> 
> rv = usb_submit_urb(desc->response, GFP_KERNEL);
> 
> in service_outstanding_interrupt() would submit the response URB,
> right?

Right. Shouldn't remaining

  kill_urbs(desc);
  cancel_work_sync(&desc->rxwork);
  cancel_work_sync(&desc->service_outs_intr);

sequence in wdm_suspend() and wdm_pre_reset() be updated as well?

>        Unfortunately we have in wdm_in_callback() the following code path
> 
>         if (desc->rerr) {
>                 /*
>                  * Since there was an error, userspace may decide to not read
>                  * any data after poll'ing.
>                  * We should respond to further attempts from the device to send
>                  * data, so that we can get unstuck.
>                  */
>                 schedule_work(&desc->service_outs_intr);
> 
> It looks to me like we have a circular dependency here and this needs some
> change to break. What do you think about the attached patch?

I don't know how poisoning works. But why can't we simply use test_bit() on
WDM_SUSPENDING/WDM_RESETTING/WDM_DISCONNECTING flags, for schedule_work() in
wdm_in_callback() is called with desc->iuspin (which serializes setting of
these flags) held.

By the way, since someone might interpret "broken" as "out of order / not working",
I expect not using "This needs to be broken." in the commit message. There would be
some better idiom.

