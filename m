Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBC9619CE72
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2020 03:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390176AbgDCB7X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 21:59:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50474 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2389919AbgDCB7X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Apr 2020 21:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585879162;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gEDm5BrYJL3oTWRM1eaRB2PsA66yue+/A7GGuTldfzk=;
        b=I1MhiJQJ7boPpuA6xR+0M3+crkpMfQ19PHpD1AZa6luzF/wLraSOM+DFHaLCY+H4FO1Jlb
        PfZrSiDtFdnRojn9eE1KUE2/oCpcQbPgII4pwxjYbs7PhshzHa3bdr9JXAbPrxLHC95Ge3
        ngd0/asFx73vDiR7BHot/9m7zT0IFUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-WoGMyB3ZOHmeTNw4_7wMuQ-1; Thu, 02 Apr 2020 21:59:20 -0400
X-MC-Unique: WoGMyB3ZOHmeTNw4_7wMuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEC43107ACC9;
        Fri,  3 Apr 2020 01:59:19 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.10.110.40])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 34C1996B99;
        Fri,  3 Apr 2020 01:59:19 +0000 (UTC)
Message-ID: <49b60dd7735657d5b0cbfdff3bb9bd26306c2953.camel@redhat.com>
Subject: Re: Alcatel x602d driver
From:   Dan Williams <dcbw@redhat.com>
To:     Benjamin Sembel <benjamin.sembel@gmx.de>, linux-usb@vger.kernel.org
Date:   Thu, 02 Apr 2020 20:59:18 -0500
In-Reply-To: <6ae3dfed-fcc0-0933-23b1-ef30db89dda0@gmx.de>
References: <6ae3dfed-fcc0-0933-23b1-ef30db89dda0@gmx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-04-02 at 22:51 +0200, Benjamin Sembel wrote:
> Hi,
> 
> I have an alcatel x602d umts stick with vendor id 1bbb and 022c.
> After
> using usb_modeswitch to switch it to configuration 2 it has no driver
> attached. I managed to get it working with "modprobe usbserial -v
> 1bbb
> -b 022c" and wvdial with this configuration:

What do you get when you run:

lsusb -v -d 1bbb:022c

That tells us more about how the modem interfaces with the kernel.

Dan

> 
> [Dialer Defaults]
> Modem Type = Analog Modem
> ISDN = 0
> Baud = 9600
> Carrier Check = yes
> Stupid Mode = 1
> Modem = /dev/ttyUSB1
> Init1 = AT
> Init2 = ATE0V1
> Init3 = ATS0=0
> Init4 = ATS7=60+DS=3,0;&K3
> Init5 = AT+CGDCONT=1,"IP","internet.t-mobile"
> Phone = *99#
> Dial Command = ATD
> Dial Attemps = 2
> Username = none
> Password = none
> 
> 
> But i am loosing about half of the packets, and i found the message
> in
> /var/log/messages that I should contact you to add a proper driver to
> my
> device.
> 
> What should i do? I am relativly new to linux.
> 
> 
> Kind regards, Benjamin
> 

