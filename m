Return-Path: <linux-usb+bounces-9667-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 945598AF7F8
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 22:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C10AEB26A04
	for <lists+linux-usb@lfdr.de>; Tue, 23 Apr 2024 20:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271AB1428F7;
	Tue, 23 Apr 2024 20:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PDeb47Cv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671C15B1E3
	for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 20:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713903928; cv=none; b=og/nE1z5aJYkS5YOcjbGqHQdx/+x1ZsZ8UAsfBVa3KTXqT3VaPXx8YDVZVVDaegCZPl6TURvvhiLJC5xDIzQ6GP7mz7N/FuknVsbaAOXiwjVLPfr8hLz0INEivmnwujx/q5Ghs1GnMnipPiyMVU59X6mMapSAHqAFmsLRmTo8VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713903928; c=relaxed/simple;
	bh=ox9VAXUigA+jjojvWTyN+ep9mL1aYjavByEeOcIfuGg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=HPvTA3NMLD6PNnStGncJH2PvhRD2Zq3Q/pgEbNJmEGS3K/Mi9egr5OJGDcegDqlUz1JOi+n/XjCULOv+zFrJPGYfsbf27ES+JSmTK3jDa2Wy6pxdhN73kiiDCvN/5Rg0gx2cyNUC4aqDF8GX+l5F6N7TvIMHYoyL8r3p+C2S4l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PDeb47Cv; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-6ed25ed4a5fso8203882b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 13:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713903927; x=1714508727; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+x5iDgWl9U76E7JTEROvvperMnBi6gM+ns0FOdEhwWM=;
        b=PDeb47CvuhSlYEoDaSNWCYAxVZ4ZduPVLM0WgX+KjR3vf5e9Bz1SXx1XgVSa5oWIt3
         5UI1iIow+24NOxuv6u34TWTM5aHFr7Nc8uRHN70ikMo9LSmku4ZYer26T70FAwyrRJYa
         +aARBY3o+Vc7/CIG16pw5Dm0XBB1I4hnlKFLnVoU9NsXCTMmffeLpAzt6a+fw1Uy1EP9
         QVJdapyAUWYXLM29K0NHIw5UtHQmejjT8bEDr1LU0muhFbUMph5KgH+StYHLTJ4oMHYT
         gxDZDPh73SeNiQphJF2dNySy/TLbooTVEof+KohNg9hjNd0+JkO9ON/OyKuu8NwbAWEb
         huhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713903927; x=1714508727;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+x5iDgWl9U76E7JTEROvvperMnBi6gM+ns0FOdEhwWM=;
        b=rQeM2H+7kSMaUvrj84hhEQQ+ZXciFwJPVu46stm8abkUjtSL1TA57AClBh/bg2H8Qk
         3tueqeYTI9CTEnunuZrpvyCwExH2UAnQtuTQEbHIpl1wexM8Bb3xSf21fl4AQofmZRR3
         1U0/VldsfLnCYeDfTBOBhagIFN1Yx5lMxi1zHsh7eF9LJP7uF1WrRs+3FLhEMu7DnZMG
         W6+/b/WOHyDgFroxAqQJ+bROHO1JTQXEnUMRjbPxbAgJ2Ij7qoCkLo5oztHVlQVt2dVs
         3rpQBgFL4gMNHf7IgRsYbKnhB/inY0qjFXxEitYq21yR633C5Z6r0nYAyvyySeXK8P/i
         E/xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMjDwStlSIStM6QjrfscqGayaesACFfVwNTvPIRDiNwqhwVV8uZ2rn/ovN0e3LLhBKE5Qlo6IHIzDfItmy4ocKwkR8dMTbuLbF
X-Gm-Message-State: AOJu0Yxz/oMVm/5sJ/MZwpw06hw9882tYk8wsVOurFPpbUr5ctnC80qp
	Exww8YvbpYpEuv5Znb5Fg8/TmDt9xXul/53w+27IfFLpMn14ltSQTYkJ6Z1XRwL44qspnLWan8l
	MrSVFaec5QnMKzQ==
X-Google-Smtp-Source: AGHT+IGy54gh192OWnTT1/mgf6BEr5zH1TDmmYBKUzhfxK4cKLDWdYnQuDMdUw4+5o6vdIS7FhNAVGpuHD2hswI=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a05:6a00:2449:b0:6ea:baf6:57a3 with SMTP
 id d9-20020a056a00244900b006eabaf657a3mr101005pfj.6.1713903926598; Tue, 23
 Apr 2024 13:25:26 -0700 (PDT)
Date: Tue, 23 Apr 2024 20:23:57 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1832; i=rdbabiera@google.com;
 h=from:subject; bh=ox9VAXUigA+jjojvWTyN+ep9mL1aYjavByEeOcIfuGg=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDGkaEnf2cOyuzJq7cf3jQNdXt+/dl/jGeLJm3uqdz3KnH
 1hxp5DfvqOUhUGMg0FWTJFF1z/P4MaV1C1zOGuMYeawMoEMYeDiFICJnNrDyNBbNSFUOWObzo5T
 N0qYb/jeuBgR/yrfcndavdJ1T+cbMw0ZGSa2BX37LCTf9FlIJvN70rPIr30f1ScWXnvN+JRhRgp jEQMA
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240423202356.3372314-2-rdbabiera@google.com>
Subject: [PATCH v1] usb: typec: tcpm: enforce ready state when queueing alt
 mode vdm
From: RD Babiera <rdbabiera@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com
Cc: badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	RD Babiera <rdbabiera@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Before sending Enter Mode for an Alt Mode, there is a gap between Discover
Modes and the Alt Mode driver queueing the Enter Mode VDM for the port
partner to send a message to the port.

If this message results in unregistering Alt Modes such as in a DR_SWAP,
then the following deadlock can occur with respect to the DisplayPort Alt
Mode driver:
1. The DR_SWAP state holds port->lock. Unregistering the Alt Mode driver
results in a cancel_work_sync() that waits for the current dp_altmode_work
to finish.
2. dp_altmode_work makes a call to tcpm_altmode_enter. The deadlock occurs
because tcpm_queue_vdm_unlock attempts to hold port->lock.

Before attempting to grab the lock, ensure that the port is in a state
vdm_run_state_machine can run in. Alt Mode unregistration will not occur
in these states.

Fixes: 03eafcfb60c0 ("usb: typec: tcpm: Add tcpm_queue_vdm_unlocked() helper")
Cc: stable@vger.kernel.org
Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index c26fb70c3ec6..6fa1601ac259 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1564,6 +1564,10 @@ static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
 static void tcpm_queue_vdm_unlocked(struct tcpm_port *port, const u32 header,
 				    const u32 *data, int cnt, enum tcpm_transmit_type tx_sop_type)
 {
+	if (port->state != SRC_READY && port->state != SNK_READY &&
+	    port->state != SRC_VDM_IDENTITY_REQUEST)
+		return;
+
 	mutex_lock(&port->lock);
 	tcpm_queue_vdm(port, header, data, cnt, TCPC_TX_SOP);
 	mutex_unlock(&port->lock);

base-commit: 684e9f5f97eb4b7831298ffad140d5c1d426ff27
-- 
2.44.0.769.g3c40516874-goog


