Return-Path: <linux-usb+bounces-37049-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOh7MQb4+2m4JQAAu9opvQ
	(envelope-from <linux-usb+bounces-37049-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 04:25:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 671CF4E2427
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 04:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B296B3008D7A
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 02:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B37128726E;
	Thu,  7 May 2026 02:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EgPrw+8G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E552762809
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 02:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778120707; cv=none; b=iiW8gPjCNW2ZcEmkvQaTPIHVPI05KLSJ+7PGGRv5xnsFn+lzVXr7j3AvKQSBQyoLa8KtzNOd0NJzVFH2SxuzdoMbwKSzimlw4iBNLvMOx5lYqn9AsdGv+qTccBnCf/Q9hU0AUBkjCLoogq1cPaSC90MZF03mu8cZx8xcSDyfd5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778120707; c=relaxed/simple;
	bh=BvQ/9kOE664ZkJ5YRdfXAz0eaVSRtmXR19jJgM7w9+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G6lHgH2PByDMvlwHj/k4sKJe2ypQ74jsuvbdm1N3TE9SJQJ7OIimNgTSVypxaW9VpWnUUctShArVXsfPrRDSf9wtw3DaIDxh0LdPBvdbhQfivzUYoGhsoZPyGwjPi3bIOly86YiEuxSSA+1He1UtZWoWCucnQC/IeG5IOP4UiUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EgPrw+8G; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50fbd79350dso2471041cf.3
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 19:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778120705; x=1778725505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssBQ6MyB1dRFFfzV0hZ6QPeQLWfR2ML/dw8WSpwuV6E=;
        b=EgPrw+8G/b9JTWKpuphD8ZD+hKRUUj9g2GoOix+dpu5yVBDaI7R2gOXXYlzsk1WmD0
         tb7t4m7MSU+43YCl1owlUSJB2F4iaAcu323fbsrZc6Bb9eSzhXgYG+sqZFclZIZGsQMa
         BZafZh2NIjd6kTCvONIbzGpIDr69pHVoT51qG5S86liIk2JN+llFJ0PKre7fDxHUl7rg
         Yqym0rsk+D75aZbnFPeb/YTzqaa5c2isl+9OAgDRHjfqY/MBFI56D2OYpA2CYVkeq05y
         wK/e6PUOct267LTlOxfn66MbvoeSeLpWvcWQVy5byel91Ezao/1Ce+SFcb27rvCgoYOE
         RnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778120705; x=1778725505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssBQ6MyB1dRFFfzV0hZ6QPeQLWfR2ML/dw8WSpwuV6E=;
        b=iX6ZHrKOr/U0Fkx1uoGaDpftDLHg3Tk1oDpb2tSmU/n2DoajCNJdbjJafW11r2BzX9
         jerbgQQIignFY9KTfdybwwTHTQps4ZajOekg9ZeEsmNBPACugDzgnJV/XvAz1SfZ82d3
         JGlGCVqhEEmpQTm297HSWN9evk2GQgqyOMfZWCDv/9sZWRPhWpM9Trh6H4QwjQ8eut6/
         U6xdA8dK7B/9v3rFA1IPVQrDuL3dKnwqphiLX0bV2mBGwoizBheJ1hrLMdOwjZmB8PO5
         b47FfiMMFMILS5kulYD/BcNUjeZl94/UA6ToAMXhucbhq9FcVkoZS8rH3TNxMu0ijIyj
         9RVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OBAlRhWmGocwBZYLxjqKumowHpBRcqvFXQTbgNnWPr8T4+/jZTVf9VVAronL4L1fKQwqB+r1U8J0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk2YImE+tFCgCXKmMOFeUQS3u3c7HwXqQHKTWAYE12vdl10O77
	svyMK4H1H+ybsONy4AMU0jQhycYe6LdZGyQyYvd2kzdNgY6CpcaNUF9MsQiydtBqkQ==
X-Gm-Gg: AeBDiet1htb4PjASx3bUh3Kjk2h3kUXFPZeqJFzyNZ96v2dbtFqPIhdW2bvjucOL/ph
	h+BYpkue46yT5a2hBPub+CrWhhbl+j/H3OymKkmlPiKvv4Mi3W6hPrqRzdRFZk2UFHGJpN2950I
	4Yzb7xkEJIz+gTJ0H6j/MkWGsYd5QjaVnFwB+Xo+JKjgG5//4jQIwApxaCftR+dg4Jt6rr+SDGf
	7QvmcoRU7BaEKD3m6peEovM40XVH4JPI6LlR4KVWox+cthpXRvYTRtJXsk+nJngF9xQbuTzUm/c
	E4fS9qw6grdBXqd7Yu7T7RjgbrVoZ1tGnN2NWBKSuf2iAuzPlIZGp12feQJQFSStm6W1q0kSNaV
	U/Kf+I4iyN8AOPyQosbcBZgkzJCZv+lt5D2a0xvfYpyozlJf/kElhW/3WcUvypjWsuufSb6cdSg
	AfmtmFSkxmYAuYfl56MqijsbUFRQhzW0mw6DzgVB9lNiFueg==
X-Received: by 2002:a05:622a:114f:b0:50f:be4f:465e with SMTP id d75a77b69052e-514621c7463mr81051011cf.53.1778120704759;
        Wed, 06 May 2026 19:25:04 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5104090a381sm189051481cf.8.2026.05.06.19.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 19:25:04 -0700 (PDT)
Date: Wed, 6 May 2026 22:25:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	mathias.nyman@intel.com, Michal Pecio <michal.pecio@gmail.com>,
	nick83ola <nick83ola@gmail.com>, niklas.neronin@linux.intel.com
Subject: Re: [PATCH 1/2] usb: xhci: fix isoc silent reschedule creating
 stream gap on CFC controllers
Message-ID: <3ea05812-e63a-4562-9ec3-159244b571b4@rowland.harvard.edu>
References: <CA+Df+jdFEGGZyceFH_5LRSQjwGa1WCtd79DK1Lywvdw+pkX6fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Df+jdFEGGZyceFH_5LRSQjwGa1WCtd79DK1Lywvdw+pkX6fw@mail.gmail.com>
X-Rspamd-Queue-Id: 671CF4E2427
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37049-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 03:55:27PM -0400, Dylan Robinson wrote:
> On 5/5/26 16:32, Mathias Nyman wrote:
> > Agreed, setting start_frame to start_frame_id + 1 would only make sense for the very first URB, otherwise we create glitches.
> >
> > Looks like the whole start_frame_id calculation is incorrect.
> 
> I'd also like to call attention to the fact that index in
> xhci_get_isoc_frame_id() refers to the isoc packet index within the
> URB, not the position of the transfer in the overall stream. A driver
> could (although probably shouldn't) submit multiple URBs, each
> describing less than a microframe's worth of transfers, ...

How can this happen?  The only way for an URB to describe less than a 
microframe's worth of transactions is if it describes no transactions at 
all.

Did you mean less than a frame's worth?

Alan Stern

