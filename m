Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7456253DFE
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 08:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727817AbgH0GmM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 02:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbgH0GmK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Aug 2020 02:42:10 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1D6C061263
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 23:42:09 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u25so2314130lfm.10
        for <linux-usb@vger.kernel.org>; Wed, 26 Aug 2020 23:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s+hgvzWkolB0cW+3qV7g0DekmVFJtookw1vL+Sw6Usw=;
        b=RXzLhjxMFcl4to2PONurI277x23q9RaODZqkcXjoY2O8xBAVFeyHJWNU/jsOh9wQH/
         DE0Hio9ywPOnvEfn4MdLrwOWNgkq1WSCpRC/rAcoijAhhBNp+e/V9MzmlBHd31CA5FdU
         3Mx+ncOUKS4yjoQDq9rn0rb9H5M2+l5F1FAp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s+hgvzWkolB0cW+3qV7g0DekmVFJtookw1vL+Sw6Usw=;
        b=sqzn8o+N851h8Kxy52BxGQGnc6eRW4XBP3o8HY2m2wlsfDOpOJt4DMOT+VOQehZtpZ
         SRck6qGqiZQV5dqFenv4MhOSgDch3DM4yL36LdJBbcUUWfTZwDKl+Ww+Yx7tnOR/+KbJ
         cDiAXeX+88dTswUtaMtQMzzQWykWIRlrd5o9IE5KRmaMjbzf3U+k33+IOBD0d8F4Vy4K
         DgSS4DRoldCHMEAL+1/Mue5q//GXfxmLhWJVNp+fIyJpVgz2b+22GwcaOK5tm7eJkLCE
         tFsKmfEjxnBWJwbzEG6670zHBPVSAgPUl39i2cM7uMTiM5rWiKmrjTDgHJxFd7sNZDAa
         Aj7Q==
X-Gm-Message-State: AOAM533BCjo4Y6q4YsuF9mOn3cl5Ghq7DM3iIxJR0JeZPXhwRFWTxuuO
        1qLUw14cqCJv18VSi+tBj9Fk9A==
X-Google-Smtp-Source: ABdhPJz51JpiZS+VpQgNXGnTdjN0vJVizic22+7Wax906SaXrhHyADNSGWW1B3gL88D0VrRQl/EGyQ==
X-Received: by 2002:a19:915b:: with SMTP id y27mr1713158lfj.134.1598510528332;
        Wed, 26 Aug 2020 23:42:08 -0700 (PDT)
Received: from [172.16.11.132] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id m8sm273770lfj.88.2020.08.26.23.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 23:42:07 -0700 (PDT)
Subject: Re: [PATCH] usb: atm: don't use snprintf() for sysfs attrs
To:     Alex Dewar <alex.dewar90@gmail.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        accessrunner-general@lists.sourceforge.net,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200824222322.22962-1-alex.dewar90@gmail.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <48f2dc90-7852-eaf1-55d7-2c85cf954688@rasmusvillemoes.dk>
Date:   Thu, 27 Aug 2020 08:42:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824222322.22962-1-alex.dewar90@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/08/2020 00.23, Alex Dewar wrote:
> kernel/cpu.c: don't use snprintf() for sysfs attrs
> 
> As per the documentation (Documentation/filesystems/sysfs.rst),
> snprintf() should not be used for formatting values returned by sysfs.
>

Sure. But then the security guys come along and send a patch saying
"sprintf is evil, always pass a buffer bound". Perhaps with a side of
"this code could get copy-pasted, better not promote the use of sprintf
more than strictly necessary".

Can we have a sysfs_sprintf() (could just be a macro that does sprintf)
to make it clear to the next reader that we know we're in a sysfs show
method? It would make auditing uses of sprintf() much easier.

>  static ssize_t cxacru_sysfs_showattr_LINE(u32 value, char *buf)
> @@ -275,8 +275,8 @@ static ssize_t cxacru_sysfs_showattr_LINE(u32 value, char *buf)
>  		"waiting", "initialising"
>  	};
>  	if (unlikely(value >= ARRAY_SIZE(str)))
> -		return snprintf(buf, PAGE_SIZE, "%u\n", value);
> -	return snprintf(buf, PAGE_SIZE, "%s\n", str[value]);
> +		return sprintf(buf, "%u\n", value);
> +	return sprintf(buf, "%s\n", str[value]);
>  }

Not this patch in particular, but in some cases the string being printed
is not immediately adjacent to the sprintf call, making it rather hard
to subsequently verify that yes, that string is certainly reasonably
bounded. If you really want to save the few bytes of code that is the
practical effect of eliding the PAGE_SIZE argument, how about a
sysfs_print_string(buf, str) helper that prints the string and appends a
newline; that's another argument saved. And again it would make it
obvious to a reader that that particular helper is only to be used in
sysfs show methods.

Rasmus
