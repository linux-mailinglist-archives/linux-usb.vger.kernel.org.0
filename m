Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44325329125
	for <lists+linux-usb@lfdr.de>; Mon,  1 Mar 2021 21:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237828AbhCAUTs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Mar 2021 15:19:48 -0500
Received: from xaiki.net ([108.166.209.89]:50214 "EHLO mail.xaiki.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242952AbhCAURM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Mar 2021 15:17:12 -0500
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by mail.xaiki.net (Postfix) with ESMTPA id E4C10EBCB;
        Mon,  1 Mar 2021 20:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=evilgiggle.com;
        s=dkim; t=1614629787;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=VpoEIj2jP9hrQUoK8LCBdsSQTF1aB06qJ7XSNZzwqLY=;
        b=KioZB9oIFMCMVsprpwZDmlCAGkTGyfMlwyLuvHTfYftvajoZIfbGHhR0yc9HKe4BbcxhM5
        1dsf7Gd9XxpXaIsa3xjqqR135CQr83x3bJdqUff0D0FVmtl5XKt9ScwhiyE0Ea2WRYZVva
        His7gtVd3RUb/oodbuc+keMP4lJ2fqIsT2vSuk0R42cnbfM8QM+qoZTm4zBw4HCvq8La0A
        MV8VkZa0rFdK0rMwAzFQuuwlOL48J0vfzbuFPnU+5LB1ClWWmW6PjlA4ZjNZJiceJEju0r
        2bH2SsDaSoANSgKyYlJF/1NtujHzEr5gph82ZqY21LQqNA7e8Wr/gu4KPEe/vg==
From:   Niv Sardi <xaiki@evilgiggle.com>
To:     linux-usb@vger.kernel.org
Cc:     Niv Sardi <xaiki@evilgiggle.com>
Subject: [PATCH v3 0/1] USB: serial: ch341: add new Product ID
Date:   Mon,  1 Mar 2021 17:16:11 -0300
Message-Id: <20210301201612.10867-1-xaiki@evilgiggle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: mail.xaiki.net;
        auth=pass smtp.auth=x@btn.sh smtp.mailfrom=xaiki@evilgiggle.com
X-Spam-Level: ****
X-Spamd-Bar: ++++
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

v3 based on feedback from Johan Hovold:
 - remove link to ANU232MI datasheet, but still reference it as it's
   the closest match i could find on the internet.
 - add a bit on how i got the device.
 - add lspci -v output.
 - run checkpatch.pl and correct spelling.

v2 based on feedback from Greg KH:
 - use git send-email:
   - fix patch format.
   - have author == sender.

Niv Sardi (1):
  USB: serial: ch341: add new Product ID

 drivers/usb/serial/ch341.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.30.1

