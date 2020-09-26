Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0200527981F
	for <lists+linux-usb@lfdr.de>; Sat, 26 Sep 2020 11:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgIZJNh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 26 Sep 2020 05:13:37 -0400
Received: from lan.nucleusys.com ([92.247.61.126]:33712 "EHLO
        zztop.nucleusys.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725208AbgIZJNh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 26 Sep 2020 05:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=nucleusys.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=go/GaGWLYygNLiBbE4FTR7jxg7MC9xdFSKqfaaL676Q=; b=a0IXdxf/9FUHhoNPStg4Dz5c52
        rUun8GE0sCONEj3aheVaXDodCkU3S1wXpzQRskaHfuBlwFODBIZ0VHvIoDZN6PzpMaxYLfZC2Veou
        ehNpm23vZTQ21fbaH4RU79rKgt7Ceevgoht6UR/4WbXtqKgyNCqWwaPhPggIO2ItGvfU=;
Received: from [94.26.108.4] (helo=karbon.lan)
        by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <petkan@nucleusys.com>)
        id 1kM6Gr-0003As-Vh; Sat, 26 Sep 2020 12:13:34 +0300
From:   Petko Manolov <petkan@nucleusys.com>
To:     oneukum@suse.com
Cc:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 0/2] Use the new usb control message API.
Date:   Sat, 26 Sep 2020 12:13:25 +0300
Message-Id: <20200926091327.8021-1-petkan@nucleusys.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923134348.23862-9-oneukum@suse.com>
References: <20200923134348.23862-9-oneukum@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software, running on the system "zztop.nucleusys.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Petko Manolov <petko.manolov@konsulko.com> Open coding,
    ccasional improper error handling by the caller of usb_control_msg() and
   not flagging partial read as an error requires a new API that takes care of
    these issues. It took the form of usb_ [...] 
 Content analysis details:   (-1.0 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Petko Manolov <petko.manolov@konsulko.com>

Open coding, ccasional improper error handling by the caller of
usb_control_msg() and not flagging partial read as an error requires a new API
that takes care of these issues.  It took the form of
usb_control_msg_send/recv() and this patch series is converting Pegasus and
RTL8150 drivers to using the proper calls.

Petko Manolov (2):
  net: pegasus: Use the new usb control message API.
  net: rtl8150: Use the new usb control message API.

 drivers/net/usb/pegasus.c | 61 ++++++++++-----------------------------
 drivers/net/usb/rtl8150.c | 32 ++++----------------
 2 files changed, 21 insertions(+), 72 deletions(-)

-- 
2.28.0
