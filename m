Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601F354D1D5
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jun 2022 21:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346484AbiFOTnc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jun 2022 15:43:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347043AbiFOTnU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jun 2022 15:43:20 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9971E3120C
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 12:43:19 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id gc3-20020a17090b310300b001e33092c737so2974519pjb.3
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=kHvqhKfwkSYWgIBUppKUElAVHImwDcI/W0up7OF2SsA=;
        b=d8fhnbfaPrU2+uiC85kAcwxMXgjbGT6e60zD5sDwnLTPVfIebFu6ujW9v9D+HIGGOX
         xflERCHkkCdL6KPdIzK3ICCUzEE16RQdKOmBPJ3R/J+eNXsLcSyoz505OO6p/QlV6GGq
         O7GdyXYdHJHTW6y4bqizczAP5tht6h9enLmvovAeH8e7S6lsohw2nwxdAgJrAEjATyrO
         39e7MHMhOFj0i5Sg+2FAilC8MCeGfop0VNkaHbxw00EJYAN38OfK5WqyIYIxmpSZJRlP
         zO3c63Nkit4qySkdilxmHbNCW7pl3DKS0cgNLR2e9VlE+UFuGHSyqDdQ9ib7JbiS0zaq
         vVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=kHvqhKfwkSYWgIBUppKUElAVHImwDcI/W0up7OF2SsA=;
        b=2kDdmWnMLdI/8qzqQhLI3FOxV64pxcs+qyNoB3TeiinXJ702RLDgWUIOsHHKYWGeCV
         geDRRCyvn8Qy+o31GgRGs8nElb+mCxPQhtVd7bBuo77+S7mkgj7kCT/QCZyJ+nVdlytv
         HoLiy1pEIHihQT8s25jvToMgnO1ShNmstOD6SsNGIFHxIrsSaVn0tgVKLVHJWCbD5NXl
         NKzWRYjG1OI10gMd/NAapetb6BVP0JS/wdI1oM0DFOkeyVKUsIkiRkeHsiN1IKrqxRro
         WVLER97ZaqbngPsp8IiP9vb4uLnpOAxeBkuvPsPYR9C9h3tfCsG+QyDw/FY3DUeeOKC5
         JWhQ==
X-Gm-Message-State: AJIora8+lKRTXg3QKtCn0qjB5UVkqGUBdcJSx9+Ynw6ehuTEmNCRTRKY
        mpwhylEFm7IqpKPE1NjExHihGZdI5mM226H62Q==
X-Google-Smtp-Source: AGRyM1shG8emlCgSYivx4aQKJnMn5syrlXGqEVVXxeJCFmVaj5cPb6f5lDMlXZ/WAUQr34McbttygOFSiSmZedGVCrU=
X-Received: by 2002:a17:902:ce88:b0:163:dbd5:9797 with SMTP id
 f8-20020a170902ce8800b00163dbd59797mr1207473plg.82.1655322199133; Wed, 15 Jun
 2022 12:43:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:bf93:0:0:0:0 with HTTP; Wed, 15 Jun 2022 12:43:18
 -0700 (PDT)
Reply-To: peterwhite202101@gmail.com
From:   Peter White <peterwhite20211@gmail.com>
Date:   Wed, 15 Jun 2022 19:43:18 +0000
Message-ID: <CA+xfdp==zhwiG1dD-yoj0po=FytaAL_ZiPeAyxm0Y4LVUx0qaQ@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.6 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings from here.

I want to know if this email address is still valid to write to you.
There is something important I would like to discuss with you.

Thank you

Mr. Peter White
