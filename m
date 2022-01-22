Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06EEC496A90
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jan 2022 08:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233534AbiAVHYB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 22 Jan 2022 02:24:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiAVHYB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 22 Jan 2022 02:24:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFAE4C06173B
        for <linux-usb@vger.kernel.org>; Fri, 21 Jan 2022 23:24:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8FDE4B81FBE
        for <linux-usb@vger.kernel.org>; Sat, 22 Jan 2022 07:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5242EC340E2;
        Sat, 22 Jan 2022 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1642836238;
        bh=KbznLGf3y6bAQ6PQGW9OSS4acK6vkvrT/ZluC2r1Z/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qtKVTnggSAsgTHbpj9NTT7IgLAPWAQR+ByjLUaf/zcujOc4mhwmVQWOjW/uc/56wI
         7Jgm/BghitAYYGyXwtHKDlXzsczB9GzXapRZzvtasL40qsWbyX/Iaqbtgr1ZNCqmXS
         jiS5zuQWe48qjPguc1x5DlNSqiMXp1g6hvEtf9mE=
Date:   Sat, 22 Jan 2022 08:23:50 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rory Bolt <Rory.Bolt@kioxia.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Possible big endian bug in latest stable kernel
Message-ID: <YeuxBhAx/Z5eU9pP@kroah.com>
References: <d3d0caf19d974ed2bdc25bcd1202b087@kioxia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3d0caf19d974ed2bdc25bcd1202b087@kioxia.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 21, 2022 at 07:13:59PM +0000, Rory Bolt wrote:
> Hello,
> 
> I am working on a big endian port to test endian cleanness on our NVMe device drivers and software. I originally performed this port on a RockPro64 with kernel 5.10.88 and the USB subsystem performed flawlessly in both big and little endian modes. Hurray!
> 
> When I upgraded to 5.15.11 (and subsequently 5.15.14 and 5.15.16) I ran into problems that appear to be endian. If I boot the exact same board/firmware/kernel in little endian mode, the USB system works correctly. If I switch to big endian, my USB attached disks are no longer usable (they are detected, read capacity commands work, but read operations time out). Interestingly, if I unplug and replug the USB attached disk, it will begin working correctly with the newer kernels in big endian mode. Looking at the output of lsusb -v, it appears there are two changes between the 5.10 and 5.15 USB stacks:
> 
> 1) Enumeration order is different. I do not believe this is a problem at all.
> 2) Link speed. The 5.10 kernels negotiate 5000M in both little and big endian configurations. The 5.15 kernels negotiate 5000M in little endian mode, but 480M in big endian mode if the device is plugged in at boot time. In big endian mode, if the device has incorrectly negotiated 480M at boot time, if I unplug and replug the drive it will negotiate 5000M and begin working.
> 
> This all leads me to suspect that during initialization, when the USB ports are being scanned, there is a big-endian error in the latest kernels. I will happily test any patches if the cause of this is obvious. I am not versed in USB or I would investigate further myself.
> 
> Below are three lsusb -v outputs:
> 
> 5.10.88 in big endian mode
> 5.15.11 in the big endian "bad state" where the device is connected at 480M
> 5.15.11 in the big endian "good state" achieved by transitioning out of the "bad state" by unplugging and re-plugging the drive.
> 

Can you use 'git bisect' between the good and bad kernel versions to
track down the offending commit here?  As you can easily reproduce this,
that would be the simplest thing to do.

thanks,

greg k-h
