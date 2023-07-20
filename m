Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 922E675B97B
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jul 2023 23:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjGTVZ3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jul 2023 17:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjGTVZ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jul 2023 17:25:28 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E6F2118
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 14:25:28 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1b8eb69d641so986857fac.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 14:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689888327; x=1690493127;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RapVQawOljZ3WkdRWpTvGIEHTklNcouz9V8HkQ49kOY=;
        b=YhTFUCKfUgAriPwELGE9z4pMnXJ9v4VR0OxtE5NcEe7PwN5vv69hgVytPO0C67qH7L
         lFIyrTEc8Vc+4pQp8UkTA1yYf+LF4qbssUh3nSw6qENugnFXJ3n6HdvGQ6N5oTWwxc9g
         Fqe1gL5xUe4HqGuwT0Gg7czKUZ3ayUjFJV6VXzC9i/fKCvJM5z9vgrXmQss79s8lrXM1
         LwDqFTuayg0ranCSSU6zVnGTmxea2iWfE4RnwAYMQMIS2cfuXnwljAvpuGqbSslvXp4H
         UgJd9qrWpJZGMKBBBnYSsOIY51iEo7lVdFh7YFDPA5kGbjYvkWMBfnjYZGmsLZRGBusm
         iPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689888327; x=1690493127;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RapVQawOljZ3WkdRWpTvGIEHTklNcouz9V8HkQ49kOY=;
        b=Oe5spkt6LfwwSURXrhsDgbLhETdPTq1Dip/UM8Kr9Z489kUqscYRT3hu4ZqtiakNgJ
         X1ZSt8e8/rcgUMQAJ6/AcQCI/ZjyBpzt2LaGGLYsiB9NRxxR1QeDj76s63kQrvhvdQ2l
         xWk8t2WOmOdIzfOpI+nzxDAzQomXw08wAn+m6FxtrxM3SS+g84vYtTE/KHMWNwRttY24
         r0M+V+Rxk/+Wh70skj+7rhQPwHGtDpd3Edho0jD583mbR8jBlLlS1l4d5gxxuWMojjSI
         HYuTCyy4A6DiZVG/aqI99qy/Hm/5YcYwhSj7XRJuQpi9WbxXvEgydYSLvS7KcTriYssB
         IjXQ==
X-Gm-Message-State: ABy/qLajIgeiIp61IJfwwdo2pUl8X/3z1gffoozSC5QrR9jrgmheZQiS
        85kjk0/HNMRRtS8p8vnIgHp09wwHsRszPHinVB8=
X-Google-Smtp-Source: APBJJlFIScgZ+nSGniuiSsuVPdEvPwNdCOj1fhm7h6r1konCX5J6jW+ZUcf6Q627KreY9zJ7O7Ymo5t0kJT2ybnN8u8=
X-Received: by 2002:a05:6870:910d:b0:1ba:989b:ca65 with SMTP id
 o13-20020a056870910d00b001ba989bca65mr613275oae.19.1689888327391; Thu, 20 Jul
 2023 14:25:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6870:f620:b0:1b0:340c:8ca5 with HTTP; Thu, 20 Jul 2023
 14:25:27 -0700 (PDT)
Reply-To: Dr.catherine_chan@hotmail.com
From:   catherine chan <issackonovi@gmail.com>
Date:   Thu, 20 Jul 2023 23:25:27 +0200
Message-ID: <CAJpFc5cBp+ppTfi2UVKwtUBxZSFyN+=AeOO1cpUM48dPZ+_Bog@mail.gmail.com>
Subject: Re:Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Hello! How are you? Please forgive me if my application is not
acceptable by your kind person, I saw your email and I want to talk to
you directly by mail. I would appreciate it if you could send me an
email when you receive it.

Waiting for your prompt response
Greetings,
