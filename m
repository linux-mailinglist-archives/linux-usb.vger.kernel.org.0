Return-Path: <linux-usb+bounces-35822-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENmBK1HTzWnVhwYAu9opvQ
	(envelope-from <linux-usb+bounces-35822-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 04:24:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 227B1382A26
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 04:24:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA80B30E7BBA
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 02:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225E4336887;
	Thu,  2 Apr 2026 02:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="LhCGhTkn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0303A2848BA
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 02:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096459; cv=none; b=q/7AoZ1Oj1SLfJDnzYsd+jeh6EMtPcOD8MoUPBSEqVy2OjGTxD2xlXsrBVFmCLPWkO1FAkLgH2jhh7zk+wcs9Gj0jPT3KUhKtjLgjUWc/WmrmAH+MO5kC5JIvVb3Zl2N7qgiyHbShW3NAMswFdZA4RU4AWuLbBDo6T6IUMwa6As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096459; c=relaxed/simple;
	bh=ycTVm9fBUPMU9Vp+rwKYcRqX2G9nYJTKVEE8SYElERw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHksiP7HqFvyUy8A5WGggB97H5eDYfQhQ8B5xae7MD0q0vx8leODSGDJ0X1ZjXsieiGeirPjtHN5wYB4bqNAdwoDlRefETE/3sPLdquPdHkbMBEpIN11pwWRHpBVmAxpzEXKsBbU14tn/X9tStJFANn8pohSc9XkyP37b0POnKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=LhCGhTkn; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a3970f1a0eso5256286d6.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 19:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775096455; x=1775701255; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8PBfoXjwXX6diu+9e4EdlsT8PYHbIzIhMdZEjZKN+/Y=;
        b=LhCGhTknCSJObr5GL1jQLsZUJkh0W+aI4yPVBr/ptmDMXd0mz4i/LDtV3fFEjoJNx6
         FjViAeP85aqLJQKgPGjX/FzoX/GnU9p9zLjCS4zZHwqPja51AESQa+NWtuAY7LBP2y6z
         RctYvhuGrBLCfSOCUKu2qjl3UPGBSK3GYalyLVawaZKJuGx/I/MEKJsH+hGXo8UfwuFB
         HbTNeSDSEJkMNB00z3qHWEiLqJ05rtTQQqmVYnhzAaTy0uJdEr7eiXr7cL9Dc/zOJ9oZ
         LpNqegeYxYXwzqKlvRv2JHgKcmtjon7x842647jptvHjAgiBMGwKW9mZU+/Md438LQ1J
         4G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096455; x=1775701255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PBfoXjwXX6diu+9e4EdlsT8PYHbIzIhMdZEjZKN+/Y=;
        b=fi/UNw2EdexMvDf+UJi1Xif9/yv6cWZKNSsAmqIez7HW1loThTC8Clx2zAdlM/1YZJ
         yTT2BkqVsA1hf/EYBkY8sP5EM2mF2mfjeHz7yauMeZ9x5QYoKSILvIDbrKLH74LRdruI
         gTdpZUOvc7R6kwn5uNBT0Q18wpAzZDMfpuiYwYYs3TgD+29xmD5TwJT3BfznHdCGmunh
         nzIT9wBs+iNqO5Xa+6jAtF3KlRFs7ygNGICtNnj+9IAnYuJGQlI/lJwT/Qz0d1ZQDKBr
         4SRBzfnCB3t172TnGOjcdjHmPT/0vI0Jaw2BpZbChOTVQzW9NtxvsXWZkCtL/7otBD3U
         MrUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXvvyVUlieas8eF071NDjgi1pu6BWLSI/U7GedYQUZb6YvArsxfxl1gekRc8y15PBKj1eCmyyOE0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YynlMdHtV6ihy31kTC0Jkks/KG1kZLdgdBDu+mHCTGsV6RyePwS
	n6euQ2IMUnpEVmStW2QvBff0Hxb/e+51+KAe38+SPgV10+jTB6oKGKpaIxQHynsQ5g==
X-Gm-Gg: ATEYQzw4/l6CJ8wZHvUzu1MEhScNA83fMsNU//8iXmRDEscyN8OBw6K81zTfOQNnAby
	gf3bqFn1xktcTCqJeN8DgdQSkwq/Pd/IirbqHLGA5JGJ8IvFAKxahmR8tr2OXpzWH8EIAyma5qf
	Zp9aufvJE/KO/ngA0c4TTg7dWdbOC9ohFlcmFMY6Jwo8xxujK5SQT7/dxYCxmE+jgmr2caCE9lP
	KxHGi6ubvawkVa1+A2+SyaFBcT5CEsbFA4eZdqMKGUjyNKrGY5J4sO1jnywN/lxdC9cujIdhvbz
	L/Ur8pCUCSK13s79Fgn4MoH+0cZpg+l8TPj4AtOY6csv6rauAVftiuqyOKlbP3Tt1BOjYVuo/pZ
	+egQGz1099sRv9AhINJ9t5a9h4eUw9z8D/UVl6opBliCHT9YoqVKCYj+Uu2B9cnqqU7TaSa0kss
	821Fh0NHOjQFTtvDqoPT2EG4h1
X-Received: by 2002:ad4:5c6d:0:b0:89c:e290:c176 with SMTP id 6a1803df08f44-8a5a10d7549mr30393446d6.57.1775096455601;
        Wed, 01 Apr 2026 19:20:55 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a596e03cd8sm11367706d6.33.2026.04.01.19.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:20:55 -0700 (PDT)
Date: Wed, 1 Apr 2026 22:20:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Oliver Neukum <oneukum@suse.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <7ee8c7cc-da0e-4298-b288-51271ab335e9@rowland.harvard.edu>
References: <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
 <20260321021439.7pmcdrpb5oxbivct@synopsys.com>
 <20260321065424.76a80508.michal.pecio@gmail.com>
 <d3fd1c0b-d0cf-40e2-9f21-b4c5de1c421b@rowland.harvard.edu>
 <20260328222217.297200bd.michal.pecio@gmail.com>
 <22c70ca7-57dc-4328-a5cc-d46c4f73556f@rowland.harvard.edu>
 <20260329184611.0afa92c7.michal.pecio@gmail.com>
 <ba68bdbb-9ffd-47d3-8915-9e2e40fd6adb@rowland.harvard.edu>
 <20260330143600.0594f0da.michal.pecio@gmail.com>
 <20260401235022.67037c98.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401235022.67037c98.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35822-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 227B1382A26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 11:50:22PM +0200, Michal Pecio wrote:
> On Mon, 30 Mar 2026 14:36:00 +0200, Michal Pecio wrote:
> > UVC allows both isoc and bulk transport. I have one bulk device and I
> > found that if I randomly change urb->status to -EPROTO, the URB is not
> > resubmitted but (on xHCI) the endpoint keeps going, until it stops after
> > 5 errors (no URBs left). EHCI would presumably never restart at all.
> 
> I tried this again with real transaction errors (dodgy cable) on EHCI
> with disabled XactErr retries and I see identical result. Failed URBs
> are never submitted again (checked with usbmon) but the endpoint keeps 
> going as long as there are other URBs remaining.

> Not sure why it happens, maybe it's just the async giveback race,
> but it worked like that reliably several times.

Well, once we have settled the issues surrounding transaction errors and 
fixed up the HCDs, someone will have to implement the class driver's 
side of the solution in uvcvideo.

Alan Stern

