Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65E9E6B2265
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 12:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbjCILPP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 06:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbjCILOp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 06:14:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83833F05C3
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 03:10:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 34303B81ED2
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 11:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8F1C4339C;
        Thu,  9 Mar 2023 11:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678360205;
        bh=+9j6aT1NV9dO4t6XZnDLUIs+1xMA+7omvfwPuQ//xbM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wb4tuErccVU0lEDK50No/GZoZqyllSxuXYbCgCpCUQFaj0oUh6jzKOZ11dpocqLXo
         M7WuiJkCa2rTtU8yq0OfF3eqoJrO66JPE5CXnZkRtfbo8yyfkJRmH2J9rp6rezg7OW
         lxkL2kN24JMqAZVMQ3/FGNI69UT3aJSHft8aiilU=
Date:   Thu, 9 Mar 2023 12:10:02 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kangzhen Lou <kangzhen.lou@dell.com>
Cc:     oliver@neukum.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] net: cdc_ncm: support ACPI MAC address pass through
 functionality
Message-ID: <ZAm+irMSf7FrcGK3@kroah.com>
References: <20230309083436.6729-1-kangzhen.lou@dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309083436.6729-1-kangzhen.lou@dell.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 09, 2023 at 04:34:36PM +0800, Kangzhen Lou wrote:
> Make cdc_ncm to support ACPI MAC address pass through functionality that
> also exists in the Realtek r8152 driver.
> 
> RTL8153DD will load cdc_ncm driver by default with mainline 6.2 kernel.
> This is to support Realtek RTL8153DD Ethernet Interface Controller's MAC
> pass through function which used in dock, dongle or monitor.
> 
> Although there is patch “ec51fbd1b8a2bca2948dede99c14ec63dc57ff6b” will
> make RTL8153DD load r8152-cfgselector instead cdc_ncm driver, would also
> submit this patch in case anyone need this feature in cdc_ncm in the
> future.

Please reference commits in the correct way, as documented:
	ec51fbd1b8a2 ("r8152: add USB device driver for config selection")

But because of that commit, why is your change needed at all?

> 
> Signed-off-by: Kangzhen Lou <kangzhen.lou@dell.com>
> ---
>  drivers/net/usb/cdc_ncm.c | 199 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 197 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
> index 6ce8f4f0c70e..8179516b819c 100644
> --- a/drivers/net/usb/cdc_ncm.c
> +++ b/drivers/net/usb/cdc_ncm.c
> @@ -53,6 +53,7 @@
>  #include <linux/usb/usbnet.h>
>  #include <linux/usb/cdc.h>
>  #include <linux/usb/cdc_ncm.h>
> +#include <linux/acpi.h>

What about non-acpi systems?

>  
>  #if IS_ENABLED(CONFIG_USB_NET_CDC_MBIM)
>  static bool prefer_mbim = true;
> @@ -814,6 +815,177 @@ static const struct net_device_ops cdc_ncm_netdev_ops = {
>  	.ndo_validate_addr   = eth_validate_addr,
>  };
>  
> +int acpi_mac_passthru_invalid(void)
> +{
> +	acpi_status status;
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	int ret = -EINVAL;
> +
> +	/* returns _AUXMAC_#AABBCCDDEEFF# */
> +	status = acpi_evaluate_object(NULL, "\\_SB.AMAC", NULL, &buffer);
> +	obj = (union acpi_object *)buffer.pointer;
> +
> +	if (!ACPI_SUCCESS(status))
> +		return -ENODEV;
> +	if (obj->type != ACPI_TYPE_BUFFER || obj->string.length != 0x17) {
> +		acpi_info("Invalid buffer for pass-thru MAC addr: (%d, %d)\n",
> +			  obj->type, obj->string.length);

Why is that an "info" message?

> +		goto amacout;
> +	}
> +	if (strncmp(obj->string.pointer, "_AUXMAC_#", 9) != 0 ||
> +	    strncmp(obj->string.pointer + 0x15, "#", 1) != 0) {
> +		acpi_info("Invalid header when reading pass-thru MAC addr\n");

Again, info?  Shouldn't this be an error?  Or just debug as userspace
can't do anything about it.

> +		goto amacout;
> +	}
> +	/* return success, otherwise return non-zero if invalid buffer read or
> +	 * MAC pass through is disabled in BIOS
> +	 */
> +	ret = 0;
> +
> +amacout:
> +	kfree(obj);
> +	return ret;
> +}
> +
> +int get_acpi_mac_passthru(char *MACAddress)
> +{
> +	acpi_status status;
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	int ret = -EINVAL;
> +	unsigned char buf[6];
> +
> +	/* returns _AUXMAC_#AABBCCDDEEFF# */
> +	status = acpi_evaluate_object(NULL, "\\_SB.AMAC", NULL, &buffer);
> +	obj = (union acpi_object *)buffer.pointer;
> +
> +	if (!ACPI_SUCCESS(status))
> +		return -ENODEV;
> +
> +	ret = hex2bin(buf, obj->string.pointer + 9, 6);
> +	if (!(ret == 0 && is_valid_ether_addr(buf))) {
> +		acpi_info("Invalid MAC for pass-thru MAC addr: %d, %pM\n",
> +			  ret, buf);
> +		ret = -EINVAL;
> +		goto amacout;
> +	}
> +	memcpy(MACAddress, buf, 6);
> +	acpi_info("Pass-thru MAC addr %pM\n", MACAddress);
> +
> +amacout:
> +	kfree(obj);
> +	return ret;
> +}
> +
> +/* Provide method to get MAC address from the USB device's ethernet controller.
> + * If the device supports CDC_GET_ADDRESS, we should receive just six bytes.
> + * Otherwise, use the prior method by asking for the descriptor.
> + */
> +static int cdc_ncm_get_ethernet_address(struct usbnet *dev,
> +					struct cdc_ncm_ctx *ctx)
> +{
> +	int ret;
> +	u8 iface_no = ctx->control->cur_altsetting->desc.bInterfaceNumber;
> +
> +	ret = usbnet_read_cmd(dev, USB_CDC_GET_NET_ADDRESS,
> +			      USB_DIR_IN | USB_TYPE_CLASS
> +			      | USB_RECIP_INTERFACE, 0,
> +			      iface_no, dev->net->dev_addr, ETH_ALEN);
> +
> +	if (ret == ETH_ALEN) {
> +		ret = 0;	/* success */
> +	} else {
> +		ret = usbnet_get_ethernet_addr(dev,
> +				ctx->ether_desc->iMACAddress);
> +	}
> +
> +	return ret;
> +}
> +
> +/* Provide method to push MAC address to the USB device's ethernet controller.
> + * If the device does not support CDC_SET_ADDRESS, there is no harm and we
> + * proceed as before.
> + */
> +static int cdc_ncm_set_ethernet_address(struct usbnet *dev,
> +					struct sockaddr *addr)
> +{
> +	int ret;
> +	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
> +	u8 iface_no_data = ctx->data->cur_altsetting->desc.bInterfaceNumber;
> +	u8 iface_no_control = ctx->control->cur_altsetting->desc.bInterfaceNumber;
> +	int temp;
> +
> +	/* The host shall only send SET_NET_ADDRESS command while
> +	 * the NCM Data Interface is in alternate setting 0.
> +	 */
> +	temp = usb_set_interface(dev->udev, iface_no_data, 0);
> +	if (temp) {
> +		dev_dbg(&dev->udev->dev, "set interface failed\n");
> +		return -ENODEV;
> +		}

Always use checkpatch.pl before submitting patches so you don't get
grumpy reviewers telling you to use checkpatch.pl.

thanks,

greg k-h
