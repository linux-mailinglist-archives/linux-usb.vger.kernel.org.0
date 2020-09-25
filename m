Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA80D278D7C
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 18:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgIYQCW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 12:02:22 -0400
Received: from lan.nucleusys.com ([92.247.61.126]:33450 "EHLO
        zztop.nucleusys.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727151AbgIYQCW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 12:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=nucleusys.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HKghntozPatqSbIa/0iRutbq7qGVa77/QxXE6pFe7/c=; b=MyjPr3PFKliFzdaHSujYR948/N
        qZJG2PRlLlbPstWzLHwVD/l4LVR239gDLp9YiDB/zkxHVCEFA43o4Ay5va25RSXVGiaGQokBuN72s
        TrhL+PzIwI1UbzqdEyFq8xqkpTsLL4JN9JLXstLmz7PqB73wHy9JiNp02j3OexAwiBlo=;
Received: from [94.26.108.4] (helo=carbon.lan)
        by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <petkan@nucleusys.com>)
        id 1kLqAr-00024z-GS; Fri, 25 Sep 2020 19:02:17 +0300
From:   Petko Manolov <petkan@nucleusys.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, oneukum@suse.com,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH 0/2] [patch v2] utilize the new control message send and receive API
Date:   Fri, 25 Sep 2020 19:01:58 +0300
Message-Id: <20200925160200.4364-1-petkan@nucleusys.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925143730.GA3111407@kroah.com>
References: <20200925143730.GA3111407@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
X-Spam-Report: Spam detection software, running on the system "zztop.nucleusys.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Petko Manolov <petko.manolov@konsulko.com> As discussed
    at the linux-usb this patch series is moving from old style usb_control_msg()
    to the new API. For obvious reasons we don't want to open code usb_control_msg_send()
    and usb_control_msg_rec [...] 
 Content analysis details:   (-1.0 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Petko Manolov <petko.manolov@konsulko.com>

As discussed at the linux-usb this patch series is moving from old style
usb_control_msg() to the new API.  For obvious reasons we don't want to open
code usb_control_msg_send() and usb_control_msg_recv() functions.

Petko Manolov (2):
  Convert Pegasus' control messages to the new
    usb_control_msg_send/recv() scheme.
  Convert RTL8150's control messages to the new
    usb_control_msg_send/recv() scheme.

 drivers/net/usb/pegasus.c | 56 +++++++--------------------------------
 drivers/net/usb/rtl8150.c | 32 +++++-----------------
 2 files changed, 15 insertions(+), 73 deletions(-)

-- 
2.28.0

