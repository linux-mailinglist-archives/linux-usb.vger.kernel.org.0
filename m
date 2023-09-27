Return-Path: <linux-usb+bounces-679-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472BB7B0D93
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 22:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sy.mirrors.kernel.org (Postfix) with ESMTP id 7E9F9B20C32
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 20:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259CA450EB;
	Wed, 27 Sep 2023 20:47:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C84130FA0
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 20:47:43 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA70D6
	for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 13:47:42 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-690d2441b95so9212872b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 27 Sep 2023 13:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695847662; x=1696452462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umu6zI7KqlBnvz7R71VlvP7jPJvXGwT3mz/S+vCmheA=;
        b=dAMCk8PpZ3SZb6Zu14VV1KosID7iAbMjGmCg9/QxdFUTPlmakTV0fYQSLd4xH/tYJK
         AQOd3Fzp/q4C6QPWJll4O7QuO8rrzgU0zxewyAyCUt4UTy2lp7H1WAaXi9IidthniLEB
         +kh8GWYN+74BY4Ch8mouqfNcxB8ts1UZjp34Jxf7ouNEVd7/EYeMgsvYTOBnr2c5rp3o
         prS7TqJkfeHc8nIKVp/8CeJ+CsaN1usfEdhTHxiKLDzhdFJU+NmNMggEfsSyTWNVLGHt
         6GrayjK+ZrDoBJl3VtApelM+VUrAL4orsH4PTk4BKkKMTagNNL08fFOSpV8FDQieIHhX
         aNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695847662; x=1696452462;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umu6zI7KqlBnvz7R71VlvP7jPJvXGwT3mz/S+vCmheA=;
        b=N1n0mDAdZ7QWYglsXGH82gmKyvCBkSq5t4yC4zQORjm3urzU/pV89+qWckFAU01uMP
         47IvF0Q6shU9/JMlXq2m4bOaw8NpK+U598cKvUt9l0GSDvSVG3f0OHG1IaOTHzPmoUDs
         rTwPF9ADmgm6f1ZKTmNWm4FOyCpFDVKstVXZQxzVtiLaGwhGYlFVdr6XHeoQ3S4DyWmH
         O/tGY9JAkOVtGALbgLgf8gD8f+csyluB+TGxQwiFbguXAWKzx0vcB5O0f5i1OoytILpW
         HXZbdeHgY4HRFsVB4blCJBSgIG/s5zse1GTSPo0CUe1Uk4eM0xPlLAWO7SrnZfpC4G+a
         Vt+w==
X-Gm-Message-State: AOJu0Yw7JPSIXvPqM4HvJFv3vp+ilAfo4LbS2lgo2/Po0iNGOXnD99aE
	0s1DlbRTWAG1FOFcAVSuR+20Ow==
X-Google-Smtp-Source: AGHT+IGhDl6LmtgdDp6QDyBGz7JuZ/E9XNiM7InTw9ExyO7ynisKQ602gRRhQSfm96xvhyra/dtDbQ==
X-Received: by 2002:a05:6a00:14d2:b0:68b:a137:373d with SMTP id w18-20020a056a0014d200b0068ba137373dmr5818458pfu.17.1695847661735;
        Wed, 27 Sep 2023 13:47:41 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id c16-20020aa78e10000000b0068c61848785sm12149737pfr.208.2023.09.27.13.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 13:47:41 -0700 (PDT)
Message-ID: <1b8bb18d-460e-48cd-ab7d-80af8910423b@google.com>
Date: Wed, 27 Sep 2023 13:47:38 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] usb: gadget: uvc: stability fixes when stopping
 streams
Content-Language: en-US
From: Avichal Rakesh <arakesh@google.com>
To: Michael Grzeschik <mgr@pengutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230912041910.726442-1-arakesh@google.com>
 <CAMHf4WLeSC9m05XOU54yL=2xUcSqbWP0f7evM0rZRsJ=J-btWw@mail.gmail.com>
 <ZQTlz9Koe2CQIsrC@pengutronix.de>
 <af3c1637-ff43-4346-8cfb-db836d6de3f0@google.com>
 <bb962593-9665-4bb1-be14-c56ce17b9073@google.com>
In-Reply-To: <bb962593-9665-4bb1-be14-c56ce17b9073@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 9/19/23 11:24, Avichal Rakesh wrote:
> 
> 
> On 9/15/23 18:35, Avichal Rakesh wrote:
>>
>>
>> On 9/15/23 16:16, Michael Grzeschik wrote:
>>> Hi Avichal
>>>
>>> On Thu, Sep 14, 2023 at 04:05:36PM -0700, Avichal Rakesh wrote:
>>>> On Mon, Sep 11, 2023 at 9:19 PM Avichal Rakesh <arakesh@google.com> wrote:
>>>>>
>>>>> We have been seeing two main bugs when stopping stream:
>>>>> 1. attempting to queue usb_requests on a disabled usb endpoint, and
>>>>> 2. use-after-free problems for inflight requests
>>>>>

>>>
>>> The error path triggering these list errors are usually in the
>>> dwc3 driver handling the cancelled or completed list.
>>
>> It looks like we're still freeing un-returned requests :(. If you still have
>> the setup can you pull the uvc logs to see if waiting for requests to be returned timed 
>> out? I wonder if dwc3's interrupt handler is being scheduled too late. 500ms seemed
>> like a reasonable time out to me, but this seems to prove otherwise.
>>
> 
> 
> Hey Michael, were you able to look into the comments from the previous
> email? 
> 

Bumping the thread up. Laurent, Dan, and Michael: the patches are ready to
review/test. Please take a look when possible. 

Thank you!
Avi.

