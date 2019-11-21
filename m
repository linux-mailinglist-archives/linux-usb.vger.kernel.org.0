Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4526D1052D5
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 14:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfKUNXX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 08:23:23 -0500
Received: from mx2.suse.de ([195.135.220.15]:37352 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726342AbfKUNXX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Nov 2019 08:23:23 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 7BC9DB089;
        Thu, 21 Nov 2019 13:23:21 +0000 (UTC)
Message-ID: <1574342596.29504.1.camel@suse.com>
Subject: Re: Logitech USB wireless reciever m280
From:   Oliver Neukum <oneukum@suse.com>
To:     =?UTF-8?Q?=D0=94=D0=BC=D0=B8=D1=82=D1=80=D0=B8=D0=B9_?=
         =?UTF-8?Q?=D0=9C=D0=B0=D0=BD=D0=B6=D1=83=D1=80=D0=B0?= 
        <dimitriusman@gmail.com>, linux-usb@vger.kernel.org
Date:   Thu, 21 Nov 2019 14:23:16 +0100
In-Reply-To: <CAPSdnVC_708+Fk6enHhcBdOG-iQoyoiDtD9S4sV3LLzk0agJCg@mail.gmail.com>
References: <CAPSdnVC_OFsSNBmAqSJyHe5giv1n7EpCM9YzuUjye462-60BHQ@mail.gmail.com>
         <CAPSdnVC_708+Fk6enHhcBdOG-iQoyoiDtD9S4sV3LLzk0agJCg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 21.11.2019, 14:22 +0200 schrieb Дмитрий Манжура:
> Hello,
> 
> Logitech wireless receiver m280 not working and not detecting via
> lsusb on distros with kernel 5.2+
> 
> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 003 Device 002: ID 04f2:b5e0 Chicony Electronics Co., Ltd VGA WebCam
> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 001 Device 002: ID 04ca:3015 Lite-On Technology Corp.
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> 
> On kernel 4.19 its working fine
> 
> Once i trace this error
> 
> kernel: usb 3-2: new full-speed USB device number 4 using xhci_hcd
> kernel: usb 3-2: device descriptor read/all, error -71
> kernel: usb 3-2: new full-speed USB device number 5 using xhci_hcd
> kernel: usb 3-2: unable to read config index 0 descriptor/start: -71
> kernel: usb 3-2: can't read configurations, error -71
> kernel: usb usb3-port2: attempt power cycle

Hi,

this indicates a low level issue in XHCI. Could you bisect?

	Regards
		Oliver

