Return-Path: <linux-usb+bounces-1155-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B71507BA8BC
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 20:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 3C8BF28224C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Oct 2023 18:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106E43F4AB;
	Thu,  5 Oct 2023 18:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hOV0gZ0w"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A7D3E49D
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 18:09:22 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B628810D7
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 11:09:17 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c5c91bec75so9937495ad.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Oct 2023 11:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696529357; x=1697134157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7DifqleOuS4Ftm7UdlJ3gSQnAv/4ydUwrCRGahb3LQ=;
        b=hOV0gZ0w6SxJNIO8O8Li+FusVmCLn1mXi37WZkbG4GkEQnnbUJf1T990jtrteDS1Mh
         62wYwoo6KWe1lCPcDKe5ZeGmWzTmvrdnSEKpdSnM9t10L22ceH03549AaWPFhC6fvbMO
         KvkgZ2LQ7GyWibSRvoXEmoQxf/VzzUnrymX3XKBdhF/+S5r6HIVCnra71wX/5RETrMw+
         vgyOMpawgVmiKk5Wg0aRgVALYGbzcH7Mc8U7dNpOuJau9c+UDSKyhHZ1blMsCq8pM6f/
         CQfo/vwqXvRwRQfCxYu6I1ZNCzF2X3pI2bpHrE8/stpMGLaFqvcF87gCZayeKnDFp9xE
         aBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696529357; x=1697134157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7DifqleOuS4Ftm7UdlJ3gSQnAv/4ydUwrCRGahb3LQ=;
        b=HFOTRmqT6rpJtAPri/xTdgAuJwOTEax8NYPuf0AUNN7LLjL9T+7Zu8ZqoEvjZXwJqX
         UiDtpYtVtl90n1VFsS40bKVbYMChsAoaSJT8jrdZrevw6D0kbIP57LY7dcNtg/dpDC7y
         Nzhe8suoHhnUBdxPdZ1BY9SqMyg9mTD42lrDNJ8Dz9sFNhF5tm5hr5kSm4lo5zUTyXgP
         8JZNY8JVR1a4hVAIG3BMtaSFoDknxuMTgcppl+6fvZOlX8m/VM+ydt9rDYyUpUXE8sKc
         eOl3bXVilFOW2LNwEtnnwLSS5QPg1o2cA+dS412PsPtlHeuYxI4R1cMQqPduOgkblhue
         /Pcw==
X-Gm-Message-State: AOJu0YwUfNRF0LuIqfpGsCWOZ2Zch63q11IQpllegdLp0TTwOvFVn2yB
	uxVTzodn/9Mvq4FqRLravS1auWJVqCAYSjMX6JvuIg==
X-Google-Smtp-Source: AGHT+IHHN7bfqj7hewxdVKt7Cf45LxZGTpIcm23BBdWbf+YEqqz2uGQjcWChcb8Q4k9vz684/mZ+vw==
X-Received: by 2002:a17:902:c3c1:b0:1c5:9d28:b2bb with SMTP id j1-20020a170902c3c100b001c59d28b2bbmr5526148plj.33.1696529356958;
        Thu, 05 Oct 2023 11:09:16 -0700 (PDT)
Received: from [192.168.60.239] (213.126.145.34.bc.googleusercontent.com. [34.145.126.213])
        by smtp.gmail.com with ESMTPSA id iw21-20020a170903045500b001c726147a45sm2042191plb.190.2023.10.05.11.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 11:09:16 -0700 (PDT)
Message-ID: <bc65635b-d33f-49f4-84f6-8cc5b948304d@google.com>
Date: Thu, 5 Oct 2023 11:09:14 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] usb: gadget: uvc: stability fixes on STREAMOFF.
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Grzeschik <mgr@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, jchowdhary@google.com,
 etalvala@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230930184821.310143-1-arakesh@google.com>
 <ZRv2UnKztgyqk2pt@pengutronix.de>
 <0ccb2c13-438d-4715-af79-d5cf536930cc@google.com>
 <2023100518-everyday-graves-7404@gregkh>
From: Avichal Rakesh <arakesh@google.com>
In-Reply-To: <2023100518-everyday-graves-7404@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/5/23 00:11, Greg Kroah-Hartman wrote:
> On Tue, Oct 03, 2023 at 04:16:00PM -0700, Avichal Rakesh wrote:
>> Thank you for testing the patch, Michael!
>>
>> On 10/3/23 04:09, Michael Grzeschik wrote:
>>> Hi
>>>
>>> On Sat, Sep 30, 2023 at 11:48:18AM -0700, Avichal Rakesh wrote:
>>>> We have been seeing two main stability issues that uvc gadget driver
>>>> runs into when stopping streams:
>>>> 1. Attempting to queue usb_requests to a disabled usb_ep
>>>> 2. use-after-free issue for inflight usb_requests
>>>>
>>>> The three patches below fix the two issues above. Patch 1/3 fixes the
>>>> first issue, and Patch 2/3 and 3/3 fix the second issue.
>>>>
>>>> Avichal Rakesh (3):
>>>>  usb: gadget: uvc: prevent use of disabled endpoint
>>>>  usb: gadget: uvc: Allocate uvc_requests one at a time
>>>>  usb: gadget: uvc: Fix use-after-free for inflight usb_requests
>>>>
>>>> drivers/usb/gadget/function/f_uvc.c     |  11 +-
>>>> drivers/usb/gadget/function/f_uvc.h     |   2 +-
>>>> drivers/usb/gadget/function/uvc.h       |   6 +-
>>>> drivers/usb/gadget/function/uvc_v4l2.c  |  21 ++-
>>>> drivers/usb/gadget/function/uvc_video.c | 189 +++++++++++++++++-------
>>>> 5 files changed, 164 insertions(+), 65 deletions(-)
>>>
>>> These patches are not applying on gregkh/usb-testing since
>>> Greg did take my patches first. I have already rebased them.
>>
>> Ah, I didn't realize Greg had picked up your changes in his tree.
>> Rebased the patches in V2.
> 
> The "v2" series here is almost impossible to follow, sorry.
> 
> Please send it as a new thread, not as responses to the individual
> commits, how am I supposed to pick them up that way?
> 
> And make it v3 please.

Sent out v3 as a new thread. Sorry about that!

- Avi.

