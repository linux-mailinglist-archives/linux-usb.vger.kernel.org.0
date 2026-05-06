Return-Path: <linux-usb+bounces-37030-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOfJM8ic+2lxeQMAu9opvQ
	(envelope-from <linux-usb+bounces-37030-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 21:55:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A454DFFE7
	for <lists+linux-usb@lfdr.de>; Wed, 06 May 2026 21:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40AE7301F7A7
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2026 19:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE3334B662;
	Wed,  6 May 2026 19:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="RuzqONxq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54EA26D4F7
	for <linux-usb@vger.kernel.org>; Wed,  6 May 2026 19:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778097342; cv=pass; b=pmPRTTDf5Q46p/Hx9k8ZD2eY2uiJ29RKOAR2tlcDmLW/SULXz+OAoeYVvPiklcwet4CFN5fobIiHJ2g6wB4JLu9/KzNq4YAFU6n4ywnRRjK/8MS6W/3du7GoriPuODmtCgL3eQKkfwutmJE9i6nnCSHeehejVQ8QaszK230L+2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778097342; c=relaxed/simple;
	bh=HWEaXi9LhaqRZTLCfv+x985vPK3ziEzZYKqwCS10Gbw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CMxvlaAq40XS9Tx8KUCFbOlwVsEC279UJL3MLNyJWwJQEhIVx80EOOPWAvKWoyvd1Rgl4nSaQG9HPiFf0JZs0xAr/XD4htN6h9bWQY5P9D/ifJSgBahv7l8KSLjR7lAoj+cnRAEAlfwJ1Hg3AWTaZmaiMhcI28DmEwMKjbBgBGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=RuzqONxq; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b9358dd7f79so8814866b.1
        for <linux-usb@vger.kernel.org>; Wed, 06 May 2026 12:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778097339; cv=none;
        d=google.com; s=arc-20240605;
        b=YhYcjwDkuEOkAEmigZ8m+7p3dQClAFcKwEem06KLvqBMtDLD+NAxgYqosc7T6U50+4
         nTbtQc6VU3TAUsU8fAqhD5GIq3H77u2v3isUcya/h2vp8POxUA+M+8cw9VvCky0zdYG1
         cRHAVnvnEBAHkybd3EurBgv5uQrjg95TceQQaKmkDF7CjTbnOQi7JU0e4GNXvV0V4mN1
         YVJFQzMEKR6cPoer6luXUr6zZXQPTPJd31FQtGz71DJRFCFJWULhL4wKWa2UY6S7nwH+
         HQZ4Kmd0hSiu3Jo1vMXgu0+jw+r7hyC3mMBOAhbXz9XVm31XDFnLChBIH9i0FusOYNHZ
         lctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=HWEaXi9LhaqRZTLCfv+x985vPK3ziEzZYKqwCS10Gbw=;
        fh=OyE6gt7IrmYJ5HiDteZFXXD8LlKr8p7AtVsgaeREUDE=;
        b=Md8XGKNn5yGrmf1kbNbaW31wCZB+lJEWRLPUXLhRiz39rIgRYiK4VRzo9NDa9dXxEt
         Xz9WNA2HSEKKUXB5WJ7urMhYNxGY1k3tLxT+zFjIc0l+kK/6JXjgGMDUgeltQfGVlBbE
         lJYNtjCeim8DRIWfXXLxbsqch2LC0bSFYDZzrcVMeSOlTS0LXP9KS6QoWF+by0B85hIs
         3JXrJcTI9WfrUZHI91oz5gXBJ1mwIsfT90gqzXdiP4FEubANmsKGOe38pdAwOI9FvJ2f
         t8HFu49cSdPePTvHruyoDTOE+So4ImFA2CGsrK283zyjVZdvUMPvD7BncilfLRYIu/gG
         3XnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1778097339; x=1778702139; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HWEaXi9LhaqRZTLCfv+x985vPK3ziEzZYKqwCS10Gbw=;
        b=RuzqONxqW0BNM2XNltr48nUjs+5z66ntZ5jzEhcaZuLxSHfdLyPGazM9tvY7a7T6j2
         1MtVg2fRZP2Ynvh8RmStUomjGW3eA2HGdhfIYe9sSKHzW2F/zvy1Df+qlSteDYqoBIoq
         Hf8WhXeWFHFt3wu1JSsJIj87jUzRINdE2ldLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778097339; x=1778702139;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HWEaXi9LhaqRZTLCfv+x985vPK3ziEzZYKqwCS10Gbw=;
        b=DOYyZDRTG42fambjafRwSuptX8wpACyAd73WyvnLUtG4j8BRYG+HSbq03/oHLY6Kg0
         HAEzKFcaqSicaa3yXdFmfqMplzksdAW9US3HSKZZMiNlzvBYKQdyJyHqpi4TDWeSJCjj
         36OKBGlKkKTkB9/vFvWYEyh6z24lDHJTTXQCLeQGVhKbghkgVdEbcIQ7BcEWS/Bbbftx
         9uRsy5Q6LB4yX1yp7DLZgzJXDYq6ChZNtqTHaaMYEJcsxRqnq6kc/i99fw6MEWKP/+98
         4oifGaeVaYdaFSGft5AXwy19xLAfSy0uHQGTE+ycuEgYOuNL2jbt9oqoelEJ3meL9dAF
         hOhQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qRS25cuqgq2Xt1gx4iG+E2hrYOhv2QMMsNsEeli6qmlLGCWjUHZztxoXdLslG/IL5qIMMCUUgpUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlE3Prk71Ay0OxuGvictpDwz7CnRpfU1kZjY131oZxn2uGkD3h
	YV9A9feUJAgYFFooec0FjiOGLkwGvNHbhc9N4l3gVBcDESMNkVYn2/LPeapByW9R+2EnbcNMuPm
	Ddfz1U+N3QChL/L5JDE3UcfaCHEL8N7d4T53j08g3/Q==
X-Gm-Gg: AeBDietAiXpuN/Ae3CtGW1Jc/tUVOLTHZlegw7uu++IIDO9FqiNJc/UbpeMlK++R/kJ
	hirduOu87dUXK02EIt4qJ5FFUXZvBxVCuwKklea1/j2iB2KXPf7rGrAF2iB5/Q7hhbcl7FCefTV
	mcbQQNkZQ6QNiOopKhruG+7tj0U5PXRXpsiV2CyESReol0Pcr/e3yQnOBP/IfRnFFHKmZfpMO3U
	e2RkIC9Y5XRxq233p8/sKycsXz6qXoGVlW+xVQ3z1rtR3UofZqU/NQVTN7D7rby5rFKGz1YNC1g
	uTBL4FXtYR5TjRZcqkc=
X-Received: by 2002:a17:907:3d4e:b0:bb8:d25d:c129 with SMTP id
 a640c23a62f3a-bc56ae2cae5mr279871366b.3.1778097339053; Wed, 06 May 2026
 12:55:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Wed, 6 May 2026 15:55:27 -0400
X-Gm-Features: AVHnY4KTAx6ezzZtbfG_X4trqD_LGvBWRGFhpBfC3i8T712pIxK6LML3hqkOVYk
Message-ID: <CA+Df+jdFEGGZyceFH_5LRSQjwGa1WCtd79DK1Lywvdw+pkX6fw@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: xhci: fix isoc silent reschedule creating stream
 gap on CFC controllers
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com, 
	Michal Pecio <michal.pecio@gmail.com>, nick83ola <nick83ola@gmail.com>, 
	niklas.neronin@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 94A454DFFE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37030-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,intel.com,gmail.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[motu.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]

On 5/5/26 16:32, Mathias Nyman wrote:
> Agreed, setting start_frame to start_frame_id + 1 would only make sense for the very first URB, otherwise we create glitches.
>
> Looks like the whole start_frame_id calculation is incorrect.

I'd also like to call attention to the fact that index in
xhci_get_isoc_frame_id() refers to the isoc packet index within the
URB, not the position of the transfer in the overall stream. A driver
could (although probably shouldn't) submit multiple URBs, each
describing less than a microframe's worth of transfers, so index == 0
does not guarantee that the computation is for a frame-aligned
transfer.

Additionally, urb->start_frame is initially computed in
xhci_queue_isoc_tx_prepare(), and in the current implementation it is
validated, and potentially modified again in xhci_get_isoc_frame_id().
It is worth considering that xhci_queue_isoc_tx_prepare() computes a
start frame close to the current IST, and if the system is preempted
before xhci_queue_isoc_tx() runs and calls xhci_get_isoc_frame_id(),
that start frame may already fall outside the valid scheduling window.

