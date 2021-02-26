Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109B4325A97
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 01:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhBZALQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Feb 2021 19:11:16 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:63152 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhBZALQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Feb 2021 19:11:16 -0500
Received: from fsav301.sakura.ne.jp (fsav301.sakura.ne.jp [153.120.85.132])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 11Q0AXsq010767;
        Fri, 26 Feb 2021 09:10:33 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav301.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp);
 Fri, 26 Feb 2021 09:10:33 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 11Q0AXQ9010763
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 26 Feb 2021 09:10:33 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH v3] usb: usbip: serialize attach/detach operations
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        Julia Lawall <julia.lawall@inria.fr>,
        The kernel test robot <lkp@intel.com>
References: <YDCzLfhawx4u28dd@kroah.com>
 <20210223015907.3506-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <95d1398b-6b95-2da4-43f7-7a6b0c87c4f8@linuxfoundation.org>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <53dfc860-e118-4aac-8afd-80ea3fa2f4ce@i-love.sakura.ne.jp>
Date:   Fri, 26 Feb 2021 09:10:30 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <95d1398b-6b95-2da4-43f7-7a6b0c87c4f8@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/02/26 9:00, Shuah Khan wrote:
> This patch makes changes to 3 different drivers. Please split these
> patches. Makes it easier to revert or fix them.
> 
> Patch1 could add common routines and use them in stud_dev and vudc
> Same for usbip_event_lock_killable() and usbip_event_unlock().
> Introduce them in a separate patch.
> 
> __usbip_sockfd_store() could be made common to stub_dev and vudc
> similar to usbip_prepare_threads() and usbip_unprepare_threads()
> 
> It will lot easier to review if this large patch is split into
> smaller patches.

Then, can we apply
https://lkml.kernel.org/r/20210205135707.4574-1-penguin-kernel@I-love.SAKURA.ne.jp
as the first patch? It is very easy to review and apply and backport to stable.
