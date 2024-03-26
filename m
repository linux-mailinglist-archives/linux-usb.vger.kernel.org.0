Return-Path: <linux-usb+bounces-8368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A5788BD53
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 10:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1A7B1F3E4D5
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 09:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51F3482E2;
	Tue, 26 Mar 2024 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EDrJR779"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C164481BA
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711444212; cv=none; b=Ahdz8xV6FVucmvoPKEHjJWWcNJcTaeoZeSbW44+MnOMxvN3BsJMIijFDuhKDfjCu/aRfWcv0O11i38ZRMNoByJ98X39zTdrMb18izTjl3QlSodtTCvJ+gS/6t5Q/3CjqG8o0C34knZgqgRH9yJRYE3lU4gJlyxSsjqTnPaCp8nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711444212; c=relaxed/simple;
	bh=eZZF7KwD8vry5G4OpK5/jAzlu4WDNQnbiIYtQbHDgyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J69/MP9Rn9RqN/z9WyV64fezupdYniSbnQdy3Px+qHObb4wQ14d76VZsIKIx6HXhltA5Uy5xmsKZI+2A7iN7SfePolKHFpzOyEfTcrOIm8jyCP4tUJ1DYY3JOj7q0izWxeP6xSzDTebeB191GSNq/1BKFNTrGAfprJXyL1MEvHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EDrJR779; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9900AC433C7;
	Tue, 26 Mar 2024 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711444212;
	bh=eZZF7KwD8vry5G4OpK5/jAzlu4WDNQnbiIYtQbHDgyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EDrJR779Z4nVBFkAKGjVxR87efgHvK04rZrMHRZRHC497ieqifZEmdX08ZEmf1jVp
	 Jplr3eFWUFh37FtQ3SWHGVwHiwUqxMh3iaCRKuiKgT6PcG6vtCwbRG3HNWP4WXLevh
	 DMhOUahx8wdmS15970nAyUFTklLkQOYkO/B9jaMI=
Date: Tue, 26 Mar 2024 10:10:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: linux-parport@lists.infradead.org, linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com, johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us, hkzlabnet@gmail.com,
	reboots@g-cipher.net, mike@trausch.us
Subject: Re: [PATCH 2/7] usb: serial: mos7720: don't advertise
 PARPORT_MODE_PCSPP
Message-ID: <2024032652-aerospace-crabmeat-8424@gregkh>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
 <20240312055350.205878-2-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312055350.205878-2-alexhenrie24@gmail.com>

On Mon, Mar 11, 2024 at 11:50:27PM -0600, Alex Henrie wrote:
> Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
> ---
>  drivers/usb/serial/mos7720.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

For obvious reasons I can't take patches without any changelog text,
sorry.

greg k-h

