Return-Path: <linux-usb+bounces-26881-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9EFB26F30
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 20:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 499805E365C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 18:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C87423BCF0;
	Thu, 14 Aug 2025 18:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kxGgJ7U4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA523497B
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 18:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197104; cv=none; b=G1DHux5RKRuka+y6caXr93/R20ayjUYx3DGpt4NtKC50L1/6xkW1UEq+Ci8LrUKOVlqIGGBQysLyPl91Ibza9yPQnawwyD3yO2yIaP9T0qlRzfzrmjzrJusWV3gRoVFtgH6XPw3NDQh/oZCXcp7Es/z2SGM+p2JiwSF1JCeN8Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197104; c=relaxed/simple;
	bh=9P7e+IQ8LG/P0atlVUdJXVTqMbr9yIy6QOCAwSCjxNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBU7ZP+WhK42DDM59XeVfeoqza8YpRHgIZdowYM8LlkMLLbrTTdlKvo4DmBnomWtXG9vxMsAvNjSBJgoENCKya+5ugrTLJHtO5r7RxMe//9cpe12ZlWRmKN/YE9cdCvPEUgcwSt8FzeU5ZGhBWNj+m5WHFSmEdUk91xhh/qKGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kxGgJ7U4; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6188b6548adso2350330a12.1
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755197101; x=1755801901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1qBBuA2TErOLVDapmymnO1MTH+fFI4U6eOj26qi4Hg4=;
        b=kxGgJ7U4NZahHQtCS/xFQBx93AovK6nZv0nTBWdy77a/YaTJCTVHNzrh2l0yezIhVN
         9tGaqBR0srImFJMn3HLp9u5VkmWEBExFJpcuboqXv69JzGq6zvyYgHATKTTFHPWQXBXc
         Yc2Yx3IzKiec4Ca/WIEAi7HV0izvTdkSDhrp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755197101; x=1755801901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qBBuA2TErOLVDapmymnO1MTH+fFI4U6eOj26qi4Hg4=;
        b=TL87CsLiLEW4DWogzeEiW6pJ0g5pWfIwn+Of0k6Tb+Hbg4m6k9fnhIZRCzhS/5jOQJ
         TK4JyDw6SbNdO5bXKqIopivB2tXTT3/dN807BqrkwW6UVSdXkndfDJRKNTso/eiQIhBz
         DYZrGrWucrxJxPVkRZVQ+VSu+VH9UqXSJHuBd7pXX7XEI7fpDBMzKyL7EaxsuqKCzBfE
         WbH6qvULbL/sMRfoowi7jZrBPg/JjqBCpUIVyVKQ0WhyU2YXfoyaWy83IIIJLGlujChM
         zQB1UgJaZVpkASH4kdMTbYr5wDjzuhVf8SENRLcixB/6evHTp1QOhvT/v3SqU7eHfdIr
         6cbw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5ygEfOjrB0IcolajsFZFrheZYLjhL8Uaniqp8Xm5atWjTcR6E1+fbKRnK4eyQl9HLGuR66xUuKE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb0LVvJlYwUQjjn/6IVMDY2H3C7H4RgNQ9GQXgpgV6q7tqlQ9W
	uoR3u8Ppa/CHpbfvonuxFf3Zg+zsw1rpL1EKhFb5Y2qjmGvNn4oCEOVIKQBA4lDC9A==
X-Gm-Gg: ASbGnctsDAAzGyZuPSgXTWNHeQsxYUEOZVKbeMIg8pfR0Nulg2WXoUw9qpKwlgZiXvu
	cV7vobQE+ljJqg5wHGLuISx1QrWGPavCg6wQtByfXpgUEoX/4Vu/t6F9lVNGmLNFD/wCSbnlbCW
	PqxggSRKQq2+q1aEewYCiS9cnuoSGiAjW8jo23o4HVP/Up46OWtj5KJdD1l59IcycEsmJZEdQnV
	Ej47u769k3AK0H+iPQSDfag8tGN/aTyiaTbqHu3ScCnX5rp+QUMSht0mkXbjfrxMwLeBvOF3fjM
	wUeFaWA0yVCYrlOs8rmAi1KXlyfUaEIVT7bn88SEKZ8xEk7M/5+IzyvPteXSXcT2GM1Km/+R+P4
	sv2tKv7fdo0SVOxTlJRR+FbDB52vUuLLprwPq3Wh0AhKoyUTAle++oMunHxv6H8uNx+Swcr9gPd
	cRfX8Y5G4ZauwXCic62K5TgCY=
X-Google-Smtp-Source: AGHT+IHefuGAAIAMEMqANOVYlKEH5+LAdTor4fxHNBiEz6a78unbBVFdrI8XeGRL3W3ATolBgKIenA==
X-Received: by 2002:a17:907:1b0e:b0:af9:6f04:8dd0 with SMTP id a640c23a62f3a-afcb992ca27mr396658866b.55.1755197100634;
        Thu, 14 Aug 2025 11:45:00 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (37.247.91.34.bc.googleusercontent.com. [34.91.247.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0f4sm2614772466b.106.2025.08.14.11.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:45:00 -0700 (PDT)
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
Subject: [PATCH v1 0/5] USB Type-C alternate mode priorities
Date: Thu, 14 Aug 2025 18:44:50 +0000
Message-ID: <20250814184455.723170-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
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

Andrei Kuchynski (5):
  usb: typec: Add alt_mode_override field to port property
  platform/chrome: cros_ec_typec: Set alt_mode_override flag
  usb: typec: ucsi: Set alt_mode_override flag
  usb: typec: Implement alternate mode priority handling
  usb: typec: Expose alternate mode priority via sysfs

 Documentation/ABI/testing/sysfs-class-typec |  12 ++
 drivers/platform/chrome/cros_ec_typec.c     |   1 +
 drivers/usb/typec/Makefile                  |   2 +-
 drivers/usb/typec/class.c                   |  61 +++++++++-
 drivers/usb/typec/class.h                   |   3 +
 drivers/usb/typec/mode_selection.c          | 127 ++++++++++++++++++++
 drivers/usb/typec/mode_selection.h          |   8 ++
 drivers/usb/typec/ucsi/ucsi.c               |   2 +
 include/linux/usb/typec.h                   |   1 +
 include/linux/usb/typec_altmode.h           |   9 ++
 10 files changed, 221 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.51.0.rc0.215.g125493bb4a-goog


