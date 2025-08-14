Return-Path: <linux-usb+bounces-26867-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C5B26A51
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 17:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4C685E702A
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 14:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98EFE21422B;
	Thu, 14 Aug 2025 14:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tpRDtUF9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E539212547
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755183208; cv=none; b=KfNuyO1He8SC32RsUXTVL0kl3+19/qcAOYWDS/i8m/PzL7UXUSPgZLrfqK21P9sew5uKHwO/3Q12g+zUPGARVF3x9+it3YrNHL+n3iqAw9PcBNmzxA4y8Mt0goGkmc6yE5eC3B5Rd8x7/6IWaRWyBbBRfONrqWcHk405kvbG/Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755183208; c=relaxed/simple;
	bh=6nS/Q4mJqtEt/dUXMxEmUh2rqqvAhwysYKSoBWxqOcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsvT94knuGiCDAk9x+Iw3Vfj4RAZFojb9TxpgHDWr9+wu4R9XuPhhOH3tvuFNz3yYTDVRfFA7o1f2vapDAlmMFYZ2rQ2+MoWumY75t6BkT0pOmoEHAOX7Sc8h3CHJ10dcgHg3T7rEOd+Xj6oElisTnaGJqxkqZ9sd6DfVCS60NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tpRDtUF9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0655C4CEED;
	Thu, 14 Aug 2025 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755183207;
	bh=6nS/Q4mJqtEt/dUXMxEmUh2rqqvAhwysYKSoBWxqOcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpRDtUF94dnku/lcJ7hXCz+xZZBYPE58A5zcb7u2Tja+B5EqiR5xe3mf9YPzf5UHL
	 o9EXY9L8FMd1AZgE7nVJ/WytSwlAo4Gp8BHILP64u1VDMU8aHNSZNZgW2SDHIdETKR
	 XIPR6XF8+thsd+Ewq/bbtRJ6D0KCGL+byh7gR+eo=
Date: Thu, 14 Aug 2025 16:53:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Raub Camaioni <raubcameo@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
Message-ID: <2025081436-dial-serpent-d87f@gregkh>
References: <20250814134609.599023-1-raubcameo@gmail.com>
 <2025081421-proponent-tanned-4a66@gregkh>
 <CAAGxeQdueNdCVt87tKZat74u8op2YKmy5VaqYpkQww0HYNNnvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAGxeQdueNdCVt87tKZat74u8op2YKmy5VaqYpkQww0HYNNnvA@mail.gmail.com>

On Thu, Aug 14, 2025 at 10:28:25AM -0400, Raub Camaioni wrote:
> Hello Greg,
> 
> Thanks for your patience.

Oops, you top-posted AND sent html email, which the mailing list
rejected :(

> I figured you wanted me to resubmit with the "from" and "sign off" to be
> identical.

Yes please, but then document that as a v2 patch like our documentation
asks to.

> Both the changes are identical (with the whitespace error contained)
> 
> I can resubmit with the white space correction if desired?

I can't take the change as-is, so yes :)

Please send a v3.

thanks,

greg k-h

