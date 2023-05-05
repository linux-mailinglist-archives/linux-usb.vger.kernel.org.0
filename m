Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F0266F8C7A
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 00:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbjEEWl0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 18:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbjEEWlZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 18:41:25 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21D44493
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 15:41:23 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5191796a483so1663209a12.0
        for <linux-usb@vger.kernel.org>; Fri, 05 May 2023 15:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683326482; x=1685918482;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X0njdyXMSNgKRdmlVrhCjp1iZsU+9Diza5ITyiEkZm8=;
        b=GI+FZU3OlE+WgyzDTPaKNEPcQXxMQkRgoP8j068hVCRmP//dUi9y2y2cDPILaaPqjP
         N41u0LFMMn5MGYeFnPDrt0elCceKBoExutmfHAjK64r9SIsllwKqv0XsG7S911AHx+50
         kVVkbajhSDYGozi3Jhu0Yw9nNXkQhXRUtI5Pu43I2hiCLuG2Udv3kFZ/Wyxvz2MZ/Uaf
         zjSqNurwEiGnSe+l0FQCbBtj5YldwZvCbn9zcPBv8SaNDOMSb5n3mIQYtWfZlhPZ81Vy
         B0Xh3c85ziRrmCNnACoWYL4LBiyo94hvtGdwSF2WfrMatNa9sfDq1uCpUJRjV8ex8XHN
         KeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683326482; x=1685918482;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X0njdyXMSNgKRdmlVrhCjp1iZsU+9Diza5ITyiEkZm8=;
        b=X3VM98RbKsSx71vB3v+iwwumEk5GaUOCCHiHMr20WGF6/aOebHfzHo0CrDmK0NCltI
         UoXteIhtj80I3cd2CMky5ZwfBhub4+oAbPsGaepnGpVvL16xN/OPyW3f3znd1q9uujnY
         GdQh6xNu/Z4iJszahYBd1WnMR7tNmlpOGnE43G/XL87QYZJN2VJO5SlTcZ1ueLrQbb5P
         JEiGf9xtL6LDJ1XPu8TmMLqyNf4qS9YtOPG9X/3JyzP9bxtHRe5+chYL/AZM1GM5w4Wt
         IQtjBf2rIXzFIXr4HbF4YVeP/tCto/O5k7UR/pCgfPbZpwuneQdM4NIFOvp5rLdS56LN
         L67w==
X-Gm-Message-State: AC+VfDzP7DWoSABNAdcrfIQUI6LkRZF3h7IVcd4amte8ZcZ0cwddKvsz
        fWypBLjoM9WoLCHqvBKfjwkhQw==
X-Google-Smtp-Source: ACHHUZ7pIblL64u+W4t2bTsaWa4r/conSCz35BImAXzDtcciugxLULZJ4f5ftPuGhAv5YStuh162OA==
X-Received: by 2002:a17:902:f690:b0:1ab:29bc:bd87 with SMTP id l16-20020a170902f69000b001ab29bcbd87mr3317497plg.35.1683326481694;
        Fri, 05 May 2023 15:41:21 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id x21-20020a17090300d500b001a2104d706fsm2237726plc.225.2023.05.05.15.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 15:41:21 -0700 (PDT)
Message-ID: <62d7321f-6046-c75a-7610-97bebab2965c@google.com>
Date:   Fri, 5 May 2023 15:41:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
Content-Language: en-US
From:   Avichal Rakesh <arakesh@google.com>
To:     "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com>
 <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
 <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
 <20230418193951.zjwgg25cyhg3lsay@synopsys.com>
 <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com>
 <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
