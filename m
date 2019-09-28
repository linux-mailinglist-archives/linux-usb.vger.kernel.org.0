Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEFCC10DB
	for <lists+linux-usb@lfdr.de>; Sat, 28 Sep 2019 14:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfI1Mh0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 28 Sep 2019 08:37:26 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:54143 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfI1Mh0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Sep 2019 08:37:26 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E05A520003;
        Sat, 28 Sep 2019 12:37:22 +0000 (UTC)
Message-ID: <7d5cea0ea49ef76a248f0c307418698cedf827dc.camel@hadess.net>
Subject: Re: Driver for something that's neither a device nor an interface
 driver?
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        benjamin.tissoires@redhat.com
Date:   Sat, 28 Sep 2019 14:37:21 +0200
In-Reply-To: <20190928121809.GB1845030@kroah.com>
References: <Pine.LNX.4.44L0.1909271351260.4732-100000@iolanthe.rowland.org>
         <7f25b01ceb1a3aa6bd213599474ceffc34a0054b.camel@hadess.net>
         <20190927192554.GB1805907@kroah.com>
         <48bcb34194695566b9c59f6e814706f8d65be962.camel@hadess.net>
         <20190928073935.GB1836895@kroah.com>
         <c47cfdbe937b209eb84af7de3aea7faf3faa5ca8.camel@hadess.net>
         <20190928121809.GB1845030@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, 2019-09-28 at 14:18 +0200, Greg KH wrote:
> Again, the power_supply api is for power going the other way in the
> system.  That's not an "existing clearly defined API in kernel
> space".

No it isn't, not since 2011.

commit 25a0bc2dfc2ea732f40af2dae52426ead66ae76e
Author: Jeremy Fitzhardinge <jeremy@goop.org>
Date:   Wed Dec 7 11:24:20 2011 -0800

    power_supply: add SCOPE attribute to power supplies
    
    This adds a "scope" attribute to a power_supply, which indicates how
    much of the system it powers.  It appears in sysfs as "scope" or in
    the uevent file as POWER_SUPPLY_SCOPE=.  There are presently three
    possible values:
            Unknown - unknown power topology
            System - the power supply powers the whole system
            Device - it powers a specific device, or tree of devices
    
    A power supply which doesn't have a "scope" attribute should be assumed to
    have "System" scope.
    
    In general, usermode should assume that loss of all System-scoped power
    supplies will power off the whole system, but any single one is sufficient
    to power the system.
    
    Signed-off-by: Jeremy Fitzhardinge <jeremy@goop.org>
    Cc: Richard Hughes <richard@hughsie.com>

