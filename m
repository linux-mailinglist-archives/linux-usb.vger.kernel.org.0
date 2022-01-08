Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9803A488319
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jan 2022 11:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232761AbiAHK4W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jan 2022 05:56:22 -0500
Received: from cable.insite.cz ([84.242.75.189]:43100 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229973AbiAHK4W (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 8 Jan 2022 05:56:22 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 9E38AA1A3D402;
        Sat,  8 Jan 2022 11:56:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641639376; bh=DY0Bj2uUnurAzjIHpB1u4Z1/p0YyjR+s4qZG9z2WfJo=;
        h=From:To:Cc:Subject:Date:From;
        b=J5sW56VsagQ/gFSUr0R8a4qim/iTRPsPcUDWqs/5kRgRbf0sBwT88UfsmSGP7bCkg
         raONXxbPDdfM0ukMvh8WD2LfP1AliXAuDAMcG17mQ70BdopFXxUfU+9hUCu051lO0q
         d1lVSGrGfg2JG/rMx1D+HHK4r9Dna/Z7iklDq+z4=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vtrBRPD8ULoh; Sat,  8 Jan 2022 11:56:09 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 8E8F5A1A3D400;
        Sat,  8 Jan 2022 11:56:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641639369; bh=DY0Bj2uUnurAzjIHpB1u4Z1/p0YyjR+s4qZG9z2WfJo=;
        h=From:To:Cc:Subject:Date:From;
        b=f/RQTUE2eoIWKNC9GOUTwdiI62mgErEQ0HD59I5FrRQW/Pdz1SHSLl03VDqdMPgvP
         b8vxbjk7VkRmneeWNl8G8SePDOnawAGOZNJ+5viabtpVQUeEOTlrAJRKbplSMxi8CC
         eb9/8rct+GAiy6vYPmN/dqhzaI0/IMn26wNqfpTc=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3] docs: ABI: fixed formatting in configfs-usb-gadget-uac2
Date:   Sat,  8 Jan 2022 11:56:08 +0100
Message-Id: <20220108105608.10726-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Added missing tab, line breaks.

Fixes: e3088ebc1b97 ("docs: ABI: added missing num_requests param to UAC2")
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---

Notes:
    v2: added Reported-by
    v3: included patch notes

 Documentation/ABI/testing/configfs-usb-gadget-uac2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index 9cddadc53e0b..7fb3dbe26857 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -30,6 +30,6 @@ Description:
 					(in 1/256 dB)
 		p_volume_res		playback volume control resolution
 					(in 1/256 dB)
-		req_number	the number of pre-allocated requests for both capture
-					and playback
+		req_number		the number of pre-allocated requests
+					for both capture and playback
 		=====================	=======================================
-- 
2.25.1

