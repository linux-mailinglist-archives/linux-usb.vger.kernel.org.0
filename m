Return-Path: <linux-usb+bounces-15590-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A191F989F2E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 12:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C0681F22968
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 10:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA72189902;
	Mon, 30 Sep 2024 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gjZX7ASe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FA82D613
	for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2024 10:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727691251; cv=none; b=uYisYTitQvEtGuiuL9oeJQBU+ffDp1fDH1k7METmnJ9qCcsZoJHv1ELasncxOOzsP8uHdUbUxZSQv6GDCKYvx+tCcUmnDdFRTugpNwrwp7jATqunFF4Rh1vzB7Vc5vo4rGS5aH3L/7ylLpyLjARcV1niXKoBoWhorURHARmtPds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727691251; c=relaxed/simple;
	bh=Q0BefYAH6Po9UVU7lwE4U24xgY3A4Ogo4F7t31k+FLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+GtW0QMVbEuC5jKafprTgIh8zTeG8r4naRLa7JULaYS4hu571Ry5Eh84a7UEb1eR/25dhPaVshUVUOpr/bB22EimM2WhXUVDHFOg93Yk7CN/m9GGGlGoA1ZJ/gbIfb6J7ECHqU74qxZv3nrDPVd8UIYCjvNDtTM078UTLs6p5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gjZX7ASe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF24DC4CEC7;
	Mon, 30 Sep 2024 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727691250;
	bh=Q0BefYAH6Po9UVU7lwE4U24xgY3A4Ogo4F7t31k+FLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gjZX7ASeF4G45StDATrQbe/LrKMRrBOux8xKY71BLr+EYIwx3YyBhJI9xU/jc8QeD
	 DXr1Ru1y+SXqOWHGaciJPDh3+AsV08wjWKpfx44WU6VH/qwsVVzjtGJS9JSmSDNwr2
	 eN1Ir1ns7HD0RAOGSVx5gPIB+MyrK65Vr06L6v+w=
Date: Mon, 30 Sep 2024 12:14:07 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Gopal, Saranya" <saranya.gopal@intel.com>
Cc: "'Christian A. Ehrhardt'" <lk@c--e.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI
 read operations
Message-ID: <2024093022-scoured-groggy-81fd@gregkh>
References: <20240830084342.460109-1-saranya.gopal@intel.com>
 <ZtGGcRpavSITFai7@kuha.fi.intel.com>
 <ZtJDH4UCJMQbOWBY@cae.in-ulm.de>
 <DS0PR11MB74574A426FAA3322F4FFC017E39E2@DS0PR11MB7457.namprd11.prod.outlook.com>
 <Zt6979hVhtzGBeq6@kuha.fi.intel.com>
 <Zt8/VYZomXPGoF0/@cae.in-ulm.de>
 <ZuArunRcvrVbKPKC@kuha.fi.intel.com>
 <ZuC/Po0iPHYDl7Y9@cae.in-ulm.de>
 <DS0PR11MB7457767F548B993C11B69E36E3762@DS0PR11MB7457.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR11MB7457767F548B993C11B69E36E3762@DS0PR11MB7457.namprd11.prod.outlook.com>

