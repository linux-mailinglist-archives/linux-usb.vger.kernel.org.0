Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFB86F59EB
	for <lists+linux-usb@lfdr.de>; Wed,  3 May 2023 16:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjECOZP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 May 2023 10:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjECOZO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 May 2023 10:25:14 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C3BCF59D0
        for <linux-usb@vger.kernel.org>; Wed,  3 May 2023 07:25:11 -0700 (PDT)
Received: (qmail 379363 invoked by uid 1000); 3 May 2023 10:25:10 -0400
Date:   Wed, 3 May 2023 10:25:10 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Benjamin Block <bblock@linux.ibm.com>,
        Hannes Reinecke <hare@suse.de>,
        Maxime Bizon <mbizon@freebox.fr>, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-scsi@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: Reproducible deadlock when usb-storage scsi command timeouts
 twice
Message-ID: <97a67f78-4888-4fe7-9bfc-87d0bb6cc8b2@rowland.harvard.edu>
References: <ZEllnjMKT8ulZbJh@sakura>
 <34a2e50b-e899-45ee-ac14-31fa0bb1616b@rowland.harvard.edu>
 <20230503102440.GL18384@t480-pf1aa2c2.fritz.box>
 <941e8420-f99f-5832-2ea9-3ba5eca545ad@suse.com>
 <20230503125137.GA1032383@t480-pf1aa2c2.fritz.box>
 <d25bfa50-b5a0-bd0e-fd14-94967e374033@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d25bfa50-b5a0-bd0e-fd14-94967e374033@suse.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 03, 2023 at 03:54:45PM +0200, Oliver Neukum wrote:
> On 03.05.23 14:51, Benjamin Block wrote:
> 
> > > usb-storage can do a reset only on the USB device level,
> > > which translates to a bus reset on the SCSI level.
> > > 
> > > And we are supposed to cancel any communication with the device
> > > before that.
> > 
> > Is that a limitation of the devices or drivers? Because then you don't
> > match SCSI semantics for LU reset - which aborts all running commands
> 
> We do not support a LUN reset. That's a limitation of the protocol.
> If something goes wrong you need to reset the whole USB device, which
> corresponds to a host adaptor on the SCSI level.

There is the Bulk-Only Mass Storage Reset request, which is what 
usb-storage issues when asked to perform a device reset.  But few 
devices implement it correctly.

> > on that scope among things. Which might explain the reason/choice behind
> > this unexpected behavior for you.
> 
> For the device a reset presumably does wipe out the command currently
> under execution. The problem is within the driver. It thinks that
> a command is still active. And we are limited to one command at a time
> (on the whole bus - again protocol limitation)
> 
> > On random thought I had: in theory you could implement your own EH
> > strategy handler if the default one doesn't work for you. ATA and SAS do so.
> > [drivers/scsi/scsi_error.c:2285 `shost->transportt->eh_strategy_handler()`]
> > This can re-use parts/all of the existing escalation sequence in
> > `scsi_eh_ready_devs()`.
> > 
> > But that's no short-term fix.
> 
> That looks like using a sledge hammer.

I think the best answer is to accept the patch that started this email 
thread, perhaps with a minor change.  The driver can easily abort the 
currently running command (if any) on its own before starting a reset.

Alan Stern
