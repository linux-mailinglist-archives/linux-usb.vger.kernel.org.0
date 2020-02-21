Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3FBD168648
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2020 19:19:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbgBUSTb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Feb 2020 13:19:31 -0500
Received: from sender4-pp-o97.zoho.com ([136.143.188.97]:25716 "EHLO
        sender4-pp-o97.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgBUSTa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Feb 2020 13:19:30 -0500
X-Greylist: delayed 904 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Feb 2020 13:19:30 EST
ARC-Seal: i=1; a=rsa-sha256; t=1582308264; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=WPnzCy6p8EISRlI2LaQtVqYaRsmUL4gLkN5g9PsXUs+EaW/6H6z111HxIuhuciax1YV2paxtjjPJDLfsz+PTjHn9LtLukGsBi9O5eESVj/bAy1WVo8axsN9NQHPvXNvPXm/0uIV8rK2IeMLkhRIA8lLD9s4l7bfoHLWmeANNE8k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1582308264; h=Content-Type:Content-Transfer-Encoding:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=AhqIMEsqSqc0S6m8PCtvJzccjR8HWM3Z0oi2p6uI0Iw=; 
        b=nsKqoeGeD127D83ziH97172MnUi2SLdQlx6ftWoFzeJdQfVn0crXBRDuvaoSc+drwSxDwx+0KcO7/VpDNGWagY0IX9fEup/qdCZJaTRMhqvn5KmIeGHXQfVLokYf6jV93qT9SipXfWg870+wfaGI3gSqMLmS0Pe8ccrz9WUomjs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=taz.007@zoho.com;
        dmarc=pass header.from=<taz.007@zoho.com> header.from=<taz.007@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=to:from:subject:message-id:date:user-agent:mime-version:content-type; 
  b=NuONOkLlRN35D1wnrjCct/eYuLEJMKto5+Pdz9biGBzeBWQq8lJ/NptzI8f1U1sCSvNBWS93h4vP
    C944gKUc4dpCYaUcQoWFOMA7eX+qA0q+CI1jio1W2uEoCNjajk3i  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1582308264;
        s=zm2020; d=zoho.com; i=taz.007@zoho.com;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=AhqIMEsqSqc0S6m8PCtvJzccjR8HWM3Z0oi2p6uI0Iw=;
        b=LEMgJcA4G7BuZw5T/kSTCPJHe2ofgAjMy0koslQtvabDTNkTpz7hxjyHvKc4+o7e
        Mxnq4/Z/tZ9K/1Xo4TJ+yLJZfdcVAhJ+4D3ORpSRh+VX5WAuumFmU7Flk7DdypV9/vI
        q0i3RF1Uzrlu6KI0qRm2mT2VYE/giy15MDLvqfq8=
Received: from [192.168.1.5] (77.109.97.112.adsl.dyn.edpnet.net [77.109.97.112]) by mx.zohomail.com
        with SMTPS id 158230826188027.416170750671768; Fri, 21 Feb 2020 10:04:21 -0800 (PST)
To:     linux-usb@vger.kernel.org
From:   "taz.007" <taz.007@zoho.com>
Subject: fuse freeze and usb devices
Message-ID: <74e26141-e697-31bb-c574-b8968d0f13e6@zoho.com>
Date:   Fri, 21 Feb 2020 19:04:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-CA
X-ZohoMailClient: External
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello linux-usb,

I'm experiencing some freezing from a fuse userspace daemon. I'm not 
sure if it is an actual usb issue, so please point me to the correct 
subsystem/mailing list if they could help.
setup:
10 hard drives (ext3 or ext4) mounted on the system.
7 of those are sata under usb enclosures, (usb2 only).
2 of them are usbkeys (usb1 & usb2).
1 of them is a regular sata drive directly connected.
I use mergerfs to gather all of them under a common mount point.
scenario :
the machine is cpu loaded, (2C/4T) nearly fully used.
rsync is running in a loop (in order to reproduce the issue), copying 
some files (several GB) from the mergerfs mount point to another drive 
(that is not part of the pool, also a regular ext4 mounted drive).
some background processes are doing "light" (~50KB/sec) IO on the same 
mergerfs pool.
after a while , any access to the mergerfs mount point is frozen.
This is because mergerfs itself is stuck in a syscall (if I understand 
correctly) that is never returning.
However I can access (by doing an "ls" for example) the underlying 
mounted hard drives fine!
And in this case, accessing the underlying hard drives via "ls" somehow 
unfreezes the previously blocked syscall from the mergerfs daemon!
It is not even needed to use "ls", doing hdparm -tT on the drives 
directly also permits to unfreeze mergerfs.

Now the link with usb :
When I tweak the values of /sys/block/sdX/device/max_sectors I can alter 
the behaviour.
With the values of 128 or 240, I'm unable to reproduce the issue.
With the value of 512 it reproduces the issue after around 4-5hours.
With the value of 1024 it reproduces the issue after around 2hours.
(maybe those are statistically insignificant numbers and I'm just unlucky)

There are no errors from the kernel, and the drives still seem to be 
working fine in fact.
I'm using Linux 5.5.3, but I tried back the 5.1.15, and the issue is 
already there.

For more detailed info on the mergerfs callstack, see the original 
bugreport thread :
https://github.com/trapexit/mergerfs/issues/708

Please don't forget to CC me as I'm not subscribed to the ML.


