Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE02709E5F
	for <lists+linux-usb@lfdr.de>; Fri, 19 May 2023 19:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbjESRkQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 May 2023 13:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbjESRjz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 May 2023 13:39:55 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3857A1BC
        for <linux-usb@vger.kernel.org>; Fri, 19 May 2023 10:39:45 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-96aae59bbd6so669921166b.3
        for <linux-usb@vger.kernel.org>; Fri, 19 May 2023 10:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684517983; x=1687109983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WaQbuE5cv39OYuI5y6ZtsKaLFzPY8lJPqoWNNkwtTU=;
        b=gNzDPvFxzzNFgOhHoAxieNP/1nvGK+V+PZvuQDYJ1eHWrUjLQNwJb1D5F7VIKxTVLS
         bq916MkfscYab9cZoFtxSWmdIcdN+ZwUetpa6w4Q8lZOZnwK/1P3KoSm8P+TBZV0z9qw
         14oKCJteJKh7p1BkVNSt+5ekxTGJCIRHoYHV5xdT6ZHXTMZeUsbLOfafl2bZ0VebY/m+
         EmpTLkZ/9VPJCZmRTIdMN3WhfMRKM8AyK2dwqj2GDRY9ely/3/sLeWRnjJLpe/htc9mV
         kRuJJmn9ZCblA2qsZTxL3Hz6mv1xKcykj/xxqdH6kzUQpGBQewMNZfbrzev/SAfDLJy1
         YbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684517983; x=1687109983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WaQbuE5cv39OYuI5y6ZtsKaLFzPY8lJPqoWNNkwtTU=;
        b=gGxbRT8gIJZzFfj1vFLveTvGSfafkWI4+H5bq0xLh4TtutVKZ7Q3prT4a4EMJCIesl
         h5ejyosRpNsqiQ0YpINgUD5qVa6Mw5oGxnnOEig3O7Czei0k9FMIrd3nfdzoc+F2yos6
         W38RjGrMHn5cyT7yhmMDKh7fsQdiOtCdA95fdWjKEUhMhn1WALnqeP4UpFWVEi2AVzfC
         OK4PjJqR8P4J/GnSpuIVM/OHUm379kSRtTODEMA5mVUK/LlKp40pCNb3EM67UqYlxsTc
         1/B6Rfx8a1RJKiAtTBhr9vOyYqIE2yJ8I+v2tp+ittI9i0RjoAEv+nxfjzDF2IAmvoao
         mcug==
X-Gm-Message-State: AC+VfDxCeFMq9Vvb1n7CiRnSSmJGT7rkBW148YWZUVkQ6EhhcACKiDTr
        JGyEW/HObcnfImOHXDqbYbKpNH4qW3rnVT+q1r0=
X-Google-Smtp-Source: ACHHUZ63jUyq64WtlKEA52qluNBTP5cLS8bHfVIg4CwlIviMD89PBiYTqinu3CU3sghaCbiRMp1eI59E/izhmzoOaXI=
X-Received: by 2002:a17:907:6288:b0:946:be05:ed7a with SMTP id
 nd8-20020a170907628800b00946be05ed7amr2217094ejc.70.1684517983394; Fri, 19
 May 2023 10:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de> <20230517230239.187727-18-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230517230239.187727-18-u.kleine-koenig@pengutronix.de>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Fri, 19 May 2023 19:39:32 +0200
Message-ID: <CAFBinCCy2=bA2UghJ08itrdJF-heTJhDnnHHCdhTTVcRt_GbhQ@mail.gmail.com>
Subject: Re: [PATCH 17/97] usb: dwc3-meson-g12a: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 18, 2023 at 1:02=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart fro=
m
> emitting a warning) and this typically results in resource leaks. To impr=
ove
> here there is a quest to make the remove callback return void. In the fir=
st
> step of this quest all drivers are converted to .remove_new() which alrea=
dy
> returns void. Eventually after all drivers are converted, .remove_new() i=
s
> renamed to .remove().
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
