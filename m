Return-Path: <linux-usb+bounces-9490-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E17B8AB655
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 23:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ECD9B21742
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 21:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EEF7FBDA;
	Fri, 19 Apr 2024 21:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mjhy+zI4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660F37719
	for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 21:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713561446; cv=none; b=O+s1kK2KLB1vz06tWs8wZ5nbNX8jvNjIRYzyoxW0hYGOkk9H+I0yvw3NiViVI9jdwBrudEomeLOqdA8viw4/Hb65fYn+Ug3zrSQgNLag34pbRgb9zXcLh0TzePwGUcm9mtECKGAmXn6jYwdCetOjYP8WYnI0GKLxX0HO9BWcXjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713561446; c=relaxed/simple;
	bh=mDPHK69wYhyI1FfUABhwE1NgNhFXTJrMPiHHx9d6gvg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ifbo2D/5rbR0b8vGHngMb7F7Vkm6NmwSRF6K0lmMfu9btXhr6jOVRo0m4PYa4Ea1knwdFLRR2OnzEQWJXKp+9bAp79dJC4KKhSiXNZKhzM0GMR+iIbNFHZgOnHWOWj2aCb7TvfgzU5S9Gkb5jMw6XDKwwKp9heWYw8CBRBCuiw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mjhy+zI4; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-618596c23b4so45412747b3.0
        for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 14:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713561444; x=1714166244; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yBGw6IRcjqsdbe4TcZZGUlH3L2LlDwYUaWDl/kHQI0E=;
        b=Mjhy+zI4n+5UHQVACxUUQEfizihQpF8CIH5v6Yp7TqdsNItAinR81bXl2SKwuh6AAS
         ahsKzxJjCQjk5OVd+lLs1fS85OL8Wet+C8QVfZ850H/29ZmhQOMDo9mjZJclezF/P4ZJ
         76VOgZtA4KgUV5OtU31YIySuD2ShlkWB5cZTK9Z3Q0vKabxehBudAkIqy42IAYU9sNzf
         Yo/AMNnh5hwCwwV8LUe3ag//Hwmw5etuKEeaZIy50A9OgqkTukvx3CHCPPqs+miHaaHL
         88kbHDqatNcqVJgIcrv7CGXkdh9/y8O6Ws1h0XoJxYyLgDa/vdmK7fwgFKhFX5xKK09G
         3qUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713561444; x=1714166244;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBGw6IRcjqsdbe4TcZZGUlH3L2LlDwYUaWDl/kHQI0E=;
        b=kJlhBvYjOxBDO3JpHk0eP53AZNjBid4gufdvBken1C8dKXrioBywvSTnIaLMlyQH4M
         bSrRcnsfgLcs+0vvjjSt7TE89kEFTBjiiuD7B3TkbBRs+zvp9XJmNdHVs9wuUqdjmZ6b
         Re3GK0cp7FfFxgUnQ1NvZyva8nOeUIagfJUu9rVDdN+qJg2Cny9/3UrKHaxI5k3Lqm1y
         eWX7ff8AFS35621rh91sCe87LkicHHGYNHRvci/k0q6C/b4Twc9D99PsDXGPG3Gv12YL
         3KfSsSiiykZsILgOKpw2LHgza3bhORjON3lOW3OuRwLv1YRoVJEzw0fK47KmxUgg1z3i
         qcHg==
X-Forwarded-Encrypted: i=1; AJvYcCXazan+8bDszncmeDg3O4XjdVVHM/gNrMlINoHqnbaf8XznnsYyBsJ349bgjh/09FN1ValvX0eqWu5t5GCBOfcpkhs1FLehaOA5
X-Gm-Message-State: AOJu0YwJuG8dU1bV1yk+uN1k7LG7ia1LzKY2DMg21+6MOAAvs8ctWLV6
	imInsk+irPp1Mok9qwa7LL+s/bJ5+thw4gm7OcYjpIZC/tfYAhiPI0/QpbXmYorlm0dz/vMAT+A
	CfQ==
X-Google-Smtp-Source: AGHT+IHa/iUoYwwQNUd/ge6xGKK/Ez6VGJcdqFLzOtFRhJjk1L3/bnWCMW/ccXo73fFLE030j4quwTpOTK0=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a0d:dac3:0:b0:61b:4d3:2dd6 with SMTP id
 c186-20020a0ddac3000000b0061b04d32dd6mr503421ywe.6.1713561443742; Fri, 19 Apr
 2024 14:17:23 -0700 (PDT)
Date: Fri, 19 Apr 2024 21:16:47 +0000
In-Reply-To: <20240419211650.2657096-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240419211650.2657096-1-jthies@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240419211650.2657096-2-jthies@google.com>
Subject: [PATCH v1 1/4] usb: typec: ucsi: Fix null deref in trace
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
trace_ucsi_register_altmode is called.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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


