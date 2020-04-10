Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7460D1A44A9
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2020 11:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgDJJrN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Apr 2020 05:47:13 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35713 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgDJJrN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Apr 2020 05:47:13 -0400
Received: by mail-lf1-f68.google.com with SMTP id r17so989964lff.2
        for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2020 02:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ixWyit/BPi4Ka4deLVPgn2JfqAzulpluWjNuC7xycq0=;
        b=0VEEMUSXUIZzs5iYhN0FjOM3beqogpopP5rDDncQ9uEaoy9IhQCJpSjbS/XcuVqDNn
         U4gUQkn5snZ9ZQ951zs+i+EwryOye3aC64VlDiiQi91q54yOP4gLGuYywdugT/hJpCIp
         C9a//G0v6owmNFn1orp3IT+/Lk3iCxeR/d8bvRnRtTgW+gGXHLUE8BuVyv2tZXgKVDO0
         AdUUecxb5LHlNX8BwTIYJBdEBA6UF8fRgSiyky5Dp/ppC5ILPbCQdykVBXwRQ684kNIp
         rsKAmvl92WXQL/jppPC/wRaply/yTd2ovdgP+9ZA8v8YQubFLxfk2BJx24xnib5XMnwn
         3m9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ixWyit/BPi4Ka4deLVPgn2JfqAzulpluWjNuC7xycq0=;
        b=R4q1Cw3VHZEkoXrhLHkALpzqdQE2rVQRFUxD/q3dQML3B8JKIjNRFPCP5g0RhJDybx
         BTWW7AFtpzUoRgJatOvUV8Z5X/673WcTQ3BH03taOHZnVvupZVpanNMo3OEekXf3M/21
         diwi5sY84+oP7+5XwtqEZn3ljDiPhnaI1hUcADNqy056fz4Pbmd2s5aCUFQfqnSHvtyE
         3ivR3SVJbMq218IDUWx0rQ9PaZjm7Qgb4SfOhTJxb/oa7V9IFpqh2/9UNV7SHFi1Tj5I
         qwRYEOwnJTgczJ6wwB10akMJ2kWg6PIXyt3E+o4InpsVFlPctyDsXDrRvOMmEHzrRgVv
         LhCQ==
X-Gm-Message-State: AGi0PuYNN8QYmog9XpJYvaf/6DB/L6p/bpFEmzOlDdy6iWWR45GI6xfk
        xncCnN92Eo5Hu/ubo+evNQVRXw==
X-Google-Smtp-Source: APiQypKlvy1p+ulGm7rmqXh0dNWrbd9j3xSh46zFxUDGl1I0qpueqnZ7JooiYzM/K+nLb3U/hKGRBQ==
X-Received: by 2002:ac2:498d:: with SMTP id f13mr2157743lfl.75.1586512032084;
        Fri, 10 Apr 2020 02:47:12 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:449c:a024:b8e5:a34a:c38e:b427? ([2a00:1fa0:449c:a024:b8e5:a34a:c38e:b427])
        by smtp.gmail.com with ESMTPSA id o6sm794019lji.15.2020.04.10.02.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 02:47:11 -0700 (PDT)
Subject: Re: [PATCH] usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
To:     Tang Bin <tangbin@cmss.chinamobile.com>, leoyang.li@nxp.com,
        balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Markus.Elfring@web.de,
        Shengju Zhang <zhangshengju@cmss.chinamobile.com>
References: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <02aeae70-60b8-761c-b058-8b4bc78ffd99@cogentembedded.com>
Date:   Fri, 10 Apr 2020 12:47:01 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10.04.2020 4:58, Tang Bin wrote:

> If the function "platform_get_irq()" failed, the negative value
> returned will not be detected here, including "-EPROBE_DEFER", which
> causes the application to fail to get the correct error message.
> Thus it must be fixed.

    platform_get_irq() prints an appropriate error message, the problem is that
the current code calls request_irq() with error code instead of IRQ.

> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
[...]

MBR, Sergei
