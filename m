Return-Path: <linux-usb+bounces-34887-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHnYGCAduGlYZAEAu9opvQ
	(envelope-from <linux-usb+bounces-34887-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 16:09:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD47A29C087
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 16:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87616303A0B9
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F882309DC4;
	Mon, 16 Mar 2026 15:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGxFq+cz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7E739E169
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 15:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673459; cv=none; b=QeuSrcKYpiIuPomhnz3SMtprRTRmBpifSWko7QdVrNHL/x5+iuifParDhPTFHOLUQNcc/hcli+Vfu+FTwoU2HaGJ8xEYUj9qG4rSEws9lFGLKzE8MzLKVWddpiTWCoT3eg3zP2y6jlWqelvZ2SayHp6wP0kNq29147V1YW33icg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673459; c=relaxed/simple;
	bh=rGewoBv2ScUyk29jPFBjVpjQ0sFVMwuXWUMDaqZZ04k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ao/YbLU3YXzD7q9Q++3RFTmAxQqNPZex8rWXnTWT3eKbx3fEWaFDpkqjaq15+rHl0KRnQRU/SZuuGpHgZR/yLtqNRH85Lh8gT7GooFHHr7B7bpV0Br9z+YFFiuJJcrYEFzWcXSDqIvE1H2r0j3DyMNlwExIJGsYLgQzRj1u/sy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGxFq+cz; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b7c2788dso2897458f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 08:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773673454; x=1774278254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGewoBv2ScUyk29jPFBjVpjQ0sFVMwuXWUMDaqZZ04k=;
        b=TGxFq+cz4sJV1LPt4FZhCwb8ZWtZubL9ZPh8wD513yTM9xRPIzTzg6iai2aIMqaJt4
         IxQfA3gZtCqCaJcqhNSFC7hLHz9Djmr2OEPn1+TN2q905XsvDRRDHu/N1U7jPxFla6nH
         TErrTEoNL7WSrhgyFnc95xtK9v+zh8z4HJV33NmhMJXdBVM5/yNrfVOK1R5j+Dy34iNY
         +C4ddYnUub1H9LMduBHm6+grXVkk1MVZ/VhsynI6q6KuKrMwVT729LrzzWE8N+D1TLsC
         JcPe6jrDJb8O26qCqj0DxZwcDVWz6nnRcx9E2iNmaCV5UPiUhy0nhHcBoS9jKHtTtl4p
         FkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773673454; x=1774278254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rGewoBv2ScUyk29jPFBjVpjQ0sFVMwuXWUMDaqZZ04k=;
        b=gnAeLNMpHwTJHDNud+6pfKdcuuYEtjHnZRK7aZxamv59osq19f9ikypR0dK00o6laj
         d0eOsCCHxymgzXXYrVGDasMdOVajRUCk+1yIwKMwnX7pTvouLUIiCg3lsV6Kk0ZsWuMJ
         MI+RS1mO4uPDo4yALGnCGhmQdYKfz6xNlRoIRjHTsuxI1CaebFDGyvGmLeDcIICqIc17
         ovCFq04yJcmZHDApyUkzHaQFvo0N/yI6NvqwyVjAMqgwMN8CBmORQc8uvM12dR5sw5Yo
         UbRfY0/oztCyX1YblhrMQG2uTx9feBpxMxmTOWNoyX+y0cEKLOfmWLLt6gLlyoJ35o6x
         FolA==
X-Forwarded-Encrypted: i=1; AJvYcCUKZyGoVcb9uwbS+TaK/cQNw171JRB0xrXec4tatMAbwbtfEdyj9q0NcI1ItZQcfpLtaCcv9wXpoiI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu0tl8jg0C52cg4qHALPm8z9wlloz4MAk8vRa7JzHOmDvS/n0K
	zLqp4aGCg6t/pjJbVwOt1VX6EcDjMmGOOoOeGs2aCxmi1zFS9y9Ym2zp6qbycnc0
X-Gm-Gg: ATEYQzzWUHmE3tYGhKsalrf18fTFs5IXCf1ya4RBc0n+hYYcBGSeP2uJnyj8tumMbRE
	KJC8K9kGIUKAKRsK7Xxds0uVTJXveaJ5y4wqHdrFxEp5bK+6S+HYpJP/l0m76G/8DZDT1uzQVlr
	DTJ6PCxe3pkaOvhN6KuvKIz8YY0lNf4bUkqe0qIIMgVy5wBcnZl3eXfpE+gpw/a4MUZ05KTp4WX
	WhabZoDtwvYzzPtr7d5565TzngU5VJPYXqXqKX2DKIq2NqkK3N0IsmIo+5KE53AM8hPho7EznF5
	sFiVUnGfJBElqaChxNmowDtqOk1MYw63fX2CRyzziRkmpUR9MNIodcFs4VlCZIOiPFCMuptw/0y
	rNLg9QNg65SkFu66TK9aZi47uo9l7iCQ2/xfWLtUN2Jxn1NRY0sJSH8DnedSSQwLjObP3Tt2HRV
	wwxwGoNwDnS7gK1iecIZTRC3wRFMCTvCtHlMG1w/kwCSRk0EtimRJj2Q7NtP8i2tJtxp6UAcTBL
	fOfmj+SHM25h21tSWV6aPZC9zH+hhcj8YMve7Ot5tx4hS+irpuc7PfgDgnNc53b0p0GOVFj6PQ/
	fnLn5giynK8=
X-Received: by 2002:a05:6000:230f:b0:439:b6d6:723 with SMTP id ffacd0b85a97d-43a04dc3209mr24334097f8f.42.1773673454171;
        Mon, 16 Mar 2026 08:04:14 -0700 (PDT)
Received: from scambox.localdomain (5-198-68-184.static.kc.net.uk. [5.198.68.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c473sm45642278f8f.24.2026.03.16.08.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:04:12 -0700 (PDT)
From: Edward Blair <edward.blair@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: acpi: skip generic I2C device when vendor-specific sibling exists
Date: Mon, 16 Mar 2026 15:04:07 +0000
Message-ID: <20260316150407.30475-1-edward.blair@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316144510.GE2275908@black.igk.intel.com>
References: <20260316144510.GE2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-34887-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edwardblair@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD47A29C087
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 16 Mar 2026 at 14:45, Mika Westerberg wrote:
> Well it needs to be somewhere unfortunately :( Gathering these into
> one file at least makes it sligthly more maintainable IMHO.

Fair enough, I'll move it to override_status_ids[] for v2.

One thing I noticed: the CPU match in acpi_device_override_status()
is mandatory, so each CPU family that ships boards with RhProxy will
need its own entry. The DMI check is already optional (skipped when
slot is unset), but there's no equivalent path for cpu_ids.

For now I'll add an entry for INTEL_RAPTORLAKE_S without DMI, which
covers all Raptor Lake desktop boards. Other platforms can add
entries as needed. If the per-CPU duplication becomes a problem later,
making cpu_ids optional would be a small change to the loop.

Thanks,
Edward

