Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 400B0671539
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jan 2023 08:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjARHm3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Jan 2023 02:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjARHkw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Jan 2023 02:40:52 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4CE3B3E7
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 23:04:11 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4a2f8ad29d5so455343667b3.8
        for <linux-usb@vger.kernel.org>; Tue, 17 Jan 2023 23:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qwYgUy+5x+n3czYTnBLDrBkp5mQrMIBl+GY2k7ppAow=;
        b=r3tivdU3Fo4Ecmoc+ih0a3GDSXtggOGqB2aZH4WJaBo74nFYQYV+yp0I/zTXXxDtUZ
         9nco5n8voN17P2ZNcBmyuBChfDPj6H7Y7wH7upvAn5lo+opKB8IWck9f809r5BuNWCea
         j1cGPqa9Z2hNqTsyScw4VUmSNmn4pmsjCy9SwunP+JuoGfH4g1yWMSqvvdRNxfKBe16h
         z11F3VCp8JXS699sagT3ewt0kmeGq/bHE7wnOlvBdtRX+LrzXpL8+HVT1bI+lCIBMSyk
         3bJnkd/2GNrPLfYODI8uuOkcJEv1i/clf2Eywku8Q7KYOD2H4eXeRE88rPGb9Diitaa1
         vFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwYgUy+5x+n3czYTnBLDrBkp5mQrMIBl+GY2k7ppAow=;
        b=eNW4986Dt1lrwyubxkRF+Q0kqI6UbhnDZdoK+nT0gjeqcZtaxtWzVwIFNU/8jDU49H
         DzMJJwmbcDI3Fz9ceVRIaj02HiknzCBNljc5fvlf3tm8dNqPy5UUgFd2OXguiKq3EW2V
         ttzv9eRRBwnpvoDR48tfcmmHcO/pRr25AW8d3JZq9FeCkohavHF+O4/swVc18rCm5ppv
         XbCUGtkCZigX8KOBHtju6N/WmBr/JCWMCjEvtU+wYBRspBNnqVvjBD4+aRrfTCKEYHaT
         s/bii2Dlm2QFPn5s5QJc/eFjCv7U8dqiV2c2s6JE7BFDVkiYxMW9oEXU35FTwycm++wb
         s7+g==
X-Gm-Message-State: AFqh2krIb9VWS4SE/TIzor8IegWRK9L8s752a/kJyXyjXsg21gWTwkvf
        oF/rqhfyIJXZGX/Duw0z+nwAyM31MaUc6HC7EHYTqA==
X-Google-Smtp-Source: AMrXdXttB0FOXbG5y13tY905pGLmlYhrQ2gcdtcarBBSKoaA20n930sQkL/dpndGfoKmVgpwq5lHAh0r/LUkAjxke7A=
X-Received: by 2002:a81:4e54:0:b0:4e1:a40a:af7a with SMTP id
 c81-20020a814e54000000b004e1a40aaf7amr808267ywb.273.1674025450309; Tue, 17
 Jan 2023 23:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20230103-gemini-fotg210-usb-v1-0-f2670cb4a492@linaro.org>
In-Reply-To: <20230103-gemini-fotg210-usb-v1-0-f2670cb4a492@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Jan 2023 08:03:59 +0100
Message-ID: <CACRpkdaE+b_=6mecuWe4EUfYP9C3j5cXZXMO0s2t7Bf3eMtV_A@mail.gmail.com>
Subject: Re: [PATCH 0/7] usb: fotg210: Various improvements
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fabian Vogt <fabian@ritter-vogt.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 4, 2023 at 12:35 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> This is some gradual improvements to the FOTG210 dual-mode
> USB host/gadget driver.

Been two weeks, something I should change or are these good to
go?

Yours,
Linus Walleij
