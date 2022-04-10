Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E592F4FAE11
	for <lists+linux-usb@lfdr.de>; Sun, 10 Apr 2022 15:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234453AbiDJNoX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 Apr 2022 09:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233799AbiDJNoW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 Apr 2022 09:44:22 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FF75418F
        for <linux-usb@vger.kernel.org>; Sun, 10 Apr 2022 06:42:11 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id y32so22357718lfa.6
        for <linux-usb@vger.kernel.org>; Sun, 10 Apr 2022 06:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=WK6OLngTEGMQZnXAmgyK8gksEaTtYBKX+MRhgq0dtFw=;
        b=Q10JEFEkof3O+4QMimrp5Pxh+cKzrurV6IU/mSbbVbL6AE8A/mdqDznE7FCw8uv4iM
         rvCmAU0FU7qIBUTlqFRfeG6hy/waS5Tk4UUAfxrrvr4H3zdHSv27EEwostqoeHQQAKAq
         cIy/2dZvsQNFuJM91NJ2G79Lo+UqYAJg8u/+cxT8N5QVrBVn1b5cdWBZAX6pOw8R6Bfp
         GyLvg0zyrXw412m5p9EJhVTrM7xWipSxBmKxxkrgR8MH2WvZJpCu/ldK41upWVXtLoR5
         hvDptKHe0KzGLrifYJgHiN8WLFcE6/QqJgQZMQ2dLOy5PNyh3oacHFSLI8Pt1BV30Qdz
         r5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=WK6OLngTEGMQZnXAmgyK8gksEaTtYBKX+MRhgq0dtFw=;
        b=Ovs/E8+RDIgrMBdRpgMBhF7i6+xLqg9HnO+aR02p/Ga9cmpPfwHlpTdUYNqGeZuC+c
         FLRcFP0zaczQj4grGCifZGcq72/AXiRTNUDF3w8bX8Bjo4UjM6CUv0cCCkWXNPSQ7Thd
         UxNwdf8nJDL5CdbC8mIXbZCo/HROcxGfl0nXpv8oiv8zYTA1Va1X6sp/IByO8PbAfzws
         zgMCprluVidUuunrKN9ymfVUbBnf5de920MacdZBs+bu5dQTJlWjfmjtLDF3kAguE11K
         Cn8XvmzXk6orayBxgsHr5gH4xEJRh+SKWLILJ3dz2av3Xe0wm+loX5WA0QzIhm5NoRuL
         YLyg==
X-Gm-Message-State: AOAM533CSBUa3Cuj73IwVVZeRV0iF5bdiPC4ZTf6zK1kosh+zRKiqJue
        5XvNjskHk7iJa6yRdWEFwdi5607VGr74AJP9KKM=
X-Google-Smtp-Source: ABdhPJw9PSTfLiezUlMixRvspbapO2L+9UhC9o73liC8Jkz3COG5Tr5VyTD9kZzd4yhH834TcY/dci7GkVNl15syOWA=
X-Received: by 2002:a05:6512:3c98:b0:46b:9ef4:431b with SMTP id
 h24-20020a0565123c9800b0046b9ef4431bmr2821742lfv.52.1649598129985; Sun, 10
 Apr 2022 06:42:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6512:33c2:0:0:0:0 with HTTP; Sun, 10 Apr 2022 06:42:09
 -0700 (PDT)
Reply-To: sgtkaylam28@gmail.com
From:   sgtkayla manthey <sgtkaylam20@gmail.com>
Date:   Sun, 10 Apr 2022 07:42:09 -0600
Message-ID: <CA+RGHE9DxGCTMyE5GxL4SX2cvKzn9HuvN9OJdOiKtSAiswhUJg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_40,DKIM_SIGNED,
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

-- 
Greetings,
Please did you receive my previous message? Write me back
