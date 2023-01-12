Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0085E667D67
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jan 2023 19:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240334AbjALSFH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Jan 2023 13:05:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240260AbjALSDm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Jan 2023 13:03:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833075D6B1;
        Thu, 12 Jan 2023 09:28:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FB9B620B9;
        Thu, 12 Jan 2023 17:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AACC433EF;
        Thu, 12 Jan 2023 17:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673544481;
        bh=wFw13Nu3ncr/oEbKb/ffo480FdbGpZHX50m/K4RKsJ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=otwY419mR0l7/xe7g8iyDAjV/R9ilQUPc/X2xlbE+X9bFvOR90xTdup+DBJXKDNUd
         I9gH4MqF7VdzcHLhaFwa5jBUZp9tE4EdyXgMZ5zpatnevh2kTrifK1EJgdze3suCNC
         MA5tspzwWjx+wQ7thH0xho8y7mwGUHyrFdj+/cPg1YhxU+j16MrC9n9b0IbK97mQYi
         7Dym9tTFXk4jZlqpjqMWfmvxgD4x86St7rFP/jdjt64qLSUm2IOCfQbtcPYUNmYaVx
         Wr0qFeOyg5HRyqNCofeEGGfIaZgIQWae7wZfUpsa7YFeJEvOgAGCP655AgDDt6l4Vm
         QILylIPLnNwJA==
Date:   Thu, 12 Jan 2023 22:57:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        waynec@nvidia.com
Subject: Re: [PATCH V6 4/6] phy: tegra: xusb: Disable trk clk when not in use
Message-ID: <Y8BDHVIeKJjVcLng@matsya>
References: <20230111110450.24617-1-jonathanh@nvidia.com>
 <20230111110450.24617-5-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111110450.24617-5-jonathanh@nvidia.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11-01-23, 11:04, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Pad tracking is a one-time calibration for Tegra186 and Tegra194.
> Clk should be disabled after calibration.
> 
> Disable clk after calibration.
> While at it add 100us delay for HW recording the calibration value.

I have applied these two, somehow replied to an older thread..

Sorry for the noise

-- 
~Vinod
