Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 444171E6B3D
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 21:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406642AbgE1TiT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 15:38:19 -0400
Received: from mail.codeweavers.com ([50.203.203.244]:36390 "EHLO
        mail.codeweavers.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406540AbgE1TiR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 15:38:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=x2b+bzfGLvSRxKB/48VDupWA63rgdWr9tfxfFp5JgY8=; b=grjP1Wj6QauKlZWOkK40Dzvg6W
        97wLFV1ronyR3k167qzSCLthn6pCeilfHugVVaEKxZ1ZD9fyC8niC0IDx9ATkIvcR69kIWz+sRcgy
        TZ+2qWARpIVQS6RbHfxaUvfy1y4Cja9JBayGahqhZ+ccqKYp7OAFLWnUvBftYPYiGrkw=;
Received: from [64.191.7.9] (helo=[192.168.1.115])
        by mail.codeweavers.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <zfigura@codeweavers.com>)
        id 1jeOM0-0007gN-AL; Thu, 28 May 2020 14:38:13 -0500
From:   Zebediah Figura <zfigura@codeweavers.com>
Subject: Re: Bug 207877: ASMedia drive (174c:55aa) hangs in ioctl
 CDROM_DRIVE_STATUS when mounting a DVD
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org
References: <7d0b20b9-4735-bbed-bb50-72764aefd6d8@codeweavers.com>
 <20200528075440.GA2881385@kroah.com>
 <465eaae3-fa60-f37e-1d62-c52236720798@codeweavers.com>
 <20200528160420.GA14188@rowland.harvard.edu>
 <232b68f8-9a5c-89fd-2e12-bf63f49dbe38@codeweavers.com>
 <20200528170509.GC14188@rowland.harvard.edu>
Message-ID: <cb5371de-984f-bdf3-4cfe-a7343998515d@codeweavers.com>
Date:   Thu, 28 May 2020 14:27:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200528170509.GC14188@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Score: -26.0
X-Spam-Report: Spam detection software, running on the system "mail.codeweavers.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/28/20 12:05 PM, Alan Stern wrote: >> Thanks, I've attached
    a usbmon trace to the bug. It seems the kernel submits >> a bulk input transfer
    that never receives a response. I hope my drive isn't >> [...] 
 Content analysis details:   (-26.0 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  -20 USER_IN_WHITELIST      From: address is in the user's white-list
 -6.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -0.5 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                             [score: 0.0000]
  0.5 AWL                    AWL: Adjusted score from AWL reputation of From: address
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/28/20 12:05 PM, Alan Stern wrote:
>> Thanks, I've attached a usbmon trace to the bug. It seems the kernel submits
>> a bulk input transfer that never receives a response. I hope my drive isn't
>> broken...
> 
> Did you wait for thirty seconds after that final bulk input transfer
> started?  It should have been aborted at that point, just like the two
> previous transfer attempts.  There might be a bad sector on the disc you
> were trying to read; all three attempts seem to have failed at the same
> place.

Yes, in fact I waited for several minutes. The transfer seems never to 
have been aborted.

> I get the impression that the SCSI error handler may have tried to reset
> the device without first aborting the current transfer.  But it's not
> easy to tell if that's what really happened.  You might be able to get
> more information by enabling CONFIG_USB_STORAGE_DEBUG and rebuilding the
> usb-storage driver, or by turning on SCSI debugging.

I've attached a kernel log with CONFIG_USB_STORAGE_DEBUG to the bug 
report. I'm not able to properly interpret the results, but I do see 
"device_reset called" as the last USB/SCSI-related message without any 
nearby mention of cancellation...?

The backtrace looks different, though.

With respect to SCSI debugging, the best instructions I was able to find 
directed me to try:

hazel@watership:~$ cat /proc/scsi/sg/debug
max_active_device=2  def_reserved_size=32768

while the hang was taking place. If there's more useful debugging I can 
do, I'll need pointers. I did enable CONFIG_SCSI_LOGGING in the above build.
