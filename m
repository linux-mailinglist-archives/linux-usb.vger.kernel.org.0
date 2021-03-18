Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AEF4340000
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 08:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhCRHFV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 03:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbhCRHEu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Mar 2021 03:04:50 -0400
X-Greylist: delayed 91 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 18 Mar 2021 00:04:49 PDT
Received: from mx2.uni-regensburg.de (mx2.uni-regensburg.de [IPv6:2001:638:a05:137:165:0:3:bdf8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A28AC06174A
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 00:04:49 -0700 (PDT)
Received: from mx2.uni-regensburg.de (localhost [127.0.0.1])
        by localhost (Postfix) with SMTP id BABF16000057
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 08:04:47 +0100 (CET)
Received: from gwsmtp.uni-regensburg.de (gwsmtp1.uni-regensburg.de [132.199.5.51])
        by mx2.uni-regensburg.de (Postfix) with ESMTP id 33E6E6000058
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 08:04:45 +0100 (CET)
Received: from uni-regensburg-smtp1-MTA by gwsmtp.uni-regensburg.de
        with Novell_GroupWise; Thu, 18 Mar 2021 08:04:44 +0100
Message-Id: <6052FB8B020000A10003FE28@gwsmtp.uni-regensburg.de>
X-Mailer: Novell GroupWise Internet Agent 18.3.1 
Date:   Thu, 18 Mar 2021 08:04:43 +0100
From:   "Ulrich Windl" <Ulrich.Windl@rz.uni-regensburg.de>
To:     <zzam@gentoo.org>, <hdegoede@redhat.com>,
        <stern@rowland.harvard.edu>
Cc:     "systemd-devel@lists.freedesktop.org" 
        <systemd-devel@lists.freedesktop.org>,
        <usb-storage@lists.one-eyed-alien.net>,
        <hirofumi@mail.parknet.co.jp>, <linux-usb@vger.kernel.org>
Subject: Antw: [EXT] Re: [systemd-devel] [usb-storage] Re: Amazon
 Kindle disconnect after Synchronize Cache
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
 <5f8c0755-0884-f505-c4e8-3a5e89001d58@gentoo.org>
 <C63C44570200006665972EEF@gwsmtp.uni-regensburg.de>
 <B960C12A020000A667ECE9F9@gwsmtp.uni-regensburg.de>
 <B72C58530200001565972EEF@gwsmtp.uni-regensburg.de>
 <0F2319EB020000F567ECE9F9@gwsmtp.uni-regensburg.de>
 <DE3F57520200009E65972EEF@gwsmtp.uni-regensburg.de>
 <474C42CD02000091AE14D9EC@gwsmtp.uni-regensburg.de>
In-Reply-To: <474C42CD02000091AE14D9EC@gwsmtp.uni-regensburg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>>> Matthias Schwarzott <zzam@gentoo.org> schrieb am 17.03.2021 um 18:56 in
Nachricht <5f8c0755-0884-f505-c4e8-3a5e89001d58@gentoo.org>:
> Am 17.03.21 um 16:17 schrieb Alan Stern:
>> On Wed, Mar 17, 2021 at 01:21:50PM +0100, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 3/16/21 6:04 PM, Alan Stern wrote:
>>>> I think it would be mildly better, but not a whole lot.  Since the
>>>> Kindle describes itself as having removable media, the kernel normally
>>>> probes it periodically to make sure the media remains present.  The
>>>> default probing interval is 2 seconds.  Reducing it to 0.9 seconds
>>>> doesn't represent an exorbitant additional load IMO ‑‑ especially since
>>>> Kindles don't tend to spend huge amounts of time connected to computers.
>>>
>>> Ah, I did not know that the default polling interval was that low(ish),
>>> given that the default indeed is already that low, then changing it to
>>> 0.8 seconds would not be a big change.  And we probably have a lot of
>>> lower hanging fruit for unnecessary wakeups then that.
>> 
>> So we need to make a decision: Should the patch be merged, or should we
>> punt the issue to userspace tools?
>> 
>> On the plus side, the patch is rather small and non‑invasive (although
>> it does allocate the last remaining bit in the 32‑bit fflags field).
>> There's also the advantage of sending the extra command only when it is
>> needed, as opposed to increasing the overall frequency of TUR polling.
>> 
>> Any opinions?
> 
> I would vote to do in kernel as that is a cleaner solution:
> 
> 1. It will work out of the box.

...once you have the right kernel

> 2. It only sends one extra command when needed.
> 3. It makes the block‑device not break if user‑space adjusts the poll 
> interval to higher values.
> 
> Matthias
> _______________________________________________
> systemd‑devel mailing list
> systemd‑devel@lists.freedesktop.org 
> https://lists.freedesktop.org/mailman/listinfo/systemd‑devel 



