Return-Path: <linux-usb+bounces-38253-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMdJJC6QHWrFbwkAu9opvQ
	(envelope-from <linux-usb+bounces-38253-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:59:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6432662067F
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ABE1A301DA5F
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 13:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3AA3B1016;
	Mon,  1 Jun 2026 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oPDk3QCB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79163B0AD6
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322120; cv=none; b=IQSBr0lOecdvErkbMK2kqcPHQy8OGV89/Y85jrQDuhUi2N+F0F8KiYxUDcuJ9mDYTwDhmpx9LcTdgxH9e85IpaShPINPaBaNSBlZP477CboJT5AJlh91UllNt+41l3vL+DVMCa3UNY7IzUxW+p8Co++g0KxeF2v02lWKG1b6+Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322120; c=relaxed/simple;
	bh=pcLLBYhd55OMdrR5lQY/SUwDurCQI0yLUgsM9xlx3jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VLs1R41AzjZij7xA1pghH+yTNsMS6tFI13j+1XKrJEKUhUiYQvnvWSSoaS50/EYhAPTZi67QDSB/TP0ORCzo5HinZDye0/ExNKHnd+wxcB1QT6yq8RpgdotixU6XzptTHG28iemdFSKAsP6EBI4Ms5gQV97K2t8rc17veQLP2nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oPDk3QCB; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so1738201f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 06:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780322117; x=1780926917; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=szNmvRqcNNVrQ+k0EalWeikL/uP5KXrlLB2qyTZSbeQ=;
        b=oPDk3QCB0bbLOmrs7pcoteTSJh/htzJDnkNaIqgWuIEiWWxGwdxSQsYFL5VT3/BUSU
         Lq0YXmyQ4DBUNtj4mBYnUdUdSfhVU8fILP79wpUtzeRwyoZHi3eyJrA8xVlZA9RMGgqf
         jxnxJJmzgUQCIvNcztQoDtVru+UlBZWOXA7qlq+iE9pgRE5tzj8X7/q2T8p3AEQTigN6
         hjnDES0CpE3f0Qw0nwVNvP0oqeCPECImW1bLdgIla4Zkc7YLFbK/JquSe40NYROAoFl6
         cr1/77qxPGFL01vJL4aTu4+mYrDADMQle2uxmqWhEBkOUtdW+8SIJhNwA5emh/Edf4yP
         TjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780322117; x=1780926917;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szNmvRqcNNVrQ+k0EalWeikL/uP5KXrlLB2qyTZSbeQ=;
        b=ZA5OKkL23HpgDCETqjV6/cLfDqsTn2Q2WqIVZM7+lNQxYR2/RtKz+UoERnYP9m0LGx
         KLfmwXimR15ZYWt1m+P9HFeukpeje0J4Q9N01iVvCIUVSrJD4H105z1SkaJYlPYV/gvL
         oCmsLNEYdxcHbv0D7KRK4yFhDC44p3syjcwxLuBgEjz9efzrTq33O7rD/2yAYH4KF0it
         kfAZ561adp86o3Ja/HVHlUFiJIR9UtT+Z8Oij5LClBVtJ6pTsZhhD40B2rjzD27HbwY0
         UlWhuPJBk2IwCY5/wRwXx+d88CfokcLhXCdiSw+pMjCLJM2Imxh8uMekboqjamVv8CeC
         f/9A==
X-Forwarded-Encrypted: i=1; AFNElJ/grVOjs5ZbLixehu2PtOjChkHcv8WZHqMasWPbTYZHxB3CISgBYdfTnkaczTVFrH/jGBh5iWtLDto=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP8SPJRORMPwMe0vSJzLNs1a8J/+n5JDk/pc9e2F0qsYAy0xG1
	oscxceG3RrGsvANqI+WRdQMXHzT4y2N2ZMplHOe2tTK6NApc7AHiAzNkkrMa25QRV7A=
X-Gm-Gg: Acq92OHfggJ3J0Os0wHjMQ6PpPMbAkff+wioY2+K7UIa2zWRIcPtRGJhmThMgPqHilY
	gYij5Mu3XhOdrEzAaGAuwmZ9hvrBnoYQmRB7cnKePyhzXwVSe4MukSXJ6i5OYs6JAMmZ6gTBFAl
	ZoHL2zIyGfWBv4K6DysWteE5eMqSh08vYkv8RxN9kLDzf9CSGZDR49c2S8yETch8zHKe7pcGgWW
	6HbcA16/p/TWqZXoKtn3y14FcE+PiRCSGv4lrsvSVoA9ZEHgcfwJ7BIwbPZM4+6Ho3G8yxtrJtO
	beQcAeSKm6NNXjBxNPKTdZaAzTrDakebr2gsSC8twB8pML3akGP2fO/DQ0SOwsKVa0RTTTpoqOO
	lfyHr5X7Q20h/aqYV9Q696jRe2m+moImRsoqwDtJ45P/aYNmRfv38usuiT7UixqhZ8IRAC8llFe
	mML4vKInvvgG/7i2pkeKa8Ph3c2hLcRFu+KYvpBPEpWdemJk8=
X-Received: by 2002:a05:6000:2812:b0:43c:f90b:5668 with SMTP id ffacd0b85a97d-45ef6b4f2b0mr16036177f8f.23.1780322117135;
        Mon, 01 Jun 2026 06:55:17 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:4e6c:e715:40c0:8dfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35598e5sm23280289f8f.27.2026.06.01.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:55:16 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 01 Jun 2026 15:55:02 +0200
Subject: [PATCH] usb: typec: ps883x: Fix DP+USB3 configuration
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-ps883x-usb3dp-fixes-v1-1-d19bec3a6d26@linaro.org>
X-B4-Tracking: v=1; b=H4sIADWPHWoC/yXMQQqFMAxF0a1Ixj9QWyjqVsTBbxs1DrQ0KoK4d
 6sOD4/7ThBKTAJNcUKinYWXOaP8FeDH/zwQcsgGrbRVVpUYparMgZs4EyL2fJCg0V7VVLtgewu
 5jIneIYdt91k2N5Ffnyu4rhsXIy+ZdwAAAA==
X-Change-ID: 20260601-ps883x-usb3dp-fixes-32c09e9bd6f6
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jack Pham <jack.pham@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38253-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6432662067F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit 6bebd9b77726 ("usb: typec: ps883x: Rework ps883x_set()") introduced
two regressions:

 1. The CONN_STATUS_0_USB_3_1_CONNECTED bit is mistakenly written to the
    wrong configuration register (cfg1 instead of cfg0). This breaks USB3
    when using USB3+DP adapters.

 2. The switch-case fallthrough block is inverted: Currently,
    TYPEC_DP_STATE_C (DP-only) inherits the USB3 configuration, while
    TYPEC_DP_STATE_D (DP+USB3) is missing the necessary DP sink flags.

Fix these by writing the USB3 bit to the correct register and swapping the
case statement order so both states get their correct bits assigned.

Cc: stable@vger.kernel.org
Fixes: 6bebd9b77726 ("usb: typec: ps883x: Rework ps883x_set()")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/usb/typec/mux/ps883x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
index 1256252eceed..c9bf4b4c2ba1 100644
--- a/drivers/usb/typec/mux/ps883x.c
+++ b/drivers/usb/typec/mux/ps883x.c
@@ -118,12 +118,12 @@ static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retimer_state
 				CONN_STATUS_1_DP_HPD_LEVEL;
 
 			switch (state->mode)  {
+			case TYPEC_DP_STATE_D:
+				cfg0 |= CONN_STATUS_0_USB_3_1_CONNECTED;
+				fallthrough;
 			case TYPEC_DP_STATE_C:
 				cfg1 |= CONN_STATUS_1_DP_SINK_REQUESTED |
 					CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D;
-				fallthrough;
-			case TYPEC_DP_STATE_D:
-				cfg1 |= CONN_STATUS_0_USB_3_1_CONNECTED;
 				break;
 			default: /* MODE_E */
 				break;

---
base-commit: 645d4eda1d0db0202ed8e4a2c3abb2ebce6b86ef
change-id: 20260601-ps883x-usb3dp-fixes-32c09e9bd6f6

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>


