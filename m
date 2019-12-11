Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79D7711A67C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 10:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfLKJKK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 04:10:10 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36775 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbfLKJKK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 04:10:10 -0500
Received: by mail-pj1-f66.google.com with SMTP id n96so8695038pjc.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 01:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kshy38W1TW5FXCvp8jFWU0CvYYATg6x7lAa7FeX+g98=;
        b=VvYsaohLHNLu1EsIcFYVeHXp6vjcfYisrZwhSu9udjpgErWFl3auubw8w2EULCLTjW
         7lCnNJvdA8YwdlrGyxGgo30+eMCZ2MHsDaPfs1YfVOszcCdAI0ApJk+q/IMz3UvMZXYT
         dlH/y2/3/O8fge92j4W5E+MzjilrAE1gzW9viZWKkMbJJFWlQZXdxnLsF2PBHFBcrIEk
         Vj4Yidp3jCG6JymJ7c38Qn+lmd3+/mTD++RKTApfTYY9nbUSBd1Fjg81l3BBe7X5ex6x
         VHnmgQ90YutVOO2g8mm9glIq4FNPb5R+lyxm/S2RV7JR3Sj5gVWYDjtve1Aa5p7hrhpa
         pJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kshy38W1TW5FXCvp8jFWU0CvYYATg6x7lAa7FeX+g98=;
        b=EkQWLeqkbzrvxO73DIeJvAOfmOgIv0oJPQ/cxkqIdkzt5HFYFHSnwOGPiaF0fkLG12
         1Y9Z5OZxI5WvE7GuJ3jQiv1SfBC77KWenqd3XDfo5UuXRrt+gSdE7uwRsX3WYdXib14g
         e/F75TkBD5mZadZIzFAdA5R0s2nW1BsLMSjJv8PCI7G278QtRrCXa3uVgDgP6/k81rPF
         JnMd01EAckWykevo9YP8ZIMmKuJI6fq2auu/uxBcAIE5ulDyg7SZc9f2nYH7oOiDltpy
         9f6YW9aeV6jRZW2tXs5ctc+Rt5XpwF2zf0I9rkPvJqi0KkYGe7tlkRS4x39tR/uCgrQ0
         kadw==
X-Gm-Message-State: APjAAAU7JszgA1MpLV/ura1K6+qF/VBWs7mwvt1euhbGWkSF9h9aoiSU
        g2MI3+ZvpQHXT9F84FKixtptnTYa
X-Google-Smtp-Source: APXvYqy00NcoYzfFDWZsw4R/oEEywdy4MgVAIQ1Luoomf9Z7sGlSjC1zyIz4BRA0KU0zAUOoaDoDvw==
X-Received: by 2002:a17:902:6909:: with SMTP id j9mr2116170plk.136.1576055409630;
        Wed, 11 Dec 2019 01:10:09 -0800 (PST)
Received: from ?IPv6:2402:f000:1:1501:200:5efe:166.111.139.117? ([2402:f000:1:1501:200:5efe:a66f:8b75])
        by smtp.gmail.com with ESMTPSA id u3sm1945556pga.72.2019.12.11.01.10.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Dec 2019 01:10:09 -0800 (PST)
Subject: Re: [PATCH 2/2] usb: musb: Fix a possible null-pointer dereference in
 musb_handle_intr_connect()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>
Cc:     linux-usb@vger.kernel.org
References: <20191210165454.13772-1-b-liu@ti.com>
 <20191210165454.13772-3-b-liu@ti.com> <20191211080910.GA426347@kroah.com>
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <dc1cbf76-a2c4-a861-0847-d3434b843fee@gmail.com>
Date:   Wed, 11 Dec 2019 17:10:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191211080910.GA426347@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2019/12/11 16:09, Greg Kroah-Hartman wrote:
> On Tue, Dec 10, 2019 at 10:54:54AM -0600, Bin Liu wrote:
>> From: Jia-Ju Bai <baijiaju1990@gmail.com>
>>
>> In musb_handle_intr_connect(), there is an if statement on line 783 to
>> check whether musb->hcd is NULL:
>>      if (musb->hcd)
>>
>> When musb->hcd is NULL, it is used on line 797:
>>      musb_host_poke_root_hub(musb);
>>          if (musb->hcd->status_urb)
>>
>> Thus, a possible null-pointer dereference may occur.
> Maybe, if musb->hcd really ever could be NULL.
>
> In looking at the code, I don't see where that could happen, do you?
> Why is that check there in the first place?
>
> What sets musb->hcd to NULL in the first place?

In fact, my static analysis tool identifies an if check about musb->hcd, 
so it infers that musb->hcd could be NULL here.
But it does not try to find any explicit place that set musb->hcd to NULL.

If musb->hcd is never NULL here, we can just delete the related if check.


Best wishes,
Jia-Ju Bai
