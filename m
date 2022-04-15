Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05BEE5028B8
	for <lists+linux-usb@lfdr.de>; Fri, 15 Apr 2022 13:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352641AbiDOLNS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 Apr 2022 07:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352634AbiDOLNR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 Apr 2022 07:13:17 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF389D0E1
        for <linux-usb@vger.kernel.org>; Fri, 15 Apr 2022 04:10:49 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l62-20020a1c2541000000b0038e4570af2fso4847602wml.5
        for <linux-usb@vger.kernel.org>; Fri, 15 Apr 2022 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=vJ3Un2FsIE8DDhLCaTHSqaLuLMcXuKVLpKui5SvsZRo=;
        b=QahmXZ9eIY2tQY4PG6oq9EA6uAmkuMLG7ufMp60N07JXVRP1xS0ePDLhqnAaluGyhY
         VDKcZDXCwqxX94y60QSZ4/quLgmmGVlLu7Y8aRyL8TADudqrk28tuYVdDWZPJUpP9tW9
         fzWFCVW6bPxR64V9TOUKXIn4Ti1of1NQ+NnuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=vJ3Un2FsIE8DDhLCaTHSqaLuLMcXuKVLpKui5SvsZRo=;
        b=Zd5eY07z1n5x5pOnd1KsXth7tZW9i6dm/evTvlbp9ax23lyW9LSCI+0DdwP6pAsnuE
         OAtYSVZzwp46ea0Tqoem+OIXMbNbv5cr/VtvDi4KyAmDY7FMbcWmZVBuOel7warhzns7
         hxuxxY3+F2o/DBU/8gJoh0lBjN9G3Kr1CF/JajEKGAAgevPIg+gzlh7OtcWf7h3Gmz4o
         rWnpgcnCYqcf5SAKuW8L/Jez8f8sjuokecLu3vHZc/Pt5ZV+Fo05+UEAz+PFBx6ViE1y
         ENOo+QxBO2FfeJsICxPw+NliKAG1b3LlrdPqxjZ4pcz6gL7mdExPMFEmBKhihAXt69ZK
         gTrA==
X-Gm-Message-State: AOAM532kRBtZbKOxcZjZZQSyh2ngdo0Exkyppmrrq6zr5QN3ryRDay6k
        NfvzDwpvv+XUwH0QU+01/43nl0EZQzj5uuMbLoIQ3w==
X-Google-Smtp-Source: ABdhPJxMeXczQJLDitWiGKO9Aht0umvRlEcwLp6J7nYXJbhMqjTxPXYRD0cH3vth00HE1Fo64JYYrz8z5WjmOMYxyF8=
X-Received: by 2002:a7b:ce83:0:b0:37b:f1f1:3a0c with SMTP id
 q3-20020a7bce83000000b0037bf1f13a0cmr2925863wmj.10.1650021047831; Fri, 15 Apr
 2022 04:10:47 -0700 (PDT)
MIME-Version: 1.0
From:   Pin-yen Lin <treapking@chromium.org>
Date:   Fri, 15 Apr 2022 19:10:36 +0800
Message-ID: <CAEXTbpeD+UaExc7qSU8idUgW7jaEP4FZXbFY==saYcNDO_AsUg@mail.gmail.com>
Subject: Suggestions for allowing drivers to detect USB Type-C MUX (switch)
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Chen-Yu Tsai <wenst@chromium.org>,
        Wei-Shun Chang <weishunc@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Prashant Malani <pmalani@chromium.org>, xu.yang_2@nxp.com,
        shawnguo@kernel.org, andy@kernel.org, dmitry.torokhov@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

We would like to submit a patch series to allow drivers to detect USB
Type-C orientation/mux changes, but we received different opinions
from the maintainers and we are not sure how to proceed. I am sending
out this email to start the discussion and collect your feedback.

In previous works[1] by Jun, Rob suggested using general mux
controller drivers to support this. But, in later patches, Heikki
suggested moving the logic into Type-C MUX controllers
(drivers/usb/typec/mux.c).

Could anyone please suggest a direction for this patch series?

Please let me know if I misunderstood the background.

Best regards,
Pin-yen

[1]: https://patchwork.kernel.org/project/linux-usb/list/?series=484785&state=%2A&archive=both
[2]: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1604403610-16577-1-git-send-email-jun.li@nxp.com/
[3]: https://patchwork.kernel.org/project/linux-usb/patch/1621408490-23811-4-git-send-email-jun.li@nxp.com/
