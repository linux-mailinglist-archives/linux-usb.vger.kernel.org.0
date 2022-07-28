Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36345583FE1
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 15:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233591AbiG1NYj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 09:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiG1NYh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 09:24:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D565073D
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 06:24:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A3AC61CF1
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 13:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735F7C433C1;
        Thu, 28 Jul 2022 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1659014675;
        bh=0TYSG2JXFBXdSAtxbfAfbEuQd8Kr6ciZMdYn6KYvVcM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FfNO9NXSvYLNlY7MN/wLV1YtTS5FWlTr0hBJUO4k6n3riwypGA6qhfzqdSPilErRM
         5LlWpj8E9vTgpEUeU9Y7cQepAm+1mHVE+8gM8FuP3Y7OFjiR6rptgLB8+0+86XGEqO
         g6muf3MJ/MRlfL5vSfKAs6JUV0GlgTcDJe6RaV7s=
Date:   Thu, 28 Jul 2022 15:24:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lukasz Bartosik <lb@semihalf.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH v1] thunderbolt: fix PCI device class after powering up
Message-ID: <YuKOERUVa1/mPX9j@kroah.com>
References: <20220728131608.31901-1-lukasz.bartosik@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220728131608.31901-1-lukasz.bartosik@semihalf.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 28, 2022 at 03:16:08PM +0200, Lukasz Bartosik wrote:
> From: Łukasz Bartosik <lb@semihalf.com>
> 
> A thunderbolt
> lspci -d 8086:9a1b -vmmknn
> Slot:	00:0d.2
> Class:	System peripheral [0880]
> Vendor:	Intel Corporation [8086]
> Device:	Tiger Lake-LP Thunderbolt 4 NHI #0 [9a1b]
> 
> presents itself with PCI class 0x088000 after Chromebook boots.
> lspci -s 00:0d.2 -xxx
> 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt 4
> NHI #0 (rev 01)
> 00: 86 80 1b 9a 00 00 10 00 01 00 80 08 00 00 00 00
> ...
> 
> However after thunderbolt is powered up in nhi_probe()
> its class changes to 0x0c0340
> lspci -s 00:0d.2 -xxx
> 00:0d.2 System peripheral: Intel Corporation Tiger Lake-LP Thunderbolt 4
> NHI #0 (rev 01)
> 00: 86 80 1b 9a 06 04 10 00 01 40 03 0c 00 00 00 00
> ...
> 
> which leaves pci_dev structure with old class value
> cat /sys/bus/pci/devices/0000:00:0d.2/class
> 0x088000
> 
> This fix updates PCI device class in pci_dev structure after
> thunderbolt is powered up.
> 
> Fixes: 3cdb9446a117 ("thunderbolt: Add support for Intel Ice Lake")
> Signed-off-by: Łukasz Bartosik <lb@semihalf.com>
> ---
>  drivers/thunderbolt/nhi_ops.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/thunderbolt/nhi_ops.c b/drivers/thunderbolt/nhi_ops.c
> index 96da07e88c52..6a343d7e3f90 100644
> --- a/drivers/thunderbolt/nhi_ops.c
> +++ b/drivers/thunderbolt/nhi_ops.c
> @@ -160,12 +160,17 @@ static int icl_nhi_suspend_noirq(struct tb_nhi *nhi, bool wakeup)
>  
>  static int icl_nhi_resume(struct tb_nhi *nhi)
>  {
> +	u32 class;
>  	int ret;
>  
>  	ret = icl_nhi_force_power(nhi, true);
>  	if (ret)
>  		return ret;
>  
> +	/* Set device class code as it might have changed after powering up */
> +	pci_read_config_dword(nhi->pdev, PCI_CLASS_REVISION, &class);
> +	nhi->pdev->class = class >> 8;

What about the revision field, why not set that as well:
	nhi->pdev->revision = class & 0xff;

If the value is overwritten for 3 of the bytes, why not the 4th?

Also this feels odd, what is changing the bytes here?  Why only the
class?  What else changed and what caused it?

thanks,

greg k-h
