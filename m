Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A672030BA9C
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 10:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhBBJLF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 04:11:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232741AbhBBJGY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 04:06:24 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C27C061573
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 01:04:56 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id f19so23067082ljn.5
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 01:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ET3h/0LKc4PX9UBa8BxB7vGKwsPnbJ2bqe5OlLlpPi8=;
        b=mPjWhWpMIPI+SZQa6apBxEpVtNs/6HEwbp2i4ozQ8pXVIymA79TY7OoAguMi3860Q9
         Ew4cy1rhWnJW3gNoWXNKOD9fmDVZbpPHjYLRtK7UtS2xbBqMCI0WmxNohTYcThFHLnU2
         Q4/ADR36TtxK2KVmq8CZkDSnzn2SY0rqudb49hz5ca0aeWwF6k/jLmpD60voQBJn/5a8
         thxj1v5W9znein/4HsaQXpFhWuDYSa0lUjdVLeRr+gP1jqvMDf9kgj8U1IyAZsRG1nG/
         W3tzoCzFRuvLe3M9La601E/AuoF7N1YheHrtnSeKneIIjff/AnIbKCtVMh9p/aim3qNt
         1xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ET3h/0LKc4PX9UBa8BxB7vGKwsPnbJ2bqe5OlLlpPi8=;
        b=C6XzgmZ8MGXB7sTtwAnsjQQPY7N85AHPNNLy/bjRHUsJQ1v0WyK6YJQSbN5dz6X7O6
         CVOcPK7aD+x/9hxcGL3foftDSOY9dOTF1U3TIz/XZWfgoXERkRup+F0sSYLtgutwSIpe
         3AbUBFURkdbKm0GAKYwRF6TfF5diFT1IkQ1vX6yMTGqBHeA6C69+NYTNm9j/JccojjNn
         OykkFAXnuOSAmGIVURfGZRVoriqVTo5gX510ilIrjikAsY+/8fihrQAx2YZYvYqXkmHr
         lqcvcJsaHXHPBOu3CRNlSywAfEKmyh0Nhq/5oeKAqXtqi/kiOVxiaTeKJ1YLYUPSKsQp
         UxCw==
X-Gm-Message-State: AOAM5305qI7AWaazdsmayEGh5jrEsd090PHYaqkQFJn8qcr2MNYwrn5A
        /9KHwf9aBL6WqrxiYLGAAWM=
X-Google-Smtp-Source: ABdhPJw/QWk5pSl3xfojy0GGD6qTKoXZhVYUxGxJu+saQ04FUrf3bf834l8TQ2fU6fRmGu+LRb4o3Q==
X-Received: by 2002:a2e:155e:: with SMTP id 30mr12944842ljv.489.1612256694709;
        Tue, 02 Feb 2021 01:04:54 -0800 (PST)
Received: from [192.168.1.100] ([31.173.84.55])
        by smtp.gmail.com with ESMTPSA id i78sm3209032lfi.263.2021.02.02.01.04.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 01:04:54 -0800 (PST)
Subject: Re: [RFC PATCH 6/8] usb: xhci: Fix port minor revision
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
 <4627ca7e922019cd9a37073db90e4e9cd585c97e.1612237179.git.Thinh.Nguyen@synopsys.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <90627b9d-9a39-b5ee-4ae3-054764a57faa@gmail.com>
Date:   Tue, 2 Feb 2021 12:04:33 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4627ca7e922019cd9a37073db90e4e9cd585c97e.1612237179.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 02.02.2021 6:42, Thinh Nguyen wrote:

> Some hosts incorrectly use sub-minor version for minor version (i.e.
> 0x02 instead of 0x20 for bcdUSB 0x320 and 0x01 for bcdUSB 0x310).
> Currently the xHCI driver works around this by just checking for minor
> revision > 0x01 for USB 3.1 everywhere. With the addition of USB 3.2,
> checking this gets a bit cumbersome. Since there is no USB release with
> bcdUSB 0x301 to 0x309, we can assume that sub-minor version 01 to 09 is
> incorrect. Let's try to fix this and use the minor revision that matches
> with the USB/xHCI spec to help with the version checking within the
> driver.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>   drivers/usb/host/xhci-mem.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index f2c4ee7c4786..34105b477c62 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2129,6 +2129,15 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
>   
>   	if (major_revision == 0x03) {
>   		rhub = &xhci->usb3_rhub;
> +		/*
> +		 * Some hosts incorrectly use sub-minor version for minor
> +		 * version (i.e. 0x02 instead of 0x20 for bcdUSB 0x320 and 0x01
> +		 * for bcdUSB 0x310). Since there is no USB release with sub
> +		 * minor version 0x301 to 0x309, we can assume that they are
> +		 * incorrect and fix it here.
> +		 */
> +		if (!(minor_revision & 0xf0) && (minor_revision & 0x0f))
> +			minor_revision = minor_revision << 4;

    Why not:

			minor_revision <<= 4;

[...]

MBR, Sergei
