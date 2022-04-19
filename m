Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC695507CDC
	for <lists+linux-usb@lfdr.de>; Wed, 20 Apr 2022 00:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358360AbiDSWzV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Apr 2022 18:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbiDSWzU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 18:55:20 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDDD32A734
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 15:52:36 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id r189so14009402ybr.6
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 15:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dGxEPoSmeIiVN+kWljOoFUiaxfdNkmXv2+VPeoexn/w=;
        b=tLO1vkuyKGUcdIGMRyqZPIO+6Fs0Rt8QeQ7ExLtvOHs5wEaTl37TJYbK6zmfS/YBKn
         6LNlNNePHFM3X5wx0v0ciGBBVCNE07I6dL5tVEn4c0Xzu1jeUTlHhvtrwPamCBgt6YEz
         0zgKS84hV+mFniAnhe1MDszKaKbVUPBG0Zjw6dOiZiguUA0gXQOC2YOsMKTIT3zLhRo+
         4tTbEWC13mFVP1rIfPX7ZZtYaUSn0Nd9pKF7lZvMVD3EnI+OthLQIdy74bqzDzjuRQyb
         UGvxnDETSUCE9S1Or5u6RhuIokP3lEE3EyYF2uSil640/kBW7m1s87/G/7lvNIykBSyq
         0tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dGxEPoSmeIiVN+kWljOoFUiaxfdNkmXv2+VPeoexn/w=;
        b=55dlwdqAjkvJPb7vm/8ZeIroVlT0GJraX30umJIIwW1/WGFgrsUssnCgWb8QseS4Ua
         9ghhYrMATuER+IAajSVI60FgIp2czyAZt9Q9/5GgI8vvgB1b60ZwrxWJ8onm1hu1p+vS
         Szc2k8DGivrP1fSyK1geyi0QJO8bzO2Bi3EGQvBfkDNm06Cp/NyFAsXB1f+GgIxwFoR4
         c2pga3m0yZ2q5ZAPG0PqD196tREqL7MfVBbudc7E7fgHyB+8iB66btayHKfoG0a1IFAW
         suf+k5H/gEeijhhIF9RG44i5RhKvcSJZICiljAx72PrlCv2+aRfpO3eLECmbUuxFkpE6
         c3GA==
X-Gm-Message-State: AOAM5330nV9S3tdAUdxTpx7v9scNQ+NpfkAvmb1VmQQ5XXhczV8/bPLN
        ddM2tDbcJuCr+JW7rTn2r3RghKlI9X4tZJxvRr0JUg==
X-Google-Smtp-Source: ABdhPJyJrXEZ2TUGlRwB5uW/Zc+cwpXk4Rq+ww8H648TL0zPn9ZcG1qzvHfQBTBZn7txEdFekcEnbQbza7oUOPpNlPs=
X-Received: by 2002:a25:a12a:0:b0:644:e94e:5844 with SMTP id
 z39-20020a25a12a000000b00644e94e5844mr12696268ybh.492.1650408756081; Tue, 19
 Apr 2022 15:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220401023306.79532-1-frank@zago.net> <20220401023306.79532-3-frank@zago.net>
In-Reply-To: <20220401023306.79532-3-frank@zago.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 20 Apr 2022 00:52:24 +0200
Message-ID: <CACRpkdZFQtPkWWNFZEDVKtoGYEL9+g5iEZVozWxuQmVpx4+8Ag@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] gpio: ch341: add GPIO MFD cell driver for the CH341
To:     frank@zago.net
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 1, 2022 at 4:33 AM frank zago <frank@zago.net> wrote:

> The GPIO interface offers 16 GPIOs. 6 are read/write, and 10 are
> read-only.
>
> Signed-off-by: frank zago <frank@zago.net>

Looks good to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Yours,
Linus Walleij
