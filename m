Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFE286DBFEA
	for <lists+linux-usb@lfdr.de>; Sun,  9 Apr 2023 14:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjDIM7x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Apr 2023 08:59:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjDIM7w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Apr 2023 08:59:52 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E26F40E2
        for <linux-usb@vger.kernel.org>; Sun,  9 Apr 2023 05:59:50 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id sb12so6691860ejc.11
        for <linux-usb@vger.kernel.org>; Sun, 09 Apr 2023 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681045188; x=1683637188;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/b9hSn8ZWObn0FlHkk+rwYaVaufISYusIZ7dspuZnGU=;
        b=H61MspJSdsMUJANgbn3zoWYq6IukccmlV9qtbuJL6+phFWZXBkNoMDGoA0C2ZyMrdr
         KkM0aKu0S+jhTn5/VqmHbrX9b4Hn2cf63P3KDFMAWFxDiebD94OLSmsy6V+IvceopH++
         sQF2fehj7Qv9PqZeUS/goe9tnPFysA1Dd6wsjKXA9T9tlQF2wJNGWLQR0ushOydp0DRM
         3vkQp5HJb0UZRfFlj15BOY9GgrlDlhOOSXvWM4Q8R8wideNYeRQhCgZmEu9d+JUpUpfM
         ihn/2yugBrszGt/kfptt6dsouFG59nCxm+ypi5KETZPnkMLG+j/j1ds6fdd1f/k+EZQV
         /+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681045188; x=1683637188;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/b9hSn8ZWObn0FlHkk+rwYaVaufISYusIZ7dspuZnGU=;
        b=FE1I1PshMrEp8hoC+H7VobvasWJ2iTu6kf7h0Zd1Drk82EgtJTIao9Rn/IHj9vlCDc
         fofJwiqQzVegeQvZSs8cqb7z45A70eyCDlo7rml2lAdCGjHkLtKWiDViVx34CTZ7fbMC
         DH2AaL6y+PbBYW9ej9JboqyctbHTNFFA33GqvpWbq94Nrth6Z0SAhi9b9/gLEpyzZ8i+
         ajSnHXjAqWKe+G3HBHh2h+H1+x7czSQMNNjQQm088wLifeAJWl/JRO0mjmJBF16l6k3+
         zf+EaqzwRQBS0XrLZ3qeZi39F9fpcRCBjTUkCc4VLmxgPcEqq1KpeM2ndOklec/NnbTQ
         LvMQ==
X-Gm-Message-State: AAQBX9fzBZv9TzV4OvYJkPWCaRu6zOKLL4RyjIOHecYX8JHlGeSvrPOF
        zk0Sk/dsa7uEDw1SD+2aiFMqe39hR/vlVgiXvrg=
X-Google-Smtp-Source: AKy350YJYas1Dsb+RGL2jSRQ6nEbWYgSast5rKiA+O3BAfo98xDb9rfM5Mixh3Xv9YHV99OCghLXm9wqFfDnpLHtwwc=
X-Received: by 2002:a17:907:7f23:b0:94a:8300:7246 with SMTP id
 qf35-20020a1709077f2300b0094a83007246mr203077ejc.14.1681045187774; Sun, 09
 Apr 2023 05:59:47 -0700 (PDT)
MIME-Version: 1.0
Sender: kabaf2909@gmail.com
Received: by 2002:ab4:9f4d:0:b0:207:76f6:da2f with HTTP; Sun, 9 Apr 2023
 05:59:47 -0700 (PDT)
From:   Kayla Manthey <sergeantkayllamanthey@gmail.com>
Date:   Sun, 9 Apr 2023 12:59:47 +0000
X-Google-Sender-Auth: J1U75Qs2G8l9SDNQv0ZaZW1SuJ0
Message-ID: <CABhL9zmeE_YsMOqCiwHZ2oy+0yDOs6t4UoMrAwOvXACiVVj6Fg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!, Please did you get the previous message? thank you
