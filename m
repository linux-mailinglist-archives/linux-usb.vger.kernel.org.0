Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E443515F80
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 10:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbfEGIiB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 04:38:01 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45600 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726517AbfEGIiB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 May 2019 04:38:01 -0400
Received: by mail-lf1-f66.google.com with SMTP id n22so3644034lfe.12
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2019 01:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H56LWvRoJenj3gjF/AqdoHfS2q4UJwGAV40zvmjB1F8=;
        b=WSNc9E++2ZiSjXAwx0aZUTX1qfObMgJ5OvXyTboldnayvobrppJPm2DoAuOCJSoVxP
         lp6fi37TUkNRefBszMSbd+q5cxChgY8axLrLpYqv/UNNNfWqW1rcc5pTQwS3grcac4C/
         7I3w6IC9C4LVzgrgcNdbntSiGg6N7CxqhH8btge6Dh0v8krPz9HUywLJ433+dFPhUDBN
         ODlTR+K6Wrdoj+Oy5t4hL0NqRtADW6vdSHfANl3fGXNd9ux+tS1gR/AMfZSITiJ9TpIb
         70O8xMkZi/VrnlHVzWOwIlTeaCvlIkgSUfSZ/d0aPDlt8Y4P9bmfn9wbT0RXBBJH1RVU
         isbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H56LWvRoJenj3gjF/AqdoHfS2q4UJwGAV40zvmjB1F8=;
        b=IbZ/CWL/pXhvDqwooh3JjnNGVdDujxPTP+Qc/t5cKZNhBY0cOpvx+wXIgMqaHaT4rd
         AouNz5etVevZ+OSiSVgOvwd+4Z51Keh+Mi8kcQhNkWk37jtGYr7iKwUPn2hR3HDo81VB
         zCE0ioZLULcnu7dksh2ixBjwrWvEfq2ygJLi2SJibujVneUiG4zdPd2YZpnx6TNX4OH1
         jZIzrV1IAWArerLmrv11mj0G/PkJVmx97WYbz7eASddQuOf0iwXM7c7ADQqeio1UTKUv
         ZhCG/PO5rviZtosiOUfzBY+SOU942sqRCKGcssF8n1mkt2LK1Xu1iZgrlWGM/cv+DjCH
         fkyA==
X-Gm-Message-State: APjAAAXS3EVF9C/BprfPwNVOyLxgrnUfWtq26VAMcLTl+C1MsMD3LUnw
        Qm+w3jR1J31jbEB34eiWfOimzw==
X-Google-Smtp-Source: APXvYqwy2oWfRQEzrfzKXkmx3BByGTTvYGOnGz9B/N3HP9OzEfVDwRmTfl8W5mkaDsKD6t0VlSuymw==
X-Received: by 2002:ac2:42d5:: with SMTP id n21mr11557068lfl.162.1557218279099;
        Tue, 07 May 2019 01:37:59 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.80.92])
        by smtp.gmail.com with ESMTPSA id r8sm1168087lfp.55.2019.05.07.01.37.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 01:37:58 -0700 (PDT)
Subject: Re: [PATCH 02/10] dt-bindings: rcar-gen3-phy-usb2: Document
 uses_usb_x1
To:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-3-chris.brandt@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b3c3e21d-35aa-d222-e8d4-e5f63286044e@cogentembedded.com>
Date:   Tue, 7 May 2019 11:37:53 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190506234631.113226-3-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 07.05.2019 2:46, Chris Brandt wrote:

> Document the optional renesas,uses_usb_x1 property.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>   Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index d46188f450bf..26bf377102d3 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -46,6 +46,8 @@ channel as USB OTG:
>   	       regulator will be managed during the PHY power on/off sequence.
>   - renesas,no-otg-pins: boolean, specify when a board does not provide proper
>   		       otg pins.
> +- renesas,use_usb_x1: boolean, the dedicated 48MHz crystal inputs USB_X1 are

    Hyphens are preferred to underscores in the DT property names.

> +                      used for the PLL source
>   
>   Example (R-Car H3):

MBR, Sergei

