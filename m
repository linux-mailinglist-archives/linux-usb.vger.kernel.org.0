Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90DD125F97D
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 13:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729059AbgIGLc0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 07:32:26 -0400
Received: from bmailout3.hostsharing.net ([176.9.242.62]:60477 "EHLO
        bmailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728993AbgIGLcV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Sep 2020 07:32:21 -0400
X-Greylist: delayed 586 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Sep 2020 07:32:20 EDT
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id CC550100DA1AF;
        Mon,  7 Sep 2020 13:21:51 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 8E6881FB9D; Mon,  7 Sep 2020 13:21:51 +0200 (CEST)
Date:   Mon, 7 Sep 2020 13:21:51 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH] thunderbolt: Retry DROM read once if parsing fails
Message-ID: <20200907112151.GA22115@wunner.de>
References: <20200907110340.71031-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907110340.71031-1-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 07, 2020 at 02:03:40PM +0300, Mika Westerberg wrote:
> Kai-Heng reported that sometimes DROM parsing of ASUS PA27AC Thunderbolt 3
> monitor fails. This makes the driver to fail to add the device so only
> DisplayPort tunneling is functional.

Maybe the DROM is contained in an external EEPROM attached via slow
SPI or i2c and cannot be read in time before a response on the control
channel is due?  Does it help to always delay 100 ms before performing
the DROM read with this display?  Perhaps a quirk specific for this
display is more appropriate than a change which affects all devices?
Because this way of working around problems is difficult to maintain
long term.

Thanks,

Lukas
