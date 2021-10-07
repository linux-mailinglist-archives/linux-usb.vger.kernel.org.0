Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756AE424E5A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Oct 2021 09:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbhJGH4N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Oct 2021 03:56:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:54706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232542AbhJGH4M (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Oct 2021 03:56:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 903A061029;
        Thu,  7 Oct 2021 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633593259;
        bh=WmcukyZgv78pK+lerNZyiUwSUrk+AdHKAppW4A5sgec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OA09IWQJSOqe4KRwon6IDnRgUhcx7WHvdsv6NHZswvvuXXB/vvq9srQL41ss2Vu2l
         hZuBvxhozZJVHAZZNn7THpmhGcNf/WnfHkYwrx04fBV/sJVU2OXDtfjHoPxfiTjjWl
         0NrUrtsrkJTf1j4M+FLj8sw1Smpv2kAfAMGxKLGheyqW/StCl2mqzjpy/twG5PzhOJ
         Q7zDctvI3beNhn/470UIMcX3BHQuxb1MARBEDEDu2+bAn5Ny4MxUYbADoa1yezjyNX
         iEQMDIopUcThXT4IbkiyXGjsZFGSumH6ZE5AaC4QPKBvKXJeuG9qPVuROHi+eVmg44
         pRq+Tb6W8tlUA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mYOEM-0005kr-Ff; Thu, 07 Oct 2021 09:54:18 +0200
Date:   Thu, 7 Oct 2021 09:54:18 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Tomaz Solc <tomaz.solc@tablix.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: serial: option: add prod. id for Quectel EG91
Message-ID: <YV6nqpSpcBcPHWQ3@hovoldconsulting.com>
References: <20211006125749.4075-1-tomaz.solc@tablix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006125749.4075-1-tomaz.solc@tablix.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 06, 2021 at 02:57:50PM +0200, Tomaz Solc wrote:
> Adding support for Quectel EG91 LTE module.
> 
> The interface layout is same as for EG95.
> 
> usb-devices output:
> T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  3 Spd=480 MxCh= 0
> D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=2c7c ProdID=0191 Rev=03.18
> S:  Manufacturer=Android
> S:  Product=Android
> C:  #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
> I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> I:  If#=0x1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
> I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
> I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
> I:  If#=0x4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
> 
> Interfaces:
> 
> 0: Diag
> 1: GNSS
> 2: AT-command interface/modem
> 3: Modem
> 4: QMI
> 
> Signed-off-by: Tomaz Solc <tomaz.solc@tablix.org>

Now applied, thanks.

Johan
