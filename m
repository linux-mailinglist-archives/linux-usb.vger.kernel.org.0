Return-Path: <linux-usb+bounces-18212-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDAE9E7CAD
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2024 00:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A00CB18879CF
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 23:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77846213E66;
	Fri,  6 Dec 2024 23:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gcz1q44n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B499212F85
	for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2024 23:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733528323; cv=none; b=ffZR/t2yLHQSEUDM+Il6HbaTvaJT7g/RWj7JBm6ZUdH9Ygpbml3s2tE07PYXEHVAiBt7PYeuh8C0oZhhzbIs6/sO95bCuLM7Ge9hI9wlNXc4y0LLRoU9wykhWcMYJZmAgMj1u+wZlCsePFvxh14055stLIyurkoxeakBqGjqKck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733528323; c=relaxed/simple;
	bh=WXa72mHQrBWrS/09dYwuBRNffw100ctDcz92BZvdr5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mY2F/vv+xHupcRelIb8IqHsfVyXoF6QgiiHOScDQCY9gonKllBf96DWtrSbO4m/P7w/XvabZTVyowjrV8MRn9mpzrDdhZnEcrWAjMEow5EiMnZ6uE1zP8QFiBBX3usFD8V9WxhNpA2icj/Cc7yMxt21jf7bNUidtlAON0koLStU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gcz1q44n; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7242f559a9fso2807806b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2024 15:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733528321; x=1734133121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bliC/7ngsldUriRdPv0FfcilaOEufGfZUp9MYyymSd4=;
        b=gcz1q44nXqD0R+dBRpL0xGbecb1NRtHvfo40kltslWzTPEjTNt4ZXw64VsMJYcnYcd
         9YjPb4NW3EfNxZKkKMVU4OMVKlGcXfNyLIlrY3TD34AagoRWTT9FDUAW6oBBJp+SYr48
         L936YU8LhdCNhA+3elGJP28JPQXpFJoEsKmT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733528321; x=1734133121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bliC/7ngsldUriRdPv0FfcilaOEufGfZUp9MYyymSd4=;
        b=Ak+zoTBRjqxvVF2LIm5R6lsM9iWy1UVVrDoY8FOMeZa/ngFnVR2Ib5cPcV8c15bffL
         +bmKUfkFW7c8Q5TuDCN965V14LlUn9DzVbzN36PRyVtEkjjw8I5zGKbOKuDgOfsLJ90e
         L+1ESbfneJOe0gUMzGsi+xpisCism4NU89UkoM9GhM4rIJ0CJZgwtgc9piFbEExMnn2g
         fESN+n/XSaNy36bPgaJo/522xVcQ3+O8b7LE8yb89XWHEga4PYwAMtg1SdnPlfSyin2G
         zVZbkZUZxXXz9PmuN+9ZKj+x+Dc+kHzHjFiXPeocgJUudOXmqbDjCKvVI9xoJHXZt8wR
         iAPw==
X-Forwarded-Encrypted: i=1; AJvYcCUVWQd+zCYnN4TltmD+N0mk60tXSbqTyD5XQe1VbwJT7Nk2DEGCL5xQcpUod6vsAnVXDeRvw6qEX7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGsbM49oiuR7pUYPwXfUD3tE/hpvQzP2ph40IbfWcxgesKAnXX
	MOOFe+t3FUvJYBqegh5LWKYJc8g9az7JlmKXrnDPPexwg2UXctRObxxcdVhMBQ==
X-Gm-Gg: ASbGncupPih1B19br6elq1Q4KAXasZKjHVWAV7D4PMlvZzNHqBmdT3Fk9RopgD0Gp1x
	yngSVWfoQ/q51xYR6ojPi9tN7m4KDuJUc8Ujv55EvmvSacg8jLg6mpUzv8JqdeIn7LHT0oHSPk+
	2K+m8wqFj7Nv3u5pAkFCOUqbFqAxkC2jA5DIJs6hPMRf8OFdE5fW8KRJrCmbHjeR3Dh3XjFuyAJ
	8DcyK7DCHBinC16yRtuHwarMb4ltCmsrvErPAZLnWd4pBVi6CqFgBYggQXihqbTb02iCjZQ6CFC
	+TPs4R7HD72yMcyWxYDU437k
X-Google-Smtp-Source: AGHT+IEkA+EzntcpC7SX4bylZJEqihRp/oHlKdoDMfiAiGb+uqmJYJKq5YjJPM+7LI1gzxn2Knk5YA==
X-Received: by 2002:a05:6a00:22d1:b0:725:9ec3:7ee4 with SMTP id d2e1a72fcca58-725b80e1435mr6302505b3a.1.1733528321623;
        Fri, 06 Dec 2024 15:38:41 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-725a29c5b1asm3476216b3a.32.2024.12.06.15.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 15:38:40 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	pmalani@chromium.org,
	jthies@google.com,
	dmitry.baryshkov@linaro.org,
	badhri@google.com,
	rdbabiera@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] Thunderbolt and DP altmode support for cros-ec-typec
