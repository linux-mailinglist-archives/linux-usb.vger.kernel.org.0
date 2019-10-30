Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35EC5EA2B9
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 18:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfJ3Rqv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 13:46:51 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:38470 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfJ3Rqu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 13:46:50 -0400
Received: by mail-qk1-f193.google.com with SMTP id e2so3652156qkn.5
        for <linux-usb@vger.kernel.org>; Wed, 30 Oct 2019 10:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ucIocynurZX+WNdITziqx8HGpkQurBpCPdDOY5bggKY=;
        b=Kmt9W75bDia/67F5McEm1WiU5E4DN8VImX7goNG/Bo6e4D5tHa+tAZJkDH2NU43FVe
         3DWWkjAJXFZnq7XUPsZkpljuRahXrwx9o8AOj4eeBX5l3/gN5pHZmyagMT/rjEVc5JBq
         an/saC0K7/1YZQEH7jwv8cwP0bq7T40ydmzOTCQqTpPu87m6HwvU35uealADV1t24Ewm
         c2kfJk9fWPmqqVct25WKo1PjuQ/PXcqumrbdoimx5dO73UFwxAvlr/MBqZhWYJ3DlyNk
         0/w3dDViid0yiroGYhiuy8BZkI+kSJotM+pwDzqxWPRPvsj9H9UmuZ/bcd2g+rtLz52X
         VUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ucIocynurZX+WNdITziqx8HGpkQurBpCPdDOY5bggKY=;
        b=M9tFdQvqqA44AOGfG45GwX+LJt9Ec82l/j3rgJqQOlPX+Axv46ebxprCz4bcMfqCM3
         zjDRsxAcC1Z86c3c1elqkCEOspdkNoApfe8MvZvxSYlV0a0n6xcMTAX1yPxuWlSmjp/Q
         HnnLCX3ciKHK+Nmiz7F43SZNFQ+vW5eEkAFi0ok3WZy6d+JA1COL1pKzyVraGCa4MFTQ
         PBkyF/xk549GBPY0XAy9YQHwYKHD4EhGokhw+do2iOgLVlQgQM0D6TuGdVotV4teepyB
         A1xlCPw2XhFjAb6dfL5ko6AJmKqaygNnzoMeRrLK5G9iOZD4j4xq14CwHpUqFVRodltt
         QrwA==
X-Gm-Message-State: APjAAAWryJHEY/Mao9l25189pDFtO04zJUzEyTYDGjCmPIwnt107bl68
        eSNff3CgfiSTEFQz21EbvT/8Axa/3ToZ0VbTvic=
X-Google-Smtp-Source: APXvYqy85loESKPADojLzmsz9Pewy7Ser5st4huiypUxW1NmyHp+Pv+dfWbrl+BzcoW6eu7hRJSeTwYpossOBMT6cWg=
X-Received: by 2002:a05:620a:237:: with SMTP id u23mr1186097qkm.484.1572457609542;
 Wed, 30 Oct 2019 10:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191028182254.30739-1-pgwipeout@gmail.com> <20191028182254.30739-2-pgwipeout@gmail.com>
 <10419898.gYlDFaIxON@phil>
In-Reply-To: <10419898.gYlDFaIxON@phil>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 30 Oct 2019 13:46:31 -0400
Message-ID: <CAMdYzYqex=xoXR+Xhg=LNwEa0hobbSghRzj8AkmVOSNhp7x1-A@mail.gmail.com>
Subject: Re: [PATCH 1/5] phy: rockchip: add inno-usb3 phy driver
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
        katsuhiro@katsuster.net, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 30, 2019 at 4:15 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Am Montag, 28. Oktober 2019, 19:22:50 CET schrieb Peter Geis:
> > Add the rockchip innosilicon usb3 phy driver, supporting devices such as the rk3328.
> > Pulled from:
> > https://github.com/FireflyTeam/kernel/blob/roc-rk3328-cc/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>
> What happens on plug - unplug - plug?
>
> I remember what kept me from pushing the usb3 stuff for rk3328
> was the usbphy breaking hotplug after the first unplug.
>
> Did this get fixed?
>
> Thanks
> Heiko
>
>
It seems to have been corrected, at least partially.
The hotplug issue may have been resolved by [0].

On my rk3328-roc-cc board, both USB2 and USB3 work correctly for
hotplugging with this driver.
I did encounter some odd behavior with the USB2HOST port, where it
stopped reading FS devices when this was loaded.
I'm wondering if we have a common clock problem or some other
undocumented shared dependancy.

Robin encountered some odd behavior when unplugging a USB3 device, the
controller didn't recognize it for a while.
I don't have that problem, but I don't know what board she's using.

[0] commit fb903392131a324a243c7731389277db1cd9f8df
clk: rockchip: fix wrong clock definitions for rk3328
