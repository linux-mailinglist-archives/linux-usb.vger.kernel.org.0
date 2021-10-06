Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED9142371E
	for <lists+linux-usb@lfdr.de>; Wed,  6 Oct 2021 06:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbhJFEfG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Oct 2021 00:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhJFEfG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Oct 2021 00:35:06 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE307C061749
        for <linux-usb@vger.kernel.org>; Tue,  5 Oct 2021 21:33:13 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id oa6-20020a17090b1bc600b0019ffc4b9c51so3515871pjb.2
        for <linux-usb@vger.kernel.org>; Tue, 05 Oct 2021 21:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vzt25WKen5yxoB6+zFmyoOUcCazC0GoTv9qeublHMvo=;
        b=qkWdHv8kvKQKMOmJl/5ZZKmjGRIfAHZK6JvQ0+3QOWAJYv6Tgs9K91GjBSVa/bhMPE
         /5+XbljEVjOfzQWG3X++h8cCo64f9YaOVRQTdUncv8cYZvy5H+N58TN9W6f6N07D7WZw
         bakh01K+Kxvp9W+Kr52b0VkQhjSyQo4zBGlCb/jQOY4VruPXh+5Rdv8JQVqGGQnijhzG
         USPP3GsnQbh+PQq2FxtLv/+it05Zs2rL1KMYaV2bjqdPcleQwesaHh0mbSmSFZzpPj8a
         8zkxmzlG/BVuW44vWZ2JmiEMNGisSuwXlJMT9WLbYmPFEMlbzwe9iTHPEClbV3eCIzF0
         P9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vzt25WKen5yxoB6+zFmyoOUcCazC0GoTv9qeublHMvo=;
        b=FWLjh8PzTwsHoFk0meKaiSVb5sqPAgXZ44BCQdSH6Bzcr7G6QIbOWBpZ46sUk8i/WC
         DeQ5JQ3pve7DGe3BQh5WSNwlG5F7T4r0++feuefZoSoao/JylNlERnVd+rD/kkglEkKS
         MW8eaaIMtA71yEcb94kc/CzRG9pmtc7V9HQdlpu+Hje3je0W5xhx+iTx9PkMvgu7gXXI
         uOcl3xVbpmAyDUdik5soyk9sCjGPVZHFfpcU9QYVLFFd9CtrttVbmgZKgZc/7EgSVxga
         i6S0TZWljnCTbWuCPINyuXateHMVVX3H5GqbWrSAOiBwvV3kTui1khW4Wbj1J1/iGVXN
         Y7sA==
X-Gm-Message-State: AOAM530NI0eu3sPjt5ZF3ADurOvw1xkUKbymy+2kL2KqFZ3OjQaslUDe
        d3QHAx3TiSumxlHRDaMMer8=
X-Google-Smtp-Source: ABdhPJygw/DStCng3OduJ4tLfbDWcrfr1yf/Vq5Cknd47TAb1oRuITo8OHzc29kZZPpOy6LLgYhstw==
X-Received: by 2002:a17:90b:224e:: with SMTP id hk14mr8406018pjb.224.1633494793443;
        Tue, 05 Oct 2021 21:33:13 -0700 (PDT)
Received: from localhost.localdomain (cpe-172-112-234-200.socal.res.rr.com. [172.112.234.200])
        by smtp.gmail.com with ESMTPSA id z9sm19369387pfr.124.2021.10.05.21.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 21:33:13 -0700 (PDT)
From:   lindsey.stanpoor@gmail.com
To:     intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org
Cc:     hdegoede@redhat.com, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, cnemo@tutanota.com
Subject: [PATCH 1/1] usb: typec: altmodes/displayport: reorder dp_altmode_configured()
Date:   Tue,  5 Oct 2021 21:32:57 -0700
Message-Id: <20211006043257.23242-1-lindsey.stanpoor@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Cameron Nemo <cnemo@tutanota.com>

A recent commit [1] introduced an unintended behavioral change by
reordering certain function calls. The sysfs_notify call for
pin_assignment should only be invoked when the dp_altmode_notify call
returns 0, and in the dp->data.conf == 0 case.

[1] https://lore.kernel.org/r/20210817215201.795062-8-hdegoede@redhat.com

Signed-off-by: Cameron Nemo <cnemo@tutanota.com>
---
 drivers/usb/typec/altmodes/displayport.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index c1d8c23baa39..a15ae78066e3 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -154,10 +154,17 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 
 static int dp_altmode_configured(struct dp_altmode *dp)
 {
+	int ret;
+
 	sysfs_notify(&dp->alt->dev.kobj, "displayport", "configuration");
+
+	ret = dp_altmode_notify(dp);
+	if (ret || !dp->data.conf)
+		return ret;
+
 	sysfs_notify(&dp->alt->dev.kobj, "displayport", "pin_assignment");
 
-	return dp_altmode_notify(dp);
+	return 0;
 }
 
 static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
-- 
2.33.0

