Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40F7521E65C
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 05:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgGNDgZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 23:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbgGNDgZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 23:36:25 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17F7C061755
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 20:36:24 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id r19so8771401qvz.7
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 20:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=QRGV21zDsqgReRz8UhXO3hb4yh7SnqqrmCjjSQRfV8I=;
        b=XphMBp2T7rn+hqKSzkbTANp5kYe95a79kEgcFT+LoKklRhZiEDcYtPZNqpe4AV2gmA
         MsLZ1AtT+o8cbj/r3syUri/JyYmwDfagrzEc95+MRqkmlYHUZXXQb7//kN5fzv0pl2lE
         Uk/S/2A90wmxcm7YYxLhvymp2CphBVmvYk0YNmn1l6MQqxZUgJv721/zruOk3mP+VszF
         8JUfUqfHKkbzozRA/WuxjeLL0OQoIOsZPa+XCm0yn5mQKqwoG+uH73K+ioWE0O4GsyK4
         sF6RNN4ngo6iu9K/bx7Fb8i3obmzLl50TPQiJ83t7oaQp5fOYVTGOx4J9/EtYz06EPA7
         Arjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=QRGV21zDsqgReRz8UhXO3hb4yh7SnqqrmCjjSQRfV8I=;
        b=Z/6EzcIpm+x2YBYHatEcF3T/1dnUXKsB6OUgVPDBJ6P7RXQkXohaeJdgVlFf+hlOoc
         ye6eKJBprqNRDmB+bqvbrnEDoKUAKhiTqusPAevOvysYY3rkZGUIhPLJLhzTpCaGAaHM
         z2wa9oeBvEbmwf2oth3FqULOEd9/g9i6S8HBCYK1W18qX8CM9svtKktuti1/JC0nSFy1
         Q+X3sGDttIMskx3OfMpNL39IyvgmX9w8A+HScQNXura+gnLDT5DcBb6MLQNomcRcKfy+
         7jh6SsTL4t3Y2C5rIif9Bp1VX04A4BCrey/l6oC6r9R0X8B8DUX0u0GdqfpyepQ3T7nl
         T5Pw==
X-Gm-Message-State: AOAM533qwRJM3dSxzQnyP1cr8T/nH4Y2NbyrUe/VqNtCwxc+uSuIdiVz
        mSJMVORlNh7CNJcrGaLP0stoxcff8rut
X-Google-Smtp-Source: ABdhPJyFtn7bk8z0unulWpf4PvIfSuun4DmAwO4sGFV2nov6DXVCdYqv3+LLV3oM6Vf+C+/j+J5qVRvbE4AZ
X-Received: by 2002:a0c:cd84:: with SMTP id v4mr2554450qvm.35.1594697784025;
 Mon, 13 Jul 2020 20:36:24 -0700 (PDT)
Date:   Tue, 14 Jul 2020 11:34:53 +0800
In-Reply-To: <20200714033453.4044482-1-kyletso@google.com>
Message-Id: <20200714033453.4044482-3-kyletso@google.com>
Mime-Version: 1.0
References: <20200714033453.4044482-1-kyletso@google.com>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
Subject: [PATCH 2/2] usb: typec: tcpm: Error handling for tcpm_register_partner_altmodes
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

typec_partner_register_altmode returns ERR_PTR. Reset the pointer
altmode to NULL on failure.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 82b19ebd7838..a6d4b03ec250 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1061,9 +1061,11 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
 	for (i = 0; i < modep->altmodes; i++) {
 		altmode = typec_partner_register_altmode(port->partner,
 						&modep->altmode_desc[i]);
-		if (!altmode)
+		if (IS_ERR(altmode)) {
 			tcpm_log(port, "Failed to register partner SVID 0x%04x",
 				 modep->altmode_desc[i].svid);
+			altmode = NULL;
+		}
 		port->partner_altmode[i] = altmode;
 	}
 }
-- 
2.27.0.389.gc38d7665816-goog

