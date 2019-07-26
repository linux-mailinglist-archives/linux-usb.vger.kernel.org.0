Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A581976415
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jul 2019 13:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfGZLFG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jul 2019 07:05:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:58796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726000AbfGZLFG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jul 2019 07:05:06 -0400
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5361A22BE8;
        Fri, 26 Jul 2019 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564139105;
        bh=MrBs0xmKtr9WadtgrHG32oc1J0f1313yz/j3mmPEg+4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Wt0d3ANfiRT0YJMHVj+uzi+qbf/4madumAkEB6YAxYMBj+h6gYx2NJau0eWbCc1F4
         U6O6H8J8+kmfIHcF45+RCEa/Rmzu5zMqEs+eM9deV3xHIR40enIDqH6NEM++7Tz555
         lKQAUAVfw31vZAjNoUI+xwnqCKZP4rjb+RwMMYg8=
Received: by mail-lf1-f44.google.com with SMTP id u10so36787250lfm.12;
        Fri, 26 Jul 2019 04:05:05 -0700 (PDT)
X-Gm-Message-State: APjAAAU1W95ByB4204kZNfTqCDnv19uPFV7MPGMutOqt7vrXa30P7Pcd
        VlAH6qyprbpAy3zgD/8Zljyysl8QdXPbIlyT2Fk=
X-Google-Smtp-Source: APXvYqx2jXz1C2lQfmSiB2WtepMDubaM+kGqjUl7MdgMSyELmG1akDiRYzCjyI39RKjmsLKmt9OxGozJU3/8uwZIYh4=
X-Received: by 2002:ac2:514b:: with SMTP id q11mr18597910lfd.33.1564139103562;
 Fri, 26 Jul 2019 04:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190726081506eucas1p20e7e633e89529b862952fe9f783f72e5@eucas1p2.samsung.com>
 <20190726081453.9456-1-m.szyprowski@samsung.com> <20190726081453.9456-4-m.szyprowski@samsung.com>
In-Reply-To: <20190726081453.9456-4-m.szyprowski@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 26 Jul 2019 13:04:52 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeQS+f6KAUW5xkh2A7Kz9wAfQdJ5Q9aeW_NCMDbjVv=GA@mail.gmail.com>
Message-ID: <CAJKOXPeQS+f6KAUW5xkh2A7Kz9wAfQdJ5Q9aeW_NCMDbjVv=GA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: exynos: Use standard arrays of generic
 PHYs for EHCI/OHCI devices
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-usb@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Markus Reichl <m.reichl@fivetechno.de>,
        =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>,
        Peter Chen <peter.chen@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 26 Jul 2019 at 10:15, Marek Szyprowski <m.szyprowski@samsung.com> w=
rote:
>
> Move USB PHYs to a standard arrays for Exynos EHCI/OHCI devices. This
> resolves the conflict between Exynos EHCI/OHCI sub-nodes and generic USB
> device bindings. Once the Exynos EHCI/OHCI sub-nodes are removed, the
> boards can finally provide sub-nodes for the USB devices using generic US=
B
> device bindings.
>
> Suggested-by: M=C3=A5ns Rullg=C3=A5rd <mans@mansr.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos4.dtsi                | 28 +++----------------
>  .../boot/dts/exynos4210-universal_c210.dts    |  8 ++----
>  arch/arm/boot/dts/exynos4412-itop-elite.dts   |  9 ++----
>  arch/arm/boot/dts/exynos4412-odroidu3.dts     |  8 ++----
>  arch/arm/boot/dts/exynos4412-odroidx.dts      |  5 ++--
>  arch/arm/boot/dts/exynos4412-origen.dts       |  9 ++----
>  arch/arm/boot/dts/exynos5250.dtsi             | 16 +++--------
>  arch/arm/boot/dts/exynos54xx.dtsi             | 18 +++---------
>  8 files changed, 22 insertions(+), 79 deletions(-)

Looks ok. I see it depends on driver changes so I will pick it up
after the driver hits mainline.

Best regards,
Krzysztof
