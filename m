Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAAB4D9B54
	for <lists+linux-usb@lfdr.de>; Tue, 15 Mar 2022 13:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348361AbiCOMfs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Mar 2022 08:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240188AbiCOMfr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Mar 2022 08:35:47 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7012AC40
        for <linux-usb@vger.kernel.org>; Tue, 15 Mar 2022 05:34:33 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id q11so21939799iod.6
        for <linux-usb@vger.kernel.org>; Tue, 15 Mar 2022 05:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=2qDGjghbn5CvjFqEsoPxdOQcDSR0fz41YWY4w/S+T6I=;
        b=AjuhO5chyX0OKt/GmovYl60kbI0TEIPF+RiJjc8Q1PYdv+vFhnNQD7q14zlJl4gUig
         6wsl8xgHnEas135ZRazkES+KH4dPFlZqqrBms37zFtgpwLoKFOX0xmfrK2B7Y+ZpTQOJ
         NdWkXrWpqJ3QL92ZL7Ek8OphFFx19bArSrYBp21ZjS0Q/MkWFS9WdaDdh+7FavrJriA5
         VLrfz3qrrydkEToK2gfw5nOtsgqgpxI2s0zte0/5mQWcmCkd07Rm1vc//W1eQbQnNCA5
         tM8m1Kt3OZmsvZfIS2zOY2xSfFe2/aefzh3PDpm4xpWiHT0yTFhMtzq4FvMP0GbE8BG9
         C1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=2qDGjghbn5CvjFqEsoPxdOQcDSR0fz41YWY4w/S+T6I=;
        b=hvik0zeCFQKaH7WkWfr748oYe9TKhtGOW42eRtNrskOtlwJ6C8/gPTzNV3Q2a8Z1HR
         l5L1Q94/3V1tFrK68mg4ZRJ7gcO60auJUoM8pD0rORtKDsKsSv9jbyFc4kbTZxKqcyeF
         PnFu0j+7bI2/e/QEtWvEjP6s5SP17ZzcLOQGkg+8Wl6I9T0hRdJJhKHp5qlwr8WJ+JIT
         ytU7GUB9QhwA1NQTZg4aDi4xrBUUhwgqPscTmrSWiW1aGPz67JlpLoOwAUNG/sv0PBLY
         Rolx7xC7YqQgpewbNeMWcJQeRaw7sGqAo0gW9Lx1vrN/c+X8MlEI+CHUwYdHddZdN7Hn
         Wn/Q==
X-Gm-Message-State: AOAM532IrveWBDCbaJyzX7Uq/rs2rx0lzHt5gxZLQ/8s74qdeIqFXTIx
        hTwz7dWcs+gwOAzOps00W3K99s6uDyTCcIIUDqY=
X-Google-Smtp-Source: ABdhPJzGbFzdjRDBN0JJJsDdWgAYFL5CNNVDW6qggOqWrXGnb5+yOwg+eShL0dt4owKYF+4021IlVRtkJYk9rla6BVI=
X-Received: by 2002:a05:6602:27cc:b0:5f0:876e:126b with SMTP id
 l12-20020a05660227cc00b005f0876e126bmr21972536ios.129.1647347673061; Tue, 15
 Mar 2022 05:34:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:ce5b:0:b0:317:ccb7:9aa1 with HTTP; Tue, 15 Mar 2022
 05:34:32 -0700 (PDT)
From:   Christian Meshiati <robhato1q@gmail.com>
Date:   Tue, 15 Mar 2022 13:34:32 +0100
Message-ID: <CA+31QPWpJ2x_9erjU32yacWN7QwrUtyZJCxQcQC6zbcmqUk3OA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
I have a business proposal for you
