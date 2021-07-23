Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D133E3D3D99
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 18:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhGWPtN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 11:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbhGWPtM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jul 2021 11:49:12 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503E8C061757
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 09:29:46 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so2579105oth.7
        for <linux-usb@vger.kernel.org>; Fri, 23 Jul 2021 09:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8rBL90M5hYVaYFxbwTr6am4zA6NsYnm1G1zAGhOeDjk=;
        b=HgvPO3mAYqNYzr4LaDFGBrMZd6ilYO5nP6zUy7BaVrCiZ2JuWxU0zakcpLQZId2caX
         A78zuffdKzV/qy98X5DQ6SnkDm7oShPllxcUwowbRe5zHq0yuU7Zc4iUEgfVhdcHTA4q
         2BT7eqw7VoH13qbMoNdR/Vv0T5oSU7I0MWDfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8rBL90M5hYVaYFxbwTr6am4zA6NsYnm1G1zAGhOeDjk=;
        b=UwjlKDCF5OkzLWxBih6DAy6kcsDu+HZQsnOoS5bl49f5xSeUfgp99GUGYYVNORXDGt
         9fnnkwKiUpfPriG1vdzWoTa/zmWAdGfyW31CzAC+g4GraQfUDNpSxrX9hz/uV1nE3TzU
         buw/pUjBWqaDbUbpc+hYncU0mzv+qGYQzOWrl16USNWRyIHvyZYY7WfI82OWYrJ6GtL9
         3Lb3ecDncC8amqHjp1ZaT/OuMS9cgiQ5NHdYCpNbpZxKfwoaRZhh8pyC3HIRFkRoRO0q
         x3xCg3xDVsGin/3x9QdkLzUekXg9xXkbj5tXCZkTOvgWMck9AuB/d7Xpu+bFS0u9ZrZ/
         MV/w==
X-Gm-Message-State: AOAM532JAnBSbRy+RUP87LNx0q9JIlmEobTsd7A4k1wUo9mmy43jnTdM
        UZh9Vqlq7AxDGKUkB7icrllQmQ==
X-Google-Smtp-Source: ABdhPJzc9fiP7N0If6VhsoL/ftQTc6YzKU1t6uYtq/38oXN1crdLWO5GMXyX/UhDFGei87414EW/BA==
X-Received: by 2002:a05:6830:19fa:: with SMTP id t26mr3707955ott.58.1627057785605;
        Fri, 23 Jul 2021 09:29:45 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id n202sm2560832oig.10.2021.07.23.09.29.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jul 2021 09:29:45 -0700 (PDT)
Subject: Re: [PATCH v2] vhci_hcd: USB port can get stuck in the disabled state
To:     Michael <msbroadf@gmail.com>
Cc:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210721235526.10588-1-msbroadf@gmail.com>
 <7b02cb66-d672-ae95-01ea-c6015725e1ac@linuxfoundation.org>
 <CALdjXpA4_eXen6RjhsEBYt8CQs-2gzwYs9h9q0Z2LKZ=rXVp+Q@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ad07410b-05d6-6a12-13df-14e31cbf50ff@linuxfoundation.org>
Date:   Fri, 23 Jul 2021 10:29:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CALdjXpA4_eXen6RjhsEBYt8CQs-2gzwYs9h9q0Z2LKZ=rXVp+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/21/21 8:27 PM, Michael wrote:
> You can pass through any bluetooth dongle (or xbox wireless dongle) through usbip and it will cause this issue.
> 
> For example, here is one of my customers https://www.virtualhere.com/comment/9432#comment-9432 <https://www.virtualhere.com/comment/9432#comment-9432> with the issue.
> 
> The device is in the VDEV_ST_USED state when a reset occurs and so its never re-enabled
> 
> Furthermore there is a bug in the line pr_err("vhci_device speed not set\n");
> (L479) because resetting a full-speed device is not an error.
> 

Can you provide me the full demsg from host and client including the part
where device is attached? I assume usbip tools from Linux sources are used?

Also send me lsusb output on host and client

thanks,
-- Shuah
