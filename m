Return-Path: <linux-usb+bounces-31547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A1CC7E12
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 14:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 052FB30BEA46
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 13:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0ED3659F4;
	Wed, 17 Dec 2025 13:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a2GkAmSe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0703385AA;
	Wed, 17 Dec 2025 13:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978510; cv=none; b=VduxN73YbqCMsDaq3bG5ZEBAMP2NHM9pEu0Ye4QVWBHavnjuPUCzGVK58epIKuKLBc36F9ElnFUN2msDDAXtim+lIhsdAvENEPggFHd15EQIL/YL5djNfrvT0Y1mzXoHIL5uAsmhSzxQLeDVzVCpJgkQVXzenwOCXPvuWEwRnWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978510; c=relaxed/simple;
	bh=3JVKRm3qp4wihBmBWmB8QpaJf864GacxatKGeaxtOUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaCtTaVEBf6cPTvYM3oCoG+LFi5rtg4BoBLJUwVRaOmHHf3/RXWmxkX2QmvnnfjH19KVqV/kqyyeyhfmqfuzLnUZ259X6jlymNNi+WYzgoVM7lof6BwCwyadSc0tSiglWGpmnUVNwV5SxEJdoXZvq/dYy/27Zw6hEoM12oOokmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a2GkAmSe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B4DC4CEF5;
	Wed, 17 Dec 2025 13:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765978509;
	bh=3JVKRm3qp4wihBmBWmB8QpaJf864GacxatKGeaxtOUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a2GkAmSe7eIsGg/v1Ai9BYguOXpAWvi3YnSg0fWayofR0pyUlRSOjRjGfTqkQ4uBW
	 brPrWkDV3KBIowGUpp/dTmKANjsYttln9NwHM5W8RkKh3UnEjnl3mKqyOY9wT/IcTv
	 hfrhx93m3kfv0hagEuB+btJ8u0mXanMom8OwV25Y=
Date: Wed, 17 Dec 2025 14:35:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Akash M <akash.m5@samsung.com>, oxffffaa@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH v1] usb: gadget: f_fs: trim extra bytes from USB req
Message-ID: <2025121718-paltry-caress-43fd@gregkh>
References: <20251209134412.577797-1-avkrasnov@salutedevices.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209134412.577797-1-avkrasnov@salutedevices.com>

On Tue, Dec 09, 2025 at 04:44:11PM +0300, Arseniy Krasnov wrote:
> In '__ffs_epfile_read_data()' number of bytes to copy to user iter is
> returned by USB driver in field 'actual' of structure 'usb_request'
> (see 'ffs_epfile_io_complete()'). Looks like some buggy driver may
> return value larger than actual size of kernel buffer of such USB
> request. This leads to the following crash (produced on 'dwc2' USB
> driver). To prevent this, let's add extra check, which trims reported
> request length.

Why not fix the broken driver instead?  That would resolve this
properly, and not force the gadget code to work around obviously-broken
kernel code.

We try to fix bugs at the root, not paper over them elsewhere.

So what driver is causing this?

thanks,

greg k-h

