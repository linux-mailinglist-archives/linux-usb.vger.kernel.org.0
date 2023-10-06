Return-Path: <linux-usb+bounces-1218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AA27BC1F9
	for <lists+linux-usb@lfdr.de>; Sat,  7 Oct 2023 00:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 591F41C20A71
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 22:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B980B450D2;
	Fri,  6 Oct 2023 22:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eNqRA0lf"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A3C44495
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 22:04:01 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 868CCBE
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 15:03:59 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c5bf7871dcso21966705ad.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Oct 2023 15:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696629839; x=1697234639; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Zqb9rInKuV6QXAkgifHkmoy9InDEpfuudlZw9lqoTk=;
        b=eNqRA0lfcnnUCc07BkddadhIibLQx3o1V7jI2c+ErrWddrJQU9sTu4aWdCDEvdBNVL
         I5VMTLMW8xrCHqe5GEx7J/74mYE6xTJ0svV7nKOmUPqXZ0q+NCT5Hl/pT6si1RB6JR+6
         0St/ITV5L829LOzkwB0xkSxAqis3O9Ta8qN9HIDSPPHwtzJ0mB5XhpDcqKmCr4OhmxZM
         sYWPQ35oBOk1q7w/CNM+y9axpfOrRkKcDTDxwTytbPEXph+JOMjWUmKevgCXQ1gz9uGf
         FyCQMev7pj0dLoDK0dts0ngWFKvR5WfUBAMrJbi656oNg1I4+9CY/nbHZkFqZPjbDQ6r
         F+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696629839; x=1697234639;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Zqb9rInKuV6QXAkgifHkmoy9InDEpfuudlZw9lqoTk=;
        b=hQpz/dudkOI2+DAKkHabjrlSEXVuTk0NuTdXvNwjVWAPau422WcHoonMlQQ25u3SMW
         epgx4mHHVNi04KLyGsgX+JmQ2lBpjkj2JjUqAQgj/1jzPOBM/4b3zh3ehTuOnJjLvB2h
         USjbIeWjHtILECxtwejhM+2Iad0DT2IhprMGB2fTigFgq6Q5gWqJKNmzAEjvbTKbofKq
         QA9djd9bBeOn9cygHHuOv+8imX8r9H2Rhp6Cfo6jS+T1mFpzxomfAuwT4thSgJqWkx+R
         FyFLlB1KrQNr5MshBJqJChLfaDYfY2nAT0Jx7+S4sI2j/DewRjhQli/61txwAbTQhG5p
         PvXQ==
X-Gm-Message-State: AOJu0Yy+iXG0j0fWjiT3+oI4PitXBflAcjIEk2lUvqRZxhmxi2mZtUG2
	SkCeiIn8il1/F7Y1rLloCarx4Oev2RutoMon0WA9Ugad
X-Google-Smtp-Source: AGHT+IEJ4wROkS9R5skSyhK4e1Ke/JVxOiXaO0LQ4MvfuWkOmBTwsYBfUpojxBRFPgnH/qYydQRcXQ==
X-Received: by 2002:a17:902:c40e:b0:1c8:7bb7:dca4 with SMTP id k14-20020a170902c40e00b001c87bb7dca4mr9532507plk.64.1696629838746;
        Fri, 06 Oct 2023 15:03:58 -0700 (PDT)
Received: from ?IPV6:2601:645:8100:1350:8ad9:2d1e:e5e7:4eaf? ([2601:645:8100:1350:8ad9:2d1e:e5e7:4eaf])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902b61000b001c728609574sm4428270pls.6.2023.10.06.15.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 15:03:58 -0700 (PDT)
Message-ID: <edad1597-48da-49d2-a089-da2487cac889@google.com>
Date: Fri, 6 Oct 2023 15:03:56 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: gregkh@linuxfoundation.org, corbet@lwn.net,
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
 kieran.bingham@ideasonboard.com, linux-usb@vger.kernel.org,
 inux-doc@vger.kernel.org
Cc: etalvala@google.com, arakesh@google.com
From: Jayant Chowdhary <jchowdhary@google.com>
Subject: uvc gadget: Making upper bound of number of usb requests allocated
 configurable through configfs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Everyone,

