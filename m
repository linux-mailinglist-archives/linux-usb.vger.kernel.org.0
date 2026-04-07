Return-Path: <linux-usb+bounces-36033-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEh8Dqmi1GmAwAcAu9opvQ
	(envelope-from <linux-usb+bounces-36033-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 08:22:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EFD3AA360
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 08:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65B723026F19
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 06:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A8E382F14;
	Tue,  7 Apr 2026 06:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5581krN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA37381B04
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 06:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775542910; cv=none; b=JWiHxiLBrcwxy94RygxMkjTy3pgG7rhnqn/exk7WWKmm6Tc0bNi3xF6n4v7trV2GUD2cipNDV733UgcMrbG2wnvrPE2LEId89ishBqOWkpx3wxFrrI6JwGThowl12cZa2F6206gyzsCeWQ1NUa8Cda81RdTkh4QbelQKSaPxN7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775542910; c=relaxed/simple;
	bh=svIk16rOxDZdvYjL960T1InOrh5WjHTfn0DXLglJZy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gGhNliFMKW9+Z8dDaFCjhbEmY+f9p8cMV63cq7frQy+k0fB2VuZD8mPOc0pao4us/VO+TFUK4O8DMh30S9ecErECBs8pWxY1Xj/Ngheq7EM7VFMxzoAKfUiuFAHa+1hnVa0SM3bOIpuss9aKmYWoIxbYRN9JjWs+hFHOyBjZ5ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5581krN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b24fede2acso25668105ad.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Apr 2026 23:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775542909; x=1776147709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svIk16rOxDZdvYjL960T1InOrh5WjHTfn0DXLglJZy8=;
        b=S5581krNDNYXV/lfOwBRMJnitN6zyLF2xCWx5mu1jO8mHxUYPNofsThRBJGdOm2cwg
         F4TX4jDdAR5EjbGaulyDN8ILwmEZOqDiZfoFthCOoJC8mYb0ZkjiE0pDL9jAEU3eXnKT
         V64HELTH1EGNCP1X9uNqm+JOajPChW0THEBr/wrdHk2b+96tfjrS1a07ezfT6kweDq7S
         VPEB/zSEyT26huNezXa+Q9KdfUK6uALz1vfSotz3Iq9wEa1poUWLrWKEVZUZ+SDzBDkm
         zBXEM3Yx7HzDJIKDmiCW8LuuKVSMkwSI6jIzgbNgxsgndVQK+I63wYkOEGkDRHPBKjiL
         Ae8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775542909; x=1776147709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=svIk16rOxDZdvYjL960T1InOrh5WjHTfn0DXLglJZy8=;
        b=c9+yiyRgAi6jrJ52naLKeRLqKDYU7Os/zjjtnC/jcFfaTVO0i7mV43uYMS0SYlzz5M
         3J3BBLTTjANMc1Cq81qg6TvKLIrryJqA2JSeIV8sQg+wszBWrGvCpHKY1R5Dr5KaZ3FW
         O9/e7f/mJn+VylUCTpB1Fa7WOPMxtJ6WCDWhduN1H/huet/HyGxuvihQGx2GQKKIR3u9
         m2UXLDy6gdWEaSIYhicVDI4np9p4nUO/C3U1OaYjiakrKa3ONQHzVuZ5BXZW+SqzYxSM
         29S1vXh88/U5YwIBmjlcPvQtj4j59RhxScnhx/od/KuZrnqe4DFpf9hHdSJ1ak2xXyBL
         Xnlw==
X-Gm-Message-State: AOJu0YyNZMTYVBVE/sg7S6EUmM4ksZbfc2l3a2R46NZ8yNrb7v7+BCfe
	CvA74M4F5RgU5BkZUUr0iRusNbwgEUv2WPVxhBtKvA4jAds4/1SvCn0Y
X-Gm-Gg: AeBDiesk9oBQ/OMKXr6fFNTMr5JfTXkCk+N2SqV9qfacBxmPTXvLRvewh8o6/DTApWC
	wC7pcQ+UZRMptGvzOtn7LXNM9kIG3ft1PcyameVqK20zs9gQ3P26VQ/ranpJ6DKzMHQy2yUWz3F
	JgzBAszhBdRd+jaTm0ew49t2dsW2fhIwRmSPXO4oKmEWrO1kOVjT7AjTE3wVhOrVdBQM9OYG3rf
	hR3PEPcuN9g71RRdNDw9raMA5G8C5odGxAWHhZF/f5q+7NutIutINFBxWovP3L8dDQL7GsT8qAn
	dtN/pnSDkyV19l/DouTo+UOEzEjZpImvJk2B5loos9k6wpZ+aJtAw6PZBFoWu5sdJ3I2z6F5NXd
	SgAf/iabqj5RVOd9BaXfCNSZTFH4JWoRIl1FO2ohKBx1eq41FZojxZ4qEzz3a4Aw/MH1ox3r6VF
	B5mU3jy9FZ1SOiAiwD2FHvMSlIVfhAl4KC7wpgjKaUGS8UsbNHahcY1TvOwrhK/ApmLagqcHtpV
	ukmW8ncM+dJtcrj
X-Received: by 2002:a17:902:da92:b0:2b2:5256:9ce7 with SMTP id d9443c01a7336-2b2818e65c4mr163971965ad.36.1775542908952;
        Mon, 06 Apr 2026 23:21:48 -0700 (PDT)
Received: from localhost.localdomain ([45.248.78.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2b118f84csm6942705ad.58.2026.04.06.23.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 23:21:48 -0700 (PDT)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: gregkh@linuxfoundation.org,
	tiwai@suse.de
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: Re: Spurious errors "ucsi_acpi USBC000:00: bogus connector number in CCI: 1" on 7.0-rc7
Date: Tue,  7 Apr 2026 02:21:13 -0400
Message-ID: <20260407062113.1494-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <2026040734-headfirst-tingly-e6ea@gregkh>
References: <2026040734-headfirst-tingly-e6ea@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36033-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91EFD3AA360
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 07:58:00AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 07, 2026 at 07:38:50AM +0200, Takashi Iwai wrote:
> > Is this a firmware bug, or some missing piece in the code?
> > Judging from the message, it means that ucsi->cap.num_connectors is 0,
> > I suppose.
>
> Ugh, what's the odds this is an off-by-one error in the firmware? :)
>
> Nathan and Heikki, any ideas?

This isn't an off-by-one or firmware bug. Takashi is right that
num_connectors is 0. The validation checks against
ucsi->cap.num_connectors, but notifications can arrive before
ucsi_init() has populated that field via GET_CAPABILITY.

Pre-init notifications are already handled safely by the early-event
guard in ucsi_connector_change(), so the fix is to skip validation
when num_connectors hasn't been initialized yet.

Sending a fix shortly.

Thanks,
Nathan

