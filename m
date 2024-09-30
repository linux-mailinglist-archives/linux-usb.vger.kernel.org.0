Return-Path: <linux-usb+bounces-15595-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E398A493
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 15:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41D3A1C23166
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 13:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A99F190674;
	Mon, 30 Sep 2024 13:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MsCBkIzj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16BF19049E
	for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2024 13:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727702346; cv=none; b=GQhJMWCAs+f3SRTQifdL+E7OmS4s6ybzFVEqqFDHKh0Ik5mRg4bhzUjLtalK2P0Xfaowyo8x1ZlY5GI/ciAwlpyUzQCatdd24XegTJnkDChEi8eRwA71tqxetJ2T5br/xNTVLZSPT/edwmDu5vSOz3hwX5/FXLdlg/NHnQX+W/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727702346; c=relaxed/simple;
	bh=hFuCtYwBu/1Qdw61marcwHu8i9uwDeekCGNm0+UL5OI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taFGnWNqiG9r6fU38ke2leC6JJK6d3mZI3vWXYWw/kyqKI09Q6kAwplElzjPoCNpmFb0R/3KKOZjc+pyjvZvZDChzhXnkAAiRkH4k2WYjGuKug7MrN7FO3GI8wO6u5jYnVrkOTTMcZOa29BT0BLe9BYLDLuq4yYW7IS6iXXJdlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MsCBkIzj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12DEC4CED2;
	Mon, 30 Sep 2024 13:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727702346;
	bh=hFuCtYwBu/1Qdw61marcwHu8i9uwDeekCGNm0+UL5OI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MsCBkIzj0sBcqzjkEOScdnMKnCEljkiyXKa6Lg3vre/Ydutgj8nlRlTPkgWaU6dsH
	 hx2tAvZL9Fu0Mc3YgARBt/uquTnvXSvjrOq6LkvHaZ2OrcYZF36IFiWNAdHdZZqNES
	 JwnIf//7NDHUYijvUy6zzoR6PF7XtR3fPtcYCwjg=
Date: Mon, 30 Sep 2024 15:19:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "mike.seo" <mikeseohyungjin@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] r8152: Add mac address pass-thru for lg laptops
Message-ID: <2024093038-tameness-vastness-9a76@gregkh>
References: <ZvpImQ_8jh5fyorl@mikeseo-0-1>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvpImQ_8jh5fyorl@mikeseo-0-1>

On Mon, Sep 30, 2024 at 03:43:37PM +0900, mike.seo wrote:
>  LG gram laptops support mac address pass-thru with usb lan adapter
> rtl8153b-2 devices using Realtek USB ethernet Vendor and Product IDs.
> ACPI objects of the gram laptops are safisfied to -AD.
> 
> Signed-off-by: mike.seo <mike.seo@lge.com>

Please use your name, not your email alias, for this.  It also does not
match your "From:" line, so that means we can't take it either way :(

thanks,

greg k-h

