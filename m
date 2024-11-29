Return-Path: <linux-usb+bounces-17663-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC4B9D0597
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2024 20:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 981DBB21B8C
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2024 19:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07211DA633;
	Sun, 17 Nov 2024 19:55:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83922629F
	for <linux-usb@vger.kernel.org>; Sun, 17 Nov 2024 19:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731873351; cv=none; b=HVXD6OMI9fzuAiONsLu/NXkuHFceE+/ajkE9TYXwWDajUysD6iWkxTkda4kii/aaURAkLq2GKQZ5Wr0gCF+lja1fSoAs6uyGHm440ID23A8HU7/7MeKuQJwk63cc1lzyuZOvBfSH+idS9hJZCfFuZmgMEublI7+1orKQDKfLvxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731873351; c=relaxed/simple;
	bh=n7XGudOLGovITogP1axb0THO1/byVmvU56YQepMv1hs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dd8X8SGA8+GzINkLq5ZnQoAEmbcZ5SFHyZMDmWiGAigvQ3YUz1FEONglfsoqEUrrWVwCkgxy34B8Iqbj/Q8mK1oeC+/VRQ17a5DtDIwdPDOtOooboyIq8jkjdfMXikHcJ3gvSy86nhg0TeXUY4rlydd34c6t0wndaNf6Fwi6YoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id eb150528-a51d-11ef-a0de-005056bdfda7;
	Sun, 17 Nov 2024 21:55:40 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 17 Nov 2024 21:55:38 +0200
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
	David Laight <David.Laight@aculab.com>
Cc: gregkh@linuxfoundation.org, andreyknvl@gmail.com, b-liu@ti.com,
	johan@kernel.org, oneukum@suse.com, stern@rowland.harvard.edu,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH v2 0/8] drivers/usb: refactor min/max with min_t/max_t
Message-ID: <ZzpKOuZeWidsyGis@surfacebook.localdomain>
References: <2024111251-spill-hatchback-72da@gregkh>
 <20241112155817.3512577-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112155817.3512577-1-snovitoll@gmail.com>

Tue, Nov 12, 2024 at 08:58:09PM +0500, Sabyrzhan Tasbolatov kirjoitti:
> This patch series improves type safety in the drivers/usb/*
> by using `min_t()` and `max_t()` instead of min(), max()
> with the casting inside. It should address potential type promotion issues.
> 
> Scanned the current drivers/usb code with `max\(.*\(` and `min\(.*\(`
> regexp queries to find casting inside of min() and max() which
> may lead to subtle bugs or even security vulnerabilities,
> especially if negative values are involved.
> 
> Let's refactor to min_t() and max_t() specifying the data type
> to ensure it's applicable for the both compareable arguments.

max_t() is okay to use, but min_t() is quite a beast. Please, reconsider the
entire series and tell how had this been tested? I can't imagine how many
subtle bugs it might have introduced.

min_t() explicitly casts to the given type and this is a huge problem for
the cases when one of the parameter is of signed type. Besisdes that it
diminishes the type checking done in the min().

As Linus told, the many cases when you want to have min_t() is actually 
clamp(). In some cases you wanted umin().

+Cc: David.


-- 
With Best Regards,
Andy Shevchenko



