Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC421E6A38
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 21:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406139AbgE1TRM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 15:17:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406108AbgE1TRL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 15:17:11 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FD9C08C5C6
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 12:17:10 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t18so372472wru.6
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 12:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rd0oLSAo8ofjMzvEHAYMtqN3tyStjDfVgpv2dW9dekM=;
        b=UQwa4H5GTUnWEWJdd2ViMfbQ+Srm/j1lfxcKxkwBaXI6U3U3jZIWNAs2G51boeBX1D
         Wz/FpeHHxaxkiMPCWdwcopKuznNOGzVbq+KTZU3ss+vqtHOZflXOCcfEbNR94L84kqTJ
         RfwLCR9kV9E0NiLjMfVMPjYvI3GoD+0ecLEC9DaRGr1Yj4cmM+kMKIiG1mtuLiqri0y4
         PDZbh+UUi/nFaqDVuKgto80yKtL0MWXO4dCi/b5MHM32GMSXPwWd5U/kY6H3rc23v/rv
         t2LDcqXOJTXuMJtRKcLrIgf+XKPJIlh5swu4X5EYM+2Rv1I9TfNVOZrsqoBGdmDvDzes
         p9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rd0oLSAo8ofjMzvEHAYMtqN3tyStjDfVgpv2dW9dekM=;
        b=eFxifVJ1uWPxGfYJYGSQrcvDd7lDplt5x0wuKoDKhi/YLoWqJSHHeNVkw05CLOJ6Sw
         LHoJqt6mQSW3GlE9Uj6aQA62wuRdlI2JFMocdFxgJEvZHIbgq+x+RRb5YJv8q/OsXyQE
         mRxaKZnjcwX/FDTnQgnQ2BNzNe5g0QoY5m+YdvPpdkmlWzp7+iVxT+AUsCA6Z92ASGUn
         byBnbfjfVlArERDdxYvh/wAHSO+9HfMVUjfflqWAYito3o4aogPKKU7CkILn1bPqQwjU
         w0tl1l7JpKyNw0ICcMtfj9EMfGVEqQkm57mUsBQfXVob+aqrrDKW4iSv8PI2wQUaVQvs
         pzng==
X-Gm-Message-State: AOAM531NIqiE8FiySfZA+jyC1MnQbehiK+hmyYWNaCRC643nGlelAdOd
        avd3nKEx7wWbnkVIs6816Rvpf69XxHZKbuAi7E6Zjqxv
X-Google-Smtp-Source: ABdhPJw5Ei7ns1Dks4f24XdHs2Nx2tYKIf1nBuAtr2JUxmwKyRTlHB1sqoD3JEPfZhHdL5GAYs6qPmE3p3cKvrobPDo=
X-Received: by 2002:adf:e2c9:: with SMTP id d9mr4886725wrj.227.1590693429602;
 Thu, 28 May 2020 12:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAJz5Opc0zDQxnNp2foPEeL0=hOZ0C9-xy3T4nEO2pRy-rQmpWQ@mail.gmail.com>
 <dca3b78a-3740-aeb2-5767-76e7f9fd1fb5@synopsys.com>
In-Reply-To: <dca3b78a-3740-aeb2-5767-76e7f9fd1fb5@synopsys.com>
From:   Frank Mori Hess <fmh6jj@gmail.com>
Date:   Thu, 28 May 2020 15:16:58 -0400
Message-ID: <CAJz5OpfJ0549X4kj8UTsck5ieJxDro1Ga1OhqUPypi+p1490JA@mail.gmail.com>
Subject: Re: usb: dwc2: screaming interrupt after kexec reboot
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Minas,

On Wed, May 27, 2020 at 2:07 AM Minas Harutyunyan
<Minas.Harutyunyan@synopsys.com> wrote:
> Could you please test this patch instead of your suggestion. Does it
> solve issue in your case?

Yes, I tested using your patch and it does work.

>
> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
> index e571c8ae65ec..ada5b66b948e 100644
> --- a/drivers/usb/dwc2/platform.c
> +++ b/drivers/usb/dwc2/platform.c
> @@ -342,7 +342,7 @@ static void dwc2_driver_shutdown(struct
> platform_device *dev)
>   {
>          struct dwc2_hsotg *hsotg = platform_get_drvdata(dev);
>
> -       disable_irq(hsotg->irq);
> +       dwc2_disable_global_interrupts(hsotg);
>   }
>
>   /**
>
>
> Thanks,
> Minas



-- 
Frank
