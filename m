Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C692592C05
	for <lists+linux-usb@lfdr.de>; Mon, 15 Aug 2022 12:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242311AbiHOKJI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Aug 2022 06:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbiHOKJG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Aug 2022 06:09:06 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4A3140A0
        for <linux-usb@vger.kernel.org>; Mon, 15 Aug 2022 03:09:04 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e27so3810101wra.11
        for <linux-usb@vger.kernel.org>; Mon, 15 Aug 2022 03:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=CsB/NoAW56ne050I2nV0A7tDW+eX2gZVyLlTc8MEkXE=;
        b=Q2bJb0gcve+toJBBcF3NJDnzAW0PYtNEMYzldvGWquVi3ZwNnMiF927RQ4XD401w1Q
         aqApE+LzZaF804S8NHNrDNnz8VcYTD2U6CLYjQtPCA0hvMrO7+jrWUUN0416udv6b/3N
         j0DcxZKkFiISmo3jjJ5bHRXLA5SH+pXC1EGwootfPQIhe0uOztl/i8zAmb8ixOT9pd3T
         azeux2MTH1rpO1Q7ByHU5ZrZAkuuadpYbpO6FTBqH/DVLWI4sSbbZUDAwJTGXgIB3Fj9
         aZXYEa2IyWIsKp+g0FPxJ3fQADvGYEJEXTALcSEbjJ1sUhjschl72EaI+m1QKh6kQEKp
         mNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=CsB/NoAW56ne050I2nV0A7tDW+eX2gZVyLlTc8MEkXE=;
        b=X3JDQa3QwFbh3wNXFMxJD0UiKykysALlACKqdDyXxALXrYIiEeHA+UuyOWbXf+8gkP
         lq4nmY2UpeytAmJFQUz3Rauh57xEnCvo7o1aoRLannRwfad4OQu3k3BFE5fhczsdbJ1v
         Ub9qbXu//8crdplJyi2x10ZaC7Nw0ilDU7PbG1NV02mRSPb56VQNnyKEp1WxC/sLWAEZ
         Llx6w5OnOsVthBGFKXXxwtTGlgp4W3cnwi9yKexRfnV5hGZBhV5hInYSfdUVl7CbKAPg
         PXnrAhf3/U9WUpT02RnuMtOC1xlUlOuMZBJG0DWbhV1aksAqt8F3Cp/QdkNNF8F0s+BH
         sI9Q==
X-Gm-Message-State: ACgBeo0NWQfwoMr0rn1TVJ9Gn1l++87xk72lctwIC5YFa5r0JgITesFW
        4nwptIdotwP7tpGED51d8Mim1A==
X-Google-Smtp-Source: AA6agR6d5kQNwJdr555MMH+HrNG3/sAUb0Op9EljHjT0wTZDPmBgOVTbFs55jQ216/Ed/j4i1HlcVw==
X-Received: by 2002:adf:f851:0:b0:220:732b:2df2 with SMTP id d17-20020adff851000000b00220732b2df2mr8761477wrq.716.1660558142782;
        Mon, 15 Aug 2022 03:09:02 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id l14-20020a5d560e000000b0021f0558e51asm6890533wrv.55.2022.08.15.03.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 03:09:00 -0700 (PDT)
Date:   Mon, 15 Aug 2022 11:08:57 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     ChiaEn Wu <peterwu.pub@gmail.com>
Cc:     lee@kernel.org, jingoohan1@gmail.com, pavel@ucw.cz,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
        gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
        linux@roeck-us.net, heikki.krogerus@linux.intel.com, deller@gmx.de,
        broonie@kernel.org, mazziesaccount@gmail.com, lgirdwood@gmail.com,
        andriy.shevchenko@linux.intel.com, chiaen_wu@richtek.com,
        alice_chen@richtek.com, cy_huang@richtek.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
        szunichen@gmail.com
Subject: Re: [RESEND PATCH v8 12/12] video: backlight: mt6370: Add MediaTek
 MT6370 support
Message-ID: <20220815100857.hcna3ksejzcq5x3l@maple.lan>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
 <20220815090125.27705-13-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815090125.27705-13-peterwu.pub@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 15, 2022 at 05:01:25PM +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> Add support for the MediaTek MT6370 backlight driver.
> It controls 4 channels of 8 series WLEDs in
> 2048 (only for MT6370/MT6371) / 16384 (only for MT6372)
> current steps (30 mA) in exponential or linear mapping curves.
>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
