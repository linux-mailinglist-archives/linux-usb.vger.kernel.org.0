Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFA01B57BE
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 11:07:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgDWJHK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 05:07:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:35478 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbgDWJHK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Apr 2020 05:07:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4C685AFDC;
        Thu, 23 Apr 2020 09:07:08 +0000 (UTC)
Message-ID: <1587632815.23108.1.camel@suse.com>
Subject: Re: USB BUG on BCM6318
From:   Oliver Neukum <oneukum@suse.com>
To:     xchetah <xchetah@gmail.com>, linux-usb@vger.kernel.org
Date:   Thu, 23 Apr 2020 11:06:55 +0200
In-Reply-To: <590879e3-f9ea-0a59-3262-41192ca4cf46@gmail.com>
References: <590879e3-f9ea-0a59-3262-41192ca4cf46@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 22.04.2020, 19:45 +0300 schrieb xchetah:
> 


Hi,

which kernel version?

> the problem is that there’s no connectivity at all , I can connect to 
> the AP (only without encryption ) and the ssid doesn’t always show on my 
> mobile phone.
> the usb port is working fine , I tried mounting a usb flash drive with 
> no problem.
> also the adapter is working , I tried it on Orange pi , Raspberrypi , 
> bcm6328 , all with openwrt installed on them and didn’t have any problem .
> I guess it is something related to bcm6318 or its architecture code .
> the onboard broadcom pci wifi is working .
> I suspected that its a power problem so I added an external usb power , 
> but with same issues.
> also I tried openwrt 19 ,18 ,17 with same problem.
> I’m also using two bcm6328 routers as point to point wifi 5ghz link with 
> Ralink RT5572 chipset ( rt2800usb driver ) withouyt any problem.
> dmesg is filled with :
> 
> [ 1269.191198] rt2800usb_tx_sta_fifo_read_completed: 13054 callbacks 
> suppressed
> [ 1269.191239] ieee80211 phy1: rt2800usb_tx_sta_fifo_read_completed: 
> Warning - TX status read failed -32

-EPIPE. Something is stalled. The cause is unknown. What is the very
first error during the enumeration process?

	Regards
		Oliver

