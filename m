Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE5B42311
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2019 12:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406982AbfFLKyL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jun 2019 06:54:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:53022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406068AbfFLKyL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Jun 2019 06:54:11 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 16A072080A;
        Wed, 12 Jun 2019 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560336850;
        bh=EuKyfnenek1U2ttCTLN0i1phcr776fLRqB2lFbm0O9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F3DVf+ZEVQzjeIF680U6dnMqJiQtb2D1Y1BANcdP3fXz3nZQcMv8twaWuGEfTSxiY
         8pxJunt8fFh9aU0hSEFpEabxuBe84azXm26394WNgQ/5DLJLhdGwUpZGXlksUT5BAW
         lKgd9Sv9+vy65CIX5J/kwSSm/4QSzOTQJeI+mIW0=
Date:   Wed, 12 Jun 2019 12:54:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Regupathy, Rajaram" <rajaram.regupathy@intel.com>
Cc:     "Cox, Alan" <alan.cox@intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        "Pandey, Prabhat Chand" <prabhat.chand.pandey@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Nyman, Mathias" <mathias.nyman@intel.com>,
        "K V, Abhilash" <abhilash.k.v@intel.com>,
        "Balaji, M" <m.balaji@intel.com>
Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to provide a
 raw interface on DbC
Message-ID: <20190612105408.GA22303@kroah.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
 <20190607063306.5612-5-prabhat.chand.pandey@intel.com>
 <20190607142132.GG14665@kroah.com>
 <af51b855-4ee4-9bc2-6484-b8c4d897f503@linux.intel.com>
 <20190610141607.GA5937@kroah.com>
 <4834501FD402484A85750D15DF17AB5C1D15AEE6@BGSMSX102.gar.corp.intel.com>
 <20190611095243.GA23226@kroah.com>
 <4834501FD402484A85750D15DF17AB5C1D15B030@BGSMSX102.gar.corp.intel.com>
 <20190611123409.GA26261@kroah.com>
 <4834501FD402484A85750D15DF17AB5C1D15DF95@BGSMSX102.gar.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4834501FD402484A85750D15DF17AB5C1D15DF95@BGSMSX102.gar.corp.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 12, 2019 at 08:49:11AM +0000, Regupathy, Rajaram wrote:
> 
> 
> > -----Original Message-----
> > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > Sent: Tuesday, June 11, 2019 6:04 PM
> > To: Regupathy, Rajaram <rajaram.regupathy@intel.com>
> > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>; Pandey, Prabhat Chand
> > <prabhat.chand.pandey@intel.com>; linux-usb@vger.kernel.org; Nyman,
> > Mathias <mathias.nyman@intel.com>; K V, Abhilash <abhilash.k.v@intel.com>;
> > Balaji, M <m.balaji@intel.com>
> > Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to provide a raw
> > interface on DbC
> > Importance: High

Please fix your quoting logic, this is never needed in an email.

And I don't find these emails of "High" importance :)

> > > > > The larger goal here is to have DbC as a unified debug
> > > > > infrastructure for
> > > > different debug methods like KGDB or early printk and leverage the
> > > > benefits of a dedicated debug infra (DbC) brings in.
> > > >
> > > > Have you modified kgdb for this?  Do you have patches for that?
> > > No kgdb changes. For kgdb to work we added necessary wrapper functions
> > required on the dbc_tty interface which already part of kernel. We have
> > functionally verified and shall push the patch subsequently. Am I missing
> > something ?
> > 
> > You are missing the justification of a custom api that requires all userspace
> > tools to be modified instead of using the existing tty api that everything "just
> > works" with today.
> 
> I was referring to the poll methods required for KGDB/GDB to work which is missing in dbc_tty driver in the kernel.

