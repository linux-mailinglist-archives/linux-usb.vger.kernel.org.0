Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC7674CA44
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jul 2023 05:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjGJDON (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jul 2023 23:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjGJDOI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jul 2023 23:14:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C914123;
        Sun,  9 Jul 2023 20:14:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E897460C1A;
        Mon, 10 Jul 2023 03:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B617C433C8;
        Mon, 10 Jul 2023 03:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688958839;
        bh=MbR80reZo0Bzpu33a9ainCVR9ktbCwAYXxBd/xs9U54=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bluLy2cvUUJMQSI9kdS2iBd29QCB1Sp+ic4KTLHg74DjZtt50pOPNB3p0e4fnrCxN
         hETUuRf5J598Wj/5ko1ilrV1q+aFzcTUS908tYxHTqF/TmDvANXooeUxvk4pSrbYSi
         loKPUxeLBRY9WVsc6GGHzNdfI6ONW+bdFs2/HdrXx2z9i7frXbNzoX4NLH8lx0pBmO
         jhqKI3aVVTLZdLO9T4xGk/xaZGXBqk4xKLykQcXE5Ylt3+FVljyAO8ZQm6RWj2we60
         NpH9ecpkhfPqu8wbjqC0rvUbfzagcDQWCPWCiY0cda5QgE7RBGkjS/ve3lDciJcupP
         mmXV3Jv9iLu/A==
Date:   Mon, 10 Jul 2023 11:13:47 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gregkh@linuxfoundation.org, conor+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, linux-imx@nxp.com,
        peng.fan@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: ci-hdrc-usb2: add
 fsl,picophy-rise-fall-time-adjust property
Message-ID: <20230710031347.GC2418446@nchen-desktop>
References: <20230627112126.1882666-1-xu.yang_2@nxp.com>
 <20230627112126.1882666-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230627112126.1882666-2-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23-06-27 19:21:25, Xu Yang wrote:
> The fsl,picophy-rise-fall-time-adjust property can help to adjust the
> rise/fall times of the high-speed transmitter waveform. The value can be
> 0~3. It has no unit. According to the description of USBNC_n_PHY_CFG1
> register, the rise/fall time will be increased or decreased by a certain
> percentage relative to design default time if a value is given to this
> property.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> 
> ---
> Changes in v2:
>  - rename property to fsl,picophy-rise-fall-time-adjust
>  - add default: 1
>  - add some description in yaml and commit msg
> ---
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 782402800d4a..532d6464c8b3 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -292,6 +292,18 @@ properties:
>      minimum: 0x0
>      maximum: 0xf
>  
> +  fsl,picophy-rise-fall-time-adjust:
> +    description:
> +      HS Transmitter Rise/Fall Time Adjustment. Adjust the rise/fall times
> +      of the high-speed transmitter waveform. It has no unit. The rise/fall
> +      time will be increased or decreased by a certain percentage relative
> +      to design default time. (0:-10%; 1:design default; 2:+15%; 3:+20%)
> +      Details can refer to TXRISETUNE0 bit of USBNC_n_PHY_CFG1.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 3
> +    default: 1
> +
>    usb-phy:
>      description: phandle for the PHY device. Use "phys" instead.
>      $ref: /schemas/types.yaml#/definitions/phandle
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
