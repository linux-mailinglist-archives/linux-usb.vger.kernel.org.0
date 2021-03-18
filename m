Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688B834000D
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 08:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhCRHJM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 03:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbhCRHJM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Mar 2021 03:09:12 -0400
Received: from mx4.uni-regensburg.de (mx4.uni-regensburg.de [IPv6:2001:638:a05:137:165:0:4:4e7a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC64EC06174A
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 00:09:11 -0700 (PDT)
Received: from mx4.uni-regensburg.de (localhost [127.0.0.1])
        by localhost (Postfix) with SMTP id 9D42B600005A
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 08:03:09 +0100 (CET)
Received: from gwsmtp.uni-regensburg.de (gwsmtp1.uni-regensburg.de [132.199.5.51])
        by mx4.uni-regensburg.de (Postfix) with ESMTP id 778F8600004E
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 08:03:09 +0100 (CET)
Received: from uni-regensburg-smtp1-MTA by gwsmtp.uni-regensburg.de
        with Novell_GroupWise; Thu, 18 Mar 2021 08:03:08 +0100
Message-Id: <6052FB2B020000A10003FE1E@gwsmtp.uni-regensburg.de>
X-Mailer: Novell GroupWise Internet Agent 18.3.1 
Date:   Thu, 18 Mar 2021 08:03:07 +0100
From:   "Ulrich Windl" <Ulrich.Windl@rz.uni-regensburg.de>
To:     "Lennart Poettering" <lennart@poettering.net>,
        <stern@rowland.harvard.edu>
Cc:     <zzam@gentoo.org>,
        "systemd-devel@lists.freedesktop.org" 
        <systemd-devel@lists.freedesktop.org>,
        <usb-storage@lists.one-eyed-alien.net>,
        <hirofumi@mail.parknet.co.jp>, <linux-usb@vger.kernel.org>
Subject: Antw: [EXT] Re: [systemd-devel] [usb-storage] Re: Amazon
 Kindle disconnect after Synchronize Cache
References: <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
 <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
 <20210316170433.GD448722@rowland.harvard.edu>
 <1d9f059e-8b21-0895-9a50-39b6b1a5cc5c@redhat.com>
 <20210317151746.GB488655@rowland.harvard.edu>
 <YFIyidaZZmDoTevB@gardel-login>
 <F279F9BC020000F5AE14D9EC@gwsmtp.uni-regensburg.de>
 <C63C44570200006665972EEF@gwsmtp.uni-regensburg.de>
 <B960C12A020000A667ECE9F9@gwsmtp.uni-regensburg.de>
 <B72C58530200001565972EEF@gwsmtp.uni-regensburg.de>
 <0F2319EB020000F567ECE9F9@gwsmtp.uni-regensburg.de>
 <DE3F57520200009E65972EEF@gwsmtp.uni-regensburg.de>
 <52CC0074020000A3D68BC3D5@gwsmtp.uni-regensburg.de>
In-Reply-To: <52CC0074020000A3D68BC3D5@gwsmtp.uni-regensburg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>>> Lennart Poettering <lennart@poettering.net> schrieb am 17.03.2021 um 17:47
in
Nachricht <YFIyidaZZmDoTevB@gardel-login>:
> On Mi, 17.03.21 11:17, Alan Stern (stern@rowland.harvard.edu) wrote:
> 
>> On Wed, Mar 17, 2021 at 01:21:50PM +0100, Hans de Goede wrote:
>> > Hi,
>> >
>> > On 3/16/21 6:04 PM, Alan Stern wrote:
>> > > I think it would be mildly better, but not a whole lot.  Since the
>> > > Kindle describes itself as having removable media, the kernel normally
>> > > probes it periodically to make sure the media remains present.  The
>> > > default probing interval is 2 seconds.  Reducing it to 0.9 seconds
>> > > doesn't represent an exorbitant additional load IMO ‑‑ especially
since
>> > > Kindles don't tend to spend huge amounts of time connected to
computers.
>> >
>> > Ah, I did not know that the default polling interval was that low(ish),
>> > given that the default indeed is already that low, then changing it to
>> > 0.8 seconds would not be a big change.  And we probably have a lot of
>> > lower hanging fruit for unnecessary wakeups then that.
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
> I'd argue that this should be done in the kernel.
> 
> IIUC the issue can actually lead to data corruption, no? i.e. some
> program writes 25 different files to different places on such an fs,
> then calls fsync() on one of them but not the others. Then quite
> possibly the fsync() will trigger a device disconnect sooner or later
> at which point the one file surely hit the disk, but there's no
> guarantee for the other 24, they might remain cached in memory and are
> never written out.
> 
> I'd say quirks that are necessary to avoid data corruption should
> better be done in the kernel and udev's hwdb stuff is only for stuff
> that "fills in gaps", i.e. adds additional tweaks that make things
> prettier, cleaner, nicer, more efficient but not things that make the
> basic things work, and data integrity sounds pretty basic to me.

But seeing the list of bad, broken or ill-designed hardware grow year by year,
I wonder whether we really want all that bloat in the kernel.

> 
> Or to give a counter example: the device advertises it can do media
> change, but actually cannot, right, it's not a floppy drive or cdrom
> driver after all? maybe hwdb would thus actually be the place for the
> opposite of the suggested fix: turn off the media change polling to
> reduce needless wakeups.

I actually think it would be best if those work-arounds could be loadable as
module, and the vendors of broken hardware can provide the modules that
document their broken design as well.

> 
> I mean, I'd be more open to this if this was a frequent thing and the
> database for devices like this was just tooo large for the kernel to
> carry, but that's not the case here either: it's two devices afaik,
> and such an issue wasn't seen elswhere.

...two _more_ devices...

> 
> Lennart
> 
> ‑‑
> Lennart Poettering, Berlin
> _______________________________________________
> systemd‑devel mailing list
> systemd‑devel@lists.freedesktop.org 
> https://lists.freedesktop.org/mailman/listinfo/systemd‑devel 



