Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E385714D14B
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2020 20:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgA2Tmh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jan 2020 14:42:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:36910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726183AbgA2Tmh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Jan 2020 14:42:37 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D186D206D4;
        Wed, 29 Jan 2020 19:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580326956;
        bh=YrONd6rD40U8Mex7x/vOc2QZ9yRG98Ce7Hq82CFeTeE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BMOnfzI9mRtQMBVe/AXpjgfl6rqq1DMN638afHGSXz0fOCltDUPQAYybZZkAzWq2R
         iHlTkM8OtvJRV6GXMOw2FJaIfGmRXGf4nDhqn001kfd67kXrKS80JR/d7CdWYAPMM7
         t41bW5aPDoFBguU2wZY1CE8AsmZM4dYr21FhP/wU=
Date:   Wed, 29 Jan 2020 20:42:33 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB/Thunderbolt/PHY patches for 5.6-rc1
Message-ID: <20200129194233.GA578620@kroah.com>
References: <20200129101401.GA3858221@kroah.com>
 <CAHk-=wgwBfz0CtAFZMDy=A_Wz0+=dzrfWWiHESUD9CxnV=Xyjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgwBfz0CtAFZMDy=A_Wz0+=dzrfWWiHESUD9CxnV=Xyjw@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 29, 2020 at 10:11:26AM -0800, Linus Torvalds wrote:
> On Wed, Jan 29, 2020 at 2:14 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > Here is the big USB and Thunderbolt and PHY driver updates for 5.6-rc1.
> 
> Hmm. This actually causes a new warning even before I start building it:
> 
>   WARNING: unmet direct dependencies detected for I2C_S3C2410
>     Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
>     Selected by [m]:
>     - PHY_EXYNOS5250_SATA [=m] && (SOC_EXYNOS5250 || COMPILE_TEST
> [=y]) && HAS_IOMEM [=y] && OF [=y]
> 
> and the cause seems to be
> 
>   203b7ee14d3a ("phy: Enable compile testing for some of drivers")
> 
> where PHY_EXYNOS5250_SATA now has a
> 
>   depends on SOC_EXYNOS5250 || COMPILE_TEST
>   depends on HAS_IOMEM
>   depends on OF
> 
> and then blindly does a
> 
>   select I2C_S3C2410
> 
> without having the dependencies that I2C_S3C2410 has.
> 
> How did this ever pass any testing in linux-next without being
> noticed, when I noticed within five seconds of pulling it? It
> literally warns immediately on "make allmodconfig".

linux-next was fine as the fix was in the i2c tree.  Sorry for not
realizing it here as well, it didn't show up on my test builds as I
wasn't doing 'allmodconfig' for USB stuff.

If it's any consolation, it was a lot worse, I did take some fixups for
other issues like this that came in through here :)

But I should have caught this as well, sorry, and thanks for merging.

greg k-h
