Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658431DCA9F
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2020 12:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgEUKBi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 May 2020 06:01:38 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:49680 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbgEUKBi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 May 2020 06:01:38 -0400
Received: from fsav305.sakura.ne.jp (fsav305.sakura.ne.jp [153.120.85.136])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 04LA1GRn055091;
        Thu, 21 May 2020 19:01:16 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav305.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav305.sakura.ne.jp);
 Thu, 21 May 2020 19:01:16 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav305.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 04LA1FL0055087
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Thu, 21 May 2020 19:01:16 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
To:     Greg KH <greg@kroah.com>
Cc:     Colin Ian King <colin.king@canonical.com>,
        Oliver Neukum <oneukum@suse.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org
References: <20200520233129.3704-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200521073323.GA2579717@kroah.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <177cc23a-60a7-f5cd-09d6-57608727ea27@i-love.sakura.ne.jp>
Date:   Thu, 21 May 2020 19:01:13 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521073323.GA2579717@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/05/21 16:33, Greg KH wrote:
> On Thu, May 21, 2020 at 08:31:29AM +0900, Tetsuo Handa wrote:
>> Since e.g. wdm_flush() calls wait_event() on WDM_IN_USE bit,
>> make sure to call wake_up_all() when clearing WDM_IN_USE bit.
> 
> I'm sorry, but I don't understand what this changelog text is trying to
> say.  Can you reword this differently?

wait_event("condition") wants corresponding wake_up() (or its variant)
after making "condition" == true. For example, wdm_flush() calls

	wait_event(desc->wait,
			/*
			 * needs both flags. We cannot do with one
			 * because resetting it would cause a race
			 * with write() yet we need to signal
			 * a disconnect
			 */
			!test_bit(WDM_IN_USE, &desc->flags) ||
			test_bit(WDM_DISCONNECTING, &desc->flags));

but wdm_write() is not calling wake_up(&desc->wait) after
clear_bit(WDM_IN_USE, &desc->flags) when usb_submit_urb() failed.

> And is this a bugfix?  For what?  Does it need to go to stable kernels?

Potential bugfix. syzbot is reporting two bugs that hung at wdm_flush(),
but I think that this patch won't fix these bugs. Therefore, I don't think
this patch needs to go to stable kernels.

