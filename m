Return-Path: <linux-usb+bounces-37558-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eC9WFjURCmpRwgQAu9opvQ
	(envelope-from <linux-usb+bounces-37558-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 21:04:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45356370A
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 21:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 599783025928
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 19:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3B02F7EE0;
	Sun, 17 May 2026 19:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hoc2xT04"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D0C2777FC
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044631; cv=none; b=oghJ348aoKyRP0G4vvkvmIeHniZrgWcevwTpHPl7PGtZTd7CWDVbNgdbmGucRKJp3AfT4WGi7dOHRZ1zlBNbmKs/Uw+JJF/2myWVcfm6QOeu/x22oWuYwTgm6Y9v5DYLcNpsAct1gAG78sUSKJFCru2xoSD4OX2qZxr7SOe4eVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044631; c=relaxed/simple;
	bh=ziqj0At9EXqQ/gmwi/EcqSa9SrdgZw/ZW8685V4X7Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNNHcnUhnk5z7xtA97rW7J4fYzj33ZOFCnV2jopARrPvRyJtaVkcsvtLfS5NACGIPIs2EkAkRYjS1f7bmH3heMFyxBfOM7Yna6Kwu2IIfsIg5YbVdqm/E369P9/Cs6fiavz7WM8Zxiq/h9gIZO4xjwhUcMkQ62VB5Tla9KdlMhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hoc2xT04; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8b59772d441so23308946d6.0
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 12:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779044629; x=1779649429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZN/ui+Ml0Pw2OFTnsTV3BRgvcDhfmwrxLMK2S9Sv/Q=;
        b=Hoc2xT04OLWwji9TGIJNiVdZs7N/PoUCOZT3r+F6aZjH9o4f+DtUSI5Y/MB92ujbc5
         NdxBl1uOpuvuCj0+VDgStEqk+kZxYcOE9rh5UQ405gPb99e2M1Fpw3giLfMlDW61fCgo
         ake5JgFYXxco5oWdoY4BMDnGc/f1yX3y3HH/EPiPHfvKvumzo734V517Aa6QG2Mr1Z2I
         CxfSpMrg+TurV9ONOzX7YIcfkn9EHR/Mx/SbZsP8jDZOVzoXswZaLmdhTTPz0qI/MbDZ
         VMP9xtV0ZRhwwiVLk+Rrj0dKseXGtkrUXEcXyTXe6shjBd7RR0v5gvWVEU9WYQQmnk/I
         ba9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779044629; x=1779649429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YZN/ui+Ml0Pw2OFTnsTV3BRgvcDhfmwrxLMK2S9Sv/Q=;
        b=gG6wZeh0CCwOHnYmJeNnqTt5FHUhs4L/hOY6d9UQpinjzMO3vXhOElq+FGnHWq/iPq
         voTXJOSeuah+DS9/+53xGKKSFZq0fLPElGmgXtgDdoV0fYqlrrZeRCuHnR1wFlGW6yKx
         dlIX/dqjko+aUWz79d60OthYyb5ZYymORyfZaPNmq98rlpqlxkzt4v+kYorYmwJp3wBO
         Tf49pPvWvHCxkeGEvDrVI64wGBe8KU+mraPVkc9PqpJ47gJi7s49NJdePz5S+1ulGVx9
         0vkftKb910swFyBoPqQtl8jQlX96RnaXjZELdUJ/YlhUQ+BJ3OBfzrWyGulNH4GBMuOb
         3NfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IMPZr6GkwyLYpzQV9s4i7/fTQhZF2m3lvdUM4AM2UTNC1sEwuyfG/+CRhV9PH1yTdY2RjyfA3PTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza0fOV4HBYfFUHs/NodBC2Zy4M/XSjpDbMCXbLpU8VCfOtm5mR
	wTTrZ/jkBxalZpr8vvXr0a1sABWNwatj3sj6BNsn8rAvvercjPjVr4aW
X-Gm-Gg: Acq92OECsQoO55WcokyiErhYGNWSJTtNEHuhu9APopqM3YhsCG6NoVc9a/f6gcPa/v6
	b3P9jK2vWE3bw8AZMwQh6tzOng1jNO5G7Wr7OSajPve0Fd/MNhUudEIGlwisPjlxzwUFM7PZG2F
	hOGfFHTRFY18lAHBU1omWG4ta/HSXVS40YBRx7t0q+UxaHl2nNrd4EVDSc7AeXTSJDKjFy6FDZ5
	Cwd/kLU8QcTOQSx5uBWlELhYenPRYPpHFC7mmMnY6KW7+fzMwiHY4YKHn/a3HHZuL7UqSnaIi9Q
	O4yx32YxeFf2FpbE56/T1EQcZXJBSMpdaFbmWWmUmnORJue25QfcfCyKUFSjmoV76oqWAgow296
	aXxKoTL4iy5upFE5c3KH7G6c6JHFMDhENt8n4MVmOtO11FNZavt8wVbwTaZ9tlqpR8WuDEdAbfI
	QpKVcK2WSZvfmMnN1DUtAKwx8Nr482hGAkP58H9fzXhCnG/5N7xIG41JZ4JPGVZMs3hb/6VNE=
X-Received: by 2002:a05:6214:4519:b0:8ac:b1ad:3a24 with SMTP id 6a1803df08f44-8ca0f6bdb6bmr206516336d6.27.1779044628757;
        Sun, 17 May 2026 12:03:48 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.196.20])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca361b8b10sm30473686d6.46.2026.05.17.12.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 12:03:47 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Alan Stern <stern@rowland.harvard.edu>,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Mosberger <davidm@egauge.net>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] usb: host: max3421: Fix shift-out-of-bounds in max3421_hub_control()
