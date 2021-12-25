Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F1547F34A
	for <lists+linux-usb@lfdr.de>; Sat, 25 Dec 2021 14:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbhLYNJi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Dec 2021 08:09:38 -0500
Received: from cable.insite.cz ([84.242.75.189]:43118 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231734AbhLYNJi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 25 Dec 2021 08:09:38 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id A1E4DA1A3D402;
        Sat, 25 Dec 2021 14:09:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640437776; bh=75deMJhF5jyYvnWCSggNWGMob00mt4YQBvAE4jxI0yM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J0vtdZBKQwoiCfKr9jnuMbW7ZXaVCGPXR5w4TXU+5DRjCstXH69w+Eipw4d+GLt1m
         i6lwpXNIm4G7508CTrhKksGDshnq80hE5IivrhrPn5YmyB3zDOGkrge7EFFlekoP65
         KQ8p4ik44mLR9YxYnKcSaid5wLuITZHFkl1rbIOk=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2qw0Qq35B-J7; Sat, 25 Dec 2021 14:09:31 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id EBC25A1A3D401;
        Sat, 25 Dec 2021 14:09:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640437771; bh=75deMJhF5jyYvnWCSggNWGMob00mt4YQBvAE4jxI0yM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FMsFitZENunZYZqKxcuWqSSZ1eFIA5i1wj5TtABIM927NL6VlOcAxSeTSuTY3m9M9
         wZrpqgBl0ZDxPV5oABAITjsapy2JmV3xC5YoAgfhO3Fdo5/bGMibq76yw1jeePoC2S
         hHp0FFHZLDF4hHR+YBjSJ90nBDiF13gcpQl/Sqes=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/2] docs: ABI: fixed req_number desc in UAC1
Date:   Sat, 25 Dec 2021 14:09:29 +0100
Message-Id: <20211225130929.205629-2-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211225130929.205629-1-pavel.hofman@ivitera.com>
References: <20211225130929.205629-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixed wording of the req_number description in UAC1 docs.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 Documentation/ABI/testing/configfs-usb-gadget-uac1 | 2 +-
 Documentation/usb/gadget-testing.rst               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac1 b/Documentation/ABI/testing/configfs-usb-gadget-uac1
index b576b3d6ea6d..d4b8cf40a9e4 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-uac1
+++ b/Documentation/ABI/testing/configfs-usb-gadget-uac1
@@ -27,6 +27,6 @@ Description:
 					(in 1/256 dB)
 		p_volume_res		playback volume control resolution
 					(in 1/256 dB)
-		req_number		the number of pre-allocated request
+		req_number		the number of pre-allocated requests
 					for both capture and playback
 		=====================	=======================================
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index c18113077889..cbbd948c626f 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -931,7 +931,7 @@ The uac1 function provides these attributes in its function directory:
 	p_volume_min     playback volume control min value (in 1/256 dB)
 	p_volume_max     playback volume control max value (in 1/256 dB)
 	p_volume_res     playback volume control resolution (in 1/256 dB)
-	req_number       the number of pre-allocated request for both capture
+	req_number       the number of pre-allocated requests for both capture
 	                 and playback
 	================ ====================================================
 
-- 
2.25.1

