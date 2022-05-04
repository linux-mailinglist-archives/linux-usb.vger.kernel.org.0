Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 196DE519F36
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 14:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349403AbiEDM1a convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 4 May 2022 08:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344781AbiEDM13 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 08:27:29 -0400
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E03222F3A5
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 05:23:52 -0700 (PDT)
Received: from smtpclient.apple (p5b3d276d.dip0.t-ipconnect.de [91.61.39.109])
        by mail.holtmann.org (Postfix) with ESMTPSA id F03ADCED05;
        Wed,  4 May 2022 14:23:51 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v4] USB: core: skip unconfiguration if device doesn't
 support it
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220504083612.143463-1-jtornosm@redhat.com>
Date:   Wed, 4 May 2022 14:23:51 +0200
Cc:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
References: <20220504083612.143463-1-jtornosm@redhat.com>
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jose,

> Bluetooth Dongles with CSR chip (i.e. USB Bluetooth V4.0 Dongle by
> Trust) hang when they are unbound from 'unbind' sysfs entry and
> can not be bound again.
> 
> The reason is CSR chip hangs when usb configuration command with
> index 0 (used to unconfigure) is sent during disconnection.
> 
> To avoid this unwanted result, it is necessary not to send this
> command for CSR chip, so a new quirk has been created.
> 
> Athough device is not unconfigured, it is better to avoid device
> hanging to be able to operate. Even bluetooth can be previously
> turned off.
> On the other hand, this is not important if usb device is going to
> be bound again (normal behavior), i.e. with usbip.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
> V3 -> V4:
> - Reorder quirk entries to be in numerical order according to the vendor
> ID and product ID.
> - Add patch version information.
> V2 -> V3:
> - Change subject (Bluetooth: btusb: CSR chip hangs when unbound ->
> USB: core: skip unconfiguration if device doesn't support it).
> - Improve quirk checking.
> - Allow to test quirk interactively.
> V1 -> V2:
> - Use quirk feature for the exception.
> 
> Documentation/admin-guide/kernel-parameters.txt |  2 ++
> drivers/usb/core/message.c                      | 12 +++++++++---
> drivers/usb/core/quirks.c                       |  6 ++++++
> include/linux/usb/quirks.h                      |  3 +++
> 4 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3f1cc5e317ed..71651b888d14 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6183,6 +6183,8 @@
> 					pause after every control message);
> 				o = USB_QUIRK_HUB_SLOW_RESET (Hub needs extra
> 					delay after resetting its port);
> +				p = USB_QUIRK_SKIP_UNCONFIGURE (device doesn't
> +					support unconfigure);
> 			Example: quirks=0781:5580:bk,0a5c:5834:gij
> 
> 	usbhid.mousepoll=
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 4d59d927ae3e..9c6cd0c75f4f 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -2108,9 +2108,15 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
> 	}
> 	kfree(new_interfaces);
> 
> -	ret = usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0,
> -				   configuration, 0, NULL, 0,
> -				   USB_CTRL_SET_TIMEOUT, GFP_NOIO);
> +	if (configuration == 0 && !cp
> +			&& (dev->quirks & USB_QUIRK_SKIP_UNCONFIGURE)) {
> +		dev_warn(&dev->dev, "device is not unconfigured!\n");
> +		ret = 0;
> +	} else
> +		ret = usb_control_msg_send(dev, 0, USB_REQ_SET_CONFIGURATION, 0,
> +					   configuration, 0, NULL, 0,
> +					   USB_CTRL_SET_TIMEOUT, GFP_NOIO);
> +
> 	if (ret && cp) {
> 		/*
> 		 * All the old state is gone, so what else can we do?
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index d3c14b5ed4a1..7c86c8d61570 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -138,6 +138,9 @@ static int quirks_param_set(const char *value, const struct kernel_param *kp)
> 			case 'o':
> 				flags |= USB_QUIRK_HUB_SLOW_RESET;
> 				break;
> +			case 'p':
> +				flags |= USB_QUIRK_SKIP_UNCONFIGURE;
> +				break;
> 			/* Ignore unrecognized flag characters */
> 			}
> 		}
> @@ -394,6 +397,9 @@ static const struct usb_device_id usb_quirk_list[] = {
> 	/* ELMO L-12F document camera */
> 	{ USB_DEVICE(0x09a1, 0x0028), .driver_info = USB_QUIRK_DELAY_CTRL_MSG },
> 
> +	/* CSR Bluetooth */
> +	{ USB_DEVICE(0x0a12, 0x0001), .driver_info = USB_QUIRK_SKIP_UNCONFIGURE },
> +

NAK. I said this before.

The VID:PID 0a12:0001 is used in millions of products that work
correctly. Only because some counterfeit products get things wrong
doesn’t mean all get marked as broken.

Regards

Marcel

