Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A91D30B5E8
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 04:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhBBDjp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 22:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbhBBDjo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 22:39:44 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49474C061573
        for <linux-usb@vger.kernel.org>; Mon,  1 Feb 2021 19:39:04 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id dh16so12476222qvb.11
        for <linux-usb@vger.kernel.org>; Mon, 01 Feb 2021 19:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=8YVuxrTBaW2u/EvVshmB1lhIJOhjS6aKrPCo07emghg=;
        b=Sz7AEELQcZbOmHR4c3XoJoG0B0b9UXp6kt1AxKunbluqicRtEdb0MPrxNytbawaU8j
         1w1PRgFtMu8NDu7PUo6GquGnAC7AGef4uOwUstOSVOBfvpQa6SYYhqH2J+dvaVCEhspv
         xyMd/R83xqZmVDHtmLgBuhI+MFTcydHy9h1W78n6eO1iCUI0V5ahSN/E3HNtnRT7ZylP
         yTpxh+KvuZIwgKUU0nXpV0gbX5IdOlPr8qn0uTuzhvddI6SmJf0LOayy4Z2a9efMnUtx
         sWnkG2+e9X/mougZZOZkS6hnGc2F8QsooTewfAjFNOAdgehOb0ZB8D9scKoUdsPHYVFa
         bwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=8YVuxrTBaW2u/EvVshmB1lhIJOhjS6aKrPCo07emghg=;
        b=p2xM/SUo7a9vOUuabFLu410cjbT1X3ksT8rKtcaPHxtnturDUTTDBP6WNxgs56JbRk
         Qg/a2GdK+FRC+f2tBGvKNQDQZKZEE2DpcP2AR1OEJmM1JaQzmRFpp5FBdaP1KJa+ZXaF
         vRxXlQol9zx/BEWqoZzejMz/Tp2hGo2U3bSS4+VjdEgZu9wszd5aFs0WjATWrdm24w8F
         r+LyNvuh+wqEQRtzrJY4zIUcvHnQ9Jpr4f6l0aMi8Ks0Q2Ytz3Hx7pZIAH+Xq7J4vQQB
         2qerzpttUvZbhsQJfuUSbWX7midQOIqiX6PfjIMdwLnHBSIjq+Ncaw8ZKORDAdnmrQ98
         uc/w==
X-Gm-Message-State: AOAM530T/mK/DZeMXUJQKfocnuKwCOwyYcyMznAbFAtUMsLWGqQZAwtv
        uaBwgaee0mM1ORzRsylUVOSIx/xL1eU=
X-Google-Smtp-Source: ABdhPJx1ybll3gmI/7R+/k9eDmwSM7WJRbyNfJh0JGSdH1WuIM8avnPLBbaoAJayK2oDD6oDsJnPAdbaRms=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:d56c:119f:44fb:5da4])
 (user=badhri job=sendgmr) by 2002:ad4:4c84:: with SMTP id bs4mr18662349qvb.0.1612237143459;
 Mon, 01 Feb 2021 19:39:03 -0800 (PST)
Date:   Mon,  1 Feb 2021 19:38:59 -0800
Message-Id: <20210202033859.258491-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v1] usb: typec: tcpm: Set in_ams flag when Source caps have
 been received
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kyle Tso <kyletso@google.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Receiving the first packet in an AMS sequence signals the
beginning of AMS. Set in_ams flag to true when SRC_CAPS are
received during POWER_NEGOTIATION AMS.
This fixes the failure flagged while running TD.PD.SNK.E9
compliance test.

From Deterministic PD compliance MOI spec:
TD.PD.SNK.E9. GetSinkCap in Place of Accept
Description:
As Provider, the Tester intentionally sends a GetSinkCap message in place
of Accept message and verifies the UUT will send a SoftReset and recover
from the error.
Steps:
a) Run PROC.PD.E1 Bring-up according to the UUT role.
b) The Tester cycles VBus.
c) The Tester sends a Source Capabilities message to the UUT.
d) Upon receipt of a Request message from the UUT, the Tester replies with
   a GoodCRC message.
e) The Tester sends a GetSinkCap message to the UUT.
f) If a SoftReset is not received within 15 ms after the GetSinkCap EOP was
   sent, the test fails.
g) If a SoftReset is received timely, the Tester replies with an Accept
   message.
h) The Tester sends Source Capabilities message to the UUT repeatedly until
   nCapsCount reached or a GoodCRC is received. If nCapsCount reached, the
   test fails.
i) If a Request is not received timely within 30 ms after the GoodCRC EOP
   corresponding to Source Capabilities message was received, the test
   fails.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 0afd8ef692e8..b3e07d9b7597 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2243,6 +2243,7 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
 		 * handled.
 		 */
 			port->ams = POWER_NEGOTIATION;
+			port->in_ams = true;
 			tcpm_set_state(port, SNK_NEGOTIATE_CAPABILITIES, 0);
 		} else {
 			if (port->ams == GET_SOURCE_CAPABILITIES)
-- 
2.30.0.365.g02bc693789-goog

