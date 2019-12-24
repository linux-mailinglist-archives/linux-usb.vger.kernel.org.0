Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59C1E129D0D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2019 04:16:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfLXDQT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Dec 2019 22:16:19 -0500
Received: from mail-il1-f179.google.com ([209.85.166.179]:38153 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfLXDQS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Dec 2019 22:16:18 -0500
Received: by mail-il1-f179.google.com with SMTP id f5so15569018ilq.5
        for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2019 19:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QAv7FHFnFuVuFyAY9TV+CIfNDmLzQr+KZT7BVX47nmM=;
        b=O8eyFfPlNH95OpJxXDyvhJjQLasG7JB3tl0EIsequM2cWscK95UadonZPz8M2RA8Nf
         Rlq359BxQAKUF/7PBA7NJDTGRMoVNoG21sGnw6iBdJJSXtgxshXL/T7Q6Mw97GcPHkj3
         dZO86iCuUhBa82HsCRJO0picZkmev8GAxuMixhmXzRdC2Nx4DXO0O/sTI3Q6ymrXmU4g
         YmGzRKJXv7ICnwLD6oXM7enxLG9VzotCS2fFUNPUnlkz5b1DnyRBfpqTFx267/g+VmQc
         oYC8L0Hu1Kb93I9Re+24CG2Rj6b3B7b2SNArLISYeIdvzE5KO+7Ol50f92yHD3iKdRUt
         +gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QAv7FHFnFuVuFyAY9TV+CIfNDmLzQr+KZT7BVX47nmM=;
        b=W2HWui5DPh6z8R3AYhLU/JyiAZmTI62FppP2fEiqrK8mnk4SI1DAd1sxsk42Z4LHGC
         A7glH1MT19OPNnxvwRNcVIXzUMb+oGv77MlxyAQKzukiiyRkORrvhQT+2MZzIc447fYN
         lt50ivT2OcUd1DynyQ0WUxrDaKf+CHNT1yzGjwZlv3iWuqQBcj8GMp7Hnj/CHWADWXAk
         6AYAKBeR9C3ezH9wbyYgA0xQr8oZxwq02JgVh0OR4BOH5b3m6XfXMkAeKyE80Qs+u8Rk
         QyTsHQrMQl5LyLVoT0BMukFCxkLkUJL4wy3YmGYCFYTVXTrcpiLJOaJasmCTz8+E6WMT
         U/fQ==
X-Gm-Message-State: APjAAAVOMEYKKcmgf7ppzSuUSXp80AJ0HbMcm01gnrW2v92/TRZ1R1Os
        8CISfq+Sk02dZbs2z9yCNp5e2oeuD9OqInLaK5IBEbqD
X-Google-Smtp-Source: APXvYqz4wdC5KBL0tZHDuW93XqVCTR/ZssdOJ526DMSSrxoaQDdM+MfvYAjY78orCBYNaKBgntgrp3denFrRdsPQhE8=
X-Received: by 2002:a92:4604:: with SMTP id t4mr29448339ila.237.1577157378151;
 Mon, 23 Dec 2019 19:16:18 -0800 (PST)
MIME-Version: 1.0
References: <d8d929f3-9479-85fe-915e-ef1f1386bf6d@ivitera.com>
In-Reply-To: <d8d929f3-9479-85fe-915e-ef1f1386bf6d@ivitera.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Tue, 24 Dec 2019 11:16:06 +0800
Message-ID: <CAL411-rxfwOGXNbuhCkXPAsQZYquPc2wxkx7Gf+enn3BKv=kYg@mail.gmail.com>
Subject: Re: USB: UAC2: Custom bInterval values
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Dec 21, 2019 at 4:35 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
>
> Hi,
>
> I would like to add support for custom EP IN and EP OUT bInterval values
> in f_uac2.c, to allow fine-tuning the gadget for higher samplerates.
>
> For now the easiest way to me seems to add the params to uac2_opts and
> add module params to  g_audio module (to the existing params p_chmask,
> p_srate, etc.). Please will such change be accepted to upstream?
>

I think you could add this support for uac2_opts first, the configfs
is the suggested
way to support gadget now.

Peter
