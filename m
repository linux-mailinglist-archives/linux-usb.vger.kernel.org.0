Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630864DBA8C
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 23:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239288AbiCPWN7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 18:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239294AbiCPWN4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 18:13:56 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB47B63AE
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 15:12:39 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id qx21so6985870ejb.13
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 15:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=t5YisPtzsM0C7fd6A1oY9SJVrPbbN9Fr5lieyUuqkfc=;
        b=fmwiNl0r6a9JRcS3K6o1ySAskAiVMhvrq5sSCwGp48vGBkIgjJD6xTFBQYnvXpXA2m
         1/xpsLio6KIPNZCdMBc5KwTo6RsiXcsr5HzJe4ENqMzvxhz9EDbQ/hU2ZJFAen97UZ2e
         FWt3ez8jRkkikqWznF+OSUKDyM4D7bplgNxJoFmde1pCmwNie37Y8YPoelj6GcKaLC0s
         plswckazIaqMYeUuVu1Q7phBIrMTB/apcw8VCCIdCKiAZu+DogUoTgPSB83DvnI7m38K
         jic7aTyWzC4uNDQ9HSXMYw8maMB+FjngeebxVqUYRQV+1fzqe72kUYxPOUbzJBadx9FI
         JnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=t5YisPtzsM0C7fd6A1oY9SJVrPbbN9Fr5lieyUuqkfc=;
        b=C/lq5BkQ3n4Zl0I0FtD0IhzI868kc+psZcVAQAnivuK531lw4tJELh611ldJCwbKBQ
         z+s6RwlWBTn1BNieZ5iTe5p4A8ibsjezWmEBEFu+jY3ejIOWKrnoVzEUHblmPQa7BfEj
         IG1SFG8YAIOXEUtJNo9T5yqPogIm06FsNcGXlC3Hs2qSvEZVc/Sa2948pBYSiMvS+cSB
         BxYJxNcpcjBWafjEys67kYRyb+6OG+GwGhpwau8RbGEEcaeME3HZRmJWKnqbC6YLAwKH
         kLQUaWAKX06VjG0W6ub3kvs9CAgHDikl8kKlrQ3LRWx6+7MMTrjxsQYWQ7sgi7h0fZbW
         C24A==
X-Gm-Message-State: AOAM530xzwyaFTM455TWLYgjTNGt4yXJU/pq989RSjLpM+9CDKUjAOQt
        cw2VTKXTyAvZ5xFURNoHlmQ=
X-Google-Smtp-Source: ABdhPJxrjkgQZHXfQI57DVw/cpw3kGWhJM8+A2NW/BrvO9HS075CCoUCmKco4qeyPPLf3EiNGtJfFQ==
X-Received: by 2002:a17:906:c053:b0:6b5:fde8:af2 with SMTP id bm19-20020a170906c05300b006b5fde80af2mr1739626ejb.642.1647468758296;
        Wed, 16 Mar 2022 15:12:38 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b866:cc00:e490:2de6:a89f:9b66? (dynamic-2a01-0c23-b866-cc00-e490-2de6-a89f-9b66.c23.pool.telefonica.de. [2a01:c23:b866:cc00:e490:2de6:a89f:9b66])
        by smtp.googlemail.com with ESMTPSA id v5-20020a50c405000000b004161123bf7asm1609613edf.67.2022.03.16.15.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 15:12:37 -0700 (PDT)
Message-ID: <4667c495-56d0-c53d-2c2d-3280e8a6ae13@gmail.com>
Date:   Wed, 16 Mar 2022 23:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: [PATCH v2 5/5] usb: host: xhci-plat: omit shared hcd if either root
 hub has no ports
Content-Language: en-US
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
In-Reply-To: <0684616b-5cc0-e9f6-7015-ce709c6d4386@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Activate the just added extension for xhci-plat and omit the shared
hcd if either of the root hubs has no ports.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/usb/host/xhci-plat.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c512ec214..044855818 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -245,6 +245,8 @@ static int xhci_plat_probe(struct platform_device *pdev)
 
 	xhci = hcd_to_xhci(hcd);
 
+	xhci->allow_single_roothub = 1;
+
 	/*
 	 * Not all platforms have clks so it is not an error if the
 	 * clock do not exist.
-- 
2.35.1


