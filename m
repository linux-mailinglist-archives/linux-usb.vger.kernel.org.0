Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFFF1599CF
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 20:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731694AbgBKTcH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 14:32:07 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:53282 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728202AbgBKTcH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Feb 2020 14:32:07 -0500
Received: by mail-pj1-f65.google.com with SMTP id n96so1778259pjc.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2020 11:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bKC/+INk7BBaA88bOwTNnbtW23n0LE6x5PuhmJzM5kY=;
        b=eQIlwDpRIi9KcpJVM+JZ3qGN7yArwrjpKRyJl3fghWHE3D5u4/NFcJ+ij/9ezER0MV
         FcCaOWKKWF2OS4FjhrC6ZBjGmjgM4+YKGu96dYZ3OybKv3p8e7FHJwA0DChGU663e8Ap
         SHPWHapeJnEnfDUvRE39q1GsEP9MxpUkl/YEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bKC/+INk7BBaA88bOwTNnbtW23n0LE6x5PuhmJzM5kY=;
        b=oIh45RMjXqxee7LYVziZT1erInW0olhPLKwlP+CGeEKzFSHAVz6lqyoroA+XBA7Vv4
         3bcxlC0Ow4WNjIbQZvvg/abJDQKLqVTUsW/ttHdHRXPm1zaq6mJSVnk9yIwk0zaFCod2
         E9/CJQ9cZ1FB/svnhYIkDYgiG7zSfA8MxJKYpH9Yp+aMYnx/uMBqAbr+dQjhphNW/W9f
         WWcbZL380HE2tdNdq6OdexDNHOHLFJCorzRuOpzG7NzzXn0eDeLwNLKYUZL4MPdZzYMJ
         9QUK7CRRSgCS99VsOums3+Kn7KYGyh3y8xd7Qv7+QbOlGAgXVZ39eUO5aXm964virrwy
         plQA==
X-Gm-Message-State: APjAAAVIrbG944kvkeb+Sz7U8HOW8QXFltMnr/ry6Fn0+RdxHoiD5FzC
        dQginQXgGAt+x5Cz0hq9Qo8NPg==
X-Google-Smtp-Source: APXvYqzMlIzIUhu7YvDxV6j0XKIWzMpG7d+7n8kKgXm21z7Q7i6+twmsKhUHg4Vtv4sMTLeD6qBWyQ==
X-Received: by 2002:a17:90a:f013:: with SMTP id bt19mr5350862pjb.47.1581449526662;
        Tue, 11 Feb 2020 11:32:06 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o6sm4685775pgg.37.2020.02.11.11.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 11:32:05 -0800 (PST)
Date:   Tue, 11 Feb 2020 11:32:04 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] treewide: Replace zero-length arrays with flexible-array
 member
Message-ID: <202002111129.77DB1CCC7B@keescook>
References: <20200211174126.GA29960@embeddedor>
 <20200211183229.GA1938663@kroah.com>
 <3fdbb16a-897c-aa5b-d45d-f824f6810412@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fdbb16a-897c-aa5b-d45d-f824f6810412@embeddedor.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 11, 2020 at 01:20:36PM -0600, Gustavo A. R. Silva wrote:
> 
> 
> On 2/11/20 12:32, Greg KH wrote:
> > On Tue, Feb 11, 2020 at 11:41:26AM -0600, Gustavo A. R. Silva wrote:
> >> The current codebase makes use of the zero-length array language
> >> extension to the C90 standard, but the preferred mechanism to declare
> >> variable-length types such as these ones is a flexible array member[1][2],
> >> introduced in C99:
> >>
> >> struct foo {
> >>         int stuff;
> >>         struct boo array[];
> >> };
> >>
> >> By making use of the mechanism above, we will get a compiler warning
> >> in case the flexible array does not occur last in the structure, which
> >> will help us prevent some kind of undefined behavior bugs from being
> >> unadvertenly introduced[3] to the codebase from now on.
> >>
> >> All these instances of code were found with the help of the following
> >> Coccinelle script:
> >>
> >> @@
> >> identifier S, member, array;
> >> type T1, T2;
> >> @@
> >>
> >> struct S {
> >>   ...
> >>   T1 member;
> >>   T2 array[
> >> - 0
> >>   ];
> >> };
> >>
> >> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> >> [2] https://github.com/KSPP/linux/issues/21
> >> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> >>
> >> NOTE: I'll carry this in my -next tree for the v5.6 merge window.
> > 
> > Why not carve this up into per-subsystem patches so that we can apply
> > them to our 5.7-rc1 trees and then you submit the "remaining" that don't
> > somehow get merged at that timeframe for 5.7-rc2?
> > 
> 
> Yep, sounds good. I'll do that.

FWIW, I'd just like to point out that since this is a mechanical change
with no code generation differences (unlike the pre-C90 1-byte array
conversions), it's a way better use of everyone's time to just splat
this in all at once.

That said, it looks like Gustavo is up for it, but I'd like us to
generally consider these kinds of mechanical changes as being easier to
manage in a single patch. (Though getting Acks tends to be a bit
harder...)

-- 
Kees Cook
