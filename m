Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D4B2161AB
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 00:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgGFWo0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 18:44:26 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:53205 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726491AbgGFWoZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 18:44:25 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id B5164D05;
        Mon,  6 Jul 2020 18:44:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 06 Jul 2020 18:44:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flameeyes.com;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
        bcyUPvFQSCb3V9kCc+DlPuv61aaaRr7VHAoQboOpqOY=; b=KyZm7yv/b5zSn1Or
        bwYgHmXLeFVB4OccMHdJYsxmFBQkXefZRkG1ajMxXQ/7/DF/tdgDp9PKBLIcf7oZ
        33jC0Fxszg0Dsfw5j5QsQfB1IfgZKRbXpCg+PYs1F+IikLmMaIntNa7XcKjdbea8
        2keaWAZpnCHwhAU/N3jy1/2zF+5aZRUszdDN7sfTMsqH7SRFJ/muQflbS8mFZgKW
        V+RvrheZBksbjqujR/2XVNpPAsORbDEBDVjTFLM6Vp9d3rmCoVi6DQOyporn40Rl
        RieufTLRb9ir4Fl3xWy43XrKJDCSmmxwy5rfPAzYzMSCMY+nFc/kQ80LwuajZqGC
        ON4L2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=bcyUPvFQSCb3V9kCc+DlPuv61aaaRr7VHAoQboOpq
        OY=; b=kJr62MBGQhQSMI9K/ApRaRUKHGOOsR1QLZxYqJVDcpe1FN4ofwFb05YdO
        5rwvLnaa++5f+aqD+p277Ur+TeVq96uwB8xuY74FiJYOdQ/4JsFXQOvBYicGE0S/
        RhTB5bYogblDl+oL13WE7x9YWe5yh+iTlmBvmJU2g0QjmY5bZLyvmDUvk28cCB+/
        gKbWF8uU+/Ez+JB59cOXItpQqTTEDCb/Inl3eHh3fPU7e6uG4YrWZyrqhYFSFs9O
        MerXlHTWXQha/+kAq/8pRmBuqRh9aZVEA3chJZCKkyo4S4H0I1OmnFt3vhf79kUz
        Evli3sEOyO8GzQbz2ycwUmVHAfdhw==
X-ME-Sender: <xms:R6kDX1JIfDXRNrRLu-NCLDiZWH0k_sLf0e4mqw9dY2obkO9tTR_oxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeggddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfgggtgfesthekre
    dtredtjeenucfhrhhomhepffhivghgohcugfhlihhoucfrvghtthgvnhpjuceofhhlrghm
    vggvhigvshesfhhlrghmvggvhigvshdrtghomheqnecuggftrfgrthhtvghrnhepleejgf
    dtueefhfeitefgueevvddtvdeifeeghedvgfdvleelkeelkeevvefhudeunecukfhppeek
    kedrleekrddvfeekrddufedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepfhhlrghmvggvhigvshesfhhlrghmvggvhigvshdrtghomh
X-ME-Proxy: <xmx:R6kDXxKTcn5Wn79zdoQbjujFVW3wIdw9fpFnqQxWKPzY_A_uiq2B3Q>
    <xmx:R6kDX9si4-7oze-4cfD-n0NQ76ac28HDUCj3jlwXrO58i4leadXr-g>
    <xmx:R6kDX2YFzhhxV02vZdQNSeK_2sc2Y6AFAWGpedt9P8nBrGrb-GPifg>
    <xmx:SKkDX1mrGgRFC38hicQ8kn3gUqUFM_Ow1YYMjeaIUql3IsAHYk7XWA>
Received: from localhost.localdomain (unknown [88.98.238.130])
        by mail.messagingengine.com (Postfix) with ESMTPA id 932B13280066;
        Mon,  6 Jul 2020 18:44:23 -0400 (EDT)
From:   =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.com>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.com>
Subject: [PATCH v4 1/2] Remove documentation line that adds nothing and sounds condescending.
Date:   Mon,  6 Jul 2020 23:44:14 +0100
Message-Id: <20200706224415.2854-1-flameeyes@flameeyes.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705150225.21500-1-flameeyes@flameeyes.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

"Easy" is a subjective term, and while not adding more context, it can push
away some of the readers.

Signed-off-by: Diego Elio Pettenò <flameeyes@flameeyes.com>
---
 Documentation/usb/usbmon.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/usb/usbmon.rst b/Documentation/usb/usbmon.rst
index b0bd51080799..e9ec7e40b3bf 100644
--- a/Documentation/usb/usbmon.rst
+++ b/Documentation/usb/usbmon.rst
@@ -346,8 +346,6 @@ be polled with select(2) and poll(2). But lseek(2) does not work.
 
 * Memory-mapped access of the kernel buffer for the binary API
 
-The basic idea is simple:
-
 To prepare, map the buffer by getting the current size, then using mmap(2).
 Then, execute a loop similar to the one written in pseudo-code below::
 
-- 
2.27.0

