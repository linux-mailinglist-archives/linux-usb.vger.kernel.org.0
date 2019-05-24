Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3669F29A6F
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2019 16:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404010AbfEXO7i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 May 2019 10:59:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:35278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403981AbfEXO7i (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 May 2019 10:59:38 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB9672133D;
        Fri, 24 May 2019 14:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558709977;
        bh=mqnd9B23sYjbA0Pl+EXS2Qm4++yAjcuA4/DVttaa3dQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xyRHle8T7Hl5lZRWmJXu6evoRlBfomShFt9xm+RIKoV3lXvnvIcpQFTw+1jlBMfBg
         2quvmA3R4JIE2ulTFctgJKk07YzoWEs1L5IZo3dxCjQr1DM9MN9FH2T/bkI987SMRw
         93hcR/C9DFxMcCO9lxZO62iEhh501sHMTDnCW57Q=
Date:   Fri, 24 May 2019 16:59:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Crash/hung task in usb-storage thread
Message-ID: <20190524145935.GA9757@kroah.com>
References: <dca3ea08836e475894bdebc7eb28acff@SVR-IES-MBX-03.mgc.mentorg.com>
 <Pine.LNX.4.44L0.1905231245510.1553-100000@iolanthe.rowland.org>
 <b4d08a84df3d45bfa77d27d411a17578@SVR-IES-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d08a84df3d45bfa77d27d411a17578@SVR-IES-MBX-03.mgc.mentorg.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 24, 2019 at 01:33:14PM +0000, Schmid, Carsten wrote:
> > On Thu, 23 May 2019, Schmid, Carsten wrote:
> > 
> > > Hi USB maintainers,
> > >
> > > we recently have seen a problem with usb-storage when trying to read
> > from a device.
> > > This happened on a 4.14.86 kernel.
> > >
> > > The kernel's dmesg shows: (log has been submitted via DLT)
> > > 1200.862250 kernel: usb 1-3.1: reset high-speed USB device number 10
> > using xhci_hcd
> > > 1285.466289 kernel: usb 1-3.1: reset high-speed USB device number 10
> > using xhci_hcd
> > > 1291.911286 kernel: usb-storage: Error in queuecommand_lck: us->srb =
> > ffff9d66b02e3528
> > > 1292.018079 kernel: usb-storage: Error in queuecommand_lck: us->srb =
> > ffff9d66b02e3528
> > > 1292.043073 kernel: usb-storage: Error in queuecommand_lck: us->srb =
> > ffff9d66b02e3528
> > > 1292.069078 kernel: usb-storage: Error in queuecommand_lck: us->srb =
> > ffff9d66b02e3528
> > > 1292.093066 kernel: usb-storage: Error in queuecommand_lck: us->srb =
> > ffff9d66b02e3528
> > 
> > Since there haven't been any substantive change to usb-storage since
> > 4.14 was released, there's a good chance this is a problem with
> > xhci-hcd.
> > 
> > Is this problem repeatable?  Can you collect a usbmon trace showing
> > what happens when the problem occurs?
> > 
> Unfortunately this happened in the field on a test drive.
> I don't have access to the device.
> So, no, can't be reproduced by now.
> 
> > > There has been a similar bug being fixed in 3.17 kernel series, maybe the
> > bug has been re-introduced?
> > > https://bugzilla.kernel.org/show_bug.cgi?id=88341
> > 
> > That is _extremely_ unlikely.
> > 
> Looked into the history of that bug report.
> Strange: no fix is menioned.
> Reported: 2014-17-11
> Remark on 2019-02-26
> No hint to a real fix.
> It simply disappeared ...

We do not track USB bugs in bugzilla.kernel.org, so NEVER treat that as
the state of anything with regards to USB and Linux, sorry.  Ask here on
the mailing list instead.

The fact that nothing else is shown on that bug is to be expected, and
is normal.

thanks,

greg k-h
