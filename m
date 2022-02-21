Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9591D4BE53E
	for <lists+linux-usb@lfdr.de>; Mon, 21 Feb 2022 19:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347824AbiBUJNY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Feb 2022 04:13:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348168AbiBUJLC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Feb 2022 04:11:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B6322512
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 01:02:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D45E860FB6
        for <linux-usb@vger.kernel.org>; Mon, 21 Feb 2022 09:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C054C340F1;
        Mon, 21 Feb 2022 09:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645434178;
        bh=0qCD4z9zs58Kj7sdIcfXidpcyjMsqICvHtJB47hhd7s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cf3RjDDMeZb1LPwWkAHO8ZXULvWRYCYn64qj0t3r92vcQ/9a/euU//m1sjwugNjL2
         X65x3yYGWkYdzF0+q2CXouykJTMYBJnkjzwSzslguGXkU0lvV3OFlZEknSHxk4Zbz1
         KGHkHOkQ7x+idr93FOLhKtSvcUbveoNKbjwilDemLoHv0t2X+M+gd9bAe9DC2rSH9e
         lkF7CZFZpwyEYnf/CDOkjhQobmknHygHEV+pP1d5+FOXaq6LnFZMqmDYm+0uyIYUV6
         xnDNJOOPObW92+l8tYAe5qqiXw0bk0CacMhF0vrUjb7YsftalPIHzrLJl9umRFQgvr
         K8q9YNNv3DANg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1nM4at-0003yv-2p; Mon, 21 Feb 2022 10:02:55 +0100
Date:   Mon, 21 Feb 2022 10:02:55 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmytro Bagrii <dimich.dmb@gmail.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        kernel@aiyionpri.me
Subject: Re: [PATCH v2] Revert "USB: serial: ch341: add new Product ID for
 CH341A"
Message-ID: <YhNVP/J2daB8DR15@hovoldconsulting.com>
References: <YgJHRKQHQheKTwjU@kroah.com>
 <20220210164137.4376-1-dimich.dmb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210164137.4376-1-dimich.dmb@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 10, 2022 at 06:41:37PM +0200, Dmytro Bagrii wrote:
> This reverts commit 46ee4abb10a07bd8f8ce910ee6b4ae6a947d7f63.
> 
> CH341 has Product ID 0x5512 in EPP/MEM mode which is used for
> I2C/SPI/GPIO interfaces. In asynchronous serial interface mode
> CH341 has PID 0x5523 which is already in the table.
> 
> Mode is selected by corresponding jumper setting.
> 
> Signed-off-by: Dmytro Bagrii <dimich.dmb@gmail.com>

I was hoping for some more details in the commit message so we don't
have to dig out the information from long email-threads if this ever
comes up again. 

Well, well. I added links to the mail archives before applying.

Thanks!

Johan
