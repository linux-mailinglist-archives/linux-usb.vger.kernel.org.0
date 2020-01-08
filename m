Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC8ED133DCC
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jan 2020 10:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgAHJFt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jan 2020 04:05:49 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:14547 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbgAHJFt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jan 2020 04:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578474347;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:Cc:Message-Id:Date:Subject:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=xKVShiJtsFnyQ6t05XRH9QhctVU9US41k4+oadVMHeU=;
        b=cq1f88KvCJ0BO10iHaPfycMxSsXE2hptrIToIhnasVY3/yZj4yPDrfLNSk8WgmKWbr
        Ne/hDLViA2H5UYqbie5ZZtJSShyVykwm073C2SheKf38SonGeX5KYIKXACVvlnCf43Dn
        RIPVcZTS7Mk2mgtRhjFadkj2FJTNf5ziwNV4KIKN5JqPcuy3IgiWr7c6v0LEEcsyEJiB
        Kike4lcSb6rCCTeJlkUtasJkydKRX6mc/mslZpestU8w0Tjn09GPszJ0RfKl8wV/zCnq
        uBv7/oBh9RY6m47FxhuRGfCWSr6H2X0Ic0hCo4+FJw37O/7zdbvNTCfhuaE9L4AL001K
        oiPg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDleVXA0PuFc="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.3 DYNA|AUTH)
        with ESMTPSA id a09dafw088xje62
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 8 Jan 2020 09:59:45 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: [BUG]: usb: dwc3: gadget: broken on OMAP5432
Date:   Wed, 8 Jan 2020 09:59:44 +0100
Message-Id: <703DD239-8E3B-405C-A531-FF7DEEED38DC@goldelico.com>
Cc:     linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Linux-OMAP <linux-omap@vger.kernel.org>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
I noticed that the usb ethernet gadget driver is broken since v5.5-rc2
and 5.4.4, but only for our OMAP5 board. Our OMAP3 boards work with
the same tree, kernel binary and user-space (Debian Stretch).

The symptom is that I can see the interface on the host PC being
enumerated and IP addresses etc. are set up. But a ping in either
direction fails/times out.

After inspecting diffs I found some changes in dwc3:gadget
and indeed omap3/twl4030 uses musb and omap5 uses dwc3.

Reverting

a7f7e61270f1 ("usb: dwc3: gadget: Fix logical condition");

on v5.5-rc makes it work again.

BTW: v4.19.90 works although it includes this logical condition fix.
So the real difference between v4.19 and v5.5 may be elsewhere in
newer kernels and only be revealed by the patch.

If important: my setup is running with USB2 cable and speed
only.

So please check this and other recent dwc3 patches for introducing
a stall of communication.

BR and thanks,
Nikolaus Schaller


