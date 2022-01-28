Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36C449FABD
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jan 2022 14:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348769AbiA1Ndg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jan 2022 08:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348692AbiA1Ndd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jan 2022 08:33:33 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664A7C061747
        for <linux-usb@vger.kernel.org>; Fri, 28 Jan 2022 05:33:33 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id c190-20020a1c9ac7000000b0035081bc722dso4053306wme.5
        for <linux-usb@vger.kernel.org>; Fri, 28 Jan 2022 05:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Q2chQh3ZSa0GKVYP8Nl+va6NIlD47CmgDYXabLwHRf4=;
        b=upODrhy8ePG/VCMU4473jl1Sdijg6hUhxr2gg/04BSQGSi1Qa36DGGHRWQm/PYeC3a
         xKCFMY5GdD+AUzImrO1FpzZ7DgmEubzJtwMf1rSW06qAJrdS+CfSjeJIz3tB2L9itL8M
         t84u1FIYoXG0mD21ipbLcE+j4NID4fmQxKVZlhoGh37rN587sXiqhykJT5a+EgV7/GiA
         3VFN1s9BIqkim3VGde1zMAQopJ1x3hyI4ndYc47DotTKayozQRgTxaHkpn0ATCEzEHJg
         Ew9vcGHePF8au1q/nBENQHcaESsI9ao/39z9BxYAs9/g64SrtkBij+Q1+qiJqJwuD8Xa
         Ur8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Q2chQh3ZSa0GKVYP8Nl+va6NIlD47CmgDYXabLwHRf4=;
        b=wV7KPVMcv7YcGrt9bS95VG8Y7GcsnwH+eBeVJ+n4OvPfkw7PJh5l/khqQpbMFblFDR
         yhn622oLe6pWHSP83gV06zwN/QLtUAGvjwB0BIfVWUmvuKx+rubBcRLlHfYBl7LC12LZ
         gnRqXZmseLXYgcbELIg6KL6hYGUFJzWSwqJTHQCcQvOfyZ1AshZVi1PR6Q0wIYHLt9Z9
         gp1V7VMKY4PjWwH83KNAksfF04Ef3X7gNuPGZoeGwQVpCNUgtXZjkyrockhwTOZ1f3pt
         DiqzKqMDT3RM5JPzPTcgKZaYiblMGp16swabkW0XMJ8iS53c0C3ccNozC7CmpYPzrIR9
         80Rw==
X-Gm-Message-State: AOAM533gDCz60cAnt727tSIvLOr937MmMLPdCE1gxLsB6+22fUyDASSn
        reeNg8IeEwqCevQMHiyX9NhJng==
X-Google-Smtp-Source: ABdhPJzn0kNxpSEYDJe2S2sKSIy8rks03D7V2gQmW0Kx2m1LfEjk74vmNIHJ7QMjgSY95nCyamOiWQ==
X-Received: by 2002:a05:600c:1ca0:: with SMTP id k32mr5942424wms.62.1643376811978;
        Fri, 28 Jan 2022 05:33:31 -0800 (PST)
Received: from google.com (cpc106310-bagu17-2-0-cust853.1-3.cable.virginm.net. [86.15.223.86])
        by smtp.gmail.com with ESMTPSA id y6sm1876155wma.48.2022.01.28.05.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 05:33:31 -0800 (PST)
Date:   Fri, 28 Jan 2022 13:33:29 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
Message-ID: <YfPwqfmrWEPm/9K0@google.com>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-5-bigeasy@linutronix.de>
 <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 28 Jan 2022, Sergei Shtylyov wrote:

> On 1/27/22 2:33 PM, Sebastian Andrzej Siewior wrote:
> 
> > generic_handle_irq() is invoked from a regular interrupt service
> > routing. This handler will become a forced-threaded handler on
> 
>    s/routing/routine/?
> 
> > PREEMPT_RT and will be invoked with enabled interrupts. The
> > generic_handle_irq() must be invoked with disabled interrupts in order
> > to avoid deadlocks.
> > 
> > Instead of manually disabling interrupts before invoking use
> > generic_handle_irq() which can be invoked with enabled and disabled
> > interrupts.
> > 
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> [...]
> 
> MBR, Sergey

What does that mean?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
