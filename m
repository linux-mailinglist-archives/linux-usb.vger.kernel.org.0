Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 989392200E9
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 01:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727788AbgGNXMV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 19:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgGNXMU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Jul 2020 19:12:20 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047F4C061755
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 16:12:20 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id e81so648878ybb.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2020 16:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=bXA+H3/HCKdwgoTJOd9VMBnH1kr2GFc/ck2KdLGaIqE=;
        b=WGgiL3BdHpX/P3jjKH03WkJvclqVTtDITF/41I54Zj5iBBqdozMu4WUgvS3ukt4mrP
         /nDuCQLrljA8YOabhOEg+XW68BOg8DVGIC6nrUr8ZeLgC80uwu4eBJdtND0ImefA5cJF
         0gmIuf4r8V0ILfAYXjh+ptVXmdUU7tOSDQlC8JIgO65+f6CF7n5/A+sbWbsEer5zjAeq
         afSdzA3h2l14Q02s8OogKgSJR9XWREaklDm+CBJD5fzND4kRfhKTBH2NutU7QBIfgPx9
         W+H/MryHTJ0mQm4NjVb6aDDFrtUi18M4aosQrDjgi7CBVlEpGkAVvUnm8+/gbq24lHFC
         bgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=bXA+H3/HCKdwgoTJOd9VMBnH1kr2GFc/ck2KdLGaIqE=;
        b=hdRq0p0enJ2jYeZGcq/bpXBz585SwhoUJs4kOomnzXcJO6Av76Tjf+Mt8/1I8r0M1V
         DgHWinAQg6LN4gB0g2dsa755zCdXsjRaoYMe8BYfy0CKpwVAVR4pEzRD5CxBRlvOpkMn
         KbnmSMgAN4wlWx/5j20j2xvbsO0lxp2FO+l+Wp7/KbqfN3OIKAfWdg5nfCFdceeAXgbe
         EJpvh4/giVxKCd4RQvTJNLVNCry06cNMKGdBLlK8n4XJKYTzXUwvB8I6Fc8d5T3pG1Li
         9Gwdm+5WbaOLj66rB2rXL8gKYXNozkwRU3Cn4SyzZBwASTI3cQ8Y6mKqGjJSiNiwCbBU
         YwgA==
X-Gm-Message-State: AOAM533ugxtGc7qZmU7gaxsC/nbr5VFBQv3B6JJ8TIy3SsnrJl5SQhDB
        nS9O9nOZs700ApPG6uFyc6tdrRthMjo=
X-Google-Smtp-Source: ABdhPJxF3XWJe6uwF6/UIR9n98HrROX//mA6vIE9k+M7f/Zv1XI85hq+I3I1YuJgbVUUSZxRJKF9E+0Zh5I=
X-Received: by 2002:a25:395:: with SMTP id 143mr11392747ybd.505.1594768339210;
 Tue, 14 Jul 2020 16:12:19 -0700 (PDT)
Date:   Tue, 14 Jul 2020 16:12:07 -0700
In-Reply-To: <20200714231207.866838-1-badhri@google.com>
Message-Id: <20200714231207.866838-3-badhri@google.com>
Mime-Version: 1.0
References: <20200714231207.866838-1-badhri@google.com>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
Subject: [PATCH 3/3 v2] usb: typec: tcpm: Stay in BIST mode till hardreset or unattached
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
-  None
---
 drivers/usb/typec/tcpm/tcpm.c | 8 ++++++--
 include/linux/usb/pd.h        | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 379fcab9dbd973..245cfe80948502 100644
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
@@ -3960,6 +3960,10 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port=
)
 static void _tcpm_pd_hard_reset(struct tcpm_port *port)
 {
 	tcpm_log_force(port, "Received hard reset");
+	if (port->bist_request =3D=3D  BDO_MODE_TESTDATA &&
+	    port->tcpc->set_bist_data)
+		port->tcpc->set_bist_data(port->tcpc, false);
+
 	/*
 	 * If we keep receiving hard reset requests, executing the hard reset
 	 * must have failed. Revert to error recovery if that happens.
diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
index a665d7f211424d..b420d8d613cd23 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -483,4 +483,5 @@ static inline unsigned int rdo_max_power(u32 rdo)
 #define PD_N_CAPS_COUNT		(PD_T_NO_RESPONSE / PD_T_SEND_SOURCE_CAP)
 #define PD_N_HARD_RESET_COUNT	2
=20
+#define PD_T_BIST_CONT_MODE	60 /* 30 - 60 ms */
 #endif /* __LINUX_USB_PD_H */
--=20
2.27.0.389.gc38d7665816-goog