In-Reply-To: <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-21.9 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 5/5/23 15:39, Avichal Rakesh wrote:
> 
> 
> On 4/20/23 10:20, Laurent Pinchart wrote:
>>
>> As far as I understand, we have two ways forward here to avoid running
>> out of requests to send: sending data as quickly as possible (maximizing
>> the number of bytes sent in each packet) and filling up with 0-length
>> requests in-between, and spreading the data across packets. I'll call
>> the first one burst mode for lack of a better term.
>>
> 
> Hey all,
> 
> Apologies for the late reply. My not-so-long work took longer than expected.
> I tried the 2 (technically 3, but I'll go over it in a bit) approaches we had
> discussed above and the "burst" approach works pretty well. I'll attach that
> to this email, and send another email out with the other patch.
> 
Here's the second test. This patch does the complete opposite of the previous one
and is based on Thinh mentioning that there was some logic built into DWC3 to
reschedule requests if the uvc driver does not queue a request for some time.

It queues usb_requests in short bursts and waits until all the queued requests
have been returned before queueing up another burst of usb_requests. This was
disastrous as it saw far more ISOC failures than before.

That likely stemmed from timing between the last request being returned and the
new burst of requests being queued, but no amount of arbitrary waiting
between last return and first queue completely eliminated the ISOC failures.

Patch, if anyone is curious:
---
 drivers/usb/gadget/function/uvc.h       |  1 +
 drivers/usb/gadget/function/uvc_video.c | 13 +++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
index 100475b1363e..e29821a80a82 100644
--- a/drivers/usb/gadget/function/uvc.h
+++ b/drivers/usb/gadget/function/uvc.h
@@ -102,6 +102,7 @@ struct uvc_video {

 	/* Requests */
 	unsigned int req_size;
+	unsigned int num_free_req;
 	struct uvc_request *ureq;
 	struct list_head req_free;
 	spinlock_t req_lock;
diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index dd1c6b2ca7c6..e3aad9c3f3ca 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -255,6 +255,7 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
 	struct uvc_video_queue *queue = &video->queue;
 	struct uvc_device *uvc = video->uvc;
 	unsigned long flags;
+	bool should_pump = false;

 	switch (req->status) {
 	case 0:
@@ -284,9 +285,12 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)

 	spin_lock_irqsave(&video->req_lock, flags);
 	list_add_tail(&req->list, &video->req_free);
+	video->num_free_req++;
+	// Only pump more requests if we have all our usb_requests back.
+	should_pump = video->num_free_req == video->uvc_num_requests;
 	spin_unlock_irqrestore(&video->req_lock, flags);

-	if (uvc->state == UVC_STATE_STREAMING)
+	if (uvc->state == UVC_STATE_STREAMING && should_pump)
 		queue_work(video->async_wq, &video->pump);
 }

@@ -316,6 +320,7 @@ uvc_video_free_requests(struct uvc_video *video)

 	INIT_LIST_HEAD(&video->req_free);
 	video->req_size = 0;
+	video->num_free_req = 0;
 	return 0;
 }

@@ -332,10 +337,12 @@ uvc_video_alloc_requests(struct uvc_video *video)
 		 * max_t(unsigned int, video->ep->maxburst, 1)
 		 * (video->ep->mult);

+	video->num_free_req = 0;
 	video->ureq = kcalloc(video->uvc_num_requests, sizeof(struct uvc_request), GFP_KERNEL);
 	if (video->ureq == NULL)
 		return -ENOMEM;

+	video->num_free_req = 0;
 	for (i = 0; i < video->uvc_num_requests; ++i) {
 		video->ureq[i].req_buffer = kmalloc(req_size, GFP_KERNEL);
 		if (video->ureq[i].req_buffer == NULL)
@@ -357,6 +364,7 @@ uvc_video_alloc_requests(struct uvc_video *video)
 		sg_alloc_table(&video->ureq[i].sgt,
 			       DIV_ROUND_UP(req_size - UVCG_REQUEST_HEADER_LEN,
 					    PAGE_SIZE) + 2, GFP_KERNEL);
+		video->num_free_req++;
 	}

 	video->req_size = req_size;
@@ -400,6 +408,7 @@ static void uvcg_video_pump(struct work_struct *work)
 		req = list_first_entry(&video->req_free, struct usb_request,
 					list);
 		list_del(&req->list);
+		video->num_free_req--;
 		spin_unlock_irqrestore(&video->req_lock, flags);

 		/*
@@ -450,6 +459,7 @@ static void uvcg_video_pump(struct work_struct *work)

 	spin_lock_irqsave(&video->req_lock, flags);
 	list_add_tail(&req->list, &video->req_free);
+	video->num_free_req++;
 	spin_unlock_irqrestore(&video->req_lock, flags);
 	return;
 }
@@ -527,4 +537,3 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
 	return 0;
 }
-
--

