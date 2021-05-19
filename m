Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040B23894FC
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 20:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhESSFj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 14:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbhESSFi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 May 2021 14:05:38 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89557C061760
        for <linux-usb@vger.kernel.org>; Wed, 19 May 2021 11:04:18 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so3809837wmh.4
        for <linux-usb@vger.kernel.org>; Wed, 19 May 2021 11:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=rGfeJx++iO9RYfUcCMG9BLDyjoPpwJYUjp9mfyv1ihM=;
        b=NEAfDStc9DOvedcU6BCdRiV8UOOkBhLuwKUUam+wB1CTjEaeRxjLFicSBzJwVpr6OW
         szQmN5jRsu6uJR51DzlqApvpIpJlzqDsc3igg6P8luM2Hv+yCAdZeBQQ/OQSf7RRLtIN
         MjY6mmUYIR+O97G/3Vb6/KFCyMi/BHIQTR7+2pTVjUXXrwIOSs45SizX5nDQXWlvkrZA
         0wjCq4EKpoOoIdjjxU9fxs8jcHeq6BqnFVnjx+OaNYHb7h+TM4BOm5WDpkOPp1mWa5Wq
         XqA2GvK1d/7BD2sx+VHUP/vlRqkVFM22G5WpBfXLtgrfu2SxfI53rRMlGEry3kMpmWyG
         zapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rGfeJx++iO9RYfUcCMG9BLDyjoPpwJYUjp9mfyv1ihM=;
        b=mxixcAFFSjBwXXv5kC9gT8lYQcMU/mdkFempibVfQBS8yJ5J7XqB5ceRHf/+Px0JM+
         C6JSAjZ6pIeoVWy4E0HxLT5ARZKaHmYKSa28gHN3/6x55lIf6ibAMumJkGLQ4Mjt8YFe
         wXTnXZU2tvTaKkPCetQRWmDdUgjQ/ZcQrvE3Q4HqwCazuiJJVo/InjL1SzyVQZA9ajD3
         AshBzLz7YgjmLhlMwu92Zv9RW/mymTAbBsj/zLw75L06D59TWlP2D/xHR26qpwD4MWvg
         W8K3rgUCJn987L4WSYy00ZzHs5hFSAPgRwtpghg3IBhmTTvWtsLoyJFwB0E7WZ+MHl+Q
         qggg==
X-Gm-Message-State: AOAM530rHEu/jXeYYYGyultmumiEXDgPLcpIR7b32JSzSrn1HBXxHlMI
        H3PAwoSDs6r0JU4dFx2ZF24w3xJYSMaTHA==
X-Google-Smtp-Source: ABdhPJxeGPAdq0VhugQUUTYen/hKPMuk3ywUwrdpqTtKH8oX2TUZUgKtHF78OkvjLqURN7+gd9GmBA==
X-Received: by 2002:a1c:b306:: with SMTP id c6mr468387wmf.37.1621447457105;
        Wed, 19 May 2021 11:04:17 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id h10sm133975wrt.3.2021.05.19.11.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 11:04:16 -0700 (PDT)
Date:   Wed, 19 May 2021 19:04:14 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Guido Kiener <Guido.Kiener@rohde-schwarz.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        dave penkler <dpenkler@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        syzbot <syzbot+e2eae5639e7203360018@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        "bp@alien8.de" <bp@alien8.de>,
        "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "luto@kernel.org" <luto@kernel.org>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "x86@kernel.org" <x86@kernel.org>
Subject: Re: Re: Re: Re: Re: Re: [syzbot] INFO: rcu detected stall in tx
Message-ID: <20210519180414.GL2549456@dell>
References: <d673611ca53f42a3a629eb051cabc6eb@rohde-schwarz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d673611ca53f42a3a629eb051cabc6eb@rohde-schwarz.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 19 May 2021, Guido Kiener wrote:

> > On Wed, May 19, 2021 at 10:48:29AM +0200, dave penkler wrote:
> > > On Sat, 8 May 2021 at 16:29, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > >
> > > > On Sat, May 08, 2021 at 10:14:41AM +0200, dave penkler wrote:
> > > > > When the host driver detects a protocol error while processing an
> > > > > URB it completes the URB with EPROTO status and marks the endpoint
> > > > > as halted.
> > > >
> > > > Not true.  It does not mark the endpoint as halted, not unless it
> > > > receives a STALL handshake from the device.  A STALL is not a
> > > > protocol error.
> > > >
> > > > > When the class driver resubmits the URB and the if the host driver
> > > > > finds the endpoint still marked as halted it should return EPIPE
> > > > > status on the resubmitted URB
> > > >
> > > > Irrelevant.
> > > Not at all. The point is that when an application is talking to an
> > > instrument over the usbtmc driver, the underlying host controller and
> > > its driver will detect and silence a babbling endpoint.
> > 
> > No, they won't.  That is, they will detect a babble error and return an error status, but
> > they won't silence the endpoint.  What makes you think they will?
> 
> Maybe there is a misunderstanding. I guess that Dave wanted to propose:
> "EPROTO is a link level issue and needs to be handled by the host driver.
> When the host driver detects a protocol error while processing an
> URB it SHOULD complete the URB with EPROTO status and SHOULD mark the endpoint
> as halted."
> Is this a realistic fix for all host drivers?
> 
> -Guido

Guido, would you mind taking a look at your mailer settings please?  I
now have >=7 threads running through my inbox with the same subject.
For some reason your mailer is insisting on creating a new one for
each of your replies.

It's also adding odd "re: re: re: ..." prefixes.

TIA

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
