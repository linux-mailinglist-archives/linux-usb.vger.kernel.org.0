Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68D81159D18
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 00:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbgBKXUb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 18:20:31 -0500
Received: from gateway30.websitewelcome.com ([192.185.198.26]:44310 "EHLO
        gateway30.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727795AbgBKXUb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Feb 2020 18:20:31 -0500
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id 5F6A660B6
        for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2020 17:20:30 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 1epSjA5hhEfyq1epSjK2Ro; Tue, 11 Feb 2020 17:20:30 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZeEly4URcPzI9V6orzk6NjOSoTiGretqTjD58lLekkE=; b=eQCMYuZHqbsCvYuKUdAzhiRThO
        F5cD2QfOAU6oUbZiMgeL9o9NWf7LLp8QkEWcQxmVztE+b8OyabyfUglGuUBTIn3Srj1Xi0oCPaf5e
        AKWs6fJWzYy8xzP58ncH2FBLq5swhPrMAim1V37yi8/ItkPRynJEfTF0kGdYm060kjUKIedmYjKjX
        PoqfFLrqQfXNKvt53nsKBnOokyOzBdLtt3SbonN7TdtdD9UYjlGzu8SDuAkvVrmsMIs9CwsDi2T2G
        tV/vIdzxRtu/3rd+LKM47+03q7tukF+CA5pKhGblaXcgCEjnSoPMo2eQF5OxzbekWiCfVf09f/Qt0
        m+39ZRXg==;
Received: from [200.68.140.36] (port=5119 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j1epQ-003ZeJ-Ra; Tue, 11 Feb 2020 17:20:28 -0600
Date:   Tue, 11 Feb 2020 17:23:03 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] usb: gadget: f_phonet: Replace zero-length array with
 flexible-array member
Message-ID: <20200211232303.GA21495@embeddedor>
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
X-Source-IP: 200.68.140.36
X-Source-L: No
X-Exim-ID: 1j1epQ-003ZeJ-Ra
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.36]:5119
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 39
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertenly introduced[3] to the codebase from now on.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/usb/gadget/function/f_phonet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
index 8b72b192c747..d7f6cc51b7ec 100644
--- a/drivers/usb/gadget/function/f_phonet.c
+++ b/drivers/usb/gadget/function/f_phonet.c
@@ -48,7 +48,7 @@ struct f_phonet {
 	struct usb_ep			*in_ep, *out_ep;
 
 	struct usb_request		*in_req;
-	struct usb_request		*out_reqv[0];
+	struct usb_request		*out_reqv[];
 };
 
 static int phonet_rxq_size = 17;
-- 
2.25.0

