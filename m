Return-Path: <linux-usb+bounces-36711-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL16Ia9a8mlYqAEAu9opvQ
	(envelope-from <linux-usb+bounces-36711-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:23:27 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F28499B92
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1112C303E2F5
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF0A2E7F0A;
	Wed, 29 Apr 2026 19:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bXbW0JZX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46D5221721
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 19:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490316; cv=none; b=nxB2vF2dArrjV7PHgOln5yHX92gj7bWk8pts5Hq39EdzgaEGgfZrUldISWzkIignaSs2sV5b3ldJA53j7Gpg1eIA1gdkPtohtVdhuwSOgB7x1U09OKGCF24FfO9FOglQwngXBU4acRW8me55gDT3QsI6SG7sumlEjdXLH1p5gxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490316; c=relaxed/simple;
	bh=yoqoE1C+PZKFwFJo6H9++zyhTrfdZHjRkitdGJUbkAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT1jHbhYSDik0C/xtkwiHbqL1gLMnDxZQq2e4sXE8DadakJeCdVj1Fz3UgpJ4eKgo3yo6MAFSW1YpHVGeqOMdL1GcAaDGntdJR06/GAtsS2k0yOwtzVQ7iFIkrlO6+tUVNqrVAUZTRHD9BqeAREXcKiDCYFdIjs+xLjtHrLyUkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bXbW0JZX; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a3970f1a0eso1961576d6.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 12:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777490314; x=1778095114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uwgSLuxumlhkkV5j9INLisaiHmLyGGcIqmf+wp/Wq/4=;
        b=bXbW0JZXbLJx92A1nkfIqMLieHm0AFpvzZZR98iav6I917f5fpyrVIyqeVckJvyNMf
         vUO6Fvn+0Nd1hCcYKPTyfE9Ku8P1cBlcuQJ2Ec1d5BE3axjpPtDblsJlgP67XeUkIJAo
         7kYC06Q9obUPjFVObNFo5rLK1FC6znWTV9k3vr6ExEFv9fq4tsEjrx1RaSsZuIKQpniE
         8LoUgYuafg+hpAHx/dKuVsYVMTESjXJgk8NIXSk4v8ttfOs3WzjWc6lFOWANaWgwrdlA
         vvl35xBPFZDxqOGkTxhgkDqOS2i0kQUpllOpdOZF+NqGiWGIgNz9uW9nPocVP4jDO5q1
         DAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490314; x=1778095114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwgSLuxumlhkkV5j9INLisaiHmLyGGcIqmf+wp/Wq/4=;
        b=h+qjg23+c7eJAI5gN5keOOFBHFmmEC7iZqL0Hkshx7w3bdxtLmQNU0nrKXgRUyEdiS
         oCqnNvEywBmxTikPxWii5Qsp+R6YX4WvV/qzM9zv+f2qbuhIbrqOliHzMpM2gUPboPN6
         ICZQRX/1r41TyoFzDUMAT7WH9ALRERw0T6ywrzJ6CGWQuK39k4X197MxfAxAM38v8qOj
         shmJFW6Rjh35HwUIGTMzIFtN3mdfGxQWtM8iYls5tdXRvFQiStHzCUTJM4zWYGIddyox
         2GksysVjaf31DSrIwKGMDsOWIV5w5+XvAkeaStRT4MPotSpcc777jblrJ/ehnlIuUSQ6
         QpdQ==
X-Gm-Message-State: AOJu0YyN74lZJOzcM8r9+WOXY0g6kettrMMCJUtX0UDMNneFST2QZENr
	Q5vY15NvWGsgoYhCn+LVGruoNzw1PM6uJ2kRRuTIY79sp9tq5WsMDZH4Ov343u8Wk9T+AHPwgC8
	uR3U=
X-Gm-Gg: AeBDiev8yATmH6LXfiAwXN69OUJyl1kMmfTQiQsD9FJiZTyESuXbyKal65GfUCPNxkH
	gTVSEqtIe4yCs7eCEijZ9sjLdhI1ll5GjT5rx7Mw8BGKgZz08brR8nNxCssfU1z9Vm7buqfhVQL
	6/xYFLjmXpAcOXSExc9zLriuFpMwHNd4BS3jmvhVRjRx04hZTWCkBHJJSJydkQ73CVQSJD7G1bA
	PYedpqmtPJqZv91Ae9ZsqsovxP2HxVfPzee0QITf1oJa28578U+ttu+U6GwQ+4PMcvI+f/G4hY3
	mF1jFLn1Fg2xrn8KB+5fMkwU3y1tserIc9p0CPynEM6HLpCazBb6xRhcPnH6NQxnxTMtZVpoUpY
	7UYA6kYVa5UpFtSESmgwhVK8hFQFIR8iaDoAykC4ygUp8TLHkAn+wa14PTVPAIytRLSUy+h7hVC
	jfSFaLYMloD88ENLkjRzG0XwwF3cFFMYZcGBUa0U/Hlcq9dQuWrgeS9vhLmzDlQzuqNnb3stU8D
	cVzXQ==
X-Received: by 2002:ad4:5746:0:b0:8ae:6347:8c91 with SMTP id 6a1803df08f44-8b3e304ed61mr133868446d6.3.1777490313699;
        Wed, 29 Apr 2026 12:18:33 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef7ef7bcsm26230636d6.28.2026.04.29.12.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:18:33 -0700 (PDT)
Date: Wed, 29 Apr 2026 15:18:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH] usb: core: hcd: fix possible deadlock in rh control
 transfers
Message-ID: <9d794461-1d36-40e0-b02d-05466885a342@rowland.harvard.edu>
References: <69ec231a.a00a0220.7773.000c.GAE@google.com>
 <20260429104209.19620-1-oneukum@suse.com>
 <f54a001b-1825-46a3-a16e-946d88be8ded@rowland.harvard.edu>
 <f579301d-75ce-4b72-991b-494201b7d1ef@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f579301d-75ce-4b72-991b-494201b7d1ef@suse.com>
X-Rspamd-Queue-Id: D3F28499B92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-36711-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]

On Wed, Apr 29, 2026 at 09:13:59PM +0200, Oliver Neukum wrote:
> On 29.04.26 21:04, Alan Stern wrote:
> 
> > Besides, even if a resume was necessary, wouldn't the same VM magic that
> > works for the reset thread also work for the resume?  After all, they
> 
> They need not be the same thread. That is the point. usb_reset_device()
> does a resume. However, it is possible for this to race with another thread
> doing a resume or a suspend. In that case it will block and wait for
> another thread. Hence we essentially get priority inversion more or
> less.

Okay, I see.  Good point.  You should include this in the patch 
description.

Alan Stern

