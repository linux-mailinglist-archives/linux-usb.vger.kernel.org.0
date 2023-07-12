Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86634750232
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 10:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233050AbjGLI7B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 04:59:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjGLI6l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 04:58:41 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC272135
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 01:57:27 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-55c19420827so5015400a12.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 01:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689152247; x=1691744247;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o7IxMgsm10wM4UtHG5ILit3AGY4PCAIXBMJb8LPTjZE=;
        b=5SdejOJp8VU3CbfzVdHrFiUZy9Sg2fjsaM+37a7NbRb4J1uX2H6b2OTG4pByTROd4n
         spndSk5E/mTZ4GyVd7gmmxlztHqqrkvhK8pdSQaLHrmF5OjkH1Gb9fBZ0FuPpZw7xju6
         zsdil8YofrGOKzU+l/Bcu9XbmzATqHHwdkqiggXgwUd9hPnMsM3cg5pLs88E9okRVwcv
         U1Ml4d0AB4ZVhhKVe3ArL7v0tydYALwE5r9vaklttinSnPMQb/gsTCnw0jj+xGIpJvy8
         2G+S+XvC89+gqJuVZRRF4GUjjtEjQt5JI+BHAC/uEb+DEMDIRp4vw9ttfXknF1G3wYSo
         QohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689152247; x=1691744247;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7IxMgsm10wM4UtHG5ILit3AGY4PCAIXBMJb8LPTjZE=;
        b=l0TC2Zl8NdK6VQNFz5Ub7ytROcftq3HtPjF9lOWGVA1W+ZRwouU65ZqTyxxts93ckI
         LznJbo9STGRbpQQl/dZMWHi0ft9rLqEd5IxKcW9HvzbgUgARMGIBnaheE+5nDjVXSiIN
         maPXxkg+N+K+QxhYXh09TRzFWZ16CxtiZWAMKxDlS5xchF+u+TJ7ylliRI274vnsKrMZ
         1k6WYBJg61w6nKwNXVlcZv0QCX0VbFuCuMFbHsxdCAQxM62Ox+uiSwB1ImtwL3EKmH+9
         DxJskpzgSy/tyHK3xJ5x1pE9RtIOxwiu9kOlqkayDlRXJVFF1eS88XKr7IA/o1j3dMqw
         oyyg==
X-Gm-Message-State: ABy/qLY4EGGlKisvPpeN7BMyfNekeKv8GA1mRQqg1S4PC4QNsirimSGn
        AskMHucJgeKQW5r2+SBZkOzXKSxNpc8=
X-Google-Smtp-Source: APBJJlFDBOcXKyheJrQ1mAmBe3SBY45tZsMMX1cuCQesKVTGIVmfD7ZeHEYqu96oAiKhRzN/JSkvy9DgqfI=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a65:6a84:0:b0:55a:e746:31ef with SMTP id
 q4-20020a656a84000000b0055ae74631efmr10155877pgu.1.1689152246932; Wed, 12 Jul
 2023 01:57:26 -0700 (PDT)
Date:   Wed, 12 Jul 2023 08:57:22 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230712085722.1414743-1-badhri@google.com>
Subject: [PATCH v1] usb: typec: tcpm: Fix response to vsafe0V event
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     gregkh@linuxfoundation.org, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, kyletso@google.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Do not transition to SNK_UNATTACHED state when receiving vsafe0v event
while in SNK_HARD_RESET_WAIT_VBUS. Ignore VBUS off events as well as
in some platforms VBUS off can be signalled more than once.

[143515.364753] Requesting mux state 1, usb-role 2, orientation 2
[143515.365520] pending state change SNK_HARD_RESET_SINK_OFF -> SNK_HARD_RESET_SINK_ON @ 650 ms [rev3 HARD_RESET]
[143515.632281] CC1: 0 -> 0, CC2: 3 -> 0 [state SNK_HARD_RESET_SINK_OFF, polarity 1, disconnected]
[143515.637214] VBUS on
[143515.664985] VBUS off
[143515.664992] state change SNK_HARD_RESET_SINK_OFF -> SNK_HARD_RESET_WAIT_VBUS [rev3 HARD_RESET]
[143515.665564] VBUS VSAFE0V
[143515.665566] state change SNK_HARD_RESET_WAIT_VBUS -> SNK_UNATTACHED [rev3 HARD_RESET]

Fixes: 28b43d3d746b ("usb: typec: tcpm: Introduce vsafe0v for vbus")
Cc: <stable@vger.kernel.org>
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 829d75ebab42..cc1d83926497 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5349,6 +5349,10 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
 		/* Do nothing, vbus drop expected */
 		break;
 
+	case SNK_HARD_RESET_WAIT_VBUS:
+		/* Do nothing, its OK to receive vbus off events */
+		break;
+
 	default:
 		if (port->pwr_role == TYPEC_SINK && port->attached)
 			tcpm_set_state(port, SNK_UNATTACHED, tcpm_wait_for_discharge(port));
@@ -5395,6 +5399,9 @@ static void _tcpm_pd_vbus_vsafe0v(struct tcpm_port *port)
 	case SNK_DEBOUNCED:
 		/*Do nothing, still waiting for VSAFE5V for connect */
 		break;
+	case SNK_HARD_RESET_WAIT_VBUS:
+		/* Do nothing, its OK to receive vbus off events */
+		break;
 	default:
 		if (port->pwr_role == TYPEC_SINK && port->auto_vbus_discharge_enabled)
 			tcpm_set_state(port, SNK_UNATTACHED, 0);

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
-- 
2.41.0.255.g8b1d071c50-goog

