Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1518D25603D
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 20:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgH1SE5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Aug 2020 14:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgH1SE4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Aug 2020 14:04:56 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3ADC061264
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2020 11:04:55 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id d2so144667lfj.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2020 11:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xnrwwsgdJMT0718Y86AIv5Rn80YQ0Ge6egBfYEhRWDo=;
        b=ad765vD7OJbcHcUDFnGKBO1zT8yMvD7WMB+K+xCg2rBAdxlO1OIgvgSUXKKjXIW0Vw
         ocSNYAKmMqmGudqSLbZugiFRXJjK4+d+mzpgePREj+RadCe5OG+hurDj/lIuRY7nyHot
         pd+F7dC3qgVBn5PehjzQ2Di7RbkQCcjd1kNPxBWD8MX6cVlgWB/uFupXdPTyOYuaoT2T
         vWeyAmSJjckx0COr9dmit/H+7eUhqIFhGSUWEJKwlWUHc7xqvq8PoR/ZTrfFMHo4Nj0n
         cgQKUqStMmSr3Ksj0YCKjdMLzkqM+Ve4lB67vwgHx51tutRlRbZTAJCfky2JZqoKjGKU
         IgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xnrwwsgdJMT0718Y86AIv5Rn80YQ0Ge6egBfYEhRWDo=;
        b=EUpbiTv7tqOKGOoh4sLKH7L4M8LZYZZ1e6y72ZvPHx3rndDml3H49yW4c6EZGZLt/j
         RIfSHa41c6DGiGVjNS9kyryukD9oZxEMM07J5YzArY/QZXqGDjcRsfY7FE1DGs4CeKv4
         6o87l6f9QoE3ZK+Vr/4Vn37Yax6pf2+xZ4A48M/v8RlkMc6hVmTtpwakfPQCMTySmfJv
         3xkBFuTI6d9g0GdB0yuIjzxF7P7ealGVP1WcTcOOfWvPrPqsV5NrBRAT6GAdkbbPHlRb
         PdYQDqFBbEjzB5Df2vkvmNO9CPWSsKWB86D9AG3Ibr9qSzhYraYxaj/e8gzrykqpkXcO
         6pSw==
X-Gm-Message-State: AOAM532aACW4z7B78pF0jsqZY8GZ/SQH128Yf2x4RDfBxn1uMEZXGkHg
        T7nSEu7Vp/ewW/96eXW2XkvF2P0jEzqTH3P0A1PKI5ceuJs=
X-Google-Smtp-Source: ABdhPJwj2vMjzhlJLQF/1w1BoI4zT3M+vudkyJdI1rGsK1qW7PDH4bIrukTw49QTekSzl7VzaUBdagzls2dx65RCjfk=
X-Received: by 2002:a19:7e02:: with SMTP id z2mr1357991lfc.130.1598637893965;
 Fri, 28 Aug 2020 11:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3BvCzb6dGZOm6jy2PddSfioM7hThMEBm+aQ_gmMAWAXFYOuQ@mail.gmail.com>
 <20200821160321.GA256196@rowland.harvard.edu> <CAL3BvCyz3W+aRu0e=RE3teaMMh6KDYxu8NbFicY07Xt-=f9Whg@mail.gmail.com>
 <20200821170106.GB256196@rowland.harvard.edu> <d11a91f5-2bb8-01ce-c8b8-4512a2cf2793@linux.intel.com>
 <CAL3BvCyxTvfUjecoYO0ie1vt4_+1cad+8Dt=xmcXogZSooGj+A@mail.gmail.com>
 <cbdfafed-b8d4-ca07-bde1-4598f5117f04@linux.intel.com> <a66ea20a-5406-ed31-e607-08552598ed68@linux.intel.com>
 <CAL3BvCzsAZjt23XjD-9T2JyUtLFPLB0prKn3Bw3nC4AC1nTbgA@mail.gmail.com>
 <9017830d-a4d2-66d5-6b42-b1162856ef90@linux.intel.com> <CAL3BvCzKdRAVNMgG2do1D_QgKnR_x+P-uBuv3-kPMi7z6iabwQ@mail.gmail.com>
 <a8c8509b-6f45-c905-3860-d2b5dd5f9103@linux.intel.com> <f57b9d65-9553-17f7-090a-0272b013af36@linux.intel.com>
In-Reply-To: <f57b9d65-9553-17f7-090a-0272b013af36@linux.intel.com>
From:   Martin Thierer <mthierer@gmail.com>
Date:   Fri, 28 Aug 2020 20:04:38 +0200
Message-ID: <CAL3BvCyqATeb2cSE5ZcxrvkZWROfMn3U7YxcPMXHjQpEFDMAkA@mail.gmail.com>
Subject: Re: Data toggles not reset on "set configuration" for ports handled
 by "xhci_hcd" driver
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 28, 2020 at 3:07 PM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
> Can you test one more round?
> The code below is cleaned up but it also has a functional change.
> This version issues separate commands for dropping and adding endpoints.
> Previous code both did all on one command.
>
> If it works I'll send it forward.

Looks good - thanks! (Disclaimer: My original issue is gone; I haven't
checked if it breaks anything else, but didn't notice any problems,
either).

Martin
