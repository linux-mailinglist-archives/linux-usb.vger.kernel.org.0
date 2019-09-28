Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB042C106E
	for <lists+linux-usb@lfdr.de>; Sat, 28 Sep 2019 11:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbfI1Jel convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 28 Sep 2019 05:34:41 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:41665 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfI1Jel (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 28 Sep 2019 05:34:41 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 62BB7FF807;
        Sat, 28 Sep 2019 09:34:39 +0000 (UTC)
Date:   Sat, 28 Sep 2019 11:34:37 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-usb@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: regression from commit "usb: host: xhci-plat: Prevent an
 abnormally restrictive PHY init skipping"
Message-ID: <20190928113437.27a42dc2@xps13>
In-Reply-To: <20190928042950.3ae07173@nic.cz>
References: <20190928042950.3ae07173@nic.cz>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Marek,

Marek Behun <marek.behun@nic.cz> wrote on Sat, 28 Sep 2019 04:29:50
+0200:

> Hi Miquel,
> 
> I am encountering a regression caused by your commit eb6c2eb6c7fb
> "usb: host: xhci-plat: Prevent an abnormally restrictive PHY init
> skipping" [1]

Sorry for the regression.

> 
> In the Turris Mox device tree, we use both a comphy and a usb-phy, see
> [2]. I am not sure how to solve this now. You write in your commit
> message that "While there is not users of both PHY types at the same
> time, drop this limitation from the xhci-plat.c driver."

After checking, this statement was true at the time I wrote it but
with the game of patches waiting on ML before being applied, both
our changes got merged almost at the same time.

> Should I get this patch reverted or try to solve it another way?

This patch [1] should enter during the next release (part of a bigger
series), it shows how to avoid this harsh situation where we handle two
(very different) PHY types in the same way by describing better the
hardware in the DT (discussed previously with Martin).

[1] https://patchwork.kernel.org/patch/11067687/

Hope that will help?

Thanks,
Miquèl
