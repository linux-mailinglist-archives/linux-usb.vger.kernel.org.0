Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B14AD79C4BF
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 06:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbjILE0U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 00:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232011AbjILE0Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 00:26:16 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704EDAC
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 21:26:12 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c39bc0439bso17110755ad.0
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 21:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694492772; x=1695097572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/0rxg0+vHd53VN3VMlLp1ejjn6Smv43yD42Ah/G3VQ=;
        b=b6OeDOmjwObh2fNZMbWG2ExfRAW8We3XJWbE4X7X5n1Ealatp46WJBDUY+UEHT5Hjj
         7Zqg26xOYq76NosBMcq5aSKCEUJPDeVDjOnhtNmv9c8q3vNElBuCj3BShy+UfFFze6qy
         N3W3UvjuuMyS7RJzhnY4H7IXjA3zMv9azWf5zFsBToMZIElKH44IZTDnpCIbb3cdc3jD
         7WAvncwRg9OsKj3RH6gSl4LrlbqhDJN4PrdHAEh9cyVMtmCIjKGQwys3GBB6InKEpX0Q
         ZM92a4fYHKOCDhbKWA6aivqChxldR0SfcQ+JLbe8fu2tSH+ZLVohGeJ591i9tfj0xG9U
         reTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694492772; x=1695097572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/0rxg0+vHd53VN3VMlLp1ejjn6Smv43yD42Ah/G3VQ=;
        b=PfKGBkrTsbHL+XMlm1hEe/mU2ytwflHl04t9zR5mDjaOBheRy1dDP2NbeTu3DHvtk6
         paXIT07FpToSE0p3aRe822MUvNkCnf81oCoPPbBHbbKNXsQOu6wHrVQ78GrG73EG9XnG
         zH/LaHYjDj0mI4+lDUmp6F0HDzEU9PvJn4bZ49JvxkFZLTK2sHHsdxUiPEDKwYrEAjDS
         DEJr8YqaOQ5qBN9FiJEj5r2UWfBULxFllJ/5gZ8qwBXSIik2poOjNzM15vk/HXy0bLmp
         VYgTAj/k5oNasGAYbZ3n0+GjTOGVHBHF3sc3apTEY47CePTV/1aT+Q3LP02Lu3RVAKR7
         3ytQ==
X-Gm-Message-State: AOJu0YzQ0aWzLI7rs5kQ0Qiivdy5NlZrSTGsSvsPNB9Fq9fsdH4TBfp8
        yUlAWwNLjlMTWFFsEnFNcYg5oA==
X-Google-Smtp-Source: AGHT+IE7Mi6bn887OP7gSkPIh39wdc2Tptl1siXQFA1vinyAOUONKdsLqrEP8Sqa/EU4svZ2LRmesw==
X-Received: by 2002:a17:903:1cb:b0:1bd:f69e:a407 with SMTP id e11-20020a17090301cb00b001bdf69ea407mr2175814plh.8.1694492771560;
        Mon, 11 Sep 2023 21:26:11 -0700 (PDT)
Received: from [192.168.60.239] (124.190.199.35.bc.googleusercontent.com. [35.199.190.124])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902dac100b001bdb85291casm7238397plx.208.2023.09.11.21.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 21:26:11 -0700 (PDT)
Message-ID: <df65040f-fbd9-4e9a-be38-1e30f7f613d4@google.com>
Date:   Mon, 11 Sep 2023 21:26:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: uvc: Move usb_ep_disable() to
 uvcg_video_enable()
Content-Language: en-US
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
References: <20230615093406.80195-1-dan.scally@ideasonboard.com>
 <20230615171558.GK741@pendragon.ideasonboard.com>
 <dbf1e426-cf86-46c4-afb9-9d6983f0fb6d@google.com>
 <ZPXrceImaT9GevmA@pengutronix.de>
 <CAMHf4WJ6hBEzPUCOX8wbnGZ7pUuG1a+mwR3h=d6=kyyf9W7p+g@mail.gmail.com>
 <ZP5kOcuKykSY8ycr@pengutronix.de>
