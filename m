Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3DA6306F9
	for <lists+linux-usb@lfdr.de>; Sat, 19 Nov 2022 01:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237907AbiKSAVf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 19:21:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237918AbiKSAVE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 19:21:04 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13279BA6A5
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 15:36:56 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id a13-20020a9d6e8d000000b00668d65fc44fso4008090otr.9
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 15:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hK8gQKj2Jl7lgqDcBBKtTJvHs8EABYLYSyaTEIcYmn8=;
        b=gucqMw6zdttGL7YGH/8VFFsmO13p+jIbO4x5eL3c+cmf4/jxVzILWPhiYPujfkDohm
         0w9mpRCNZ8HSf2dvG4zeekZjFC0cjfx3WUsw40mocxDfIL7dCXgR6r5N5r7OgS6d1qy/
         yIfD3nIxVKHHKKlVFc0YpC3ywwSYeWWL6x63gjSYHBVRSs3BJ1ihStr0Z0ksgBlMTIXc
         1EtM/pqqaeEC8RzweIHsSwa50em+eHim1Hixm+xkr+1Wtpzxh5+Nm2z/llcSjaMItmIb
         z+hUPa8oeORr2ItK8aEhU6r6TfSd9eAPzmE4O8LiRv2uallTu99ZRAixUgCDrk4Rj0NX
         t/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hK8gQKj2Jl7lgqDcBBKtTJvHs8EABYLYSyaTEIcYmn8=;
        b=5YFqG5DY6dzgZBmsC335cTWHorz58ycd9hPi9+xFQz7Zy8sMt5UFAlO2yAGzsGx5kz
         hmDiLK255N/4VJpwghxeN+S2BwuXN0BH/llrlZLSOfmg76uToqTpx3JtdC5yoMj9yHIG
         pTkzH2xRYee5vH2lLcBpwVoRM2W7+u+ltbtwcl1lZKxT88QjxgSN5Z1TugSjrRoBjqJ4
         ahx0u4UlwtRFPdavjPhubx4+s3eYjx6kHeFGTtMcCUQWoOTZK8X/iGenJyoTd2mB7Mfm
         szzRuyhCadu3uJtCYgfUPEPzUmLXvwe4MZmZNf7n5wTKtFMJL0mVd7oT+PSLZgYxJT85
         GP3w==
X-Gm-Message-State: ANoB5pm8ZEjZscW+SjMkNVmqYW6KFwpNuAjfJh3Td5wVoR/zxO0xL4Rc
        hy+HwfRzrPH5VGQXHaiQT6nS6qVQY/hN1SvErtNINRaZ
X-Google-Smtp-Source: AA0mqf5MPQOnb33bdpqWOSrKtrxpaGaIUmAZtusUI9ZD1VLYYeccdeusP7kv/eDVu1yJ3GUn5v8pUmRgHBNfokbu+Bo=
X-Received: by 2002:a9d:7d8b:0:b0:66c:63ec:339c with SMTP id
 j11-20020a9d7d8b000000b0066c63ec339cmr4956776otn.332.1668814586407; Fri, 18
 Nov 2022 15:36:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac9:7f06:0:0:0:0:0 with HTTP; Fri, 18 Nov 2022 15:36:26
 -0800 (PST)
Reply-To: sgtkaylla202@gmail.com
From:   Kayla Manthey <kontajean@gmail.com>
Date:   Fri, 18 Nov 2022 23:36:26 +0000
Message-ID: <CAGJkU199dd6rSeEQzJY4DP3DmVDGuEYE2s_WJmG9s4baR8bHUQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hallo lieverd, alsjeblieft, heb je mijn vorige bericht ontvangen, bedankt.
