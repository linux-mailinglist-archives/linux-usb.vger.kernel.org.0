Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80CA61DE3F
	for <lists+linux-usb@lfdr.de>; Sat,  5 Nov 2022 22:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbiKEVH0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Nov 2022 17:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiKEVHZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Nov 2022 17:07:25 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39E4A11161;
        Sat,  5 Nov 2022 14:07:24 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y14so21306142ejd.9;
        Sat, 05 Nov 2022 14:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hs1jDi6MDHgTf1jm542+fLUkEHEfEymUM9i9SJMIuQs=;
        b=EU83VSr+4f/dRzu7BrHWHuC+FZM+vpOUF3haqKM6eGmSAXu+USRthwUd9L62hX1cCL
         UWgXG2sgyxjp6mZcQzSXYw1KjqBoo2nESeGQAdqU5cSLU3bk3BfGi1bFo26+cmFRL+LI
         dt3ftM2HquC67CEFOjCaoalWoVLJz9CmbpWnNayQtQgHdeWDDBu/VpbD/LMwja7YurXZ
         bnf2e970QhC9bFcje8zNjfvjBSuvnrYAiQamOXh9i3FQ2/0gmiRWdlvdkU34KsemKyn6
         P4/X3MGgAssww5hS3JLFzW11uALuf1AF0bTorit9RMT0gsxuQF4fBzowfnc+q8fNnrgi
         3OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hs1jDi6MDHgTf1jm542+fLUkEHEfEymUM9i9SJMIuQs=;
        b=nlDaDq+vL0CbJPNqaS1Suq9kxeFymFrEau2DcJaYTZyoBma2u+6Wn1dmD5KjxP8pVo
         I8Y2s9SiPJn1R5KYsnYo1gVZEFRDM9HSQoa3aDvQj81T9q/qnhkB7Vxmt6zDpIeScWJe
         OJLCtu92yAg1u+BDXACFtnoDqdAS5JO6rjS2OvUWBWWSH0aF6bdBsWSWNLgyO+kSeQbD
         QcgB65YXtc1ODAb/uuxBSFzk/mPNOWxHw0CcSLnFuTzvtZhbjOBh+cbx4fHDVC/Y8RYD
         vFhy/bL6Fze/UTMbFeqU5ZzyZiDig1fWnk/ZlsZymxjtTIgW+aXBtqJZzW+pktKZDq/h
         1APA==
X-Gm-Message-State: ACrzQf2+8LJvvW+ksufibuVZekiSVkRx9RZYjxjYNa4DW9KzvmUtVN1g
        O9sFzu2Q3Ig7fRO63p1zyRk=
X-Google-Smtp-Source: AMsMyM4qnYaEHN9tm9Dx5kAMHo2UAPkX2VxnU3giaRhnRkxPmcavexaDdSZAyj2UDFCzgEehUeRyeg==
X-Received: by 2002:a17:907:a067:b0:7a7:dc5e:eb2d with SMTP id ia7-20020a170907a06700b007a7dc5eeb2dmr41564881ejc.121.1667682442717;
        Sat, 05 Nov 2022 14:07:22 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id x19-20020a170906711300b0078116c361d9sm1378095ejj.10.2022.11.05.14.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:07:22 -0700 (PDT)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To:     Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
        Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 5/7] arm64: dts: allwinner: h616: Add USB nodes
Date:   Sat, 05 Nov 2022 22:07:20 +0100
Message-ID: <2120022.irdbgypaU6@jernej-laptop>
In-Reply-To: <20221031111358.3387297-6-andre.przywara@arm.com>
References: <20221031111358.3387297-1-andre.przywara@arm.com> <20221031111358.3387297-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne ponedeljek, 31. oktober 2022 ob 12:13:56 CET je Andre Przywara napisal(a):
> Add the nodes for the MUSB and the four USB host controllers to the SoC
> .dtsi, along with the PHY node needed to bind all of them together.
> 
> EHCI/OHCI and MUSB are compatible to previous SoCs, but the PHY requires
> some quirks (handled in the driver).
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


