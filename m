Return-Path: <linux-usb+bounces-1318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B25F7BEE5C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 00:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DD341C20CAD
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 22:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8BE20316;
	Mon,  9 Oct 2023 22:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ra4vIQ2u"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E001045F5A
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 22:34:17 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19DEDAF
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 15:34:15 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-69101d33315so3709138b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 09 Oct 2023 15:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696890854; x=1697495654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tgewq7HxOrzYIVfmLJe6dOwb6la+jYDUEt1sxOICqG4=;
        b=Ra4vIQ2u3vTn0n4UW5jLqzidME6WHXPR7H4NupvxS5hcnsdVIXi9s4xZyOUyjG4ipO
         HCfU+y+5QkJXrBmk3XVOh/aVq2Mvrwye5WnOb5fLnawJRULRj7jl9umQ3359I8Jg7ZWA
         9dC3ldI7ILyYu7ajR+A0+nXN/7WK5mtoVYBfEgJjl6hkVE9Yq3JrdxCwV/Y+lXTqkkju
         OT3qMNZ4iG8PTL3gF9nPr/ryeTNyWQdqH2lpL+sezP1XZ0WuxgZAjwF6+jzmZSkkdEbw
         5sfX0u08thrQ0qWoEANjIbs4u3S9IxFlJdf9Ibfwd+wiQsmeKAhCel6sqOYFdbbjkolU
         IeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696890854; x=1697495654;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgewq7HxOrzYIVfmLJe6dOwb6la+jYDUEt1sxOICqG4=;
        b=w1ewfbj3LO9CeyBkoV+gO5+yRKSN3YNVozZFFKg4l7Z9GLscNWA1V5q/It2Dh7jaPe
         rXZcK5yZCj0OZwoWcVpk9FEe1h3cYdxQowOaDiPaTNxnyR6Zj59P4x9jKpE29WhZCFr+
         MniSajlq5xOW2HbxwoStFnL57Ws3LWQutytK+nQoT3BtyL0xked6y5zBZ1PpFYh3ylUb
         oVF42/tJ6m8rTB8hOPQijNCOXv15ArUqmGxfapLJ+sicTgoVNftXwMOCFZkecIRdlUTV
         uAIjx9RUd8Kinx8/Xz1/IvEPAPJf1w+LXKx+uqyBoRd8LvC1k2B6Gw2lIoYd0f0TyMcW
         ZNBw==
X-Gm-Message-State: AOJu0YwMdKFhzFTWcKPVsRlcDKnZRurdKHD6av+3zRptr4xNkv1X0LZk
	+QivNUW95gyHFbFomQBu0Kh2xg==
X-Google-Smtp-Source: AGHT+IEzhSpeC0h4dn/4nRi9udN0UhKiGvWKnRWwjbwK/+dBhuiWW1SDhwSXGwuHN7l+lBuDXHcFnw==
X-Received: by 2002:a05:6a21:7897:b0:16b:8344:6167 with SMTP id bf23-20020a056a21789700b0016b83446167mr9807663pzc.45.1696890854319;
        Mon, 09 Oct 2023 15:34:14 -0700 (PDT)
Received: from ?IPV6:2601:645:8100:1350:8cf3:86d7:bffd:cf74? ([2601:645:8100:1350:8cf3:86d7:bffd:cf74])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b00690bd3c0723sm7084890pfd.99.2023.10.09.15.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 15:34:13 -0700 (PDT)
Message-ID: <7ed46b3c-bd42-468e-b28d-860dc8a6c7e6@google.com>
Date: Mon, 9 Oct 2023 15:34:12 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: uvc gadget: Making upper bound of number of usb requests
 allocated configurable through configfs
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>, corbet@lwn.net,
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
 kieran.bingham@ideasonboard.com
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 etalvala@google.com, arakesh@google.com
References: <edad1597-48da-49d2-a089-da2487cac889@google.com>
 <2023100834-statistic-richly-49ef@gregkh>
