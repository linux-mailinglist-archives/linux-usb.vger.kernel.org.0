Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60DD93CBC2
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2019 14:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387819AbfFKMeO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Jun 2019 08:34:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:56514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726713AbfFKMeO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Jun 2019 08:34:14 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A04E20673;
        Tue, 11 Jun 2019 12:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560256452;
        bh=/Vh+4H2bPz8P7KnAeYRurEIme0nO3e4dGgSEdbNKiGk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X3U8sDF1BKHWEgPwVrLwARWk2Gv/+5v6EA4ymDowgFv3PIJFW9Ju8kAib+bmiyL09
         EpajC24VmUdv0cTak/bAxyaGLC2tQjvznMDzBDLDWBNtCfI0SFOavEQc6tKW2salT4
         MqCkVsx/CJSTk/VPSm3kRAhirKFkmXejNr47k3Ac=
Date:   Tue, 11 Jun 2019 14:34:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Regupathy, Rajaram" <rajaram.regupathy@intel.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "Pandey, Prabhat Chand" <prabhat.chand.pandey@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Nyman, Mathias" <mathias.nyman@intel.com>,
        "K V, Abhilash" <abhilash.k.v@intel.com>,
        "Balaji, M" <m.balaji@intel.com>
Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to provide a
 raw interface on DbC
Message-ID: <20190611123409.GA26261@kroah.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
 <20190607063306.5612-5-prabhat.chand.pandey@intel.com>
 <20190607142132.GG14665@kroah.com>
 <af51b855-4ee4-9bc2-6484-b8c4d897f503@linux.intel.com>
 <20190610141607.GA5937@kroah.com>
 <4834501FD402484A85750D15DF17AB5C1D15AEE6@BGSMSX102.gar.corp.intel.com>
 <20190611095243.GA23226@kroah.com>
 <4834501FD402484A85750D15DF17AB5C1D15B030@BGSMSX102.gar.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4834501FD402484A85750D15DF17AB5C1D15B030@BGSMSX102.gar.corp.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 11, 2019 at 12:17:40PM +0000, Regupathy, Rajaram wrote:
> 
> 
> > -----Original Message-----
> > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > Sent: Tuesday, June 11, 2019 3:23 PM
> > To: Regupathy, Rajaram <rajaram.regupathy@intel.com>
> > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>; Pandey, Prabhat Chand
> > <prabhat.chand.pandey@intel.com>; linux-usb@vger.kernel.org; Nyman,
> > Mathias <mathias.nyman@intel.com>; K V, Abhilash <abhilash.k.v@intel.com>;
> > Balaji, M <m.balaji@intel.com>
> > Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to provide a raw
> > interface on DbC
> > Importance: High
> > 
> > On Tue, Jun 11, 2019 at 09:29:23AM +0000, Regupathy, Rajaram wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > > Sent: Monday, June 10, 2019 7:46 PM
> > > > To: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > Cc: Pandey, Prabhat Chand <prabhat.chand.pandey@intel.com>; linux-
> > > > usb@vger.kernel.org; Nyman, Mathias <mathias.nyman@intel.com>;
> > > > Regupathy, Rajaram <rajaram.regupathy@intel.com>; K V, Abhilash
> > > > <abhilash.k.v@intel.com>; Balaji, M <m.balaji@intel.com>
> > > > Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to
> > > > provide a raw interface on DbC
> > > > Importance: High
> > > >
> > > > On Mon, Jun 10, 2019 at 04:53:51PM +0300, Mathias Nyman wrote:
> > > > > On 7.6.2019 17.21, Greg KH wrote:
> > > > > > On Fri, Jun 07, 2019 at 12:03:05PM +0530, Prabhat Chand Pandey wrote:
> > > > > > > From: Abhilash K V <abhilash.k.v@intel.com>
> > > > > > >
> > > > > > > This patch provides a raw device interface on xhci Debug capability.
> > > > > >
> > > > > > What is a "raw device"?
> > > > > >
> > > > > > > This abstracts dbc functionality to user space inorder to
> > > > > > > facilitate various frameworks to utilize xhci debug capability.
> > > > > >
> > > > > > I do not understand this sentance at all.  Please provide a lot
> > > > > > more information.
> > > > > >
> > > > > > > It helps to render the target as an usb debug class device on
> > > > > > > host and establish an usb connection by providing two bulk endpoints.
> > > > > >
> > > > > > provide bulk endpoints where?  To send data where?  This is very
> > > > > > confusing and does not make any sense to me...
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > [don't dynamically allocate tiny space for name only -Mathias]
> > > > > > > Signed-off-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
> > > > > > > Signed-off-by: Prabhat Chand Pandey
> > > > > > > <prabhat.chand.pandey@intel.com>
> > > > > > > Signed-off-by: Abhilash K V <abhilash.k.v@intel.com>
> > > > > > > Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > > > > ---
> > > > > ...
> > > > > >
> > > > > > So you have a new char device, with a undocumented and unknown
> > > > > > format of data flowing across it to the device.  How in the
> > > > > > world are we supposed to use this thing?  Where is it
> > > > > > documented?  What does it do?  How can you use it?
> > >
> > > We had captured all information in patch 5/5 patch in the documentation
> > part.
> > > We could always improve the documentation. Please let us know
> > 
> > The documentation needs work, see my comments on that.
> > 
> > Also, I don't think you answered these basic questions there, like "what is the
> > data format", and "how is this supposed to be used".
> 
> Sure. dbc_raw("dbcfs" could have been better) is a an interface similar to gadget(ffs) or host (usbfs) drivers of USB. These "*fs" provides user land to develop class drivers.  Thus the transport is agnostic on the data format, where we could implement an MTP class (ffs,usbfs) or ADB(dbcfs/dbc_raw).

Please wrap your lines at 72 columns...

Anyway, this is not a filesystem interface, you have created a char
device.  Much like the tty char device node you have today, right?  Just
seems to use different ioctls, and requires a custom userspace program.

> But I agree we need to provide additional documentation similar to Documentation/usb/proc_usb_info.txt or Documentation/usb/functionfs.txt

You need some sort of documentation :)

