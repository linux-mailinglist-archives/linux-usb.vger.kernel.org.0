Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E186B41F9B
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2019 10:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406287AbfFLItX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 12 Jun 2019 04:49:23 -0400
Received: from mga05.intel.com ([192.55.52.43]:64126 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726636AbfFLItW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Jun 2019 04:49:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2019 01:49:22 -0700
X-ExtLoop1: 1
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
  by orsmga005.jf.intel.com with ESMTP; 12 Jun 2019 01:49:20 -0700
Received: from fmsmsx163.amr.corp.intel.com (10.18.125.72) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 12 Jun 2019 01:49:20 -0700
Received: from BGSMSX107.gar.corp.intel.com (10.223.4.191) by
 fmsmsx163.amr.corp.intel.com (10.18.125.72) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 12 Jun 2019 01:49:19 -0700
Received: from bgsmsx102.gar.corp.intel.com ([169.254.2.19]) by
 BGSMSX107.gar.corp.intel.com ([169.254.9.94]) with mapi id 14.03.0415.000;
 Wed, 12 Jun 2019 14:19:11 +0530
From:   "Regupathy, Rajaram" <rajaram.regupathy@intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        "Cox, Alan" <alan.cox@intel.com>
CC:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "Pandey, Prabhat Chand" <prabhat.chand.pandey@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Nyman, Mathias" <mathias.nyman@intel.com>,
        "K V, Abhilash" <abhilash.k.v@intel.com>,
        "Balaji, M" <m.balaji@intel.com>
Subject: RE: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to provide a
 raw interface on DbC
Thread-Topic: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to provide a
 raw interface on DbC
Thread-Index: AQHVHPuR36OpqDxWE0mdxttyJz+Qf6aP4nEAgASvQoCAAAY5gIAAZ6fggADhFoCAAHI+AP//utyAgAFqFnA=
Importance: high
X-Priority: 1
Date:   Wed, 12 Jun 2019 08:49:11 +0000
Message-ID: <4834501FD402484A85750D15DF17AB5C1D15DF95@BGSMSX102.gar.corp.intel.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
 <20190607063306.5612-5-prabhat.chand.pandey@intel.com>
 <20190607142132.GG14665@kroah.com>
 <af51b855-4ee4-9bc2-6484-b8c4d897f503@linux.intel.com>
 <20190610141607.GA5937@kroah.com>
 <4834501FD402484A85750D15DF17AB5C1D15AEE6@BGSMSX102.gar.corp.intel.com>
 <20190611095243.GA23226@kroah.com>
 <4834501FD402484A85750D15DF17AB5C1D15B030@BGSMSX102.gar.corp.intel.com>
 <20190611123409.GA26261@kroah.com>
In-Reply-To: <20190611123409.GA26261@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGJkMDQ4M2EtYWY5My00OGM4LWE0NmItZmY5ZDc2YTZjODNkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSXBubnZ6MXdURUl6ZEVvYVlwNWYxczRFNW9sSVUzcHJXV0NpUWRIWHdcL3pBNHZ5Z013OHhkVjhDQmpmWmh6SkkifQ==
x-originating-ip: [10.223.10.10]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Greg KH [mailto:gregkh@linuxfoundation.org]
> Sent: Tuesday, June 11, 2019 6:04 PM
> To: Regupathy, Rajaram <rajaram.regupathy@intel.com>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>; Pandey, Prabhat Chand
> <prabhat.chand.pandey@intel.com>; linux-usb@vger.kernel.org; Nyman,
> Mathias <mathias.nyman@intel.com>; K V, Abhilash <abhilash.k.v@intel.com>;
> Balaji, M <m.balaji@intel.com>
> Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to provide a raw
> interface on DbC
> Importance: High
> 
> On Tue, Jun 11, 2019 at 12:17:40PM +0000, Regupathy, Rajaram wrote:
> >
> >
> > > -----Original Message-----
> > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > Sent: Tuesday, June 11, 2019 3:23 PM
> > > To: Regupathy, Rajaram <rajaram.regupathy@intel.com>
> > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>; Pandey, Prabhat
> > > Chand <prabhat.chand.pandey@intel.com>; linux-usb@vger.kernel.org;
> > > Nyman, Mathias <mathias.nyman@intel.com>; K V, Abhilash
> > > <abhilash.k.v@intel.com>; Balaji, M <m.balaji@intel.com>
> > > Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to
> > > provide a raw interface on DbC
> > > Importance: High
> > >
> > > On Tue, Jun 11, 2019 at 09:29:23AM +0000, Regupathy, Rajaram wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Greg KH [mailto:gregkh@linuxfoundation.org]
> > > > > Sent: Monday, June 10, 2019 7:46 PM
> > > > > To: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > > Cc: Pandey, Prabhat Chand <prabhat.chand.pandey@intel.com>;
> > > > > linux- usb@vger.kernel.org; Nyman, Mathias
> > > > > <mathias.nyman@intel.com>; Regupathy, Rajaram
> > > > > <rajaram.regupathy@intel.com>; K V, Abhilash
> > > > > <abhilash.k.v@intel.com>; Balaji, M <m.balaji@intel.com>
> > > > > Subject: Re: [PATCH 4/5] usb: xhci: dbc: Add a dbc raw driver to
> > > > > provide a raw interface on DbC
> > > > > Importance: High
> > > > >
> > > > > On Mon, Jun 10, 2019 at 04:53:51PM +0300, Mathias Nyman wrote:
> > > > > > On 7.6.2019 17.21, Greg KH wrote:
> > > > > > > On Fri, Jun 07, 2019 at 12:03:05PM +0530, Prabhat Chand Pandey
> wrote:
> > > > > > > > From: Abhilash K V <abhilash.k.v@intel.com>
> > > > > > > >
> > > > > > > > This patch provides a raw device interface on xhci Debug capability.
> > > > > > >
> > > > > > > What is a "raw device"?
> > > > > > >
> > > > > > > > This abstracts dbc functionality to user space inorder to
> > > > > > > > facilitate various frameworks to utilize xhci debug capability.
> > > > > > >
> > > > > > > I do not understand this sentance at all.  Please provide a
> > > > > > > lot more information.
> > > > > > >
> > > > > > > > It helps to render the target as an usb debug class device
> > > > > > > > on host and establish an usb connection by providing two bulk
> endpoints.
> > > > > > >
> > > > > > > provide bulk endpoints where?  To send data where?  This is
> > > > > > > very confusing and does not make any sense to me...
> > > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > [don't dynamically allocate tiny space for name only
> > > > > > > > -Mathias]
> > > > > > > > Signed-off-by: Rajaram Regupathy
> > > > > > > > <rajaram.regupathy@intel.com>
> > > > > > > > Signed-off-by: Prabhat Chand Pandey
> > > > > > > > <prabhat.chand.pandey@intel.com>
> > > > > > > > Signed-off-by: Abhilash K V <abhilash.k.v@intel.com>
> > > > > > > > Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > > > > > ---
> > > > > > ...
> > > > > > >
> > > > > > > So you have a new char device, with a undocumented and
> > > > > > > unknown format of data flowing across it to the device.  How
> > > > > > > in the world are we supposed to use this thing?  Where is it
> > > > > > > documented?  What does it do?  How can you use it?
> > > >
> > > > We had captured all information in patch 5/5 patch in the
> > > > documentation
> > > part.
> > > > We could always improve the documentation. Please let us know
> > >
> > > The documentation needs work, see my comments on that.
> > >
> > > Also, I don't think you answered these basic questions there, like
> > > "what is the data format", and "how is this supposed to be used".
> >
> > Sure. dbc_raw("dbcfs" could have been better) is a an interface similar to
> gadget(ffs) or host (usbfs) drivers of USB. These "*fs" provides user land to
> develop class drivers.  Thus the transport is agnostic on the data format, where
> we could implement an MTP class (ffs,usbfs) or ADB(dbcfs/dbc_raw).
> 
> Please wrap your lines at 72 columns...
> 
> Anyway, this is not a filesystem interface, you have created a char device.
> Much like the tty char device node you have today, right?  Just seems to use
> different ioctls, and requires a custom userspace program.
> 
> > But I agree we need to provide additional documentation similar to
> > Documentation/usb/proc_usb_info.txt or
> > Documentation/usb/functionfs.txt
> 
> You need some sort of documentation :)
> 
> > > > > > > I don't mean to be so harsh here, but come on people, this
> > > > > > > stuff needs a lot more background documentation,
> > > > > > > information, and explaination as to exactly why in the world
> > > > > > > we need any of this, and what it
> > > > > even does!
> > > > > > >
> > > > > > > Also, you need to fix the code, it doesn't work as pointed
> > > > > > > out in a few places :)
> > > > > > >
> > > > > >
> > > > > > Thanks for going through this.
> > > > > > It's now clear this is far from ready.
> > > > > > I need to re-evaluate my position on this, not just the code
> > > > > > and the documentation, but the usefulness of it all.
> > > > >
> > > > > What is this even supposed to be used for?  What is the
> > > > > application for it?  I couldn't determine that at all, what am I missing?
> > > >
> > > > A typical use case is ADB for x86 Android systems  or similar user
> > > > space class(debug) drivers that can leverage xHCI.DbC capability
> > > > for debug purpose.
> > >
> > > Why does adb need a "high speed" interface?
> >
> > Debug tools require high/super speed when large logs or test files have to be
> pushed or pulled from the device under test. ADB is one such tool.
> 
> And what is lacking with the tty interface you have today?  How can this be
> "faster" when it is talking to the same exact hardware?  Where is the overhead
> in the tty api that is now gone here?
> 
> > > And do you need special hardware to access this?  Do you need
> > > patches on the adb side for this?
> >
> > No special hardware is required. We need a USB Type-AtoA debug cable and is
> a commonly used method in other OS tools as well .  Yes adb requires changes
> only in enumeration path to match the descriptors.
> 
> Do you have a link to such cables?  I don't seem to have one anywhere...
> 
> > > > The larger goal here is to have DbC as a unified debug
> > > > infrastructure for
> > > different debug methods like KGDB or early printk and leverage the
> > > benefits of a dedicated debug infra (DbC) brings in.
> > >
> > > Have you modified kgdb for this?  Do you have patches for that?
> > No kgdb changes. For kgdb to work we added necessary wrapper functions
> required on the dbc_tty interface which already part of kernel. We have
> functionally verified and shall push the patch subsequently. Am I missing
> something ?
> 
> You are missing the justification of a custom api that requires all userspace
> tools to be modified instead of using the existing tty api that everything "just
> works" with today.

