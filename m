Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BACA11E0BDB
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 12:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389782AbgEYKdi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 06:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389778AbgEYKdh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 May 2020 06:33:37 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6731C061A0E
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2020 03:33:36 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d3so7364093pln.1
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2020 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=footclan-ninja.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=bcIsWmmEkRWoaOrX+BaWGDzqoQqiuKveo/AD/DMmyLs=;
        b=0CisCT68V7ucr2HapFKzya24WVrp+iCTX2mnNGSV7JVfHbSNPfE5UgX9XFcvhC3YeK
         lzwT19u8/X2J7Gl6lbQIw4N65c+l+3gD8aSY4/RsPeIHlYAYJvZPHPdbWIZXcg49iTbQ
         vzKwFSPxNE/Q120KjNrTQM3hd5nP+W+BybSFXzZ2+fQsVeQoqcdHlI3H+dowRiFZKoIO
         2XCCOkB0IzkW4usH0DBj1vaiyYC66MWzYshUmvTm2eZtrJrIWFp151EeWd/HTg//tZy0
         II4FZXgKMQyMxa18Snt+SqCb/qf9TRJJlL6MIFurKt6cp7S7vWzi7it+ZgxYg+wfcBWv
         fekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=bcIsWmmEkRWoaOrX+BaWGDzqoQqiuKveo/AD/DMmyLs=;
        b=SOAHoiruPj/EEesP+KT5CyP6djF7HQuCWZ8zS07XjB1Fe75jTOiBlHlnQZMnGGRsUQ
         z+dTDRXD4dbajeKGBmLVm1aKZBSZMXf814GkdE7QNfu32grf0WZ4WHeJw3Gk2jqS1zcP
         LysGHISRYUQ60g3e/tTBZFGCOZvZgsqQknnFj/2iq4mwA+rFgwiEVLaXtJnc41Up70Zd
         3Y5Jl1oA8rpGnlkNGQeb56lc3rkp8Al2UDxJj8/9O7xeURgTICkbuCjfLgsfZHPMxvxh
         ipFBsjK4Mo1a9x1uBrSl0xSLSQACJVz6VwOPIv2MzEpn8acAHhhFudAES+mKpqimVkmO
         tL+A==
X-Gm-Message-State: AOAM533AtJ0W2sIkbKFi45u41XoYUBK96tTAXZl4vIdj7hWgVIZonp+b
        SDyr3LxWXWvFchF5qikl19gLOQ==
X-Google-Smtp-Source: ABdhPJzuzGH3bJR0NQc8zAEdKDEVVW4wg4JbVUGvXIq+RctefMv5/XpHLGjgmdCT3aJ+yevCUearCg==
X-Received: by 2002:a17:90a:c78f:: with SMTP id gn15mr19715320pjb.103.1590402816108;
        Mon, 25 May 2020 03:33:36 -0700 (PDT)
Received: from [192.168.8.100] (pa49-195-155-227.pa.nsw.optusnet.com.au. [49.195.155.227])
        by smtp.gmail.com with ESMTPSA id x2sm12521503pfc.106.2020.05.25.03.33.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 03:33:35 -0700 (PDT)
From:   Matt Jolly <kangie@footclan.ninja>
X-Google-Original-From: Matt Jolly <Kangie@footclan.ninja>
Subject: Re: [PATCH v2] USB: serial: qcserial: Add DW5816e QDL support
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200521004358.8949-1-Kangie@footclan.ninja>
 <20200525093951.GC5276@localhost>
Message-ID: <d0535328-6773-4565-82b9-1975cf875a8d@footclan.ninja>
Date:   Mon, 25 May 2020 20:33:31 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200525093951.GC5276@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On 25/5/20 7:39 pm, Johan Hovold wrote:
>> Hmm. I'd a call a build breakage a bit more than just a "typo" as it
>> indicates this patch was never tested at all before being submitted.
I applied, built, and tested it against the sources for the kernel I run 
on my machine, but made several silly mistakes: both manually applying 
the patch to my copy of the repo (which is not my running kernel), and 
not build testing that change before submission. Not good indeed.

I could definitely have been more descriptive in the change notes.

Consider me appropriately chastised!

