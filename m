Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29259675F35
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 22:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjATVAH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 16:00:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjATVAG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 16:00:06 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFCBB8BA8F
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 13:00:04 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id 5so1082197plo.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 13:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi0gtjhsP7zp5xSW3Z3RoqoJbUiEEOmd4JoTvK9TkE0=;
        b=fg/1GeHrMIY8TGrldd/OZ4ISLqmrvplDrY+W9latQq+0WVyUBB+O194ZQd3Pgdap5J
         P6TdL322sMvyymyQwP8qddbMEe1ZtmHrlAsvz8vO8NFPTYRDvlhfo8irRWvYrGKgF/UN
         wUVmkk3yfKmCsADg/cisRcGkI2gAVDaslIdKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oi0gtjhsP7zp5xSW3Z3RoqoJbUiEEOmd4JoTvK9TkE0=;
        b=tNpyLxfL9Kg6cssyo/AwA6kBgxOkHRq2u5jR7Qiaz97U2CReNg4Mz53/AOcAqaM7A7
         siXp0a1JHzZvUzcqcGPbElKi54EmSxfGsbworbBaBdbrcdcRNurSA5fo3VnaqMI99WFE
         8uPdK1Fdpmodepv+IWDkkMe6pOcdspUAIiArGrDPz+lxtXZ7BdNQXHkMxLJ/8dpUMP88
         CPsdrGNCJ8mnYPmCxzY1vaPcyHPqJ7kR2oBBPtlvHepKkfTFDAKVTsbQ3gSALeDjUpMj
         0MWFfNcXDj6KJnW889iIkKC7lgQPWysK9vDrgZ1OqvR9+6dNGXYDpN+oRsHJ88VtIm5Q
         QY2g==
X-Gm-Message-State: AFqh2kqjWc1RXJ/EunuRmfA2FhCCHYJzq1K9cqFg9uvWTho1W3mE3wHs
        uL0oGYynivVXI+GfaGPJBuEEPA==
X-Google-Smtp-Source: AMrXdXsEiftQhUUKdZowWRfYE7CzV0G4etW5wYZ1PTNLMA0OOLMxzhhYiEHcknDcmuT6G9xFRzdPog==
X-Received: by 2002:a17:902:720a:b0:193:25b6:71bc with SMTP id ba10-20020a170902720a00b0019325b671bcmr18561161plb.25.1674248404393;
        Fri, 20 Jan 2023 13:00:04 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id n11-20020a170902e54b00b0018c7a5e052asm27248336plf.225.2023.01.20.13.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 13:00:04 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     bleung@chromium.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, Prashant Malani <pmalani@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 2/2] usb: typec: tcpm: Remove altmode active state updates
Date:   Fri, 20 Jan 2023 20:58:28 +0000
Message-Id: <20230120205827.740900-2-pmalani@chromium.org>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
In-Reply-To: <20230120205827.740900-1-pmalani@chromium.org>
References: <20230120205827.740900-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since the "active" state for partner altmodes is now being taken care of
by the altmode driver itself (specifically, DisplayPort altmode), we
no longer need to do so from the port driver. So remove the calls to
typec_altmode_update_active() from TCPM.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes since v1:
- Patch first introduced in v2.

 drivers/usb/typec/tcpm/tcpm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 904c7b4ce2f0..0f5a9d4db105 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1693,14 +1693,11 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			}
 			break;
 		case CMD_ENTER_MODE:
-			if (adev && pdev) {
-				typec_altmode_update_active(pdev, true);
+			if (adev && pdev)
 				*adev_action = ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL;
-			}
 			return 0;
 		case CMD_EXIT_MODE:
 			if (adev && pdev) {
-				typec_altmode_update_active(pdev, false);
 				/* Back to USB Operation */
 				*adev_action = ADEV_NOTIFY_USB_AND_QUEUE_VDM;
 				return 0;
-- 
2.39.0.246.g2a6d74b583-goog

