Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A821040B3BC
	for <lists+linux-usb@lfdr.de>; Tue, 14 Sep 2021 17:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235460AbhINPww (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Sep 2021 11:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235158AbhINPwj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Sep 2021 11:52:39 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA05CC0613CF
        for <linux-usb@vger.kernel.org>; Tue, 14 Sep 2021 08:50:56 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id c8so29857728lfi.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Sep 2021 08:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8e6vYMWtLVlzKilUTUU45LYQ5AtwsMVMMhkibc3Y9M=;
        b=VPtON4P1X5GExo1d6Z5sCnVYLKvvLO0Re2N5FswMDFOHm94KFNCSQXm1LsojcswGFd
         7lS7F4RRELcrCB8z1u8gNMvwZmlI+QPC+BiV3B7cnvHDVAeCZQK6r2tCoJgfCs7Z2Nak
         sV0Tdz/F2v44DRwN6x9q0DQx82ZY2rBsgEjYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8e6vYMWtLVlzKilUTUU45LYQ5AtwsMVMMhkibc3Y9M=;
        b=3vkuIC7+gUlLqDNIQt7Sg8tjmqVbGt3YwJo5NL2m94ZQcrrY6n9uy9nAGGmbtOdEhu
         YeWPcbcM6z5BZ1IdiPXOZ4cz6NqeAO0Ii9J8i6zKq/PVGfJB7dOgmiMra9u9PURuIqsJ
         EQVqT1ef000lz3ohwDExij+UPbPYUq7kQzGmYM+llqWzcuNus3tKq/9J/Bxo/zSzWL0U
         nu1XoE5ajf4tE0qSTod4CJ9utUkjctryibF+UyhGOT9LgUK5UChVGJZ9XkWUUochgTio
         yzVHEPtn6voomAmzwyM98+DL1t6wkxX7Kh5+A/PposUmfUigUHuulptNIOlVFbT5tcAr
         h01Q==
X-Gm-Message-State: AOAM532I7G6GF7IC1+hCA5Icpk2tPJeC95rHgAkVq3N69i5zOR9LB1SJ
        HEq9H+aJrXo/1NUeZ6sbOVka1ekdw+CBrNUcaTU=
X-Google-Smtp-Source: ABdhPJwQYNaaBxdxWMVVoeGTZBaSkb6evPvirq68RXYx36Lf7kPqsZGkdKZ+1suYid+B8Dx6H7lViA==
X-Received: by 2002:ac2:560d:: with SMTP id v13mr7359554lfd.342.1631634654855;
        Tue, 14 Sep 2021 08:50:54 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id bq24sm809004lfb.204.2021.09.14.08.50.54
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 08:50:54 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id k4so29825028lfj.7
        for <linux-usb@vger.kernel.org>; Tue, 14 Sep 2021 08:50:54 -0700 (PDT)
X-Received: by 2002:a05:6512:3d04:: with SMTP id d4mr13360552lfv.474.1631634653874;
 Tue, 14 Sep 2021 08:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210914092603.18722-1-jslaby@suse.cz>
In-Reply-To: <20210914092603.18722-1-jslaby@suse.cz>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 14 Sep 2021 08:50:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjctpqFhN1MQKTaGLrb9BrynU8KpRcx1zW32TF_GJ9ChQ@mail.gmail.com>
Message-ID: <CAHk-=wjctpqFhN1MQKTaGLrb9BrynU8KpRcx1zW32TF_GJ9ChQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove dead e-mails
To:     Jiri Slaby <jslaby@suse.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Korsgaard <peter@korsgaard.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 14, 2021 at 2:26 AM Jiri Slaby <jslaby@suse.cz> wrote:
>
> jacmet@sunsite.dk and linux@prisktech.co.nz are dead:

Please say "these email addresses no longer work" - the "are dead"
makes it sound like the people have died. Which is not impossible, but
not what you verified.

> Remove them from MAINTAINERS.

If the only maintainer email is gone, then you can't reasonably leave these as

  S:     Maintained

and that should be updated too.

          Linus
