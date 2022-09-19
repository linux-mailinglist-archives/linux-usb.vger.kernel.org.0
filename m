Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8685BCC34
	for <lists+linux-usb@lfdr.de>; Mon, 19 Sep 2022 14:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiISMx5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Sep 2022 08:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiISMx4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Sep 2022 08:53:56 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08B52A97F
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 05:53:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id s6so35557258lfo.7
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/PlsYiCrYWE3bNlljtDybc2jsSxBRlcBGhvAcXnx76o=;
        b=Wk54QdhT+uSI4NX9O4XjfgrXNbvDSX3QfnsKmAGKZ0PyeLslUzyqRd4mc0P++8LjIc
         GAJ3ldbBLjMls6DnSYrtn2AiRrCuFwMiT0ztv3MsDsny94NsfHJTdkPi5CcqXOOZNwkf
         gGOmpVG1mE6Po+sfBtq6TWVCWjWNCYBfzzrisc9vJ3DCs9X7EXylEW8ALQhIry3BiLvW
         H78GKd8ZJSGIohupvx/4t9ZxFMmS4I8LOyJq0sQth5jXsNVcHdYJ7ckS8Grt4SNPVge0
         cI49XIJwPq7JmdPleAJtbyP6W50xvZtw2/05xFOsCPNTifIO6dMSBQckncu6o4G0KuJ+
         CH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/PlsYiCrYWE3bNlljtDybc2jsSxBRlcBGhvAcXnx76o=;
        b=SMPNgCl4ijU53bKdqM/UuRWCTtypeC0fLZMn4Vf9P8Q4pM36ENKaSe1Py4aOuU1saR
         +U6ewxPF5VdLgLSBWlnIppmi5O7FanRrGvoQyD/qWh00v6nr5wcmaGGV5cMvvZkl0mAo
         qxzvDqhBBCzXiUxQteWf22oCTvACnL1iVepHgix5pTnaIXRlAPdoARmjaQrIvBcanxyk
         jBkoK7A/58MllPaB8pnqFG650M00MGKxfcrxSijug4Z+oVqQ6V779qfzbv9WsO98+Gjw
         hZx4rHAk9NL4q0gzQAwITdjagCwxWoVuiaIR72VW89ZncHieOYxGg0TQf/OzR1TyD8r0
         scYg==
X-Gm-Message-State: ACrzQf0HL63o+0UVGLKTXDdYnGmuoLnFxi2wDl23ewpDhsrUhiGlAxVn
        jVujYvibsm1JsoHfzpQgv4GpOA==
X-Google-Smtp-Source: AMsMyM6A5zURCyKZYmCY6ziuosivrysIUKdXrEILh2PowSWcOxVqYOZKG4R6OmzpKJ7ip8fTg8HDug==
X-Received: by 2002:a05:6512:1094:b0:498:f9ed:71 with SMTP id j20-20020a056512109400b00498f9ed0071mr7093535lfg.556.1663592033056;
        Mon, 19 Sep 2022 05:53:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h1-20020a0565123c8100b004979e231fafsm5165669lfv.38.2022.09.19.05.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 05:53:52 -0700 (PDT)
Message-ID: <6499fa0e-3e07-85b4-0800-849db7c2593b@linaro.org>
Date:   Mon, 19 Sep 2022 14:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V2 1/2] dt-bindings: usb: snps,dwc3: Add
 'snps,resume-hs-terminations' quirk
Content-Language: en-US
To:     Piyush Mehta <piyush.mehta@amd.com>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        balbi@kernel.org, linux-usb@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        git@amd.com, michal.simek@amd.com,
        siva.durga.prasad.paladugu@amd.com,
        Piyush Mehta <piyush.mehta@xilinx.com>
References: <20220919104816.4075019-1-piyush.mehta@amd.com>
 <20220919104816.4075019-2-piyush.mehta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919104816.4075019-2-piyush.mehta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 19/09/2022 12:48, Piyush Mehta wrote:
> From: Piyush Mehta <piyush.mehta@xilinx.com>
> 
> Add a new 'snps,resume-hs-terminations' DT quirk to dwc3 core to resolved
> issue of CRC failed error.
> 
> On the resume path, U3/U2 exit controller fails to send proper CRC checksum
> in CRC5 field. As result Transaction Error is generated. Enabling bit 10 of
> GUCTL1 will correct this problem.
> 
> When this bit is set to '1', the UTMI/ULPI opmode will be changed to
> "normal" along with HS terminations and term/xcvr select signals after EOR.
> This option is to support certain legacy UTMI/ULPI PHYs.
> 
> Signed-off-by: Piyush Mehta <piyush.mehta@xilinx.com>
> Signed-off-by: Piyush Mehta <piyush.mehta@amd.com>

Only one SoB is needed for one person. For example switch to amd.com
(with ownership of commit) or skip second SoB.

> ---
> Changes in V2:
> - Addressed Krzysztof Kozlowski review comments
>  - Update the quirk name and No underscores in properties.
>  - Modified the quirk description. 
> Link: https://lore.kernel.org/all/e15168ac-b5a1-0c15-cfb3-34fb518e737f@linaro.org/
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
