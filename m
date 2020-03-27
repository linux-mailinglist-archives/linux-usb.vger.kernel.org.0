Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDC9195356
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 09:53:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgC0Ixf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 04:53:35 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42422 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgC0Ixe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Mar 2020 04:53:34 -0400
Received: by mail-lj1-f195.google.com with SMTP id q19so9312857ljp.9
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2020 01:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R6RZiXEcIsLToTYFi1sESEyU5BX8rS5/YP6936j2TZs=;
        b=RMaN69VBVbnZ6XLul4Z0c1rp0GoPJlXhEEXjeth0ysbXcs/RJUX/UOS51jg6dk+nRn
         L1ydMdtag3eLejmn2W173HzX8HGhLKJx4wVbcyP6AUyOcwe0tw1cQKLdvUBdARG6XWn/
         X+JED/o48CSCpvOyW9/x8yjaq7b+gVd9q37s8I1OEMD9mZl5rm5ch3CekchcsHXeIh9Q
         gahgxQfxL3CvjvwNQv/m3SfZ3rA7ib5ZFcmfX13vUqHMJsuQs+lnFsr358PmmbflVbGv
         WIcIkefmFLSK3gjvhiCxvHBCSSie2Lc9UTITIf81pUiVJr8U+UY80/W752lQ2HdfWJqz
         WHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R6RZiXEcIsLToTYFi1sESEyU5BX8rS5/YP6936j2TZs=;
        b=EndYEvx39QzPCQnihOAYeJlOEbRflB+CwGpir0RjoywkAqEOJ+0SEeoyJl6+IwUOsD
         IUmqR3QBkvCr1vmOkM/Pmk1vMG/Ei0mPg0TYAVhlKsIrydN/ADESJAnhbYbav6YzPkyx
         XMSrh2tr0HlZTfZ4NQ6UEhxTyHQj9CfDCvH1Unu8XckS2zSoyhSIRwVZW9vQ45iAKF+Y
         Cr+2k7cC3y0JjvSkkblmSEShKAvpKza1t3GSESQNlrK4x34Lf/8i9zGiaWGcTyh1HZAH
         sEOq6lrM/xhzdRfQHrnRXi5AK+1AoREnDXuiupm6PQ/F+rSPb5pTsxPT6KIbFiXcZHN8
         3TuQ==
X-Gm-Message-State: ANhLgQ2T519FM53RUPiTjInElJcZV8YAjeY2VVm9SP9gi9m7MCJx0W2/
        03PuD4GPeo33q132pv59eobi9g==
X-Google-Smtp-Source: APiQypIsQrjwe07VNObG2auVNwvv+ikRm3k1RyTxLFqb1kdpdx8DuP507njU6psxsnB+0kRsko0DZA==
X-Received: by 2002:a2e:b554:: with SMTP id a20mr7841807ljn.34.1585299210596;
        Fri, 27 Mar 2020 01:53:30 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:489c:7e29:1184:adc3:6cdd:61c2? ([2a00:1fa0:489c:7e29:1184:adc3:6cdd:61c2])
        by smtp.gmail.com with ESMTPSA id v19sm3007695lfg.9.2020.03.27.01.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 01:53:30 -0700 (PDT)
Subject: Re: [PATCH] usb: dwc3: gadget: don't dequeue requests on already
 disabled endpoints
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>, lars@metafoo.de,
        alexandru.Ardelean@analog.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, bigeasy@linutronix.de,
        m.olbrich@pengutronix.de, kernel@pengutronix.de
References: <dc52d6a0-12ed-a34c-01c4-0fc5ccbf7b1d@metafoo.de>
 <20200327084302.606-1-m.grzeschik@pengutronix.de>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <035d6582-b513-2ebd-f755-325df52e6a10@cogentembedded.com>
Date:   Fri, 27 Mar 2020 11:53:18 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327084302.606-1-m.grzeschik@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 27.03.2020 11:43, Michael Grzeschik wrote:

> dwc3_gadget_ep_disable gets called before the last request gets
> dequeued.
> 
> In __dwc3_gadget_ep_disable all started, pending and cancelled
> lists for this endpoint will call dwc3_gadget_giveback in
> dwc3_remove_requests.
> 
> After that no list containing the afterwards dequed request,

    Dequeued.

> therefor it is not necessary to run the dequeue routine.

    Therefore?

> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
[...]

MBR, Sergei
