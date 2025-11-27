Return-Path: <linux-usb+bounces-31008-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB747C8E6EC
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 14:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 383294E742F
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 13:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38F613A244;
	Thu, 27 Nov 2025 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZmyPsKGJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F8194AD7
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764249684; cv=none; b=BhvNOdoTwLg+oSMC2g+YuPqP9Crt8iaSS5AvCGooJ1mfpIZisqNax+ROLMZh9yKL228KXMNphAJYuRk+GHJtF5KipqrTeeBFS5hONmfCM0EncAB8zs05GdvUY2NpE6uy/0Z//zdJhIBUTX5YI1J5Oil/Ge/KSGYy5qgLJJtAJII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764249684; c=relaxed/simple;
	bh=hP25cp/mNANJMNpPBKvyoTpd0vyyHJGDPkdH0O0fsmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIhoBfVpslAUd3j6grUT90qa+EMGjNOs5yEcsnkG/uHrxUSTrUSoJxP3GmFYeTA9bUCPzjSwbD0RUjQS4p1yiAA8xhnVY0JU0dL3n/044SiZpy3Lk3k3pz8KUp7LEHpGAzHWPeUbirAXvjImJwOZoCNVp0Eel+2CJplv9+0BfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZmyPsKGJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845F1C4CEF8;
	Thu, 27 Nov 2025 13:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764249683;
	bh=hP25cp/mNANJMNpPBKvyoTpd0vyyHJGDPkdH0O0fsmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZmyPsKGJDgud45l/ggbWRjARILvvKl5tNyAnrQ6lZ4dKdQUk8ce6qZuP2XXrS0coq
	 pWLapcbS49V22RDHn99s3B1i5zRizafZn7X0sCFVSbnJtoOLzqwPcl3jOnNAYtOnxr
	 4/l9btEqQgyCy65a9ojGyBws8mrTRpkRQPo1uJss=
Date: Thu, 27 Nov 2025 14:21:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: testusb: epipe errors on test 9 and 10
Message-ID: <2025112717-ransack-strewn-9875@gregkh>
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <2025112737-frisk-prototype-f011@gregkh>
 <33c96409-b376-4e17-a2fb-a7e3bf1c3e85@kernel-space.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33c96409-b376-4e17-a2fb-a7e3bf1c3e85@kernel-space.org>

On Thu, Nov 27, 2025 at 01:53:32PM +0100, Angelo Dureghello wrote:
> Hi Greg,
> 
> thanks a lot,
> 
> On 11/27/25 09:22, Greg KH wrote:
> > On Thu, Nov 27, 2025 at 09:06:24AM +0100, Angelo Dureghello wrote:
> > > Hi all,
> > > 
> > > looking for some help on testusb tool tests 9,10 always failing with
> > > -EPIPE, kind of ep stall. Peripheral side has g_zero loaded.
> > > 
> > > Devices under test are custom boards, have same qualcomm 8 cores cpu, and
> > > kernel is android 5.4. Involved drivers in both devices are xhci and dwc3.
> > > Anyway, connection under tests is 2.0 microusb connector on both side.
> > 5.4 is _very_ old and obsolete and odds are you are paying for support
> > for that kernel from a company if you are stuck with it (hint, it is
> > going to go end-of-life in 3 days).  Please contact them as you are
> > paying for this kind of thing from your vendor.
> > 
> > If you can reproduce this with the latest release (6.17), please let us
> > know.
> it's an android kernel msm-5.4, actually updated from google with critical
> fixes, at least i can see some xhci endpoint stall issues applied to it,
> even
> if of course all the usb core stuff is that old (5.4).

Again, that kernel tree will go out of support in 3 days from us, so not
much we can do here, you should seriously consider upgrading as you are
going to have a very insecure system soon (not to mention that the
latest 5.4.y release, 5.4.301, currently has 1541 unfixed CVEs in it...)

thanks,

greg k-h

