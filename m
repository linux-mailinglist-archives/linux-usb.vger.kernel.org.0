Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B202730653
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jun 2023 19:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234329AbjFNRvE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jun 2023 13:51:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232350AbjFNRvD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Jun 2023 13:51:03 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C301FCE
        for <linux-usb@vger.kernel.org>; Wed, 14 Jun 2023 10:51:02 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b4f8523197so8721725ad.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Jun 2023 10:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686765062; x=1689357062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3/I2do6Z6gZ6unzst7lh9npAw6MAC0D/vuLuo+dzEqw=;
        b=YwjB5BetF8xrADn+8eQ78U269QBvqwes0a2nzGglXjB7TgByuYSfqmhoY5xue/z5X0
         tq2zCglxd/tYRtEPs60mzNYeYgzV7Iih0BOYeGVwlACA9Yplu8v4JvT7jIH+daAXVTjE
         E69ZAWehzHNQK99sHoxZ/ql5D7GR+zgbphIkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765062; x=1689357062;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/I2do6Z6gZ6unzst7lh9npAw6MAC0D/vuLuo+dzEqw=;
        b=TuUCejCq5vDOINE/keHaCXVhTuf3D3DgFPgNzRuFHIg8xmB/F9VFeA9nNItXFh/44v
         3qCtp5VezZAPbXFXWouV1/QJAdDSjhh9IzpDLQi7M9dR6qUD6f3vp2jYgwNacxSlp4IC
         e/MIRVnf37I8JekvJyiT9v75RqVn76YRSV8ymUJWoJeAxK2TNI3SYZRpoXgVs5KTBCC6
         8BDq7s2f3F4gqxE5Edgc2HXYP5akpyNoHue3M7AxBbpqN5fAMDX7t0K85OsF8W8mrw1B
         mp4nHHWpExRGZeAvFIfDI8khWXDwAwaoeiP4OH4NG41RXW9EXMwwtjGfVXRB3ByKJH3W
         ji8g==
X-Gm-Message-State: AC+VfDw4ZsodwU+Vxyw3Jk9L8sQV5XGOR7VRRAOyK5iuTNUNV+z+uFrF
        GY2FiLPRXaR+rT/8q6gWexc+Rw==
X-Google-Smtp-Source: ACHHUZ6rXYzID35U6HKju3ksoay8FG7T++6LuQV7o7eKQMSqHhQGS8UDgXvzoSYUGwuJ4CrBSSvnAQ==
X-Received: by 2002:a17:902:da91:b0:1b3:fe0e:57ef with SMTP id j17-20020a170902da9100b001b3fe0e57efmr3428119plx.23.1686765062171;
        Wed, 14 Jun 2023 10:51:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c1-20020a170902724100b001ab2b4105ddsm7072047pll.60.2023.06.14.10.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 10:51:01 -0700 (PDT)
Date:   Wed, 14 Jun 2023 10:51:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Azeem Shaikh <azeemshaikh38@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-hardening@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Albert Briscoe <albertsbriscoe@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH] usb: gadget: function: printer: Replace strlcpy with
 strscpy
Message-ID: <202306141049.BF86FA8F1F@keescook>
References: <20230613004341.3540325-1-azeemshaikh38@gmail.com>
 <202306131229.B5F2D9F@keescook>
 <CADmuW3VEiseKt2UM9o9jzzR8nEawh1jxANyxdZcxk89U65pXEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADmuW3VEiseKt2UM9o9jzzR8nEawh1jxANyxdZcxk89U65pXEQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 14, 2023 at 10:12:14AM -0400, Azeem Shaikh wrote:
> On Tue, Jun 13, 2023 at 3:30 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Tue, Jun 13, 2023 at 12:43:41AM +0000, Azeem Shaikh wrote:
> [...]
> > > -     result = strlcpy(page, opts->pnp_string, PAGE_SIZE);
> > > -     if (result >= PAGE_SIZE) {
> > > +     result = strscpy(page, opts->pnp_string, PAGE_SIZE);
> > > +     if (result == -E2BIG) {
> >
> > I think "< 1" might be a better test here.
> 
> Curious, why "< 1" instead of "< 0"?
> 
> > >               result = PAGE_SIZE;
> > >       } else if (page[result - 1] != '\n' && result + 1 < PAGE_SIZE) {

It's for this case above where "result" may be used in an array index,
and if it's 0 or less, there will be a negative array index (due to the "-
1"). So, here, it needs to be "< 1" instead of the more traditional "< 0".

-- 
Kees Cook
