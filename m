Return-Path: <linux-usb+bounces-27257-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D63B344D4
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 16:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77CBE3BAA4E
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 14:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F01A2FF656;
	Mon, 25 Aug 2025 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ATS9n6QI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F2B2FF164
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 14:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133883; cv=none; b=TFN8dB+JKbMlR9p6/+q7IjSk6ppyg67m6kPOVzaWn4b0FcncClVBcPOTJias1xTXzYKT8HsGs+T09PTtoGYaUR6VjCmPg7VbLepNclWSTc293H2x0oAvlB9CF7W7jso9/BmfjgV5eIpn0kbFJeU1JMlQv6YQU91JXwy1cqzuvuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133883; c=relaxed/simple;
	bh=oUpwIKailPzvywGQy1+pcev8O18sL6J2IAoIiRpAS9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FBSzzOOn2MVB7tOnmXoVq0tiEKMGavmfQKgMB5MV0bhZ6Hl5KAcDAF7+gAl9Y/bhls8dVSoaflVUiJ2DSesMMx6L0IJFmnWlyB75x6BfD8vHSe4hN8ykGcUb6JDzfV7XDXVQ3Sc/L/MlHkTUoxKkhpV5VpdmNHm/iecwpdmee54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ATS9n6QI; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb731ca8eso707874266b.0
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133879; x=1756738679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JlAw1YUtoUP+479H9eosmlH+nUKupTZr0DxeKyHdVeQ=;
        b=ATS9n6QIB37hoWaYOrACfe/JViX6ykap8Yqu1g+7mzuY4vPs6K6lZ7OPDqexRkX+Ia
         KXz2x36+jV22K825inyNY0+cK4ERzJUiZgwK9b0UOiMMIjbocFWj2gDTpHRJfE08ipYx
         Uw+Px/gRWLJghHxt+YIj1piWFtgsH18B2cF/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133879; x=1756738679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlAw1YUtoUP+479H9eosmlH+nUKupTZr0DxeKyHdVeQ=;
        b=HjQ3VCKEIE39zabes1JVlCS/oxHx4SGhu9NLUbElooRI1s32wRnYiLL8z6AdG5ygZX
         lp/bdSTNAZJKbgPBEkBztrvSilEVvYqp5J4E8PjPzHPe7uVwqJp1tRgyY9+euv3iBbLH
         0gkgQJXDD+8tL7TCAXIIW+sZ3NmavJUFj4Ah6MXW8IDdbVL1isQViTQ3gazw9VXLP7kW
         pbTm8YFwA+wq0cdoWj7KngY8IYL9cj/tkYpOzcSsnmsYxblskAvgZo+aMADHWW1ZqIs7
         1Hb6wuyH3Si8qjzmWDbsYBPVyn8///JU4woaf39KNCRy+eFdMGf9ntKvuINp4GM/gDSw
         msxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4FZXiYBamg/wspB89CXjkbk6wmpGqR6iFjktE3T+TdaYt8kRcs0OTAnPW5/J92MCVMSH38RH7XoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY4h7QdQqekjlROIfr8TEZYCrdxUm2dTso0JmxOQBMTSjCuZ9F
	RQNTRHXSCLBjCZ5DLiKNzgKI8wRLZohcDklFguK+wz1Cy+tRkuG6/dn0QvoDe9L3Xg==
X-Gm-Gg: ASbGnctNV7sm1EeZBIsqH3L5l5H9BOnw9UEhK4wEeQW5w5RgYeW6sEBxef21Hj7ficT
	qws2HLBOt63ii3cnPeYzYahlTZSKteEm7/FWdcPgC6Yvq0KG9nM1UjYQMLHh2/hGR8kABCcDSE6
	kIUoTfuFcxjFdLe+XObW1N1Y7flNc8XUo+ZvNOThBbjMQ86YFH+vGX7gBZivxytwtVyrUOz1xkN
	WxNs1Yae5rdDAZmZWZjMeuLSRqvm7W+4WHczU4w31Zk0KaWSySz1knRfkZShC49ouEODQw4ulHm
	j6cCNKAdKEt5m5zd2JBe3wdKxsZqmcJkDnkbJxJ5yZS/bm/+sYc95F0WmL7cke9Deq9VXWEtVZ+
	1x7miMToYJwbmFBK7YZFSUQ1KgOYoOpgLzDSfNkyvidNgllMyAqacbe5eTSRuvNRtXVJRQ8UqcW
	Y12WAB3S9ZN6pp
X-Google-Smtp-Source: AGHT+IH4w3C3vXXmPRoJuMQE6RNKQ6r79mYIPhLpoSiofHkFSKhUxFwChIxE4MrLgFEz7TLiFmk4ug==
X-Received: by 2002:a17:907:7f0c:b0:ae0:d8f2:9065 with SMTP id a640c23a62f3a-afe294d99bfmr1196751766b.39.1756133879320;
        Mon, 25 Aug 2025 07:57:59 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (168.23.91.34.bc.googleusercontent.com. [34.91.23.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f981sm117294166b.60.2025.08.25.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:57:58 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 0/5] USB Type-C alternate mode priorities
Date: Mon, 25 Aug 2025 14:57:45 +0000
Message-ID: <20250825145750.58820-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a mechanism for setting USB Type-C alternate
mode priorities. It allows the user to specify their preferred order for
mode selection, such as USB4, Thunderbolt, or DisplayPort.

A new sysfs attribute named 'priority' is exposed to provide user-space
control over the mode selection process.

This series was tested on a Android OS device running kernel 6.16.

Changes in v2:
- The priority variable is now a member of the typec_altmode struct
- typec_altmode2port is used to obtain the typec_port struct pointer
- Default priorities are now set based on the order of registration
- The mode_control capability is enabled by default
- The mode_selection_state struct will be introduced in a separate series
- svid will be used instead of the typec_mode_type enum

Andrei Kuchynski (5):
  usb: typec: Add alt_mode_override field to port property
  platform/chrome: cros_ec_typec: Set alt_mode_override flag
  usb: typec: ucsi: Set alt_mode_override flag
  usb: typec: Implement alternate mode priority handling
  usb: typec: Expose alternate mode priority via sysfs

 Documentation/ABI/testing/sysfs-class-typec | 11 ++++++
 drivers/platform/chrome/cros_ec_typec.c     |  1 +
 drivers/usb/typec/Makefile                  |  2 +-
 drivers/usb/typec/class.c                   | 41 +++++++++++++++++++--
 drivers/usb/typec/class.h                   |  2 +
 drivers/usb/typec/mode_selection.c          | 38 +++++++++++++++++++
 drivers/usb/typec/mode_selection.h          |  6 +++
 drivers/usb/typec/ucsi/ucsi.c               |  2 +
 include/linux/usb/typec.h                   |  1 +
 include/linux/usb/typec_altmode.h           |  1 +
 10 files changed, 100 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.51.0.rc2.233.g662b1ed5c5-goog


