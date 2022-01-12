Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CEA948BEBD
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 07:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351071AbiALG7X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 01:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232181AbiALG7X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 01:59:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA8FC06173F
        for <linux-usb@vger.kernel.org>; Tue, 11 Jan 2022 22:59:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 94DF661367
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 06:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45409C36AE9;
        Wed, 12 Jan 2022 06:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1641970761;
        bh=dual4XxvTkmukj0pTF9MtIuSbPURiWf2GBICbJaC1XU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rEfin1uTOMBmnbKL72x5julUq+3Zb1RvIV3ZUWdtGk3LeppzC0CAWPV26kAIadb+M
         SIOW7DpGb3d+gLt3DID9KbrU69TGYhuohQXXlBQZgC458wGty9FgNWPz/2REEArm9h
         RLUcaCYpIBeZ3M6eLUoN3gRcknRwmfF80XBABZkY=
Date:   Wed, 12 Jan 2022 07:59:17 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     James <bjlockie@lockie.ca>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: no name mouse?
Message-ID: <Yd58RbSVg4eVroRF@kroah.com>
References: <9cb86662-d1f6-5d7e-65a4-c5a071e9b4f1@lockie.ca>
 <0895680e-8a4a-7eea-e5c8-f6c29867e563@infradead.org>
 <4f903a1b-61e4-9433-2e04-39bbb5f6401a@lockie.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f903a1b-61e4-9433-2e04-39bbb5f6401a@lockie.ca>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 11, 2022 at 07:56:00PM -0500, James wrote:
> 
> > You could look at 'lsusb -v' for that device and then look at these fields:
> > (e.g., from a "transceiver" device for a wireless kbd/mouse)
> > 
> >    iManufacturer           1 Dell Computer Corp
> >    iProduct                2 Dell Universal Receiver
> >    iSerial                 0
> > 
> > You should see iManufacturer and iProduct set to 0.
> > 
> iManufacturer           0
> iProduct                1 USB OPTICAL MOUSE

That's a fine string for the device, there's no requirement for any
string at all, but at least it has one.

So all is good.

thanks,

greg k-h
