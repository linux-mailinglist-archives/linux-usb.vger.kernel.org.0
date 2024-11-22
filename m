Return-Path: <linux-usb+bounces-17799-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3689D5F68
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 13:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 366F01F21AD1
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 12:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F075E1DE4D1;
	Fri, 22 Nov 2024 12:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBqq293G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F9455C29
	for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732280263; cv=none; b=HqSGLGDTNgHVMIomW7OO7jLTu7qNyk3JURHWeDZ4iOGaHb5oJfGleiMED6AFtd4L1K0GAvkK6o1mJNPZOhGfqoAn55fPofIuBoDBAPGtZljdAoc/blYtvT182XbJoN0LEnh7gnEjhtzuqNbJ10Cu52JFdxjpDerJXsI45W9NYN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732280263; c=relaxed/simple;
	bh=SExzIlwR+4fZXatyd8sIQhkING7Jg8KWlHqMkP9na8w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmh7iCX0WtoO+fKrD6UPCCBEYAL6vAfggqzgPDSX2t65lnmCHPFaJHE6dokmq6GsDaitjiR3w4VO2V/aSpXQXahYtZD2YbZVb6cPQvUgDVsSJCNpMUFXFgLAvETWycPeSDo++IQNFZPoEKZWcc/Ri6oLNkWc/FtdnBx2A9ZbUZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBqq293G; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539ee1acb86so2340287e87.0
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 04:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732280259; x=1732885059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0eirZ8HTaExLWqjMsYUarTw9zrlPRQvyDjZPiDQpWM=;
        b=ZBqq293GPtWvaGG0g+iVTLuXjlMjOsQYFWudp3QiNaz/58KQily1sl0ZA74DcDfoDO
         5smXF8N0e/0fak8GsBD+80mhQdScOvbw5AMbCMdtYDp8X4SpHV2boQqE6b8axWVxUn9U
         4IarxPSt0VSnrtkV1j6n4/jBbVexcs8rgQePhkzRPCfhsPsftUZJw49LmufyaauPUAkr
         F0jBEdqEHuGHtnaOe/4KhCj2pqlJSbZAso9YEWd36nVh7V/2IU/XOJkASXJmGpkbMHgO
         B/82k+CTnJaF9C4KLzBs8CLg+GKoL1zuS3aZ9prTlx7StVt+YPWjPzKUqD11tOkEy7xv
         A7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732280259; x=1732885059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0eirZ8HTaExLWqjMsYUarTw9zrlPRQvyDjZPiDQpWM=;
        b=WGNEGxTYsbB1Pt06l28x+TVsF/W/6oTtMZhiSfi/Dhb1hRZ+4T1MGIfZkrSJ6ysk2e
         CXeXiG7unIIMILLfm14XXgW3z3WAUTS+caZehiq1vh4f7mFdGkaZ6k7/YQyOPyWaMa+d
         5W7W85VRCjbHUGI3Pu5n+aX1Bss4ad3j4rAvqV7HPgYgvfZNmSVUsSTwcNOJgaXZ76lo
         AHQ4EnTCO5zP/bDS/ZbnZ42PYJfpyQNe6NnH17tbfIZTgzKT2PIqP8//1aGQATJWaWYg
         ZdbMfT2LaVNBylyCDqCTbJH+zcmWUzhEoCuJ9o5kF33SV/pH1LP90m57hzRrD9WjVXM1
         QIgg==
X-Forwarded-Encrypted: i=1; AJvYcCVY8PKKi3eEiK0M09yQcLnNNAlZC0AJOAKWUbWzffJGoUFxb9P14AgrGbTKmpQ0eioa7aDIDyspRRU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywx+M+bs9uEJ0edpg+p6SVj/lwVFrZ/PVbVxPl7bou2i5u+BiI
	iQ67b40lxXwwo/TUSZ+Smb8n3GE7n3G/DW6hNmkr+YmvqQuFNnJU
X-Gm-Gg: ASbGncsEgIaXLTpbEH5mv8+wzpsd0H6NpUJLo7HcJMDO307d/fzEOzp9a5Gem6ugsdJ
	7+0qHvBPrECCVy4T24iVIgHMZAA1klvpstDA8uv6OpxbVSFLCWc9RpRA/DSQ3nIbkq4xjU5oKx6
	izOuhsFfg+2Rpbf+a0rtyVc1uIGDab1xf8GKUS+Q1/Uuuq6ryivkZdqWVPCMsnPZizFt/1uq5+7
	G6rR89AC2Q8JxNnAlZ9asUKLaSnxso9s3GWvr8/5dIAE1b0YHUn0G7DaA==
X-Google-Smtp-Source: AGHT+IFQP1CXzNzH/MW8b7y3kRUYR3TEJnC0+9HCYZ3y3YGM4Hu9PwSd9Vu5Y03wOM6mfHWp88qvLw==
X-Received: by 2002:a05:6512:23aa:b0:53d:a00d:b340 with SMTP id 2adb3069b0e04-53dd39b50d9mr1280418e87.50.1732280258586;
        Fri, 22 Nov 2024 04:57:38 -0800 (PST)
Received: from foxbook (bfd3.neoplus.adsl.tpnet.pl. [83.28.41.3])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd248b390sm361603e87.200.2024.11.22.04.57.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 22 Nov 2024 04:57:38 -0800 (PST)
Date: Fri, 22 Nov 2024 13:57:33 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: How are halted endpoints supposed to be handled in Linux?
Message-ID: <20241122135733.3d040c0d@foxbook>
In-Reply-To: <0dd70803-a074-4859-8cc9-5bd210d12536@rowland.harvard.edu>
References: <20241121001138.23a45f6c@foxbook>
	<20241121000216.kif557p3p6xyahax@synopsys.com>
	<b34b5ea0-2804-4692-bede-70ba9065c86c@rowland.harvard.edu>
	<20241121112653.06ba4ee5@foxbook>
	<0dd70803-a074-4859-8cc9-5bd210d12536@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 Nov 2024 10:06:50 -0500, Alan Stern wrote:=
> > One way I see with existing APIs is to wait until the driver
> > submits a new URB, but are drivers prepared for this? Is EHCI doing
> > the same?  
> 
> Yes; see above.

That's comforting to hear.
But still seems to have races, see Mathias and my reply to him.

I suppose alternative solutions include: bypassing the BH on unlink and
error paths, or making it call the HCD back when it's done. The latter
may not be so trivial, as it would ideally be per-endpoint.

> What about automatic unlinking?

Maybe it could make things go faster and smoother.

Networking can tolerate dropped packets, but considering that their MTU
is larger than USB MTU, I suppose they have to split payloads across
multiple USB packets and may get out of sync if only part of a payload
is dropped. But I don't know, they could use packet headers to resync.

> Note that some class drivers treat -EPROTO as a fatal error.  That
> is, they don't retry and their completion-resubmission loop breaks
> down.

Well, that's on EHCI. xHCI gives them a chance to continue with the
remaining URBs. Hopefuly nobody relies on that...

> However, this seems impractical if the class driver wants to retain
> the existing URBs already on the endpoint's queue.  (I don't know of
> any drivers that do this, but still...)  Perhaps we should adopt the
> policy that -EPROTO, -EILSEQ, and -ETIME cause all outstanding URBs
> to fail and enforce this policy in usbcore by automatic unlinking so
> that HC drivers don't have to do it.

I wouldn't exclude the possibility of sloppy drivers leaving URBs
simply because they don't care. Hard to tell what's right for them.

