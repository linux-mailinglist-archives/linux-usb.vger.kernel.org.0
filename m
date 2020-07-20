Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB196225A65
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 10:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728092AbgGTIvo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 04:51:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:43350 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727058AbgGTIvo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jul 2020 04:51:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C21ABADC2;
        Mon, 20 Jul 2020 08:51:49 +0000 (UTC)
Message-ID: <1595235102.2531.7.camel@suse.de>
Subject: Re: uas: bug: [sda] tag#21 uas_eh_abort_handler 0 uas-tag 6
 inflight: IN
From:   Oliver Neukum <oneukum@suse.de>
To:     "Tj (Elloe Linux)" <ml.linux@elloe.vision>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Date:   Mon, 20 Jul 2020 10:51:42 +0200
In-Reply-To: <c6720231-e30c-41e4-cd2b-1b4b9baa0852@elloe.vision>
References: <9268a7b4-217e-e76d-af9a-9c5b4f6fe54a@elloe.vision>
         <20200719110901.GE266150@kroah.com>
         <c6720231-e30c-41e4-cd2b-1b4b9baa0852@elloe.vision>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Sonntag, den 19.07.2020, 12:55 +0100 schrieb Tj (Elloe Linux):
> On 19/07/2020 12:09, Greg KH wrote:
> > On Sun, Jul 19, 2020 at 11:22:10AM +0100, Tj (Elloe Linux) wrote:

> > Where is an error here?  Those looks ok to me.
> 
> These repeated 'zaps' and resets every 30 seconds or so are not errors?

They are errors. But whose errors? 0x28 looks like a READ10 to me.
In other words at least Test Unit Ready and READ_CAPACITY have
already worked at this stage.
Without a trace it is not clear what exactly this read is for.
Is it always the same READ?

This looks like the error handling UAS does when a command times out.

> They never stop even though the devices are not mounted nor being
> accessed (by users).
> 
> > > [  199.939976] blk_update_request: I/O error, dev sda, sector 500117464
> > > op 0x0:(READ) flags 0x80700 phys_seg 5 prio class 0
> > 
> > So only the block layer is reporting errors, not the USB layer?  Any usb
> > controller errors?

The error is from the SCSI layer strictly speaking. It notices that a
command is taking longer than allowed and directs UAS to do error
handling. SUbsequently an error is reported up to the block layer.

The problem is that we have a lot of unusual stuff being tested.

	Regards
		Oliver

