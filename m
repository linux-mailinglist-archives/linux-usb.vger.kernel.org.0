Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 063BA340012
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 08:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhCRHLe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 03:11:34 -0400
Received: from mx2.uni-regensburg.de ([194.94.157.147]:57594 "EHLO
        mx2.uni-regensburg.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhCRHLA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Mar 2021 03:11:00 -0400
X-Greylist: delayed 464 seconds by postgrey-1.27 at vger.kernel.org; Thu, 18 Mar 2021 03:10:59 EDT
Received: from mx2.uni-regensburg.de (localhost [127.0.0.1])
        by localhost (Postfix) with SMTP id 29A28600005A
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 08:10:58 +0100 (CET)
Received: from gwsmtp.uni-regensburg.de (gwsmtp1.uni-regensburg.de [132.199.5.51])
        by mx2.uni-regensburg.de (Postfix) with ESMTP id 06BFD6000058
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 08:10:58 +0100 (CET)
Received: from uni-regensburg-smtp1-MTA by gwsmtp.uni-regensburg.de
        with Novell_GroupWise; Thu, 18 Mar 2021 08:10:57 +0100
Message-Id: <6052FD00020000A10003FE36@gwsmtp.uni-regensburg.de>
X-Mailer: Novell GroupWise Internet Agent 18.3.1 
Date:   Thu, 18 Mar 2021 08:10:56 +0100
From:   "Ulrich Windl" <Ulrich.Windl@rz.uni-regensburg.de>
To:     "Greg KH" <greg@kroah.com>, <stern@rowland.harvard.edu>
Cc:     <zzam@gentoo.org>,
        "systemd-devel@lists.freedesktop.org" 
        <systemd-devel@lists.freedesktop.org>,
        <usb-storage@lists.one-eyed-alien.net>,
        <hirofumi@mail.parknet.co.jp>, <linux-usb@vger.kernel.org>
Subject: Antw: [EXT] [systemd-devel] [PATCH] usb-storage: Add quirk to
 defeat Kindle's automatic unload
References: <20210310214648.GA236329@rowland.harvard.edu>
 <841a9a54-78ee-ffaa-fc3c-12defcf43b36@gentoo.org>
 <20210311143912.GA257360@rowland.harvard.edu>
 <f2acfeef-a81a-d7c0-90a8-b290a18cb742@gentoo.org>
 <20210316162650.GB448722@rowland.harvard.edu>
 <031a20c5-27c3-cc13-6e0b-a308644abce4@redhat.com>
 <20210316170433.GD448722@rowland.harvard.edu>
 <1d9f059e-8b21-0895-9a50-39b6b1a5cc5c@redhat.com>
 <20210317151746.GB488655@rowland.harvard.edu>
 <5f8c0755-0884-f505-c4e8-3a5e89001d58@gentoo.org>
 <20210317190654.GA497856@rowland.harvard.edu>
 <F279F9BC020000F5AE14D9EC@gwsmtp.uni-regensburg.de>
 <C63C44570200006665972EEF@gwsmtp.uni-regensburg.de>
 <B960C12A020000A667ECE9F9@gwsmtp.uni-regensburg.de>
 <B72C58530200001565972EEF@gwsmtp.uni-regensburg.de>
 <0F2319EB020000F567ECE9F9@gwsmtp.uni-regensburg.de>
 <DE3F57520200009E65972EEF@gwsmtp.uni-regensburg.de>
 <474C42CD02000091AE14D9EC@gwsmtp.uni-regensburg.de>
 <D43A6F56020000F865972EEF@gwsmtp.uni-regensburg.de>
In-Reply-To: <D43A6F56020000F865972EEF@gwsmtp.uni-regensburg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>>> Alan Stern <stern@rowland.harvard.edu> schrieb am 17.03.2021 um 20:06 in
Nachricht <20210317190654.GA497856@rowland.harvard.edu>:
> Matthias reports that the Amazon Kindle automatically removes its
> emulated media if it doesn't receive another SCSI command within about
> one second after a SYNCHRONIZE CACHE.  It does so even when the host
> has sent a PREVENT MEDIUM REMOVAL command.  The reason for this
> behavior isn't clear, although it's not hard to make some guesses.

Actually I think Amazon should fix the firmware.
It seems the main goal was to prevent the use of open software to manage the
content.

> 
> At any rate, the results can be unexpected for anyone who tries to
> access the Kindle in an unusual fashion, and in theory they can lead
> to data loss (for example, if one file is closed and synchronized
> while other files are still in the middle of being written).
> 
> To avoid such problems, this patch creates a new usb‑storage quirks
> flag telling the driver always to issue a REQUEST SENSE following a
> SYNCHRONIZE CACHE command, and adds an unusual_devs entry for the
> Kindle with the flag set.  This is sufficient to prevent the Kindle
> from doing its automatic unload, without interfering with proper
> operation.
> 
> Another possible way to deal with this would be to increase the
> frequency of TEST UNIT READY polling that the kernel normally carries
> out for removable‑media storage devices.  However that would increase
> the overall load on the system and it is not as reliable, because the
> user can override the polling interval.  Changing the driver's
> behavior is safer and has minimal overhead.
> 
> Reported‑and‑tested‑by: Matthias Schwarzott <zzam@gentoo.org>
> Signed‑off‑by: Alan Stern <stern@rowland.harvard.edu>
> CC: <stable@vger.kernel.org>
> 
> ‑‑‑
> 
> 
> [as1953]
> 
> 
>  drivers/usb/storage/transport.c    |    7 +++++++
>  drivers/usb/storage/unusual_devs.h |   12 ++++++++++++
>  include/linux/usb_usual.h          |    2 ++
>  3 files changed, 21 insertions(+)
> 
> Index: usb‑devel/drivers/usb/storage/transport.c
> ===================================================================
> ‑‑‑ usb‑devel.orig/drivers/usb/storage/transport.c
> +++ usb‑devel/drivers/usb/storage/transport.c
> @@ ‑656,6 +656,13 @@ void usb_stor_invoke_transport(struct sc
>  		need_auto_sense = 1;
>  	}
>  
> +	/* Some devices (Kindle) require another command after SYNC CACHE */
> +	if ((us‑>fflags & US_FL_SENSE_AFTER_SYNC) &&
> +			srb‑>cmnd[0] == SYNCHRONIZE_CACHE) {
> +		usb_stor_dbg(us, "‑‑ sense after SYNC CACHE\n");
> +		need_auto_sense = 1;
> +	}
> +
>  	/*
>  	 * If we have a failure, we're going to do a REQUEST_SENSE 
>  	 * automatically.  Note that we differentiate between a command
> Index: usb‑devel/drivers/usb/storage/unusual_devs.h
> ===================================================================
> ‑‑‑ usb‑devel.orig/drivers/usb/storage/unusual_devs.h
> +++ usb‑devel/drivers/usb/storage/unusual_devs.h
> @@ ‑2212,6 +2212,18 @@ UNUSUAL_DEV( 0x1908, 0x3335, 0x0200, 0x0
>  		US_FL_NO_READ_DISC_INFO ),
>  
>  /*
> + * Reported by Matthias Schwarzott <zzam@gentoo.org>
> + * The Amazon Kindle treats SYNCHRONIZE CACHE as an indication that
> + * the host may be finished with it, and automatically ejects its
> + * emulated media unless it receives another command within one second.
> + */
> +UNUSUAL_DEV( 0x1949, 0x0004, 0x0000, 0x9999,
> +		"Amazon",
> +		"Kindle",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_SENSE_AFTER_SYNC ),
> +
> +/*
>   * Reported by Oliver Neukum <oneukum@suse.com>
>   * This device morphes spontaneously into another device if the access
>   * pattern of Windows isn't followed. Thus writable media would be dirty
> Index: usb‑devel/include/linux/usb_usual.h
> ===================================================================
> ‑‑‑ usb‑devel.orig/include/linux/usb_usual.h
> +++ usb‑devel/include/linux/usb_usual.h
> @@ ‑86,6 +86,8 @@
>  		/* lies about caching, so always sync */	\
>  	US_FLAG(NO_SAME, 0x40000000)				\
>  		/* Cannot handle WRITE_SAME */			\
> +	US_FLAG(SENSE_AFTER_SYNC, 0x80000000)			\
> +		/* Do REQUEST_SENSE after SYNCHRONIZE_CACHE */	\
>  
>  #define US_FLAG(name, value)	US_FL_##name = value ,
>  enum { US_DO_ALL_FLAGS };
> _______________________________________________
> systemd‑devel mailing list
> systemd‑devel@lists.freedesktop.org 
> https://lists.freedesktop.org/mailman/listinfo/systemd‑devel 



