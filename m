Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA7C7138A5
	for <lists+linux-usb@lfdr.de>; Sun, 28 May 2023 10:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjE1IGi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 May 2023 04:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjE1IGh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 May 2023 04:06:37 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B1F9F
        for <linux-usb@vger.kernel.org>; Sun, 28 May 2023 01:06:35 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2af30d10d8fso22382541fa.0
        for <linux-usb@vger.kernel.org>; Sun, 28 May 2023 01:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685261194; x=1687853194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhJ+NmtjqQVsiglYLbMDOsXosZtuWftRpbKOsABWKYk=;
        b=NqNOiuZyfsFDQ0dsWFl1J09BPjKv1BxX/5Dr5Mkqkn7hNDVxcvLnArsvYrW6PSDdli
         pB30X/mTgI81m4cAeBjBB7yJxeeNfZ6eeeE9abpisRTGbty/WKhN+5hqjYOAF+WEmIvN
         5QayZFOYSF+UPVJkzorjNyKI9NYWKbK7XkqYZwKW2MLhpq4giMvVSqRnQbtIlTiObQ/j
         pnYGoMhqFHBUT+PkLjh88KpNpK4sT7kxVXjTZBuYefVK0ya41I0HCHR9/Qf/kUPK7qDZ
         2HViDglTFpUA+kzdSHdKttwEXjbgqvvBYnVJ0ZKf3T3vvvOKhq0/A7SvAZorNVhhA6FI
         U0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685261194; x=1687853194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rhJ+NmtjqQVsiglYLbMDOsXosZtuWftRpbKOsABWKYk=;
        b=h3kGMNOgpwtlBwY5SmM/45GYjppfHoQndnCVkKDhsr2j1hspIs9nfIlnu1PIQLmRdn
         rFr5tZwMprQM/MZ+SIAelSCKRtVqP/j1n39VpBdrL9vfVH6EqVTDtIV5mP5taDjPC0Ct
         Ut87fk6sWh43RRJoA35I0KGx6oDrC8xOaWzrjGQuHCaxXV5KD0K/wAmEHYRTDPlvolY6
         rkeBOcguPThggMJz5Juv1g817ZpEplzthvwcRzGssu44Doie+BndFKZmo5O/gOuWT1cw
         fUkUqQrWXjL5e3PoHw955oEK3Om32v5uJELcY9APzCQ/3c0B6DbxaCwK2PAdbO6mSxf3
         L08A==
X-Gm-Message-State: AC+VfDwoA4Geqto7xczDqI4+D7S159+VD+vGaHcf0MoxaV0ZpsON53Dd
        UQ2LBoRu9qheXx+j7IZlTOVs2GY+LaM6sR9rXhVh/4imcfs=
X-Google-Smtp-Source: ACHHUZ66hsu27cTCOyTWo23yN0i9y3BQlX47VRolgQsJoU5Y+6OAiT2nZMYScUA2xcoq5zesH5d+1CZlzs80vjbcaDg=
X-Received: by 2002:a2e:8944:0:b0:2a9:b6fe:18b3 with SMTP id
 b4-20020a2e8944000000b002a9b6fe18b3mr2580230ljk.19.1685261193819; Sun, 28 May
 2023 01:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230525090124.11614-1-mika.westerberg@linux.intel.com> <20230525090124.11614-3-mika.westerberg@linux.intel.com>
In-Reply-To: <20230525090124.11614-3-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Sun, 28 May 2023 11:06:16 +0300
Message-ID: <CA+CmpXvpFQdgCRxUdRZxkqmwHZ5YQtsaat5+Ajooz8QGxu8wpg@mail.gmail.com>
Subject: Re: [PATCH 2/2] thunderbolt: Do not touch CL state configuration
 during discovery
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Koba Ko <koba.ko@canonical.com>,
        Imre Deak <imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 25, 2023 at 12:01=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> If the boot firmware has already established tunnels, especially ones
> that have special requirements from the link such as DisplayPort, we
> should not blindly enable CL states (nor change the TMU configuration).
> Otherwise the existing tunnels may not work as expected.
>
> For this reason, skip the CL state enabling when we go over the existing
> topology. This will als keep the TMU settings untouched because we do
                                ^ also

> not change the TMU configururation when CL states are not enabled.
                                     ^ configuration

For the both patches in the series:

Acked-By: Yehezkel Bernat <YehezkelShB@gmail.com>
