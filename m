Return-Path: <linux-usb+bounces-7158-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A608D86A41A
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 00:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49DF4B27676
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 23:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4698656B79;
	Tue, 27 Feb 2024 23:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rBWiEFmc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5607855E48
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 23:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709078320; cv=none; b=aIBGYbfM/rUPmAo7Z9R5XHvrmpiCLv/0dQ8HRCz2MZoIze10ggSRC+rm13f1WIl3p9aklVXpAo3IymBEkH6/AYX+EyoppYRaWIrFR0n/UKx/POUUOqBVcOSm82AyqfPhLb5GKP4WNpsWAWF5vkLfq/motCwLbUdEPUvsRfJckoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709078320; c=relaxed/simple;
	bh=2/lRzbav4ZEIZxCx4lcDj3Wd/X8auYnCnUQfBTX1XUM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NIkZGgMNAjFqcI3fs6jL8Kx2F62QVc/S9rELja7tuhsZFAUKjpF/tG51wT/mG83/7IvUKi///HGkyNh7/yDDq8sjcoMHxe8RHuwW3ZKT2dOeY+fwarmIRsQeHuEfm8zF6JHcILWPTUh3AdJa/TxlM3Uj6/hJdc4Jgi3/6HQ/Kqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rBWiEFmc; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dce775fa8adso9338926276.1
        for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 15:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709078318; x=1709683118; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/LdW7tPXFcFwIvF+jtRCAIo7Kke3BZ9m44DLtohg7Ec=;
        b=rBWiEFmcZqnDXPkn82+eQ5P9Zb2pGgmxxXOarVQMVv6GFdSfMNb8im2/RqG529TFWp
         sScu0GxpmpcqBUL14wytPzS/yywlC2lk/qlFJTUIcK3xb2YrOSkBV+68Np88wZeenloy
         eQYpIHe9e4Hx1C9dKZS76Yu41AqmTF0XJ9KIkBjFlYxKPQzlM03dRJm38DVo01Nr4lhB
         5z4Us1QwcUkp8fW3nSx6s1d6o7XK3PJKpeo1pbCHWIFXwDYz4w5oOGDSjmakMQu4SQbT
         1UCtCAODID72PnFNI07TY2LGdlJMNR4NVgRFZP9yNxlfDt/V4s7mP9gDpN0I75mKGVTR
         oKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709078318; x=1709683118;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LdW7tPXFcFwIvF+jtRCAIo7Kke3BZ9m44DLtohg7Ec=;
        b=jiaIMEmaFvqHzkoerWHEIndZAnEFmbRDV1kdv7hnye267KpFpCLcZI3zX3Lns5h6eL
         oIW5qhqbmIMqSg6d/7lNpZVFon6SbtlB5knl1QOJbm3PoJJJc7h7e6B4pVf9tTB3nYF2
         6huYiRexiL+M9/XVWqYkXuKqXRf4/wqHfhufTuXAcZnh4tjpV/ummrrkJehA5J4MD0ij
         jdx0SQE+18pBW9luGLBsvl76tBB7aYNMnwlbtDEj6xNE956LV6uU5QTAGGydP0HdaHBt
         PcxF0tmzN3VKNm92z37fvkNywYxuQ5K5T3C0SIK1dNpkaSW6uhwzQMoIyOwgCuL9odPD
         sWog==
X-Forwarded-Encrypted: i=1; AJvYcCXr0IOVqMfZNuHJOHOViIHPBrvO+Cspj3V3ZRqU/UfUC/0CU3vIB7bT4kUNflg5LKLghzEjIZycBpbDzTxm1i1Ms6XBi5IeDNFW
X-Gm-Message-State: AOJu0YwPvlppcK14qHWY3GsYZDjeeifZ4QHkkwhNKpE4gma3S3UrxPQF
	liEvRCHtWnCcBs8BBLpudB3ZY/uwnhbq+6ACD2DNgdy/p7zStxs+hF60UApZE4xwCy6UgBylDIQ
	fOw==
X-Google-Smtp-Source: AGHT+IG0oglXzdl0/+UCvI8lhfH7WFBVyu8Ryq/6LJlQ/oklxmy8TdLcC0HnTPw/C46EKLLizN5gxuAWvGY=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a25:b341:0:b0:dcb:bc80:8333 with SMTP id
 k1-20020a25b341000000b00dcbbc808333mr294382ybg.13.1709078318262; Tue, 27 Feb
 2024 15:58:38 -0800 (PST)
Date: Tue, 27 Feb 2024 23:58:32 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
Message-ID: <20240227235832.744908-1-badhri@google.com>
Subject: [PATCH v1] usb: typec: tpcm: Fix PORT_RESET behavior for self powered devices
From: Badhri Jagan Sridharan <badhri@google.com>
To: gregkh@linuxfoundation.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com
Cc: kyletso@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdbabiera@google.com, amitsd@google.com, 
	stable@vger.kernel.org, frank.wang@rock-chips.com, broonie@kernel.org, 
	Badhri Jagan Sridharan <badhri@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

While commit 69f89168b310 ("usb: typec: tpcm: Fix issues with power being
removed during reset") fixes the boot issues for bus powered devices such
as LibreTech Renegade Elite/Firefly, it trades off the CC pins NOT being
Hi-Zed during errory recovery (i.e PORT_RESET) for devices which are NOT
bus powered(a.k.a self powered). This change Hi-Zs the CC pins only for
self powered devices, thus preventing brown out for bus powered devices

Adhering to spec is gaining more importance due to the Common charger
initiative enforced by the European Union.

Quoting from the spec:
    4.5.2.2.2.1 ErrorRecovery State Requirements
    The port shall not drive VBUS or VCONN, and shall present a
    high-impedance to ground (above zOPEN) on its CC1 and CC2 pins.

Hi-Zing the CC pins is the inteded behavior for PORT_RESET.
CC pins are set to default state after tErrorRecovery in
PORT_RESET_WAIT_OFF.

    4.5.2.2.2.2 Exiting From ErrorRecovery State
    A Sink shall transition to Unattached.SNK after tErrorRecovery.
    A Source shall transition to Unattached.SRC after tErrorRecovery.

Fixes: 69f89168b310 ("usb: typec: tpcm: Fix issues with power being removed during reset")
Cc: stable@kernel.org
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index c9a78f55ca48..bbe1381232eb 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5593,8 +5593,11 @@ static void run_state_machine(struct tcpm_port *port)
 		break;
 	case PORT_RESET:
 		tcpm_reset_port(port);
-		tcpm_set_cc(port, tcpm_default_state(port) == SNK_UNATTACHED ?
-			    TYPEC_CC_RD : tcpm_rp_cc(port));
+		if (port->self_powered)
+			tcpm_set_cc(port, TYPEC_CC_OPEN);
+		else
+			tcpm_set_cc(port, tcpm_default_state(port) == SNK_UNATTACHED ?
+				    TYPEC_CC_RD : tcpm_rp_cc(port));
 		tcpm_set_state(port, PORT_RESET_WAIT_OFF,
 			       PD_T_ERROR_RECOVERY);
 		break;

base-commit: a560a5672826fc1e057068bda93b3d4c98d037a2
-- 
2.44.0.rc1.240.g4c46232300-goog


