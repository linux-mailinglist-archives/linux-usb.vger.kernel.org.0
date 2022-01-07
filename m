Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE42D48780E
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jan 2022 14:15:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238784AbiAGNPi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jan 2022 08:15:38 -0500
Received: from cable.insite.cz ([84.242.75.189]:43679 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237898AbiAGNPg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jan 2022 08:15:36 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 0E781A1A3D405;
        Fri,  7 Jan 2022 14:15:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641561334; bh=pgAIajoBUbMPehOv9bS7HaXM/m5+TY4PNjYR7VDUUsA=;
        h=From:To:Cc:Subject:Date:From;
        b=b7RZZtGdoXx+tAmedjCMysqXV81Y0AyH4NjmgEilnvcR6YEZ2JtKnzuWgDyTMmcgI
         XeAKCDbF6TUlVgjUNvJZFo7j9c/IXk30ex13C/vqT3TZ+RDY3bOI3/DIub6jQl0ERg
         AKPPaXpytsOnrYrQGk8DebyggOg3fQRINdwH/ApM=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hNx2YkQgaUba; Fri,  7 Jan 2022 14:15:28 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 5B68BA1A3D401;
        Fri,  7 Jan 2022 14:15:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641561328; bh=pgAIajoBUbMPehOv9bS7HaXM/m5+TY4PNjYR7VDUUsA=;
        h=From:To:Cc:Subject:Date:From;
        b=nkAdeVPX+uz/Tjd3dey1vizJkcxICuHHqimVOVD0jUWUMIcHY9Jo2Bq7x07uUW1Bn
         wwu8dyw89Q8O+vRehuAp8vQEEIWMen1DA5mtjRnWHi6WGxbS5EVqaNjzVwJJICf63u
         JU2CZFia8esyMTkOfiHVhj8hV1cO7LZf5+uv05YU=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] docs: ABI: fixed formatting in configfs-usb-gadget-uac2
Date:   Fri,  7 Jan 2022 14:15:27 +0100
Message-Id: <20220107131527.376364-1-pavel.hofman@ivitera.com>
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

