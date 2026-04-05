Return-Path: <linux-usb+bounces-35989-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dqxAIC270WmSMwcAu9opvQ
	(envelope-from <linux-usb+bounces-35989-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 05 Apr 2026 03:30:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C017139D04B
	for <lists+linux-usb@lfdr.de>; Sun, 05 Apr 2026 03:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D17B0300DF4D
	for <lists+linux-usb@lfdr.de>; Sun,  5 Apr 2026 01:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70221F2380;
	Sun,  5 Apr 2026 01:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="b5LgRXuT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B36F2DB79C
	for <linux-usb@vger.kernel.org>; Sun,  5 Apr 2026 01:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775352615; cv=none; b=bekfumnv2pXWXleESdC4fIEDHozaIhczwszkzrgcroP8yya+La2bNLf8z0XeLG84lz5I379HRxNTJkRl0na6xTRHSZMHDMuKh2UuBGGeurXVqFE2y6VtJtynNVTigGeNa1ekO5DL75dDsH6IUpQrvkIzkhxAg1oaR2KmZ74yWkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775352615; c=relaxed/simple;
	bh=XXJ/LhqaYJYZtmqu93/pDqAeW9BEF4e0h/NSSLJ4So0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyngXX5veQss8TB9SbpGOZoDm7W4wAyxFUGPTWW2MoMOmgNd6raUK5wk1mPe2WrCmG7R7XstfVb9Sa+o5OXuVzE5BgHX6cz+QKDgsgw4+PQfIleCnQETGTeL8RFGG63Nui35h8gsRzuZ/7TCEGCfb3ioO2f3e774keXrGSP7dM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=b5LgRXuT; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-506a6cf8242so27726511cf.1
        for <linux-usb@vger.kernel.org>; Sat, 04 Apr 2026 18:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775352613; x=1775957413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iboZScY3arM4PIRVE73kuK/1StkXZgm8KpORIwjiSpk=;
        b=b5LgRXuT5z8v/YwFY4zJzbYx4dJJ0/hfhF8FU2JdzIAY+Bnaztc6gri7SQ+J/QwIwk
         p6t8PrXInfUC8NqSw2DCTjoJ1uL4oF4UQZqXspHZdvwGTjvC+ISwS2C94Cx9dwaw6KRX
         1k80nzo0VzadPJQePOKVmL8aK0PdTL1RMAmc6GRaGRiYiafsEEGglbDjRbEwpHD0kZLj
         2rQz7TF+AWznfbQ0ezAahQJv6zO1TP6JwurQduq551yirkAWA391oTLM+nuxRprXMAV7
         RNzJSyrh5IdriCRYn6nYWvWzLG3GRavYRdrd05RrMbJFgVx9oHUVXvVE7fwyt3ilxwrJ
         vslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775352613; x=1775957413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iboZScY3arM4PIRVE73kuK/1StkXZgm8KpORIwjiSpk=;
        b=MNO76ORpvBwnrM/lcQKqqfmY4CRnu0U57C5D5zsmZiPDuRJAH4fRb0ariE1Q2BSJE8
         WF8w7NKzQet9+y62Tu+oHZFxAU2KLxvPuIPBcqjIzj0Dg8nAqEJGrzhtr/OsG4RngIYW
         9saz5G7NfMZ5COOffnkqEB6UK7vq36raIKM7Qxe/x9VHE342A766mqJ30N9mIEKkuHIJ
         OKjPDJZaD91LRbm0tsKNo3x/umaQ2Pw1Y1FIG5gz8AVNf5HppJkwuk4xrWtx8LyG+YEx
         28j4eyRVJHzFZCSPue8oOuZMG+Ht/ihJKlBGzaBcpx1RqSGPByqgs/JBPg1A1IgL2AHo
         dTjw==
X-Forwarded-Encrypted: i=1; AJvYcCX7axJvS3GCQE2Odi8Nx+1MfMgWTc8KTu3FQQliHXoYoC8G3SRBXtsjsDM0nwf/OfWPglZHFgu5hho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ULL16ZJuBg2ij7GmGqQrjfIzPAMmSmFpv5+CijHGdy7crc9E
	IVue66QNZInA4XYUSJdw4la/CbiX2Vmetv5sqa/8KIb+LApLQKZbq+uYtMaaGIKl0bnX+7HCg4C
	OmZQgJg==
X-Gm-Gg: AeBDieszRYh584y4i4LA9QC9cFi5rVjXXKlJhrtADAXmT+ocuPLT8PbmGk/jfi0A/+U
	++nxwV+8zL+XzX4Ft3NJKKivrt9KNerg92M7O0nmK9XW24ExnF1XqjIdaSsLfpu2CteHrUZxsVE
	bw+x/0l9xjeYYVT2o7sJo6E10xXD0MdUDC3BbVg/zlxQBG8l7HsNYfvOnNOPNfDTqdzQXnTd6Vh
	xXAo3+iPMjQD/WJHQgX7sJ9EZq3Qkoh9xYnFvc++mjH5YGOWjZ2IExr5EPaU2uisBlEofF0t2ob
	qKJsvJfsJlCm2NWdfH9LRB1G0CqPeFteU6Dz4uHOKW1qcHjcqtUH+2EarSkmOYS949jGttSi332
	sn1/z43ncaoqC/UhzhE3qeZwnfZoLgzc44JODLqMGr32W78zVjCvHWgEs0HSPPH08BzAXAgy9Tl
	gS45IOIfCdsT2+WF3A6DJqkVDt
X-Received: by 2002:a05:622a:613:b0:50d:8009:2b40 with SMTP id d75a77b69052e-50d800936c5mr41811111cf.37.1775352612946;
        Sat, 04 Apr 2026 18:30:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4aed181asm89686331cf.0.2026.04.04.18.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 18:30:12 -0700 (PDT)
Date: Sat, 4 Apr 2026 21:30:08 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"michal.pecio@gmail.com" <michal.pecio@gmail.com>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
References: <50e61cf7-cce9-45b4-884e-ac65f5e771d7@linux.intel.com>
 <07351d72-5cdb-45e8-90af-311a0dc49718@rowland.harvard.edu>
 <20260403015950.lx4n4zdqki37dy27@synopsys.com>
 <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
 <20260404011530.aukxllvizvmc3f3x@synopsys.com>
 <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
 <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
 <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
 <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,gmail.com,suse.com];
	TAGGED_FROM(0.00)[bounces-35989-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C017139D04B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 10:28:24PM +0000, Thinh Nguyen wrote:
> On Sat, Apr 04, 2026, Thinh Nguyen wrote:
> > On Sat, Apr 04, 2026, Alan Stern wrote:
> > > If the class driver wants to take some other action (like submitting 
> > > URBs to a different endpoint) before using the endpoint that stopped, 
> > > it's free to do so.  It only has to make sure that it doesn't submit any 
> > > URBs to the stopped endpoint until after the other action is finished -- 
> > > which is what it would do anyway.  (And maybe it has to unlink any URBs 
> > > that are already queued, which can be done with a simple function call.)
> > > 
> > 
> > Then the xhci must make sure that it should not ring the doorbell to
> > restart the endpoint when giving back the canceled URBs. It should only
> > do so on newly submitted URBs.
> 
> Ignore this comment, it's not restarting the endpoint in the case of
> unlinking.

I was going to say that xhci-hcd shouldn't restart the endpoint until 
the usb_reset_endpoint() call is made.  Whether or not it rings the 
doorbell at that time may depend on whether there are any URBs on the 
queue; that's a relatively unimportant implementation detail.

> > We can add a requirement such that if the class driver submitted the
> > recovery URBs prior to completing the usb_reset_endpoint (which should
> > be done after clear-halt), then the HCD may keep those URBs on a queue
> > and only process those URBs and restart the endpoint afterward.
> > 
> 
> Actually, adding this new requirement would be tricky because we don't
> know whether it's recovery URBs or not.

The purpose of the submitted URBs doesn't matter.  The HCD shouldn't 
restart the endpoint until the usb_reset_endpoint() call occurs.

Also, I should point out that usbcore will call usb_clear_halt() and 
usb_reset_endpoint(), presumably using a work queue for the calls.  The 
class driver doesn't need to do it -- in fact, doing those things could 
lead to errors because the endpoint may already be running (the core may 
already have made the calls).

Alan Stern

