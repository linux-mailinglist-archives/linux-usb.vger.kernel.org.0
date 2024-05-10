Return-Path: <linux-usb+bounces-10218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 935558C2AF6
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 22:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6BECB247DB
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 20:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2145502B7;
	Fri, 10 May 2024 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RTSsD4+/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289CB50298
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 20:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715371975; cv=none; b=hz0LD6vMJvbb49BOCRb+up/mEB2LQsZcWJyVjg6R72XFKi0RXZi9EyGTKNPAliJ5HVMXK54UJ+RTzVIJbZ/ry3d6ZSnJwOSS7GI6nru68ohOjrUaw9xHlGF8OO9qs6JFi5LT+Wqs+Ph8MJ4oQl1/7LxATGa5619qucyxvHOS1iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715371975; c=relaxed/simple;
	bh=mcFJWNvqMp4m3XJJRSjpONkZat8abDPpd8pcqX4kQEI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DUOQO+pN/bQioPSzU/llJQhIyxYiVQyPUKWUbKOkPZnpyyuriRFj/TWxnl9smbXSvB40zBsgPUTEte+K8KVD3M1K42RPWz2mGyi5JbDoTd6AmjoHCu+nn4sqlWbDpFgL0loeyESSwR88gwaeU14j1Hm+Jl4JwhoSHzWojXZNMqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RTSsD4+/; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61bef0accddso48787327b3.0
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715371972; x=1715976772; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TS1kguBPU3RFHeF64udttR5i+sPMcgkKBIHz9rnMR6Q=;
        b=RTSsD4+/bN0V7BtiMNdihEuGm4oI2YtiSB4Vi6Py+hime4vcfe/wbVlxCw6XQ9knF7
         ltvRrjHgfAsNNZnz6tuWcFNh0KWGc0T8t//QyTRwnC+1/HkOWbzXVCRLIhM+zuY3UTe9
         FuxeUBvqWJdK+jqSqRTntwzDLY/SavhoZHMSYG/8Cgzs9CRQcxrfzaND0f/xvY8Wq6uo
         lNBbQKvmgfBjVRPdMS/U+0ICF4ABny+qHzMDFLEa9GYeI6GrwHgE5eQE8bjsLnKKk3+y
         F84ueRmc4HJUe5rMmebv0/XwOLvThbUvmuI7DaBpOM4+YU1xXt3zk5EKyvkGDdsNhNn+
         +qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715371972; x=1715976772;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TS1kguBPU3RFHeF64udttR5i+sPMcgkKBIHz9rnMR6Q=;
        b=juzxoHPMaF5XRXhN5Pn16cQPRUvP1A52bthlDSKmPI3qjTeOrErR0kXop++0GmW62S
         ItI/RJ4eITuZ5wvWcz9i7Phk5bcXTMXDL62iWVNzkEu/+vAIdLn1uw3zLm/AbJ1fd3A1
         tPDbzt/VUBwZgz/S0U4F3h1Qy42eI3jzrAGLx9RqtGJZEXFQV2n+en17Gblb9yx/hOBN
         9bmvM5sZPFG5l3a/kbWgPVPyYFixwtZPgqimoI7r6tRmbH5gHq92Xc9wR7cbvQNaQPfP
         7DZJJbzj2enV9hloD7VbSBuEiUm4u8GKhAz6lT7eCMir/vRrOXIm2XpLjfnCiZJqmZ2S
         mRyA==
X-Forwarded-Encrypted: i=1; AJvYcCWmhY4ObQECu6Pez6Ub25vZ5nZG2BVMpQqfjyxTtL740dRDj3NGdVZSaTO8pyM1n+M58AExvdAChCULaX5jCw1PE99QGtxkIk6r
X-Gm-Message-State: AOJu0YwGIL05iajFCWKYvpbO6lSko8YSW+3Baar0P8S0mnkYm6uQGGyL
	oPt9o8a+9EtiOOLyIT7Gx/LkKs5fYSwtpbKmsNc1YyZ3cDupA/aXj/lphNkGwOAQ+pOXXaKBqJR
	DVA==
X-Google-Smtp-Source: AGHT+IEclD/xt7n6pEH43DFtQ8h2cGqq1loZdidf+YWl0jYdLFxBV3R8tjeJuHSlsxmK5MnXOaO2TfHw3jM=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a25:dcc9:0:b0:de1:d50:ad47 with SMTP id
 3f1490d57ef6-dee4f4ac06amr827558276.13.1715371972144; Fri, 10 May 2024
 13:12:52 -0700 (PDT)
Date: Fri, 10 May 2024 20:12:41 +0000
In-Reply-To: <20240510201244.2968152-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240510201244.2968152-1-jthies@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510201244.2968152-2-jthies@google.com>
Subject: [PATCH v5 1/4] usb: typec: ucsi: Fix null pointer dereference in trace
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

ucsi_register_altmode checks IS_ERR for the alt pointer and treats
NULL as valid. When CONFIG_TYPEC_DP_ALTMODE is not enabled,
ucsi_register_displayport returns NULL which causes a NULL pointer
dereference in trace. Rather than return NULL, call
typec_port_register_altmode to register DisplayPort alternate mode
as a non-controllable mode when CONFIG_TYPEC_DP_ALTMODE is not enabled.

Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Signed-off-by: Jameson Thies <jthies@google.com>
---
Changes in V5:
- Fixed signed off by line order.

Changes in V4:
- Updated commit message.

Changes in V3:
- Returns typec_port_register_altmode call from
ucsi_register_displayport when CONFIG_TYPEC_DP_ALTMODE is not enabled.
Updated commit message.

Changes in V2:
- Checks for error response from ucsi_register_displayport when
registering DisplayPort alternate mode.

 drivers/usb/typec/ucsi/ucsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index c4d103db9d0f8..f66224a270bc6 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -496,7 +496,7 @@ ucsi_register_displayport(struct ucsi_connector *con,
 			  bool override, int offset,
 			  struct typec_altmode_desc *desc)
 {
-	return NULL;
+	return typec_port_register_altmode(con->port, desc);
 }
 
 static inline void
-- 
2.45.0.118.g7fe29c98d7-goog


