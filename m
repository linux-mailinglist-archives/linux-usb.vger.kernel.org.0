Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB766321A34
	for <lists+linux-usb@lfdr.de>; Mon, 22 Feb 2021 15:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbhBVOVf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 09:21:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:35288 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231235AbhBVOTV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Feb 2021 09:19:21 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1614003515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mZTf2uMrCqZ1vhTrwFvnHjEY99k3aRMb6oKTn3bfHvU=;
        b=Oo99tj9ZTfsfm1mTcW8bcCGJSWhDYzHFjIbL702V8lgzYCQ4YVDjUMtiArmOkLPvDnOqYS
        f4J8lhC9KUc4sTOchFoHOU0n6JTxhF5AViL4KT+sN45qmjHTKQjZ6FnU1lZniq4sagQM0B
        uZ33d8GZO/PEDVA3CMQAxunxfz6n1/w=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 27095B118;
        Mon, 22 Feb 2021 14:18:35 +0000 (UTC)
Message-ID: <9fd28086226b7b8b49ac9047a06e92e4da154f73.camel@suse.com>
Subject: Re: [PATCH] USB: UAS: don't unbind and rebind the driver during
 usb_reset_device
From:   Oliver Neukum <oneukum@suse.com>
To:     Hui Wang <hui.wang@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Date:   Mon, 22 Feb 2021 14:50:31 +0100
In-Reply-To: <e7064799-0320-d662-47de-11181074130b@canonical.com>
References: <20210221085100.4297-1-hui.wang@canonical.com>
         <b1fe6cf4-b48f-c7e6-17c0-2ed04d8f3aa1@redhat.com>
         <ad6601a93f8fc4ec4d1451df5457e51aadf37301.camel@suse.com>
         <b28b38fa-3d19-3251-e576-38bd4d828ac1@canonical.com>
         <aba904f15b0bd07592ad59c00c07f6472c8d9663.camel@suse.com>
         <e7064799-0320-d662-47de-11181074130b@canonical.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 22.02.2021, 21:02 +0800 schrieb Hui Wang:
> On 2/22/21 8:51 PM, Oliver Neukum wrote:
> > Am Montag, den 22.02.2021, 20:40 +0800 schrieb Hui Wang:
> > > On 2/22/21 3:59 PM, Oliver Neukum wrote:
> > > OK, will find a UAS device to do the test.
> > Hi,
> > 
> > do you have a design at all?
> 
> No, so far what I could find is all driven by usb-storage, I tested a 
> couple of usb-sdcard-readers and usb-scsi/ata disk adapters, they all 
> belong to USB_INTERFACE_INFO(USB_CLASS_MASS_STORAGE, USB_SC_SCSI, 
> USB_PR_BULK) instead of USB_INTERFACE_INFO(USB_CLASS_MASS_STORAGE, 
> USB_SC_SCSI, USB_PR_UAS). I plan to go to the office to find some usb 
> storage devices to test.

Hi,

please wait.  First of all, you are making the assumption that all
resets originate from the SCSI layer. You cannot make that assumption.

Secondly, yes, ideally we should not pretend that a disconnect has
happened, when it hasn't happened, but what is your alternative.
What exactly do you want to test? You have not even defined the
desirable behavior and the problem you are seeing with the current
behavior.

	Regards
		Oliver


