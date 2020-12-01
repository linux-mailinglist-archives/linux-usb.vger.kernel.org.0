Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD462C93A8
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 01:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730915AbgLAAGM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 19:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgLAAGM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 19:06:12 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19CDEC0613D6
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 16:05:32 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id h21so633134wmb.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 16:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=PxcXUulEgKyT5OqGMviihTXF0lRaKbBQv3juecUtJO8=;
        b=O7tahjFvfV270xsIxQrZzlM6k0pOwQyJC3RZ5+23q7vBo/Af+t8KarNIHs67XtYjR3
         MG5fxSV+idLE+yD9ZEqVpNV4QqRuAIoJyiLNmF2q//gSDnIGLe1705lVNg646dyLIbOY
         l3N7G+Q3Lagwg2lM66LXayYUUQaXmBKIHlxctdOjfTjLLr8tigAnTkRXXLMEoNG+Z02M
         3e+6cb7+kFzE9fvDrgIskCefZrYNXco1DzWq4KNx9hRGsjlPhURp77jFj8P+evOOawzO
         pizJJmd8NdBIIrUF0nptK18nImb9dM8agDGLY5ZiyVbyKqfsJOM4jQ/IyKp+Pk2N/aL6
         r3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=PxcXUulEgKyT5OqGMviihTXF0lRaKbBQv3juecUtJO8=;
        b=nV85YdauyeV7/elPAQ7URdEN0QYxWyM8R7I4bIQzwC3E0rGtTak7AX+ThWA104yxu7
         u8kcZ3tLJmXJmYQPr2Th/eh6JSA6w87IYuKmFNsM1/OcDAsDMy56O520gy1oI0ep/oXR
         gvFpkxmaBR3tx/z4PduiJ+vMqOv0BVLqKoi8fPCCgBsjPr7TxZtU2xDT/p+tX0mnxb3a
         uzBEY1EKooh9Gx3DHBvPXxKGJNC7Cmm8Rn+3zlhp6LYLwpKSilUxpGD0pAmWJneaIQIT
         1O3WLR8kTwbZh4frQtN2g8c9gmFRRFg8PtThwAj6Sb4mPj9UWbhXiSnthItgHumu7TU7
         WF9A==
X-Gm-Message-State: AOAM531Gi1N63VyOGdtV7LO1uegqPgLS/hJ8phee/VQFDIG8UlmICWEB
        XiKmn5lPMUv12eq0B8iOUtN3ig==
X-Google-Smtp-Source: ABdhPJxDo2whkAA2R00WX2/QVf+Qt3ioNPbxjqDxzSFpgUK0pyo10hiDr+JBjoGg0Wl+Gi6pgaZ9mw==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr319472wmj.25.1606781130659;
        Mon, 30 Nov 2020 16:05:30 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id t7sm27223749wrp.26.2020.11.30.16.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 16:05:29 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] usb: meson: fix shared reset control use
In-Reply-To: <093933fc-eac5-de56-d314-a1348de348af@baylibre.com>
References: <20201113000508.14702-1-aouledameur@baylibre.com> <093933fc-eac5-de56-d314-a1348de348af@baylibre.com>
Date:   Mon, 30 Nov 2020 16:05:24 -0800
Message-ID: <7hzh2ytmpn.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Amjad Ouled-Ameur <aouledameur@baylibre.com> writes:

> Hello Felipe and Kevin,
>
>
> Could you please review this patchset ?

The changes are OK with me.  Please update based on Martin's
suggestions and this can be queued up by the USB maintainers.

Kevin

> Thank you in advance.
>
> On 13/11/2020 01:05, Amjad Ouled-Ameur wrote:
>
>> This patchset fixes a usb suspend warning seen on the libretech-cc by
>> using reset_control_rearm() call of the reset framework API.
>> This call allows a reset consummer to release the reset line even when
>> just triggered so that it may be triggered again by other reset
>> consummers.
>>
>> reset_control_(de)assert() calls are called, in some meson usb drivers,
>> on a shared reset line when reset_control_reset has been used. This is not
>> allowed by the reset framework.
>>
>> Finally the meson usb drivers are updated to use this new call, which
>> solves the suspend issue addressed by the previous reverted
>> commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared reset control
>> use").
>>
>> Important:
>> Please DO NOT merge before this patch [0] is merged, it adds
>> reset_control_rearm() call to the reset framework API.
>>
>> [0] https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylib
>> re.com/
>>
>> Amjad Ouled-Ameur (3):
>>    phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
>>    usb: dwc3: meson-g12a: fix shared reset control use
>>    phy: amlogic: meson8b-usb2: fix shared reset control use
>>
>>   drivers/phy/amlogic/phy-meson-gxl-usb2.c |  5 ++++-
>>   drivers/phy/amlogic/phy-meson8b-usb2.c   |  4 ++++
>>   drivers/usb/dwc3/dwc3-meson-g12a.c       | 19 +++++++++++++------
>>   3 files changed, 21 insertions(+), 7 deletions(-)
>>
>>
> Sincerely,
> Amjad
