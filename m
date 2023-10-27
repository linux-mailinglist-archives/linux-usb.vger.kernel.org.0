Return-Path: <linux-usb+bounces-2283-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE8C7D9961
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 15:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E4562824F5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 13:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559FA1EB22;
	Fri, 27 Oct 2023 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfJxb9Ec"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7526D1A738
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 13:10:10 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A6551B3
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 06:10:09 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6b26a3163acso1930629b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 06:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698412208; x=1699017008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fXygAGGOuNQivvozHnow8RDNeOQ+g6oJihfEs9klyWI=;
        b=PfJxb9EcFuT/uIGMCbCoEyTW3gpfaRzqJRbxGi/q7yLVQONdimCdcZFqM8Ti1AFPMN
         +frU8GClcd6ND7/BYbRrIKmlt7A1vVaUmz8ageb5eotOUnpOn1X9FVF1ROJ1zM9SXvSX
         okqkNENVSYElUFDiMxcVRREJG7w8OMZgiWrFhPlV2caaNiMHulJp3P1nL+dK32REKvdx
         TFWDyeqb9pfsrI5q5oaNqXITTHJKmrdUpgfqVCMA+v2IXVlUU7OFwg6xWxfcHUgYs9JU
         +CqP7r8ezcX3QnGCTkMZ4kepnlOLZPE/0p9SGgH7hlmca8bjJw8a5dIlJA2i3mlf+VDf
         WTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698412208; x=1699017008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXygAGGOuNQivvozHnow8RDNeOQ+g6oJihfEs9klyWI=;
        b=SQpelauu2Lcl6U0l9qUr48di3ID9AxCM9ft2pCR3O0DnvJ0fjgeqpyuq7pHiwy0gt/
         Gvebg37K6FvUQoqzCVsUs/ZI+GnZqCE/c9EcS/RdqvYGB9uN3QPuXXy0e58/Mb3EPjKj
         8IXqJ2cF7Mz+Q6mx0siDaa3YBUOYusa/S/y/sgBaoMXNoCZiCh+YtUEH5Ds9SafoMzt6
         xiglMKEFzlhPzCS1GKSs6IkxFDDYti5u3Zw4OmEYbU5mbFbrVNQX9lS4e7FRgVdypEt3
         c0NFI02jfoNGilIlv9Zbt/MqPhyxkuwc1okCRqo19TxzNSnw/6kC78BTADtO4/p2jvC1
         8j4g==
X-Gm-Message-State: AOJu0YyuKhUWuQPXi+MBIGAKplfEAWcpMT1W5Wo8pzi60yGE7WyMAo7m
	4lr186tCaarIEymazXmqyfdXzG1PJKI=
X-Google-Smtp-Source: AGHT+IFzayFww1gpAbANsS4f2QzkwvtWDgbRoD7bb/aGeo8Ru3+kcISe25grXXqmfSae4FIIqz6HNQ==
X-Received: by 2002:a05:6a00:1a86:b0:6b8:2ef3:331d with SMTP id e6-20020a056a001a8600b006b82ef3331dmr2704614pfv.10.1698412208290;
        Fri, 27 Oct 2023 06:10:08 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id x10-20020aa7940a000000b0068c006dd5c1sm1322399pfo.115.2023.10.27.06.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 06:10:07 -0700 (PDT)
Message-ID: <ea20a0d8-fa44-42cb-9b68-839a40189f34@gmail.com>
Date: Fri, 27 Oct 2023 20:09:58 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] set 1.50 as the lower bcdDevice value for "Super
 Top"-device in drivers/usb/storage/unusual_cypress.h
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: LihaSika <lihasika@gmail.com>, Linux USB <linux-usb@vger.kernel.org>
References: <ZTsR-RhhjxSpqrsz@debian.me>
 <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
 <2023102704-stable-lid-c86a@gregkh>
 <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com> <ZTuzlUp3x8I_kqoS@debian.me>
 <2023102757-runner-huff-9640@gregkh>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <2023102757-runner-huff-9640@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2023 20:05, Greg KH wrote:
> On Fri, Oct 27, 2023 at 07:56:53PM +0700, Bagas Sanjaya wrote:
>> On Fri, Oct 27, 2023 at 03:37:51PM +0300, LihaSika wrote:
>>>> - Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
>>>>    and can not be applied.  Please read the file,
>>>>    Documentation/process/email-clients.rst in order to fix this.
>>>>
>>>
>>> Oh right, Thunderbird wrapped the first line of the patch file -.-
>>>
>>> Disabled wrapping, another attempt:
>>>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Liha Sikanen <lihasika@gmail.com>
>>> ---
>>>
>>> diff --git a/drivers/usb/storage/unusual_cypress.h b/drivers/usb/storage/unusual_cypress.h
>>> index 0547daf..7b3d5f0 100644
>>> --- a/drivers/usb/storage/unusual_cypress.h
>>> +++ b/drivers/usb/storage/unusual_cypress.h
>>> @@ -19,7 +19,7 @@ UNUSUAL_DEV(  0x04b4, 0x6831, 0x0000, 0x9999,
>>>          "Cypress ISD-300LP",
>>>          USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
>>>
>>> -UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
>>> +UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0160,
>>>          "Super Top",
>>>          "USB 2.0  SATA BRIDGE",
>>>          USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
>>>
>>>
>>>
>>
>> Hi,
>>
>> You have to use git-send-email(1) for the purpose of sending patches
>> instead. Please see Documentation/process/email-clients.rst in the kernel
>> sources for more information. And don't forget to address reviews from
>> Greg's bot.
> 
> You don't have to use git send-email, that's not required at all, it's
> just there to make things easier for some people.
> 

Thanks for the tip.

IMO, this is the submitter's first patch submission where he had to set up
appropriate tooling.

-- 
An old man doll... just what I always wanted! - Clara


