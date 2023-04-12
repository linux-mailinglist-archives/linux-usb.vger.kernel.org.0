Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB506DF236
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 12:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbjDLKv1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 06:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjDLKvZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 06:51:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B2C66A40
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 03:51:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3F73E632B0
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 10:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C62C433D2;
        Wed, 12 Apr 2023 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681296683;
        bh=yDA4h/S/EoSw7I+oMiXeWzbGafK8NFsyI/KHKHy6ffM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=tIotCRZPbh6/l7EYByiSSm9TCbIMEyknccXsCl09Qt3C0xperQjoA8mI2VXro9jV/
         rq0blcnB/5bzhm8oWlEwS8csbo4pSp8NhMoRFlYBc/39FCTMX0/3BFK+uDiNoSDxhy
         U5UC3XUmlYIk4u6tzhCtBnfbP/CHfiKHtDkqQKHOLM0Vs0BvMzzWZH1jXEm93tYFSz
         d+o+/qSwrGODrZ5F7Gx3hgyL3BW6CtI3K3SXligOZYyE/wit/qcnYKclSqytzQwQxw
         WY+LAkv8uax6+F8xzv62kTP8OynS3HNc2uElZFmsAzWORGjCUyMCdcxWEeLJ8aOjbA
         pdQjwdSZiV4mQ==
Message-ID: <955cc334-eaac-5880-51cf-8ab171f0ef48@kernel.org>
Date:   Wed, 12 Apr 2023 12:51:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: snps,dwc3: Add
 'snps,global-regs-starting-offset' quirk
To:     Stanley Chang <stanley_chang@realtek.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
References: <20230412033006.10859-1-stanley_chang@realtek.com>
 <20230412033006.10859-2-stanley_chang@realtek.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230412033006.10859-2-stanley_chang@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/04/2023 05:30, Stanley Chang wrote:
> Add a new 'snps,global-regs-starting-offset' DT to dwc3 core to remap
> the global register start address
> 
> The RTK DHC SoCs were designed the global register address offset at
> 0x8100. The default address is at DWC3_GLOBALS_REGS_START (0xc100).
> Therefore, add the property of device-tree to adjust this start address.
> 
> Signed-off-by: Stanley Chang <stanley_chang@realtek.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Since you skipped lists used in automated check, that's
unfortunately: NAK


> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
Best regards,
Krzysztof