From: Jayant Chowdhary <jchowdhary@google.com>
In-Reply-To: <2023100834-statistic-richly-49ef@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> On Fri, Oct 06, 2023 at 03:03:56PM -0700, Jayant Chowdhary wrote:
>> Hi Everyone,
>>
>> We had been seeing the UVC gadget driver receive isoc errors while
>> sending packets to the usb endpoint - resulting in glitches being shown
>> on linux hosts. My colleague Avichal Rakesh and others had a very
>> enlightening discussion at
>> https://lore.kernel.org/linux-usb/8741b7cb-54ec-410b-caf5-697f81e8ad64@google.com/T/
>>
>>
>> The conclusion that we came to was : usb requests with actual uvc frame
>> data were missing their scheduled uframes in the usb controller. As a
>> mitigation, we started sending 0 length usb requests when there was no
>> uvc frame buffer available to get data from. Even with this mitigation,
>> we are seeing glitches - albeit at a lower frequency.
>>
>> After some investigation, it is seen that we’re getting isoc errors when
>> the worker thread serving video_pump() work items, doesn’t get scheduled
>> for longer periods of time - than usual - in most cases > 6ms.
>> This is close enough to the 8ms limit that we have when the number of usb
>> requests in the queue is 64 (since we have a 125us uframe period). In order
>> to tolerate the scheduling delays better, it helps to increase the number of
>> usb requests in the queue . In that case, we have more 0 length requests
>> given to the udc driver - and as a result we can wait longer for uvc
>> frames with valid data to get processed by video_pump(). I’m attaching a
>> patch which lets one configure the upper bound on the number of usb
>> requests allocated through configfs. Please let me know your thoughts.
>> I can formalize  the patch if it looks okay.
> Why do you want to limit the upper bound?  Why not just not submit so
> many requests from userspace as you control that, right?


Userspace negotiates a video frame rate (typically 30/60fps) with the host that does
not necessarily correspond to the ISOC cadence. After the
patch at https://lkml.org/lkml/diff/2023/5/8/1115/1 was submitted, we are
maintaining back pressure on the usb controller even if we do not have uvc frame
data, by sending the controller 0 length requests (as long as usb_requests are
available). Also, even if the userspace application were to somehow produce
data to match the ISOC rate, it would  need to have information about USB
timing details - which I am not sure is available to userspace or is the right
thing to do here ?

Here, we are trying to handle the scenario in which the video_pump() worker
thread does not get scheduled in time - by increasing the number of usb requests
allocated in the queue. This would send more usb requests to the usb controller,
when video_pump() does get scheduled - even if they're 0 length. This buys
the video_pump() worker thread scheduling time -since more usb requests
are with the controller, subsequent requests sent will not be 'stale' and
dropped by the usb controller.

>
>> Thank you
>>
>> Jayant
>>
>> ---
>>  .../ABI/testing/configfs-usb-gadget-uvc       |  2 ++
>>  Documentation/usb/gadget-testing.rst          | 21 ++++++++++++-------
>>  drivers/usb/gadget/function/f_uvc.c           |  4 +++-
>>  drivers/usb/gadget/function/u_uvc.h           |  1 +
>>  drivers/usb/gadget/function/uvc.h             |  3 +++
>>  drivers/usb/gadget/function/uvc_configfs.c    |  2 ++
>>  drivers/usb/gadget/function/uvc_queue.c       |  5 ++++-
>>  7 files changed, 28 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc
>> b/Documentation/ABI/testing/configfs-usb-gadget-uvc
>> index 4feb692c4c1d..9bc58440e1b7 100644
>> --- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
>> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
>> @@ -7,6 +7,8 @@ Description:    UVC function directory
>>          streaming_maxburst    0..15 (ss only)
>>          streaming_maxpacket    1..1023 (fs), 1..3072 (hs/ss)
>>          streaming_interval    1..16
>> +         streaming_max_usb_requests 64..256
>> +
>>          function_name        string [32]
>>          ===================    =============================
>>
>> diff --git a/Documentation/usb/gadget-testing.rst
>> b/Documentation/usb/gadget-testing.rst
>> index 29072c166d23..24a62ba8e870 100644
>> --- a/Documentation/usb/gadget-testing.rst
>> +++ b/Documentation/usb/gadget-testing.rst
>> @@ -790,14 +790,19 @@ Function-specific configfs interface
>>  The function name to use when creating the function directory is "uvc".
>>  The uvc function provides these attributes in its function directory:
>>
>> -    =================== ================================================
>> -    streaming_interval  interval for polling endpoint for data transfers
>> -    streaming_maxburst  bMaxBurst for super speed companion descriptor
>> -    streaming_maxpacket maximum packet size this endpoint is capable of
>> -                sending or receiving when this configuration is
>> -                selected
>> -    function_name       name of the interface
>> -    =================== ================================================
>> +    =================== ===========================================
>> +    streaming_interval         interval for polling endpoint for data
>> +                    transfers
>> +    streaming_maxburst          bMaxBurst for super speed companion
>> +                    descriptor
>> +    streaming_maxpacket         maximum packet size this endpoint is
>> +                    capable of sending or receiving when
>> +                    this configuration is selected
>> +        streaming_max_usb_requests  upper bound for the number of usb
>> requests
>> +                        the gadget driver will allocate for
>> +                    sending to the endpoint.
>> +    function_name            name of the interface
> Note, your patch is whitespace damaged and line-wrapped, making it
> really really hard to read and impossible to apply.


