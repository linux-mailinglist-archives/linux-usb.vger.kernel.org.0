Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3AC19F13D
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2020 10:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgDFIAO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Apr 2020 04:00:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:58586 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbgDFIAO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Apr 2020 04:00:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 8DB4AAE19;
        Mon,  6 Apr 2020 08:00:12 +0000 (UTC)
Message-ID: <1586159894.10429.8.camel@suse.com>
Subject: Re: Panasonic NV GS27E on Linux Mint
From:   Oliver Neukum <oneukum@suse.com>
To:     "Linux@karl-arne.no" <linux@karl-arne.no>,
        linux-usb@vger.kernel.org
In-Reply-To: <07a9e05d-4a19-0f05-ae6e-48a5e28409c5@karl-arne.no>
References: <07a9e05d-4a19-0f05-ae6e-48a5e28409c5@karl-arne.no>
Content-Type: text/plain; charset="UTF-8"
Date:   Mon, 06 Apr 2020 09:58:14 +0200
Mime-Version: 1.0
X-Mailer: Evolution 3.26.6 
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 03.04.2020, 12:52 +0200 schrieb Linux@karl-arne.no:
> Hello.
> 
> I am new to this list. I have a question.
> 
> After some investigation can I now see my camera registred in the 
> kernel. I can still not see the usb device listed and have no access to 
> the camera. Here is a lot of information that Ihope can be in your 
> interests if you can help me out...

Hi,

I am afraid this is a fundamental misunderstanding.
The kernel does not create USB devices for every device
connected via USB.
The device nodes created depend on the class of the driver,
not the physical bus. In your case they will be video,
sound and input devices.

And your kernel creates an event for a new video device:

KERNEL[137510.512307] add /devices/pci0000:00/0000:00:14.0/usb2/2-3 (usb)
KERNEL[137510.515438] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0 (usb)
KERNEL[137510.518719] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/video4linux/video2 
(video4linux)

Please check that out and if it does not work, make a bug report
and we will happily direct you to the correct list.

	HTH
		Oliver

