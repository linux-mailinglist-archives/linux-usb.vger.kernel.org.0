Return-Path: <linux-usb+bounces-35275-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8slxLEnAvmkJaQMAu9opvQ
	(envelope-from <linux-usb+bounces-35275-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 16:59:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCE02E63F3
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 16:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1529300D36A
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 15:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E23378D80;
	Sat, 21 Mar 2026 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="d7cFh1oN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9397184
	for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 15:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774108739; cv=none; b=BMp3BrVZfO+mIpVCX35tb5Sn8YPQ5N6ZxB/75NAdoTbfF13YMI3nos4WLW7FJpEnc7Xz9AG3HAClNblZlStYvgRnBjnkGWC4uSBSrqMDwivOm6bbI17wUftbRZwc9kgn5Zm8BDCXJCKurgeTFG+xScZpwjv8Zq+v28tSKGT7Phc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774108739; c=relaxed/simple;
	bh=SiodWoSXu9+caLrSXyvdSQnn2ekiWv17t8Jn3ctG73A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oTyLYIJBe68G/IMz32bnSwJjxSV+R/XXiL8skCVrm/B7TsYJhRyPICvyAmLoi2BgMmoGKbsFrAulzy5TZSC0/R7aKpnnYbBTEv7tdWLCdtiPAjBdBqGPwtbjOnECs+A7g73Wl2Z6PgQG3NIDz+wwsyIIRVTQRQIB7SrZTUL2t4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=d7cFh1oN; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-899ee491af3so32248366d6.1
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1774108737; x=1774713537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKVhUOfkuzK/fGCk0GqCxgldiTxu/DepeOIIv4MLeYY=;
        b=d7cFh1oNuQKaHqZEKPNua+WP1lYMG1X/j3DZzl+2uPRvwm4/6CdJTkE2QTIlDgrakj
         z8ljO9rueSIsdtWZ2tRvbJuM+i+N9AYZP4XcpnpTGMIpfAnVZpQhRZS7/x5Ry+TpexJi
         5IxD9TwQ9kEb3izIeEOtu/l+tTmffidIlP1M/1KQpkuntAYgBhlWdwpWN+pkQY0+cNIs
         NL9QdMzOg1P6C1X1vJ1X4sPDVKPTS5/gKn109XVZN6mQFT/+maUkVGpe1yAvz5w3rMWX
         QPMm1jdSbROsOeas7dv1cc9/Z5ZAz4G1vU9c0UzC8TdmDW853X2FqrCP/qn0qc5IJ5X4
         HpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774108737; x=1774713537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKVhUOfkuzK/fGCk0GqCxgldiTxu/DepeOIIv4MLeYY=;
        b=q/+kKrHkUvPwctZbf68ZhicDVUm6HOg6Hki30bTTfqczU9b2chss4Lhg+jfykcehwK
         l0rPrwHYikstRLRh9ZF6MbanTW7i2ZZ858/WYbzzqsnpqEP8pTLJH2D6qAMfmywwld9a
         a31iFslN3R1I2HoZtDBdACPIFeGk69SuTHHNgix6tdz19fSemQ2e6Dz2rZDUAiduY7l1
         3B/D5/gbnaF8coNcRePhio5ghcmubrWCiHAWLJRFPwNngBewzgiixgqF/euW8IAaodBg
         9/NMhLm99ly/t4HR5kZNxLllRMArQLFnTygDhAy9u0MUNfvoFBrM+FuJCrrsamjrLIKG
         m11A==
X-Forwarded-Encrypted: i=1; AJvYcCVeTSMWb0Ryueqc2kEeHkyE4WL7iAWraTajgSw2QKsvYCyrInYqqD/GBbDeE4/4FDAzb52vg/MQEu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjy+xJav2KkgbkZBoweP3OW+C4wHrjhZCzelKFbsVZppATILYf
	HlPshepCtJjLEWEczSnKxBKPPExZ3Jyl/W2Qr+lVtWRzT3+aNxXYcl/fwRq21VtT3A==
X-Gm-Gg: ATEYQzzEuIFXtlTzqvjfpEWMjjKVQwkRDFYXmS8xDny1X+vin+1DNlXevF2NBNGdR9N
	fWzt6LYK/duh7XJj/dHYIcqLzepBcKtgsL0v9GG2WBUROdtPgT2b41ByJm/RhblE5/3ijbbBEyd
	SzhPIDvvm/n4H9SoSQT2QGo2ebzkDUxaOvvvD6mnOXlAxatZmIhsDbNRkPoHTYfkQ8BjUTJcR1f
	H6CfT8epjHcgxa8+PawLmvluCChX6r1CGdzIWKiJH/E8mwGwL8TXmpPfpZGmW8lBlHLqmqz+Fs+
	fetMWZFOeHc1PdyYFZTus9JA4wImTQZnenIH8dwG7Z6o/CRrPhxkJJFLY/+5vIZQAbw0vi6ff9N
	RODvgE7NqhDYHeGo9QnaISKcty+QxWjz3YYDjcMhAL6RJfXSBjE8nf4564A4uHmfyr16PWh4Nsl
	sV9WPofwR1WF4ELFoeWL9oAAmJVqg9l2Wc6w==
X-Received: by 2002:ad4:5e8d:0:b0:89a:3013:be02 with SMTP id 6a1803df08f44-89c85a379dcmr117723006d6.34.1774108736872;
        Sat, 21 Mar 2026 08:58:56 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::b00])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c96cb614dsm15687136d6.22.2026.03.21.08.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:58:56 -0700 (PDT)
Date: Sat, 21 Mar 2026 11:58:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Oliver Neukum <oneukum@suse.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <d3fd1c0b-d0cf-40e2-9f21-b4c5de1c421b@rowland.harvard.edu>
References: <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <20260318235920.ioek26hdr25rkksp@synopsys.com>
 <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
 <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
 <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
 <20260321021439.7pmcdrpb5oxbivct@synopsys.com>
 <20260321065424.76a80508.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321065424.76a80508.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35275-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:dkim,rowland.harvard.edu:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BBCE02E63F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 06:54:24AM +0100, Michal Pecio wrote:
> > The clear-halt doesn't have to be done after the unlinking of URBs.
> > The xhci endpoint is in stopped state after a reset ep command. As
> > long as the class driver doesn't submit a new URB to trigger a
> > doorbell ring, the xhci driver can send a clear-halt after a reset ep
> > command and no transfer will start.
> 
> Nope, for many years now, if not forever, xhci-hcd has been restarting
> the endpoint after giving back the failed URB if its completion hasn't
> unlinked all remaining URBs.

How can that work in the presence of BH givebacks?  xhci-hcd doesn't 
really know when the completion handler runs.

> Changing this is one of the issues under discussion here. It would take
> a few tweaks to the driver.

I think this is something that should be done in any case.

Alan Stern

