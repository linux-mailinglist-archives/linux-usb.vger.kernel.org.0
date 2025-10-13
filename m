Return-Path: <linux-usb+bounces-29236-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8709CBD5149
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 18:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67505403640
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 16:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8928A3093AB;
	Mon, 13 Oct 2025 16:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zFpuzrVn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96B725D546
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 16:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760372069; cv=none; b=C+tzYUysYjS6pMq0yAqndV7AbaZ25E6rhoBw7AVPB/aBFOWOsoSUVVQ36yPcmAinIHlBYT5Ru8LEzpIQNNNlF7bgrMhb257QZ4gIdBVOMbHDnUyzSRd8zEDEOgXEm7M4gpvP+ZY8cO6B1HwuXgYxwhTxkAi7w1YF1NGN3XGsx0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760372069; c=relaxed/simple;
	bh=VBeyRidS+H0e+1y24wGE652oyB2RWBYogmJk6MqQERU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCj9kRfOC9lWi/gubucRRAmXHAqVXgL6rTxGSlElLEiQUJzTObrbvbdhjFPQSIizn7UdBNr4C6REdfcL3iDH/wP8W2tCabBxGgZXFYOmHtbKZaHHsHvMjCidlgX2wgSZ+wCdc60l8Qqh3QO2mqlyvLPPd471v0U9qi/6rMm+lro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zFpuzrVn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A01C4CEE7;
	Mon, 13 Oct 2025 16:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760372068;
	bh=VBeyRidS+H0e+1y24wGE652oyB2RWBYogmJk6MqQERU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zFpuzrVn2mqSblgiBiPbz+6qhjTVZobwc7Lc6AD4VDWmJ9/MHf12EKbwa9LCix1Lx
	 HkYQhiz5QNlMuM5K0LEd9ivC+qFJ1RV5PurSLbaGnen6nexOeRVBnodmSlDNXSCKoD
	 nIqmCaqgB4y+QypwgeZdYG97sjd2KlB4CPxKrrnY=
Date: Mon, 13 Oct 2025 18:14:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: Vojtech Pavlik <vojtech@suse.com>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: ttyACM versus ttyUSB
Message-ID: <2025101339-snowbound-capsule-fc4a@gregkh>
References: <CAMMLpeRU72CMxHdF-rO9y1Nvzj9nPnuQTOZWcCrM4fOJ1byacw@mail.gmail.com>
 <2025101243-ongoing-truce-3aa5@gregkh>
 <CAMMLpeRrO_E3_c98OB9XvpiGNjhTetrw2ucFyaq5BByPWh58SA@mail.gmail.com>
 <2025101238-mastiff-decibel-4b4f@gregkh>
 <CAMMLpeQvb1SJ=_kC+N1pGHkh36yrORJq+Der7fDzPj_urzefow@mail.gmail.com>
 <194258bf-e78c-46b8-8229-3b019f2b8ab0@suse.com>
 <aOzYzH01b39gjIDP@suse.com>
 <CAMMLpeTZxLCK2sh0qpHoFzHCrntc-vLSWqJJUjicS2xRR2AdNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMMLpeTZxLCK2sh0qpHoFzHCrntc-vLSWqJJUjicS2xRR2AdNw@mail.gmail.com>

On Mon, Oct 13, 2025 at 09:42:38AM -0600, Alex Henrie wrote:
> > Today, some USB-serial chips have the ACM protocol, so perhaps it would
> > make sense to merge the drivers, I certainly would not object.
> 
> It is definitely confusing to have to think about whether your USB
> serial device is going to appear as /dev/ttyUSB* or /dev/ttyACM*. On
> the other hand, if we renamed the ttyACM device nodes to ttyUSB to
> reflect the fact that ACM is just another USB serial protocol, how
> many things would that break? In general I like making things make
> sense, but I'm hesitant to be the one to pull the trigger.

Yeah, we can't really do that now, sorry.  Too many chances to break
userspace.

If you want to always get this right, just use the symlinks in
/dev/serial/ to find the proper device easier.

greg k-h

