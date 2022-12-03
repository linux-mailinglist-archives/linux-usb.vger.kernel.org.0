Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 427F564155D
	for <lists+linux-usb@lfdr.de>; Sat,  3 Dec 2022 10:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiLCJlr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Dec 2022 04:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiLCJlk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Dec 2022 04:41:40 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F12654F6
        for <linux-usb@vger.kernel.org>; Sat,  3 Dec 2022 01:41:40 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id i131so8767366ybc.9
        for <linux-usb@vger.kernel.org>; Sat, 03 Dec 2022 01:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDK0G8ouGBOV5VO6vGZyWeQ21uSYq0BpFxpQ1NWHPuY=;
        b=jDNDOI2qnx6ltpJ7lB0lWzcQYwX+zN+xmC0k2auhAF/ysf+2Nll5l2PXe68Mdvca8R
         Nqk2Zy9MPHZ1NJmKSBwFAGM/CK6AiFI/R682ZKcnGJ0N5fVnYV939ZdcZjEIifFF6aVR
         nEQQlymGlo7JfubHTkPR+Q5UbB8Pmv5sU4Pe/2sObCE41eEMDMnQNmE4GnrL6kJxkNSi
         KqsnBdUkmABQT3a0/NK8waBuuhxM98MyPzoZwBww03pTPoScfbzNF7/J0RnOV/UwA90+
         OeunyTSxlcShD+2agZALl62zRjoEtYd1GUzeue/jcBS2BQiIgcnRoCjkw28n4fvrpF5f
         QBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDK0G8ouGBOV5VO6vGZyWeQ21uSYq0BpFxpQ1NWHPuY=;
        b=YTaU3y7XzurZxowxDvgeQn9Y4dCm2DsORWOenWZinmL82ciCOfbbbHUM5U6pq7qkJd
         +QM7IDZricZ1H89Y+4TH35qhWctorVA3uGH9RH4OuGVlnKaJmYgbGS1bXdJJY7dsd+Gp
         j3wnB0zFLBHSmqpiE+wpD0gNfR5jLsMQUMmRGLESfldlpSt3dXqdagKg5P3r/hjSpALk
         DSPhf8U3/wbXl3fysmmQ18g8hH+w40bqOmY9FelAZQq2m5/uKW6dudRppH00TRzXxy8N
         XH711+E4UEpYfLHM+PLrVm1ew64o3sSco9AGEqYvhkZwgF5Svye3Uc6W/iD0X0aDXNob
         yRog==
X-Gm-Message-State: ANoB5pmvXLEEbrvZSDUYmBmHMrTT4Hpfxd4JC+t6JR608EBws7XYcsIA
        wpmyE3HuAXJqWPl5OaFzEZTkNspanl9/iPkWCqTNbg==
X-Google-Smtp-Source: AA0mqf6OeYSlNYdwJZi7N49Ddks0I5RlLP1DORD/D7oglSBgyyJXrHThcCYGJ21kpF6TYn9POuzl4+8Qm6/n0InBSmI=
X-Received: by 2002:a25:d8d4:0:b0:6f0:36e2:5fc2 with SMTP id
 p203-20020a25d8d4000000b006f036e25fc2mr46458083ybg.52.1670060499565; Sat, 03
 Dec 2022 01:41:39 -0800 (PST)
MIME-Version: 1.0
References: <20221202012126.246953-1-yiyang13@huawei.com>
In-Reply-To: <20221202012126.246953-1-yiyang13@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Dec 2022 10:41:28 +0100
Message-ID: <CACRpkdYqQDSpHQyTaAY4H_9jX03d6oJKOu-zDvx0iJmTE3-jiw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: fotg210-udc: fix potential memory leak in fotg210_udc_probe()
To:     Yi Yang <yiyang13@huawei.com>
Cc:     gregkh@linuxfoundation.org, andrzej.p@collabora.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 2, 2022 at 2:25 AM Yi Yang <yiyang13@huawei.com> wrote:

> In fotg210_udc_probe(), if devm_clk_get() or clk_prepare_enable()
> fails, 'fotg210' will not be freed, which will lead to a memory leak.
> Fix it by moving kfree() to a proper location.
>
> In addition=EF=BC=8Cwe can use "return -ENOMEM" instead of "goto err"
> to simplify the code.
>
> Fixes: 718a38d092ec ("fotg210-udc: Handle PCLK")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>
> Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I have some cleanup patches switching around to devm* handling
cooking for v6.3, but let's do this for now.

Yours,
Linus Walleij
