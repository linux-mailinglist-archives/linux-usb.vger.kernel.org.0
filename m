Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBDDE33E0DD
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 22:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbhCPVwh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 17:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhCPVwX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Mar 2021 17:52:23 -0400
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2577DC06174A
        for <linux-usb@vger.kernel.org>; Tue, 16 Mar 2021 14:52:23 -0700 (PDT)
From:   Matthias Schwarzott <zzam@gentoo.org>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
        systemd-devel@lists.freedesktop.org, hirofumi@mail.parknet.co.jp
References: <20210307165856.GA104554@rowland.harvard.edu>
 <268e646f-d4ea-3190-f1b9-8e69bfc1b019@gentoo.org>
 <20210309155046.GA176674@rowland.harvard.edu>
 <dfd2b281-3beb-9869-37b6-8bd48a6cf40f@gentoo.org>
 <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
 <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
 <20210316170433.GD448722@rowland.harvard.edu>
Subject: Re: [systemd-devel] [usb-storage] Re: Amazon Kindle disconnect after
 Synchronize Cache
Message-ID: <70f60146-bbe9-af81-7b4f-29bcc22e0255@gentoo.org>
Date:   Tue, 16 Mar 2021 22:52:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316170433.GD448722@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am 16.03.21 um 18:04 schrieb Alan Stern:
> On Tue, Mar 16, 2021 at 05:43:34PM +0100, Hans de Goede wrote:
>>
>> Thank you for this patch, yes if this works it would IMHO be
>> a much better solution then the udev rule.
> 
Thank you for the patch.

> I think it would be mildly better, but not a whole lot.  Since the
> Kindle describes itself as having removable media, the kernel normally
> probes it periodically to make sure the media remains present.  The
> default probing interval is 2 seconds.  Reducing it to 0.9 seconds
> doesn't represent an exorbitant additional load IMO -- especially since
> Kindles don't tend to spend huge amounts of time connected to computers.
> 
> If it's merely a question of where to change the polling interval from
> the default (automatically in the kernel or by userspace), that also
> doesn't seem like a terribly important choice.  Certainly a udev rule or
> hwdb entry is a lot easier to maintain than special-case code in the
> kernel.
> 
>> One question though, if this works to fix the undesired ejects,
>> will an actual eject (using e.g. the eject utility as say
>> "sudo eject /dev/sda") still be seen as an eject by the kindle
>> after this ?
> 
> It should be.  Maybe Matthias will try it and let us know.
> 
Just for reference a direct answer here:
Yes, eject keeps working as it should.

>> Because that is actually kind of important for everyone using their
>> Kindle with Calibre, breaking that would not be good.

I also tried to upload a book using calibre (without disabling any 
workarounds in calibre).
The full process did work fine.

Regards
Matthias
