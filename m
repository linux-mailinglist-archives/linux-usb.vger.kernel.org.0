Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 417741DE1C2
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 10:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgEVI0e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 04:26:34 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:59534 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728152AbgEVI0d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 May 2020 04:26:33 -0400
Received: from fsav104.sakura.ne.jp (fsav104.sakura.ne.jp [27.133.134.231])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04M8QHO6058310;
        Fri, 22 May 2020 17:26:17 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav104.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav104.sakura.ne.jp);
 Fri, 22 May 2020 17:26:17 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav104.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04M8QH9Q058306
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Fri, 22 May 2020 17:26:17 +0900 (JST)
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
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <03894591-a1ac-496a-a35f-55953e5bcc06@i-love.sakura.ne.jp>
Date:   Fri, 22 May 2020 17:26:12 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1590134662.19681.12.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/05/22 17:04, Oliver Neukum wrote:
> May I ask you to redo the patch with comments added stating
> that the wake up is done for the sake of wdm_flush(), change
> the description and add the link to syzkaller?

You can take over this patch. syzbot tried this patch on 2020/02/11 01:23 at
https://syzkaller.appspot.com/bug?id=e7b761593b23eb50855b9ea31e3be5472b711186 ,
but this patch did not solve the problem syzbot has found. Thus, I don't add
a link to syzkaller...
