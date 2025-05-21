Return-Path: <linux-usb+bounces-24192-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 210AFABF90C
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 17:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E9FF188BDDA
	for <lists+linux-usb@lfdr.de>; Wed, 21 May 2025 15:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095C21A5B94;
	Wed, 21 May 2025 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OtpJECwp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8363F70825
	for <linux-usb@vger.kernel.org>; Wed, 21 May 2025 15:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840749; cv=none; b=qjiAb5OMJuJ3ryIDfF5N+GrRnTdw90cs3l/BX7uK2DWbh22CAbN7zXH4XoRO5TGwJZnKSGXs6T1WKPvw4NZapHziWSoGlsWrjVFRZ2fGhbD2LaQsXPuVVXBu11il2v00WLjKWe2jL9CTV3v8+ktjAZaMSHI9au5AhXMXhYgJm/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840749; c=relaxed/simple;
	bh=Q9siX8LLqnoj/BFs9I9w223bUrDq9SEmBePRUhwhtKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2GK1u84G6BnSvuKi+BL1SdYaLWA5xmg1sAUHtC50OYH1CHe6HCC2Huqw7oQOKgtW8Shj43VGoKGQYm7svYYKdlxIb9H4eepJ89g37bAIaG7cegYKBOFrMhkEhmG6jl38/bl/dBl+DY53owcB4zfWS9XsiE9AanXglw+vbQRZHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OtpJECwp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056A9C4CEE4;
	Wed, 21 May 2025 15:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747840749;
	bh=Q9siX8LLqnoj/BFs9I9w223bUrDq9SEmBePRUhwhtKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtpJECwpj0NtXtV1oQ0cQnPh1G5X2nrHIqyEfa+LqUahzhRGByNs05QHlwTFlUaHT
	 HvN3wuseL3YxsPmbf0Rd3UC8Juy3E/Ui/IJtR2FifuNNgI9197MUnYRi/MRMSdRbdp
	 WJ7e/W2ZrwmLgQZ4cupxdOYzi16db/cSxRuTfhz28ccbIwcym2BCIcwY/+17AUc1Bv
	 u7dFF99/yH1fkMK2ZuDp2gKes9TkmMuQDnFYoI2I7vm6JV2mr6ivw2v7URqLtmsOHK
	 aAHMpKTBnEn6q7Ldc/XtjXQHkWHJtMTH4UhsXxF4kR7RjXfqvYVDOdV6AJt5l7Ynvl
	 fMC32Zr6KqZtw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uHlDm-000000001JI-0Rr9;
	Wed, 21 May 2025 17:19:06 +0200
Date: Wed, 21 May 2025 17:19:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Charles Yeh <charlesyeh522@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	charles-yeh@prolific.com.tw, joy-yeh@prolific.com.tw
Subject: Re: [PATCH] Add Proliic new chip: PL2303GC-Q20 & PL2303GT-2AB
Message-ID: <aC3u6uCMin_0SXWQ@hovoldconsulting.com>
References: <20250521132354.1104-1-charlesyeh522@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521132354.1104-1-charlesyeh522@gmail.com>

Hi Charles,

On Wed, May 21, 2025 at 09:23:54PM +0800, Charles Yeh wrote:
> Add new bcd(0x905) to support PL2303GT-2AB (TYPE_HXN)
> Add new bcd(0x1005) to support PL2303Gc-Q20 (TYPE_HXN)
> 
> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>

Please remember to use the common commit summary prefix for this driver.
I changed the summary to:

	USB: serial: pl2303: a new chip PL2303GC-Q20 and PL2303GT-2AB

when applying (with CC stable added).

Johan

