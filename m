Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0AE033733E
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 14:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233132AbhCKNA1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 08:00:27 -0500
Received: from mx2.suse.de ([195.135.220.15]:58820 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233077AbhCKNAS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Mar 2021 08:00:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1615467617; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=PMMrjvwhnpQDRhmroOhGatN0hPvVkrlU8o+vZK0pO7w=;
        b=oGvzYdHx3Jo1UnkxW6OXTXcDoYUOu+R4dyUIHGIvE0rQjlrGCNny0wGgxkvbMhQrqTKD+F
        PtXh60EDv9Wy1Dk49tNr0Ef+kat5CBeeFaJDwK3JtTSOdPZPtPqyyjxytb9ovOM4yQF9li
        cbtrHO+x4mL62B6SYnHxlLD+r1prsKE=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C067EAC16;
        Thu, 11 Mar 2021 13:00:17 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     bruno.thomsen@gmail.com, gregKHusb@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: [PATCH 0/2] CDC-ACM: fix circular dependency
Date:   Thu, 11 Mar 2021 13:59:58 +0100
Message-Id: <20210311130000.15652-1-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver has an issue with an interaction between queued works
and interrupt handlers that needs to be solved.


