Return-Path: <linux-usb+bounces-36721-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHqoMcu08mmUtgEAu9opvQ
	(envelope-from <linux-usb+bounces-36721-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 03:47:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 402A049C166
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 03:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 893803015D11
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 01:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532D9274FD0;
	Thu, 30 Apr 2026 01:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="snWNAWIQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BFE2417D1
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 01:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777513669; cv=none; b=bRZw1VvkAbvBbXsI4FFfrAVNO8+pWOPTb5PYOumqXLKV3nuj8eFhRXXf3s7/J9YhoJEjsCE+BudcMAzjZmEKLZ3+wx95pkH9H6FTPIs+9bLHEPeAoFVFXxCZ19Otenkubx3zSdYs3qyVtqgV6louxjOCN9o06MZmkIYcFyyNF0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777513669; c=relaxed/simple;
	bh=cvovMtyWDMzqeEskppJdwizzAhsUuknJVzB+bihHksI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pu3F8VloyfTnx+FnZfkDYchWVCcRKvLzjjjyazpvC2tRAInGVBBPrIH7dXkZWkJVtlnf8LHZKy9Uw0N1osDC41VNBYx+AxgWQsWgeTSwiuAI9bBBSwE6Zb1GPpvVbttCBtpabAUspJ1Gb1jzi7SxBjZNxyTYB+Ofe2B7QDkYAPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=snWNAWIQ; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8dbbc6c16b2so62489885a.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 18:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777513667; x=1778118467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2pi4A76npk9IqlL+xm9RfY0QlHHuFHSKe9nTljjV5pA=;
        b=snWNAWIQwNJbF5/ZhT+/3l6DIpzYHYVsClKn7obaBxV8SB5gcM9ZThNyaqsqgM+MHb
         cqUIg4x7JEP1dNxIVFLGxmqQ40RbPiDHMtUzFO+h5oFccWO4/qnUzm1ZqONy2XpEzI/y
         GOlstQcJzleIFDNI1CBKaJGDx52seobqRghixQColDUHfyi33ECRzx9ErT5328mqIJxp
         PWAdkWFHXf77M0fK52JUWfX+aqYTrKvZzPoS15/G+lYQMoaZ/2juNACcqd7Bjezul280
         EoI2Nvi+OG16YsCZxnLbj8zeARbVTPxDaFiRUf+xj/1QiAAQZQ1tZDW3F1xlgwrnp6Y4
         p+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777513667; x=1778118467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pi4A76npk9IqlL+xm9RfY0QlHHuFHSKe9nTljjV5pA=;
        b=rGhl4e7kNOoMNyfiYQCAgV/cQ3hqG1wuKnsiGnp8KgsJ3qcgBFiO49+AWvWQGfDwex
         STf2bt+eTRyMUnPDexDDN77hcUy0vsDbvKbB0W02reyJ9uBhBV2Lu9zZrLHxl0qhRoJc
         vvJMYELfeguYnS3P29z2oolsebSqgjAYloijMZZZBQiov3OQI63GtGpTQyb0XSysA+qv
         WPnwUjju6CID3y6sbnTrkJNDlmpBG0WW4Eza0+hGylheCji/ZWhIDSGWn79mtIYihlbu
         CSgh8ho31UV99DORplUxvKcmEGZJB7E9zuLapVmerWfMIxVlcuCP2wqm9F9A6p21YyhX
         5wqg==
X-Forwarded-Encrypted: i=1; AFNElJ+wSouwGITPku7h5oNJNny3O/4gEx1bP+Jdx/tXTB8Di2O771haYGxFBC8jNmUuqFQsOSTK82lfcWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUnRKcwXsn2SJOV9+JWuufq5FDyiocoYeqQ/H3htZl1lh+UafR
	1lKjv1RM+c7iUoagfZH0czjoIcgVXZmhH8CpYRoZ2IkSnur072wwtpp0iBfKg9rQsA==
X-Gm-Gg: AeBDiesYOn50LnUq4mw33Q0P0xiqeBMWRd8nm4q31KQiXKwu0JtsNmj7FDwtzNzDgfl
	ax+/Q8yHRueSAZNpaodGXkY5Qd6QrcqQuX8TPhVg5FRjZY4TL+fTbeGOEAO61/44mnnGKURsB7E
	Sg2UepkxyBFIqS5trAlQkd7pX3/Vka/i46YEpzlYyPQcW2285Dewus/oITW+8RO+VUeqgvfSqrE
	we17fRAS2QR5bm3nTEFOlhzHAPIV0DxMuzaqCY+Q8pW8VZENQWymN1E4ZFkGAIhEe72I+XZuvPM
	CTE6V5iNSI754ikKw5FrqnitlGVnpEXEXmx1UNFKQy0Y1AjKBKpYCNRzNLqcbn+pm7iS/6HLFa5
	mgc8u5zeQbM7AwZy6/Qrz0UfEFPv/6HAAEG8aw/fNuZxbXUtfQrS/e5DAKUgjY7CZyV6T6jyb4A
	pJ9w7DSBlxgd28qkbA/H0MvFL4eExc7Tjl7Sw=
X-Received: by 2002:a05:620a:4483:b0:8f0:f1a5:680d with SMTP id af79cd13be357-8fabb6d754bmr70056185a.36.1777513667119;
        Wed, 29 Apr 2026 18:47:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f93cd07018sm372409785a.15.2026.04.29.18.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:47:46 -0700 (PDT)
Date: Wed, 29 Apr 2026 21:47:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Brent Page <brentfpage@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: TT budgeting for EHCI; =?utf-8?Q?accom?=
 =?utf-8?Q?modate_1023-byte_full-speed_isochronous=E2=80=93in?= endpoints
Message-ID: <7ece08d3-fdec-448b-a2aa-d3bbda1e48d4@rowland.harvard.edu>
References: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
 <32291bf6-0c9d-4fd9-9dd7-489f7e1c9f02@rowland.harvard.edu>
 <20260429113604.2204b646.michal.pecio@gmail.com>
 <a3176296-bf99-4486-9310-0b70f28c1ba7@rowland.harvard.edu>
 <20260429212408.299826a4.michal.pecio@gmail.com>
 <49a41b4c-34ac-4627-adcb-d0e989470610@rowland.harvard.edu>
 <20260429220459.0c304ea6.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429220459.0c304ea6.michal.pecio@gmail.com>
X-Rspamd-Queue-Id: 402A049C166
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36721-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]

