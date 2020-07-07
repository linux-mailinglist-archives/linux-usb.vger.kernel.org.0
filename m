Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1C521662E
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 08:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgGGGGP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 02:06:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:53998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbgGGGGP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 02:06:15 -0400
Received: from localhost.localdomain (unknown [222.67.222.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FC9220758;
        Tue,  7 Jul 2020 06:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594101975;
        bh=5S0rSB5uS9hCqjPAOCcw/OjWAs81VwSNMCse+ZiOHf4=;
        h=From:To:Cc:Subject:Date:From;
        b=QBifxQkyWYrTzcjgNOlW2WI8umuJyZ3pjJi7pb63reQKTKLtbvrtUsFdg6Yw4bBW5
         VMQhbnFD28l/JIxDWnlvQdrJB5tZWnrsqNVWr0L3INfQIhzJ1tw36DMd+e65PfyWVq
         a68raxsEEUsBlPQODRnGZNEUZqZPgNXUpU/qMoAI=
From:   Peter Chen <peter.chen@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 0/1] usb: chipidea: fixes for usb-linus
Date:   Tue,  7 Jul 2020 14:06:00 +0800
Message-Id: <20200707060601.31907-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

Peter Chen (1):
  usb: chipidea: core: add wakeup support for extcon

 drivers/usb/chipidea/core.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

-- 
2.17.1