Again, fix your line-wrapping :(

Anyway, just poing kgdb at the different tty device and it should "just
work", right?  No need to change anything that I can see.  If not,
please send patches to get that working so people can use that today.

> > > > Who can use this interface in the "real world", is it only
> > > > developers that have access to the special hardware dongle?  Or can
> > > > anyone use this on their laptops for getting console access in a way
> > > > that is somehow "better" than the existing interface?
> > >
> > > No special hardware is required. As indicated earlier developers need a USB A-
> > A debug cable and anyone can use it to get console access.
> > 
> > Where can I get one of those?
> Here is one example:  https://www.amazon.com/SIIG-SuperSpeed-Cable-Meters-CB-US0212-S1/dp/B0032ANCBO

Ah, nice!  I'll try to see if I can get that in my country...

Nope, not available in Europe from what I can tell, I'll have to wait
until the next time I'm in the US :(

> > > Yes it is better that existing usb-serial converters with each having proprietary
> > drivers . This is a plug and play solution providing super speed interface.
> > 
> > I don't understand, what is "proprietary" about the existing tty api?
> > It's a generic tty device node, right?  What am I missing?
> 
> I am referring to usb-serial controller drivers as in "drivers/usb/serial/Kconfig" which has vendors configs leading to much of kernel maintenance.  DbC driver would provide necessary functionality without any of those.

Again, line-wrapping...

I have no idea what you are referring to "leading to much of kernel
maintenance."  You don't need to include _all_ usb-serial drivers, just
the usb-serial core and the specific driver.  No different from any
other serial port device, which Linux has supported for decades now.

Use the functionality we have already, do not create duplicate code just
because you want to, that's a sure way to get your patches rejected.

And this _is_ a serial connection to the other device, why pretend that
it is not?  Again, what is the reason why you can not use what you have
today?

> > > > And just how much "faster" is all of this than the current tty
> > > > interface?  What is lacking in the tty interface today that you need
> > > > this new, special one?  Can you just not fix any bottleneck in the
> > > > tty driver if you are not properly saturating the bus?
> > >
> > > IMHO, tty is a legacy interface designed for the purpose it serves
> > > for. Modern High speed IO will not fit into tty framework and
> > > refactoring it will not bring any real value.  We have captured the
> > > initial performance numbers in the documentation patch 5/5.  Please
> > > correct me if I am missing something
> > 
> > Why will "modern high speed IO" not fit into the tty framework?  Where is the
> > bottleneck?  We have tty devices that seem to run at "line speed"
> > on a firewire connection today, and that should be faster than whatever this
> > host controller can pump out, right?
> 
> Though I am not aware of the design thoughts behind firewire-tty driver which is in staging, I see
> the to do list and git logs indicate buffer over flow issues indicating the tty framework cannot handle high speed IO. 

That is that one driver, not yours.

> Thus our rationale of why tty may not serve the purpose as indicated below gets ratified 
> - Performance & stability ( multiple layers, >1GB file copy CRC errors)
> - Error Recovery  ( lack of framework to propagate transport error handling to the "real" class drivers)

Do you have these problems today with the existing kernel driver?  If
so, please let us know and fix them!  Don't create a whole new thing
just because you don't like the tty layer, otherwise you will be forced
to end up creating all of the same logic again.

> > My main objection here is a lack of justification to require userspace to write to
> > a new, unknown and undocumented interface, because of an unknown speed
> > issue in the existing codebase.
> 
> As for us clarity on unknown/undocumented, ADB is adequately documented and known tool. Please note this is just one example and the interface can be leveraged by other debug tools for better performance..  Having a thinner kernel implementation has well known advantage including stability and maintenance and is not new to USB drivers

What "thinner" kernel implementation?  Nothing is as "thin" as the code
that is already written and is not going away :)

Again, do not duplicate functionality for no good reason, and I have yet
to see a definitive reason why the current in-kernel code is not
acceptable.

> > Would you take patches submitted in such a way if you were in my place?
> I would be happy to address all your concerns and open to adopt any better approach that solves the problem .

That was not the answer to my question.

greg k-h
