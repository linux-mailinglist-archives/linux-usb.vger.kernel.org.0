Return-Path: <linux-usb+bounces-21988-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC2BA6B2BA
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 02:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A37998811F1
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 01:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0869C1DF277;
	Fri, 21 Mar 2025 01:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XdSJ4aA+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D9E15820C
	for <linux-usb@vger.kernel.org>; Fri, 21 Mar 2025 01:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742521636; cv=none; b=UQm0fWPUng+rq/qqA/sDlOekj9/8NVuqFZcdwSfeXKjrQkLGCE8CMqCoGqaqy0HWRDvYAopz5TRTx8qKaQXRCHnvjPg6ZtmddCAKcGFENRZc6E5Pz0RAq8VUA0JHQnajcr/16zyqfOdWawNiuFDfm336fqyMbu/YuGvzpgRfsQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742521636; c=relaxed/simple;
	bh=2H66PUeo1OFgKD4XFqrOdgBr4dkk/VKUPGtTE1IhTYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMEUdy+mZOTZfKJmsikFYTuhVrgs3CDF3teAcB6iepnOrMImn+9X2ar/GafZxka8NOj3RmSCSZZKV+ZRN5sE+uHwixPvBC0za0DBnQZCM+pRTDoyPOVEihPiHAycvY9GV0yat+0ndovbSSXanbwOmRwNxDck7nyFFA88UtqtzVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XdSJ4aA+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30828C4CEDD;
	Fri, 21 Mar 2025 01:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742521636;
	bh=2H66PUeo1OFgKD4XFqrOdgBr4dkk/VKUPGtTE1IhTYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XdSJ4aA+IJ5ShRVskkpoj01s19k8z3CCExco1CDAWiU98j/fJFIQyorozPg3LkWRK
	 UnM18a13gGJ+467OLgKEmhe/9CGZESnfggI0sovlYQ9WMfjsaRfGhGumL5xok3OXmz
	 jkW5CdMoEN+a7wOnVvnfva6QXPpV5WUJu27BUBLE=
Date: Thu, 20 Mar 2025 18:45:56 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Adam Xue <zxue@semtech.com>
Cc: "johan@kernel.org" <johan@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Iulian Mocanu <imocanu@semtech.com>
Subject: Re: USB: serial: qcserial: patch for adding Sierra Wireless 9x50,
 EM91, EM92 and SDX35.
Message-ID: <2025032047-deluge-observant-963f@gregkh>
References: <DS7PR20MB4855FE3E27EFAD39D56FF897C6D82@DS7PR20MB4855.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DS7PR20MB4855FE3E27EFAD39D56FF897C6D82@DS7PR20MB4855.namprd20.prod.outlook.com>

