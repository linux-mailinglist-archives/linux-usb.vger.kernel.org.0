Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0F34A66D9
	for <lists+linux-usb@lfdr.de>; Tue,  1 Feb 2022 22:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237201AbiBAVKP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Feb 2022 16:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241177AbiBAVKO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Feb 2022 16:10:14 -0500
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:12e:520::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEFA0C061714;
        Tue,  1 Feb 2022 13:10:13 -0800 (PST)
Received: from localhost ([127.0.0.1] helo=flow.W.breakpoint.cc)
        by Chamillionaire.breakpoint.cc with esmtp (Exim 4.92)
        (envelope-from <sebastian@breakpoint.cc>)
        id 1nF0Pc-0006wn-06; Tue, 01 Feb 2022 22:10:04 +0100
From:   Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To:     linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
Cc:     "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/2] Add scsi_done_direct() to complete request directly.
Date:   Tue,  1 Feb 2022 22:09:52 +0100
Message-Id: <20220201210954.570896-1-sebastian@breakpoint.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Breakpoint-Spam-Score: -1.0
X-Breakpoint-Spam-Level: -
X-Breakpoint-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This mini series adds scsi_done_direct() in order to complete scsi
requests directly via blk_mq_complete_request_direct(). This used by the
usb-storage driver.

Sebastian


