Return-Path: <linux-usb+bounces-6874-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C1B85F21F
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 08:47:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7415284D5B
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 07:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC72E17998;
	Thu, 22 Feb 2024 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zf8BK1Wj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1665F17C62
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 07:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708588052; cv=none; b=RIOFnifzGNeFHMeHe0I56Z1PuOIoQq1sko/pQhE615jpENGzkiKhzGgVO+DWtgEkwf0RZ6goA9vzlFAsYNqNKVLHnD2K1IaYQoLhLflIGeqf7uIwYCbZYr5gMkxAn1Kz2O522Z6w1ejGzvPH5oKOEOKsWDmHgnMikXkK3CRAFNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708588052; c=relaxed/simple;
	bh=U0HqAJLdTPkevPjSBIK2wl6G6go7C3Eg0oDG4eSmcsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d29PQHj9KOD0c/sd2QHUzDK111xqoBkWWZmLVV6aXuCwazB8AtGYsdIJUyMXXnSL1aK5pFQOpDBCSgGPX/BeieIP3YF2RVbejAHAAQVUZS082hPf+7aNJO5GZD+KhpJR0W0VtRenYber92WaAElb1Fi7EHPf3N4kMbtzJ6goVrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zf8BK1Wj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12636C433F1;
	Thu, 22 Feb 2024 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708588051;
	bh=U0HqAJLdTPkevPjSBIK2wl6G6go7C3Eg0oDG4eSmcsg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zf8BK1WjaZcppWkKP2loUfztfCDpYOrWRzvQocXWirtFIRGpB4tlJCQrOE0NTG3YC
	 bCrLzVmrFK/c0Ff+NKfWSCNHcqSy5L/idA+zy1mH/2lfnz06RMKeFtbCAZ6F68Jq+f
	 Pa1z0VEBNqf812mPZuQZsnDwY60YjmK7xTKxMmMo=
Date: Thu, 22 Feb 2024 08:47:28 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb-next tree has patch applied twice
Message-ID: <2024022225-curfew-operative-c98f@gregkh>
References: <3469745.QJadu78ljV@steina-w>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3469745.QJadu78ljV@steina-w>

On Tue, Feb 20, 2024 at 04:29:04PM +0100, Alexander Stein wrote:
> Hi Greg,
> 
> on the usb-next tree [1] the patch 'usb: phy: generic: Get the vbus supply
> has been applied twice:
> * 03e607cbb2931374db1825f371e9c7f28526d3f4

This is from the 5.18 release, from this email series:
	https://lore.kernel.org/all/20220425171412.1188485-3-sean.anderson@seco.com/
from 2022.

> * 75fd6485cccef269ac9eb3b71cf56753341195ef

This is from a newer series:
	https://lore.kernel.org/all/20240123225111.1629405-3-sean.anderson@seco.com/
that I applied from there.

So how did it apply cleanly twice?

> causing my board imx8mm-tqma8mqml-mba8mx.dts failing to probe USB phy:
> [   11.006720] usb_phy_generic usbphynop1: error -EPERM: could not get vbus regulator
> [   11.017817] usb_phy_generic: probe of usbphynop1 failed with error -1
> 
> Reverting/removing the patch fix my problem.

Which patch?  All of the ones in that last series?  If so, why did it
apply at all?

totally confused,

greg k-h

