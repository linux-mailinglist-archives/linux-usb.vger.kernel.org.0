Return-Path: <linux-usb+bounces-1056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4DF7B7490
	for <lists+linux-usb@lfdr.de>; Wed,  4 Oct 2023 01:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 0B0022813B0
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 23:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B37F3F4B5;
	Tue,  3 Oct 2023 23:16:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583063CCF8
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 23:16:05 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B35CE
	for <linux-usb@vger.kernel.org>; Tue,  3 Oct 2023 16:16:02 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1c5cd27b1acso11395735ad.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Oct 2023 16:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696374962; x=1696979762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQvjZ6Vg1TORaVshay2K+ceZECfUUPc83u0Du1Ap9X0=;
        b=mnqT0CFhF6VjfTwVe6vh6CvoHF/wU2YohWTLyEcL+K69EE/HQ0qxUz8F/I4/d5wWig
         qqQDoCVVM3Bzni0LGF49lCx3zMTIW2mJgw0xnuqy/O2+XiO/3VfU9kMKQFohhqKwjmMr
         RKmxnALYwWLVXfD/pC+CdLWX1YER/ZpikdL1HslZG0vY+SWcWsjlFW7Vi6+hMpqgFnbR
         SOQ3A7VV4AzkpRTnMK7+/lipnyKP+b6kyJ4aN583rlmFZgIZAs7y3TG+OXplr8AoXvx6
         KvTELbschUUs2GADtFpnDT7wwUbT11u38NOiC+g9VTz0wT9AsCxGfQqsMbt7FlHLHULz
         d2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696374962; x=1696979762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQvjZ6Vg1TORaVshay2K+ceZECfUUPc83u0Du1Ap9X0=;
        b=ojUDrl0cVBjxPJWWQydtJ32Qed5yodI/BOXjNZv80PADPx9a19w7p6C8k8MB43paio
         Z63GgLHVZ4Ah/mE3k771VPVcVFUKCt4k5YySQsGHjO2SSjRLx6gDx7KQUhYJFAV5CbpZ
         hyuhbpRI7PQpjo6KJjzVuDHrO8N3OkuiQruU00kyefqgxTFhL2jaRFqwLvG5SzOAaLsc
         NJp5df2ZNOFFfJjDqsuP7WzgaQtW5nnzh1hU+m7eLA/8ExqT+nd/PVipqL/3n6GKlEVy
         i7B4ZgGee9KBBH5+zvg9TJZh7u1elKNeDYB+2kZjIb6Fka8ynTiAaVX/Bli1S+otJsZI
         cR0w==
X-Gm-Message-State: AOJu0YxBdEp9LWel24kc5mqKXuEWvKadhJvoqADMEPeU3J/nVTsfnnrG
	Pjo7PRquJMhMRCHIJRl0UepdNg==
X-Google-Smtp-Source: AGHT+IHbJ4svnNe0Uz7gtX62WWEVUOR1Lb0TLS4/QGnyuum2NTMNrkADnkgIuAIzd2qDEAKfIpOeaw==
X-Received: by 2002:a17:902:b70f:b0:1c4:375c:110a with SMTP id d15-20020a170902b70f00b001c4375c110amr906373pls.19.1696374961982;
        Tue, 03 Oct 2023 16:16:01 -0700 (PDT)
Received: from [192.168.60.239] (213.126.145.34.bc.googleusercontent.com. [34.145.126.213])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902d30400b001c62c9d7289sm2179840plc.104.2023.10.03.16.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 16:16:01 -0700 (PDT)
Message-ID: <0ccb2c13-438d-4715-af79-d5cf536930cc@google.com>
Date: Tue, 3 Oct 2023 16:16:00 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] usb: gadget: uvc: stability fixes on STREAMOFF.
Content-Language: en-US
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jchowdhary@google.com,
 etalvala@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230930184821.310143-1-arakesh@google.com>
 <ZRv2UnKztgyqk2pt@pengutronix.de>
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <ZRv2UnKztgyqk2pt@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Thank you for testing the patch, Michael!

