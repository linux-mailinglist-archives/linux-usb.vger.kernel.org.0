Return-Path: <linux-usb+bounces-9686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C8B8AFE00
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 03:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D624E1C2285E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 01:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 791978493;
	Wed, 24 Apr 2024 01:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZzuuqTjr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B2A134AC
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 01:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713923328; cv=none; b=J5Z0nFQIfD2j6uOOOtkoibIeDn6EAszTSJ9tCBDZOUGlsJdlqch5mDloM7+lpQY11vnCZSdpfvfccK/wjsMJ5Zf0JYJsmUTYH+oec+fIJJzWl1akG1IG6ZB+9JHbYusEcDkRn7HUbzQwom+ctkt3JaI/s8d/T/8Qg42WDHUHwOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713923328; c=relaxed/simple;
	bh=DkEhHOa1YOY/idk5PLSaPlY0Gz579FEwlh+ZoODqcWQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QHXy2dJZr2lip0G6/h7yMHQrhEAGD+mWcNjfH1PULbSKCf3VeEaPwSocJJmWeP0izF2urwko3EzoNP7IN8btW23/ecmKCe9az5sGDDMNEGBZFwHRztx5QGpNk9wfYOaTHJlsD/zp3qldqB7n91dxe0XfUE0Uaa4Eu9JR6/s+4Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZzuuqTjr; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dbf618042daso11563574276.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 18:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713923325; x=1714528125; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8GjkODbBEJ1z1TWojaRQYVjYLRHWjXoJ2bOwq1fsJLc=;
        b=ZzuuqTjrou1v1lQ2g0S4HoyRkZ1lSJKLigPx7YYftFUFPgENZKSY+JAAcL9oxF51tB
         7GYGBuJhussNiMipAQRxBr8+7GZ0EJKRDzsN/eI1RTHQkd78DwCc+ATZz8ikHH9rHkAQ
         WsDC+wwaLxAML9rDQjkg4L5XXM5YeyTttXIz81L31tbrwOyCWV4O+VPQN1tzjWcvRPva
         8TKtPnNJPKWd1Ycd29EcJqqSVGiiXNHLigdw4TmJzienMaiiCNJkW8f6u7cAWqb1A0YJ
         UQQLJwk1x9c6OJc4n762CToOgojwGSxRfc0oKO++tWV7w5F+yf0j9Ei7mKCcoiamSAVO
         KvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713923325; x=1714528125;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GjkODbBEJ1z1TWojaRQYVjYLRHWjXoJ2bOwq1fsJLc=;
        b=tQrQCG0fG3B5VxTHH20b4Nh3DhnrY0cyDhD13BxEiHrpB/6XhOoGzOLcamc+1kGgZ6
         jLHJa+xt1KAsEHBEJpb0n0a6MGdTYqG4Q44OlfaFaIg+4E35N/qYWOwTq5TLcIqA2BsQ
         Lz6PEIc2biWKSY6OphxkRrvbo81Vj3wFIVD8x+Lllm2kZoqSoXojA7nnoah0GqeZotli
         MoawMwptlHVZW8a3ZRjd1yMEWArFWsq4jgIML+LjNHaD4tH/FoldBqCdodXglXo0CryZ
         3H9N3VAJ9fBELF54L7tWsriWgPgeka0dNvXL7DxO/GJASpb5/sGFn5uAS5STjU7Yq1If
         +3SA==
X-Forwarded-Encrypted: i=1; AJvYcCVRdqDrxMZzfdwt9TeumYEpE3Ff8hfXAJUqy5nsD6OkrqamBnnTp2QyVPFMtg2xUFZvYrHa+9LyYht5BbjcRcNCgL0IeCfLF8Zn
X-Gm-Message-State: AOJu0YzsGCKdy6pKXLpaBz4yH/S5kwp4cnyotrg/riQto2R8ifuj/gG6
	PrqMS0C1Wrx/elxCPrNDDuOX9ALLrfAqLAXmIXpJKIceEXNYIi5sNrcdQvLtF3t1wi8Z8D88Bn8
	KMg==
X-Google-Smtp-Source: AGHT+IHqRn99HKG8GFzllw4oydn6oguqocBMLsNVpEhT3sxDknYY5ILkKUekAtW/lYM18qpYQB6w/FSUoaQ=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:6902:218d:b0:de5:c2b:389b with SMTP id
 dl13-20020a056902218d00b00de50c2b389bmr104786ybb.5.1713923325627; Tue, 23 Apr
 2024 18:48:45 -0700 (PDT)
Date: Wed, 24 Apr 2024 01:48:18 +0000
In-Reply-To: <20240424014821.4154159-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240424014821.4154159-1-jthies@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240424014821.4154159-2-jthies@google.com>
Subject: [PATCH v2 1/4] usb: typec: ucsi: Fix null deref in trace
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

ucsi_register_altmode checks IS_ERR on returned pointer and treats
NULL as valid. This results in a null deref when
trace_ucsi_register_altmode is called. Return an error from
ucsi_register_displayport when it is not supported and register the
altmode with typec_port_register_altmode.

Reviewed-by: Jameson Thies <jthies@google.com>
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
Changes in V2:
- Checks for error response from ucsi_register_displayport when
registering DisplayPort alternate mode.

 drivers/usb/typec/ucsi/ucsi.c | 3 +++
 drivers/usb/typec/ucsi/ucsi.h | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index cb52e7b0a2c5c..f3b413f94fd28 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -361,6 +361,9 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 		switch (desc->svid) {
 		case USB_TYPEC_DP_SID:
 			alt = ucsi_register_displayport(con, override, i, desc);
+			if (IS_ERR(alt) && PTR_ERR(alt) == -EOPNOTSUPP)
+				alt = typec_port_register_altmode(con->port, desc);
+
 			break;
 		case USB_TYPEC_NVIDIA_VLINK_SID:
 			if (desc->vdo == USB_TYPEC_NVIDIA_VLINK_DBG_VDO)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index c4d103db9d0f8..c663dce0659ee 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -496,7 +496,7 @@ ucsi_register_displayport(struct ucsi_connector *con,
 			  bool override, int offset,
 			  struct typec_altmode_desc *desc)
 {
-	return NULL;
+	return ERR_PTR(-EOPNOTSUPP);
 }
 
 static inline void
-- 
2.44.0.769.g3c40516874-goog


