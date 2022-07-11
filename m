Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68988562C66
	for <lists+linux-usb@lfdr.de>; Fri,  1 Jul 2022 09:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbiGAHQX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 1 Jul 2022 03:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiGAHQW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 1 Jul 2022 03:16:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A276B801;
        Fri,  1 Jul 2022 00:16:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 085D662434;
        Fri,  1 Jul 2022 07:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113D1C3411E;
        Fri,  1 Jul 2022 07:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656659780;
        bh=769T8U20bdcmn4KizXJfCR7r8JnHhu2ado8AAsueCQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HmpaN7eAi4tX+nFBqAVV07ExBVp/WZC4dx16VA6iiZyYKMutsvW2NsPlpstqVHuiU
         OuxYDJLGokVbx19hCNdl3VdJhc1m/zY1udZnZBF28aXDpaLwYd5z5ACSmsscwrrEJe
         9VnIsBZZzTooX1z0p9JJ20rgQnveHQ9ifHbZNKA8=
Date:   Fri, 1 Jul 2022 09:16:17 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Neal Liu <neal_liu@aspeedtech.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: Re: Questions about usb to serial driver
Message-ID: <Yr6fQbeo/FDrBmfU@kroah.com>
References: <HK0PR06MB3202C7064582E6CB027237BC80BD9@HK0PR06MB3202.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB3202C7064582E6CB027237BC80BD9@HK0PR06MB3202.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 01, 2022 at 03:16:13AM +0000, Neal Liu wrote:
> Hi all,
> 
> I have a question about USB-serial and I hope I can find the answer from here.
> I'll be appreciated it if there is any feedback from you.
> 
> My question is If I have a USB device controller (udc) and a uart controller (16550) independently in a SoC,
> is there any usb-serial drivers or applications that could possible to support/connect:
> -	udc tx to uart rx
> -	uart tx to udc rx
> 
> Any chance I can make this SoC as a usb-serial devices?

Sure, use the CONFIG_USB_CONFIGFS_SERIAL or CONFIG_USB_CONFIGFS_ACM
build options and hook your gadget up to the serial port in userspace
and you will have a very expensive usb-serial converter (there are very
cheap chips that do the same thing if you want to make a simpler
device.)

hope this helps,

greg k-h
