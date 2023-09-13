Return-Path: <linux-usb+bounces-3-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F379F333
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 22:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48AE1B2097A
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 20:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74DA622EED;
	Wed, 13 Sep 2023 20:48:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CF522EE9
	for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 20:48:31 +0000 (UTC)
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8D11BCF
	for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 13:48:30 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-493a661d7b6so895586e0c.1
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 13:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694638109; x=1695242909; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rABo0AR3U/5ht3y8PnVAL6vWnVnlDXq4IYHAJ3ovT+E=;
        b=AYUieK01gEVg5VpVqOCmuzuLiZJBRXdXZNZRDB7moJzqv9pTpiXM5cv6W92kasfAo6
         cuzpbPperUOwNdCSq6b7/98odamxw2nufUCJrw0dQoF9c4b3wCSBoOp0z9ffXhGA6CkI
         pEplITQehqeZxZ9ISnSUMVbLl/6KQnJe38KZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694638109; x=1695242909;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rABo0AR3U/5ht3y8PnVAL6vWnVnlDXq4IYHAJ3ovT+E=;
        b=s02f3e32KC/ZL3sIOzJNPtV6n5OEk700oAKPQypLN1IgA8EjKcM0Rkpq3wvcN0zd9U
         pN9O/rccBa8fMSmsGw/l1zo4YcGb4MNhoyyG63fojP9vpT+bQQzFb1lIH90IF1XROa7+
         hKPCIayyeRkLtjUDY5Dbz3RgBtcHjYIUy/6rP2Jwe/mnBZBGKuIEa+WC/xL48A8So2he
         JFoi81/5NztE/TSLZ0DaceSRafvR0XHT/7pJa1TLn9zEzyUyu4B0HGeeBXccC4/18lfs
         aKX8m86GqBVK1qF5tYEAohzolZUk2RjUnvXAHCIvdCgdArZufF0b6jYZ0/sqvaO44to8
         Tvcg==
X-Gm-Message-State: AOJu0Yxbv7Xhq5aSEiN0rGWfSl6WFKtBSlAl6EFYesdi4SYwr5++JOQh
	4awAZ3OZBmfS9kA4LbXQpu8A/q1vtUNneKTSt+3CHQl9oNXFaAnW
X-Google-Smtp-Source: AGHT+IFl3k/0SfAvF5IcorwmfM2uw/SLth6IB8icDJcNAY40Lt8m4BlZo8I+/HVgf/VBVpgy/+nm2G7HKQgMsAyAAeE=
X-Received: by 2002:a05:6122:a0a:b0:48f:adcb:26b4 with SMTP id
 10-20020a0561220a0a00b0048fadcb26b4mr3616419vkn.4.1694638109519; Wed, 13 Sep
 2023 13:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913-early-gloomily-4066a8@meerkat>
In-Reply-To: <20230913-early-gloomily-4066a8@meerkat>
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Wed, 13 Sep 2023 16:48:18 -0400
Message-ID: <CAMwyc-T=33CmqabnWdG1PO-OZpDeQr9i7yfT5uhJWYiiyu+jww@mail.gmail.com>
Subject: Re: This list is being migrated to the new infrastructure
To: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Sept 2023 at 16:23, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hello, all:
>
> This list is being migrated to the new vger infrastructure. This should be a
> fully transparent process and you don't need to change anything about how you
> participate with the list or how you receive mail.
>
> There will be a brief 20-minute delay with archives on lore.kernel.org. I will
> follow up once the archive migration has been completed.

This work is now completed. I will monitor the performance to make
sure that the new infrastructure is still successfully coping with the
email traffic.
If you notice any problems, please report them to helpdesk at kernel.org.

-K

