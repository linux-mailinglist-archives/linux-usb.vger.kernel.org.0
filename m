Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E96E325A71
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 00:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBYXyC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Feb 2021 18:54:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhBYXyB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Feb 2021 18:54:01 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFEAAC061574
        for <linux-usb@vger.kernel.org>; Thu, 25 Feb 2021 15:53:20 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id c8so8517740ljd.12
        for <linux-usb@vger.kernel.org>; Thu, 25 Feb 2021 15:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QTNgCXSBc6Q5+mbvM8QxWiL/z4r+Q/vHG5fqEbSHQGU=;
        b=jXn6BHsa8qswYsRJ4orUyu87VE99xJ6WGwiMNPvGe43X6+XpC4MLDRaLmBk7lWaai+
         CORAaQWdkVNayRYPXaFPl0AcJCeDEP5VfxzEGEUIRLnfucSG814VbraoFDlMh0hGB5nB
         Ve0UP/PFqXlkKeuCeSfw00pc1xFjwzMecBVe8wDZSAsZyXolEroVn1ZquBob6NifnIDI
         TMx8kXmrmOXQAaFBUc7+Ps5wAIo45NlDSBtRqsGjSc2ELWSwB463qlYopRSXwCx02uW+
         aeIPgmzY4VZH/pqPLmaumSObVGWK8xGNrmAGolrIdjP4cgak5NPGS16Fgqmtw4F9gWqU
         Bgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QTNgCXSBc6Q5+mbvM8QxWiL/z4r+Q/vHG5fqEbSHQGU=;
        b=Hk5yGQ++G14Tt9kN8mbX33RtGUU8Jle8sroFvAr6oNg7q2t8lTleRsAoOYTiD3YcuE
         hYFXrnP1ng2yd/qAbA74TnD6nmOzrIoUbbkLNlLaHyJtOLBhsC3DqmSN4TiZvxUSWPcS
         VlgmzNMOtiEDoA30kLr3TRzh8AfgD6/4NzFbjFWCQElCugixet1lBcvCy6JyH4aoDASU
         qbhF+4pZalArAAYjgxnyjJwtDZN5wXzDVAlL/y8CGnLr1BUTW8/00goqWy5YEm6VOUdp
         pQUnnjXe1A7XlLrPtkRwUj+8DKrbvBp4ZFJ7aMYEQRvhMyz6hBVLiM1W+7nXnlHE8Jb7
         h9JA==
X-Gm-Message-State: AOAM533UU0tuadFBvZs6xoGXH5TLszG0HCnCTD1gMmYMEkfCFP8VMHFn
        N6WZWhq9oVxZK0bpPyQ41D+SOxfD27DzA2BIUc6ki2fKFvA=
X-Google-Smtp-Source: ABdhPJwaownnF9tOhNMAvrCM7wc7bI/uiwi2mn/nxqsqQV9HO+04PpXS9onjbaog3s4zphYtT8HtU3R4A033rqmCS70=
X-Received: by 2002:a2e:7f10:: with SMTP id a16mr57844ljd.504.1614297199483;
 Thu, 25 Feb 2021 15:53:19 -0800 (PST)
MIME-Version: 1.0
References: <CAAH9jopk2ngwBDxfmQ8CQsvntW0uUU2e4h3R=drXV2n2y6+Nuw@mail.gmail.com>
 <87mtxncz1u.fsf@kernel.org>
In-Reply-To: <87mtxncz1u.fsf@kernel.org>
From:   Tomasz Grobelny <tomasz.aleksander.grobelny@gmail.com>
Date:   Fri, 26 Feb 2021 00:53:07 +0100
Message-ID: <CAAH9jop3qtOJtDMiGP_ADDtyLuPQg750rOtYTy4+qvCza0S_iQ@mail.gmail.com>
Subject: Re: dwc2 gadget mode different behaviour with different hosts
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, Tomasz Grobelny <tomasz@grobelny.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 5, 2021 at 2:07 PM Felipe Balbi <balbi@kernel.org> wrote:
> Tomasz Grobelny <tomasz.aleksander.grobelny@gmail.com> writes:
> > Any idea why this might be the case? Can I somehow enforce that the
> > device reintroduces itself on the bus and gets new address? Can I
> > somehow debug what happens when my device is connected as gadget (eg.
> > see control messages for device/configuration/string descriptors)?
>
> Make sure your device passed USB Command Verifier Chapter 9 tests. You
> can use mass storage for early testing, once that's working fine, then
> switch to the android accessory mode. This could very well be a bug in
> dwc2 itself.
>
Indeed there was an issue with passing chapter 9 tests, but fixing it
didn't fix the main issue. I had a chance to do more testing on the
offending headunit (USB host) and I found out that something weird
happens with read call. After switching to accessory mode I open 3
descriptors (ep0, ep1 and ep2). On ep0 and ep2 I run readWrapper
function in a loop. The readWrapper is a pretty standard select+read
combo to implement interruptible read. However, while it works for ep0
- the select either receives data or times out - for ep2 the select
returns 1 (which indicates there is data to read) and then read call
blocks. Even more weird is that it blocks when O_NONBLOCK option is
set for ep2 fd. Doesn't it look like a kernel bug? If not, where to
look for issues in my code? Note that the same code works for other
headunits and obviously this specific headunit works correctly with
other devices. Next thing to try is another SBC, like RPi4 with
different USB controller, but this might take another two months :-)

dmesg fragment here: https://pastebin.pl/view/aaa2d7f0

Best regards,
Tomasz Grobelny
