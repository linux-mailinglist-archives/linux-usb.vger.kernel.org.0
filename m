Return-Path: <linux-usb+bounces-31681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF57CD689D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 16:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACA7E304F12F
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 15:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E5B32D431;
	Mon, 22 Dec 2025 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="StU+x9Sd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D47532D0E1
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 15:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766417601; cv=none; b=JuIb5UGc4Pzfz/h6E6WPJG00YPd5Gq3EdaFrw9EDaqU8FIjd8qvZooiG8iwAtBjPfY9S/RxtKRNAB1PXl9VAqM2tLsfP9E9iq1JpEIZTCknqkxJnvRBjLZGjG4m8hPy5Xb4kX3fyYmchJXaB3ybnGO4KbdRlGSf+iDOCGS0ciXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766417601; c=relaxed/simple;
	bh=zNZ/5lk12wryEhTchqArvcx97LowI/LmhgVDNv/k1fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBuL6ykzaEzKRVoRwbfevgc2knHupKE+ZVPG7I5NoVKXJ90FYdAy6PcTBc5M4jELE91YFtZKDYwbbhfTCqy+p+n13pPisB3qomemBd1+6GFbW3oDY3WFhxkRqLettIYUN933wep9REzzKbNZJVJ9vTmoHaBZv0+CccXV8Q8UHn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=StU+x9Sd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10688C19422;
	Mon, 22 Dec 2025 15:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766417601;
	bh=zNZ/5lk12wryEhTchqArvcx97LowI/LmhgVDNv/k1fA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=StU+x9SdI2sfjgqk9X1JvD/SiGvpBhvbmcp1AUi7S29q11FXSnS0ylFfTBYEQ9+n6
	 RfLUT1GX+iO08D76GsTFHjVNdJp/inB9kym71xkv13iPFnJi+lLwWwUGEjlLlTmXLx
	 6113uIq6am81Q6LK0XIKYXOhbAjn3mW5hdHnzb4EwLEi7oNEbqzvkXQ0wRPGAlTLK2
	 px7i8iYwdsHJpJbO7LL8qFTlArhxNopdv87sjWkktnZcX9PZQgASYdujCjL+XJlHOx
	 zIIhfFgIQ9tkoPk6U/tyaTl1XojbF0ohBan9HghmVoeeKZElb/9k2+j/BsPQukGxSv
	 0OcfFQWNhnzVA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vXhuY-000000000ul-3ui9;
	Mon, 22 Dec 2025 16:33:26 +0100
Date: Mon, 22 Dec 2025 16:33:26 +0100
From: Johan Hovold <johan@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: ucsi oops on system resume (6.19-rc1)
Message-ID: <aUlkxpe_FP_l9-E4@hovoldconsulting.com>
References: <ac4m5qtjpnmx336r5astuxkvtqfjhlt6674odmtecsn2e6sqja@hndb7jdcqsp3>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac4m5qtjpnmx336r5astuxkvtqfjhlt6674odmtecsn2e6sqja@hndb7jdcqsp3>

On Wed, Dec 17, 2025 at 11:38:25AM +0000, Pedro Falcato wrote:
> as usual I'm running the -rc1 for this cycle. Found a nice fun oops in ucsi
> code that brought the laptop to its knees:

> I have only reproduced it once (now), but it may be reproducible. I had a USB-C
> device plugged in before suspend, then on resume it wasn't there anymore.
> Perhaps that was it?

The culprit is the new ucsi buffer management code which completely
ignores concurrency. I hit a NULL deref on every other boot of the
Lenovo ThinkPad X13s.

This fix for now is to revert the broken code:

	https://lore.kernel.org/lkml/20251222152204.2846-1-johan@kernel.org/

Johan

