Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79159264FE2
	for <lists+linux-usb@lfdr.de>; Thu, 10 Sep 2020 21:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgIJTyZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Sep 2020 15:54:25 -0400
Received: from marcansoft.com ([212.63.210.85]:60602 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726458AbgIJTyT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Sep 2020 15:54:19 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id EAA7A41982;
        Thu, 10 Sep 2020 19:54:10 +0000 (UTC)
Subject: Re: [PATCH v2] usb: serial: Repair FTDI FT232R bricked eeprom
To:     James Hilliard <james.hilliard1@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Lars Melin <larsm17@gmail.com>,
        Oliver Neukum <oneukum@suse.de>, linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russ Dill <Russ.Dill@gmail.com>
References: <20200909193419.2006744-1-james.hilliard1@gmail.com>
 <1599706954.10822.3.camel@suse.de>
 <a1161f77-5b37-39ea-eb91-7b0b59278960@gmail.com>
 <20200910080850.GD24441@localhost>
 <CADvTj4rDdj8KtLhGZEZP+XZcF4DTE4oW9sNf=zNWaRPzkny93A@mail.gmail.com>
 <20200910085541.GA1099591@kroah.com>
 <CADvTj4pYR9H1X1_f4DYTkb5ViXAdx9sO5yBgHgM5vFaDMs_miQ@mail.gmail.com>
 <26a723e4-e166-6377-875a-f737a15dc6b1@marcansoft.com>
 <CADvTj4o9GL5p6eZq+0Q_Pw_ZKuYHvAtav79==CJDdnTj7q+bBg@mail.gmail.com>
From:   Hector Martin <hector@marcansoft.com>
Message-ID: <0bcb0208-04bc-40c8-7b42-56b4dcf93f21@marcansoft.com>
Date:   Fri, 11 Sep 2020 04:54:08 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CADvTj4o9GL5p6eZq+0Q_Pw_ZKuYHvAtav79==CJDdnTj7q+bBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/09/2020 03.51, James Hilliard wrote:
> I haven't tested this yet but my assumption was that either a kernel driver
> or libusb can issue usb control messages, but both can not be bound to
> a device at the same time. I figured this wouldn't have come up when you
> tested your python script since the script likely predated adding the brick PID
> to the ftdi_sio Linux kernel driver.

Binding to interfaces is exclusive, but global device control messages 
are not issued to an interface. I think it should work even if the 
kernel driver is bound (this is how lsusb works too, since it issues 
control requests even to devices bound to drivers). Even if it is 
necessary to unbind it, though, libusb already provides a single 
function to do that (libusb_detach_kernel_driver).

-- 
Hector Martin (hector@marcansoft.com)
Public Key: https://mrcn.st/pub
