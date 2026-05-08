Return-Path: <linux-usb+bounces-37140-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGBiCJj6/WnYlQAAu9opvQ
	(envelope-from <linux-usb+bounces-37140-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 17:00:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8813D4F8399
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 17:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C19E8306AA60
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 14:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F513F65F9;
	Fri,  8 May 2026 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="RNlNGuFw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED07A3F65EC
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 14:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252077; cv=none; b=QPF3KnsGjCpXtJs2+3MhvfBrAnhVlNJAinYqIBhuq7t6KuTQYiyXWENY/1urVpruIZq1FE/Zqk7Z21dg/+4oICECX0R5gjYvpYORhqkxe1Kl5/co81stfI8Iml5bxdR/HMZZ2xZYsAGEDHzH489obKuukZileYu4p4UsqIn9pJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252077; c=relaxed/simple;
	bh=DJ4bTLR9vnY0AdLek1uC1akFC9w/km+8zef9/ZIEjCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grCK1OPww3hEA7Hn3ZU9K78RQcRXVLF/9tscNmOEWf++30msLvpEZ8UICooQKn7n9G56kRYZ4cKM7WcqeBR+zgYVwkR6g2POamvDzOnegu4a6TEfYsGTQthf4A2eEcUU45NUV5RY4bqKbtyP3tdU3BfeWhX8DNoCEsv+pm5yvlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=RNlNGuFw; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8b4eb1fd5d0so18666436d6.0
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 07:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778252075; x=1778856875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+wu8jxllJELJafKvd/QY9pVwlC4JZvoXmDH7yMoxK+o=;
        b=RNlNGuFwMe6ndo74A2b7Wcxac4H20k761svgrz9s59A8scYVhBIXe3NuBoCx5B7h5+
         Wjd778mQSRWrif4lhWfbQgDDhX+DYIsCI5bMDA5VflzXnWyZBsxDFCODTzfPXwoIhruu
         ZxPIlFRLPMiPPeBX7Ig1uW5sEZfzqU8SMhSQ+MnLFG6Epn3NzvI2DId93Y/l+0LYlOK9
         /SZ2T+dzBGR12GJBmCqLBoZnWT6HPD2SUqqKi9nD1yFb+SUu+xLdlG008nc+avd8+p6U
         sUeA1wfL5hoyJ5rDHOjA1zGl+qk2mC2N+k2mONGaA+XksrlhG9ulygzgRT0Qdo4u6cGY
         mRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252075; x=1778856875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wu8jxllJELJafKvd/QY9pVwlC4JZvoXmDH7yMoxK+o=;
        b=QxFWqwtc0J7ZANYrbHiJhzuqgVzC1ETntlp4u8fYQICoX0Ndc965p0wx73OedxS3Kp
         znh6/6FXDg8wX3gy5Toi5Ss3gXED+uB/Phua2/l/3KYE51p1OUKnEZgj9JeNkavVqSTn
         NgYv5N5m68R6qRgEjOXUvBJsXZpOlqiZZbXczn8mqcqtmB8VC5hopHByM5EnlUdTjd9c
         hvzxOxVTI/AWXmh2/egoUU+Rpew6TMoSipdD0TgxGUqaILY83A2PNVAIUY/ozvXe3UBo
         wdlN3CPXpPXs6+OqGvdXKnyZivnp5sUUB6Iib9QEie5NPJHOc4ecCIGPOiEHBVOqsPlM
         184Q==
X-Forwarded-Encrypted: i=1; AFNElJ/76Gi25Q6jIpJOvR1NdbQAT59QUKugrx6rsKu+Feam/8v1lZkPTh7X4hyQlqNh4GdYk0K/PvRCbGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/NjLnLi2HpUYzIAXjzJ+/Sp4sgo4azsmf0HdYl5wTi35Hi3K
	QxwCPfZzECCxUHM08GfCDj4w7bGYafmrE4BvrUk9gECz2uHbbr9D5rVtYghpVopvGw==
X-Gm-Gg: Acq92OHHTJf9FxX6WHFvPANiQufJfVC0Lo21kHsGZ/6Oj7p9vCG8WmwPxjNRxOHybv7
	MN/2oytm0JXe9RGK9br+qSgpN40gEWBp6569Ws1BJPGuMGDs670wQy1dBdyz7weKA5F9U1A1h1O
	jf1ZrMZbxvOocaxyRLNk7rlJQhl8E3y8thDOPOD/F/1J9xu7c1fMeUvOVe3IFOd+Yqn5QUtUoaf
	p7368SLCmeLeX6Htcw7C1hBeXa6WL2iEd6jEZBlZ7naDSvQnRvKnu8m52JLx8Iclsq7XKG4/R9k
	LQrtkfboJlVbJ9+69L2Cav+/BQtH0b9h/Vh1l1y23VdGBwH+h0gu1AkI5ymCxEZlZmEXPvlJd53
	TgK91JVeau7mcv6I3xDEWYvehfIsv2I0UrGwHZx2jY1S2rDKfanBKow77y7LkUgZcrVgZznY3oI
	mBliWU852tMv02hqTJADA8qf77ZH+9xH1QNL4=
X-Received: by 2002:ad4:5aea:0:b0:8ac:af0d:c101 with SMTP id 6a1803df08f44-8bc41bca50bmr183475746d6.10.1778252074771;
        Fri, 08 May 2026 07:54:34 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53d450dcbsm238667366d6.45.2026.05.08.07.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:54:33 -0700 (PDT)
Date: Fri, 8 May 2026 10:54:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Dylan Robinson <dylan_robinson@motu.com>, linux-usb@vger.kernel.org,
	mathias.nyman@intel.com
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
Message-ID: <08919ed6-1bfe-4260-a5c7-28c1152e8e62@rowland.harvard.edu>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
 <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
 <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
 <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
 <20260507235432.71d28151.michal.pecio@gmail.com>
 <ee3a6ab4-081e-4d7e-98e6-e39b2c087c4d@rowland.harvard.edu>
 <20260508114126.68241973.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508114126.68241973.michal.pecio@gmail.com>
X-Rspamd-Queue-Id: 8813D4F8399
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37140-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 11:41:26AM +0200, Michal Pecio wrote:
> On Thu, 7 May 2026 23:09:18 -0400, Alan Stern wrote:
> > On Thu, May 07, 2026 at 11:54:32PM +0200, Michal Pecio wrote:
> > > Alan pointed out that kerneldocs are more up to date, but there is
> > > still a crucial error there: on ehci-hcd, an URB submitted too late
> > > completes with -EXDEV instead of the submission failing with -EXDEV.  
> > 
> > I don't remember the details exactly, but are you perhaps not taking 
> > care to distinguish between URBs that are partially too late (some of 
> > their packets' time slots have expired but some have not) and URBs that 
> > are entirely too late (all of their packets' time slots are expired)?
> > 
> > As I recall, the first case is supposed to complete with some of the 
> > packet statuses set to -EXDEV, whereas in the second case the entire 
> > submission is supposed to fail with -EXDEV.
> 
> ... which was an artificial distinction requiring drivers to handle
> substantially the same problem in two ways. They didn't, therefore
> 
> 24f531371de1 USB: EHCI: accept very late isochronous URBs
> 
> changed it to EXDEV completion in all cases. AFAIK, this code still
> stands. I can't find the string "EXDEV" anywhere in ehci-hcd source.
> Note: every frame start with this status so in case of missed transfer
> the driver simply leaves it unchanged.

I had completely forgotten about that commit.  And you're right; the 
kerneldoc for usb_submit_urb() needs to be updated.  I guess that can be 
done after the xHCI changes have settled down, when we'll have a better 
idea of what to say.

Alan Stern

