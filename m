Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C0E1BDA77
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 13:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgD2LTB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 07:19:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgD2LTA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Apr 2020 07:19:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C0DB9206B8;
        Wed, 29 Apr 2020 11:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588159139;
        bh=x6M++kPN4hjyHDCr3TK9fF7t5aWFWu0J8T+L3aeRs0k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xjt0uVTgqR3evUHKXqWBW2T9FVy7uawIas1XEnnxeerZ27gI0o+bPCMxCJC//Qc7t
         Ri5FQ3SBAiYb17aLAG0Dw14CLmBkCdaLQkL3o80GomZX81Bp8VifhkbHMM3PvMcsF+
         UlMl6SyvxaswkDv+aMSOSkiBpv/4F74hw/wc0pE4=
Date:   Wed, 29 Apr 2020 13:18:56 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] UAS: add quirk for LaCie 2Big Quadra
Message-ID: <20200429111856.GA2117211@kroah.com>
References: <20200429103441.20107-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429103441.20107-1-oneukum@suse.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 29, 2020 at 12:34:41PM +0200, Oliver Neukum wrote:
> This device needs US_FL_NO_REPORT_OPCODES to avoid going
> through prolonged error handling on enumeration.
> 
> v2: correct sorting order
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> Reported-by: Julian Groﬂ <julian.g@posteo.de>
> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index cfdec74e0f4a..22aeb6a45e57 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -45,6 +45,13 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_LUNS),
>  
> +/* Reported-by: Julian Groﬂ <julian.g@posteo.de> */
> +UNUSUAL_DEV(0x059f, 0x105f, 0x0000, 0x9999,

So 0x059f is greater than 0x0bc2?

v3?

