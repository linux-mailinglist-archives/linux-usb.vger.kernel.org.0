Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0941C6B7BBE
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 16:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjCMPSR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 11:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjCMPSP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 11:18:15 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E5F6580
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 08:18:13 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id r15so22944704edq.11
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678720692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YvD4xgouKK3AKr074qCnN8V+sdQ+/9ElRRW9yNO8Sq8=;
        b=ZxIAHmB8cLBhueNZ9tdfz0/OMdEhaA6dxqHeX5tcnH991gqWZw7k9rJUyUhPX/lAvO
         8hwuXz+6zs8j3sE2uDfj0G3zB5boLRQLK6xTDdxqebCJ/2PMcS/WWf97hEYhvvf6exGo
         zdXhV3K3UHT5Rp7AFNsWVWeDUvr6EfslVYCDDr/s00Wu5llB0TA8t+/m2P/zq31IFN3G
         5BWXhg1WBQBWSg33k1MiseqI46mhprVKGaPXRhwYFFGtJvPVpfZHLxcYKolEcNqsphkk
         tFnhKxz0mF7EzVSNOIsa6ubDK8pPoUL/MmxpOflKNyQ5dLhgZSIRSPXtNu2/kPpUuFwb
         NWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678720692;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvD4xgouKK3AKr074qCnN8V+sdQ+/9ElRRW9yNO8Sq8=;
        b=RwJlGUJ5H+X9qAtblbXHKbKuSMZdLkAFhJMw7T3PiaezA8Tq/ZPuUMKzmI2AxZ8qsh
         7ltE9YC9wPEfEPNfZfrQvhTpw3cz5DxWGpqvMmefHyb0RAhEI239Jl72BUdZLs6VHbU8
         Cveh9mUXCnRSn36yfsMCdIiL+fcGnBfAZ+Un6I3XsIHe6DHy18/F1yn9J8XguV8Bv2sb
         nDRK9WRIl1fF2kCnE6EkEDEBElnk6zOpMDhzKG0rhQZ7O/uWsiXDEwUvcijS2947LUEm
         cTjvmAI9dPoqTnA736ZsJySU2+5AnUwSG9mbN8GXgw7sz9zOprLYi7eKP4tHcz/XLGmd
         vPSA==
X-Gm-Message-State: AO0yUKW6aupx6IO7ypK7bsKnmltj5VkCMT+8+Bxv7khY3YG1G/nwfbuL
        drX7BDiRtbOjBDVEyyIsSHGxR8C1+xouPUyV5/M=
X-Google-Smtp-Source: AK7set81ZcU8xQIpkdR5VfGPYJYGajn3UfDpffIdg0AmRawn239FkeSgJP3PrcPLC2LdKR6c0+F+BYjQRPlUKH4b0SY=
X-Received: by 2002:a17:906:f46:b0:87b:db53:2d7d with SMTP id
 h6-20020a1709060f4600b0087bdb532d7dmr18187536ejj.1.1678720689237; Mon, 13 Mar
 2023 08:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230306120741.198992-1-enrico.sau@gmail.com> <ZA88WZ51iBgpeuXn@hovoldconsulting.com>
In-Reply-To: <ZA88WZ51iBgpeuXn@hovoldconsulting.com>
From:   Enrico Sau <enrico.sau@gmail.com>
Date:   Mon, 13 Mar 2023 16:17:42 +0100
Message-ID: <CAH4ZQwtFxwphP2UGeLZYYUBKO=3pTDJa+7QF9WT7QBQLJLweyQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit FE990 compositions
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> This entry does not seem to match the usb-devices output above (e.g.
> it looks like this should be NCTRL(0) | RSVD(1)).
>
> Please double check this one and the others.

Got it, sorry, I will fix.

Enrico
