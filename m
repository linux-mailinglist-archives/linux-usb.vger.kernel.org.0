Return-Path: <linux-usb+bounces-34828-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBeEJoXOtmkPJAEAu9opvQ
	(envelope-from <linux-usb+bounces-34828-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 16:21:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1032912EB
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 16:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 474A4300B9C9
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 15:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F095B370D7B;
	Sun, 15 Mar 2026 15:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ohRo5UDI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E36C78F4A
	for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 15:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773588091; cv=none; b=IssjGj9593LU6+g2r4IsTQ7NFdyGvHOjf4MQNqP9CZpSPfc8u5ri7EI89GxJRTShPuhlHYGqGcKRya3ozcjcx9xBar79ud0cTtrrWL4wEpbbmExxXbKhZHEIh+xjOJglUzLPUX5lh9J2mYrYT/UK7eZ14vr6Y7Thz0zfEzm3woo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773588091; c=relaxed/simple;
	bh=A1LAWP3RahAJLVp2Mla9OBiDtcCgAUOy3sHX0GS4bR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gllwJ9Va8H8nEC04/ru5o5TbsS6m+OAxzO7GjMX1KEFGJTSWmd4igT5x/SsYwJaXY9UExmRfovti69n1VUORKCiAFElp0qNoSrmV+rEdHrvr6J+AM0vKYxAJWOkAH2HNV+MM1WbWKPf44uO1fjQ+22fPqgxlFjmHD3AoX4Opl5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ohRo5UDI; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-899a5db525cso43832756d6.3
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773588089; x=1774192889; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yc40aXX3SR2kGjGUbvs+Lr0TrcsP8YHZMGuCzqhUjbo=;
        b=ohRo5UDIycfTdMIgfuwBc+luSXGpFcJwmP/CtijMZ4mqfl5GrPmDYFpZaIq2a9om9o
         NyLRjvp1eFxD4sBCtz5lJuRs+0EQDKmoWRqrEFXJbjoKZ0TrQXy4cg5ynGQHW7bgO9n2
         grgNUayySlH1QwfkK/lpCn/i9PdAoWs+6tdDj1JKPDmNxOKuf6sdJrgTF/jv+l6T1hl1
         fysVTCq2sYs+dMs6b71N7fmzO2Cx0Z4HeOI3vgkneTYtj+LED5GP2KrqmZQdP5MvWfKu
         T73mu7UXWPaQbIiPow3YTz/VGlmR1BLoHHm2jyGs1Cf0Cdhyo0YcgGj0uG46YPsy8gLl
         8qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773588089; x=1774192889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yc40aXX3SR2kGjGUbvs+Lr0TrcsP8YHZMGuCzqhUjbo=;
        b=WjdmNdLZXPZSouT1jSJsZF5RVvj5X/PMmk3JNqLwgXivkls+jteULOsEICdwgkaT92
         1pX9SsTmriDR+rM71pkiG7ooydqcf+P2LTZAW4vhLltKRTdHC4ZwIf1SQJnBSNI4VWf+
         GeF+axYDqEPql0hwkDstalSL2ULlt7FKqsTEy5S5P+3UeJ5H7xIkTovxq4OgRz5VUF95
         UrhhLZs6qSgCetvOSRL1nE3AaphE0LmULf2G6WOwPUZ+Gk4k/JDM3tJMvv85ujbZhD3b
         1/1UCBGGfrdOOfjg0tLqXRBb2T50cQ+I94AWDu4ubzyx6gyJb/mXf8UZrWt8UFbFHhBl
         0hQg==
X-Forwarded-Encrypted: i=1; AJvYcCW2+TlCfYGSOfVm+W3ML0Nka3XerHxiemOkqTrs49wr8dK9PiNm+8gL3LcPzKMHv3wtaNOxHTJyQFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNdTLp4Di/mVohHkRQmQfXalX26XVCVsly3rRR6r3LSV2mWCnS
	Bsi4/LvBfueMeeZFb2iV7IOf1g1abcNylGD3bHFwi5HwmQyNJTdv6k0yslD0JMPhGot9SOLLFdw
	4ros=
X-Gm-Gg: ATEYQzxCzAlr6wjBTiygStpbTiKpvzMXxw6Y1X7F8YlTdRDOEqM+gBeYCl5ULzWKjB1
	BPHV+KTZwvXkz9ulNps48249/jk3ju4rKlnSPT4Y1ZwLGZkwPAj/bRKEfYozXEMHm7vf1kd0PjP
	9XAwnwDPY2YyJn66FvZ3ZpQieP9O0sYGtu4QrP6g2kgY8ugVZoWQdGLSnxSr7A6YOsdBWOqgGMQ
	ajp06FwB2Cyz39NikZy7ztKBZtMjDWVerW2MsFBUywM01vAveq3H+/Jzxza6mD33Df3aknGFU40
	dQrd17KuJyKSXYJwP+Odr9+tDAHqWW7lJA6K7XXedUjWYXu6P59s2Jrh3dscV/qWAyEKBRfi8QC
	5m2z9ncdnmL50PNaQ8QNyQHSy40APwX+UOQ0atUXNOScab5iqmpmWnRbMnUgELnYsNzHEz0VvGl
	PEWNSy4zNZPKfNLt9qPl3tsz10
X-Received: by 2002:a05:6214:485:b0:899:f0d6:98c6 with SMTP id 6a1803df08f44-89a81ebb5dfmr146596186d6.38.1773588089167;
        Sun, 15 Mar 2026 08:21:29 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bd54f9sm103742456d6.6.2026.03.15.08.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 08:21:28 -0700 (PDT)
Date: Sun, 15 Mar 2026 11:21:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Urban <surban@surban.net>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: dummy_hcd: fix data corruption with queued
 requests
Message-ID: <68a2906f-0a3b-4543-9c56-795ae9d2ee98@rowland.harvard.edu>
References: <20260315090307.304644-1-surban@surban.net>
 <9f2c403b-5955-4e6b-a356-330cebead7ed@rowland.harvard.edu>
 <2131664a-9730-4934-9acd-8da72afb6ba5@surban.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2131664a-9730-4934-9acd-8da72afb6ba5@surban.net>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34828-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 8B1032912EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 03:06:21PM +0000, Sebastian Urban wrote:
> On 3/15/26 15:44, Alan Stern wrote:
> > 		if (unlikely(len == 0))
> > 			is_short = 1;
> > 		else {
> > 			/* not enough bandwidth left? */
> > 			if (limit < ep->ep.maxpacket && limit < len)
> > 				break;
> > 
> > It does break out of the loop when there is not enough space remaining
> > in the bandwidth budget for another transaction.  But it does so at the
> > start of the iteration following the last allowed transfer, rather than
> > at the end of last transfer's iteration (as your patch does).
> > 
> You're right that the existing bandwidth check at line 1444 handles the 
> general case of a non-zero request following a partial transfer.
> 
> However, if a ZLP follows a partially-transferred request, the check is 
> skipped because of the unlikely(len == 0) branch, leading to a false 
> complete of the transfer with a shortened length.

How can a ZLP follow a partially transferred request?  What follows a 
partially transferred request is always the remainder of that request, 
which by definition must have length > 0.

Alan Stern

> Thus the bug can only be triggered by a ZLP. I will resubmit the patch 
> with an updated commit message.
> 

