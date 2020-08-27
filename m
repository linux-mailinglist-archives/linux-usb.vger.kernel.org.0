Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902E7254B1A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 18:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgH0QtL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 12:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgH0QtH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Aug 2020 12:49:07 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4DBC061264
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2020 09:49:07 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 17so3948985pfw.9
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2020 09:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WiGBqbvIsFO7z3w2LMazIC2FdnllWalUyM7tW1jEsT8=;
        b=PfLeP1nV8B3U6EqkOgNzN84iR7UUy8/qiTcl/n3tYajHLnYHYm389y0pz4BY9Of1PY
         JgbSGcf1d7WEcDLjR1sQPrpu42wCr6/27pbNXF5vziV/LDpvB3m0qY5a0GAkUWJWVU8A
         EVZ6HlhvzrsITdJad7o0fkqp6zaLStbRbS/0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WiGBqbvIsFO7z3w2LMazIC2FdnllWalUyM7tW1jEsT8=;
        b=S9UAuVoKW0aL4p0GLL4Sas4lZ0zGfWHgjDeEWA1YA7Zn1Y1HrjaBhsghdUWhJRe1D0
         weQqJ3I6USY5If0K6sS1/oEhQ3e3xPw4qLayFHVxrPGTVizs7TyzM6QSKC9qlTd7vCey
         XPH/oS8rjEit+EWfNn5IrP1J7WFc4QAeqyIZAgoFbc3zGhUnklQHj7BAZ272RPovSVUQ
         oVStf+QnA9LW8p3hG5bvQXVHwxQzX2o/kQ7pPdEhrWYvkpz4GTdqzdanvVnyrnmmwm70
         YJmpsvor5w2En8Dvp3Nuo4wA2GrGLqfQx83gzJPXCwu/6VlY9FufZQPTSqT8ayA4oPO2
         VpJA==
X-Gm-Message-State: AOAM531PjsqFMSqAQf4JbFQA/Tw7Brt+TnKQvpX1EiXON1/+c82JsGLf
        QIQtNL52bOSD1zl50LVHQ+SfyA==
X-Google-Smtp-Source: ABdhPJzcuCsRrPfIfLlHbR023NYEZxh/FkaJVSEHWhDNKlQXZmCOAVL9LXU4hpqCbh4th+9qlI/bQA==
X-Received: by 2002:a62:1803:: with SMTP id 3mr17714286pfy.198.1598546946678;
        Thu, 27 Aug 2020 09:49:06 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m3sm2665362pjn.28.2020.08.27.09.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 09:49:05 -0700 (PDT)
Date:   Thu, 27 Aug 2020 09:49:04 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     David Laight <David.Laight@aculab.com>,
        'Alex Dewar' <alex.dewar90@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "accessrunner-general@lists.sourceforge.net" 
        <accessrunner-general@lists.sourceforge.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: atm: don't use snprintf() for sysfs attrs
Message-ID: <202008270936.6FF344336@keescook>
References: <20200824222322.22962-1-alex.dewar90@gmail.com>
 <3e882693bb344424af37d4d35f3db605@AcuMS.aculab.com>
 <20200825082406.GB1335351@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825082406.GB1335351@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 25, 2020 at 10:24:06AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Aug 25, 2020 at 08:12:05AM +0000, David Laight wrote:
> > From: Alex Dewar
> > > Sent: 24 August 2020 23:23
> > > kernel/cpu.c: don't use snprintf() for sysfs attrs
> > > 
> > > As per the documentation (Documentation/filesystems/sysfs.rst),
> > > snprintf() should not be used for formatting values returned by sysfs.
> > > 
> > > In all of these cases, sprintf() suffices as we know that the formatted
> > > strings will be less than PAGE_SIZE in length.
> > 
> > Hmmmm....
> > I much prefer to see bounded string ops.
> > sysfs really ought to be passing through the buffer length.
> 
> No.

It really should, though. I _just_ got burned by this due to having
a binattr sysfs reachable through splice[1]. Most sysfs things aren't
binattr, but I've always considered this to be a weird fragility in the
sysfs implementation.

> So this is designed this way on purpose, you shouldn't have to worry
> about any of this, and that way, you don't have to "program
> defensively", it all just works in a simple manner.

Later in this thread there's a suggestion to alter the API to avoid
individual calls to sprintf(), which seems like a reasonable first step.

-Kees

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=11990a5bd7e558e9203c1070fc52fb6f0488e75b

-- 
Kees Cook
