Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1348545533
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jun 2019 09:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfFNHC4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jun 2019 03:02:56 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37427 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbfFNHC4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jun 2019 03:02:56 -0400
Received: by mail-pl1-f193.google.com with SMTP id bh12so619159plb.4
        for <linux-usb@vger.kernel.org>; Fri, 14 Jun 2019 00:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pNQ6nYo6c70uKSDBfbXx6zJQlezdrZh0hFJjdh6Vyac=;
        b=SENnNqrTNuXxriiRqd/bhGBfgvJ64hU4l+Tgjd9NXj+YmFkQCab8wpRMYVyqYEtB23
         71is3CwQsp+Cd/9kJL6sSLNOlOJJNUi3bGU7Vt5KuX1GnJrhBardX49o3ziLg9gfUbvw
         bqqoTXeDINZOv8QMOmdD9/juYSEHh8awm93zazNN7YyEq/t2MeDodiKAWs7wsbMQmWFx
         ZdFuaS9YhrlitY2TQ58AUmJNaUv6p2soUB/QT1xyHJyxR9zikONJ1vqAb+D8H9lZuI46
         inQ/uUU/CChuPpeN07ZTn5lpa0HFdNmgseVHoSyEeYbiYKBMKBSxLcGphuE4LS9L/ZRj
         qsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pNQ6nYo6c70uKSDBfbXx6zJQlezdrZh0hFJjdh6Vyac=;
        b=DR/Az2eFFqiYykDCvWQepP5fo7YOrBToi7Ew4AKcb6viaP7mtakANNeswueeEejqAu
         3T54Et5shw048pyBuTunBuJdwYOYK7f+FIdXtfr+RxCcAtMOGRQBMQhd7sDyNLpLpq+F
         4F1hJggHq7ftDiEffyII+MCfzFXOUS1ueQxlpNRoyPWqW+Mv2958ZjPR5f60nyq0gqrc
         3KFOTHWjMprghHQtdSCrBeYCEV3CutTSD8vYjin9lv65FKuI8Md8wXy3v/ArVYM3FjzR
         r2PM0kg186upVT3IJJrgML0LwakEhPEQcbWkUZ3jUqLD/3W2YIK9RC5RLWcnUVDky0lR
         noBg==
X-Gm-Message-State: APjAAAWfWqWltwVz39skD4QUhDb9eYEiUIjMJ1QbYAB5zpnoYYS5hOko
        vtssuechjBSIlIvJquZWizM=
X-Google-Smtp-Source: APXvYqwlfoIno3S/B2htNux1968s1GQP6non+dEg8pZm5s9FL84u+wQfb2dTijyKtPR0oV2nnODT7g==
X-Received: by 2002:a17:902:9a84:: with SMTP id w4mr92778802plp.241.1560495775662;
        Fri, 14 Jun 2019 00:02:55 -0700 (PDT)
Received: from lianwei-NUC8i7BEH.hsd1.ca.comcast.net ([2601:647:4b03:4fd0:b96d:8277:77c0:26e5])
        by smtp.gmail.com with ESMTPSA id l38sm1690930pje.12.2019.06.14.00.02.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 00:02:54 -0700 (PDT)
From:   Lianwei Wang <lianwei.wang@gmail.com>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        lianwei.wang@gmail.com
Subject: [PATCH] usb: gadget: avoid using gadget after freed
Date:   Fri, 14 Jun 2019 00:02:43 -0700
Message-Id: <20190614070243.31565-1-lianwei.wang@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The udc and gadget device will be deleted when udc device is
disconnected and the related function will be unbind with it.

But if the configfs is not deleted, then the function object
will be kept and the bound status is kept true.

Then after udc device is connected again and a new udc and
gadget objects will be created and passed to bind interface.
But because the bound is still true, the new gadget is not
updated to netdev and a previous freed gadget will be used
in netdev after bind.

To fix this using after freed issue, always set the gadget
object to netdev in bind interface.

Signed-off-by: Lianwei Wang <lianwei.wang@gmail.com>
---
 drivers/usb/gadget/function/f_ecm.c    | 10 ++++++----
 drivers/usb/gadget/function/f_eem.c    | 10 ++++++----
 drivers/usb/gadget/function/f_ncm.c    | 11 +++++++----
 drivers/usb/gadget/function/f_phonet.c |  2 +-
 drivers/usb/gadget/function/f_rndis.c  |  2 +-
 drivers/usb/gadget/function/f_subset.c | 10 ++++++----
 6 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 6ce044008cf6..ff39b7eafec7 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -695,15 +695,17 @@ ecm_bind(struct usb_configuration *c, struct usb_function *f)
 	 * with list_for_each_entry, so we assume no race condition
 	 * with regard to ecm_opts->bound access
 	 */
+	mutex_lock(&ecm_opts->lock);
+	gether_set_gadget(ecm_opts->net, cdev->gadget);
 	if (!ecm_opts->bound) {
-		mutex_lock(&ecm_opts->lock);
-		gether_set_gadget(ecm_opts->net, cdev->gadget);
 		status = gether_register_netdev(ecm_opts->net);
-		mutex_unlock(&ecm_opts->lock);
-		if (status)
+		if (status) {
+			mutex_unlock(&ecm_opts->lock);
 			return status;
+		}
 		ecm_opts->bound = true;
 	}
