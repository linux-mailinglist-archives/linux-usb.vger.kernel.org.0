Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 466FB124F6
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 01:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfEBXQq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 May 2019 19:16:46 -0400
Received: from merlin.infradead.org ([205.233.59.134]:59914 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbfEBXQq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 May 2019 19:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=n5x69FJgELdhvkEg4/gATqUht1/dFh4DazrcFh8xpQc=; b=xs6XERi76DtaOu8Qv7EkJHc/pO
        XuSSfFrLG8GA15W7XB/k1fAjJajKlR9yFFzAXu6w0qeEMBenKtBhpNthbfh/zaCgmsPQ/NYURgWit
        SbcMLGX4NHsT4kHcoYLf1G1I90pC2xRZf/W/q2KHUD5CYprdWZkw0Ev/G4O0LtfEX9rxldpE4CmdI
        cgltl9oja/JTzuyBXWJcKHHdMNngYecfGmvxZGZUrou9OY1nHbSXDELYTrMzo2MKJKdJx+zQfY4Sx
        1qmG7LaGsacK6ChUmmOMSyl2Tx++eyTh8sSUD5kiwQqRYORyLWiKWklsepD4h7/WeIPpYLS9i8a8C
        8iOVypZw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hMKwW-0005MF-OS; Thu, 02 May 2019 23:16:45 +0000
Subject: Re: not seeing console logs using usb serial
To:     Shiv Dev <shivfsdev@gmail.com>, linux-usb@vger.kernel.org
References: <CACX8e9MkgUH4giW8SVwQb3rJSq3RK-jth4SJbkpkKF3E29bgFg@mail.gmail.com>
 <CACX8e9NPUKbZTD0-+_Yrzd6mUGmsHrYFQuj3RPsS5AQ7rLQymQ@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <adcdd800-ef3f-f1a7-6832-279b53c0d6ff@infradead.org>
Date:   Thu, 2 May 2019 16:16:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACX8e9NPUKbZTD0-+_Yrzd6mUGmsHrYFQuj3RPsS5AQ7rLQymQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/2/19 8:41 AM, Shiv Dev wrote:
> Hi,
> 
> I am using a USB serial cable and want to see the kernel logs on the
> console, and towards that have the below line in /etc/default/grub
> 
> console=ttyUSB0,115200 console=tty0
> 
> Hardware: Intel compute stick
> OS      : ubuntu 18.04
> kernel : 4.18.0-18
> Driver  : pl2303
> 
> I do not see the kernel logs, and it drops to a dracut shell because
> the root is encrypted.

Sounds to me like the kernel isn't being booted so there are no logs
to see.  If the kernel was booted, it wouldn't then drop to a dracut shell.

> I am however able to write to the /dev/ttyUSB0 device, and am able to
> see the output in minicom at the other end, which means that the
> requisite driver is loaded in initramfs.
> dracut:/# echo 'hello' > /dev/ttyUSB0
> 
> Not sure what I am missing here. Please help.
> 
> Not sure if this is the correct mailing list. Would linux-console be a
> more appropriate list?
> 
> Regards,
> Shiv


-- 
~Randy
