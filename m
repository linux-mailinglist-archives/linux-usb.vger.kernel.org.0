Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E18213EB9
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgGCRmP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgGCRmO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:14 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29741C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:14 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 17so34829939wmo.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xrkMNgFq6kjSqpaCA+XSVAlQbJi5HEny4uddp4894Fo=;
        b=wq2eX9jGfiXqkmXfLTj6mEEM2DpZg01ZXm7M/28lM017rbrQHv08Hx3W5hVLkdvmFs
         cvQdic5dr1Kq+Q9SQvJOlJ0Um9yIR+Y5uLRgIgCiIyPKB+8SrlN67FMkH9I8POq9Tl99
         +hMw+MdBOJx/zy0bvat2TNmCBkFSWbZmsToJ9vMSa5EOAXM8Car+SJkpsfivOXFgNdE/
         6OAuqi/2/eHEu3UadPeyfjssCvcTNhCKm7ljorj8hYXKdL8F5lln2bdGPwryANInysfn
         p6uUI7Z/tSUbPtLZ/HmaXeu93dZ6mryZK5EOYSHV/jxy8VcCQlvYpf7cgzBj9yLjwsAv
         LKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xrkMNgFq6kjSqpaCA+XSVAlQbJi5HEny4uddp4894Fo=;
        b=egOevl8YZesA9Ue5xLj6GPPe4KKH/swab7rC/mK9tOEwfAH+UnAIVEmWWjWbyUJW7V
         DMByuoG+BvPsvLHDiJ8XeJBY26iT3v3cSuvVdNypmfRhKys8xg1fzmz3uOXAI3TIQr+y
         1v63+xWKWzGcOwBrPbkhOQBoV+6Fec606IEWrqHZqO68KZtv4QseNcvBHytZ6e006Gs1
         Ezf79eduFQ3bzjTYy/LCyF3JEiXbRa3eeMw6Ra5jkd2RjZNmW0tkmMyL3Z7KXevu8uW2
         XQCayGOMaKfR+mKist0eS9//OIJBWfUTUEHDX6xhEFVH1xEljOE4Vl/XmX5lYJwM79iF
         PWig==
X-Gm-Message-State: AOAM5314qRHNqqTzspYeBmi57ISVZyxpkyFo0u91ioiUz+aQeRjmwlHJ
        ogoyWSddI+g8OFPr3lXgASwRbg==
X-Google-Smtp-Source: ABdhPJxF4+w/X3XbjJY6K8JuqOts4/0aCaGlb0DEvCdqQgBeAb0DrB1QpZ3cPKmGntf65MNAAWWkgQ==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr39858082wmc.56.1593798132797;
        Fri, 03 Jul 2020 10:42:12 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:12 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Peter Chen <Peter.Chen@nxp.com>
Subject: [PATCH 09/30] usb: chipidea: otg: Fix kerneldoc issues relating to description of 'ci'
Date:   Fri,  3 Jul 2020 18:41:27 +0100
Message-Id: <20200703174148.2749969-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Firstly we add some missing descriptions.  Then we fix some formatting
issues.  Kerneldoc expects arguments to be in the format '@.*: '.  If
either the '@' or ':' is omitted, kerneldoc gets confused.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/chipidea/otg.c:29: warning: Function parameter or member 'ci' not described in 'hw_read_otgsc'
 drivers/usb/chipidea/otg.c:82: warning: Function parameter or member 'ci' not described in 'hw_write_otgsc'
 drivers/usb/chipidea/otg.c:235: warning: Function parameter or member 'ci' not described in 'ci_hdrc_otg_init'
 drivers/usb/chipidea/otg.c:254: warning: Function parameter or member 'ci' not described in 'ci_hdrc_otg_destroy'

Cc: Peter Chen <Peter.Chen@nxp.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/chipidea/otg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
index be63924ea82ef..d3aada3ce7ec2 100644
--- a/drivers/usb/chipidea/otg.c
+++ b/drivers/usb/chipidea/otg.c
@@ -23,6 +23,7 @@
 
 /**
  * hw_read_otgsc returns otgsc register bits value.
+ * @ci: the controller
  * @mask: bitfield mask
  */
 u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
@@ -75,6 +76,7 @@ u32 hw_read_otgsc(struct ci_hdrc *ci, u32 mask)
 
 /**
  * hw_write_otgsc updates target bits of OTGSC register.
+ * @ci: the controller
  * @mask: bitfield mask
  * @data: to be written
  */
@@ -229,7 +231,7 @@ static void ci_otg_work(struct work_struct *work)
 
 /**
  * ci_hdrc_otg_init - initialize otg struct
- * ci: the controller
+ * @ci: the controller
  */
 int ci_hdrc_otg_init(struct ci_hdrc *ci)
 {
@@ -248,7 +250,7 @@ int ci_hdrc_otg_init(struct ci_hdrc *ci)
 
 /**
  * ci_hdrc_otg_destroy - destroy otg struct
- * ci: the controller
+ * @ci: the controller
  */
 void ci_hdrc_otg_destroy(struct ci_hdrc *ci)
 {
-- 
2.25.1

