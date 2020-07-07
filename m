Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0143621686A
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 10:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727094AbgGGIfT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 04:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbgGGIfT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 04:35:19 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A99C061755
        for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2020 01:35:19 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e8so14649277ljb.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2020 01:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VSt2gNx7u5TrD0wymr8ZWYE3yS5oRsktvc3jsQJqJl0=;
        b=MaVN0XDpN+6YXgXhI+/d1XIwktyVJq2MXzZmQphSJQiPKOhqpTZnASup4ownD/YivG
         0Wowib0FRUT5Wi7NYvSbFiCLeRfSPRu2yaXncXj7GDvA+bHhz3kXWn4UOeps5lqYW6u+
         7XVUihn894JZD3TC09c3XR3v7f5icLOgjcfSmnEMy/WMTzIAbTWpDB3ZgWuaaWbYVzp6
         HjNb5Rv19G39IONz2dp7wYJxfdKf6txXu7aLF/hrJJYXmPWcznshP9N9/chaZfeEmrdj
         81TWlSuoJrAMVyiehInhNEKw6xi6rX5yYfHCsVP191LzBSqCs+MKboOs351cGw7xNfdN
         PnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VSt2gNx7u5TrD0wymr8ZWYE3yS5oRsktvc3jsQJqJl0=;
        b=TEdHngfQ9OE7ILKAOtQPLCmV1mw1Py5QHHZ6qQekh9KKgR5+ve3IK65nUjG37OUakV
         lSajym8wcJ71O9fknSM8BvuR4IM9qP9dok0bE2JjhVXz1GucRh0ltFWKQUvO3PPDvgkB
         qiluMHZsqAwGmhb7uR4a/C440LH8YNwrZufd+PG6MOV3R81B47e7kb0pYuIF1sA5q1nZ
         vM9IZqkTiVxcr1ERs8D+7MvNG3ORIhf6lqxQdR83RUPjsE+8FtQ7G01iJZQ6bz62W9IB
         LXjthgsjgsgPQl/0418ZJgSN9eWUfllikQcQIcrnwmtouOHJchctMbvitvOZ5css0M8n
         evPQ==
X-Gm-Message-State: AOAM531cponI2hZ1bIblt0y72U2Llyi3NgbvZb8CxzCBPwohLfEnq3xA
        l03Z96r4Bmg0LLRVS6vzWCLiSQ==
X-Google-Smtp-Source: ABdhPJyL8zCRmUmt9EUAMx/qZ2oMUFwZLKzoSi2UGulxyukwEAxXwTu09QNmVeVfBnsbIwB+vB638Q==
X-Received: by 2002:a2e:4b12:: with SMTP id y18mr26715115lja.117.1594110917491;
        Tue, 07 Jul 2020 01:35:17 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4609:f5ea:9102:8276:8e24:1626? ([2a00:1fa0:4609:f5ea:9102:8276:8e24:1626])
        by smtp.gmail.com with ESMTPSA id i2sm9381ljn.109.2020.07.07.01.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 01:35:16 -0700 (PDT)
Subject: Re: [PATCH v3] usb: gadget: function: fix missing spinlock in
 f_uac1_legacy
To:     qiang.zhang@windriver.com, balbi@kernel.org
Cc:     colin.king@canonical.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20200705124027.30011-1-qiang.zhang@windriver.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <09b2225a-d9c8-c40f-1e73-e18ece80e3bb@cogentembedded.com>
Date:   Tue, 7 Jul 2020 11:35:12 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200705124027.30011-1-qiang.zhang@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05.07.2020 15:40, qiang.zhang@windriver.com wrote:

> From: Zhang Qiang <qiang.zhang@windriver.com>
> 
> Add a missing spinlock protection for play_queue, because
> the play_queue may be destroyed when the "playback_work"
> work func and "f_audio_out_ep_complete" callback func
> operate this paly_queue at the same time.

    It's play_queue. :-)

> Cc: stable <stable@vger.kernel.org>
> Signed-off-by: Zhang Qiang <qiang.zhang@windriver.com>
[...]

MBR, Sergei
