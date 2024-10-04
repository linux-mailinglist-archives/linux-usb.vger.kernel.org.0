Return-Path: <linux-usb+bounces-15710-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB0199049D
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 15:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 311332856A8
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2024 13:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE45820FAB8;
	Fri,  4 Oct 2024 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DU7ofY0N"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB9917BBE
	for <linux-usb@vger.kernel.org>; Fri,  4 Oct 2024 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049203; cv=none; b=es8krAIzQioLFmFnqMzitcfuGt+GgN3jeSIHWLoiLHatr9Sb6mP+s3GOKt5btJv7n1Is+Erj1m5G01Yx0ldfLHDJng3MyyQNtA0dCcp+Ml8U/7i/B33+Ze/LckIaqjJ5DnuXvhKlyu47fFuRkb8VmvU7FLRRO4OB1o9t8a1yACk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049203; c=relaxed/simple;
	bh=ZowQgm28+SHTDpz3y01ULtWpJAE1Yr4v39njtrAf/NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aUSaRPHsZwainaPITzK8XoSmccObVH6L7RXR9px8zhkmGm3HXYbBCcvbaqGH+UNMAyvYtPGGoKISW3sOGyFDHy7PVVRp1/oFWrNeOjOjXuJXaeLY6lrqzMXKdbH0FDfaAYfM7h35QwsdKS9kbbEJv34OCwPPWwkdw9dp1cJZVSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DU7ofY0N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA9AC4CEC6;
	Fri,  4 Oct 2024 13:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728049202;
	bh=ZowQgm28+SHTDpz3y01ULtWpJAE1Yr4v39njtrAf/NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DU7ofY0NBTTEE0b+JJaS3JHHfpBVLnnx/m9PslbNJrjyyCSw4GZnzMJNfnGvacnGn
	 Mp32k+IMKtIh4s5K+JbPIpGO/uJOPQhdgbgHkyTo5Ht82M7OrA2eueU57AaP05SqQJ
	 ovKWeSlnmNfzjaAYcHsS+B4E6cOFuLXX9IX+03Aw=
Date: Fri, 4 Oct 2024 15:40:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
	Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v2] usb: Fix problem with xhci resume from suspend
Message-ID: <2024100448-unharmed-riches-47aa@gregkh>
References: <20240919184202.22249-1-jose.alberto.reguero@gmail.com>
 <2544903d-26c4-ca4f-b67b-5ef68e7c2e21@omp.ru>
 <b6e4bd54-198c-4d96-9ceb-86d0e2b4fbea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6e4bd54-198c-4d96-9ceb-86d0e2b4fbea@gmail.com>

On Mon, Sep 23, 2024 at 11:39:23PM +0200, Jose Alberto Reguero wrote:
> 
> El 19/09/2024 a las 21:18, Sergey Shtylyov escribió:
> > On 9/19/24 21:42, Jose Alberto Reguero wrote:
> > 
> > > I have a ASUS PN51 S mini pc that has two xhci devices. One from AMD, and other
> > > from ASMEDIA. The one from ASMEDIA have problems when resume from suspend, and
> > > keep broken until unplug the  power cord. I use this kernel parameter:
> > > xhci-hcd.quirks=128 and then it works ok. I make a path to reset only the
> > > ASMEDIA xhci.
> > > 
> > > 
> > > Signed-off-by: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
> > > 
> > > ---
> > >   drivers/usb/host/xhci-pci.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> > > index dc1e345ab67e..8f075ab63f65 100644
> > > --- a/drivers/usb/host/xhci-pci.c
> > > +++ b/drivers/usb/host/xhci-pci.c
> > [...]
> > > @@ -447,6 +448,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
> > >   		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
> > >   		xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
> > > +	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> > > +		pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
> >     Hum, please either add 1 more tab here or start the continuation line
> > under pdev jn the broken up line. The *if* expression should not blend with
> > code in the branch.
> 
> I do in the next version.

No need, I fixed this up already and applied it, thanks.

greg k-h

