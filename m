Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C208D697B56
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 13:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233964AbjBOMBa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 07:01:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233939AbjBOMBS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 07:01:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574BF38674
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 04:00:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 01FAFB81C17
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 12:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D847C433D2;
        Wed, 15 Feb 2023 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1676462456;
        bh=MnFr83PBwL0jL7oFCZIq5Z80a8PUWiz11siLCu/++zg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kNBhV8vsORTKQECjLwOSlC5WTO5v89+xmQ85GDxzZ7qYOpYPT7wEnFZzobCK8byN3
         VW4cwedRPAhWLcdxU/PCbNt+jXcYztHTQfgbv7zxN4MqwqTRoSV6/+XG65eVv1x77P
         duArAKJhVK+I3AtGFIk7lwUzeLjIhQwkzxx6OJwQ=
Date:   Wed, 15 Feb 2023 13:00:53 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: pci: add support for the Intel Meteor Lake-M
Message-ID: <Y+zJdaJz0E2PUcoV@kroah.com>
References: <20230215115052.49822-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215115052.49822-1-heikki.krogerus@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 15, 2023 at 01:50:52PM +0200, Heikki Krogerus wrote:
> This patch adds the necessary PCI IDs for Intel Meteor Lake-M
> devices.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  drivers/usb/dwc3/dwc3-pci.c | 4 ++++
>  1 file changed, 4 insertions(+)

Should this also go to stable kernels?

thanks,

greg k-h
