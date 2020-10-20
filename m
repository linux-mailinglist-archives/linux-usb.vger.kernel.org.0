Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F77028B379
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 13:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387977AbgJLLK6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Oct 2020 07:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387950AbgJLLK5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Oct 2020 07:10:57 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5560C0613CE
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 04:10:55 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id 9so12232615pfj.22
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=AdXSChuBCoeO2dKMFspLIEyl0QdVGWJK0RzSSOeSwNk=;
        b=aAt6TeXq5DS1YwMEtoAhJiwvTBOiP98FQbSunrRwcexKy7jQnn8LzSrsjLGlyrWPX/
         BFS4D2AuX/fgQmICKuCUTpOBAEzWzHJ+mCs2HVgNRpvhENFL2E7adfUsPGvqSXxM7Fxc
         kcjObpmu/gNimZTTWMeNXPvS09/FtrwcDTYZ34olx4lkdT8fFh1CMdXk2t3FV8d2fD8a
         DWj+Yj5TLVIr9q+n83jGxNUNkozNP7l6jSNQFDhLwC92OyqmVxpGy8t2ANx2T5meeAHv
         VDEH6RwJ9mI5Pcqg+MXmyV5RNqBjy0PDV8V0YStc5/2h4+nC7QNOg+mk88Q9GXg5EcMg
         5AHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=AdXSChuBCoeO2dKMFspLIEyl0QdVGWJK0RzSSOeSwNk=;
        b=RDbYRUhe10oZDKC+2r87Cln8cVSeXOhz4Bth4ccbwmS5DvyJbypMrXSK0SjfTisEWo
         0GIHCkTEdBvalF/WbQqlYQhZ0MIRJYQs7gi/ELdtLvCQZrLruKZ6RXExniTUbXcd53zE
         OFB8+sAE56r5lcaXYImgXXA60nuQCEwU73k0v26I4PLTrIEFzSbDDSKXtOCq192MG5+a
         ixsvm/ZzM7WG7ZzMIePZUgf0317ZA2+lGSe2LpOzTVCOZhdk7c8G2WL3FGcaU8gOmiAo
         k7H/xhr2CiDXVM+hpxtcsUCfdJhyqT4wRh3y5ZV17lJmCA1wqzrQKILNgv2SCMkJuAkW
         RknA==
X-Gm-Message-State: AOAM530oyd9l+qP17xJOpS87g0087ezbDkNoJDaA+DGQiVkCFVxdGT42
        uT8/Yox4w7EGbBzjHlfQRf24wlst7h1gBg==
X-Google-Smtp-Source: ABdhPJxPK9nCyOvkoyu0FY5WY8X8PEkzqX/q56dF67H3d8kE+dbq2Z9vlghQn0cxUknHQWFl0BHz6iOoJCrL/Q==
Sender: "rickyniu via sendgmr" <rickyniu@rickyniu.ntc.corp.google.com>
X-Received: from rickyniu.ntc.corp.google.com ([2401:fa00:fc:1:3e52:82ff:fe5e:efef])
 (user=rickyniu job=sendgmr) by 2002:a17:90b:204:: with SMTP id
 fy4mr20818165pjb.156.1602501055335; Mon, 12 Oct 2020 04:10:55 -0700 (PDT)
Date:   Mon, 12 Oct 2020 19:10:24 +0800
In-Reply-To: <20201012111024.2259162-1-rickyniu@google.com>
Message-Id: <20201012111024.2259162-4-rickyniu@google.com>
Mime-Version: 1.0
References: <20201012111024.2259162-1-rickyniu@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH 3/3] ANDROID: usb: f_accessory: send uevent for 51,52 requests
From:   rickyniu <rickyniu@google.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, astrachan@google.com,
        rickyniu@google.com, amit.pundir@linaro.org, lockwood@android.com,
        benoit@android.com, jackp@codeaurora.org, vvreddy@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        kyletso@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add more log between accessory device and host to help debug.
Send the uevent when the host gets ctrl_request 51 and 52 to user space.
Let user space know the current connect status.

