Return-Path: <linux-usb+bounces-900-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB9C7B4C26
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 09:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 18D0B281731
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 07:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4A317D3;
	Mon,  2 Oct 2023 07:03:55 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783DF9CA44
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 07:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B55C433C9;
	Mon,  2 Oct 2023 07:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696230234;
	bh=isgnctD6bZsWxvGPwcAKUrW6UxJWxJhNMPC0jAIu7UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KslYNypf83wtmI2w0wIVp6wxb7GFnTX8Yc9ADxVSxtw8Tsm+vCq88CI5QIrrgiZkb
	 4MUeq10REzvjPylRTJasVcmS54YM/QgjsaQiY6R/DLlMqS4Ct9fybP0M4iKDgY54PE
	 yT0U1JINc/GrhTQuzR9JBNcssBNnwkJ8xBhKd2bo=
Date: Mon, 2 Oct 2023 09:03:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: laurent.pinchart@ideasonboard.com, linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org, john@keeping.me.uk,
	alsi@bang-olufsen.dk, ruslan.bilovol@gmail.com,
	kernel@pengutronix.de
Subject: Re: [PATCH] usb: gadget: u_audio: initialize spinlocks
Message-ID: <2023100239-atop-twisty-2040@gregkh>
References: <20231002064231.2336627-1-m.grzeschik@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002064231.2336627-1-m.grzeschik@pengutronix.de>

On Mon, Oct 02, 2023 at 08:42:31AM +0200, Michael Grzeschik wrote:
> When using uac2 with lockdep enabled, the kernel is throwing this
> message, due to uninitialized spinlocks. We initialize them now.
> 
> [   24.668867] The code is fine but needs lockdep annotation, or maybe
> [   24.675878] you didn't initialize this object before use?
> [   24.681910] turning off the locking correctness validator.
> [   24.688038] CPU: 0 PID: 348 Comm: irq/43-dwc3 Tainted: G         C         6.5.0-20230919-1+ #14
> [   24.697866] Hardware name: WolfVision PF5 (DT)
> [   24.702831] Call trace:
> [   24.705559]  dump_backtrace+0xac/0x130
> [   24.709755]  show_stack+0x30/0x48
> [   24.713456]  dump_stack_lvl+0x60/0xb0
> [   24.717552]  dump_stack+0x18/0x28
> [   24.721254]  register_lock_class+0x4e8/0x4f8
> [   24.726029]  __lock_acquire+0x88/0x2130
> [   24.730314]  lock_acquire+0x17c/0x338
> [   24.734403]  _raw_spin_lock_irqsave+0x60/0x90
> [   24.739274]  u_audio_get_capture_srate+0x34/0x68
> [   24.744436]  afunc_setup+0x2d8/0x538
> [   24.748431]  composite_setup+0x1a8/0x1ba8
> [   24.752913]  configfs_composite_setup+0x88/0xc0
> [   24.757974]  dwc3_ep0_interrupt+0x5e8/0xab8
> [   24.762648]  dwc3_process_event_buf+0x424/0xbb0
> [   24.767717]  dwc3_thread_interrupt+0x4c/0x90
> [   24.772488]  irq_thread_fn+0x34/0xb8
> [   24.776484]  irq_thread+0x1a0/0x290
> [   24.780379]  kthread+0x10c/0x120
> [   24.783985]  ret_from_fork+0x10/0x20
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

What commit id does this fix?

thanks,

greg k-h

