Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647E747F34B
	for <lists+linux-usb@lfdr.de>; Sat, 25 Dec 2021 14:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhLYNJj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Dec 2021 08:09:39 -0500
Received: from cable.insite.cz ([84.242.75.189]:54661 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231743AbhLYNJi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 25 Dec 2021 08:09:38 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 04FFEA1A3D403;
        Sat, 25 Dec 2021 14:09:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640437776; bh=UM+aI3WG2Lq9cEtfGGCX2kpzhUcS85UPgVbKukNvb74=;
        h=From:To:Cc:Subject:Date:From;
        b=Q2y2NHirT2u2R/NwPDVk2osOrTWG/pgC+OdswbFlcrrChzzszIww8MKWDwbpEyFQr
         aG3VlPF+cPww49D7MFVRLfIMFhI3NdsVjyJnVxam2IxV+l4dkn9KzXoGvfrZN3Oeoi
         q7MAkMSiVhbKZfGiTxNntdNkEVR8r0DF8X9Ftn28=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id CqfUZdzNAK54; Sat, 25 Dec 2021 14:09:30 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id A3161A1A3D400;
        Sat, 25 Dec 2021 14:09:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640437770; bh=UM+aI3WG2Lq9cEtfGGCX2kpzhUcS85UPgVbKukNvb74=;
        h=From:To:Cc:Subject:Date:From;
        b=hf8YYCKZ5Xqv149Ovv9Qhu+ELpt+twhnahweJl/PbNRLvyI88B3mLfMiPhDvZ9C21
         +kjHyNrjxKCgGFHrHy/8lmHQAX/6mQH4WsnFWyvNbP5ZpFBSV+JdJDVQsFZ7y97rXh
         BXMn2dwgj9YXAN6FEjwQ3yfBYUlmuHPuOTiwAR6Q=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/2] docs: ABI: added missing num_requests param to UAC2
Date:   Sat, 25 Dec 2021 14:09:28 +0100
Message-Id: <20211225130929.205629-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The existing configfs-usb-gadget-uac2 ABI doc for testing was missing
the num_requests param. The patch adds the parameter to the document.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 Documentation/ABI/testing/configfs-usb-gadget-uac2 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documentation/ABI/testing/configfs-usb-gadget-uac2
index 244d96650123..9cddadc53e0b 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
@@ -30,4 +30,6 @@ Description:
 					(in 1/256 dB)
 		p_volume_res		playback volume control resolution
 					(in 1/256 dB)
+		req_number	the number of pre-allocated requests for both capture
+					and playback
 		=====================	=======================================
-- 
2.25.1

