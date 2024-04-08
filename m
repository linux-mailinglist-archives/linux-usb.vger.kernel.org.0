Return-Path: <linux-usb+bounces-9016-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B54DD89B6E7
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 06:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E68701C20967
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 04:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9578679EA;
	Mon,  8 Apr 2024 04:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rcddXvQg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6212F36
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 04:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712550657; cv=none; b=p5Myqfuq+dcM0zgZEbsDKy1j859Qci1CYeYierHAfL0rVKodPiLoNFmyUDoO8eVu8k/kGu5LbmJEU4b2j5RmKLCOXywY/z3JjbH2QG0iGphxF69NkS4H5zegZsiRnDtGLsRtPXB2mactR+p3dJffAsREo7H3mDTN27oddz0E2og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712550657; c=relaxed/simple;
	bh=TxV7kxeMfkDnxNQLSQVdz6XPhubojpXImgsuhhZ9918=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k6+rUft8CrN0PyX27cZ1O74Q57a6fF9G0ycl+BObIy8RmTNbn2ajM4uXtXQ/sH7My2A/D0PevZ73MHSpsvzqeWKPyGG8Gyosw9iQstiq2KoZonBOJMcDkbDyZRefsGCCZzN80SwGXmDeWqGy8t2Qn4ktzMFC3Kn10VLpBmXBpsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rcddXvQg; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516d16db927so3989137e87.0
        for <linux-usb@vger.kernel.org>; Sun, 07 Apr 2024 21:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712550653; x=1713155453; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R/AU7a0dE2jT+MxgeDV/IUhWmuS+tYRumxiy4yU3zg4=;
        b=rcddXvQg7slkBtr0606CGyWJvwUizPYxmUDL3DrgjhkoDc8a0sVPly/8Hp7POj3e16
         fwy9h7OUrk0g1z2b62w0LClb05C1W19hIo/OLO+mAC4oBc41cG/AmrsR6rJ76FxJ88ye
         jeG2I6lI58owDc3Y6PPiUQJBtwGSBRJmNssmgiQ+4ePIF70E9Y7oMIC6gxcQsrUPeK+e
         CaNTWNi+74tlck4uJATjFqn0HAC2OY43MfTOnomS5SufiyKn570muJB2jOQsP8yq/z2N
         V+ERiXpU3Ul1IgWEjnuNBscZ0ppdoDQeLClUK4Zs0ivmcp5GQ+AObCfgPn61AOkW9Aek
         70CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712550653; x=1713155453;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/AU7a0dE2jT+MxgeDV/IUhWmuS+tYRumxiy4yU3zg4=;
        b=lZ9+S3linkzvgHYahK1RNjsHeOdgbH7iQh0On+9ZiIs1sTaIR3tsjICg6sSdMtv5RL
         JvRfINA32REcEmLmrkoid2EjhLMZVAGbjvwfrFbHOUSllYf5xbLCxUpEiaSCABH/Ci2R
         xokgsdJXKjPbtEhL9Kp2kLdDooMmRbSxf/bS6rfYEFAoN5Oalsjf+bVagRPMu4yxweXT
         LSCVa6eUjOrJNixFNQJXHA8wLSvoby1N0/bAxcCnhs0XX+wsMCEvzht3eIfUgb6evXl2
         sa2w/kVtn1KxNdTM0tY1/WsB6wt7glW0v0A/5I6yAt+YarTp/4zd42YBJYoOudKe9Opt
         DKoA==
X-Forwarded-Encrypted: i=1; AJvYcCUYoS671erU1sux9qi7hwCdkuv3ZA/U+BkgVyEAZVswAwivGLKLjX+kksc2W9t4A+2fhqgyloJMlFpelRWGuthHPR8YIDWRO2g+
X-Gm-Message-State: AOJu0YwAVlVRsxz9V014ulo3LVw68QhzAPYlWitP5tj6zrXZB3CanbuE
	tHWCuHf20PD2EmOyvNS999t2fuwNY9fjojAkJNlqCTx8pjA+DCcrBtVpKIKtv0E=
X-Google-Smtp-Source: AGHT+IGOuPES33b69mPKBp4LG22SUH+x046DRFeubXhcnej3y95Vj2V+oL78vSjGWxH/luINOt2QsA==
X-Received: by 2002:a05:6512:6a:b0:516:b92f:98ef with SMTP id i10-20020a056512006a00b00516b92f98efmr4983894lfo.47.1712550652792;
        Sun, 07 Apr 2024 21:30:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g13-20020ac2538d000000b005132f12ee7asm1033207lfh.174.2024.04.07.21.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 21:30:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/5] usb: typec: ucsi: glink: rework orientation handling
Date: Mon, 08 Apr 2024 07:30:48 +0300
Message-Id: <20240408-ucsi-orient-aware-v1-0-95a74a163a10@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPhyE2YC/x3MOQqAMBBA0avI1A5kM6hXEYsQR50mkcQNxLsbL
 H/x/gOZElOGvnog0cmZYygh6wr86sJCyFNpUEIZYUSLh8+MsZiwo7tcIuys0bOyjdZCQnFbopn
 v/zmM7/sB8fdlx2MAAAA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TxV7kxeMfkDnxNQLSQVdz6XPhubojpXImgsuhhZ9918=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE3L7xRtVnpyvawuIFkBpylB2c7C2KZLKziSy4
 kk08ILS5mqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhNy+wAKCRCLPIo+Aiko
 1dVfB/9IwOa57SEU0VeCYu2O2rae3gNu+fxFoWSazbkQXEftn4JWocoLEoKq1GpaiJ68Lj/nOe3
 rI7fkpA38eo1MOB4f0F52vBGSLtvKUeY8TVJiuxrigaHLX/KMfse/3Dt8+U6w6/6Z4bB/wmeVZH
 hYlsrY4QBEiylaO59w2gHVQTFg3tLyl4kN4pnsVKnFiyedhyQZKZSAyO02Y6qQzq/P3j92haxjz
 7s85Wmi58Dya5zmKR1Ls7g4Ksoc73o6C815Fp5t/DL9cnBGx2jJ9X1lPDfWgLLTXn7vW0+5eK06
 cS0sVc02HuqTNtE4QL7PrblhMG35Ic4wfBxeyISv44uZXAN3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Simplify the way the UCSI GLINK driver handles cable orientation. Make
the UCSI core responsible for pinging the driver to get cable status.
Use typec-port API instead of calling typec_switch_set() directly.
Also make the orientation status available via the sysfs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (5):
      usb: typec: ucsi: add callback for connector status updates
      usb: typec: ucsi: glink: move GPIO reading into connector_status callback
      usb: typec: ucsi: glink: use typec_set_orientation
      usb: typec: ucsi: make it orientation-aware
      usb: typec: ucsi: glink: set orientation aware if supported

 drivers/usb/typec/ucsi/ucsi.c       |  8 ++++++
 drivers/usb/typec/ucsi/ucsi.h       |  4 +++
 drivers/usb/typec/ucsi/ucsi_glink.c | 55 +++++++++++++++----------------------
 3 files changed, 34 insertions(+), 33 deletions(-)
---
base-commit: a7636ecc2a798cf6dfcfe5c993be9deedceb1888
change-id: 20240408-ucsi-orient-aware-9643f2653301

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


