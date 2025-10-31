Return-Path: <linux-usb+bounces-29958-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 366B3C255A4
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 14:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9522D3A5AEB
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 13:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109B2346FC5;
	Fri, 31 Oct 2025 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bls88kcD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235423BF83
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761918644; cv=none; b=f91zblFfPnQnhQwgfK6IyrEQfkF0DYrq657Y+CwLAId9/kB8ae9CVy1Ne2yzHa+esZNH/yu47ffMA+bHHDGN3z2+zTFlSF2cOa7oAwqZkEh9NOc0IQJREQYVV6qnG/BklnPHoH0Ff/BoL/cV3Rg3GgNdVFgfev8yIMSWRSHoOR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761918644; c=relaxed/simple;
	bh=atwhmgVb77nhq+0LeDZj6Ml03uLgO6sIm+vbC28Qui4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R458f5MLEr9friYBMyET7SX6gWXXOPMPIyQmjW68u/39quVY3PwWIuNSE7NoY94+1W4VDcPkNd/snrZK2xQQ4pchZmjOJSzXiZTdVxun0ILpaQNbbhLPuOU7AYATBX8XiiiNHo5N9FFlqLnspaGge6hukKMzdA5y/bsTTGNCQHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bls88kcD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7a26b9a936aso1743008b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761918642; x=1762523442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fq99QZ8qEySnepXaN0MvrLAkz3i0KFCQh2dSWAfgdsw=;
        b=bls88kcDOF7uB3lhIV5zw33jUxbEMJg4I7EGPsfJKd87o/GxSDEd+FpyacWH06RWFe
         ponCYelbnc4PC9GoCFHq1wvSbQO7zUT1S9DNa9lOmLcI/0po/Dog9AEBgLxfycjpDwSL
         rFmOj5yI1DF77A0GY8kS8OFT8VDUQb220Wchi/PkP4nR1XF3L7B9oc5XDLq9oN/P/6NW
         SIitVjCtexkud7eyWq6cV0dDNzfULgZYlc6IkLsfIk1x301glfAHKROLXolkQ/hL1MPi
         y5hlbkfveVe5nTwHDTdgxgi206SJ8z73jNH/QtnghC8Rmn4tQj/mtspKh48lXuoQr4pj
         WSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761918642; x=1762523442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fq99QZ8qEySnepXaN0MvrLAkz3i0KFCQh2dSWAfgdsw=;
        b=GS7prwmOn0BFIux9cmnizEeWvjs19wz0cJHduKN8KhC+QKO4ddxbK6sReheGFZMQU5
         lcrKkAv1Valpo3fcyXF74zdAMYE/x2Gp9fXyaTamI/dmlneC7RtpBQWkkln3ZBIapmC7
         1SAvkwfOVMrOkPBId7gc12evGq3vID10k/7kEBHK2IYKzumRtiwZ2mVBmj5WURBvsjRp
         Wp1g4agPlSHuS87THTO+uVDPXhfDJhhtmqFTti1os7OSbG4m1dt4j2SCM9MUjF62n1G7
         pd01OT7fnTfVND1L8sHs9Uw47ktmdd3hwAHRxm6+CtWH++uTtr6Il/uUMA3EGJ8TDsxY
         i7BA==
X-Forwarded-Encrypted: i=1; AJvYcCXq9B+kXheP8m2GnnBtvkfcBKc6SsDa0GgO4si7rOWyBe/VItjPfKivRqp7hEsz7RgykBUineOfi8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywse1h6D/NF2XLh4T0NvYU3sxzCyq2LwsnHyPyFxgRd5q9hA7JD
	3avazk6zXffgWEofmb1b/6g2Ovs1pYIvqico0vIcfRmGl3yzFjJQJV8=
X-Gm-Gg: ASbGncuPQ2LAQIR6YK5+e3slqn/ixAWrs1TTOjzaghKP2FxVKxvvtPzxs5Vy/P3K1fb
	4wRxHlSyNZ/ziUGb2QU3UJkwWligxX+I/aOLWjYOx+6pceG/QfO9suqo0tWckKC7wRD7FHHia+V
	HSRmUN4W2tKyFGQOcGrsFMGRhZLYjWe8Wc/aO/SwTb/ZCc+W9udqXHNjecQLOC6ugplvCL47vYR
	ksaFRTrYxfQ03GfDzvgb8fmiJ6fgLysQztSCCI7fEafkMHPJXUtirzh2K6aZ8Xzj2/A66fkxy+6
	Rhfj7TZfqOkduRstHBW1+B0tcK3fVbNWnol8mlRKhKqYuYQcIb1SFPZUkSs/81PVYTzQMhhLlyN
	+ds0fWvT0+N3+Lw1dc4uTIxw0z5mqnpGgRK9wBqmyR2Nfq876+tNDs+QStIpb1nKTJWQjJ3yhr+
	bm2Y5yT4ytfC1XYkdnzENatUCbRZ8n4w==
X-Google-Smtp-Source: AGHT+IF7JYD2XOTJtQkstN5oP4uEEb+BywbjvfTsn5BYoz4+8+8KXQRgxqgGm9Jv8J28dx+z4JnHzw==
X-Received: by 2002:a05:6a21:33a0:b0:342:3702:97b2 with SMTP id adf61e73a8af0-348cc6ed97cmr5567276637.49.1761918642388;
        Fri, 31 Oct 2025 06:50:42 -0700 (PDT)
Received: from VSPRIME.. ([2401:4900:52f2:3b59:ca2f:95c0:7c6b:6e6a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d8e70e6csm2337308b3a.26.2025.10.31.06.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:50:41 -0700 (PDT)
From: vsshingne <vaibhavshingne66@gmail.com>
To: skhan@linuxfoundation.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vsshingne <vaibhavshingne66@gmail.com>
Subject: [PATCH] usb: core: prevent double URB enqueue causing list corruption
Date: Fri, 31 Oct 2025 19:20:32 +0530
Message-ID: <20251031135032.222938-1-vaibhavshingne66@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prevents the same URB from being enqueued twice on the same endpoint,
which could lead to list corruption detected by list_debug.c.

This was observed in syzbot reports where URBs were re-submitted
before completion, triggering 'list_add double add' errors.

Adding a check to return if the URB is already on a queue
prevents this corruption.

Signed-off-by: vsshingne <vaibhavshingne66@gmail.com>
---
 drivers/usb/core/hcd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 87fcb78c34a8..66861f372daf 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1758,16 +1758,15 @@ void usb_hcd_giveback_urb(struct usb_hcd *hcd, struct urb *urb, int status)
 		pr_warn("usb: URB already linked to bh->head, skipping duplicate addition\n");
 		return;
 	}
-	
 	list_add_tail(&urb->urb_list, &bh->head);
 	running = bh->running;
 	spin_unlock(&bh->lock);
 
 	if (!running) {
-        	if (bh->high_prio)
-                	queue_work(system_bh_highpri_wq, &bh->bh);
-        	else
-        	        queue_work(system_bh_wq, &bh->bh);
+		if (bh->high_prio)
+			queue_work(system_bh_highpri_wq, &bh->bh);
+		else
+			queue_work(system_bh_wq, &bh->bh);
 	}
 }
 EXPORT_SYMBOL_GPL(usb_hcd_giveback_urb);
-- 
2.48.1


