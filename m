Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59381278410
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 11:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727973AbgIYJb6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Sep 2020 05:31:58 -0400
Received: from lan.nucleusys.com ([92.247.61.126]:33320 "EHLO
        zztop.nucleusys.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727796AbgIYJb6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Sep 2020 05:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=nucleusys.com; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=33TD93fDZc/320y+vdTOji0qRuPKHKHetYpK98NT19E=; b=L9wG3coVsjtZiVgO4b/XAWw59k
        vrxBVS80y5Jo+vvXYLc+MC/LK4bIp+txf6Eg93rJxDiNgvM2JE2iP3TNpeA8wPVFfF4Zq/0oCWiZd
        SKJEPoJEVyCuydrs9ZKH+MzDLM1SOKdAVeKzvqhsLVe1f+O92kbzyMPZ5qEl+sKn3R28=;
Received: from [94.26.108.4] (helo=karbon.lan)
        by zztop.nucleusys.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <petkan@nucleusys.com>)
        id 1kLk52-0001hA-Cx; Fri, 25 Sep 2020 12:31:52 +0300
From:   Petko Manolov <petkan@nucleusys.com>
To:     oneukum@suse.com
Cc:     gregKH@linuxfoundation.org, linux-usb@vger.kernel.org,
        Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH 0/2] [usb]
Date:   Fri, 25 Sep 2020 12:31:22 +0300
Message-Id: <20200925093124.22483-1-petkan@nucleusys.com>
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
 Content preview:  From: Petko Manolov <petko.manolov@konsulko.com> Avoid open
    coding usb_control_msg_send/recv() Petko Manolov (2): Convert Pegasus' control
    messages to the new usb_control_msg_send/recv() scheme. Convert RTL8150's
    control messages to the new usb_control_msg_send/recv() scheme. 
 Content analysis details:   (-1.0 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Petko Manolov <petko.manolov@konsulko.com>

Avoid open coding usb_control_msg_send/recv()

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

