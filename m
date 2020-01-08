Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74D4E1347E8
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 17:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727490AbgAHQZj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 11:25:39 -0500
Received: from mail.navigue.com ([74.117.40.3]:45128 "EHLO mail.navigue.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727370AbgAHQZj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jan 2020 11:25:39 -0500
X-Greylist: delayed 377 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Jan 2020 11:25:38 EST
Received: from [192.168.7.178] (bureau.navigue.com [74.117.40.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.navigue.com (Postfix) with ESMTPSA id C5179140086
        for <linux-usb@vger.kernel.org>; Wed,  8 Jan 2020 11:21:15 -0500 (EST)
From:   Jonathan Thibault <jonathan@navigue.com>
Subject: USB_DWC3_OF_SIMPLE
To:     linux-usb@vger.kernel.org
Message-ID: <c3a1c48c-1ac7-e5c2-e09a-3b55100735ab@navigue.com>
Date:   Wed, 8 Jan 2020 11:19:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greetings,

I am currently trying to port OpenWRT to Ubiquiti's EdgeRouter 4 which 
is a Cavium Octeon 7130.  While investigating to support XHCI (the 
device has a single USB3 port), I ran into the dwc3 driver which 
apparently supports that very chipset via the dwc3-of-simple glue.

Looking at Ubiquiti's own firmware, it seems they are using a modified 
version of the standard xhci-platform driver.

So now I am faced with two different approaches:

1- Attempt to replicate Ubiquiti's modifications to xhci-plat.

2- Switch to dwc3-of-simple.

With option 1, so far, I can get xhci to load by merely adding a 
'.compatible =' member to usb_xhci_of_match[], but the driver complains 
about LPM algorithms and disables LPM (which may be fine, I don't know 
if it is even supported on this device).

Option 2 (where you might hopefully help), potentially involves more 
modification to the OpenWRT since their Octeon kernel config does not 
appear to enable CONFIG_COMMON_CLK, which the driver depends on.  And I 
do not know if I should also disable standard ohci and ehci drivers once 
I manage to enable the USB_DWC3_OF_SIMPLE.

I'm looking for recommendations on the best approach.  Keep in mind that 
while I can cobble together some ugly but functional hacks, I am not an 
experienced kernel dev.

-- 
Jonathan Thibault
Analyste/Administrateur Réseau
Navigue
97, route 132, Saint-Godefroi (Québec) G0C 3C0
581-357-2015
jonathan@navigue.com
www.navigue.com

