Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7132AB394
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 10:29:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbgKIJ3n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 04:29:43 -0500
Received: from mx2.suse.de ([195.135.220.15]:50252 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726176AbgKIJ3n (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 04:29:43 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1604914181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZdOafiiVKnML6zSVIQ0iINXPVsTF7V7FpeoE+SDYXSI=;
        b=Jq+gSU9w+Q52RbNQbUb6d1TGphuXAJHVDmE6VrZsALT7TGMUjoTQ+dIRJqAVTh9FyeNIC8
        LubQ7YkfSPU8zLtgvQg0f40+98t/Dm3o0imawe6Z1dLtGyL8uozJ2GN8FxinPdn7CWxh7F
        9H479N6iMS/HT3T1dKZ00/UjSDPbINo=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7AEA5ABCC;
        Mon,  9 Nov 2020 09:29:41 +0000 (UTC)
Message-ID: <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>
Subject: Re: Issues with LaCie USB3 drive and UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>,
        linux-usb@vger.kernel.org
Date:   Mon, 09 Nov 2020 10:29:34 +0100
In-Reply-To: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Sonntag, den 08.11.2020, 10:56 +0000 schrieb David C. Partridge:
> LUbuntu 20.04.1
> 
> root@charon:/home/amonra# lsusb
> Bus 002 Device 006: ID 059f:105f LaCie, Ltd 2Big Quadra USB3
> 
> Trying to format the above drive using mkfs.ext4 /dev/sdc2
> 
> Initially got a 120s Kernel timeout which I resolved by setting the timeout
> to 0
> 
> However I got LOTS of message groups in the system log looking like this:
> 
> Nov 04 06:18:51 charon kernel: scsi host5: uas_eh_device_reset_handler start
> Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#0 uas_zap_pending 0
> uas-tag 1 inflight: 
> Nov 04 06:18:51 charon kernel: sd 5:0:0:0: [sdc] tag#0 CDB: Write Same(10)
> 41 00 e8 ea 47 fc 00 00 04 00

Write Same? What you are seeing is that the error handling is running
non-stop. I suspect that the device does not understand WRITE SAME.

	Regards
		Oliver


