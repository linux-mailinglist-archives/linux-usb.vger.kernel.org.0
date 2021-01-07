Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60C82ECCEF
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jan 2021 10:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbhAGJjm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 04:39:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:33048 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725974AbhAGJjl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Jan 2021 04:39:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1610012335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aHGXngfpSrfN/LaG19TlKeFtsIvNO6mFeHtz/bbf220=;
        b=OJHY7OeRnCRwV1wQ3u3S4SxnBt9PSS5TepAIcTBHjwD36kb5mI3yiwbWMa+xPvON3fVyfG
        AvSA6yxxhWi4HrpH/BGZ1OqxwsPsG4ZCKmM7iQjbhDWDRaCz87EMLeOf0CvZ0Cwwwyqa0J
        8CKnx+uBXjp2qehlCIUW6ZT2OCLimxE=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id DD029AF13;
        Thu,  7 Jan 2021 09:38:54 +0000 (UTC)
Message-ID: <87129afc5fa1c2dc84a480118b54cb925eefc2f7.camel@suse.com>
Subject: Re: RTL8153 1G USB ethernet kernel hang bug
From:   Oliver Neukum <oneukum@suse.com>
To:     David Mytton <david@davidmytton.co.uk>,
        "nic_swsd@realtek.com" <nic_swsd@realtek.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Thu, 07 Jan 2021 10:38:48 +0100
In-Reply-To: <LO2P123MB19676167DCB923BC8F464AECFDD00@LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM>
References: <LO2P123MB19676167DCB923BC8F464AECFDD00@LO2P123MB1967.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 06.01.2021, 17:13 +0000 schrieb David Mytton:
> I'd like to report a bug in the Realtek driver for a RTL8153 10/100/1000
> Ethernet adapter built-in to a USB-C connected Philips 272B7QUPBEB 27" QHD LCD
> Monitor. It is not limited to the monitor as I have seen other similar reports of
> USB Ethernet adapters with the same issue using the same driver.
> 
> I have reproduced this on Kernel 5.10.2 and 5.9.11, both Manjaro, but have seen
> reports across multiple distros.
> 
> Symptoms:
> 
> - After a period of time following a reboot, ethernet connectivity suddenly
>   drops. Wi-Fi might take over, but not reliably.
> - There is a kernel trace in the journalctl output (see below).

The trace indicates that runtime power management is waiting for
something, but not for what.

> - Attempting to do anything related to the network causes a hang e.g. running
>   inxi hangs after CPU output.
> - The only way to recover is to hard reset. reboot command also hangs.

The processes are in state D (uninterruptible wait)

> - Set usbcore.autosuspend=-1 pci_aspm=off kernel params. This has solved the
>   issue for me; the system has been stable with several days of uptime.

That switches off runtime PM. 

The unsolved question is what the kernel is waiting for. Or whether we
have a deadlock. Have you tried a kernel with lockdep enabled?
Could you try to get a lock with dynamic debugging enabled for
the module usbcore?

In this case I don't think a usbmon trace is going to help much, as
the kernel is stuck.

	Regards
		Oliver


