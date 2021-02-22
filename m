Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 778A53211B0
	for <lists+linux-usb@lfdr.de>; Mon, 22 Feb 2021 08:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbhBVH7w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 02:59:52 -0500
Received: from mx2.suse.de ([195.135.220.15]:49376 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230309AbhBVH7v (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Feb 2021 02:59:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613980745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6zTPDuWy0j8i9RX4uz0L/L94xhfont5nHqgTqUIrf6w=;
        b=Zvnno/TsiXYQgdFTpcs/G1+toKuSVCrf8jtpvv5FbKiZNHh05LfS2vLigdHZYvMIn519Vq
        xOifj0gglhnjVAjZ2edNOQy9QKKhqYejqUU1+FQLxeLb1HocyiqUYU9v5tlDs1TE3soHnf
        1xQI7ufJdyzG8j6BG2yj/tLNNzFky1c=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 719E5ACBF;
        Mon, 22 Feb 2021 07:59:05 +0000 (UTC)
Message-ID: <ad6601a93f8fc4ec4d1451df5457e51aadf37301.camel@suse.com>
Subject: Re: [PATCH] USB: UAS: don't unbind and rebind the driver during
 usb_reset_device
From:   Oliver Neukum <oneukum@suse.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Hui Wang <hui.wang@canonical.com>, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org
Date:   Mon, 22 Feb 2021 08:59:02 +0100
In-Reply-To: <b1fe6cf4-b48f-c7e6-17c0-2ed04d8f3aa1@redhat.com>
References: <20210221085100.4297-1-hui.wang@canonical.com>
         <b1fe6cf4-b48f-c7e6-17c0-2ed04d8f3aa1@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Sonntag, den 21.02.2021, 11:20 +0100 schrieb Hans de Goede:
> Hi,

Hi,

> 
> On 2/21/21 9:51 AM, Hui Wang wrote:
> > Once pre_reset() or post_reset() returns non-zero, the disconnect()
> > and probe() of the usb_driver will be called. In the disconnect(),
> > the scsi_host will be removed and be freed after scsi_host_put(), in
> > the probe(), the new scsi_host and uas_dev_info will be created.
> > 
> > If the usb_reset_device() is triggered by eh_device_reset_handler(),
> > and pre_reset()/post_reset() returns non-zero, the disconnect() and
> > probe() will be called, then returns to the eh_device_reset_handler(),
> > it still accesses old scsi related variables and uas_dev_info, and so
> > do its caller functions.
> > 
> > Here change the pre_reset() and post_reset() to let them only return
> > 0, after this change, the usb_reset_device() will only reset this
> > usb devcie from its hub port, will not execute unbind and rebind
> > usb_driver during reset.
> 
> We only return non 0 from the pre/post reset handles if we failed
> to ensure the device is in a known state.

correct. Technically it is a bit unfortunate that UAS devices react
a bit different to other SCSI devices, but we definitely cannot hide
a failure. Arguably we should go into OFFLINE state.
But that needs a
good reason beyond theoretical considerations.

	Regards
		Oliver


