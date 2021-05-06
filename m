Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C721375070
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 09:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233640AbhEFH5F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 03:57:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:33566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233541AbhEFH5E (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 03:57:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FF8760FEE;
        Thu,  6 May 2021 07:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620287765;
        bh=R9BRT3Tq1nxLEfQeGaFDWsGH668tMEQ1Jr1OyLPmCLk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vqpgyRtnSOGws15lCedEZV3Ve2a+Vlr96JAQw4nENyShrgPi2iNlQuciqXIYSR70o
         T0XV0qNSeN+2b8HxdXZRV2siW3gFwHabijp6jHjWdoNMdAL95oTndfQ2AYlU3amOaf
         uGxy5+wmqnIh+qH0Q0TUayiqFRnMNtyqweX2DcZY=
Date:   Thu, 6 May 2021 09:56:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Robert Wolters <robert@woltersonline.net>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: set custom baud-rate for SCS P4 Dragon
Message-ID: <YJOhE/Es2FTkNMgw@kroah.com>
References: <c964941a-a04a-7402-597c-d0bce15de5d7@woltersonline.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c964941a-a04a-7402-597c-d0bce15de5d7@woltersonline.net>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 06, 2021 at 09:43:41AM +0200, Robert Wolters wrote:
> |Why: FTDI USB serial speed issue with SCS P4 Dragon short-wave modems, a
> custom baud-rate is required Solution: set special baud-rate by setting a
> custom divisor on 38400B Signed-off-by: Robert Wolters
> <robert@woltersonline.net> | ||--- ftdi_sio.c 2021-04-21 13:01:00.000000000
> +0200| ||+++ ftdi_sio.c 2021-04-26 18:53:00.819175707 +0200| ||@@ -97,6
> +97,7 @@| |||static int ftdi_8u2232c_probe(struct usb_serial *serial);|
> ||static void ftdi_USB_UIRT_setup(struct ftdi_private *priv);||||static void
> ftdi_HE_TIRA1_setup(struct ftdi_private *priv);| |+static void
> ftdi_SCS_DR7X00_setup(struct ftdi_private *priv);| ||static const struct
> ftdi_sio_quirk ftdi_jtag_quirk = {| |||.probe  = ftdi_jtag_probe,| |||@@
> -122,6 +123,10 @@| |||.probe  = ftdi_8u2232c_probe,| |||}; ||||+static const
> struct ftdi_sio_quirk ftdi_SCS_DR7X00_quirk = {| |||+ .port_probe =
> ftdi_SCS_DR7X00_setup,| |||+};| |||+| |||/*| ||* The 8U232AM has the same
> API as the sio except for:| |* - it can support MUCH higher baudrates; up
> to:| |@@ -157,8 +162,12 @@| |{ USB_DEVICE(FTDI_VID, FTDI_EV3CON_PID) },| |{
> USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_0_PID) },| |{ USB_DEVICE(FTDI_VID,
> FTDI_SCS_DEVICE_1_PID) },| |- { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_2_PID)
> },| |- { USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_3_PID) },| |+ {
> USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_2_PID) ,| |+ .driver_info =
> (kernel_ulong_t)&ftdi_SCS_DR7X00_quirk },| |+ { USB_DEVICE(FTDI_VID,
> FTDI_SCS_DEVICE_3_PID) ,| |+ .driver_info =
> (kernel_ulong_t)&ftdi_SCS_DR7X00_quirk },| |{ USB_DEVICE(FTDI_VID,
> FTDI_SCS_DEVICE_4_PID) },| |{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_5_PID)
> },| |{ USB_DEVICE(FTDI_VID, FTDI_SCS_DEVICE_6_PID) },| |@@ -2296,6 +2305,15
> @@| |priv->force_rtscts = 1;| |}| |+/* Setup for the SCS P4dragon DR-7X00
> devices, which require| |+ *hardwired baud-rate of 829440 (38400 gets mapped
> to 829440) */| |+static void ftdi_SCS_DR7X00_setup(struct ftdi_private
> *priv)| |+{| |+ priv->flags |= ASYNC_SPD_CUST;| |+ priv->custom_divisor =
> 29;| |+ priv->force_baud = 38400;| |+}| |+| |||||/*| |* Module parameter to
> control latency timer for NDI FTDI-based USB devices.| |* If this value is
> not set in /etc/modprobe.d/ its value will be set|
> 

I think something went wrong with your email client :(