> > > > > > I don't mean to be so harsh here, but come on people, this stuff
> > > > > > needs a lot more background documentation, information, and
> > > > > > explaination as to exactly why in the world we need any of this,
> > > > > > and what it
> > > > even does!
> > > > > >
> > > > > > Also, you need to fix the code, it doesn't work as pointed out
> > > > > > in a few places :)
> > > > > >
> > > > >
> > > > > Thanks for going through this.
> > > > > It's now clear this is far from ready.
> > > > > I need to re-evaluate my position on this, not just the code and
> > > > > the documentation, but the usefulness of it all.
> > > >
> > > > What is this even supposed to be used for?  What is the application
> > > > for it?  I couldn't determine that at all, what am I missing?
> > >
> > > A typical use case is ADB for x86 Android systems  or similar user
> > > space class(debug) drivers that can leverage xHCI.DbC capability for
> > > debug purpose.
> > 
> > Why does adb need a "high speed" interface?
> 
> Debug tools require high/super speed when large logs or test files have to be pushed or pulled from the device under test. ADB is one such tool.

And what is lacking with the tty interface you have today?  How can this
be "faster" when it is talking to the same exact hardware?  Where is the
overhead in the tty api that is now gone here?

> > And do you need special hardware to access this?  Do you need patches on the
> > adb side for this?
> 
> No special hardware is required. We need a USB Type-AtoA debug cable and is a commonly used method in other OS tools as well .  Yes adb requires changes only in enumeration path to match the descriptors.

Do you have a link to such cables?  I don't seem to have one anywhere...

> > > The larger goal here is to have DbC as a unified debug infrastructure for
> > different debug methods like KGDB or early printk and leverage the benefits of a
> > dedicated debug infra (DbC) brings in.
> > 
> > Have you modified kgdb for this?  Do you have patches for that?
> No kgdb changes. For kgdb to work we added necessary wrapper functions required on the dbc_tty interface which already part of kernel. We have functionally verified and shall push the patch subsequently. Am I missing something ?

You are missing the justification of a custom api that requires all
userspace tools to be modified instead of using the existing tty api
that everything "just works" with today.

> > Who can use this interface in the "real world", is it only developers that have
> > access to the special hardware dongle?  Or can anyone use this on their laptops
> > for getting console access in a way that is somehow "better" than the existing
> > interface?
> 
> No special hardware is required. As indicated earlier developers need a USB A-A debug cable and anyone can use it to get console access. 

Where can I get one of those?

> Yes it is better that existing usb-serial converters with each having proprietary drivers . This is a plug and play solution providing super speed interface.

I don't understand, what is "proprietary" about the existing tty api?
It's a generic tty device node, right?  What am I missing?

> > And just how much "faster" is all of this than the current tty interface?  What is
> > lacking in the tty interface today that you need this new, special one?  Can you
> > just not fix any bottleneck in the tty driver if you are not properly saturating the
> > bus?
> 
> IMHO, tty is a legacy interface designed for the purpose it serves for. Modern High speed IO will not fit into tty framework and refactoring it will not bring any real value.  We have captured the initial performance numbers in the documentation patch 5/5.  Please correct me if I am missing something 

Why will "modern high speed IO" not fit into the tty framework?  Where
is the bottleneck?  We have tty devices that seem to run at "line speed"
on a firewire connection today, and that should be faster than whatever
this host controller can pump out, right?

My main objection here is a lack of justification to require userspace
to write to a new, unknown and undocumented interface, because of an
unknown speed issue in the existing codebase.

Would you take patches submitted in such a way if you were in my place?

thanks,

greg k-h
