Return-Path: <linux-usb+bounces-27137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B166B30744
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 22:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27BF27BDD28
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 20:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0123570D1;
	Thu, 21 Aug 2025 20:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d2gy7MuG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C623570C2
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 20:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755808740; cv=none; b=doT6SQhaXmyDwiHb3Klwv4bY4DvmQ2Dm1NAlxWXzWyo7UJmlwOaXTSOnKBabTZZXHcgAlpsABh6sEfMHZRveJ8ArsVyM/obB8FPfFgejrKkVStVbIbajmlQGgFEZk7Dm/HKx69VvYl/9ghfsIKxSmVqLgJ8ttMD7TBlkaoyYIT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755808740; c=relaxed/simple;
	bh=iGMZdthX6JfAcVlNIkwSwqhVaKX3KtMGz9p+32qn1j4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 Cc:Content-Type; b=K/KlTJJCjkENWIG8gQzL7thnLpvUGStEGF3wndyy8q5P8dRx6M7ydtlGePSINXrGfZ3FkFoaOC2ye0wsGcAav42Kxl8FvkCpewZZh1zFSfxA8an8HCI3w7qEs8B0KnjSsRD4vKHbJDSHQDwVjsht8Uk7JhoC8XhjpfodF4nIppU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d2gy7MuG; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-76e2e614e73so1362835b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 13:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755808738; x=1756413538; darn=vger.kernel.org;
        h=cc:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h/+UWBPZD3HrklV52aGhx4r4fduYv1yK/59tSthQlug=;
        b=d2gy7MuGfOF2qL8Do2xvRP4JjJpokXpAgXqirWWXa3Ulbg7wIVjUDlOL3PwGnGm2+q
         riTQmwQQ/JmDU1iiNrqY0n1On+rQLb4TyZolTa0ZnbVA17voNAL+rWwTQT4lm0J0dJmp
         aeT4ixvsIH8/zRLe2w6PyjnfjK2hPQFwOC/+5Sah3XN+y2yMXEUWvvzSVTC7InnYMfL2
         Q7/TsirVe9JsLEMh1JM1WDVSndF/vsX7uBuwepb0S4yoxPRlhmyZ6iPQnIM9hvXTcwUp
         +lrODs+viuyINuxljMTUdYmBi3cUv5D+AJs8dWDpbS+SawJcOKx6hOYryISia5TW/BHY
         BrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755808738; x=1756413538;
        h=cc:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/+UWBPZD3HrklV52aGhx4r4fduYv1yK/59tSthQlug=;
        b=CL8Qo6W6jtQzYHRNTQKlUlATDtk70lRu9edOLLxrIUgcndeYYz5CHwhuap2can9F5F
         IYDL2rbYcuN3N9WSwF2css1Bg/Yl/58gTQw+HAe/BX1ZdTDQnO0bWwieg38MZyTVFwNv
         wlu76HA1n+m4kc9G64ZBhJGro3NegmvKciX5OkS31L26pPTZjYxuFd88k6BOPHocWnZE
         u5c9lllPCCGHJlhAVtLnQD8bym1OoLZsKy5ib1ZjimPF6UKxGZ1tGBIwee3iyCNuBiGy
         SdBchoN0UrhjN0xBzS4THWEC5pewwrRw5tEZsxmEoB5o02glG5/YD2zitOhJXHwYOSb1
         jblA==
X-Forwarded-Encrypted: i=1; AJvYcCUR3e+ioVYhQwHp5pFZrfe5eWRjVOk6jCrNDCXNn8A7MUvcEmZYLNpsWV4w6tzjzAJAaQqbUNlvpyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtZQS/wAarbLGobvmLhPKBwcfNpDCeUuGKtG8Ly/+KptRHcLhQ
	T/pbbWZ/4OONCTVvameE+EFUz46v5GvOx0Glg+sZjIfwKC+Cn+q9acetF9FQfdh8sSn1ouHI7AP
	9rkNHxVu3L46b2SdP9A==
X-Google-Smtp-Source: AGHT+IH212lvH0OHNPJNv1bQUQ4aeCTg2p1y3CUNhOC0p0OsS48AF7asSzpbt6NelhuK+Z+ZRnf01Xb/Ifgp0iE=
X-Received: from pfbfi13.prod.google.com ([2002:a05:6a00:398d:b0:76b:f255:8cec])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:c93:b0:76b:fb4a:118c with SMTP id d2e1a72fcca58-7702fab0136mr913731b3a.18.1755808738179;
 Thu, 21 Aug 2025 13:38:58 -0700 (PDT)
Date: Thu, 21 Aug 2025 20:38:35 +0000
In-Reply-To: <20250821203838.1721581-4-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250821203838.1721581-4-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=rdbabiera@google.com;
 h=from:subject; bh=iGMZdthX6JfAcVlNIkwSwqhVaKX3KtMGz9p+32qn1j4=;
 b=kA0DAAoWeI6i8iBiMbYByyZiAGing8+jv02Le96c1nFMJwT6pZfHwIpEwRQSWc0YohrAWxGwL
 Yh1BAAWCgAdFiEELU9uMNjUZbScCXwzeI6i8iBiMbYFAming88ACgkQeI6i8iBiMbZNDAD+IfQM
 U7kfmrnn2eZBdCs6AA7dmu5xlmyq3zMnSuLhAewBAIR1xIgfP7yFlng9itvtofskLU9ZGJUlaa4 oKqTTW1ML
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250821203838.1721581-6-rdbabiera@google.com>
Subject: [PATCH v1 2/2] usb: typec: altmodes/displayport: do not enter mode if
 port is the UFP
From: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Nothing currently stops the DisplayPort Alt Mode driver from sending
Enter Mode if the port is the Data Device. Utilize
typec_altmode_get_data_role to prevent mode entry.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/altmodes/displayport.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 1dcb77faf85d..8d111ad3b71b 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -758,7 +758,9 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	struct fwnode_handle *fwnode;
 	struct dp_altmode *dp;
 
-	/* FIXME: Port can only be DFP_U. */
+	/* Port can only be DFP_U. */
+	if (typec_altmode_get_data_role(alt) != TYPEC_HOST)
+		return -EPROTO;
 
 	/* Make sure we have compatible pin configurations */
 	if (!(DP_CAP_PIN_ASSIGN_DFP_D(port->vdo) &
-- 
2.51.0.261.g7ce5a0a67e-goog


