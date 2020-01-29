Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48E1014D069
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2020 19:24:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbgA2SYO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jan 2020 13:24:14 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40535 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgA2SYO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jan 2020 13:24:14 -0500
Received: by mail-lj1-f196.google.com with SMTP id n18so397384ljo.7
        for <linux-usb@vger.kernel.org>; Wed, 29 Jan 2020 10:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NX2pG5BX85VkfelsTQdQ5JSd3AKoTwJ5pQ15xJEg30w=;
        b=ft/bm56u/CHiacuUMpJVmiZTRiwYgPTGIFMn1KyMwkwFHcceIQDeEuHCQVcP0XkAkb
         GRbhwtph7yBEfVt8vH0xT458zagqsZ+cjaUICagYsOP8yTXD9a7Rkj6TVmnBfEmzreuQ
         /pULlOVyxrpWNkJJSL79mlPSddOb4L7DMs0as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NX2pG5BX85VkfelsTQdQ5JSd3AKoTwJ5pQ15xJEg30w=;
        b=n3dsWhF8dQYF8CpdErt3bXdI7dyMbdOa7iX8ovsTSRLQIoY+092cAp/COmXM3dwfST
         Bwon/3/R3en3vn6wPu327ahXWwC0zyZLCE82rF1HqT+0gsKYgnaH0lVfrMrQepJWNmGP
         QDhfNKi7WKC5cUgKu/E3tNQtLZAa6PERiH4Bxa1kQeYwiFVzOtIOAL1dq8H0Ro9EuMNV
         jLa7+P6v9+616R7UrcMZad3hxyCCC54teb3+Igh6YyUYaE8truPqOgVSP94GjpIAAQ1e
         SS9QuZNzRb/n/PMmaIJZ5E9cwhzlOo/bbDHjpxl+cQmdBTqCdVPVEDSKomg93cJcXv33
         fn5Q==
X-Gm-Message-State: APjAAAWDV8d7vAYFpSiss8dRTGK1ELygAylhaB5Zh3Sh8mlw6GJxwScu
        KPyI/BHoayH1sSwWuZVNQTqZ8CilYBw=
X-Google-Smtp-Source: APXvYqwbtn+IB9ALrCBdzHLI03sYlefYKWk5FGc1tijs3qZi6V+g04SXl/xaDzXRDGND+z+CPsjPCQ==
X-Received: by 2002:a2e:9118:: with SMTP id m24mr254363ljg.105.1580322252234;
        Wed, 29 Jan 2020 10:24:12 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 135sm1459099lfb.28.2020.01.29.10.24.11
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 10:24:11 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id q8so437017ljb.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Jan 2020 10:24:11 -0800 (PST)
X-Received: by 2002:a2e:97cc:: with SMTP id m12mr235022ljj.241.1580322250961;
 Wed, 29 Jan 2020 10:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20200129101401.GA3858221@kroah.com> <CAHk-=wgwBfz0CtAFZMDy=A_Wz0+=dzrfWWiHESUD9CxnV=Xyjw@mail.gmail.com>
 <20200129182027.GA13142@kozik-lap>
In-Reply-To: <20200129182027.GA13142@kozik-lap>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 29 Jan 2020 10:23:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg67HWkPawJRFffOS25CL0tjzF7tbk-mJot9oT8siqPfg@mail.gmail.com>
Message-ID: <CAHk-=wg67HWkPawJRFffOS25CL0tjzF7tbk-mJot9oT8siqPfg@mail.gmail.com>
Subject: Re: [GIT PULL] USB/Thunderbolt/PHY patches for 5.6-rc1
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 29, 2020 at 10:20 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The I2C fix for this is in Wolfram's tree already:

It was never an i2c error.

It was an error in that commit that made a change that introduced a new warning.

It is *not* acceptable to break things and say "somebody else will fix
it up later".

If it's broken in the PHY tree, then the PHY tree is broken. It's that simple.

We don't enable compile testing that causes warnings.

                  Linus
