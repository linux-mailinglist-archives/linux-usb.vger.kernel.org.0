Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74F64718865
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 19:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbjEaRXY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 13:23:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjEaRXX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 13:23:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 617D619D;
        Wed, 31 May 2023 10:23:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DF7C261CEB;
        Wed, 31 May 2023 17:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693C3C433EF;
        Wed, 31 May 2023 17:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685553798;
        bh=wz2oExCTWXz/YTzKNgSYrty0/vs3oo6vyNQBeMQA99c=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=cHjhB3vGtTZ49a4FoVzGfBdT+o7cKEf5blu01O1NaNKtli7Y7DT387imqRQRhd8Jv
         nFJHc60VdeZ9Thc/fyeRDJygmygczLv/fkIdmOB5MXioTnMOmOsOjrc8nvBfcmxrdo
         f9BhHlczph/KK5CFm+c9zVKdn8zP5lcigaP4ZJn4w+8xdxmSUTUGq/ls7RZeX/yD2D
         7U/BY0Ux9NdPzLHWbxlIhZ7Qxou6cjtzN1HVaIpcyE5eNLW2l4rHkMuXla+O00gQRk
         oeJLDAjhNFGGNp9FedoSHGNjkkbWNUOb4j49/mG1i8HyrOy/bWQoP8rsUOtbtLGF/k
         0ZNqmkHRCx2eg==
Message-ID: <55751ab6-4f6b-6d9f-c090-8216c5f5f357@kernel.org>
Date:   Wed, 31 May 2023 19:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: usb: ci-hdrc-usb2: add fsl,imx8ulp-usb
 compatible
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, peter.chen@kernel.org,
        robh+dt@kernel.org
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com, devicetree@vger.kernel.org,
        peng.fan@nxp.com
References: <20230530104007.1294702-1-xu.yang_2@nxp.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230530104007.1294702-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30/05/2023 12:40, Xu Yang wrote:
> The imx8ulp and imx8dxl are compatible. This will add fsl,imx8ulp-usb
> to the compatible property.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

