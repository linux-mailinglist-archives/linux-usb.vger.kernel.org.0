Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357B8281AC8
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 20:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388034AbgJBSXu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 14:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBSXu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Oct 2020 14:23:50 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A89CC0613D0
        for <linux-usb@vger.kernel.org>; Fri,  2 Oct 2020 11:23:48 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id q123so1858961pfb.0
        for <linux-usb@vger.kernel.org>; Fri, 02 Oct 2020 11:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=dLt24jZaXpKoPfrpAQsTNoIii0wynpAMSCaMsOeaq/8=;
        b=Irswezj4+vTXLAGewGL2mUj0idT6ulXfb+ykyqeUCPq7sCA/aOBGuVzlRafWNEi1jL
         AhctfN4YLXT5o/AMzF/42Yfz0u+HXCrQXjM88bUXqvzqj1h9VeiXdpE8+bqcZhx3iPPn
         kAA4w46fJBE+Fs7Hylbxe7OcSDx7sK1aY6d1qQqcE5ytSZh7puRMFSPpeH5pIDQS1nbY
         VlTbvf49Tj53TuKeIrKX3gE3z2V8PC3f1qFbu6VtkKJUHqojbBLTWqxWmC/OFOuFKapy
         HIHpj6z5OcmWohPx20bCjgXy2dCC9WrNupkThuKx8lVmTPxHehGBSv6Dp5wpPoAT+cFQ
         5Upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=dLt24jZaXpKoPfrpAQsTNoIii0wynpAMSCaMsOeaq/8=;
        b=Q+s/3KtoOdDkIouHwHIR0yd+mLLhq/rruqbompdex+fnHeDZNUxFn2HSvoNYq7LfJ0
         tWnp0fVIEpSZnBHFzvDtdY+TyMKMqJddzpW6Eh7YVH8Gqp7WFhBAC5UllzfTTmdD4P5j
         lkcx3dCI3CpYc7YQ8R/3Qj/7afeXilxIAcIhng0QfA5ls/LMy0dLLxIKSoZ1sBPA+4At
         kQIIIzkP73/fxPuwORzDfh3hTw+lc++dYX8Kha74S8qZXsZu7i/5fuk3MLJy2Rs7f195
         yelrLKwonV+FiRmk+9utshGwXbGU92OXYROMIe41eQnyUtRuZg1d5MVVaA8U89dPAopW
         Apcg==
X-Gm-Message-State: AOAM532wVwPP9PMMog6bnemSOw3tmWWrAdYyAbyrXM0aOfyH14fwNr4Q
        Jx3VgwsY05ywJw96brHol5zeBg==
X-Google-Smtp-Source: ABdhPJw+m163+8+A3NNIguhVHp83jAAmQeDChZRqJPzFkbCuCqkvLTCPyC93EbyZCnoE8aNRIPdUWg==
X-Received: by 2002:a63:30b:: with SMTP id 11mr1533550pgd.253.1601663027882;
        Fri, 02 Oct 2020 11:23:47 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id e10sm2385564pgb.45.2020.10.02.11.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 11:23:47 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, kishon@ti.com,
        balbi@kernel.org, martin.blumenstingl@googlemail.com
Cc:     linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/5] usb: dwc-meson-g12a: Add support for USB on S400 board
In-Reply-To: <30e2c174-c94b-f42a-1dd4-ae05c317d618@baylibre.com>
References: <20200917065949.3476-1-narmstrong@baylibre.com> <30e2c174-c94b-f42a-1dd4-ae05c317d618@baylibre.com>
Date:   Fri, 02 Oct 2020 11:23:46 -0700
Message-ID: <7hpn60mqq5.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hi Kevin,
>
> On 17/09/2020 08:59, Neil Armstrong wrote:
>> The Amlogic AXG is close to the GXL Glue but with a single OTG PHY.
>> 
>> It needs the same init sequence as GXL & GXM, but it seems it doesn't need
>> the host disconnect bit.
>> 
>> The Glue driver reuses the already implemented GXL & GXM work.
>> 
>> The USB2 PHY driver needs a slight tweak to keep the OTG detection working.
>> 
>> Changes since v1 at [1]:
>> - s/close from/close to/g
>> - collected review tags
>> - added small comment about phy management in patch 3
>> - removed status = "okay" in patch 4
>> - removed invalid phy-supply of phy1 in patch 5
>> 
>> [1] http://lore.kernel.org/r/20200909160409.8678-1-narmstrong@baylibre.com
>> 
>> Neil Armstrong (5):
>>   phy: amlogic: phy-meson-gxl-usb2: keep ID pull-up even in Host mode
>>   dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic AXG
>>     Families USB Glue Bindings
>>   usb: dwc-meson-g12a: Add support for USB on AXG SoCs
>>   arm64: dts: meson-axg: add USB nodes
>>   arm64: dts: meson-axg-s400: enable USB OTG
>
> Can you pick the DT patches ?

Yes, queued up.

Since we're already at -rc7, this may not make it until v5.11.

Kevin
