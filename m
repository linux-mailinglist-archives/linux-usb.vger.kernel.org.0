Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2AC3568E10
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jul 2022 17:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbiGFPtR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jul 2022 11:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233419AbiGFPtE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Jul 2022 11:49:04 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA2211F0
        for <linux-usb@vger.kernel.org>; Wed,  6 Jul 2022 08:42:33 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id i3so20280389oif.13
        for <linux-usb@vger.kernel.org>; Wed, 06 Jul 2022 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=hzQmJSoG6h+7EGgNAYu/3jJGfPSENpZr9Hgn7mcP+Lu9uwDMSPL5YukrBHEa26ClN/
         8q6vGYcEjtOs/diJgcO5q0cePkWRS8Mwb4N2MCMxGFGKrPxGncI+XU1ZVsJO93ZgnDZH
         Vg/YAK0QTKTBGs3jY3XcVs3ZvfsOKFJcz1M2K/gB1QnunyYkiPVmpy4HZh5EXYtHh53s
         bZ9ogD2DSzYfy+ERAILtvgzMp2yZLwaZzrbCrEenvP5SOkh5BHlC4QvHksRYQ0kv24tS
         n1iBNYU2nujJFWsj0Jh9tYSrkYOxc9ndn5FQ5OqWzewXpYKRAxJqLTeyV46AOUw01nJB
         e8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Uk0kx353H+gGEfDDNFmV1k9XciWZTV5g6S3ovbgNaYc=;
        b=P64RaubihXbAK48uF+MoWFEg3BorH9dihuqSAOW6zzpJ7aOatOCdBwAGDmExeerwll
         MZRX5hz35w2ToRuoVG0odSmsLiAOEpCSnZrQjQAuc3UY6PJUNQjcgJBWArAO/ECgcoUs
         hTQ4vBV38XXuZ+uEDODggLrah1yKfEPsSi723dfiJnnAbu+tX/xnIq11HCQlWaDEPC0W
         JPXbcZACuysZCXG4OLemECIUKkwU7+V3LGLENGuRoWmb8Hn5PfQNZ7qkTZaiylAF734V
         ce3f+EAXhKeaBa5IyQBxxSFEawAkadRNMZGDPYMHdboF4F2ObXiSsrRKn5rwC+gPtDzH
         cPFg==
X-Gm-Message-State: AJIora+GtqrP2hXu8OisNthXRN0UF+gCr4NiM51wzZUaPQFytgvgifCT
        RKqe7uAszJTYuCqz6lMmrTNWzZAE/GSMnlfxYFJJ2EgMksgKGA==
X-Google-Smtp-Source: AGRyM1v5b6C/XmnVXUfpR6TfdpesQ3rCV8QKS3jjr1IBRz1z+vQums1DcJpNlX3gbkyoKwYLTLFDcmbylnCX55OorpU=
X-Received: by 2002:aca:c282:0:b0:32f:546:61ff with SMTP id
 s124-20020acac282000000b0032f054661ffmr21630907oif.39.1657122152972; Wed, 06
 Jul 2022 08:42:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:4545:0:0:0:0:0 with HTTP; Wed, 6 Jul 2022 08:42:32 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   Kayla Manthey <avrielharry73@gmail.com>
Date:   Wed, 6 Jul 2022 15:42:32 +0000
Message-ID: <CAFSKFDZorTqVon74xJgTmsDSoRnaojAJE7tciJpwgtoQgogjhg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

LS0gDQrQl9C00YDQsNCy0L4g0LTRgNCw0LPQsA0K0JLQtSDQvNC+0LvQsNC8LCDQtNCw0LvQuCDR
mNCwINC00L7QsdC40LLRgtC1INC80L7RmNCw0YLQsCDQv9GA0LXRgtGF0L7QtNC90LAg0L/QvtGA
0LDQutCwLCDQstC4INCx0LvQsNCz0L7QtNCw0YDQsNC8Lg0K
