Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2FA66228AB
	for <lists+linux-usb@lfdr.de>; Wed,  9 Nov 2022 11:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbiKIKke (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Nov 2022 05:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiKIKke (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Nov 2022 05:40:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CF01BEB6
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 02:40:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E285861957
        for <linux-usb@vger.kernel.org>; Wed,  9 Nov 2022 10:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78BFC433C1;
        Wed,  9 Nov 2022 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1667990432;
        bh=nQz3goy11G2RK0b/iSMz4gWg8npj9YJQ7Y7CIhmt/m8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gPlpT02y299qeY02q0h2Ao8dvQy8UmufNHYbXJofW21dpMgZet2N3WlfdmF0qrAxB
         PmttGvcKleLDNapw7y1NrPlnyWpsNHnVGCbpa98nxiz0dJzVPcQZgsKaha0of3sm7T
         CR0SGDShmHV9PgVhDiEQvqWkGnlFR1G6wi2O0ylk=
Date:   Wed, 9 Nov 2022 11:40:29 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Juhyung Park <qkrwngud825@gmail.com>
Cc:     Hongling Zeng <zenghongling@kylinos.cn>, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        zhongling0719@126.com
Subject: Re: [PATCH v6 2/3] usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS
Message-ID: <Y2uDnUQKCDGzioJN@kroah.com>
References: <1663210188-5485-1-git-send-email-zenghongling@kylinos.cn>
 <fa0556e5-e154-a4e6-6b18-4996a01d2f10@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa0556e5-e154-a4e6-6b18-4996a01d2f10@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 31, 2022 at 03:17:48PM +0900, Juhyung Park wrote:
> Hi,
> 
> I'm speaking from my own experience but RTL9210 is arguably the most
> reliable NVMe-to-USB converter available.
> 
> Compared to solutions from JMicron (multiple revisions) and ASMedia, RTL9210
> gave the lowest power consumption (from implementing proper power management
> commands) and the least headache.
> 
> I personally own multiple enclosures and not one gave a single UAS error
> from multiple platforms (Android, Intel, AMD) for years, but with this
> commit now, it effectively disables UAS for all RTL9210 enclosures.
> 
> Would it be possible to apply this quirk only to a specific firmware
> (range)? RTL9210 have a lot of possible firmware combinations: https://www.station-drivers.com/index.php/en/component/remository/Drivers/Realtek/NVMe-USB-3.1/lang,en-gb/
> 
> RTL9210 was available since 2019 and the fact that this quirk came up this
> late leads me to believe that this is not a widespread issue and it'll be a
> shame if all of RTL9210s are blacklisted from UAS with Linux from now on :(
> 
> If any additional information is required, please let me know.

Can you send a revert of this commit so that we can fix this up?

thanks,

greg k-h
