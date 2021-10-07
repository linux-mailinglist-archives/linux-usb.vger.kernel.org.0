Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6E0425473
	for <lists+linux-usb@lfdr.de>; Thu,  7 Oct 2021 15:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241613AbhJGNmy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Oct 2021 09:42:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:44746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233331AbhJGNmx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Oct 2021 09:42:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08D7B60F6F;
        Thu,  7 Oct 2021 13:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633614060;
        bh=y+5DjMunpd4CyGMLjVMYEADWny7OJmd+2Xjhwtrgv+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DDplDDZq75p8DTEt6WBIvydGOYmdHxscx7LUWxMnvVJXRnBqhGGnuGK4VnkM8edvg
         ksrYhNfA7vh2qhNmCrVTED9F7FdaPt/vxGkphgb4l7bObe+Oz8TVDjCAf8pdFUQRhE
         cCGtO4ucXgwUBN5OOH4QoPJQNw7cnSK5328xgF1uSyY/nbOeWlU+hy8ugrKZFKFYoc
         y7kTmPvv2FXJu4MC1Ayz8W3pfzjU7+kYrffa3zO+ZBOlT6/ZjXbQGKAjCsZ/QyOm3Z
         B2jU4aVPCqhfGL0Z27VT2+9iRgLXRUjrHrZxuRZJALALVnVvjsAy7krtkY/PrH+75u
         M/l9ituv4vxwQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mYTdr-0001PB-Or; Thu, 07 Oct 2021 15:40:59 +0200
Date:   Thu, 7 Oct 2021 15:40:59 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Aleksander Morgado <aleksander@aleksander.es>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH] USB: serial: qcserial: add EM9191 QDL support
Message-ID: <YV746zMlB6We3np8@hovoldconsulting.com>
References: <20211007122501.11306-1-aleksander@aleksander.es>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007122501.11306-1-aleksander@aleksander.es>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 07, 2021 at 02:25:01PM +0200, Aleksander Morgado wrote:
> When the module boots into QDL download mode it exposes the 1199:90d2
> ids, which can be mapped to the qcserial driver, and used to run
> firmware upgrades (e.g. with the qmi-firmware-update program).
> 
>   T:  Bus=01 Lev=03 Prnt=08 Port=03 Cnt=01 Dev#= 10 Spd=480 MxCh= 0
>   D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
>   P:  Vendor=1199 ProdID=90d2 Rev=00.00
>   S:  Manufacturer=Sierra Wireless, Incorporated
>   S:  Product=Sierra Wireless EM9191
>   S:  SerialNumber=8W0382004102A109
>   C:  #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=2mA
>   I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=10 Driver=qcserial
> 
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>

Applied, thanks.

Johan
