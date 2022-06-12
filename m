Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB265479D6
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jun 2022 12:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236238AbiFLKzV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 12 Jun 2022 06:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236240AbiFLKzR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 12 Jun 2022 06:55:17 -0400
Received: from mail-oa1-x43.google.com (mail-oa1-x43.google.com [IPv6:2001:4860:4864:20::43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6730531DD8
        for <linux-usb@vger.kernel.org>; Sun, 12 Jun 2022 03:55:14 -0700 (PDT)
Received: by mail-oa1-x43.google.com with SMTP id 586e51a60fabf-fe023ab520so4959057fac.10
        for <linux-usb@vger.kernel.org>; Sun, 12 Jun 2022 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=vsoZkcYm3jCCjpX9R4JNfB/t4Y2EE574Kr+1kQkq8IE=;
        b=Tao2+7Usxo3tdYAsK52a0+GqlHcMdiKvPfhvz4y8UlOIY8r0UGP8uuHJOlCh8F6SUv
         dvn5mIYkih69fE4zmH/nL9UtStCyhXSAUFF+zA7GjTPh5VzHqTSrnEL67Qjn9BrFke+R
         UqrEGtRwxjYf5c+wxomtYFc80zE0jM1cevbfAjbaKcnUn1iK+rDM47C4CgWof4WsPFgy
         9K9QHCMu9WWVKKRNU4OWw1S4g73sBHHFYZS+OsjIw5USzNuHGYHUueTTZpte35LWu3VY
         iHr3fglbhfKs69wuugpzQ3RvVv8TB7rrJkXJb2P+qB6s7P0wP40odrY/2no8VMojuyvr
         rIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=vsoZkcYm3jCCjpX9R4JNfB/t4Y2EE574Kr+1kQkq8IE=;
        b=D0bMYGR3FWnLfGpdCzvmj1mS0SGsyBgC+oxbmwD/ohk0hqE0yF5xzd9vCuNxlcjapu
         EgSikpMfifyQ0W4FZhwlD9KYep3LM0xUrs3tk/OfDtURbJXjZQ3XdhGnTQwP3+gasvJS
         2FX75uZAjfdyAkjO7wzxAW+THwK7XLYJuRMMeDOuW7MKzMY+lG4JMnZWsZPol/Pkby6h
         2jMFo5G3dgT68cR7GhYrU/9dOYeTvdPe4B5weuWAl54kEzxTTbpUwkhzuRpdnZMaqz/2
         0s7QPZmiw77+tWEcMP8cOIoCpnaiM8L5ZEpPDGI0j8K3N5hQBYPGrKxT/3Ya12U3SVYi
         J5lQ==
X-Gm-Message-State: AOAM530Xiooq5DxRkUVuHhLBZXwTdanUCkaXvHYnpmbPKEVjA3eeEdM8
        wS+JawmEDdPVss3R56j6gTGhJPdgTsyn+XtNznc=
X-Google-Smtp-Source: ABdhPJxk3hYI+UShP1Zs7/q/gOW6xEaA4PYH2i6yjnBq6HaV8FjcIZj8VBfkE2MbhYzTZmz5Cm5bBs6q1mmhneVb01o=
X-Received: by 2002:a05:6870:40c7:b0:fb:13a9:d731 with SMTP id
 l7-20020a05687040c700b000fb13a9d731mr4649632oal.27.1655031313101; Sun, 12 Jun
 2022 03:55:13 -0700 (PDT)
MIME-Version: 1.0
Sender: meizhen100@gmail.com
Received: by 2002:a05:6358:18e:b0:a3:449a:620d with HTTP; Sun, 12 Jun 2022
 03:55:12 -0700 (PDT)
From:   Miss Qing Yu <qing9560yu@gmail.com>
Date:   Sun, 12 Jun 2022 10:55:12 +0000
X-Google-Sender-Auth: dub-CaLxuhhYM9wwznvRDA9hJSs
Message-ID: <CADYjMSRvGeyd-__gjhd9e3XFSt3jv6cP9xxSSnnXhVBDoBW--g@mail.gmail.com>
Subject: Hello!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_SCAM,LOTS_OF_MONEY,MILLION_USD,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

       I am Mrs Yu. Ging Yunnan, and i have Covid-19 and the doctor
said I will not survive it with the critical condition am in because
all vaccines has been given to me but to no avian, am a China woman
but I base here in France because am married here and I have no child
for my late husband and now am a widow. My reason of communicating you
is that i have $9.2million USD which was deposited in BNP Paribas Bank
here in France by my late husband which am the next of kin to and I
want you to stand as the replacement beneficiary beneficiary. Can you
handle the process?
                                Mrs Yu. Ging Yunnan.
