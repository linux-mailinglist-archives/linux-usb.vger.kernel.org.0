Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F99215D8C
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 19:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729740AbgGFR5i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 13:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729729AbgGFR5h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 13:57:37 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0099C061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 10:57:36 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f18so34053177wrs.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 10:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oTojjIFZzclanf7cLLuaYi/sgvjqGLuwhbXDv27Czb8=;
        b=OK6kB8Q0qPe86xIOUaHuGwfdS2zOPVnI1nFVI5idSlyGCaQ0kwkLr5OQ3iqaCDrVgp
         bSOqJkCjp0ec0QS590uLshH3kIWpHf1xbHU4eFZSHTSz2iazne518HLTBvJhqDK56dUJ
         VfvvqQ499iFKyO7u5d9hnovYGKCEt81Di/gCvWZ/6DEke38vxLl9lqh8sFCeusLjL1Ml
         2qR161f3NJOvDObqFI6szLGqFQi4ZzNG3O+MRRM8N5BRRw06NsO/2NWwp4otwehlAyaq
         GjgvDbYRQdLgMd7gAaG1L8Juu1JYUeppORL67+udHl59TzHLYTVJB6lnzxfeszfPKiFn
         3hag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oTojjIFZzclanf7cLLuaYi/sgvjqGLuwhbXDv27Czb8=;
        b=AegZKJIg4h32Kb0GhwO1BQd/HFqOmwr8QzBI+K5Z26Oi4YtnCHC01loykgEyXILhGc
         qvqwxSYOrHx3ha9SK7j/e/3U+6qmJ4F5kdh2TpISLiWXnEwujcThEg5hM3f+ur/13ygl
         gTx0XtlYGM71/wYS0B7dHst5qhSDPy/S/aRA979Dqk4DuyUfAa1LMwrp0Wkvqtc6jWdx
         STtNcaGQWmJufFk/lZt0xxVSrgUR14eA8PAgTGfMS/Y6t2jX6psHpvVLuDrQG19yqkpw
         2LPBNpW8Em9MMasM3RHHyz13mK9hXJOYgjxcD33DkXl1Tccipra8mkTnwwM6iIWywQeJ
         7tOA==
X-Gm-Message-State: AOAM532WJXn993K6KzZqf9/DqrVTiu64nB62ErXgA9JSCcIU7D5MeshC
        TrpX7Go+LkXv9L5HyBgXZCGsKQ==
X-Google-Smtp-Source: ABdhPJxS0ATrWjLo9sj+XUyy8koys1QP+PJvoeoFNUvPJiTVFA4tFZil89Y+Fn6a3oT6x5JiwFKCRQ==
X-Received: by 2002:adf:b198:: with SMTP id q24mr19941076wra.335.1594058255478;
        Mon, 06 Jul 2020 10:57:35 -0700 (PDT)
Received: from dell ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id r8sm24689046wrp.40.2020.07.06.10.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 10:57:34 -0700 (PDT)
Date:   Mon, 6 Jul 2020 18:57:33 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     gregkh@linuxfoundation.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Sumit Garg <sumit.garg@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Yinghai Lu <yhlu.kernel@gmail.com>,
        Jason Wessel <jason.wessel@windriver.com>
Subject: Re: [PATCH 25/32] usb: early: ehci-dbgp: Remove set but never
 checked variable 'ret'
Message-ID: <20200706175733.GB3500@dell>
References: <20200706133341.476881-1-lee.jones@linaro.org>
 <20200706133341.476881-26-lee.jones@linaro.org>
 <87imf0mvk7.fsf@x220.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87imf0mvk7.fsf@x220.int.ebiederm.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 06 Jul 2020, Eric W. Biederman wrote:

> Lee Jones <lee.jones@linaro.org> writes:
> 
> > 'ret' hasn't  been checked since the driver's inception in 2009.
> 
> Minor quibble the inception was in 5c05917e7fe3 ("x86: usb debug port
> early console, v4") in July of 2008.

I'm only going back as far as the inception of ehci-dbgp.c.

> Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

Great, thanks.

> > Fixes the following W=1 kernel build warning(s):
> >
> >  drivers/usb/early/ehci-dbgp.c: In function ‘early_dbgp_write’:
> >  drivers/usb/early/ehci-dbgp.c:915:13: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> >  915 | int chunk, ret;
> >  | ^~~
> >
> > Cc: Sumit Garg <sumit.garg@linaro.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Petr Mladek <pmladek@suse.com>
> > Cc: "Eric W. Biederman" <ebiederm@xmission.com>
> > Cc: Yinghai Lu <yhlu.kernel@gmail.com>
> > Cc: Jason Wessel <jason.wessel@windriver.com>
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/usb/early/ehci-dbgp.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
