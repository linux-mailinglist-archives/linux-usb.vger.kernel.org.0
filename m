Return-Path: <linux-usb+bounces-32979-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MiWClW6f2kjwwIAu9opvQ
	(envelope-from <linux-usb+bounces-32979-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 21:40:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76032C7351
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 21:40:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9AEB3007F6A
	for <lists+linux-usb@lfdr.de>; Sun,  1 Feb 2026 20:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19D42D191C;
	Sun,  1 Feb 2026 20:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EiC1RcZ7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF4E2BE05B
	for <linux-usb@vger.kernel.org>; Sun,  1 Feb 2026 20:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769978440; cv=none; b=L2hnjsqX59ETU9N/R9bYRW3+SPP7ZwduYdIBIKVfQgxqiTeoD0mSUPOJHOMAya3d4vHWhY5NYi7fpflTcLCI5KG5i8arKN9IcQmBQClIGbBQGGqfL6GHdZpNQn9ExZ8dxFIRUufzXHvHytH/MEo1dV0bCdpeV6l5IzBZpHuonM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769978440; c=relaxed/simple;
	bh=C8qG2GyNg+8v0pV/Gm7iEjfkSjPC2wBDY+ozQE9voCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwPvdG4KIXscpViK+B6hPkUZhTXFzEsAEg+wnXoDjuM3c9ouRGX1exMi9JYsEDLwZ2iCtsLlKG1UVs7rPPccMDhNwZU1Bn4y+ST6M2KyDMD80rekGdKkuSPbgs+AA6xStvN7KMxjP6A3lDw2sxR5gX/uLASSjzCrwcIrA+xSt7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EiC1RcZ7; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c52f15c5b3so386514985a.3
        for <linux-usb@vger.kernel.org>; Sun, 01 Feb 2026 12:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1769978438; x=1770583238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJHQuz4I598+LhTVZjOstxuYO0msUwyDAHZS8cCKma4=;
        b=EiC1RcZ7yLkP7LH1H7EzVOKVYSrvKFXV9RSBLwh10XpA0ZcoJh8u7/lj5XWNxx45hn
         /CnrtcmCJ2xk5lEYLb6en75yHQvHS9rwsNPrHkJ8Qfe94yc2QHxEPdxsUZP6WL8oAWTc
         P+hfuDg5HprRX1J9MJZW9kHibxuqzvnGb6ioBoL67mMUImbByN5W7QGFx7D6mdKGQsOb
         Ruqo4AihLdylr313AlzYp4un2vtS/tH0d1gFwLebNpc80nj0d5V6clGQFmfcLukRGrEq
         WzkYR0Oa2Nxb0dmni5AbVmIyVeusZOcufSv7bxflx4OIxW4LnVJ/sR4PV2/IeMSrz+sS
         HQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769978438; x=1770583238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJHQuz4I598+LhTVZjOstxuYO0msUwyDAHZS8cCKma4=;
        b=S7k709O5rMrmzcJRVHL/DbhFTZzFzsHF6N5/vWED2gwkRA4MqRjndzQiIzZYU0joY+
         R/D1FiPlS9qzBlKsUYx/HEw22OWHY9kQ4yuQQiaasMwGEoMmBbh+c5RY4nVWDUnpd4RZ
         FvJrF5qMpx2RDoRGuBUO2KMDXRuMKihoO4R6bk1CdDgH7HAFGvRy7kKgcId+tyR/n5vK
         tkm6ZVTOidt+kuBSoVfRTcPtaIa2iLoQDZn3ceWgsUPvaIuXsAKIPFCiJ/vFWc6qTGLW
         nRFUZbzxWW6NLcJ/FU33Veh3oL+lZUwO711EKImWqAxRPaxGdbNKzE5N7a/KwLepVbW3
         /IrA==
X-Forwarded-Encrypted: i=1; AJvYcCXP8JIAlmMbul0nVDuYyh+eMjx+MSYM9Bc6Cb/hO1Oj+VCHS5fPt04fY03WHvO1SZ6Il94VSjG2y9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvLYVVGJkJjOiOzqDewRS+9ERuRyMMP5NUC4ljoKeCOmIZv6uF
	2jpfQ9H1cFoKLhOy3cZ2wVLpPQtDn0VlbfbQbndYHhHqH6UGwi7ryiHhcXzp4jB6HQ==
X-Gm-Gg: AZuq6aIcU49HdSuKHroNxelpwuj11wNyK7wzLrVTGKOrfhsIQiDdaZBzLdXal83aQzJ
	Ond9c9Ty4S8Z1DK0jdOlk+Oz8ZG7y1Xz+9xl4j95Z1hlZQyrwZ2IEN14NHr1jesMmLbOZ3HNi/O
	ZGVNCKO4r2wJsAFj0wmIQiR4+bYI6u6LKZOI1yP4OQjPi8LqAH7UfcMoG7CuSb2fCnKIspvCUH5
	T/6QVlKhO81lw0bk8NXCeoAAK7Y2eQyjPnk81y3CV7Hl+dB3Au0IlKO1TE4C38aTmXnLDctu0nr
	Rz0gItP9oB9guKMKALRog9v+aPzXmDPj6aBnin8U/I7VolUE19+R9G8DXstkHj7wo1cUx8W59Xd
	cPKFOuo9eIdsCRquEoXcH7mJHwQCWbvflTZin/HWaRYGJbDTu+T0G9kabgxR5jw2yAHP1G+7jkg
	Z6snjYJrdwyEGR
X-Received: by 2002:a05:620a:7103:b0:8b2:f090:b161 with SMTP id af79cd13be357-8c9eb277ec6mr1174709185a.32.1769978437643;
        Sun, 01 Feb 2026 12:40:37 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7a0a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca02eedf76sm337064885a.55.2026.02.01.12.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 12:40:37 -0800 (PST)
Date: Sun, 1 Feb 2026 15:40:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Liam Mitchell <mitchell.liam@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: usbhid: Intermittent EPROTO errors trigger USB reset and
 interrupt user input
Message-ID: <1ebf9d19-7293-4902-857b-164fd4d21f25@rowland.harvard.edu>
References: <CAOQ1CL6Q+4GNy=kgisLzs0UBXFT3b02PG8t-0rPuW-Wf6NhQ6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOQ1CL6Q+4GNy=kgisLzs0UBXFT3b02PG8t-0rPuW-Wf6NhQ6g@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32979-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 76032C7351
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 06:57:06PM +0100, Liam Mitchell wrote:
> Hi,
> 
> I'm trying to understand and fix intermittent keyboard/trackpad issues
> on my 2013 MacBook Pro running Linux v6.18.4:
> - missed/repeated/sticky keys while typing (this thread)
> - trackpad stops working (see "bcm5974 trackpad broken after USB
> reset" in linux-input)
> 
> The keyboard (usbhid) and trackpad (bcm5974) are interfaces of a
> single full-speed device behind a high-speed hub:
> 
> /:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/2p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
>     |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/8p, 480M
>         ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
>         |__ Port 008: Dev 003, If 0, Class=Hub, Driver=hub/2p, 480M
>             ID 0424:2512 Microchip Technology, Inc. (formerly SMSC) USB 2.0 Hub
>             |__ Port 002: Dev 005, If 0, Class=Human Interface Device,
> Driver=usbhid, 12M
>                 ID 05ac:0259 Apple, Inc. Internal Keyboard/Trackpad
>             |__ Port 002: Dev 005, If 1, Class=Human Interface Device,
> Driver=usbhid, 12M
>                 ID 05ac:0259 Apple, Inc. Internal Keyboard/Trackpad
>             |__ Port 002: Dev 005, If 2, Class=Human Interface Device,
> Driver=bcm5974, 12M
>                 ID 05ac:0259 Apple, Inc. Internal Keyboard/Trackpad
> 
> Logs preceding one of these events:
> 
> [19607.563871] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> [19611.523681] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> [19614.550685] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> [19614.563878] usbhid: usbhid 3-1.8.2:1.0: retrying intr urb
> [19615.050802] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> [19615.067673] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> [19616.822636] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> [19616.835934] usbhid: usbhid 3-1.8.2:1.0: retrying intr urb
> [19618.126656] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> [19618.126711] usbhid: usbhid 3-1.8.2:1.0: resetting device
> [19618.126728] usbcore: bcm5974 3-1.8.2:1.2: forced unbind
> [19618.129942] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb shutting down: -2
> [19618.155292] usbcore: usb 3-1.8-port2: not reset yet, waiting 10ms
> [19618.217146] usb 3-1.8.2: reset full-speed USB device number 5 using ehci-pci
> 
> Both interfaces receive frequent EPROTO errors. I collected statistics
> on the error interval over a 30 min idle period:
> Interface, Count, Mean (s), Std Dev (s), Median (s), Min (s), Max (s)
> Trackpad (bcm5974), 631, 3.21, 4.75, 1.74, 0.01, 35.62
> Keyboard (usbhid), 71, 26.82, 24.90, 19.34, 0.92, 107.74

There should not be this many EPROTO errors.  The fact that you get them 
indicates some sort of hardware problem.  Have you tried swapping the 
cables, hub, keyboard, and trackpad for different ones to see if that 
makes any difference?

> From debugging I understand these to be missed micro-frame (MMF)
> timing errors in the host controller. They require URB reset but not a
> reset of the whole device.
> 
> The bcm5974 driver simply re-submits the interrupt URB. This is the
> best behavior for these errors on my machine.
> 
> The more "correct" usbhid driver will delay URB re-submission and even
> reset the device if a second error is received within a 1.5 second
> timeout. It's these periods between EPROTO error and re-submission of
> URB where keyboard events are missed (missed keyup == key stays down
> and repeats). The default error retry delay of 13ms is relatively
> small but a full device reset takes about 200ms. With the frequency of
> errors I'm seeing, every ms counts.
> 
> Can we improve the usbhid error handling for these cases?
> 1. Reduce first retry delay from 13ms to 1ms?
> 2. Reduce the stop retry (reset) timeout from 1.5s to 500ms? 100ms?
> 3. Require 3 or more errors in the timeout before resetting?
> 4. Ignore EPROTO errors for known hardware/quirks?

It's possible to do all these things, as far as I know.  However, it 
would be better to eliminate the errors completely.

> Are there ways to differentiate these safe-to-retry MMF/EPROTO errors
> from others that may really need a full device reset?

Not that I'm aware of, other than just by retrying.

Alan Stern

