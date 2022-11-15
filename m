Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B46E7629629
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 11:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237401AbiKOKod convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 15 Nov 2022 05:44:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbiKOKoc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 05:44:32 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 074E921E09;
        Tue, 15 Nov 2022 02:44:31 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1232B13D5;
        Tue, 15 Nov 2022 02:44:37 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 061473F73B;
        Tue, 15 Nov 2022 02:44:28 -0800 (PST)
Date:   Tue, 15 Nov 2022 10:44:26 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Icenowy Zheng <uwu@icenowy.me>, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 03/11] phy: sun4i-usb: add support for the USB PHY on
 F1C100s SoC
Message-ID: <20221115104426.20728ba5@donnerap.cambridge.arm.com>
In-Reply-To: <52920a00-8e29-f7f4-0cbd-ceb638ded970@linaro.org>
References: <20221106154826.6687-1-andre.przywara@arm.com>
        <20221106154826.6687-4-andre.przywara@arm.com>
        <Y2ypy0CM8rJGu2g4@matsya>
        <4438485.LvFx2qVVIh@jernej-laptop>
        <52920a00-8e29-f7f4-0cbd-ceb638ded970@linaro.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 15 Nov 2022 11:03:24 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi,

> On 15/11/2022 07:01, Jernej Škrabec wrote:
> > Dne četrtek, 10. november 2022 ob 08:35:39 CET je Vinod Koul napisal(a):  
> >> On 06-11-22, 15:48, Andre Przywara wrote:  
> >>> From: Icenowy Zheng <uwu@icenowy.me>
> >>>
> >>> The F1C100s SoC has one USB OTG port connected to a MUSB controller.
> >>>
> >>> Add support for its USB PHY.  
> >>
> >> This does not apply for me, please rebase and resend
> >>
> >> Also, consider splitting phy patches from this. I dont think there is
> >> any dependency  
> > 
> > DT patches in this series depend on functionality added here.
> >   
> 
> DTS always goes separately from driver changes because it is a hardware
> description. Depending on driver means you have potential ABI break, so
> it is already a warning sign.

We understand that ;-)
What Jernej meant was that the DTS patches at the end depend on patch
01/10, which adds to the PHY binding doc. I am not sure if Vinod's
suggestion was about splitting off 01/10, 03/10, and 10/10, or just the
two latter which touch the driver.

I can split off 03/10 and 10/10, rebased on top of linux-phy.git/next, and
send that to Vinod.
Then I would keep 01/10 in a respin of this series here, to satisfy the
dependency of the later DTS patches, and Vinod can pick that one patch from
there?

Cheers,
Andre
