Return-Path: <linux-usb+bounces-32427-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B756D3006B
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 12:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40DBD30F1598
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 10:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDF3361DC9;
	Fri, 16 Jan 2026 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qfLRYYbY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DF1352FB6;
	Fri, 16 Jan 2026 10:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768561114; cv=none; b=IMGKxmSwJTKqSFUJMH7obcxCb6as72sU09KrVh4hqzVQ/aJSnhypIpijziUs4rnTMEAc8LitsZKjktsTTPU2bg2HfGaEPWbuHMFGdOGwPgqPgAiU6LKvn1inhl1uvHSBO6iy4ry96F9GvjYcqU64wXmvOqjJvneKYVm/vo7Yehc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768561114; c=relaxed/simple;
	bh=719hjxI/AzrhH/MIS3VLtxSyHUqZcNJlSAidUSUsI10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1V19Yb2rPsZpH13y/vO6ZGMxDTgXQ0f6yeEy1PtrUPBxXHvzkyJ/WSDpHP9iM5OEDAKt/uMO6GNOyD7PIqUUygbl9HLNVdS9suJ49RxcTOYWcwOwu2TV4n0BbI1FKGwgu78b0AaKKdcnB9/1OUxhEhnOPhC5cJA43xe3gLUK4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qfLRYYbY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47960C116C6;
	Fri, 16 Jan 2026 10:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768561113;
	bh=719hjxI/AzrhH/MIS3VLtxSyHUqZcNJlSAidUSUsI10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qfLRYYbYbDMSY900B3HzHPvy8kLanOO9WfJzEdOm49g5xMuHff6S/5VNTN6g73kED
	 taBVlcHIaJzZe9zA2s4S1N8Xg6dQgzlLW8pWlfO8hTxHDNX2eFKQniaGCCBPf+5NXz
	 4ZLEHtrL9s1LqtjPBQ7R0Ur8vD11T2z8D/bPHB+U=
Date: Fri, 16 Jan 2026 11:58:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial fixes for 6.19-rc6
Message-ID: <2026011616-hurt-oak-94f9@gregkh>
References: <aWoQtivAkG0Dt2pn@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWoQtivAkG0Dt2pn@hovoldconsulting.com>

On Fri, Jan 16, 2026 at 11:19:34AM +0100, Johan Hovold wrote:
> The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da:
> 
>   Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.19-rc6

Pulled and pushed out, thanks.

greg k-h

