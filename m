Return-Path: <linux-usb+bounces-14903-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFF1973623
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 13:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8F39B25E09
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 11:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0285018CBE6;
	Tue, 10 Sep 2024 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nuSiFs7h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F58617D341
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725967296; cv=none; b=dS37RBHnMstpYSMJVyZTmUPQsL5GQ2MxkVx+Jw5pvHdxvVHWGvCdnuFPynHZIQyuz4yTgUARq0bdtnLPNJIKJxo7kj0LkdqgF9c4X4NLeLTTTSdyZG8ymoaCLCoYIc5TxYhSPIt8w8b8REvulh1CYwJi+WHPOYLX84tDCyBnKjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725967296; c=relaxed/simple;
	bh=s+lIE8eTwFSGKd1CJrE2mpLJ5ybaCm5SxZB7Zb/DqNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XA5k9VKmvtBNztfY0HP1M58vnLRLRja4lMCVWYYmvMh0H3tdLkf2iF264VgAYuxVRVEFWtoBYUIlXMO/1yDu0YmPRuxYmsazA1ghJW2HP92Do2XaW+4dpi+Nc8FNsHx/PUyIQamN/Rdwce+1PsqMkpejhSKlJanpz+n9fCCnFhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nuSiFs7h; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725967295; x=1757503295;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s+lIE8eTwFSGKd1CJrE2mpLJ5ybaCm5SxZB7Zb/DqNE=;
  b=nuSiFs7hyP+cFoU0YIBNTUV2e1EJv3SdpyFSo/bUkzRrnGRzJVflhdo8
   1pQX9LgfagMdUpxPI0Gfv8F0KtZjZmg9H5udxLJ7f2dXiI/9Ta1V7yefG
   7h0/3Z+TJQ6pTk4DrHUWo1pkD3LdxefpSqxfyvqtXuMgQsDheSxRCGnDH
   bc0DHXseUim9OtzT3vQnovrOtLKIqDjEmiz/FUThL8OGf0R8f8ikyFggQ
   kXqH5T0c/KpDvKQflzAa8Ue1MQGsVmjYQnEB2mjYUxRu0kBXMcEKF8tmf
   bT1MjWbRmC+5RdzXqI/NvqxOm929TBBAobmaJBIVCugQ/Pw0rsQzu8izh
   g==;
X-CSE-ConnectionGUID: pHG3OyKOSX2AfI1hZVAhDw==
X-CSE-MsgGUID: Z7oTTwcnSXKh5uJs2zfAjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35278405"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="35278405"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 04:21:34 -0700
X-CSE-ConnectionGUID: XGWpL+nCRuqPQnjdvU2JRg==
X-CSE-MsgGUID: 4H647V73R6Kkzxnt5gy5cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="71973826"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa004.jf.intel.com with SMTP; 10 Sep 2024 04:21:31 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 10 Sep 2024 14:21:30 +0300
Date: Tue, 10 Sep 2024 14:21:30 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: "Gopal, Saranya" <saranya.gopal@intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method for UCSI
 read operations
Message-ID: <ZuArunRcvrVbKPKC@kuha.fi.intel.com>
References: <20240830084342.460109-1-saranya.gopal@intel.com>
 <ZtGGcRpavSITFai7@kuha.fi.intel.com>
 <ZtJDH4UCJMQbOWBY@cae.in-ulm.de>
 <DS0PR11MB74574A426FAA3322F4FFC017E39E2@DS0PR11MB7457.namprd11.prod.outlook.com>
 <Zt6979hVhtzGBeq6@kuha.fi.intel.com>
 <Zt8/VYZomXPGoF0/@cae.in-ulm.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zt8/VYZomXPGoF0/@cae.in-ulm.de>

