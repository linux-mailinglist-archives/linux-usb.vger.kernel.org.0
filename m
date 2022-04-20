Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C67115084AA
	for <lists+linux-usb@lfdr.de>; Wed, 20 Apr 2022 11:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377100AbiDTJSQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Apr 2022 05:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355436AbiDTJSP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Apr 2022 05:18:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44EB53BFA3
        for <linux-usb@vger.kernel.org>; Wed, 20 Apr 2022 02:15:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 012BDB81D71
        for <linux-usb@vger.kernel.org>; Wed, 20 Apr 2022 09:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C8AC385A1;
        Wed, 20 Apr 2022 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650446127;
        bh=YZpgm2oLQIhGYSsJHeZt6621ZcIMfilgUqq05fnGaHw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ay0CYfaov/syyJpC3MEn++aJaSN4ZYTppaQhYyLpt76Du+VvvnDkKhqmrbbrK0KOq
         WTQMwmOwYpvJc0weS8K0SoT1hUb3WIysylBicOcrRDUvi2HGgenZ1kOSEvefokoevl
         dQ6AMfoOQFHJ5j9jqxudMP2Slblot7tH6/1WTsB1cz6Lr+7/s5V1lSDlixVh0kxGFV
         3F8sx/VlfsSz1/DrKlvPgFA4sYCMkPkETIx+mdF+hg0r0SkPZkK91ul8IDj20LXaQx
         6ldIsvPmLKJKDqvVpjpX74wellsf2b3OfJGkTVVlBggwzAGPr0jkBBrdUzCxQAtNhy
         bOLzfzBGZ/UzQ==
Date:   Wed, 20 Apr 2022 14:45:23 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jules Maselbas <jmaselbas@kalray.eu>
Cc:     linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Yann Sionneau <ysionneau@kalray.eu>,
        Michael Grzeschik <mgr@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RESEND v3 0/3] Cleanup the call ordering of phy_init and
 phy_power_on
Message-ID: <Yl/PK6Mw4BQeoAOA@matsya>
References: <20220407102108.24211-1-jmaselbas@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407102108.24211-1-jmaselbas@kalray.eu>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 07-04-22, 12:21, Jules Maselbas wrote:
> Hi,
> 
> Last year Ahmad asked what is the correct order when calling phy_init
> and phy_power_on. Since then, I didn't see the situation improve much
> and I am once again toying around with usb phy driver.
> 
> The following two patches were in my tree for a year... Last year i
> previously tried to change the call order in the dwc2 driver but this
> requires the relevent phy to be also compatible with the "new" ordering.
> The stm32-usbphyc driver wasn't compatible, I am not sure if that is
> still is the case.
> 
> For now simply add documentation, hopefully correct, but I am not an
> expert on actual phy sementics or usage in the kernel. And add warning
> when the order is not what's expected.

Applied, thanks

-- 
~Vinod
