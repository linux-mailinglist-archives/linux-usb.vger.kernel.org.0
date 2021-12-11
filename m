Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35DB24714BD
	for <lists+linux-usb@lfdr.de>; Sat, 11 Dec 2021 17:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhLKQ2b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Dec 2021 11:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbhLKQ2a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Dec 2021 11:28:30 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CEFC061714;
        Sat, 11 Dec 2021 08:28:29 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u1so19817404wru.13;
        Sat, 11 Dec 2021 08:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KMnxBDXWjhFN1d7JfnmnLEIYQDAp46eV4SjtCiGo6Zo=;
        b=fxSUGjHON+She3GcCPqouXXxiRvSpT29QXgWk/naHi1JZOGDZzeS3jcu0RqkwqwrI8
         KZnGsmtI9Cf0c6hNugNWNIHQwSvYDrtDBycjR/IhfmYXKOjzXTCZtFc5aQb/mPEv+rYY
         ukCcI8M/tw/W/V15yKeqmfnH8bUZq8zTef2yZjwxTBm9tPwrJNBi9h/K0+/3qI9kP/BX
         DmdXxvdJ8WhYWvQUjPiLUMZzE8bIRUoIW32zELmNQ/p5sdmJy2jX/3/ukBrMBE9m7Rs6
         g/GYDfiv+csuFtIHAQ3nnd5HETJoawk8L5/t345ghRgmwdngl/nGmfJpPtVuTQYTvHaJ
         ciUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KMnxBDXWjhFN1d7JfnmnLEIYQDAp46eV4SjtCiGo6Zo=;
        b=x+JtCxCCqZiKGHaqzyWUi7gsuDLbjELwFZC9uiBxeoi643EGC6IwyzzRvUdrCwWT+0
         kxls0XcLNqdHe5fOs+M8Bi3JAY1T1g0x8Yumb8ZkWdUERqPxVy5oGtQBvr3FPuQtSqRr
         5eUy0ncwvIUKCcSCQedniK+0ebT/5GBCBPZt2gGuZ87Qro113G8K8+PfZnTOm4KfdD63
         pFWH1u+rBk6sWrsSsliUa+OdLMFYkHCNpuQZlrJUfhp9QFDTCFn0UJbO/mIHMYPAIzOv
         c30vIrgnA5lB7DVyfUQPYnY+mtphpt0DAQOEO56RMfejTsYxJjrTVlqEqN4Q4bC52N4x
         ZY9Q==
X-Gm-Message-State: AOAM530zGiKE6LpxlAnZHmEjO3WdKc32YgcAtNrU5CqtPysEuwbpVvIG
        iCCjy3N9yznVuy43RzpAqEk=
X-Google-Smtp-Source: ABdhPJybQo1ZKqUerPpUywiG/wpXpn6gnZE3w7qfTSpZ91WFsDUzBq3xHuLzioCyesEkcNZHa2G5Gg==
X-Received: by 2002:a5d:59a2:: with SMTP id p2mr20886178wrr.252.1639240108312;
        Sat, 11 Dec 2021 08:28:28 -0800 (PST)
Received: from ?IPv6:2003:c7:8f4e:657:561e:4972:c8dc:8447? (p200300c78f4e0657561e4972c8dc8447.dip0.t-ipconnect.de. [2003:c7:8f4e:657:561e:4972:c8dc:8447])
        by smtp.gmail.com with ESMTPSA id m9sm1859657wmq.1.2021.12.11.08.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Dec 2021 08:28:27 -0800 (PST)
Subject: Re: proposal to delete the skeleton driver
To:     Oliver Neukum <oneukum@suse.com>,
        "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
References: <df5bb0a6-e5f5-e062-5c02-e1de612058e2@suse.com>
 <Ya/jrm59Ai226JtE@mit.edu> <9b33445d-7bf9-684a-bf53-f472bb928b96@suse.com>
From:   Philipp Hortmann <philipp.g.hortmann@gmail.com>
Message-ID: <03204a1e-2423-5cd1-b116-9bae51e92000@gmail.com>
Date:   Sat, 11 Dec 2021 17:28:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <9b33445d-7bf9-684a-bf53-f472bb928b96@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/8/21 12:13 PM, Oliver Neukum wrote:
> 
> On 07.12.21 23:43, Theodore Y. Ts'o wrote:
>> In addition to your idea, I wonder if we could point people at some
>> simple "real world" drivers that people could look at which are (a)
>> simple, and (b) relatively clean and free of anti-patterns that we
>> don't want driver authors to copy pasta into their drivers.
> I will try to. It may come as a surprise but if we want to limit
> ourselves to drivers implementing a classical character device,
> the number of recent examples dwindles rapidly.
> 
> And I think we should stick to such devices to give examples
> comprehensible and relevant to as many people as possible.
> 
>      Regards
>          Oliver
> 
> 
I like drivers/usb/misc/usblcd.c as one simple example. An older version 
of usb-skeleton was the template. It is using urbs only for writing.

Since no driver seems to cover everything we may need two examples of 
maintained drivers as transfer performance and interrupt endpoints are 
not relevant for usblcd.

Regards
Philipp
