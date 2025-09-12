Return-Path: <linux-usb+bounces-27993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F9DB54329
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 08:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92A1B1BC3807
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 06:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE8A287259;
	Fri, 12 Sep 2025 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V5fzUMxt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9743A28D830
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 06:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757659680; cv=none; b=bCA5nYLJgfDeHUtMa0iPD3ddbVWTc2clgkPbWBccrR6ssgVmsK2bNdyeIQAI0X6frPIWgHQVuztcxEoBBRJZqYXbSfhqS8j9RwJ695lGWxj/7E5U99PrNit9k0ivwei0Vu+iq6/fmi6qJq+Unhddr5M5jf7AmKpC4Nsc2S+JJAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757659680; c=relaxed/simple;
	bh=LV7vwXyBrLIZBgstDxs5zq4DLuMoG96MyweJz0IMeMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WvWJoao3C4wGmu6SGGOGBwP/R2Pbiq1K5vBU8NaaIElIXjieS1pUOBwWu9IMcy4o1U8XjQaOhjHPdoOZZeFmpEHlZhqL1St/JDh5wjLhsny/aKVEBMS9QIytvJrk0kZNZZrnaIHDtIpyw2iT75KJpq1eUodDV31WktqXbqKWu7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V5fzUMxt; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aff0775410eso447576966b.0
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 23:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757659677; x=1758264477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TG8DSB2/f+S8lGYTIHFJItZooYK8UItQSp8Clzf2WH8=;
        b=V5fzUMxtfBVvA6djGWwJwJCA/UHRSfRddDuFaWZy6C3e6hyCdETakTZfh9StwKPcVi
         GB3ECUCuzidF5jWpFQYcfqoMpThGJy/yxkVJgbZqABWMHc5cT2kvXtkJKh/y+12mFEmq
         kOL1ddTpsm89fkOzmUeOuY8JOETM1mpEUzfvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757659677; x=1758264477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TG8DSB2/f+S8lGYTIHFJItZooYK8UItQSp8Clzf2WH8=;
        b=H/f6z/P0j+5dId4Gs0PYqDfViWGS8473EUuCe+t4wcg11HsNMGXQ8eTmmyBbvegRSt
         xC82QGfLwddE3ZqzAcZCc0FxLGqZ+rBF91tGdxmzMvmVnK3wUFYskkfMoUHWfHWU11jy
         FgrMsEbz/6sTZJlkIpJFaSi0+9z5qYGAiM+ZNVBFQxo94n5NaZcdkKnDnbl6UWePrmU9
         ZQANn7YjmDNtsdMT1PXRUtkMR/WLCb6ZrLPkyDnX+3Z6Gvt5b6TJw3Hld1ZYkD+JSWwi
         z7LLdvVcrImL5z3AjNQZ7t74UXiPRaJOfhdmgvA7PVuvXRv+pQgrFZdygfUas3078D0p
         uSEA==
X-Forwarded-Encrypted: i=1; AJvYcCWkbqGI97aoa1Euf8+bWiQHt1V5pouQa+PiVf1hnK1zDxs3ZSFh2Zn5QsUODgU3klFuVWnKyA4rwBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2qQcP2K8Y4XCAUnfP3fETCwUOg8NClz9ru8uf/LRMR31pAraX
	xqczTlfXcArDhAUd0Fx5+eQh2YdlmSrHsRERaJEBAqXPleKjH5z38vkI1GAqKdXmOg==
X-Gm-Gg: ASbGncsS2as/vWVptVy/7SR7SKmaQI9MwpjUsGbWbbE/9vXPdBGYISh8oBx+dk3IVlx
	Q43chMNmALvbCob3J3kUEd3Q3FyoosmRAtTPD9Qywx2i1E09EUL2EsXfT7Ddm6ODOLH9AcGtJCV
	/0c0p+tQTokWC6mEChEI4sLNwYvZgK/yPn5iTuHu9IxUQUkZShYEdXe9D2REN6ZzQWAdtVd1shR
	ffqpRuUmB5bh1o00PD7gyZ6GZoap2cN7+40rgqoTLC1otU380QdxSEm9c1AfoJ3eXgpa2TYMDKE
	ZWMnc1iwgut39v551ep3O8cvOqlPGczixU590oIE0g/B2nodYOnLiane829C5wWhk1i2OPdPFro
	kM9P1ug5HM7nYJQVhQDG5eJxkMxxY+Jrz8DiiARvMF9V5M3BSHK2wqggCcQ1d6gyf3WwXCKZx6B
	hjARDJcZt64F/UdcU04HkZHKgZCw==
X-Google-Smtp-Source: AGHT+IHAsNuWRWXVS8F39M4Ez7vI9awJWnYUKY3l+nueilNqWU85goauwFdZbCUk64fIqas7l1J5Aw==
X-Received: by 2002:a17:907:96a4:b0:b04:25e6:2dc2 with SMTP id a640c23a62f3a-b07c254393cmr187747966b.22.1757659676933;
        Thu, 11 Sep 2025 23:47:56 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128a1esm295465366b.29.2025.09.11.23.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 23:47:56 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 0/4] USB Type-C alternate mode priorities
Date: Fri, 12 Sep 2025 06:47:47 +0000
Message-ID: <20250912064751.1987850-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
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

Changes in v4:
- replaced sprintf with sysfs_emit
- changed priority to u8
- added an overflow check to typec_mode_set_priority(), now returning
-EOVERFLOW on failure

Andrei Kuchynski (4):
  usb: typec: Add mode_control field to port property
  platform/chrome: cros_ec_typec: Set no_mode_control flag
  usb: typec: Implement alternate mode priority handling
  usb: typec: Expose alternate mode priority via sysfs

 Documentation/ABI/testing/sysfs-class-typec | 11 ++++
 drivers/platform/chrome/cros_ec_typec.c     |  1 +
 drivers/usb/typec/Makefile                  |  2 +-
 drivers/usb/typec/class.c                   | 46 +++++++++++++--
 drivers/usb/typec/class.h                   |  1 +
 drivers/usb/typec/mode_selection.c          | 62 +++++++++++++++++++++
 drivers/usb/typec/mode_selection.h          |  5 ++
 include/linux/usb/typec.h                   |  2 +
 include/linux/usb/typec_altmode.h           |  1 +
 9 files changed, 126 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.51.0.384.g4c02a37b29-goog


