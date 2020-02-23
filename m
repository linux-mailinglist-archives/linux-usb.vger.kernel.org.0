Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3484516977B
	for <lists+linux-usb@lfdr.de>; Sun, 23 Feb 2020 13:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgBWMMd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 23 Feb 2020 07:12:33 -0500
Received: from sender4-pp-o97.zoho.com ([136.143.188.97]:25714 "EHLO
        sender4-pp-o97.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbgBWMMd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 23 Feb 2020 07:12:33 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1582459948; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Zv9dzNTa/vSo6j5fbHyw+AEwu6Yjba+L2s2lhEUygEnG69xMs+nTPMPcqupOsYSPXz0TYIgP2dgKaPPI1Ext42tAzzHkYpZyxut5/v6sFI9UiiZapmiR9SuLjVZhIRcHRk48Jkfcw7dj3m2fjIaw+CMFGV2AtJXVoAvnlbfYJiA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1582459948; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=Nh0j83u9R7gqLcAoO/9s61YyS1XGiVxVqyagprmlSMg=; 
        b=T8qaLPGVLIp34VLC1b7B40nuE3UK7KUv3cxqeBBaW5h6zdng7lYTabwXmRJC3fjZzENIoO1QkupJD9TzuG799H32AbRO6gcJ5YjumjY2epugq1/Xq4dAcZLT3rsHkfX86JykYWi9L5qKDCVy9E4FBw8gtkoDyf8XqTSRSQOLA74=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=taz.007@zoho.com;
        dmarc=pass header.from=<taz.007@zoho.com> header.from=<taz.007@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:cc:references:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=FhZINyz1gCaqeAIbumWHdoHh89qPG89H/DJuQWeaVGZMVMEv8Q1d2rOx86GEL+YpIt5GFg3cFPJj
    BoPZSd2g3wQzOs8XWRwBGF924CKKt0VWzSRjkfjV2I6vhCmiENPb  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582459947;
        s=zm2020; d=zoho.com; i=taz.007@zoho.com;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=Nh0j83u9R7gqLcAoO/9s61YyS1XGiVxVqyagprmlSMg=;
        b=RpqrV/kzHTSWjobzyiqCygBqTaTPk8OQK0ER1yXXk779R1c2uBIB4wGztWAPrwxA
        v0AWhheHYFnmGOVD4XLm9W97y64Y0lanmdlHm5M7dAyu7xkMVdFcouNaihco5nCO2YI
        U0CeMEAsKt6tR6LYns0Y8CNA/RJmpWc+hQNeqCK8=
Received: from [192.168.1.5] (77.109.97.112.adsl.dyn.edpnet.net [77.109.97.112]) by mx.zohomail.com
        with SMTPS id 1582459945610465.4940824436874; Sun, 23 Feb 2020 04:12:25 -0800 (PST)
Subject: Re: fuse freeze and usb devices
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2002211406460.1488-100000@iolanthe.rowland.org>
From:   "taz.007" <taz.007@zoho.com>
Message-ID: <dd616c84-6861-986c-56d0-8c020fd84410@zoho.com>
Date:   Sun, 23 Feb 2020 13:12:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.2002211406460.1488-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-CA
X-ZohoMailClient: External
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21/02/20 20:20, Alan Stern wrote:
> On Fri, 21 Feb 2020, taz.007 wrote:
>
>> Hello linux-usb,
>>
>> I'm experiencing some freezing from a fuse userspace daemon. I'm not
>> sure if it is an actual usb issue, so please point me to the correct
>> subsystem/mailing list if they could help.
>> setup:
>> 10 hard drives (ext3 or ext4) mounted on the system.
>> 7 of those are sata under usb enclosures, (usb2 only).
>> 2 of them are usbkeys (usb1 & usb2).
>> 1 of them is a regular sata drive directly connected.
>> I use mergerfs to gather all of them under a common mount point.
>> scenario :
>> the machine is cpu loaded, (2C/4T) nearly fully used.
>> rsync is running in a loop (in order to reproduce the issue), copying
>> some files (several GB) from the mergerfs mount point to another drive
>> (that is not part of the pool, also a regular ext4 mounted drive).
>> some background processes are doing "light" (~50KB/sec) IO on the same
>> mergerfs pool.
>> after a while , any access to the mergerfs mount point is frozen.
>> This is because mergerfs itself is stuck in a syscall (if I understand
>> correctly) that is never returning.
>> However I can access (by doing an "ls" for example) the underlying
>> mounted hard drives fine!
>> And in this case, accessing the underlying hard drives via "ls" somehow
>> unfreezes the previously blocked syscall from the mergerfs daemon!
>> It is not even needed to use "ls", doing hdparm -tT on the drives
>> directly also permits to unfreeze mergerfs.
>>
>> Now the link with usb :
>> When I tweak the values of /sys/block/sdX/device/max_sectors I can alter
>> the behaviour.
>> With the values of 128 or 240, I'm unable to reproduce the issue.
>> With the value of 512 it reproduces the issue after around 4-5hours.
>> With the value of 1024 it reproduces the issue after around 2hours.
>> (maybe those are statistically insignificant numbers and I'm just unlucky)
>>
>> There are no errors from the kernel, and the drives still seem to be
>> working fine in fact.
>> I'm using Linux 5.5.3, but I tried back the 5.1.15, and the issue is
>> already there.
>>
>> For more detailed info on the mergerfs callstack, see the original
>> bugreport thread :
>> https://github.com/trapexit/mergerfs/issues/708
>>
>> Please don't forget to CC me as I'm not subscribed to the ML.
> It seems unlikely to me that your problem has anything to do with USB.
> You might try asking for help on the linux-kernel mailing list.

I will, thanks.

>
> The GitHub bug report says that there are two threads stuck waiting in
> splice system calls.  It also says that turning off splice doesn't
> help.  When splice is off, what are the threads waiting for?

they are waiting in pread64 () from /usr/lib/libpthread.so.0

> Some other things to consider...  They may not be related to your
> problem:
>
> What does "hdparm -B" show for your drives?

APM_level = off for the sata drive ; APM_level = not supported for all 
the usb drives

> What do /sys/block/sdX/device/power/{control,runtime_status} contain?
"on" and "active" for all of them.

I don't think it's related to a sleeping disk: the sata drive was 
busy(swapping a little) while the fuse mount was frozen.

I did a manual sync (on the cli), and it was enough to "wakeup" the 
system and rsync did resume.

> Alan Stern
>

