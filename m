Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12F9475A3E7
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jul 2023 03:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjGTB20 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jul 2023 21:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbjGTB2Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jul 2023 21:28:25 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B22A268B
        for <linux-usb@vger.kernel.org>; Wed, 19 Jul 2023 18:28:18 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3a3a8d21208so221201b6e.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Jul 2023 18:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689816498; x=1692408498;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUkfiN21zhhBT9MAHR3YtMD392fgTaVEL9uuVpEhQmY=;
        b=JW9VcMLH6nEozSg5EXGTjf1Kv3CzPMeTXxwYPnfokdAhegsktdMXOXyYjhOPttl4fp
         L80dYKXp7cCGqmzW5fYdVLGUN8/GQ1uVm+N2Tuzammuuaq9z6xVp8AeCYTWG8TqT2tUI
         ypmZC4Hg/bh7kIR3fX/VQuV6GtiEMIHeyfLTivnkU4JvUqoCfKQAppwggD1uVUYZanui
         lV4uBY6DL9BCjx4Ly9Y5Kjz6Wdyo9xWA+r9D+SfwPvDDHB5lYFyTJehmTWuwUDS3E+u0
         hOC7pr1BLWCPgvDLv42rEEkIQafq4ovS7x7WUs5p3heG7bmkVDpjioJYCp8v8AHDiSCg
         lpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689816498; x=1692408498;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DUkfiN21zhhBT9MAHR3YtMD392fgTaVEL9uuVpEhQmY=;
        b=UM3oH2TTrS583QLOA99IK9Koi5F/VQZ7R1cgtH2tROqDYR20al/nNU9T3KnuqAG3QJ
         6HqtuWE3ee/z/mN5ks9p43txNAC7RUGRNxpp0WzBgbyAXC9M83u0nOfZSKFC9nHBcBlI
         2GP2yMLqAhMfEGV20q7O2aWasBeJ/evnuTPM4y7qP3epU73WGDLrcSeQN9RVBaEKVeXz
         IbnbZc8uNxO+BApPmB8n3Crbu90k7aSZ7o20HPdVLlwZehjyG0x0XmBpuwYGA8jWQ4Zs
         ECtUS6yDfs/ZiwTA7pEabiN8lKmhvU0JApKkSVnxejHRv1AKlybIDX2/YIbNF1JBwLU2
         Fl2Q==
X-Gm-Message-State: ABy/qLZI+K24sh3kuaVm2Ci1Z7usx2dg8qnI4ebpifz8KuSGUq45I98a
        MHLdFB0A/+RyB2gOzPcLWNj9iw==
X-Google-Smtp-Source: APBJJlG0eaRwUd8UStxSK6SNQKB1hUZ9kFvA3gj6/oTmRskHbUk/JH3lwcWs7glun16kQ3HT8hahaA==
X-Received: by 2002:a05:6808:1210:b0:3a1:df16:2eed with SMTP id a16-20020a056808121000b003a1df162eedmr218432oil.30.1689816497616;
        Wed, 19 Jul 2023 18:28:17 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id u71-20020a63794a000000b00551df489590sm4148430pgc.12.2023.07.19.18.28.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 18:28:17 -0700 (PDT)
Message-ID: <4d7aa3f4-22d9-9f5a-3d70-1bd7148ff4ba@google.com>
Date:   Wed, 19 Jul 2023 18:28:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From:   Avichal Rakesh <arakesh@google.com>
Subject: Kernel panic when unbinding UVC gadget function
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey all,

I recently ran into a kernel panic when testing the UVC Gadget Driver.
The device ramdumps with the following stack when removing the UVC config from
configfs:

KP: Oops - BUG: Fatal exception: comm:Thread-6 PC:__list_del_entry_valid+0xb0/0xc4 LR:__list_del_entry_valid+0xb0/0xc4
PC: __list_del_entry_valid+0xb0 <FFFFFFE685330294>
LR: __list_del_entry_valid+0xb0 <FFFFFFE685330294>

[<FFFFFFE685330294>] __list_del_entry_valid+0xb0
[<FFFFFFE6857E50AC>] v4l2_fh_del+0x78
[<FFFFFFE685769774>] uvc_v4l2_release+0xd0
[<FFFFFFE6857D9B10>] v4l2_release+0xcc
[<FFFFFFE684EE192C>] __fput+0xf8
[<FFFFFFE684EE17CC>] ____fput+0xc
[<FFFFFFE684B5C9E0>] task_work_run+0x138

This looks like a side effect of
https://lore.kernel.org/lkml/20230608204517.105396-1-badhri@google.com/.
Effectively, UVC function tried to disconnect the gadget before 
cleaning up resources. However, usb_gadget_unregister_driver which is 
removing the function prevents the gadget from disconnecting until the 
function is unbound.

