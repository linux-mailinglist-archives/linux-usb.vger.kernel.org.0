Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCD02644AF
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 12:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730413AbgIJKwq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 06:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730403AbgIJKuP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Sep 2020 06:50:15 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7860AC061799
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2020 03:50:06 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z23so7960128ejr.13
        for <linux-usb@vger.kernel.org>; Thu, 10 Sep 2020 03:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dl+Puul4vVPh8oSiqSBQlazGVFYUlaK2t3JkMD3S8VU=;
        b=MfR+kaqr9Ijvrx9g8wnfe7FFqLLww8qX3LZ9b84v4pCfAz/g6fGA42sPm0CJpfWGGE
         qYE7rUatAHQDiitWJVs+uVxotoSAZqt3zr7GoxqZGh1X3QFe7FU352wH11BltiJNbHql
         5AEqFDggtRG3ieScrHb1PF00WL7dA2G8E61ESpi3lxr5RGIVR5IxhnyQQ0zgnrTAX3WJ
         VCZedtySvxPz/rXfJbYgpG31Vva3nJGgcQW74ksuK5HiDq8OoQimF9YEDA7bng/B1Prl
         fHM3laMutRyVCPg1OtxDzcu3uQx4vqauE5jF35lEQWUua+8X9EvtaD00ZrmplRoQ5jGi
         HkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dl+Puul4vVPh8oSiqSBQlazGVFYUlaK2t3JkMD3S8VU=;
        b=bqV/BNdEcIxGkczbBR2ZHbB2XF+ZPbvhDrk2gTSdNnbGVD0Dcb7uySeCtGLnAzZpuC
         Zx3EE0XH+G8jrBMBg8al/6Pe0/mgTZIHMT//PRNzDyox3pJvanWmSCjRwBOeV5PX0IH9
         5aflhkLhy7tFUkd6dr9ityix6nS2ORFUwNcdld5NB3n5gIWnctu9IlAYmlF9zfTDGPoW
         uYHQzRQbW77cRELuiCSGKc4WOc1rPEmbt2LQiwHnBcKPwPttosL+qtwGv7HXSr74daEF
         ID4rvfgOfVowianIdNMK/ftu1L8Zx2+GbD7YplIMG6z0sl5xeI49TeyYJCT8Dxm07LiZ
         kYMQ==
X-Gm-Message-State: AOAM533W0pNS87rlAOrPmIW/W5VceC5xEPfSsv1BIx7p1brMnjXyOIk3
        VrTAcs/apSD+1QWImBy2C44NpqROw4KMaXfTXiJ3qQ==
X-Google-Smtp-Source: ABdhPJz2QEjAlqXQ/OoQNuvXwR82jdCqI8EOUurylTRWYYiFSskudC59oTiUg29MEX2zzBztMwvKMOU5vvzGeJ0jq6k=
X-Received: by 2002:a17:907:94cf:: with SMTP id dn15mr8438636ejc.114.1599735004965;
 Thu, 10 Sep 2020 03:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
In-Reply-To: <1599726112-4439-1-git-send-email-chunfeng.yun@mediatek.com>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 10 Sep 2020 12:49:38 +0200
Message-ID: <CAG48ez1jLVcj=BAAsSA5i-k+gCtRNn+OhfwAWAxFJSKLwZKQ=A@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 01/11] usb: early: convert to readl_poll_timeout_atomic()
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Jason Yan <yanaijie@huawei.com>,
        Chuhong Yuan <hslester96@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Saurav Girepunje <saurav.girepunje@gmail.com>,
        linux-usb@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 10, 2020 at 10:24 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> Use readl_poll_timeout_atomic() to simplify code
>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: Jann Horn <jannh@google.com>
