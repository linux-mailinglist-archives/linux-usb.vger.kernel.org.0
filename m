Return-Path: <linux-usb+bounces-6887-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9B085FAC0
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 15:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AF781F26E85
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 14:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BD514F9D1;
	Thu, 22 Feb 2024 14:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CmeynAB2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5ED1474DB
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 14:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708610745; cv=none; b=deklIPqSpxdQM4WzJwDjt1zBETx9uXPmO9hJgul+KQmdyevYJhX9VHgzPytVRvqGOf7uAVAnzevuu6Glhpb27Fp746UQGVBtsV8SZ29AfZourO0m+W4tY3wPZki/Vjk0K/oVklV2spXXKbWrKAhItNAI+cndlkNRQ/Xj4oXc79I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708610745; c=relaxed/simple;
	bh=1THcT8orNz//sF7wB+lYeQAHfUmS+iCCGWlFRupgXSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1a5Izl5uMtRNYt46mcPmq1wxNEqtJnceABqsBA4oJw7t46K0TjfyzcVzAoZHs8680WG9/wmv6+tG8ElBb1/X2k9F9lSmYYLaOW3otFNH2ohKYtDkiTxSsm2ny73v+UgMhBWEkPvXh4GWXBSVsCDqomTyu5ERXD/HrzWMsgflCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CmeynAB2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92632C43609;
	Thu, 22 Feb 2024 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708610745;
	bh=1THcT8orNz//sF7wB+lYeQAHfUmS+iCCGWlFRupgXSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmeynAB2UoTiY1iLA40h2Nq3Qeqiw0E5fOQJY1B6EqYTGn0CT7r6HnP1DmZJZdc/W
	 ++Ab3a/D0Y/rgGc/FTaE6/Zt7O2OTgIRZv/4qYcpaS27IRLeoU7rWWi2L7geCqU2/b
	 el6UB1eupphM5I3AfSlUOLkZCcsj/y322+rQzfvc=
Date: Thu, 22 Feb 2024 15:05:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-usb@vger.kernel.org, Sean Anderson <sean.anderson@seco.com>
Subject: Re: usb-next tree has patch applied twice
Message-ID: <2024022208-macaw-phrasing-9357@gregkh>
References: <3469745.QJadu78ljV@steina-w>
 <8339216.T7Z3S40VBb@steina-w>
 <2024022254-tiptop-sublease-6357@gregkh>
 <22194332.EfDdHjke4D@steina-w>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22194332.EfDdHjke4D@steina-w>

On Thu, Feb 22, 2024 at 02:46:46PM +0100, Alexander Stein wrote:
> Am Donnerstag, 22. Februar 2024, 14:06:12 CET schrieb Greg Kroah-Hartman:
> > On Thu, Feb 22, 2024 at 11:16:59AM +0100, Alexander Stein wrote:
> > > Hi,
> > > 
> > > CC'ing Sean as well.
> > > 
> > > Am Donnerstag, 22. Februar 2024, 08:47:28 CET schrieb Greg Kroah-Hartman:
> > > > On Tue, Feb 20, 2024 at 04:29:04PM +0100, Alexander Stein wrote:
> > > > > Hi Greg,
> > > > > 
> > > > > on the usb-next tree [1] the patch 'usb: phy: generic: Get the vbus supply
> > > > > has been applied twice:
> > > > > * 03e607cbb2931374db1825f371e9c7f28526d3f4
> > > > 
> > > > This is from the 5.18 release, from this email series:
> > > > 	https://lore.kernel.org/all/20220425171412.1188485-3-sean.anderson@seco.com/
> > > > from 2022.
> > > > 
> > > > > * 75fd6485cccef269ac9eb3b71cf56753341195ef
> > > > 
> > > > This is from a newer series:
> > > > 	https://lore.kernel.org/all/20240123225111.1629405-3-sean.anderson@seco.com/
> > > > that I applied from there.
> > > > 
> > > > So how did it apply cleanly twice?
> > > 
> > > Apparently the series from 2024 is v3 from the older v2 one. For some reason
> > > only patch 2/4 from v2 got applied before. v3 seems to be a rebase where the
> > > apply went unnoticed but the patch is again part of the series :(
> > > 
> > > > > causing my board imx8mm-tqma8mqml-mba8mx.dts failing to probe USB phy:
> > > > > [   11.006720] usb_phy_generic usbphynop1: error -EPERM: could not get vbus regulator
> > > > > [   11.017817] usb_phy_generic: probe of usbphynop1 failed with error -1
> > > > > 
> > > > > Reverting/removing the patch fix my problem.
> > > > 
> > > > Which patch?  All of the ones in that last series?  If so, why did it
> > > > apply at all?
> > > 
> > > In my case I reverted 75fd6485cccef269ac9eb3b71cf56753341195ef from
> > > usb-next, because that very change has been applied with
> > > 03e607cbb2931374db1825f371e9c7f28526d3f4 already.
> > 
> > Can you send a patch that resolves this all properly?
> 
> Which tree shall this patch apply to? usb-next?

Yes.

> Shall it revert 03e607cbb2931374db1825f371e9c7f28526d3f4 from v5.18
> or 75fd6485cccef269ac9eb3b71cf56753341195ef from usb-next?

the "unique to usb-next" one please.

Also realize that there was multiple patches in that series that were
applied, can you check the others as well?

thanks,

greg k-h

