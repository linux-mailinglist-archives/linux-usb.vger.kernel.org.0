Return-Path: <linux-usb+bounces-20805-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80545A3B2B2
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 08:42:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17C2F1898495
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 07:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3E81C5D72;
	Wed, 19 Feb 2025 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IxokOxz0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C051C4A10
	for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 07:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739950918; cv=none; b=JPPQL3WcXSbOveRst7O7lX1A3J+0aV4pmYKcpDZEdClYjU+kWxKiTVDu+aaad0LeVWkfBpULpDFcotwLPqUUWxUzQDBKtgCBYZ0t11nEGglKUneoLfrpd0Xtc0A2rp5X7tDGCCjdwDAU9R+5pfehn82vPXHQFV1VP4u7jC5XqCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739950918; c=relaxed/simple;
	bh=lxKL/9XNaxy0drZJ0D8wSkuGhfTfmUG26oVlmhxr7Is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHA6Lz952rpQbqO2dRkc9qrmC/9Do4It4KtHEg7jssN7yg3zI12WaySuLE+BiIRnsnkwGKNJ2RfXzk8D9FjflP1Dul79nBj2mNoqYiSAti2szEcOnj6HGzp0D5fiBuO84UNSVe2WUg6rNhMpPhtYDqL1+aWZjvoHV/waEn7KuZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IxokOxz0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA05C4CED1;
	Wed, 19 Feb 2025 07:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739950917;
	bh=lxKL/9XNaxy0drZJ0D8wSkuGhfTfmUG26oVlmhxr7Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IxokOxz0SaIhltRcBporSl1mhVnPh4npTdn3WxO2BM8xMAd6vkbiMwYDvG74YBBr4
	 jS1T6WB/X0qCILHHzlJt5RvLM0hJq5gXspz7yo0nRXIsqjXTxDToSyd8WJmznPnZK5
	 9+ZR47PwGiwgw31K1i3UESUU/u6KVgSXI1kyiVQk=
Date: Wed, 19 Feb 2025 08:41:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Philipp Leskovitz <philipp.leskovitz@secunet.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: use-after-free with Lenovo Ultra Docking Station
Message-ID: <2025021908-aware-babbling-ec8a@gregkh>
References: <76af1506-3425-4d6a-b388-3304823fdd82@secunet.com>
 <2025021853-stained-scared-9e60@gregkh>
 <e48ff1fe-4e44-41b8-861d-cff2b9b509bd@secunet.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e48ff1fe-4e44-41b8-861d-cff2b9b509bd@secunet.com>

On Wed, Feb 19, 2025 at 08:35:37AM +0100, Philipp Leskovitz wrote:
> Hello Greg,
> 
> Thank you for your message. With kernel 6.13.0 I get a different error message when I click the notebook Lenovo T490 into or out of the docking station (ThinkPad Ultra Docking Station, Type 40AJ).
> 
> <4>[    0.568971] ------------[ cut here ]------------
> <2>[    0.568973] kernel BUG at drivers/pci/setup-bus.c:2156!

Great!  Please send this information to the developers on the linux-pci
mailing list and they should be able to help you out.  Something is
going wrong when the pci bus lists are being allocated for this system.

thanks,

greg k-h