+	mutex_unlock(&ecm_opts->lock);
 
 	ecm_string_defs[1].s = ecm->ethaddr;
 
diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/function/f_eem.c
index c13befa31110..589862dfe1e7 100644
--- a/drivers/usb/gadget/function/f_eem.c
+++ b/drivers/usb/gadget/function/f_eem.c
@@ -256,15 +256,17 @@ static int eem_bind(struct usb_configuration *c, struct usb_function *f)
 	 * with list_for_each_entry, so we assume no race condition
 	 * with regard to eem_opts->bound access
 	 */
+	mutex_lock(&eem_opts->lock);
+	gether_set_gadget(eem_opts->net, cdev->gadget);
 	if (!eem_opts->bound) {
-		mutex_lock(&eem_opts->lock);
-		gether_set_gadget(eem_opts->net, cdev->gadget);
 		status = gether_register_netdev(eem_opts->net);
-		mutex_unlock(&eem_opts->lock);
-		if (status)
+		if (status) {
+			mutex_unlock(&eem_opts->lock);
 			return status;
+		}
 		eem_opts->bound = true;
 	}
+	mutex_unlock(&eem_opts->lock);
 
 	us = usb_gstrings_attach(cdev, eem_strings,
 				 ARRAY_SIZE(eem_string_defs));
diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 2d6e76e4cffa..951867e230c2 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1409,15 +1409,18 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	 * with list_for_each_entry, so we assume no race condition
 	 * with regard to ncm_opts->bound access
 	 */
+	mutex_lock(&ncm_opts->lock);
+	gether_set_gadget(ncm_opts->net, cdev->gadget);
 	if (!ncm_opts->bound) {
-		mutex_lock(&ncm_opts->lock);
-		gether_set_gadget(ncm_opts->net, cdev->gadget);
 		status = gether_register_netdev(ncm_opts->net);
-		mutex_unlock(&ncm_opts->lock);
-		if (status)
+		if (status) {
+			mutex_unlock(&ncm_opts->lock);
 			goto fail;
+		}
 		ncm_opts->bound = true;
 	}
+	mutex_unlock(&ncm_opts->lock);
+
 	us = usb_gstrings_attach(cdev, ncm_strings,
 				 ARRAY_SIZE(ncm_string_defs));
 	if (IS_ERR(us)) {
diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
index 8b72b192c747..e93c5cf95494 100644
--- a/drivers/usb/gadget/function/f_phonet.c
+++ b/drivers/usb/gadget/function/f_phonet.c
@@ -494,8 +494,8 @@ static int pn_bind(struct usb_configuration *c, struct usb_function *f)
 	 * with list_for_each_entry, so we assume no race condition
 	 * with regard to phonet_opts->bound access
 	 */
+	gphonet_set_gadget(phonet_opts->net, gadget);
 	if (!phonet_opts->bound) {
-		gphonet_set_gadget(phonet_opts->net, gadget);
 		status = gphonet_register_netdev(phonet_opts->net);
 		if (status)
 			return status;
diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index d48df36622b7..f7e59b482d55 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -698,8 +698,8 @@ rndis_bind(struct usb_configuration *c, struct usb_function *f)
 	 * with list_for_each_entry, so we assume no race condition
 	 * with regard to rndis_opts->bound access
 	 */
+	gether_set_gadget(rndis_opts->net, cdev->gadget);
 	if (!rndis_opts->bound) {
-		gether_set_gadget(rndis_opts->net, cdev->gadget);
 		status = gether_register_netdev(rndis_opts->net);
 		if (status)
 			goto fail;
diff --git a/drivers/usb/gadget/function/f_subset.c b/drivers/usb/gadget/function/f_subset.c
index 4d945254905d..878c0eb9efbd 100644
--- a/drivers/usb/gadget/function/f_subset.c
+++ b/drivers/usb/gadget/function/f_subset.c
@@ -308,15 +308,17 @@ geth_bind(struct usb_configuration *c, struct usb_function *f)
 	 * with list_for_each_entry, so we assume no race condition
 	 * with regard to gether_opts->bound access
 	 */
+	mutex_lock(&gether_opts->lock);
+	gether_set_gadget(gether_opts->net, cdev->gadget);
 	if (!gether_opts->bound) {
-		mutex_lock(&gether_opts->lock);
-		gether_set_gadget(gether_opts->net, cdev->gadget);
 		status = gether_register_netdev(gether_opts->net);
-		mutex_unlock(&gether_opts->lock);
-		if (status)
+		if (status) {
+			mutex_unlock(&gether_opts->lock);
 			return status;
+		}
 		gether_opts->bound = true;
 	}
+	mutex_unlock(&gether_opts->lock);
 
 	us = usb_gstrings_attach(cdev, geth_strings,
 				 ARRAY_SIZE(geth_string_defs));
-- 
2.17.1