As of the patch mentioned above, gadget_unbind_driver holds
udc->connect_lock and calls both usb_gadget_disconnect_locked and
udc->driver->unbind one after the other.

usb_gadget_disconnect_locked calls into UVC Gadget driver as follows:

1. usb_gadget_disconnect_locked
2. configfs_composite_disconnect
3. __composite_disconnect
4. uvc_function_disable

udc->driver->unbind calls into UVC Gadget driver as follows:

1. udc->driver->unbind
2. configfs_composite_unbind
3. purge_configs_funcs
4. uvc_function_unbind

uvc_function_disable notifies the userspace application with
UVC_EVENT_DISCONNECTED which causes the V4L2 node to be released
(or unsubscribed to). Either on unsubscribe or on release, the UVC Gadget
Driver calls uvc_function_disconnect before cleaning up resources. Following
is the problematic stack from uvc_v4l2_disable.

1. uvc_v4l2_disable
2. uvc_function_disconnect
3. usb_function_deactivate
4. usb_gadget_deactivate

usb_gadget_deactivate attempts to lock udc->connect_lock as of the patch
mentioned above.

This means that attempting to unregister the UVC Gadget Driver results in the
V4L2 resource cleanup being stuck behind udc->connect_lock, which will only
be released after uvc_function_unbind finishes. This results in either the
gadget deactivating after the unbind process has finished, or in a Kernel Panic
as it tries to cleanup a V4L2 node that has been purged.

This leaves us with two options:
1. We "fix" the locking in core.c to restore old behavior, and let the
   usb_gadget_deactivate call go through without locking. However,
   I am not sure about the specifics of the patch were and what exact issue it
   was trying to fix. 

   Badhri, would you know if relaxing the constraints on 
   usb_gadget_deactivate is feasible? It is possible that other gadget drivers
   run into similar issues as UVC driver.

3. UVC Gadget Driver calls usb_function_deactivate to take down the gadget if
   the userspace application stops listening to the V4L2 node. However, AFAICT
   disable is called as a part of the gadget resetting. So, if the V4L2 node 
   is released because of UVC_EVENT_DISCONNECT, we can skip calling 
   usb_function_deactivate as the gadget will be reset anyway.

   usb_function documentation seems to agree that if 'disable' is called,
   the gadget will be reset/reconfigured shortly:

     @disable: (REQUIRED) Indicates the function should be disabled.  Reasons
      *	  include host resetting or reconfiguring the gadget, and disconnection.

A dirty Patch for option 2 is attached below which skips calling 
usb_function_deactivate if uvc_function_disable was called before. It seems 
to work okay in testing. Let me know if the analysis and solutions seems okay
and I can upload a formal patch.

Thank you!

---
 drivers/usb/gadget/function/f_uvc.c | 12 ++++++++++--
 drivers/usb/gadget/function/uvc.h   |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index 5e919fb65833..cef92243f1f7 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -385,7 +385,7 @@ uvc_function_disable(struct usb_function *f)
 	v4l2_event.type = UVC_EVENT_DISCONNECT;
 	v4l2_event_queue(&uvc->vdev, &v4l2_event);
 
-	uvc->state = UVC_STATE_DISCONNECTED;
+	uvc->state = UVC_STATE_HOST_DISCONNECTED;
 
 	usb_ep_disable(uvc->video.ep);
 	if (uvc->enable_interrupt_ep)
@@ -410,8 +410,16 @@ uvc_function_disconnect(struct uvc_device *uvc)
 {
 	int ret;
 
-	if ((ret = usb_function_deactivate(&uvc->func)) < 0)
+	if (uvc->state == UVC_STATE_HOST_DISCONNECTED) {
+		/*
+		 * Don't deactivate gadget as this is being called in
+		 * response to the host resetting. Gadget will be deactivated
+		 * anyway. Just update to state as acknowledgement
+		 */
+		uvc->state = UVC_STATE_DISCONNECTED;
+	} else if ((ret = usb_function_deactivate(&uvc->func)) < 0) {
 		uvcg_info(&uvc->func, "UVC disconnect failed with %d\n", ret);
+	}
 }
 
 /* --------------------------------------------------------------------------
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 100475b1363e..f1e2bc98dc61 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -120,6 +120,7 @@ struct uvc_video {
 };
 
 enum uvc_state {
+	UVC_STATE_HOST_DISCONNECTED,
 	UVC_STATE_DISCONNECTED,
 	UVC_STATE_CONNECTED,
 	UVC_STATE_STREAMING,
-- 
