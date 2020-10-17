Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 856422912D2
	for <lists+linux-usb@lfdr.de>; Sat, 17 Oct 2020 18:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437923AbgJQQCG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Oct 2020 12:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437882AbgJQQCG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Oct 2020 12:02:06 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9083C061755
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2020 09:02:04 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id p21so2970850pju.0
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2020 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wAOrUPZiNNFd6cCj1YDQMklyq0Ys8fr5tyFDkAt+3EA=;
        b=dIxxRx5tODMaK1xtW0S0JO8pmeHSUcJCXYFAvqCDBiqbReA7IgZqaCFVHQd+bkA+qX
         thSUj3I96hL8Y68ph41Vd5i9vLqVwTNKRuoHcyAViGiHHcgAlO7VMZZfix7bkuQWjUWA
         hsq8DSwrj7OyWPUmEw1mVBx1i3EiYl+m/7fKV1UEKdjLfcTtSost37pFjSNc5YosogX3
         07GkeHGuIMuyzeSDJXh4RueIQO3uCWvmXkchUMCq6ocTPzW+xpKjna4ZJT5jdpMpLKR+
         K9Uwi5fre8OecbD6HjFW/xJ/OpbPbZiMFlcIBvnwYfnV7r9H0J7WQEZS3S+OMy42A/TM
         +aCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wAOrUPZiNNFd6cCj1YDQMklyq0Ys8fr5tyFDkAt+3EA=;
        b=LsCX9h3RHBKPmPMoNM1Z3Hn+0eVs6LRCpkS1JU0Swtqcdiqgii03SYLUv8zLHTVYix
         7b9uhnK1yZE1JM+pfiDzBtS6MZWnyM9Fsbglh7BArKR+m7PKfl0qnKVVGNERxaK+Mr97
         4gUBr4NQC42PuRWLnDP6OUceyxTx2cqFcwCxy6TWiNYESzOVYs4jY/X65EFpPs2f+2Wl
         nQuOkk+8l5ukFNCmaVWO0nIyzD31fDG9X729bgdth6DzHuk4KRi9CXQMbHnrXquvtbP6
         pB7cNTf/YX7RofPl+XDoN37S7SGxe8GZHT92fqOKN9pFWwXLqsRf9l4SV6bRc21NPPiF
         g0lQ==
X-Gm-Message-State: AOAM5336knwCHJijelv6dG5jDlkZREjGQZmVDic9k/Cq85kEU8PuZhYz
        PLC6kaW78zfqCrKPspyLAV/R2MtzpLCag0g8
X-Google-Smtp-Source: ABdhPJxJdQ/uVG87TFG6sj3Y50JMPM+3ZYddy1s+b0kpx7HKqhrMQGTCmGU5vYWJtXtNDlgj0fHeng==
X-Received: by 2002:a17:902:ee09:b029:d5:288d:fce4 with SMTP id z9-20020a170902ee09b02900d5288dfce4mr9600535plb.45.1602950523999;
        Sat, 17 Oct 2020 09:02:03 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id t2sm6185356pji.12.2020.10.17.09.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2020 09:02:03 -0700 (PDT)
Subject: =?UTF-8?B?UmU6IHdhcm5pbmc6IGxhYmVsIOKAmGVycm9yX2RlYnVnZnPigJkgZGVm?=
 =?UTF-8?Q?ined_but_not_used_=5b-Wunused-label=5d?=
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
References: <c5e3148d-63c6-17f6-f4f8-1491ce8e6775@kernel.dk>
 <CAFBinCAqwDPQ-dZVfV8kv777mqhSthbH7O7HMUpp6hy1KJLRhA@mail.gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <0758010e-c8f5-6301-4e49-5cd9001f4c32@kernel.dk>
Date:   Sat, 17 Oct 2020 10:02:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCAqwDPQ-dZVfV8kv777mqhSthbH7O7HMUpp6hy1KJLRhA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/17/20 9:46 AM, Martin Blumenstingl wrote:
> Hi Jens,
> 
> On Sat, Oct 17, 2020 at 4:57 PM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> Hi,
>>
>> There's a new warning in -git if:
>>
>> CONFIG_USB_DWC2_PERIPHERAL || CONFIG_USB_DWC2_DUAL_ROLE
>>
>> isn't set in the .config:
>>
>> drivers/usb/dwc2/platform.c: In function ‘dwc2_driver_probe’:
>> drivers/usb/dwc2/platform.c:611:1: warning: label ‘error_debugfs’ defined but not used [-Wunused-label]
>>   611 | error_debugfs:
>>       | ^~~~~~~~~~~~~
>>
>> which was caused by this commit:
>>
>> commit e1c08cf23172ed6fb228d75efc9f4c80a6812116
>> Author: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Date:   Sat Jul 4 00:50:43 2020 +0200
>>
>>     usb: dwc2: Add missing cleanups when usb_add_gadget_udc() fails
> thanks for pointing this out! It seems like v2 of my patch was picked.
> v3 [0] had this exact issue fixed which has been found by the kbuild
> test robot
> I can send a patch adding the #ifdefs so it can go into a for-linus
> tree with a Fixes tag for the above commit
> is there anything apart from that which needs to be done?

That seems about right, thanks.

-- 
Jens Axboe

