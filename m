Return-Path: <linux-usb+bounces-36406-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CrW1CHcu6GkVGgIAu9opvQ
	(envelope-from <linux-usb+bounces-36406-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 04:12:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6755744148F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 04:12:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4FDA301D064
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 02:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0829930B53F;
	Wed, 22 Apr 2026 02:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="pxwEntd7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4697318DB2A
	for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 02:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776823907; cv=none; b=N9L2HROT4m+cRJEi8qFlIAUl8VfubTI+MdodhBIrqBke1b4LaVjhYlti3mg9oj8Jk407+oTrCZCH6yZynnMDulcdXo7oi8QDYacab+7HE7IPZF0cp84HRFNb8yvbHfuXoqsGrUfXV3DSKHR5ZWeBG0S+KeEm1+2PUcLaCIda5W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776823907; c=relaxed/simple;
	bh=VfqwIepkSr0pqTD1B09zyu7gJdQrUrzB6rGEOtmPYIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4rm0dTjPXwEqRvnR2MDzL1tS4auvAZP4XJxGfJKpWXtOveogyokKovqemM8+aWwmrbUZINIX0X33Mp4fRLjvIhRBuQImIiCrD96YaYtOKzyyjLjl80lyK8L//wfhZWFBBRXIDQOU/Q9HI+GRDIlamCNIFbUnr7L2fXQaM8h+R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=pxwEntd7; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8a58057d7baso61052606d6.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Apr 2026 19:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776823905; x=1777428705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fV6vreGG07SH4VH9ertW1MtT1Ku/YDfDFMPiOMK+ZvM=;
        b=pxwEntd7maZXUOg1+TnWg1SgyX38yYRgzUMK/LFsBiOWAcxPQVOW/Dv3jxcSoUkIAM
         Cb8XHoeIo1fdp6/XSOhdU1mQ+aCSm/xnQpPhNBSB8hine1f5RPtFAlgqQcZOWyM3OLQT
         XdolfDbNWlVF50qvKMmQkdD3FNZPIZz+6X10NxmGAVxR6UioyPdtQlpYV5iYqf0pTvsH
         8ylteuGmBYQakvpA/O2zN5UeZ6FYRkuIPP/Yhk3OnHz07pibnLM8ooIlRhwPJ9eWnpGc
         xkq7B5MLZms62wmWXLVF6YSh8T9tkozy/JZB5OyXRSoH/ZeBGQr3DtEM+cKuAfVJEy60
         CYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776823905; x=1777428705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fV6vreGG07SH4VH9ertW1MtT1Ku/YDfDFMPiOMK+ZvM=;
        b=nXG8WC/eZ92IyDI3KPDYy6VJztdhJn5vqy1uWD6Y4yFe+huWHVXzpcBYHDcUgiHckf
         ONnsdQOcw5/RacKdq22+g+AfjwCu0l2R5+SU9Kho/YRYHrvzghyNpncVRVBikwiCtizm
         l2USirQJTD9pSIXr4ciMD67YSm0MaBjRoxkQ04aFahML8bi/x9gLQuk4wQ54UnI6Cka+
         DqQN+5XstxS0m+eWVRFR0/BYdxjFwS/umPlGwaLLi0OiJyP75/i69qZ057i3qvE0cdH5
         VXZJuSX9edTyV+YLJR+EI6ovrjW/NxieUipuBhoND157u2leJpQ9n5WPnj2ye1SZRCYl
         8lWQ==
X-Forwarded-Encrypted: i=1; AFNElJ+t6dOEzp0hEuvIFrVYvJ3MyyfSoHybru3+zgzaroJOxzoonlwLIonxgk8nNMlx0LunnPLNm6HIsQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQidoesVsW1RFIrxQEjxRtc2RyluDEoi83bjmYNw4m9f/ha5Yb
	Y6a+TPSMvQDWqvO3MwWU8xn2Spk6ml+5lTuUSuulZ3z2XCuEgmd8tp65zwHM3wQz/g==
X-Gm-Gg: AeBDievDmDsDpqLJKWwx89I9xHt5NrDTpLi8dXwgJE+VbutSgc2Q/6nkhedlrwutmh9
	79B6iWvlq//a/fVqS36FKhP8LFrTonmjcRqWr8ghcKuhmnIviFvmcP2W6ONTbDBy+U9YL9VdBtF
	AfaGVxmb2k/EQeEZY2j/VLeyfQnzUT5kHIqFsUK8MlLG76qxD7xkA8mpStIYPw5MKgZehyJArVc
	F+qxQF6GSz1e43teZqNwRrq2jMRUuYByU+c+dtAZt3sC7zp9FZvf7mlQR5rUJgcd6Noip0qtvCa
	E8H+7n1xWxXqrySB1C6LXYw+7mWdh1hywe0YtAdXNlby9g1rHFmrDaFJPPZjl2UXcjSTGmKu+8j
	KZizd6TuSLBL5xljKCKO0L0Yid4p71wjo/y3VwyDnyxqrQqaXQ4xpQj2I9M6FeIEAXlEd7Xw138
	sW4mwD2wKtLsVzurLN6hGYKfPjkcin+i90uBK+Z4IVtfIccA==
X-Received: by 2002:a05:6214:29e9:b0:8ac:a611:740e with SMTP id 6a1803df08f44-8b0280ee523mr325972936d6.28.1776823905097;
        Tue, 21 Apr 2026 19:11:45 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac7d4e6sm118335796d6.20.2026.04.21.19.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 19:11:44 -0700 (PDT)
Date: Tue, 21 Apr 2026 22:11:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"michal.pecio@gmail.com" <michal.pecio@gmail.com>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <54fd265d-4ae8-4573-b618-587af98176c9@rowland.harvard.edu>
References: <20260404011530.aukxllvizvmc3f3x@synopsys.com>
 <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
 <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
 <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
 <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
 <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
 <20260405030954.32jbg3fphi5xdla3@synopsys.com>
 <74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
 <65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,gmail.com,suse.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-36406-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 6755744148F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 11:24:01PM +0300, Mathias Nyman wrote:
> On 4/7/26 18:23, Alan Stern wrote:
> > It's been a while now, and nobody has objected to the proposed plan for
> > handling this issue, so I'm going to assume that everyone is on board
> > with the idea.
> 
> Yes, I support this
> 
> So basically usb core will call usb_clear_halt() after EPROTO URB completion
> handler finishes, and xhci-hcd needs to prevent bulk/interrupt endpoint
> from restarting after returning a EPROTO URB up until usb_reset_endpoint()
> is called

Can you confirm that it's also possible for xhci-hcd to prevent control 
endpoints from restarting when a transaction error (-EPROTO) occurs?  Up 
until usb_reset_endpoint() or a new callback?

I've been thinking about how to implement all this, and some issues have 
to be solved.  In particular, suppose we have sent a Clear-Halt request 
for an endpoint that has gotten an error, and either the request times 
out or the device replies with a stall.  What can we do then?

My feeling is that either of these events would mean that the device is 
so far out of whack that the only thing to do is try resetting it.  Any 
proposals for something a little less drastic?

Also, it seems reasonable to devote only a single thread to endpoint 
error recovery.  Another possibility would be to have one thread for 
each device having problems, but I think the likelihood of this 
happening to multiple devices at once is pretty small unless the problem 
affects a hub upstream from all of them -- in which case having multiple 
threads wouldn't really help much.  Other opinions?

Alan Stern

