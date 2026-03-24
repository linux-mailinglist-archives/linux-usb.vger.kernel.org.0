Return-Path: <linux-usb+bounces-35394-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBcIDQSSwmkXfAQAu9opvQ
	(envelope-from <linux-usb+bounces-35394-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 14:30:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 666B53096DD
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 14:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9142330774F1
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 13:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2109E3F8E14;
	Tue, 24 Mar 2026 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="XQ5mEYjU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AFA3D5666
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358739; cv=none; b=JPxTBebVIIvcpQgRy7amMvIDZN248jibm98pSPv+7dOby7ojLfj2J6ToCGIDBv0wikrR1f9FlQ6U8/V+TIEduwmXYdSquqbqCHaLXAlHoaB/lVh7hpyYPLxThl0YX63voatDKI5KWjrQrYP3ftJTM9ed1dZmDdA3tHp/y+oLFwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358739; c=relaxed/simple;
	bh=8D+rmh0EulRwAWJQolEQSbke1F1XQ+tQqgQ5N/08quE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0atJ/1g+dLOU0xycUK1l+AHCrh6M5KxdPXe9p/O6gormLWJF21ABH79zzDGEkrc3ooWi0FJe3IpcXALUttZ1yUQfO0PThGrXkrc1CvH4oDOYSIjOTwAwb9PGnMWWBmIeaZwtysM7OvcQC/Ol0SsOUn40M2/sdTHrpaFEvpVcmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=XQ5mEYjU; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cfc085395fso385227785a.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 06:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774358737; x=1774963537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fkqof4XtX0lqj+6PLUfaQCeLhyC6Vxdd/HKKTMpiazo=;
        b=XQ5mEYjUwJHpwDt0knELuhvx/38PDVMvkPCk3HkYbHsSvxNkJXACTMvpeWVJtONuM8
         wZcKjNkrEibGdzzWf+EoySkzaU2354qnvtU4HuN2L73KaSt6yGO30cYhRad2lJwi3Fy2
         HYPkZVxMljYK8EdQwSyEgmFx8sutuXvTFuZdaem9j7AGPUQhDSKSHT+kH9xQppPz63XB
         7RawB1ghxztkjub99aPlBpMkh6nGkZEaonCpaJGVaLCHrChp5QtyAuqmoldLJX3NIdbe
         ksZl0k4o+EdAQZVIJBW0U2ieF4hJRj9NaNJEoMglPC7pCTyC9WDK4f+LTXrqjW6S8RjN
         hkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358737; x=1774963537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fkqof4XtX0lqj+6PLUfaQCeLhyC6Vxdd/HKKTMpiazo=;
        b=jBhSc060p8qLgtggxfJ669Zht/fLAwu8NkaSizL0l0PA09nCjB0p9+Z1ksljOwz8mS
         5txQens8zdbpABmVqOOjJTpbUvUYxSKgdRVtozpAZANhLCZtP4Q6egKELon3hM/4U5yA
         +KR3jm70NPGn5+7ZrPUwDne2Z6uftg81tdxr7funD9kBfe8JyX/UnvxfTTt3j37WxZW+
         2ioGJpGEOoe/O2RQuzESYaAiWki4JlhcuG/uuqCHo8AUn2ZNrdA6VnaHXoTEmaXPOz0x
         LwYNmuxk8G6xhpl1YJ5kJ6NY1z/pLDsRYVnfJTuQga0nP3ckJF7GvzaGojiMnXwz7n8B
         dzag==
X-Forwarded-Encrypted: i=1; AJvYcCWuFZxz9QSd5+/4JNRkzEo17MjoEljtlSrx47yyxlPFRMeSsJ4fh/dBp3bbtiwGqB8huf3w5/rZ8dU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpacYrCGOpswxvplc/y3jdvjyyhbRNSMChLhdw5op2W+ty/YFQ
	XzeTSitL0XaTs0spJ98ktTLbvt5mnkHmlPoPICji2IuhJRHRgAB0DWyQmQpFqAVPfw==
X-Gm-Gg: ATEYQzyTcqcqLJ63hBEC8UuLk7vLCmDizQndckNRTJHaZ0s6kUeFdlgkizOuM+3TtjE
	njvCmNnBMxVICPpePsponWbSp2wn6I9CYaJVck82A7avhH71weWT2Ep2oufYbkBpuZO5e4CpXy2
	I0yml3zmioirXhv5wQPzDx26e60mBnmWPG4Z8jEMpFllbOQi11XAtqKDFBIBLQ8nQf9aDH8G0Cj
	qJTcA6urjXKq+Srhb3kwxO3QUPntlVVCnSqgP5yE6q8KOyB/M9eYZU5e+OuPNnFWCc1XmeVS4zj
	KxQOSMYLHdlN+fezGlf7wd6dwW9oq+o3DTW1QqDmzUmJniID5OW4ZhY7o6Evigj7x4tUta01ALv
	x5OYBHYaBPhsCOeUkWWysfs1975dT7iF1dJaTkfhQgkMKyotK9Q8G2fu9gmrtjqFyi6w5CLYy/w
	AD4MvcEOi/DsyG6vtUQdE3Etz6
X-Received: by 2002:a05:6214:2dc6:b0:89c:a2c8:9432 with SMTP id 6a1803df08f44-89ca2c895famr134460456d6.0.1774358736948;
        Tue, 24 Mar 2026 06:25:36 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::9c76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85214a43sm117153456d6.6.2026.03.24.06.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:25:36 -0700 (PDT)
Date: Tue, 24 Mar 2026 09:25:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <3d4a5a9b-a6e0-462e-a3c6-712cc4fb2fc6@rowland.harvard.edu>
References: <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <20260318235920.ioek26hdr25rkksp@synopsys.com>
 <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
 <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
 <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
 <20260321021439.7pmcdrpb5oxbivct@synopsys.com>
 <5b378006-666f-4a72-902b-bb5f466f7895@suse.com>
 <20260324010523.3ufngdffak7ldchg@synopsys.com>
 <44ce5041-7286-4f59-837a-995c4e1307ab@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44ce5041-7286-4f59-837a-995c4e1307ab@suse.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-35394-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:dkim,rowland.harvard.edu:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 666B53096DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 10:28:01AM +0100, Oliver Neukum wrote:
> Very well. That raises a fundamental issue. Are we planning around the limits
> of the existing API or according to capabilities of the hardware. I see
> two specific issues
> 
> 1) What do we do to URBs after the URB suffering a failure? We cannot just execute
> them.

Indeed not.  That leaves only one choice: Give them back with a suitable 
error status.

> 2) Do we need a second callback for an "undead" URB, which decides on how errors
> are to be handled?

That would be too much complication.  The decisions on how to handle 
errors, whether to resubmit, and so on, are entirely up to the class 
driver.  Whatever the decision is, the driver can carry it out directly, 
with no need for an extra callback.

Alan Stern

