Return-Path: <linux-usb+bounces-12239-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FEE9334DA
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 02:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF3791F2334A
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 00:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ABE6DDC7;
	Wed, 17 Jul 2024 00:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IQEtIZwq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B36BA53
	for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 00:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721177498; cv=none; b=Lwy8kznUjP/aHlb0Se9fGjz+j+RCi2IF+tZL6hX6OgsHkTWfjo0awfRNKEAYx5K3hqm//zeLSS4y388plWq0awiOTRVf/eQtQADL1wbczaWAkMnBfaXKDDm8O4PfXjXX0cK3uSfLpUdHTMRUDz/C1c8SH6cT7EhC6orHcDD1YDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721177498; c=relaxed/simple;
	bh=TxBuHJK85vkREbw0WLP5ADupaB4b16I7uMojTYknRa8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hdOVLF+wof0QWQoI+e8ywyEy6tjTD1Rc1A8yC+wFgjx9B7jnJjHSqEpMKct4yjj1+vYhT/7BP3flicmkHeDGmVkp8PaqGnnAgJOcO36RXpFoAisuKrr+svRzFsR7j8doIEXjkhTBvzuF4rXX4alt2hJdkYMkZQNa1ks/w+kRetc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IQEtIZwq; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6511c587946so127336067b3.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2024 17:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721177495; x=1721782295; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTO1tsJpanrsIXuREfXU+lZcoE2mxE9RW1fzcKxRuPY=;
        b=IQEtIZwqThfL2tkpbppOAJIWrEBFeGp3JwQsUjLtFGvkKsUrCT2pEDg7MyBBoxyUGt
         ZxUx4caN1wQfl7C4IqBbD0err8tciyYKAN+fRjlQ0V/0ez+9/DnETUu1YAOkrXOXH/jn
         8Fg/+yy7AAraMqKS8laXtfRbjiMdBgWsZFn2+DHpJwlmnc74Uav7A8q5+WLs2m4RAkl3
         88+Y5ECH4bCBGSqBtID+FiQsBaAyskBiKCFBst4Gxzw4Rds1vSrfTNk89/5aUCg0q0eR
         EX4d0r7RJkPtjJH+KAZNbiq2sN/C6DjhZ1HCSjTmKSkzSlxirdTo/f/gihcOZOuDeMHf
         M//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721177495; x=1721782295;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTO1tsJpanrsIXuREfXU+lZcoE2mxE9RW1fzcKxRuPY=;
        b=t0qyUomhNsLy72zKt2yeDA+xJs7vBm9a8b2ucvirATZOu00Z97bChpiG9ZetTUm+eB
         oTAEEOWu6ZY06SgCT0je6FCUeHOhtjZb+5/S6NCQiPQzIpsH5uXycP+1CrJ5b3zU7OKa
         Ii0ir3adEW+WrO3mogBVFW/6l401j/s1g5WlPGXXAWrdNruBgLEonCcCEZyQTGeObdSZ
         OfzU+dyHELp7IqUWPHlkZZQJSG8pT6UOEavD98ff3i4dSGYN15uBQdEspYiBhxaNwVaG
         7YNWh/qa70YZlJq3EwZ41g6mT4+Le+O+9oGI0Akmigzu5nfjcL36H73tHoYnR/F1Etv8
         ouig==
X-Forwarded-Encrypted: i=1; AJvYcCVsJ4neF5hJFSaHy2xK2u1aBtVCPVy6KqEVyRG8XMYwjnDfeBmZsNZadCEkXXHZMA+uj5XGXMu4OCjjx5r9OiF5904W73/O+FqO
X-Gm-Message-State: AOJu0YxzaF5J09Vwjjkvq8+t4gfNzDXtmEEwY//PEtkpDgwTIr3l0qGy
	ng6E9kjVnehYTI2gIr3LPcetY9gHNg2RoauGeAvD7bnIW3D4UbHRzhGusvYg1oR2irYnxmG9Vnq
	VpQ==
X-Google-Smtp-Source: AGHT+IGg09Ayrrw6aRkughQryryAOlXFSVSJLvjMGLhBlG76jIsoZGI0TJ101PkcfAxrh48DyXAxTN6wUSc=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:690c:289:b0:65c:4528:d8ee with SMTP id
 00721157ae682-664ff0079f7mr6537b3.4.1721177495402; Tue, 16 Jul 2024 17:51:35
 -0700 (PDT)
Date: Wed, 17 Jul 2024 00:49:49 +0000
In-Reply-To: <20240717004949.3638557-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240717004949.3638557-1-jthies@google.com>
X-Mailer: git-send-email 2.45.2.1089.g2a221341d9-goog
Message-ID: <20240717004949.3638557-5-jthies@google.com>
Subject: [PATCH v1 4/4] usb: typec: ucsi: Fix SET_PDR typo in UCSI header file
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fix SET_PDR typo in UCSI header file.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/ucsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 57129f3c0814..375f1881c1e2 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -152,7 +152,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_SET_UOR_ROLE(_r_)		(((_r_) == TYPEC_HOST ? 1 : 2) << 23)
 #define UCSI_SET_UOR_ACCEPT_ROLE_SWAPS		BIT(25)
 
-/* SET_PDF command bits */
+/* SET_PDR command bits */
 #define UCSI_SET_PDR_ROLE(_r_)		(((_r_) == TYPEC_SOURCE ? 1 : 2) << 23)
 #define UCSI_SET_PDR_ACCEPT_ROLE_SWAPS		BIT(25)
 
-- 
2.45.2.1089.g2a221341d9-goog


