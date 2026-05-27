Return-Path: <linux-usb+bounces-38102-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOg+JnAKF2pB2AcAu9opvQ
	(envelope-from <linux-usb+bounces-38102-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 17:14:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1311C5E6AB1
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 17:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CFF1A3091C2C
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 15:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAA9426EAE;
	Wed, 27 May 2026 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgOZl3Y2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027EC3FBB6A
	for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 15:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779894521; cv=none; b=kPbGmHFtc8LdEN1LYoXyprzA163iIvnlYfkTR2hLcKZUl7ZY115kVP7xPnvkgHOVhmFr8OF4ZJXVwNGMsk1oBTrkO7Ma/KrPfq3PssKRdM8pZTxBY90uGhlh6gmKNjnz1zAyaTdHHzpyilUMxqFn/8rmaUAcqdlIr3J370dYw38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779894521; c=relaxed/simple;
	bh=ftJA1esdt5l+bw3g7t5Q7tLNGvcMDoD6AYCXN62BQ/8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y0gHH9yNC8wO3y6VHlqepWMvny0RmyeHOepmX36GSQw6n4+uTzPRHXvlLDCn1AOqIzn7EgmXobMHauGqYdn1TEPfl4SMkigDr14gFN+F8oU+IG1ToKwfGyoRzhqAoGfhOunYG77w06VWHzloBNNMh8YLxMuE+gqSlAofsiS49lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgOZl3Y2; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8354461da74so5537004b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 27 May 2026 08:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779894519; x=1780499319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDJ8S5hbiqIsI65l369Il1cSJ90Nc3vvPmKDZOmRp7I=;
        b=sgOZl3Y24iuxBKWB2wwnZfzKq4WsTClNd1KQWZOxIFwyyWwfjYwHl4QzCrIkgsoBxM
         SByojtrQS+FSLZQPVAfPcHZCUHuAcNlrQJ8cWlMzrKMdr4fB5ROQsz4R9MzGDEIBHaJp
         HLYBpK0BowH868NVRPQv/zNtn5lFFUFeaQIzNzeVksf1ImYcoM783wMrCEuMA5X0774F
         lw1NA58Wug8jFRN5xks74FSXKGRxi8wqwxREgTFB7M95STFTeopgbVPj8F2EspTmGcxW
         PFM2M6W1VbL+fnG8oZfIhxZHe3ag8xbsoU2U46V4M8IJqIvf2DMykaUQl5FWwkTIF4tt
         Ippg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894519; x=1780499319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDJ8S5hbiqIsI65l369Il1cSJ90Nc3vvPmKDZOmRp7I=;
        b=dtNNRGkKUGZ1p3VzMQW7zCEW1qjxC12JbUAtLDNN6Lw2uffQqUkX/yPm7a3ukrOlOY
         E454VlaRycWXa/GDmC/odQVLoK5n+/v1XAMhhOmefN2s4OnVRoNILQm5694Doe7UB6dT
         bcBtusB7nmePTBaZtSkWOGOiiavBci4CKRuhfwYawfKJvlVir9GIL+dEwWa8B8WQ88Gy
         bDb6d4PbKV6ortoFHaEqDXvprqtKul5AwAJKsqM80dW3cUPJddxLAU/3ndyZJaoEFyV9
         KNHb7s5bbSFeUVYr+YtkmSDYnuSClI84ZayG1bBA3TGeEyU+I0XZ8cU8REIwhWnGF8bl
         7L/A==
X-Gm-Message-State: AOJu0Yyh2gk5jBY3bjqPVETFLlCLOiacqnT6x5BqG20YBTqn9j1QsLkq
	C9ibuCKOENdVJJ270wjJdv+OeEqZQo8wmJdwV54f1Mjt4Dx6qa2AgUhsp+TtcQ==
X-Gm-Gg: Acq92OEdwF6QMbOiA2+r14Dt+vlKVq8pc/0pWjGOHLBez2wzAXL12pc82HPxywQW46V
	2MoyMHgLx7ZUR0I/Jmy8D+rrHviKX+WZnULFbOHRu9Pd0iroeRphpXQNsfBThhnoTNTqbBm7nX0
	NXjlW0qemLYQrLZLYJDN/DJrjgGnHA42dtdwYA9roVwhC9YFNhjYv1eL2ZbNyJxh9EBkqKY8ASu
	1sk4I8pCL0KJGE+1YWKkEIhLWw8eqGaupQDMV3YrCD3+ay5RAM56p0T5jInFYwwO5pq1z/mjbV7
	7bZoI06gHfSUztZ3CD8F4qVfjZfybI8CMkptW0a7SSDFMoXsYmeo64xeeC5uGCPxlnew1Ik2d8I
	mNIkGQd2BkBL+YaHdIfUvYriVP+qS+k5KBgA9WdSzdJyufjNAP3KQzXd8gVrupEr0ghdRLZCXh9
	g9/BZOdCeR05DHs3ktquGP7wuvMHgJnwCWGojOAOHuSDTjIUQrP94Hv5sPSiJaAD7duwQmZA==
X-Received: by 2002:a05:6a00:3e06:b0:82c:6f07:299f with SMTP id d2e1a72fcca58-8415f3e81a6mr20982338b3a.14.1779894519182;
        Wed, 27 May 2026 08:08:39 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d72eac34sm2874346b3a.49.2026.05.27.08.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:08:38 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: composite: fix dead empty check in the USB_DT_OTG handler
Date: Wed, 27 May 2026 23:08:32 +0800
Message-Id: <20260527150832.2943293-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38102-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-usb@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1311C5E6AB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The OTG branch of composite_setup() falls back to the first
configuration when none is selected:

	if (cdev->config)
		config = cdev->config;
	else
		config = list_first_entry(&cdev->configs,
					  struct usb_configuration, list);
	if (!config)
		goto done;
	...
	memcpy(req->buf, config->descriptors[0], value);

list_first_entry() never returns NULL. On an empty list it returns
container_of() of the list head. So the "if (!config)" check is dead.

When cdev->configs is empty, config points at the head inside struct
usb_composite_dev. config->descriptors[0] reads whatever sits at that
offset. The memcpy copies up to w_length bytes of it into the response
buffer.

cdev->configs can be empty in two cases. One is a teardown race on
gadget unbind with a control transfer in flight. The other is a driver
that sets is_otg before it adds a config. A reproducer that holds
cdev->configs empty triggers a KASAN fault in this branch.

Use list_first_entry_or_null() so the existing check does its job.

Fixes: 53e6242db8d6 ("usb: gadget: composite: add USB_DT_OTG request handling")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
This is the fix for the problem I reported on linux-usb on 2026-05-20 [1].
The full KASAN report and the reproducer are in that message.

[1] https://lore.kernel.org/linux-usb/20260519184106.2356558-1-maoyixie.tju@gmail.com/

 drivers/usb/gadget/composite.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index a902184bdf82..a5e7c6495949 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -1863,9 +1863,10 @@ composite_setup(struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
 				if (cdev->config)
 					config = cdev->config;
 				else
-					config = list_first_entry(
+					config = list_first_entry_or_null(
 							&cdev->configs,
-						struct usb_configuration, list);
+							struct usb_configuration,
+							list);
 				if (!config)
 					goto done;
 
-- 
2.34.1


