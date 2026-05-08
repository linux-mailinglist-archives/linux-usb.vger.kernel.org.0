Return-Path: <linux-usb+bounces-37115-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG87LkZU/WnZagAAu9opvQ
	(envelope-from <linux-usb+bounces-37115-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 05:11:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5714F0FFF
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 05:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D45F030234CF
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 03:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D3A2D46CE;
	Fri,  8 May 2026 03:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ckVTyv6/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A677D2882B4
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 03:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778209762; cv=none; b=AgGyCRppu212SZpu3i2s/PFdfH3a2yfF1+lDUbAJ+SzQ/5Jg3UIMfzDV5DWU/z2/KmTsJ/fzhXyFyTr/Kse2aBGFV87YzZGGVw/ZT/BtJpGIkdTH6l0HBd0pkObVreCXyM1jP+62LsB9bg7Z0jJo3f/L0UdsiRYBS0yPrrvM1jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778209762; c=relaxed/simple;
	bh=ZJPcapwTEKKuYDsyEMRsq1/1iiQ4ZyoIHy5KNq1nGgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rvwl8/HY/fk7oKC7jsU36kVhE8TYQRZrSr65AfsC+dJXl6GEooevA4BVYgr6g+hj3Dk7wtmZ5uCcEIRm3uOWyTjHJOwlMfyE9RrXj6E31xMFM3hn0J1ezSGZqortWgryjCVeZsVaG3SfhknMzyRfcdYXUiZe+0Vm72J2m91iO/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ckVTyv6/; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8b62ca1d28eso13778016d6.2
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 20:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778209761; x=1778814561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJi/3GKlv+5/JlhIkYtbDaqqLRZ1Gzp+vLpG4qOa+oY=;
        b=ckVTyv6/I7UNc23PAMCDTyJ4SFoDULQTv/lYa3eG+3qGVbaNSXgRNIEop2HVgrdFm+
         u192m8gGd6E4ChJOUBrtQSaNW5mhc5xzYaXsUkVbWvxlmtPHDEeRVlhiq0CO8XPVWPVD
         84I/xm40W7jQi5dos/fHXGxHQ+llphKtPeJxCEuAwZL6tFZTDlK5RMCZEudQ+N1SkqmV
         TxYYEZBEZAZHoFDzhBWr4IYKYgFm78J/Rp/yMXqzop8bHpmWUaGtDkfclt3whivE1kZ1
         JEteFtZzO2dPKN/e8T97fOKciHv0ttDACE3V7nWY9ZBgL7QatkmWXD3w64Tepnn8JTNN
         mVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778209761; x=1778814561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJi/3GKlv+5/JlhIkYtbDaqqLRZ1Gzp+vLpG4qOa+oY=;
        b=dsBWgy4/xIi92WjiQUxgaRTQGILX63OmKLuGi4KaTapcJeHoeRup+BDXIdDqevmI4o
         V2VG9BthWfxVn0EE1NC+OXImXmUl88CcEeWAOItmcZtmGzVUAVdaExX/UG1msMNolofO
         ARelFzI7J/c3BniKTRHSqIvdyXmSXl2XIU6xvOIqKsqWWWDvnaAgwGrYZ7oREXpDIAgX
         cbpx5nCXM32L/u3TYgsE5a/9WNr4WTlnOpd1dbw9XejxtBnXdLgEjO8WkIgfUs5Fd30W
         KuxU1iZYt9entczNH2hjWZgwytRHqMTZoXwoTR3sjQZWKBHlaKRwC8ft5jfw8wQbovum
         q+BQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Otk9uI76t2yhzzqPlmJTVP7R8woScQnTSnLVdt0CNfVlv604OZa5NvTqjr9p3n+ja8YkV47sNXJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoGVeZKX762atfU9J/b5jVO9aNO2e//zxp/b6R/EGtoN31WQa0
	BblrlyBW/1BxM4gdbkKdpnJz3HMo2cDFZJs8cGPuJgMn2noi45jDz4ObdScVPEwB9A==
X-Gm-Gg: Acq92OG3McNdYF8fZPFIWJHZhJwWCKwlUgLkcOuRML1n8caZOdnWCmJW82zl/oIbp7X
	6iK/ME6LAclyQ+Jd7bcpr2A2Gf4PHPFpYD2Jc3fMFeYLl56NxoU/11ClREf1UGOn3sn7baQYxB2
	5Ks4kPdYnrtP2PTJSsE55ZYYakWUMPeeJZa9yRz3SoyLDPTfI+VY73C0jUgFk/Z1OA81YTcpcRs
	9prDcoT7e4N1CadSJDAFxkbMveM/48gh/bpOky+Q60iwV+DY1N2H/g79TUXAmmjDci0wQdrhIfQ
	fQtXidJY18xuVhP38vtDdozlOdDJDs5CXspeJBCc0nPex4PuadwjSMkFQFVO9uLA0s6xT4WR2Yn
	NdKHg/XwdPPAjzAFrk5YuhKZjX2Hba4Ce4yc2aG5Efha2CbRcLD9rbMJLNNfdHQB7DlhRankZRY
	wOiVESsut/HINdVHSANQugNBZK
X-Received: by 2002:a05:6214:226d:b0:89c:4cac:74c5 with SMTP id 6a1803df08f44-8bc4536b1ebmr151251006d6.25.1778209760575;
        Thu, 07 May 2026 20:09:20 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3aed2cd2sm6071806d6.6.2026.05.07.20.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 20:09:20 -0700 (PDT)
Date: Thu, 7 May 2026 23:09:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Dylan Robinson <dylan_robinson@motu.com>, linux-usb@vger.kernel.org,
	mathias.nyman@intel.com
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
Message-ID: <ee3a6ab4-081e-4d7e-98e6-e39b2c087c4d@rowland.harvard.edu>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
 <bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
 <fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
 <CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
 <20260507235432.71d28151.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507235432.71d28151.michal.pecio@gmail.com>
X-Rspamd-Queue-Id: 1C5714F0FFF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37115-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 11:54:32PM +0200, Michal Pecio wrote:
> Alan pointed out that kerneldocs are more up to date, but there is
> still a crucial error there: on ehci-hcd, an URB submitted too late
> completes with -EXDEV instead of the submission failing with -EXDEV.

I don't remember the details exactly, but are you perhaps not taking 
care to distinguish between URBs that are partially too late (some of 
their packets' time slots have expired but some have not) and URBs that 
are entirely too late (all of their packets' time slots are expired)?

As I recall, the first case is supposed to complete with some of the 
packet statuses set to -EXDEV, whereas in the second case the entire 
submission is supposed to fail with -EXDEV.

But my memory could easily be wrong.  And I'm too tired to check the 
source code now...

Alan Stern

