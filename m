Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE076E14A5
	for <lists+linux-usb@lfdr.de>; Thu, 13 Apr 2023 20:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbjDMSzc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Apr 2023 14:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjDMSzb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Apr 2023 14:55:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC04C270D
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 11:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681412088;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bj+U/10GLqXj2YH6vIakik5vgTZzUMJtlbeaT9V0zCc=;
        b=ALWcmvPLcm53sqSL8Ci7cGMcaCaFc1Ox8A6L2IAOBqD3vd/sx4d4ILdUvvbqfpb76DKv5Q
        NrT/xsCAYu7J4UrQo6e/SltfscPkS9qgqk5pXE6g2eUEQvTv0UegDom5zplRuQCUPMlCBh
        GJtq01367psjxQ3KpP/EvY9dfFpLxXo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-3bHKigfxMEGTHtKmi6931Q-1; Thu, 13 Apr 2023 14:54:47 -0400
X-MC-Unique: 3bHKigfxMEGTHtKmi6931Q-1
Received: by mail-qt1-f198.google.com with SMTP id y5-20020a05622a004500b003e3979be6abso11415043qtw.12
        for <linux-usb@vger.kernel.org>; Thu, 13 Apr 2023 11:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681412087; x=1684004087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bj+U/10GLqXj2YH6vIakik5vgTZzUMJtlbeaT9V0zCc=;
        b=GCn5YAL6Up6mIYeiVejOV9qvELVg1juBYk9Utvv7eYHUJ4hVE4P5KlS4e4jy4tWFo/
         k729VK/nvWYJbEv9byPinOH3aa1ETD+h2wvsc2rnneCOIJFS13/oh3rbxqb5miJsjzpT
         xjQkzxDvBUuqPT2Xs71YOeisyeliA549rJD67UeO/RLZsKgyXlQG86WVQmHK3FMQjV/M
         tLR9m22eW+YUe/Z4LpnSyc7f7HMRoevY8d31kgS6Ua6BqKPoBAUBU2UAsmYoKE6NFm2M
         lUcKDD3MGh/+sFyrP6kx2eiQIsCmhYg3QUxmMoGx/yMhpPZHYjBwEf61LHJ/Z1stdZAO
         URIw==
X-Gm-Message-State: AAQBX9drG9BY6621sM86VhLtyPE90ZODHpA1RvDZ3xQRFv5Q7qgu3e+R
        SKrO51sCaJe/AjXK+YgB7ow+qYyxRTgb9MM0Ak3MFE7N1ITljB++dxBmsaXTvIrLf8P4WoOaq6v
        Ech3JQBu2vfUYIzFfIQ1t
X-Received: by 2002:a05:6214:2348:b0:5cb:ab2e:b15c with SMTP id hu8-20020a056214234800b005cbab2eb15cmr4079218qvb.30.1681412087050;
        Thu, 13 Apr 2023 11:54:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZoYb+WLMQeaI11rL07yAbqKKGrVN73uJb36S0wBT3D4r4/v0v0UUT2Z63JUk2EU/J+iCeW0A==
X-Received: by 2002:a05:6214:2348:b0:5cb:ab2e:b15c with SMTP id hu8-20020a056214234800b005cbab2eb15cmr4079184qvb.30.1681412086810;
        Thu, 13 Apr 2023 11:54:46 -0700 (PDT)
Received: from fedora (modemcable181.5-202-24.mc.videotron.ca. [24.202.5.181])
        by smtp.gmail.com with ESMTPSA id t13-20020a0cf98d000000b005dd8b9345bdsm613948qvn.85.2023.04.13.11.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 11:54:46 -0700 (PDT)
Date:   Thu, 13 Apr 2023 14:54:43 -0400
From:   Adrien Thierry <athierry@redhat.com>
To:     Krishna Kurapati <quic_kriskura@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        quic_pkondeti@quicinc.com, quic_ppratap@quicinc.com,
        quic_wcheng@quicinc.com, quic_jackp@quicinc.com,
        quic_harshq@quicinc.com, ahalaney@redhat.com,
        quic_shazhuss@quicinc.com
Subject: Re: [PATCH v6 0/8] Add multiport support for DWC3 controllers
Message-ID: <ZDhP823LUMCDuD9q@fedora>
References: <20230405125759.4201-1-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405125759.4201-1-quic_kriskura@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

> Krishna Kurapati (8):
>   dt-bindings: usb: Add bindings for multiport properties on DWC3
>     controller
>   usb: dwc3: core: Access XHCI address space temporarily to read port
>     info
>   usb: dwc3: core: Skip setting event buffers for host only controllers
>   usb: dwc3: core: Refactor PHY logic to support Multiport Controller
>   usb: dwc3: qcom: Add multiport controller support for qcom wrapper
>   arm64: dts: qcom: sc8280xp: Add multiport controller node for SC8280
>   arm64: dts: qcom: sa8295p: Enable tertiary controller and its 4 USB
>     ports
>   arm64: dts: qcom: sa8540-ride: Enable first port of tertiary usb
>     controller
>
>  .../devicetree/bindings/usb/snps,dwc3.yaml    |  13 +-
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts	 |  47 +++
>  arch/arm64/boot/dts/qcom/sa8540p-ride.dts     |  22 ++
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  58 +++
>  drivers/usb/dwc3/core.c                       | 373 ++++++++++++++----
>  drivers/usb/dwc3/core.h                       |  71 +++-
>  drivers/usb/dwc3/drd.c                        |  13 +-
>  drivers/usb/dwc3/dwc3-qcom.c                  |  28 +-
>  8 files changed, 523 insertions(+), 102 deletions(-)

I tested this series on the sa8540p-ride, with a USB Ethernet adapter
plugged into the board. The device shows up as expected:

# lsusb -tv
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 10000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
    |__ Port 1: Dev 2, If 0, Class=Vendor Specific Class, Driver=r8152, 5000M
        ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabit Ethernet Adapter
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/4p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub

Tested-by: Adrien Thierry <athierry@redhat.com> # sa8540p-ride

