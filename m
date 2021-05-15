Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9441A381612
	for <lists+linux-usb@lfdr.de>; Sat, 15 May 2021 07:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233952AbhEOF1c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 01:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233005AbhEOF1a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 15 May 2021 01:27:30 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FFF1C06175F
        for <linux-usb@vger.kernel.org>; Fri, 14 May 2021 22:26:18 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id z13-20020a25ad8d0000b02904f9f8375b61so1866813ybi.20
        for <linux-usb@vger.kernel.org>; Fri, 14 May 2021 22:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=sNHIuQYVsWA/7a4mAAkQImBcT2qMojEQX5dVrrYWLcM=;
        b=oMGbgtK3hrH/5fPQWLdrW3KsbCwX3axogu6RA7twsgK5yjdE+4mL5hNjbVbEKnkBjT
         mPcgm4zODQ18yFDxmT5Vp3ZE1vdkEetuj1Y+D3itJtG8QwZ5Rufa1kuztrtCRWv57gxz
         C7TfWeSmBTZy9f9weM0S3xUSONdocKJUBwY3tp63YWWAjKipKzovYikfyX3rvzfkCUbs
         GZJh8jStGvIKLqDvCncenDCQfVskSZqvR0kxghS6cWM2++iD+gc633rap5yBDFpuBZJF
         q5QsTI1zSkl5lcoSbhjlAnYGuP4N7yQH5e6/glIh7kt3N11KIjeinMgWFvJ4Fj+ysMhc
         lpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=sNHIuQYVsWA/7a4mAAkQImBcT2qMojEQX5dVrrYWLcM=;
        b=RlzP1Xw31wKN15/wauA6TPY9Xo5fh2xZXyN7YRpK3fsnbSeemAGag9UJUaA4jQbtlz
         NFhI7US8M6Urr1KH7s6Q+Jtw1bHs8sJ3yxgfGpl4iSAe7EjH5nnewHuqrB6AItrTm/0Y
         ydf+E+K8WjJBMEn4TbppWSZo7XdzoNn/e5MpoYT0Z3zZO6IjB84AAkhktXvf+iaxx1NZ
         LvJPHJQstFpfBKHOkSPxCkTRM1hoVxqP8a8BU3whjxn4q+TJ7DV1bDj6JXu7r0r3arlI
         2Wo+SfOkAwmrFT8iD539QRINrRe3Vn2ctZ+P4s14vULtpiJ2Kv1BxbS+1Jmo5dPoMT4F
         kQ7A==
X-Gm-Message-State: AOAM533g7Fwg23gBF8WjwDfnEiI4nbZxtYQST/OR5+gkA0NDAXZii4ok
        vHgvBbRo02yrmSZ6jqQ7DFmdpIgCv/k=
X-Google-Smtp-Source: ABdhPJwk0WyQnMdHJuZpEfbU+WKgE802VKw+8Tif87zivPDmE0aWIgkLjkHBEvy6pZ5/rwWz3eMx86YyjYA=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:6bd1:251e:e226:7071])
 (user=badhri job=sendgmr) by 2002:a25:9942:: with SMTP id n2mr70156951ybo.230.1621056377552;
 Fri, 14 May 2021 22:26:17 -0700 (PDT)
Date:   Fri, 14 May 2021 22:26:10 -0700
Message-Id: <20210515052613.3261340-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH v1 1/4] usb: typec: tcpm: Fix up PR_SWAP when vsafe0v is signalled
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>, stable@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

During PR_SWAP, When TCPM is in PR_SWAP_SNK_SRC_SINK_OFF, vbus is
expected to reach VSAFE0V when source turns of vbus. Do not move
to SNK_UNATTACHED state when this happens.

Fixes: 28b43d3d746b ("usb: typec: tcpm: Introduce vsafe0v for vbus")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index c4fdc00a3bc8..b93c4c8d7b15 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5114,6 +5114,9 @@ static void _tcpm_pd_vbus_vsafe0v(struct tcpm_port *port)
 				tcpm_set_state(port, SNK_UNATTACHED, 0);
 		}
 		break;
+	case PR_SWAP_SNK_SRC_SINK_OFF:
+		/* Do nothing, vsafe0v is expected during transition */
+		break;
 	default:
 		if (port->pwr_role == TYPEC_SINK && port->auto_vbus_discharge_enabled)
 			tcpm_set_state(port, SNK_UNATTACHED, 0);
-- 
2.31.1.751.gd2f1c929bd-goog

