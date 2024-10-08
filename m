Return-Path: <linux-usb+bounces-15841-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1289947C7
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 13:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A91EC1F25B4F
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 11:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681B31D61B5;
	Tue,  8 Oct 2024 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KALksBE+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11351CF297
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388409; cv=none; b=nsvpVS3iH9/7gmAZPKqnoG897prK6goX+J4P4Om/tM6i8U5VpUSQ6GjrdLVfDquXTXD2Y3x3FY2cloJaWMaYlSH9feISWnEXhHvzZq3kKMYFv0sWiqGTLN4V4dC3w6OuNRQkehbI5V/3z+Ixl+ClrrC7DgP3vqNUMECMcE58m4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388409; c=relaxed/simple;
	bh=IkCxyz5RrL1l9KUkWSlf2GMrb+2qmfMiwLWLw7C+jq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfZsw008gKVFgk2KMvfv6jx7vBcBATLFX8ioQyEaSC3cdKoSE5VXKCtjbz2XhjstpxBkPi/1iWoLcSNdHOqkwmMM+yvMXbf7EEx6NRSFzO0yoCDzQChZDTiyjyKmryX7KEFTNnpi1EJKvRJBfKzbVC7X6KlouLg9BtI2UmslFu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KALksBE+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEF3C4CEC7;
	Tue,  8 Oct 2024 11:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728388409;
	bh=IkCxyz5RrL1l9KUkWSlf2GMrb+2qmfMiwLWLw7C+jq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KALksBE+lf59Bez0aqcP3cfJmlyBpw479Yu7uBEd28uDmpGTtrYPHauRDrSGo2Cso
	 ynFXViu4ckli4Kh8QsN1G7nhqAypgpOgADo3NXKJ5esHbxT0bh/BNZUpWV4mOv3TNA
	 /XuJV0N1dd8V0+a8D76LscIiz+Ell1foqnVqAlTU=
Date: Tue, 8 Oct 2024 13:53:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 219362] New: USB SATA does not correctly shutdown the SSD
 upon poweroff causing data loss
Message-ID: <2024100853-portfolio-excitable-ed78@gregkh>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>

On Tue, Oct 08, 2024 at 11:43:02AM +0000, bugzilla-daemon@kernel.org wrote:
> I have SATA SSD drive connected via TUSB9261 converter. Eventualy i experience
> filesystem inconsistency when i repeatedly shutdown the device like this:
> 
> echo s > /proc/sysrq-trigger;
> echo u > /proc/sysrq-trigger;
> echo o > /proc/sysrq-trigger;

Don't do that, you will end up with an unstable system.  Please always
shutdown like normal.

> Same problem does not occur when i do this:
> 
> echo s > /proc/sysrq-trigger;
> echo u > /proc/sysrq-trigger;
> for i in /sys/block/*/device/delete; do echo 1 > "$i"; done;
> echo o > /proc/sysrq-trigger;

Yes, that is because you are shutting down things in the proper order,
like a normal shutdown will do.

sysrq is not for a normal shutdown, again, do not do that and expect to
have data saved properly.

good luck!

greg k-h