My apologies and thank you for your patience. I have attached the patch again
for discussion.
(Also fixed a mailing list typo I had made in the previous e-mail)

Thanks,
Jayant

---
 .../ABI/testing/configfs-usb-gadget-uvc       |  2 ++
 Documentation/usb/gadget-testing.rst          | 21 ++++++++++++-------
 drivers/usb/gadget/function/f_uvc.c           |  4 +++-
 drivers/usb/gadget/function/u_uvc.h           |  1 +
 drivers/usb/gadget/function/uvc.h             |  3 +++
 drivers/usb/gadget/function/uvc_configfs.c    |  2 ++
 drivers/usb/gadget/function/uvc_queue.c       |  5 ++++-
 7 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uvc b/Documentation/ABI/testing/configfs-usb-gadget-uvc
index 4feb692c4c1d..9bc58440e1b7 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uvc
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uvc
@@ -7,6 +7,8 @@ Description:	UVC function directory
 		streaming_maxburst	0..15 (ss only)
 		streaming_maxpacket	1..1023 (fs), 1..3072 (hs/ss)
 		streaming_interval	1..16
+		 streaming_max_usb_requests 64..256
+
 		function_name		string [32]
 		===================	=============================
 
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 29072c166d23..24a62ba8e870 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -790,14 +790,19 @@ Function-specific configfs interface
 The function name to use when creating the function directory is "uvc".
 The uvc function provides these attributes in its function directory:
 
-	=================== ================================================
-	streaming_interval  interval for polling endpoint for data transfers
-	streaming_maxburst  bMaxBurst for super speed companion descriptor
-	streaming_maxpacket maximum packet size this endpoint is capable of
-			    sending or receiving when this configuration is
-			    selected
-	function_name       name of the interface
-	=================== ================================================
+	===================         ===========================================
+	streaming_interval 	    interval for polling endpoint for data
+				    transfers
+	streaming_maxburst  	    bMaxBurst for super speed companion
+				    descriptor
+	streaming_maxpacket         maximum packet size this endpoint is
+				    capable of sending or receiving when
+				    this configuration is selected
+	streaming_max_usb_requests  upper bound for the number of usb requests
+				    the gadget driver will allocate for
+				    sending to the endpoint.
+	function_name		    name of the interface
+	===================         ============================================
 
 There are also "control" and "streaming" subdirectories, each of which contain
 a number of their subdirectories. There are some sane defaults provided, but
diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index faa398109431..32a296ea37d7 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -659,7 +659,8 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 	opts->streaming_interval = clamp(opts->streaming_interval, 1U, 16U);
 	opts->streaming_maxpacket = clamp(opts->streaming_maxpacket, 1U, 3072U);
 	opts->streaming_maxburst = min(opts->streaming_maxburst, 15U);
