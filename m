Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DDDC316E5E
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 19:20:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbhBJSTg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 13:19:36 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:60026 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232750AbhBJSRx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Feb 2021 13:17:53 -0500
Received: from fsav106.sakura.ne.jp (fsav106.sakura.ne.jp [27.133.134.233])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 11AIGZYR080890;
        Thu, 11 Feb 2021 03:16:35 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav106.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp);
 Thu, 11 Feb 2021 03:16:35 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 11AIGZ2c080887
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 11 Feb 2021 03:16:35 +0900 (JST)
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
 <ee936421-66ea-c6a7-fa1e-d4077ab28ed0@i-love.sakura.ne.jp>
 <1f4b36a1-460e-1154-b46c-32ba72b88205@linuxfoundation.org>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <dffdefc9-9499-2cd0-fce9-b084df1511af@i-love.sakura.ne.jp>
Date:   Thu, 11 Feb 2021 03:16:29 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1f4b36a1-460e-1154-b46c-32ba72b88205@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/02/11 3:11, Shuah Khan wrote:
> I would like to see to see a complete fix. This patch changes
> kthread_get_run() to return NULL. Without adding handling for
> NULL in the callers of kthread_get_run(), we will start seeing
> problems.

What problems are you aware of?

> 
> Does this patch fix the problem syzbot found?

Yes, this patch as-is avoids the crash syzbot found.
