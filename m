Return-Path: <linux-usb+bounces-36709-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKYtGF5W8mkTpwEAu9opvQ
	(envelope-from <linux-usb+bounces-36709-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:05:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F5F4997C2
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:05:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90B1D3012855
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4E1421F12;
	Wed, 29 Apr 2026 19:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LADbaYYs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118CD3CA4A0
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 19:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489497; cv=none; b=a1ktyCqDLj/jIspAg1gWO2J4HN/BcCPUYkzMU1qKTVon51uudfCR1xikD+XHWXhTp5shUBdLYLQOXdncZZ9U0feG5/PY3PLJrgm/Cx6fC3FQ7XJAyLdK6okUEbdg3jZxT9fNu5jg5Qh3H5vJfdKSiXa595wFNerUP62WkZ1phw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489497; c=relaxed/simple;
	bh=q30jKErMPJIvC7y/Kxqm1nZiCq/gReMFhSheWdVeQfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHSkRUFYarDikk40zO5JvJg9egheGdn5TDfYjdvnv9T5UlAhaRFHI8r+uo1wTLkzHm4KrOTzqJyxoyi3jTDlWsy+U8Q2VhgznmPMYOP0WUo+rfJiJd7XDl+ongjwcWjnQ0c9s+R+8U3b3bZkGKy14VrCYkc7f9pXa1JObF6JwFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LADbaYYs; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8b038a00370so1476656d6.1
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777489495; x=1778094295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9cmzs/scmji+nsbe5NZ7/F7yi8QOiJtjdkiIKd+3+E=;
        b=LADbaYYse2muY79juTb/OsPS+fpoXRxW2yLT8o24ky3hRhXvY+mYQm7aTZv6IHePDE
         DSFFeefJwNJjoLbsycxirZeDaWbLvKQS6pmPKLu8lUEOBTT68h/HuzTu3nX6+EYGRZPZ
         lN5aoCKQlgTPZpqQBbtHw91snium2Wxu0rlqm3NG9ljW1wpjSVySgBxTrbYV7xkP2cH2
         l/tK9DR2T5y5CBad3X3cz3MKnTtJ3NbRorUkdaFloIlFQNB4Km7QOxmWe9SjZZFXWwp0
         hCJLclHLy0uXBUU63fQrf96wXJ2smmvodOH1R3LR+zJOcSAEKYCwCubdmVCfGzOh0mfP
         kOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489495; x=1778094295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9cmzs/scmji+nsbe5NZ7/F7yi8QOiJtjdkiIKd+3+E=;
        b=JTj0vVGDuDmsxw8h61Zyx59lY7LrXdTQ6K+Ga3n/2+YbSLofNl+N0aTqhYxy0HAmW6
         e1qZCGreL/YDEipqZrOERlYTFZF/dyiJDgv4UH5+aUMV9eQPzjk1J3YaaA6MiUUtlnzh
         JFsRbe+wSoaLIBK97dBukavlmUoANeQTLlDAjZ24vfYKU2klMiJJSh8gzk4+AxF0zCUb
         mklBGz2TXPhNgacIiA9gGMgT6gAhX4tzUlu2GTtjnf5ca3YYu7vNNjt/cZwPMFEh3dZr
         bWmtgE/9b+r7phGCljcYIcvhvB60Pfau77aU/sibHpDuFWG7VQ69hnJQav/MQZZ2foqm
         NHwg==
X-Forwarded-Encrypted: i=1; AFNElJ8I77lt5VvZInbn9J0ptmTcqRauoPkKSU1Dlgr2yUw0PcRBTvVN547/alhW6s5LT63clgBfsZKrscc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx0TtY308g1Kb0/BbGFvEK5xRzln2GSKslpajGQ91pDR7h6yVn
	eFMWXlv1HF34pwlaLrOmge/3pL6bHHdefBM6rX+weBFNIorQxtMQL0FIREfJTMfiSw==
X-Gm-Gg: AeBDieu3baB4bqnRzmP2QkRl24Pz2LsoaHcTzOt3c69kK0EvndSTCwRnFBnapnyOr43
	QC7QYnD5E1QjGG7Ji2Fyg+1Uz5ycNz3WZO96KsYqvGykXNuM0YqbqX15Hf18k6wXH6h4xLYWXT2
	3P2A7yXD+Tq99EmrUA6SbsXE0lesdZNXAG+7BI0FY4MgJyO6I/FOgZIDUKgQ2TythQgMtqpZ/bB
	7D6G7v7s+uYDKnMSfMiv6Cw4LSHMT9cs0nedrFlciHXYKrFDFzeNcPvcZiQcjl1MoVSHWe2G67W
	ehpeO3mms39vDBRf8bY1GStJj/7F7C6l/RESm8AlmpoBimFoFg0DbNSXwBi+CecFyUE3VCJZuUI
	n0iz2ZLB2Zf+AGG9fEZV9pTU7oQGG4NDOLM/ylREDdY23Db96XMkUvUDB/cQa2gfIF/N4ci5K7G
	msxPFDFPpyUPZhjTNEHTler4Pa64WWoHyBdTreOSQvzyuQQz4yZgj9f30LKUUAFOTtIeDGHmMWj
	izCPw==
X-Received: by 2002:a05:6214:2527:b0:89c:4fab:3783 with SMTP id 6a1803df08f44-8b3e2f3ef1dmr144568786d6.0.1777489494926;
        Wed, 29 Apr 2026 12:04:54 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef86e2f1sm28533006d6.48.2026.04.29.12.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:04:54 -0700 (PDT)
Date: Wed, 29 Apr 2026 15:04:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com,
	linux-usb@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH] usb: core: hcd: fix possible deadlock in rh control
 transfers
Message-ID: <f54a001b-1825-46a3-a16e-946d88be8ded@rowland.harvard.edu>
References: <69ec231a.a00a0220.7773.000c.GAE@google.com>
 <20260429104209.19620-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429104209.19620-1-oneukum@suse.com>
X-Rspamd-Queue-Id: 86F5F4997C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-36709-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,2afd7e71155c7e241560];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 12:42:06PM +0200, Oliver Neukum wrote:
> From within the SCSI error handler memory allocations must not
> trigger IO. Handling errors in UAS and the storage driver may
> involve resetting a device. The thread doing the reset itself
> relies on VM magic. However, that is insufficient, as resetting
> a device involves resuming it. Resumption as well as resetting
> involves conrol transfers to the parent of the device to be reset.
> That may be a root hub. Hence usbcore must heed the flags passed
> to usb_submit_urb() processing control transfers to root hubs.

The SCSI core prevents devices from suspending while they are in use.  
If the error handler wants to do a reset (or if a USB transfer fails and 
the driver does a reset to recover), the device won't be in runtime 
suspend at the time, and so neither will its root hub.

Besides, even if a resume was necessary, wouldn't the same VM magic that 
works for the reset thread also work for the resume?  After all, they 
will be the same thread; the usb_autoresume_device() call in 
usb_reset_device() is synchronous and it is called after 
memalloc_noio_save().

Alan Stern

