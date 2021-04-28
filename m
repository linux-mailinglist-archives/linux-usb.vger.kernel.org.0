Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB07036E140
	for <lists+linux-usb@lfdr.de>; Wed, 28 Apr 2021 23:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbhD1Vya (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Apr 2021 17:54:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33198 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231380AbhD1Vy3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Apr 2021 17:54:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619646824;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Hyp4AGgXcMc49uqhb8vpl0J5tgw16x316sedrJ5yHw=;
        b=B5sxWBUR0yPxlOERq5QulD4FytyFhDeunJUVAUVZf3LYhCk/JPq5JkpigV/dVsJ9q6Dj8i
        3BS5iqWVzoHoGEL6vNaIwTK5HrV6Qzw5tCFzCqbea4P/zN40T85aaBBYW28tTPH8txlPcZ
        N7OdRR6ebBeF4tHX14nOJtMgXP+kfuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-PQ7rYftuOWShqH-8y8LzzQ-1; Wed, 28 Apr 2021 17:53:42 -0400
X-MC-Unique: PQ7rYftuOWShqH-8y8LzzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A2F818BA281;
        Wed, 28 Apr 2021 21:53:40 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B7DA15C1BB;
        Wed, 28 Apr 2021 21:53:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 9/9] platform/x86/intel_cht_int33fe: Correct "displayport" fwnode reference
Date:   Wed, 28 Apr 2021 23:52:57 +0200
Message-Id: <20210428215257.500088-10-hdegoede@redhat.com>
In-Reply-To: <20210428215257.500088-1-hdegoede@redhat.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Type-C connector on these devices is connected to DP-2 not DP-1,
so the reference must be to the DD04 child-node of the GPU, rather
then the DD02 child-node.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel_cht_int33fe_typec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_cht_int33fe_typec.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
index b61bad9cc8d2..d59544167430 100644
--- a/drivers/platform/x86/intel_cht_int33fe_typec.c
+++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
@@ -168,8 +168,8 @@ static int cht_int33fe_setup_dp(struct cht_int33fe_data *data)
 		return -ENODEV;
 	}
 
-	/* Then the DP child device node */
-	data->dp = device_get_named_child_node(&pdev->dev, "DD02");
+	/* Then the DP-2 child device node */
+	data->dp = device_get_named_child_node(&pdev->dev, "DD04");
 	pci_dev_put(pdev);
 	if (!data->dp)
 		return -ENODEV;
-- 
2.31.1

