Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D01433DFA
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 20:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbhJSSFI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 14:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbhJSSFH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Oct 2021 14:05:07 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E801C06161C
        for <linux-usb@vger.kernel.org>; Tue, 19 Oct 2021 11:02:54 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id s64so9208349yba.11
        for <linux-usb@vger.kernel.org>; Tue, 19 Oct 2021 11:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cYy8FtQ5PJc6367yM2zsJLpHDz0zySj37WgNCxUbuek=;
        b=WcrHf5eK5l5fL2CfCWicXHdzyzov33lXjNML5E/tEZkbifyw9O8RiZ6iUZesfEwNOn
         RpKEgMnTL/3MIl3FLjGN9t7HKcwnGvxMennlSX7dGLVfwvznMoNIJN1yAkyvg3NrTfdl
         dZub7ZU+Vv7fA1wVcwqkyYwqT64pHhsxTs87uIeFNW2Xsy9HZlnHRZm8eKkbAoag+/nI
         NR+uhw38vsQP/WlPZxH1LITIIt6Rcrq3RwKy7yNfmZ+P0LkZBTY5cSO/yQ4uA3A0aBP/
         Kcx0iXaeDcvncGtLHsgBF+pS9ZPE9aNXYp/GmzxQGiYIQK3SqdOnZ7aaTieYYB+qNIfo
         JIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cYy8FtQ5PJc6367yM2zsJLpHDz0zySj37WgNCxUbuek=;
        b=hPXJUOSVpkuKgwhageTKgJ1ovnu/plbYxnlafizmYrE3JZAcy4SzwofgGsUBvN7mmF
         +QQUmGmiRwE4AReStyYOYXk8PLeVPPHJYLH39zS6Tn1Rie/731UHn+LElE52VEFJbxKL
         NjiqYy/H/P093CYrSQpyl1PYSWHT2Y/R/8Etvt0Go+98e4mnExAu3i4n5ZwTZH51Ctoj
         mMK0RElIamhFdtqxBDSa80Tbi2gaXbthZykb937XCzIZsqo2fajcBFcdzNWQlRSEDVND
         /nSPrOkOjRA5XGqsSHiAn5SsXpM6oABtCmyXNm69tFZLPGuSfbFYq7fX8TTDdv9g0GLG
         6ckw==
X-Gm-Message-State: AOAM53298hBWEIP0h4K2FD40XhsX6irTwdXyq6QW2hXA351j8dpL8qhS
        A6xv1ppIHj0C0dpdCtF5IrKJje65KfOpPnRV/NhU1U1gKAM=
X-Google-Smtp-Source: ABdhPJzXAxj7fFxF1L0wGCdaY2rdBW8sSl6zxG/ZqHXRcHMxIYpyvwckPhcS9ro6kbDSpvGGpewsz67Nf6K0UlhoaDQ=
X-Received: by 2002:a25:cc8:: with SMTP id 191mr37664032ybm.63.1634666573217;
 Tue, 19 Oct 2021 11:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211019172124.1413620-1-kuba@kernel.org>
In-Reply-To: <20211019172124.1413620-1-kuba@kernel.org>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date:   Tue, 19 Oct 2021 11:02:42 -0700
Message-ID: <CANP3RGcPFgguWnDLUegWXyu4niNHqmHCsgn=hhQPftfjD+K5fQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: u_ether: use eth_hw_addr_set()
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     balbi@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lorenzo Colitti <lorenzo@google.com>, manish.narani@xilinx.com,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 19, 2021 at 10:21 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> Commit 406f42fa0d3c ("net-next: When a bond have a massive amount
> of VLANs...") introduced a rbtree for faster Ethernet address look
> up. To maintain netdev->dev_addr in this tree we need to make all
> the writes to it got through appropriate helpers.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: balbi@kernel.org
> CC: gregkh@linuxfoundation.org
> CC: lorenzo@google.com
> CC: manish.narani@xilinx.com
> CC: maze@google.com
> CC: linux-usb@vger.kernel.org
> ---
>  drivers/usb/gadget/function/u_ether.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/f=
unction/u_ether.c
> index 85a3f6d4b5af..e0ad5aed6ac9 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -754,6 +754,7 @@ struct eth_dev *gether_setup_name(struct usb_gadget *=
g,
>         struct eth_dev          *dev;
>         struct net_device       *net;
>         int                     status;
> +       u8                      addr[ETH_ALEN];
>
>         net =3D alloc_etherdev(sizeof *dev);
>         if (!net)
> @@ -773,9 +774,10 @@ struct eth_dev *gether_setup_name(struct usb_gadget =
*g,
>         dev->qmult =3D qmult;
>         snprintf(net->name, sizeof(net->name), "%s%%d", netname);
>
> -       if (get_ether_addr(dev_addr, net->dev_addr))
> +       if (get_ether_addr(dev_addr, addr))
>                 dev_warn(&g->dev,
>                         "using random %s ethernet address\n", "self");
> +       eth_hw_addr_set(net, addr);
>         if (get_ether_addr(host_addr, dev->host_mac))
>                 dev_warn(&g->dev,
>                         "using random %s ethernet address\n", "host");
> --
> 2.31.1
>
Reviewed-by: Maciej =C5=BBenczykowski <maze@google.com>
