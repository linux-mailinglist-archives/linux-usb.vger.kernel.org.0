Return-Path: <linux-usb+bounces-14868-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D5B9721E1
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 20:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 967381F23E1E
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 18:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB8F17D344;
	Mon,  9 Sep 2024 18:33:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943C71CAA6
	for <linux-usb@vger.kernel.org>; Mon,  9 Sep 2024 18:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725906785; cv=none; b=fqY3Qy6oaKaUj/8M73ne5FgV9tTnSO7UkCzwWqSbI8ZRygxSkpD6wr4GRhZwIGqJRlyxlVV+YoxOLZQqmW0B5zFYEPg1ugd//RnHAE0SOaTkNMOAnCqXt18ZV/eCFSB7XBu0tiXvubOAgffcFuZs9N8AfhAAZCbcySU20Fj3toA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725906785; c=relaxed/simple;
	bh=SsRXcrQgYunGfOZ2o4SS6w+YVEGEZd8cD57umhuD4PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+UdM06PWWEl4RG1m7nuIaMcCae7yyh7bUXkH04Q3mytrB/Cj6uZ9cGe6pkN+zB7xbavMWCuc4WJCDegBBSczZsHdEwGZj93b3eN4K6kDF1xgtlkSn2vxA24fDfZOGpj9+ECsNnLOP8OhNpXasTl3W/8+i0fkpcoijfvxNpJOrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id E36D214019C; Mon,  9 Sep 2024 20:32:53 +0200 (CEST)
Date: Mon, 9 Sep 2024 20:32:53 +0200
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: "Gopal, Saranya" <saranya.gopal@intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI
 read operations
Message-ID: <Zt8/VYZomXPGoF0/@cae.in-ulm.de>
References: <20240830084342.460109-1-saranya.gopal@intel.com>
 <ZtGGcRpavSITFai7@kuha.fi.intel.com>
 <ZtJDH4UCJMQbOWBY@cae.in-ulm.de>
 <DS0PR11MB74574A426FAA3322F4FFC017E39E2@DS0PR11MB7457.namprd11.prod.outlook.com>
 <Zt6979hVhtzGBeq6@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zt6979hVhtzGBeq6@kuha.fi.intel.com>


Hi Heikki,

On Mon, Sep 09, 2024 at 12:20:47PM +0300, Heikki Krogerus wrote:
> Hi Saranya, Christian,
> 
> On Fri, Sep 06, 2024 at 11:47:42AM +0000, Gopal, Saranya wrote:
> > Hi Heikki, Christian,
> > 
> > > -----Original Message-----
> > > From: Christian A. Ehrhardt <lk@c--e.de>
> > > Sent: Saturday, August 31, 2024 3:40 AM
> > > To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > Cc: Gopal, Saranya <saranya.gopal@intel.com>; linux-
> > > usb@vger.kernel.org; gregkh@linuxfoundation.org; Regupathy,
> > > Rajaram <rajaram.regupathy@intel.com>
> > > Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method
> > > for UCSI read operations
> > > 
> > > 
> > > Hi Heikki, Hi Saranya,
> > > 
> > > On Fri, Aug 30, 2024 at 11:44:33AM +0300, Heikki Krogerus wrote:
> > > > On Fri, Aug 30, 2024 at 02:13:42PM +0530, Saranya Gopal wrote:
> > > > > ACPI _DSM methods are needed only for UCSI write operations
> > > and for reading
> > > > > CCI during RESET_PPM operation. So, remove _DSM calls from
> > > other places.
> > > > > While there, remove the Zenbook quirk also since the default
> > > behavior
> > > > > now aligns with the Zenbook quirk. With this change,
> > > GET_CONNECTOR_STATUS
> > > > > returns at least 6 seconds faster than before in Arrowlake-S
> > > platforms.
> > > > >
> > > > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > > Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> > > >
> > > > Maybe this should be marked as a fix. I think this covers:
> > > > https://lore.kernel.org/linux-usb/20240829100109.562429-2-
> > > lk@c--e.de/
> > > >
> > 
> > Heikki,
> > I see that Christian's other patch is marked as a fix already (https://lore.kernel.org/linux-usb/20240906065853.637205-1-lk@c--e.de/T/#u). 
> 
> The other part still needs a fix.

Well technically not. I've established with the reporter of
	https://bugzilla.kernel.org/show_bug.cgi?id=219108
that the immediate regression (keyboard on ASUS laptop not working) is
fixed with the ucsi.c patch (that got your Reviewed-By today) alone.

UCSI on the ASUS laptop is still broken but it always was, AFAICT.
Thus I'd like to push the above mentioned patch as the fix for
the regression.

The reporter was very helpful and responsive in testing and
I intend to look into the reason why UCSI does not work after
that with the reporter's help.

> On Thu, 5 Sept 2024 at 20:00, Christian A. Ehrhardt <lk@c--e.de> wrote:
> 
> >
> > Hi again,
> >
> > attached is version 4 of the patch. This will not fix the error
> > messages we talked about (I have to think about this some more).
> >
> > It should fix your keyboard issues, though.
> >
> > Heikki had another request to change the patch and it would be
> > cool if you could test this version to make sure that it really
> > fixes your immediate problem.
> >
> > Best regards,
> > Christian
> >

> [    0.019168] [Firmware Bug]: CPU8: Topology domain 1 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU8: Topology domain 2 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU8: Topology domain 3 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU8: Topology domain 4 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU8: Topology domain 5 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU8: Topology domain 6 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU9: Topology domain 1 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU9: Topology domain 2 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU9: Topology domain 3 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU9: Topology domain 4 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU9: Topology domain 5 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU9: Topology domain 6 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU10: Topology domain 1 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU10: Topology domain 2 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU10: Topology domain 3 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU10: Topology domain 4 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU10: Topology domain 5 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU10: Topology domain 6 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU11: Topology domain 1 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU11: Topology domain 2 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU11: Topology domain 3 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU11: Topology domain 4 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU11: Topology domain 5 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU11: Topology domain 6 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU12: Topology domain 1 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU12: Topology domain 2 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU12: Topology domain 3 shift 7 != 6
> [    0.019168] [Firmware Bug]: CPU12: Topology domain 4 shift 7 != 6


> 
> > So, can this patch go in as it is?
> > Please let me know if I need to resubmit with any changes.
> 
> If you prefer that we go with Christian's patch to fix the issue
> - which is fine by me - you need to rebase this on top of his patch in
> any case. So you will need to resend this either way.
> 
> Christian would you mind resending that second patch after all where
> you take the Zenbook quirk into use on that ASUS system?

See above. The immediate regression is fixed with the already
reviewed patch alone. The remaining issue with UCSI on the ASUS
laptop not working can be fixed separately.

I'd rather base a fix for UCSI on the ASUS laptop onto Saranya's
patch because I think that patch is the correct thing to do.

Unfortunately, testing by the original reporter was inconclusive
wrt. this. I have one report of a test run with the (classical)
ASUS quirk (and the other patch) where UCSI on the ASUS laptop
did work. Patch version v1 was the result of this.

With Saranya's patch and my patch to ucsi.c the regression was gone
but UCSI did _not_ work.

As this does not make sense because Saranya's patch should be
equivalent to the ASUS zenbook quirk. Thus this needs more
investigation and dropping the zenbook quirk patch looks like the
correct thing to do.

> Let's make that as the actual fix for the issue. Maybe it's more clear
> that way.

Please let me know if you disagree and I can resend the ASUS quirk
patch.

Best regards,
Christian