Date: Fri,  6 Dec 2024 15:38:11 -0800
Message-ID: <20241206233830.2401638-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Hi Heikki, Tzung-Bi et al,

This patch series adds support for alternate mode entry for the
cros-ec-typec driver for Displayport and Thunderbolt.

Thunderbolt support is added by adapting an RFC Heikki had posted
previously:

https://lore.kernel.org/linux-usb/20191230152857.43917-1-heikki.krogerus@linux.intel.com/

A few comments on the series:

* The cros-ec interface will not accept any VDOs/VDMs so we simply
  ignore any configurations we are passed (i.e. DPConfigure). This means
  the sysfs control of DP lanes won't work.
* ChromeOS has two modes of operation for alt-modes: entirely EC driven
  or AP-driven from userspace (via the typec daemon). Thus, we don't
  expect the kernel alt-mode drivers to auto-enter modes in all cases.
  This series allows auto-enter for displayport but disables it for TBT
  for this reason.

This was tested with a ChromeOS Brya device using kernel 6.6 and built
with allmodconfig for linux-usb.

Thanks,
Abhishek

Changes in v4:
- Large refactor to use cable_altmodes
- Fixed ordering of cable mode enter/exit (SOP', SOP", then port for
  enter; reverse order for exit)
- Other small fixes from v3 feedback
- memset struct typec_altmode_desc
- Add CONFIG_CROS_EC_TYPEC_ALTMODES for Makefile use
- Move ap_driven_altmode check to common vdm function
- Add locking to protect shared data
- Update enter/exit error messages
- Update Makefile + Kconfig to use CONFIG_CROS_EC_TYPEC_ALTMODES
- Add locking in vdm function

Changes in v3:
- Removed mode from altmode device ids
- Updated modalias for typecd bus to remove mode
- Re-ordered to start of series
- Revert rename of TYPEC_TBT_MODE
- Remove mode from typec_device_id
- Refactored typec_altmode_dp_data per review request
- Removed unused vdm operations during altmode registration
- Fix usage of TBT sid and mode.
- Removed unused vdm operations during altmode registration
- Set port.inactive = true instead of auto-enter.

Changes in v2:
- Update altmode_match to ignore mode entirely
- Also apply the same behavior to typec_match
- Use <linux/usb/typec_tbt.h> and add missing TBT_CABLE_ROUNDED
- Pass struct typec_thunderbolt_data to typec_altmode_notify
- Rename TYPEC_TBT_MODE to USB_TYPEC_TBT_MODE
- Use USB_TYPEC_TBT_SID and USB_TYPEC_TBT_MODE for device id
- Change module license to GPL due to checkpatch warning
- Refactored displayport into cros_typec_altmode.c to extract common
  implementation between altmodes
- Refactored thunderbolt support into cros_typec_altmode.c
- Only disable auto-enter for Thunderbolt
- Update commit message to clearly indicate the need for userspace
  intervention to enter TBT mode

Changes in v1:
- Delay cable + plug checks so that the module doesn't fail to probe
  if cable + plug information isn't available by the time the partner
  altmode is registered.
- Remove unncessary brace after if (IS_ERR(plug))

Abhishek Pandit-Subedi (6):
  usb: typec: Only use SVID for matching altmodes
  usb: typec: Print err when displayport fails to enter
  platform/chrome: cros_ec_typec: Update partner altmode active
  platform/chrome: cros_ec_typec: Displayport support
  platform/chrome: cros_ec_typec: Thunderbolt support
  platform/chrome: cros_ec_typec: Disable tbt on port

Heikki Krogerus (1):
  usb: typec: Add driver for Thunderbolt 3 Alternate Mode

 MAINTAINERS                                  |   3 +
 drivers/platform/chrome/Kconfig              |   7 +
 drivers/platform/chrome/Makefile             |   4 +
 drivers/platform/chrome/cros_ec_typec.c      |  48 ++-
 drivers/platform/chrome/cros_ec_typec.h      |   1 +
 drivers/platform/chrome/cros_typec_altmode.c | 369 ++++++++++++++++++
 drivers/platform/chrome/cros_typec_altmode.h |  48 +++
 drivers/usb/typec/altmodes/Kconfig           |   9 +
 drivers/usb/typec/altmodes/Makefile          |   2 +
 drivers/usb/typec/altmodes/displayport.c     |   5 +-
 drivers/usb/typec/altmodes/nvidia.c          |   2 +-
 drivers/usb/typec/altmodes/thunderbolt.c     | 387 +++++++++++++++++++
 drivers/usb/typec/bus.c                      |   6 +-
 drivers/usb/typec/class.c                    |   9 +-
 include/linux/usb/typec.h                    |   2 +
 include/linux/usb/typec_tbt.h                |   1 +
 scripts/mod/devicetable-offsets.c            |   1 -
 scripts/mod/file2alias.c                     |   4 +-
 18 files changed, 879 insertions(+), 29 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.c
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.h
 create mode 100644 drivers/usb/typec/altmodes/thunderbolt.c

-- 
2.47.0.338.g60cca15819-goog


