Return-Path: <linux-usb+bounces-19060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B8BA03C84
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 11:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF9A47A2BF3
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 10:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2771EBA19;
	Tue,  7 Jan 2025 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C6THdhJZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EB51E5739;
	Tue,  7 Jan 2025 10:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246019; cv=none; b=lh4e+5eJ0srJb27bUDRJT1KtSmU741HDEeSbDLtQMdeSGoz3Z6xunNldjlMeTf6bG8uwRHgiYrFnED4VM34LuElUL7FJ3LERYPRonOQpTN8uN9GFo1P8FEqeuTNf5TXuC7X52NAJRT0LHmhGvCkAnOzqYfWoU711n9+Vgp3wxlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246019; c=relaxed/simple;
	bh=uyNKrCYG3UHxHM6BfgAb/U3GfzjI1gKcojlVGhqLd4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuH2zleRHJYmGW0oJiTNLkG11OBUntbsnDwKXWnuxMaMLJKGGDBhPUl8BQEAkRBLQSqoilLej8Q3GfLgD/BXExTO6HbfToEJ7OnFciSH72fTSrsQ+Sovh1KbaHOAWHVl/eWLMdNoyngeyLoRhP8o5gLAM4QRM1voYcKKglN4t6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C6THdhJZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D9AC4CED6;
	Tue,  7 Jan 2025 10:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736246019;
	bh=uyNKrCYG3UHxHM6BfgAb/U3GfzjI1gKcojlVGhqLd4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C6THdhJZkl32cH+wN87vnidicI9ssPUN6Qqx+n5GvvBEBiy68RA9zZF1ZhwC1doxa
	 tftgslg0C5rSsbct4yzZzdv/UnTrnDovFyyi4b857y6DYBjL0KjyJXKttPxt1otRuK
	 dfrZes/zZUnbEYS78n0vYEaeHYFXcom044hRrKnU=
Date: Tue, 7 Jan 2025 11:33:36 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: ukaszb@chromium.org, abhishekpandit@chromium.org, bleung@chromium.org,
	chrome-platform@lists.linux.dev, dmitry.baryshkov@linaro.org,
	heikki.krogerus@linux.intel.com, jthies@google.com,
	linux-usb@vger.kernel.org, pholla@chromium.org, tzungbi@kernel.org
Subject: Re: [PATCH] driver/platform/chrome: Update cros_ec_trace with new
 USCI commands
Message-ID: <2025010717-antsy-watch-491f@gregkh>
References: <20241231131047.1757434-2-ukaszb@chromium.org>
 <20250103233407.4001046-1-gwendal@chromium.org>
 <2025010438-canopener-renounce-4a28@gregkh>
 <CAPUE2usEN1OZ-=A19PH2yx3tCM1aNnXqNZt3stvgWZod7GxW=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPUE2usEN1OZ-=A19PH2yx3tCM1aNnXqNZt3stvgWZod7GxW=w@mail.gmail.com>

On Mon, Jan 06, 2025 at 10:43:20AM -0800, Gwendal Grignou wrote:
> On Sat, Jan 4, 2025 at 12:13 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Jan 03, 2025 at 03:34:07PM -0800, Gwendal Grignou wrote:
> > > Add this patch to "platform/chrome: Update ChromeOS EC header for UCSI"
> >
> > I do not understand this changelog text, sorry.  How can you "add"
> > something to an existing change?
> >
> > > to add the new commands form cros_ec_commands.h in the tracer so that
> > > they are nicely decoded. Enable the tracer with:
> > > cd /sys/kernel/debug/tracing
> > > echo 1 > events/cros_ec/enable
> > > echo 1 > tracing_on
> > > cat trace_pipe
> >
> > We don't need to document how to enable a tracepoint here in the
> > changelog, right?  That's going to get lost and why is this new one
> > somehow special?
> >
> > confused,
> Sorry, I did not use `git send-email` appropriately: the code snippet
> inside the email was not meant to be a standalone patch, but to be
> added to patch v12 1/2 "platform/chrome: Update ChromeOS EC header for
> UCSI".
> If this is too late, that's fine; I will send a proper kernel patch
> through the chrome-platform@lists.linux.dev mailing list.

Please send a proper fix as obviously we can not merge commits, you know
this :(

thanks,

greg k-h

