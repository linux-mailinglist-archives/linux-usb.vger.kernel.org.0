Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE47562C4B3
	for <lists+linux-usb@lfdr.de>; Wed, 16 Nov 2022 17:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbiKPQgs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Nov 2022 11:36:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbiKPQgV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Nov 2022 11:36:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BD75C74E
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 08:29:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7CF79B81DEC
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 16:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CE8C433D7;
        Wed, 16 Nov 2022 16:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668616159;
        bh=chVweo/0y0NJQniiLlPitJWa5QCPp1YcpEWWlv4WefI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZXRbPkjPJ44HymZuOmu/vcT4wfrIHPOGIhgyXc1cujee5WNf96F36/rp/IfzV0CFp
         4806VxBwx+XXcnUzcWG11lzyNMCGnWQHRv/r3L09ubQvVCnJ3iUKS2ILrr6I43as5M
         fS9bSAHfVDQxfEC2umuIjNRPHyQ0mafFV27Evrbv3uzF1HplrZ3aPaZjCLBLlhE6go
         EZ0VhKO6DULlRC9iv44jZJo9Dn4Rg3oFZhJaAeSFRcjralQAhf09go5pmyM6bjT7RK
         D1chr6eEkaZbPRYjNXkr0kUW5meEYDpofIFXnS+JblMB0F5vImYjlF5QB4zRRsXUkV
         YNsFggdUNZPIg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ovLHM-0000n2-Vf; Wed, 16 Nov 2022 17:28:49 +0100
Date:   Wed, 16 Nov 2022 17:28:48 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Davide Tronchin <davide.tronchin.94@gmail.com>
Cc:     cesare.marzano@gmail.com, gregkh@linuxfoundation.org,
        larsm17@gmail.com, linux-usb@vger.kernel.org,
        marco.demarco@posteo.net
Subject: Re: [PATCH v6 3/3] USB: serial: option: add u-blox LARA-L6 modem
Message-ID: <Y3UPwHgeu1wE9IzX@hovoldconsulting.com>
References: <Y3SzfG9ljTbeQyWU@hovoldconsulting.com>
 <20221116155950.59609-1-davide.tronchin.94@gmail.com>
 <20221116155950.59609-3-davide.tronchin.94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116155950.59609-3-davide.tronchin.94@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 16, 2022 at 04:59:50PM +0100, Davide Tronchin wrote:
> Add LARA-L6 PIDs for three different USB compositions.
> 
> LARA-L6 module can be configured (by AT interface) in three different
> USB modes:
> * Default mode (Vendor ID: 0x1546 Product ID: 0x1341) with 4 serial
> interfaces
> * RmNet mode (Vendor ID: 0x1546 Product ID: 0x1342) with 4 serial
> interfaces and 1 RmNet virtual network interface
> * CDC-ECM mode (Vendor ID: 0x1546 Product ID: 0x1343) with 4 serial
> interface and 1 CDC-ECM virtual network interface
> 
> In default mode LARA-L6 exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parser/alternative functions
> 
> In RmNet mode LARA-L6 exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parset/alternative functions
> If 4: RMNET interface
> 
> In CDC-ECM mode LARA-L6 exposes the following interfaces:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: AT parset/alternative functions
> If 4: CDC-ECM interface
> 
> Signed-off-by: Davide Tronchin <davide.tronchin.94@gmail.com>
> ---
> 
> V5 -> V6: no changes.
> 
> V4 -> V5: kept PID 0x90fa to maintain the support for other products
> which use VID:PID 0x05c6:0x90fa. Remove interface 4 from blacklist
> for LARA-L6 default mode since it is not needed.
> 
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
> 
>  drivers/usb/serial/option.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 011b9a3b7571..f892a3c80cf1 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -580,6 +580,11 @@ static void option_instat_callback(struct urb *urb);
>  #define OPPO_VENDOR_ID				0x22d9
>  #define OPPO_PRODUCT_R11			0x276c
>  
> +/* These u-blox products use u-blox's vendor ID */
> +#define UBLOX_VENDOR_ID				0x1546
> +#define UBLOX_PRODUCT_LARA_L6			0x1341
> +#define UBLOX_PRODUCT_LARA_L6_RMNET		0x1342
> +#define UBLOX_PRODUCT_LARA_L6_ECM		0x1343

I dropped the PID defines in favour of comments (like the one you added
in patch 2/3). I've been trying to move away from using defines as they
often end up adding twice as many lines to the file for every entry.

The result is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/log/?h=usb-linus

Thanks for sticking with it!

Johan
