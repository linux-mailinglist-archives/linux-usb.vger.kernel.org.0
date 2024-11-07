Return-Path: <linux-usb+bounces-17343-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9029C0EF9
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 20:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8E882842DD
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 19:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89FCC218D64;
	Thu,  7 Nov 2024 19:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f+zXuhzK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D12B21892C
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 19:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731007914; cv=none; b=doQmv97iEcBdfuIkYtRK5pqlPMdrhylLPscoBK3hbh1v8mLYeQlm9HCKm4wTPYUSFnpglKqOcw4FJskxqiV+JKBzNazyvnhDjdcIcbu/R9DmZPpIr7ljOcmyAzi7yZsLTj8XeYU/wSSDV/ALlbxZ9/Yx+puwgGIXBnZ+OJ8sMZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731007914; c=relaxed/simple;
	bh=WCQG+4mTAioC2RRhlKrzuWizF30INk2UWBFKj8OUk3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2dcWaHWRJQRCo7RjHdzFjLfcp5P0iRoHOKEz6/1vcSn6cIm6ydGOQnaMovXqUCkj7R8D3Iy/lEqDiGgIj4WRXSWp8if2T5qO36J4taq3FmJPqypP9wYH20Zn1cVDp+uHx7/qyqEt36XRgRVHTHA+oQBDT2/mzkjDpoxcwEJ3PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f+zXuhzK; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7240fa50694so462799b3a.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2024 11:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731007912; x=1731612712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qB0OiXmaVUdpADLZ0hMEUy5iSBeICNTxG7bvkK2xwhA=;
        b=f+zXuhzKP8g16hRxhl9WCu4+Vfv0LBuMfeDtEtdo/QIdo1ObbdDJ1Z91djDSE8viYO
         aJgeyoginenTqwlKgVGrSdAKH0CxkGo+icUjPiy4YjxliIe2BSYwi+TAIFFITP9ueudf
         fwrKVZKlsjtLOibJ46scMHJA8uLFI1gWJPHZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731007912; x=1731612712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB0OiXmaVUdpADLZ0hMEUy5iSBeICNTxG7bvkK2xwhA=;
        b=ozTzvcNZ8HSsDWlvwhtSHhtekYkLiMUY5ZyC4g86KosYgzfsq2zK26ElWL4z+hslQv
         tRZxp7If60hL8/2Qe7NmKZ+thrrI+AJrVaJbdvULIPJoMcQeAh6Y3WvF80Vm8U2U5BNC
         GuGL9CQdyyrEEiCUettFAZG8giN5H+Z/QgcZuf1XaBkNY7nPagSJHofe+4jtZF6qcQdf
         PQV8VtPMmGrf5gOiIJqlszlhwyvppF9Hu9kWQWQkLN4cmFTVPvT+2NJmRk8/2+TTuPTK
         GSCWnMZXldKPKufGIwra21+ee+eWxxpbVLkQKg7JS1fViaw0VFiWfztxxuGxtTz9YVdN
         xGMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo+Kq2Tx9DAF1H1X7aNd/gii8jg6Qc1FM8vEvRPKmSbOsPryQDAeJrILac6vVR2QFpDLLPP8x8EUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaaew6n7wZJiwBhFRvQJtxczxBQYpRvoiEwLb82d9mQN8i9J1g
	NFsmAUNjbjcgbHe03hMMoZWNSf8Z8hcmq7Tc+2R9dqkLOGnJ3zYonh6MDzL9QD0vKKMIf9OOvUQ
	=
X-Google-Smtp-Source: AGHT+IF2ok0t254IPtGqAU7UW2SbCfuqikNyMbjEWny3NohvrWFkb+GFcVlJONRZBGlNxqHJEomkEQ==
X-Received: by 2002:a05:6a00:a1d:b0:71e:693c:107c with SMTP id d2e1a72fcca58-724132c15a3mr347895b3a.11.1731007911958;
        Thu, 07 Nov 2024 11:31:51 -0800 (PST)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72407a1fd2bsm1984909b3a.167.2024.11.07.11.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 11:31:51 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	dmitry.baryshkov@linaro.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/7] platform/chrome: cros_ec_typec: Disable tbt on port
Date: Thu,  7 Nov 2024 11:30:00 -0800
Message-ID: <20241107112955.v3.7.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107193021.2690050-1-abhishekpandit@chromium.org>
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Altmodes with cros_ec are either automatically entered by the EC or
entered by the AP if TBT or USB4 are supported on the system. Due to the
security risk of PCIe tunneling, TBT modes should not be auto entered by
the kernel at this time and will require user intervention.

With this change, a userspace program will need to explicitly activate
the thunderbolt mode on the port and partner in order to enter the mode
and the thunderbolt driver will not automatically enter when a partner
is connected.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v3:
- Set port.inactive = true instead of auto-enter.

Changes in v2:
- Only disable auto-enter for Thunderbolt
- Update commit message to clearly indicate the need for userspace
  intervention to enter TBT mode

 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 558b618df63c..b01efe82fb1e 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -310,6 +310,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		memset(&desc, 0, sizeof(desc));
 		desc.svid = USB_TYPEC_TBT_SID;
 		desc.mode = TBT_MODE;
+		desc.inactive = true;
 		amode = cros_typec_register_thunderbolt(port, &desc);
 		if (IS_ERR(amode))
 			return PTR_ERR(amode);
-- 
2.47.0.277.g8800431eea-goog


