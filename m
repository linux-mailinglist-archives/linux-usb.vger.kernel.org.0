Return-Path: <linux-usb+bounces-30938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C709C88646
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 08:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9BD054ECF73
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 07:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B10B31BC8F;
	Wed, 26 Nov 2025 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2UKggECG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717C431B839
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764141329; cv=none; b=hGt0Fsqw1vsEprVP83DhQMlUjkja/4iFK3TUAPwa9ebe4nR0Zwzn/7iUTy8YzJq5uLWzo+IpgOuhlyNhr9nSABAuodqaDpLo2YmQ+IRcwAwT+nKUmHZp9GP8qEt0M+jYmEyZoNhbw/VLtyfxQCy2UUEKVoej2yH09j4fEGtRZrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764141329; c=relaxed/simple;
	bh=HHhe77DhwyGWeieCtZky7VGJN2ycEXKBhALqnfvv5Gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtfksJRZ1DQynPyhT3EEXVLBGnBnVoZeSyuiEMK+leXih9m8xRzHcVQXyIP/YkQgf7txyXLHzyMmCobBR6ajojqlPrZQH2zBVDVVJ/SCFHx7FDBkbyNV7vTSgO8Lqv00LqxYxlhvdrTKd7jXFsIsn2CZORBhP1kM3f5slQl+TIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2UKggECG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFCBC113D0;
	Wed, 26 Nov 2025 07:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764141329;
	bh=HHhe77DhwyGWeieCtZky7VGJN2ycEXKBhALqnfvv5Gw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2UKggECG7eRiTwcnqe7UzZHI6LOjTSz+3e8Cms7tJrfKA+xITNJFX2nXvHJFcLQ2t
	 mc956YaIoTc3nLKSDO3ll5HdCiAt1lqZ48TgtqrpFFIs91i0C48xkwu9tUf49S4E1k
	 vEVLTtpoem9ttMGpvbH4ru9TaZGh+0994nS98hLU=
Date: Wed, 26 Nov 2025 08:15:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci: dbgtty: fix device unregister: fixup typo
Message-ID: <2025112616-gestate-disperser-c055@gregkh>
References: <20251125142532.2550612-1-ukaszb@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251125142532.2550612-1-ukaszb@google.com>

On Tue, Nov 25, 2025 at 02:25:31PM +0000, Łukasz Bartosik wrote:
> From: Łukasz Bartosik <ukaszb@chromium.org>
> 
> When DbC is disconnected then xhci_dbc_tty_unregister_device()
> is called. However if there is any user space process blocked
> on write to DbC terminal device then it will never be signalled
> and thus stay blocked indefinitely.
> 
> This fix adds a tty_vhangup() call in xhci_dbc_tty_unregister_device().
> The tty_vhangup() wakes up any blocked writers and causes subsequent
> write attempts to DbC terminal device to fail.
> 
> Fixes: dfba2174dc42 ("usb: xhci: Add DbC support in xHCI driver")
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> Link: https://patch.msgid.link/20251119212910.1245694-1-ukaszb@google.com
> 
> Fix typo indifinitely->indefinitely
> 
> --
> 2.52.0.460.gd25c4c69ec-goog
> 

I see no patch here :(

