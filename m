Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2DF5626C5
	for <lists+linux-usb@lfdr.de>; Fri,  1 Jul 2022 01:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbiF3XPy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 19:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232498AbiF3XPw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 19:15:52 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105C61E3DC
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 16:15:47 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id r18so796646edb.9
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 16:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SWJlfnOUvt/FFKbUgKl5hHMb12qmVk1doHERyZfesTg=;
        b=Wn+P6bik2DjG8VTAjP17LBoHzLWqHSFvUMIQbK+3Uny2jIXyxPR0eFPIGOGrzNwMtB
         PAkulFML0VeMMt7xAv/O9qGy3I49Rc4Omb5bXscaWalVPes1iOEFJP2+gkxUtmVmSOP2
         zg36Q/CMHN4JD0aaRUSYAEmDlrr2+k44vFPKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SWJlfnOUvt/FFKbUgKl5hHMb12qmVk1doHERyZfesTg=;
        b=dkMBMbkff7rFyEsCOmALzd917an/mxil9lINFX8UpHT2xsSspM2Rb7oAb65ymwC2fU
         ZR1MJfN2I/uO325gz6+4cbkIP470LQNK1fYaiko7UNY6PeD+yNJFJRw9FUJhZDWDhUmX
         wcyBcgJite9anqtdaLRZ3HyxSDR3I7qDS1UAAHDCrpkgKp/uKW9tTCqzqz866oDVJThV
         xAcXR+YVsjyv9wlPHrNY5Dsrk+kMYA9FLAs0WsVInJmquC2yOuD/vAVEopF1K+tRmQD8
         toH7zwHjp8y70NEtyrnhk4zMRa9iB/sq1E8bqqyg4sHkQtgyM88c6FNmfMlu6vUdUYKG
         XwkA==
X-Gm-Message-State: AJIora9i3gP3WEVwaSKkq2Ljmxn8ydY6CYOKwQ028AYyTyTmA3B/Gch8
        SUMhl+WDGb7Toh2940D9R6B1g9+7QhZn0j3MS5c=
X-Google-Smtp-Source: AGRyM1u/4M0b3vzLBvqozU+R1pzM5orNnWhlSJjcmiN5H7TmubO0v1jhdIJgzE+m6Rv4yvI+QrqlMg==
X-Received: by 2002:a05:6402:2741:b0:434:fe8a:1f96 with SMTP id z1-20020a056402274100b00434fe8a1f96mr15105269edd.331.1656630946300;
        Thu, 30 Jun 2022 16:15:46 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id i13-20020a1709061e4d00b006fef51aa566sm9640564ejj.2.2022.06.30.16.15.43
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 16:15:44 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id l68so241942wml.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 16:15:43 -0700 (PDT)
X-Received: by 2002:a05:600c:5107:b0:3a0:4342:ed75 with SMTP id
 o7-20020a05600c510700b003a04342ed75mr12367143wms.93.1656630943574; Thu, 30
 Jun 2022 16:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220630193530.2608178-1-mka@chromium.org> <20220630123445.v24.2.Ie2bbbd3f690826404b8f1059d24edcab33ed898f@changeid>
In-Reply-To: <20220630123445.v24.2.Ie2bbbd3f690826404b8f1059d24edcab33ed898f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Jun 2022 16:15:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xj3ejpZ4y3D9gip=rr2jKx9bA1jJWtHVaKv9TYZdQ2BA@mail.gmail.com>
Message-ID: <CAD=FV=Xj3ejpZ4y3D9gip=rr2jKx9bA1jJWtHVaKv9TYZdQ2BA@mail.gmail.com>
Subject: Re: [PATCH v24 2/4] dt-bindings: usb: rts5411: Rename property
 'companion-hub' to 'peer-hub'
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Peter Chen <peter.chen@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Jun 30, 2022 at 12:35 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> In the context of USB the term 'companion-hub' is misleading, change the
> name of the property to 'peer-hub'.
>
> There are no upstream users of the 'companion-hub' property, neither in
> the device tree, nor on the driver side, so renaming it shouldn't cause
> any compatibility issues with existing device trees.
>
> Changes in v24:
> - patch added to the series
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> (no changes since v1)
>
>  .../devicetree/bindings/usb/realtek,rts5411.yaml       | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Matches what Alan said...

Reviewed-by: Douglas Anderson <dianders@chromium.org>
