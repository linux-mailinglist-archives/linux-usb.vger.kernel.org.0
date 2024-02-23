Return-Path: <linux-usb+bounces-6924-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3361A860798
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 01:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6398B1C21E5F
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 00:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8997D6FC5;
	Fri, 23 Feb 2024 00:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rdhAHPR+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31266FBD
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 00:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708647789; cv=none; b=D/vQVQiKQORmFxiPPRYEF0ob8pb6OueXqguGGXNnZa88PQawnrMJNfLV7birHgNmwi57hIFetN72CgXIDcX6VLu84wjM4eJLIIn1h/xKzZ1YZyiLo169GqWSY9MaiRAtrw3VvSB6FiygW89cumKE9eqjRO1Qxn8tJbukc95Fcw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708647789; c=relaxed/simple;
	bh=CxCr4JSQNzDwayBhtWB2bC8U7458ZX3yAc4cBM+FFmg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=icV7cks5CLnvbjWPn+lPtIV2mDCuz03Y8BxhuHjEFw1P275EKreKbO/t/CCmoOfckjn5kg6FWpftxj4llrBrziZRhU+AGfan1XtpwauHf3ZJ/oIWLb0FBRRFOXZdY05I4bdW4l3iZkRHy70rlSL6IyG791b9hlmy436z9RsSdUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rdhAHPR+; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6b269686aso432409276.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 16:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708647786; x=1709252586; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TNFUvLDAx6+Y/ghPILwTUhweF7IT0DZ57bOGUDCjGfY=;
        b=rdhAHPR+EM9+BxnsE2Pc1/rwOL2llGg4jv/uNzic0MyJKsEmVu3gq0oILg/wN+WBzj
         sqpykYYaejRKsgD5X3b2AvNFeOnE0WQWmuy+sBgK+lSsUCM7H7FHvOX0F1qiIRWwspjR
         P3bBfZ3pS/4OWqvQKeAiY/ezoYkUOSIUGv06NES08kIRBUNs3B2WwiAeIQ+zO6OHFUTX
         UbLHRsefOzlAg26HBq0j6Ug4r42JVhrEORvBlLyDAj1CKc5vPj4nYZURsheWA4Au0uuy
         ++eTgrzJ53DQ5YcsE4xtqzGY2vxT3e5pZKXo28Zh+zI1aOVCwVyU5lW6PIgk2Oi4k2Fm
         KS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708647786; x=1709252586;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNFUvLDAx6+Y/ghPILwTUhweF7IT0DZ57bOGUDCjGfY=;
        b=WNVSM7rbpZxRgrNaiigELeZdoq1eYZgTyLVPwkjBu/+Aovyw2CTxBUcrJJOxxB0F8u
         A8D+0gvEJ1LtZYpfvw2Q6kVYDybrlzXwO2XLSAreJrCxIs1kvIlMZLoNk5BNoqwfpu3a
         5oZgf7/fQCr47KpagRo4NF70I/wU52bzWYIGfQFLCD4vgIwv+83u9TS1yWSA82Ank9wy
         vBDvpsbTncdWnmj/cj6Pskr4RZbc35VWutnhBojEXN+7rW5EZCZmPJ8jBxAFLj4+og2h
         CognZowZCbjycRKKXY7sowQdYsgIttFPPyAPpdkWJEn076M9mHMMUFXRxWAMGDOvniss
         l+kg==
X-Forwarded-Encrypted: i=1; AJvYcCVj2QoxhGJXWc1HIcOyZu0f1XdxtBm0bYjlcy4UO9pr0c7C3BoE7jYyJ9hIzbtH+3oTyQ4YBMhP3i805AOjBSTIwLbOa+uTt+L+
X-Gm-Message-State: AOJu0YxOK9aKise764Yp4tt4ps/VRw+fUi8Y+cbVMmcWlV82/OOTqe1O
	ze+IOZitz+zMbYUECR0/bu9ljr8jQkFVBKv4/hORvgRRKW8Ryfya+UAi8gwwe3XKGhUptzOpTUl
	TDa59RMdQxr4cRw==
X-Google-Smtp-Source: AGHT+IG+lrWVI9ecbJpAeRg8emt3hayG3XppEaH2GjtzLlIEUhBlzC8FSY/OWJ+MWBKvrLuHGfUGKVdHgIZydKU=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a05:6902:100e:b0:dcc:79ab:e522 with SMTP
 id w14-20020a056902100e00b00dcc79abe522mr27282ybt.11.1708647786666; Thu, 22
 Feb 2024 16:23:06 -0800 (PST)
Date: Fri, 23 Feb 2024 00:23:03 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=rdbabiera@google.com;
 h=from:subject; bh=CxCr4JSQNzDwayBhtWB2bC8U7458ZX3yAc4cBM+FFmg=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKnXn6Y5B8U8mSf7ZdG27kNlq+Rynnce+hR+tI39/uLbp
 T07j1Ve6ihlYRDjYJAVU2TR9c8zuHEldcsczhpjmDmsTCBDGLg4BWAiqkaMDFd4byxmW/1r3eok
 9WQT/tl2G5jb0rZxCnvVadUviWP5psvwh19DmD02JKL47bqjk/8d61kbt8dmwsbgFbw/PqwPyYk L4AAA
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240223002302.3937235-2-rdbabiera@google.com>
Subject: [PATCH v1] usb: typec: altmodes/displayport: send configure message
 on sop'
From: RD Babiera <rdbabiera@google.com>
To: rdbabiera@google.com, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When the port is setting the pin configuration when no configuration is
chosen, the DisplayPort driver will not send Configure to the cable plug
if it's available. Add transition to DP_STATE_CONFIGURE_PRIME.

Fixes: 71ba4fe56656 ("usb: typec: altmodes/displayport: add SOP' support")
Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/altmodes/displayport.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 5a80776c7255..867f9796f8a8 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -164,7 +164,8 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 	} else if (!(con & DP_CONF_CURRENTLY(dp->data.conf))) {
 		ret = dp_altmode_configure(dp, con);
 		if (!ret) {
-			dp->state = DP_STATE_CONFIGURE;
+			dp->state = dp->plug_prime ? DP_STATE_CONFIGURE_PRIME :
+						     DP_STATE_CONFIGURE;
 			if (dp->hpd != hpd) {
 				dp->hpd = hpd;
 				dp->pending_hpd = true;

base-commit: 3bf0514dc6f36f81ee11b1becd977cb87b4c90c6
-- 
2.44.0.rc0.258.g7320e95886-goog


