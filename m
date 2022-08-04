Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE3FE58A0B2
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 20:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbiHDSpu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 14:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240013AbiHDSpr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 14:45:47 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5904B7DD
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 11:45:44 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id k26so881722ejx.5
        for <linux-usb@vger.kernel.org>; Thu, 04 Aug 2022 11:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=cwG0I+hEkm6kWFoVuo/ynZfsV9+825Fs1BMQA0uiNPc=;
        b=W5gGdlxU9iuIN9t2E3RBXdRpDwkdGPbVgkhMVC3h9eBl69+sEBEGIPlmm3/svZn5E4
         fC4QSkFDdNsUieok6liYVfyUTjuubtN9bgzl96QcvELUoO7BHv71win8GkQEeo1xBmLM
         fjNXI7kxeo9ensDsvUL4ZSvUgOsY4USJgZB/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=cwG0I+hEkm6kWFoVuo/ynZfsV9+825Fs1BMQA0uiNPc=;
        b=ZG7KfQiRFkj+Xw5+P97AoB57U8KSVmGhLaTtYbiMNvDY1C0qqJagH/f3qRf09tuy25
         dEM/JJ2Ho+ObXZNxkRch86Azcq8ZBFLxFBmP0scoUG7xJv90LKvyHcMY2sUMD2wGNuPg
         il4pAhVuMyUn9NZ/U0IxpY/tLdw8SDRrvIsSwUF3qJL1Rc6q6AG/CYJLm9VXrEqNZC94
         arBDM/20NjVkf6Gd+YuX4pxDKCaR0CPTPr5krx/EjrFtdc3mV9fEbizB0zYJFDMYefVE
         E2Z++iosz1Jl2UCtdudiSU/0qrQtGp3VFAis7PMsQUEiTFVwudJR/G02UqpiQ/ZCZ9Ja
         +Ltg==
X-Gm-Message-State: ACgBeo0Omzi0DPjM9HNFxMpDmEwAOEL+dcKv0yTQY5LXxdYreGot33nG
        Nh86ey+FatyW3pkiNn18Vxaoc+M+OIrwsgMz
X-Google-Smtp-Source: AA6agR5o5NvQmaL+pt5vM4+XJCG0M7Ncc1N3zi2zPhaJQ9VAKDkTXAKmL31/Y1JeWz2LuG79iJsH8g==
X-Received: by 2002:a17:906:6a10:b0:730:e9bd:1110 with SMTP id qw16-20020a1709066a1000b00730e9bd1110mr116889ejc.88.1659638743078;
        Thu, 04 Aug 2022 11:45:43 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id g12-20020a170906348c00b00711edab7622sm612155ejb.40.2022.08.04.11.45.42
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 11:45:42 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id p10so753840wru.8
        for <linux-usb@vger.kernel.org>; Thu, 04 Aug 2022 11:45:42 -0700 (PDT)
X-Received: by 2002:a5d:6dae:0:b0:220:8005:7dff with SMTP id
 u14-20020a5d6dae000000b0022080057dffmr2103512wrs.442.1659638741845; Thu, 04
 Aug 2022 11:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <YuqB0tl2hjT3x7a4@kroah.com> <YuqXtcaUPflINBd6@dev-arch.thelio-3990X>
In-Reply-To: <YuqXtcaUPflINBd6@dev-arch.thelio-3990X>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 4 Aug 2022 11:45:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjdoqmF4fC8orFv0pRZBUfgyQMGM8yS136_vZ=9=8uQ3Q@mail.gmail.com>
Message-ID: <CAHk-=wjdoqmF4fC8orFv0pRZBUfgyQMGM8yS136_vZ=9=8uQ3Q@mail.gmail.com>
Subject: Re: [GIT PULL] USB / Thunderbolt driver changes for 6.0-rc1
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Andrey Strachuk <strochuk@ispras.ru>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 3, 2022 at 8:43 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> For the record, this breaks allmodconfig with clang (I haven't seen a
> formal report on it anywhere and this missed -next coverage because
> Stephen is on vacation):

Hmm. It passes my own internal clang testing, but that's for a more
limited config.

So I've merged this in my tree, but would appreciate a fixup patch if
you have one.

                  Linus
