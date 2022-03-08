Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B92F4D1A8D
	for <lists+linux-usb@lfdr.de>; Tue,  8 Mar 2022 15:28:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239290AbiCHO3o (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Mar 2022 09:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243184AbiCHO3m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Mar 2022 09:29:42 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1763825C6A
        for <linux-usb@vger.kernel.org>; Tue,  8 Mar 2022 06:28:45 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id u10so27208785wra.9
        for <linux-usb@vger.kernel.org>; Tue, 08 Mar 2022 06:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=+xCzDXKpurcBEhZ8+xr/1+qLsXYFBobYcsOzCn7TcBU=;
        b=qVkxwgK1b+28wfo7AE+m0D/9E55CAaNHjVfggvzz4y1jrFEcqF+CAdv7IM+KHyJAsy
         kWCN5Ez/mP7h9h6bpxp6/TAEaV328gRxK778qVwrRxvxR4tr/l1RPCTDR82iQTPn5Wax
         TuZA87kQltJfQLsmP6fuZKQ4pIZQdhPxY8QrrnSjm8fSJ2AHt2tzEL1IA3nq4God2ic6
         tPmcjhh+nE10IgFYtUr+FVpp8W0kskWdPNSjKh3Oe6HsfmAo/TeQKi+EB4jfdFsCBF0e
         TEurA9G1+D3aT7wDN9rqiSJk5jriFub1oW7GvWnCc4W5i0HJjijUpIjbRko/xul1waJf
         G8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=+xCzDXKpurcBEhZ8+xr/1+qLsXYFBobYcsOzCn7TcBU=;
        b=fkxJeYXx+yVB5KdYkO0pPQWsMSyVXKjTMMaDgaiUxvRum5UGQUuQ5uQFfwAv4KAaXK
         61zweLJPMEeJf7f5Dc8fNy25oaookcbMmyppZAwU7Gcvixktfj5eCGLvi4E73V9o6NHa
         ElLvhjeeYyUsGPg+5/qg2Scs9kQLvEtCGcPMSODrh8dQQvmahRJVtzvLDwHO1jExkQkY
         2OFj9hlLNgHAjHhKkhHVGYdL6n3P25a5LbEC5irTcW2iSPnzqLy75ojmtvZ1bWt0uKOi
         72NmzoBvuSkocjNk4ozWkhL+NRQS+3nDvgq024N2vlc+Dh/LxVyMdgqChuS51TgCx3mJ
         pVOA==
X-Gm-Message-State: AOAM533/VzLWDDgtbaz1mxBcuaToHVUaqPljKQP4wTZQumfXyQpW/NJA
        sbcdZwK5NADljjtwViW3YXHOBHkC6qiajxmpQk0=
X-Google-Smtp-Source: ABdhPJyN362TV5q1ThoYoFsjE56SEqE3pAvo+m8K0LdM8BraKLObiWoLsRgnZNl8B6Cr2p9ZNZLFOSA4UBHJcsFsV94=
X-Received: by 2002:adf:eb86:0:b0:1e6:8c92:af6b with SMTP id
 t6-20020adfeb86000000b001e68c92af6bmr12495967wrn.116.1646749723258; Tue, 08
 Mar 2022 06:28:43 -0800 (PST)
MIME-Version: 1.0
Sender: abiodunboluwatife2017@gmail.com
Received: by 2002:a05:600c:502c:0:0:0:0 with HTTP; Tue, 8 Mar 2022 06:28:41
 -0800 (PST)
From:   Lisa Williams <lw23675851@gmail.com>
Date:   Tue, 8 Mar 2022 14:28:41 +0000
X-Google-Sender-Auth: V9xPcfHWoWwaPZchQ2Y842fPtP0
Message-ID: <CADqw2PJ6dps8sfkNJTY6MXZohie2=6P_cMwuASuV1SNoGXNDuw@mail.gmail.com>
Subject: My name is Lisa Williams
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dear,

My name is Lisa  Williams, I am from the United States of America, Its
my pleasure to contact you for new and special friendship, I will be
glad to see your reply for us to know each other better.

Yours
Lisa
