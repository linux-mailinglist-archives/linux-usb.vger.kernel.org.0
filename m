Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42964A4DC5
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jan 2022 19:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239879AbiAaSMD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jan 2022 13:12:03 -0500
Received: from mxerems.erems.fr ([89.225.208.214]:37508 "EHLO ere-mx2.erems.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231236AbiAaSMC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 Jan 2022 13:12:02 -0500
Received: from localhost (localhost [127.0.0.1])
        by ere-mx2.erems.fr (Postfix) with ESMTP id 1C4CB45E00B5
        for <linux-usb@vger.kernel.org>; Mon, 31 Jan 2022 19:12:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at erems.fr
Received: from ere-mx2.erems.fr ([127.0.0.1])
        by localhost (ere-mx2.erems.loc [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id uRSBDyvNzBlA for <linux-usb@vger.kernel.org>;
        Mon, 31 Jan 2022 19:12:00 +0100 (CET)
Received: by ere-mx2.erems.fr (Postfix, from userid 0)
        id E183645E00D0; Mon, 31 Jan 2022 19:12:00 +0100 (CET)
Subject: Looking for usbip driver
To:     <linux-usb@vger.kernel.org>
X-Mailer: mail (GNU Mailutils 2.99.99)
Message-Id: <20220131181200.E183645E00D0@ere-mx2.erems.fr>
Date:   Mon, 31 Jan 2022 19:12:00 +0100 (CET)
From:   root <brice.chatelan@erems.fr>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I have an old equipment on the international space station running a linux 2.4 kernel (RedHat).
I need to connect the USB1000IP to it to use standard devices: mass storage and cameras.
The usbip device driver for linux seems to be the right package to handle this hardware.
If you agree with this, where can I find the complete source code of my 2.4 kernel (otherwise 2.6)?

-
Brice
