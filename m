Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE68F2073B1
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 14:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390861AbgFXMsM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jun 2020 08:48:12 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:57218 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389347AbgFXMsM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jun 2020 08:48:12 -0400
Received: from fsav105.sakura.ne.jp (fsav105.sakura.ne.jp [27.133.134.232])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 05OCmAKx014252;
        Wed, 24 Jun 2020 21:48:10 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav105.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav105.sakura.ne.jp);
 Wed, 24 Jun 2020 21:48:10 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav105.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 05OCm9cw014166
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Wed, 24 Jun 2020 21:48:10 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
To:     Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
 <20200528194057.GA21709@rowland.harvard.edu>
 <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
 <20200528205807.GB21709@rowland.harvard.edu>
 <CAAeHK+xx-uodQWBDA2pJ_Et26uBPb6J7fTwu4h6D1uUTv8t3HA@mail.gmail.com>
 <79ba410f-e0ef-2465-b94f-6b9a4a82adf5@i-love.sakura.ne.jp>
 <20200530011040.GB12419@rowland.harvard.edu>
 <c491266c-7c13-fa9d-602e-52d147c241b6@i-love.sakura.ne.jp>
 <1592999831.28236.8.camel@suse.com>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <dc35a635-c64f-6716-f63a-7e353c07f985@i-love.sakura.ne.jp>
Date:   Wed, 24 Jun 2020 21:48:09 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1592999831.28236.8.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/06/24 20:57, Oliver Neukum wrote:
> Am Samstag, den 30.05.2020, 13:58 +0900 schrieb Tetsuo Handa:
> 
> Hi,
> 
> sorry for taking this long. There has been a family emergency.

No problem. Thank you for responding.

>> Therefore, again, please show me as a patch first.
> 
> Sure, attached. The difficulty here is that I see three possible
> interacting errors, two of which are races.

This thread grew long, and you have many posts to read up to
https://lkml.kernel.org/r/c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp .
