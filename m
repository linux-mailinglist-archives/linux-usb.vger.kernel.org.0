Return-Path: <linux-usb+bounces-10217-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 258778C2AF3
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 22:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DCED1C221F3
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 20:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD1A50248;
	Fri, 10 May 2024 20:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2kW1kZAR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF5E4E1CF
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 20:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715371970; cv=none; b=vCMX8MgdDyp1VDu2QwcsuhWUZom87YWNlPPf3HzrdcllX9ExrRMbCUDtQXD7UNFo9z/nYbBkjtLPMt0/O7ojXFNrIAyvxyqofsuh1Yg4jF1dMA9CePFCXmwZGaWFQ4ljA1bH19zlS28xWOZLbqunJXwnvkoMGeo4i7klFMQNPiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715371970; c=relaxed/simple;
	bh=E2yyzJi7pvQ7IjCAnfV4/Fd8YyDvl4Ls7jX/rVuTpBs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ob54JgGNfHYB0snppxm1errILWsgOZIXXn+o1Evve0qlASXz9VYRuML8mTwc48xC5rIMzADxnqUMNn0Kp4MxQtKoL3PvhCjY7ruhcto445S2hrCXsZMwKYbOEe0Fh4ZXtZt8Br+I23O8Zme0fjV5JgpMEMAQIOPdZQA+tM83+Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2kW1kZAR; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6f452eb2035so2433738b3a.0
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715371969; x=1715976769; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E+QoEhuET8KXsAWSA3L6WJ3MCLFr9ZSP16+d5LyOa1E=;
        b=2kW1kZARYRGW1jfR9AejpUOSrHQF2IEsL82a9Gp7JAI+edriJzxkV4M+b6Mel17IWa
         3Bcv/nb9A8MfII+c+mFGFLIql8jbQyllw0+ERvFHhrm/YDhS3nsu2g15tDiWhyS56jR2
         e+aixgv646oPeY42mxpEVJEq9LKM4RV80FFjKhW8vigWNoIi+Og1e7Tc7xLz/LZybF7G
         pKGx57HHDaJ4OVrwX7ssfbef+3DtYxfA0JebwzBbwRqrtV8sIT/IoF7HqeUdaGihaf4i
         cujLjyRYKfmOL65BrwFYlILO15Ifoyu9zCrCplJVWqopIu5cXy32UCmsBLKHKjcrW+r9
         AwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715371969; x=1715976769;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+QoEhuET8KXsAWSA3L6WJ3MCLFr9ZSP16+d5LyOa1E=;
        b=I138FvE+h1WwXPoBaoCD4vne/dGPw1PSFnoi+AnUKZtcMpRTq2EEkZwx5NZREEozBZ
         8CFiV2f21qRoTPZa/ByNyA04JMyTFl9VBNBZldeDrUjfuu3rj2zoeEJmmaDDiARDOZZe
         K1uWuwROQm3+G6BYEj1fOYKdLzH83Y5yQQuQFvQVYSX1LslMfjFOPhjdeuTtYHpky77d
         9nshTkUy1VJrl6cALjurp9KQo/SRzdj+J5AkvsRog3ixzrfQ3epZHKeDrpUWLRCSajWa
         qC2o7WsX7347csBm1kyM3pePGIyOJ6V0x30clOuHgqeRa/JZv8Ldr7MM9ymQjrvC+GPj
         MbbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4+gRY45cQrHX89bgCaX/rE6RnKB9QAlWAgT3DYP7NXguKGO5m7rrmxRtShGfbR76iN8v5DA2F2o5EVAR1AaClTKE3vIv8f3Lc
X-Gm-Message-State: AOJu0YyU7S/UKm28hItFeISD5c0uLzhwPzjIIveCqKqfXM2+xriKFSyw
	ky/UVzc00jG8HE+CNA8q3xd4APNyxL0aaXtpqoe/4vu/cvzTdDI/b5TRotG65EGCVNhT7X9QJLR
	K+A==
X-Google-Smtp-Source: AGHT+IFs1e87h8KOhbNcGMSDSwIiTKrsKb+IUnsrUsf6sb54ZanLcLBN5mfD9Cu83qm0ycTKpkjBerKRFEQ=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:6a00:1384:b0:6ec:f5b8:58cc with SMTP id
 d2e1a72fcca58-6f4e0395b9dmr128675b3a.6.1715371968689; Fri, 10 May 2024
 13:12:48 -0700 (PDT)
Date: Fri, 10 May 2024 20:12:40 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510201244.2968152-1-jthies@google.com>
Subject: [PATCH v5 0/4] usb: typec: ucsi: Update UCSI alternate mode
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Heikki,

This series appliess some changes to the UCSI driver to help support AP
driven alternate mode entry. This includes...

1. An update to the altmode sysfs group after registration to make
"active" writable.
2. A change to the ucsi_partner_task delay when queuing
ucsi_check_altmodes to prevent it from running before other discovery
functions.
3. An update to always define a number of alternate modes for partners
and plugs.

Not related to AP driven altmode entry, there is an additional fix for a
null derefrence in this series.

I tested the series on a ChromeOS v6.8 kernel merged with usb-testing.
That build had some additinal patches to enable a PPM in ChromeOS. Let
me know if you have any questions.

Thanks,
Jameson

Changes in V5:
- Fixed signed off by line order.

Changes in V4:
- Updates to the commit messages.

Changes in V3:
- Returns typec_port_register_altmode call from
ucsi_register_displayport when CONFIG_TYPEC_DP_ALTMODE is not enabled.

Changes in V2:
- Checks for error response from ucsi_register_displayport when
registering DisplayPort alternate mode.

Abhishek Pandit-Subedi (2):
  usb: typec: ucsi: Fix null pointer dereference in trace
  usb: typec: Update sysfs when setting ops

Jameson Thies (2):
  usb: typec: ucsi: Delay alternate mode discovery
  usb: typec: ucsi: Always set number of alternate modes

 drivers/usb/typec/altmodes/displayport.c |  2 +-
 drivers/usb/typec/class.c                | 18 +++++++++++++++++-
 drivers/usb/typec/ucsi/displayport.c     |  2 +-
 drivers/usb/typec/ucsi/ucsi.c            | 18 +++++++++++++-----
 drivers/usb/typec/ucsi/ucsi.h            |  2 +-
 include/linux/usb/typec.h                |  3 +++
 6 files changed, 36 insertions(+), 9 deletions(-)


base-commit: e4306116b5e93748b3eaa7666aa55c390b48a8f4
-- 
2.45.0.118.g7fe29c98d7-goog


