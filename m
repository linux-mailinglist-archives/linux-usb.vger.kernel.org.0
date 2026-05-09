Return-Path: <linux-usb+bounces-37169-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MLjAg6N/mlasgAAu9opvQ
	(envelope-from <linux-usb+bounces-37169-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 03:25:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F06C4FD45D
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 03:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 985F3300AB11
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 01:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED8B26E142;
	Sat,  9 May 2026 01:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rZOv8toE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9EC2B2D7
	for <linux-usb@vger.kernel.org>; Sat,  9 May 2026 01:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778289931; cv=none; b=NTp/Ms39C6Xfby0rhzVfiIOtRgibaCkaLyv8sKcpa1zxUOSIdb47nKYxgQFf0Pqx5RpKSVl3YTxboHUp0jyhj5RtXRQxs3EH1SUXeYiqPljHliTRz5h9/SPN0MtpA93EDuu3A2OQmJkcFbnkw6VlNFr9YskBClCghNOPXEeOYQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778289931; c=relaxed/simple;
	bh=j9Lmxd0EBiOGeCJd3FinThJpBDBQmkh2gbjYsSDedp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2G9/HQFXh7GqcnekfBEM779/iKhE30gz+7D0Ol44hpiEkwRbN+MMmTkiLNkPq8JeKTUlqIZ6NPcHuZACGOgah7a22mpEas/fzpbnKMBWPfY/k8+5/ohj3nZXwMTuKzDLjAlzhCH8odwldLPywhGtq2yhwZoTXOYke9+lPhonO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rZOv8toE; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8f83efb5729so268083785a.1
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 18:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778289928; x=1778894728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VeR/PK6fy4S2fg4wo5Yl1VM2x30aTvSgB4RD9f2l5Uo=;
        b=rZOv8toEtJGAs4DqAfGa/nFjek9qy+VF6zgzl40a7Ogf80GKpy50KfFkY2hDKzFveO
         0SaBqrQM/CKsiz1k4d9SqfKRWyehIi91CoR0Q8a/blGGG9Fo32nbUS63CM/7DT6ofHA9
         WU6jIBqkOr9nvbEqyAkNAsT8oK41Ei08PsuYNz8fqW1lekx/xzmFXaYU9an22Y31hXbt
         fUHXxZDQn2rzXuVRHlrfgn8FSxNCwmEqV+HjR4aKfltBEialhm0oggvJspvVmGVR9ylO
         7X45qen2RpDe2YBYJZY4yLRY4UK7DiQBahtQcxVqS7XfTLPzfZCc874mo7mVQcdMGrOf
         KUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778289928; x=1778894728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VeR/PK6fy4S2fg4wo5Yl1VM2x30aTvSgB4RD9f2l5Uo=;
        b=ofNq5klvE+dRNEDE9mKztr6pcXIzsPQMkufme7H9bVh+MyvgJ8S12+VTj09HOuUL3W
         R72mgmfUBEr/P/XzYZnAuWpWIlQ2k/0PxOxnrlLttLMnivWpBsuywnKvrZ3roZIZad7v
         lKWm6/Dzjs7Is+q5250y0awckfjAc3b7wUjxLYHY5Gvynqg2pyyd4Ec6WaKXicP2mzjF
         K583/xfqfzL6GwZITvMePbhIuMG+L/2pk8Utod/092sCNDi9a3/qM9xwr06sbx07ODmi
         fPc5IDmYRbzUy2lg/2jLV3SWTazOkRV1xpSP8XfDh2SmGGAgitFIFvP5kCcTGIHNamTY
         KYJQ==
X-Gm-Message-State: AOJu0Yx/hHbX36dqJNCnKTn9xo0laSCDaf81LlVflqsikCJg9fyMRN8N
	ZpuKFVHAGgih2dj+YNzNVUvOxnIPtsStphJERGBrlrybnIVad+dO33kTsVchdT14Ug==
X-Gm-Gg: AeBDiet9BAIpzvZuGBL2ZollJpvpphewMdc6OFEsaf7tGk8CNUQfKaXWaOx3jpMy0iL
	E2jOwwgvXBE2GeXtQ+dzIGmfHZwO5m9hb89+ti+0GwWyK4zFkvJjF0aYK/6RkiTz8jfpQZQUsSV
	NT3H0EaZwJNAwcLojNqn1nwPnLKAqn+Okql4uD9TLJ1zcdHBvB7mJWJSO6B/H+pRI+syKmb3iiS
	0XChM3iLguGpBRmNX8DnKX3XfrDwdW4wu2bEMes5d5uk8bXy0jryaICfh39lgOJFfAsKM7lHY/N
	kunZ6En2MN2wrJlTnVF/nUksGKIj/beGpiqbdKyhtBF8VfrQeHYkSwqE4fuBc2V71pq4aAzrrN+
	mRumpYxWEf09OdvAZ3yulIaVKKPNTWEJFWgwbgFbEyyzvIysOgaR2fl0/3rsfEnJUOzEQNRF/cU
	WIDfe3y7I0JYjCRwECsNRcA4w0
X-Received: by 2002:a05:620a:4891:b0:8ef:1157:6a05 with SMTP id af79cd13be357-9090e6e24ffmr112480285a.19.1778289928236;
        Fri, 08 May 2026 18:25:28 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b87c4036sm364341085a.24.2026.05.08.18.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 18:25:27 -0700 (PDT)
Date: Fri, 8 May 2026 21:25:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
Message-ID: <3f63207b-2e34-4b7a-875f-e7a1294ae30e@rowland.harvard.edu>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
 <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
 <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
 <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
 <87d93b07-be3e-4c36-a6cb-97190560f648@rowland.harvard.edu>
 <CA+Df+jfP-idvQqNrGo7Tc7+03ruh6kBa=MOSXE1mwXL2VqLNrw@mail.gmail.com>
 <a756038c-270b-455e-9f53-51b1ad6a31d0@rowland.harvard.edu>
 <CA+Df+jf=UaVubKM1Pfu7sgREUMYv=6QMi94mbhhefjhXq8-6uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+Df+jf=UaVubKM1Pfu7sgREUMYv=6QMi94mbhhefjhXq8-6uw@mail.gmail.com>
X-Rspamd-Queue-Id: 9F06C4FD45D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-37169-lists,linux-usb=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 01:20:04PM -0400, Dylan Robinson wrote:
> Perhaps, rather than treating this as a "specified start frame", it
> would be better to think of it as a "specified start service
> interval".
> 
> If a driver requests a start frame that is not specifically available
> within the periodic schedule, it seems reasonable for the HCD to place
> the transfer at another valid position within that same service
> interval. The actual start frame used could then still be reported
> back through the completed URB, which can be inspected by the driver
> if it needs to know the precise scheduling decision.
> 
> For endpoints with larger polling intervals, this "nearest valid start
> frame" approach seems appropriate, since the device cannot expect
> timing granularity finer than its polling interval anyway.

That makes sense, and it should be doable.  At least for ehci-hcd, and 
likely for xhci-hcd as well.

> > What if the HCD only supports scheduling up to 256 ms in the future, but
> > the driver asks for a start frame that is 400 ms in the future?
> 
> On macOS and Windows the submission would fail with an error. That
> seems appropriate.
> 
> For example, macOS has the following return status:
>  - kIOReturnIsoTooNew (Too far in the future)
>  - kIOReturnIsoTooOld (Too far in the past)
> 
> On Windows, the status of the URB is set to USBD_STATUS_BAD_START_FRAME.

We ought to be able to do something similar.

> > What if the periodic schedule is already full and there is no bandwidth
> > remaining to schedule the new stream?  How will the driver find out?  By
> > getting a different error code from the URB submission?
> 
> The driver needs to know if the stream cannot start. What happens currently?

Submission fails with a -ENOSPC error code.  On the other hand, if the 
schedule is set up when the alternate setting is installed, and that 
can't be done, then the usb_set_interface() call fails.

> We can ultimately only provide functionality within the limits of what
> the host platform and HCD are capable of supporting.
> 
> In general, the more precise and predictable the scheduling behavior
> is, the lower latency and better overall performance the driver can
> achieve. Falling back to unspecified scheduling may allow basic
> functionality to work, but at the cost of increased buffering, reduced
> synchronization accuracy and longer startup delay.

All right, let's say what Mathias and Michal have to say about this.

Alan Stern

