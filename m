Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87233FEF93
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 16:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345379AbhIBOlA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 10:41:00 -0400
Received: from netrider.rowland.org ([192.131.102.5]:48123 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1345354AbhIBOk7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Sep 2021 10:40:59 -0400
Received: (qmail 433845 invoked by uid 1000); 2 Sep 2021 10:39:59 -0400
Date:   Thu, 2 Sep 2021 10:39:59 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Kim Bak <kim.bak@gamereactor.dk>, linux-usb@vger.kernel.org
Subject: Re: g_mass_storage module with large drives?
Message-ID: <20210902143959.GC432266@rowland.harvard.edu>
References: <b558fccf-653a-878e-ef09-6f591fa1cf37@gamereactor.dk>
 <875yvjck5t.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yvjck5t.fsf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 02, 2021 at 02:02:14PM +0300, Felipe Balbi wrote:
> 
> Hi Kim,
> 
> (please keep linux-usb@vger.kernel.org in Cc)
> 
> Kim Bak <kim.bak@gamereactor.dk> writes:
> 
> > Hi Felipe
> >
> > I'm not sure who or where to ask this question so i write directly to
> > you.
> 
> we should include the mailing list ;-)
> 
> > I'm trying to get g_mass_storage to work with a large backing file or
> > device, but it seems to be capped at 2Tb.
> >
> > This is probably limited by the 512 bytes block size.

The driver doesn't support block sizes larger than 512 bytes for regular 
files.  But when a block device is used as the backing store, the driver 
uses the device's own logical block size, whatever that is.

Also, the driver doesn't support READ(16), WRITE(16), or related commands.  
Consequently it is limited to using only the first 2^32 blocks of the 
backing store.

> > Is there any way to get the module to expose drives larger than 2Tb?

Partition the drive into regions smaller than 2 TB and expose the different 
partitions as different logical units.  Or use a block device that has a 
larger block size.  Or modify the driver to add support for larger-capacity 
backing store.

Alan Stern
