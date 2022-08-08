Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5983B58CCA4
	for <lists+linux-usb@lfdr.de>; Mon,  8 Aug 2022 19:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239759AbiHHRWt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 8 Aug 2022 13:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234680AbiHHRWr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 8 Aug 2022 13:22:47 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB42F15A2B
        for <linux-usb@vger.kernel.org>; Mon,  8 Aug 2022 10:22:45 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id q16so9146071pgq.6
        for <linux-usb@vger.kernel.org>; Mon, 08 Aug 2022 10:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=O28LB3VJeo/kKOVhLcFL4DSdRmxftwkXFxjSliaVTfs=;
        b=FjG9bAOE/vr4NILstUm98ZTFJcJmpjqoXufk2oowLpRFyjLNjIXWE8xgumyKd09Anw
         qP4/nIYBvxItWT+RmPjL7Cdei2SABwD9CVWKG8f35SDHehlSlAQWuvxF542PNwDUNWSI
         5wAxlMj1ml4UdL/wsgMcPqne/RJHi5NgQYwzpHpxkxg/D8bZDqPQgFbqDN5NLxcttcDZ
         ncWX0Gu1Eoi7CrkiO8wJ+PD40yhkolG6+77TnOTxDSRj2YVOoAd4MFoHqqYURuDCHF4n
         xRA+Vb3c9ieclrZIGszS/v4bgrG7lfnw+eYP+fcZeyyLZIz8vG2nBID91fn4v0o9v2pV
         343Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=O28LB3VJeo/kKOVhLcFL4DSdRmxftwkXFxjSliaVTfs=;
        b=VPyhmC66oboCY+EJJBhfBYjhT5/1r/KjYcdo25ADs12YJSyDE+88PZ/O1PCR8m/kX+
         yzmb2SH2SGWPf0+Y6sjEs6vf3X7XUVpgtpDZmY08JtWTGPpx0ee5q5E9MXM6ROZwLICn
         2wW5xKJEC6YoRvEvKxDauWQRogEcRc8tsEUZ+PX/nnWh3rPpDSovUL20vF31OI+l9Z7T
         ShugKoFqITVgmt+r32uBLSWYVB8lx9UuiDFYHJS7vfduz5JFFoqsxUhrC/qWhhFfDDW5
         r0PZfa8ElkOyFnH+FTRKn20+ZTDYKDJoMAmMfEPtekSUuBNcm0AIOhUGMHaZl9zcq0it
         qlLQ==
X-Gm-Message-State: ACgBeo3vSsGNmpDqDeUaiuOu6CwYJVxyqJlafGLFRoEuWI8xSIFxlGLe
        EwL1NmJ2PJ6nlgSJ4uA3BUM88kSvaMWBUlGOVdQ=
X-Google-Smtp-Source: AA6agR593c95O0DZq1RiwM0bxAJNNM5d/Y54tfZOSUP4vEY+a2Yy9N4Yd33HagemUwPm1j15Zb3AZk4FiK47vyQxC+s=
X-Received: by 2002:a65:6d98:0:b0:41d:d9:a338 with SMTP id bc24-20020a656d98000000b0041d00d9a338mr13436835pgb.421.1659979365366;
 Mon, 08 Aug 2022 10:22:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:4398:b0:43:8161:c4b3 with HTTP; Mon, 8 Aug 2022
 10:22:44 -0700 (PDT)
Reply-To: keenjr73@gmail.com
From:   "Keen J. Richardson" <kuntemrjoshua@gmail.com>
Date:   Mon, 8 Aug 2022 17:22:44 +0000
Message-ID: <CAFhr1xDq7Oweo5pq+QBwS5TinAZ7r1Tvsio9gMfNw9i8nxOi2Q@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
A mail was sent to you sometime last week with the expectation of
having a return mail from you but to my surprise you never bothered to replied.
Kindly reply for further explanations.

Respectfully yours,
Keen J. Richardson
