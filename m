Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D78D87420CA
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jun 2023 09:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbjF2HOL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Jun 2023 03:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbjF2HNl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Jun 2023 03:13:41 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BA102D78
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 00:13:37 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-634f59e7d47so3372806d6.2
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 00:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688022816; x=1690614816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l5XW0exCS9z+Hy0fRQZ5/K6ds6wj/L09NJ5d7OC64KA=;
        b=lU7gTej3xVjrNBXTU09iLSzYWoNF/qevLHKMhZxbv/Kj2VOUrkOIag5U5I4UPmFSrZ
         Y3+p/RAcucZjt8wYaUzbdpsL7ZV6cuJAJL+T72IlQz5+0JnQGpCbRP2/TUxJHok9AwqA
         Bfc4Y3bGDcTbZ2t34F7AT8sOAi10rC6wekEjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688022816; x=1690614816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5XW0exCS9z+Hy0fRQZ5/K6ds6wj/L09NJ5d7OC64KA=;
        b=R/bSTJY57DVzaOaAaGajiPptfr7Xmp9j4R4sirWvBxuh/GxqfVRi3TLjQNW3Zuy5KV
         CaPlq9tCU8BfeAyoLX39hJ+5eGCIq2hZGadY0PQshTeK9DJlQKcymb2gFpogek83TVn1
         Dn51EHv/5Ic0nIGgYTYE/+JjKzitai+PycEcAygxqO87bZd1iGwB+CRJOv9jKfS/mGUj
         xRdDfY3i9gyTQTg+SFBVTwBkQKwmsVr160aD1i7cvk86coOiTOwDTrXp/ze3r1qj74BI
         AwM2+uv4y/y4SuoWKb31Xgt3WlP3nxltJcH/HuFM/6Yoh6hKw3Mi9cACxsOukpGnHasx
         urgg==
X-Gm-Message-State: ABy/qLZPK4s/BrcFyne9qUy8SkxZEO+qOr3z43LfxeQMrALrHvjW1ysz
        d7af6xeGwceftj3KD6FMm1IWC7/Op6vordQqLRoBsA==
X-Google-Smtp-Source: APBJJlH6IhCAwOJ9ESyr+vQ99Ib5/+4xcolq2ACNnlFclhUoIgvnL59FcQXKbcULBgai5+kcSK6sDw==
X-Received: by 2002:a05:6214:29eb:b0:636:2169:4298 with SMTP id jv11-20020a05621429eb00b0063621694298mr1214692qvb.1.1688022816221;
        Thu, 29 Jun 2023 00:13:36 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com. [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id l12-20020a056214028c00b005fdbcab3065sm5369082qvv.72.2023.06.29.00.13.34
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 00:13:35 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-635f293884cso3328136d6.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 00:13:34 -0700 (PDT)
X-Received: by 2002:ad4:5c47:0:b0:635:f546:83c4 with SMTP id
 a7-20020ad45c47000000b00635f54683c4mr8987873qva.54.1688022814565; Thu, 29 Jun
 2023 00:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-mtk-usb-v1-1-3c5b2ea3d6b9@chromium.org>
 <CANiDSCsAgD33gMk9-CTGHuUv_b4KfRnO02ETEt6jFtQvw+6cag@mail.gmail.com> <ZJystxdl0jVoe5b6@google.com>
In-Reply-To: <ZJystxdl0jVoe5b6@google.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 29 Jun 2023 09:13:23 +0200
X-Gmail-Original-Message-ID: <CANiDSCu3WOqK9wdLDXmW+zbckq15gmxKjtFA4Aghv6uoidO_3Q@mail.gmail.com>
Message-ID: <CANiDSCu3WOqK9wdLDXmW+zbckq15gmxKjtFA4Aghv6uoidO_3Q@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci-mtk: set the dma max_seg_size
To:     Zubin Mithra <zsm@chromium.org>
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Zubin

On Wed, 28 Jun 2023 at 23:57, Zubin Mithra <zsm@chromium.org> wrote:
>
> On Wed, Jun 28, 2023 at 11:04:20PM +0200, Ricardo Ribalda wrote:
> > On Wed, 28 Jun 2023 at 23:00, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > Allow devices to have dma operations beyond 64K, and avoid warnings such
> > > as:
> > >
> > > DMA-API: xhci-mtk 11200000.usb: mapping sg segment longer than device claims to support [len=98304] [max=65536]
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > Reported-by: Zubin Mithra <zsm@chromium.org>
>
> Should this be cc'd to stable@ as well?

Not sure, in most of the cases this is "just" a warning fix. Let the
maintainer decide:

Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
Cc: stable@vger.kernel.org
