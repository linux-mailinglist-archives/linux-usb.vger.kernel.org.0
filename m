Return-Path: <linux-usb+bounces-18467-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6835B9F1A37
	for <lists+linux-usb@lfdr.de>; Sat, 14 Dec 2024 00:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CE15162EEE
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2024 23:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7089E1F2C4D;
	Fri, 13 Dec 2024 23:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kPq9dz6y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D571EF096
	for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 23:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132964; cv=none; b=gOADC0Gtgpe5NNtme8LrwXKC+9S5oaU0la3VCaWVd85FGYh8Ez3+VMDGcR18MdPCbZdTmRYM47thPf5Z0yppZZIFSZFeU5/fDsk6EIuQ/BjN11IJ1Fecgl5RxN97x/mbMIqXA6IEbQTtNGLDmFgSO37BcQlS09MYtxhovhFqj/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132964; c=relaxed/simple;
	bh=bC3ASIgFU8+jf99/fkIhb8slZurZDJG8FhuOc/gydBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCNzx1Lp3IQwEdbwbvG5WLmb52OTbW9cLrlGBw1dTkgII6ghJ0vyuJCChR8AJw9k6tqohnOpC+KHw+wZx3e+fi4+jUoiATKnP5OoeIaU/VZWeockVykjzGOm1jVQu86H47pZXoaSvp7TjMh8IOeDSWEV8jlKi/yLwSr57x6R5+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kPq9dz6y; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2166f1e589cso24620125ad.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 15:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734132962; x=1734737762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=py5tiwOmlBmtYEMtNIBu6hO+Zuc2fcdnOeR4Wv1Ac/o=;
        b=kPq9dz6y5F4r0Gis/Nu47Ijapv2cj0gnf1sk3YOtiH12roAbUzDby5rf6EXj9Q1nQ8
         y+DhzaDOS4bnDEE9OeS0fyB2OjFFAfShSHdeEAqNgfD63ayLLlf5J7S6KfqiVgfocgJ9
         YALeBP66RXvQfR5h/xu4R8QULqoDeUp+x2OOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734132962; x=1734737762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=py5tiwOmlBmtYEMtNIBu6hO+Zuc2fcdnOeR4Wv1Ac/o=;
        b=XOpqwK9A3VGRcZKRyjY5jIJOh8/p6M6cgb8BrayGBpUOtBnWXP3VHnznItaKRrDQbc
         +2lcabciG1EYzXQBB2EAIrDeArbunvm0LdjiCzeP/scJKvPfpLtxgL39KZnLfcU0GOBE
         9DqdJHKMuzoOQcaO+fdbYpwhIOEZLtv2kCzx6bzMoA/dkHYFxc0e2qrRtSwYeDrPRiGj
         DfTbPm2ERDdMPgDvzjGSMefM8m1u6/x1eh3U6G3AtHWrgOe+neGJ9e3lYf8KT53nHtXu
         GwHCh4+IbkklO08/HJ7T3JsgpOLUu0YYxBe6/t31KzwgQxEUFbN/7wK82+EysR0+ZJpo
         0mFg==
X-Forwarded-Encrypted: i=1; AJvYcCXqT1tSwNgXK99MBE6YICuUbafsuDrQyQlohgHubnE1+mVanjaqfSgf2FKUNnvZGRN6uJ3Mt+hMU7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5k51YiXAZDQRz07ORUjStjXRnQB+z11//KGAolydcAqvz0hyp
	p3VZkmiCB3TIHWWlrOlCL1+lYCcC/VK0LYRxF5sADC3CNqyeOdC3z96lRo1pDQ==
X-Gm-Gg: ASbGnctfiu6LWd6SPHf469MFiN2W5cFx4BOv6j/ivIKOznbFa3xwNgF6rXOpc/5oio+
	OKW9nMqcZL9axPFzRGl30Bwb9xwCbr7UF9tuHaI2tmuXPSGvrw4m2+LeTh3SllFYx0/l9KzVAld
	i61XndozkkMshtqEUmjK3HTydgTLi7PK5+JBpmWllJjVGH/MekH8frUxYBoXIo0DsBzgM4vWQ2O
	e6Vq81lFvnDNFrtEfuRIHGNCukvYylOp8Y/qLG6/xLZRvG9quV3LuNJwSj9KsNXZ9Dlmwe/NkxQ
	fs9gDImmq2Vvohq5HVeXvS9afLBOOv0=
X-Google-Smtp-Source: AGHT+IEUZ/6o1cO9iUcIyo1p1TtmFetHKWo3k/+ZY2PI6TucwmSTRM8JHLezHdDWh5JZ20Y9zHM9uw==
X-Received: by 2002:a17:902:e890:b0:215:94eb:adb6 with SMTP id d9443c01a7336-21892ab81demr76675885ad.40.1734132962220;
        Fri, 13 Dec 2024 15:36:02 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-218a1e5499dsm2824495ad.126.2024.12.13.15.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:36:01 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	sboyd@kernel.org,
	pmalani@chromium.org,
	badhri@google.com,
	rdbabiera@google.com,
	dmitry.baryshkov@linaro.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/8] platform/chrome: cros_ec_typec: Disable tbt on port
Date: Fri, 13 Dec 2024 15:35:49 -0800
Message-ID: <20241213153543.v5.8.Ic14738918e3d026fa2d85e95fb68f8e07a0828d0@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241213233552.451927-1-abhishekpandit@chromium.org>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
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

(no changes since v3)

Changes in v3:
- Set port.inactive = true instead of auto-enter.

Changes in v2:
- Only disable auto-enter for Thunderbolt
- Update commit message to clearly indicate the need for userspace
  intervention to enter TBT mode

 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 1ac5798d887f..6ee182101bc9 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -311,6 +311,7 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
 		memset(&desc, 0, sizeof(desc));
 		desc.svid = USB_TYPEC_TBT_SID;
 		desc.mode = TBT_MODE;
+		desc.inactive = true;
 		amode = cros_typec_register_thunderbolt(port, &desc);
 		if (IS_ERR(amode))
 			return PTR_ERR(amode);
-- 
2.47.1.613.gc27f4b7a9f-goog


