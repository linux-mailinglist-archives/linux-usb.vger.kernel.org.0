Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52314704254
	for <lists+linux-usb@lfdr.de>; Tue, 16 May 2023 02:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240909AbjEPAfL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 20:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbjEPAfJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 20:35:09 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9E683E2
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 17:35:08 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-965ac4dd11bso2686838566b.2
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 17:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684197306; x=1686789306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlyewVsl07mfZ/ig/ivXHrl1wbeTT3E/NvZX1X8th8I=;
        b=qz4H5xm707Ayn04kPAWj9pkL2iV1WzKEyzrUstuKgtPnOqGRDi2y6/v85QFnWJE4xn
         WNaXJj1yShGXbhJ+QdccYReyxrktXCN0/JOeoBcyGBVeyugdaHeTNlv2OgTvJ+6zr+GL
         i9zlcXPcZiEtogSz2YNpzjidO4g3kqrui13irRoxPiJ8F2V/4hV2hraO8yhHgsXvx1cq
         7Wem2oVWeccaMmGAKe3sA/LhlTZluOp82+njCzceFH6oKzzXeuOXPaO2ggkcUwK//H/P
         WlgFo6UwlOQ8XW/fRIqybrd829vUqp7hDq8v3BMBnfU7tEMmo5F7/A8unHwT1GPHO+r+
         g3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684197306; x=1686789306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlyewVsl07mfZ/ig/ivXHrl1wbeTT3E/NvZX1X8th8I=;
        b=mE1GES1rR+qK491wB6n/DNHMIZ3sDgtJmSOgWQbu+8XILZqBJQo/K26AaU6png+030
         LMgSWi+wUjRHeGznnKKRnsRbl2BAnkiqFkjNZ6UVSl+Nz5Ep59+4QgEW5PMuasiSLDeU
         SXCVBgd3SGH83eR4BiKCMGJYTr/fqEYTgl7jG/4rqXWHLxvJnNZDgsZrDKfR9M7v5qXZ
         IefGhT7N8shNETh+ws26Vkl0MSxVu1fZI8pCwr1TtYyjQpkr2uxwAjWeNLDTiGEfyVJ1
         Rqs1L9fzs1hp7v1dn4nyvw8FgAbcEPdMpfOM1BP6reC3GnoNlXzjT0tJ+nJ2Cfnj2I/F
         GKZw==
X-Gm-Message-State: AC+VfDwDYKrCoTreNXBZXo/sOcl4LwIAWywG4+ai66bCscsGq12OCjrg
        WM2serCHmxq5Z5QAW0ME6sXFwvNOIA7EfX7FR/rgDpj8jjoVtf22ZPR+utQTwUA=
X-Google-Smtp-Source: ACHHUZ7qaEmDr91lp4M2/EvTukiyFZ2ZyXgG9tCfJgd/BJ8hwf3FEAb63o9IW08v9ldzY5kIUKgDtsvI60pdrPLKqOo=
X-Received: by 2002:a17:907:d86:b0:953:42c0:86e7 with SMTP id
 go6-20020a1709070d8600b0095342c086e7mr31242838ejc.4.1684197306358; Mon, 15
 May 2023 17:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAMHf4WKYzmmqO+7AsUBo+d8AHLKFXugxwh__NYi9grQAJk7VBA@mail.gmail.com>
 <47244f7e-feb5-4958-be14-7fd9f0814566@rowland.harvard.edu>
 <CAMHf4WL9dOWiw-+V2DQeQ=3jxmk3LHg5ONdWSwcp3Gx0AD17yg@mail.gmail.com>
 <20230420172011.GF21943@pendragon.ideasonboard.com> <0610f776-44c8-4372-975b-52c2a1f0af8d@google.com>
 <20230506125317.GD17474@pendragon.ideasonboard.com> <CAMHf4WLMAjigKypYho24TqeuWx6Y9-LWjq2cj_5ad31pqsKDzg@mail.gmail.com>
 <20230509002143.7x5zo6bohvn5dyb2@synopsys.com> <CAMHf4WLzx3Bj-TR1ZrqsW1tfY+WUtgTt8TVObOFnkNcx2Pc9kw@mail.gmail.com>
 <20230509223526.5e6oqqri3mhwc34l@synopsys.com> <20230509224241.vvylagjkqbwo4hbk@synopsys.com>
 <c68249a8-4e22-abd9-5c7c-7e8b7f383898@google.com>
In-Reply-To: <c68249a8-4e22-abd9-5c7c-7e8b7f383898@google.com>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Mon, 15 May 2023 17:34:54 -0700
Message-ID: <CAMHf4WLxxWM+DQz6=CEff34WcfX3s1cQoSKkv1qgJvJSMYmDQg@mail.gmail.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 15, 2023 at 5:29=E2=80=AFPM Avichal Rakesh <arakesh@google.com>=
 wrote:

>
> TL;DR: Naively queueing up 0-length requests as fast as possible has the
> consequence of delaying the entire stream by ~8ms, but does not seem to b=
e
> delaying frames individually any more than before. Changing the number of
> 0-length requests has very little consequence on the stream, but increase=
s
> the chances of missed ISOCs.
>

Dan and Laurent, could you review
https://lore.kernel.org/20230508231103.1621375-1-arakesh@google.com/ when
you get the chance?

Thank you!
Avi