On Thu, Mar 20, 2025 at 10:08:36PM +0000, Adam Xue wrote:
> Hi Johan,
> 
> This is the patch for adding support for Sierra Wireless and Semtech products based on 
> Qualcomm 9x50, SDX35, SDX55 and SDX65 based products (EM75xx, EM91xx, EM92xx). 
> Currently, only our products based on Qualcomm 9x30 and older chipsets are supported.
> These products have a different USB interface layout compared to the default one which 
> require code changes. The VID/PID list has also been updated for all products mentioned above.
> Please review.
>  
> Thanks,
>  
> Adam
>  
> 
> diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
> index 13c664317a05..f362da97b7de 100644
> --- a/drivers/usb/serial/qcserial.c
> +++ b/drivers/usb/serial/qcserial.c
> @@ -26,12 +26,24 @@ enum qcserial_layouts {
>       QCSERIAL_G1K = 1, /* Gobi 1000 */
>       QCSERIAL_SWI = 2, /* Sierra Wireless */
>       QCSERIAL_HWI = 3, /* Huawei */
> +     QCSERIAL_SWI_9X50 = 4, /* Sierra Wireless 9x50 USB-IF */
> +     QCSERIAL_SWI_SDX55 = 5, /* Sierra Wireless SDX55 */
> +     QCSERIAL_SWI_SDX55_RMNET = 6, /* Sierra Wireless SDX55 rmnet */
> +     QCSERIAL_SWI_SDX35 = 7, /* Sierra Wireless SDX35 */
>  };
>  
>  #define DEVICE_G1K(v, p) \
>       USB_DEVICE(v, p), .driver_info = QCSERIAL_G1K
>  #define DEVICE_SWI(v, p) \
>       USB_DEVICE(v, p), .driver_info = QCSERIAL_SWI
> +#define DEVICE_SWI_9X50(v, p) \
> +     USB_DEVICE(v, p), .driver_info = QCSERIAL_SWI_9X50
> +#define DEVICE_SWI_SDX55(v, p) \
> +     USB_DEVICE(v, p), .driver_info = QCSERIAL_SWI_SDX55
> +#define DEVICE_SWI_SDX55_RMNET(v, p) \
> +     USB_DEVICE(v, p), .driver_info = QCSERIAL_SWI_SDX55_RMNET
> +     #define DEVICE_SWI_SDX35(v, p) \
> +     USB_DEVICE(v, p), .driver_info = QCSERIAL_SWI_SDX35
>  #define DEVICE_HWI(v, p) \
>       USB_DEVICE(v, p), .driver_info = QCSERIAL_HWI
>  
> @@ -165,11 +177,21 @@ static const struct usb_device_id id_table[] = {
>       {DEVICE_SWI(0x1199, 0x907b)}, /* Sierra Wireless EM74xx */
>       {DEVICE_SWI(0x1199, 0x9090)}, /* Sierra Wireless EM7565 QDL */
>       {DEVICE_SWI(0x1199, 0x9091)}, /* Sierra Wireless EM7565 */
> -     {DEVICE_SWI(0x1199, 0x90d2)}, /* Sierra Wireless EM9191 QDL */
> +     {DEVICE_SWI(0x1199, 0x90b0)}, /* Sierra Wireless EM7565 QDL */
> +     {DEVICE_SWI_9X50(0x1199, 0x90b1)},  /* Sierra Wireless EM7565 */
> +     {DEVICE_SWI(0x1199, 0x90d2)}, /* Sierra Wireless EM9190 QDL */
> +     {DEVICE_SWI_SDX55(0x1199, 0x90d3)}, /* Sierra Wireless EM9190 */
> +     {DEVICE_SWI(0x1199, 0x90d8)}, /* Sierra Wireless EM9190 QDL */
> +     {DEVICE_SWI_SDX55_RMNET(0x1199, 0x90d9)}, /* Sierra Wireless EM9190 */
> +     {DEVICE_SWI(0x1199, 0x90e0)}, /* Sierra Wireless EM929x QDL */
> +     {DEVICE_SWI_SDX55(0x1199, 0x90e1)}, /* Sierra Wireless EM929x */
> +     {DEVICE_SWI(0x1199, 0x90e2)}, /* Sierra Wireless EM929x QDL */
> +     {DEVICE_SWI_SDX55(0x1199, 0x90e3)}, /* Sierra Wireless EM929x */
>       {DEVICE_SWI(0x1199, 0x90e4)}, /* Sierra Wireless EM86xx QDL*/
>       {DEVICE_SWI(0x1199, 0x90e5)}, /* Sierra Wireless EM86xx */
>       {DEVICE_SWI(0x1199, 0xc080)}, /* Sierra Wireless EM7590 QDL */
>       {DEVICE_SWI(0x1199, 0xc081)}, /* Sierra Wireless EM7590 */
> +     {DEVICE_SWI_SDX35(0x05c6, 0x90b8)}, /* Sierra Wireless SDX35 */
>       {DEVICE_SWI(0x413c, 0x81a2)}, /* Dell Wireless 5806 Gobi(TM) 4G LTE Mobile Broadband Card */
>       {DEVICE_SWI(0x413c, 0x81a3)}, /* Dell Wireless 5570 HSPA+ (42Mbps) Mobile Broadband Card */
>       {DEVICE_SWI(0x413c, 0x81a4)}, /* Dell Wireless 5570e HSPA+ (42Mbps) Mobile Broadband Card */
> @@ -367,6 +389,88 @@ static int qcprobe(struct usb_serial *serial, const struct usb_device_id *id)
>                   break;
>             }
>             break;
> +     case QCSERIAL_SWI_SDX55:
> +           /*
> +            * Sierra Wireless SDX55 layout:
> +            * 3: AT-capable modem port
> +            * 4: DM/DIAG
> +            */
> +           switch (ifnum) {
> +           case 3:
> +                 dev_dbg(dev, "Modem port found\n");
> +                 sendsetup = true;
> +                 break;
> +           case 4:
> +                 dev_dbg(dev, "DM/DIAG interface found\n");
> +                 break;
> +           default:
> +                 /* don't claim any unsupported interface */
> +                 altsetting = -1;
> +                 break;
> +           }
> +           break;
> +     case QCSERIAL_SWI_SDX55_RMNET:
> +           /*
> +            * Sierra Wireless SDX55 layout:
> +            * 1: AT-capable modem port
> +            * 2: DM
> +            */
> +           switch (ifnum) {
> +           case 1:
> +                 dev_dbg(dev, "Modem port found\n");
> +                 sendsetup = true;
> +                 break;
> +           case 2:
> +                 dev_dbg(dev, "DM/DIAG interface found\n");
> +                 break;
> +           default:
> +                 /* don't claim any unsupported interface */
> +                 altsetting = -1;
> +                 break;
> +           }
> +           break;
> +     case QCSERIAL_SWI_9X50:
> +           /*
> +            * Sierra Wireless 9X50 USB-IF layout:
> +            * 2: AT-capable modem port
> +            * 3: NMEA
> +            * 4: DM
> +            */
> +           switch (ifnum) {
> +           case 2:
> +                 dev_dbg(dev, "Modem port found\n");
> +                 sendsetup = true;
> +                 break;
> +           case 3:
> +                 dev_dbg(dev, "NMEA GPS interface found\n");
> +                 sendsetup = true;
> +                 break;
> +           case 4:
> +                 dev_dbg(dev, "DM/DIAG interface found\n");
> +                 break;
> +           default:
> +                 /* don't claim any unsupported interface */
> +                 altsetting = -1;
> +                 break;
> +           }
> +           break;
> +     case QCSERIAL_SWI_SDX35:
> +           /*
> +            */
> +           switch (ifnum) {
> +           case 0:
> +                 dev_dbg(dev, "DM/DIAG interface found\n");
> +                 break;
> +           case 1:
> +                 dev_dbg(dev, "Modem port found\n");
> +                 sendsetup = true;
> +                 break;
> +           default:
> +                 /* don't claim any unsupported interface */
> +                 altsetting = -1;
> +                 break;
> +           }
> +           break;
>       case QCSERIAL_HWI:
>             /*
>              * Huawei devices map functions by subclass + protocol
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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

