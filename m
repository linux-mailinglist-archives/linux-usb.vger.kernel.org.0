Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA9D78CE80
	for <lists+linux-usb@lfdr.de>; Wed, 14 Aug 2019 10:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727586AbfHNIby (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Aug 2019 04:31:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:43854 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725265AbfHNIby (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Aug 2019 04:31:54 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DCA4BAD45;
        Wed, 14 Aug 2019 08:31:52 +0000 (UTC)
Message-ID: <1565771508.25764.3.camel@suse.com>
Subject: Re: Strange behaviour of D-Link DUB-1312 USB 3.0 Adapters
From:   Oliver Neukum <oneukum@suse.com>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 14 Aug 2019 10:31:48 +0200
In-Reply-To: <db0e8930ea94408ca7a38192ddfd203f@SVR-IES-MBX-03.mgc.mentorg.com>
References: <db0e8930ea94408ca7a38192ddfd203f@SVR-IES-MBX-03.mgc.mentorg.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 14.08.2019, 08:17 +0000 schrieb  Schmid, Carsten :
> [Resend - had mailer errors ]
> 
> Hi Florian,
> 
> today i have seen a strange behaviour of two D-Link DUB-1312 adapters (same Revision A1).
> Plugging them into the same port (!) on my device one of them is recognized as SuperSpeed, the other as high speed ???
> (working on 4.14.129 LTS)
> 
> From dmesg, the "faulty" one:
> [  530.585871] usb 1-2: new high-speed USB device number 4 using xhci_hcd   <<<<<<<<< HUH ????

XHCI is not like EHCI. It needs no companion controller, as it serves
all speeds.

> I had a look at the driver code of ax88179, but that one didn't change much in the past up to v5.2.
> Nothing that explains what i can see here.

This is on a lower layer than ax88179. This comes from xhci_hcd.
Is this a regression?

	Regards
		Oliver

