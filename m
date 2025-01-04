Return-Path: <linux-usb+bounces-18969-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC51A01338
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 09:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E91BC18843BD
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 08:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3BD157A67;
	Sat,  4 Jan 2025 08:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yTPNBnvT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F413EA98;
	Sat,  4 Jan 2025 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735978404; cv=none; b=VejWWQnIwQvHAd0QeSp5cE2W3EgBj87lWi9P5Prm9jhpqEKQFnraP5RJBZJ2qleKKdoOycdJIAdHA/gwEj6QZSvvQqnfKD6mZHTg/wy/DNSwt0RmWuEiEN+g4VFOOCZZcTrBZvWT2w269Gc3cFRDhrRp0Kpm4Usog4NaRQxjEA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735978404; c=relaxed/simple;
	bh=p4za5aQ7v3af4gFICAIkTpoWEPwzMGHNE1y9RoAtyuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dd0uPcnui0eWzi/yioDII3XHCNot8UN/DpUtw+IhsGqaWsBYYc3QasmUI1ZIB2YKBKdsgPNKyAlNolP9gbItCc/ISlCkAWRdPMXufkEJ24X5e7RwafWeGhmdHielm4CHpg29JGP5gNE2wWXZuD5XmMjVr+7vfSFIUD7DQo5wXQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yTPNBnvT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3E2C4CED1;
	Sat,  4 Jan 2025 08:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735978403;
	bh=p4za5aQ7v3af4gFICAIkTpoWEPwzMGHNE1y9RoAtyuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yTPNBnvTT520KoaM2OZ3Hzn7mUmx0bBKBcgXJaqa22ej3zz9cSHbM0aT4IiuSj+mY
	 WxnMow6QfSq0bAB2dt+6P2OoAb2S/5cb9W9xnWr0YZa/xbbOkEzdJ1kUhmJcPPcmTQ
	 FxI5ruWvJbhc0h1SIpcg34xmmjJ42lxxd6HtLzQE=
Date: Sat, 4 Jan 2025 09:12:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: ukaszb@chromium.org, abhishekpandit@chromium.org, bleung@chromium.org,
	chrome-platform@lists.linux.dev, dmitry.baryshkov@linaro.org,
	heikki.krogerus@linux.intel.com, jthies@google.com,
	linux-usb@vger.kernel.org, pholla@chromium.org, tzungbi@kernel.org
Subject: Re: [PATCH] driver/platform/chrome: Update cros_ec_trace with new
 USCI commands
Message-ID: <2025010438-canopener-renounce-4a28@gregkh>
References: <20241231131047.1757434-2-ukaszb@chromium.org>
 <20250103233407.4001046-1-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103233407.4001046-1-gwendal@chromium.org>

On Fri, Jan 03, 2025 at 03:34:07PM -0800, Gwendal Grignou wrote:
> Add this patch to "platform/chrome: Update ChromeOS EC header for UCSI"

I do not understand this changelog text, sorry.  How can you "add"
something to an existing change?

> to add the new commands form cros_ec_commands.h in the tracer so that
> they are nicely decoded. Enable the tracer with:
> cd /sys/kernel/debug/tracing
> echo 1 > events/cros_ec/enable
> echo 1 > tracing_on
> cat trace_pipe

We don't need to document how to enable a tracepoint here in the
changelog, right?  That's going to get lost and why is this new one
somehow special?

confused,

greg k-h

