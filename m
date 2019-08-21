Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8CFB9706C
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 05:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbfHUDix (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 23:38:53 -0400
Received: from gate.crashing.org ([63.228.1.57]:60868 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726907AbfHUDix (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 23:38:53 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7L3cnfI011382;
        Tue, 20 Aug 2019 22:38:50 -0500
Message-ID: <8b5d460e023284a803d5f448655d5c20de711f12.camel@kernel.crashing.org>
Subject: f_mass_storage vs drivers/target
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     USB list <linux-usb@vger.kernel.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>
Date:   Wed, 21 Aug 2019 13:38:49 +1000
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi folks !

It seems that f_mass_storage duplicates (well maybe predates too..) a
lot of what's in drivers/target.

Anybody working on implementing a new version of f_mass_storage that
is layered upon drivers/target instead ? That would bring quite a lot
of additional functionality.

If not, I might look into it.

Cheers,
Ben.