On Mon, Sep 30, 2024 at 09:41:51AM +0000, Gopal, Saranya wrote:
> Hi Greg,
> > -----Original Message-----
> > From: Christian A. Ehrhardt <lk@c--e.de>
> > Sent: Wednesday, September 11, 2024 3:21 AM
> > To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Gopal, Saranya <saranya.gopal@intel.com>; linux-
> > usb@vger.kernel.org; gregkh@linuxfoundation.org; Regupathy,
> > Rajaram <rajaram.regupathy@intel.com>
> > Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method
> > for UCSI read operations
> > 
> > 
> > Hi Heikki,
> > 
> > On Tue, Sep 10, 2024 at 02:21:30PM +0300, Heikki Krogerus wrote:
> > > On Mon, Sep 09, 2024 at 08:32:53PM +0200, Christian A. Ehrhardt
> > wrote:
> > > >
> > > > Hi Heikki,
> > > >
> > > > On Mon, Sep 09, 2024 at 12:20:47PM +0300, Heikki Krogerus
> > wrote:
> > > > > Hi Saranya, Christian,
> > > > >
> > > > > On Fri, Sep 06, 2024 at 11:47:42AM +0000, Gopal, Saranya
> > wrote:
> > > > > > Hi Heikki, Christian,
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Christian A. Ehrhardt <lk@c--e.de>
> > > > > > > Sent: Saturday, August 31, 2024 3:40 AM
> > > > > > > To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > > > > Cc: Gopal, Saranya <saranya.gopal@intel.com>; linux-
> > > > > > > usb@vger.kernel.org; gregkh@linuxfoundation.org;
> > Regupathy,
> > > > > > > Rajaram <rajaram.regupathy@intel.com>
> > > > > > > Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM
> > method
> > > > > > > for UCSI read operations
> > > > > > >
> > > > > > >
> > > > > > > Hi Heikki, Hi Saranya,
> > > > > > >
> > > > > > > On Fri, Aug 30, 2024 at 11:44:33AM +0300, Heikki Krogerus
> > wrote:
> > > > > > > > On Fri, Aug 30, 2024 at 02:13:42PM +0530, Saranya Gopal
> > wrote:
> > > > > > > > > ACPI _DSM methods are needed only for UCSI write
> > operations
> > > > > > > and for reading
> > > > > > > > > CCI during RESET_PPM operation. So, remove _DSM calls
> > from
> > > > > > > other places.
> > > > > > > > > While there, remove the Zenbook quirk also since the
> > default
> > > > > > > behavior
> > > > > > > > > now aligns with the Zenbook quirk. With this change,
> > > > > > > GET_CONNECTOR_STATUS
> > > > > > > > > returns at least 6 seconds faster than before in
> > Arrowlake-S
> > > > > > > platforms.
> > > > > > > > >
> > > > > > > > > Reviewed-by: Heikki Krogerus
> > <heikki.krogerus@linux.intel.com>
> > > > > > > > > Signed-off-by: Saranya Gopal
> > <saranya.gopal@intel.com>
> > > > > > > >
> > > > > > > > Maybe this should be marked as a fix. I think this covers:
> > > > > > > > https://lore.kernel.org/linux-
> > usb/20240829100109.562429-2-
> > > > > > > lk@c--e.de/
> > > > > > > >
> > > > > >
> > > > > > Heikki,
> > > > > > I see that Christian's other patch is marked as a fix already
> > (https://lore.kernel.org/linux-usb/20240906065853.637205-1-lk@c--
> > e.de/T/#u).
> > > > >
> > > > > The other part still needs a fix.
> > > >
> > > > Well technically not. I've established with the reporter of
> > > > 	https://bugzilla.kernel.org/show_bug.cgi?id=219108
> > > > that the immediate regression (keyboard on ASUS laptop not
> > working) is
> > > > fixed with the ucsi.c patch (that got your Reviewed-By today)
> > alone.
> > > >
> > > > UCSI on the ASUS laptop is still broken but it always was, AFAICT.
> > > > Thus I'd like to push the above mentioned patch as the fix for
> > > > the regression.
> > > >
> > > > The reporter was very helpful and responsive in testing and
> > > > I intend to look into the reason why UCSI does not work after
> > > > that with the reporter's help.
> > > >
> > > > > On Thu, 5 Sept 2024 at 20:00, Christian A. Ehrhardt <lk@c--
> > e.de> wrote:
> > > > >
> > > > > >
> > > > > > Hi again,
> > > > > >
> > > > > > attached is version 4 of the patch. This will not fix the error
> > > > > > messages we talked about (I have to think about this some
> > more).
> > > > > >
> > > > > > It should fix your keyboard issues, though.
> > > > > >
> > > > > > Heikki had another request to change the patch and it would
> > be
> > > > > > cool if you could test this version to make sure that it really
> > > > > > fixes your immediate problem.
> > > > > >
> > > > > > Best regards,
> > > > > > Christian
> > > > > >
> > > >
> > > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 1 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 2 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 3 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 4 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 5 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU8: Topology domain 6 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 1 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 2 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 3 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 4 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 5 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU9: Topology domain 6 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 1 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 2 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 3 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 4 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 5 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU10: Topology domain 6 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 1 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 2 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 3 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 4 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 5 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU11: Topology domain 6 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU12: Topology domain 1 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU12: Topology domain 2 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU12: Topology domain 3 shift 7
> > != 6
> > > > > [    0.019168] [Firmware Bug]: CPU12: Topology domain 4 shift 7
> > != 6
> > > >
> > > >
> > > > >
> > > > > > So, can this patch go in as it is?
> > > > > > Please let me know if I need to resubmit with any changes.
> > > > >
> > > > > If you prefer that we go with Christian's patch to fix the issue
> > > > > - which is fine by me - you need to rebase this on top of his
> > patch in
> > > > > any case. So you will need to resend this either way.
> > > > >
> > > > > Christian would you mind resending that second patch after all
> > where
> > > > > you take the Zenbook quirk into use on that ASUS system?
> > > >
> > > > See above. The immediate regression is fixed with the already
> > > > reviewed patch alone. The remaining issue with UCSI on the ASUS
> > > > laptop not working can be fixed separately.
> > > >
> > > > I'd rather base a fix for UCSI on the ASUS laptop onto Saranya's
> > > > patch because I think that patch is the correct thing to do.
> > > >
> > > > Unfortunately, testing by the original reporter was inconclusive
> > > > wrt. this. I have one report of a test run with the (classical)
> > > > ASUS quirk (and the other patch) where UCSI on the ASUS laptop
> > > > did work. Patch version v1 was the result of this.
> > > >
> > > > With Saranya's patch and my patch to ucsi.c the regression was
> > gone
> > > > but UCSI did _not_ work.
> > > >
> > > > As this does not make sense because Saranya's patch should be
> > > > equivalent to the ASUS zenbook quirk. Thus this needs more
> > > > investigation and dropping the zenbook quirk patch looks like the
> > > > correct thing to do.
> > > >
> > > > > Let's make that as the actual fix for the issue. Maybe it's more
> > clear
> > > > > that way.
> > > >
> > > > Please let me know if you disagree and I can resend the ASUS
> > quirk
> > > > patch.
> > >
> > > No, that's not necessary. So we go ahead with this patch from
> > Saranya
> > > as is - we don't caim it fixes anything. Then you guys continue
> > > debugging that UCSI not working on the ASUS laptop issue. If I got
> > > this correct then:
> > 
> > Exactly. And
> > https://lore.kernel.org/all/20240906065853.637205-1-lk@c--e.de/
> > proceeds but is independent.
> > 
> > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > >
> > > If there was nothing else, then my appologies for all the noise.
> > 
> > No need to. The state of things was confusing and this type of
> > "noise" is your job as a maintainer :-)
> > 
> > Thanks for the review.
> 
> Gentle ping to consider taking this patch.

It has been mere hours since the merge window closed and I could even
consider applying this change.  Please relax and understand the
ecosystem in which you are working in (also remember the weeks of
conferences most of us have been at right now.)

To help make this work better, please take the time to review other
pending patches for the subsystem, which will ensure that your changes
get moved to the top as others get reviewed.  I'll wait for you to do
that before getting to this one...

thanks,

greg k-h

