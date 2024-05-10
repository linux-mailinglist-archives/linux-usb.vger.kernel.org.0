Return-Path: <linux-usb+bounces-10211-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 054028C2A0F
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 20:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADECE28214D
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 18:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83584655D;
	Fri, 10 May 2024 18:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EMaS2WYk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B003CF4F
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 18:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715366621; cv=none; b=OV9vEqO3hS5RbBBTFiZtgePrwz4ty/wt1oKUR9p8JdBWAJvZjlYR+51UssbQBznl3YJKjSMzwUcBu4kzZkC/B7BDcVpfunenhhu2mbuwJ9NzTEHyn5bUnAoJlRLrgsK46/AQbtXO9nDCD2jVoS6HIgaWZ++TkORhk1kO/7rJ9k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715366621; c=relaxed/simple;
	bh=bPIwwSWz7vhLPkw2Y7IUkySooH/UFfl9RPgbQvpMT1Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qCPCyw0wtGxkP3BkpeXX7Rl4PupFqEDmmtHQOcQkzIxWUw5ure7Epy/r3/QgGLx/DT2CWz3McjaaavCPcjfocaHc+BdUsgj38GTT84cXTR57xAPgre6EODjRNbW0yFz3WpxFxwhcoe3aOXdRq2m7cFVXCLYOeUdhG7vxNTUt2NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EMaS2WYk; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-61e0c1f7169so41867897b3.0
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 11:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715366618; x=1715971418; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3leKVp6DbOZKt/BkP9hZjqxScIgMDd3b3vJx/j0Aby4=;
        b=EMaS2WYkbIhvSmYlF4THbt56fWrbxMNAFU61GNmmeRwGXAf3/nXb8b42DdQcWrE4+A
         CvD1v/fcygFSRp99Y31jGCzjTzO+iwU5piRu7jVfVHPAH4fsD1xCYMr8cVUgudkhBKyD
         Vv6avvdbT9eJm+BnZ08aI0X7HohEgF9RHWgvexzVUqjsyV6WtEAtzMyHP0T1E0dxKcra
         ARkBdnBqfZ+CGojc4ls3mLxrCkPuzBMLQfiEgbEHU0T3yIVJ+mDiDkWbHdidHJ8fQhJD
         V4RI7zvETjauRhFNaXIJLGKjOVBF7Pt4dehm4SKoI8vRspSHYSfF3lC1lU3FL79CRYsP
         L/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715366618; x=1715971418;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3leKVp6DbOZKt/BkP9hZjqxScIgMDd3b3vJx/j0Aby4=;
        b=j7yryqfDfIcVSfnGRppGOy1VNAo18x/ExeRzP3dtrdYCoJDdIXCFTqWUCxSelhOA54
         UjHCEnsalRJJuQ7/x/VsbUdWJyW9n3i+p2GiE82LLzgnDWJto8p2svLywHlPwgbhtbHU
         +WhsFlqc8apXpfiGxryQidruAcuOd5xhY3js1YtYf4GTm3MyLUz/gxOGSl5jf6s061rm
         /ghZSveQOdqa79UwFbEx5Kis+4TV/8mAq3O7NKWn754Y2gwYDEQpiu06+JJx/B8lCQkP
         4XlgMUYrrw/298DnSZH298IfFoFcFW8SHZcwD5L2pajwtimPyOZY7JMTWPRwqUPiwvir
         AQzA==
X-Forwarded-Encrypted: i=1; AJvYcCVzE/rrfzi+5gXaDCQs4fzi86ptNDai41VdqkX3H4OUhUvKhhj0JOocjcpijnlHXbA5MNn2v/uI85fI76y2ZGDp71GppNXHrzt+
X-Gm-Message-State: AOJu0YwpSlMdnhIZA64Fumc7pEgb/wIpkdP+Kt7rpZKuA36nOttO4PT5
	p/8QVlRnXPgqJjaufQD7kNhSM38CFX3a9APhHCukfJoMdvrrSY3hqdUClE6rQg5+Uh/IrtuW5F6
	hYA==
X-Google-Smtp-Source: AGHT+IH0Hl7sTOqR41zDK1Dxc6Amfcy0YB0Fkd2Xj5M07oxreTYb6CYyg15guWzK5gZbo9fvojMWUZHuFdk=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:690c:6202:b0:611:5a9d:bb0e with SMTP id
 00721157ae682-622af90c63bmr9600407b3.4.1715366617882; Fri, 10 May 2024
 11:43:37 -0700 (PDT)
Date: Fri, 10 May 2024 18:43:21 +0000
In-Reply-To: <20240510184324.2944101-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240510184324.2944101-1-jthies@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510184324.2944101-2-jthies@google.com>
Subject: [PATCH v4 1/4] usb: typec: ucsi: Fix null pointer dereference in trace
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
Signed-off-by: Jameson Thies <jthies@google.com>
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
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


