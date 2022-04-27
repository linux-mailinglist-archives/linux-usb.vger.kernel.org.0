Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B679E511E9E
	for <lists+linux-usb@lfdr.de>; Wed, 27 Apr 2022 20:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241945AbiD0QKO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Apr 2022 12:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242656AbiD0QJt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Apr 2022 12:09:49 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8FEF48B882
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 09:05:50 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id l18so4343608ejc.7
        for <linux-usb@vger.kernel.org>; Wed, 27 Apr 2022 09:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nlWv3bBsoiqmnFKZVf0cWitj0rFj51ESVAm5rIPY47s=;
        b=PDsMRn/5mDiml5+/eTgHLrOU2ewvUp8TWOz42SlPHphdVURmqr7igb7PelTKMlmORH
         FKjbTQUDeEfzZpV9bfEhAKesOOS6/J+7QI+IjAAu4iti6lHJNWx/6ZViyQlybO5FUaar
         b1mJ5y72XeQdzY27dNKRs2w/bA+bxly62eWBrV3oEp4q9ZQpGQTo1Kz0eiyNCtUNbHzD
         aRohzb0w+5CKokFAae6RKPSUjoIDHHUl6JD3XKzJjVIUL4cNnEhsNa9yksxOIOtv3xVN
         6nuql8+6zCFx4JYnXJiPWUzvA14RbRCY0g/2kfqPGG9DirdGeRXOlYR+8DbSmBpS5Iq1
         mn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nlWv3bBsoiqmnFKZVf0cWitj0rFj51ESVAm5rIPY47s=;
        b=sIyL9sS9qEwQcroQGJPkGce6sMBT36pLTKGBazBOe4AbpiPaEDjAB6M4f2VBTfUD7z
         zTFLvnNMu5yJl5IIJGgtbdp1fXNUXXalLds7wZk14o28azjPAXF9zvitSXWlkX2P6o1P
         C052dmSW504wdWMVMMZR2Y9vaElqR3MlrLDo3y96tGSxQrZmdJgqEfi0BumFCVCILsiE
         XhRGPWiD+4raraBPWW+weKiMhRv8KRYYA05jn2CA64JoH+jMSNo2B4OwTPXhUNbhtPKE
         JxVb9pu6ocL69+jAZVUoy00ELzpshu0G77UsQSjDZi8Ywwvgpn/eKDQIXIg5+bl+p6pw
         rcag==
X-Gm-Message-State: AOAM530HzuA0kPX4f6vQMuErxP17/C/Ctctl0XwILishLPrm+aDw4p6D
        K9opgL/jKhgl3PF1HWcjZMdUzw==
X-Google-Smtp-Source: ABdhPJyoPwa+1tp5ouz1f/FVaGPLFM+jVwC8NcaNu76aEiPeEMLaU8YRvOFeVI9ju2FNzJ62VQSTqw==
X-Received: by 2002:a17:907:8694:b0:6f3:8e7e:fcfa with SMTP id qa20-20020a170907869400b006f38e7efcfamr16648939ejc.82.1651075546697;
        Wed, 27 Apr 2022 09:05:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b17-20020aa7dc11000000b00412ae7fda95sm8571437edu.44.2022.04.27.09.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 09:05:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/0x] dmaengine/ARM: use proper 'dma-channels/requests' properties
Date:   Wed, 27 Apr 2022 18:05:35 +0200
Message-Id: <20220427160538.646044-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

The core DT schema defines generic 'dma-channels' and 'dma-requests'
properties, so in preparation to moving bindings to DT schema, convert
existing users of '#dma-channels' and '#dma-requests' to the generic
variant.

Not tested on hardware.

IMPORTANT
=========
The patchset is not bisectable! The DTS patch should be applied a
release *after* driver change is accepted.

See also:
[1] https://lore.kernel.org/linux-devicetree/fedb56be-f275-aabb-cdf5-dbd394b8a7bd@linaro.org/T/#m6235f451045c337d70a62dc65eab9a716618550b

Best regards,
Krzysztof
