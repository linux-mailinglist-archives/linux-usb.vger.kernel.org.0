Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62E696DF238
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 12:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjDLKwH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 06:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjDLKwG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 06:52:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81CF46A40
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 03:52:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FE9462EAC
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 10:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6821C433D2;
        Wed, 12 Apr 2023 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681296724;
        bh=4Q0prU3QkbEf2xQVRp190ht/LY+hHQUqRRhSeFaDkvk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OQ0xvwOZlJsQeg1ab/HcwnorYKw2E7ItzSNOpLjQKONkkaQPcX+x2tT5zsQT8gV6h
         ukaOxrcK671aIQirTUepVMWN16Mw5VJFWrNloFsqZIAiB/Xfn+rG63ZPEtSSO4Jfa+
         MNfyFeHI2QKyQpHqadnok5tF7RYPEPBXlXT1XrIL5f14dLXCqy8dEC0oWrQrCopIGp
         9FLFH+otlLVEUdiEBtSJ7rJ6CBLu01P59r6jGo/9p4giISiwyExBfbHNjW84DvImHc
         rhK/KaLBGjS/QkQtFVEvC7svHxBADSGl7mi9lkFprd7DIHQIrb//sKME84778cwsuz
         T2tf74a4dfqJQ==
Message-ID: <42476475-3de1-49e8-4cfe-a9b3d98df8be@kernel.org>
Date:   Wed, 12 Apr 2023 12:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: snps,dwc3: Add
 'snps,parkmode-disable-hs-quirk' quirk
Content-Language: en-US
To:     Stanley Chang <stanley_chang@realtek.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org
References: <20230411053550.16360-1-stanley_chang@realtek.com>
 <20230411053550.16360-2-stanley_chang@realtek.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230411053550.16360-2-stanley_chang@realtek.com>
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

On 11/04/2023 07:35, Stanley Chang wrote:
> Add a new 'snps,parkmode-disable-hs-quirk' DT quirk to dwc3 core for
> disable the high-speed parkmode.
> 
> Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

NAK, so Greg won't pick it up too fast. :)

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

