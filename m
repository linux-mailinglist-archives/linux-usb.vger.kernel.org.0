Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFCCA13FC67
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jan 2020 23:49:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387529AbgAPWtl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jan 2020 17:49:41 -0500
Received: from gateway33.websitewelcome.com ([192.185.146.87]:18058 "EHLO
        gateway33.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729261AbgAPWtk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jan 2020 17:49:40 -0500
X-Greylist: delayed 1500 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Jan 2020 17:49:39 EST
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway33.websitewelcome.com (Postfix) with ESMTP id 9D5E121D7EF6
        for <linux-usb@vger.kernel.org>; Thu, 16 Jan 2020 16:03:29 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id sDEfiqzuo32AdsDEfi1eh9; Thu, 16 Jan 2020 16:03:29 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lJqbOVGeD356I6fIe5iirDZBONX68UGjE9KZh7u5oGg=; b=aWzpkYr+XHoNFKlaSNzO+UXLZZ
        fuXnIZFQyXXrqcldKm/2ji1V6SAct69fFyXrBXeg7DVIefdRIQICEGlgT808cM5xUVN9B9jBvmfrP
        PVpJxi5Q7VK/lJ9YvgzhA8U3n/K/J3wgIpFHTSo/GDamYhIFLe+2qz5OJIgoauc2/IskXvvyxsN6H
        N4B9Ulm2locWbjIebP7r4PEqfdXrlRhdE8CpnJhIt9CihJjJY0mVxRXL9LUlKq2z6Y2P1O3j4SDPf
        8ZLE35/7SbDuXJ9c4EYXbvOL3FlwQlFHyNmN4D9vqWgIvXfKiGnEIzTI3k/EIfvZFxFf4A3zp+lwe
        +AXwiraA==;
Received: from 187-162-252-62.static.axtel.net ([187.162.252.62]:44004 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1isDEe-000egY-Bn; Thu, 16 Jan 2020 16:03:28 -0600
Date:   Thu, 16 Jan 2020 16:03:27 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] USB: serial: garmin_gps: Use flexible-array member
Message-ID: <20200116220327.GA12537@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.252.62
X-Source-L: No
X-Exim-ID: 1isDEe-000egY-Bn
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-252-62.static.axtel.net (embeddedor) [187.162.252.62]:44004
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Old code in the kernel uses 1-byte and 0-byte arrays to indicate the
presence of a "variable length array":

struct something {
    int length;
    u8 data[1];
};

struct something *instance;

instance = kmalloc(sizeof(*instance) + size, GFP_KERNEL);
instance->length = size;
memcpy(instance->data, source, size);

There is also 0-byte arrays. Both cases pose confusion for things like
sizeof(), CONFIG_FORTIFY_SOURCE, etc.[1] Instead, the preferred mechanism
to declare variable-length types such as the one above is a flexible array
member[2] which need to be the last member of a structure and empty-sized:

struct something {
        int stuff;
        u8 data[];
};

Also, by making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
unadvertenly introduced[3] to the codebase from now on.

[1] https://github.com/KSPP/linux/issues/21
[2] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/usb/serial/garmin_gps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index 633550ec3025..ffd984142171 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -104,7 +104,7 @@ struct garmin_packet {
 	int               seq;
 	/* the real size of the data array, always > 0 */
 	int               size;
-	__u8              data[1];
+	__u8              data[];
 };
 
 /* structure used to keep the current state of the driver */
-- 
2.23.0

