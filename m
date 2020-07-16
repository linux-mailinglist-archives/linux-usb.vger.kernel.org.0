Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D44221AF2
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 05:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgGPDlu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 23:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbgGPDll (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 23:41:41 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4029C08C5CE
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 20:41:41 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id r12so3615292pfr.16
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 20:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=eyGKIrNpC4d1P/2vRZTid13/ubCOQhtxZ8c/xlJYEpE=;
        b=X+ZDYKXjnyNj5AU7zCSbrpZoHPKZ51Hrfb1LR4pT/3xzCKM9/fUKUUNTWEEkmBN61r
         H9ebfBhG/IjIEUBJyrB+9l+v4rQMqLqi8vjpxM6S8K3uja/zR/oeHraNKLjsEb2Y41Rg
         Qg0v5wHhjIBeqZl8XBah6pM807Jy4VUarcw4gDAk8iUY6ffk+mLqW0vgzy20+mH5QLIX
         345hY6WD0ktT+q0dztB9Y2xrSONOgMwxyHCHOsxL63qCLtNA3hSSUwWv3mCSs/n6nN1p
         /jsSPm6MsS1K9vT7UcT56OVxoU7xF4xqtCO1yBbnVGkUxOtgrxtngHSGmcOMdWg6pkdR
         5RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=eyGKIrNpC4d1P/2vRZTid13/ubCOQhtxZ8c/xlJYEpE=;
        b=FZZ9frPlvhPpJdxvZjP6j3QSs2wDBMOjabsctkq4d8VIeoPaVG/A8i0y3kS+tkR6VR
         qMvLnVqFQzxVM0c5NBNCsg8XAbwTmzHIxMiA97+rttbXyYejGEbzJXNxC1g66pdJIMu7
         LF+YYDvXy+f7ycZQsW2nqLHOVOTL4Afyn25aHTP0kMuh+MXsmiNtuij2UuQsO6W4yeu7
         B9S4sJorWvAm3daQvlMSFHxeDYP6uD4y4jG78D+Il7dRLv1f7yMQCe4noJWgrt5ZwWoY
         MgwN6H/ht/GtqTFQnWpnGBDTJ++k7nnkrJSCIOjB/y4gPdj55v+4JcKIzHdHn8QczF4R
         37Ag==
X-Gm-Message-State: AOAM533UMfKxmktdkYr7cIKwn6zSwv1oDITNI0EKfHkyDShzwo3zpYca
        nVJh/RTjlK0GW7ShhcuT6BmvE0AuVUY=
X-Google-Smtp-Source: ABdhPJxfUJKtPzUYd517kts5e2ZalfpZFYJNAaqWBnkfCircu0u2gV2Mqp09m/xHeasMDg5A8lCL0f+o63w=
X-Received: by 2002:a17:90a:1fcb:: with SMTP id z11mr1642988pjz.1.1594870900921;
 Wed, 15 Jul 2020 20:41:40 -0700 (PDT)
Date:   Wed, 15 Jul 2020 20:41:28 -0700
In-Reply-To: <20200716034128.1251728-1-badhri@google.com>
Message-Id: <20200716034128.1251728-3-badhri@google.com>
Mime-Version: 1.0
References: <20200716034128.1251728-1-badhri@google.com>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
Subject: [PATCH 3/3 v3] usb: typec: tcpm: Stay in BIST mode till hardreset or unattached
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        reg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Port starts to toggle when transitioning to unattached state.
This is incorrect while in BIST mode.

6.4.3.1 BIST Carrier Mode
Upon receipt of a BIST Message, with a BIST Carrier Mode BIST Data Object,
the UUT Shall send out a continuous string of BMC encoded alternating "1"s
and =E2=80=9C0=E2=80=9Ds. The UUT Shall exit the Continuous BIST Mode withi=
n
tBISTContMode of this Continuous BIST Mode being enabled(see
Section 6.6.7.2).

6.4.3.2 BIST Test Data
Upon receipt of a BIST Message, with a BIST Test Data BIST Data Object,
the UUT Shall return a GoodCRC Message and Shall enter a test mode in which
it sends no further Messages except for GoodCRC Messages in response to
received Messages. See Section 5.9.2 for the definition of the Test Data
Frame. The test Shall be ended by sending Hard Reset Signaling to reset the
UUT.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Version history:
Changes since V1:
- None

Changes since V2:(Guenter's suggestions)
- Fixed formatting error
- Reduced timeout to 50ms

---
 drivers/usb/typec/tcpm/tcpm.c | 7 +++++--
 include/linux/usb/pd.h        | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 379fcab9dbd973..38b958a9650104 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3559,6 +3559,8 @@ static void run_state_machine(struct tcpm_port *port)
 		switch (BDO_MODE_MASK(port->bist_request)) {
 		case BDO_MODE_CARRIER2:
 			tcpm_pd_transmit(port, TCPC_TX_BIST_MODE_2, NULL);
+			tcpm_set_state(port, unattached_state(port),
+				       PD_T_BIST_CONT_MODE);
 			break;
 		case BDO_MODE_TESTDATA:
 			if (port->tcpc->set_bist_data) {
@@ -3569,8 +3571,6 @@ static void run_state_machine(struct tcpm_port *port)
 		default:
 			break;
 		}
-		/* Always switch to unattached state */
-		tcpm_set_state(port, unattached_state(port), 0);
 		break;
 	case GET_STATUS_SEND:
 		tcpm_pd_send_control(port, PD_CTRL_GET_STATUS);
@@ -3960,6 +3960,9 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
 static void _tcpm_pd_hard_reset(struct tcpm_port *port)
 {
 	tcpm_log_force(port, "Received hard reset");
+	if (port->bist_request =3D=3D BDO_MODE_TESTDATA && port->tcpc->set_bist_d=
ata)
+		port->tcpc->set_bist_data(port->tcpc, false);
+
 	/*
 	 * If we keep receiving hard reset requests, executing the hard reset
 	 * must have failed. Revert to error recovery if that happens.
diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
index a665d7f211424d..b6c233e79bd457 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -483,4 +483,5 @@ static inline unsigned int rdo_max_power(u32 rdo)
 #define PD_N_CAPS_COUNT		(PD_T_NO_RESPONSE / PD_T_SEND_SOURCE_CAP)
 #define PD_N_HARD_RESET_COUNT	2
=20
+#define PD_T_BIST_CONT_MODE	50 /* 30 - 60 ms */
 #endif /* __LINUX_USB_PD_H */
--=20
2.27.0.389.gc38d7665816-goog