I was referring to the poll methods required for KGDB/GDB to work which is missing in dbc_tty driver in the kernel.

> 
> > > Who can use this interface in the "real world", is it only
> > > developers that have access to the special hardware dongle?  Or can
> > > anyone use this on their laptops for getting console access in a way
> > > that is somehow "better" than the existing interface?
> >
> > No special hardware is required. As indicated earlier developers need a USB A-
> A debug cable and anyone can use it to get console access.
> 
> Where can I get one of those?
Here is one example:  https://www.amazon.com/SIIG-SuperSpeed-Cable-Meters-CB-US0212-S1/dp/B0032ANCBO

> 
> > Yes it is better that existing usb-serial converters with each having proprietary
> drivers . This is a plug and play solution providing super speed interface.
> 
> I don't understand, what is "proprietary" about the existing tty api?
> It's a generic tty device node, right?  What am I missing?

I am referring to usb-serial controller drivers as in "drivers/usb/serial/Kconfig" which has vendors configs leading to much of kernel maintenance.  DbC driver would provide necessary functionality without any of those.

> 
> > > And just how much "faster" is all of this than the current tty
> > > interface?  What is lacking in the tty interface today that you need
> > > this new, special one?  Can you just not fix any bottleneck in the
> > > tty driver if you are not properly saturating the bus?
> >
> > IMHO, tty is a legacy interface designed for the purpose it serves
> > for. Modern High speed IO will not fit into tty framework and
> > refactoring it will not bring any real value.  We have captured the
> > initial performance numbers in the documentation patch 5/5.  Please
> > correct me if I am missing something
> 
> Why will "modern high speed IO" not fit into the tty framework?  Where is the
> bottleneck?  We have tty devices that seem to run at "line speed"
> on a firewire connection today, and that should be faster than whatever this
> host controller can pump out, right?

Though I am not aware of the design thoughts behind firewire-tty driver which is in staging, I see
the to do list and git logs indicate buffer over flow issues indicating the tty framework cannot handle high speed IO. 

Thus our rationale of why tty may not serve the purpose as indicated below gets ratified 
- Performance & stability ( multiple layers, >1GB file copy CRC errors)
- Error Recovery  ( lack of framework to propagate transport error handling to the "real" class drivers)

> 
> My main objection here is a lack of justification to require userspace to write to
> a new, unknown and undocumented interface, because of an unknown speed
> issue in the existing codebase.

As for us clarity on unknown/undocumented, ADB is adequately documented and known tool. Please note this is just one example and the interface can be leveraged by other debug tools for better performance..  Having a thinner kernel implementation has well known advantage including stability and maintenance and is not new to USB drivers

> Would you take patches submitted in such a way if you were in my place?
I would be happy to address all your concerns and open to adopt any better approach that solves the problem .

> 
> thanks,
> 
> greg k-h
