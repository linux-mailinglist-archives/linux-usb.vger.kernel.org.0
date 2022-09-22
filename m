Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2E1A5E58B7
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 04:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbiIVCnE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Sep 2022 22:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiIVCnC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Sep 2022 22:43:02 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B694FAC263;
        Wed, 21 Sep 2022 19:43:00 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id v128so6639510ioe.12;
        Wed, 21 Sep 2022 19:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xNcnn4jL4IZe3ZlqcZaLceLcSUnWIU8oO+Rv1oWAims=;
        b=A6v5lroDUrohUlJAoDACvvzyGHEO3N+kOMGaq8GtJ27INc5OwVb6uc5GivNgS6oaSA
         2Z7t6rJdDCeX7mvrmea6V9b+FaYig7sC2Nt3TFzVjSXq9IczWJxIdtY25Dk/idwWZheu
         yHJcmBDyV1OMEH/yuH/r8ty4ZKrxKOaOrHG7w9bzLhMXXhc/+o7Y6BJtDAfHSEW3YmUq
         MaTrGVXRLxIG5sM3DbfHpT3oSIw5r8QDjxhkpRB5rRyqKLC9BsdZGdPkNr+7br/cQeWC
         0ZXvcmdOAqJBoZ53Ov1SPrxSfn4qfPLlZQR0yXprxt6S4UcuoLtOFH8mkK6ooEauUyxv
         V2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xNcnn4jL4IZe3ZlqcZaLceLcSUnWIU8oO+Rv1oWAims=;
        b=sZeWWNJuiAtIlcDqTg0zx5q25OxP1UxlGkR8PS86ykvF6etqdM1a1DF0QWSYPpqZwo
         /eM8ayjZGC4K6gKnAeKbmhGFogIFiesW3bIhMRQ2+Vp5H3LiZB8fa92M4+0n5oCghDSK
         KeYGQhyhrjGg+Lr8u0sSpQH5d084wl0ukxVjRStPLBDI4Iu8WSdCe49NdHH38Mz0Z1kE
         xQR1h1KR/go7BgFmPqcTK0AWignCZmTdaGkiqHDClegJkiiVVy/pq3ZswPJJ4vxAqiGA
         usVEjy/iUXkNGJgvep3XcLLJ5tbCP/CjVFvucOgNiPv4Pav5q4xggcpP5x0r6wQ6zBGP
         Qsqg==
X-Gm-Message-State: ACrzQf0QzEX6ZsBYhP8hU0J0mDIkw8FW0soW+N/ihf+4I8ROciBqmfQ6
        WKMaW4dxogAi1O/amVXd9L0=
X-Google-Smtp-Source: AMsMyM4lTR9rAMGNjLP1fXBJL+OH2wTxgAeuSqnmEhhaHZP8SmjQdM60o71QJOzqMaivONZ3oEe0Sw==
X-Received: by 2002:a05:6638:339c:b0:35a:28d4:2189 with SMTP id h28-20020a056638339c00b0035a28d42189mr704698jav.176.1663814579829;
        Wed, 21 Sep 2022 19:42:59 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::61a4])
        by smtp.gmail.com with UTF8SMTPSA id q14-20020a027b0e000000b0034c0db05629sm1691832jac.161.2022.09.21.19.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 19:42:59 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: usb: dwc3: add sdm670 compatible
Date:   Wed, 21 Sep 2022 22:42:57 -0400
Message-Id: <20220922024257.178428-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <adc622c8-d2b4-5867-60eb-49eaf10cf701@linaro.org>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On 21/09/2022 00:43, Richard Acayan wrote:
> > The Snapdragon 670 has DWC3 USB support. Add a compatible to reflect
> > that.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> 
> Missing changes in allOf?

Oh, I didn't see that. Nice catch!

> 
> 
> Best regards,
> Krzysztof
