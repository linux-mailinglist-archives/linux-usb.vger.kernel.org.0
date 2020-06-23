Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42FC20508F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 13:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732278AbgFWLUM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jun 2020 07:20:12 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:50991 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732191AbgFWLUL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jun 2020 07:20:11 -0400
Received: from fsav102.sakura.ne.jp (fsav102.sakura.ne.jp [27.133.134.229])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 05NBK9hF041302;
        Tue, 23 Jun 2020 20:20:09 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav102.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav102.sakura.ne.jp);
 Tue, 23 Jun 2020 20:20:09 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav102.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 05NBK9bI041297
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Tue, 23 Jun 2020 20:20:09 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
To:     Andrey Konovalov <andreyknvl@google.com>,
        Oliver Neukum <oneukum@suse.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <1590408381.2838.4.camel@suse.com>
 <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
 <20200528194057.GA21709@rowland.harvard.edu>
 <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
 <20200528205807.GB21709@rowland.harvard.edu>
 <1590852311.14886.3.camel@suse.com>
 <20200530154728.GB29298@rowland.harvard.edu>
 <0c43caf8-1135-1d38-cb57-9c0f84c4394d@i-love.sakura.ne.jp>
 <254939d4-f3a1-8c7e-94e5-9862c02774fa@i-love.sakura.ne.jp>
 <CAAeHK+w+wBNksK_wpczad3AU4oLQRsjL_5G8p1R55Zh_FLhprg@mail.gmail.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp>
Date:   Tue, 23 Jun 2020 20:20:08 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAAeHK+w+wBNksK_wpczad3AU4oLQRsjL_5G8p1R55Zh_FLhprg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/06/19 22:56, Andrey Konovalov wrote:
> Oliver, any chance you could help us with fixing the hang in this
> driver? You seem to be its original author. This hang is one of the
> top crashers on syzbot, with over 32000 crashed kernels.
> 

Yes, I think that wdm_flush() has another bug and wdm_write() has yet another bug.
I need the authors' comments.

wdm_flush() says

	/* cannot dereference desc->intf if WDM_DISCONNECTING */
	if (test_bit(WDM_DISCONNECTING, &desc->flags))
		return -ENODEV;
	if (desc->werr < 0)
		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
			desc->werr);

but it seems to me that nothing guarantees that test_bit(WDM_DISCONNECTING) == false
indicates dereferencing desc->intf->dev is safe, for wdm_flush() tests WDM_DISCONNECTING
without any lock whereas wdm_disconnect() sets WDM_DISCONNECTING under wdm_mutex and
desc->iuspin held. It might be safe to dereference from wdm_release() which holds wdm_mutex.

Also, if wait_event() in wdm_flush() might fail to wake up (due to close() dependency
problem this crash report is focusing on), wait_event_interruptible() in wdm_write() might
also fail to wake up (unless interrupted) due to the same dependency. Then, why can't we
wait for completion of wdm_out_callback() (with reasonable timeout) inside wdm_write() ?

I feel that wdm_flush() is so bogus (which could/should be removed).
