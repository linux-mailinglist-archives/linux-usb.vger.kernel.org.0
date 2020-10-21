Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A765A295405
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 23:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506002AbgJUVSI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 17:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505999AbgJUVSI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 17:18:08 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA5DBC0613CE
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2020 14:18:07 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 19so2231245pge.12
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2020 14:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IpBAZMqjgB/XzFmJFn/5epEGec881cvLKDsKQ0vHwJo=;
        b=Xp2SPtQZMd7B8LolzXDN8SNxw3qRwXnLnzgpYn+uzlxDVGVyFC+3f35YxUYCruqRIn
         1ESx/Ngs7Qn87MtkloJ6Eb34NLC54mIzUKZs4NQcAVUbvnsjKAtmQTOJr15PbtFGnpG7
         RIpEWSWWJZOd/LWvXvRHs8QhkVwOdTTmZMNOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IpBAZMqjgB/XzFmJFn/5epEGec881cvLKDsKQ0vHwJo=;
        b=fhz/2eJftLoa72qzcVlgP4uFTRbImiUZ4DkGXLjsiu/OOrs3D8go7GpnoRkn9jXiSC
         TqraQ7gsAoqxuU4TuhI3zVPxGpCQkWW7TFZam31CcxITKqokhSCXWr5oHO8KzEi+acTZ
         fEAgMV/MX85e4vd98NkwDqIlq9TXpKZnq7n+WDBynYJTGEfYp+GIzEWwDr+RDU+fAduq
         3C4Y6yDjbgw2JDkcXPF8nDnZ/w8Aaaqv+eKoIcCGDX4Dj3fqfngt4i9JrCx9usNPbS/y
         DBOvsaN6EV6SIcutGLK6nmMx1amcH2fjteUtXEy++6M4Hv75JUranr17LPiotkrswVS6
         5iWg==
X-Gm-Message-State: AOAM532d1Vlc4+40YVOHxaRI/Sh6C5e1ilHItp1rPuqdrYxiOurVOgV1
        w/BEMnaZMbCpoeyO7+G1+NzY4Ltk5i7IAw==
X-Google-Smtp-Source: ABdhPJxYEVu5eRDg9Wrmva5G/iMHHEShQyGN3eeGMktzBr2VqReqkr6LwQZsOLF9xsQ7/ivKtIJOKQ==
X-Received: by 2002:a62:77c4:0:b029:155:6332:e1bd with SMTP id s187-20020a6277c40000b02901556332e1bdmr5438224pfc.35.1603315087190;
        Wed, 21 Oct 2020 14:18:07 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id b6sm3068337pjq.42.2020.10.21.14.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 14:18:06 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH] usb: typec: Expose Product Type VDOs via sysfs
Date:   Wed, 21 Oct 2020 14:18:02 -0700
Message-Id: <20201021211802.774854-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A PD-capable device can return up to 3 Product Type VDOs as part of its
DiscoverIdentity Response (USB PD Spec, Rev 3.0, Version 2.0, Section
6.4.4.3.1). Add a sysfs attribute to expose these to userspace.

Cc: Benson Leung <bleung@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/usb/typec/class.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 35eec707cb51..e6abb0dee9fa 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -122,10 +122,20 @@ static ssize_t product_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(product);
 
+static ssize_t product_type_vdo_show(struct device *dev, struct device_attribute *attr,
+				     char *buf)
+{
+	struct usb_pd_identity *id = get_pd_identity(dev);
+
+	return sprintf(buf, "0x%08x\n0x%08x\n0x%08x\n", id->vdo[0], id->vdo[1], id->vdo[2]);
+}
+static DEVICE_ATTR_RO(product_type_vdo);
+
 static struct attribute *usb_pd_id_attrs[] = {
 	&dev_attr_id_header.attr,
 	&dev_attr_cert_stat.attr,
 	&dev_attr_product.attr,
+	&dev_attr_product_type_vdo.attr,
 	NULL
 };
 
-- 
2.29.0.rc1.297.gfa9743e501-goog

