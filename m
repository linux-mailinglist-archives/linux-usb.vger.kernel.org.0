Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 164F3549704
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jun 2022 18:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380871AbiFMOHF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jun 2022 10:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382250AbiFMOFg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jun 2022 10:05:36 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF8A939F1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jun 2022 04:40:33 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id p13so9408289ybm.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jun 2022 04:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cQAgf0oTUjxvMteG8WaQe8aas6eUXFHbWIocwnGX9Vg=;
        b=pcHB0UBCQGioOSo9aQ673Pv1+apQcCU4ystsoNymJ2vrHXf0gk0qCUkRRBPI2RsP54
         c/14vWpQMPYYrRQkfJZqkhPxiQxgS/WMFeo1sbQElyaAN5nCUdThh8Gx4i6dqMmvYbzw
         oWHpD2FHbyGzgSVfiaUFMgIhPuBMU2tFn+dGqt/lOsWfPE0sBjBDbYgaJxWjo5yb42ne
         cDsizPwSxuqZGbT1Q9cfYWLSKXngzviNBL2X7V9BPeEPyZTY0mxhHPtBlYRoQ/jUSt3x
         dOvrk5N00svgdFDqoIW1ZbTVsz54COq8prku+GILvRHlnvgMBdWM6tEJSGR1zP9wc/jo
         UsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cQAgf0oTUjxvMteG8WaQe8aas6eUXFHbWIocwnGX9Vg=;
        b=PqQXoxOabqbl4z2Rz8zV7nEZhR358+7I51whItlx0rYwKzOBPWHC/qsys4cz1+6CN+
         FVNzwhuw2xzRBCSnzqLIQaNQNk50+CKTRHKvznXOGM+2w+Gwgvy1UGpnd7FycovsIDnV
         BxMwYNaIHQK1zKzFZgKbTbHQqH27rmB7MA3LiPR5H7sQKAdQ7Tyr1MyihHQZ4vZfGg9O
         cG+WLt49btIjFdOn1xd1XGAu6n9C98a6TtJhEMqdo8BOBJmbVKuxM27QwcI+5pKm5LVq
         i8qHctUoq1Q9Fn9CdN6BrYD8FgZ1BzOjxSkDJ1Vf/90T7r0Iwc4nDf9A757CAZvfFP45
         OrZQ==
X-Gm-Message-State: AOAM532w55ePUwTkGouTgXjBwOAuRmvqRNk7Lndqo5YU6ESRL0DhJLUm
        JRNpKXXYAY8mlM2NgHcbAGQXHkgLsqZPjbgHm79Pd4NJZNo=
X-Google-Smtp-Source: ABdhPJxoMO71guPL/vm1Jkxy/JCNmb1EkCl3GRHli3+Ukbs7TG3GKNrF3eWkqflG+xAkaoCbtW+dyNJII6mmLAV4xws=
X-Received: by 2002:a25:b3ca:0:b0:664:37b3:f3c with SMTP id
 x10-20020a25b3ca000000b0066437b30f3cmr22219606ybf.175.1655120431593; Mon, 13
 Jun 2022 04:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAHL+j08f4PJd64d5OQY730QH7AvJkf97HaCrJBF_vVR5-DmSjQ@mail.gmail.com>
 <554b2f98-7fec-3b45-cf60-ce95cf82c88a@suse.com>
In-Reply-To: <554b2f98-7fec-3b45-cf60-ce95cf82c88a@suse.com>
From:   Sylvain Munaut <246tnt@gmail.com>
Date:   Mon, 13 Jun 2022 13:40:22 +0200
Message-ID: <CAHL+j08x-GUzaAyRSR1FxjdrhuO5rg=v41i4+d2tinDrAsCiHw@mail.gmail.com>
Subject: Re: pps-ldisc support for cdc-acm
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FROM_STARTS_WITH_NUMS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Well, technically you could attach the line disciplibe, but it would
> do nothing. Do you have a CDC-ACm device that can be used for PPS
> or is that a theoretical question?

I have one.
Or rather I made one hoping it would work out-of-the-box.

( It's a OSHW device https://osmocom.org/projects/e1-t1-adapter/wiki/IcE1usb )

Cheers,

    Sylvain
