Return-Path: <linux-usb+bounces-34829-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENV0NQvQtmllJAEAu9opvQ
	(envelope-from <linux-usb+bounces-34829-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 16:28:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DAD291308
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 16:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E73F030156EB
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 15:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F116370D7C;
	Sun, 15 Mar 2026 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="kPdNe0YU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A89366565
	for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773588487; cv=none; b=STrNq2DLSWQbTJ6yC+COZnnxmffZCyTnwSVcA0h7JaqNforw7HsqTOF7FVhCs6bNjZrmmbPCFrTw9L6NLZpZpaJqqzBl1GVUdp4oV30dd9woHhbtIZryf118cExoFC2AQ2oJfIp3fJ2YB70wxMmnt9EuPuIDsQ53Irmlk0gMD9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773588487; c=relaxed/simple;
	bh=Q7qHtO+YyUZtX53NanMPTIzs+R+jyG3vDLVfGAiRGQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RO4d3CnTek6P2YKgQXtd3pntKU3X+AJARZN8Mtj/+zs4xuABTksw3qQ7B3cPypfP8pZcIxIafAibfCCdE+DMD0lwpXI1nw5kveuesryje4x9XbgX7QKi9J4t84Vqb+WxBn3MZmNNm8/Y8mLB3zvtanC56qaMrFiDl5YpOWXx2x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=kPdNe0YU; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-89a000f5adeso68521966d6.3
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 08:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773588485; x=1774193285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CN4be59gMBZ/7zzoX7+mHWfKu/xR/9fLFRjm1aechH4=;
        b=kPdNe0YUwpwnhssM2slr7mQLtepia6yS1HnOm0i304bpFxT1ks328nougP1OxsbRg9
         yEXqe1I4EkfjOLY/cfWVdMiLZ9RZADKKDPmP0hiC/nHv33RYDOKtPHoHzPeHPx/uZ5Ci
         3NnreiIeZkm7wnhp/mkKvHusTtokrjCDkvxA9xJd64pYqZbXDBRUZozhHyD7WFIhT68V
         //zucSdsIgHTFmAAH0FyFTsakW2RAtrWB9s2DJE8gg2QAEOqy3O7j969DUWFftEJK801
         SWdRX4vXXE1Jg8zD0VvaoquS8J9lIusWHjd/V95hJD617cIWjbzBwdwZR60NlWRAOzbT
         aRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773588485; x=1774193285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CN4be59gMBZ/7zzoX7+mHWfKu/xR/9fLFRjm1aechH4=;
        b=rBP4IbfvHVrivbK80VwW7kqba/Gn57mkZEzLz79w+SKvv71trU5n1RY6DUOjO0D3Xt
         YCASiOHto6O2Xb/oK0/9AmpixUCdOzcQs8hLGhAS6hEevhRKKOrPrK1v+qtqlY55dN4y
         9pD1l2ot8XXD5IfwO8gNYkB9avff6AW6fXR/t83vkZp8+TZ9Z5YgLyGbuKL0/LJQQik0
         TYu0MLQ5gvE6MnHib9MFA0VGCBDWRPocTYxKfYaukMOk+3tK016UABcqd6HLp+T8YHfR
         hgNhpUlZIdspNQ8QB8pT+CgqqKamCh96FCERs2xQNvTk0rAGCr26JDtNTfHEcl6cUXvN
         /Nfw==
X-Forwarded-Encrypted: i=1; AJvYcCVTyAKl9l8jbaW1wse8ySpRGVTRExrJcASrkOMaDjwJUNJfkrk+jIgYvMJuwtKf650PqeSmzqlRV2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq3XJuckk1/n3O4aHfO4kSeALdC0l3kMV7U12ofRpC7mJc8UXe
	pgmrYSTScwPLBbDThvbtAo3arB/ompYsb4kNk7E04JPJtgqQyAsDk2I7hHvPiB4xfA==
X-Gm-Gg: ATEYQzzcjMJLzFV55XLqPslNzzWaYWZJWXisimLCYTl6V7lcoysiH/+mU8+3FUu/zyG
	9OV/Edsn3TI2yAHFs/5SFuDaqkZYEbjyl55BTaPjR8cYnziHb/g4HwjSO82XgFuxWa7Z1f55vas
	6OeUG7hTDaZA+zrB1UrB1CF7jO1khd1eA7QB3Ve9fGYnuqdrUOlqZPAcYPu4CJnuGB3d5aBqFdW
	JGMXuOcdlQ4c4vcxKlltxGTw5hemi5NO5BD+q4NGtvYjQQhFRRXivX9QYOS3A3T7CbS/ls+1Dbr
	ldU+YhuhiauKR/1Z2aXlIjG4v9flsz3E4ifJKpmBtTkT8AjGL2oYDp3/VTF1ARoPfAPQeSQVTAK
	eeDvz4lwqj3BtrkNEGdDNdAGsxkArhS3IpG8/gaX3Xx/A6QNkfa7iLlPIBlgo3j7vlBiOzwkr7A
	P8XBEJma8vfPb8vdj6xEuPSEqX
X-Received: by 2002:a05:6214:412:b0:89a:9ef:192a with SMTP id 6a1803df08f44-89a81ff5c1dmr147842606d6.52.1773588484547;
        Sun, 15 Mar 2026 08:28:04 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c463af405sm26435766d6.48.2026.03.15.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 08:28:04 -0700 (PDT)
Date: Sun, 15 Mar 2026 11:28:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Urban <surban@surban.net>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: dummy_hcd: fix data corruption with queued
 requests
Message-ID: <c8cfe974-7158-4e51-964b-13c4b41e3df5@rowland.harvard.edu>
References: <20260315090307.304644-1-surban@surban.net>
 <9f2c403b-5955-4e6b-a356-330cebead7ed@rowland.harvard.edu>
 <2131664a-9730-4934-9acd-8da72afb6ba5@surban.net>
 <68a2906f-0a3b-4543-9c56-795ae9d2ee98@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68a2906f-0a3b-4543-9c56-795ae9d2ee98@rowland.harvard.edu>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34829-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 48DAD291308
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 11:21:26AM -0400, Alan Stern wrote:
> On Sun, Mar 15, 2026 at 03:06:21PM +0000, Sebastian Urban wrote:
> > On 3/15/26 15:44, Alan Stern wrote:
> > > 		if (unlikely(len == 0))
> > > 			is_short = 1;
> > > 		else {
> > > 			/* not enough bandwidth left? */
> > > 			if (limit < ep->ep.maxpacket && limit < len)
> > > 				break;
> > > 
> > > It does break out of the loop when there is not enough space remaining
> > > in the bandwidth budget for another transaction.  But it does so at the
> > > start of the iteration following the last allowed transfer, rather than
> > > at the end of last transfer's iteration (as your patch does).
> > > 
> > You're right that the existing bandwidth check at line 1444 handles the 
> > general case of a non-zero request following a partial transfer.
> > 
> > However, if a ZLP follows a partially-transferred request, the check is 
> > skipped because of the unlikely(len == 0) branch, leading to a false 
> > complete of the transfer with a shortened length.
> 
> How can a ZLP follow a partially transferred request?  What follows a 
> partially transferred request is always the remainder of that request, 
> which by definition must have length > 0.

Oh, I see now what you mean.  The whole thing uses 
loop_for_each_entry(), so it always proceeds to the next request in the 
queue even if the current request isn't finished.  Instead of doing 
that, it should always handle the first request in the queue.

The loop should be rewritten; it should be more like

	while (!list_empty(&ep->queue)) {
		req = list_first_entry(&ep->queue);
		...

Then it would behave as expected.

Alan Stern