We had been seeing the UVC gadget driver receive isoc errors while
sending packets to the usb endpoint - resulting in glitches being shown
on linux hosts. My colleague Avichal Rakesh and others had a very
enlightening discussion at
https://lore.kernel.org/linux-usb/8741b7cb-54ec-410b-caf5-697f81e8ad64@google.com/T/ 


The conclusion that we came to was : usb requests with actual uvc frame
data were missing their scheduled uframes in the usb controller. As a
mitigation, we started sending 0 length usb requests when there was no
uvc frame buffer available to get data from. Even with this mitigation,
we are seeing glitches - albeit at a lower frequency.

After some investigation, it is seen that we’re getting isoc errors when
the worker thread serving video_pump() work items, doesn’t get scheduled
for longer periods of time - than usual - in most cases > 6ms.
This is close enough to the 8ms limit that we have when the number of usb
requests in the queue is 64 (since we have a 125us uframe period). In order
to tolerate the scheduling delays better, it helps to increase the 
number of
usb requests in the queue . In that case, we have more 0 length requests
given to the udc driver - and as a result we can wait longer for uvc
frames with valid data to get processed by video_pump(). I’m attaching a
patch which lets one configure the upper bound on the number of usb
requests allocated through configfs. Please let me know your thoughts.
I can formalize  the patch if it looks okay.

Thank you

Jayant

---
  .../ABI/testing/configfs-usb-gadget-uvc       |  2 ++
  Documentation/usb/gadget-testing.rst          | 21 ++++++++++++-------
  drivers/usb/gadget/function/f_uvc.c           |  4 +++-
  drivers/usb/gadget/function/u_uvc.h           |  1 +
  drivers/usb/gadget/function/uvc.h             |  3 +++
  drivers/usb/gadget/function/uvc_configfs.c    |  2 ++
  drivers/usb/gadget/function/uvc_queue.c       |  5 ++++-
  7 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc 
b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index 4feb692c4c1d..9bc58440e1b7 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -7,6 +7,8 @@ Description:    UVC function directory
          streaming_maxburst    0..15 (ss only)
          streaming_maxpacket    1..1023 (fs), 1..3072 (hs/ss)
          streaming_interval    1..16
+         streaming_max_usb_requests 64..256
+
          function_name        string [32]
          ===================    =============================

diff --git a/Documentation/usb/gadget-testing.rst 
b/Documentation/usb/gadget-testing.rst
index 29072c166d23..24a62ba8e870 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -790,14 +790,19 @@ Function-specific configfs interface
  The function name to use when creating the function directory is "uvc".
  The uvc function provides these attributes in its function directory:

-    =================== ================================================
-    streaming_interval  interval for polling endpoint for data transfers
-    streaming_maxburst  bMaxBurst for super speed companion descriptor
-    streaming_maxpacket maximum packet size this endpoint is capable of
-                sending or receiving when this configuration is
-                selected
-    function_name       name of the interface
-    =================== ================================================
+    =================== ===========================================
+    streaming_interval         interval for polling endpoint for data
+                    transfers
+    streaming_maxburst          bMaxBurst for super speed companion
+                    descriptor
+    streaming_maxpacket         maximum packet size this endpoint is
+                    capable of sending or receiving when
+                    this configuration is selected
+        streaming_max_usb_requests  upper bound for the number of usb 
requests
+                        the gadget driver will allocate for
+                    sending to the endpoint.
+    function_name            name of the interface
+    =================== ==================================================

  There are also "control" and "streaming" subdirectories, each of which 
contain
  a number of their subdirectories. There are some sane defaults 
provided, but
diff --git a/drivers/usb/gadget/function/f_uvc.c 
b/drivers/usb/gadget/function/f_uvc.c
index faa398109431..32a296ea37d7 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -659,7 +659,8 @@ uvc_function_bind(struct usb_configuration *c, 
struct usb_function *f)
      opts->streaming_interval = clamp(opts->streaming_interval, 1U, 16U);
      opts->streaming_maxpacket = clamp(opts->streaming_maxpacket, 1U, 
3072U);
      opts->streaming_maxburst = min(opts->streaming_maxburst, 15U);
