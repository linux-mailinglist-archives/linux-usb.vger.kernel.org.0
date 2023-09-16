Return-Path: <linux-usb+bounces-241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D38987A2FC9
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 13:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B9B81C20D5D
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 11:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1554113AC8;
	Sat, 16 Sep 2023 11:51:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DF52109
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 11:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0F7C433C8;
	Sat, 16 Sep 2023 11:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694865067;
	bh=FnALjLavq8+lEYVfGVJjmHDYsyHCVnXElP65pdRrYLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QaZWH/+vos/MI/hkM1hPUivEOqoTwCqmA5sDaLAjeGW+AkNR4qkudMoMeg2FBmnBW
	 cmId/8HkTKabaALKp63IaAyZ+7wBz+Yz/Ijv3slt6QFErodsDee3tyNjRgCX7/d1In
	 tTOm50zBKtpMBn0/BNkvdNZd+56zxD/0h4tZAJ5s=
Date: Sat, 16 Sep 2023 13:51:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Louis-Marie <rauline.lm@protonmail.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Lenovo Hybrid Dock MAC passtrough patch
Message-ID: <2023091628-polyester-ascend-7780@gregkh>
References: <guK8MKcjWbPsZ1LuRVYxFf7WfsWa025shmVj7iq289LHf59N6i6OlkD0N9KhICJzbMfFW2aXYbguZ1NtZNn6PlA_-JvF3k7uJtG89THdZ6w=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <guK8MKcjWbPsZ1LuRVYxFf7WfsWa025shmVj7iq289LHf59N6i6OlkD0N9KhICJzbMfFW2aXYbguZ1NtZNn6PlA_-JvF3k7uJtG89THdZ6w=@protonmail.com>

On Sat, Sep 16, 2023 at 11:41:49AM +0000, Louis-Marie wrote:
> Hi,
> I would like to submit a patch for enabling mac passtrough for the Lenovo Hybrid Dock.
> Tested with Fedora 6.4.12.
> 
> 
> 
> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.cindex 0c13d9950cd8..02e6404bf6ea 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c
> @@ -781,6 +781,7 @@ enum rtl8152_flags {
>  #define DEVICE_ID_THINKPAD_USB_C_DONGLE            0x720c
>  #define DEVICE_ID_THINKPAD_USB_C_DOCK_GEN2     0xa387
>  #define DEVICE_ID_THINKPAD_USB_C_DOCK_GEN3     0x3062
> +#define DEVICE_ID_THINKPAD_HYBRID_USB_C_DOCK       0xa359
> 
>  struct tally_counter {
>     __le64  tx_packets;
> @@ -9583,6 +9584,7 @@ static bool rtl8152_supports_lenovo_macpassthru(struct usb_device *udev)
>         case DEVICE_ID_THINKPAD_THUNDERBOLT3_DOCK_GEN2:
>         case DEVICE_ID_THINKPAD_USB_C_DOCK_GEN2:
>         case DEVICE_ID_THINKPAD_USB_C_DOCK_GEN3:
> +       case DEVICE_ID_THINKPAD_HYBRID_USB_C_DOCK:
>         case DEVICE_ID_THINKPAD_USB_C_DONGLE:
>             return 1;
>         }
> @@ -9832,6 +9834,7 @@ static const struct usb_device_id rtl8152_table[] = {
>     { USB_DEVICE(VENDOR_ID_LENOVO,  0x7214) },
>     { USB_DEVICE(VENDOR_ID_LENOVO,  0x721e) },
>     { USB_DEVICE(VENDOR_ID_LENOVO,  0xa387) },
> +   { USB_DEVICE(VENDOR_ID_LENOVO,  0xa359) },
>     { USB_DEVICE(VENDOR_ID_LINKSYS, 0x0041) },
>     { USB_DEVICE(VENDOR_ID_NVIDIA,  0x09ff) },
>     { USB_DEVICE(VENDOR_ID_TPLINK,  0x0601) },
> diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
> index 15e9bd180a1d..ad98c8ffbc69 100644
> --- a/drivers/usb/core/quirks.c
> +++ b/drivers/usb/core/quirks.c
> @@ -470,6 +470,9 @@ static const struct usb_device_id usb_quirk_list[] = {
>     /* Lenovo ThinkPad USB-C Dock Gen2 Ethernet (RTL8153 GigE) */
>     { USB_DEVICE(0x17ef, 0xa387), .driver_info = USB_QUIRK_NO_LPM },
> 
> +   /* Lenovo ThinkPad Hydrid USB-C Dock */
> +   { USB_DEVICE(0x17ef, 0xa359), .driver_info = USB_QUIRK_NO_LPM },
> +
>     /* BUILDWIN Photo Frame */
>     { USB_DEVICE(0x1908, 0x1315), .driver_info =
>             USB_QUIRK_HONOR_BNUMINTERFACES },
> 
> Signed-off-by: Louis-Marie Rauline <rauline.lm@protonmail.com>
> 
> Thanks,
> Rauline Louis-Marie
> 
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

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/process/submitting-patches.rst and resend
  it after adding that line.  Note, the line needs to be in the body of
  the email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

