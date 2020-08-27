Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9532255100
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 00:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgH0WU5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 18:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgH0WU5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Aug 2020 18:20:57 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53432C06121B
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2020 15:20:57 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id nv17so3373572pjb.3
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2020 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7HOc3TOrUpk73yXJpqK5BG9QB3E4q5q24T2BiM8h4ig=;
        b=ACj55gMSyHznOPm+7Nt6RAuwvbljxgVA4RJ1jcyPkH2RJrl54y3SfzL7sTPYXgXrz+
         7vVqFXQIV4YKln3ufrm1yzzL4F9GNLkhNZhKEWo0r814lT9QIkar6GT7VFgy7eUUkVeL
         H2VEyQhdACFwDVovcCSKufyBRGAAOoUbEQJgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7HOc3TOrUpk73yXJpqK5BG9QB3E4q5q24T2BiM8h4ig=;
        b=Ip1ymf8SsRp6smKVNk9xdWyP7swIa2sPf6s+3dB/5Xb46Mpfat8Bo9YMDP6Ljr7CVu
         RY2EAjGVvKFB6vlcPQYrGYlXwgPJpFj0KW1z2UCU5EMJzvuA3YrC0goM60TEJb07OsPk
         LbT1QGOYtsYqWZyV4l28V+Q+ee7YzpQ/ZI8TshRFojxEb0tEqQhT27sG2SshDpKRrYPB
         UdhdJ7hImlEujOj4G+SWTZA1rSfx+IN5hVSoejL5ZNfcsA+NK1fk+g67RP8HhASRyuf7
         UhwvD9Mr9/aEdotvgjkIobVOhtEwdt6p9JXUijERbcpgAn4kHo1sxPc0bOFPZQ2VxVNU
         N8Iw==
X-Gm-Message-State: AOAM5326SSqll7cvYIK6RXt0fkTzYtiBSYWpxoYJ3V6gAYa09UaRyWPI
        jBaUfdGQOJVE5ESE3eWKRIXFbg==
X-Google-Smtp-Source: ABdhPJwGjzZLQ60AqhrpovvKnVZnmp/yETv8BkRDFYa73Hr7/msOUJUwKUrmeYNOEzO2CReThQJVpg==
X-Received: by 2002:a17:90b:696:: with SMTP id m22mr886476pjz.158.1598566856643;
        Thu, 27 Aug 2020 15:20:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a13sm3327169pjq.36.2020.08.27.15.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 15:20:55 -0700 (PDT)
Date:   Thu, 27 Aug 2020 15:20:54 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Denis Efremov <efremov@linux.com>
Cc:     Julia Lawall <julia.lawall@inria.fr>,
        Joe Perches <joe@perches.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, cocci <cocci@systeme.lip6.fr>,
        accessrunner-general@lists.sourceforge.net,
        Alex Dewar <alex.dewar90@gmail.com>
Subject: Re: [Cocci] [PATCH] usb: atm: don't use snprintf() for sysfs attrs
Message-ID: <202008271517.ECC1F1F8F@keescook>
References: <20200824222322.22962-1-alex.dewar90@gmail.com>
 <48f2dc90-7852-eaf1-55d7-2c85cf954688@rasmusvillemoes.dk>
 <20200827071537.GA168593@kroah.com>
 <20200827131819.7rcl2f5js3hkoqj2@lenovo-laptop>
 <def24e9e-018c-9712-0d07-d4cbc84f07d9@rasmusvillemoes.dk>
 <20200827144846.yauuttjaqtxaldxg@lenovo-laptop>
 <5d1dfb9b031130d4d20763ec621233a19d6a88a2.camel@perches.com>
 <alpine.DEB.2.22.394.2008272141220.2482@hadrien>
 <5853c58e-7d26-2cf9-6cbf-698ecd93cbf9@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5853c58e-7d26-2cf9-6cbf-698ecd93cbf9@linux.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 28, 2020 at 12:01:34AM +0300, Denis Efremov wrote:
> Just FYI, I've send an addition to the device_attr_show.cocci script[1] to turn
> simple cases of snprintf (e.g. "%i") to sprintf. Looks like many developers would
> like it more than changing snprintf to scnprintf. As for me, I don't like the idea
> of automated altering of the original logic from bounded snprint to unbouded one
> with sprintf.

Agreed. This just makes me cringe. If the API design declares that when
a show() callback starts, buf has been allocated with PAGE_SIZE bytes,
then that's how the logic should proceed, and it should be using
scnprintf...

show(...) {
	size_t remaining = PAGE_SIZE;

	...
	remaining -= scnprintf(buf, remaining, "fmt", var args ...);
	remaining -= scnprintf(buf, remaining, "fmt", var args ...);
	remaining -= scnprintf(buf, remaining, "fmt", var args ...);

	return PAGE_SIZE - remaining;
}

-- 
Kees Cook
