Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F365753A7
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jul 2022 19:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239925AbiGNRCq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jul 2022 13:02:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239596AbiGNRCo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jul 2022 13:02:44 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B294957277
        for <linux-usb@vger.kernel.org>; Thu, 14 Jul 2022 10:02:43 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-31c89653790so23246677b3.13
        for <linux-usb@vger.kernel.org>; Thu, 14 Jul 2022 10:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qtK8JWxmh8q5x5mO5HKZTmWYXVBtIH5ikPi8Wy+gYMM=;
        b=E5mRlU4YdLivxzyaoEtuezS+Jtt7mY/sjICKjY8rfA/5Hio8aVxjqIJ94Gd+8yucJs
         VnhiykLwDQxlI64fycNCOI4gzCStjgGAnV0vlAIOmg1/v3ECoPqdBat2KOX+fAxTalH1
         /+7+bFTCU77K/CocLn+YYSABxxeSEYdZ6gF+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qtK8JWxmh8q5x5mO5HKZTmWYXVBtIH5ikPi8Wy+gYMM=;
        b=m4oS00UKpcm9HOT5maiWX1/fqifJLpjjsONRwPfWd6yljeP5xQFnNvYbfvTnRZResu
         yYI1Txy3q0AKk1lLuGEpfqy2oCfUBEpnukJ1bestZ0u42KsW7aFqpgoC0e+BhupJCBvu
         5JnLjfEhzx5dswN6zH4xf+u9mFWuVh1H12LKejnoEwF90AOEtl4j+cvCjRqQnGRnpkFw
         Mv0GJOClUNR2ZJPyoMPZvrqarWKTYqKQ+mp5TAA/zZH3tY3csZVXHrXfLlxOByWWeg5r
         6yZaI9Q2sWJdyjbHFvOr2VCilY67xYY7EosuarJzNzQol3XpZJCns5AxSFefhLHiscll
         YHRA==
X-Gm-Message-State: AJIora+GRqN0DZUUtfcM0yKddAW7zz2cpf1xCkwHAie/GsU+TWpyyzPl
        y8M9ys+GWk8hRo1CbwTDiAgqq85rVIGienwBI0zqmJtZb5E=
X-Google-Smtp-Source: AGRyM1tl9TTfRVYxTb3SUNeA4pfUuj3s8pzE/79IWe7n/UP0VoNGNinQM5IVUwftl0kpeY4bG+r4nvRTrmm38DonMWI=
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr10578743ywd.283.1657818162816; Thu, 14
 Jul 2022 10:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220711072333.2064341-1-pmalani@chromium.org> <YtAkeQ1Do7CuM/PR@kroah.com>
In-Reply-To: <YtAkeQ1Do7CuM/PR@kroah.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 14 Jul 2022 10:02:32 -0700
Message-ID: <CACeCKaekD4S93XbYGOia+vuCwc+oRJpcNKVgrxEasa4MDGsSoQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Type-C switch driver and Type-C framework updates
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev, bleung@chromium.org,
        heikki.krogerus@linux.intel.com,
        Daisuke Nojiri <dnojiri@chromium.org>,
        "Dustin L. Howett" <dustin@howett.net>,
        Guenter Roeck <groeck@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Thu, Jul 14, 2022 at 7:15 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 11, 2022 at 07:22:54AM +0000, Prashant Malani wrote:
> > This series introduces a retimer class to the USB Type-C framework,
> > It also introduces a Chrome EC (Embedded Controller) switch driver which
> > registers the aforementioned retimer switches as well as mode-switches.
> >
> > Patch 1 and 2 introduce the retimer class and associated functions to
> > the Type-C common code.
> >
> > Patches 3-7 add the cros-typec-switch driver.
> >
> > Patches 8-9 update cros-ec-typec to get and use retimer switch handles.
> >
> > Submission suggestion (as always, open to better suggestions):
> > - Patch 1 and 2 can go through the USB repo.
> > - Patch 3-9 can go through the chrome-platform repo. Since they depend
> >   on patches 1 and 2, we can create an "topic branch" off of usb-next
> >   once Patch 1 and 2 are submitted, and then apply Patches 3-9 on top
> >   of that "topic branch" before merging it back into chrome-platform's
> >   for-next branch
>
> That's a mess, I can just take all of them into my tree if you want.

That works for me. Thanks for taking Patch 1 and 2; it should be fine
to apply the rest of the patches to your tree too.

Best regards,