Signed-off-by: rickyniu <rickyniu@google.com>
---
 drivers/usb/gadget/function/f_accessory.c | 30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/usb/gadget/function/f_accessory.c b/drivers/usb/gadget/function/f_accessory.c
index 5ed80940b9bf..e51cab9246f9 100644
--- a/drivers/usb/gadget/function/f_accessory.c
+++ b/drivers/usb/gadget/function/f_accessory.c
@@ -117,6 +117,12 @@ struct acc_dev {
 	/* delayed work for handling ACCESSORY_START */
 	struct delayed_work start_work;
 
+	/* work for handling ACCESSORY GET PROTOCOL */
+	struct work_struct getprotocol_work;
+
+	/* work for handling ACCESSORY SEND STRING */
+	struct work_struct sendstring_work;
+
 	/* worker for registering and unregistering hid devices */
 	struct work_struct hid_work;
 
@@ -849,11 +855,16 @@ int acc_ctrlrequest(struct usb_composite_dev *cdev,
 	if (b_requestType == (USB_DIR_OUT | USB_TYPE_VENDOR)) {
 		if (b_request == ACCESSORY_START) {
 			dev->start_requested = 1;
+			dev_info(&cdev->gadget->dev, "%s: got ACCESSORY_START(53) request\n",
+				__func__);
 			schedule_delayed_work(
 				&dev->start_work, msecs_to_jiffies(10));
 			value = 0;
 			cdev->req->complete = acc_complete_setup_noop;
 		} else if (b_request == ACCESSORY_SEND_STRING) {
+			dev_info(&cdev->gadget->dev, "%s: got ACCESSORY_SEND_STRING(52) request\n",
+				__func__);
+			schedule_work(&dev->sendstring_work);
 			dev->string_index = w_index;
 			cdev->gadget->ep0->driver_data = dev;
 			cdev->req->complete = acc_complete_set_string;
@@ -900,6 +911,9 @@ int acc_ctrlrequest(struct usb_composite_dev *cdev,
 		}
 	} else if (b_requestType == (USB_DIR_IN | USB_TYPE_VENDOR)) {
 		if (b_request == ACCESSORY_GET_PROTOCOL) {
+			dev_info(&cdev->gadget->dev, "%s: got ACCESSORY_GET_PROTOCOL(51) request\n",
+				__func__);
+			schedule_work(&dev->getprotocol_work);
 			*((u16 *)cdev->req->buf) = PROTOCOL_VERSION;
 			value = sizeof(u16);
 			cdev->req->complete = acc_complete_setup_noop;
@@ -1047,6 +1061,20 @@ acc_function_unbind(struct usb_configuration *c, struct usb_function *f)
 	acc_hid_unbind(dev);
 }
 
+static void acc_getprotocol_work(struct work_struct *data)
+{
+	char *envp[2] = { "ACCESSORY=GETPROTOCOL", NULL };
+
+	kobject_uevent_env(&acc_device.this_device->kobj, KOBJ_CHANGE, envp);
+}
+
+static void acc_sendstring_work(struct work_struct *data)
+{
+	char *envp[2] = { "ACCESSORY=SENDSTRING", NULL };
+
+	kobject_uevent_env(&acc_device.this_device->kobj, KOBJ_CHANGE, envp);
+}
+
 static void acc_start_work(struct work_struct *data)
 {
 	char *envp[2] = { "ACCESSORY=START", NULL };
@@ -1213,6 +1241,8 @@ static int acc_setup(void)
 	INIT_LIST_HEAD(&dev->dead_hid_list);
 	INIT_DELAYED_WORK(&dev->start_work, acc_start_work);
 	INIT_WORK(&dev->hid_work, acc_hid_work);
+	INIT_WORK(&dev->getprotocol_work, acc_getprotocol_work);
+	INIT_WORK(&dev->sendstring_work, acc_sendstring_work);
 
 	/* _acc_dev must be set before calling usb_gadget_register_driver */
 	_acc_dev = dev;
-- 
2.28.0.1011.ga647a8990f-goog

