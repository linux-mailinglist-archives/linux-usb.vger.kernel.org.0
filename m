Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B125552B95
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 09:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345218AbiFUHQw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 03:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346727AbiFUHQu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 03:16:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9184B186D5
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 00:16:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B39546130D
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 07:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB63AC3411D;
        Tue, 21 Jun 2022 07:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1655795808;
        bh=hhwApR2yUWBo1gO/QTyweI1neaOx+HR4vsBeCZOdNgY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MuITu/kU3JblqAnDkG8dloy+FrmlEm+aCnmQn4IRtKHZhn53d5mQcBKehvYPRZ/+w
         6x/eekSGnwRZSPv7LtJx8HeIBLaIC489oqlnAXULy+gZ2zv05V/z0lzKrowjm2Nd5L
         mBvNCytxmI5SP+MC2A+b7lRs8WtEoyc8H5lt2ZRs=
Date:   Tue, 21 Jun 2022 09:16:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "michael.lee@omron.com" <michael.lee@omron.com>
Cc:     Chris Ruehl <chris.ruehl@gtsys.com.hk>,
        Lars Melin <larsm17@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: serial: usb: cdc-acm: OMRON B5L ToF, device probe failed
Message-ID: <YrFwXPUF9RfzTWzk@kroah.com>
References: <85ebf554-effd-c89e-6eb8-c149442b931c@gtsys.com.hk>
 <fc9986a6-0b11-d949-2196-1ad35d3f4d98@gtsys.com.hk>
 <1af7ff05-8558-9162-a0cd-ac140ddaf2e1@gmail.com>
 <cbcc2071-5b56-025e-cae6-5af0210e2363@gtsys.com.hk>
 <OSZP286MB1776CCBCBFE38B25C7DB9978E1B39@OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSZP286MB1776CCBCBFE38B25C7DB9978E1B39@OSZP286MB1776.JPNP286.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 21, 2022 at 12:38:22AM +0000, michael.lee@omron.com wrote:
> Dear Chris,
> 
> The below is the reply from Japan.
> 
> Dose they do the below commnad after connect B5L to USB?
> 
> sudo modprobe usbserial vendor=0x0590 product=0x00ca

So that means this is just a "generic" usb-serial device, not a cdc-acm
one at all.  Just add the device id to the generic usb-serial driver and
you should be fine.

BUT, that implies that the interrupt endpoints are useless?  Why are
they there?  How is flow control handled in this device?

Perhaps ask what the chip is in the device, that might help out here
more.

thanks,

greg k-h
