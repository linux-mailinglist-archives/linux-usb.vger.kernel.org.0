Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12575788204
	for <lists+linux-usb@lfdr.de>; Fri, 25 Aug 2023 10:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239827AbjHYI0e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Aug 2023 04:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236153AbjHYI0b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Aug 2023 04:26:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7472D19AD
        for <linux-usb@vger.kernel.org>; Fri, 25 Aug 2023 01:26:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E93AD6301E
        for <linux-usb@vger.kernel.org>; Fri, 25 Aug 2023 08:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013BAC433C8;
        Fri, 25 Aug 2023 08:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1692951988;
        bh=owpUMkp0azCkG+HmzXnW2yDvdKP9Q/68cMZyiKE4zn0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AJZc8PBkfFmkrk0nhsNoYRhjGsKKUSnhotesEYDP7lKnwIecK3cRUPtenOTOsoZx2
         Qg+gc+qd+DhrxWj5xlvCw1CT1JkCrHrlOx4KvwrlAm2zwgXspUXjVBEI8TPH/Mm49s
         p3skT+8euhE99Hk9T1JBQkWk/SjTuB7+gKJpsBeM=
Date:   Fri, 25 Aug 2023 08:45:24 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Uday M Bhat <uday.m.bhat@intel.com>
Cc:     heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: intel_pmc_mux: enable sysfs usb role
 access
Message-ID: <2023082502-stimulus-renderer-d584@gregkh>
References: <20230825062157.14820-1-uday.m.bhat@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825062157.14820-1-uday.m.bhat@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 25, 2023 at 11:51:57AM +0530, Uday M Bhat wrote:
> The OS, such as ChromeOS, uses Android Runtime to run Android applications.
> This necessitates supporting tools, for example, Android Debugger (ADB).
> On host to host setup xHC.DbC shall support ADB with USB. This requires
> user space to control USB roles.
> 
> Enable user space control to modify the USB Type-C role. At run time
> it will create a role attribute in /sys/class/usb_role/<switch>/.
> Attribute can be modified based on the values suggested in the
> Documentation/ABI/testing/sysfs-class-usb_role.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
> ---
>  drivers/usb/typec/mux/intel_pmc_mux.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
> index 60ed1f809130..12a4f49e870e 100644
> --- a/drivers/usb/typec/mux/intel_pmc_mux.c
> +++ b/drivers/usb/typec/mux/intel_pmc_mux.c
> @@ -599,6 +599,7 @@ static int pmc_usb_register_port(struct pmc_usb *pmc, int index,
>  	desc.driver_data = port;
>  	desc.name = fwnode_get_name(fwnode);
>  	desc.set = pmc_usb_set_role;
> +	desc.allow_userspace_control = true;
>  
>  	port->usb_sw = usb_role_switch_register(pmc->dev, &desc);
>  	if (IS_ERR(port->usb_sw)) {
> -- 
> 2.17.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
