Return-Path: <linux-usb+bounces-3810-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B3E8083CE
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 10:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 181B01C21EF2
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 09:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58342328CB;
	Thu,  7 Dec 2023 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mfwl3d2c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D7519A
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 01:07:58 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5caf86963ecso6691117b3.3
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 01:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701940078; x=1702544878; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XjhlNxQ1wUWjraV9iPdtTW5x0sxYSEYMRYfsr8frK4s=;
        b=Mfwl3d2cct8WsfUmHxw1TmsL20ljontGrnhB3u26hTnSXuPR6Abj3vIU1LU+OBhDp+
         lA/Xu5ZpbFI059Mc9jEWWKsOdGh7KX+YEcibudP5t/wWYcxJg74PmWgmYXfTkaiYbqkZ
         ShKAxP7iHySG+1/rTEl+Up/KT8WaTuphEqjf4yLBLKydbwpU6/8Z+28TTDP3blsw7dYL
         KRq3hheeHhGCtvj0PipL8YsJRV/Iq/PeB8uAM43u/QGuunxcAgyJOtDsh9lashHRsDak
         Eg1pg4ovJA87TzB7hs8LYJRnsI87A0pIkB+CJ5z3KnlmNBzwBXphXjLELSL4WbXxDu+R
         Eazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940078; x=1702544878;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjhlNxQ1wUWjraV9iPdtTW5x0sxYSEYMRYfsr8frK4s=;
        b=rN1C3vfaJsVLdBS39/XAyyLtRpx1XDnNcvrO3PbDwRSFWs+WJOXHAGnngS6pZ2yAQS
         EyECjT5ZnAEfctrXXPfQteKs7mCd3jf0GXPTHFxmNIBrtrv7Z+/Hw6Ctngh9wNZubWDr
         Y0R/B4CPOuBSVSs25pjPeKJ2vWJHvpfEkz4gm9wC+cC8fk2SvWeBGIq8o7AWxO7j8ywC
         n4hWi6JOSP9kTaOyFf4WmkT+0YUg/kDfde7dC1OT8jMCdm5nOT8EIXW6Q4HM4wCKDrFz
         knCaNPNN95RveU/B678QkW25iDKPODjvpk5CDn4CT147W2ZOFAPHIGxJ8OrA2kgn18IY
         eJDw==
X-Gm-Message-State: AOJu0Ywe8wid5g8x040Gw3V1O5ncjzpSHZ8eZxmC210CU8oBT507QsXg
	q055rLkhTlfk/v8Bfz12UW4b4VxPx6llLlA=
X-Google-Smtp-Source: AGHT+IGBamj/zy/n72vCz2neXuhEsyt1AsF7cIaDJq4VKFEX0D9upq9VMWa9ajffy7iqLfGYkj134Vm8PyEiiG4=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a81:b627:0:b0:5d4:1b2d:f43f with SMTP id
 u39-20020a81b627000000b005d41b2df43fmr36440ywh.6.1701940077775; Thu, 07 Dec
 2023 01:07:57 -0800 (PST)
Date: Thu,  7 Dec 2023 09:07:31 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2548; i=rdbabiera@google.com;
 h=from:subject; bh=YbXxf5+Kewbv+6BZn0oI5JwVjybhzPVx1ZrpByB9dhg=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKmF3VHOP479Nok3jTry+eq8B7fV1AQ+LJzDe8MuRqZLv
 OR2tqBhRwkLgxgHg6yYIouuf57BjSupW+Zw1hjDzGFlAhnCwMUpABOxU2L4KnHlzXk35rsubaGd
 AX/XfOzPeRpSc36W3Q9Nqwerf9SUMPz3efamRew2302Vq+q+sntkDROebX81g4etmskysqZa/yA vAA==
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231207090738.15721-12-rdbabiera@google.com>
Subject: [PATCH v1 00/10] usb: typec: add SOP' support to the tcpm and alt
 mode drivers
From: RD Babiera <rdbabiera@google.com>
To: heikki.krogerus@linux.intel.com, linux@roeck-us.net, 
	gregkh@linuxfoundation.org, pmalani@chromium.org, bleung@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Cc: badhri@google.com, tzungbi@kernel.org, utkarsh.h.patel@intel.com, 
	andriy.shevchenko@linux.intel.com, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the TCPM's functionality to include support for SOP' messages.
This feature is opt-in: TCPCI chip drivers opt into sending and receiving
SOP' messages. TCPCI drivers will also be expected to take the SOP frame
type in order to process SOP' messages within the TCPM. The Maxim TCPCI
driver implements this in Patch 2.

Discover Identity, Discover SVIDs, Discover Modes, and Alt Mode SVDM
support are included within the patchset. Because the port is expected to
be the Vconn source in order to communicate with the cable, TCPCI chip
drivers opt into performing a Vconn swap after Discover Identity on SOP
before performing Discover Identity on SOP'.

Alt Mode drivers can direct SVDMs towards the port partner or cable plug.
DisplayPort Alt Mode adds support for Enter Mode, Configure, and Exit Mode
commands over SOP' in Patch 10.

RD Babiera (10):
  usb: typec: bus: provide transmit type for alternate mode drivers
  usb: typec: tcpci: enable reception of SOP' messages
  usb: typec: tcpm: process receive and transmission of sop' messages
  usb: typec: tcpm: add control message support for SOP'
  usb: typec: tcpci: add attempt_vconn_swap_discovery callback
  usb: typec: tcpm: add discover identity support for SOP'
  usb: typec: tcpm: add state machine support for
    SRC_VDM_IDENTITY_REQUEST
  usb: typec: tcpm: add mode data message support for SOP'
  usb: typec: altmodes: add typec_altmode_get_cable_svdm_version
  usb: typec: altmodes/displayport: add SOP' support

 drivers/platform/chrome/cros_typec_vdm.c  |   12 +-
 drivers/usb/typec/altmodes/displayport.c  |  175 +++-
 drivers/usb/typec/bus.c                   |   17 +-
 drivers/usb/typec/class.c                 |   42 +-
 drivers/usb/typec/class.h                 |    1 +
 drivers/usb/typec/tcpm/tcpci.c            |   26 +-
 drivers/usb/typec/tcpm/tcpci_maxim.h      |    1 +
 drivers/usb/typec/tcpm/tcpci_maxim_core.c |   37 +-
 drivers/usb/typec/tcpm/tcpm.c             | 1014 ++++++++++++++++++---
 drivers/usb/typec/ucsi/displayport.c      |   18 +-
 include/linux/usb/pd.h                    |    1 +
 include/linux/usb/pd_vdo.h                |    8 +-
 include/linux/usb/tcpci.h                 |   13 +
 include/linux/usb/tcpm.h                  |   16 +-
 include/linux/usb/typec.h                 |    3 +
 include/linux/usb/typec_altmode.h         |   36 +-
 16 files changed, 1214 insertions(+), 206 deletions(-)


base-commit: 5e4c8814a431d21bfaf20b464134f40f2f81e152
-- 
2.43.0.rc2.451.g8631bc7472-goog


