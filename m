Return-Path: <linux-usb+bounces-38044-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LgoNJGwFGrRPQcAu9opvQ
	(envelope-from <linux-usb+bounces-38044-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:26:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AA45CE5BA
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18E9D3022F87
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 20:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A462395240;
	Mon, 25 May 2026 20:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N1ihbHRb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFC13290C8
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 20:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740778; cv=none; b=MPYMSnNzo2eHOcPxe5+Tq+kBDUZP9W1dw1pjcirfLu3bJoZD2yWxTfWZdhDnmDbPcJfKCU1W8OaYtTw9kPagOVYyjKzIXffaxHUWs9qNKSGKXClEcf9EujmcV7WXOC000MTm35Dzjp4SfynagSZVeVo0FPfleE75Pp39YXd2TKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740778; c=relaxed/simple;
	bh=0fGTtdOlj0OaFFj/juQWY2eIIWPMURqhon21vBu56EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNM0XiJ2qETNMBTzdh3oq1CdzehRZE3/vstmamgwqeKRVDqChNSjawwLOVPPBEeI9QMF47YVlSR+SmlYG1a5n2M4PfT6cbbu1jqCsY1mz3WXICPsC54OTa4vCWjjt4BZCgW8fdSSm6Fw7AQ1sKDteV0PcIkcYl9qfHq6oB09GKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N1ihbHRb; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-40ef10ec84cso8647385fac.2
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 13:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779740776; x=1780345576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rH2bOPxUTZ7jcp1ZJ8Ke8Qi27deWhvd2Eb9MPg+cVXs=;
        b=N1ihbHRbNIO+fpTEQGP7+2a3O33DUVbzKENO6P0mvJcVzswFGAVLWaxSLIrtY/IaA9
         kEk68GUMiViL9A8RFgy+bP7HL7/tbSrd0m5uGKykaRd4P8PZDLvBLqeibSnUNDJ0Ilk9
         W0YAyzekyU/Ae0eEq5iOMHSs1ZW1jdjyxZC031vCWQew7tapVp4/+ur3RbJ6VZ8UVyF3
         UQ0h2JgWZ8Blg2N/G2c5WRUxa/br9U7lgr7T3kHxl0/J5E7SsUPh4Bb8jsqgqLD6bBcw
         Q7/KVg8K0TEHs1tHxx9bJkHI4ZLbmlya0PqyDVwb1OE5qBC96RXsIgcFPKgOVulA6fnB
         ijoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779740776; x=1780345576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rH2bOPxUTZ7jcp1ZJ8Ke8Qi27deWhvd2Eb9MPg+cVXs=;
        b=nK8eBxb63Cs3KEGLFuinv4rvXoeaCsbGwj2KdDnv7wN0mLJIz9GUo/6pcqgAEWr+fL
         bHHumUmyO8yfDwYzWQDcOXnTjAygG+pWhAu5qlj50CYBeaOGVu33itAzojLgHAOKjM8U
         nlhSsysEuRWBVxbxxRUZcszCrahi8TpeEfE1f/b4JXE6rRs4Kkksaxyl+qFAt+COgp7I
         fAzjxDhx6fCYRxPFUrkJ+ZH3in+c4vs1w4FsAUqFJCRy/DsLEZ485jTScTck84nD0EEa
         lltt4R4Hr5g88mJfCpFnBfo97ZrFVDoKCvJHy5N2oE2TWcJhtXTk7qFJBw+V+yRhwcat
         4u0w==
X-Gm-Message-State: AOJu0Yyep68ppfSONLw5oPhNp52K2fv63nlGrOiOu/DzW1MiT7hq6pj6
	JD4egfQRKONxXFoDXFuSUB+usVOwpXZp6frMWiWv6CuceN79mLK0DCHEwQCnv/SEL/I=
X-Gm-Gg: Acq92OHyDksuHCoyg7j4UzUxfmYZjFlUBqvwm952X3L8Sdz1+VF996IoQgFVHqpAY2P
	4PcsdN+2stiO9vsSG6aTUNJ7QjfdYaY3WlwwHdLYJPDwGBaQX4Nad7cCUtlx42RAj9mHwg6V3W0
	R5GJ9Zb7fw96JEj159uYpDSFC6zfjm3fLo5AQUzqHLtDx171s8XpiZU2y7W7K3K1vQt9pIMQntA
	7vukcZKMk5Bk4OAjygLex+coPL6aULoqc1z9S1aqDvaNuruslzzk8et7Vutapx7jMiCLyMXEU8W
	/Vk2bKa9t6MYzyRWBnQwqe2Vp0fvDghvOeffEavDr4hpQ1IPeb0ky3gwn80i/l9fYIro+bM4MB/
	lmWxQuEOJFEgXlhtX6wvD0NvXewM4couyL6euD9fQ5OTWOtXtEaS96P21Tbi+t5zZ/hA9SzIxkc
	vJgm8WHeQk8qT7m9JP4uDpLuyd7/w168puWXJzcWifBbcWZC3UgB0djLIePIak6e+JNzdBM/iJ+
	xSf/5F8AxhfBO4WNz+5EuaKmDP9auuNR8+PxoxyU2Rafeo=
X-Received: by 2002:a05:6870:558d:b0:439:c004:3b72 with SMTP id 586e51a60fabf-43b5ad60a78mr8479754fac.22.1779740776418;
        Mon, 25 May 2026 13:26:16 -0700 (PDT)
Received: from DESKTOP-J47FREO.mynetworksettings.com (171.sub-75-196-24.myvzw.com. [75.196.24.171])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b63512d63sm10898192fac.2.2026.05.25.13.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 13:26:16 -0700 (PDT)
From: Adrian Korwel <adriank20047@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Adrian Korwel <adriank20047@gmail.com>
Subject: [PATCH 2/4] usb: gadget: f_uac1_legacy: fix use-after-free caused by bound guard
Date: Mon, 25 May 2026 15:26:10 -0500
Message-ID: <20260525202612.680-2-adriank20047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525202612.680-1-adriank20047@gmail.com>
References: <2026052517-undergrad-reformat-44bc@gregkh>
 <20260525202612.680-1-adriank20047@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-38044-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 73AA45CE5BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f_audio_bind() guards gaudio_setup() with an 'audio_opts->bound' flag
to prevent re-initialization on repeated bind attempts. However the
fail: error path unconditionally calls gaudio_cleanup(). On repeated
bind attempts after failure, this closes file handles that were opened
in a previous bind invocation and already freed by RCU, causing a
use-after-free detected by KASAN:

  BUG: KASAN: slab-use-after-free in filp_flush+0x23/0x1b0
  Read of size 8 at addr ffff88810d5523a8 by task bash/306
  ...
  gaudio_cleanup+0x59/0x100
  f_audio_bind+0x4b0/0x590

Fix by removing the bound guard and calling gaudio_setup()
unconditionally in f_audio_bind(), making setup and cleanup a matched
pair within each bind invocation. Remove the now-unused 'bound' field
from struct f_uac1_legacy_opts.

Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1 implementation legacy")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 11 ++++-------
 drivers/usb/gadget/function/u_uac1_legacy.h |  1 -
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 5d201a2e30e7..6ad4b16769b7 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -735,13 +735,10 @@ f_audio_bind(struct usb_configuration *c, struct usb_function *f)
 
 	audio_opts = container_of(f->fi, struct f_uac1_legacy_opts, func_inst);
 	audio->card.gadget = c->cdev->gadget;
-	/* set up ASLA audio devices */
-	if (!audio_opts->bound) {
-		status = gaudio_setup(&audio->card);
-		if (status < 0)
-			return status;
-		audio_opts->bound = true;
-	}
+	/* set up ALSA audio devices */
+	status = gaudio_setup(&audio->card);
+	if (status < 0)
+		return status;
 	us = usb_gstrings_attach(cdev, uac1_strings, ARRAY_SIZE(strings_uac1));
 	if (IS_ERR(us))
 		return PTR_ERR(us);
diff --git a/drivers/usb/gadget/function/u_uac1_legacy.h b/drivers/usb/gadget/function/u_uac1_legacy.h
index b5df9bcbbeba..fd22fd37fe53 100644
--- a/drivers/usb/gadget/function/u_uac1_legacy.h
+++ b/drivers/usb/gadget/function/u_uac1_legacy.h
@@ -61,7 +61,6 @@ struct f_uac1_legacy_opts {
 	char				*fn_play;
 	char				*fn_cap;
 	char				*fn_cntl;
-	unsigned			bound:1;
 	unsigned			fn_play_alloc:1;
 	unsigned			fn_cap_alloc:1;
 	unsigned			fn_cntl_alloc:1;
-- 
2.43.0


