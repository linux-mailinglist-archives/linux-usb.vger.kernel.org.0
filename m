Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2686667AB24
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jan 2023 08:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235184AbjAYHpV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Jan 2023 02:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234420AbjAYHpQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Jan 2023 02:45:16 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 419593F293
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 23:45:15 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id 188so21928554ybi.9
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 23:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qF3ME8KmAbiPM+uV8e+9+UHUcvv3JfyvhjzNHS8NdOs=;
        b=do0qOmLqFZjiqUYiWqOhchhr1U7fhT+qtoPgfMCbIuxEf1Uv7W6fHlzEMDs5H+aaSE
         b5iZeqc30NgmrBwNqqmALTDoPquf39PP/Y9iA7fDP4JqLdjVD2CVVmUSBxnLnH9/WznT
         9SOHux2MRTmiz6WJBwgHeRNUasBWs4m+LqME9kqQmEUvahG5c27CUspCtIFBQKEfiNhV
         W8Q1VVeL1wZV1pQggdpZBWUbvCcVjF/YqkT87M/QdB1uca1zG2gzH2kyB+7dbpdqvuNE
         JHnLNsJ2gq0h9nQpVp7NKnusDleZX5JLn7cfOH8x9Qs00yaKNY50/+bFf1UiII4Gvo4P
         Ilhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qF3ME8KmAbiPM+uV8e+9+UHUcvv3JfyvhjzNHS8NdOs=;
        b=WHr1reE8KvaOq2lmrLDdrL3Z8KbiToyrTJVJntAy9ERSieC7dQKmDagcbnV2fMwDJe
         y2su0qT7zngyjbVV+WXEPxog/UePdG9wd9a/CNTe+hi7E+mm4CYkiQvJv5a4hdJsWwC5
         uqz0pjQLKHGZammgcxcZ5o60iDoKGdWugEu1rjxFqy66+N8DkPZxg0AF+LqfP9EQJ6ip
         7sNBK8uQ8+fCg06kQaNC1B0nEtwUm1CrBPSFL+LWAocqb19oxLctp0QOsjpKlwkV2nvY
         NzAbaLhmdKhjKUHgKS/s4bo+GDBb7R2kq3AuqoMF53GyZOziugKjz7nYeJz+nQOKvsqJ
         BAZA==
X-Gm-Message-State: AFqh2kqCRGk8F10fK356ZYyJ7Ev+8oHMC1KXOirgW7nYzUXxq8MEr1Li
        qfms8MtE4ntXoWkCTUx6+p/nipWQ81vZfFgvK6RnMA==
X-Google-Smtp-Source: AMrXdXs9H6rNVyo8wsq5+UbjgawuNwzre+If+h1NDNeCNnkszIz1w7OgCBbOJ5/bm8vQn/XCtj4DGOzwU2lU8PzPadc=
X-Received: by 2002:a5b:38b:0:b0:7ca:9b40:72a7 with SMTP id
 k11-20020a5b038b000000b007ca9b4072a7mr3871061ybp.130.1674632714500; Tue, 24
 Jan 2023 23:45:14 -0800 (PST)
MIME-Version: 1.0
References: <20230124233511.23616-1-rdunlap@infradead.org>
In-Reply-To: <20230124233511.23616-1-rdunlap@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 25 Jan 2023 08:45:00 +0100
Message-ID: <CACRpkdZRQ4jRzDdaW45h-AYU84_JSVY_S+yG7na1CGxsBKxHVg@mail.gmail.com>
Subject: Re: [PATCH] usb: fotg210: fix a Kconfig spelling mistake
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 25, 2023 at 12:35 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> Correct a spelling mistake (reported by codespell).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-usb@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