On Wed, Apr 29, 2026 at 10:04:59PM +0200, Michal Pecio wrote:
> On Wed, 29 Apr 2026 15:32:07 -0400, Alan Stern wrote:
> > On Wed, Apr 29, 2026 at 09:24:08PM +0200, Michal Pecio wrote:
> > > Yes, but per spec transfers are budgeted based on wMaxPacketSize and
> > > actual SSPLITs may be shorter, while subsequent transfers may still
> > > remain budgeted into a future uframe.  
> > 
> > The actual SSPLIT will be shorter only if it is a short transfer
> > (that is, shorter than the maxpacket size).  Hence there won't be a
> > subsequent transactions in a future uframe, even if some are budgeted
> > there.
> 
> Not for this endpoint, but another one may be budgeted next. Say, two
> isoc endpoints with 188 byte budget each. In Y0 EP1 moves one byte and
> leaves some time unused, near the end of Y0 EP2 SSPLIT arrives for Y1.
> 
> Seems legal, so I don't think TT can assume that it has seen the end of
> periodic transfers when its queue runs empty. IDK what it does then.

It uses the spare time to carry out control/bulk transactions.  Those 
are limited in size to 64 bytes, so they can't delay the next periodic 
transaction all that much.

Besides, the spec just says that the HCD has to reserve 90% of the 
bandwidth for periodic transfers.  It doesn't say that the periodic 
transfers actually have to use up the entire 90%.

> > > Then I think it doesn't support 1023 byte packets at all.
> > > 1023/188=5.4 and if worst case bit stuffing factor is 7/6 then up
> > > to 6.3 uframes of transfer time. Completion in Y5 or Y6 and CSPLIT
> > > required in Y7.  
> > 
> > For iso-IN, that's right.
> > 
> > > IOW, you play Russian Roulette with bit stuffing if you enable
> > > this.  
> > 
> > The driver is not perfect.  No doubt about it.
> 
> This raises question how much sense there is in patches enabling such
> endpoints. Maybe worth it for OUT, if they currently don't work. Or for
> fans of RR, if there are no other side effects :)

Iso-OUT doesn't use CSPLITs, so the problem doesn't arise for them.  But 
it could come up if a big iso-OUT transfer is followed by a few 
interrupt transfers.  And of course, it matters for iso-IN.

Alan Stern

