Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A53202C3691
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 03:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbgKYCHI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 21:07:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727209AbgKYCHH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Nov 2020 21:07:07 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E348BC0613D4
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 18:07:07 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id f3so674577plb.11
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2020 18:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=chU6/PiPNUBnmLnxFg8uICWgwVV6llfRaSWUbIwbJ/w=;
        b=UTLaRp8vPJgoAOH6mrWpt2j98UWI5fLdLu412Yd2bQp300kqstWLg4kKDobxf6CA48
         Lzy/ByBaBJmi9fBnfHlwzJcS6EqkK3qgswqS154YK7r2Yqs9LjCrRhkOJwdWR44kqhCY
         BZH+Xl0KJvjU216zBFfNKUSEImeVAj8abJH3T9LKoBlNv6dcfsKBuhQKln07XF7odySc
         zXBmu8/BdUwfnoQ9+0nZIQjXhCugfhPcUoy4rxpiq4XjRfJWtkahCY2rHeHz+5K4XC9n
         776eUmP+kenIKl9foTTZMooN5u2s5nNkHgXBpfDxnec2symz3byUSmkAULLC0l6OH7Rz
         rbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=chU6/PiPNUBnmLnxFg8uICWgwVV6llfRaSWUbIwbJ/w=;
        b=od6gkRMBK6u43UQfuhv4NyiTZE3tZ3ZkEmv38Ad8Lv/15oUNyJ13Tycbwy2vAQfoRC
         +jSG7bjbdkycWNMb5POThXxSFadfVrj5HT1VNzWl20IEDzyOM+QqcfoYfxM8GNEvRkh6
         8DcRnSXZUa1AXvhlYkNhogBw2TKzPFmAkFR5tyoNp5lPbRfMn7KcF6cSiea87/co0Q9J
         BG9Fmsd3wNaE1WEKBX0R+3Dtc8BeZajXl2PhzULxZqSpaZCBNR9wUaxDlBZmNtOuW1Pt
         N7XoZB2M191h3gdgrUgkcrk0W7SBkapsbAaIOBCmBvugFLLB+HHyDJYUq8RCQoCN4Vs8
         HlKg==
X-Gm-Message-State: AOAM5305YIUOblq9JEb7Oe0EPSe6BZD6jUQNu+ZrDVAZzcH6Gepg5dFf
        boUiCUw/Y4SjoZ4HqI/jscgPA5yhLUA=
X-Google-Smtp-Source: ABdhPJyw6WU2f269qHG5mSTkkL/U3GF4SEVsMs6EyJmYN9dl3a9cCp/rDiXkxcn+JoUhc3zBEWnUZGekyOU=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a62:8006:0:b029:196:33f2:4dd7 with SMTP id
 j6-20020a6280060000b029019633f24dd7mr1137566pfd.38.1606270027414; Tue, 24 Nov
 2020 18:07:07 -0800 (PST)
Date:   Tue, 24 Nov 2020 18:07:03 -0800
Message-Id: <20201125020703.1604979-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v1] usb: typec: tcpm: Disregard vbus off while in PR_SWAP_SNK_SRC_SOURCE_ON
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

During PR_SWAP sequence, when TCPM is waiting in PR_SWAP_SNK_SRC_SOURCE_ON
for the vbus source to ramp up, TCPM would prematurely exit
PR_SWAP_SNK_SRC_SOURCE_ON and transition to SNK_UNATTACHED state when a
vbus off notification is received. This should not be the case as vbus
can still be off while in PR_SWAP_SNK_SRC_SOURCE_ON and the vbus source
has PD_T_NEWSRC to ramp up.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 4aac0efdb720..277b9d4d9c84 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4218,6 +4218,14 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
 		/* Do nothing, expected */
 		break;
 
+	case PR_SWAP_SNK_SRC_SOURCE_ON:
+		/*
+		 * Do nothing when vbus off notification is received.
+		 * TCPM can wait for PD_T_NEWSRC in PR_SWAP_SNK_SRC_SOURCE_ON
+		 * for the vbus source to ramp up.
+		 */
+		break;
+
 	case PORT_RESET_WAIT_OFF:
 		tcpm_set_state(port, tcpm_default_state(port), 0);
 		break;
-- 
2.29.2.454.gaff20da3a2-goog

