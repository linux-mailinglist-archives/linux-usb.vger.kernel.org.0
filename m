Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF54F360144
	for <lists+linux-usb@lfdr.de>; Thu, 15 Apr 2021 07:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbhDOFBv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Apr 2021 01:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhDOFBs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Apr 2021 01:01:48 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 654E5C061574
        for <linux-usb@vger.kernel.org>; Wed, 14 Apr 2021 22:01:26 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id cq14-20020a17090af98eb029014de92947deso10809484pjb.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Apr 2021 22:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ta/hfuNTgaP1E3sjxBNUiHOKgcFvSsn4fCVYN2yQ2i8=;
        b=ahXW1HpfNTMtsV5U1jCpAPpqhaawkSgv+MlM/UgWctofOhAtvwxMA6cWIxInmMS4MU
         TdFcza3jtLTLwSRjEgxPjfAUtIf7J/DlMVCZ8QRULtVkYdKEYuhP8yTZVU6humj1kIQn
         Vt+pa0FqW3VAs8opeLd20G0KCJJhjkdddU44eYvDufO7yoZ9rhTPYv/BcKaId2akmT67
         Au+TsA1HEhlVKJ37PqPenR3lO9XuJ+ovfEGjAV1/E8EODCERvqBUorE1pVbA3ZyYL4Gv
         38AcVo1we9FXdS35W7x0cEyh4e9/YgAKb7EQDkYNH8MHkIpf2olVGjkBLCVisgLh1+Wx
         UWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ta/hfuNTgaP1E3sjxBNUiHOKgcFvSsn4fCVYN2yQ2i8=;
        b=m+iLu8cjW/DJv+bnh/RTds3Pl6geqzDl7AScyGFMYRzuDapyL+cjqQ6rLMWTaiiEoY
         bAs1NBSnbPrDDuPf7AT7Fm8Pi9wzikOMycWvb5cj9vSmd7z/XwYB5BMJT1yo/YeHQV3o
         CRTQr+zVc3AeyhznZmWCjMK/RbwpldOGAFjgfj9jxYgAXCzduIweN5DRUg28l/ETtqxj
         1DQfwNgkvzCcZUgesxe8F9R9PM6cDR5iyIyxwKMuLW95KW2fXDFwl/uSZOPeLeBpH6qL
         D/C4i/F+QCTqSrW5vQghAFgU0x477FSQLdU2f5vigVr/kW2x7ZGGrdZ/bBGwGxpveaDX
         weIA==
X-Gm-Message-State: AOAM532LrpO4UUG0rCVEJefuYZYhGc1AdovZF5mt6Y2eoEE7TU6HLZi2
        gBnVcuUFZOi4K1G81xkjGF8dHdsvluU=
X-Google-Smtp-Source: ABdhPJyJBiWoLjwYcMHHHQAYvmjtgBy7G4G2jzrJZfibEFPaK2uhU7IFnICtqBwmAUEmFCJ7NBotGNYA2Wk=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:91dd:58ac:7590:aa21])
 (user=badhri job=sendgmr) by 2002:a62:ab06:0:b029:249:db1c:3d7d with SMTP id
 p6-20020a62ab060000b0290249db1c3d7dmr1572187pff.72.1618462885850; Wed, 14 Apr
 2021 22:01:25 -0700 (PDT)
Date:   Wed, 14 Apr 2021 22:01:21 -0700
Message-Id: <20210415050121.1928298-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v1] usb: typec: tcpm: Fix error while calculating PPS out values
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

"usb: typec: tcpm: Address incorrect values of tcpm psy for pps supply"
introduced a regression for req_out_volt and req_op_curr calculation.

req_out_volt should consider the newly calculated max voltage instead
of previously accepted max voltage by the port partner. Likewise,
req_op_curr should consider the newly calculated max current instead
of previously accepted max current by the port partner.

Fixes: e3a072022487 ("usb: typec: tcpm: Address incorrect values of tcpm psy for pps supply")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 1c32bdf62852..04652aa1f54e 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3132,10 +3132,10 @@ static unsigned int tcpm_pd_select_pps_apdo(struct tcpm_port *port)
 		port->pps_data.req_max_volt = min(pdo_pps_apdo_max_voltage(src),
 						  pdo_pps_apdo_max_voltage(snk));
 		port->pps_data.req_max_curr = min_pps_apdo_current(src, snk);
-		port->pps_data.req_out_volt = min(port->pps_data.max_volt,
-						  max(port->pps_data.min_volt,
+		port->pps_data.req_out_volt = min(port->pps_data.req_max_volt,
+						  max(port->pps_data.req_min_volt,
 						      port->pps_data.req_out_volt));
-		port->pps_data.req_op_curr = min(port->pps_data.max_curr,
+		port->pps_data.req_op_curr = min(port->pps_data.req_max_curr,
 						 port->pps_data.req_op_curr);
 	}
 
-- 
2.31.1.295.g9ea45b61b8-goog

