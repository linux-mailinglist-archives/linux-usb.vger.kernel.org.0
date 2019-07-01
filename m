Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB785253FC
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 17:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbfEUPeQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 11:34:16 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:45104 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbfEUPeQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 11:34:16 -0400
Received: by mail-wr1-f46.google.com with SMTP id b18so19085640wrq.12
        for <linux-usb@vger.kernel.org>; Tue, 21 May 2019 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bqLYld3VX/KZYenyewBwijFGLXmDZ4ZcB2Pc2sDMB8o=;
        b=rbdO73qSK67ppmSog10HPSh8JWD2iexbOqLqx4e1x6h4qKRmTBM4+j/hqHfdA7n7ef
         9ejSwP1LWI3C53xS9kXBmxqz62EALFyhdwd4DhzroVJC/UW5EF+XISqs0Bv9eyJcdORl
         UKkyPNqRpMkY8zwKZ6JI85UQsI4awnVuFixu45X5Yej9Du8lCYak4YciKwH/V2lJHLcj
         4j6fzIs3Mw5fIGsVHpgpzc5HAsyxDcfzq7E65s7oxZrR+vmsBmp8CosszSvUIG+LlRm1
         3ZsWAh6KLxL+ZvjuXVPjDyfXitiRL3zo4yv/PfR8LBTeAUYQzVKyfXKUtdiQ1Zu5fLbf
         1iyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bqLYld3VX/KZYenyewBwijFGLXmDZ4ZcB2Pc2sDMB8o=;
        b=ramt++5eTxn3TBHrxJA+dz9wfPTK650hQROP6XHuFb2WN1wiS/6EomkEymxc2I5RqL
         GrJFDMcy/GSJaloKe+O7uY5d5UuzWyngq47TJWb/EtIOcWnY3mxJwG92FFwzNKrgMo3d
         GdJDclbe1cbZ7rYeyPGPI8LOk529Znh3d/B0gJeQAa+L+rLmnvuOqQPmyERh+C+7xbtK
         0ZcNTsAxx9QfoUFpl1WCFSP8uaK96ciTjQt1OIoiOed9Xm7L1Me3YMyd5kWFDgvAW6by
         fr5BGBKJgdM0ZHFx8g975+lXsstOtuIzaGa96MxZ7SpRPpFs7vnQVNTj5tVLgKvMFrA+
         nGLQ==
X-Gm-Message-State: APjAAAXSCvMv0sdAKG/QpDROcrnKGbtfCDAX7tfQawCD1KeLIvQCRF/V
        cVUroYG9bn+HsryWF/gX2wj4ZFNOB/wUOHog0HKHGQ==
X-Google-Smtp-Source: APXvYqyBLXULB9X5PD+iPwuBEjdqQQwlx6IsrRh80MfxPXTrYxfxqqW+idUM28iKqva9wskFgLsjCqyphLZjvkLGhRQ=
X-Received: by 2002:adf:978b:: with SMTP id s11mr26223969wrb.169.1558452854441;
 Tue, 21 May 2019 08:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <CALAqxLUMRaNxwTUi9QS7-Cy-Ve4+vteBm8-jW4yzZg_QTJVChA@mail.gmail.com>
 <7caebeb2-ea96-2276-3078-1e53f09ce227@collabora.com> <CALAqxLUfJYUtmQDC_aDMxW7KcPUawGoRq-PNUfmzQuNKh97FmQ@mail.gmail.com>
 <CALAqxLVUFfrPVVjR74V3PhhtcCytfp=cUYjo=BcJ14D1fkVXTw@mail.gmail.com>
 <7ec57c29-d1ab-dc4c-755d-a6009b9132b5@collabora.com> <CALAqxLUgnTB7aZ4edXCaG8SJsJzfY1_yNEPc6Losssw5Xy9-XA@mail.gmail.com>
 <36620156-d119-b1b2-989e-0c13b783296e@collabora.com> <db5665cf-6274-c254-720c-798fec79d131@collabora.com>
 <02E7334B1630744CBDC55DA8586225837F884D53@ORSMSX103.amr.corp.intel.com>
 <CALAqxLWVc6DnRHJ9gQ8orY7f53g4j+x3BWnoJdBv3sXDZVNpVg@mail.gmail.com>
 <02E7334B1630744CBDC55DA8586225837F885FFD@ORSMSX103.amr.corp.intel.com> <1672b93a-dfe6-acb2-715e-c4a13af54413@collabora.com>
In-Reply-To: <1672b93a-dfe6-acb2-715e-c4a13af54413@collabora.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 21 May 2019 08:34:02 -0700
Message-ID: <CALAqxLVqGLqcaE=VTm25-yj=nwhi+5Bd1F0uib6x9nez2KtSMQ@mail.gmail.com>
Subject: Re: [REGRESSION] usb: gadget: f_fs: Allow scatter-gather buffers
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     "Yang, Fei" <fei.yang@intel.com>, Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chen Yu <chenyu56@huawei.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "kernel@collabora.com" <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 21, 2019 at 3:04 AM Andrzej Pietrasiewicz
<andrzej.p@collabora.com> wrote:
>
> One thing that becomes evident now is that adb uses async io.
> It seems that interaction of async io and s-g mode should be further
> investigated.

Although on our devices, we have async io disabled w/ adb, as there is
an existing/separate issue w/ the dwc3 driver in 4.19 and older
kernels. So it seems its not strictly connected to async io.

thanks
-john
