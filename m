Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41BBF688998
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 23:15:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbjBBWPy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 17:15:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbjBBWPx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 17:15:53 -0500
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE3E23DB4
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 14:15:52 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5254e8994e8so292447b3.6
        for <linux-usb@vger.kernel.org>; Thu, 02 Feb 2023 14:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=19V0e97JoWZ67eUcIY5neNgqP4C3AsW402fTkFZrQZk=;
        b=AfeZaaL1aLPhIB152+5ci5G7/wre5jroesPOHlH7PgLb2mHXiR8n/aS7MZach7yvwS
         Qk21Y8FGM3xZmNh/ahI/f2VsPSR0o20RhS/RIM2JttgspyDkkgjXvh0YWao6IUtfdUhJ
         Vz99yX7Q7qsxM2iWIB3IXB738UfGFHQ+RG43UarZoneNAapvuao0q6lh44MD5GY/rZTw
         BYYIyOkpA6kEMBQVb26T0yAdhdv3bgpTgn7vaxxLN/hgf6nxLFaraIZjM7FaTCQBE2ga
         B3s9HEZrJS7UojumIuGVBKBJgdPx0u+kGB4bqLbIDLFXJcYa12ZNF2IG6btWQmMXjqYG
         OKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19V0e97JoWZ67eUcIY5neNgqP4C3AsW402fTkFZrQZk=;
        b=flr2wc8MfmdX0QDxEyUI0XgGTatnn4RCGF6in9lDul6t9TO6YHoZVh88cJoQD5iYTx
         R4+MHf30TocW9/QJvPIdIY+RVkxSk0Qc+QrlOvLEMCJTi8RMrMFJ0d1oZc1IljTIHkCu
         SLvqW7NfUf2KN7l75fPTu/RhrDzkkz29OtxZjwHXyr1w33T2gyFpsVTL+3U3ZlsGs45V
         0SmYLv5LtLeO/cP1L5OKmqW/zw9PRsE5ZgsEMvmqs+rj90UYQchL8BLhUmj0ns2grFFa
         mEmHLM6JPFUmKvOo7lZfRNGhNFMnTsKOgcmAKS8CLi4bYZIJA3vnGWt3oCg6BEfKe5th
         D81g==
X-Gm-Message-State: AO0yUKUaEoUiTQpy+iunLyQktRt4Z/oSZqlL7yrj3KTYFbmvmIW+4Kaq
        kT6EdbQGJs2DOGR4HtiRAHBQ+OCZmNN+EftyQzJd2A==
X-Google-Smtp-Source: AK7set8pUL+pN6rjicEsRGrTUBOiwilyWNtzSCpLc1Ftf2R+TSJHgSqaJ1+Xyu3Jbt4bc8Psfldvzhca+5psDBZMHRA=
X-Received: by 2002:a05:690c:23c1:b0:4dc:818f:f9f2 with SMTP id
 do1-20020a05690c23c100b004dc818ff9f2mr759395ywb.469.1675376151782; Thu, 02
 Feb 2023 14:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20230202153235.2412790-1-gregkh@linuxfoundation.org> <20230202153235.2412790-5-gregkh@linuxfoundation.org>
In-Reply-To: <20230202153235.2412790-5-gregkh@linuxfoundation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 2 Feb 2023 23:15:40 +0100
Message-ID: <CACRpkdbDihXa8DRmF_XbRvh3hQ_4g8c6eQQbWRRRhEn_MuLBjA@mail.gmail.com>
Subject: Re: [PATCH 05/13] USB: fotg210: fix memory leak with using debugfs_lookup()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 2, 2023 at 4:33 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> When calling debugfs_lookup() the result must have dput() called on it,
> otherwise the memory will leak over time.  To make things simpler, just
> call debugfs_lookup_and_remove() instead which handles all of the logic
> at once.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks Greg!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
