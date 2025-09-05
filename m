Return-Path: <linux-usb+bounces-27573-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BB7B44E6F
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 08:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D47775420FF
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 06:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6F92D6621;
	Fri,  5 Sep 2025 06:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwTZPUf2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065BD2E11CB
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 06:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757055412; cv=none; b=lYyyhN54s3aVrftbzBl2wwmUhhVSp0CzGZtViDUhKSThlWVngPTLDr+sQ/ctxJ1EI2hcH7wx4KdO3jyHcM9cC6eIBua/rFynlrgsXBL6ebY3AQlrRg6L0wsbqhmmHthMHRyvLW1dPZmkI3iBs79fucrA5PvMSEwKiH6uO3V0cIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757055412; c=relaxed/simple;
	bh=2GzKtEbpHm2BscgZR8Axyhj7vLXny4SAb05fxzPAk9o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B6iOGbHJHA/LUXfckhhE8KTWTFQ7Q0meOlu3vJnHjf03z5ODmuvupKZM2AHogi/r/4NXRnTuzwyFP0TOe/G6oThOWIrozJye1KpV2ce/3AV2DM1Xc5VF8ttqKWKye0F/ny1Ew4a5II4v0VqZENXlg/EP//hhBptXr4Ft0Gi4aMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwTZPUf2; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so2264273e87.1
        for <linux-usb@vger.kernel.org>; Thu, 04 Sep 2025 23:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757055409; x=1757660209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHEwJeFEziaDjw+qFMhYf2S25H1klcRUyjCOnQ6Tf68=;
        b=YwTZPUf2Ajhb02V7cZZBYppsAvieO6hU8uYhy4WYBu+mPEQ8Qtpj5v1/aoGPikvXLo
         DGev77lch85aq/U3c9Ax9fzkEAFfUQxuaVWzKCe7lNxKhYgm+HydwrQ6f6daBEnl/Xeb
         4VxuMeaRitWie9Wy0PzyC1MZH1LIqnKx4LzVVJUzDMnx/ZBIlr2OGXpyMqKJbJVBsmNl
         wSD3ejF14jzzb4eus0NmiKA2e2F4lgXS9NPwW8cljMEQ758/00DXDtBSW9lZMxVBL2Go
         +vre9BixVWRgKX7n+91BjFW7E5BRyLNi+JNX+3ZgLTKIYTr6PzUiBQcOekSUsokqorYb
         W6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757055409; x=1757660209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHEwJeFEziaDjw+qFMhYf2S25H1klcRUyjCOnQ6Tf68=;
        b=e8ovDNhVVRHjuAl99GDUwPptAomW64+2G96+an+36Zi+8pDlfTQBa/QpuYzYztUePt
         RdOZLW3I6ch73gq0h3FDTIhClYL3qLboTmxD4hBfbMktCU9f6tAfzBFt4j1Hsmp3CdTC
         gV97lrYJZMYkqB9N5f6vxtCltxp/sjGUMfMCj6uDuWvCJr0mdKg4EprQ8NkVFgkYT+Xn
         O4bVR8tR/CpjV+2XfCX8jacRABsCyd1yeaULRsyBfZzH/BaoaIjE2IvP7KcswaG+3Szx
         gtaR6MHIbasOEhwiNey7OSbC2GpOaAmUZgm4EVUoWPAS8ibvMTRQKyprQLQFT/A8IDha
         tK0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX7zSYb3OfLb5jZPZa4J6pgwBC9uU0ZQhrPZhsnzQW9tjCaO5sIn5+t7rVZKaZHYehMfpkjeCz/XP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxOuVUh+6l98BywAmKFj+6BvDR9d3+FwVXkrlRRa5jcOBC9O0X
	Ybizz/Kg5xbDuTQFxoYXC61FtX/1vWNfkMv1UtdMtSe0MV++8LhuDIXt207AiA==
