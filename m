Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6EE3C57C0
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jul 2021 12:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354484AbhGLIh2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jul 2021 04:37:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:54002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351137AbhGLIdd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Jul 2021 04:33:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36D8360FE7;
        Mon, 12 Jul 2021 08:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626078645;
        bh=3HxPYYHstWoqkXSePDGGbMnMcIbWwSgnimyfGxWJ7Us=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g5ehW+HU5DgmsBc+o4BwlhpnvLFdlsIBqf3GUC+7Cyek6mC5EIHT5zg+zDbAkCNSw
         sLtg3xBlVdkLlD3dPk7PhGWkFhRZJhtgNAGKVxshNc+SBSNtDv3CaMIPOKG11ZI8y8
         dXQtAbVYZ1+s8/8qzHM+TD17C5i4Lj4Nt5bJLMETqM9JARmrtNXi2Y3xC0keSXzRzj
         oDdsv18FLpmwiAQ94iAsoGNr5eG+6luxcalZkQqeSg5RaVG6w5xR8i+BWTDFb3pGd/
         tyDTidRAfik29cZBqwb5WW47MYuMrRi0BDbnD4BHliVqlWIy6MOJHFL/VutsxAKrgD
         cfEDjdLrIYzvw==
Received: from johan by xi with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m2rKb-0003tq-8T; Mon, 12 Jul 2021 10:30:26 +0200
Date:   Mon, 12 Jul 2021 10:30:25 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Marco De Marco <marco.demarco@posteo.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: serial: option: Add support for u-blox LARA-R6
 family
Message-ID: <YOv9odicL7IeHPYU@hovoldconsulting.com>
References: <49260184.kfMIbaSn9k@mars>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49260184.kfMIbaSn9k@mars>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 05, 2021 at 07:44:21PM +0000, Marco De Marco wrote:
> The patch is meant to support LARA-R6 Cat 1 module family.
> 
> Module USB ID:
> Vendor  ID: 0x05c6
> Product ID: 0x90fA
> 
> Interface layout:
> If 0: Diagnostic
> If 1: AT parser
> If 2: AT parser
> If 3: QMI wwan (not available in all versions)
> 
> Signed-off-by: Marco De Marco <marco.demarco@posteo.net>
> 
> ---
> 
> ADB interface is not available. 
> Diagnostic interface (If 0) can be used with option driver.
> 
> Output of usb-devices command (this version does not have QMI WWAN):
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  3 Spd=480 MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=05c6 ProdID=90fa Rev=00.00
> S:  Manufacturer=Qualcomm, Incorporated
> S:  Product=Qualcomm CDMA Technologies MSM
> S:  SerialNumber=7da8aacd
> C:  #Ifs= 3 Cfg#= 1 Atr=c0 MxPwr=500mA
> I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=(none)
> I:  If#=0x1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
> I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=fe Prot=ff Driver=(none)

Now applied, thanks!

Johan
