Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCA6758E02D
	for <lists+linux-usb@lfdr.de>; Tue,  9 Aug 2022 21:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343567AbiHIT2h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Aug 2022 15:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343698AbiHIT2d (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Aug 2022 15:28:33 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 160B911803
        for <linux-usb@vger.kernel.org>; Tue,  9 Aug 2022 12:28:29 -0700 (PDT)
Received: (qmail 815456 invoked by uid 1000); 9 Aug 2022 15:28:29 -0400
Date:   Tue, 9 Aug 2022 15:28:29 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Witold Lipieta <witold.lipieta@thaumatec.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     USB development list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb-storage: Add ignore-residue quirk for NXP PN7462AU
Message-ID: <YvK1Xcl4154R4ujm@rowland.harvard.edu>
References: <20220809112911.462776-1-witold.lipieta@thaumatec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809112911.462776-1-witold.lipieta@thaumatec.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 09, 2022 at 01:29:11PM +0200, Witold Lipieta wrote:
> This is USB mass storage primary boot loader for code download on
> NXP PN7462AU.
> 
> Without the quirk it is impossible to write whole memory at once as
> device restarts during the write due to bogus residue values reported.
> 
> Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> Output from /sys/kernel/debug/usb/devices:
> T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  4 Spd=12   MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=1fc9 ProdID=0117 Rev= 1.00
> S:  Manufacturer=NXP
> S:  Product=PN7462AU
> C:* #Ifs= 1 Cfg#= 1 Atr=c0 MxPwr=100mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
> E:  Ad=81(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
>  drivers/usb/storage/unusual_devs.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index b6a9a7451620..ee6923b6ab31 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -2265,6 +2265,13 @@ UNUSUAL_DEV( 0x1e74, 0x4621, 0x0000, 0x0000,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_BULK_IGNORE_TAG | US_FL_MAX_SECTORS_64 ),
>  
> +/* Reported by Witold Lipieta <witold.lipieta@thaumatec.com> */
> +UNUSUAL_DEV( 0x1fc9, 0x0117, 0x0100, 0x0100,
> +		"NXP Semiconductors",
> +		"PN7462AU",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_RESIDUE ),
> +
>  /* Supplied with some Castlewood ORB removable drives */
>  UNUSUAL_DEV(  0x2027, 0xa001, 0x0000, 0x9999,
>  		"Double-H Technology",
> -- 
> 2.34.1
> 