On 10/3/23 04:09, Michael Grzeschik wrote:
> Hi
> 
> On Sat, Sep 30, 2023 at 11:48:18AM -0700, Avichal Rakesh wrote:
>> We have been seeing two main stability issues that uvc gadget driver
>> runs into when stopping streams:
>> 1. Attempting to queue usb_requests to a disabled usb_ep
>> 2. use-after-free issue for inflight usb_requests
>>
>> The three patches below fix the two issues above. Patch 1/3 fixes the
>> first issue, and Patch 2/3 and 3/3 fix the second issue.
>>
>> Avichal Rakesh (3):
>>  usb: gadget: uvc: prevent use of disabled endpoint
>>  usb: gadget: uvc: Allocate uvc_requests one at a time
>>  usb: gadget: uvc: Fix use-after-free for inflight usb_requests
>>
>> drivers/usb/gadget/function/f_uvc.c     |  11 +-
>> drivers/usb/gadget/function/f_uvc.h     |   2 +-
>> drivers/usb/gadget/function/uvc.h       |   6 +-
>> drivers/usb/gadget/function/uvc_v4l2.c  |  21 ++-
>> drivers/usb/gadget/function/uvc_video.c | 189 +++++++++++++++++-------
>> 5 files changed, 164 insertions(+), 65 deletions(-)
> 
> These patches are not applying on gregkh/usb-testing since
> Greg did take my patches first. I have already rebased them.

Ah, I didn't realize Greg had picked up your changes in his tree.
Rebased the patches in V2.

Also want to point out that 
https://lore.kernel.org/20230911002451.2860049-2-m.grzeschik@pengutronix.de/
may have introduced an issue when setting the uvc->state to 
UVC_STATE_CONNECTED in uvcg_video_enable. 

Effectively, uvc_video_enable can be called 
  1. because the host asks to halt the stream, or 
  2. if the gadget was disabled. 

Setting uvc->state to CONNECTED is fine for (1). In (2), uvc_v4l2 
sets uvc->state to DISCONNECTED before calling uvcg_video_enable. 
In this case, your change would overwrite the value to CONNECTED 
without any further checks.

> 
> In the updated version I the stack runs into the
> following error, when enabling lockdep. Could you
> try your version with lockdep enabled?
> 
> [   41.278520] configfs-gadget.vz gadget.0: uvc: reset UVC
> [   47.156261] configfs-gadget.vz gadget.0: uvc: uvc_function_set_alt(2, 0)
> [   47.169177]
> [   47.170903] ============================================
> [   47.176857] WARNING: possible recursive locking detected
> [   47.182798] 6.5.0-20230919-1+ #19 Tainted: G         C
> [   47.189323] --------------------------------------------
> [   47.195256] vzuvcd/412 is trying to acquire lock:
> [   47.200511] ffffff8009560928 (&video->req_lock){....}-{3:3}, at: uvc_video_complete+0x44/0x2e0
> [   47.210172]
> [   47.210172] but task is already holding lock:
> [   47.216687] ffffff8009560928 (&video->req_lock){....}-{3:3}, at: uvcg_video_enable+0x2d0/0x5c0
> [   47.226333]
> [   47.226333] other info that might help us debug this:
> [   47.233625]  Possible unsafe locking scenario:
> [   47.233625]
> [   47.240242]        CPU0
> [   47.242974]        ----
> [   47.245709]   lock(&video->req_lock);
> [   47.249802]   lock(&video->req_lock);
> [   47.253897]
> [   47.253897]  *** DEADLOCK ***
> [   47.253897]
> [   47.260511]  May be due to missing lock nesting notation
> [   47.260511]
> 

Thank you for catching this. I couldn't repro the deadlock, but it looks
like DWC3 controller can call the complete callback directly from 
usb_ep_dequeue for requests in its pending list. I am not sure if that 
is up to spec, considering calling usb_ep_queue explicitly forbids calling
the complete callback from within. Regardless, it is easy enough to fix
by moving the dequeue calls to before we acquire req_lock. The semantics
of the rest of the patch is unchanged.

Uploading the fixed patches shortly.

Regards,
Avi.

