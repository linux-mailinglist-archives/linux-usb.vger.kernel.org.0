Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC3E67D5D0
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 21:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232453AbjAZUAI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 15:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232187AbjAZUAG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 15:00:06 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 327186D5C0
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 12:00:03 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4c131bede4bso38505897b3.5
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 12:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hVRUNLjCIjUUqcVDUBbgjMILwZgLU2Q4EQGndfqZctc=;
        b=AZjSjxtx4wegMExpl5wFFq5rlmtjBIBkaV6HcsyWOjhGXPCCiBpmb/wIsekFdfo9kQ
         LDin4Xfuajz4AfU5s7rkgIZ39RE5pX1zEYnERoH+gNlWttCNhzIljQ5eRZu/EWmadcwr
         4COEFlqaEVy5a35picJsMJkoJQpjE+6q6MPVBtJ2x2BqwuWqjA7c+5QkFRxchfvK2ftc
         hL7UDEbRA/TG0FKCvsqz0/FtRpqSYhq3mu1RHE/57t4PYWsbTEfOo3EbUkCdvjvHBxEk
         WwG5sfgsVKxIGaGDj2X6/1xdoQSsKBklIhRt9oXR64WD78Zi8S9sktitSUywF+PSvOq6
         QSpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVRUNLjCIjUUqcVDUBbgjMILwZgLU2Q4EQGndfqZctc=;
        b=yw8Cee//lMauR66NeMmVFcJUe045khBd3MvEgiwEnKXO9DlvXfkYKIu34jCfodWAgu
         3L/5fxxAts32Ji3DW+gN7Xp8F+YerdY2wGFGt6GMPmP539nGKNPBP6w9mgaH7835zZ+O
         60bFtqD98FE0sd65CVrtkBaaOpHwVT2r1uME1UFrOFn9Y5PY3HF8VHXysLM4/ZzGktQX
         zODJb+2BSvMgL3DlTo5jXlzNYznh4t0JORR7FAn80UuLITThza5UbGgqmy6OCU/BnUWz
         JYm1Kk4RMnqgqDD50LFktUcq3sbMAt6JI+gjjBDgkpwlZiFC9EbR5rR9oTeKNtRTic72
         nySw==
X-Gm-Message-State: AO0yUKVHya3UA/+zxFQ9MZIKkNdsuNxXc8K37KrQ6b8AX4FrbY/gVnPw
        bLTZjrJs3vAX1e9/JvQ6Eh3+BvM7oOhBbYWs9EuT/A==
X-Google-Smtp-Source: AK7set/620QxP+YxwSup3H0faYChigsEwRWBbiMXYcIpyH8Jz+TSApYVFX4U2ZAfau7okUlf4yy8CvA91ekJZ2r6W4s=
X-Received: by 2002:a0d:e701:0:b0:506:66f5:fd24 with SMTP id
 q1-20020a0de701000000b0050666f5fd24mr1142106ywe.130.1674763202381; Thu, 26
 Jan 2023 12:00:02 -0800 (PST)
MIME-Version: 1.0
References: <20230120154437.22025-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230120154437.22025-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Jan 2023 20:59:51 +0100
Message-ID: <CACRpkdbRtXVLhmMKwCZxfCgp4H64gQEi38Y1J_rQ7x+b+4Dt5g@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] usb: fotg210-hcd: use sysfs_emit() to instead of scnprintf()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 20, 2023 at 4:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Follow the advice of the Documentation/filesystems/sysfs.rst and show()
> should only use sysfs_emit() or sysfs_emit_at() when formatting the
> value to be returned to user space.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
