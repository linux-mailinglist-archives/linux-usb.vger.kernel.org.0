Return-Path: <linux-usb+bounces-31749-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D93A0CDBDB3
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 10:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33652300A9C5
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 09:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28BA73370F7;
	Wed, 24 Dec 2025 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fVo/p+8H"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8D3331206;
	Wed, 24 Dec 2025 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569554; cv=none; b=emAsJQlIZ/XsCXopoGbKGaElCRmRC0e5BZQH/mdhs+V1eYUsJzzKSauWmUcugsAW9JY9lhE4Vh5B9dyuXn6W0VIrNjZZHxWvQRgWhWMwEmCgfXamqFSz8WiiCxQtQmKpGPCVR/aQUjxaLG/GyMujRzx2bCagilQvYp7ByJBKyB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569554; c=relaxed/simple;
	bh=pIFufGFEw2z5bw8d75prpTW/aSvIt3K0FFqkEDa8zM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0fRlu3L1uyh4KBGjLT3+gkVZtab156PgjvPpi8pJjTv86cycZlcZiFjdiHzJHkhb6MU+BPLkxbQBG7JnVY9pE0+XGepPMVXQ0dCNJsgkOlWcaw7xsg+UyINc9FXMoMzRUxoxAGHCNASM633oUkIDdh4HaTDZ+y/RkRUoo6EuAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fVo/p+8H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45FAAC4CEFB;
	Wed, 24 Dec 2025 09:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766569553;
	bh=pIFufGFEw2z5bw8d75prpTW/aSvIt3K0FFqkEDa8zM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fVo/p+8HnXhKA6j6aJZc+G9bpWCEPdvjChDRlSsJ99QQy0252dQJauiQ0SnG9ZA6z
	 jEkKeZ3+lCuYcRQTF/JN/a32J26ejsVmZB6aQIhs20irBq/1GgBBxE+WkNzgzOB1Ey
	 9BQq8ekiKAycwjEZBWbL8EsGuxiEAoChoOW6zsH0=
Date: Wed, 24 Dec 2025 10:45:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: peter.chen@kernel.org, pawell@cadence.com, rogerq@kernel.org,
	felipe.balbi@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: fix a null pointer dereference in
 cdns3_gadget_ep_queue()
Message-ID: <2025122422-factoid-oat-aea0@gregkh>
References: <20251224092935.1574571-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224092935.1574571-1-lihaoxiang@isrc.iscas.ac.cn>

On Wed, Dec 24, 2025 at 05:29:35PM +0800, Haoxiang Li wrote:
> If cdns3_gadget_ep_alloc_request() fails, a null pointer dereference
> occurs. Add a check to prevent it.
> 
> Found by code review and compiled on ubuntu 20.04.

What tool did you use to find this through 'code review'?

And the compile line doesn't help, as I stated before.

And how was this tested?

thanks,

greg k-h

