Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB6514D029
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2020 19:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbgA2SLs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jan 2020 13:11:48 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42982 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgA2SLr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jan 2020 13:11:47 -0500
Received: by mail-lj1-f195.google.com with SMTP id d10so338776ljl.9
        for <linux-usb@vger.kernel.org>; Wed, 29 Jan 2020 10:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=02ZRS+PX7FQYAeZ4yNizHXrsol3AHhSPPT78jnWNZSI=;
        b=QLAygB4qtDxvH7s7qkN9dHmEs4g1BPG63djXzdzgACGYT42ynfm9s9Lb6wl6JEcOYx
         VHqjFnJu+fdebeORwwd797eZtr0k+l99ShChTTRKnqrNDUTgLoQC5F0yuP+ecv2VagFU
         TSrC4G9MN5OF3GeHvZjnu2QPdx+V3So5512Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=02ZRS+PX7FQYAeZ4yNizHXrsol3AHhSPPT78jnWNZSI=;
        b=MnRl7Cw3SM1a/gE6Dj4jNgjFm3DF9nQDmE9XPGvEYX/NXdyE63eVI+nMNHAX2MSX99
         UT3Kch0W/O4yNXOHBSa4LhBRs0yPFbizkEqBitzGn/p1gooEG2MCLqspTGYq8rFwAr9I
         UL/QaoutE/UsGfdeGAZmnOEqn6lCgGNW6yCbCvGQ8DsBu+rKPsuXfJNM9JIsE6jCgdWp
         MSkUuA4MNOsM3kHXzhb7tVjlxEYsHCLzmcLlCcBXi/Meq/Ufwu8JL46MgR6U8iOnMEt9
         e5+Q+ha17AQihWRu8ig0xj/jWBsqz7O65koM3/1HB8d0qreMPtxcW854zKztmGSab7kF
         pQvA==
X-Gm-Message-State: APjAAAU0GEGMPq+ou8yXMDk8oZJnv29XN7t4k0ILdLf0M3e15LsUogF9
        lBQFQvaQYtcZ5aOmvvqivRCEBuu3CaE=
X-Google-Smtp-Source: APXvYqzMPJ7B/L6FzNPQuMhhi25RFEvuJmTxn8TBGABGSGFb6Kgta+qvgKUIrTDu66Vp4Q/5EtggLQ==
X-Received: by 2002:a05:651c:20f:: with SMTP id y15mr242789ljn.7.1580321504721;
        Wed, 29 Jan 2020 10:11:44 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id l7sm1422703lfc.80.2020.01.29.10.11.43
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2020 10:11:43 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id f24so358514lfh.3
        for <linux-usb@vger.kernel.org>; Wed, 29 Jan 2020 10:11:43 -0800 (PST)
X-Received: by 2002:a19:c7d8:: with SMTP id x207mr305234lff.142.1580321502988;
 Wed, 29 Jan 2020 10:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20200129101401.GA3858221@kroah.com>
In-Reply-To: <20200129101401.GA3858221@kroah.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 29 Jan 2020 10:11:26 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgwBfz0CtAFZMDy=A_Wz0+=dzrfWWiHESUD9CxnV=Xyjw@mail.gmail.com>
Message-ID: <CAHk-=wgwBfz0CtAFZMDy=A_Wz0+=dzrfWWiHESUD9CxnV=Xyjw@mail.gmail.com>
Subject: Re: [GIT PULL] USB/Thunderbolt/PHY patches for 5.6-rc1
To:     Greg KH <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 29, 2020 at 2:14 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Here is the big USB and Thunderbolt and PHY driver updates for 5.6-rc1.

Hmm. This actually causes a new warning even before I start building it:

  WARNING: unmet direct dependencies detected for I2C_S3C2410
    Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
    Selected by [m]:
    - PHY_EXYNOS5250_SATA [=m] && (SOC_EXYNOS5250 || COMPILE_TEST
[=y]) && HAS_IOMEM [=y] && OF [=y]

and the cause seems to be

  203b7ee14d3a ("phy: Enable compile testing for some of drivers")

where PHY_EXYNOS5250_SATA now has a

  depends on SOC_EXYNOS5250 || COMPILE_TEST
  depends on HAS_IOMEM
  depends on OF

and then blindly does a

  select I2C_S3C2410

without having the dependencies that I2C_S3C2410 has.

How did this ever pass any testing in linux-next without being
noticed, when I noticed within five seconds of pulling it? It
literally warns immediately on "make allmodconfig".

The warnings happen during the build too, as it does the silentconfig.
So I'm not sure how this was missed.

Stephen, does linux-next perhaps miss these config-time warnings?

I have partially reverted that commit in my merge (removing the "||
COMPILE_TEST" for that PHY_EXYNOS5250_SATA entry) because warnings are
not acceptable.

               Linus
