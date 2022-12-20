Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0239F6524C6
	for <lists+linux-usb@lfdr.de>; Tue, 20 Dec 2022 17:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234130AbiLTQiY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Dec 2022 11:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234100AbiLTQhb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Dec 2022 11:37:31 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132EC1CB27
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 08:36:50 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id b189so12234482vsc.10
        for <linux-usb@vger.kernel.org>; Tue, 20 Dec 2022 08:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xuaIgdrjgSOzMo0krQvdSpwz4+gLmJzCPx4n2C3GWWg=;
        b=KA5C5mCK4DkoBX7TmkC4kDN2pWzNfgWi+uuBcg83pVxnMliZJB1+YE6X9022DlADKE
         36+dVkarCwV8znCcsO1M8QYkrpr/eBuY7YUhHisKuhaQsP0fykmOlqU7wyW3J1BeuX6S
         4aZ4arDyWmi2WaukiIt2POIdojW86TKr9fko+44PduAwEMA41FCgmQuZOErhUxtfTT/Q
         WMU1B1vo1pd6X7ZCRNIAl0Fom0vLTYA9gHweKvIC1Yk4og73wWll3jO03H/gzs9YxxC9
         MkPBJa9YXyiyHgubnhQ14h+icm2P2qWSgpkzG94fAc7fsQf6qIFYY8JR0VL+bkON2nzg
         FhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuaIgdrjgSOzMo0krQvdSpwz4+gLmJzCPx4n2C3GWWg=;
        b=xoHdt6NXn6sTbX+GekW6lQ2ww+lCJA7nmZI2lEkMgQP8jsP1EfWgZ/gGcEMiKtJTjd
         MWLU1knoN84/7Bf3bTULH4MFLPRmh1+SlVBRKJvHqoO/doXWBUBOkg8/G73XPKhXKI4S
         6yUzOIwoy8ldf+1jPJtU05yafTRRjk4MEqbzHik1KXK9BuFvTwOybLwzLAuBk7rVI6Yp
         rTyKv5IKaFuz2tKWxOhXvfU/3jK55E53TsdgJqqg8RVt6Fd9KxtvCCDjPyLYzsYHVxci
         5v+mwN0I/48uzfy1yASMq8+RfyxC4r6/tk6nwli1Q5ac8lz81tISD/kOrKqWXFkjZ7Uu
         j19g==
X-Gm-Message-State: ANoB5pm3xqvP6yzwjSyPFg8OaIoogPuqGFN2pziEgy1+NrxBvLzW9SIJ
        J+fu5eqiKXE++vFNUr7aBZ2IResPvDuSWCznuH9LSw==
X-Google-Smtp-Source: AA0mqf46UpQnJlDvWcWPOzfpi6F2pJn5D75RpfYbIbNwm3EJr4pDvZD7b3Y6oOAJz8qvfWxFWzDmm9zIBqZ/CczeVfU=
X-Received: by 2002:a67:f04e:0:b0:3b1:1713:ba11 with SMTP id
 q14-20020a67f04e000000b003b11713ba11mr21621691vsm.76.1671554208999; Tue, 20
 Dec 2022 08:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20221219191855.2010466-1-allenwebb@google.com>
 <20221219204619.2205248-1-allenwebb@google.com> <20221219204619.2205248-6-allenwebb@google.com>
 <Y6FaEoAAFFP0WqK3@kroah.com>
In-Reply-To: <Y6FaEoAAFFP0WqK3@kroah.com>
From:   Allen Webb <allenwebb@google.com>
Date:   Tue, 20 Dec 2022 10:36:37 -0600
Message-ID: <CAJzde04mhRh2SajwdfMTzoDJ_F_Xo_3utfcvxY1Dpgqrv-rzOg@mail.gmail.com>
Subject: Re: [PATCH v9 05/10] module.h: MODULE_DEVICE_TABLE for built-in modules
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 20, 2022 at 12:45 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Dec 19, 2022 at 02:46:13PM -0600, Allen Webb wrote:
> > Implement MODULE_DEVICE_TABLE for build-in modules to make it possible
> > to generate a builtin.alias file to complement modules.alias.
> >
> > Signed-off-by: Allen Webb <allenwebb@google.com>
> > ---
> >  include/linux/module.h | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index ec61fb53979a..3d1b04ca6350 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -243,7 +243,20 @@ extern void cleanup_module(void);
> >  extern typeof(name) __mod_##type##__##name##_device_table            \
> >    __attribute__ ((unused, alias(__stringify(name))))
> >  #else  /* !MODULE */
> > -#define MODULE_DEVICE_TABLE(type, name)
> > +/*
> > + * The names may not be unique for built-in modules, so include the module name
> > + * to guarantee uniqueness.
>
> What "names" are you referring to here with the words, "The names"?
>
> And built-in modules have the same rules as external names, they have to
> be unique so I do not understand the problem you are trying to solve
> here, which means you need to describe it better in both the changelog
> text and the comment.

I changed the comment to:
/*
 * Creates an alias so file2alias.c can find device table for built in modules.
 *
 * The module name is included for two reasons:
 *   - Adding the module name to the alias avoids creating two aliases with the
 *     same name. Historically MODULE_DEVICE_TABLE was a no-op for built-in
 *     modules, so there was nothing to stop different modules from having the
 *     same device table name and consequently the same alias when building as a
 *     module.
 *   - The module name is needed by files2alias.c to associate a particular
 *     device table with its associated module since files2alias would otherwise
 *     see the module name as `vmlinuz.o` for built-in modules.
 */

>
> > + *
> > + * Note that extern is needed because modpost reads these symbols to generate
> > + * modalias entries for each match id in each device table. They are not used
> > + * at runtime.
>
> This comment isn't explaining much about what the #define is to be used
> for, is it?

I will drop this. I originally added the comment because Christophe Leroy said:
"'extern' keyword is pointless of function prototypes and deprecated.
Don't add new occurences."

This is clearly not a typical function prototype and the guidance from:
https://www.kernel.org/doc/html/latest/process/coding-style.html#function-prototypes
should not apply.

>
> confused,
>
> greg k-h
