Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4AD4DD873
	for <lists+linux-usb@lfdr.de>; Fri, 18 Mar 2022 11:50:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235349AbiCRKvn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Mar 2022 06:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235434AbiCRKvf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Mar 2022 06:51:35 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938C62D4D55
        for <linux-usb@vger.kernel.org>; Fri, 18 Mar 2022 03:50:17 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id t40so2754798uad.2
        for <linux-usb@vger.kernel.org>; Fri, 18 Mar 2022 03:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=ZxV+fDtUiooj7CgVSvQYercPIjoPkRCu2t/WG/Oga+A=;
        b=OJknPIXHzZASFeg/9vUEfac+NrQZGUV9pSF4ZH23EzUypD77QiBSuy5v9crs7X/MtR
         1ZW5XvXZwvphy4LDjnnUy2Q9V/gKr+uW0fsoDSitvs2hBgktwX6oifdquejr7A1grTLL
         Z99sGcNAXwMvHwz2jcdRF/I1XFMK95RPwcS1lUAugy/R95kCJUppWWpkCEsZv86GcDvY
         o45BiaQ/5DqGDPfqc8DJ8n2wi3uZrs7tgrCNMjIPdi8VgV9TN8pSjq7ZmaArvX/VEHOA
         IJgAyaEz92G8DHAAVM1e428p1Gk/JFhuZe1RuoPVt0f2XdME3TQDwuK4DNqAR2Q7Tq3G
         ZnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=ZxV+fDtUiooj7CgVSvQYercPIjoPkRCu2t/WG/Oga+A=;
        b=bdjbSkNy8pBv7WbdXhQDiG3DxkCf91YnfmEc7nciehE8RZTzDAEOjjXmogLhpcQysM
         GaqDPQgbZjG92pg4zVXUAhPxp0vQbR3ovxAyE9OE7kDOjmtmVHOfctVAjP7oiGOjglfq
         nptzk/fdj2irkoHIJfRJJinb8nqFU+idqMkGlrmeFMDehlloFYcpfbYIsTUbntqryWcd
         WbRk4srNOPDLo5DyJuJE50MfTPjDFw1qGzdgdxcmr94MzLStXdF/IIulIRzSiPgs/JJd
         Hcd1wFajyeGJTaiB+j/jpqO9g1N1I2Phl6WAVYGMDxjndIdxZnPzp0u+EF/x5o9kof8M
         F4Kw==
X-Gm-Message-State: AOAM5302zkwmx/bzUuguzitL9sofgNrFln7aZDDxEae9hUlO4mCiknSY
        sJEKisL+67Lvo+KVwydsJIJx09F4cdQXIMqVHsA=
X-Google-Smtp-Source: ABdhPJwM36xwTNRt362lhDRg7dGfGjCydVrUL4cEaWFiOCZnwM0eYeMM0e0jx8u73sZyi/Tzq7HJR1TxmJfXQi7r/ZU=
X-Received: by 2002:ab0:7610:0:b0:354:21d1:9dc7 with SMTP id
 o16-20020ab07610000000b0035421d19dc7mr1753132uap.100.1647600616570; Fri, 18
 Mar 2022 03:50:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:eb09:0:0:0:0:0 with HTTP; Fri, 18 Mar 2022 03:50:16
 -0700 (PDT)
Reply-To: rolandnyemih200@gmail.com
From:   Rowland Nyemih <guedjouirene@gmail.com>
Date:   Fri, 18 Mar 2022 11:50:16 +0100
Message-ID: <CACrAO7DQwh9orHi5HMGJ17-HR2fXKDvHqhzr03DNPDM-y7LycA@mail.gmail.com>
Subject: Rowland
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,
I called to know if you received my previous email, reply to me
asap.
Rowland
