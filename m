Return-Path: <linux-usb+bounces-5165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059DC8304A1
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 12:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96C1D288A26
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 11:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D8A1DFDC;
	Wed, 17 Jan 2024 11:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="liwYCmpV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B3E1DDF4
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705491495; cv=none; b=k1FiGgv9+WZspG1oxyFLtFWl8Q7BLwn12IGoyMswhRufT3E2DnRdkCCcuTtDCqbqwF1hGrtiR6eSKhHlqK2/uMh9LLdJ6bfYQaQUNv3NVLU3UP0H/m8/fy9eE/Z1rIVemfUsYS7j6E09PWH6t3a1rfuNhv+THD1fNTDHZ+BdK8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705491495; c=relaxed/simple;
	bh=PYJp2nLrI9r8h/8LkHvioy23opDePS5vBpBicUrJSGE=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	b=oPY4gGEbQhA5WxB2xNYzXwrlvyaKWGb6WC75dNKZcZTovm+spkRX4DzM+zLIICq2h3op7+1NqbnztUxmUBVTFkJrpLlsCZ5+GdJT7DUlb0nutCHFb+OKILkYrgUISDjnoSHVZA+zm1ZhrtrF6OanZEmlQgTRLDnj3efawxnkkrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=liwYCmpV; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-28b77ca8807so6602388a91.3
        for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 03:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705491492; x=1706096292; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z4JdV8kFxtKhHRthXQH9G50zNT6LFN+iPkzR+QshzVU=;
        b=liwYCmpVmLSim6JbCZgJQaNlNZKT/7yvXs1fp/2X3nKgAJoIK8e/prsty62FKG/3g6
         d30Rn0ZHZMtNkDWU2wjfQQqwDy7zdy2+15APBds7NDyKECB7mlcq6ZRfiOPNo/Bl3uRG
         Co2N9/zcpO2cUSrK5E9IlKhoTceYxbdew05UtKCZZI4cu+/TLrE1YDXbqrA1Vn4kpBta
         ey04C1Yf4nUIhknwjyMnUA791KcD/DgaJHh5aZqh6MNIQg8UpuorbtxhrS0YCJBurLBd
         aQYEc4xGzkIoO6eEa1/FMVvQK+H+Thg2vUUA6u0qSjKI690/EVlbg+ivfmCYAUVfjoUE
         s9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705491492; x=1706096292;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z4JdV8kFxtKhHRthXQH9G50zNT6LFN+iPkzR+QshzVU=;
        b=l5A0c3J1j9fp+mLMe4+FdcLFnTnV45AphYGd0JYfGFYRNX8efHZHXu2OnmNGWrHS7K
         s7VwJcGyaOCoIqHDhAfRUljFt2/ClwOYEnMM9aNzgI28DhPHfW2LDnEvuq3tfCo0pIkj
         FkJ7hR8WDF0JxxGeskbe4TG5AfIx8fFL33IVUnSGpp8zVwLszPQpzJ5dPGdqaTBoSpCI
         Eo+A5jDHXRLo41kLjgJGo/gSENFNQl5tjHH7vsNLi5RSuOjVfV/J2gaXn403/yi3Iu00
         s+kE4SfkC4AtXz6pzr5o647dsqt8t9fSDsPspiJp9wOkKRzLJwGLERzgSgPM5S1fhIak
         PxwQ==
X-Gm-Message-State: AOJu0Yw6n3Yya1oEeu397vhFla5rMhzhc6X8QbEgEAlB8B3DFYVhxmKC
	8aQAV6x24Hq/tGcM8w9pKsfZNLCV16Dh/1CCmA==
X-Google-Smtp-Source: AGHT+IGjP8x81OyM46jxmx1E+RfQKTwqso7GoQ2AyYom1wVdI96zSCsX5JK88Swop5uVIpBi/sk/PCQ/VeI=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a17:90b:1fc7:b0:28d:bc0f:58f3 with SMTP id
 st7-20020a17090b1fc700b0028dbc0f58f3mr612274pjb.3.1705491491475; Wed, 17 Jan
 2024 03:38:11 -0800 (PST)
Date: Wed, 17 Jan 2024 11:38:06 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240117113806.2584341-1-badhri@google.com>
Subject: [PATCH v1] Revert "usb: typec: tcpm: fix cc role at port reset"
From: Badhri Jagan Sridharan <badhri@google.com>
To: gregkh@linuxfoundation.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com
Cc: kyletso@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdbabiera@google.com, amitsd@google.com, 
	stable@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

This reverts commit 1e35f074399dece73d5df11847d4a0d7a6f49434.

Given that ERROR_RECOVERY calls into PORT_RESET for Hi-Zing
the CC pins, setting CC pins to default state during PORT_RESET
breaks error recovery.

4.5.2.2.2.1 ErrorRecovery State Requirements
The port shall not drive VBUS or VCONN, and shall present a
high-impedance to ground (above zOPEN) on its CC1 and CC2 pins.

Hi-Zing the CC pins is the inteded behavior for PORT_RESET.
CC pins are set to default state after tErrorRecovery in
PORT_RESET_WAIT_OFF.

4.5.2.2.2.2 Exiting From ErrorRecovery State
A Sink shall transition to Unattached.SNK after tErrorRecovery.
A Source shall transition to Unattached.SRC after tErrorRecovery.

Cc: stable@kernel.org
Fixes: 1e35f074399d ("usb: typec: tcpm: fix cc role at port reset")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 5945e3a2b0f7..9d410718eaf4 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4876,8 +4876,7 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 	case PORT_RESET:
 		tcpm_reset_port(port);
-		tcpm_set_cc(port, tcpm_default_state(port) == SNK_UNATTACHED ?
-			    TYPEC_CC_RD : tcpm_rp_cc(port));
+		tcpm_set_cc(port, TYPEC_CC_OPEN);
 		tcpm_set_state(port, PORT_RESET_WAIT_OFF,
 			       PD_T_ERROR_RECOVERY);
 		break;

base-commit: 933bb7b878ddd0f8c094db45551a7daddf806e00
-- 
2.43.0.429.g432eaa2c6b-goog


