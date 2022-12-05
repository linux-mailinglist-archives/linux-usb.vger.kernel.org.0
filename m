Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB0C5643801
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 23:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233672AbiLEWYW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 17:24:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233613AbiLEWYU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 17:24:20 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2895F80
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 14:24:16 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id d131so12965743ybh.4
        for <linux-usb@vger.kernel.org>; Mon, 05 Dec 2022 14:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=26JZLWDgNrzczDfh9mjgOtdg3XGCLUwKF6YgBctcQ9g=;
        b=OoqsWBlzyFjAHq6ezGJ6I4NMxATUWrPDUhEeWFdsF8xXFrVe5sLY5us4Vg0xd2TrUE
         kYPnVBTZf2sYfyebF6kvFQbes6RS5GP2erpmKD+n/F6aWi6k7ODI5FQQbLsVP2TtyaXC
         3i3UEcd1ivwaml9dDE4c9SopUa92VYzBIzsX1D9kc8A2zc4qDi8IGy/uvXI1T2xpy4cd
         349pNIZZMA4tuv7R5C755NL06TZh8faHxfBiI8ulJIrQE8AJ5/otw46ETZ9IO+LDWBEv
         CKmmT0Zmdu86G3lnu46blDq3/ayTd79TSzTYi9X6Gv5R1zTaeI0XzJvBLpBPHc7cPxTy
         Bb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26JZLWDgNrzczDfh9mjgOtdg3XGCLUwKF6YgBctcQ9g=;
        b=5FDexhacz4tM7BrMqzYuYcGa4ixIn3BWVPeosmjXaam2vnoOSpya3eU/G61MpjAbQV
         OYBWzpWj9jHSL4nZi1t/nNjzLVOtIysd9R9Ajy5UOe3I6R4pNV+ZP6sZzReGUyBUXc63
         xedDikhHloUFzu5Yh9nMKoVBASK4o2afScI2f5VvP7pBD38dVAn0XJHvY/fsoV2i7nVp
         d03Hj602d2q/hA/WRYAh1bOcy2z4kMcxhRPe0RGeqlYmGYYeuqghEBmWJNd3C/1SUGpf
         O8b93f7j9V41m2hIQj4gpZm6LJIkifnELRBWKNFDWa3fW1R93T3x2akHsHx/FN01FKGO
         hHXQ==
X-Gm-Message-State: ANoB5pmA23AgbBb84hAWaaAFaK4+dHFcRIY7CXsHdWLXAJLfe+52W/ik
        lys8WOwRNbF4jBBK9zrcD/H/OwpzLqYxyEiiMU44Jw==
X-Google-Smtp-Source: AA0mqf7OvyqoSrlMOqkJSWrbWFJX3HR5a/WC8bBY8jOJbgoisAHZRYp3vUx27/E2X5hlDCJT1KfRXlvpP4PlPjh4oqg=
X-Received: by 2002:a5b:7c7:0:b0:702:7a86:31e with SMTP id t7-20020a5b07c7000000b007027a86031emr2744513ybq.506.1670279055815;
 Mon, 05 Dec 2022 14:24:15 -0800 (PST)
MIME-Version: 1.0
References: <a989b3b798ecaf3b45f35160e30e605636d66a77.1669044086.git.geert+renesas@glider.be>
In-Reply-To: <a989b3b798ecaf3b45f35160e30e605636d66a77.1669044086.git.geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Dec 2022 23:24:04 +0100
Message-ID: <CACRpkdZPhKT=wjToSiY+iyXk2_WdBZ1hEvmNvQQLJPZGN==-xQ@mail.gmail.com>
Subject: Re: [PATCH] usb: USB_FOTG210 should depend on ARCH_GEMINI
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabian Vogt <fabian@ritter-vogt.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 21, 2022 at 4:22 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The Faraday Technology FOTG210 USB2 Dual Role Controller is only present
> on Cortina Systems Gemini SoCs.

As it turns out, this is not true. The TI nSpire uses this too, I should have
noted since the nSpire maintainer was patching the driver...
https://lore.kernel.org/linux-usb/20210324141115.9384-1-fabian@ritter-vogt.de/

Shall we revert it or just add another clause for the nSpire?

Yours,
Linus Walleij