-
+    opts->streaming_max_usb_requests = 
clamp(opts->streaming_max_usb_requests, 64U, 256U);
+    uvc->streaming_max_usb_requests = opts->streaming_max_usb_requests;
      /* For SS, wMaxPacketSize has to be 1024 if bMaxBurst is not 0 */
      if (opts->streaming_maxburst &&
          (opts->streaming_maxpacket % 1024) != 0) {
@@ -934,6 +935,7 @@ static struct usb_function_instance 
*uvc_alloc_inst(void)

      opts->streaming_interval = 1;
      opts->streaming_maxpacket = 1024;
+    opts->streaming_max_usb_requests = 64;
      snprintf(opts->function_name, sizeof(opts->function_name), "UVC 
Camera");

      ret = uvcg_attach_configfs(opts);
diff --git a/drivers/usb/gadget/function/u_uvc.h 
b/drivers/usb/gadget/function/u_uvc.h
index 1ce58f61253c..075fee178418 100644
--- a/drivers/usb/gadget/function/u_uvc.h
+++ b/drivers/usb/gadget/function/u_uvc.h
@@ -24,6 +24,7 @@ struct f_uvc_opts {
      unsigned int                    streaming_interval;
      unsigned int                    streaming_maxpacket;
      unsigned int                    streaming_maxburst;
+    unsigned int                    streaming_max_usb_requests;

      unsigned int                    control_interface;
      unsigned int                    streaming_interface;
diff --git a/drivers/usb/gadget/function/uvc.h 
b/drivers/usb/gadget/function/uvc.h
index 6751de8b63ad..943c074157fa 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -157,6 +157,9 @@ struct uvc_device {
      /* Events */
      unsigned int event_length;
      unsigned int event_setup_out : 1;
+
+    /* Max number of usb requests allocated to send to the ep*/
+    unsigned int streaming_max_usb_requests;
  };

  static inline struct uvc_device *to_uvc(struct usb_function *f)
diff --git a/drivers/usb/gadget/function/uvc_configfs.c 
b/drivers/usb/gadget/function/uvc_configfs.c
index 9bf0e985acfa..0ad9eae4845e 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -3403,6 +3403,7 @@ UVC_ATTR(f_uvc_opts_, cname, cname)
  UVCG_OPTS_ATTR(streaming_interval, streaming_interval, 16);
  UVCG_OPTS_ATTR(streaming_maxpacket, streaming_maxpacket, 3072);
  UVCG_OPTS_ATTR(streaming_maxburst, streaming_maxburst, 15);
+UVCG_OPTS_ATTR(streaming_max_usb_requests, streaming_max_usb_requests, 
256);

  #undef UVCG_OPTS_ATTR

@@ -3453,6 +3454,7 @@ static struct configfs_attribute *uvc_attrs[] = {
      &f_uvc_opts_attr_streaming_maxpacket,
      &f_uvc_opts_attr_streaming_maxburst,
      &f_uvc_opts_string_attr_function_name,
+    &f_uvc_opts_attr_streaming_max_usb_requests,
      NULL,
  };

diff --git a/drivers/usb/gadget/function/uvc_queue.c 
b/drivers/usb/gadget/function/uvc_queue.c
index 0aa3d7e1f3cc..b81c2d8e5ef2 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -45,6 +45,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
      struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
      struct uvc_video *video = container_of(queue, struct uvc_video, 
queue);
      unsigned int req_size;
+    unsigned int max_usb_requests;
      unsigned int nreq;

      if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
@@ -54,6 +55,8 @@ static int uvc_queue_setup(struct vb2_queue *vq,

      sizes[0] = video->imagesize;

+    max_usb_requests = video->uvc->streaming_max_usb_requests;
+
      req_size = video->ep->maxpacket
           * max_t(unsigned int, video->ep->maxburst, 1)
           * (video->ep->mult);
@@ -62,7 +65,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
       * into fewer requests for smaller framesizes.
       */
      nreq = DIV_ROUND_UP(DIV_ROUND_UP(sizes[0], 2), req_size);
-    nreq = clamp(nreq, 4U, 64U);
+    nreq = clamp(nreq, 4U, max_usb_requests);
      video->uvc_num_requests = nreq;

      return 0;
-- 
2.42.0.609.gbb76f46606-goog


