Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9931D6A1CD8
	for <lists+linux-usb@lfdr.de>; Fri, 24 Feb 2023 14:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjBXNQT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Feb 2023 08:16:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjBXNQS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Feb 2023 08:16:18 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6806365305
        for <linux-usb@vger.kernel.org>; Fri, 24 Feb 2023 05:16:17 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so6218209pjn.1
        for <linux-usb@vger.kernel.org>; Fri, 24 Feb 2023 05:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hCTMcjMsJ61jx/KrUj4nZMHZDl6gfTyHor+Zyf1EnCY=;
        b=h2f0aCxg/HWG4Trq+slq77F4sATq/wu3atQSbBUBMo2GNbtTeQ1Tydhxo7i8pcwiIt
         +kcSCrNTBv8V3R/1Yu8T+f0wyTXYBI+Dp2qHZtjAzkXJx+B4GePdwwRZAQzu8+B/tlQO
         PILGTzNOPHCDlCjdcAuRwkSJBo9bK1kD7u1fMF96vA+cKfwaMeAn9nfZeN4OT71eDvvI
         /5z7oI3wRE7E0H7c++Hox4lbQBflihFq0Dyci35juwFL3Dz9fUIAM6hqfPuo73y/nMhw
         W7gZ5cqd2lisW+TQadoriE3b0sgSFgxqoHsGrEzj6rEZcLkDD3zEsaZuxFMArhpxMs94
         XHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCTMcjMsJ61jx/KrUj4nZMHZDl6gfTyHor+Zyf1EnCY=;
        b=JTAkg/wNxt+56d/kmWE5aMYLM4x20QEUVqOsuA7VIhYg/tBEK2KgTBGCCCFhCV86DN
         uzKOav3sIGfrQCgYpNxQH7kM7QcJXKdWk3NDK/sW+HhypmB0P9hp5IKuAU4rwIuurPKP
         y/K0rp78f/qVn7W2aFnknhAboVUbQcyZhFunlB/qGfhO7MT8WJONf4b/4w16fTd2rugL
         3DZoypHMZssXJ7YABxl4Zwjc3+p9dT1i0mwfyh5sR5CBRfm7MA7I+ISMwA0ZBwUm5BC7
         mBE/zJmDiXpXdcoS1953E/fKL/klYKIq1KIfxmHXWIlKF3ulENb+DKy3eUx65apiIPAT
         ld1A==
X-Gm-Message-State: AO0yUKXjDLxQxUYmJPBYEj93BaiqYyWm3a/d+qjVT/nG04adQAyj6aL8
        r7jRcfbEzQjQZonmG+9Jqbrjwb5w9P5PQ66xi64HRtRopao=
X-Google-Smtp-Source: AK7set8W/6KfrhnT+HDg18RfHYyFssGzOUEUUOJ/10vyeGZGQkgZ9ierBBLt5jCtdfNBrdlGpNnsrynRCHvuYzF+0PY=
X-Received: by 2002:a17:903:4285:b0:199:1afc:16ad with SMTP id
 ju5-20020a170903428500b001991afc16admr2887555plb.5.1677244576893; Fri, 24 Feb
 2023 05:16:16 -0800 (PST)
MIME-Version: 1.0
References: <CA+JN8xMXu=sVQ2nyR9SgF25fquCZhH43wdsnuvfjDu+yGRv2yA@mail.gmail.com>
 <b13655bf-4a04-bece-71e4-698bfec83e2d@linux.intel.com> <CA+JN8xOOyU8yLJrxnKPwAMhQFKE70rTi=aLa3Adt7Og4dfPRVg@mail.gmail.com>
 <Y/eKwvQAihZYKUos@rowland.harvard.edu> <CA+JN8xOWzo8ugtzyrAeSB5wN7XSxXs1-69kTZyJ-ZSPLTvFx-A@mail.gmail.com>
 <39df1d39-f1f9-ce69-64b8-981b19731d30@linux.intel.com>
In-Reply-To: <39df1d39-f1f9-ce69-64b8-981b19731d30@linux.intel.com>
From:   Seth Bollinger <seth.boll@gmail.com>
Date:   Fri, 24 Feb 2023 07:16:05 -0600
Message-ID: <CA+JN8xPjqCaHLvh5v9y3pFC0DxNWjBj-3jF0DJ=B1YSddvYGNg@mail.gmail.com>
Subject: Re: HC died
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        sethb@digi.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> xhci driver does exactly this, but fails to stop the command ring while
> trying to abort the command TRB.
>
> Does increasing the timeout for stopping command ring help?
>
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index f5b0e1ce22af..6cecbca34cca 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -397,7 +397,7 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
>           * and try to recover a -ETIMEDOUT with a host controller reset.
>           */
>          ret = xhci_handshake(&xhci->op_regs->cmd_ring,
> -                       CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
> +                       CMD_RING_RUNNING, 0, 10 * 1000 * 1000);
>          if (ret < 0) {
>                  xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
>                  xhci_halt(xhci);

Well, for us it doesn't really help as it still ends the life of the
HC, but it doesn't solve the issue either (you can see the 10 second
timeout here).

Feb 24 13:11:53 AW24-002133 kernel: usb 3-2.4: new full-speed USB
device number 16 using xhci_hcd
Feb 24 13:12:08 AW24-002133 kernel: xhci_hcd 0002:01:00.0: Abort
failed to stop command ring: -110
Feb 24 13:12:08 AW24-002133 kernel: xhci_hcd 0002:01:00.0: xHCI host
controller not responding, assume dead
Feb 24 13:12:08 AW24-002133 kernel: xhci_hcd 0002:01:00.0: HC died; cleaning up
Feb 24 13:12:08 AW24-002133 kernel: xhci_hcd 0002:01:00.0: Timeout
while waiting for setup device command
Feb 24 13:12:08 AW24-002133 kernel: usb 3-1: USB disconnect, device number 2
Feb 24 13:12:08 AW24-002133 kernel: usb 4-1: USB disconnect, device number 2
Feb 24 13:12:08 AW24-002133 kernel: usb 4-2: USB disconnect, device number 3
Feb 24 13:12:08 AW24-002133 kernel: usb 3-2: USB disconnect, device number 3
Feb 24 13:12:09 AW24-002133 kernel: usb 3-2.4: device not accepting
address 16, error -108
Feb 24 13:12:09 AW24-002133 kernel: usb 3-2-port4: couldn't allocate usb_device

Also 10 seconds with interrupts disabled causes its own problems (5
seconds is an eternity with interrupts off in itself...).

> Thanks
> -Mathias
