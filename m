Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AACC487694
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 12:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347144AbiAGLdK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jan 2022 06:33:10 -0500
Received: from cable.insite.cz ([84.242.75.189]:51458 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232117AbiAGLdK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jan 2022 06:33:10 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 03724A1A3D405;
        Fri,  7 Jan 2022 12:33:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641555189; bh=HwrhCsElm3wLpsn3F8Rgl7H0LDwMzjMJqErye0JVi/4=;
        h=From:To:Cc:Subject:Date:From;
        b=ijzlTSv02bnKKGJbhBgtHCq1n6qACMWvwoKGP4pfbx7ZIKAMxHWrwUj6HezQlXPDX
         8gALooscY7c08IrArciljQVF1zmxovln0MEVA3D0eScLKzU3yoSeY+Wy2UpjWUFT3d
         uJplO9PSHipyA3j8nAN5aa5MW2BxRE1sXbTlrIJo=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KoXHUfZ4E6xv; Fri,  7 Jan 2022 12:33:02 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id B6754A1A3D401;
        Fri,  7 Jan 2022 12:33:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641555182; bh=HwrhCsElm3wLpsn3F8Rgl7H0LDwMzjMJqErye0JVi/4=;
        h=From:To:Cc:Subject:Date:From;
        b=PWpanIreLvzJGMYVNJxt9GmfQGN/ZQR+OuF0QyMDB0IuVeJT040cE/Xy9hrH01H0q
         MyL1fu5Ot0j/Zvo4+ZtZNSdFpjZwBfSYzG1Atw3QP8U1xiTFQvl6ufiwoCutpiKyBW
         EhHfJKuYGgdeUvoMWSH8nFgrjKt03MB8Y9y2vazI=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] docs: ABI: fixed formatting in configfs-usb-gadget-uac2
Date:   Fri,  7 Jan 2022 12:33:01 +0100
Message-Id: <20220107113301.277820-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Added missing tab, line breaks.

Fixes: e3088ebc1b97 ("docs: ABI: added missing num_requests param to UAC2")
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
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

