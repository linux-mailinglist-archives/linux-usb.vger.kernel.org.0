Return-Path: <linux-usb+bounces-27599-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 066ACB45A39
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 16:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B670216D0D2
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 14:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E37B36CDFC;
	Fri,  5 Sep 2025 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FZfJVvqE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5634236CC7C
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 14:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082136; cv=none; b=iFjNKvnrpx62kGEqu5T3C1ONLqDebGOK/4OXBPFDSJ10tFW4ueY7i4TBkprSeNwUcK3aoQytnAkqrsgJhKbc5nZ9iyZz3Mi2ec9HurCYTcY3n1sdzS6Q4Aw4BWAMcvt2fvzWNCHNeGtJ1Fz6KiOl+P89u6JtGZITkrQ4L99YJqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082136; c=relaxed/simple;
	bh=dQJtx4Q2JUyqNMwcbEs3oXSjlN1XB+uw8hAQFiczs/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GA3gX5xJNtSfYQ2T95crE6LRYSVFcXGHFD8lcEh/krya0BCqAtxy99UHOh0ykUTJhsLsRleKDyiwwEI0I3+w+jNivv91o6c0jQZqUeS4GMYcwNRl2vh7KWf44JvVGFfg/Br1u7en4KkIlKC1bQcki4oy1UBo8HTSdRkhmdjHJs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FZfJVvqE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b04770a25f2so330526766b.2
        for <linux-usb@vger.kernel.org>; Fri, 05 Sep 2025 07:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757082133; x=1757686933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGF9orEjre2K9KjUIRS6u93YNSWcj3hSYdLRvughM9A=;
        b=FZfJVvqEHLumcOHI2CZokbKuyUXgC6N1tVrnSgRtbbzbi0P9h0Sive5rRg7nW0IfSX
         mJcOIx3j0sLfizrklE6VcD7JB1NDD3uLPhRMJnQ544yQaALrwySMdIS6j92GZZDyuCTA
         RItizXH88p+pK0lQmBWkh5bLEMSKd/RWDzM5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082133; x=1757686933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGF9orEjre2K9KjUIRS6u93YNSWcj3hSYdLRvughM9A=;
        b=WSvIPEmXR4h6uppf9vdiyOoRsmsqJk9iozOqVnmrCQwDeIyzWS7w/3nQFhlciMJTm+
         y/L75k5tHkjkxKIgUB8G5Qn5oXPspuYc39JEP8cgnNAsa4MW/xkofmfbOZ+no0EW5D3g
         4ygD9e6ujWdk5X39oOlI5prws6zqZ/m2Ad8+mABDJBn2XG1wJfRM4wpkY7N8JfChXGET
         T/z0iCeoyCTxZxJQ+PzAM7zZmqHjUD9JrSLjvJ9EREPrSaSMhHx8etLqlA/k/+Y7O2HL
         Cq3WkEurLj8iP/1y4q++PiNMIdwyZKN9EU6jRR5gRXtaMIDTqFGbCy2fWUep/knIIPz/
         WbKA==
X-Forwarded-Encrypted: i=1; AJvYcCXO22brlCLQ+wf2fGtc7VxegrbQKOa3iXWBlAEWI+whJM1NE3NuS8EATFgx679/FsmR9lb4dJT9lGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKpoI1AHEPIlG/IysFwF7d97YfxI1GBx+V0yw3bXJakJXW9kSR
	YCqxhnMQbQWOoHIMP7omk2b3ki1mECtGbgHbz2vWdNidrnTAekFp0Ce7jXrGpPB2uQ==
X-Gm-Gg: ASbGnctr2Tmu0EOarU/B4wgk1lInM4ib2tq8Ui+E/Y3741BnjwbQyKsOPFaWnOzGnwK
	guOihc5Dtdmnx/Ft7v5GXr2NQSnExKkxpR4u2A4P9a29i0uftO3Twp1gswicZMHlHi/5xbTAvZk
	yD1Up7qcgrJwocLO7OKlUPGcwCSPYr8n7eDwhJMEojFuneh7I6WVViCnqI70rv7wfVIAxJ4pVmb
	lKQb2Mz2CPSnLz7TieQ0tFwp70DLUUgMdsFFe9FAL+VdsYgcqUNhef9DR0ZzypnVF2G4y3lNIAj
	Pt9vEi7gsauyxPiLJml1i19oeJYRh46sdMcUKdran0+1Q1wivminzQpQBr9glrsCB7sv6znMiBb
	/szsAUPJ0no/TwnbkTU35JiT7YaaNI4aBu41egOoFymMolCYv+bI903CK0kcX1bp58lAqxz0lxD
	M590Z3pb9+xyv7XvE=
X-Google-Smtp-Source: AGHT+IFl2mgGV4P7dgOmJwsBFf/zdptfBe4eibQa6wFZqzQSCjDkYJsW2x4P8b1GwYro1fca0TgUXA==
X-Received: by 2002:a17:907:3f21:b0:b04:76b5:739f with SMTP id a640c23a62f3a-b0476b57484mr827180166b.23.1757082131682;
        Fri, 05 Sep 2025 07:22:11 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm502141066b.53.2025.09.05.07.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:22:11 -0700 (PDT)
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
Subject: [PATCH v3 0/5] USB Type-C alternate mode priorities
Date: Fri,  5 Sep 2025 14:22:01 +0000
Message-ID: <20250905142206.4105351-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
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

Changes in v3:
- minor changes related to code style and documentation

Andrei Kuchynski (5):
  usb: typec: Add mode_control field to port property
  platform/chrome: cros_ec_typec: Set no_mode_control flag
  usb: typec: ucsi: Set no_mode_control flag
  usb: typec: Implement alternate mode priority handling
  usb: typec: Expose alternate mode priority via sysfs

 Documentation/ABI/testing/sysfs-class-typec | 11 ++++++
 drivers/platform/chrome/cros_ec_typec.c     |  1 +
 drivers/usb/typec/Makefile                  |  2 +-
 drivers/usb/typec/class.c                   | 41 +++++++++++++++++++--
 drivers/usb/typec/class.h                   |  2 +
 drivers/usb/typec/mode_selection.c          | 38 +++++++++++++++++++
 drivers/usb/typec/mode_selection.h          |  6 +++
 drivers/usb/typec/ucsi/ucsi.c               |  1 +
 include/linux/usb/typec.h                   |  2 +
 include/linux/usb/typec_altmode.h           |  1 +
 10 files changed, 100 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.51.0.355.g5224444f11-goog


