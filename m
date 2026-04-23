Return-Path: <linux-usb+bounces-36448-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANBICpgp6mnfvgIAu9opvQ
	(envelope-from <linux-usb+bounces-36448-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 16:15:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A38D4538A6
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 16:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E4F03027121
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 14:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A04C3126B2;
	Thu, 23 Apr 2026 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M+zgjiKZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0174310645
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776953539; cv=none; b=QP2a698ns0En0TTDpXuHt5xM5wKTlyLshJegrn5PC2Ps8mtc97hT8SxMZ1BtiBiZtFjb67uKFihusoguWYtMAUhtjU7svHfmxdoTVaBl5ruozxZJSFKtYBIUa4878CKw7LY5yc03OgMeOoI306hkJVFmB16J332wEdmUwFwM+II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776953539; c=relaxed/simple;
	bh=CYpfZ5+H1JyI1bv1dBpgpaySxrG7T+T6qdpZm6w38vA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glWCr840uzAYNlzAEMTfquipB7hAPwG4co0Jbc7qfBBMn7IU4KjKqiwGFdFMRUD5qSSdcLD60qZSYTgtRD+p/gFual3v9CvUxcJ58FsvxLBehTB3OvYlLEzV58OMaD4ZfCbFZj2dkR4A3XHjcSm2rt0rQOoet4Mi1yb70elCkwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M+zgjiKZ; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50faf8ed9c5so21619471cf.2
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 07:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776953537; x=1777558337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RfVXoSDN+EjAGzn6hfMykcKvutu4N1EET0vq4VsxOaI=;
        b=M+zgjiKZb3wDEI/oEa9tZwcFhXgjInYoch7/faiP2Z3BL9POh6tUaJlzWlUompjM03
         3GKMmUT7ofLi7uoPCfv8MXscKiaZ2zmDCUifijtKxXI0abqHaxfuX9c82e2jfymqllVs
         Y5BOQORqb+tQmHeBKicyolvFNbJaSqvcJdK53BYATLcybphiK8FYGiUcihfaKVTo+TXL
         i9uXjcXgZJUmvqQRCtFhtL7lFE3cI1ZnJlVWsO1uiNa3IPzu8KB7TpEGsardMW6IUefQ
         QwOXpHUYGcnZsCpfxfxrSD31aWpzFm43hf5RkE8qj90u3o0IfM1Ac03TJO1a4zSHH8ys
         2Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776953537; x=1777558337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfVXoSDN+EjAGzn6hfMykcKvutu4N1EET0vq4VsxOaI=;
        b=Ij9LXMt6Ya5EJkHekK5qWBfaxYTZi/0X7FB9XcuXaWn3SYxV8KO3Y9cdipLvm/48+Q
         xOT4kzv4pIO1y2OAiEAoTxAVlz79JCQUNABTZgluCfytqvWFGTWe4K80dM79Ucg/sNba
         Tgrw63t+GhNUDpQLPS/LjT8pPgFWv1gwC1g1nTL6QIILs8cNbt+amG4Px/IGjw7xkmkQ
         wrgFEigtyZ0hu79/hVhtD2YDTIPJOjugKmSEnRe8X4yrdVGzRZlF065f5MUQsWfHZM7W
         E2aMTc99GuNFbiL1tdpClm7exQZBxevohm2jON2CbHmmnBMCfVbmx4PIlY+zbtsDsIzZ
         SRqQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tVl0pfYKJzq5t2kMEswiAhYIeDX6lx81v9tRcvTAyYsjJkEYLYuJFT2CSYddmI3E9OWBJi1/0Ulw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcRSuKAM/nT66OW5bBySQ2tRGdHdRHWJjOMr3U4OL+4LYBEY5Y
	pjl8G4UnVwFM8TQjldJ2bILFqmnuUvNrb+PBFy0iOj+Wovsy3xzw0LTxf41lwLRBCA==
X-Gm-Gg: AeBDiet5P3upIBGs6rn9bTI3SP94WzxwrLVSJZbqAS1FNv/IMeoakVb8e0U25yWpQlo
	i2r6Bpf0PHBJumPeNoegJhqCG7t/u08Ndy5H55+tkefIMYeRQLsFL7w9qvZfQfrtynAbLr4NFxn
	Q6IZbThUY3inAXfDy+GxJwYKJSfwLp8BV7yf9HOfOzqUNaIspcwgRReerjF57I0dwxKU0WwY4Ye
	yrhB3lOa9FUd3OcmWRhKS7WL0oF57+vVL1HoHEIOYItg/AWNp33rxIb2R82oYFuuHHvZjreiUGM
	vJhN4XkS/zed5f3WKVDCbQEiv8crVun6xiu5YdhxHotvRb8JXYtbhAwSoGCv0FZCgYsVvt6FLl+
	KWyRKRwI5GhmZpfz48u3/P/+LGF73Y5by29ZUco3HwZNsdnDseFCeWVGTvXnF0elmwpgT1d5EqB
	6NCc+n1rwgnewAC73dh825lzRzZ78nT9PQ5hoBdGB5koq26r4HkeRE
X-Received: by 2002:ac8:5cce:0:b0:50e:63b4:9b9f with SMTP id d75a77b69052e-50e63b49f5amr244801921cf.55.1776953536718;
        Thu, 23 Apr 2026 07:12:16 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e39130d7csm157948201cf.0.2026.04.23.07.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:12:15 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:12:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <557aff2a-5124-4067-8637-6dde703f919b@rowland.harvard.edu>
References: <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
 <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
 <20260405030954.32jbg3fphi5xdla3@synopsys.com>
 <74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
 <65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
 <54fd265d-4ae8-4573-b618-587af98176c9@rowland.harvard.edu>
 <20260422073054.0bd482ba.michal.pecio@gmail.com>
 <e06dcae8-5b8e-4e58-a0cc-1c67e5a08170@linux.intel.com>
 <143b5a40-4ad3-4ec2-b061-bc083635542b@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <143b5a40-4ad3-4ec2-b061-bc083635542b@rowland.harvard.edu>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,synopsys.com,vger.kernel.org,suse.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-36448-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 8A38D4538A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 11:35:42AM -0400, Alan Stern wrote:
> On Wed, Apr 22, 2026 at 04:51:30PM +0300, Mathias Nyman wrote:
> > On 4/22/26 08:30, Michal Pecio wrote:
> > > On Tue, 21 Apr 2026 22:11:41 -0400, Alan Stern wrote:
> > > > Can you confirm that it's also possible for xhci-hcd to prevent
> > > > control endpoints from restarting when a transaction error (-EPROTO)
> > > > occurs?  Up until usb_reset_endpoint() or a new callback?
> > > 
> > > Doable. They halt like any other and it's SW's choice how to restart.
> > 
> > Yes, doable.
> > 
> > Would this be used in cases where all hope is lost and we want to reset the
> > device, canceling all pending control URBs before restarting the ring,
> > thus avoiding sending any extra URBs to the device just to wait for
> > them to fail or timeout?
> 
> That wasn't my intention.  The purpose was to avoid getting into a tight 
> loop such as in fuzzing tests with dummy-hcd.  When a device is 
> disconnected, if the class driver's completion handler immediately 
> resubmits after a -EPROTO error, and the resubmitted URB immediately 
> fails with -EPROTO status, the resulting loop can use enough of a CPU's 
> time to cause a "CPU hung" error.
> 
> The same sort of thing can happen with real host controllers, although 
> the loop won't be quite so tight.  But if we prevent resubmitted URBs 
> from failing until the endpoint is reset or restarted, that will slow 
> down the loop a lot.  Especially with a series of increasing delays 
> between the restarts.

You know, on further thought I'm not sure the benefit is worth the 
effort.  I'll see if the tight-loop problem in dummy-hcd can be fixed by 
changing dummy-hcd.

Error recovery for control endpoints would be tricky when an error 
occurred during new device initialization and enumeration.  Avoiding it 
seems better.

Alan Stern

