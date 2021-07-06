Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 801E23BC6B3
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jul 2021 08:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbhGFGi0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Jul 2021 02:38:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:41004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230089AbhGFGiZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Jul 2021 02:38:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 972596141C;
        Tue,  6 Jul 2021 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625553347;
        bh=O+WYoee/ArsT6Dg1Z/XyBEVlNaE06k6zREBLnQkh44k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uZbswDS8rGLoPHJugPOXvmo7Las0Y1wnP4rlKcg6Wq0vP4jqYdYocYvF9jNl6czIV
         /1ooq35q2P5TdOL50KX0rj+iZ9ARIZ3hgrduh3fEMwimd9Mvv5E2xObXipOg9MbT2E
         k/K1aFZykSDCvNJQf49WIOy0gp2wfL99NX5zdmV8aYfsNq1lk4xZ4VbhzvLRj77uab
         gXVrDyJUOSBAN47W/mNZQbFGxF//P4bEl8LObzK0HLx6m9PWefxwJ5AekKj1qS1PTE
         n1LWH7axvkQ4AruHJHJNxuvQ1Sy052nn45XSWpDh3emQKlP2eYfCBrUS5HL6OwJW6k
         g1syWLFoEoOSA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1m0egG-00027T-D4; Tue, 06 Jul 2021 08:35:40 +0200
Date:   Tue, 6 Jul 2021 08:35:40 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Marco De Marco <marco.demarco@posteo.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: serial: option: Add support for u-blox LARA-R6
 family
Message-ID: <YOP5vFZogjqU3cCw@hovoldconsulting.com>
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
> 
> Thanks for your patience and the tireless endeavour.

Thanks for the update. I'll pick this one up next week when -rc1 is out.

Johan
