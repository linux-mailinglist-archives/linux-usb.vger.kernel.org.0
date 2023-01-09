Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9C26624E6
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 12:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234931AbjAIL65 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 06:58:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237100AbjAIL6o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 06:58:44 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D91DE84
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 03:58:43 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id ud5so19461034ejc.4
        for <linux-usb@vger.kernel.org>; Mon, 09 Jan 2023 03:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sqDs9qTUrNdkIJNHtVrZFUgegfVtGip7cDZN8M5e52o=;
        b=B8gGu6H+YyKIfaow+EMnxwBuwrrqsrN/8H39BQLOyScxCsnOqsRIz6OyVNSRVcy3x9
         lsmJFOEUlfomf/M8dZdD9vGudb94xQjhaPF0cc+exXwuT93G9epNg1tcDym7o5G6pYnD
         Vi8u0NbKnoFZQNfhXHCIiByX5QZeBN4fmq8xI357ZoQpg5bpRWRgnPkNiOWjr/9/KQRP
         TReCX33OgEC9mvzNIxXy14Pjv/KsqXDaiUE4UIsJb282p0pQ/YqAMyLxAbgK/SWW+r1j
         zJAFBJJSj3nTWvFw1fNxNqyieVCvilWDlKGHpccB7iX6oQXreTNCZy8pNOrG8n/i8lS4
         efqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqDs9qTUrNdkIJNHtVrZFUgegfVtGip7cDZN8M5e52o=;
        b=v3NV2FxU2dJmUCwoKo8a/FdZhhn7vMWQ4nzum33vrU97R2/pBbBnOStWqB1ss45mLO
         +fKhvEME/5zRbYgzDW5uzH5tMWGuWicWuHnopDzywlp3cGx6fkQe6sK7CQJeaZsftjUX
         yHi5qHMYxLZEnExcdmDGfv5NXacwpEpb/NBUnAbkEUyFmZCc0er1ghZ3xE7tFciAMtAa
         x2qolBO9e8WVaRPeotI9bTppuhdKUixllRKsXwfY6C65CGeRvsPN3/6sA5y9yFkp4gxd
         aVc0FGlfG5uJyhSO5q5j640t+niRP3d3S3WlPT4ACEA+E54kNfhd/FPrqs78Nl4hgFwS
         xWiw==
X-Gm-Message-State: AFqh2kok2snsgFTS+yyMJ6891EKlb9SpuAAeQ+mG9cETAg/m632/k6il
        fGZ7xWPQ6JIUf+6N4tb17m7Gkkv+b7niP75FDh/D5v8tdaw=
X-Google-Smtp-Source: AMrXdXtG/g3MHJWETjGCEJo0VaFaIPqZJzYhrfBHXK6eNogAM5xFo5cV+kBJixCcZttBWgo1U/VBFnbcip69YvNb000=
X-Received: by 2002:a17:906:f150:b0:84d:2374:4c37 with SMTP id
 gw16-20020a170906f15000b0084d23744c37mr1142030ejb.330.1673265521413; Mon, 09
 Jan 2023 03:58:41 -0800 (PST)
MIME-Version: 1.0
References: <1663210188-5485-1-git-send-email-zenghongling@kylinos.cn>
 <fa0556e5-e154-a4e6-6b18-4996a01d2f10@gmail.com> <Y2uDnUQKCDGzioJN@kroah.com> <2022111215445443712314@126.com>
In-Reply-To: <2022111215445443712314@126.com>
From:   Juhyung Park <qkrwngud825@gmail.com>
Date:   Mon, 9 Jan 2023 20:58:29 +0900
Message-ID: <CAD14+f3ZHZ8X6CmUf+FcBZ0fmP-G7qi1phVqmCn_KdZJJJgu=Q@mail.gmail.com>
Subject: Re: Re: [PATCH v6 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
To:     "zhongling0719@126.com" <zhongling0719@126.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLY,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 12, 2022 at 4:46 PM zhongling0719@126.com
<zhongling0719@126.com> wrote:
>
> Hi:
>   This error not happend on all RTL9210,The uas blacklist only for on sale device(0x0bda, 0x9210).

0x0bda is VendorId for Realtek,
0x9210 is ProductId for the entire RTL9210 enclosures.

This patch blacklists UAS for all RTL9210 enclosures.

>
> Thanks!
>
> zhongling0719@126.com
>
> From: Greg KH
> Date: 2022-11-09 18:40
> To: Juhyung Park
> CC: Hongling Zeng; stern; linux-usb; usb-storage; zhongling0719
> Subject: Re: [PATCH v6 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
> On Mon, Oct 31, 2022 at 03:17:48PM +0900, Juhyung Park wrote:
> > Hi,
> >
> > I'm speaking from my own experience but RTL9210 is arguably the most
> > reliable NVMe-to-USB converter available.
> >
> > Compared to solutions from JMicron (multiple revisions) and ASMedia, RTL9210
> > gave the lowest power consumption (from implementing proper power management
> > commands) and the least headache.
> >
> > I personally own multiple enclosures and not one gave a single UAS error
> > from multiple platforms (Android, Intel, AMD) for years, but with this
> > commit now, it effectively disables UAS for all RTL9210 enclosures.
> >
> > Would it be possible to apply this quirk only to a specific firmware
> > (range)? RTL9210 have a lot of possible firmware combinations: https://www.station-drivers.com/index.php/en/component/remository/Drivers/Realtek/NVMe-USB-3.1/lang,en-gb/
> >
> > RTL9210 was available since 2019 and the fact that this quirk came up this
> > late leads me to believe that this is not a widespread issue and it'll be a
> > shame if all of RTL9210s are blacklisted from UAS with Linux from now on :(
> >
> > If any additional information is required, please let me know.
>
> Can you send a revert of this commit so that we can fix this up?
>
> thanks,
>
> greg k-h
