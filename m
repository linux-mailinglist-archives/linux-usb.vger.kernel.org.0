Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC43E4768D0
	for <lists+linux-usb@lfdr.de>; Thu, 16 Dec 2021 04:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhLPDsL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Dec 2021 22:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbhLPDsL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Dec 2021 22:48:11 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 197BDC061574
        for <linux-usb@vger.kernel.org>; Wed, 15 Dec 2021 19:48:11 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so1166664pjc.4
        for <linux-usb@vger.kernel.org>; Wed, 15 Dec 2021 19:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ICJLNF2NHodMvneOTV4tojQBJ7uc36SVxaXKaJCPVaA=;
        b=TLhebApK/rOJqcq0ZX75vJEWwhREsR3FcSwaICbY8qVk2Ln8In02/A4eKEQxBunMR9
         KXU+FHuPBRHP8/fGdGberW+PAwWkTHn3s+scdNAirpeV2IsmP6FdRcrcoQ/oEgBXqQmn
         f6wneemd/W1MZlVSSDReLJu+vXP7lAZies8UGFx8pvPNIGWupsN/fNXMCvLWUDnhr/gu
         7fcZkpbtqaH6c/Er9jLfAlLYNMoGjl1T1XFrxxMCPSrMfb/qwKrzco4aYGDazttS7v2/
         b90UONvGtjcRpsdUJ7H2oSkgpw5Azve78irhWztAv7psquAHQ65UWltIy5BuyNdU/A1m
         2CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ICJLNF2NHodMvneOTV4tojQBJ7uc36SVxaXKaJCPVaA=;
        b=wGxPLUsu2XfZQO+DZ2QBoGr5JOL4JuVJeCmZsGLsWTpymrVukC5dXCDAhsNeWe229l
         rEpsa2hi2AUTy3q18ML3zO1gZXgjpq3NoNIdFLE82l+hy0AxRVaNPoidvkioCEHQ25kj
         S7fMDRZPWkeWSt3EJ3bjeDJMf/SFi+4rF9tGcFidJTddgFYav2J3bSIoHuq2rNaZxMMo
         XaDawOUIMKtCgqcPHFQa0mk043+2UEoNYHxX9dx5yBERNPD/BtMhd9/aXzVCFU04sBBg
         KD/v21OOuJnxGiMI8rjOmgH9VpwXoat6agC47KjTX4XWbdN2kl7OUCa7LHHAHPfedLos
         HNww==
X-Gm-Message-State: AOAM533/ECYwGAcs/tlOEZXfYTHfGKLam+wlkKiWx1AMuOsQSAq0Wz+p
        3XSGdtIpQPXURiOEyxTpHqk=
X-Google-Smtp-Source: ABdhPJwnibWquIr/cPieUgETLNmu43kgxJheKLUb1Wnv/DaonggSRKx7YJ71axdUAsLF2p//eLmA8g==
X-Received: by 2002:a17:90a:3942:: with SMTP id n2mr3598106pjf.77.1639626490524;
        Wed, 15 Dec 2021 19:48:10 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id ip5sm2562690pjb.1.2021.12.15.19.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 19:48:09 -0800 (PST)
Message-ID: <e0e3a179-200c-629a-78d7-941572f32f90@gmail.com>
Date:   Wed, 15 Dec 2021 19:48:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/4] usb: gadget: udc: bcm63xx: propagate errors from
 platform_get_irq()
Content-Language: en-US
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Kevin Cernekee <cernekee@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org
References: <20211214204247.7172-1-s.shtylyov@omp.ru>
 <20211214204247.7172-2-s.shtylyov@omp.ru>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211214204247.7172-2-s.shtylyov@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 12/14/2021 12:42 PM, Sergey Shtylyov wrote:
> The driver overrides the error codes returned by platform_get_irq() to
> -ENXIO for some strange reason.  Switch to propagating the error codes
> upstream.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