-
+	opts->streaming_max_usb_requests = clamp(opts->streaming_max_usb_requests, 64U, 256U);
+	uvc->streaming_max_usb_requests = opts->streaming_max_usb_requests;
 	/* For SS, wMaxPacketSize has to be 1024 if bMaxBurst is not 0 */
 	if (opts->streaming_maxburst &&
 	    (opts->streaming_maxpacket % 1024) != 0) {
@@ -934,6 +935,7 @@ static struct usb_function_instance *uvc_alloc_inst(void)
 
 	opts->streaming_interval = 1;
 	opts->streaming_maxpacket = 1024;
+	opts->streaming_max_usb_requests = 64;
 	snprintf(opts->function_name, sizeof(opts->function_name), "UVC Camera");
 
 	ret = uvcg_attach_configfs(opts);
diff --git a/drivers/usb/gadget/function/u_uvc.h b/drivers/usb/gadget/function/u_uvc.h
index 1ce58f61253c..075fee178418 100644
--- a/drivers/usb/gadget/function/u_uvc.h
+++ b/drivers/usb/gadget/function/u_uvc.h
@@ -24,6 +24,7 @@ struct f_uvc_opts {
 	unsigned int					streaming_interval;
 	unsigned int					streaming_maxpacket;
 	unsigned int					streaming_maxburst;
+	unsigned int					streaming_max_usb_requests;
 
 	unsigned int					control_interface;
 	unsigned int					streaming_interface;
diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 6751de8b63ad..943c074157fa 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -157,6 +157,9 @@ struct uvc_device {
 	/* Events */
 	unsigned int event_length;
 	unsigned int event_setup_out : 1;
+
+	/* Max number of usb requests allocated to send to the ep*/
+	unsigned int streaming_max_usb_requests;
 };
 
 static inline struct uvc_device *to_uvc(struct usb_function *f)
diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 9bf0e985acfa..0ad9eae4845e 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -3403,6 +3403,7 @@ UVC_ATTR(f_uvc_opts_, cname, cname)
 UVCG_OPTS_ATTR(streaming_interval, streaming_interval, 16);
 UVCG_OPTS_ATTR(streaming_maxpacket, streaming_maxpacket, 3072);
 UVCG_OPTS_ATTR(streaming_maxburst, streaming_maxburst, 15);
+UVCG_OPTS_ATTR(streaming_max_usb_requests, streaming_max_usb_requests, 256);
 
 #undef UVCG_OPTS_ATTR
 
@@ -3453,6 +3454,7 @@ static struct configfs_attribute *uvc_attrs[] = {
 	&f_uvc_opts_attr_streaming_maxpacket,
 	&f_uvc_opts_attr_streaming_maxburst,
 	&f_uvc_opts_string_attr_function_name,
+	&f_uvc_opts_attr_streaming_max_usb_requests,
 	NULL,
 };
 
diff --git a/drivers/usb/gadget/function/uvc_queue.c b/drivers/usb/gadget/function/uvc_queue.c
index 0aa3d7e1f3cc..b81c2d8e5ef2 100644
--- a/drivers/usb/gadget/function/uvc_queue.c
+++ b/drivers/usb/gadget/function/uvc_queue.c
@@ -45,6 +45,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vq);
 	struct uvc_video *video = container_of(queue, struct uvc_video, queue);
 	unsigned int req_size;
+	unsigned int max_usb_requests;
 	unsigned int nreq;
 
 	if (*nbuffers > UVC_MAX_VIDEO_BUFFERS)
@@ -54,6 +55,8 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 
 	sizes[0] = video->imagesize;
 
+	max_usb_requests = video->uvc->streaming_max_usb_requests;
+
 	req_size = video->ep->maxpacket
 		 * max_t(unsigned int, video->ep->maxburst, 1)
 		 * (video->ep->mult);
@@ -62,7 +65,7 @@ static int uvc_queue_setup(struct vb2_queue *vq,
 	 * into fewer requests for smaller framesizes.
 	 */
 	nreq = DIV_ROUND_UP(DIV_ROUND_UP(sizes[0], 2), req_size);
-	nreq = clamp(nreq, 4U, 64U);
+	nreq = clamp(nreq, 4U, max_usb_requests);
 	video->uvc_num_requests = nreq;
 
 	return 0;
-- 


