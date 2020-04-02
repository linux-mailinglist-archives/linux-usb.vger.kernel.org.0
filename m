Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464E219BCA5
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 09:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732660AbgDBHYz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 03:24:55 -0400
Received: from vsmtp1.tin.it ([212.216.176.141]:54577 "EHLO vsmtp1.tin.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729289AbgDBHYz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Apr 2020 03:24:55 -0400
X-Greylist: delayed 345 seconds by postgrey-1.27 at vger.kernel.org; Thu, 02 Apr 2020 03:24:54 EDT
Received: from massimo-ThinkPad-L420 (79.31.224.232) by vsmtp1.tin.it (8.6.060.43) (authenticated as maxcipo1@tin.it)
        id 5CA4C1EC148E0AA7 for linux-usb@vger.kernel.org; Thu, 2 Apr 2020 09:19:08 +0200
Message-ID: <eac8a94386a3bf69296f048873ede8230c67f632.camel@tin.it>
Subject: Usb_power_supply
From:   massimo <maxcipo1@tin.it>
To:     linux-usb@vger.kernel.org
Date:   Thu, 02 Apr 2020 09:19:06 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I've read the interesting Greg's article about writing USB driver for
Linux.
I'm interested in a simpler question. Is it possible
to write a driver in Ubuntu (19.10) to switch power on or off to a USB
port, that' s to say to give or take off the 5 volts power supply  to a
USB port (in order for example to switch on or off a simple usb lamp)?
Thanks for your attention and courtesy, Massimo.

