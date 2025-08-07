Return-Path: <linux-usb+bounces-26591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C62B1DB4A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 18:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFAB6188BEC1
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 16:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2AFE26D4E8;
	Thu,  7 Aug 2025 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Tp7yCSZD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE9F26CE14
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582678; cv=none; b=GUtrLj1KIc5ENZvpTS6lnM4gx7FcwK2o6aeCRsM7FmXBrwoqOSCO3ZirIn7+XHgDJIZdhkduxbJRYz9LSVcD/5lSBh2Q7zbnxNyRRELvIYRBtoAMd+ICxC4NoKRSwv2kdYyewAvsiBUPQazq3CtRQwgeepDU87egcP7IXDy7sGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582678; c=relaxed/simple;
	bh=7KIA64YDR2C/aILcbqWUWWUG2bk4V7dOWcjZD0zj8jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=des7AM72jyK0j5SibMeZWpVwFOXnDKPkPhqbm38VLpkp9l9Ygj6z16OkF2x2sSOODSNw4iI1BoR1aUfDUvMqFgxU/K0sbMF8mljnkNX1zlD3uKo1eKSvPegvMgEZyJBWh5XjHkQHDYNcByJxMkwuo2RAyaCIni5Ymp9k+zTWOZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Tp7yCSZD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139D9C4CEEB;
	Thu,  7 Aug 2025 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1754582674;
	bh=7KIA64YDR2C/aILcbqWUWWUG2bk4V7dOWcjZD0zj8jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tp7yCSZD3v1gArt3RJK6NgeOpIMJ6DDOu2bTFtOmuAfKA2wuQqhPKNw9UNOlmo6Ud
	 vP2HkS3AkZAjV7GJP8ILcGPc6FNKUwCE5kSssxXwJb0nl3qpPRrfV9ioGAWEUfs2+v
	 VUs9sbPbiEsq+VvNVBJY9jyp/OCLezHqeOgbc8i0=
Date: Thu, 7 Aug 2025 17:04:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 220422] New: USB: Misdecoded serial number from Dymo Twin
 Turbo (0922:0018) breaks multi-device support in CUPS
Message-ID: <2025080747-despise-ferry-1da5@gregkh>
References: <bug-220422-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-220422-208809@https.bugzilla.kernel.org/>

On Thu, Aug 07, 2025 at 01:46:44AM +0000, bugzilla-daemon@kernel.org wrote:
> **Expected Behavior:**
> The kernel should decode USB string descriptors defensively, including recovery
> from common misalignment issues in UTF-16LE encoding. Devices that return
> malformed descriptors should still expose unique serial numbers if the raw data
> permits recovery.

The device should be fixed instead, how did this device pass the USB-IF
testing framework?

thanks,

greg k-h

