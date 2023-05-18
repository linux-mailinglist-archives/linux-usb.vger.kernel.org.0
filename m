Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83A977089FA
	for <lists+linux-usb@lfdr.de>; Thu, 18 May 2023 23:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjERU76 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 May 2023 16:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjERU75 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 May 2023 16:59:57 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CB1EE
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 13:59:56 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-561a7d96f67so32548987b3.3
        for <linux-usb@vger.kernel.org>; Thu, 18 May 2023 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684443596; x=1687035596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XryR9Ncunvyn1ZtJaDPR6nedV8MCwjQ1jOB1dM16CzU=;
        b=PCvkK1eNB66ffon4it+4eYF/lSpzUx5WPxk/ed4HTsjSwACbVu/gKdgrCar/5ydFOC
         KWbWBo5RFMVzku7PfY3xz32/O2HgTW6kX6Twz2H4qILYxhyVob6gjBnPzRH4gLnnQuUs
         VfqJiY1KQhjtmKX5V5rk0efoBtdEOGCmVgBruMmo+YL8ld460UNHUaRDknupeFLEVATY
         jSYLJULSWwQ7BRjsSu3hy/L8DkEsvFjQu9lXYhfvvn8ivj+dKqVy9KqOJxy2b2ne3KCF
         Knqy0Lzzkh6tfl+xLjBtXj/pRwZwqPH+VqBS9W2ppIiGwu3FspPSs4OvLj5aBXgxvy04
         uvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684443596; x=1687035596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XryR9Ncunvyn1ZtJaDPR6nedV8MCwjQ1jOB1dM16CzU=;
        b=IwVnSDvteO7qpTvPUqD0Q3vuUIC/44B/LCuHvMvxcSX7ozeN4DrwfVXlk/d9svS61m
         uck5nG/ZjfEkbnQvjX0hccvCpbyrwbdWnBWrf9UHfra+Sg1NmIoK57RCDGzaoUiPzg8y
         pKvNquLqGyXgDlIdoXvgi1KuGStrBknPRJH1/xaGwdqaNNgRzpZsJ1msXwQCoWPUvUfy
         nSjCy4a/sO85XE98woiGQ7kmNe+0bEmaO/TMbKpahMWA/c3T6i+iE/1IpDY/LAV6e5jN
         RyeE8iU8CZWX7VH/agwtZY4PVii4pc/rypSEM4ArzYQtAuVsMi5E5fH4zxA3+zL6EDSL
         dQJw==
X-Gm-Message-State: AC+VfDyoC/GvtvQYJ9z6dGiWnhFFlK+p9JZRrrcX00iKnm3jAI+ljHrM
        lCaBpvr7dIH4SbTzl6WJb+3qiU65YlzAxM0WXSEF4Nz2Zn5GjWDA
X-Google-Smtp-Source: ACHHUZ49xBe6UtUNfmyJCboEIFA2EC6g3W1V0s7/ZMasqX35Pa5ofavlXXo1bq6hmJvgBjYfj/mIdP0rALzXnVSe2Mk=
X-Received: by 2002:a0d:cb0d:0:b0:559:d9a0:5e52 with SMTP id
 n13-20020a0dcb0d000000b00559d9a05e52mr2162685ywd.31.1684443595784; Thu, 18
 May 2023 13:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de> <20230517230239.187727-24-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-24-u.kleine-koenig@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 18 May 2023 22:59:44 +0200
Message-ID: <CACRpkdZiv=6Twf5UfxJORPSwWdB1MMKgEAUvccYwaxa90GZJVQ@mail.gmail.com>
Subject: Re: [PATCH 23/97] usb: fotg210: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 18, 2023 at 1:02=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart fro=
m
> emitting a warning) and this typically results in resource leaks. To impr=
ove
> here there is a quest to make the remove callback return void. In the fir=
st
> step of this quest all drivers are converted to .remove_new() which alrea=
dy
> returns void. Eventually after all drivers are converted, .remove_new() i=
s
> renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Looks good
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
