Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E661544EE21
	for <lists+linux-usb@lfdr.de>; Fri, 12 Nov 2021 21:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235689AbhKLUwu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Nov 2021 15:52:50 -0500
Received: from netrider.rowland.org ([192.131.102.5]:57403 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235668AbhKLUwt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Nov 2021 15:52:49 -0500
Received: (qmail 42069 invoked by uid 1000); 12 Nov 2021 15:49:57 -0500
Date:   Fri, 12 Nov 2021 15:49:57 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     DocMAX <mail@vacharakis.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Message-ID: <20211112204957.GA39387@rowland.harvard.edu>
References: <139f5577-4a0c-a073-6320-a2697eddadc6@vacharakis.de>
 <20211112154052.GB32928@rowland.harvard.edu>
 <c9c65f98-b766-f110-26c0-a4187fe7bb8d@vacharakis.de>
 <20211112162316.GC32928@rowland.harvard.edu>
 <bfc48a4a-9648-dee8-20b0-dadfafa508e7@vacharakis.de>
 <20211112175150.GA37212@rowland.harvard.edu>
 <31548846-8ff4-9297-10b3-4f543ee0a5e0@vacharakis.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31548846-8ff4-9297-10b3-4f543ee0a5e0@vacharakis.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 12, 2021 at 07:21:34PM +0100, DocMAX wrote:
> The first and more buggy maybe.
> So you are not going to fix this just blacklist uas by default?

I don't understand what you mean.  How could I fix a broken device?

If the device is unable to work with uas but _is_ able to work with 
usb-storage, then disabling uas for it seems like the only possible way 
to proceed.

> I was so happy that i got a uas capable device and now the joy is over...
> :-(

Do you know whether the device works with the UAS protocol under 
Windows?

If you want more detailed information about exactly what is happening 
in the communication between the computer and the device, you can 
collect a usbmon trace.  Or you can record the information going over 
the bus using Wireshark (which I think will also work on Windows).

> Is there detailed information of the uas/usb-storage differences? (Very
> detailed, not just "it's faster")

I'm not aware of any such discussions, although ones probably exist 
somewhere.  The individual protocols are well described in documents 
hosted on the usb.org web site, but as far as I know none of them talk 
about the differences between the two protocols.

A quick summary of the major aspects would look like this:

	The commands and status responses are bundled into packets in 
	slightly different ways (different packet headers and so on),
	but this difference is relatively small.

	uas uses USB streams, a feature of USB-3 not present in USB-2,
	to issue multiple commands (and their associated data) in 
	parallel, allowing the device to process them in any order it 
	wants.  usb-storage, by contrast, sends only one command at a 
	time and waits for it to complete before sending the next 
	command.  That's the major difference between the protocols, and 
	it is what accounts for the difference in speed.

	uas includes means for the computer to query the device about
	the state of ongoing commands, which is not possible with
	usb-storage.

Alan Stern
