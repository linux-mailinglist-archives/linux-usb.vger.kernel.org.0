Return-Path: <linux-usb+bounces-33797-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG3cCjProWkjxQQAu9opvQ
	(envelope-from <linux-usb+bounces-33797-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 20:06:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB1B1BC6A1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 20:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E2AE30DE1B8
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 19:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AD738552C;
	Fri, 27 Feb 2026 19:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9cKGb2i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027C5345CCE
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 19:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219086; cv=none; b=R+u0tvNoHuYQSTHX6Ivu7TbnncoQS8vkI7dKClKwyD/E30U6oHfr3ROfonE/Zuwr6k623tgbBttANJ5bN+us8k7CW/UW7UvvfsaNSMLkYMK7xIUwm21eaHrHEm1GXeXr/zjvqDpGHk/gDwmhrYjf24S0cmdEK9oyNnNpnWBdiAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219086; c=relaxed/simple;
	bh=jCyXajtX9ghhjKyXCXL6my2UfNnbOKCA8PbenbqJC6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N6nhFIXI9RNIkwdLg99V5W00wad56FUm/gzDeM8Gv7KDT96sRvHSbIJmryk6cALN+1HzHaccbEOrNTzbrngryT50koqn0r7O8bFy9TWqz4J4wh7MKqfv8H70aTSQMhVG0ZXm/3FpCU3tjREzih63AtQgjyC+46i83fcWufMFdcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9cKGb2i; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cb7edbcde6so313100585a.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 11:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772219083; x=1772823883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9B+wvxt/iP99Bc6MjcM2iv5vWUnNflxvIlDxaXw7zY=;
        b=L9cKGb2iax6effimjktQp9CmjbQuYGOftHA+X2NZrQLwkHvL9nAaXi3Q8Dipgoup8X
         hQ4RAutH1ISS3UXaI1rapukVafcrAQcycSeY5OIW29N8MyngWprL76Yv1dTDGlKz59m8
         iq2pfAFH+IRJ2sbRz8Bl8HaV4649/E+EBejuu+XBVJvpCle+28qKShKW9BxczVAMvGoN
         a3pPxZCQTy8h8PM9DI05UNJ0wZ2m/NC+e38lwGRG/Tjp9vyg/bA6raK5TWWVDQ2NpMux
         bd8TVaGN7hmRUgLWwqSFbg6PVIcBXe5whwbV0xt3P3d1SlYPqn4bWKZt3+0TKNRY4KPv
         Jy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772219083; x=1772823883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9B+wvxt/iP99Bc6MjcM2iv5vWUnNflxvIlDxaXw7zY=;
        b=ZRZ7bcv2pu9LSDwx1e2mzFkwiKcxAb/f+MCQHqnICoVt0LNOGBlNMWXjzbM7dv5bW4
         Ty8nyBKseyyybLme9a5p6TPhmpi2UP8CZzbc0aPyvCKWYmG3TqCNidCDr8Ixi9UScYo9
         sq3Ha6xfJWYXxzQuLnG6/0X6QtrHgzZo/2Vl8Sq40aKX0Au6JhfoCcvqP2osUmV8kb+0
         hi8zX0lSYXlwLc1d7z4bIGgXpN0Pfk56+dqJQieu5PNpvUFXXa5CumQRLNH1y6quKMmp
         j9/rDmrlNX5xFFUyD7JWMbM/jTnEyE1douLnuqViQZGH8tzaFmmUI471Kszj4WVC6x0g
         4eMw==
X-Gm-Message-State: AOJu0YzESohQQWH4RF6NLj+Aj+pcEXlwNApGuTEDCyD4FbNT1jNe+4qX
	ESiDCjLM+MnUrEIfygNL2yiWTZMZR9j5obPIRAQui+Q0ALuj3sA1KkmqXH1NETEK
X-Gm-Gg: ATEYQzyN+ayXZ8cyGobtJxI1sc1QEamkR/mTP40cmo0o3xeHRaUri7VFOQjs6cUaH3Y
	I3sWdbjuhAouAbGptpDGsO6DsrVpIZoXdMZQYy59v5csJkt3PAuj8KMphMLVxJ5zewkHub9dE9m
	QqDM0uaXOhNP6JV5PAEsCAr9TIA4uHscHcMa4INApKCsiv300/RXpM/Dt1FC74e8/lA22PyBB8p
	r4CmPMdgbwIBpcpzt/1KWKCaGnOZuFT94+qMX+Mk4Xw3kF1DH53TPViO8kEnPxtXvOkviJpY4lR
	+3Iq3vF9DAXEc1H3j6bfdkPy6QvXyNFFAzwxjgfLzyqr3Lg0jYvOMahravR/FlzbPUhiRCOypXu
	JyP5tAJHfWLRxBHKVm1gyMY/8t7D8E+P5vpcjVs8yWznO/AL7iAbLNINODkulUZvsMPNjTEfd9Z
	UfLWhPXcoLPEYzwIC4TnGvWJA24WmotlLykhTGBErfDPpBvp6uGlRtU5rHNXgQbXjCHyVUtpCNY
	C6WGukD/zXlRTbaGeStzx1DVyNFVg==
X-Received: by 2002:a05:620a:290c:b0:8c6:a72f:fd56 with SMTP id af79cd13be357-8cbc8e808demr483504985a.29.1772219083437;
        Fri, 27 Feb 2026 11:04:43 -0800 (PST)
Received: from localhost.localdomain ([129.170.197.95])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf673060sm535932785a.14.2026.02.27.11.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 11:04:43 -0800 (PST)
From: Nathan Rebello <nathan.c.rebello@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	neil.armstrong@linaro.org,
	andersson@kernel.org,
	kyungtae.kim@dartmouth.edu,
	stable@vger.kernel.org,
	Nathan Rebello <nathan.c.rebello@gmail.com>
Subject: [PATCH] usb: typec: ucsi: glink: cancel pending work items on removal
Date: Fri, 27 Feb 2026 14:04:30 -0500
Message-ID: <20260227190430.889-1-nathan.c.rebello@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33797-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,linux.intel.com,linaro.org,kernel.org,dartmouth.edu,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathancrebello@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BFB1B1BC6A1
X-Rspamd-Action: no action

pmic_glink_ucsi_remove() does not cancel notify_work and register_work
before calling ucsi_unregister(). This can lead to a use-after-free if
either work item executes after the backing data structures have been
freed during teardown.

notify_work dereferences ucsi->ucsi in pmic_glink_ucsi_notify(), and
register_work may call ucsi_unregister() a second time in
pmic_glink_ucsi_register(), causing a double-free since
ucsi_unregister() does not NULL the connector pointer after freeing.

All other UCSI backend drivers properly cancel their work items during
teardown:
  - cros_ec_ucsi.c cancels in both remove and destroy paths
  - ucsi_ccg.c cancels pm_work and work in remove
  - displayport.c cancels in remove_partner

ucsi_glink.c is the only backend that does not, despite initializing
two work items in probe.

Add cancel_work_sync() calls for both work items before
ucsi_unregister() to ensure no pending work executes during or after
removal.

Fixes: 62b5412b1f4a ("usb: typec: ucsi: add PMIC Glink UCSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 11b3e24e34e2..99e5ad54c6df 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -463,6 +463,9 @@ static void pmic_glink_ucsi_remove(struct auxiliary_device *adev)
 {
 	struct pmic_glink_ucsi *ucsi = dev_get_drvdata(&adev->dev);
 
+	cancel_work_sync(&ucsi->notify_work);
+	cancel_work_sync(&ucsi->register_work);
+
 	/* Unregister first to stop having read & writes */
 	ucsi_unregister(ucsi->ucsi);
 }
-- 
2.43.0.windows.1


