Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6904852EF
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 20:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389347AbfHGSZu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 14:25:50 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:54978 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388428AbfHGSZs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 14:25:48 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77IPlwn022850;
        Wed, 7 Aug 2019 13:25:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565202347;
        bh=8Jhwy3BOP0+eGalOwDgEJKgcGnfjb7C0XY/2GwrJ9z0=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=wfpnDrpMf4ctDVeha4S31vODzSEV59FbyM+3Wty/Gejsb0lLtvvwwVOckZnonoKWk
         /w6uWmO/4fEdKQob6EUAahZPE/lfXG9zxhCHrmcW/zpDv58CPQGwqc1C8PW9CsrBi5
         r+gC6EPAYDayXE1ExRcE9ieCs6gC9tRzhfbbP8F4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77IPllA071343
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 13:25:47 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 13:25:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 13:25:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77IPlSM116274;
        Wed, 7 Aug 2019 13:25:47 -0500
Date:   Wed, 7 Aug 2019 13:25:47 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: musb: convert platform driver to use dev_groups
Message-ID: <20190807182547.GC2724@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20190806144502.17792-1-gregkh@linuxfoundation.org>
 <20190805193636.25560-2-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190805193636.25560-2-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 05, 2019 at 09:36:32PM +0200, Greg Kroah-Hartman wrote:
> Platform drivers now have the option to have the platform core create
> and remove any needed sysfs attribute files.  So take advantage of that
> and do not register "by hand" any sysfs files.
> 
> Cc: Bin Liu <b-liu@ti.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Bin Liu <b-liu@ti.com>

-Bin.