On Mon, Sep 09, 2024 at 08:32:53PM +0200, Christian A. Ehrhardt wrote:
> 
> Hi Heikki,
> 
> On Mon, Sep 09, 2024 at 12:20:47PM +0300, Heikki Krogerus wrote:
> > Hi Saranya, Christian,
> > 
> > On Fri, Sep 06, 2024 at 11:47:42AM +0000, Gopal, Saranya wrote:
> > > Hi Heikki, Christian,
> > > 
> > > > -----Original Message-----
> > > > From: Christian A. Ehrhardt <lk@c--e.de>
> > > > Sent: Saturday, August 31, 2024 3:40 AM
> > > > To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > Cc: Gopal, Saranya <saranya.gopal@intel.com>; linux-
> > > > usb@vger.kernel.org; gregkh@linuxfoundation.org; Regupathy,
> > > > Rajaram <rajaram.regupathy@intel.com>
> > > > Subject: Re: [PATCH] usb: typec: ucsi: Do not call ACPI _DSM method
> > > > for UCSI read operations
> > > > 
> > > > 
> > > > Hi Heikki, Hi Saranya,
> > > > 
> > > > On Fri, Aug 30, 2024 at 11:44:33AM +0300, Heikki Krogerus wrote:
> > > > > On Fri, Aug 30, 2024 at 02:13:42PM +0530, Saranya Gopal wrote:
> > > > > > ACPI _DSM methods are needed only for UCSI write operations
> > > > and for reading
> > > > > > CCI during RESET_PPM operation. So, remove _DSM calls from
> > > > other places.
> > > > > > While there, remove the Zenbook quirk also since the default
> > > > behavior
> > > > > > now aligns with the Zenbook quirk. With this change,
> > > > GET_CONNECTOR_STATUS
> > > > > > returns at least 6 seconds faster than before in Arrowlake-S
> > > > platforms.
> > > > > >
> > > > > > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > > > > > Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> > > > >
> > > > > Maybe this should be marked as a fix. I think this covers:
> > > > > https://lore.kernel.org/linux-usb/20240829100109.562429-2-
> > > > lk@c--e.de/
> > > > >
> > > 
> > > Heikki,
> > > I see that Christian's other patch is marked as a fix already (https://lore.kernel.org/linux-usb/20240906065853.637205-1-lk@c--e.de/T/#u). 
> > 
> > The other part still needs a fix.
> 
> Well technically not. I've established with the reporter of
> 	https://bugzilla.kernel.org/show_bug.cgi?id=219108
> that the immediate regression (keyboard on ASUS laptop not working) is
> fixed with the ucsi.c patch (that got your Reviewed-By today) alone.
> 
> UCSI on the ASUS laptop is still broken but it always was, AFAICT.
> Thus I'd like to push the above mentioned patch as the fix for
> the regression.
> 
> The reporter was very helpful and responsive in testing and
> I intend to look into the reason why UCSI does not work after
> that with the reporter's help.
> 
> > On Thu, 5 Sept 2024 at 20:00, Christian A. Ehrhardt <lk@c--e.de> wrote:
> > 
> > >
> > > Hi again,
> > >
> > > attached is version 4 of the patch. This will not fix the error
> > > messages we talked about (I have to think about this some more).
> > >
> > > It should fix your keyboard issues, though.
> > >
> > > Heikki had another request to change the patch and it would be
> > > cool if you could test this version to make sure that it really
> > > fixes your immediate problem.
> > >
> > > Best regards,
> > > Christian
> > >
> 
> > [    0.019168] [Firmware Bug]: CPU8: Topology domain 1 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU8: Topology domain 2 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU8: Topology domain 3 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU8: Topology domain 4 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU8: Topology domain 5 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU8: Topology domain 6 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU9: Topology domain 1 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU9: Topology domain 2 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU9: Topology domain 3 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU9: Topology domain 4 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU9: Topology domain 5 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU9: Topology domain 6 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU10: Topology domain 1 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU10: Topology domain 2 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU10: Topology domain 3 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU10: Topology domain 4 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU10: Topology domain 5 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU10: Topology domain 6 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU11: Topology domain 1 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU11: Topology domain 2 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU11: Topology domain 3 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU11: Topology domain 4 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU11: Topology domain 5 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU11: Topology domain 6 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU12: Topology domain 1 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU12: Topology domain 2 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU12: Topology domain 3 shift 7 != 6
> > [    0.019168] [Firmware Bug]: CPU12: Topology domain 4 shift 7 != 6
> 
> 
> > 
> > > So, can this patch go in as it is?
> > > Please let me know if I need to resubmit with any changes.
> > 
> > If you prefer that we go with Christian's patch to fix the issue
> > - which is fine by me - you need to rebase this on top of his patch in
> > any case. So you will need to resend this either way.
> > 
> > Christian would you mind resending that second patch after all where
> > you take the Zenbook quirk into use on that ASUS system?
> 
> See above. The immediate regression is fixed with the already
> reviewed patch alone. The remaining issue with UCSI on the ASUS
> laptop not working can be fixed separately.
> 
> I'd rather base a fix for UCSI on the ASUS laptop onto Saranya's
> patch because I think that patch is the correct thing to do.
> 
> Unfortunately, testing by the original reporter was inconclusive
> wrt. this. I have one report of a test run with the (classical)
> ASUS quirk (and the other patch) where UCSI on the ASUS laptop
> did work. Patch version v1 was the result of this.
> 
> With Saranya's patch and my patch to ucsi.c the regression was gone
> but UCSI did _not_ work.
> 
> As this does not make sense because Saranya's patch should be
> equivalent to the ASUS zenbook quirk. Thus this needs more
> investigation and dropping the zenbook quirk patch looks like the
> correct thing to do.
> 
> > Let's make that as the actual fix for the issue. Maybe it's more clear
> > that way.
> 
> Please let me know if you disagree and I can resend the ASUS quirk
> patch.

No, that's not necessary. So we go ahead with this patch from Saranya
as is - we don't caim it fixes anything. Then you guys continue
debugging that UCSI not working on the ASUS laptop issue. If I got
this correct then:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

If there was nothing else, then my appologies for all the noise.

thanks,

-- 
heikki

