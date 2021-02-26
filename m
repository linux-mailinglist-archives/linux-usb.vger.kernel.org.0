Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB333262C5
	for <lists+linux-usb@lfdr.de>; Fri, 26 Feb 2021 13:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbhBZMdk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Feb 2021 07:33:40 -0500
Received: from server.atrad.com.au ([150.101.241.2]:35540 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbhBZMdj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Feb 2021 07:33:39 -0500
Received: from marvin.atrad.com.au (IDENT:1008@marvin.atrad.com.au [192.168.0.2])
        by server.atrad.com.au (8.15.2/8.15.2) with ESMTPS id 11QCWX3F003084
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 26 Feb 2021 23:02:34 +1030
Date:   Fri, 26 Feb 2021 23:02:33 +1030
From:   Jonathan Woithe <jwoithe@just42.net>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: Samsung T5 500 GB USB3.1 SSD fails with ASMedia ASM1142, 250 GB
 version works
Message-ID: <20210226123232.GA26589@marvin.atrad.com.au>
References: <20210219102218.GA29156@marvin.atrad.com.au>
 <cdb0ab8e14de5f93dfae2164f18d9d1703b3fc36.camel@suse.com>
 <20210222111707.GA26487@marvin.atrad.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210222111707.GA26487@marvin.atrad.com.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MIMEDefang-action: accept
X-Scanned-By: MIMEDefang 2.79 on 192.168.0.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 22, 2021 at 09:47:07PM +1030, Jonathan Woithe wrote:
> On Mon, Feb 22, 2021 at 11:24:18AM +0100, Oliver Neukum wrote:
> > It is possible that the other machine can just supply more power.
> 
> On the machine with the ASMedia controller (where the problem occurs), the
> 500 GB SSD works perfectly well when connected to USB2 sockets.  If a USB2
> socket can supply sufficient power, wouldn't a USB3 port be more than
> capable?
> 
> The specifications for both the 250 GB (working) and 500 GB (not working)
> are 5V at 0.8A.  I'm guessing this is a worst-case scenario.  In any case,
> this is well within the capabilities of a USB3 port.  If there was a power
> issue with one of these drives it's surprising it's not seen in both -
> unless the 250 GB is just under the critical power threshold and the 500 GB
> is just above it.  Is there an easy way to tell if this is indeed the case?

Another datapoint: on the system with the ASMedia controller where the 250
GB T5 SSD works but the 500 GB T5 SSD does not, the same USB3 socket is able
to power a traditional 2.5" spinning rust hard drive without any obvious
problems.

Regards
  jonathan
