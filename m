Return-Path: <linux-usb+bounces-9775-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 584A38B24E6
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 17:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B5961C22129
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 15:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410BC14AD2F;
	Thu, 25 Apr 2024 15:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hV3vrwsu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB88214AD3E;
	Thu, 25 Apr 2024 15:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714058316; cv=none; b=qhHEUArtY9XoGzcV9K3qH/rut/cuwqEYTnNTHcBI0N+mApu/QcTlkej9qDypEZmqj/biOt0fZ0ccVecp+/nFiIxHJZ04MN3BSfPqMHuFcNBmcoPyS1Kki3+0JBcs9/rcEDSaRq/pp/LT1LTlxoHvRhVzilMt4Ysq35C2juE6JxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714058316; c=relaxed/simple;
	bh=u+azLrvnjAk8dt9XuILYtICPR6SZpeYwPh3fdjAcXZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aR9S4O97B2jh6p4pICLbUAxt97wtj835JsWhBd1EX27XO3cy75ukg0zMuodoQ/X7SP2mp6yu5Heu+3qaBKPJAnvrdIuhtpOVEjndiRqwgCGyC+dBVWThooZH2Z1lfuta3ZxfWtjCOBf61foimvf8dMU/Kjq9NaepOwygSCqXBMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hV3vrwsu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D62C113CC;
	Thu, 25 Apr 2024 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714058316;
	bh=u+azLrvnjAk8dt9XuILYtICPR6SZpeYwPh3fdjAcXZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hV3vrwsu3pKybHtR+YYYIbfrQeXTYU/D7/+76WeTJPghJvoK6XQGjYw0fe3GP9LJd
	 zgESwtybtd354Wg6JSc/i3qU3LErr9oFKY1Tf3IZLw/0fYy7mBq7HKOHgSEgq6gwNK
	 AXD4nKtgDZpNqmD3T+G2VzM5ftGvhNq1/o63MVyA=
Date: Thu, 25 Apr 2024 08:18:28 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Johan Hovold <johan@kernel.org>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [usb:usb-testing 7/12] drivers/usb/dwc3/core.c:1482:69: warning:
 '%d' directive output may be truncated writing between 1 and 11 bytes into a
 region of size 4
Message-ID: <2024042510-jazz-send-be09@gregkh>
References: <202404241215.Mib19Cu7-lkp@intel.com>
 <ZiiptMEL2_AdBsJA@hovoldconsulting.com>
 <d4e11bc4-3561-4e2e-9203-5d794269a225@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4e11bc4-3561-4e2e-9203-5d794269a225@quicinc.com>

On Thu, Apr 25, 2024 at 10:38:47AM +0530, Krishna Kurapati PSSNV wrote:
> 
> 
> On 4/24/2024 12:11 PM, Johan Hovold wrote:
> > On Wed, Apr 24, 2024 at 01:03:07PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > > head:   a160e1202ca318a85c70cf5831f172cc79a24c57
> > > commit: 846b4bacf2d48212f271fc1ef7488bcdf2c75bcb [7/12] usb: dwc3: core: Refactor PHY logic to support Multiport Controller
> > > config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240424/202404241215.Mib19Cu7-lkp@intel.com/config)
> > > compiler: s390-linux-gcc (GCC) 13.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241215.Mib19Cu7-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202404241215.Mib19Cu7-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > >     drivers/usb/dwc3/core.c: In function 'dwc3_core_get_phy':
> > > > > drivers/usb/dwc3/core.c:1482:69: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 4 [-Wformat-truncation=]
> > >      1482 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
> > >           |                                                                     ^~
> > >     drivers/usb/dwc3/core.c:1482:63: note: directive argument in the range [-2147483641, 254]
> > >      1482 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
> > 
> > This version or s390-build of gcc appears to be confused as the
> > variable i is clearly in the range [0,254] in these for loops.
> > 
> > I also don't see this W=1 warning with my gcc-10 (aarch64).
> > 
> > It may be possible to work around this by using u8 type for the iterator
> > (and %u in the format), but I'm not sure we should be working around
> > compiler bugs like that.
> 
> Thanks Johan. i agree it looks like a bogus compiler warning, but I think
> your suggestion of changing to u8 should work, if only to placate the
> compiler.
> 
> Greg, do you think I should go ahead and update it in v22 or can we ignore
> this warning ?

Please send a follow-on patch to fix this, I'll leave it as-is in my
tree for now.

thanks,

greg k-h

