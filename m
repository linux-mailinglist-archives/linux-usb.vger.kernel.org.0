Return-Path: <linux-usb+bounces-32521-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6671D3BEF8
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 07:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5D7AE36093D
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 06:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D659369984;
	Tue, 20 Jan 2026 06:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DwZ0pvo9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA5932B989;
	Tue, 20 Jan 2026 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768889219; cv=none; b=AUmEcPyuhr877++k/29XJYjNSKVg83w6S8XxzdhL+rDaZlXQ7KiH+oa27M7DkYVzVS4YyjVnGz6ukefB3UvHAxdaYAPfuBnk6R4iDPMmfa8PJyGeJALQVMz/9YPYaC8SBVbpSZmJmIz9rVXbfguGCkv60yJ0R8ev9g6lYZiUNG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768889219; c=relaxed/simple;
	bh=AW+aE37obwp3A1GgOzZiGMpco2DQYMgZHyi0+bPmQMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gus+h6MXmWlwVKX3MZsiEr0p7U0d7nX4unC00bc0FRvhuqZUtTVYjq0jsQ0JKJADec/5MbTT39qtkwGDEeM7NsyeIT1g8H2ZjvKkXgJt/llhaMas0+1cNR7TqogIEpZyiNQWgT+UYGv9xXm+uWajf10eW9v+jLAysabb1ntDUpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DwZ0pvo9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1294AC16AAE;
	Tue, 20 Jan 2026 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768889218;
	bh=AW+aE37obwp3A1GgOzZiGMpco2DQYMgZHyi0+bPmQMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DwZ0pvo9Z+DCbBKCfNMiyZb4T0yM/92bF2Ntf8mksTHGF3Rt0ZT992h+lyt6ArZAQ
	 sVzeeGLYB5FPRwYnj6ZNdQg298QDZIpi7kwFnNrNb3oopmCv6lkVzRhO3RxRK1t14J
	 abPnz2sSdINM+4oXf2ObJXG7VP2FOud9ER9j2oaE=
Date: Tue, 20 Jan 2026 07:06:54 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: vkoul@kernel.org, conor@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] Add USB support for Canaan K230
Message-ID: <2026012036-refuse-reply-a363@gregkh>
References: <20260119093836.316007-1-jiayu.riscv@isrc.iscas.ac.cn>
 <aW5WyizgDyQJaKLQ@duge-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW5WyizgDyQJaKLQ@duge-virtual-machine>

On Tue, Jan 20, 2026 at 12:07:38AM +0800, Jiayu Du wrote:
> On Mon, Jan 19, 2026 at 05:38:31PM +0800, Jiayu Du wrote:
> 
> This is series is the RESEND of the series here[1]. I resend it
> because I mistakenly sent the wrong USBPHY driver code.
> 
> Link: https://lore.kernel.org/all/20260119093836.316007-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
> ]
> 

I have no idea which is which anymore, sorry.  Please send out a v4 so
we know which to look at.

confused,

greg k-h

