Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A26CC700357
	for <lists+linux-usb@lfdr.de>; Fri, 12 May 2023 11:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240374AbjELJGx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 May 2023 05:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240370AbjELJGx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 May 2023 05:06:53 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322EFAD32
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 02:06:52 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-24de2954bc5so6714207a91.1
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 02:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683882411; x=1686474411;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7upYASidmeqEEydII3qqc7RD6bnaXjO6ELYE2uwAgE=;
        b=qE6GzOtYW281GDhq/AEJaReNIL7xesJkaPMjmmgLXzESt3ZWS8IkTXhsGKWaxAla4A
         8U4xMJpvJBKcm53nIjU8V7H3U+Lf6RgWWrQ6F4oXVrz4Sqa5kZssynQR8qGGousiWCrG
         l/7/uLaBRyjLqmqnu8DcB6C8gOYVCPXlHsYXKjWJSbwUDQtL/r7dctbTe0p9m915GU2o
         Wu7fZdGmTM2V8w44N2mWI+0k0HlFUXSnEkzcjufRSC+1N+Lr8wJQnm0dh68eSjlKDbRi
         g1duGz9fV7afSzWtXPpe5+38qdWrIZ974oTeLom0wk08rf2urhdeev+N1hxz57yKacxD
         ds9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683882411; x=1686474411;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7upYASidmeqEEydII3qqc7RD6bnaXjO6ELYE2uwAgE=;
        b=l7h0oEqubFdxrsF0cZGLl0fgszs4WWsowTTvTPA+JYJIzsff9qgEGBzaZb9K/y1FKs
         Nu5ILNdyfU/y+eOdDsu/i3VFGPhLraKcItt7+p8fxxyfSXPReyWjmv1gsbD6PRW+R0Zx
         NP8hu7ZO9cpCNMg/2MhvT7oOUn+gJ+2+SsR6elI0AchookpBWAGJMqkDH3JIF2HJ2L5L
         jd5lScDl2V/RdQeRtskZZgpY16abstdPrZtGhZv7vd3nC8c5/M4MBIG75HG+/N7EkWk1
         6XvFVuTaBn9GuE/vmOEttn+5mQglXffREGiwo09kbeEwKyKjI47OtS6kX54YgUl4i8w0
         ZwgA==
X-Gm-Message-State: AC+VfDwbJuBcgUZAE/LS5iz5q4bwy3oiHnUNHJmP76jmlbddNAGUUASy
        XAiuK/8vcl0tvpaaA2oxBdp0/iDG/MYLI7RXxe8=
X-Google-Smtp-Source: ACHHUZ5L+56qjRoZ0ElPbLz96Y8prJs+A7z3h1CfGaJWbQppb/OiQwN+Y3aGqssmGYqHiK4mtNI85ATilRgYXaBmHZc=
X-Received: by 2002:a17:90a:82:b0:252:8f70:c807 with SMTP id
 a2-20020a17090a008200b002528f70c807mr5057071pja.12.1683882411291; Fri, 12 May
 2023 02:06:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:c64b:b0:47b:66fa:94f3 with HTTP; Fri, 12 May 2023
 02:06:50 -0700 (PDT)
Reply-To: mariamkouame.info@myself.com
From:   Mariam Kouame <mariamkouame002@gmail.com>
Date:   Fri, 12 May 2023 02:06:50 -0700
Message-ID: <CAA_std6YN-M4ETaSbwqQ+ymi4dMszMnn6y2e2ETQEXeAgobzUw@mail.gmail.com>
Subject: from mariam kouame
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear,

Please grant me permission to share a very crucial discussion with
you.I am looking forward to hearing from you at your earliest
convenience.

Mrs. Mariam Kouame
