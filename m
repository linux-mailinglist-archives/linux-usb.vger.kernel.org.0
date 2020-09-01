Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7AD2585D5
	for <lists+linux-usb@lfdr.de>; Tue,  1 Sep 2020 04:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgIAC7g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Aug 2020 22:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgIAC7d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Aug 2020 22:59:33 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADD2C061366
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:33 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id j20so7200016ybt.10
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2020 19:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=dksXFr9Ur1TVJsysY1A4OAwfD74oXm7s3UI7cm7URy4=;
        b=kIHSNnYnG66S7jMff+LOcYcMvMQo+iGzdYvIhL6i+UtYsZAiTuOGfuWICNTU887ViC
         45p+/jDfQSPZb7UJoWua2fjUlhM4icRm1gLiqYXvAAfQjDGJQx3ahpqdCgheqV9n263m
         as0GS97ZdpVU1szBZAbKwnzVnk1xNBrpCrw7dI9HQbKGl+ICZlMD7Ze19xFuoaGvvkLC
         pL/msZU05p2nn7nB94zz+l3t1rc5QtqY/cdcnUaL3IUCYAtE7Ni/+EeXFQSY8j6N0r2K
         gnwKyC6Vk4Qrg3p+m1mfasTN1uOg4ssIO3MLpnodPfa9PJNkdHRarKa3kRP0FnT1SBaa
         1hHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=dksXFr9Ur1TVJsysY1A4OAwfD74oXm7s3UI7cm7URy4=;
        b=gSeS6ym+m5+Iih0M7/KZcgLoA/gOO5JaBnRVaJ3aJW6AW0RP5SAtGYiAwjq3JJnoV9
         sooCDS/yeO/+37yQSjdTVAl0u9R+7N/uQA5A+RIN7AZftEJOIgmeBH4okt7dKp0ZNrFE
         +qLQR9uj7FiOHr0V+U7Af5qXZh59UVoO8PZ5D9m+8kZ0zLi3ae7gVOTeN8g2kUYI5cA0
         qmV7xaH2krbwKX3n6XnfZkTktTRAYdrXVjuINjHEOKwc7PGSTqhd2jcPetFp0AcG7SCL
         mSYUdb4sBRUbQ/yaxusIc/buWc47KcSPsymZie90+6A7o/5bWsAJYMd1XYWd+QhfivfY
         EGzw==
X-Gm-Message-State: AOAM533RiWbw1AvDHKMUUv3WkjWHCWVmgfmUNbCFB8GNoWWknpRLta39
        aYHpJXFeS0++3YHCOPgQb3ewYsNgNWo=
X-Google-Smtp-Source: ABdhPJxrvhmQhutKuwiS6k9sj9dul9RFWDWzE7UrPiOFulPP3gPZbwF55a7TwdGxVmuQlzvakaUCphwjR9A=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:1:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a25:c74a:: with SMTP id w71mr150863ybe.191.1598929172798;
 Mon, 31 Aug 2020 19:59:32 -0700 (PDT)
Date:   Mon, 31 Aug 2020 19:59:14 -0700
In-Reply-To: <20200901025927.3596190-1-badhri@google.com>
Message-Id: <20200901025927.3596190-2-badhri@google.com>
Mime-Version: 1.0
References: <20200901025927.3596190-1-badhri@google.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH v6 01/14] usb: typec: tcpci: Add register definitions to tcpci
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add register definitions to trap extended alerts.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Change history:
- No code changes. Update version from v1 to v6 to avoid confusion
---
 drivers/usb/typec/tcpm/tcpci.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.h b/drivers/usb/typec/tcpm/tcpci.h
index 11c36d086c86..fd26ca35814c 100644
--- a/drivers/usb/typec/tcpm/tcpci.h
+++ b/drivers/usb/typec/tcpm/tcpci.h
@@ -16,6 +16,7 @@
 #define TCPC_PD_INT_REV			0xa
 
 #define TCPC_ALERT			0x10
+#define TCPC_ALERT_EXTENDED_STATUS	BIT(13)
 #define TCPC_ALERT_VBUS_DISCNCT		BIT(11)
 #define TCPC_ALERT_RX_BUF_OVF		BIT(10)
 #define TCPC_ALERT_FAULT		BIT(9)
@@ -32,6 +33,10 @@
 #define TCPC_ALERT_MASK			0x12
 #define TCPC_POWER_STATUS_MASK		0x14
 #define TCPC_FAULT_STATUS_MASK		0x15
+
+#define TCPC_EXTENDED_STATUS_MASK		0x16
+#define TCPC_EXTENDED_STATUS_MASK_VSAFE0V	BIT(0)
+
 #define TCPC_CONFIG_STD_OUTPUT		0x18
 
 #define TCPC_TCPC_CTRL			0x19
-- 
2.28.0.402.g5ffc5be6b7-goog

