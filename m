Return-Path: <linux-usb+bounces-23294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C61CA963EA
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 11:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41876188C56D
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 09:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAE71EFF8D;
	Tue, 22 Apr 2025 09:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W4IBtDI6"
X-Original-To: linux-usb@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1399476
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 09:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745313149; cv=none; b=RONl+3xtEIZJKHGkEDrkTDQ0wnv2lpYV3wTrRV9qvV7XjbJpq83qpy6GirF9EL5p2p7p1k5HEWKy598pWcJizJOmp2o50x1nWJuQhcU7YKdOG9e272KEv6RWaKXaQTZO9HPZIpVs7PADMzfp5soicHhdCbDfg5t97pEhP+QV+UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745313149; c=relaxed/simple;
	bh=bQ7rJXa8I5vGcBz0putGDcL88Lrgoq6U0bD6AU0H/k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoK0R6lvU2dpA8cdlEsHwDD33S5K7crg7iWcT0gGjqgau0K/hW38bkR6hulYWTb5Y3dIJTz85Njo47ltJWNOvHuaKbb8UwNSFg9In8c7JvNvYKuPOblgKFYggvRKQByC3okDCKCpnddNyNpSI0Tz2X33hJQECCaLlDfmLSkgM7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W4IBtDI6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YaCmKJkJpIfCrNBse2f9NA8rGjAA6dTaAoWys68Zq10=; b=W4IBtDI6rJA6ACYTJ3fIsHPZZR
	7Yv7jpwuN/NdTjTzLFhOJLFot4ytVYDZ/1JP3z/+LmVn6hyqYtOBZvzKNYczF80SKTS8TBSk6I+qt
	Fpmkx0vt4pAnAkSy8X5MUKtQYjZivHH/YRTYbRFjQPX9YWy3iU8eSeO2YXupAVxPcw94jqZIW58Gq
	XkxjsPo4EJEx0/HcdEyVrOFNhd52OiEi6C3+gKhP+jxWQG6MKp3hwSlQKpHw8Au7Soxfwi2uXWmgr
	Lq9gwBZlZ7l+rCj9j/7HRgjNq9j8YIevHPFARm8QDshzf27mQo/7CaRgPh7nX7yL/03WBLIckQR3v
	q3zK6RFw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u79fz-0000000BAc0-0Pkl;
	Tue, 22 Apr 2025 09:12:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4E18A3003C4; Tue, 22 Apr 2025 11:12:22 +0200 (CEST)
Date: Tue, 22 Apr 2025 11:12:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: andreas.noever@gmail.com, michael.jamet@intel.com, westeri@kernel.org,
	YehezkelShB@gmail.com, linux-usb@vger.kernel.org
Subject: Re: Thunderbolt display chaining
Message-ID: <20250422091222.GB14170@noisy.programming.kicks-ass.net>
References: <20250421163549.GA40412@noisy.programming.kicks-ass.net>
 <20250422050501.GF88033@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422050501.GF88033@black.fi.intel.com>

On Tue, Apr 22, 2025 at 08:05:01AM +0300, Mika Westerberg wrote:

> You can remedy this by not daisy chaining if you have multiple ports:
> 
>   TGL <-> M
>    ^
>    |
>    v
>    M
> 
> Let me know if you need more information.

Ah, thanks. I tried googling things but stuff like this just wasn't easy
to find.

Yes, this seems to work. I can even drive both panels at 120Hz this way.

Now I've got to go order a second long TB cable :-)

Thanks!

