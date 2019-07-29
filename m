Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEE30782E4
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jul 2019 02:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbfG2AuJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 28 Jul 2019 20:50:09 -0400
Received: from gateway32.websitewelcome.com ([192.185.145.113]:47245 "EHLO
        gateway32.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726238AbfG2AuJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 28 Jul 2019 20:50:09 -0400
X-Greylist: delayed 2615 seconds by postgrey-1.27 at vger.kernel.org; Sun, 28 Jul 2019 20:50:08 EDT
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway32.websitewelcome.com (Postfix) with ESMTP id 7B1228AC997
        for <linux-usb@vger.kernel.org>; Sun, 28 Jul 2019 19:06:33 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id rtBRhioqf90onrtBRhaYmd; Sun, 28 Jul 2019 19:06:33 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QkjKvpubCqC9ZQhSC933F0e4W2yO6Nx357J3l7vriHU=; b=TqpU6DfBuif22wWrSzC8X/0qqJ
        ZPuwot/n0fdBuaqk5eTTW8BYNTRwI6NKzVzY5Yd80GV/svEbnqd/3dRFWiPGE5pZd8WEini7LUje8
        7xBJn3LTQObVtXGwSdpQNqhj8srxsXqdcJpqCZ5A+rgsmgiLs2wQXRSgQLAr+plsaR8VoJtXO3jWZ
        agxetzyXVb0H+PmLhrgZcItvYsaOOInfYL9NOgA82eMAt4gkgVFycIKAP6g1kG7sbpyByuMuQpIc6
        LtDN5pWii6+279CBjB11s1oH/tqXAW4bR3yOKanxy5JaftSIwum4a5QwKyGP3wgCidQtBx0r/W3Tw
        J5w7oXzg==;
Received: from [187.192.11.120] (port=39678 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hrtBP-003qoQ-Mr; Sun, 28 Jul 2019 19:06:31 -0500
Date:   Sun, 28 Jul 2019 19:06:31 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Kees Cook <keescook@chromium.org>
Subject: [PATCH] usb: phy: ab8500-usb: Mark expected switch fall-throughs
Message-ID: <20190729000631.GA24165@embeddedor>
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
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hrtBP-003qoQ-Mr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:39678
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 20
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warnings:

drivers/usb/phy/phy-ab8500-usb.c: In function 'ab8500_usb_link_status_update':
drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
   event = UX500_MUSB_RIDB;
   ~~~~~~^~~~~~~~~~~~~~~~~
drivers/usb/phy/phy-ab8500-usb.c:425:2: note: here
  case USB_LINK_NOT_CONFIGURED_8500:
  ^~~~
drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
   event = UX500_MUSB_RIDC;
   ~~~~~~^~~~~~~~~~~~~~~~~
drivers/usb/phy/phy-ab8500-usb.c:441:2: note: here
  case USB_LINK_STD_HOST_NC_8500:
  ^~~~
drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
   event = UX500_MUSB_RIDA;
   ~~~~~~^~~~~~~~~~~~~~~~~
drivers/usb/phy/phy-ab8500-usb.c:460:2: note: here
  case USB_LINK_HM_IDGND_8500:
  ^~~~
drivers/usb/phy/phy-ab8500-usb.c: In function 'ab8505_usb_link_status_update':
drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
   event = UX500_MUSB_RIDB;
   ~~~~~~^~~~~~~~~~~~~~~~~
drivers/usb/phy/phy-ab8500-usb.c:333:2: note: here
  case USB_LINK_NOT_CONFIGURED_8505:
  ^~~~
drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
   event = UX500_MUSB_RIDC;
   ~~~~~~^~~~~~~~~~~~~~~~~
drivers/usb/phy/phy-ab8500-usb.c:353:2: note: here
  case USB_LINK_STD_HOST_NC_8505:
  ^~~~
drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
   event = UX500_MUSB_RIDA;
   ~~~~~~^~~~~~~~~~~~~~~~~
drivers/usb/phy/phy-ab8500-usb.c:371:2: note: here
  case USB_LINK_HM_IDGND_8505:
  ^~~~

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/usb/phy/phy-ab8500-usb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/phy/phy-ab8500-usb.c b/drivers/usb/phy/phy-ab8500-usb.c
index aaf363f19714..14b432982fd3 100644
--- a/drivers/usb/phy/phy-ab8500-usb.c
+++ b/drivers/usb/phy/phy-ab8500-usb.c
@@ -330,6 +330,7 @@ static int ab8505_usb_link_status_update(struct ab8500_usb *ab,
 	switch (lsts) {
 	case USB_LINK_ACA_RID_B_8505:
 		event = UX500_MUSB_RIDB;
+		/* Fall through */
 	case USB_LINK_NOT_CONFIGURED_8505:
 	case USB_LINK_RESERVED0_8505:
 	case USB_LINK_RESERVED1_8505:
@@ -350,6 +351,7 @@ static int ab8505_usb_link_status_update(struct ab8500_usb *ab,
 
 	case USB_LINK_ACA_RID_C_NM_8505:
 		event = UX500_MUSB_RIDC;
+		/* Fall through */
 	case USB_LINK_STD_HOST_NC_8505:
 	case USB_LINK_STD_HOST_C_NS_8505:
 	case USB_LINK_STD_HOST_C_S_8505:
@@ -368,6 +370,7 @@ static int ab8505_usb_link_status_update(struct ab8500_usb *ab,
 	case USB_LINK_ACA_RID_A_8505:
 	case USB_LINK_ACA_DOCK_CHGR_8505:
 		event = UX500_MUSB_RIDA;
+		/* Fall through */
 	case USB_LINK_HM_IDGND_8505:
 		if (ab->mode == USB_IDLE) {
 			ab->mode = USB_HOST;
@@ -422,6 +425,7 @@ static int ab8500_usb_link_status_update(struct ab8500_usb *ab,
 	switch (lsts) {
 	case USB_LINK_ACA_RID_B_8500:
 		event = UX500_MUSB_RIDB;
+		/* Fall through */
 	case USB_LINK_NOT_CONFIGURED_8500:
 	case USB_LINK_NOT_VALID_LINK_8500:
 		ab->mode = USB_IDLE;
@@ -438,6 +442,7 @@ static int ab8500_usb_link_status_update(struct ab8500_usb *ab,
 	case USB_LINK_ACA_RID_C_HS_8500:
 	case USB_LINK_ACA_RID_C_HS_CHIRP_8500:
 		event = UX500_MUSB_RIDC;
+		/* Fall through */
 	case USB_LINK_STD_HOST_NC_8500:
 	case USB_LINK_STD_HOST_C_NS_8500:
 	case USB_LINK_STD_HOST_C_S_8500:
@@ -457,6 +462,7 @@ static int ab8500_usb_link_status_update(struct ab8500_usb *ab,
 
 	case USB_LINK_ACA_RID_A_8500:
 		event = UX500_MUSB_RIDA;
+		/* Fall through */
 	case USB_LINK_HM_IDGND_8500:
 		if (ab->mode == USB_IDLE) {
 			ab->mode = USB_HOST;
-- 
2.22.0

