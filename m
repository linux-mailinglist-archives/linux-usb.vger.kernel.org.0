Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7A1D57AA30
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jul 2022 01:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240481AbiGSXCd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jul 2022 19:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240484AbiGSXCJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jul 2022 19:02:09 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C25061D87
        for <linux-usb@vger.kernel.org>; Tue, 19 Jul 2022 16:02:03 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id i206so29263316ybc.5
        for <linux-usb@vger.kernel.org>; Tue, 19 Jul 2022 16:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=YeEFrOpnueqp49lpSsCtkyhW66cD5QzqZPU5hyS5TkM=;
        b=IidRqp259LnIGwKSY8eSnwY2pSvVpnXgD6l4DtZ0nS1en5/eIODexxA8HY1P3fOj1G
         k3L2dqT2adyYNMP0Xveqboy+8rHiXHxkUk7eN+Z4c1u4A1dmYZTv8XeBq3Mcqc8JpY/J
         Y+FZqCw+ctBHW93xydCMO1T2zbJgKE6zi4yOKnSgCU0wXAb68jTgzbksOw/WF0fuySr4
         IszSqaPAblIoqFUVbDoenHDcU4oM8zz2T2X2YOFu4paIHinYHYAEpHDagNDILO9VwXpP
         1+8RZDNcKixJbUOVKzMHhr00ZyE0o1uffduD4Jla0qSaybMZB4f9mMaQZtZwFiKbVkVp
         7loA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=YeEFrOpnueqp49lpSsCtkyhW66cD5QzqZPU5hyS5TkM=;
        b=c3pyFjdoIJS0O4ISyvL0Ubs5PgJVsy8gakVCyo0AVz4dpw/n9uGWU42MyXY77UgkaR
         fX/Zp72HIXRigtgsVc9jF9cEsdl/gSqBspc6YbH9W0evu9PFCoLCNGfDg/YC9ewTnOxi
         spECoWwVPWDWSw9ZaXyffUH35WtMdNAMH08lgV8j7rDzs4zxEHBa8xQw+TNU0CFuWf7Y
         v5yYMYnD/t3x3iTmrfYOrzkAuQi7Tg3LuylyCx89DSTrBvkuoz92KWmwMGaV5X8eMRmR
         wyinxvwHOx4Kl4TY3AGkr4pLbBfGoR5mmV5HPqZGtplPmEP6Pdf1ABjL1O5aaciSAaq5
         D1QA==
X-Gm-Message-State: AJIora8uuhQ5Oi+uxbU8/6gHzTBfNS5+2e2de/I7gGA/7R6qXpFVH9wY
        MturBHESD8m8AEB+ylh92s+dMAD2EkCyLUEBUW0=
X-Google-Smtp-Source: AGRyM1sl0J4NyfzC2f29bqXT9oPchs8cDVndRHRbS2Q3refz6ns6Y35SIupBWILMCNYHx3pJ+wk7AlhI9UdwA1sMqK0=
X-Received: by 2002:a25:850b:0:b0:66c:d287:625a with SMTP id
 w11-20020a25850b000000b0066cd287625amr35727355ybk.31.1658271721069; Tue, 19
 Jul 2022 16:02:01 -0700 (PDT)
MIME-Version: 1.0
Sender: belloashawu72@gmail.com
Received: by 2002:a05:7000:26b1:0:0:0:0 with HTTP; Tue, 19 Jul 2022 16:02:00
 -0700 (PDT)
From:   Lisa Williams <lw23675851@gmail.com>
Date:   Wed, 20 Jul 2022 00:02:00 +0100
X-Google-Sender-Auth: BO4DmyfvjRINBOwOOpcYOq24sHk
Message-ID: <CAOjupQKQ6zRjFB_6SefXkEmKaf0_dwC_KfS2LmZFQLFEaDr30A@mail.gmail.com>
Subject: My name is Dr Lisa Williams
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dear,

My name is Dr Lisa Williams from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks

With love
Lisa
