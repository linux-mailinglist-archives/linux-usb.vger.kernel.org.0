Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044B64B4114
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 06:11:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236471AbiBNFLT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 00:11:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233257AbiBNFLR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 00:11:17 -0500
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FBAD13FAF
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 21:11:07 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 16F4732001C6;
        Mon, 14 Feb 2022 00:01:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 14 Feb 2022 00:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=S06AGMtceTe1yr1ZhecTdf7w558oyy
        JUY060TelrMjc=; b=Bzr/4OK0Vs9zGcvZZDP+em98+IplwPHQuDoodZI61cv4T9
        ySG+srIj3MQWHocgOPgHhzsEyzuqfAUNhA43xuiEMK/F8ljuYwb9u4JeX0SMSTEK
        pjbM3IOsqzS/sJ7NuLebH1Z6ooG5qIkhV1lMcelazPGtfygd4vmpB000XsAD78/P
        yVyD2aaouR6wEXntj/tcXk3QVyODLDZZRHbysBguWS5oQ3ZcL8kYGHVT/FFUD1cf
        81zcYGcN2qB0lIDpoVhP73a3RHybhUK0vMi2ZLt+ncpjRtWOks6Uy1XtEbjGpV1r
        3FWXPNjSay/Ukn9t9EdsRnDxsGZgPnv0FdsHMx+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=S06AGM
        tceTe1yr1ZhecTdf7w558oyyJUY060TelrMjc=; b=QCV2Ghrz+Oa9EOfF13+ROF
        sUYEpL/Cjihcg6E7fKd4BosXcge3wJB5FN/sP4C3+gkr+pAVYYmBnOqD3+8t1ZgP
        vC94JVkxM5RgeWTuzkcRRRB/yp5961cb1dBLrxG5HSz08mdDPim3xXKG78zUxAut
        n5cWV1QUy59yke0y2JTvypNcKioTgxu8c5FUtTHez3jvFb+JF+NZmkPuxqIVV+sm
        kvEIFofUpnzU7QiBh6Y348cKJaDsBvqJ/l/MTr9i5NbaDFOGpzpc6cjjGAp+nJLP
        9sKrHibMgnqMjYTSWnIBsxnCz9xg9PepINHdPnVmJg48/DBtM7IC7r7yo3U4QVDw
        ==
X-ME-Sender: <xms:IuIJYg4FqeBGsSPGIAE4xKNo9JT58kLZpnx6U6rSOAbN-JCfBwb7xA>
    <xme:IuIJYh7XX5dZopjhDPTialY_BRiExjikHX89r7LA2YPKo5d_AsE2Sj2QW39UebnE7
    AlC10hVxJjiLjnI6w>
X-ME-Received: <xmr:IuIJYvfjG9pLg-YC4d-aWO77KYy4SCcvg_yQjEerFiSh6dThoLsdrsh_m3kQk9lPo7jI9frtsn-w1HLCMRAxXmTOR8n3_37yBsKNv_zD6PIO4wWviqw0JVeD67BWofPmOUb1Vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedugdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepheeludfghfejjeevgffhvedvtdeitdegffeltdetveehjeeggfdvgfff
    teduhfffnecuffhomhgrihhnpeifihhllhhsvghmihdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgr
    nhgurdhorhhg
X-ME-Proxy: <xmx:IuIJYlJmR4tUekWYxEoLl9NWlcvVFI6gqqkiBoPmipNiv_6TIsUGtw>
    <xmx:IuIJYkIBMB8jn0yFjEJUj4oR19xHiH4Ro5zi5xxoGe-TQzndQl1s4g>
    <xmx:IuIJYmxxUE6MR592Gxw9TGvb62040FeFifMkyf6kgEaBMuW28A9A1g>
    <xmx:IuIJYuimVPds-aeXAryY9siokAuKCyS0Ffut3LEaSq2P6fNFJ5lUzQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 00:01:22 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add willsemi
Date:   Sun, 13 Feb 2022 23:01:14 -0600
Message-Id: <20220214050118.61015-2-samuel@sholland.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220214050118.61015-1-samuel@sholland.org>
References: <20220214050118.61015-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add prefix for Will Semiconductor Co. Ltd. (http://www.willsemi.com/)

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 294093d45a23..a8ab97717a46 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1340,6 +1340,8 @@ patternProperties:
     description: Wi2Wi, Inc.
   "^wiligear,.*":
     description: Wiligear, Ltd.
+  "^willsemi,.*":
+    description: Will Semiconductor Ltd.
   "^winbond,.*":
     description: Winbond Electronics corp.
   "^wingtech,.*":
-- 
2.33.1

