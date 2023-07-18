Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88B80757E3A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jul 2023 15:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbjGRNxd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jul 2023 09:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231890AbjGRNxd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jul 2023 09:53:33 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0AE8F
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 06:53:31 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3a3b7fafd61so4178721b6e.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Jul 2023 06:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689688411; x=1692280411;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvhaGZOk6FnPl06sm3mW0Yfmju/nBEVwpPi4Wu+dVVs=;
        b=Y+Kr6m/CxyJ8TKtZuOjUIDhrQQnHeYw5TxOFlqxcP/kWY0HB7c8+jH+8dmhpCFEvcj
         l/K1MSlD1COcTK/E4tgUCo2ymucgbTGHzQ1Ly7X5XoXJj/37OdraU6G/dNeXL7STA7HQ
         Oltaka9wcFGU1kII9fiCIG/DZ8O+GWJ6IMGrXqX9cnNtut9huSUbKfg6YULzTTflZQ0B
         IBx3f9br+jh2RsKD1N3FchyoXsvRtYUnCoEnnLN2yQYgII3duEpZ08+iymSAzzdIFxOq
         wnrqNa20osVoHHFGTEE8Aut+Ip006le901taJjFVzZcitTqWP5+IesHqFh5NF6ROZRK/
         SdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689688411; x=1692280411;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pvhaGZOk6FnPl06sm3mW0Yfmju/nBEVwpPi4Wu+dVVs=;
        b=lG5fTxCrNrPHLZ2Ebg3bwrcVKwOEGT0dyPzirAh6eaAopQ+809bQTOPxpYXoUv1H5p
         czPNeLuRh5b2dOYnumLq7O6gmZcqsd8bPc7bDcNhMZHlGxG86r3ne6Oncom5MR5x229e
         6QQ6NoKWiF9yD+BW97Dt8Eacfd9fuO/rSA9y6DP7Kg9N3nKFWHXPp8pX+6fQ7Sl9tIdn
         rzLUc/ymB1aE178BtIkoLh/WShy9Pnl0ECrT1GkPpy0qVVTWk+KLgko7wM2bSUyfHg5y
         OWUjY2JJSI63SwSmmNhUDBYd8gowZvdJE9EecvhrYIB0NiMQNoYF8i2CsPYUWxeOUJie
         rgeQ==
X-Gm-Message-State: ABy/qLZ5Wi6cnAu3/lQwngPy08Tz4+0tj0xMmDWyiKknGuCOO/LZcj0p
        NTNybcR/8qTl06FavFyO9XIopbxJZSZ7wx63z3Q=
X-Google-Smtp-Source: APBJJlHcx/tZdCzMkVycQPTBlcma0QCaeNPX1c528bh79u+/ebcgzum9lCnnj5geiLGNWQQF6AtN8HK4IBsjpsa86Rk=
X-Received: by 2002:a05:6808:90:b0:3a1:f047:6314 with SMTP id
 s16-20020a056808009000b003a1f0476314mr2992018oic.13.1689688410604; Tue, 18
 Jul 2023 06:53:30 -0700 (PDT)
MIME-Version: 1.0
Sender: onosetaleelishevaunuebholo@gmail.com
Received: by 2002:a0c:f251:0:b0:635:322c:b124 with HTTP; Tue, 18 Jul 2023
 06:53:29 -0700 (PDT)
From:   Dr Lisa Williams <lw4666555@gmail.com>
Date:   Tue, 18 Jul 2023 06:53:29 -0700
X-Google-Sender-Auth: xLXysivanCJWQmNNG6Bt98Yz6tY
Message-ID: <CACBkC079ZuJ9J+j=H763VDZy9zWZc1yMurCLbQq83bp-YYMp0w@mail.gmail.com>
Subject: Hi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

  Hi,

My name is Dr. Lisa Williams, from the United States, currently living
in the United Kingdom.

I hope you consider my friend request. I will share some of my photos
and more details about me when I get your reply.

With love
Lisa
