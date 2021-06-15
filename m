Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11EA43A8A2A
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 22:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230352AbhFOUdX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 16:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhFOUdW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Jun 2021 16:33:22 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1283AC061574
        for <linux-usb@vger.kernel.org>; Tue, 15 Jun 2021 13:31:18 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id w31so47713pga.6
        for <linux-usb@vger.kernel.org>; Tue, 15 Jun 2021 13:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E37caVuTY/B9zLuR73njZ9AALMNS/tHeRKYxMrSzEz0=;
        b=FouooHKK5Kv2tVo8iojLmqiMmOTU9q3Rr281xjbmdGbDUtZoNIGJWCGUW2XEji6pNr
         1s0h/FW6x9gn923CrLnBDZvR0PUIeXH2PoOwM9cIYs6ww0NK8IA6NdOqWj2EX8lnOL/K
         69iojuLQeqoh2FaW1HaoLmD2MoRVKs8Muky1vRhWoQadCnQjKVlt18zskNGvQ//2eOOF
         3vAngz7c3jupjoqhEvcCnWAvFE4D8PALRb5UztCCse6USes7CS432aLGYiHrG3Eio4Pc
         6ZzzW8TLMHalJS9w7xkQBBxkIcd0OPevTBrlQQl+B5E8wP58FtqZTtoX6jaHqYbh+xo3
         PKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E37caVuTY/B9zLuR73njZ9AALMNS/tHeRKYxMrSzEz0=;
        b=ovyPAJvNonamhGYQooTFMVnc/niT+nMXBMj0y987UZhTC+HRFGVo3H69M6SWMf5UNS
         7Rnc7EEwOFHMnAfjSkrE8ydPtBUrHEYg9kLuGOxf3a81/VmD7Jw3ieKnNjVYrP4oPIKN
         AwekNuj62f9VMUXXCEI19+MOpk3HOQHMCV/EfKO0woGfq8ahe587/6i+llxq4migFad1
         3M7O6PV26YAroICadLLNFD85MziGq+ZOSWOggbUlqsvd39VPW+YvkxmlbOA39XejYA7O
         5Og/WHgJXq/rKkrG5rimx5wsCJ7gD/itCXNurzh+IHkR26SieQf6HR7PIzq8Ra0vUpQk
         Ojqg==
X-Gm-Message-State: AOAM530ACztYrrrL7WuT8E00OEAu9NnPX0/0lKcTm+M6pjQhfZUQkRaj
        RYvPslHVMOa2FniYpyK4izhM3P5z04yKUzTByfJ9mw==
X-Google-Smtp-Source: ABdhPJwn9DXyFZU6dAUW0NVQXX6D8A9PaVBK/VPolhPO1bdCq7C7jvnewfwRIyGRDuiDs3a8xxpJcKlTSl7yTyTwa8s=
X-Received: by 2002:a63:d0d:: with SMTP id c13mr1332243pgl.384.1623789077303;
 Tue, 15 Jun 2021 13:31:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210513193204.816681-1-davidgow@google.com> <20210513193204.816681-7-davidgow@google.com>
In-Reply-To: <20210513193204.816681-7-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 15 Jun 2021 13:31:06 -0700
Message-ID: <CAFd5g45oA_Fiwbntg0RrHs8K37A57CSbUy+4_pFGQOUT=dPW4Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] thunderbolt: test: Remove sone casts which are
 no longer required
To:     David Gow <davidgow@google.com>
Cc:     Daniel Latypov <dlatypov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 13, 2021 at 12:36 PM David Gow <davidgow@google.com> wrote:
>
> With some of the stricter type checking in KUnit's EXPECT macros
> removed, several casts in the thunderbolt KUnit tests are no longer
> required.
>
> Remove the unnecessary casts, making the conditions clearer.
>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
