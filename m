Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6902404E5
	for <lists+linux-usb@lfdr.de>; Mon, 10 Aug 2020 12:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgHJKrJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Aug 2020 06:47:09 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:63087 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbgHJKrI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Aug 2020 06:47:08 -0400
Received: from fsav103.sakura.ne.jp (fsav103.sakura.ne.jp [27.133.134.230])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 07AAl4F3005489;
        Mon, 10 Aug 2020 19:47:04 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav103.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp);
 Mon, 10 Aug 2020 19:47:04 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 07AAl4jS005486
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Mon, 10 Aug 2020 19:47:04 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <1590408381.2838.4.camel@suse.com>
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
 <c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp>
 <b347b882-a986-24c6-2b37-0b1a092931b9@i-love.sakura.ne.jp>
 <1593674666.3609.3.camel@suse.com>
 <f6de3d3a-6825-1904-65f4-8d96594a9846@i-love.sakura.ne.jp>
Message-ID: <c7e9ab26-7a6b-7adb-0208-cf946a97b7d8@i-love.sakura.ne.jp>
Date:   Mon, 10 Aug 2020 19:47:03 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f6de3d3a-6825-1904-65f4-8d96594a9846@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/07/15 15:15, Tetsuo Handa wrote:
> I'm skeptical about the value of trying to synchronously return an error code for
> wmd_write() request to the caller. I'm really inclined to remove wdm_flush() completely.
> 

No response. It seems to me that this module is orphaned.

Can we go with simply removing wdm_flush() completely?
