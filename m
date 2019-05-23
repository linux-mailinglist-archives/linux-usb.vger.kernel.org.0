Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C45327C6A
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 14:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730028AbfEWMEP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 08:04:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:40154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729934AbfEWMEO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 May 2019 08:04:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D1BDD20881;
        Thu, 23 May 2019 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558613053;
        bh=fwoIK1CGAJFDRq1ubecclkKZR1hpOf6pxEHWxniXxfI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Cb1S20CTris2KJ8R4DmBZJIcM7vsKi92RGqZNGjUjnF75jYYkI/5lKW7DCjX6paXw
         I9qn2Lsmvai2Z7Ia5g3s6V05fAc1n704ZbCVplnFSc2M3IXOZNsjep8HyE7Nw/ES8j
         AMdnXOT+whQjoeVZeHPQ7uLbOkxkA0+UJr1nZ3zk=
Date:   Thu, 23 May 2019 14:04:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Crash/hung task in usb-storage thread
Message-ID: <20190523120410.GA16571@kroah.com>
References: <dca3ea08836e475894bdebc7eb28acff@SVR-IES-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dca3ea08836e475894bdebc7eb28acff@SVR-IES-MBX-03.mgc.mentorg.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 23, 2019 at 11:57:06AM +0000, Schmid, Carsten wrote:
> Hi USB maintainers,
> 
> we recently have seen a problem with usb-storage when trying to read from a device.
> This happened on a 4.14.86 kernel.

Wow that's an old kernel.

> 
> The kernel's dmesg shows: (log has been submitted via DLT)
> 1200.862250 kernel: usb 1-3.1: reset high-speed USB device number 10 using xhci_hcd
> 1285.466289 kernel: usb 1-3.1: reset high-speed USB device number 10 using xhci_hcd
> 1291.911286 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
> 1292.018079 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
> 1292.043073 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
> 1292.069078 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
> 1292.093066 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
> 
> These messages continue until the hung task mechanism steps in:
> 1472.135076 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
> 1472.135628 kernel: INFO: task usb-storage:7930 blocked for more than 120 seconds.
> 1472.135633 kernel: Tainted: P U W O 4.14.86-apl #1
> 1472.135634 kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> 1472.135637 kernel: usb-storage D 0 7930 2 0x80000080
> 1472.135642 kernel: Call Trace:
> 1472.135656 kernel: __schedule+0x1c2/0x7b0
> 1472.135661 kernel: schedule+0x2e/0x90
> 1472.135664 kernel: schedule_timeout+0x230/0x470
> 1472.135678 kernel: ? usb_hcd_submit_urb+0x98/0xba0 [usbcore]
> 1472.135719 kernel: ? schedule_timeout+0x230/0x470
> 1472.135728 kernel: ? usb_hcd_submit_urb+0x98/0xba0 [usbcore]
> 1472.135731 kernel: ? __switch_to_asm+0x40/0x70
> 1472.135733 kernel: ? __switch_to_asm+0x34/0x70
> 1472.135735 kernel: ? __switch_to_asm+0x40/0x70
> 1472.135737 kernel: ? __switch_to_asm+0x34/0x70
> 1472.135741 kernel: wait_for_common+0xb5/0x170
> 1472.135744 kernel: ? wait_for_common+0xb5/0x170
> 1472.135748 kernel: ? wake_up_q+0x80/0x80
> 1472.135752 kernel: wait_for_completion+0x18/0x20
> 1472.135760 kernel: usb_sg_wait+0x114/0x170 [usbcore]
> 1472.135946 kernel: usb_stor_bulk_transfer_sglist.part.3+0x62/0xb0 [usb_storage]
> 1472.135951 kernel: usb_stor_bulk_srb+0x46/0x80 [usb_storage]
> 1472.135955 kernel: usb_stor_Bulk_transport+0x123/0x390 [usb_storage]
> 1472.135960 kernel: usb_stor_invoke_transport+0x3c/0x520 [usb_storage]
> 1472.135965 kernel: ? wait_for_common+0xb5/0x170
> 1472.135968 kernel: ? wait_for_common+0x149/0x170
> 1472.135971 kernel: ? wake_up_q+0x80/0x80
> 1472.135975 kernel: usb_stor_transparent_scsi_command+0x9/0x10 [usb_storage]
> 1472.135979 kernel: usb_stor_control_thread+0x1eb/0x2d0 [usb_storage]
> 1472.135984 kernel: kthread+0x122/0x140
> 1472.135988 kernel: ? fill_inquiry_response+0x20/0x20 [usb_storage]
> 1472.135991 kernel: ? kthread_create_on_node+0x60/0x60
> 1472.135994 kernel: ret_from_fork+0x35/0x40
> 1472.163072 kernel: usb-storage: Error in queuecommand_lck: us->srb = ffff9d66b02e3528
> 
> There has been a similar bug being fixed in 3.17 kernel series, maybe the bug has been re-introduced?
> https://bugzilla.kernel.org/show_bug.cgi?id=88341
> 
> As USB seems to be the causing subsystem, i submit this query here.
> 
> Any idea what could cause this?

Can you reproduce this on a "clean" 5.1 kernel release?

thanks,

greg k-h
