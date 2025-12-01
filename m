Return-Path: <linux-usb+bounces-31061-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E92C97410
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 13:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 297F93A3E33
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 12:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A17330BB8D;
	Mon,  1 Dec 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NIX0hhER"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DC12FFDED
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591975; cv=none; b=hXlmXKdlFoulfIQAS0Fyhsfxupko+6aXyEYTYS1LiCSMHXGyDKhwL8dohT+2mQdEqRA7b/JVIA+Qym06uaoLHQaF1StsvgTCsWmDdlN1+dGjCsAksljncUmpA/R8q+B3+ZOaXS0SqkP14qw4tQdsBi+61koSJwj2zCxaKUoFYkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591975; c=relaxed/simple;
	bh=6OIAP4fGmgimdtTJrfs4TMLavclr4sycXrfjFbr+ixw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBVHGCeneEISYq28P1NI7n6XU5d6QrBXfGU2lXp0FDtYC7Rlww4whhwW5r7lS8Gvt8R1Bd+YaiVvHMhtILVVBacOYt5yZNbD11l82RfHVXyPjt92rQm4fyfs9iPpOO+h8vNl75agCwKCdZViT7140ReaqFDvAGmChxBy+CfjXj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NIX0hhER; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b728a43e410so703972166b.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 04:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591972; x=1765196772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+3pYB2i1GVS17Vzr4d6LX2uFwVFZUJ8kMPwOvWk9Mw=;
        b=NIX0hhERlOQ51sIn3vC1GtagNThSMatWMCuH9husFtKfHdm2B9cNtt/LAdbKNebSRD
         gUHT7jXKQhJ5LQTwJ+wVo+7Um5aqndE+U9V2/38F9I2+8obiptXIGGjDW8VMpHv6KKEY
         VBvSlsFwZvXZdVHUdxXBioFw9deMpqAffe7Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591972; x=1765196772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+3pYB2i1GVS17Vzr4d6LX2uFwVFZUJ8kMPwOvWk9Mw=;
        b=mI+6I+kOxz0W5H9IDqv49pixodLmQXR2/lpMK1kI0/a1g5SUzAzHXScDnf2OdDBeax
         JcuimxU9yBhQER/GFp7ImOphTw6QDzpt+24LmYOMawh57MqpiQVMnwiHbOL746VGQVfk
         q1pc1daEgDh1QrDm02vicdG6DbmILnXETbtFFFZU3CI2cyFDod0ZfxfClpIUOrzA2i1i
         yWV/8dgDtOmN4DV4H7wMCDI09ARnOMomzt5Pgf9U2ok4REk2DllnLEn2RRXMOsYMdMW/
         zrPV8Z/Fb/bWXYvn9h/hJuHsvXFg8kyo9kOmwWILnBBDri2Nfnzejv2gG31gnCFETzHk
         yMpA==
X-Forwarded-Encrypted: i=1; AJvYcCVFfaTH1MNyrfBMND2Wl8VvXa1KPN5BaFgWLjH8NW2gLKb17gY5dfsfjaAJ6IknoO4ksmrgpBvJ4Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKVGW/Q1n7q+s4KAQKHgbE+tN4GAwmkeB89iodI87aLIp0Xrdr
	8JaOnZLPbpXXZ1O/062pcWHHwBTtlAzCQgvxFfoZm0h9FZDNs1pZK9WzEMX9qmOnlw==
X-Gm-Gg: ASbGnct3e2qjh1ST2xbMQgqYwo3HitdSz4ZzYcPo7/+Wm95UqFP7VJiRyYYeJZleK6D
	+S8K1rMxmoRjjk6LcL88bc5nC+ks2k0JAiEbJgQhFpT9r8s2R0tlc9uZFiO+/7Sop/SZiNpaNaA
	FQvpVC0Zw7fXso0IfI7ntNqdHyJ/jZZn9CZk66lbw/S1wg//p9T90oBaGqrzyJOMk1foKDWGczn
	E4CGe4zMta+4AowfAlXdwvlfM23FPh/fheKJf9i7cqkQ1Hw9g7ANQzx9WDy92dqo1GyE5VgtPx2
	Oe71B4MZvu4hLRkZseHXADm457MQPYauYWgf4CqU3AGsmtg9ywTpV2WXw5/j5k289IXpF88PLPr
	TV7z9efdbOr7GX/wpY9GHDcXAvSItIdDzkIC61JtbbrLtaaqBoFeq9fBeY6COp/k3FmQev0/OLP
	rGJV8gaCEUUqdTDRIQiiJjB9fvDAY3ovX7IV/PBCVYuRkoN0/sS7pjWJB1soggbsA02qxPAzDcN
	5vQ+K4S6PZr+lQq2iEW0Q==
