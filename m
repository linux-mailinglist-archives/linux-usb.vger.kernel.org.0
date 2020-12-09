Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0981A2D3EC6
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 10:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbgLIJ3W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 04:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729261AbgLIJ3S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Dec 2020 04:29:18 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92932C061794
        for <linux-usb@vger.kernel.org>; Wed,  9 Dec 2020 01:28:37 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id m19so2191749lfb.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Dec 2020 01:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nPBiqiG0+OPNjKKwNHWnGemZ1swbMpEOyi2mDu7HemI=;
        b=us9RvDd6QQubaexTYMj32UCvXmezTaru7m/gt8qIEVQnCUShV040sO5qvAWwELFzv6
         2CsjSx1G23bt27kfSrgY00FjXeAl+c0EVSzZtmY90iVC2c/QYfjknMq0RhYpQ392MJUe
         p1eQsiIqPB565pSwPjtPQbYD/L/FayJtSZ2lQYv5gpMwqMIwq8ZNE6eA74h6NMcR8EXG
         Qh8hd4KJkLh2N1xUDqBwGgI6nfXQmaBoUsjeVGeBac5cuIRXxUEi7BLZQYz8LDYJ/drP
         BaeyUtU9KvDLVcqzxFFcNZcaQMmmnO23l8SuWB3ixRpLcg7qRI+WQ9zuVDtaWIVyCsJ4
         ZsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nPBiqiG0+OPNjKKwNHWnGemZ1swbMpEOyi2mDu7HemI=;
        b=XmWfzB5zHLXPHrKweML9EsHNM8fp5ZHy8NCan967p0qB9SefregZ+kH9vvRBiCD+Ft
         9ci0Oko5WqF1F2Z8INtySnwZMZKvdldENs8KCQ8QlKmQWUanxNIP9l1nt6+4CeA+WiOP
         L4GXmXlryUQlp1pXHwRLGimK3/hP5RQxLoUnLcBCZnC1fXSI/CkabClfb1x72WBqQ/x2
         Y5D5RmwqT+3L7F1T6WmoK51w0o54QC1BhWqQb7t96lZdxIl3Wfx8G6HF6ZiKDBlyeUpX
         sAfvvZKv3ujA0UdQXQNw9v82AS3S+koKTZoo+l8Z3ULrvqMFjeNmwX1sNm2TKw3bI/k4
         IL4A==
X-Gm-Message-State: AOAM530mz+ielOw3GVESrw4W+7Bo09nYRL8XROYrUv75K9IKUdNbpouj
        oGEBnpOH8speBU1mlqkdjVrlKRHkNSIgKznzb+8NPg==
X-Google-Smtp-Source: ABdhPJwhwlHBlbTQF1U3MZGgVD7bKekQd7ucodES1SBhT33AOLWm0peJOvE9+cvnFgO2Ro4ID5f1bVil/4Qtp/Egw+U=
X-Received: by 2002:a19:7d84:: with SMTP id y126mr711294lfc.586.1607506116141;
 Wed, 09 Dec 2020 01:28:36 -0800 (PST)
MIME-Version: 1.0
References: <20201204164739.781812-1-maz@kernel.org> <20201204164739.781812-3-maz@kernel.org>
In-Reply-To: <20201204164739.781812-3-maz@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 10:28:25 +0100
Message-ID: <CACRpkdbJUa9G_OtwM9YnNB84wUfT7hLpw8c=RQxdjaUvRST4dg@mail.gmail.com>
Subject: Re: [PATCH 2/4] USB: serial: ftdi_sio: Report the valid GPIO lines to gpiolib
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 4, 2020 at 5:47 PM Marc Zyngier <maz@kernel.org> wrote:

> Since it is pretty common for only some of the CBUS lines to be
> valid as GPIO lines, let's report such validity to the rest of
> the kernel.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
