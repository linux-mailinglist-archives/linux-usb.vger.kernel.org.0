Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A245A379F4B
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 07:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhEKFt3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 01:49:29 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:50200 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbhEKFt2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 01:49:28 -0400
Received: from fsav404.sakura.ne.jp (fsav404.sakura.ne.jp [133.242.250.103])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 14B5mAT7042393;
        Tue, 11 May 2021 14:48:10 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav404.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp);
 Tue, 11 May 2021 14:48:10 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 14B5m9wS042353
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 11 May 2021 14:48:10 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Fix ODEBUG bug in wdm_disconnect
To:     qiang.zhang@windriver.com, gregkh@linuxfoundation.org,
        oneukum@suse.com, lee.jones@linaro.org
Cc:     linux-usb@vger.kernel.org
References: <20210511033140.29658-1-qiang.zhang@windriver.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <0e4131c7-0372-53cb-74a3-13d3a58ba25c@i-love.sakura.ne.jp>
Date:   Tue, 11 May 2021 14:48:06 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511033140.29658-1-qiang.zhang@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/05/11 12:31, qiang.zhang@windriver.com wrote:
> This warning is generated because when kfree wdm_device,
> it is found that there is still an active work in workqueue,
> This phenomenon may be due to the following reasons.
> when the devices disconnect, although the work was cancelled,
> but the schedule_work still may be called, therefore, before
> scheduling work, we need to detect the status of the device.
> 
> Reported-by: syzbot <syzbot+7da71853830ac3289474@syzkaller.appspotmail.com>
> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
> ---
>  drivers/usb/class/cdc-wdm.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Oliver Neukum is aware of this problem, and is considering poisoning approach than
checking WDM_SUSPENDING/WDM_RESETTING/WDM_DISCONNECTING approach. I guess we could
replace three test_bit() tests into OR'ed-bits test (something like test_bits()) ?

  https://lkml.kernel.org/r/2db36d52015b644cc1891fcffc87ef09c2b728b7.camel@suse.com

Oliver, how do we want to fix this problem?
