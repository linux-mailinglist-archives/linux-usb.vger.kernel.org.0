Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCBB11599DA
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 20:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729870AbgBKTfx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 14:35:53 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35658 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729719AbgBKTfw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Feb 2020 14:35:52 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so4682776plt.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2020 11:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L1zT4iXTmWfkI4wOwmMZ4o18MfCPpAamevZivwdVEg8=;
        b=D9wD+88CtwMSTo6hpt8CWePsexABKBgd3bM2lbSnUnErdTW3pUNzJUdCuGMAzLbOZz
         cDfhYUBxOrCJMOu9ol+HfjPC8DWM1NpgIgakMQcEVRijF9iFb5oyS13p8VGc+Bx5b8Ot
         A7O+sHqutssENyq01UVN0onEWX5QVZFLqdIT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L1zT4iXTmWfkI4wOwmMZ4o18MfCPpAamevZivwdVEg8=;
        b=ihsx96tZnnRYaaICLzO4XMcz13MdbE2cwIyuoQm9Ec0SWasI6zyrfPAhu8R+9rugtp
         dVmwmJLcVvjdzB9v9FUhqRF+7uCyCOQEgFrVQtgEKBsrfkW/mmlpzcLWUhDW+7rfOSTo
         w7blYEB96NZZHBSCScy2TXKCx4FZ/yjU95SCkfVL/DXh/47ahSjLNDDnu0NohjI3izEB
         SnSGulLXvgAlyZP8K+mUMk5wKZlv0CTVza72TNlPbNO+DNdGMGtElwfKsrXxcV2Pikn0
         sR4eqP9pV+M6Up8OSBqoBJu97hmTv7sL/huA0oozpiIS7rVa+v2Bss1IxcmwrZFWIG/0
         nZ7Q==
X-Gm-Message-State: APjAAAVrUke3V9Wf++iSzWGCr3lcEclBbIoLov450gKANHG2/lPpDsrD
        oc+qXTc4CkXN/n7hhONh0wSypA==
X-Google-Smtp-Source: APXvYqyV7C7MX+UFBFOj086mAZSDkpLAhR277H/ITNkZlAITmYHn/RMBUw0+zaF3eCaXvQvEAnLGdw==
X-Received: by 2002:a17:90a:2004:: with SMTP id n4mr6984510pjc.20.1581449752154;
        Tue, 11 Feb 2020 11:35:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 70sm5014226pgd.28.2020.02.11.11.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 11:35:51 -0800 (PST)
Date:   Tue, 11 Feb 2020 11:35:50 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-kernel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] treewide: Replace zero-length arrays with flexible-array
 member
Message-ID: <202002111132.4A4F073CAF@keescook>
References: <20200211174126.GA29960@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211174126.GA29960@embeddedor>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 11, 2020 at 11:41:26AM -0600, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> unadvertenly introduced[3] to the codebase from now on.

Is there a compiler warning we can enable to avoid new 0-byte arrays
from entering the kernel source tree? I can only find "-pedantic" which
enables way too many other checks.

-- 
Kees Cook
