Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3D5631EC40
	for <lists+linux-usb@lfdr.de>; Thu, 18 Feb 2021 17:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233608AbhBRQae (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Feb 2021 11:30:34 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:59594 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbhBRNlK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Feb 2021 08:41:10 -0500
Received: from fsav303.sakura.ne.jp (fsav303.sakura.ne.jp [153.120.85.134])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 11IDdc1x049492;
        Thu, 18 Feb 2021 22:39:38 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav303.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp);
 Thu, 18 Feb 2021 22:39:38 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav303.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 11IDdXjU049179
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 18 Feb 2021 22:39:38 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: circular submissions in cdc-wdm and how to break them on
 disconnect
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
References: <3dfe07c7ad08d4dfd7eac7bd54e6b821319abe90.camel@suse.com>
 <fc789f07-9b29-a86b-5527-ac6f5b3ef2dd@i-love.sakura.ne.jp>
 <2db36d52015b644cc1891fcffc87ef09c2b728b7.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <6e2e6b35-5d7c-57fa-5b44-9a07a024ce4b@i-love.sakura.ne.jp>
Date:   Thu, 18 Feb 2021 22:39:31 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2db36d52015b644cc1891fcffc87ef09c2b728b7.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/02/18 21:55, Oliver Neukum wrote:
> Could you test whether the attached patch fixes your issue?

"INFO: task hung in wdm_flush" was fixed on 2020/11/16 12:12, and
as far as I know syzbot is not reporting any problem with this driver.
I don't have issues regardless of your patch. I can't test your patch.


> URBs with thos callbacks. This needs to be blocked, stopped

s/thos/those/