X-Google-Smtp-Source: AGHT+IGH2kXVtk/N3N/Dg3EeJbOt8u37moIvhcU7Nkm4tdM0wE9npVXQZ9y8vtxtXB3dn6B6XLUOYw==
X-Received: by 2002:a17:906:c14b:b0:b73:398c:c595 with SMTP id a640c23a62f3a-b767156556amr4621926966b.19.1764591971716;
        Mon, 01 Dec 2025 04:26:11 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:11 -0800 (PST)
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
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 0/8] USB Type-C alternate mode selection
Date: Mon,  1 Dec 2025 12:25:56 +0000
Message-ID: <20251201122604.1268071-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces functionality to the USB Type-C Alternate Mode
negotiation process by implementing a priority-based selection mechanism.

Currently, DisplayPort and Thunderbolt drivers initiate a mode entry
separately within their respective probe functions. The Power Delivery
Controller (PDC) retains the ability to activate either USB4 mode or
Alternate Modes based on its internal policy.
The mode selection mechanism disables Alternate Modes to be entered by
their respective drivers and the PDC. Instead, a priority-ordered approach
is used to activate the most desirable mode.

A new `priority` field is added to the `typec_altmode` structure to store
a numerical priority value, with all priorities being unique.
If the port driver supports the mode selection feature, it must set the
`mode_selection` boolean field within the `typec_altmode` structure. This
indicates to the alternate mode drivers that they are not to activate the
altmode separately.

The mode selection process is managed by three API functions:
- `typec_mode_selection_start`
- `typec_altmode_state_update`
- `typec_mode_selection_delete`

When a partner device is connected, the `typec_mode_selection_start`
function executes the following steps:
- It compiles a priority-ordered list of Alternate Modes that are mutually
supported by both the port and the partner.
- A dedicated mode selection task is subsequently initiated on the Work
Queue.
- This task attempts to activate a mode by starting with the
highest-priority altmode on the list. Alternate modes are identified with
their SVIDs. Activation/Deactivation performed via `activate` typec_altmode
operation. The process stops as soon as a mode is successfully entered.
Otherwise, after a timeout or if an error occurs, the next alternative mode
will be activated.

The `typec_altmode_state_update` function is invoked by the port driver to
communicate the current mode of the Type-C connector.

The `typec_mode_selection_delete` function is responsible for stopping the
currently running mode selection process and releasing all associated
system resources.

USB4 activation can be handled in two distinct ways:
- Treated like an Alternate Mode, using associated sysfs attributes -
`activate` port attribute to enable/disable the mode, `activate` partner
attribute to activate/deactivate the mode, `priority` to keep modes
priority.
- Like a separate USB mode representing in sysfs via `usb_capabily` ports
attribute to enable the mode on the port and `usb_mode` partner attribute
to activate the mode. In this scenario, USB4 is the highest-priority mode,
without the need for a separate priority field. It is put on the top of the
preferred list if it is supported by the partner (partner->usb_capability
has USB_CAPABILITY_USB4 bit set) and is supported and enabled on the port
(port->usb_mode is USB_MODE_USB4).

This patch series implements the second approach. It identifies the USB4
mode via its SVID 0xFF00. Instead of using the typec_altmode_ops activate()
function, activation is handled via the typec_operations enter_usb_mode()
function.
Mode selection is initiated only once during partner registration, and only
if the port driver provides support for this feature. Subsequent
mode-switching activities can be managed via existing sysfs entries. Any
modifications to altmode priorities are relevant only to future
connections.

This series was tested on an Android OS device with kernel 6.17, PDC:
TI TPS6699, Realtek RTS5453.
This series depends on the 'USB Type-C alternate mode priorities' series:
https://lore.kernel.org/all/20251124124639.1101335-1-akuchynski@chromium.org/ 

Andrei Kuchynski (8):
  usb: typec: Implement mode selection
  usb: typec: Integrate USB4 into the mode selection process
  usb: typec: Introduce mode_selection bit
  usb: typec: ucsi: Support mode selection to activate altmodes
  usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi
  usb: typec: ucsi: Implement enter_usb_mode operation
  usb: typec: ucsi: Support for Thunderbolt alt mode
  platform/chrome: cros_ec_typec: Enforce priority-based mode selection

 drivers/platform/chrome/cros_ec_typec.c      |  47 ++-
 drivers/platform/chrome/cros_typec_altmode.c |   8 +-
 drivers/usb/typec/Makefile                   |   2 +-
 drivers/usb/typec/altmodes/displayport.c     |   6 +-
 drivers/usb/typec/altmodes/thunderbolt.c     |   2 +-
 drivers/usb/typec/class.c                    |   1 +
 drivers/usb/typec/class.h                    |   2 +
 drivers/usb/typec/mode_selection.c           | 308 +++++++++++++++++++
 drivers/usb/typec/ucsi/Makefile              |   4 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c        |  44 +++
 drivers/usb/typec/ucsi/thunderbolt.c         | 199 ++++++++++++
 drivers/usb/typec/ucsi/ucsi.c                |  56 +++-
 drivers/usb/typec/ucsi/ucsi.h                |  27 ++
 include/linux/usb/typec.h                    |   1 +
 include/linux/usb/typec_altmode.h            |  43 +++
 15 files changed, 728 insertions(+), 22 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/ucsi/thunderbolt.c

-- 
2.52.0.158.g65b55ccf14-goog


