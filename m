Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F7D33F7A2
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 18:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232499AbhCQR4t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 13:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbhCQR4Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Mar 2021 13:56:25 -0400
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1754C06174A
        for <linux-usb@vger.kernel.org>; Wed, 17 Mar 2021 10:56:24 -0700 (PDT)
From:   Matthias Schwarzott <zzam@gentoo.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        systemd-devel@lists.freedesktop.org, hirofumi@mail.parknet.co.jp
References: <20210309155046.GA176674@rowland.harvard.edu>
 <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
 <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
 <20210316170433.GD448722@rowland.harvard.edu>
 <1d9f059e-8b21-0895-9a50-39b6b1a5cc5c@redhat.com>
 <20210317151746.GB488655@rowland.harvard.edu>
Subject: Re: [systemd-devel] [usb-storage] Re: Amazon Kindle disconnect after
 Synchronize Cache
Message-ID: <5f8c0755-0884-f505-c4e8-3a5e89001d58@gentoo.org>
Date:   Wed, 17 Mar 2021 18:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317151746.GB488655@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am 17.03.21 um 16:17 schrieb Alan Stern:
> On Wed, Mar 17, 2021 at 01:21:50PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 3/16/21 6:04 PM, Alan Stern wrote:
>>> I think it would be mildly better, but not a whole lot.  Since the
>>> Kindle describes itself as having removable media, the kernel normally
>>> probes it periodically to make sure the media remains present.  The
>>> default probing interval is 2 seconds.  Reducing it to 0.9 seconds
>>> doesn't represent an exorbitant additional load IMO -- especially since
>>> Kindles don't tend to spend huge amounts of time connected to computers.
>>
>> Ah, I did not know that the default polling interval was that low(ish),
>> given that the default indeed is already that low, then changing it to
>> 0.8 seconds would not be a big change.  And we probably have a lot of
>> lower hanging fruit for unnecessary wakeups then that.
> 
> So we need to make a decision: Should the patch be merged, or should we
> punt the issue to userspace tools?
> 
> On the plus side, the patch is rather small and non-invasive (although
> it does allocate the last remaining bit in the 32-bit fflags field).
> There's also the advantage of sending the extra command only when it is
> needed, as opposed to increasing the overall frequency of TUR polling.
> 
> Any opinions?

I would vote to do in kernel as that is a cleaner solution:

1. It will work out of the box.
2. It only sends one extra command when needed.
3. It makes the block-device not break if user-space adjusts the poll 
interval to higher values.

Matthias
