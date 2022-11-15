Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F977629581
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 11:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiKOKO2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 05:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238463AbiKOKOH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 05:14:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCF86557
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 02:13:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 64080B81888
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 10:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10351C433D6;
        Tue, 15 Nov 2022 10:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668507209;
        bh=m9DMb6tp6KcIy4XZocqizRTEwugz/GRNsOzBDtBe/94=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GRqXbC8Zt9jo0ahiJmSaxSU3sdzzXRDNw9vwbCOUU8hbRaEW/zJ99QeOXIvVAbq4+
         gyxl1zCmp/Sh2SZzor9rvLla9tbmHiCZsCfLG9UjG5cKnp3beT92BcSEHoKJY0uYxP
         +3WcSyyAE6e8NuxhhLgi9iAP5A8TbUJF4H2NtW8k0dm/oESVXiQRZD7x1AWw7kh4OU
         A9YFZiVfcsueCiEYNQx/FSEDBMAM2UMe0V4LIB+/kEkhiZFOUuFcysx5q3GCAzhzmB
         omPp2FtelcmiZ4KRTW7OI/gwovw16fwsTxhuVafBtBHeVafi2Fp5ZbXVm6qaCVhKDg
         2X4ppkux8URKg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ousw6-0005xh-RD; Tue, 15 Nov 2022 11:12:58 +0100
Date:   Tue, 15 Nov 2022 11:12:58 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     larsm17@gmail.com, cesare.marzano@gmail.com,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net
Subject: Re: [PATCH v5 1/3] USB: serial: option: remove old LARA-R6 PID
Message-ID: <Y3NmKk0Xte04qxwS@hovoldconsulting.com>
References: <6572c4e6-d8bc-b8d3-4396-d879e4e76338@gmail.com>
 <20221109161713.31723-1-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109161713.31723-1-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 09, 2022 at 05:17:11PM +0100, Davide Tronchin wrote:
> The LARA-R6 module old PID (defined as: UBLOX_PRODUCT_R6XX
> 0x90fa) has been removed since is no longer used by the
> current u-blox LARA-R6 product. However, PID 0x90fa has been
> kept to maintain the support to other products that use the
> same VID/PID.

First, please wrap your commit messages at 72 column or so (not 60).

We've asked you repeatedly whether you for u-blox or not, but you keep
ignoring this question. Knowing this would allow us to better evaluate
the reasoning and motivation behind this this change.

The above commit message still does not explain why you want to remove
it and whether it would be safe to do so. Why was added in the first
place? What u-blox products used the old PID?

By just removing the define this is less of an issue, but you should
not make the life of reviewers harder by ignoring request to properly
motivate your changes and explain why they are safe to apply.

> Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
> ---
> 
> V4 -> V5: kept PID 0x90fa to maintain the support for other products
> which use VID:PID 0x05c6:0x90fa. Remove interface 4 from blacklist
> for LARA-L6 default mode since it is not needed.

You can either put a shared changelog for the whole series in a cover
letter, or you describe changes to each individual patch. But mixing the
two styles as you do in this entry is just confusing.

> V3 -> V4: as requested, the patch has been split to 3 sub-patches.
> Fix comment format.
> 
> V2 -> V3: added this section to tracking changes with previous versions.
> Added some explanations about the RSVD(4) in the description session.
> Added reservation to port 4 of VID:PID 0x05C6:0x908B to meet other
> companies QMI net interface implementation.
> 
> V1 -> V2: define UBLOX_PRODUCT_LARA_R6 0x908b has been deleted together
> with the previosly provided definition of USB_DEVICE since the PID
> is used by another vendor.
> The LARA-L6 patch part is the same of the previosly provided one.

Johan
