Return-Path: <linux-usb+bounces-6882-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9435F85F923
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 14:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 498D71F26969
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 13:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA45712F5B5;
	Thu, 22 Feb 2024 13:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lImYHACi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681063C480
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 13:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708607176; cv=none; b=PMRAWfkfxn0hQ6OIXSKQ7fxgtDmVe61nXJA7ICO/0MFMkpmgrAbxpccaWxV0e+vVKMeoXl1QDwDRXrdvhiwOt6PV4TtpWyQthrjmdDzRg4R+MMQLfwlKZcIL6gJasYOBVFeSdDFbmvv0+dM99V5R1vxK/kQl7rHY1pL7dGh0PwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708607176; c=relaxed/simple;
	bh=J/n3jgLIrJLw7ympv5FoDDk4IuHGkAvYMPBTF1voMf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRgBPau4mDaqa+73oT5pILUbn5Y3C7lHxnrqUt2eG6EJ6zTjNUdMOv2CmS59IeXcI+YaqV4RBpJBC4smJc2Km+GmJ5NZUSTaoGkdNx0SoIerxjLhJBKuXsRxmCOtejgMmbulkZkfbKUIDiA+qjDpRFUFXikmxyGkZpCxLVhZZ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lImYHACi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CBDAC433F1;
	Thu, 22 Feb 2024 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708607176;
	bh=J/n3jgLIrJLw7ympv5FoDDk4IuHGkAvYMPBTF1voMf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lImYHACiXWNh261sQyCxhsWS7tW4J7BvN+O5jwaFkrJ2Dhurjf1m9S3RTdDltRL88
	 l5sn/JbVAofatKhk4EvHlEy9euN67ftjzbqmL6JULuDinOfeHRupojaURaVP6qa9Uy
	 lRm7TdaoufcQHgyUWwCUifrByLXzuPzXBwQBJG8w=
Date: Thu, 22 Feb 2024 14:06:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-usb@vger.kernel.org, Sean Anderson <sean.anderson@seco.com>
Subject: Re: usb-next tree has patch applied twice
Message-ID: <2024022254-tiptop-sublease-6357@gregkh>
References: <3469745.QJadu78ljV@steina-w>
 <2024022225-curfew-operative-c98f@gregkh>
 <8339216.T7Z3S40VBb@steina-w>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8339216.T7Z3S40VBb@steina-w>

On Thu, Feb 22, 2024 at 11:16:59AM +0100, Alexander Stein wrote:
> Hi,
> 
> CC'ing Sean as well.
> 
> Am Donnerstag, 22. Februar 2024, 08:47:28 CET schrieb Greg Kroah-Hartman:
> > On Tue, Feb 20, 2024 at 04:29:04PM +0100, Alexander Stein wrote:
> > > Hi Greg,
> > > 
> > > on the usb-next tree [1] the patch 'usb: phy: generic: Get the vbus supply
> > > has been applied twice:
> > > * 03e607cbb2931374db1825f371e9c7f28526d3f4
> > 
> > This is from the 5.18 release, from this email series:
> > 	https://lore.kernel.org/all/20220425171412.1188485-3-sean.anderson@seco.com/
> > from 2022.
> > 
> > > * 75fd6485cccef269ac9eb3b71cf56753341195ef
> > 
> > This is from a newer series:
> > 	https://lore.kernel.org/all/20240123225111.1629405-3-sean.anderson@seco.com/
> > that I applied from there.
> > 
> > So how did it apply cleanly twice?
> 
> Apparently the series from 2024 is v3 from the older v2 one. For some reason
> only patch 2/4 from v2 got applied before. v3 seems to be a rebase where the
> apply went unnoticed but the patch is again part of the series :(
> 
> > > causing my board imx8mm-tqma8mqml-mba8mx.dts failing to probe USB phy:
> > > [   11.006720] usb_phy_generic usbphynop1: error -EPERM: could not get vbus regulator
> > > [   11.017817] usb_phy_generic: probe of usbphynop1 failed with error -1
> > > 
> > > Reverting/removing the patch fix my problem.
> > 
> > Which patch?  All of the ones in that last series?  If so, why did it
> > apply at all?
> 
> In my case I reverted 75fd6485cccef269ac9eb3b71cf56753341195ef from
> usb-next, because that very change has been applied with
> 03e607cbb2931374db1825f371e9c7f28526d3f4 already.

Can you send a patch that resolves this all properly?

thanks,

greg k-h

