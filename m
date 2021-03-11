Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C52B3378FB
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 17:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234521AbhCKQPL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 11:15:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:51292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234519AbhCKQPB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 11:15:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 763D564F90;
        Thu, 11 Mar 2021 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615479300;
        bh=buX2eODYPTT+UebcWmIVQF4nxZqYNzX9QizZIJD/Fj8=;
        h=From:To:Cc:Subject:Date:From;
        b=mUvBhqOKKIoFAz72UutB18EqMn1Wp2Q+Plr7GhsYQoQveTD8JIrA64o0jcf0pJDFl
         dgWOqyw7XHn9JU3dn0yQOMpe8jmOHzDqORIe+1vagRDW370eCORe1KsYE3speVZf+d
         hz9ykPqDvMASO4Y7cVill853NGO3IC9d9WYbRGcm62URPopLDEmRsjai2KbGh1UBpc
         HCRUV7WOG/5pCnYTE4Qgc1IgHy9R5L9/Whvd98SzIqZR/kPArGJdLDMVuVHStfwWHe
         pwaWxovuo4GhUqhgpZqMk5CAa7CT8FwmmmECsVZ2AC4XiOUROT3wq5bqLnU/5P4wDL
         eYHhPtHy6sqLQ==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lKNxv-0000PL-O7; Thu, 11 Mar 2021 17:15:11 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     "Michael G. Katzmann" <michaelk@IEEE.org>,
        Charles Yeh <charlesyeh522@gmail.com>,
        =?UTF-8?q?Yeh=2ECharles=20=5B=E8=91=89=E6=A6=AE=E9=91=AB=5D?= 
        <charles-yeh@prolific.com.tw>, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/5] USB: serial: pl2303: amend device-type detection
Date:   Thu, 11 Mar 2021 17:14:46 +0100
Message-Id: <20210311161451.1496-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series cleans up, amends and tightens the pl2303 device-type
detection.

There are number of different PL2303 devices out there with various
features and we need to be able to detect more types reliably. 

Specifically this will be used to add support for the alternate divisor
encoding scheme that is used by TA devices.

Johan


Johan Hovold (5):
  USB: serial: pl2303: clean up type detection
  USB: serial: pl2303: amend and tighten type detection
  USB: serial: pl2303: rename legacy PL2303H type
  USB: serial: pl2303: tighten type HXN (G) detection
  USB: serial: pl2303: add device-type names

 drivers/usb/serial/pl2303.c | 131 +++++++++++++++++++++++++++---------
 1 file changed, 98 insertions(+), 33 deletions(-)

-- 
2.26.2