From:   Avichal Rakesh <arakesh@google.com>
In-Reply-To: <ZP5kOcuKykSY8ycr@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On 9/10/23 17:50, Michael Grzeschik wrote:
> Hi Avichal
> 
> On Fri, Sep 08, 2023 at 11:54:40PM +0800, Avichal Rakesh wrote:
>> Apologies for the late reply, I have been out travelling.
>> On Mon, Sep 4, 2023 at 10:36 PM Michael Grzeschik <mgr@pengutronix.de> wrote:
>>> Cc'ing: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>>>
>>> ...
>>> I am currently trying to solve that by preparing a patch that is
>>> fixing the use of the requests when deallocating them. Since currently
>>> the uvc_gadget is also running into wild use after free issues because
>>> of exactly that async dequeue and dealloc situation.
>>
>> Do you already have a patch up for this? It seems my LKML-fu is
>> failing and I can't seem to find the thread. If you aren't too deep
>> into the patch, can you take a look at the request counting mechanism
>> added in my patch? If you have a (somewhat) consistent repro of the
>> use-after-dealloc issue, runnin it through the whole patch would be
>> very appreciated! It is supposed to fix the exact problem you've
>> described.
> 
> I just send out v1:
> 
> https://lore.kernel.org/linux-usb/20230911002451.2860049-1-m.grzeschik@pengutronix.de/

Thank you for the patch. I do have a few comments on it, will respond on that thread.

> 
> My patches did go back and forth between changes in the uvc-gadget
> driver and the device-controller driver. My latest version was including
> calling free_request from the complete handler. I found that option
> while looking into the uac2 gadget code. It took away a lot of
> pain while trying to fix the issue in the dwc3 gadget driver.
> 
>>> IMHO it should be
>>> save to call dealloc after calling dequeue. Which is probably true for
>>> other usb device controller driver other then dwc3.
>>
>> Perhaps Thinh or someone better versed in Gadget API can chime in on
>> this, but as it stands usb_ep_dequeue specifically says that it is
>> async, and gadget drivers must wait on the complete callbacks to
>> regain ownership of the usb_request. Until the API change is made, UVC
>> should adhere to the current API?
> 
> Since you mention that usb_ep_dequeue is async I am very confident
> that it is safe to free the request in the completion handler.
> 
> Although we could cleanup and improve the uvc_video_free_requests
> function itself. But with the patches I have here the use
> after free was gone so far. So they should be good so far.
> 
>>> For some background. The dwc3 is putting the requests into a cancelled list
>>> that will be cleared by the interrupt handler and that is dequeuing them
>>> instead. In between the dequeue call and the interrupt call the uvc layer could
>>> dealloc the request which leads the interrupt handler to dequeue an
>>> already freed request.
>>
>> This roughly tracks with what I gleaned from skimming the DWC3 code as
>> well. In local tests the complete calls were always timely and I never
>> actually ran into the situation where UVC deallocated an unowned
>> request, but as someone (I think it was Alan?)  said in a previous
>> thread: technically possible just means it will happen eventually
>>
>> Please do review/test the patch. I'll send out a formal patch on
>> Monday once I am back, but would love to have some early eyes take a
>> look in case there is something obvious I missed.
> 
> First I tested your patch with my sketchy setup where I more then once
> run into the use after free condition. But with the patch this was not
> gone.

Just to confirm, use-after-free issue was _not_ fixed with this patch?

> 
> I also looked over the patch. As what I saw this is a possible
> alternative to my patches. The changes are doing some similar things.
> But the code is changing to many things at once. Please split the code
> up into more logical chunks. Perhaps you could try to rebase it on
> my patches. And start from there.

You're right, there are two issues this patch fixes. One of which is the 
same as that fixed by your series of patches. Uploaded v1 of the series at
https://lore.kernel.org/20230912041910.726442-1-arakesh@google.com/ 
(cc'ed to you) which splits the fixes into two separate patches.

Thanks!
- Avi.