X-Gm-Gg: ASbGncvVsIiz4XxGzDjdEIBu7llx/NWhpGvGYrQbqjdNquyQPQkIxtK4MVDqaGqv7eO
	8/s9m7KDrer+wXtMN/dbFaxGA2XqWt9aKoFeqPMp0zWR6FsRBYemxT/PDsSqqjhwDKcPUaD8JJT
	BuLWXq60eOauqboz+GpTGepI3qnKzdCgnXgrC8yXFix0T8iDR8a255N8h2HuYuYp5miVnANxTlu
	EGMOgVL9dBY60Qp75ydfdOMy89k559jBiWcymScLHx9+1/uGWEiCH+PTpWh8pfqHmYRtP3qHfgL
	Pwzgp9APuLgxBGwOj569T9Jd02IA2G/uudWw/bX+E6Qr/E6wFQyRSGOO6QvexZBJQgi7qMvQ5hi
	992UTulRo30h6Jf6Fdbzt0fXl9Py48a1qk+gKnAg9d9gu3jr/J+AkHQ==
X-Google-Smtp-Source: AGHT+IE1xB5tj0r1Lw0dc2HG48pZBvoF3H5M2sSaUbbRAV1Kr7IciQrfPr/fAkpHTVb80l5FlRGGWA==
X-Received: by 2002:a05:6512:2c8d:b0:55f:3b0f:b211 with SMTP id 2adb3069b0e04-55f7093e9a6mr5896518e87.39.1757055408689;
        Thu, 04 Sep 2025 23:56:48 -0700 (PDT)
Received: from foxbook (bhe29.neoplus.adsl.tpnet.pl. [83.28.94.29])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad44cf1sm1591126e87.136.2025.09.04.23.56.47
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 04 Sep 2025 23:56:48 -0700 (PDT)
Date: Fri, 5 Sep 2025 08:56:44 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Niklas Neronin
 <niklas.neronin@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] usb: xhci: Drop the TD_CLEARED cancel status
Message-ID: <20250905085644.4f68e718.michal.pecio@gmail.com>
In-Reply-To: <feff2c31-344e-4147-8c9f-081b634dc82f@linux.intel.com>
References: <20250901084642.2b42c0e7.michal.pecio@gmail.com>
	<20250901084800.35252e61.michal.pecio@gmail.com>
	<feff2c31-344e-4147-8c9f-081b634dc82f@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 1 Sep 2025 12:47:10 +0300, Mathias Nyman wrote:
> On 1.9.2025 9.48, Michal Pecio wrote:
> > There seems to be no need to keep invalidated TDs around and require
> > callers to follow up with xhci_giveback_invalidated_tds(), so make
> > xhci_invalidate_cancelled_tds() give back invalidated TDs right away.
> > 
> > TD_CLEARED cancel status is no longer useful and therefore removed.
> > Code complexity and overhead of repeated list traversals are reduced.
> > 
> > There is no more need to debug interactions between these functions,
> > so a big source of xhci_dbg() noise (and potential bugs) goes away.
> >  From now, "Removing cancelled TD starting at ..." really means that
> > the TD is being removed, unless one of the errors below is logged or
> > dynamic debug indicates that Set TR Dequeue is queued or deferred.
> > 
> > Also clean up some debug noise from xhci_handle_cmd_set_deq(), which
> > practically duplicates xhci_invalidate_cancelled_tds() messages that
> > will be printed just before this completion handler returns.
> > 
> > Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> > ---  
> 
> 
> Looks good to me.
> 
> xhci_giveback_invalidated_tds() was anyways called right after
> xhci_invalidate_cancelled_tds() under the same lock protection
> so we can as well give back those non-cached cancelled TDs right away.

Thank you, that's what it looked like to me.

The only reason I could imagine for possibly wanting this state to
exist is if somebody somehow demanded that cancelled TDs are given
back in some particular order (submit order, cancellation order),
but this driver has been delaying pending TD giveback due to Set Deq
for years. Nobody seems to be complaining and I couldn't find any
mention of giveback order in places like usb_unlink_urb().

I'm thikning about a v2 with small changes:

1. add a dynamic debug when a cached TD is selected for clearing -
   currently only the deffered cached TDs are logged instantly and
   we need to look for "Set TR Deq ptr ..." announcement later to
   know which TD was chosen.

2. add a patch to replace all 'break' with 'continue' in this function,
   because they break out of a switch nested in a loop, skip over an
   inactive 'else' clause and trigger a new iteration immediately.

Regards,
Michal

