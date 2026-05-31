Return-Path: <linux-usb+bounces-38201-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGzLL0ZAHGqQLwkAu9opvQ
	(envelope-from <linux-usb+bounces-38201-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 16:05:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8A261697B
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 16:05:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E25B83061091
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 14:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AB5310779;
	Sun, 31 May 2026 14:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="I2IY41x5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2EA274650
	for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780236226; cv=none; b=jILCLmZNB7IRyGVTiu+i3NODT1E6iSkN25Lo8SX3hD+bnLTBTqqRtmzj3HnmipHNrXw52cv5hF8JSUCWvfEBjx+jnrswY+QBVBrKVHYgyUUkZfrCSKW2yzbqizs6mFh9cz41nH2XslAcPfPb6HeI/psMjmBSPkY8/TsZNx90UVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780236226; c=relaxed/simple;
	bh=vNe64eDjGn4GLw0XrCFDDBvXs2yxDBslho63UduJbwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcVjIoZTsJxpwqvcDlccg0PI+E8pA78vO1hM4Ih4uXH8EB/VoghQgEP6+5fYWT/2BenP2Vv/l9k4G5XV34dVpAa6Vg8lI/tDTuz/MpPGgKZM0PxeCR2eNazOjDILovR4MVZQPyq5L+DE4NMags3rEI5T5NuUMQWsPe3dKhlCrhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=I2IY41x5; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-69de16f5e80so2248143eaf.0
        for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780236224; x=1780841024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ljB1jxMlNtHBF+nfBzZTTHQx5btMm0H7h1fYnkwnm98=;
        b=I2IY41x55Ixr+RbKgUHR6qOnuh2J8lnx8lXtrdHS4T9hGi0D1kZvaBzLV2povVT4IW
         IrNkjxCyy0jHYPoWxbdQwdczZeKRAiAuwx7v/hb5Fa7R+oVq3mtxRuCKllptHxRzzBm2
         EPiLd74XhWtiDhljk2NZ8JwwLmBxxFubnIVmvO5W7RWWF6rs9suMM8UUG7C2n1x8NPug
         ixw/edVjFhybhkNW/BnSOhLRO2kqCyvMEnxU3oITCKkp2ZvcpX/JaroEuLOgKVS3qhkS
         84ixQdgoAo2hNs8lpVWHNcbuz+WusPgIt0mDbzaKfM810Nc4A0tupwbW6ALJ96KdmZkE
         UoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780236224; x=1780841024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljB1jxMlNtHBF+nfBzZTTHQx5btMm0H7h1fYnkwnm98=;
        b=H/zQFt3I0rSf/kR5ELTejkz9ekjCIRcUWVJ540wJy5kxzOQRW67h6l2AvnixkNZowc
         E7R275OjpAURl2gR3kBRb9Ar9xKLlDgfhgBNl5XEHuFKmkIpd5EYX3IWmpLsDnY6DZOH
         ewl3pd6pkmSxTVGjIUfe2u0nlytgjayvVkIr+NDL7KTKikuR6Wmr4Fylc5iHIlQqsLda
         a62VwSfV8vwEB/1Hx4blC+pV+bELVfwemB4vhae1VoDLxL/BxVTCP9G+KkMPSjrsOGip
         KX979/2+/hcdNcvBMv1+XFIsVURvishlU6yRmWlr6SazriIy6JwRvpQF7CK/j61bVFKe
         EJ1w==
X-Gm-Message-State: AOJu0Yx2RXP3BpyJMo5lIpe1DkHcTBRlEUX+dg0/NIwOW90h7Ei///oq
	rFW2AyPDzjia0BIb94bA0hwxG/RofZPBui6oQ4AZodpNJnImB32R6Wib6nCuU7bWhg==
X-Gm-Gg: Acq92OGGFWPsyWwtl4kLxhjcQctk1bvQC2eRaIE6qSP+GMMZQFFhKd/j2PEZIqcjbHy
	7PHr7N0kl7HFlLNGVYpygnrcfFoyLUVCeXOrYTvNCxCl0mc+eWYnbho4KrIT624b9vM/msZPbwO
	gtlPUw4lpD+ppXTj7wm75xM/tyUTSwzI31Ca2Eu3172QjCAtLiDAOpXc+5ZuNrUQJltggrYu+h/
	6P3uSXxJ5OLkY1mdKsYZ/beni0RzZo7Cp9EDyUwZl0Ix/Dtsjw0ZzVdjGmmz3ePt0yidV1INLZ9
	j11glqHi9W7l3LbFlX+K/113Ng9xgGQmY3Q9OTKAj1vsj69xe+Yedqwr3VCKWe6OMNQvxENXuHJ
	npHl55trquKUJp5/+5+FPXsXj2uxTlC16Vs3FnT0Lim9B8Aho1cv//JbZJF52TOqZDs4akLN/Lp
	0HcDtcjKYgI/eqcRmxxPfPYXRRwUlx6WgwqlewQH19cCaZXt5dfXRjCQ==
X-Received: by 2002:a4a:ee08:0:b0:69d:ff30:173c with SMTP id 006d021491bc7-69e10305820mr3576619eaf.24.1780236223519;
        Sun, 31 May 2026 07:03:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea042373sm70044266d6.9.2026.05.31.07.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 07:03:42 -0700 (PDT)
Date: Sun, 31 May 2026 10:03:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	mathias.nyman@linux.intel.com, sakari.ailus@linux.intel.com,
	katieeliu@tencent.com, johannes.bruederl@gmail.com, kees@kernel.org,
	dengjie03@kylinos.cn, limiao@kylinos.cn, wse@tuxedocomputers.com,
	dev@a1rm4x.com, vahnenko2003@gmail.com, cs@tuxedo.de,
	lijiayi@kylinos.cn, oneukum@suse.com, bence98@sch.bme.hu,
	eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
Message-ID: <40d142d8-d9e1-4037-80a9-56cf84002a66@rowland.harvard.edu>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <351656ab-a188-444d-a09b-cf304796043b@rowland.harvard.edu>
 <CAFgddhKPYFKNDDESxvo4jwBCw=mnWWx7Jsmr9_LwawtUpkx8Fw@mail.gmail.com>
 <2a656f5a-bc8f-458a-a1bb-e66cc3a122b8@rowland.harvard.edu>
 <CAFgddh+6O+pnbrw1szM7_Q3Xkx8423qRptW=Yhf3UbBZNu0ZWg@mail.gmail.com>
 <242c4d8d-fec8-4693-9c17-91d763f68985@rowland.harvard.edu>
 <CAFgddh+3Ksi7aj=ZNdn0qum8zQ=d_HM=hVtoH224rEpfhamsXA@mail.gmail.com>
 <96dc88f0-15b9-44d0-9238-128e80dac02e@rowland.harvard.edu>
 <CAFgddhKrwt7aJSNO0mgtm_wFjnMWp3fXCA=XT+LpKva45+Y3tQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddhKrwt7aJSNO0mgtm_wFjnMWp3fXCA=XT+LpKva45+Y3tQ@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,gmail.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,sch.bme.hu];
	TAGGED_FROM(0.00)[bounces-38201-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 3F8A261697B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 31, 2026 at 01:19:16PM +0530, Nikhil Solanke wrote:
> > Go ahead and submit your patch.
> 
> Thanks.
> 
> Before sending the patch, I wanted to clarify a couple of details:
> 1. The workaround succeeds when the initial configuration descriptor
> request length is increased from 9 to 10 bytes. Larger values such as
> 16 and 48 also work. Would you prefer the patch to use the minimum
> known-good value (10), or a larger value such as 16?

Unlike Michal, I think the best change is the smallest one.  So 10 
instead of anything bigger.

> 2. Since this patch would be submitted as a follow-up to this
> discussion, should I submit it as a reply to this thread, preserving
> the existing In-Reply-To/References headers?

No, new patches should start their own thread.  Patches get threaded 
together only when they constitute a single series that has to be 
applied in order.

> 3. What should be the quirk named? I have currently named it as
> "USB_QUIRK_XBOX_CONFIG_DESC_FIX". But looking at the other existing
> quirks, that name doesn't seem to fit in. Rather than naming it on
> what it fixes, should it be named on what it does in the code base?
> Something like "USB_QUIRK_INC_CONFIG_REQ_SIZE"?

How about USB_QUIRK_CONFIG_REQ_SIZE?

> 4. Should I send the patch inline here or in a fresh email with a
> proper subject line?

In a fresh email.  Look at the mailing list archives on lore.kernel.org 
for examples to see how patches are formatted and presented.

> Also, if there is anything in particular you think I should do (or
> avoid doing) when submitting the patch, I would appreciate the advice.
> I have read the kernel patch submission guidelines, but any advice
> specific to this submission process would be helpful, as this will be
> my first submission to the kernel.

Make sure that the patch description thoroughly explains the problem and 
your solution.

Alan Stern

