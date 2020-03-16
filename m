Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDA018638E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 04:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729560AbgCPDKt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 23:10:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:52440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729544AbgCPDKt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 15 Mar 2020 23:10:49 -0400
Received: from localhost.localdomain (unknown [180.171.74.255])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36A3B20409;
        Mon, 16 Mar 2020 03:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584328248;
        bh=EtUK58KSfemV+XrCFhAm70zl+3sKSdhIGWmZVMuovuw=;
        h=From:To:Cc:Subject:Date:From;
        b=URCf9NUzae0b0ZrbO9nZezfJK+P74ODKBm1DcDQj56w7XArIfbuI0tuWzsPf9JhG0
         AAYVyuT9QDjKbxStFrdSpxRVMgBpaZrRZiI/7kpxSeqS0dhFf06WcbJomOLUCCSZZx
         2IuMeWZBeEaWPeCWg6JFMswdkXGBUkp2KCBIhgys=
From:   Peter Chen <peter.chen@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/1] usb: chipidea: fix for usb-linus
Date:   Mon, 16 Mar 2020 11:10:33 +0800
Message-Id: <20200316031034.17847-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Peter Chen (1):
  usb: chipidea: udc: fix sleeping function called from invalid context

 drivers/usb/chipidea/udc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.17.1

