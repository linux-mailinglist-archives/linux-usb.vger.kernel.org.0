Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3CAA8924
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 21:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730966AbfIDPB3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 11:01:29 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43757 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729944AbfIDPB3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Sep 2019 11:01:29 -0400
Received: by mail-pg1-f193.google.com with SMTP id u72so7204765pgb.10
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2019 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Xex7etIT/0fkUXRl7r86f55ZrYpRqHqk4QSmf2GAfI=;
        b=g/uRhfteGC7P35ClAZdb6Ako4E5LJ9VEa9cilLeR5nrpghxyD/YSy/LkAZ+X8UOL6r
         7ifz5849401tonSnZ2R45oFP92+G1cipMy45yYllgf9vDjQ/nOCX4rCHxADZZxaPpwv0
         ZbGaY0qmjKl2r72oHDKhWfEhG4KGIjxkb+DCuHuWCHTzqR1MM290mt11Z0yxElOKNNR9
         2XTwigcCV8jV6TEEvsUsHxfnotCi+7UX+5U/nEKz6rArWAIi7NHczjiG72rzu+92Pw1w
         ZLismxgIcm1g59FpgGzNVSeokK+pxVSvhFky+ut/68QZBNS9lrlOf6UNy+3tL/uUG6Lq
         XJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Xex7etIT/0fkUXRl7r86f55ZrYpRqHqk4QSmf2GAfI=;
        b=IcVb3HveaHddvCfwZ0HDckb7wJnLWiJe8f4nsA58qBYBBNDxUXP21ElppGUKSzMpz+
         H2/xPH8FWYhCJJ1FHfcHry/AY4/LK8VflsLXdaCApgQf4BaVdEmXitXgICRUo+N3enQR
         9n5NwBqhimS8F34UrAgq5ZGE+Pu4d8S7ppNGEMroMF5/0VyY/sgUvQkc1+OeFLddXTzg
         ysjbRVxh2LoICs7+lIYgDCpEJpPYlo6d8PQe6RPBTpzyA9oJZ3odfGCKBJUjFS0HY7i2
         XVUkpkPm8qAMd1izLo2VKG8rUl3rXzeQb40AFJRE/Ld/uZC8Gtob/CtqzurQKWfkG6sr
         sUdA==
X-Gm-Message-State: APjAAAVtEkehSPPOxhiVTMgfp+W5dmbIvp/qYU4ZjwsekpdTf2Y9Nvkw
        ie/YAv+71BnZMZby2054SSDdsdtVoQz05TyAbNOCyg==
X-Google-Smtp-Source: APXvYqzLYJv+Lwt/A5leCOoVilE1RqQBcqLI9tYaj7JHpseqTQZTHXiXYWeCgISPl4gi0q5KIB9R0z9Sk8nT0LfGo2w=
X-Received: by 2002:a62:1cd2:: with SMTP id c201mr27441304pfc.51.1567609288199;
 Wed, 04 Sep 2019 08:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b580440591ac8df5@google.com> <Pine.LNX.4.44L0.1909041038340.1722-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1909041038340.1722-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 4 Sep 2019 17:01:17 +0200
Message-ID: <CAAeHK+xegKOayZw+kvw7ndA4v6Fy77rNM_VQnufZWXEHSjoqhg@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in usb_reset_and_verify_device
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+35f4d916c623118d576e@syzkaller.appspotmail.com>,
        Thinh.Nguyen@synopsys.com, dianders@chromium.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        jflat@chromium.org, Kai Heng Feng <kai.heng.feng@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, malat@debian.org,
        mathias.nyman@linux.intel.com, nsaenzjulienne@suse.de,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 4, 2019 at 4:41 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 3 Sep 2019, syzbot wrote:
>
> > Hello,
> >
> > syzbot has tested the proposed patch but the reproducer still triggered
> > crash:
> > KASAN: slab-out-of-bounds Read in usb_reset_and_verify_device
> >
> > usb 6-1: Using ep0 maxpacket: 16
> > usb 6-1: BOS total length 54, descriptor 168
> > usb 6-1: Old BOS ffff8881cd814f60  Len 0xa8
> > usb 6-1: New BOS ffff8881cd257ae0  Len 0xa8
> > ==================================================================
> > BUG: KASAN: slab-out-of-bounds in memcmp+0xa6/0xb0 lib/string.c:904
> > Read of size 1 at addr ffff8881cd257c36 by task kworker/1:0/17
>
> Very sneaky!  A BOS descriptor whose wTotalLength field varies
> depending on how many bytes you read.
>
> This should fix it.  It's the same approach we use for the Config
> descriptor.

Nice, core USB bug :)

Can this potentially lead to something worse than a out-of-bounds memcmp?

>
> Alan Stern
>
> #syz test: https://github.com/google/kasan.git eea39f24
>
>  drivers/usb/core/config.c |   12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> Index: usb-devel/drivers/usb/core/config.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/core/config.c
> +++ usb-devel/drivers/usb/core/config.c
> @@ -921,7 +921,7 @@ int usb_get_bos_descriptor(struct usb_de
>         struct usb_bos_descriptor *bos;
>         struct usb_dev_cap_header *cap;
>         struct usb_ssp_cap_descriptor *ssp_cap;
> -       unsigned char *buffer;
> +       unsigned char *buffer, *buffer0;
>         int length, total_len, num, i, ssac;
>         __u8 cap_type;
>         int ret;
> @@ -966,10 +966,12 @@ int usb_get_bos_descriptor(struct usb_de
>                         ret = -ENOMSG;
>                 goto err;
>         }
> +
> +       buffer0 = buffer;
>         total_len -= length;
> +       buffer += length;
>
>         for (i = 0; i < num; i++) {
> -               buffer += length;
>                 cap = (struct usb_dev_cap_header *)buffer;
>
>                 if (total_len < sizeof(*cap) || total_len < cap->bLength) {
> @@ -983,8 +985,6 @@ int usb_get_bos_descriptor(struct usb_de
>                         break;
>                 }
>
> -               total_len -= length;
> -
>                 if (cap->bDescriptorType != USB_DT_DEVICE_CAPABILITY) {
>                         dev_warn(ddev, "descriptor type invalid, skip\n");
>                         continue;
> @@ -1019,7 +1019,11 @@ int usb_get_bos_descriptor(struct usb_de
>                 default:
>                         break;
>                 }
> +
> +               total_len -= length;
> +               buffer += length;
>         }
> +       dev->bos->desc->wTotalLength = cpu_to_le16(buffer - buffer0);
>
>         return 0;
>
>
