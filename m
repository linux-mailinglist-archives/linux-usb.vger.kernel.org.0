Return-Path: <linux-usb+bounces-33794-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGJmIXznoWlRxAQAu9opvQ
	(envelope-from <linux-usb+bounces-33794-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:50:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1231BC2D8
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFE29300B280
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 18:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7923A1A5F;
	Fri, 27 Feb 2026 18:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldbjhF9R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD2D385524
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 18:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772218228; cv=none; b=UWvvox72S0HOfXKQOCJhd70ISRQR1QAQUwZukhYkz6XYdCN4WKZ2ayGUS1tlCdpNhOI+0JqbgCrUAIdHTgjSg32Sbeh1EkcFjAYViJYNVH64+/iJkh6skRCt1V5jj2H+0x5fjS9RF8uJJyYtyxh2BbFnwerFWUsXCOvOEZAi+YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772218228; c=relaxed/simple;
	bh=rcXXwVDn8PtIyZTbjdIUBV74Yapr6iYK767uNc75qvs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MOA3dpvcL0bQLCcTCLj0RrebPitH/14dxnm84sNYajHZslsUrEk8gvfyUlVfC+4gd9T94AsEv/d6oiO3/Ru/Oz0L5WHC1aWtz19md2/H2b7cs5vvE7Bqmqkb8rUZta4c/1aWWMTpSCJrDP0/PnIBZfd++S4eYr02EVDpecDiD9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldbjhF9R; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35691a231a7so1470177a91.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 10:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772218227; x=1772823027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUXyqxoJ4tx2lnBlJ6HcQTrpspqhTH+7c7HoWyI3mz0=;
        b=ldbjhF9RLDODotKrZ4ZV6zy2PVu3Lx+RR57MXUTB/E7pPmi14W1sa0PFuLiE5o9FRP
         w8ABnDI5NjeGIUpKtxkZ8EyHlc0XMTpfnVwMHN+mr+mh3/dncqxk2S3Nn3DhuNGns+2W
         b5urTcckclG9RDSIPknG7alO19xOhsah+xO4MXh5OYbn4+SEe+J3JErZpRHPW53YxVxL
         9d5P7HlO0W3xCzhV0Xdd42DKM8CY71u2B5SR2n53On5eyuGyKs5LPzyKJRp0j0f96fB0
         S4QmDvz0ACeSL2PbU0susRHWrc9l6qp2SyOaqcT/pAuQsMOzLQ7cfnPvF4GzAvsAC11o
         Rzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772218227; x=1772823027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUXyqxoJ4tx2lnBlJ6HcQTrpspqhTH+7c7HoWyI3mz0=;
        b=pXym5ZOMvWRkCSUvN80X8k6pPs88m7iO1zWrL848V5kP/TfM9LW1GOxSFnp5ZBLfuX
         RooGDY7VP6qVhzzPXjxn2aFthGG7soI7F2xz6Q4YYIlBSsnJutEqIjvB6hRRU4uJeDM9
         ceozm0EPp6BpB37WpoGb+pZJbaMUQc0Zda2GwWzjxA9r/sR9R9mrrb9gDI4PuPAI/Ls/
         f/RRCsv2t3uBzAA+5xtChKuVzHb2uMz9SKwMKkjRVMa5nOkB7YbusPTDJZYyCv05I7M6
         /Cek5YGAqgyFSAS4JeDdfsUR2Am1rbbfGiGLqINDxj+7LkuElcHxuOjXZJnJj7DweuEQ
         dCRQ==
X-Gm-Message-State: AOJu0YxWWK/IpBTfkhZWAOIsdg8PDUTMwDf684pZkdYQfSBSq0kctzG7
	BHDllpO/PR7StkzfMD44HVMUGPAPWoJBnUDWnFPYcaR+FTfSabBRE8yi
X-Gm-Gg: ATEYQzxCKsQ55j0wwAZKuKqhpPjTCPaiV9xZanNkbFfD/8l3lgXAGwPBtqsnPNDSgZs
	ceJ8i5GmqfAkmNBZhbEXxh6Ce/VJC67dUnMI+mzlsflYQjTE0791sK+2getSrD4cXj++oLKWbm2
	viKKW3R0IT2PnSROIsEXT99CeH55WBVKdFhBHeO6r8Lmg86IfS+dS49594iIM1AF4oYX6xo85Cf
	LBHyf7STxkYOZD63jIFQ01pZjqVuuE+hoYtW3OQYVLyA3vhwOWxJH39m3kNQ8dKaAEuBeMJuI2b
	Q7gRG00FxfvmOf0BB6j1LhZp5/fKUBwLIOyVH6vFrxY+U9Y1feaAb0fYe4TSPbkqWGdgdjeRrxB
	sjZgH+XhZJ0Z15dHKtFRS3oynlEYDuf71jhTOMUyr14zOLWVIXO1G8iDwKg7jYrI84H7IvKMO5o
	R7u7PNUligpHSfD9YuwzieebFzXuPY0gWmTh0VKUMkm+iioy46y5dKgVguxkdGeLnhlbtlr15wG
	Mj3PsS4Hg==
X-Received: by 2002:a17:90b:1f8f:b0:354:a57c:65db with SMTP id 98e67ed59e1d1-35965c926a7mr3096806a91.20.1772218227016;
        Fri, 27 Feb 2026 10:50:27 -0800 (PST)
Received: from HRD-WDG8GDY3.roa.hexagonmetrology.com ([49.43.203.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912f5f29fsm5559002a91.1.2026.02.27.10.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:50:26 -0800 (PST)
From: Venkata Swamy Kassa <venkatswamy7@gmail.com>
X-Google-Original-From: Venkata Swamy Kassa <venkata.swamy.kassa@hexagon.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] usb: typec: hd3ss3220: Add sysfs interface for role state
Date: Fri, 27 Feb 2026 18:50:19 +0000
Message-ID: <20260227185021.767948-1-venkata.swamy.kassa@hexagon.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-33794-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkatswamy7@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hexagon.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9D1231BC2D8
X-Rspamd-Action: no action

This patch series adds a sysfs interface to the HD3SS3220 Type-C controller
driver, allowing userspace to query the current USB role state.

Background
==========
The HD3SS3220 is a Type-C DRP (Dual Role Port) controller that detects cable
attachment and determines the port role based on CC pin logic. The driver
correctly propagates role changes to the USB controller via usb_role_switch,
but there is no mechanism for userspace to query the current state.

Problem
=======
When implementing udev rules to automatically start/stop USB gadget functions
based on cable connection:

1. In older kernels (5.15.x), the UDC subsystem emitted distinct "add" and
   "remove" events that could be used to distinguish connect vs disconnect.

2. In newer kernels (6.6.x), only "change" events are emitted on the usb_role
   subsystem, with no way to distinguish the actual role from the event itself.

Userspace needs to read the current role to determine the appropriate action
(start gadget for "device" role, stop gadget for "none" or "host" role).

Solution
========
Patch 1: Add a 'usb_role' sysfs attribute that exposes the current role as
         a string. Also call sysfs_notify() and kobject_uevent() on role
         changes to enable poll() and udev notifications.

Patch 2: Document the new sysfs attribute in Documentation/ABI/testing/.

Testing
=======
Tested on Variscite VAR-SOM-MX8M-PLUS with TI HD3SS3220 Type-C controller.
Cable connect/disconnect events correctly update the sysfs attribute and
trigger udev rules.

Venkata Swamy Kassa (2):
  usb: typec: hd3ss3220: Add sysfs attribute for USB role state
  Documentation: ABI: Add usb_role sysfs for hd3ss3220

 Documentation/ABI/testing/sysfs-driver-hd3ss3220 | 14 ++++++++
 drivers/usb/typec/hd3ss3220.c                    | 32 +++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hd3ss3220

-- 
2.34.1