Date: Sun, 17 May 2026 15:03:07 -0400
Message-ID: <20260517190308.1876316-1-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517000145.1868817-2-eeodqql09@gmail.com>
References: <20260517000145.1868817-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AE45356370A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,dartmouth.edu,rowland.harvard.edu,kernel.org,linaro.org,egauge.net,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37558-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Seungjin Bae <eeodqql09@gmail.com>

The `max3421_hub_control()` function handles USB hub class requests
to the virtual root hub. In the `default` branches of both the
`ClearPortFeature` and `SetPortFeature` switch statements, it modifies
`max3421_hcd->port_status` by left shifting 1 by the request's `value`
parameter. However, it does not validate whether this shift will exceed
the width of `port_status`.

So if a malicious userspace task with access to the root hub via
/dev/bus/usb/.../001 issues a USBDEVFS_CONTROL ioctl with `wValue`
greater than or equal to 32, the left shift operation invokes
shift-out-of-bounds undefined behavior. This results in arbitrary
bit corruption of `port_status`, including the normally-immutable
change bits, which can bypass internal state checks and confuse the
hub status.

Fix this by rejecting requests whose `value` exceeds the shift width
before performing the shift.

Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v1 -> v2: Restored a paragraph in the commit message that was truncated.
 v2 -> v3: No functional changes; reorganized as part of a 2-patch series.

 drivers/usb/host/max3421-hcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 0e17c988d36a..3d6b351dcb1a 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1694,6 +1694,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
 						!pdata->vbus_active_level);
 			fallthrough;
 		default:
+			if (value >= 32)
+				goto error;
 			max3421_hcd->port_status &= ~(1 << value);
 		}
 		break;
@@ -1747,6 +1749,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
 			max3421_reset_port(hcd);
 			fallthrough;
 		default:
+			if (value >= 32)
+				goto error;
 			if ((max3421_hcd->port_status & USB_PORT_STAT_POWER)
 			    != 0)
 				max3421_hcd->port_status |= (1 << value);
-- 
2.43.0


