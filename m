Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 974DC4ACF93
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 04:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346114AbiBHDRc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Feb 2022 22:17:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346092AbiBHDR2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Feb 2022 22:17:28 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1410C0401C9
        for <linux-usb@vger.kernel.org>; Mon,  7 Feb 2022 19:17:27 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id o192-20020a4a2cc9000000b00300af40d795so16116905ooo.13
        for <linux-usb@vger.kernel.org>; Mon, 07 Feb 2022 19:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kylOqxqc08MBshbgqm3PijrB7pXzqxJn31OEqnNLWP0=;
        b=l2qL6B4M9YlcEtPfHIONnFSylbV2DQVytd1K73tkEYy3cpTU6G8d9pXsvw64D3EO7Y
         WNZByESzObBZ6nqduWAz84bD8lWTWL6jmIQl/bYfCMBxOGuErmQaeEsTCtJ07PonuvJ4
         /Fk6GfmFSwkm76CSKFv41aeJ+gwgCXzF6xHDGmgAdUgA0IzsEdCMY/ktIwwq648MfhdT
         lGcIo58EYTJY0kLL07zIUYIRh9EH9A9DFX+blLe9pj+9tPrBSUlsE4uMvZhW8xeuq49Q
         pmxz3seZZQVjtYvQvCDRux/1nNKYiXWKzu1CKccu0T3jkIu6/JS+mK3FZwXUKIKu/PNI
         5yeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kylOqxqc08MBshbgqm3PijrB7pXzqxJn31OEqnNLWP0=;
        b=cCOBvnAIoxbAy8WxypQVVMDbNRvd38rjw9iBtZ5dMSGZKA4cSZdW8YWdOAYzKjzAlE
         p/KdG1JCbRdbvL7/v5hAIOy8efeGRgZ8Ji/YbsjPibWvx4kBpAp93y/mqK3H9ysYMKGu
         dvd+q59iVd6q2aBdMsxzwjWKQJTSWF8BN/xMr8SHcx8tn8GjA1YIWmxQdfyjXKa9kTFx
         wRcYLeD41Idxfu8O5jCdjtYv0tDspdoU8JiL6/DEBLDOjRjipd4j+YOc1+v2+LaWtAec
         CN7dG7zIr44hjEMP+7n4XKMW7Sp/pVigDB/8fCQ6/9tQtzXOwc6KgBh1jRxslgihh+A7
         9K7Q==
X-Gm-Message-State: AOAM5337po/pvUZQ+vA5jCGXAdodajtPBbaIedkZG2PLT6Ynpo0blFnL
        7tv3vE1ggvmYaO6wKHXkYOHHqQ==
X-Google-Smtp-Source: ABdhPJxrBuzO7d3fd9iENVl5M322rUWPV/E4hg56Lh1fAMr84xr29Rxpr4Qun+vpOi5ftnwzPfTkxQ==
X-Received: by 2002:a05:6870:7a13:: with SMTP id hf19mr676576oab.127.1644290247151;
        Mon, 07 Feb 2022 19:17:27 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k3sm4763873otl.41.2022.02.07.19.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 19:17:26 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 2/6] device property: Use multi-connection matchers for single case
Date:   Mon,  7 Feb 2022 19:19:40 -0800
Message-Id: <20220208031944.3444-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220208031944.3444-1-bjorn.andersson@linaro.org>
References: <20220208031944.3444-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The newly introduced helpers for searching for matches in the case of
multiple connections can be resused by the single-connection case, so do
this to save some duplication.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/base/property.c | 55 ++++-------------------------------------
 1 file changed, 5 insertions(+), 50 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 5230ff5c8d48..dfdf7164b6de 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1164,31 +1164,6 @@ const void *device_get_match_data(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(device_get_match_data);
 
-static void *
-fwnode_graph_devcon_match(struct fwnode_handle *fwnode, const char *con_id,
-			  void *data, devcon_match_fn_t match)
-{
-	struct fwnode_handle *node;
-	struct fwnode_handle *ep;
-	void *ret;
-
-	fwnode_graph_for_each_endpoint(fwnode, ep) {
-		node = fwnode_graph_get_remote_port_parent(ep);
-		if (!fwnode_device_is_available(node)) {
-			fwnode_handle_put(node);
-			continue;
-		}
-
-		ret = match(node, con_id, data);
-		fwnode_handle_put(node);
-		if (ret) {
-			fwnode_handle_put(ep);
-			return ret;
-		}
-	}
-	return NULL;
-}
-
 static unsigned int fwnode_graph_devcon_matches(struct fwnode_handle *fwnode,
 						const char *con_id, void *data,
 						devcon_match_fn_t match,
@@ -1221,28 +1196,6 @@ static unsigned int fwnode_graph_devcon_matches(struct fwnode_handle *fwnode,
 	return count;
 }
 
-static void *
-fwnode_devcon_match(struct fwnode_handle *fwnode, const char *con_id,
-		    void *data, devcon_match_fn_t match)
-{
-	struct fwnode_handle *node;
-	void *ret;
-	int i;
-
-	for (i = 0; ; i++) {
-		node = fwnode_find_reference(fwnode, con_id, i);
-		if (IS_ERR(node))
-			break;
-
-		ret = match(node, NULL, data);
-		fwnode_handle_put(node);
-		if (ret)
-			return ret;
-	}
-
-	return NULL;
-}
-
 static unsigned int fwnode_devcon_matches(struct fwnode_handle *fwnode,
 					  const char *con_id, void *data,
 					  devcon_match_fn_t match,
@@ -1287,16 +1240,18 @@ void *fwnode_connection_find_match(struct fwnode_handle *fwnode,
 				   const char *con_id, void *data,
 				   devcon_match_fn_t match)
 {
+	unsigned int count;
 	void *ret;
 
 	if (!fwnode || !match)
 		return NULL;
 
-	ret = fwnode_graph_devcon_match(fwnode, con_id, data, match);
-	if (ret)
+	count = fwnode_graph_devcon_matches(fwnode, con_id, data, match, &ret, 1);
+	if (count)
 		return ret;
 
-	return fwnode_devcon_match(fwnode, con_id, data, match);
+	count = fwnode_devcon_matches(fwnode, con_id, data, match, &ret, 1);
+	return count ? ret : NULL;
 }
 EXPORT_SYMBOL_GPL(fwnode_connection_find_match);
 
-- 
2.33.1

