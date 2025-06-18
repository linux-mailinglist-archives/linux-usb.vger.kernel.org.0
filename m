Return-Path: <linux-usb+bounces-24896-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A61ADF99C
	for <lists+linux-usb@lfdr.de>; Thu, 19 Jun 2025 00:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2A12189A2E5
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 22:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2249528002C;
	Wed, 18 Jun 2025 22:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n5AqRyCP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076B927E04C
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 22:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750286997; cv=none; b=P5/Nt4DHKwh1ZOrqml1VJuz/coDA5B61hcNxatEhINs4pHQvsKjCvXa5JZy3FB7SNt2tBkgx16bo15g5YGg4OxZ1xDFRaweYtt252y2h6uqDaQQuiYh/68eN0YAxgiOKs19uFK4Wo9/XTdptSqdRfHvXAigEsS2TMpdFIN6OO4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750286997; c=relaxed/simple;
	bh=vR1hDO6HkeWPDLUa5nkH6iq8NsHnUdWRXAnQvHPkV58=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=tXJBvtvctAmeAPnMaEYdtRqVVKdUUSoQfOW5LpN+ezRgfHT0AAwFPHE4yKjJOvSMo6dYzFciA665vAwwg46RcOXckVHSUj8lA419TKhF4gV3BddCZQ/MzoM0aAaBxySNAXbOHxewbPUQuPFiE3bRiicWwk4KLatFp5YHp5EN+jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n5AqRyCP; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3139c0001b5so67345a91.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 15:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750286994; x=1750891794; darn=vger.kernel.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ayl3My5WkFPC4pHPZB0vUsI7Z8MvSCFfFwq+uySbSpk=;
        b=n5AqRyCP2z/0VwcyMbMpDozv0H227k8e79EzlBQtP2QibgqqDWy4BZ48ZY1o1DYf6D
         zCV8LqQbmqxna0Za0hCgiCcmwky+yez86swTrvs1ZF91Ll97BK01Rvf4QYjQtfqQfaeH
         wQtbSkEZUteWy3O3bUMve+05QsFiIm+A55C9ohSkxo2cxHP25kw43jYANqw3Y6aH0WbQ
         /nRRm3weTY99shvqNBGUrVqtKkcXOJWUPpN08Tmw9Y2DEPGKIOD1GUNxH85DLMsV+Ytp
         ytpb7jkC7DT3D+cQ5/n9KOw1wY3vynUBk4FnB1PmyH8E+5q1jLRkZPszQhv1wZDRjSa9
         J1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750286994; x=1750891794;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ayl3My5WkFPC4pHPZB0vUsI7Z8MvSCFfFwq+uySbSpk=;
        b=roRJS0nmUvJgkgGdE5sQtpLN/3iLkU/7If/oTKF2GrgYmVM1T26Qh5JhF5nCcI752G
         Dh2lP+cGE0dLfG2CoTE5DuKCvEt92rYjkCM16RGq9bWb+xxxD9Gv5JZI0suoaXVyx+nv
         dmU02y4l+GqUU5ugtkUPXctRCtkeKaml03Neq+lJYIcQPw9YtsFH29nWyOo1JRWDDTq3
         pJkPoDk6TyCuYTBxgQrc0I+9ATP0Er4GmyYXQ+YAfXXXDT0V8jPIrqXk5Rm9UltTCGnx
         V271RZkl/QOle27sX8BVctSnmo6SXW1FnPZnCzqAXuAk5xVSmDAz6qekf1EdxVHo2x+G
         ybsA==
X-Forwarded-Encrypted: i=1; AJvYcCUA3eC+P4pmKXakPZih/CONI4Ox3XREBIPWE/VVW7N8ReQCp8QJFzVuM2uBgr2tKAf/ofCK1Bw0zJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl2p3a7f5yiszfGAYWs3mmxCmHqLhtPrVdJWf0LH+96jy/pheu
	j/5+WBudOOCy5Q+nMgVAdHgZ/NBABwY59qq1kOxyPiyOIFDYMN/0h4K3KnEp/LHyRYTKRktHRkR
	EDHRek0JHtd2OVfELoQ==
X-Google-Smtp-Source: AGHT+IHr9qOVgKGEtI7EYFQwlsRPK9+nzjmac/ouiSvqH8RgqHomihH3zCg0rOGkHhU0lCmTZ2jW4kJpj+/YoOM=
X-Received: from pjee7.prod.google.com ([2002:a17:90b:5787:b0:311:b3fb:9f74])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:dfc6:b0:311:b413:f5e1 with SMTP id 98e67ed59e1d1-313f1e22ec0mr22543572a91.32.1750286994389;
 Wed, 18 Jun 2025 15:49:54 -0700 (PDT)
Date: Wed, 18 Jun 2025 22:49:42 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=rdbabiera@google.com;
 h=from:subject; bh=vR1hDO6HkeWPDLUa5nkH6iq8NsHnUdWRXAnQvHPkV58=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDBnBTu0XepbJf6oVF8wvVOrTc2RJfymzxCbgaVlv5bnGk
 /e1Dyl0lLIwiHEwyIopsuj65xncuJK6ZQ5njTHMHFYmkCEMXJwCMJHWZoY//Le7z5V/ilyluIbZ
 abrOnoaLIs0ZjxiW/GXd5nm6r+vLckaG3voXkSzmcw88TZm6LeTyLLmbbp86Xvn+7r19/JmQecx 3DgA=
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250618224943.3263103-2-rdbabiera@google.com>
Subject: [PATCH v1] usb: typec: altmodes/displayport: do not index invalid pin_assignments
From: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, RD Babiera <rdbabiera@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A poorly implemented DisplayPort Alt Mode port partner can indicate
that its pin assignment capabilities are greater than the maximum
value, DP_PIN_ASSIGN_F. In this case, calls to pin_assignment_show
will cause a BRK exception due to an out of bounds array access.

Prevent for loop in pin_assignment_show from accessing
invalid values in pin_assignments by adding DP_PIN_ASSIGN_MAX
value in typec_dp.h and using i < DP_PIN_ASSIGN_MAX as a loop
condition.

Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
Cc: stable@vger.kernel.org
Signed-off-by: RD Babiera <rdbabiera@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/altmodes/displayport.c | 2 +-
 include/linux/usb/typec_dp.h             | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index b09b58d7311d..773786129dfb 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -677,7 +677,7 @@ static ssize_t pin_assignment_show(struct device *dev,
 
 	assignments = get_current_pin_assignments(dp);
 
-	for (i = 0; assignments; assignments >>= 1, i++) {
+	for (i = 0; assignments && i < DP_PIN_ASSIGN_MAX; assignments >>= 1, i++) {
 		if (assignments & 1) {
 			if (i == cur)
 				len += sprintf(buf + len, "[%s] ",
diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
index f2da264d9c14..acb0ad03bdac 100644
--- a/include/linux/usb/typec_dp.h
+++ b/include/linux/usb/typec_dp.h
@@ -57,6 +57,7 @@ enum {
 	DP_PIN_ASSIGN_D,
 	DP_PIN_ASSIGN_E,
 	DP_PIN_ASSIGN_F, /* Not supported after v1.0b */
+	DP_PIN_ASSIGN_MAX,
 };
 
 /* DisplayPort alt mode specific commands */

base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
-- 
2.50.0.rc2.701.gf1e915cc24-goog


