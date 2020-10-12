Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B03E28C45A
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 23:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgJLVxw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Oct 2020 17:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgJLVxw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Oct 2020 17:53:52 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567BAC0613D0
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 14:53:52 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id u19so19298385ion.3
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2020 14:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hW1H38JvCNEuBb0B4hXYVTsDxG145EF/Om+Dx14o90k=;
        b=g2MJQ0fQFvTtfhF0O3M+eykGsl4lQPFoweg4/uwGP88m5NlP8ikW5uZYoZePdshdWJ
         DIkg3Z7/RC/hdNetgVaopvnSknImxWwiFxrB/p8cNxuLvElAOLe1nWWf4NMcOV/hKmJ6
         9DzqCl866hmImBkkzyq98o+2WsrLDQnVI0w8iZfdyYfFOHQ4hS2NOjwn6WjFAZZpROEr
         7VGlUlBsOh5oaBk4BWhH1ScjfKv15L4aNUSsiDlOziKGtI78jbJAii6oMcj7cae5ACTQ
         SOcmt2lc61gLIbwSeumWKixj0ijmNrEMx1XNmt3nK3Qh8ceRVpuGDVtXhqHfbml+QrZv
         FB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hW1H38JvCNEuBb0B4hXYVTsDxG145EF/Om+Dx14o90k=;
        b=ef4gGIqdTeV8nqfbvaaKh3f+O/FM8u9iGiQcWRTKHRQ5vFaWvN88O93hlDqLIWRYmH
         3/4RyHwQK+ZUxfJSOPpt1zaqPe1U6xa3nE+FWdrT6UffPj8AB1U5cbpqV7ndHVZRIr+Q
         L940dOPE3FnXYM2XeH9st7QezwPFW7raaVQGDxi2DQk8u0GC1mfSA+oIDJk5zKVpAY36
         LoPvT/jjv2xV/mHfz38U9hWevWTdaWEA2Fr4rM2KpBUWgcnYVpdwrteoWjw4EOT4Xi5A
         HJckWervoG06T2B2CxtLKx7GG0nee2Xzg0G+k1Q5EXLaVmojTMmrvzr1qKgHR/PPmODc
         /4lw==
X-Gm-Message-State: AOAM532HlwwcBTpiMwk6D9X/IKMFgCeZk5xC6X4B/IXaGZiJVsbO61Ls
        Qekqh0CR8uMk5Wj3o/o6OB9rOA==
X-Google-Smtp-Source: ABdhPJxBW4KDF2Lft4fqT0qi5qkDgGZKAfQ9XF+m2/rLgUEFCRBy4hnxcxCYAQhfz2GlLlAbu6EzzQ==
X-Received: by 2002:a05:6638:12cc:: with SMTP id v12mr16626798jas.75.1602539631170;
        Mon, 12 Oct 2020 14:53:51 -0700 (PDT)
Received: from google.com ([2601:285:8380:9270::42c])
        by smtp.gmail.com with ESMTPSA id t13sm1349068ilj.41.2020.10.12.14.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 14:53:49 -0700 (PDT)
Date:   Mon, 12 Oct 2020 15:53:48 -0600
From:   zwisler@google.com
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: xhci problem -> general protection fault
Message-ID: <20201012215348.GA3324220@google.com>
References: <65ac3a73-ca57-c3e8-561b-9ba5c15b3c65@collabora.com>
 <a6364bd9-58d9-e66e-5595-7d887a8f3fc9@linux.intel.com>
 <8230c2a2-719c-ef81-e85d-5921bf8e98e6@collabora.com>
 <133c123e-e857-7f83-d146-f39c00afe39f@linux.intel.com>
 <20200925210517.GA4487@google.com>
 <7e38c533-6ea1-63a6-fc92-2ecef7ee1f84@linux.intel.com>
 <20201001164352.GA13249@google.com>
 <69f8cbc3-0ae7-cfb2-2fdd-556ada77381f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69f8cbc3-0ae7-cfb2-2fdd-556ada77381f@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 12, 2020 at 10:20:31PM +0300, Mathias Nyman wrote:
> On 1.10.2020 19.43, zwisler@google.com wrote:
> > On Tue, Sep 29, 2020 at 01:35:31AM +0300, Mathias Nyman wrote:

> I'm rewriting how xhci driver handles halted and canceled transfers.
> While looking into it I found an older case where hardware gives bad data 
> in the output context. This was 10 years ago and on some specic hardware,
> see commit:
> 
> ac9d8fe7c6a8 USB: xhci: Add quirk for Fresco Logic xHCI hardware.
> 
> > 
> > I'm happy to gather logs with more debug or run other experiments, if that
> > would be helpful.  As it is I don't really know how to debug the internal
> > state of the HC further, but hopefully the knowledge that the patch below
> > makes a difference will help us move forward.
> 
> Great thanks, it will take some time before rewrite is ready.

Should we/I invest time in trying to create a quirk similar to

> ac9d8fe7c6a8 USB: xhci: Add quirk for Fresco Logic xHCI hardware.

in the mean time, or should we just wait for your rewrite?
