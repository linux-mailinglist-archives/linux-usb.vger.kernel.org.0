Return-Path: <linux-usb+bounces-36713-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCK0A8lc8mlYqAEAu9opvQ
	(envelope-from <linux-usb+bounces-36713-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:32:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F229499D4A
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EBBD30182AD
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 342AC3246F4;
	Wed, 29 Apr 2026 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="izdXrErr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6648F2EFDA6
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 19:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777491132; cv=none; b=LEFhlYagdjw4idpHTqdTkD5uz/GYm0tOm+7JOlRA+c2zpBCaEX01ytw0Qy4F2ia8RdS0uq3aed+BuwJ9foCfloFetw5Shm8+XSGsRyN2f1B45ka1+d+/qC7ulmqi792NU6xhxKYZb2F52z6pV+lUGeb6bWHahc1Z9gaDAlzCVnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777491132; c=relaxed/simple;
	bh=6DRv6GgnqCgOVIRELjlgmcDtKnV66QIj8oAnkY2KBT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRGcNzzd6YV/k21a3EVhQmIeRCKJRBgl8Yyrq6AwFF0vjqlbIc3QKRidhMQXyVkixUymTBfsYeBwfHV3CILoc6c7MPhwTZCb2WYe9q05cKK/jv4WeVXtw8nz0jXpluWF238YdUvB7JisvpEOlm3rG5j9Rmb+l99h2EgtjJU3kLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=izdXrErr; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-506aa685d62so480351cf.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777491130; x=1778095930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+JhgCvESru/YpY9+NcjI3KlZiUeidLhqlCRf0vtMITs=;
        b=izdXrErr6QQIwgM6+RIylhDRUcuy8Nz4iWBVXbH/EQCdlSEMw3JN198bCuIDOqyDit
         4l1/A9nTjK+dGX85l4VwMio169EY7OJuyc/aUosWZXdX/crZssibXtJI63JhI1Ey+YDc
         AMd06+FICCsER3HhdPV+rRNu5usdC69reBak5cOtaV5h5Er/q5Nj66er2Cyw8/4N5FDU
         WFU2BLR+mWDEj/6v8Utxl1A8xuFDKGqIxMDR1/5bWh/vxTgVrnvgC2xDCRg0bWc9P3/h
         H5Xf2XljzTs8C6Hsh5D+zdkDCtCLdjK81nzPsxUSwiQgKtovOurihezca4kfKb+QGm+3
         K3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777491130; x=1778095930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JhgCvESru/YpY9+NcjI3KlZiUeidLhqlCRf0vtMITs=;
        b=P5ZK8a9glTtTie7UzFwYYWPGVqQsn+2zsPkP5j45OAHOumT4KVApNoo97SlRLioRZI
         JgIAt0J53dSQYFXl0r3M6dIRvScl4/tUxRGRaXn31rmluv/6J6n/ZpyzAvCr2BDorQwT
         i5PyonS28iYRE8NwGO4MEFzHQXIFnXhlXtxItgpI19zMs1b3S8Uaj3L4bgv9X6umJ4c5
         OwwTX58+fdkTlYwLztP8zfMu8eSwXbtFLn48xJMYC+K+f0+dT0YBiDMpIvom/9Y3y1Z4
         x+imoeMhAavo5+O62rJ42Bz13LFfWKWalWcGoUXeZ90OkcS/JDknas4LoTWNOd2xNZE+
         lkjw==
X-Forwarded-Encrypted: i=1; AFNElJ80ezbn0dppSGTKbJDblmDvMHolTP3sXW1o0Ex5TYEXbzvfW9K/fxjMZDqpVn+nO2MOWyjI2dyzXuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnyA2hRLQ5e6s6h3A+4pdqabMO5qct7R+8QiTqm2vVdvqdEgjN
	b+Ywb8A8w6QvEyRRQaX9cpnBfxCh3heDTDIXyEO1DNrKh+JLNBzrPTfyi3/rOvMcvg==
X-Gm-Gg: AeBDievXcv+6B4cKQjXrOhbUZ75nMdoIr5+UDRcuecunBciPzS6lDHOngdO8DMS5Q11
	4/SuH8BTaykUSQyw/eZkyB0YlYawoM5GrjldCl2G1ols4CXaAfs1hpJj8p5O2u3aJDvKpyRRTFP
	OU7NcX2h6IGoJIesticdHOc+o/LC2m/W1uTw6IVn53fEXXMmpRHwwrrV4O7HFl/eZ2ejBJr1jdW
	FLKWvEE52020PZ3KIVYvxxfuq7j7Pg+nNgn+BohckjPNTqVlQbLM0oucWX0gGgbzdTtdCDoR3wl
	ODRDK8aZEnBjlRckVItCJEDfeJk0/wRHjdyuPDxd6juB23YHE3CWrjoG11M7Cxr5tiAdhKuWlkZ
	Sa1Ro92P+TxCWr0I0/7MnUkYr8lrf2QLQ0dBF3PIR5GqtlBcHGLMicT96HUREPkuVpHIH99lEoM
	UZ5P4SOphCPcsHw3hVbGXjwiCQq2om9HFpUvAEh8D0+U6WxwZr5jECKfxoYXlDnRPMm0rH9S9vR
	0qsyQ==
X-Received: by 2002:ac8:5cd1:0:b0:50d:65ec:a071 with SMTP id d75a77b69052e-5101892160amr78980991cf.5.1777491130231;
        Wed, 29 Apr 2026 12:32:10 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5101ae8c6aesm28259611cf.24.2026.04.29.12.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:32:09 -0700 (PDT)
Date: Wed, 29 Apr 2026 15:32:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Brent Page <brentfpage@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: TT budgeting for EHCI; =?utf-8?Q?accom?=
 =?utf-8?Q?modate_1023-byte_full-speed_isochronous=E2=80=93in?= endpoints
Message-ID: <49a41b4c-34ac-4627-adcb-d0e989470610@rowland.harvard.edu>
References: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
 <32291bf6-0c9d-4fd9-9dd7-489f7e1c9f02@rowland.harvard.edu>
 <20260429113604.2204b646.michal.pecio@gmail.com>
 <a3176296-bf99-4486-9310-0b70f28c1ba7@rowland.harvard.edu>
 <20260429212408.299826a4.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429212408.299826a4.michal.pecio@gmail.com>
X-Rspamd-Queue-Id: 5F229499D4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36713-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:dkim,rowland.harvard.edu:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, Apr 29, 2026 at 09:24:08PM +0200, Michal Pecio wrote:
> On Wed, 29 Apr 2026 13:56:01 -0400, Alan Stern wrote:
> > On Wed, Apr 29, 2026 at 11:36:04AM +0200, Michal Pecio wrote:
> > > The host must schedule SSPLITs assuming no bit-stuffing to prevent TT
> > > buffer underrun on long OUT packets. Assuming minimum/no packet headers
> > > further minimizes downstream idle. TTs are required to buffer this.  
> > 
> > There's a difference between scheduling and budgeting; it sounds like 
> > you are mixing them up.  Roughly speaking, scheduling refers to when 
> > transactions actually take place whereas budgeting is concerned with 
> > when a full/low-speed transaction's SSPLITs and CSPLITs take place.
> 
> I meant "scheduling" in the sense 11.18.2 and fig 11-61 use this term -
> deciding which uframe to execute SSPLITs in. Of course it's practically
> equivalent to "budgeting" the downstream transaction, so fair enough.
> 
> And what I really meant is that OUT SSPLITs must carry 188 byte payload
> each and their count must be appropriate, that's all. If EHCI HW always
> sends 188 bytes (if available) without babysitting, that's great.

Okay.  And yes, that's what it does.

> > > (BTW, periodic transfers should occur before async. Could the TT run
> > > out of periodic, do async, then get an unexpected periodic
> > > transaction in the next uframe? What happens?)  
> > 
> > This can't happen as long as each SSPLIT transfers the smaller of 188 
> > bytes or the number of bytes remaining.
> 
> Yes, but per spec transfers are budgeted based on wMaxPacketSize and
> actual SSPLITs may be shorter, while subsequent transfers may still
> remain budgeted into a future uframe.

The actual SSPLIT will be shorter only if it is a short transfer (that 
is, shorter than the maxpacket size).  Hence there won't be a subsequent 
transactions in a future uframe, even if some are budgeted there.

> So it seems that TT must cope with gaps. Maybe it's allowed to fill
> them with async? I don't know, I haven't found clear answer yet.

No, it won't happen.

> > > Including packet headers for SSPLIT scheduling seems harmless unless
> > > overestimated, but apparently it's not required. TTs must cope.  
> > 
> > Again, budgeting not scheduling, but yes.
> 
> As mentioned in the followup correction email, it seems to be required.
> If nothing else, it ensures the 16 transactions per uframe limit. Not
> sure if blind budgeting solely by limiting data bytes and transactions
> per uframe would work as well. Probably not worth finding out.
> 
> > > BTW, does ehci-hcd support scheduling CSPLITs to Y0 of the next
> > > frame? It's an edge case which likely won't occur with one 1023
> > > byte endpoint, but it may occur with more periodic endpoints and
> > > unlucky bit stuffing or with periodic BW limit carefully increased
> > > for testing purposes.  
> > 
> > It does not support CSPLITs in Y7 of the current frame or Y0 of the
> > next frame.  This is one of those limitations just mentioned.
> 
> Then I think it doesn't support 1023 byte packets at all. 1023/188=5.4
> and if worst case bit stuffing factor is 7/6 then up to 6.3 uframes of
> transfer time. Completion in Y5 or Y6 and CSPLIT required in Y7.

For iso-IN, that's right.

> IOW, you play Russian Roulette with bit stuffing if you enable this.

The driver is not perfect.  No doubt about it.

> > Adding support would complicate the driver considerably and yield
> > relatively little benefit now that xHCI is so widespread.
> 
> Fun fact: not all xHCI supports it either.

Heh.  I'm a little surprised the xHCI implementors were able to do all 
this scheduling in hardware in the first place; it's not an easy 
problem.

Alan Stern

