Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5CE1C2E60
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 09:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbfJAHrD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 03:47:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49150 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbfJAHrD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Oct 2019 03:47:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AB6A161213; Tue,  1 Oct 2019 07:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569916021;
        bh=H2m3cmQLDoOmCaNbnBGCED/0upYwNSXpptaqJvqa4lE=;
        h=From:To:Cc:Subject:Date:From;
        b=T+NSzIPAr84r32gkXqPISSZrx8P7RJI1kkSSApQhzFfpNa0YNduSxD7E5J5KaSMX8
         0G1cvJ0/EAKDhsB9c4KYyF+Y+rGDPPMEMYhvOaPSOejc4Y+9CjoO98ml1hivExkz13
         X1Z5hw77p0wYrUE7t6BkBzeoBXsHEi/eL3A8MRPw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from cchiluve-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cchiluve@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0C196115A;
        Tue,  1 Oct 2019 07:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569916021;
        bh=H2m3cmQLDoOmCaNbnBGCED/0upYwNSXpptaqJvqa4lE=;
        h=From:To:Cc:Subject:Date:From;
        b=T+NSzIPAr84r32gkXqPISSZrx8P7RJI1kkSSApQhzFfpNa0YNduSxD7E5J5KaSMX8
         0G1cvJ0/EAKDhsB9c4KYyF+Y+rGDPPMEMYhvOaPSOejc4Y+9CjoO98ml1hivExkz13
         X1Z5hw77p0wYrUE7t6BkBzeoBXsHEi/eL3A8MRPw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0C196115A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cchiluve@codeaurora.org
From:   Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: [PATCH V3] usb: gadget: composite: Fix possible double free memory bug
Date:   Tue,  1 Oct 2019 13:16:48 +0530
Message-Id: <1569916008-3475-1-git-send-email-cchiluve@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

composite_dev_cleanup call from the failure of configfs_composite_bind
frees up the cdev->os_desc_req and cdev->req. If the previous calls of
bind and unbind is successful these will carry stale values.

Consider the below sequence of function calls:
configfs_composite_bind()
        composite_dev_prepare()
                - Allocate cdev->req, cdev->req->buf
        composite_os_desc_req_prepare()
                - Allocate cdev->os_desc_req, cdev->os_desc_req->buf
configfs_composite_unbind()
        composite_dev_cleanup()
                - free the cdev->os_desc_req->buf and cdev->req->buf
Next composition switch
configfs_composite_bind()
        - If it fails goto err_comp_cleanup will call the
	  composite_dev_cleanup() function
        composite_dev_cleanup()
	        - calls kfree up with the stale values of cdev->req->buf and
		  cdev->os_desc_req from the previous configfs_composite_bind
		  call. The free call on these stale values leads to double free.

Hence, Fix this issue by setting request and buffer pointer to NULL after
kfree.

Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
---

Changes in v3:
	-  As suggested by balbi, Removed changelog from commit text.
Changes in v2:
	- Modified commit text.

 drivers/usb/gadget/composite.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index b8a1584..992f1e2 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2155,14 +2155,18 @@ void composite_dev_cleanup(struct usb_composite_dev *cdev)
 			usb_ep_dequeue(cdev->gadget->ep0, cdev->os_desc_req);
 
 		kfree(cdev->os_desc_req->buf);
+		cdev->os_desc_req->buf = NULL;
 		usb_ep_free_request(cdev->gadget->ep0, cdev->os_desc_req);
+		cdev->os_desc_req = NULL;
 	}
 	if (cdev->req) {
 		if (cdev->setup_pending)
 			usb_ep_dequeue(cdev->gadget->ep0, cdev->req);
 
 		kfree(cdev->req->buf);
+		cdev->req->buf = NULL;
 		usb_ep_free_request(cdev->gadget->ep0, cdev->req);
+		cdev->req = NULL;
 	}
 	cdev->next_string_id = 0;
 	device_remove_file(&cdev->gadget->dev, &dev_attr_suspended);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

