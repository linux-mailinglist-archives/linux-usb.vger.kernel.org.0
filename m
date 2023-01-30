Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4FF36813E3
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 15:55:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236578AbjA3Oz6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 09:55:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235737AbjA3Oz5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 09:55:57 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B7D13DCB
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 06:55:55 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id m199so14315541ybm.4
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 06:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NN0mdnFkZpR124jn4kAFI6DUsDXJE6F4cIno4RzwicI=;
        b=rH2h7NTfh0WpSkV4JAe401+mDBfu/hc2k/Y21DE3eXXcoR7sc3lzTcWs2JPQSKj6LQ
         sWmAn1l5RqCYeG7LDu8S5lC7Z2OAdKY+L+DAqlbqDEYwM/rkKnFIKTCKN5bGxMJHVSfR
         CMiGVxYQcuBaFuWemq7fgVAQ0KIX6HLbTNzT0hcXE5xCJOWJFxWB5UWz7M+KG6hZhqvW
         qQa0ppYt37lQSYXAsEDZw7cdPIJbRhsqyODq5f/DYtOmWX6RjIQvQkvZieNl9HBPJSIj
         WMlPSi34Uw1qVo64ox8+BsEqXDn5M0ajBicHxQEQ2qf7B0mMJ33dp3rKzoigjKzWsTDf
         y0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NN0mdnFkZpR124jn4kAFI6DUsDXJE6F4cIno4RzwicI=;
        b=YrQ9O9avxl9NUSpMIpj/H1SRZ/JgcwTuBntbnUNVbslT1Dv2+WTKvklXdB5SCa5MZr
         A0y5ZHxjV2SfRDUMS1LmmTz9ykMV3vlzip2L5jdT8x8lqWTGYg0PmQrr9bEwie4v0yU0
         DGQ3sIbHHjNM1rZzh2mFluXvabWqszQISjsMj5+ZOSmfHtqWRde6pn8NkF7E07Zo8eFY
         QwBK1znazZxC+r8spTdIXciBGBuyAyi8DTKe8fzCTC7AFGWnxMbjNwj877z7dNr+qUjv
         BzE9xNO5GiJrkLQQy/0LKVvFQ61bH6wtzNK9R1+5fWjxyR+PJ5TSEZpHWFUJ06I+vAab
         sNGg==
X-Gm-Message-State: AFqh2kpiJoWCfm5QbzoJ45DK+RVB4bSgxsPCFG7c4jEky9wMK7rMl45c
        M3v8sYeW8Fj9NH43LZGTcJLg4agIrbFtJVPsJe21oQ==
X-Google-Smtp-Source: AMrXdXuKnZDF7XJHFjQA9/FR1haZK6RCtvkDMhf9cjqZBl9ZgWpMOjF5e8PZJPA5nNp/9rBnAsGImrJG7pbSYqv/ce4=
X-Received: by 2002:a25:5303:0:b0:7e4:fa1:b33 with SMTP id h3-20020a255303000000b007e40fa10b33mr4456537ybb.460.1675090554955;
 Mon, 30 Jan 2023 06:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20230130120633.3342285-1-yangyingliang@huawei.com>
In-Reply-To: <20230130120633.3342285-1-yangyingliang@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 30 Jan 2023 15:55:43 +0100
Message-ID: <CACRpkdahJQouoDMUu=0kDfwWPben6iRW5DHJeCftVr+kyMYHmA@mail.gmail.com>
Subject: Re: [PATCH -next v2] usb: fotg210: fix return value check in fotg210_probe()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 30, 2023 at 1:07 PM Yang Yingliang <yangyingliang@huawei.com> wrote:

> devm_platform_get_and_ioremap_resource() never returns NULL pointer,
> it will return ERR_PTR() when it fails, so replace the check with
> IS_ERR().
>
> Fixes: baef5330d35b ("usb: fotg210: Acquire memory resource in core")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

BR
Linus Walleij
